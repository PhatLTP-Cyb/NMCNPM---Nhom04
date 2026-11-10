// May chu HTTP (khong dung framework). Chay: npm start -> http://localhost:3000
const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');
const { moKetNoi } = require('./db');
const { seed } = require('./seed');
const nv = require('./nghiep-vu');
const { version } = require('./package.json');

const PORT = Number(process.env.PORT) || 3000;
const PUBLIC = path.join(__dirname, 'public');
const db = moKetNoi();

// Lan chay dau: chua co du lieu thi tao du lieu mau.
const coBang = db.prepare("SELECT name FROM sqlite_master WHERE type = 'table' AND name = 'tham_so'").get();
if (!coBang) seed(db);

const MIME = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8' };

function guiJson(res, code, data) {
  res.writeHead(code, { 'Content-Type': 'application/json; charset=utf-8', 'Cache-Control': 'no-store' });
  res.end(JSON.stringify(data));
}

function docBody(req) {
  return new Promise((resolve, reject) => {
    let s = '';
    req.on('data', (c) => { s += c; if (s.length > 1e5) req.destroy(); });
    req.on('end', () => { try { resolve(s ? JSON.parse(s) : {}); } catch { reject(new nv.LoiNghiepVu('JSON', 'Dữ liệu gửi lên không hợp lệ')); } });
    req.on('error', reject);
  });
}

function thongKe() {
  const dem = (sql) => db.prepare(sql).get().n;
  return {
    benhNhan: dem('SELECT COUNT(*) n FROM benh_nhan'),
    lichHen: dem('SELECT COUNT(*) n FROM lich_hen'),
    lichDaXacNhan: dem("SELECT COUNT(*) n FROM lich_hen WHERE trang_thai_lich = 'Đã xác nhận'"),
    lichBenhNhanHuy: dem("SELECT COUNT(*) n FROM lich_hen WHERE trang_thai_lich = 'Bệnh nhân hủy'"),
    thongBao: dem('SELECT COUNT(*) n FROM thong_bao'),
  };
}

const API = {
  'GET /api/info': () => ({ version, dongHo: nv.docDongHo(db), otpGiaLap: nv.OTP_GIA_LAP }),

  'GET /api/danh-muc': () => ({
    chuyenKhoa: db.prepare('SELECT * FROM chuyen_khoa ORDER BY ma_chuyen_khoa').all(),
    bacSi: db.prepare(`SELECT b.*, c.ten AS chuyen_khoa FROM bac_si b JOIN chuyen_khoa c USING (ma_chuyen_khoa) ORDER BY ma_bac_si`).all(),
  }),

  'GET /api/khung-gio': (q) => nv.danhSachKhung(db, q.get('bacSi'), q.get('ngay')),

  'POST /api/otp': (_, b) => {                       // BR-05: chi kiem tra dinh dang SDT roi "gui" OTP gia lap
    if (!/^0\d{9}$/.test(String(b.sdt || ''))) throw new nv.LoiNghiepVu('SDT', nv.MSG.SDT);
    return { daGui: true, otpGiaLap: nv.OTP_GIA_LAP };
  },

  'POST /api/xac-thuc': (_, b) => {
    nv.kiemTraXacThuc(b.sdt, b.otp);
    const bn = nv.timBenhNhan(db, b.sdt);
    return { benhNhan: bn && { ho_ten: bn.ho_ten, ngay_sinh: bn.ngay_sinh, gioi_tinh: bn.gioi_tinh } };
  },

  'POST /api/dat-lich': (_, b) => ({ lich: nv.datLich(db, b) }),
  'POST /api/lich-cua-toi': (_, b) => nv.lichCuaToi(db, b.sdt, b.otp),
  'POST /api/huy-lich': (_, b) => ({ lich: nv.huyLich(db, b) }),

  'GET /api/lich-bac-si': (q) => {                   // FR-09: chi lich "Da xac nhan"
    const k = nv.danhSachKhung(db, q.get('bacSi'), q.get('ngay'));
    const lich = db.prepare(`${nv.SQL_LICH} WHERE k.ma_bac_si = ? AND k.ngay_kham = ? AND l.trang_thai_lich = 'Đã xác nhận'
                             ORDER BY k.gio_bat_dau`).all(q.get('bacSi'), q.get('ngay'));
    return { lamViec: k.lamViec, lich };
  },

  'GET /api/thong-bao': (q) => {
    const ma = (q.get('maLich') || '').trim();
    const sql = `SELECT t.*, l.ma_code_lich, n.ho_ten AS ten_benh_nhan FROM thong_bao t
                 JOIN lich_hen l ON l.ma_lich_hen = t.ma_lich_hen JOIN benh_nhan n ON n.ma_benh_nhan = t.ma_benh_nhan`;
    const ds = ma ? db.prepare(`${sql} WHERE l.ma_code_lich = ? ORDER BY t.ma_thong_bao DESC`).all(ma)
      : db.prepare(`${sql} ORDER BY t.ma_thong_bao DESC`).all();
    return { tong: ds.length, thongBao: ds };
  },

  'GET /api/trang-thai': () => ({
    version,
    dongHo: nv.docDongHo(db),
    dongHoMacDinh: nv.DONG_HO_MAC_DINH,
    thongKe: thongKe(),
    lichHen: db.prepare(`${nv.SQL_LICH} ORDER BY l.ma_lich_hen`).all(),
    benhNhan: db.prepare('SELECT * FROM benh_nhan ORDER BY ma_benh_nhan').all(),
    thamSo: db.prepare('SELECT * FROM tham_so ORDER BY ma_tham_so').all(),
    nhatKy: db.prepare('SELECT * FROM nhat_ky ORDER BY ma_nhat_ky DESC LIMIT 30').all(),
  }),

  'GET /api/trang-thai/khung': (q) => ({        // so cho luu tru va so lich hieu luc dem lai de doi chieu (FR-03)
    khung: db.prepare(`SELECT k.*, (SELECT COUNT(*) FROM lich_hen l WHERE l.ma_khung_gio = k.ma_khung_gio
                         AND l.trang_thai_lich = 'Đã xác nhận') AS so_lich_hieu_luc
                       FROM khung_gio_kham k WHERE k.ma_bac_si = ? AND k.ngay_kham = ? ORDER BY k.gio_bat_dau`)
      .all(q.get('bacSi'), q.get('ngay')),
  }),

  'POST /api/dong-ho': (_, b) => ({ dongHo: nv.datDongHo(db, b.macDinh ? nv.DONG_HO_MAC_DINH : b.thoiDiem) }),

  'POST /api/reset': () => { seed(db); return { ok: true, thongKe: thongKe(), dongHo: nv.docDongHo(db) }; },
};

function phucVuTinh(req, res, pathname) {
  const ten = pathname === '/' ? '/index.html' : pathname;
  const file = path.normalize(path.join(PUBLIC, ten));
  if (!file.startsWith(PUBLIC + path.sep)) { res.writeHead(403); return res.end(); }
  fs.readFile(file, (err, data) => {
    if (err) { res.writeHead(404, { 'Content-Type': 'text/plain; charset=utf-8' }); return res.end('Không tìm thấy trang'); }
    res.writeHead(200, { 'Content-Type': MIME[path.extname(file)] || 'application/octet-stream', 'Cache-Control': 'no-store' });
    res.end(data);
  });
}

const server = http.createServer(async (req, res) => {
  const url = new URL(req.url, `http://${req.headers.host || 'localhost'}`);
  const xuLy = API[`${req.method} ${url.pathname}`];
  if (!xuLy) {
    if (url.pathname.startsWith('/api/')) return guiJson(res, 404, { loi: 'Không có API này' });
    return phucVuTinh(req, res, url.pathname);
  }
  try {
    const body = req.method === 'POST' ? await docBody(req) : {};
    guiJson(res, 200, xuLy(url.searchParams, body));
  } catch (e) {
    if (e instanceof nv.LoiNghiepVu) return guiJson(res, 400, { maLoi: e.maLoi, loi: e.message, loiTruong: e.loiTruong });
    console.error(e);
    guiJson(res, 500, { loi: 'Lỗi hệ thống: ' + e.message });
  }
});

server.listen(PORT, () => {
  console.log(`Phòng khám An Tâm – app kiểm thử phiên bản ${version}`);
  console.log(`Mở http://localhost:${PORT}  (đồng hồ hệ thống: ${nv.docDongHo(db)})`);
});

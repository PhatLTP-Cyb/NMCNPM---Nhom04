// Tao lai toan bo du lieu mau (muc 7 Dac ta v1.0). Chay: npm run reset
const { moKetNoi, SCHEMA, BANG } = require('./db');
const nv = require('./nghiep-vu');

const CHUYEN_KHOA = [
  ['CK01', 'Nội tổng quát'], ['CK02', 'Nhi'], ['CK03', 'Da liễu'],
  ['CK04', 'Tai Mũi Họng'], ['CK05', 'Răng Hàm Mặt'],
];
const BAC_SI = [
  ['BS01', 'Lê Minh Hoàng', 'CK01', 'P101'],
  ['BS02', 'Phạm Thu Hà', 'CK01', 'P102'],
  ['BS03', 'Nguyễn Quốc Bảo', 'CK02', 'P201'],
  ['BS04', 'Đỗ Thanh Tâm', 'CK03', 'P202'],
  ['BS05', 'Hoàng Gia Huy', 'CK04', 'P301'],
  ['BS06', 'Vũ Ngọc Lan', 'CK05', 'P302'],
];
const NGAY_NGHI = [['BS05', '2026-11-18']];
const TU_NGAY = '2026-11-16';
const DEN_NGAY = '2026-12-05';
const CA = [
  ['Ca sáng', ['08:00', '08:20', '08:40', '09:00', '09:20', '09:40']],
  ['Ca chiều', ['14:00', '14:20', '14:40', '15:00', '15:20', '15:40']],
];
const BENH_NHAN = [
  ['Nguyễn Văn An', '1990-05-12', 'Nam', '0901000001'],
  ['Trần Thị Bình', '1985-08-20', 'Nữ', '0901000002'],
  ['Lê Văn Cường', '1978-01-03', 'Nam', '0901000003'],
];
// [ma benh nhan, bac si, ngay, gio, trang thai cuoi]
const LICH = [
  [1, 'BS01', '2026-11-18', '08:00', 'Đã xác nhận'],
  [2, 'BS01', '2026-11-17', '08:00', 'Đã xác nhận'],
  [2, 'BS03', '2026-11-19', '09:00', 'Bệnh nhân hủy'],
  [3, 'BS02', '2026-11-20', '14:00', 'Đã xác nhận'],
];
const THOI_DIEM_SEED = '2026-11-10 09:00';

function cong20Phut(gio) {
  const [h, m] = gio.split(':').map(Number);
  const t = h * 60 + m + 20;
  return `${String(Math.floor(t / 60)).padStart(2, '0')}:${String(t % 60).padStart(2, '0')}`;
}

function cacNgayLamViec() {
  const ds = [];
  for (let d = new Date(TU_NGAY + 'T00:00:00Z'); d <= new Date(DEN_NGAY + 'T00:00:00Z'); d.setUTCDate(d.getUTCDate() + 1)) {
    if (d.getUTCDay() !== 0) ds.push(d.toISOString().slice(0, 10)); // bo Chu nhat
  }
  return ds;
}

function seed(db) {
  db.exec('PRAGMA foreign_keys = OFF');
  for (const b of BANG) db.exec(`DROP TABLE IF EXISTS ${b}`);
  db.exec(SCHEMA);
  db.exec('PRAGMA foreign_keys = ON');

  db.exec('BEGIN');
  const ts = db.prepare('INSERT INTO tham_so (ma_tham_so, gia_tri, mo_ta) VALUES (?, ?, ?)');
  ts.run('dong_ho', nv.DONG_HO_MAC_DINH, 'Đồng hồ hệ thống giả lập (ASM-23)');
  ts.run('gioi_han_benh_nhan', '1', 'Số bệnh nhân tối đa mỗi khung (ASM-02)');
  ts.run('han_huy_gio', '24', 'Hủy trước giờ khám ít nhất (giờ) (ASM-18)');
  ts.run('dat_truoc_toi_da_ngay', '14', 'Đặt trước tối đa (ngày) (BR-02)');

  const ck = db.prepare('INSERT INTO chuyen_khoa VALUES (?, ?)');
  CHUYEN_KHOA.forEach((r) => ck.run(...r));
  const bs = db.prepare('INSERT INTO bac_si VALUES (?, ?, ?, ?)');
  BAC_SI.forEach((r) => bs.run(...r));

  const kg = db.prepare(`INSERT INTO khung_gio_kham (ma_bac_si, ngay_kham, ca_lam_viec, gio_bat_dau, gio_ket_thuc, gioi_han_benh_nhan, trang_thai_khung)
                         VALUES (?, ?, ?, ?, ?, 1, ?)`);
  for (const [maBs] of BAC_SI) {
    for (const ngay of cacNgayLamViec()) {
      const nghi = NGAY_NGHI.some(([b, n]) => b === maBs && n === ngay);
      for (const [ca, gios] of CA) {
        for (const g of gios) kg.run(maBs, ngay, ca, g, cong20Phut(g), nghi ? 'Bác sĩ nghỉ' : 'Khả dụng');
      }
    }
  }

  const bn = db.prepare('INSERT INTO benh_nhan (ho_ten, ngay_sinh, gioi_tinh, so_dien_thoai, thoi_diem_tao) VALUES (?, ?, ?, ?, ?)');
  BENH_NHAN.forEach((r) => bn.run(...r, THOI_DIEM_SEED));

  for (const [maBn, maBs, ngay, gio, trangThai] of LICH) {
    const k = db.prepare('SELECT ma_khung_gio FROM khung_gio_kham WHERE ma_bac_si = ? AND ngay_kham = ? AND gio_bat_dau = ?').get(maBs, ngay, gio);
    const r = db.prepare(`INSERT INTO lich_hen (ma_benh_nhan, ma_khung_gio, trang_thai_lich, thoi_diem_tao, thoi_diem_cap_nhat)
                          VALUES (?, ?, 'Đã xác nhận', ?, ?)`).run(maBn, k.ma_khung_gio, THOI_DIEM_SEED, THOI_DIEM_SEED);
    const id = Number(r.lastInsertRowid);
    db.prepare('UPDATE lich_hen SET ma_code_lich = ? WHERE ma_lich_hen = ?').run('LH' + String(id).padStart(6, '0'), id);
    db.prepare('UPDATE khung_gio_kham SET so_cho_da_dat = so_cho_da_dat + 1 WHERE ma_khung_gio = ?').run(k.ma_khung_gio);
    nv.ghiThongBao(db, 'Xác nhận đặt lịch', id, THOI_DIEM_SEED);
    if (trangThai === 'Bệnh nhân hủy') {
      db.prepare("UPDATE lich_hen SET trang_thai_lich = 'Bệnh nhân hủy' WHERE ma_lich_hen = ?").run(id);
      db.prepare('UPDATE khung_gio_kham SET so_cho_da_dat = so_cho_da_dat - 1 WHERE ma_khung_gio = ?').run(k.ma_khung_gio);
      nv.ghiThongBao(db, 'Hủy lịch bởi bệnh nhân', id, THOI_DIEM_SEED);
    }
  }
  nv.ghiNhatKy(db, nv.DONG_HO_MAC_DINH, 'Hệ thống', null, 'Reset dữ liệu mẫu', null, null, 'Dữ liệu mẫu theo mục 7 Đặc tả v1.0');
  db.exec('COMMIT');
}

module.exports = { seed };

if (require.main === module) {
  const db = moKetNoi();
  seed(db);
  db.close();
  console.log('Đã tạo lại dữ liệu mẫu (đồng hồ ' + nv.DONG_HO_MAC_DINH + ').');
}

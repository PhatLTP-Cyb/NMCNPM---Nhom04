// Xu ly nghiep vu Dat lich (CN-1) va Huy lich (CN-2) theo Dac ta v1.0.
// Ma quy tac (BR-xx) ghi o tung cho de doi chieu voi dac ta.
const { giaoDich } = require('./db');

const OTP_GIA_LAP = '123456';             // ASM-19
const PHUT_TOI_THIEU = 24 * 60;            // BR-02, BR-03: 24 gio
const PHUT_TOI_DA_DAT = 14 * 24 * 60;      // BR-02: 14 ngay
const DONG_HO_MAC_DINH = '2026-11-16 08:00'; // ASM-23
const KENH_GUI = 'SMS (giả lập)';          // ASM-22
const GIOI_TINH = ['Nam', 'Nữ', 'Khác'];

const MSG = {
  SDT: 'Số điện thoại phải gồm 10 chữ số và bắt đầu bằng 0',
  OTP: 'Mã OTP không đúng',
  KHONG_LAM_VIEC: 'Bác sĩ không làm việc vào khung giờ này',
  THOI_HAN_DAT: 'Chỉ nhận đặt lịch trước ít nhất 24 giờ và không quá 14 ngày',
  HET_CHO: 'Khung giờ đã hết chỗ, vui lòng chọn khung khác',
  TRUNG_GIO: 'Bạn đã có lịch khác vào cùng thời điểm',
  CUNG_BAC_SI: 'Bạn đã có lịch với bác sĩ này trong ngày',
  THOI_HAN_HUY: 'Chỉ được hủy lịch trước giờ khám ít nhất 24 giờ',
  KHONG_CO_LICH: 'Không có lịch hẹn nào',
};

class LoiNghiepVu extends Error {
  constructor(maLoi, thongBao, them = {}) {
    super(thongBao);
    this.maLoi = maLoi;
    Object.assign(this, them);
  }
}

// ---------- Thoi gian (khong phu thuoc mui gio may) ----------
function sangPhut(s) {               // 'YYYY-MM-DD HH:MM' -> so phut
  const m = /^(\d{4})-(\d{2})-(\d{2})[ T](\d{2}):(\d{2})$/.exec(s);
  if (!m) return NaN;
  return Date.UTC(+m[1], +m[2] - 1, +m[3], +m[4], +m[5]) / 60000;
}
function ngayHopLe(s) {              // 'YYYY-MM-DD'
  const m = /^(\d{4})-(\d{2})-(\d{2})$/.exec(s || '');
  if (!m) return false;
  const d = new Date(Date.UTC(+m[1], +m[2] - 1, +m[3]));
  return d.getUTCFullYear() === +m[1] && d.getUTCMonth() === +m[2] - 1 && d.getUTCDate() === +m[3];
}
function hienThiNgay(ngay) {         // YYYY-MM-DD -> DD/MM/YYYY
  const [y, mo, d] = ngay.split('-');
  return `${d}/${mo}/${y}`;
}

function docDongHo(db) {
  const r = db.prepare("SELECT gia_tri FROM tham_so WHERE ma_tham_so = 'dong_ho'").get();
  return r ? r.gia_tri : DONG_HO_MAC_DINH;
}
function datDongHo(db, giaTri) {
  const s = String(giaTri || '').replace('T', ' ').slice(0, 16);
  if (Number.isNaN(sangPhut(s)) || !ngayHopLe(s.slice(0, 10))) {
    throw new LoiNghiepVu('DONG_HO', 'Thời điểm không hợp lệ (định dạng YYYY-MM-DD HH:MM)');
  }
  db.prepare("UPDATE tham_so SET gia_tri = ? WHERE ma_tham_so = 'dong_ho'").run(s);
  ghiNhatKy(db, s, 'Hệ thống', 'dong_ho', 'Đặt đồng hồ hệ thống', null, s);
  return s;
}

// ---------- Tien ich ----------
function ghiNhatKy(db, thoiDiem, doiTuong, ma, hanhDong, truoc, sau, chiTiet = null) {
  db.prepare(`INSERT INTO nhat_ky (thoi_diem, doi_tuong, ma_doi_tuong, hanh_dong, trang_thai_truoc, trang_thai_sau, chi_tiet)
              VALUES (?, ?, ?, ?, ?, ?, ?)`).run(thoiDiem, doiTuong, ma, hanhDong, truoc, sau, chiTiet);
}

function kiemTraXacThuc(sdt, otp) {   // BR-05
  if (!/^0\d{9}$/.test(String(sdt || ''))) throw new LoiNghiepVu('SDT', MSG.SDT);
  if (String(otp || '') !== OTP_GIA_LAP) throw new LoiNghiepVu('OTP', MSG.OTP);
}

function timBenhNhan(db, sdt) {
  return db.prepare('SELECT * FROM benh_nhan WHERE so_dien_thoai = ?').get(sdt) || null;
}

const SQL_LICH = `
  SELECT l.ma_lich_hen, l.ma_code_lich, l.trang_thai_lich, l.hinh_thuc_kham, l.ly_do_kham,
         l.thoi_diem_tao, l.thoi_diem_cap_nhat, l.ma_benh_nhan, l.ma_khung_gio,
         k.ngay_kham, k.gio_bat_dau, k.gio_ket_thuc, k.ma_bac_si,
         b.ho_ten AS ten_bac_si, b.phong, c.ten AS chuyen_khoa,
         n.ho_ten AS ten_benh_nhan, n.so_dien_thoai
  FROM lich_hen l
  JOIN khung_gio_kham k ON k.ma_khung_gio = l.ma_khung_gio
  JOIN bac_si b ON b.ma_bac_si = k.ma_bac_si
  JOIN chuyen_khoa c ON c.ma_chuyen_khoa = b.ma_chuyen_khoa
  JOIN benh_nhan n ON n.ma_benh_nhan = l.ma_benh_nhan`;

function noiDungThongBao(loai, lich) {   // BR-08: ma lich, bac si, chuyen khoa, hinh thuc, ngay gio
  const tg = `${hienThiNgay(lich.ngay_kham)} ${lich.gio_bat_dau}`;
  if (loai === 'Xác nhận đặt lịch') {
    return `Phòng khám An Tâm: Lịch hẹn ${lich.ma_code_lich} đã được xác nhận. Bác sĩ: ${lich.ten_bac_si} (${lich.chuyen_khoa}). ` +
      `Hình thức: ${lich.hinh_thuc_kham}. Thời gian: ${tg}, phòng ${lich.phong}.`;
  }
  return `Phòng khám An Tâm: Lịch hẹn ${lich.ma_code_lich} (Bác sĩ: ${lich.ten_bac_si} - ${lich.chuyen_khoa}, ` +
    `${lich.hinh_thuc_kham}, ${tg}) đã được hủy theo yêu cầu của bạn.`;
}

function ghiThongBao(db, loai, maLichHen, thoiDiem) {
  const lich = db.prepare(`${SQL_LICH} WHERE l.ma_lich_hen = ?`).get(maLichHen);
  db.prepare(`INSERT INTO thong_bao (ma_lich_hen, ma_benh_nhan, loai_thong_bao, kenh_gui, noi_dung, trang_thai_gui, thoi_diem_gui)
              VALUES (?, ?, ?, ?, ?, 'Đã gửi', ?)`)
    .run(maLichHen, lich.ma_benh_nhan, loai, KENH_GUI, noiDungThongBao(loai, lich), thoiDiem);
}

// ---------- FR-02: trang thai khung ----------
function trangThaiKhung(khung, bayGio) {
  if (khung.trang_thai_khung !== 'Khả dụng') return 'Bác sĩ nghỉ';
  if (khung.so_cho_da_dat >= khung.gioi_han_benh_nhan) return 'Hết chỗ';                 // BR-01
  const conLai = sangPhut(`${khung.ngay_kham} ${khung.gio_bat_dau}`) - sangPhut(bayGio);
  if (conLai < PHUT_TOI_THIEU || conLai > PHUT_TOI_DA_DAT) return 'Ngoài thời hạn đặt';  // BR-02
  return 'Còn chỗ';
}

function danhSachKhung(db, maBacSi, ngay) {
  const bayGio = docDongHo(db);
  const ds = db.prepare('SELECT * FROM khung_gio_kham WHERE ma_bac_si = ? AND ngay_kham = ? ORDER BY gio_bat_dau')
    .all(maBacSi, ngay);
  const lamViec = ds.some((k) => k.trang_thai_khung === 'Khả dụng');                     // BR-10
  return {
    lamViec,
    khung: lamViec ? ds.map((k) => ({
      ma_khung_gio: k.ma_khung_gio, gio_bat_dau: k.gio_bat_dau, gio_ket_thuc: k.gio_ket_thuc,
      ca_lam_viec: k.ca_lam_viec, trang_thai: trangThaiKhung(k, bayGio),
    })) : [],
  };
}

// ---------- BR-06 ----------
function kiemTraThongTinMoi(tt, bayGio) {
  const loi = {};
  const hoTen = String(tt.hoTen || '').trim();
  if (!hoTen) loi.hoTen = 'Họ tên là bắt buộc';
  else if (hoTen.length < 2 || hoTen.length > 100) loi.hoTen = 'Họ tên phải từ 2 đến 100 ký tự';

  const ns = String(tt.ngaySinh || '').trim();
  if (!ns) loi.ngaySinh = 'Ngày sinh là bắt buộc';
  else if (!ngayHopLe(ns) || ns < '1900-01-01') loi.ngaySinh = 'Ngày sinh không hợp lệ';
  else if (ns > bayGio.slice(0, 10)) loi.ngaySinh = 'Ngày sinh không được sau ngày hiện tại';

  const gt = String(tt.gioiTinh || '').trim();
  if (!gt) loi.gioiTinh = 'Giới tính là bắt buộc';
  else if (!GIOI_TINH.includes(gt)) loi.gioiTinh = 'Giới tính không hợp lệ';

  return { loi, hoTen, ngaySinh: ns, gioiTinh: gt };
}

// ---------- CN-1: Dat lich ----------
function datLich(db, yc) {
  return giaoDich(db, () => {
    const bayGio = docDongHo(db);
    {
      kiemTraXacThuc(yc.sdt, yc.otp);

      const khung = db.prepare('SELECT * FROM khung_gio_kham WHERE ma_khung_gio = ?').get(Number(yc.maKhungGio));
      if (!khung || khung.trang_thai_khung !== 'Khả dụng') throw new LoiNghiepVu('KHONG_LAM_VIEC', MSG.KHONG_LAM_VIEC); // BR-10

      const lyDo = String(yc.lyDo || '').trim();
      if (lyDo.length > 500) throw new LoiNghiepVu('THONG_TIN', 'Thông tin chưa hợp lệ', { loiTruong: { lyDo: 'Lý do khám tối đa 500 ký tự' } });

      let bn = timBenhNhan(db, yc.sdt);                                   // ASM-20
      let ttMoi = null;
      if (!bn) {
        ttMoi = kiemTraThongTinMoi(yc, bayGio);                           // BR-06
        if (Object.keys(ttMoi.loi).length) {
          throw new LoiNghiepVu('THONG_TIN', 'Vui lòng kiểm tra: ' + Object.values(ttMoi.loi).join('; '), { loiTruong: ttMoi.loi });
        }
      }

      if (khung.so_cho_da_dat >= khung.gioi_han_benh_nhan) throw new LoiNghiepVu('HET_CHO', MSG.HET_CHO);   // BR-01
      const conLai = sangPhut(`${khung.ngay_kham} ${khung.gio_bat_dau}`) - sangPhut(bayGio);
      if (conLai < PHUT_TOI_THIEU || conLai > PHUT_TOI_DA_DAT) throw new LoiNghiepVu('THOI_HAN_DAT', MSG.THOI_HAN_DAT); // BR-02

      if (bn) {                                                           // BR-04
        const hieuLuc = db.prepare(`SELECT k.ngay_kham, k.gio_bat_dau, k.ma_bac_si FROM lich_hen l
          JOIN khung_gio_kham k ON k.ma_khung_gio = l.ma_khung_gio
          WHERE l.ma_benh_nhan = ? AND l.trang_thai_lich = 'Đã xác nhận'`).all(bn.ma_benh_nhan);
        if (hieuLuc.some((h) => h.ngay_kham === khung.ngay_kham && h.gio_bat_dau === khung.gio_bat_dau)) {
          throw new LoiNghiepVu('TRUNG_GIO', MSG.TRUNG_GIO);
        }
        if (hieuLuc.some((h) => h.ngay_kham === khung.ngay_kham && h.ma_bac_si === khung.ma_bac_si)) {
          throw new LoiNghiepVu('CUNG_BAC_SI', MSG.CUNG_BAC_SI);
        }
      } else {
        const r = db.prepare(`INSERT INTO benh_nhan (ho_ten, ngay_sinh, gioi_tinh, so_dien_thoai, thoi_diem_tao)
                              VALUES (?, ?, ?, ?, ?)`).run(ttMoi.hoTen, ttMoi.ngaySinh, ttMoi.gioiTinh, yc.sdt, bayGio);
        bn = db.prepare('SELECT * FROM benh_nhan WHERE ma_benh_nhan = ?').get(Number(r.lastInsertRowid));
        ghiNhatKy(db, bayGio, 'Bệnh nhân', String(bn.ma_benh_nhan), 'Tạo hồ sơ bệnh nhân', null, null, bn.so_dien_thoai);
      }

      const capNhat = db.prepare(`UPDATE khung_gio_kham SET so_cho_da_dat = so_cho_da_dat + 1
                                  WHERE ma_khung_gio = ? AND so_cho_da_dat < gioi_han_benh_nhan`).run(khung.ma_khung_gio);
      if (capNhat.changes !== 1) throw new LoiNghiepVu('HET_CHO', MSG.HET_CHO);

      const ins = db.prepare(`INSERT INTO lich_hen (ma_benh_nhan, ma_khung_gio, ly_do_kham, trang_thai_lich, thoi_diem_tao, thoi_diem_cap_nhat)
                              VALUES (?, ?, ?, 'Đã xác nhận', ?, ?)`).run(bn.ma_benh_nhan, khung.ma_khung_gio, lyDo || null, bayGio, bayGio);
      const id = Number(ins.lastInsertRowid);
      const code = 'LH' + String(id).padStart(6, '0');                    // BR-07
      db.prepare('UPDATE lich_hen SET ma_code_lich = ? WHERE ma_lich_hen = ?').run(code, id);

      ghiNhatKy(db, bayGio, 'Lịch hẹn', code, 'Đặt lịch', null, 'Đã xác nhận');
      ghiThongBao(db, 'Xác nhận đặt lịch', id, bayGio);                  // BR-08
      return db.prepare(`${SQL_LICH} WHERE l.ma_lich_hen = ?`).get(id);
    }
  });
}

// Ghi nhat ky tu choi sau khi giao dich da rollback.
function datLichCoNhatKy(db, yc) {
  try {
    return datLich(db, yc);
  } catch (e) {
    if (e instanceof LoiNghiepVu) {
      ghiNhatKy(db, docDongHo(db), 'Lịch hẹn', null, 'Từ chối đặt lịch', null, null,
        `khung ${yc.maKhungGio}, SĐT ${yc.sdt || ''}: ${e.message}`);
    }
    throw e;
  }
}

// ---------- CN-2: Huy lich ----------
function lichCuaToi(db, sdt, otp) {
  kiemTraXacThuc(sdt, otp);
  const bn = timBenhNhan(db, sdt);
  if (!bn) throw new LoiNghiepVu('KHONG_CO_LICH', MSG.KHONG_CO_LICH);  // CN-2 1b
  const ds = db.prepare(`${SQL_LICH} WHERE l.ma_benh_nhan = ? ORDER BY k.ngay_kham, k.gio_bat_dau`).all(bn.ma_benh_nhan);
  if (!ds.length) throw new LoiNghiepVu('KHONG_CO_LICH', MSG.KHONG_CO_LICH);
  return { benhNhan: bn, lich: ds };
}

function huyLich(db, yc) {
  kiemTraXacThuc(yc.sdt, yc.otp);
  const bayGio = docDongHo(db);
  try {
    return giaoDich(db, () => {
      const bn = timBenhNhan(db, yc.sdt);
      const lich = bn && db.prepare(`${SQL_LICH} WHERE l.ma_code_lich = ? AND l.ma_benh_nhan = ?`).get(String(yc.maLich || ''), bn.ma_benh_nhan);
      if (!lich) throw new LoiNghiepVu('KHONG_TIM_THAY', 'Không tìm thấy lịch hẹn của bạn');          // BR-09
      if (lich.trang_thai_lich !== 'Đã xác nhận') throw new LoiNghiepVu('TRANG_THAI', `Lịch hẹn đang ở trạng thái "${lich.trang_thai_lich}", không thể hủy`);
      const conLai = sangPhut(`${lich.ngay_kham} ${lich.gio_bat_dau}`) - sangPhut(bayGio);
      if (conLai < PHUT_TOI_THIEU) throw new LoiNghiepVu('THOI_HAN_HUY', MSG.THOI_HAN_HUY);         // BR-03

      db.prepare(`UPDATE lich_hen SET trang_thai_lich = 'Bệnh nhân hủy', thoi_diem_cap_nhat = ? WHERE ma_lich_hen = ?`)
        .run(bayGio, lich.ma_lich_hen);
      db.prepare('UPDATE khung_gio_kham SET so_cho_da_dat = so_cho_da_dat - 1 WHERE ma_khung_gio = ? AND so_cho_da_dat > 0')
        .run(lich.ma_khung_gio);
      ghiNhatKy(db, bayGio, 'Lịch hẹn', lich.ma_code_lich, 'Bệnh nhân hủy lịch', 'Đã xác nhận', 'Bệnh nhân hủy');
      ghiThongBao(db, 'Hủy lịch bởi bệnh nhân', lich.ma_lich_hen, bayGio);                          // BR-08
      return db.prepare(`${SQL_LICH} WHERE l.ma_lich_hen = ?`).get(lich.ma_lich_hen);
    });
  } catch (e) {
    if (e instanceof LoiNghiepVu) {
      ghiNhatKy(db, bayGio, 'Lịch hẹn', String(yc.maLich || ''), 'Từ chối hủy lịch', null, null, e.message);
    }
    throw e;
  }
}

module.exports = {
  OTP_GIA_LAP, DONG_HO_MAC_DINH, KENH_GUI, MSG, LoiNghiepVu, SQL_LICH,
  sangPhut, ngayHopLe, hienThiNgay, docDongHo, datDongHo, ghiNhatKy, ghiThongBao,
  kiemTraXacThuc, timBenhNhan, danhSachKhung, datLich: datLichCoNhatKy, lichCuaToi, huyLich,
};

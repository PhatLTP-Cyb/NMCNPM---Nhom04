// Ket noi SQLite (module co san node:sqlite, khong can cai them thu vien).
const path = require('node:path');
const fs = require('node:fs');
const { DatabaseSync } = require('node:sqlite');

const DATA_DIR = path.join(__dirname, 'data');
const DB_FILE = process.env.DB_FILE || path.join(DATA_DIR, 'phongkham.db');

function moKetNoi() {
  fs.mkdirSync(path.dirname(DB_FILE), { recursive: true });
  const db = new DatabaseSync(DB_FILE);
  db.exec('PRAGMA foreign_keys = ON; PRAGMA journal_mode = WAL;');
  return db;
}

// Chay fn trong mot giao dich; loi thi rollback.
function giaoDich(db, fn) {
  db.exec('BEGIN IMMEDIATE');
  try {
    const kq = fn();
    db.exec('COMMIT');
    return kq;
  } catch (e) {
    db.exec('ROLLBACK');
    throw e;
  }
}

const SCHEMA = `
CREATE TABLE chuyen_khoa (
  ma_chuyen_khoa TEXT PRIMARY KEY,
  ten            TEXT NOT NULL
);
CREATE TABLE bac_si (
  ma_bac_si      TEXT PRIMARY KEY,
  ho_ten         TEXT NOT NULL,
  ma_chuyen_khoa TEXT NOT NULL REFERENCES chuyen_khoa(ma_chuyen_khoa),
  phong          TEXT NOT NULL
);
CREATE TABLE khung_gio_kham (
  ma_khung_gio       INTEGER PRIMARY KEY AUTOINCREMENT,
  ma_bac_si          TEXT NOT NULL REFERENCES bac_si(ma_bac_si),
  ngay_kham          TEXT NOT NULL,              -- YYYY-MM-DD
  ca_lam_viec        TEXT NOT NULL CHECK (ca_lam_viec IN ('Ca sáng','Ca chiều')),
  gio_bat_dau        TEXT NOT NULL,              -- HH:MM
  gio_ket_thuc       TEXT NOT NULL,
  gioi_han_benh_nhan INTEGER NOT NULL CHECK (gioi_han_benh_nhan > 0),
  so_cho_da_dat      INTEGER NOT NULL DEFAULT 0,
  trang_thai_khung   TEXT NOT NULL DEFAULT 'Khả dụng' CHECK (trang_thai_khung IN ('Khả dụng','Bác sĩ nghỉ')),
  UNIQUE (ma_bac_si, ngay_kham, gio_bat_dau),
  CHECK (so_cho_da_dat >= 0 AND so_cho_da_dat <= gioi_han_benh_nhan)
);
CREATE TABLE benh_nhan (
  ma_benh_nhan  INTEGER PRIMARY KEY AUTOINCREMENT,
  ho_ten        TEXT NOT NULL,
  ngay_sinh     TEXT NOT NULL,
  gioi_tinh     TEXT NOT NULL CHECK (gioi_tinh IN ('Nam','Nữ','Khác')),
  so_dien_thoai TEXT NOT NULL UNIQUE,
  thoi_diem_tao TEXT NOT NULL
);
CREATE TABLE lich_hen (
  ma_lich_hen        INTEGER PRIMARY KEY AUTOINCREMENT,
  ma_code_lich       TEXT UNIQUE,
  ma_benh_nhan       INTEGER NOT NULL REFERENCES benh_nhan(ma_benh_nhan),
  ma_khung_gio       INTEGER NOT NULL REFERENCES khung_gio_kham(ma_khung_gio),
  hinh_thuc_kham     TEXT NOT NULL DEFAULT 'Tại phòng khám',
  ly_do_kham         TEXT,
  trang_thai_lich    TEXT NOT NULL CHECK (trang_thai_lich IN ('Đã xác nhận','Bệnh nhân hủy')),
  thoi_diem_tao      TEXT NOT NULL,
  thoi_diem_cap_nhat TEXT NOT NULL
);
CREATE TABLE thong_bao (
  ma_thong_bao   INTEGER PRIMARY KEY AUTOINCREMENT,
  ma_lich_hen    INTEGER NOT NULL REFERENCES lich_hen(ma_lich_hen),
  ma_benh_nhan   INTEGER NOT NULL REFERENCES benh_nhan(ma_benh_nhan),
  loai_thong_bao TEXT NOT NULL CHECK (loai_thong_bao IN ('Xác nhận đặt lịch','Hủy lịch bởi bệnh nhân')),
  kenh_gui       TEXT NOT NULL,
  noi_dung       TEXT NOT NULL,
  trang_thai_gui TEXT NOT NULL,
  thoi_diem_gui  TEXT NOT NULL
);
CREATE TABLE nhat_ky (
  ma_nhat_ky      INTEGER PRIMARY KEY AUTOINCREMENT,
  thoi_diem       TEXT NOT NULL,
  doi_tuong       TEXT NOT NULL,
  ma_doi_tuong    TEXT,
  hanh_dong       TEXT NOT NULL,
  trang_thai_truoc TEXT,
  trang_thai_sau  TEXT,
  chi_tiet        TEXT
);
CREATE TABLE tham_so (
  ma_tham_so TEXT PRIMARY KEY,
  gia_tri    TEXT NOT NULL,
  mo_ta      TEXT NOT NULL
);
`;

const BANG = ['nhat_ky', 'thong_bao', 'lich_hen', 'benh_nhan', 'khung_gio_kham', 'bac_si', 'chuyen_khoa', 'tham_so'];

module.exports = { moKetNoi, giaoDich, SCHEMA, BANG, DB_FILE };

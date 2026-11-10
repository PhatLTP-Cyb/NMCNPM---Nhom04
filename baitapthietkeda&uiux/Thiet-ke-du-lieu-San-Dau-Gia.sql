-- ==============================================================================
-- BÀI TẬP TUẦN 8: THIẾT KẾ DỮ LIỆU & UI/UX (THEO BÀI GIẢNG LT07-DESIGN)
-- PHẦN VIỆC NGƯỜI 2: THIẾT KẾ CƠ SỞ DỮ LIỆU SÀN ĐẤU GIÁ TRỰC TUYẾN
-- Sinh viên thực hiện: Vương Hữu Khang (MSSV: 24120070) - Nhóm 04
-- Hệ quản trị CSDL mục tiêu: SQL Server / PostgreSQL (chuẩn ANSI SQL)
-- Quy ước: Toàn bộ tiền tệ dùng DECIMAL(18,0), thời điểm dùng DATETIME, snake_case
-- ==============================================================================

-- 1. TẠO BẢNG: nguoi_dung (Tài khoản người dùng, đóng cả vai trò người bán và người mua)
CREATE TABLE nguoi_dung (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_nguoi_dung VARCHAR(20) NOT NULL UNIQUE,
    ho_ten NVARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mat_khau_hash VARCHAR(255) NOT NULL,
    so_dien_thoai VARCHAR(10) NOT NULL UNIQUE,
    so_cccd VARCHAR(12) NOT NULL UNIQUE,
    dia_chi NVARCHAR(255) NOT NULL,
    diem_uy_tin INT NOT NULL DEFAULT 100,
    so_du_vi DECIMAL(18,0) NOT NULL DEFAULT 0,
    trang_thai VARCHAR(20) NOT NULL DEFAULT 'HOAT_DONG',
    ngay_tao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT CK_nguoi_dung_diem_uy_tin CHECK (diem_uy_tin >= 0),
    CONSTRAINT CK_nguoi_dung_so_du_vi CHECK (so_du_vi >= 0),
    CONSTRAINT CK_nguoi_dung_trang_thai CHECK (trang_thai IN ('HOAT_DONG', 'TAM_KHOA', 'BI_KHOA', 'CHUA_KICH_HOAT'))
);

-- 2. TẠO BẢNG: danh_muc (Phân loại sản phẩm, hỗ trợ cây phân cấp cha - con)
CREATE TABLE danh_muc (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_danh_muc VARCHAR(20) NOT NULL UNIQUE,
    ten_danh_muc NVARCHAR(100) NOT NULL,
    danh_muc_cha_id INT NULL,
    mo_ta NVARCHAR(500) NULL,
    thu_tu_hien_thi INT NOT NULL DEFAULT 0,
    trang_thai VARCHAR(20) NOT NULL DEFAULT 'HOAT_DONG',
    CONSTRAINT FK_danh_muc_cha FOREIGN KEY (danh_muc_cha_id) REFERENCES danh_muc(id),
    CONSTRAINT CK_danh_muc_thu_tu CHECK (thu_tu_hien_thi >= 0),
    CONSTRAINT CK_danh_muc_trang_thai CHECK (trang_thai IN ('HOAT_DONG', 'TAM_AN'))
);

-- 3. TẠO BẢNG: san_pham (Hàng hóa do người bán đăng bán đấu giá)
CREATE TABLE san_pham (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_san_pham VARCHAR(20) NOT NULL UNIQUE,
    ten_san_pham NVARCHAR(200) NOT NULL,
    danh_muc_id INT NOT NULL,
    nguoi_ban_id INT NOT NULL,
    mo_ta_chi_tiet NVARCHAR(MAX) NOT NULL,
    xuat_xu NVARCHAR(100) NULL,
    tinh_trang VARCHAR(20) NOT NULL,
    phuong_thuc_giao_hang VARCHAR(30) NOT NULL,
    phi_giao_hang DECIMAL(18,0) NOT NULL DEFAULT 0,
    ngay_tao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_san_pham_danh_muc FOREIGN KEY (danh_muc_id) REFERENCES danh_muc(id),
    CONSTRAINT FK_san_pham_nguoi_ban FOREIGN KEY (nguoi_ban_id) REFERENCES nguoi_dung(id),
    CONSTRAINT CK_san_pham_tinh_trang CHECK (tinh_trang IN ('MOI_100', 'DA_QUA_SU_DUNG', 'LIKE_NEW', 'CO_VAT')),
    CONSTRAINT CK_san_pham_giao_hang CHECK (phuong_thuc_giao_hang IN ('CHUYEN_PHAT_NHANH', 'NGUOI_MUA_DEN_LAY', 'MIEN_PHI_GIAO_HANG')),
    CONSTRAINT CK_san_pham_phi_giao_hang CHECK (phi_giao_hang >= 0)
);

-- 4. TẠO BẢNG: hinh_anh_san_pham (Hình ảnh minh họa sản phẩm, lưu URL)
CREATE TABLE hinh_anh_san_pham (
    id INT IDENTITY(1,1) PRIMARY KEY,
    san_pham_id INT NOT NULL,
    duong_dan_anh VARCHAR(500) NOT NULL,
    la_anh_chinh BIT NOT NULL DEFAULT 0,
    thu_tu INT NOT NULL DEFAULT 1,
    ngay_tao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_hinh_anh_san_pham FOREIGN KEY (san_pham_id) REFERENCES san_pham(id) ON DELETE CASCADE,
    CONSTRAINT CK_hinh_anh_thu_tu CHECK (thu_tu >= 1)
);

-- 5. TẠO BẢNG: phien_dau_gia (Phiên đấu giá cho từng sản phẩm)
CREATE TABLE phien_dau_gia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_phien VARCHAR(20) NOT NULL UNIQUE,
    san_pham_id INT NOT NULL UNIQUE,
    gia_khoi_diem DECIMAL(18,0) NOT NULL,
    buoc_gia DECIMAL(18,0) NOT NULL,
    gia_ban_toi_thieu DECIMAL(18,0) NULL,
    gia_mua_ngay DECIMAL(18,0) NULL,
    gia_hien_tai DECIMAL(18,0) NOT NULL,
    so_luot_tra_gia INT NOT NULL DEFAULT 0,
    nguoi_dan_dau_id INT NULL,
    thoi_gian_bat_dau DATETIME NOT NULL,
    thoi_gian_ket_thuc DATETIME NOT NULL,
    thoi_gian_ket_thuc_goc DATETIME NOT NULL,
    so_lan_gia_han INT NOT NULL DEFAULT 0,
    yeu_cau_dat_coc BIT NOT NULL DEFAULT 0,
    so_tien_coc DECIMAL(18,0) NOT NULL DEFAULT 0,
    trang_thai VARCHAR(20) NOT NULL DEFAULT 'CHO_DUYET',
    ly_do_ket_thuc VARCHAR(30) NULL,
    nguoi_thang_id INT NULL,
    gia_thang DECIMAL(18,0) NULL,
    ngay_tao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_phien_dau_gia_san_pham FOREIGN KEY (san_pham_id) REFERENCES san_pham(id),
    CONSTRAINT FK_phien_dau_gia_nguoi_dan_dau FOREIGN KEY (nguoi_dan_dau_id) REFERENCES nguoi_dung(id),
    CONSTRAINT FK_phien_dau_gia_nguoi_thang FOREIGN KEY (nguoi_thang_id) REFERENCES nguoi_dung(id),
    CONSTRAINT CK_phien_gia_khoi_diem CHECK (gia_khoi_diem > 0),
    CONSTRAINT CK_phien_buoc_gia CHECK (buoc_gia > 0),
    CONSTRAINT CK_phien_gia_ban_toi_thieu CHECK (gia_ban_toi_thieu IS NULL OR gia_ban_toi_thieu >= gia_khoi_diem),
    CONSTRAINT CK_phien_gia_mua_ngay CHECK (gia_mua_ngay IS NULL OR gia_mua_ngay > gia_khoi_diem),
    CONSTRAINT CK_phien_gia_hien_tai CHECK (gia_hien_tai >= gia_khoi_diem),
    CONSTRAINT CK_phien_so_luot CHECK (so_luot_tra_gia >= 0),
    CONSTRAINT CK_phien_thoi_gian CHECK (thoi_gian_ket_thuc > thoi_gian_bat_dau),
    CONSTRAINT CK_phien_so_lan_gia_han CHECK (so_lan_gia_han >= 0 AND so_lan_gia_han <= 10),
    CONSTRAINT CK_phien_so_tien_coc CHECK (so_tien_coc >= 0),
    CONSTRAINT CK_phien_trang_thai CHECK (trang_thai IN ('CHO_DUYET', 'SAP_DIEN_RA', 'DANG_DIEN_RA', 'DA_KET_THUC', 'DA_HUY')),
    CONSTRAINT CK_phien_ly_do_ket_thuc CHECK (ly_do_ket_thuc IS NULL OR ly_do_ket_thuc IN ('HET_GIO_CO_NGUOI_THANG', 'HET_GIO_KHONG_DAT_GIA_SAN', 'KHONG_CO_LUOT_TRA_GIA', 'MUA_NGAY', 'NGUOI_BAN_HUY', 'HE_THONG_HUY')),
    CONSTRAINT CK_phien_gia_thang CHECK (gia_thang IS NULL OR gia_thang >= gia_khoi_diem)
);

-- 6. TẠO BẢNG: luot_tra_gia (Lịch sử từng lần đặt giá của người mua)
CREATE TABLE luot_tra_gia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    phien_dau_gia_id INT NOT NULL,
    nguoi_tra_id INT NOT NULL,
    gia_tra DECIMAL(18,0) NOT NULL,
    thoi_gian_tra DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    la_mua_ngay BIT NOT NULL DEFAULT 0,
    trang_thai VARCHAR(20) NOT NULL DEFAULT 'HOP_LE',
    ip_nguoi_tra VARCHAR(45) NULL,
    CONSTRAINT FK_luot_tra_phien FOREIGN KEY (phien_dau_gia_id) REFERENCES phien_dau_gia(id),
    CONSTRAINT FK_luot_tra_nguoi_tra FOREIGN KEY (nguoi_tra_id) REFERENCES nguoi_dung(id),
    CONSTRAINT CK_luot_tra_gia_tra CHECK (gia_tra > 0),
    CONSTRAINT CK_luot_tra_trang_thai CHECK (trang_thai IN ('HOP_LE', 'BI_VUOT_GIA', 'THANG_CUOC', 'BI_HUY'))
);

-- 7. TẠO BẢNG: theo_doi (Watchlist - Danh sách quan tâm của người dùng)
CREATE TABLE theo_doi (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_dung_id INT NOT NULL,
    phien_dau_gia_id INT NOT NULL,
    ngay_theo_doi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nhan_thong_bao BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_theo_doi_nguoi_dung FOREIGN KEY (nguoi_dung_id) REFERENCES nguoi_dung(id),
    CONSTRAINT FK_theo_doi_phien FOREIGN KEY (phien_dau_gia_id) REFERENCES phien_dau_gia(id),
    CONSTRAINT UQ_theo_doi_nguoi_dung_phien UNIQUE (nguoi_dung_id, phien_dau_gia_id)
);

-- 8. TẠO BẢNG: giao_dich_thanh_toan (Quản lý các dòng tiền thanh toán cọc, đơn hàng, hoàn cọc)
CREATE TABLE giao_dich_thanh_toan (
    id INT IDENTITY(1,1) PRIMARY KEY,
    ma_giao_dich VARCHAR(30) NOT NULL UNIQUE,
    phien_dau_gia_id INT NOT NULL,
    nguoi_thuc_hien_id INT NOT NULL,
    loai_giao_dich VARCHAR(30) NOT NULL,
    so_tien DECIMAL(18,0) NOT NULL,
    phuong_thuc VARCHAR(30) NOT NULL,
    ma_giao_dich_cong VARCHAR(100) NULL,
    trang_thai VARCHAR(20) NOT NULL DEFAULT 'CHO_XU_LY',
    han_chot_thanh_toan DATETIME NULL,
    thoi_gian_thanh_toan DATETIME NULL,
    ghi_chu NVARCHAR(255) NULL,
    ngay_tao DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_giao_dich_phien FOREIGN KEY (phien_dau_gia_id) REFERENCES phien_dau_gia(id),
    CONSTRAINT FK_giao_dich_nguoi_dung FOREIGN KEY (nguoi_thuc_hien_id) REFERENCES nguoi_dung(id),
    CONSTRAINT CK_giao_dich_loai CHECK (loai_giao_dich IN ('DAT_COC', 'HOAN_COC', 'TICH_THU_COC', 'THANH_TOAN_HOA_DON', 'PHI_DANG_SAN_PHAM', 'RUT_TIEN_BAN')),
    CONSTRAINT CK_giao_dich_so_tien CHECK (so_tien > 0),
    CONSTRAINT CK_giao_dich_phuong_thuc CHECK (phuong_thuc IN ('VI_SAN', 'VNPAY', 'MOMO', 'CHUYEN_KHOAN_NGAN_HANG')),
    CONSTRAINT CK_giao_dich_trang_thai CHECK (trang_thai IN ('CHO_XU_LY', 'THANH_CONG', 'THAT_BAI', 'DA_HUY'))
);

-- 9. TẠO BẢNG: danh_gia (Đánh giá hai chiều sau khi phiên đấu giá hoàn tất thành công)
CREATE TABLE danh_gia (
    id INT IDENTITY(1,1) PRIMARY KEY,
    phien_dau_gia_id INT NOT NULL,
    nguoi_danh_gia_id INT NOT NULL,
    nguoi_bi_danh_gia_id INT NOT NULL,
    vai_tro_nguoi_danh_gia VARCHAR(20) NOT NULL,
    so_sao INT NOT NULL,
    nhan_xet NVARCHAR(1000) NOT NULL,
    thoi_gian_danh_gia DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_danh_gia_phien FOREIGN KEY (phien_dau_gia_id) REFERENCES phien_dau_gia(id),
    CONSTRAINT FK_danh_gia_nguoi_danh_gia FOREIGN KEY (nguoi_danh_gia_id) REFERENCES nguoi_dung(id),
    CONSTRAINT FK_danh_gia_nguoi_bi_danh_gia FOREIGN KEY (nguoi_bi_danh_gia_id) REFERENCES nguoi_dung(id),
    CONSTRAINT CK_danh_gia_vai_tro CHECK (vai_tro_nguoi_danh_gia IN ('NGUOI_MUA', 'NGUOI_BAN')),
    CONSTRAINT CK_danh_gia_so_sao CHECK (so_sao BETWEEN 1 AND 5),
    CONSTRAINT UQ_danh_gia_phien_nguoi UNIQUE (phien_dau_gia_id, nguoi_danh_gia_id)
);

-- 10. TẠO BẢNG: thong_bao (Thông báo biến động cho người dùng)
CREATE TABLE thong_bao (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nguoi_nhan_id INT NOT NULL,
    phien_dau_gia_id INT NULL,
    tieu_de NVARCHAR(200) NOT NULL,
    noi_dung NVARCHAR(1000) NOT NULL,
    loai_thong_bao VARCHAR(30) NOT NULL,
    da_doc BIT NOT NULL DEFAULT 0,
    thoi_gian_gui DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT FK_thong_bao_nguoi_nhan FOREIGN KEY (nguoi_nhan_id) REFERENCES nguoi_dung(id),
    CONSTRAINT FK_thong_bao_phien FOREIGN KEY (phien_dau_gia_id) REFERENCES phien_dau_gia(id),
    CONSTRAINT CK_thong_bao_loai CHECK (loai_thong_bao IN ('BI_VUOT_GIA', 'THANG_DAU_GIA', 'PHIEN_SAP_KET_THUC', 'XAC_NHAN_DAT_GIA', 'THANH_TOAN_THANH_CONG', 'HOAN_TIEN_COC', 'PHIEN_BI_HUY'))
);

-- ==============================================================================
-- DỮ LIỆU MẪU (SEED DATA): MỘT PHIÊN ĐẤU GIÁ HOÀN CHỈNH VỚI 5 LƯỢT TRẢ GIÁ
-- ==============================================================================

-- 1. Thêm danh mục sản phẩm (hỗ trợ phân cấp)
INSERT INTO danh_muc (ma_danh_muc, ten_danh_muc, danh_muc_cha_id, mo_ta, thu_tu_hien_thi, trang_thai)
VALUES 
('DM_DIENTU', N'Đồ điện tử & Công nghệ', NULL, N'Các thiết bị công nghệ, điện máy', 1, 'HOAT_DONG');

INSERT INTO danh_muc (ma_danh_muc, ten_danh_muc, danh_muc_cha_id, mo_ta, thu_tu_hien_thi, trang_thai)
VALUES 
('DM_LAPTOP', N'Máy tính xách tay & Laptop', 1, N'Laptop văn phòng, gaming, đồ họa cao cấp', 1, 'HOAT_DONG');

-- 2. Thêm người dùng (1 Người bán, 3 Người mua)
INSERT INTO nguoi_dung (ma_nguoi_dung, ho_ten, email, mat_khau_hash, so_dien_thoai, so_cccd, dia_chi, diem_uy_tin, so_du_vi, trang_thai)
VALUES
('ND000001', N'Trần Văn Bán', 'seller_tran@gmail.com', '$2b$12$e8x/kZ6XhL2Zq1...hash', '0901234567', '079200001234', N'123 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP.HCM', 100, 50000000, 'HOAT_DONG'),
('ND000002', N'Lê Thị Mua Một', 'buyer_le1@gmail.com', '$2b$12$e8x/kZ6XhL2Zq2...hash', '0912345678', '079200005678', N'456 Lê Duẩn, Phường Đa Kao, Quận 1, TP.HCM', 98, 35000000, 'HOAT_DONG'),
('ND000003', N'Phạm Hoàng Mua Hai', 'buyer_pham2@gmail.com', '$2b$12$e8x/kZ6XhL2Zq3...hash', '0923456789', '079200009012', N'789 Cách Mạng Tháng 8, Phường 4, Quận Tân Bình, TP.HCM', 95, 40000000, 'HOAT_DONG'),
('ND000004', N'Vũ Đình Mua Ba', 'buyer_vu3@gmail.com', '$2b$12$e8x/kZ6XhL2Zq4...hash', '0934567890', '079200003456', N'101 Võ Văn Ngân, Phường Linh Chiểu, TP. Thủ Đức, TP.HCM', 100, 60000000, 'HOAT_DONG');

-- 3. Người bán đăng 1 sản phẩm
INSERT INTO san_pham (ma_san_pham, ten_san_pham, danh_muc_id, nguoi_ban_id, mo_ta_chi_tiet, xuat_xu, tinh_trang, phuong_thuc_giao_hang, phi_giao_hang)
VALUES
('SP000001', N'MacBook Pro 14 inch M3 Pro 18GB/512GB (Chính hãng Apple)', 2, 1, 
 N'Máy đẹp như mới 99%, pin còn 98%, đầy đủ hộp sạc cáp zin theo máy. Bảo hành chính hãng Apple Việt Nam đến 12/2026. Không một vết cấn móp.', 
 N'Việt Nam / Apple Inc', 'LIKE_NEW', 'CHUYEN_PHAT_NHANH', 50000);

-- 4. Thêm hình ảnh sản phẩm
INSERT INTO hinh_anh_san_pham (san_pham_id, duong_dan_anh, la_anh_chinh, thu_tu)
VALUES
(1, 'https://cdn.sandaugia.vn/uploads/products/sp01_front.jpg', 1, 1),
(1, 'https://cdn.sandaugia.vn/uploads/products/sp01_back.jpg', 0, 2),
(1, 'https://cdn.sandaugia.vn/uploads/products/sp01_battery.jpg', 0, 3);

-- 5. Mở phiên đấu giá cho sản phẩm
-- Giá khởi điểm: 30.000.000 VNĐ, Bước giá: 500.000 VNĐ, Giá mua ngay: 42.000.000 VNĐ
-- Giá hiện tại sau 5 lượt đấu giá: 32.500.000 VNĐ, người thắng: Vũ Đình Mua Ba (ID=4)
INSERT INTO phien_dau_gia (
    ma_phien, san_pham_id, gia_khoi_diem, buoc_gia, gia_ban_toi_thieu, gia_mua_ngay,
    gia_hien_tai, so_luot_tra_gia, nguoi_dan_dau_id,
    thoi_gian_bat_dau, thoi_gian_ket_thuc, thoi_gian_ket_thuc_goc, so_lan_gia_han,
    yeu_cau_dat_coc, so_tien_coc, trang_thai, ly_do_ket_thuc, nguoi_thang_id, gia_thang
)
VALUES (
    'PDG000001', 1, 30000000, 500000, 31000000, 42000000,
    32500000, 5, 4,
    '2026-11-08 08:00:00', '2026-11-08 10:05:00', '2026-11-08 10:00:00', 1,
    1, 3000000, 'DA_KET_THUC', 'HET_GIO_CO_NGUOI_THANG', 4, 32500000
);

-- 6. Người mua đặt cọc tham gia đấu giá (3.000.000 VNĐ/người)
INSERT INTO giao_dich_thanh_toan (ma_giao_dich, phien_dau_gia_id, nguoi_thuc_hien_id, loai_giao_dich, so_tien, phuong_thuc, ma_giao_dich_cong, trang_thai, thoi_gian_thanh_toan, ghi_chu)
VALUES
('GD_COC_01', 1, 2, 'DAT_COC', 3000000, 'VI_SAN', 'VNPAY_12345671', 'THANH_CONG', '2026-11-08 08:05:10', N'Đặt cọc tham gia phiên PDG000001'),
('GD_COC_02', 1, 3, 'DAT_COC', 3000000, 'VI_SAN', 'VNPAY_12345672', 'THANH_CONG', '2026-11-08 08:07:30', N'Đặt cọc tham gia phiên PDG000001'),
('GD_COC_03', 1, 4, 'DAT_COC', 3000000, 'VI_SAN', 'VNPAY_12345673', 'THANH_CONG', '2026-11-08 08:15:00', N'Đặt cọc tham gia phiên PDG000001');

-- 7. Danh sách theo dõi phiên đấu giá
INSERT INTO theo_doi (nguoi_dung_id, phien_dau_gia_id, nhan_thong_bao)
VALUES
(2, 1, 1),
(3, 1, 1),
(4, 1, 1);

-- 8. Diễn biến 5 lượt trả giá trong phiên đấu giá
-- Lượt 1: Người mua 1 đặt 30.500.000đ lúc 08:30:15
INSERT INTO luot_tra_gia (phien_dau_gia_id, nguoi_tra_id, gia_tra, thoi_gian_tra, la_mua_ngay, trang_thai, ip_nguoi_tra)
VALUES (1, 2, 30500000, '2026-11-08 08:30:15', 0, 'BI_VUOT_GIA', '14.241.12.88');

-- Lượt 2: Người mua 2 đặt 31.000.000đ lúc 08:45:20
INSERT INTO luot_tra_gia (phien_dau_gia_id, nguoi_tra_id, gia_tra, thoi_gian_tra, la_mua_ngay, trang_thai, ip_nguoi_tra)
VALUES (1, 3, 31000000, '2026-11-08 08:45:20', 0, 'BI_VUOT_GIA', '118.69.182.45');

-- Lượt 3: Người mua 1 tiếp tục trả 31.500.000đ lúc 09:12:05
INSERT INTO luot_tra_gia (phien_dau_gia_id, nguoi_tra_id, gia_tra, thoi_gian_tra, la_mua_ngay, trang_thai, ip_nguoi_tra)
VALUES (1, 2, 31500000, '2026-11-08 09:12:05', 0, 'BI_VUOT_GIA', '14.241.12.88');

-- Lượt 4: Người mua 3 tham chiến, đặt 32.000.000đ lúc 09:40:50
INSERT INTO luot_tra_gia (phien_dau_gia_id, nguoi_tra_id, gia_tra, thoi_gian_tra, la_mua_ngay, trang_thai, ip_nguoi_tra)
VALUES (1, 4, 32000000, '2026-11-08 09:40:50', 0, 'BI_VUOT_GIA', '27.72.105.12');

-- Lượt 5: Người mua 3 tung giá quyết định 32.500.000đ lúc 09:58:30 (trong 5 phút cuối -> hệ thống kích hoạt gia hạn thêm 5 phút đến 10:05:00)
-- Đến 10:05:00 không ai trả thêm -> Người mua 3 thắng cuộc!
INSERT INTO luot_tra_gia (phien_dau_gia_id, nguoi_tra_id, gia_tra, thoi_gian_tra, la_mua_ngay, trang_thai, ip_nguoi_tra)
VALUES (1, 4, 32500000, '2026-11-08 09:58:30', 0, 'THANG_CUOC', '27.72.105.12');

-- 9. Hoàn cọc cho người thua (Người 2 và Người 3)
INSERT INTO giao_dich_thanh_toan (ma_giao_dich, phien_dau_gia_id, nguoi_thuc_hien_id, loai_giao_dich, so_tien, phuong_thuc, ma_giao_dich_cong, trang_thai, thoi_gian_thanh_toan, ghi_chu)
VALUES
('GD_HOAN_01', 1, 2, 'HOAN_COC', 3000000, 'VI_SAN', 'REFUND_VNPAY_01', 'THANH_CONG', '2026-11-08 10:06:00', N'Hoàn cọc 100% phiên PDG000001 do không thắng'),
('GD_HOAN_02', 1, 3, 'HOAN_COC', 3000000, 'VI_SAN', 'REFUND_VNPAY_02', 'THANH_CONG', '2026-11-08 10:06:00', N'Hoàn cọc 100% phiên PDG000001 do không thắng');

-- 10. Hóa đơn thanh toán của người thắng (Giá thắng 32.500.000 + Phí giao hàng 50.000 - Cọc 3.000.000 = Cần trả 29.550.000 VNĐ)
INSERT INTO giao_dich_thanh_toan (
    ma_giao_dich, phien_dau_gia_id, nguoi_thuc_hien_id, loai_giao_dich, so_tien, phuong_thuc,
    ma_giao_dich_cong, trang_thai, han_chot_thanh_toan, thoi_gian_thanh_toan, ghi_chu
)
VALUES (
    'GD_HD_000001', 1, 4, 'THANH_TOAN_HOA_DON', 29550000, 'CHUYEN_KHOAN_NGAN_HANG',
    'VCB_9988776655', 'THANH_CONG', '2026-11-10 10:05:00', '2026-11-08 14:20:00',
    N'Thanh toán hóa đơn trúng đấu giá MacBook Pro M3 Pro (Đã khấu trừ 3.000.000đ tiền cọc)'
);

-- 11. Đánh giá 2 chiều sau khi giao dịch hoàn tất
INSERT INTO danh_gia (phien_dau_gia_id, nguoi_danh_gia_id, nguoi_bi_danh_gia_id, vai_tro_nguoi_danh_gia, so_sao, nhan_xet, thoi_gian_danh_gia)
VALUES
(1, 4, 1, 'NGUOI_MUA', 5, N'Người bán giao hàng cực nhanh, máy đóng gói cẩn thận, đúng như mô tả Like New, rất uy tín!', '2026-11-09 11:30:00'),
(1, 1, 4, 'NGUOI_BAN', 5, N'Người mua thanh toán dứt khoát, giao dịch nhanh chóng, đánh giá 5 sao!', '2026-11-09 12:00:00');

-- 12. Lịch sử thông báo hệ thống gửi tới các bên
INSERT INTO thong_bao (nguoi_nhan_id, phien_dau_gia_id, tieu_de, noi_dung, loai_thong_bao, da_doc, thoi_gian_gui)
VALUES
(2, 1, N'Bạn đã bị vượt giá!', N'Tại phiên PDG000001, đã có người trả 31.000.000đ. Hãy đặt giá mới để tiếp tục dẫn đầu.', 'BI_VUOT_GIA', 1, '2026-11-08 08:45:21'),
(3, 1, N'Bạn đã bị vượt giá!', N'Tại phiên PDG000001, đã có người trả 31.500.000đ. Hãy đặt giá mới để tiếp tục dẫn đầu.', 'BI_VUOT_GIA', 1, '2026-11-08 09:12:06'),
(4, 1, N'Chúc mừng bạn đã thắng đấu giá!', N'Bạn đã thắng phiên PDG000001 với mức giá 32.500.000đ. Vui lòng thanh toán hóa đơn trong vòng 48 giờ.', 'THANG_DAU_GIA', 1, '2026-11-08 10:05:05'),
(1, 1, N'Phiên đấu giá của bạn đã kết thúc!', N'Sản phẩm MacBook Pro M3 Pro đã được đấu giá thành công với mức giá 32.500.000đ bởi người mua Vũ Đình Mua Ba.', 'THANG_DAU_GIA', 1, '2026-11-08 10:05:05'),
(2, 1, N'Hoàn tiền cọc phiên PDG000001', N'Hệ thống đã hoàn 3.000.000đ tiền cọc phiên PDG000001 vào ví của bạn.', 'HOAN_TIEN_COC', 1, '2026-11-08 10:06:01'),
(3, 1, N'Hoàn tiền cọc phiên PDG000001', N'Hệ thống đã hoàn 3.000.000đ tiền cọc phiên PDG000001 vào ví của bạn.', 'HOAN_TIEN_COC', 1, '2026-11-08 10:06:01');

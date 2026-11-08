-- ============================================================================
-- BÀI TẬP TUẦN 08 · THIẾT KẾ DỮ LIỆU (LT07)
-- HỆ THỐNG QUẢN LÝ LỊCH KHÁM PHÒNG KHÁM AN TÂM (MINI-SRS v1.2 + CR-01)
-- Người thực hiện (Thành viên 1): Lâm Duy Minh - MSSV: 24120091 (Nhóm 04)
-- Hệ quản trị CSDL mục tiêu: Microsoft SQL Server (T-SQL)
-- ============================================================================

-- Xóa các bảng theo thứ tự ngược khóa ngoại nếu đã tồn tại
IF OBJECT_ID('nhat_ky_he_thong', 'U') IS NOT NULL DROP TABLE nhat_ky_he_thong;
IF OBJECT_ID('thong_bao', 'U') IS NOT NULL DROP TABLE thong_bao;
IF OBJECT_ID('giao_dich_hoan_tien', 'U') IS NOT NULL DROP TABLE giao_dich_hoan_tien;
IF OBJECT_ID('giao_dich_thanh_toan', 'U') IS NOT NULL DROP TABLE giao_dich_thanh_toan;
IF OBJECT_ID('lich_hen', 'U') IS NOT NULL DROP TABLE lich_hen;
IF OBJECT_ID('khung_gio_kham', 'U') IS NOT NULL DROP TABLE khung_gio_kham;
IF OBJECT_ID('bac_si', 'U') IS NOT NULL DROP TABLE bac_si;
IF OBJECT_ID('benh_nhan', 'U') IS NOT NULL DROP TABLE benh_nhan;
IF OBJECT_ID('chuyen_khoa', 'U') IS NOT NULL DROP TABLE chuyen_khoa;
IF OBJECT_ID('tai_khoan', 'U') IS NOT NULL DROP TABLE tai_khoan;
IF OBJECT_ID('tham_so', 'U') IS NOT NULL DROP TABLE tham_so;
GO

-- ============================================================================
-- 1. BẢNG tai_khoan (Quản lý xác thực & phân quyền RBAC - FR-13, NFR-03, NFR-04)
-- ============================================================================
CREATE TABLE tai_khoan (
    ma_tai_khoan    INT IDENTITY(1,1) NOT NULL,
    ten_dang_nhap   VARCHAR(50)       NOT NULL,
    mat_khau_bam    VARCHAR(255)      NOT NULL,
    vai_tro         VARCHAR(20)       NOT NULL,
    trang_thai      BIT               NOT NULL CONSTRAINT DF_tai_khoan_trang_thai DEFAULT (1),
    thoi_diem_tao   DATETIME          NOT NULL CONSTRAINT DF_tai_khoan_thoi_diem_tao DEFAULT (GETDATE()),

    CONSTRAINT PK_tai_khoan PRIMARY KEY (ma_tai_khoan),
    CONSTRAINT UQ_tai_khoan_ten_dang_nhap UNIQUE (ten_dang_nhap),
    CONSTRAINT CK_tai_khoan_vai_tro CHECK (vai_tro IN ('quan_ly', 'bac_si', 'tiep_nhan', 'benh_nhan'))
);
GO

-- ============================================================================
-- 2. BẢNG chuyen_khoa (Danh mục chuyên khoa & bảng giá chuẩn - FR-01, FR-12, Q-10)
-- ============================================================================
CREATE TABLE chuyen_khoa (
    ma_chuyen_khoa          INT IDENTITY(1,1) NOT NULL,
    ma_code_khoa            VARCHAR(20)       NOT NULL,
    ten_chuyen_khoa         NVARCHAR(100)     NOT NULL,
    don_gia_kham_tai_cho    DECIMAL(18,0)     NOT NULL,
    don_gia_kham_truc_tuyen DECIMAL(18,0)     NOT NULL,
    mo_ta                   NVARCHAR(255)     NULL,
    trang_thai_hoat_dong    BIT               NOT NULL CONSTRAINT DF_chuyen_khoa_trang_thai DEFAULT (1),

    CONSTRAINT PK_chuyen_khoa PRIMARY KEY (ma_chuyen_khoa),
    CONSTRAINT UQ_chuyen_khoa_code UNIQUE (ma_code_khoa),
    CONSTRAINT UQ_chuyen_khoa_ten UNIQUE (ten_chuyen_khoa),
    CONSTRAINT CK_chuyen_khoa_gia_tai_cho CHECK (don_gia_kham_tai_cho >= 0),
    CONSTRAINT CK_chuyen_khoa_gia_truc_tuyen CHECK (don_gia_kham_truc_tuyen > 0)
);
GO

-- ============================================================================
-- 3. BẢNG benh_nhan (Hồ sơ hành chính bệnh nhân - FR-07, FR-09, ASM-10, ASM-11)
-- ============================================================================
CREATE TABLE benh_nhan (
    ma_benh_nhan     INT IDENTITY(1,1) NOT NULL,
    ma_code_bn       VARCHAR(15)       NOT NULL,
    ma_tai_khoan     INT               NULL,
    ho_ten           NVARCHAR(100)     NOT NULL,
    so_dien_thoai    VARCHAR(10)       NOT NULL,
    ngay_sinh        DATE              NOT NULL,
    gioi_tinh        NVARCHAR(10)      NOT NULL,
    so_cccd          VARCHAR(12)       NULL,
    dia_chi          NVARCHAR(255)     NULL,
    la_benh_nhan_moi BIT               NOT NULL CONSTRAINT DF_benh_nhan_moi DEFAULT (1),
    so_lan_vang_mat  INT               NOT NULL CONSTRAINT DF_benh_nhan_vang_mat DEFAULT (0),

    CONSTRAINT PK_benh_nhan PRIMARY KEY (ma_benh_nhan),
    CONSTRAINT UQ_benh_nhan_code UNIQUE (ma_code_bn),
    CONSTRAINT UQ_benh_nhan_sdt UNIQUE (so_dien_thoai),
    CONSTRAINT FK_benh_nhan_tai_khoan FOREIGN KEY (ma_tai_khoan) REFERENCES tai_khoan(ma_tai_khoan),
    CONSTRAINT CK_benh_nhan_gioi_tinh CHECK (gioi_tinh IN (N'Nam', N'Nữ', N'Khác')),
    CONSTRAINT CK_benh_nhan_vang_mat CHECK (so_lan_vang_mat >= 0)
);
GO

-- ============================================================================
-- 4. BẢNG bac_si (Thông tin 06 bác sĩ của phòng khám - FR-01, FR-02, FR-12)
-- ============================================================================
CREATE TABLE bac_si (
    ma_bac_si           INT IDENTITY(1,1) NOT NULL,
    ma_code_bs          VARCHAR(15)       NOT NULL,
    ma_tai_khoan        INT               NOT NULL,
    ma_chuyen_khoa      INT               NOT NULL,
    ho_ten              NVARCHAR(100)     NOT NULL,
    hoc_vi              NVARCHAR(50)      NULL,
    so_dien_thoai       VARCHAR(10)       NOT NULL,
    phong_kham_so       VARCHAR(20)       NOT NULL,
    trang_thai_lam_viec BIT               NOT NULL CONSTRAINT DF_bac_si_trang_thai DEFAULT (1),

    CONSTRAINT PK_bac_si PRIMARY KEY (ma_bac_si),
    CONSTRAINT UQ_bac_si_code UNIQUE (ma_code_bs),
    CONSTRAINT UQ_bac_si_tai_khoan UNIQUE (ma_tai_khoan),
    CONSTRAINT UQ_bac_si_sdt UNIQUE (so_dien_thoai),
    CONSTRAINT FK_bac_si_tai_khoan FOREIGN KEY (ma_tai_khoan) REFERENCES tai_khoan(ma_tai_khoan),
    CONSTRAINT FK_bac_si_chuyen_khoa FOREIGN KEY (ma_chuyen_khoa) REFERENCES chuyen_khoa(ma_chuyen_khoa)
);
GO

-- ============================================================================
-- 5. BẢNG khung_gio_kham (Lịch làm việc & giữ chỗ theo khung giờ - FR-02, FR-03, FR-12, FR-16)
-- ============================================================================
CREATE TABLE khung_gio_kham (
    ma_khung_gio       INT IDENTITY(1,1) NOT NULL,
    ma_bac_si          INT               NOT NULL,
    ngay_kham          DATE              NOT NULL,
    ca_lam_viec        NVARCHAR(20)      NOT NULL,
    gio_bat_dau        VARCHAR(5)        NOT NULL,
    gio_ket_thuc       VARCHAR(5)        NOT NULL,
    hinh_thuc_mo       NVARCHAR(30)      NOT NULL,
    gioi_han_benh_nhan INT               NOT NULL,
    so_cho_da_dat      INT               NOT NULL CONSTRAINT DF_khung_gio_da_dat DEFAULT (0),
    so_cho_dang_giu    INT               NOT NULL CONSTRAINT DF_khung_gio_dang_giu DEFAULT (0),
    trang_thai_khung   NVARCHAR(30)      NOT NULL CONSTRAINT DF_khung_gio_trang_thai DEFAULT (N'Khả dụng'),
    ly_do_khoa         NVARCHAR(255)     NULL,

    CONSTRAINT PK_khung_gio_kham PRIMARY KEY (ma_khung_gio),
    CONSTRAINT UQ_khung_gio_bac_si UNIQUE (ma_bac_si, ngay_kham, gio_bat_dau),
    CONSTRAINT FK_khung_gio_bac_si FOREIGN KEY (ma_bac_si) REFERENCES bac_si(ma_bac_si),
    CONSTRAINT CK_khung_gio_ca CHECK (ca_lam_viec IN (N'Ca sáng', N'Ca chiều')),
    CONSTRAINT CK_khung_gio_hinh_thuc CHECK (hinh_thuc_mo IN (N'Tại phòng khám', N'Trực tuyến', N'Cả hai')),
    CONSTRAINT CK_khung_gio_gioi_han CHECK (gioi_han_benh_nhan > 0),
    CONSTRAINT CK_khung_gio_so_cho CHECK (so_cho_da_dat >= 0 AND so_cho_dang_giu >= 0 AND (so_cho_da_dat + so_cho_dang_giu <= gioi_han_benh_nhan)),
    CONSTRAINT CK_khung_gio_trang_thai CHECK (trang_thai_khung IN (N'Khả dụng', N'Đã khóa', N'Bác sĩ nghỉ'))
);
GO

-- ============================================================================
-- 6. BẢNG lich_hen (Lượt đặt lịch hẹn khám & trạng thái tiếp nhận - FR-01..FR-16)
-- ============================================================================
CREATE TABLE lich_hen (
    ma_lich_hen             INT IDENTITY(1,1) NOT NULL,
    ma_code_lich            VARCHAR(20)       NOT NULL,
    ma_benh_nhan            INT               NOT NULL,
    ma_khung_gio            INT               NOT NULL,
    hinh_thuc_kham          NVARCHAR(30)      NOT NULL,
    loai_luot_kham          NVARCHAR(20)      NOT NULL CONSTRAINT DF_lich_hen_loai_luot DEFAULT (N'Hẹn trước'),
    ly_do_kham              NVARCHAR(MAX)     NULL,
    don_gia_ap_dung         DECIMAL(18,0)     NOT NULL,
    trang_thai_lich         NVARCHAR(30)      NOT NULL,
    trang_thai_kham         NVARCHAR(30)      NOT NULL CONSTRAINT DF_lich_hen_trang_thai_kham DEFAULT (N'Chưa đến'),
    so_lan_doi              INT               NOT NULL CONSTRAINT DF_lich_hen_so_lan_doi DEFAULT (0),
    thoi_diem_het_han_giu   DATETIME          NULL,
    lien_ket_kham_truc_tuyen VARCHAR(500)     NULL,
    nguoi_tao               INT               NOT NULL,
    thoi_diem_tao           DATETIME          NOT NULL CONSTRAINT DF_lich_hen_tao DEFAULT (GETDATE()),
    thoi_diem_cap_nhat      DATETIME          NOT NULL CONSTRAINT DF_lich_hen_cap_nhat DEFAULT (GETDATE()),

    CONSTRAINT PK_lich_hen PRIMARY KEY (ma_lich_hen),
    CONSTRAINT UQ_lich_hen_code UNIQUE (ma_code_lich),
    CONSTRAINT FK_lich_hen_benh_nhan FOREIGN KEY (ma_benh_nhan) REFERENCES benh_nhan(ma_benh_nhan),
    CONSTRAINT FK_lich_hen_khung_gio FOREIGN KEY (ma_khung_gio) REFERENCES khung_gio_kham(ma_khung_gio),
    CONSTRAINT FK_lich_hen_nguoi_tao FOREIGN KEY (nguoi_tao) REFERENCES tai_khoan(ma_tai_khoan),
    CONSTRAINT CK_lich_hen_hinh_thuc CHECK (hinh_thuc_kham IN (N'Tại phòng khám', N'Trực tuyến')),
    CONSTRAINT CK_lich_hen_loai_luot CHECK (loai_luot_kham IN (N'Hẹn trước', N'Khám gấp')),
    CONSTRAINT CK_lich_hen_don_gia CHECK (don_gia_ap_dung >= 0),
    CONSTRAINT CK_lich_hen_trang_thai_lich CHECK (trang_thai_lich IN (N'Chờ thanh toán', N'Đã xác nhận', N'Bệnh nhân hủy', N'Bác sĩ hủy', N'Hết hạn giữ chỗ')),
    CONSTRAINT CK_lich_hen_trang_thai_kham CHECK (trang_thai_kham IN (N'Chưa đến', N'Đã đến', N'Đến trễ', N'Đang khám', N'Hoàn thành', N'Vắng mặt')),
    CONSTRAINT CK_lich_hen_so_lan_doi CHECK (so_lan_doi >= 0)
);
GO

-- ============================================================================
-- 7. BẢNG giao_dich_thanh_toan (Thanh toán trước khám trực tuyến - FR-15, NFR-07, NFR-08)
-- ============================================================================
CREATE TABLE giao_dich_thanh_toan (
    ma_giao_dich         INT IDENTITY(1,1) NOT NULL,
    ma_gd_cong_tt        VARCHAR(50)       NOT NULL,
    ma_lich_hen          INT               NOT NULL,
    so_tien              DECIMAL(18,0)     NOT NULL,
    phuong_thuc          NVARCHAR(50)      NOT NULL,
    thoi_diem_thanh_toan DATETIME          NOT NULL CONSTRAINT DF_gd_tt_thoi_diem DEFAULT (GETDATE()),
    trang_thai           NVARCHAR(30)      NOT NULL,

    CONSTRAINT PK_giao_dich_thanh_toan PRIMARY KEY (ma_giao_dich),
    CONSTRAINT UQ_gd_tt_ma_cong UNIQUE (ma_gd_cong_tt),
    CONSTRAINT FK_gd_tt_lich_hen FOREIGN KEY (ma_lich_hen) REFERENCES lich_hen(ma_lich_hen),
    CONSTRAINT CK_gd_tt_so_tien CHECK (so_tien > 0),
    CONSTRAINT CK_gd_tt_phuong_thuc CHECK (phuong_thuc IN (N'Chuyển khoản QR', N'Ví điện tử', N'Thẻ nội địa', N'Thẻ quốc tế')),
    CONSTRAINT CK_gd_tt_trang_thai CHECK (trang_thai IN (N'Đang chờ', N'Thành công', N'Thất bại', N'Chờ chính sách'))
);
GO

-- ============================================================================
-- 8. BẢNG giao_dich_hoan_tien (Hoàn tiền khi bác sĩ hủy lịch - FR-17, FR-19, NFR-08)
-- ============================================================================
CREATE TABLE giao_dich_hoan_tien (
    ma_hoan_tien        INT IDENTITY(1,1) NOT NULL,
    ma_gd_hoan_cong_tt  VARCHAR(50)       NULL,
    ma_giao_dich_goc    INT               NOT NULL,
    so_tien_hoan        DECIMAL(18,0)     NOT NULL,
    ly_do_hoan          NVARCHAR(255)     NOT NULL,
    thoi_diem_yeu_cau   DATETIME          NOT NULL CONSTRAINT DF_gd_hoan_yeu_cau DEFAULT (GETDATE()),
    thoi_diem_hoan_tat  DATETIME          NULL,
    trang_thai          NVARCHAR(30)      NOT NULL,

    CONSTRAINT PK_giao_dich_hoan_tien PRIMARY KEY (ma_hoan_tien),
    CONSTRAINT UQ_gd_hoan_goc UNIQUE (ma_giao_dich_goc), -- Chống hoàn tiền trùng 2 lần (NFR-08)
    CONSTRAINT FK_gd_hoan_gd_goc FOREIGN KEY (ma_giao_dich_goc) REFERENCES giao_dich_thanh_toan(ma_giao_dich),
    CONSTRAINT CK_gd_hoan_so_tien CHECK (so_tien_hoan > 0),
    CONSTRAINT CK_gd_hoan_trang_thai CHECK (trang_thai IN (N'Đang chờ hoàn', N'Hoàn thành công', N'Hoàn lỗi'))
);
GO

-- ============================================================================
-- 9. BẢNG thong_bao (Lịch sử thông báo bệnh nhân - FR-04, FR-18, SC-04 4a)
-- ============================================================================
CREATE TABLE thong_bao (
    ma_thong_bao    INT IDENTITY(1,1) NOT NULL,
    ma_lich_hen     INT               NOT NULL,
    ma_benh_nhan    INT               NOT NULL,
    loai_thong_bao  NVARCHAR(40)      NOT NULL,
    kenh_gui        VARCHAR(20)       NOT NULL,
    noi_dung        NVARCHAR(MAX)     NOT NULL,
    trang_thai_gui  NVARCHAR(30)      NOT NULL,
    thoi_diem_gui   DATETIME          NOT NULL CONSTRAINT DF_thong_bao_thoi_diem DEFAULT (GETDATE()),

    CONSTRAINT PK_thong_bao PRIMARY KEY (ma_thong_bao),
    CONSTRAINT FK_thong_bao_lich_hen FOREIGN KEY (ma_lich_hen) REFERENCES lich_hen(ma_lich_hen),
    CONSTRAINT FK_thong_bao_benh_nhan FOREIGN KEY (ma_benh_nhan) REFERENCES benh_nhan(ma_benh_nhan),
    CONSTRAINT CK_thong_bao_loai CHECK (loai_thong_bao IN (N'Xác nhận đặt lịch', N'Xác nhận đổi lịch', N'Hủy lịch bởi bệnh nhân', N'Bác sĩ hủy & Hoàn tiền', N'Nhắc lịch khám')),
    CONSTRAINT CK_thong_bao_kenh CHECK (kenh_gui IN ('SMS', 'Email', 'Zalo')),
    CONSTRAINT CK_thong_bao_trang_thai CHECK (trang_thai_gui IN (N'Đang chờ gửi', N'Đã gửi', N'Gửi lỗi'))
);
GO

-- ============================================================================
-- 10. BẢNG nhat_ky_he_thong (Audit log lưu vết - FR-08, FR-10, NFR-04, NFR-09)
-- ============================================================================
CREATE TABLE nhat_ky_he_thong (
    ma_nhat_ky       INT IDENTITY(1,1) NOT NULL,
    loai_doi_tuong   NVARCHAR(30)      NOT NULL,
    ma_doi_tuong     VARCHAR(50)       NOT NULL,
    hanh_dong        NVARCHAR(100)     NOT NULL,
    trang_thai_truoc NVARCHAR(50)      NULL,
    trang_thai_sau   NVARCHAR(50)      NULL,
    nguoi_thuc_hien  INT               NULL,
    dia_chi_ip       VARCHAR(45)       NULL,
    thoi_diem        DATETIME          NOT NULL CONSTRAINT DF_nhat_ky_thoi_diem DEFAULT (GETDATE()),

    CONSTRAINT PK_nhat_ky_he_thong PRIMARY KEY (ma_nhat_ky),
    CONSTRAINT FK_nhat_ky_tai_khoan FOREIGN KEY (nguoi_thuc_hien) REFERENCES tai_khoan(ma_tai_khoan),
    CONSTRAINT CK_nhat_ky_loai CHECK (loai_doi_tuong IN (N'Lịch hẹn', N'Giao dịch thanh toán', N'Giao dịch hoàn tiền', N'Khung giờ khám', N'Truy cập trái phép'))
);
GO

-- ============================================================================
-- 11. BẢNG tham_so (Lưu các quy định dạng con số động - ASM-02, ASM-12, Q-01..Q-11)
-- ============================================================================
CREATE TABLE tham_so (
    ma_tham_so     VARCHAR(50)   NOT NULL,
    ten_tham_so    NVARCHAR(150) NOT NULL,
    gia_tri        DECIMAL(18,0) NOT NULL,
    don_vi_tinh    NVARCHAR(30)  NOT NULL,
    mo_ta_quy_dinh NVARCHAR(255) NOT NULL,
    ngay_cap_nhat  DATETIME      NOT NULL CONSTRAINT DF_tham_so_cap_nhat DEFAULT (GETDATE()),

    CONSTRAINT PK_tham_so PRIMARY KEY (ma_tham_so),
    CONSTRAINT CK_tham_so_gia_tri CHECK (gia_tri >= 0)
);
GO

-- ============================================================================
-- DỮ LIỆU MẪU (5 - 10 DÒNG MỖI BẢNG ĐỂ THÀNH VIÊN 3 DÙNG VẼ WIREFRAME LEVEL 4)
-- ============================================================================

-- 1. Dữ liệu mẫu bảng tham_so (7 quy định động)
INSERT INTO tham_so (ma_tham_so, ten_tham_so, gia_tri, don_vi_tinh, mo_ta_quy_dinh) VALUES
('THOI_LUONG_KHUNG_GIO_PHUT', N'Thời lượng tiêu chuẩn 1 khung giờ khám', 20, N'Phút', N'ASM-12, Q-01: Mỗi khung giờ khám kéo dài 20 phút'),
('SO_BN_TOI_DA_MOI_KHUNG', N'Số bệnh nhân tối đa mặc định mỗi khung giờ', 3, N'Bệnh nhân', N'FR-03, ASM-02: Giới hạn mặc định khi tạo khung giờ mới'),
('THOI_GIAN_GIU_CHO_PHUT', N'Thời gian giữ chỗ chờ thanh toán trực tuyến', 10, N'Phút', N'FR-16, Q-11: Sau 10 phút chưa thanh toán sẽ tự động nhả chỗ'),
('HAN_CHOT_DOI_HUY_GIO', N'Hạn chót cho phép đổi hoặc hủy lịch trước giờ hẹn', 4, N'Giờ', N'FR-05, FR-06, Q-03: Bệnh nhân chỉ được tự đổi/hủy trước giờ khám tối thiểu 4 giờ'),
('SO_LAN_DOI_TOI_DA', N'Số lần được phép đổi lịch tối đa cho 1 lịch hẹn', 2, N'Lần', N'FR-05, Q-03: Mỗi mã lịch hẹn chỉ được đổi tối đa 2 lần'),
('NGUONG_TRE_HEN_TOI_DA_PHUT', N'Thời gian đến trễ tối đa trước khi chuyển cuối ca', 15, N'Phút', N'FR-10, Q-04: Quá 15 phút tính từ giờ hẹn sẽ ghi nhận Đến trễ'),
('SO_LAN_VANG_MAT_CANH_BAO', N'Ngưỡng số lần vắng mặt (No-show) cảnh báo tiếp nhận', 2, N'Lần', N'Q-04, Q-EX02: Hiển thị cảnh báo đỏ trên màn hình Level 4 khi bệnh nhân vắng mặt >= 2 lần');

-- 2. Dữ liệu mẫu bảng tai_khoan (12 tài khoản: 1 Quản lý, 6 Bác sĩ, 2 Tiếp nhận, 3 Bệnh nhân)
INSERT INTO tai_khoan (ten_dang_nhap, mat_khau_bam, vai_tro, trang_thai) VALUES
('ql_antam',    '$2b$12$K8p9TxR1mQ2wS3eD4fG5hO6jK7lZ8xC9vB0nM1qW2eR3tY4uI5oP6', 'quan_ly',   1), -- ID 1
('bs_minhtriet','$2b$12$A1b2C3d4E5f6G7h8I9j0K1l2M3n4O5p6Q7r8S9t0U1v2W3x4Y5z6A', 'bac_si',    1), -- ID 2
('bs_thuhang',  '$2b$12$B2c3D4e5F6g7H8i9J0k1L2m3N4o5P6q7R8s9T0u1V2w3X4y5Z6a7B', 'bac_si',    1), -- ID 3
('bs_hoangnam', '$2b$12$C3d4E5f6G7h8I9j0K1l2M3n4O5p6Q7r8S9t0U1v2W3x4Y5z6A7b8C', 'bac_si',    1), -- ID 4
('bs_lananh',   '$2b$12$D4e5F6g7H8i9J0k1L2m3N4o5P6q7R8s9T0u1V2w3X4y5Z6a7B8c9D', 'bac_si',    1), -- ID 5
('bs_quocbao',  '$2b$12$E5f6G7h8I9j0K1l2M3n4O5p6Q7r8S9t0U1v2W3x4Y5z6A7b8C9d0E', 'bac_si',    1), -- ID 6
('bs_kimlien',  '$2b$12$F6g7H8i9J0k1L2m3N4o5P6q7R8s9T0u1V2w3X4y5Z6a7B8c9D0e1F', 'bac_si',    1), -- ID 7
('tn_ngocmai',  '$2b$12$G7h8I9j0K1l2M3n4O5p6Q7r8S9t0U1v2W3x4Y5z6A7b8C9d0E1f2G', 'tiep_nhan', 1), -- ID 8
('tn_thanhson', '$2b$12$H8i9J0k1L2m3N4o5P6q7R8s9T0u1V2w3X4y5Z6a7B8c9D0e1F2g3H', 'tiep_nhan', 1), -- ID 9
('0901234567',  '$2b$12$I9j0K1l2M3n4O5p6Q7r8S9t0U1v2W3x4Y5z6A7b8C9d0E1f2G3h4I', 'benh_nhan', 1), -- ID 10
('0912345678',  '$2b$12$J0k1L2m3N4o5P6q7R8s9T0u1V2w3X4y5Z6a7B8c9D0e1F2g3H4i5J', 'benh_nhan', 1), -- ID 11
('0987654321',  '$2b$12$K1l2M3n4O5p6Q7r8S9t0U1v2W3x4Y5z6A7b8C9d0E1f2G3h4I5j6K', 'benh_nhan', 1); -- ID 12

-- 3. Dữ liệu mẫu bảng chuyen_khoa (6 chuyên khoa)
INSERT INTO chuyen_khoa (ma_code_khoa, ten_chuyen_khoa, don_gia_kham_tai_cho, don_gia_kham_truc_tuyen, mo_ta, trang_thai_hoat_dong) VALUES
('NOI', N'Nội tổng quát',     150000, 120000, N'Khám và tư vấn các bệnh lý nội khoa tổng quát, tiêu hóa, hô hấp', 1),
('TIM', N'Tim mạch',          200000, 180000, N'Khám tăng huyết áp, bệnh mạch vành, rối loạn nhịp tim', 1),
('NHI', N'Nhi khoa',          150000, 130000, N'Khám bệnh lý trẻ em và tư vấn dinh dưỡng, phát triển thể chất', 1),
('TMH', N'Tai - Mũi - Họng',  160000, 140000, N'Khám viêm xoang, viêm họng, viêm tai giữa và dị ứng đường hô hấp', 1),
('DL',  N'Da liễu',           170000, 150000, N'Khám và tư vấn điều trị bệnh lý da liễu, dị ứng cơ địa', 1),
('SAN', N'Sản - Phụ khoa',    200000, 180000, N'Khám thai định kỳ và tư vấn chăm sóc sức khỏe phụ nữ', 1);

-- 4. Dữ liệu mẫu bảng bac_si (06 bác sĩ ứng với 6 chuyên khoa như mô tả Case Study)
INSERT INTO bac_si (ma_code_bs, ma_tai_khoan, ma_chuyen_khoa, ho_ten, hoc_vi, so_dien_thoai, phong_kham_so, trang_thai_lam_viec) VALUES
('BS001', 2, 1, N'Nguyễn Minh Triết', N'BS.CKII', '0909111001', 'P.101', 1),
('BS002', 3, 2, N'Trần Thị Thu Hằng', N'ThS.BS',  '0909111002', 'P.102', 1),
('BS003', 4, 3, N'Lê Hoàng Nam',      N'BS.CKI',  '0909111003', 'P.103', 1),
('BS004', 5, 4, N'Phạm Lan Anh',      N'BS.CKI',  '0909111004', 'P.201', 1),
('BS005', 6, 5, N'Võ Quốc Bảo',       N'ThS.BS',  '0909111005', 'P.202', 1),
('BS006', 7, 6, N'Đặng Thị Kim Liên', N'BS.CKII', '0909111006', 'P.203', 1);

-- 5. Dữ liệu mẫu bảng benh_nhan (6 bệnh nhân: có BN cũ, BN mới, BN đặt qua ĐT không có tài khoản, BN hay vắng mặt)
INSERT INTO benh_nhan (ma_code_bn, ma_tai_khoan, ho_ten, so_dien_thoai, ngay_sinh, gioi_tinh, so_cccd, dia_chi, la_benh_nhan_moi, so_lan_vang_mat) VALUES
('BN0001', 10,   N'Nguyễn Văn An',     '0901234567', '1988-05-14', N'Nam', '079088001234', N'123 Nguyễn Văn Cừ, Quận 5, TP.HCM', 0, 0),
('BN0002', 11,   N'Lê Thị Bích Ngọc',  '0912345678', '1995-10-22', N'Nữ',  '079195005678', N'45 Lê Lợi, Quận 1, TP.HCM', 1, 0),
('BN0003', 12,   N'Trần Quốc Tuấn',    '0987654321', '1979-02-08', N'Nam', '079079009876', N'88 Trần Hưng Đạo, Quận 1, TP.HCM', 0, 2), -- Cảnh báo vắng mặt 2 lần
('BN0004', NULL, N'Phạm Thị Mai Hương','0933445566', '1965-12-01', N'Nữ',  NULL,           N'12 Hùng Vương, Quận 10, TP.HCM', 1, 0), -- Đặt qua ĐT nhờ Tiếp nhận
('BN0005', NULL, N'Hoàng Minh Khôi',   '0944556677', '2018-07-19', N'Nam', NULL,           N'210 Lý Thường Kiệt, Quận 10, TP.HCM', 0, 0),
('BN0006', NULL, N'Vũ Thị Thanh Tâm',  '0977889900', '1992-03-30', N'Nữ',  '079192003344', N'56 Nguyễn Trãi, Quận 5, TP.HCM', 1, 1);

-- 6. Dữ liệu mẫu bảng khung_gio_kham (8 khung giờ: đủ trạng thái Còn chỗ, Đầy chỗ, Đang giữ chỗ, Bác sĩ nghỉ)
INSERT INTO khung_gio_kham (ma_bac_si, ngay_kham, ca_lam_viec, gio_bat_dau, gio_ket_thuc, hinh_thuc_mo, gioi_han_benh_nhan, so_cho_da_dat, so_cho_dang_giu, trang_thai_khung, ly_do_khoa) VALUES
(1, '2026-11-10', N'Ca sáng',  '08:00', '08:20', N'Cả hai',         3, 2, 0, N'Khả dụng',    NULL), -- Còn 1 chỗ trống
(1, '2026-11-10', N'Ca sáng',  '08:20', '08:40', N'Cả hai',         3, 3, 0, N'Khả dụng',    NULL), -- Đã đầy (3/3)
(1, '2026-11-10', N'Ca sáng',  '08:40', '09:00', N'Trực tuyến',     2, 1, 1, N'Khả dụng',    NULL), -- 1 đã đặt + 1 đang giữ chỗ = hết chỗ tạm thời
(2, '2026-11-10', N'Ca sáng',  '08:00', '08:20', N'Tại phòng khám', 3, 1, 0, N'Khả dụng',    NULL),
(2, '2026-11-10', N'Ca sáng',  '08:20', '08:40', N'Trực tuyến',     2, 1, 0, N'Khả dụng',    NULL),
(3, '2026-11-10', N'Ca sáng',  '08:00', '08:20', N'Tại phòng khám', 3, 1, 0, N'Khả dụng',    NULL),
(4, '2026-11-10', N'Ca chiều', '13:30', '13:50', N'Cả hai',         3, 0, 0, N'Bác sĩ nghỉ', N'BS. Lan Anh báo nghỉ đột xuất do công tác bệnh viện tuyến trên'),
(5, '2026-11-10', N'Ca chiều', '14:00', '14:20', N'Trực tuyến',     2, 1, 0, N'Khả dụng',    NULL);

-- 7. Dữ liệu mẫu bảng lich_hen (8 lịch hẹn bao phủ mọi kịch bản SC-01..SC-04 và CR-01)
INSERT INTO lich_hen (ma_code_lich, ma_benh_nhan, ma_khung_gio, hinh_thuc_kham, loai_luot_kham, ly_do_kham, don_gia_ap_dung, trang_thai_lich, trang_thai_kham, so_lan_doi, thoi_diem_het_han_giu, lien_ket_kham_truc_tuyen, nguoi_tao, thoi_diem_tao) VALUES
('LH20261110-001', 1, 1, N'Tại phòng khám', N'Hẹn trước', N'Đau thượng vị âm ỉ 3 ngày, ợ chua',        150000, N'Đã xác nhận',    N'Đã đến',     0, NULL,                  NULL,                                       10, '2026-11-09 09:15:00'),
('LH20261110-002', 2, 1, N'Trực tuyến',     N'Hẹn trước', N'Tư vấn kết quả xét nghiệm máu tổng quát', 120000, N'Đã xác nhận',    N'Chưa đến',   1, NULL,                  'https://meet.antamclinic.vn/LH20261110-002', 11, '2026-11-09 10:20:00'),
('LH20261110-003', 3, 3, N'Trực tuyến',     N'Hẹn trước', N'Ho khan kéo dài sau cảm cúm',              120000, N'Chờ thanh toán', N'Chưa đến',   0, '2026-11-10 07:55:00', NULL,                                       12, '2026-11-10 07:45:00'), -- Đang giữ chỗ
('LH20261110-004', 4, 4, N'Tại phòng khám', N'Hẹn trước', N'Tăng huyết áp, chóng mặt buổi sáng',       200000, N'Đã xác nhận',    N'Đang khám',  0, NULL,                  NULL,                                       8,  '2026-11-09 14:00:00'), -- NV Tiếp nhận đặt hộ
('LH20261110-005', 5, 6, N'Tại phòng khám', N'Khám gấp',  N'Trẻ sốt cao 39.5 độ C, quấy khóc',         150000, N'Đã xác nhận',    N'Đang khám',  0, NULL,                  NULL,                                       8,  '2026-11-10 08:02:00'), -- Ca khám gấp
('LH20261110-006', 6, 5, N'Trực tuyến',     N'Hẹn trước', N'Tư vấn điều chỉnh thuốc huyết áp',         180000, N'Bệnh nhân hủy',  N'Chưa đến',   0, NULL,                  NULL,                                       9,  '2026-11-08 16:30:00'), -- BN tự hủy lịch đã trả tiền
('LH20261110-007', 1, 7, N'Trực tuyến',     N'Hẹn trước', N'Viêm mũi dị ứng tái phát khi đổi thời tiết',140000, N'Bác sĩ hủy',     N'Chưa đến',   0, NULL,                  NULL,                                       10, '2026-11-08 11:00:00'), -- BS nghỉ đột xuất -> hoàn tiền
('LH20261110-008', 2, 7, N'Trực tuyến',     N'Hẹn trước', N'Đau họng, khàn tiếng kéo dài 1 tuần',      140000, N'Bác sĩ hủy',     N'Chưa đến',   0, NULL,                  NULL,                                       11, '2026-11-08 15:10:00'); -- BS nghỉ đột xuất -> hoàn tiền lỗi

-- 8. Dữ liệu mẫu bảng giao_dich_thanh_toan (5 giao dịch cho các lịch trực tuyến)
INSERT INTO giao_dich_thanh_toan (ma_gd_cong_tt, ma_lich_hen, so_tien, phuong_thuc, thoi_diem_thanh_toan, trang_thai) VALUES
('VNPAY-20261109-8801', 2, 120000, N'Chuyển khoản QR', '2026-11-09 10:22:15', N'Thành công'),
('MOMO-20261110-8802',  3, 120000, N'Ví điện tử',      '2026-11-10 07:45:30', N'Đang chờ'),
('VNPAY-20261108-8803', 6, 180000, N'Thẻ nội địa',     '2026-11-08 16:33:10', N'Chờ chính sách'), -- Do BN tự hủy (FR-06, ASM-17)
('VNPAY-20261108-8804', 7, 140000, N'Chuyển khoản QR', '2026-11-08 11:03:45', N'Thành công'),
('ZALOPAY-20261108-8805',8, 140000, N'Ví điện tử',     '2026-11-08 15:12:00', N'Thành công');

-- 9. Dữ liệu mẫu bảng giao_dich_hoan_tien (2 giao dịch hoàn tiền do Bác sĩ nghỉ đột xuất ở lịch 7 và 8)
INSERT INTO giao_dich_hoan_tien (ma_gd_hoan_cong_tt, ma_giao_dich_goc, so_tien_hoan, ly_do_hoan, thoi_diem_yeu_cau, thoi_diem_hoan_tat, trang_thai) VALUES
('REF-VNPAY-9901', 4, 140000, N'Bác sĩ Phạm Lan Anh nghỉ đột xuất ca chiều 10/11/2026', '2026-11-10 07:30:00', '2026-11-10 07:30:12', N'Hoàn thành công'),
(NULL,             5, 140000, N'Bác sĩ Phạm Lan Anh nghỉ đột xuất ca chiều 10/11/2026', '2026-11-10 07:30:00', '2026-11-10 07:30:15', N'Hoàn lỗi'); -- Phục vụ bộ lọc FR-19

-- 10. Dữ liệu mẫu bảng thong_bao (6 bản ghi thông báo, có cả Đã gửi và Gửi lỗi phục vụ SC-04 4a)
INSERT INTO thong_bao (ma_lich_hen, ma_benh_nhan, loai_thong_bao, kenh_gui, noi_dung, trang_thai_gui, thoi_diem_gui) VALUES
(1, 1, N'Xác nhận đặt lịch',      'SMS',   N'Phòng khám An Tâm: Xác nhận lịch hẹn LH20261110-001 với BS.CKII Nguyễn Minh Triết (Nội tổng quát) lúc 08:00 ngày 10/11/2026 tại P.101.', N'Đã gửi', '2026-11-09 09:15:05'),
(2, 2, N'Xác nhận đặt lịch',      'Zalo',  N'Phòng khám An Tâm: Xác nhận lịch khám trực tuyến LH20261110-002 lúc 08:00 10/11/2026. Đã thanh toán: 120.000đ.', N'Đã gửi', '2026-11-09 10:22:20'),
(4, 4, N'Xác nhận đặt lịch',      'SMS',   N'Phòng khám An Tâm: Xác nhận lịch hẹn LH20261110-004 với ThS.BS Trần Thị Thu Hằng (Tim mạch) lúc 08:00 ngày 10/11/2026 tại P.102.', N'Đã gửi', '2026-11-09 14:00:10'),
(6, 6, N'Hủy lịch bởi bệnh nhân', 'SMS',   N'Phòng khám An Tâm: Lịch hẹn trực tuyến LH20261110-006 đã được hủy theo yêu cầu. Khoản thanh toán 180.000đ đang ở trạng thái chờ chính sách.', N'Đã gửi', '2026-11-09 18:00:00'),
(7, 1, N'Bác sĩ hủy & Hoàn tiền', 'SMS',   N'Phòng khám An Tâm cáo lỗi: Lịch LH20261110-007 (13:30 10/11/2026) bị hủy do BS. Lan Anh nghỉ đột xuất. Đã hoàn 140.000đ về tài khoản ban đầu.', N'Đã gửi', '2026-11-10 07:30:20'),
(8, 2, N'Bác sĩ hủy & Hoàn tiền', 'SMS',   N'Phòng khám An Tâm cáo lỗi: Lịch LH20261110-008 (13:30 10/11/2026) bị hủy do BS. Lan Anh nghỉ đột xuất. Khoản hoàn 140.000đ đang được xử lý.', N'Gửi lỗi', '2026-11-10 07:30:25');

-- 11. Dữ liệu mẫu bảng nhat_ky_he_thong (6 bản ghi kiểm toán NFR-04, NFR-09)
INSERT INTO nhat_ky_he_thong (loai_doi_tuong, ma_doi_tuong, hanh_dong, trang_thai_truoc, trang_thai_sau, nguoi_thuc_hien, dia_chi_ip, thoi_diem) VALUES
(N'Lịch hẹn',             'LH20261110-001', N'Bệnh nhân tự đặt lịch tại phòng khám', NULL,               N'Đã xác nhận',    10,   '113.161.72.10', '2026-11-09 09:15:00'),
(N'Lịch hẹn',             'LH20261110-002', N'Thanh toán trực tuyến thành công',     N'Chờ thanh toán',  N'Đã xác nhận',    NULL, '103.22.14.88',  '2026-11-09 10:22:15'),
(N'Lịch hẹn',             'LH20261110-004', N'Nhân viên tiếp nhận đặt lịch hộ',      NULL,               N'Đã xác nhận',    8,    '192.168.1.25',  '2026-11-09 14:00:00'),
(N'Lịch hẹn',             'LH20261110-001', N'Cập nhật trạng thái tiếp nhận',        N'Chưa đến',        N'Đã đến',         8,    '192.168.1.25',  '2026-11-10 07:50:00'),
(N'Giao dịch hoàn tiền',  'REF-VNPAY-9901', N'Hoàn tiền tự động khi bác sĩ nghỉ',    N'Đang chờ hoàn',   N'Hoàn thành công',8,    '192.168.1.25',  '2026-11-10 07:30:12'),
(N'Truy cập trái phép',   '/api/giao-dich', N'Từ chối truy cập danh sách giao dịch', NULL,               N'HTTP 403 Forbidden', 2,'192.168.1.40',  '2026-11-10 08:10:00');
GO


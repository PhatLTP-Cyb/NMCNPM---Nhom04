# App Đặt lịch – Hủy lịch khám, Phòng khám An Tâm (BT09 · Nhóm 04)

Bản app phục vụ bài tập kiểm thử chức năng. Đặc tả: `../BT09_Nhom04_DacTa_DatHuyLich.md` (v1.0). Test case: `../BT09_Nhom04_TestCase.md`.

## Yêu cầu

- **Node.js 22.13 trở lên** (đã chạy với Node 24.15). Không cần `npm install`: app chỉ dùng module có sẵn của Node (`node:http`, `node:sqlite`).

## Chạy app

```bash
cd app
npm start
```

Mở http://localhost:3000. Lần chạy đầu, app tự tạo cơ sở dữ liệu `app/data/phongkham.db` với dữ liệu mẫu. Đổi cổng: đặt biến môi trường `PORT` (PowerShell: `$env:PORT=3001; npm start`).

## Xác định phiên bản đã kiểm thử

- Phiên bản app hiển thị ở góc phải trên **mọi màn hình** và trên trang *Trạng thái dữ liệu*; lấy từ trường `version` trong `package.json`.
- Khi sửa lỗi: tăng `version` (ví dụ 1.0.0 → 1.0.1), ghi vào bảng lịch sử bên dưới, commit, rồi mới chạy lại test. Ghi đúng phiên bản vào bảng kết quả và clip.

| Phiên bản | Ngày | Thay đổi |
|---|---|---|
| 1.0.0 | 10/11/2026 | Bản đầu tiên theo Đặc tả v1.0 |

## Reset dữ liệu mẫu

Chọn một trong hai cách (kết quả như nhau):

- Trên app: *Trạng thái dữ liệu* → **Reset dữ liệu mẫu**.
- Dòng lệnh (khi app đang tắt hoặc đang chạy đều được): `npm run reset`.

Sau reset: đồng hồ hệ thống 16/11/2026 08:00; 6 bác sĩ, 3 bệnh nhân, 4 lịch hẹn, 5 thông báo. Chi tiết ở mục 7 của đặc tả.

## Đồng hồ hệ thống giả lập

Mọi quy tắc thời gian (đặt trước 24 giờ – 14 ngày, hủy trước 24 giờ) dùng đồng hồ của app, **không dùng giờ máy**. Đổi ở *Trạng thái dữ liệu* → **Đồng hồ hệ thống** → **Đặt đồng hồ**; **Về mặc định** đưa về 16/11/2026 08:00.

## OTP

OTP được giả lập, mã cố định **123456**, hiển thị trên màn hình sau khi bấm **Gửi OTP**.

## Màn hình

| Màn hình | Đường dẫn | Dùng cho |
|---|---|---|
| Đặt lịch khám | `/dat-lich.html` | CN-1 |
| Lịch hẹn của tôi | `/lich-cua-toi.html` | CN-2 (xem và hủy lịch) |
| Danh sách lịch bác sĩ | `/bac-si.html` | Kiểm tra hậu điều kiện FR-09 |
| Nhật ký thông báo | `/thong-bao.html` | Kiểm tra hậu điều kiện FR-04 |
| Trạng thái dữ liệu | `/trang-thai.html` | Phiên bản, đồng hồ, reset, bảng dữ liệu, đối chiếu số chỗ |

## Kiểm thử đặt đồng thời (TC-D09)

Khi app đang chạy, mở một cửa sổ dòng lệnh khác:

```bash
cd app
npm run dong-thoi
```

Script gửi cùng lúc 2 yêu cầu đặt khung BS Vũ Ngọc Lan 20/11/2026 09:00 và in kết quả từng yêu cầu.

## Cấu trúc mã nguồn

| File | Nội dung |
|---|---|
| `server.js` | Máy chủ HTTP, các API, phục vụ trang tĩnh |
| `nghiep-vu.js` | Quy tắc nghiệp vụ đặt/hủy lịch (ghi mã BR-xx theo đặc tả) |
| `db.js` | Kết nối SQLite, lược đồ bảng |
| `seed.js` | Dữ liệu mẫu, reset |
| `public/` | Giao diện (HTML/CSS/JS thuần) |
| `tools/dong-thoi.js` | Script cho TC-D09 |

# BT09 · Test report – Đặt lịch và Hủy lịch khám, Phòng khám An Tâm

Nhóm 04 · Lớp 24_3 · Ngày lập: ……/……/2026

> **Mẫu để nhóm điền** sau khi tự chạy test. Mọi số liệu phải khớp bảng "Kết quả từng lần chạy" trong `BT09_Nhom04_TestCase.md`. Không bỏ ca bị chặn hoặc chưa chạy.

## 1. Phạm vi

| Mục | Nội dung |
|---|---|
| Chức năng kiểm thử | CN-1 Đặt lịch khám, CN-2 Hủy lịch khám (chỉ hình thức tại phòng khám) |
| Đặc tả căn cứ | `BT09_Nhom04_DacTa_DatHuyLich.md` phiên bản 1.0 (trích Mini-SRS BT04 v1.2) |
| Yêu cầu | FR-01, FR-02, FR-03, FR-04, FR-06, FR-07, FR-09, FR-14 (phần bệnh nhân); SC-01, SC-02, SC-03 (luồng hủy); BR-01…BR-10 |
| Điểm đã làm rõ so với Mini-SRS | Q-01 (20 phút, 1 bệnh nhân/khung), Q-03 (hủy trước ≥ 24 giờ), Q-05 (trường bắt buộc, nhận bệnh nhân cũ theo SĐT), Q-07 (chỉ ghi nhận thông báo), thêm BR-02, BR-04 – xem mục 6 đặc tả |
| Ngoài phạm vi | Khám trực tuyến, thanh toán, hoàn tiền (CR-01); đổi lịch; nhân viên đặt/hủy thay; đăng nhập, phân quyền; yêu cầu phi chức năng |

## 2. Phiên bản và môi trường

| Lần chạy | Phiên bản app | Commit | Môi trường (HĐH, trình duyệt, Node) | Ngày | Người thực hiện |
|---|---|---|---|---|---|
| 1 | 1.0.0 | | | | |
| 2 (sau sửa lỗi, nếu có) | | | | | |

## 3. Tổng hợp kết quả

| Phiên bản | Tổng số ca | Đạt | Không đạt | Bị chặn | Chưa chạy |
|---|---|---|---|---|---|
| 1.0.0 | 24 | | | | |
| | 24 | | | | |

Theo nhóm:

| Nhóm test case | Số ca | Đạt | Không đạt | Bị chặn | Chưa chạy |
|---|---|---|---|---|---|
| CN-1 Đặt lịch (TC-D01…D14) | 14 | | | | |
| CN-2 Hủy lịch (TC-H01…H07) | 7 | | | | |
| Liên quan cả hai (TC-LQ01…LQ03) | 3 | | | | |

## 4. Danh sách lỗi

| Mã lỗi | Tiêu đề | Test case | Phân loại (triển khai / đặc tả) | Mức độ | Tình trạng | Sửa ở phiên bản | Kết quả kiểm tra lại |
|---|---|---|---|---|---|---|---|
| | | | | | | | |

*(Nếu không phát hiện lỗi: ghi "Không phát hiện lỗi trong phạm vi đã kiểm tra" và nêu rõ ở mục 6 phần nào chưa đủ bằng chứng.)*

## 5. Kiểm tra lại sau sửa lỗi

| Mã lỗi | Ca chạy lại | Ca có thể bị ảnh hưởng được chạy lại | Phiên bản mới | Kết quả |
|---|---|---|---|---|
| | | | | |

## 6. Giới hạn của kết luận

- **TC-D09 (đồng thời):** chỉ kiểm tra 2 yêu cầu song song bằng script; không kiểm tra tải cao hơn (NFR-02 ngoài phạm vi).
- **Thông báo (FR-04):** chỉ kiểm tra bản ghi thông báo, không kiểm tra việc gửi thật qua SMS/email.
- **OTP:** giả lập mã cố định; chưa kiểm tra OTP thật, hết hạn OTP, gửi lại OTP.
- **Bảo mật:** chưa kiểm tra gọi API trực tiếp bằng công cụ ngoài giao diện (ví dụ hủy lịch người khác khi biết mã lịch và SĐT).
- **Dữ liệu biên chưa có ca riêng:** họ tên dài hơn 100 ký tự, lý do khám dài hơn 500 ký tự, bác sĩ nghỉ một ca.
- Các ca đạt chỉ cho thấy app đáp ứng **đặc tả v1.0**; không tự chứng minh app đáp ứng đầy đủ nhu cầu thực tế của phòng khám (các giả định ASM-18…ASM-23 chưa được stakeholder xác nhận).
- *(Nhóm bổ sung các ca bị chặn / chưa chạy và lý do.)*

## 7. Minh chứng

| Clip | Link (đã kiểm tra quyền truy cập) | Test case và mốc thời gian | Phiên bản app |
|---|---|---|---|
| | | TC-D01 @ … ; TC-H01 @ … ; TC-H03 @ … ; TC-LQ01 @ … | |

## 8. Sử dụng agent

| Phần việc | Agent hỗ trợ | Nhóm kiểm tra đầu ra bằng cách |
|---|---|---|
| Đặc tả | Trích FR/SC từ Mini-SRS, đề xuất giả định cho câu hỏi mở | Nhóm chọn giá trị cho từng câu hỏi mở (24 giờ, 1 bệnh nhân/khung, SĐT + OTP…); đối chiếu từng mục với Mini-SRS v1.2 |
| Test case | Soạn test case từ đặc tả | *(nhóm điền: ví dụ rà từng kết quả mong đợi có căn cứ BR/FR, tự chạy thử, sửa bước chưa rõ)* |
| Mã nguồn app | Viết app Node.js + SQLite | *(nhóm điền: ví dụ đọc mã `nghiep-vu.js` đối chiếu BR-01…BR-10, chạy toàn bộ test case thủ công)* |
| Test report | Tạo mẫu báo cáo | Số liệu do nhóm tự điền từ kết quả chạy |

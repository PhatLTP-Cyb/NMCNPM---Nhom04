# BT05 – Nhóm 04: Danh sách lỗi đã phát hiện và cách sửa

Đối chiếu 2 bài: **TV-B** (Vương Hữu Khang – smartwatch, use case, UC-01, state chart) và **TV-C** (giả định, smartphone, UC-10, activity) với yêu cầu trong `bai-tap (1).html`.
Bản cuối: `BT05_Nhom04_BanCuoi.html`.

## A. Lỗi so với yêu cầu nộp bài
| # | Lỗi | Của | Cách sửa |
|---|---|---|---|
| A1 | Sơ đồ use case và activity vẽ bằng Mermaid, dùng icon `fa:fa-` cần Font Awesome qua mạng → không phải SVG, không mở offline được | TV-C | Vẽ lại toàn bộ thành SVG nhúng trong tệp |
| A2 | Không có mục 08 (danh sách kiểm tra nhất quán đã đánh dấu) | Cả hai | Bổ sung mục 08, mỗi dòng có bằng chứng |
| A3 | UC-10 thiếu phần "lý do chọn" (chỉ có lý do cho UC-14 dự phòng) | TV-C | Viết lý do chọn cho cả 2 use case |
| A4 | Tên nhóm ghi lệch: "Nhóm 04" và "Nhóm LT05" | TV-C | Thống nhất "Nhóm 04 – LT04" (cần nhóm xác nhận) |

## B. Mâu thuẫn giữa hai thành viên
| # | Lỗi | Cách sửa |
|---|---|---|
| B1 | Mã GĐ lệch: TV-B dẫn GĐ-03 cho "tối thiểu 1 phút" và GĐ-04 cho bơi lội, nhưng trong bảng TV-C GĐ-03 là calo, GĐ-04 là timeout bản đồ. Không có GĐ nào cho: 1 phút tối thiểu, tạm dừng, pin yếu | Bảng GĐ mới GĐ-01…GĐ-11; thêm GĐ-07 (1 phút), GĐ-10 (tạm dừng), GĐ-11 (pin ≤ 2%); sửa mọi tham chiếu |
| B2 | Bơi lội có 2 cách tính: TV-C "số sải × 1,2 m"; TV-B "số lượt quay đầu × 25/50 m" | Chọn cách lượt bể × chiều dài bể (GĐ-06, BR-04); bỏ ý "lấy GPS khi tay nổi" |
| B3 | Tên/mã use case lệch: "Xem phân tích chi tiết HĐ" và "Xem phân tích thống kê hoạt động thể chất"; UC-14 hai tên khác nhau | Đánh số lại UC-01…UC-12, dùng một tên duy nhất ở sơ đồ và đặc tả (UC-10 cũ → **UC-07**) |
| B4 | Tốc độ/nhịp tim: TV-B tách UC-11 (extend), TV-C để trong luồng chính UC-10 | Giữ trong luồng chính UC-07 (bước 7–8), bỏ use case riêng |
| B5 | Đánh giá mục tiêu: TV-B "UC-16 extend UC-15 Đặt mục tiêu"; TV-C "UC-10 include Đánh giá mục tiêu" | UC-08 Đánh giá mục tiêu **extend** UC-07 `[hoạt động có mục tiêu]` (UC-07 vẫn trọn vẹn khi không có mục tiêu) |
| B6 | Đồng bộ: TV-B vẽ 2 use case (UC-06, UC-07) nối nhau bằng mũi tên «Bluetooth»; TV-C đặt ở smartphone. GĐ-01 của TV-C nhắc trạng thái "Chờ đồng bộ", "Đã xoá tạm" không có trong state chart | Một use case UC-04 Đồng bộ dữ liệu hoạt động trong hộp smartwatch; phân hệ smartphone là actor «hệ thống»; GĐ-01 dùng đúng tên trạng thái |
| B7 | Mã BR trùng nghĩa khác nhau (BR-01…BR-05 của UC-01 và BR-01…BR-04 của UC-10) | Đánh số liên tục: UC-01 dùng BR-01…05, UC-07 dùng BR-06…09 |

## C. Sơ đồ use case (TV-B)
| # | Lỗi | Cách sửa |
|---|---|---|
| C1 | Actor Dịch vụ bản đồ, Mạng xã hội, Thời gian nằm **trong** hộp smartphone (x = 1010 < mép hộp 1080) | Đưa ra ngoài hộp |
| C2 | Đường nối của actor Thời gian đi ra khoảng trống, không nối UC-14 | Nối Thời gian – UC-12 Nhắc nhở |
| C3 | "UC-13 Quản lý lịch biểu «include» UC-14 Nhắc nhở" sai: nhắc nhở do thời gian kích hoạt, không chạy mỗi lần tạo lịch. "Quản lý (tạo, sửa, xoá)" là tên kiểu CRUD bị cấm | Đổi thành UC-10 Tạo lịch biểu hoạt động; bỏ include; UC-11 Đặt mục tiêu extend UC-10 |
| C4 | "UC-16 extend UC-15 [không đạt mục tiêu]" sai ngữ nghĩa: đánh giá diễn ra sau buổi tập, không phải lúc đặt mục tiêu | Xem B5 |
| C5 | UC-03 Cập nhật thông số và UC-05 Kết thúc hoạt động là **bước** của UC-01 nhưng bị tách thành include (lỗi "dùng include để chia bước") | Gộp vào luồng chính UC-01 |
| C6 | Bảng actor coi "Cảm biến chuyển động", "Smartwatch", "Bluetooth" là actor | Cảm biến là thành phần bên trong hệ thống; chỉ giữ Người dùng, Dịch vụ bản đồ, Mạng xã hội, Thời gian, Phân hệ smartphone «hệ thống» |
| C7 | Đường association từ Người dùng sang smartphone cắt ngang hộp smartwatch | Đặt Người dùng giữa hai hộp |

## D. Đặc tả UC-01 (TV-B)
| # | Lỗi | Cách sửa |
|---|---|---|
| D1 | Actor phụ "Cảm biến smartwatch" | "Không có" |
| D2 | Phân loại luồng sai: 3a (mất GPS) và 4b (pin yếu) tiếp tục/kết thúc thành công nhưng xếp vào ngoại lệ; 5a (huỷ khi < 1 phút) dẫn đến thất bại nhưng xếp vào luồng thay thế | 3a, 4b → luồng thay thế; huỷ < 1 phút → ngoại lệ 6e |
| D3 | 5a cho phép chọn "Lưu" khi < 1 phút, mâu thuẫn BR-03 và guard state chart | < 1 phút luôn huỷ |
| D4 | Luồng 1a "người dùng bấm Bắt đầu" làm UC-01 cũng do người dùng kích hoạt → trùng cách kích hoạt với UC-10 (đề yêu cầu khác nhau); đề cũng nói đồng hồ **tự động** nhận biết | Bỏ 1a; thay bằng 1a "không xác định được loại trong 10 giây → gán Khác" |
| D5 | Hậu điều kiện thất bại nhắc "người dùng chủ động huỷ", "bản ghi lỗi khi sập nguồn" – không có luồng hay trạng thái tương ứng | Chỉ còn "Đã huỷ, không có bản lưu tạm" |
| D6 | Nhịp tim dùng "bpm", thời gian dạng mm:ss; đề dùng "lần" và "phút" | Nhịp tim lần/phút; thời gian di chuyển tính bằng phút |
| D7 | NFR-01 không ghi mã GĐ cho "tức thời"; NFR-02 (10% pin/giờ), NFR-03 (30 giây) không có nguồn | Giữ 2 NFR có nguồn GĐ-02 |
| D8 | Bước 8 nêu cách lưu ("bộ nhớ đệm Flash"); tiền điều kiện "cảm biến, GPS hoạt động bình thường" trong khi mất GPS đã là luồng 3a | Viết "lưu tạm thông tin hoạt động"; bỏ tiền điều kiện đó |

## E. Đặc tả UC-10 (TV-C)
| # | Lỗi | Cách sửa |
|---|---|---|
| E1 | Bước 2 có hai hành động (truy xuất và gửi toạ độ) | Tách thành bước 2 và 3 |
| E2 | BR-03 bắt đạt **đồng thời cả 3** tiêu chí, trong khi đề cho đặt mục tiêu "theo các tiêu chí" – người dùng có thể chỉ đặt 1–2 | BR-08: chỉ so các tiêu chí đã đặt (GĐ-05) |
| E3 | Mục 14 ghi include, mâu thuẫn sơ đồ của TV-B | Thống nhất extend (B5) |

## F. Activity diagram (TV-C)
| # | Lỗi | Cách sửa |
|---|---|---|
| F1 | Ký pháp không phải UML: điểm bắt đầu/kết thúc là vòng tròn rỗng, merge là nút `{ }` rỗng, fork/join là hộp chữ "FORK BAR" | Vẽ lại SVG đúng ký pháp (chấm đen, vòng tròn đôi, hình thoi, thanh đen) |
| F2 | Nhánh "không có mục tiêu"/"đạt/chưa đạt" phải khớp luồng mới (6a, 6b, 7a) | Cập nhật D3, D4, D5 và bảng truy vết |

## G. State chart (TV-B)
| # | Lỗi | Cách sửa |
|---|---|---|
| G1 | Đã đồng bộ → kết thúc bằng sự kiện "Hoàn tất lưu trữ điện thoại" – việc lưu đã xảy ra trước khi điện thoại gửi ACK, sự kiện thừa | Chuyển hoàn tất (không sự kiện) |
| G2 | ACK có guard `[toàn vẹn dữ liệu]` nhưng không có chuyển khi dữ liệu lỗi → kẹt ở Đang đồng bộ | Thêm sự kiện "nhận báo lỗi dữ liệu" → Đã lưu tạm |
| G3 | Không kết thúc được từ Đang tạm dừng | Thêm chuyển từ Đang tạm dừng sang Đã lưu tạm / Đã huỷ |
| G4 | Pin ≤ 2% có trong đặc tả nhưng không có trên sơ đồ | Thêm sự kiện "pin ≤ 2%" cùng nhãn với "kết thúc" |

## H. Bảng giả định (TV-C)
| # | Lỗi | Cách sửa |
|---|---|---|
| H1 | GĐ-07 (nhắc nhở) chỉ được dùng trong UC-14 dự phòng – không nộp UC-14 thì GĐ này không xuất hiện trong mô hình nào (vi phạm yêu cầu) | Bỏ; thay bằng GĐ-07 thời lượng tối thiểu 1 phút |
| H2 | GĐ-09 ghi ảnh hưởng "UC-01 của TV-B" nhưng UC-01 không dẫn GĐ-09 | UC-01 luồng 3a dẫn GĐ-09 |

## Việc nhóm cần tự điền
- Họ tên và MSSV của TV-A, TV-C ở phần đầu tệp HTML.
- Xác nhận tên nhóm/lớp (Nhóm 04 – LT04).

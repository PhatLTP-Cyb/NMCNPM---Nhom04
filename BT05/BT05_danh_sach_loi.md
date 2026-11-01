# BT05 – Nhóm 04: Danh sách lỗi khi đối chiếu với đề `bai-tap (1).html`

**Tệp được kiểm tra**

- `BT05_Nhom04_TV-B_VuongHuuKhang.md` (gọi tắt **TV-B**): phân tích phân hệ smartwatch, sơ đồ use case, đặc tả UC-01, state chart.
- `BT05_phan_he_smartphone.md` (gọi tắt **TV-C**): bảng giả định, phần smartphone của sơ đồ use case, đặc tả UC-10 (kèm UC-14 dự phòng), activity diagram.

**Căn cứ đối chiếu**

1. Đề `bai-tap (1).html`, mục 02 đến 09 (yêu cầu từng mô hình, mẫu 14 mục, danh sách kiểm tra nhất quán, yêu cầu tệp HTML).
2. Bài giảng `LT04-Requirements.pdf`: yêu cầu phải **chính xác** (không mơ hồ), **đầy đủ**, **nhất quán** (slide 14, 27), đặc tả tốt phải **kiểm chứng được** (testable, slide 36), kiểm nghiệm theo tính đúng đắn, nhất quán, thực tế, đo lường được (slide 43).
3. Tệp `phan-cong-nhom-LT05.md` (ai làm phần nào).

Số dòng ghi dạng `TV-B:L391` là dòng trong tệp md gốc.

---

## 0. Kết luận nhanh theo từng yêu cầu của đề

| Mục đề | Yêu cầu | TV-B | TV-C | Ghi chú |
|---|---|---|---|---|
| 03 | Bảng giả định ≥ 5 dòng, mỗi GĐ xuất hiện trong mô hình, có GĐ về trao đổi giữa hai thiết bị | Không làm (đúng phân công) | **Chưa đạt** | Đủ số dòng nhưng 4 GĐ không xuất hiện đúng chỗ đã ghi, mã GĐ lệch với TV-B (xem B1, H1–H4) |
| 04 | Một sơ đồ cho cả hai phân hệ, 2 hộp, actor ngoài hộp, include, extend đúng chiều | **Chưa đạt** | **Chưa đạt** | TV-B: actor nằm trong hộp, elip chồng nhau, dùng include để chia bước. TV-C: chỉ vẽ phân hệ smartphone, bằng Mermaid (không phải ký pháp use case UML) |
| 05 | Hai đặc tả 14 mục, lý do chọn, ≥ 2 luồng thay thế, ≥ 1 ngoại lệ, BR có đơn vị và mã GĐ | **Chưa đạt** | **Chưa đạt** | Đủ 14 mục nhưng phân loại luồng sai, sai đơn vị, BR dẫn sai mã GĐ (TV-B); thiếu lý do chọn, tên lệch sơ đồ (TV-C) |
| 06 | Activity diagram có swimlane, decision, merge, fork/join, bảng truy vết | Không làm | **Chưa đạt** | Logic đúng phần lớn, bảng truy vết tốt; nhưng vẽ bằng Mermaid, fork/join là hộp chữ |
| 07 | State chart, bảng chuyển trạng thái, ≥ 3 cặp bị từ chối | **Chưa đạt** | Không làm | Có kẹt trạng thái, thiếu sự kiện pin yếu, thiếu đường kết thúc từ Đang tạm dừng |
| 08 | Danh sách kiểm tra nhất quán đã đánh dấu | Không có | Không có | Phân công giao TV-A, chưa có trong cả hai tệp |
| 09 | Một tệp HTML, sơ đồ SVG, bảng bằng `<table>`, mục 03–08 có số và liên kết | Chưa đạt | Chưa đạt | Cả hai là tệp md riêng; TV-B để SVG trong khối code nên không hiển thị |

Tổng số lỗi ghi nhận: **62** (A: 5, B: 8, C: 11, D: 13, E: 8, F: 5, G: 8, H: 4). Phần I liệt kê thêm 17 điểm tìm ra khi tự phản biện bản gộp (vòng 1: 14, vòng 2: 3).

Mức độ: 🔴 nặng (vi phạm trực tiếp yêu cầu của đề), 🟠 vừa (sai ký pháp, mâu thuẫn giữa các mô hình), 🟡 nhẹ (cách viết, trình bày).

---

## A. Lỗi về sản phẩm nộp và định dạng

| # | Mức | Lỗi | Của | Căn cứ trong đề | Cách sửa trong bản gộp |
|---|---|---|---|---|---|
| A1 | 🔴 | Sơ đồ use case và activity vẽ bằng Mermaid (`flowchart`), có icon `fa:fa-…` cần Font Awesome qua mạng | TV-C (L38–76, L155–260) | Mục 09: "Sơ đồ nhúng vào tệp dưới dạng SVG… sơ đồ dùng ký pháp UML như bài giảng"; "mở được bằng trình duyệt khi không có mạng" | Vẽ lại cả hai thành SVG nhúng, đúng ký pháp UML |
| A2 | 🟠 | SVG đặt trong khối ```` ```xml ```` nên xem tệp md chỉ thấy mã, không thấy hình | TV-B (L77, L408) | Mục 09: sơ đồ phải hiển thị, chữ đọc được khi phóng to | Bản md gộp nhúng SVG trực tiếp; bản HTML là bản nộp |
| A3 | 🔴 | Không có mục 08 (danh sách kiểm tra nhất quán đã đánh dấu) | Cả hai | Mục 08, mục 09 thứ tự các phần | Bổ sung mục 08, mỗi dòng có bằng chứng |
| A4 | 🟠 | Tên nhóm lệch: "Nhóm 04" (TV-B L4) và "Nhóm LT05" (TV-C L2); TV-C không ghi họ tên, MSSV | Cả hai | Thông tin nhóm thống nhất | Thống nhất "Nhóm 04", ghi đủ 4 thành viên (nhóm cần xác nhận) |
| A5 | 🟡 | Hai tệp không theo thứ tự mục 03 → 08 của đề (TV-B đánh số 1–5 riêng) | TV-B | Mục 09: "Mỗi phần có tiêu đề kèm số mục (03 đến 08) như trong đề" | Bản gộp đánh số 03–08 |

## B. Mâu thuẫn giữa hai thành viên (lỗi nhất quán)

| # | Mức | Mâu thuẫn | Cách sửa trong bản gộp |
|---|---|---|---|
| B1 | 🔴 | **Mã GĐ lệch nghĩa.** TV-B dẫn GĐ-03 cho "tối thiểu 1 phút" (L394, BR-03) và GĐ-04 cho bơi lội (BR-04), nhưng trong bảng của TV-C GĐ-03 là calo/độ cao, GĐ-04 là timeout bản đồ. Không có GĐ nào cho: 1 phút tối thiểu, tạm dừng, pin ≤ 2% | Lập lại bảng GĐ-01 … GĐ-13, thêm GĐ cho cả ba điểm, sửa mọi tham chiếu |
| B2 | 🔴 | **Bơi lội có hai cách tính quãng đường:** TV-C GĐ-06 "số sải tay × 1,2 m"; TV-B BR-04 "số lượt quay đầu × 25/50 m". TV-C còn ghi "lấy GPS lúc tay nổi trên mặt nước" (không thực tế) | Chọn cách lượt bể × chiều dài bể (đo được, người dùng cài trước), ghi ở GĐ-08 và BR-04 |
| B3 | 🔴 | **Tên và mã use case lệch.** TV-B: "UC-10: Xem phân tích chi tiết hoạt động"; TV-C đặc tả "UC-10: Xem phân tích thống kê hoạt động thể chất". UC-14 cũng có hai tên ("Nhắc nhở theo lịch biểu" / "Nhắc nhở hoạt động thể chất theo lịch biểu") | Đánh số lại UC-01 … UC-12, một tên duy nhất cho cả sơ đồ, đặc tả, activity (UC-10 cũ → **UC-07 Xem phân tích thống kê hoạt động**) |
| B4 | 🟠 | **Tốc độ, nhịp tim chi tiết:** TV-B tách thành UC-11 extend UC-10; TV-C để trong luồng chính bước 6–7 của UC-10 | Giữ trong luồng chính UC-07 (đề nói người dùng "có thể tiếp tục lựa chọn xem", là một phần của cùng mục tiêu xem phân tích) |
| B5 | 🔴 | **Đánh giá mục tiêu:** TV-B "UC-16 extend UC-15 Đặt mục tiêu [không đạt mục tiêu]"; TV-C "UC-10 include Đánh giá mục tiêu" nhưng lại có luồng 5a bỏ qua đánh giá khi không có mục tiêu (include phải chạy mọi lần) | UC-08 Đánh giá mục tiêu **extend** UC-07 với điều kiện [hoạt động thuộc lịch biểu có đặt mục tiêu]; UC-07 vẫn trọn vẹn khi không có mục tiêu |
| B6 | 🟠 | **Đồng bộ:** TV-B vẽ 2 use case (UC-06 gửi, UC-07 nhận) nối nhau bằng mũi tên «Bluetooth»; TV-C ghi đặt ở smartphone "(hoặc kích hoạt từ Smartwatch)", chưa chốt hộp | Một use case UC-04 Đồng bộ dữ liệu hoạt động trong hộp smartwatch; phân hệ smartphone là actor «hệ thống» |
| B7 | 🟠 | **Tên trạng thái:** TV-C GĐ-01 nói trạng thái "Chờ đồng bộ", "Đã xoá tạm"; state chart của TV-B dùng "Đã lưu tạm", không có hai trạng thái kia | Dùng đúng tên trong state chart: Đã lưu tạm, Đang đồng bộ, Đã đồng bộ |
| B8 | 🟠 | **Mã BR trùng nghĩa:** UC-01 có BR-01…BR-05, UC-10 có BR-01…BR-04 với nội dung khác | Đánh số liên tục: UC-01 dùng BR-01…05, UC-07 dùng BR-06…09 |

## C. Sơ đồ use case

| # | Mức | Lỗi | Của | Cách sửa |
|---|---|---|---|---|
| C1 | 🔴 | Ba actor Dịch vụ bản đồ, Mạng xã hội, Thời gian vẽ **bên trong** hộp smartphone (hộp x = 620…1080; actor ở x = 1010) | TV-B (L177, L304–325) | Đưa ra ngoài hộp, bên phải |
| C2 | 🔴 | Actor Thời gian (x = 1010) nằm đè lên elip UC-14 (cx = 945, rx = 115, tức x = 830…1060); đường nối chạy bên trong elip | TV-B (L222, L320–325) | Thời gian ở ngoài hộp, nối UC-12 Nhắc nhở |
| C3 | 🟠 | Elip chồng nhau từng cặp: UC-10 (đến x = 885) với UC-11 (từ x = 830); UC-13 với UC-14; UC-15 với UC-16. Mũi tên include UC-13 → UC-14 nằm trong vùng chồng và có đầu mũi tên chỉ sang trái, đọc như UC-14 → UC-13 | TV-B (L196–260) | Dựng lại bố cục, mỗi elip tách rời, mũi tên đúng chiều |
| C4 | 🔴 | "UC-13 Quản lý lịch biểu (tạo mới, chỉnh sửa, xoá)" là tên kiểu thao tác kỹ thuật | TV-B (L61) | Mục 04: "Không dùng các tên thao tác kỹ thuật như Thêm, Sửa, Xoá" → UC-10 Tạo lịch biểu hoạt động |
| C5 | 🔴 | "UC-13 include UC-14 Nhắc nhở" sai nghĩa: nhắc nhở do thời gian kích hoạt, không chạy mỗi lần tạo lịch | TV-B (L355) | Bỏ include; UC-12 Nhắc nhở nối actor Thời gian |
| C6 | 🔴 | UC-03 Cập nhật thông số tức thời và UC-05 Kết thúc hoạt động là **bước** của UC-01 nhưng tách ra bằng include | TV-B (L161–172, L351–352) | Câu tự kiểm tra của đề: "Include hoặc extend có đang được dùng để chia một use case thành các bước không?" → gộp vào luồng chính UC-01 |
| C7 | 🔴 | UC-06 và UC-07 (đồng bộ) không có actor nào nối; hai use case nối nhau bằng mũi tên «Bluetooth» (UML không có quan hệ này giữa hai use case) | TV-B (L265–268) | Xem B6 |
| C8 | 🟠 | Bảng actor ghi "Cảm biến chuyển động", "Smartwatch", "Smartwatch / Bluetooth", "Smartphone" là actor của use case | TV-B (L50–64) | Mục 04: actor là vai trò, "không phải tên một thiết bị cụ thể". Cảm biến là thành phần bên trong phân hệ |
| C9 | 🟡 | Đường nối từ Người dùng (bên trái) sang 6 use case smartphone cắt ngang toàn bộ hộp smartwatch; đường nối UC-05 cắt qua elip UC-04 | TV-B (L284–301) | Đặt Người dùng giữa hai hộp |
| C10 | 🔴 | TV-C vẽ sơ đồ riêng chỉ cho phân hệ smartphone, thiếu "Xem thống kê tổng hợp" và use case đồng bộ; gộp "Tạo lịch biểu & đặt mục tiêu" thành một use case (hai mục tiêu) | TV-C (L47–54) | Mục 04: "Một sơ đồ cho toàn bộ ứng dụng". Tách UC-10 Tạo lịch biểu và UC-11 Đặt mục tiêu (extend) |
| C11 | 🟠 | Ký pháp sai trong sơ đồ TV-C: actor vẽ thành hộp chữ; association Thời gian → UC-14 có đầu mũi tên; Người dùng nối UC-14 bằng nét đứt "nhận thông báo" | TV-C (L57–63) | Association là đường liền không mũi tên |

## D. Đặc tả UC-01 Ghi nhận hoạt động thể chất (TV-B)

| # | Mức | Lỗi | Dòng | Căn cứ | Cách sửa |
|---|---|---|---|---|---|
| D1 | 🟠 | Actor phụ là "Cảm biến Smartwatch" (gia tốc, PPG, GPS) | L386 | Actor phụ là hệ thống hoặc vai trò bên ngoài; cảm biến là thành phần của đồng hồ | "Không có" |
| D2 | 🔴 | Kích hoạt có hai cách: cảm biến tự nhận biết **hoặc** người dùng chọn loại và bấm Bắt đầu (luồng 1a) | L387, L392 | Đề: đồng hồ "sẽ **tự động** nhận biết"; mục 05: hai use case phải khác cách kích hoạt. Khi UC-01 cũng do người dùng bấm thì trùng cách kích hoạt với use case smartphone | Kích hoạt duy nhất do thiết bị; 1a đổi thành "không xác định được loại trong 10 giây → gán Khác" |
| D3 | 🟠 | Tiền điều kiện có "pin ≥ 5%" (không có nguồn), "bộ nhớ Flash còn trống", "GPS hoạt động bình thường" trong khi mất GPS đã là luồng 3a | L388 | Mẫu: "Điều có thể sai và cần xử lý thì chuyển thành luồng thay thế" | Chỉ giữ: đồng hồ đang đeo, bật nguồn, không có hoạt động khác đang theo dõi |
| D4 | 🟠 | Hậu điều kiện thất bại nhắc "người dùng chủ động huỷ" và "bản ghi lỗi khi sập nguồn" – không có luồng hay trạng thái nào tương ứng | L390 | Mỗi ngoại lệ dẫn đến hậu điều kiện thất bại và ngược lại | Chỉ còn "Đã huỷ, không có bản lưu tạm" |
| D5 | 🟠 | Bước 2 có ba hành động (rung, kích hoạt phiên, khởi tạo đối tượng); bước 5 mô tả giao diện "chạm nút Kết thúc (Finish) trên màn hình"; bước 8 nêu cách lưu "bộ nhớ đệm cục bộ" | L391 | Mẫu luồng chính: "Mỗi bước có một chủ thể và một hành động… Không nêu cách lưu dữ liệu hoặc mô tả giao diện" | Viết lại 8 bước, mỗi bước một hành động |
| D6 | 🔴 | **Phân loại luồng sai.** 3a (mất GPS, tiếp tục ghi) và 4b (pin yếu, vẫn lưu "Đã lưu tạm") xếp vào ngoại lệ dù kết thúc thành công; 5a (dưới 1 phút, kết thúc "Đã huỷ") xếp vào luồng thay thế | L392–393 | Mẫu: "Luồng ngoại lệ: lỗi khiến use case không đạt mục tiêu. Mỗi ngoại lệ dẫn đến hậu điều kiện thất bại" | 3a, 4b → luồng thay thế; dưới 1 phút → ngoại lệ 6e |
| D7 | 🔴 | 5a cho người dùng chọn "Lưu" khi hoạt động < 1 phút, mâu thuẫn BR-03 ("chỉ lưu nếu ≥ 60 giây") và guard `[thời gian < 1 phút] / huỷ bản ghi` của state chart | L392, L394, L520 | Nhất quán giữa đặc tả và state chart (mục 08) | Dưới 1 phút luôn huỷ |
| D8 | 🔴 | Đơn vị khác đề: nhịp tim "bpm", thời gian `mm:ss`/`hh:mm:ss` | L391, L394 | Mục 05: "ghi đúng đại lượng và đơn vị theo đề (km, phút, km/h, lần)" | Nhịp tim lần/phút; thời gian di chuyển tính bằng phút |
| D9 | 🔴 | BR-03 dẫn GĐ-03, BR-04 dẫn GĐ-04 nhưng GĐ-03, GĐ-04 của bảng giả định nói chuyện khác (xem B1) | L394 | "Quy tắc lấy từ giả định ghi rõ mã GĐ tương ứng" | Sửa theo bảng GĐ mới |
| D10 | 🔴 | NFR-01 "≤ 1,0 giây" không ghi mã GĐ; NFR-02 (≤ 10% pin/giờ), NFR-03 (lưu mỗi 30 giây) không có trong đề và không có GĐ | L395 | Mục 05: NFR "lấy từ đề hoặc từ giả định… Cụm 'tức thời' phải đổi thành ngưỡng cụ thể và ghi mã GĐ" | Giữ 2 NFR có nguồn GĐ-03 |
| D11 | 🟠 | Lý do chọn ghi "phương thức kích hoạt đa dạng (tự động hoặc thủ công)" – đúng là điểm làm hỏng ràng buộc khác cách kích hoạt | L375 | Mục 05 | Viết lại lý do chọn dựa vào đề |
| D12 | 🟡 | Phần tổng kết ghi "2 luồng thay thế, 2 luồng ngoại lệ" trong khi bảng có 3 luồng thay thế (1a, 4a, 5a) và 2 ngoại lệ | L589 | Chính xác | Bỏ phần tổng kết |
| D13 | 🟡 | Mục 14 khai báo include UC-03, UC-05 theo sơ đồ sai (C6) | L396 | Mục 14 phải khớp sơ đồ | Include UC-02; extend UC-03 Tạm dừng |

## E. Đặc tả UC-10 Xem phân tích thống kê (TV-C)

| # | Mức | Lỗi | Dòng | Cách sửa |
|---|---|---|---|---|
| E1 | 🔴 | Không có "lý do chọn" cho UC-10 (chỉ có lý do cho UC-14 dự phòng) | L95–97 | Mục 05: "Mỗi use case chọn viết 2 đến 3 câu giải thích lý do chọn" → bổ sung |
| E2 | 🔴 | Tên đặc tả khác tên trên sơ đồ use case của TV-B (B3) | L101 | Một tên duy nhất |
| E3 | 🟠 | Bước 2 có hai hành động (truy xuất dữ liệu **và** gửi toạ độ cho Dịch vụ bản đồ) | L109 | Tách thành bước 2 và 3 |
| E4 | 🔴 | BR-03 bắt đạt **đồng thời cả 3** tiêu chí, trong khi đề cho đặt mục tiêu "theo các tiêu chí" – người dùng có thể chỉ đặt 1 hoặc 2 | L112 | Chỉ so các tiêu chí đã đặt (GĐ-07, BR-08) |
| E5 | 🔴 | Mục 14 ghi include Đánh giá mục tiêu, nhưng luồng 5a lại bỏ qua đánh giá khi không có mục tiêu: hành vi được include phải chạy mọi lần | L110, L114 | Đổi thành extend (B5) |
| E6 | 🟠 | NFR "≤ 2 giây" không có trong đề và không có GĐ | L113 | Đưa vào GĐ-05 |
| E7 | 🟠 | Luồng chính viết tuần tự (gửi toạ độ → nhận bản đồ → tính thống kê) nhưng activity vẽ hai việc song song bằng fork; đặc tả không nói hai việc độc lập | L109, L147–151 | Ghi rõ ở bước 5: "không phụ thuộc bước 3–4 nên thực hiện song song" |
| E8 | 🟡 | UC-14 dự phòng kéo theo GĐ-07 và BR-05, BR-06; khi không nộp UC-14 thì các mã này không xuất hiện trong mô hình nào (vi phạm mục 03) | L118–138 | Không đưa UC-14 dự phòng vào bản nộp; bỏ GĐ-07 cũ |

## F. Activity diagram (TV-C)

| # | Mức | Lỗi | Dòng | Cách sửa |
|---|---|---|---|---|
| F1 | 🔴 | Fork và join vẽ bằng hộp chữ "====== FORK BAR ======" thay vì thanh đen | L174, L182 | Thanh đặc màu đậm như bài giảng |
| F2 | 🟠 | Swimlane dựng bằng `subgraph` của Mermaid với `flowchart TD`: trình vẽ tự sắp xếp, các làn không nằm song song thành cột, có hành động bị đẩy ra ngoài làn khi hiển thị | L160–200 | Vẽ 3 làn cột đứng: Người dùng, Phân hệ smartphone, Dịch vụ bản đồ |
| F3 | 🟠 | Decision "Tải bản đồ OK?" đặt **sau** hành động "Tạo bản đồ lộ trình" của Dịch vụ bản đồ, trong khi nhánh `[lỗi / quá hạn 3s]` nghĩa là dịch vụ không trả bản đồ | L219–225 | Đặt decision "Bản đồ phản hồi trong 3 giây?" trước hành động "Trả bản đồ lộ trình" |
| F4 | 🟡 | Hai điểm kết thúc chỉ phân biệt bằng màu (`classDef`), không phải ký hiệu vòng tròn đôi | L254–256 | Ký hiệu điểm kết thúc UML, ghi chú "thành công"/"thất bại" |
| F5 | 🟡 | Nhánh có/không mục tiêu, đạt/chưa đạt phải đổi theo luồng mới của UC-07 (6a, 6b, 7a) | L232–251 | Cập nhật sơ đồ và bảng truy vết |

## G. State chart "Hoạt động thể chất" (TV-B)

| # | Mức | Lỗi | Dòng | Cách sửa |
|---|---|---|---|---|
| G1 | 🔴 | Chuyển Đang đồng bộ → Đã đồng bộ có guard `[toàn vẹn dữ liệu]` nhưng không có chuyển nào khi dữ liệu lỗi → hoạt động kẹt ở Đang đồng bộ | L537–541 | Mục 07: "trạng thái nào đã vào thì ra được" → thêm sự kiện "nhận báo lỗi dữ liệu" về Đã lưu tạm |
| G2 | 🔴 | Từ Đang tạm dừng không kết thúc được hoạt động (chỉ có "Ấn tiếp tục") | L504–512 | Thêm chuyển từ Đang tạm dừng sang Đã lưu tạm / Đã huỷ |
| G3 | 🟠 | Pin ≤ 2% có trong đặc tả (4b) và bảng (cột nguồn) nhưng không có trên sơ đồ | L393, L563 | Thêm sự kiện "pin ≤ 2%" cùng nhãn với "ra lệnh kết thúc" |
| G4 | 🟠 | Đã đồng bộ → kết thúc bằng sự kiện "Hoàn tất lưu trữ điện thoại": việc lưu đã xảy ra trước khi điện thoại gửi xác nhận, sự kiện thừa và sai thứ tự | L543–545, L568 | Chuyển hoàn tất (không cần sự kiện) |
| G5 | 🟠 | Bảng chuyển trạng thái khác sơ đồ: dòng đầu ghi "hoặc người dùng bấm Start" (sơ đồ chỉ có "Phát hiện vận động"); action "hẹn giờ thử lại" không có trên sơ đồ | L560, L566 | Bảng và sơ đồ cùng một nội dung |
| G6 | 🟡 | Cột guard ghi lại trạng thái nguồn ("Đang trong phiên theo dõi", "Đang ở trạng thái tạm dừng") hoặc ghi sự kiện (dòng đầu) thay vì điều kiện | L560–562 | Ghi "–" khi không có guard |
| G7 | 🟡 | Cặp bị từ chối số 2 (Đã lưu tạm + phát hiện chuyển động mới) thực ra không bị từ chối mà tạo hoạt động mới; cặp số 4 dùng sự kiện "Smartphone yêu cầu phát lại" không có trong use case nào | L579, L581 | Chọn các cặp dùng sự kiện đã có trong sơ đồ |
| G8 | 🟡 | Action "lưu bộ đệm Flash", "mở kênh socket" là chi tiết kỹ thuật lưu trữ | L518, L565 | Action quan sát được: "lưu tạm thông tin hoạt động", "gửi thông tin hoạt động sang điện thoại" |

## H. Bảng giả định (TV-C) – kiểm theo yêu cầu "mỗi giả định phải xuất hiện cụ thể trong ít nhất một mô hình"

| # | Mức | GĐ | Lỗi | Cách sửa |
|---|---|---|---|---|
| H1 | 🔴 | GĐ-07 (nhắc lại sau 5 phút) | Chỉ dùng trong UC-14 dự phòng; không nộp UC-14 thì GĐ này không có trong mô hình nào | Bỏ |
| H2 | 🟠 | GĐ-08 (cấu trúc gói đồng bộ) | Ghi ảnh hưởng "Tiền điều kiện UC-10, State chart" nhưng tiền điều kiện UC-10 và state chart không nhắc tới | Dẫn GĐ-10 mới ở hậu điều kiện UC-01, tiền điều kiện UC-07, action gửi trong state chart |
| H3 | 🟠 | GĐ-09 (mất GPS) và GĐ-06 (bơi lội) | Ghi ảnh hưởng "UC-01 của TV-B" nhưng UC-01 không dẫn hai mã này (UC-01 dẫn GĐ-04 cho bơi lội) | Luồng 3a dẫn GĐ-11; BR-04 dẫn GĐ-08 |
| H4 | 🟡 | GĐ-00 (ví dụ) | Dòng ví dụ của đề được dùng như giả định thật (BR-03 dẫn GĐ-00); đề nói "không tính dòng ví dụ" | Tạo GĐ-01 riêng cho quy ước ≥ |

---

## I. Lỗi tìm ra khi tự phản biện bản gộp và đã sửa

### Vòng 1

Sau khi gộp hai bài và sửa các lỗi A–H, bản nháp được đọc lại theo từng câu hỏi tự kiểm tra của đề và theo tiêu chí chính xác, đầy đủ, nhất quán, kiểm chứng được của bài giảng LT04. Các điểm dưới đây đã sửa trong `BT05_hoan_chinh.md`.

| # | Tiêu chí | Vấn đề trong bản nháp | Đã sửa |
|---|---|---|---|
| I1 | Đầy đủ (câu hỏi "dữ liệu có đủ không?" ở mục 03) | Đề liệt kê thông tin lịch biểu gồm tên, loại, tần suất, có nhắc, nhắc trước bao nhiêu phút, nhưng **không có giờ thực hiện**, nên "nhắc trước bao nhiêu phút" không có mốc | GĐ-06: lịch biểu có thêm giờ thực hiện |
| I2 | Đầy đủ | Guard "[hoạt động thuộc lịch biểu có đặt mục tiêu]" không nói cách biết một hoạt động thuộc lịch biểu nào | GĐ-06: cùng loại hoạt động, đúng ngày theo tần suất, bắt đầu trong khoảng 60 phút quanh giờ thực hiện |
| I3 | Chính xác | Đề cho hai loại lời khuyên ("cố gắng hơn" hoặc "điều chỉnh lại mục tiêu") nhưng không nói khi nào dùng loại nào | GĐ-07, BR-08: chưa đạt 3 hoạt động liên tiếp của cùng lịch biểu thì gợi ý điều chỉnh, còn lại khuyên cố gắng |
| I4 | Nhất quán | Bơi lội không có chuỗi toạ độ GPS, nhưng bước 3 của UC-07 luôn gửi chuỗi toạ độ cho Dịch vụ bản đồ | GĐ-08: đồng hồ ghi toạ độ lúc bắt đầu (trước khi xuống nước); smartphone gửi điểm đó để ghim vị trí hồ bơi |
| I5 | Kiểm chứng được | NFR "≤ 2 giây" của UC-07 vẫn không có nguồn | Đưa vào GĐ-05 |
| I6 | Đúng mẫu | GĐ-00 là dòng ví dụ nhưng vẫn được dùng làm giả định | GĐ-01 riêng |
| I7 | Đầy đủ | Pin ≤ 2% khi đang **tạm dừng** chưa được xử lý | Luồng 4b ghi "kể cả khi đang tạm dừng"; state chart có chuyển từ Đang tạm dừng |
| I8 | Đúng đề (mục 04 association) | Use case mở rộng UC-03 Tạm dừng, UC-11 Đặt mục tiêu không có actor nối, dù người dùng là người thực hiện | Nối Người dùng với UC-03, UC-11; Mạng xã hội với UC-09; UC-08 chỉ là đích mở rộng (hành vi của hệ thống) |
| I9 | Nhất quán | Tiền điều kiện UC-07 "Đã đồng bộ" trong khi state chart cho Đã đồng bộ đi thẳng tới điểm kết thúc | Ghi chú ở mục 07: Đã đồng bộ là trạng thái cuối; điểm kết thúc là lúc bản lưu tạm hết vai trò, thông tin trên smartphone không đổi trạng thái nữa |
| I10 | Ký pháp activity | Decision timeout bản đồ đặt sau hành động của Dịch vụ bản đồ (lặp lại lỗi F3) | Đặt trước |
| I11 | Nhất quán | Chữ viết lẫn "hủy/huỷ", "xóa/xoá" giữa các phần, tên trạng thái "Đã hủy" khác "Đã huỷ" | Thống nhất "huỷ", "xoá" như đề |
| I12 | Đúng đề (mục 08) | Đề không nêu đơn vị calo và độ cao | Ghi kcal, m và nói rõ ở dòng kiểm tra đơn vị |
| I13 | Đúng đề (mục 05) | UC-01 kích hoạt bởi thiết bị nhưng actor chính là Người dùng: cần giải thích vì sao vẫn khác cách kích hoạt với UC-07 | Lý do chọn và mục Kích hoạt ghi rõ: sự kiện do đồng hồ phát hiện, không có thao tác của người dùng |
| I14 | Đúng đề (mục 07) | Cặp bị từ chối "Đã lưu tạm + Bluetooth [chưa ghép đôi]" là guard sai chứ không phải sự kiện bị từ chối | Giữ trong bảng chuyển trạng thái (guard sai thì không chuyển), thay cặp bị từ chối bằng "Đang đồng bộ + ra lệnh kết thúc → báo lỗi" |

### Vòng 2 (rà soát lại toàn bộ)

| # | Tiêu chí | Vấn đề trong bản gộp vòng 1 | Đã sửa |
|---|---|---|---|
| I15 | Chính xác (mục 07, cột nguồn sự kiện) | Hai dòng chuyển sang Đã huỷ ghi nguồn sự kiện pin là "GĐ-09", trong khi giả định về pin là GĐ-13 (GĐ-09 là guard dưới 1 phút) | Sửa thành "đồng hồ (pin) – GĐ-13" |
| I16 | Nhất quán (sơ đồ và bảng) | Nhãn có hai sự kiện trên sơ đồ dùng dấu phẩy ("ra lệnh kết thúc, pin ≤ 2%") như ghi chú mục 07, nhưng bảng chuyển trạng thái dùng dấu chấm phẩy | Bảng dùng dấu phẩy giống sơ đồ |
| I17 | Chính xác (mục 07) | Hai chuyển hoàn tất (Đã đồng bộ, Đã huỷ → kết thúc) không có sự kiện nhưng cột nguồn ghi "Đồng hồ" | Ghi "Không có sự kiện (chuyển hoàn tất)" |

## Việc nhóm cần tự xác nhận

- Tên nhóm chính thức (bản gộp ghi **Nhóm 04** theo tên tệp BT04, BT05).
- Danh sách 4 thành viên trong phần đầu (lấy từ bài tuần 4 của nhóm).
- Nếu nhóm muốn giữ cách tính bơi lội theo sải tay của TV-C thì phải sửa GĐ-08, BR-04 và BR-07 cùng lúc.

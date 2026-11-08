# Phân công: Thiết kế dữ liệu & UI/UX

Nov 7, 2026 · @Phat Le Tan

## Tổng quan

Mỗi người phụ trách trọn một phần: Người 1 làm dữ liệu Phòng khám An Tâm, Người 2 làm dữ liệu sàn đấu giá, Người 3 làm UI/UX (User Interface / User Experience - giao diện / trải nghiệm người dùng) Phòng khám An Tâm ở level 4. Phần 1 và phần 3 dùng chung một bộ dữ liệu, nên Người 1 phải chốt bảng sớm để Người 3 vẽ màn hình đúng trường.

**Level 4 nghĩa là gì (theo LT07, slide 26–34):** bài giảng nâng một màn hình nhập liệu qua 4 mức cải tiến, mức sau bao gồm mức trước:

| Mức | Tên trong LT07 | Ý nghĩa | Ví dụ "Phiếu mượn sách" trong slide |
| --- | --- | --- | --- |
| Gốc | Màn hình cơ bản | Chỉ có ô nhập tối thiểu | Mã độc giả, Mã sách, Ngày mượn |
| 1 | Bổ sung thông tin cho người dùng | Nhập mã xong thì hiện thông tin liên quan (chỉ đọc) để người dùng đối chiếu | Gõ mã độc giả → hiện Họ tên, Loại, Ngày sinh |
| 2 | Giá trị định sẵn | Điền sẵn giá trị mặc định hợp lý | Ngày mượn = ngày hệ thống |
| 3 | Nhập nhiều giá trị đồng thời | Một phiếu nhập được nhiều dòng chi tiết (lưới) | Một phiếu mượn nhiều sách |
| **4** | **Suy nghĩ thấu đáo về nghiệp vụ** | Thêm thông tin, cảnh báo giúp người dùng ra quyết định đúng nghiệp vụ | Hiện sách đang mượn quá hạn và sách chưa trả của độc giả |

Vậy "level 4" cho Phòng khám An Tâm nghĩa là mỗi màn hình chính phải có đủ cả 4 cải tiến, và cải tiến 4 phải xuất phát từ nghiệp vụ khám chữa bệnh thật. Bài "A UX Guide For Designing Error Pages" (Alana Brajdic) dùng làm chuẩn cho thông báo lỗi và trang lỗi, kết hợp với quy tắc "Thông báo" ở slide 18 của LT07.

| Người | Phần việc | Sản phẩm chính | Phụ thuộc |
| --- | --- | --- | --- |
| Người 1 | Thiết kế dữ liệu Phòng khám An Tâm | Danh sách bảng, sơ đồ dữ liệu, bảng đặc tả có kiểu dữ liệu | Không; là đầu vào cho Người 3 |
| Người 2 | Thiết kế dữ liệu sàn đấu giá | Danh sách bảng, sơ đồ dữ liệu, bảng đặc tả có kiểu dữ liệu | Không; dùng chung quy ước kiểu với Người 1 |
| Người 3 | UI/UX Phòng khám An Tâm level 4 | Danh sách màn hình, sơ đồ màn hình, wireframe, đặc tả màn hình, bộ thông báo lỗi | Cần bảng dữ liệu đã chốt của Người 1 |

## Quy ước kiểu dữ liệu dùng chung

Cả Người 1 và Người 2 đặc tả mỗi bảng theo mẫu slide 9 của LT07, thêm cột Ràng buộc: **Field | Kiểu dữ liệu | Ràng buộc | Mô tả**. Không trường nào được để trống cột Kiểu dữ liệu; chuỗi phải ghi độ dài, số thập phân phải ghi độ chính xác.

| Loại thông tin | Kiểu ghi trong đặc tả | Kiểu SQL tương ứng (tham khảo) | Ghi chú |
| --- | --- | --- | --- |
| Khóa chính tự sinh | Số tự tăng | INT IDENTITY / AUTO\_INCREMENT | Khóa chính (PK - Primary Key) |
| Mã nghiệp vụ có định dạng (BN0001) | Chuỗi (n) | VARCHAR(n) | Ghi rõ định dạng, duy nhất (UNIQUE) |
| Tên, địa chỉ, ghi chú tiếng Việt | Chuỗi Unicode (n) | NVARCHAR(n) | Họ tên 100, địa chỉ 255 |
| Văn bản dài (mô tả, triệu chứng) | Văn bản dài | NVARCHAR(MAX) / TEXT |  |
| Số điện thoại, CCCD | Chuỗi (n) | VARCHAR(10), VARCHAR(12) | Không dùng kiểu số vì mất số 0 đầu |
| Ngày | Ngày tháng | DATE | Định dạng hiển thị d/M/yyyy |
| Thời điểm (có giờ phút giây) | Ngày giờ | DATETIME | Bắt buộc cho lượt trả giá, giờ khám |
| Số lượng | Số nguyên | INT | Ghi ràng buộc ≥ 0 hoặc > 0 |
| Tiền (VNĐ) | Số thực cố định (18,0) | DECIMAL(18,0) | Không dùng FLOAT cho tiền vì sai số làm tròn |
| Có / không | Luận lý (Boolean) | BIT / BOOLEAN | Ví dụ đã thanh toán |
| Tập giá trị cố định (trạng thái, giới tính) | Chuỗi (n) + liệt kê giá trị | VARCHAR(n) + CHECK | Liệt kê đủ giá trị hợp lệ trong cột Ràng buộc |
| Ảnh, tệp | Chuỗi (500) | VARCHAR(500) | Lưu đường dẫn, không lưu file trong bảng |
| Khóa ngoại | Cùng kiểu với khóa chính nó trỏ tới | — | Khóa ngoại (FK - Foreign Key), ghi rõ tham chiếu bảng nào |

Quy ước đặt tên: bảng và field viết không dấu, dạng chữ thường có gạch dưới (snake\_case, ví dụ `ma_benh_nhan`), giống ví dụ bảng HocSinh trong LT07.

## Người 1: Thiết kế dữ liệu Phòng khám An Tâm

**Phạm vi:** toàn bộ dữ liệu cần lưu cho nghiệp vụ của phòng khám, làm theo đúng 3 bước của LT07: xác định thành phần dữ liệu, vẽ sơ đồ dữ liệu, đặc tả thành phần dữ liệu. Hệ thống lưu trữ chọn CSDL (cơ sở dữ liệu), ghi một đoạn lý do theo slide 4.

**Đầu việc:**

1. Đọc đề Phòng khám An Tâm, liệt kê mọi biểu mẫu (BM) và quy định (QĐ). Mỗi ô trên biểu mẫu phải rơi vào một field hoặc được tính ra từ field khác.
2. Xác định các đối tượng cần lưu. Danh sách dự kiến (đối chiếu lại với đề): `benh_nhan`, `danh_sach_kham` (lượt khám theo ngày), `phieu_kham`, `chi_tiet_don_thuoc`, `loai_benh`, `thuoc`, `don_vi`, `cach_dung`, `hoa_don`, `tham_so` (số bệnh nhân tối đa/ngày, tiền khám), và nếu đề có đăng nhập thì `nguoi_dung`.
3. Tách bảng danh mục riêng cho mọi danh sách quy định có thể thay đổi (loại bệnh, thuốc, đơn vị, cách dùng). Quy định dạng con số (tối đa 40 bệnh nhân/ngày, tiền khám) đưa vào bảng `tham_so`, không viết cứng.
4. Vẽ sơ đồ dữ liệu theo kiểu slide 7: mỗi bảng một hộp liệt kê field, đường nối thể hiện quan hệ 1-n giữa khóa chính và khóa ngoại. Công cụ gợi ý: draw.io, dbdiagram.io, hoặc SQL Server Management Studio.
5. Đặc tả từng bảng theo mẫu chung (Field | Kiểu dữ liệu | Ràng buộc | Mô tả). Field tính toán được (thành tiền, tổng tiền) phải ghi rõ có lưu hay không và vì sao; tiền thuốc trên hóa đơn nên lưu đơn giá tại thời điểm bán, vì giá thuốc có thể đổi về sau.
6. Lập bảng ánh xạ "ô trên biểu mẫu → bảng.field" để chứng minh đủ dữ liệu, và bảng "quy định → ràng buộc / bảng tham số" để chứng minh mọi QĐ đều được kiểm được.
7. (Nên có) Viết script tạo bảng SQL và 5–10 dòng dữ liệu mẫu mỗi bảng để Người 3 dùng làm nội dung wireframe.

**Sản phẩm nộp:** danh sách thành phần dữ liệu kèm một dòng ý nghĩa; ảnh sơ đồ dữ liệu (PNG) và tệp gốc; bảng đặc tả cho từng bảng; bảng ánh xạ biểu mẫu và quy định; script SQL nếu làm.

**Tiêu chí hoàn thành:**

- [ ] 100% field có kiểu dữ liệu, chuỗi có độ dài, tiền dùng kiểu số cố định
- [ ] Mỗi bảng có khóa chính; mọi khóa ngoại ghi rõ bảng tham chiếu và cùng kiểu
- [ ] Mọi ô trên mọi biểu mẫu đều truy ra được field nguồn
- [ ] Mọi quy định có ràng buộc hoặc tham số tương ứng; đổi quy định không cần sửa cấu trúc bảng
- [ ] Sơ đồ và bảng đặc tả khớp nhau (cùng tên bảng, cùng field)

## Người 2: Thiết kế dữ liệu sàn đấu giá

**Phạm vi:** dữ liệu cho một sàn đấu giá trực tuyến: người bán đăng sản phẩm, mở phiên đấu giá, người mua trả giá, hệ thống xác định người thắng và ghi nhận thanh toán. Làm đủ 3 bước của LT07 như Người 1. Trọng tâm chấm là mọi thành phần và thuộc tính đều có kiểu dữ liệu.

**Đầu việc:**

1. Viết 5–8 quy định nghiệp vụ làm cơ sở thiết kế (nếu đề không cho sẵn), ví dụ: giá trả sau phải ≥ giá cao nhất hiện tại + bước giá; người bán không được trả giá sản phẩm của mình; có giá mua ngay thì phiên kết thúc sớm; trả giá trong 5 phút cuối thì gia hạn phiên (nếu nhóm chọn).
2. Xác định thành phần dữ liệu. Danh sách dự kiến: `nguoi_dung`, `danh_muc` (có danh mục cha), `san_pham`, `hinh_anh_san_pham`, `phien_dau_gia`, `luot_tra_gia`, `theo_doi` (danh sách yêu thích), `giao_dich_thanh_toan`, `danh_gia` (người mua và người bán đánh giá nhau), `thong_bao`.
3. Thiết kế kỹ các field nhạy cảm về kiểu: giá khởi điểm, bước giá, giá mua ngay, giá trả đều là DECIMAL(18,0); thời điểm bắt đầu, kết thúc, thời điểm trả giá là DATETIME đến giây (dùng để phân định ai trả trước khi bằng giá); trạng thái phiên là tập giá trị cố định (chờ duyệt, đang diễn ra, đã kết thúc, đã hủy).
4. Vẽ sơ đồ dữ liệu theo kiểu slide 7, thể hiện rõ quan hệ: một người dùng vừa là người bán (qua `san_pham`) vừa là người mua (qua `luot_tra_gia`); một phiên có nhiều lượt trả giá; người thắng là khóa ngoại tới `nguoi_dung`.
5. Đặc tả từng bảng theo mẫu chung. Với field dẫn xuất (giá hiện tại, số lượt trả giá), ghi rõ là lưu sẵn hay tính từ `luot_tra_gia`, kèm lý do (tốc độ đọc so với nguy cơ lệch dữ liệu).
6. Lập bảng "quy định → ràng buộc / field" để chứng minh dữ liệu đủ kiểm tra từng quy định ở bước 1.
7. (Nên có) Script SQL tạo bảng và dữ liệu mẫu một phiên có 3–5 lượt trả giá.

**Sản phẩm nộp:** danh sách quy định nghiệp vụ; danh sách thành phần dữ liệu; sơ đồ dữ liệu (PNG và tệp gốc); bảng đặc tả từng bảng; bảng ánh xạ quy định; script SQL nếu làm.

**Tiêu chí hoàn thành:**

- [ ] 100% field có kiểu dữ liệu theo quy ước chung; không field tiền nào dùng FLOAT
- [ ] Mọi mốc thời gian liên quan trả giá dùng kiểu ngày giờ, không chỉ ngày
- [ ] Mọi trạng thái có danh sách giá trị hợp lệ trong cột Ràng buộc
- [ ] Từ dữ liệu truy ra được: giá cao nhất hiện tại, người đang dẫn, người thắng, lịch sử trả giá của một người
- [ ] Sơ đồ và bảng đặc tả khớp nhau

## Người 3: UI/UX Phòng khám An Tâm ở level 4

**Phạm vi:** giao diện cho mọi nghiệp vụ của phòng khám, theo các bước thiết kế UI của LT07 (slide 13–16): lập danh sách màn hình, vẽ sơ đồ màn hình, bố trí thành phần, đặc tả màn hình. Mọi màn hình nhập liệu phải đạt level 4 (có đủ cải tiến 1 đến 4). Theo slide 25, chưa cần thiết kế nút xử lý chi tiết vì thuộc phần Thiết kế xử lý.

**Đầu việc:**

1. Lập danh sách màn hình (STT | Màn hình | Loại | Ý nghĩa), mỗi nghiệp vụ trong đề ít nhất một màn hình. Loại là Nhập liệu, Tra cứu, Báo biểu hoặc Hệ thống.
2. Thiết kế màn hình chính theo slide 37–42: liệt kê chức năng, chọn một trong 3 tiêu chí gom nhóm (gợi ý tiêu chí 3 theo nghiệp vụ: Tiếp nhận, Khám bệnh, Thu ngân, Báo cáo, Quy định) và ghi lý do chọn.
3. Vẽ sơ đồ màn hình thể hiện chuyển tiếp giữa các màn hình.
4. Vẽ wireframe từng màn hình (Figma, draw.io hoặc Balsamiq), dùng đúng tên field trong bảng dữ liệu của Người 1. Với mỗi màn hình nhập liệu chính, ghi bảng "4 mức cải tiến" cho thấy từng mức thêm gì (mẫu bên dưới).
5. Thiết kế màn hình tra cứu bệnh nhân theo slide 35–36: tiêu chuẩn tra cứu không bắt buộc nhập hết, kết quả hiện dạng bảng.
6. Đặc tả từng màn hình: bảng thành phần (STT | Tên | Loại điều khiển | Nguồn dữ liệu | Giá trị mặc định | Ràng buộc kiểm tra) và kịch bản hoạt động. Ghi rõ kiểm tra sớm (ngay khi nhập) hay kiểm tra muộn (khi lưu), theo slide 20.
7. Bộ thông báo và trang lỗi theo slide 18 và bài của Alana Brajdic: mỗi thông báo trả lời đủ Ai gây ra, Chuyện gì và vì sao, Khi nào khắc phục, Người dùng làm gì tiếp. Tối thiểu làm: lỗi nhập liệu (ví dụ đã đủ số bệnh nhân trong ngày), trang 404 không tìm thấy, trang bảo trì hoặc mất kết nối. Vì đây là lĩnh vực y tế, trang lỗi phải có số điện thoại phòng khám cho trường hợp khẩn cấp, đúng mục "Mitigate for emergency situations" trong bài.
8. Áp dụng quy tắc màu slide 17: một bảng màu tối đa 3–4 màu, nhất quán trên mọi màn hình, ghi lại trong phần "Quy ước giao diện".

**Mẫu bảng 4 mức cho màn hình "Phiếu khám bệnh"** (Người 3 làm tương tự cho các màn hình còn lại):

| Mức | Bổ sung trên màn hình |
| --- | --- |
| Gốc | Mã bệnh nhân, Ngày khám, Triệu chứng, Loại bệnh, Thuốc, Số lượng |
| 1 | Nhập mã bệnh nhân thì hiện Họ tên, Giới tính, Năm sinh; chọn thuốc thì hiện Đơn vị, Đơn giá |
| 2 | Ngày khám = ngày hệ thống; Cách dùng điền sẵn theo thuốc; Loại bệnh, Thuốc chọn từ danh sách thả xuống |
| 3 | Lưới đơn thuốc nhiều dòng (STT, Thuốc, Đơn vị, Số lượng, Cách dùng), tự tính tạm tiền thuốc |
| 4 | Khung lịch sử các lần khám trước và đơn thuốc cũ (nút chép lại đơn); cảnh báo thuốc trùng trong đơn; hiện số bệnh nhân còn chờ khám trong ngày |

Gợi ý cải tiến 4 cho màn hình khác: Danh sách khám bệnh hiện "còn X/40 chỗ hôm nay" và gợi ý bệnh nhân cũ khi gõ tên để tránh nhập trùng; Hóa đơn tự lấy tiền thuốc từ phiếu khám và tiền khám từ tham số, hiện các phiếu khám chưa thanh toán.

**Sản phẩm nộp:** danh sách màn hình; màn hình chính và cách gom nhóm; sơ đồ màn hình; wireframe từng màn hình (PNG và link/tệp gốc); bảng 4 mức cho màn hình nhập liệu; đặc tả màn hình; bộ thông báo và trang lỗi; quy ước giao diện.

**Tiêu chí hoàn thành:**

- [ ] Mọi nghiệp vụ trong đề có màn hình; mọi màn hình có trong sơ đồ màn hình
- [ ] Mỗi màn hình nhập liệu chỉ ra được cải tiến 1, 2, 3, 4; cải tiến 4 xuất phát từ nghiệp vụ cụ thể, không chỉ đẹp hơn
- [ ] Mọi ô nhập có ràng buộc kiểm tra khớp kiểu dữ liệu và quy định của Người 1
- [ ] Mỗi thông báo lỗi nói rõ chuyện gì xảy ra và cách xử lý, lịch sự, không chỉ hiện mã lỗi
- [ ] Màu và cách bố trí nhất quán trên mọi màn hình

## Mốc phối hợp và kiểm tra chéo

Mốc quan trọng nhất là Người 1 chốt danh sách bảng và field Phòng khám An Tâm trước ngày 3, vì Người 3 vẽ màn hình dựa trên đó. Ngày tính từ lúc giao việc; điền ngày thật khi biết hạn nộp.

| Mốc | Ngày | Người làm | Việc cần xong |
| --- | --- | --- | --- |
| 1 | Ngày 1 | Cả nhóm | Đọc đề, thống nhất quy ước kiểu dữ liệu và cách đặt tên ở trên |
| 2 | Ngày 2 | Người 1, Người 2 | Gửi danh sách thành phần dữ liệu (tên bảng, field chính) |
| 3 | Ngày 3 | Người 1 → Người 3 | Chốt bảng dữ liệu PK An Tâm; từ đây đổi field phải báo Người 3 |
| 4 | Ngày 3 | Người 3 | Gửi danh sách màn hình và sơ đồ màn hình |
| 5 | Ngày 5 | Cả nhóm | Bản nháp đầy đủ: sơ đồ dữ liệu, đặc tả bảng, wireframe |
| 6 | Ngày 6 | Kiểm tra chéo | Người 2 rà dữ liệu của Người 1; Người 1 rà dữ liệu của Người 2; Người 1 rà wireframe của Người 3 (mọi ô khớp field, kiểu) |
| 7 | Ngày 7 | Cả nhóm | Sửa theo góp ý, ghép file, nộp |

**Quy tắc kiểm tra chéo:** người rà đi theo đúng danh sách "Tiêu chí hoàn thành" của người được rà, đánh dấu từng ô trong tài liệu này, và ghi lỗi bằng bình luận ngay tại chỗ. Không ai tự kiểm phần mình.

# BT06 · Hướng dẫn từng bước (một người làm)

Bạn làm theo thứ tự từ Bước 0 đến Bước 8. Mỗi bước nói rõ: làm gì, dán prompt nào, chụp ảnh tên gì, điền vào mục nào của file báo cáo.

**Bộ file trong thư mục `BT06/`:**

| File | Dùng để |
|---|---|
| `BT06_BaoCao.html` | Báo cáo có sẵn ô trống. Mở bằng Chrome hoặc Edge để điền |
| `anh/` | 62 ảnh mẫu đã đặt tên sẵn. Chụp ảnh thật, đổi tên đúng như ảnh mẫu, chép đè vào đây |
| `BT06_HuongDan.md` | File này |

## Cách dùng file báo cáo

1. Mở `BT06_BaoCao.html` bằng Chrome hoặc Edge. Thư mục `anh/` phải nằm cạnh file.
2. Ô **nền vàng** là chỗ gõ. Ô thả xuống dùng để chọn Đ / T / S, Có / Không và nhãn nguồn.
3. Trình duyệt tự nhớ những gì bạn gõ, kể cả khi đóng tab, nếu bạn mở lại đúng file đó trên đúng trình duyệt đó.
4. Cuối mỗi buổi, bấm **Lưu file đã điền**. Trình duyệt tải về `BT06_BaoCao.html`; chép đè file này vào thư mục `BT06/`. Từ đây mọi thứ đã gõ nằm hẳn trong file, mở ở máy nào cũng thấy.
5. Các ô tổng (số thành phần đủ, số chuyển CS-3, bảng 8.1) tự tính khi bạn chọn Đ / T / S và Có / Không.
6. Ô "Ô chưa điền" ở thanh trái đếm cả các dòng nhật ký dự phòng; không cần đưa về 0.

## Cách thay ảnh

1. Chụp màn hình (Windows: `Win + Shift + S`, rồi dán vào Paint và lưu PNG; hoặc dùng Snipping Tool lưu thẳng ra PNG).
2. Đổi tên ảnh thành **đúng** tên ghi trên khung ảnh, ví dụ `B1_L1_W1.png` (giữ chữ hoa, dấu gạch dưới và đuôi `.png`).
3. Chép vào `anh/`, chọn **Replace** (thay thế) khi Windows hỏi.
4. Mở lại hoặc tải lại (F5) file báo cáo: ảnh thật hiện ra thay cho ảnh mẫu.
5. Ảnh của các lượt giữa (lượt 2 đến 9) không có khung trong báo cáo; vẫn nên chụp và lưu thêm với tên kiểu `B1_L03_P2.png` để có bằng chứng khi bị hỏi.

Danh sách đầy đủ 62 tên ảnh nằm ở cuối file này.

---

## Bước 0. Chuẩn bị Claude Design

Điền vào: **mục 01** của báo cáo. Ảnh: `CC_01_goi_tai_khoan.png`, `CC_02_trang_thai_san_pham.png`, `CC_03_han_muc_truoc.png`, `CC_06_thu_kho_dong_ho.png`

1. Mở **Claude Design** bằng tài khoản Claude có gói Pro, Max hoặc Team. Chụp trang gói tài khoản và giao diện Claude Design (thấy nhãn trạng thái nếu có).
2. Ghi hạn mức đang hiển thị (nếu có) vào ô "trước bài 1", chụp lại.
3. Tạo một dự án **nháp**, gửi prompt thử dưới đây để biết có tạo được khổ đồng hồ không. Không dùng prompt chuẩn để thử, vì lượt đầu phải nằm trong nhật ký.

```text
Thiết kế một màn hình báo thức cho đồng hồ thông minh, khổ màn hình đồng hồ, giao diện tiếng Việt.
```

4. Trong dự án nháp, thử qua các cách chỉnh sửa (chat, comment trên phần tử, sửa trực tiếp, thanh trượt) để biết cách dùng. Ghi vào dòng "Cách chỉnh sửa đã thử".
5. Tìm điều khoản dịch vụ của Anthropic cho gói đang dùng, chép nguyên đoạn nói về quyền sở hữu đầu ra, ghi link và ngày đọc vào mục 01 và mục 9.1. Ghi thêm link bài công bố Claude Design (17/04/2026) vào mục 9.1.
6. Mô hình AI: giao diện có hiện tên thì ghi, không có thì ghi "không hiển thị".
7. Chọn nhãn cho từng dòng mục 01: thứ bạn tự thấy và có ảnh là **Đã chạy**; thứ chỉ đọc trong bài công bố là **Theo tài liệu**.

**Quy tắc khi chạy bài thật:** mỗi bài một dự án riêng (`BT06 Bai1 SucKhoe`, `BT06 Bai2 DauGia`). Mọi yêu cầu gửi bằng **chat** để có prompt nguyên văn. Nếu dùng comment hay sửa tay, vẫn tính là một lượt và chép nội dung vào nhật ký. Hôm chạy bài, hạn chế dùng tài khoản đó cho việc khác vì Claude Design dùng chung hạn mức.

## Bước 1. Kiểm tra phần đã chốt

Điền vào: **mục 02**.

1. Đọc nhanh mục 02 (danh sách màn hình, tiêu chí đếm, danh sách chuyển CS-3, bảng màu). Mọi thứ đã điền sẵn; muốn sửa thì sửa ngay bây giờ, sau lượt 1 không đổi nữa.
2. Ghi ngày chốt.

## Bước 2. Bài 1: lượt 1

Điền vào: **mục 03**. Ảnh: `B1_L1_W1.png`, `B1_L1_W2.png`, `B1_L1_P1.png`, `B1_L1_P2.png`, `B1_L1_P3.png`

1. Tạo dự án `BT06 Bai1 SucKhoe`. Ghi ngày chạy và giờ bắt đầu.
2. Copy **nguyên khối** dưới đây (đã có sẵn trong ô Prompt của lượt 1 trong báo cáo), dán vào chat, gửi:

```text
Thiết kế prototype cho ứng dụng theo dõi sức khoẻ gồm hai phân hệ, giao diện tiếng Việt: phân hệ smartwatch (khổ màn hình đồng hồ thông minh) và phân hệ smartphone (khổ màn hình điện thoại). Người dùng đeo đồng hồ khi tập luyện; đồng hồ ghi nhận hoạt động, ứng dụng trên điện thoại hiển thị và phân tích kết quả. Prototype gồm các màn hình đủ để thể hiện các chức năng dưới đây.

Phân hệ smartwatch.
Theo dõi hoạt động: đồng hồ tự nhận biết loại hoạt động (đi bộ, chạy bộ, đạp xe, bơi lội) và hiển thị loại hoạt động đó. Hiển thị thông tin hiện thời gồm quãng đường, thời gian di chuyển, tốc độ trung bình và nhịp tim hiện tại. Có lệnh kết thúc hoạt động.
Kết thúc và đồng bộ: khi người dùng kết thúc, đồng hồ ngừng theo dõi và thông báo đã ghi nhận hoạt động. Thông tin hoạt động được lưu tạm trên đồng hồ và tự động đồng bộ lên điện thoại qua Bluetooth khi hai thiết bị ghép đôi; hiển thị trạng thái đồng bộ (chờ ghép đôi, đang đồng bộ, đã đồng bộ).

Phân hệ smartphone.
Danh sách hoạt động: danh sách hoạt động xếp theo trình tự thời gian, mỗi dòng gồm tên hoạt động, loại (đi bộ, chạy bộ, đạp xe, bơi lội), ngày giờ và quãng đường. Phía trên danh sách hiển thị tổng số hoạt động và tổng quãng đường, cho chọn thống kê theo tuần, tháng hoặc năm.
Chi tiết hoạt động: mở từ một hoạt động trong danh sách. Hiển thị lộ trình trên bản đồ; tổng thời gian, tổng quãng đường, lượng calo tiêu thụ, độ cao thay đổi. Cho chuyển sang xem thống kê tốc độ hoặc nhịp tim, gồm giá trị trung bình trên toàn lộ trình, giá trị theo từng km và biểu đồ thay đổi theo thời gian. Có nút chia sẻ kết quả lên mạng xã hội.
Lịch biểu và mục tiêu: tạo lịch biểu cho hoạt động lặp lại, gồm tên hoạt động, loại hoạt động (đi bộ, chạy bộ, đạp xe, bơi lội, khác), tần suất (mỗi ngày hoặc chọn các ngày trong tuần), bật hoặc tắt nhắc nhở và số phút nhắc trước. Đặt mục tiêu theo quãng đường, thời gian hoặc tốc độ trung bình.

Dùng dữ liệu mẫu tự đặt, không dùng dữ liệu cá nhân thật.

Danh sách màn hình:
Phân hệ smartwatch (khổ đồng hồ thông minh):
1. Đang theo dõi hoạt động
2. Kết thúc và đồng bộ
Phân hệ smartphone (khổ điện thoại):
3. Danh sách hoạt động
4. Chi tiết hoạt động
5. Lịch biểu và mục tiêu
```

3. Chụp **từng** màn hình, đặt tên theo danh sách ảnh ở đầu bước này. Công cụ không ra màn hình nào thì để nguyên ảnh mẫu và ghi vào Quan sát.
4. Ghi Quan sát: ra mấy màn hình, có khổ đồng hồ không, công cụ có hỏi lại gì không (nếu hỏi, trả lời ngắn và ghi câu hỏi vào ô "Công cụ hỏi lại").
5. Chấm cột **Lượt 1** trong bảng SK (mục 3.4) theo tiêu chí mục 2.3. Chỉ chấm thứ nhìn thấy trong prototype. Ghi mã màn hình vào cột MH.
6. Chép số tổng tự tính (ví dụ `14/24 (W 5/8, P 9/16)`) vào ô Số đủ của lượt 1.
7. Thấy thành phần thừa hoặc sai: chụp ảnh `B1_LOI_1.png`, `B1_LOI_2.png`… và điền một dòng ở mục 06.

## Bước 3. Bài 1: lượt 2 đến 10

Điền vào: **mục 03** (một dòng nhật ký mỗi lượt). Ảnh lượt cuối: `B1_LC_W1.png`, `B1_LC_W2.png`, `B1_LC_P1.png`, `B1_LC_P2.png`, `B1_LC_P3.png`

Mỗi lượt sửa một màn hình hoặc một lỗi lớn. Sau mỗi lượt: ghi nhật ký, chấm lại những dòng thay đổi, ghi số đủ. Đủ 24 thì dừng sớm; hết lượt 10 thì dừng. Ghi "Dừng ở lượt … vì …".

**Mẫu A** (thường dùng ở lượt 2 nếu thiếu màn hình đồng hồ hoặc sai khổ):

```text
Phân hệ smartwatch phải ở khổ màn hình đồng hồ thông minh, tách riêng khỏi ứng dụng điện thoại. Tạo 2 màn hình đồng hồ: Đang theo dõi hoạt động và Kết thúc và đồng bộ. Giữ nguyên các màn hình điện thoại.
```

**Mẫu B** (màn hình còn thiếu thành phần; chép đúng câu chữ của đề):

```text
Màn hình [tên màn hình] còn thiếu: [chép đúng câu chữ của đề cho từng thành phần thiếu]. Bổ sung các phần này vào màn hình đó, giữ nguyên các thành phần và màn hình đã có.
```

Ví dụ: `Màn hình Kết thúc và đồng bộ còn thiếu: hiển thị trạng thái đồng bộ (chờ ghép đôi, đang đồng bộ, đã đồng bộ). Bổ sung các phần này vào màn hình đó, giữ nguyên các thành phần và màn hình đã có.`

**Mẫu C** (thành phần sai):

```text
Màn hình [tên]: [thành phần] đang [mô tả điều sai]. Sửa thành [đúng theo đề, ghi rõ đơn vị nếu cần]. Không thay đổi phần khác.
```

Ví dụ: `Màn hình Danh sách hoạt động: có nút Bắt đầu hoạt động, trong khi việc ghi nhận hoạt động thuộc đồng hồ. Bỏ nút này khỏi điện thoại. Không thay đổi phần khác.`

Khi xong lượt cuối: chụp lại cả 5 màn hình với tên `B1_LC_…`, chấm cột **Lượt cuối** trong bảng SK. Nếu một lượt làm mất thành phần đã có, ghi vào Quan sát và đánh dấu để dùng cho câu hỏi 5 và phần giới hạn.

## Bước 4. Bài 1: ba yêu cầu chỉnh sửa

Điền vào: dòng CS-1.1 đến CS-3.3 của nhật ký mục 03, và **mục 05**. Ảnh: `B1_CS1_rong.png`, `B1_CS1_codulieu.png`, `B1_CS3_luong.png`, `B1_CS2_W1.png`, `B1_CS2_W2.png`, `B1_CS2_P1.png`, `B1_CS2_P2.png`, `B1_CS2_P3.png`

Làm trên bản lượt cuối. Mỗi yêu cầu tối đa 3 lượt. Nếu cần lượt 2, 3: gửi lại đúng prompt đó kèm một câu nêu chỗ còn thiếu (ví dụ `Màn hình Lịch biểu và mục tiêu vẫn dùng font cũ.`).

**CS-1:**

```text
Thêm trạng thái cho màn hình danh sách hoạt động khi chưa có hoạt động nào: hiển thị thông báo và nút hướng dẫn ghép đôi với đồng hồ thông minh.
```

Kiểm tra: chụp trạng thái rỗng, rồi chụp màn hình có dữ liệu và xem còn đủ SK-09 đến SK-11 không. Chọn Đạt / Không đạt và ghi số thành phần bị mất ở mục 05.

**CS-2:**

```text
Đổi giao diện sang bảng màu và font sau, áp dụng cho tất cả màn hình: màu chính #0F766E, màu nhấn #D97706, nền #F8FAF7, chữ chính #1C2B2A, màu báo lỗi #B42318; font Be Vietnam Pro.
```

Nếu Claude Design cho tạo hoặc nạp design system, dán nội dung dưới đây làm nguồn và áp dụng cho dự án, rồi ghi "nạp bằng design system" vào nhật ký và mục 2.5. Không tìm thấy chức năng đó thì gửi prompt trên qua chat.

```markdown
# Design system: Nhóm 04 BT06
## Colors
- primary: #0F766E
- accent: #D97706
- background: #F8FAF7
- text: #1C2B2A
- error: #B42318
## Typography
- font-family: "Be Vietnam Pro", sans-serif
```

Kiểm tra: chụp 5 màn hình `B1_CS2_…`. Đếm số màn hình đổi đúng **cả màu lẫn font** (trên 5), ghi màn hình nào còn màu/font cũ.

**CS-3:**

```text
Làm cho prototype bấm chuyển được giữa các màn hình theo luồng sau: trên đồng hồ, lệnh kết thúc hoạt động chuyển sang màn hình kết thúc và đồng bộ; trên điện thoại, chạm một hoạt động trong danh sách mở chi tiết hoạt động và có nút quay lại danh sách; thanh điều hướng chuyển giữa danh sách hoạt động và lịch biểu theo cả hai chiều.
```

Kiểm tra: bấm thử C1 đến C5 (mục 2.4), chọn Có / Không ở mục 5.1. **Quay màn hình** lúc bấm (Windows: `Win + Alt + R` với Xbox Game Bar, hoặc Snipping Tool chế độ quay video); đoạn này dùng làm video dự phòng. Không bấm được thì ghi "không thực hiện được" và lý do.

Sau bài 1: ghi hạn mức vào ô "sau bài 1", chụp `CC_04_han_muc_sau_bai1.png`.

## Bước 5. Bài 2: lượt 1 đến 10

Điền vào: **mục 04**. Ảnh lượt đầu: `B2_L1_D1.png`, `B2_L1_D2.png`, `B2_L1_D3.png`, `B2_L1_D4.png`, `B2_L1_D5.png`, `B2_L1_D6.png` · Ảnh lượt cuối: `B2_LC_D1.png`, `B2_LC_D2.png`, `B2_LC_D3.png`, `B2_LC_D4.png`, `B2_LC_D5.png`, `B2_LC_D6.png`

1. Tạo dự án `BT06 Bai2 DauGia`. Dán nguyên khối dưới đây (đã có sẵn trong ô Prompt lượt 1 của mục 04):

```text
Thiết kế prototype cho sàn đấu giá trực tuyến, giao diện web tiếng Việt, khổ màn hình máy tính. Sàn kết nối người bán và người mua bằng phương thức đấu giá; sản phẩm thuộc về người mua ra giá cao nhất. Người bán và người mua phải đăng ký tài khoản và đăng nhập để sử dụng. Số tiền tính bằng đồng. Prototype gồm các màn hình đủ để thể hiện các chức năng dưới đây.

Đăng ký và đăng nhập: người dùng đăng ký tài khoản hoặc đăng nhập. Sau khi đăng nhập, người bán vào chức năng đăng sản phẩm và người mua vào chức năng tìm kiếm.

Đăng sản phẩm đấu giá (người bán): nhập thông tin mô tả sản phẩm gồm tên gọi, chủng loại, kích cỡ, trọng lượng, tình trạng; giá khởi điểm; thời hạn đấu giá mặc định 7 ngày, có thể gia hạn thêm với phụ phí 5.000 đồng mỗi ngày; giá bán tối thiểu là tùy chọn, phụ phí 10.000 đồng khi thiết lập; phương thức giao nhận gồm miễn phí giao hàng, người mua đến lấy, giao hàng qua công ty chuyển phát. Hiển thị chi phí đăng sản phẩm theo công thức: chi phí gốc 10.000 đồng + phí gia hạn (nếu có) + phí giá tối thiểu (nếu có).

Tìm kiếm sản phẩm (người mua): tìm các sản phẩm đang đấu giá theo tên sản phẩm, chủng loại, giá hiện tại, hình thức giao nhận. Danh sách kết quả hiển thị tên sản phẩm và giá hiện tại.

Chi tiết sản phẩm và ra giá: mở từ một sản phẩm trong kết quả tìm kiếm. Hiển thị thông tin mô tả, giá hiện tại, thời hạn đấu giá và chi phí giao nhận; với giao hàng qua công ty chuyển phát, chi phí lấy từ hệ thống tính phí của công ty chuyển phát. Người mua ra giá: giá phải lớn hơn giá hiện tại và là bội số của 5.000 đồng; ra giá sai quy tắc thì hiển thị thông báo lỗi.

Kết quả đấu giá: sản phẩm kết thúc đấu giá khi hết thời hạn. Nếu giá kết thúc thấp hơn giá bán tối thiểu, giao dịch không được thực hiện và cả người bán lẫn người mua không phải trả chi phí nào. Nếu không, giao dịch được thực hiện: người bán bị tính chi phí đăng sản phẩm; người mua nhận hóa đơn tiền mua = giá kết thúc đấu giá + chi phí giao nhận (nếu có). Sau giao dịch, người bán và người mua phản hồi về chất lượng giao dịch (sản phẩm đúng mô tả, giao hàng tốt, người mua trả tiền đúng hạn).

Dùng dữ liệu mẫu tự đặt.

Danh sách màn hình:
1. Đăng ký tài khoản
2. Đăng nhập
3. Đăng sản phẩm đấu giá (người bán)
4. Tìm kiếm sản phẩm và danh sách kết quả (người mua)
5. Chi tiết sản phẩm và ra giá (người mua)
6. Kết quả đấu giá và phản hồi giao dịch
```

2. Làm 7 việc như Bước 2 (ảnh `B2_L1_…`, nhật ký, chấm cột Lượt 1 bảng DG, ghi số đủ, thừa/sai vào mục 06 với ảnh `B2_LOI_…`).
3. Lượt 2 đến 10: dùng Mẫu B, Mẫu C ở Bước 3, cộng thêm 3 mẫu riêng cho tiền:

**Mẫu D** (chi phí đăng sai công thức):

```text
Màn hình Đăng sản phẩm đấu giá: chi phí đăng sản phẩm phải tính theo công thức chi phí gốc 10.000 đồng + phí gia hạn 5.000 đồng mỗi ngày (nếu có) + phí giá tối thiểu 10.000 đồng (nếu có). Ví dụ gia hạn 3 ngày và có giá tối thiểu thì chi phí đăng là 35.000 đồng. Hiển thị từng khoản và tổng. Không thay đổi phần khác.
```

**Mẫu E** (ra giá không báo lỗi):

```text
Màn hình Chi tiết sản phẩm và ra giá: giá ra phải lớn hơn giá hiện tại và là bội số của 5.000 đồng. Với giá hiện tại 250.000 đồng: nhập 250.000 hoặc 252.000 phải hiển thị thông báo lỗi, nhập 255.000 là hợp lệ. Thêm thông báo lỗi nhìn thấy được. Không thay đổi phần khác.
```

**Mẫu F** (thiếu trường hợp không đạt giá tối thiểu):

```text
Màn hình Kết quả đấu giá: thêm trường hợp giá kết thúc thấp hơn giá bán tối thiểu: giao dịch không được thực hiện, người bán và người mua đều không trả chi phí nào (0 đồng). Giữ nguyên trường hợp giao dịch thành công.
```

Phí giao nhận (DG-17): nếu công cụ tự đưa ra một con số, không tốn lượt để sửa; chấm S và ghi "chưa kiểm chứng nguồn phí" ở mục 06.

4. Xong lượt cuối: chụp 6 màn hình `B2_LC_…`, chấm cột Lượt cuối bảng DG.

## Bước 6. Bài 2: ca thử tiền và ba yêu cầu chỉnh sửa

Điền vào: **mục 4.5** và **mục 05**. Ảnh: `B2_TIEN_P4.png`, `B2_TIEN_R3.png`, `B2_TIEN_K1.png`, `B2_TIEN_K2.png`, `B2_CS1_rong.png`, `B2_CS1_codulieu.png`, `B2_CS3_luong.png`, `B2_CS2_D1.png`, `B2_CS2_D2.png`, `B2_CS2_D3.png`, `B2_CS2_D4.png`, `B2_CS2_D5.png`, `B2_CS2_D6.png`

1. Chạy 11 ca thử ở mục 4.5 trên prototype lượt cuối: nhập dữ liệu, ghi "Prototype ra", chọn Đúng / Sai. Không nhập được thì so số mẫu trên màn hình và chọn "Không chạy được". Chụp 4 ảnh `B2_TIEN_…`.
2. CS-1:

```text
Thêm trạng thái cho màn hình tìm kiếm khi không có sản phẩm nào phù hợp với tiêu chí tìm kiếm: hiển thị thông báo và gợi ý đổi tiêu chí.
```

Kiểm tra màn hình có kết quả còn đủ DG-10 đến DG-14.

3. CS-2: dùng đúng prompt (hoặc design system) như bài 1. Đếm trên **6** màn hình, ảnh `B2_CS2_…`.
4. CS-3:

```text
Làm cho prototype bấm chuyển được giữa các màn hình theo luồng sau: sau khi đăng nhập, người bán vào màn hình đăng sản phẩm và người mua vào màn hình tìm kiếm; chạm một sản phẩm trong kết quả tìm kiếm mở chi tiết sản phẩm, có nút quay lại kết quả tìm kiếm; từ chi tiết sản phẩm xem được kết quả đấu giá.
```

Bấm thử C1 đến C5 của bài 2, quay màn hình.

5. Ghi hạn mức "sau bài 2", chụp `CC_05_han_muc_sau_bai2.png`.

## Bước 7. Thử xuất và đánh giá

Điền vào: **mục 07** và **8.1**. Ảnh: `XT_1_html.png`, `XT_2_pdf.png`, `XT_3_pptx.png`, `XT_4_canva.png`, `XT_5_goi_ban_giao.png`

1. Từ prototype cuối của mỗi bài, thử từng cách xuất mà đề nêu: HTML độc lập, PDF, PPTX, Canva, gói bàn giao cho Claude Code.
    - HTML: mở trên trình duyệt chưa đăng nhập Claude (cửa sổ ẩn danh cũng được), bấm thử 5 chuyển CS-3.
    - PPTX: mở bằng PowerPoint hoặc Google Slides, xem font và chữ tiếng Việt.
    - Gói bàn giao: giải nén, ghi **tên từng tệp** vào mục 01 (dòng gói bàn giao) và mục 7.2.
    - Chỉ chọn nhãn **Đã chạy** khi đã xuất và mở được.
2. Trả lời 7 câu hỏi ở mục 7.1. Cột Bằng chứng ghi dòng nhật ký (ví dụ "B1 lượt 4") hoặc tên ảnh.
3. Chọn 3 giới hạn (mục 7.3), mỗi cái có bằng chứng. Nguồn dễ tìm nhất: lỗi lặp lại dù đã nhắc; sai phân hệ hoặc sai quy tắc tiền; mất thành phần khi chỉnh sửa, hoặc màn hình không đổi font.
4. Viết khuyến nghị (mục 7.4): một trường hợp nên dùng, một trường hợp không nên dùng, đều gắn bằng chứng.
5. Xem bảng 8.1 (tự tính). Điền lượt làm số đủ tăng nhiều nhất của mỗi bài và lý do.

## Bước 8. Slide, video, nộp bài

Điền vào: **mục 8.2, 8.3, 09**.

1. Bấm **Lưu file đã điền** và chép đè file báo cáo.
2. Làm slide theo bảng 8.2 (10 slide). Muốn mình dựng slide PPTX: gửi vào thread này file `BT06_BaoCao.html` đã lưu và thư mục `anh/` (nén zip), kèm câu: `Dựng slide BT06 từ báo cáo này`.
3. Video dự phòng: cắt đoạn quay CS-3 của hai bài còn ≤ 90 giây (mỗi bài khoảng 45 giây). Che email tài khoản.
4. Tập nói 2 lần, ghi thời gian vào mục 8.2 (phải ≤ 8 phút). Điền câu trả lời hỏi đáp ở 8.3.
5. Phụ lục: bấm **In / xuất PDF** trong báo cáo, chọn "Lưu dưới dạng PDF". Dùng bản PDF này làm Phụ lục A (mục 03, 04) và Phụ lục B (bảng SK, DG); nếu cần tách, chọn trang khi in.
6. Gom tệp theo bảng 9.2 và tích checklist 9.3. Dòng nào chưa tích được thì chưa nộp.

---

## Danh sách 62 tên ảnh

| Tên file | Nội dung | Chụp lúc |
|---|---|---|
| `CC_01_goi_tai_khoan.png` | Trang gói của tài khoản Claude (Pro / Max / Team) | Bước 0 |
| `CC_02_trang_thai_san_pham.png` | Giao diện Claude Design, thấy nhãn trạng thái (research preview hay không) | Bước 0 |
| `CC_03_han_muc_truoc.png` | Hạn mức trước khi chạy bài 1 | Bước 0 |
| `CC_04_han_muc_sau_bai1.png` | Hạn mức sau khi xong bài 1 (gồm cả CS) | Sau Bước 4 bài 1 |
| `CC_05_han_muc_sau_bai2.png` | Hạn mức sau khi xong bài 2 (gồm cả CS) | Sau Bước 4 bài 2 |
| `CC_06_thu_kho_dong_ho.png` | Kết quả prompt thử khổ đồng hồ (dự án nháp) | Bước 0 |
| `B1_L1_W1.png` | Bài 1 lượt đầu, Đồng hồ: Đang theo dõi hoạt động | Ngay sau lượt 1 bài 1 |
| `B1_L1_W2.png` | Bài 1 lượt đầu, Đồng hồ: Kết thúc và đồng bộ | Ngay sau lượt 1 bài 1 |
| `B1_L1_P1.png` | Bài 1 lượt đầu, Điện thoại: Danh sách hoạt động | Ngay sau lượt 1 bài 1 |
| `B1_L1_P2.png` | Bài 1 lượt đầu, Điện thoại: Chi tiết hoạt động | Ngay sau lượt 1 bài 1 |
| `B1_L1_P3.png` | Bài 1 lượt đầu, Điện thoại: Lịch biểu và mục tiêu | Ngay sau lượt 1 bài 1 |
| `B1_LC_W1.png` | Bài 1 lượt cuối, Đồng hồ: Đang theo dõi hoạt động | Sau lượt cuối phần thành phần bài 1 |
| `B1_LC_W2.png` | Bài 1 lượt cuối, Đồng hồ: Kết thúc và đồng bộ | Sau lượt cuối phần thành phần bài 1 |
| `B1_LC_P1.png` | Bài 1 lượt cuối, Điện thoại: Danh sách hoạt động | Sau lượt cuối phần thành phần bài 1 |
| `B1_LC_P2.png` | Bài 1 lượt cuối, Điện thoại: Chi tiết hoạt động | Sau lượt cuối phần thành phần bài 1 |
| `B1_LC_P3.png` | Bài 1 lượt cuối, Điện thoại: Lịch biểu và mục tiêu | Sau lượt cuối phần thành phần bài 1 |
| `B1_CS1_rong.png` | Bài 1 CS-1: danh sách hoạt động khi chưa có hoạt động nào | Sau CS-1 bài 1 |
| `B1_CS1_codulieu.png` | Bài 1 CS-1: danh sách hoạt động có dữ liệu (kiểm tra còn đủ SK-09 đến SK-11) | Sau CS-1 bài 1 |
| `B1_CS2_W1.png` | Bài 1 sau CS-2, Đồng hồ: Đang theo dõi hoạt động | Sau CS-2 bài 1 |
| `B1_CS2_W2.png` | Bài 1 sau CS-2, Đồng hồ: Kết thúc và đồng bộ | Sau CS-2 bài 1 |
| `B1_CS2_P1.png` | Bài 1 sau CS-2, Điện thoại: Danh sách hoạt động | Sau CS-2 bài 1 |
| `B1_CS2_P2.png` | Bài 1 sau CS-2, Điện thoại: Chi tiết hoạt động | Sau CS-2 bài 1 |
| `B1_CS2_P3.png` | Bài 1 sau CS-2, Điện thoại: Lịch biểu và mục tiêu | Sau CS-2 bài 1 |
| `B1_CS3_luong.png` | Bài 1 CS-3: ảnh đang bấm chuyển màn hình (hoặc sơ đồ luồng của công cụ) | Sau CS-3 bài 1 |
| `B1_LOI_1.png` | Bài 1: thành phần thừa hoặc sai số 1 | Khi phát hiện |
| `B1_LOI_2.png` | Bài 1: thành phần thừa hoặc sai số 2 | Khi phát hiện |
| `B1_LOI_3.png` | Bài 1: thành phần thừa hoặc sai số 3 | Khi phát hiện |
| `B1_LOI_4.png` | Bài 1: thành phần thừa hoặc sai số 4 | Khi phát hiện |
| `B2_L1_D1.png` | Bài 2 lượt đầu, Đăng ký tài khoản | Ngay sau lượt 1 bài 2 |
| `B2_L1_D2.png` | Bài 2 lượt đầu, Đăng nhập | Ngay sau lượt 1 bài 2 |
| `B2_L1_D3.png` | Bài 2 lượt đầu, Đăng sản phẩm đấu giá | Ngay sau lượt 1 bài 2 |
| `B2_L1_D4.png` | Bài 2 lượt đầu, Tìm kiếm và kết quả | Ngay sau lượt 1 bài 2 |
| `B2_L1_D5.png` | Bài 2 lượt đầu, Chi tiết sản phẩm và ra giá | Ngay sau lượt 1 bài 2 |
| `B2_L1_D6.png` | Bài 2 lượt đầu, Kết quả đấu giá và phản hồi | Ngay sau lượt 1 bài 2 |
| `B2_LC_D1.png` | Bài 2 lượt cuối, Đăng ký tài khoản | Sau lượt cuối phần thành phần bài 2 |
| `B2_LC_D2.png` | Bài 2 lượt cuối, Đăng nhập | Sau lượt cuối phần thành phần bài 2 |
| `B2_LC_D3.png` | Bài 2 lượt cuối, Đăng sản phẩm đấu giá | Sau lượt cuối phần thành phần bài 2 |
| `B2_LC_D4.png` | Bài 2 lượt cuối, Tìm kiếm và kết quả | Sau lượt cuối phần thành phần bài 2 |
| `B2_LC_D5.png` | Bài 2 lượt cuối, Chi tiết sản phẩm và ra giá | Sau lượt cuối phần thành phần bài 2 |
| `B2_LC_D6.png` | Bài 2 lượt cuối, Kết quả đấu giá và phản hồi | Sau lượt cuối phần thành phần bài 2 |
| `B2_TIEN_P4.png` | Ca P-4: gia hạn 3 ngày, có giá tối thiểu, chi phí đăng hiển thị | Khi chạy ca thử |
| `B2_TIEN_R3.png` | Ca R-3: ra giá 252.000 khi giá hiện tại 250.000 (thông báo lỗi) | Khi chạy ca thử |
| `B2_TIEN_K1.png` | Ca K-1: giá kết thúc thấp hơn giá tối thiểu | Khi chạy ca thử |
| `B2_TIEN_K2.png` | Ca K-2: giao dịch thành công, hóa đơn và phí người bán | Khi chạy ca thử |
| `B2_CS1_rong.png` | Bài 2 CS-1: tìm kiếm không có kết quả | Sau CS-1 bài 2 |
| `B2_CS1_codulieu.png` | Bài 2 CS-1: tìm kiếm có kết quả (kiểm tra còn đủ DG-10 đến DG-14) | Sau CS-1 bài 2 |
| `B2_CS2_D1.png` | Bài 2 sau CS-2, Đăng ký tài khoản | Sau CS-2 bài 2 |
| `B2_CS2_D2.png` | Bài 2 sau CS-2, Đăng nhập | Sau CS-2 bài 2 |
| `B2_CS2_D3.png` | Bài 2 sau CS-2, Đăng sản phẩm đấu giá | Sau CS-2 bài 2 |
| `B2_CS2_D4.png` | Bài 2 sau CS-2, Tìm kiếm và kết quả | Sau CS-2 bài 2 |
| `B2_CS2_D5.png` | Bài 2 sau CS-2, Chi tiết sản phẩm và ra giá | Sau CS-2 bài 2 |
| `B2_CS2_D6.png` | Bài 2 sau CS-2, Kết quả đấu giá và phản hồi | Sau CS-2 bài 2 |
| `B2_CS3_luong.png` | Bài 2 CS-3: ảnh đang bấm chuyển màn hình | Sau CS-3 bài 2 |
| `B2_LOI_1.png` | Bài 2: thành phần thừa hoặc sai số 1 | Khi phát hiện |
| `B2_LOI_2.png` | Bài 2: thành phần thừa hoặc sai số 2 | Khi phát hiện |
| `B2_LOI_3.png` | Bài 2: thành phần thừa hoặc sai số 3 | Khi phát hiện |
| `B2_LOI_4.png` | Bài 2: thành phần thừa hoặc sai số 4 | Khi phát hiện |
| `XT_1_html.png` | Tệp HTML độc lập mở trong trình duyệt | Bước 5 |
| `XT_2_pdf.png` | Tệp PDF xuất ra, đã mở | Bước 5 |
| `XT_3_pptx.png` | Tệp PPTX mở bằng PowerPoint hoặc Google Slides | Bước 5 |
| `XT_4_canva.png` | Thiết kế xuất sang Canva (nếu làm được) | Bước 5 |
| `XT_5_goi_ban_giao.png` | Danh sách tệp trong gói bàn giao cho Claude Code | Bước 5 |

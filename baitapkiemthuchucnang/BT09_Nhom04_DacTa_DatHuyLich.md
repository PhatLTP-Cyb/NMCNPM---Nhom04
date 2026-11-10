# BT09 · Đặc tả chức năng Đặt lịch khám và Hủy lịch khám – Phòng khám An Tâm

Nhóm 04 · Lớp 24_3 · **Đặc tả phiên bản 1.0** (10/11/2026) · Trích từ Mini-SRS BT04 phiên bản 1.2

| Phiên bản | Ngày | Nội dung | Lý do |
|---|---|---|---|
| 1.0 | 10/11/2026 | Trích FR-01, FR-02, FR-03, FR-04, FR-06, FR-07, FR-09, FR-14 (một phần), SC-01, SC-02, SC-03 (luồng hủy) từ Mini-SRS 1.2; chốt các câu hỏi mở Q-01, Q-03, Q-05, Q-07 bằng giả định ASM-18…ASM-23 và quy tắc BR-01…BR-10 | Bài tập tuần 8: cần đặc tả đủ cụ thể để viết kết quả mong đợi |

> Nếu đặc tả thay đổi trong lúc kiểm thử: tăng phiên bản, ghi lý do ở bảng trên và cập nhật test case liên quan. Không sửa đặc tả chỉ để biến một ca "Không đạt" thành "Đạt".

---

## 1. Phạm vi

### 1.1 Hai chức năng được chọn

| Chức năng | Yêu cầu gốc (Mini-SRS 1.2) | Ghi chú |
|---|---|---|
| **CN-1 · Đặt lịch khám** | FR-01, FR-02, FR-03, FR-04, FR-07, FR-09; SC-01, SC-02 | Chỉ hình thức **tại phòng khám** |
| **CN-2 · Hủy lịch khám** | FR-06, FR-04, FR-09, FR-14 (bệnh nhân xem lịch của mình); SC-03 luồng 1a, 2a | Chỉ lịch tại phòng khám |

**Dữ liệu dùng chung:** khung giờ khám (số chỗ đã đặt), lịch hẹn (trạng thái), hồ sơ bệnh nhân, thông báo. Đặt lịch làm khung giờ hết chỗ; hủy lịch mở lại khung đó; quy tắc BR-04 chỉ tính lịch còn hiệu lực nên hủy lịch ảnh hưởng tới lần đặt kế tiếp của chính bệnh nhân đó.

### 1.2 Trong phạm vi

- Giao diện bệnh nhân: xem khung giờ, xác thực bằng số điện thoại + OTP giả lập, khai thông tin, đặt lịch, xem lịch của mình, hủy lịch.
- Giao diện phía phòng khám **chỉ đọc**: danh sách lịch theo bác sĩ và ngày (FR-09), nhật ký thông báo đã gửi (FR-04).
- Trang **Trạng thái dữ liệu** phục vụ kiểm thử: phiên bản app, đồng hồ hệ thống giả lập, bảng dữ liệu, nút reset dữ liệu mẫu.
- Lưu trữ dữ liệu trong SQLite.

### 1.3 Ngoài phạm vi

| Nội dung | Yêu cầu gốc | Lý do |
|---|---|---|
| Khám trực tuyến, thanh toán, giữ chỗ chờ thanh toán, hoàn tiền | FR-15…FR-19, phần trực tuyến của FR-01, FR-02, FR-04, FR-06 | Đề bài loại CR-01 khỏi phạm vi |
| Đổi lịch | FR-05 | Nhóm chọn cặp Đặt + Hủy |
| Nhân viên đặt/hủy thay, đăng nhập, phân quyền | FR-08, FR-13 | Đăng nhập không là chức năng chính; tài khoản phòng khám không cần cho hai chức năng |
| Quản lý lịch làm việc bác sĩ, bác sĩ nghỉ đột xuất | FR-11, FR-12 | Lịch làm việc và ngày nghỉ được chuẩn bị sẵn trong dữ liệu mẫu |
| Gửi SMS/email thật | FR-04 (kênh gửi, Q-07) | Chưa chốt kênh; hệ thống chỉ ghi bản ghi thông báo |
| Yêu cầu phi chức năng | NFR-01…NFR-09 | Bài tập tập trung kiểm thử chức năng |

---

## 2. Giả định đã chốt (bổ sung cho mục 1.7 Mini-SRS)

| ID | Nội dung | Thay cho câu hỏi mở |
|---|---|---|
| ASM-02 *(chốt)* | Mỗi khung giờ nhận tối đa **1 bệnh nhân** | Q-01 |
| ASM-12 *(chốt)* | Mỗi khung giờ dài **20 phút** | Q-01 |
| ASM-18 | Bệnh nhân chỉ được hủy lịch khi thời điểm bắt đầu khung còn cách thời điểm hiện tại **ít nhất 24 giờ** | Q-03 |
| ASM-19 | Xác thực bệnh nhân bằng số điện thoại + mã OTP. Trong bản này OTP được **giả lập**, mã cố định `123456` hiển thị trên màn hình | ASM-11 |
| ASM-20 | Bệnh nhân cũ được nhận ra bằng **số điện thoại**; mỗi số điện thoại ứng với tối đa một hồ sơ | Q-05 |
| ASM-21 | Thông tin bắt buộc của bệnh nhân mới: họ tên, ngày sinh, giới tính, số điện thoại. Lý do khám không bắt buộc | Q-05 |
| ASM-22 | Thông báo được ghi nhận vào nhật ký thông báo với kênh "SMS (giả lập)", trạng thái "Đã gửi"; không gửi thật | Q-07 |
| ASM-23 | Mọi quy tắc thời gian dùng **đồng hồ hệ thống** của app. Trong môi trường kiểm thử, đồng hồ được đặt trên trang Trạng thái dữ liệu; giá trị mặc định sau reset là **16/11/2026 08:00** | — |

---

## 3. Quy tắc nghiệp vụ

| ID | Quy tắc | Căn cứ |
|---|---|---|
| **BR-01** | Một khung giờ có **lịch còn hiệu lực** (trạng thái "Đã xác nhận") bằng giới hạn (1) là **hết chỗ**. Số lịch còn hiệu lực của một khung không bao giờ vượt giới hạn, kể cả khi hai yêu cầu đến cùng lúc: chỉ một yêu cầu thành công | FR-03, ASM-02 |
| **BR-02** | Chỉ nhận đặt khung có thời điểm bắt đầu cách hiện tại **từ 24 giờ đến 14 ngày** (cả hai đầu đều nhận). Ví dụ đồng hồ 16/11/2026 08:00: khung 17/11 08:00 được đặt; 30/11 08:00 được đặt; 30/11 08:20 không được đặt | Quy tắc nhóm chốt |
| **BR-03** | Chỉ hủy được lịch "Đã xác nhận" có thời điểm bắt đầu cách hiện tại **ít nhất 24 giờ** (đúng 24 giờ vẫn hủy được). Lịch đã qua giờ khám cũng thuộc trường hợp không hủy được | FR-06, ASM-18, SC-03 2a |
| **BR-04** | Một bệnh nhân không được có hai lịch còn hiệu lực **cùng thời điểm bắt đầu**, và không được có quá **1 lịch còn hiệu lực với cùng một bác sĩ trong cùng một ngày**. Lịch đã hủy không tính | Quy tắc nhóm chốt |
| **BR-05** | Số điện thoại hợp lệ: đúng 10 chữ số, bắt đầu bằng 0. Mã OTP phải bằng `123456`; sai OTP thì không thực hiện thao tác | ASM-19 |
| **BR-06** | Bệnh nhân mới: họ tên 2–100 ký tự (sau khi bỏ khoảng trắng đầu cuối); ngày sinh là ngày hợp lệ, không sau ngày hiện tại; giới tính là Nam, Nữ hoặc Khác; lý do khám tối đa 500 ký tự. Bệnh nhân cũ: hệ thống dùng hồ sơ đã có, **không tạo hồ sơ mới và không sửa hồ sơ cũ** | FR-07, ASM-20, ASM-21 |
| **BR-07** | Đặt thành công tạo lịch trạng thái "Đã xác nhận" với **mã lịch duy nhất** dạng `LH` + 6 chữ số | FR-01, FR-04 |
| **BR-08** | Sau mỗi lần đặt hoặc hủy **thành công** có **đúng một** thông báo được ghi nhận cho bệnh nhân, nội dung gồm: mã lịch, bác sĩ, chuyên khoa, hình thức khám, ngày giờ. Thao tác bị từ chối không sinh thông báo | FR-04 |
| **BR-09** | Hủy lịch phải qua **bước xác nhận**; chọn "Không" thì không có gì thay đổi. Hủy thành công: lịch chuyển "Bệnh nhân hủy", khung còn chỗ trở lại, lịch không còn trong danh sách của bác sĩ. Bệnh nhân chỉ xem và hủy được lịch của chính mình | FR-06, FR-14, SC-03 1a |
| **BR-10** | Khung giờ của bác sĩ nghỉ hoặc không có lịch làm việc thì không hiển thị là còn chỗ và không đặt được | FR-02, SC-02 2a |

---

## 4. Đặc tả CN-1 · Đặt lịch khám

**Tác nhân:** Bệnh nhân · **Tiền điều kiện:** bác sĩ có lịch làm việc với khung còn chỗ.

### 4.1 Luồng chính (từ SC-01, bản chỉ có hình thức tại phòng khám)

1. Bệnh nhân chọn chuyên khoa, bác sĩ, ngày. Hình thức khám là "Tại phòng khám".
2. Hệ thống hiển thị **mọi khung** của bác sĩ trong ngày, mỗi khung có một trạng thái: **Còn chỗ** (chọn được), **Hết chỗ**, **Ngoài thời hạn đặt** (vi phạm BR-02). (FR-02)
3. Bệnh nhân chọn một khung "Còn chỗ".
4. Bệnh nhân nhập số điện thoại và mã OTP. Hệ thống kiểm tra BR-05.
   - Số điện thoại đã có hồ sơ: hệ thống hiển thị "Bệnh nhân cũ" kèm họ tên, ngày sinh, giới tính; không yêu cầu nhập lại.
   - Số điện thoại mới: hệ thống yêu cầu họ tên, ngày sinh, giới tính (BR-06).
5. Bệnh nhân (tùy chọn) nhập lý do khám và gửi yêu cầu đặt lịch.
6. Hệ thống kiểm tra lại toàn bộ quy tắc ở thời điểm gửi (BR-01, BR-02, BR-04, BR-05, BR-06, BR-10), tạo lịch "Đã xác nhận" kèm mã lịch (BR-07), tăng số chỗ đã đặt của khung.
7. Hệ thống ghi một thông báo "Xác nhận đặt lịch" (BR-08) và hiển thị trang kết quả gồm mã lịch, bác sĩ, chuyên khoa, hình thức, ngày giờ. Lịch xuất hiện trong danh sách của bác sĩ ngày đó (FR-09).

### 4.2 Luồng thay thế / ngoại lệ

| Mã | Điều kiện | Phản hồi của hệ thống | Dữ liệu |
|---|---|---|---|
| 2a | Bác sĩ nghỉ hoặc không làm việc ngày đã chọn (BR-10) | Báo "Bác sĩ không làm việc vào ngày này", không có khung nào chọn được | Không đổi |
| 4a | Số điện thoại sai định dạng hoặc OTP sai (BR-05) | Báo lỗi tương ứng, không cho tiếp tục | Không đổi |
| 5a | Thiếu hoặc sai trường bắt buộc của bệnh nhân mới (BR-06) | Báo rõ trường nào lỗi, không gửi | Không tạo lịch, không tạo hồ sơ |
| 6a | Khung vừa hết chỗ (SC-02) | Báo "Khung giờ đã hết chỗ", hiển thị lại danh sách khung đã cập nhật | Không tạo lịch; số chỗ không đổi |
| 6b | Khung không còn trong thời hạn đặt (BR-02) | Báo "Chỉ nhận đặt lịch trước ít nhất 24 giờ và không quá 14 ngày" | Không tạo lịch |
| 6c | Bệnh nhân đã có lịch khác cùng thời điểm (BR-04) | Báo "Bạn đã có lịch khác vào cùng thời điểm" | Không tạo lịch |
| 6d | Bệnh nhân đã có lịch với bác sĩ này trong ngày (BR-04) | Báo "Bạn đã có lịch với bác sĩ này trong ngày" | Không tạo lịch |

### 4.3 Hậu điều kiện

- **Thành công:** thêm 1 lịch "Đã xác nhận"; khung chuyển "Hết chỗ"; thêm 1 thông báo; thêm 1 hồ sơ nếu là bệnh nhân mới, 0 nếu là bệnh nhân cũ.
- **Thất bại:** không thêm lịch, hồ sơ hay thông báo; số chỗ của khung không đổi.

---

## 5. Đặc tả CN-2 · Hủy lịch khám

**Tác nhân:** Bệnh nhân · **Tiền điều kiện:** bệnh nhân có lịch "Đã xác nhận".

### 5.1 Luồng chính (từ SC-03 luồng 1a)

1. Bệnh nhân mở "Lịch hẹn của tôi", nhập số điện thoại và OTP (BR-05).
2. Hệ thống hiển thị **mọi lịch của bệnh nhân này** (mọi trạng thái), mỗi lịch có mã, bác sĩ, chuyên khoa, ngày giờ, trạng thái. Lịch "Đã xác nhận" có nút "Hủy lịch". (FR-14, BR-09)
3. Bệnh nhân chọn "Hủy lịch" ở một lịch.
4. Hệ thống hiển thị hộp xác nhận nêu mã lịch, bác sĩ, ngày giờ.
5. Bệnh nhân chọn "Đồng ý hủy".
6. Hệ thống kiểm tra BR-03, chuyển lịch sang "Bệnh nhân hủy", giảm số chỗ đã đặt của khung (khung "Còn chỗ" trở lại nếu vẫn trong thời hạn đặt).
7. Hệ thống ghi một thông báo "Hủy lịch bởi bệnh nhân" (BR-08), cập nhật danh sách lịch trên màn hình. Lịch không còn trong danh sách của bác sĩ (FR-09).

### 5.2 Luồng thay thế / ngoại lệ

| Mã | Điều kiện | Phản hồi của hệ thống | Dữ liệu |
|---|---|---|---|
| 1a | Số điện thoại sai định dạng hoặc OTP sai | Báo lỗi, không hiển thị lịch nào | Không đổi |
| 1b | Số điện thoại hợp lệ nhưng chưa có hồ sơ | Báo "Không có lịch hẹn nào" | Không đổi |
| 2a | Lịch không ở trạng thái "Đã xác nhận" | Không có nút "Hủy lịch" | Không đổi |
| 5a | Bệnh nhân chọn "Không" ở hộp xác nhận | Đóng hộp xác nhận | Không đổi, không có thông báo |
| 6a | Còn dưới 24 giờ tới giờ khám hoặc đã qua giờ khám (BR-03, SC-03 2a) | Báo "Chỉ được hủy lịch trước giờ khám ít nhất 24 giờ" | Lịch giữ nguyên; không có thông báo |

### 5.3 Hậu điều kiện

- **Thành công:** lịch "Bệnh nhân hủy"; khung giảm 1 chỗ đã đặt; thêm đúng 1 thông báo hủy; lịch không còn trong danh sách bác sĩ.
- **Thất bại:** lịch, khung, thông báo không đổi.

---

## 6. Điểm đã làm rõ so với Mini-SRS 1.2

| # | Điểm trong Mini-SRS | Cách làm rõ |
|---|---|---|
| 1 | Q-01: độ dài khung và số bệnh nhân/khung | 20 phút, 1 bệnh nhân (ASM-02, ASM-12) |
| 2 | Q-03: hạn chót hủy | ≥ 24 giờ trước giờ khám (ASM-18, BR-03); SC-03 luồng 2a nay kiểm thử được (giải quyết ISS-10) |
| 3 | Q-05: thông tin tối thiểu và cách nhận ra bệnh nhân cũ | ASM-20, ASM-21, BR-06 |
| 4 | ASM-11: xác thực qua số điện thoại | OTP giả lập mã cố định (ASM-19) |
| 5 | Q-07: kênh thông báo | Chỉ ghi nhận bản ghi thông báo (ASM-22) |
| 6 | FR-02: "loại bỏ hoặc đánh dấu hết chỗ" | Chọn **đánh dấu**: hiển thị mọi khung kèm trạng thái |
| 7 | Mini-SRS không giới hạn số lịch của một bệnh nhân và khoảng thời gian được đặt trước | Thêm BR-02, BR-04 |
| 8 | FR-06 "hủy lịch sắp tới" không nói lịch đã qua | Lịch đã qua không hủy được (BR-03) |
| 9 | FR-09 "danh sách theo ngày, ca" | Danh sách chỉ gồm lịch "Đã xác nhận", sắp theo giờ |

---

## 7. Dữ liệu mẫu (trạng thái sau khi reset)

**Đồng hồ hệ thống:** 16/11/2026 08:00 (thứ Hai). **OTP giả lập:** `123456`.

**Lịch làm việc:** mọi bác sĩ làm từ thứ Hai đến thứ Bảy, 16/11/2026 – 05/12/2026. Ca sáng 6 khung: 08:00, 08:20, 08:40, 09:00, 09:20, 09:40. Ca chiều 6 khung: 14:00, 14:20, 14:40, 15:00, 15:20, 15:40. Chủ nhật (22/11, 29/11) không có khung.

| Mã | Bác sĩ | Chuyên khoa | Phòng | Ghi chú |
|---|---|---|---|---|
| BS01 | Lê Minh Hoàng | Nội tổng quát | P101 | |
| BS02 | Phạm Thu Hà | Nội tổng quát | P102 | |
| BS03 | Nguyễn Quốc Bảo | Nhi | P201 | |
| BS04 | Đỗ Thanh Tâm | Da liễu | P202 | |
| BS05 | Hoàng Gia Huy | Tai Mũi Họng | P301 | **Nghỉ cả ngày 18/11/2026** |
| BS06 | Vũ Ngọc Lan | Răng Hàm Mặt | P302 | |

| Mã BN | Họ tên | Ngày sinh | Giới tính | Số điện thoại |
|---|---|---|---|---|
| BN01 | Nguyễn Văn An | 12/05/1990 | Nam | 0901000001 |
| BN02 | Trần Thị Bình | 20/08/1985 | Nữ | 0901000002 |
| BN03 | Lê Văn Cường | 03/01/1978 | Nam | 0901000003 |

| Mã lịch | Bệnh nhân | Bác sĩ | Ngày giờ | Trạng thái |
|---|---|---|---|---|
| LH000001 | BN01 Nguyễn Văn An | BS01 | 18/11/2026 08:00 | Đã xác nhận |
| LH000002 | BN02 Trần Thị Bình | BS01 | 17/11/2026 08:00 | Đã xác nhận |
| LH000003 | BN02 Trần Thị Bình | BS03 | 19/11/2026 09:00 | Bệnh nhân hủy |
| LH000004 | BN03 Lê Văn Cường | BS02 | 20/11/2026 14:00 | Đã xác nhận |

**Thông báo có sẵn:** 5 bản ghi (xác nhận đặt cho LH000001…LH000004 và thông báo hủy của LH000003). Lịch mới được cấp mã từ **LH000005**.

# BT09 · Manual test case – Đặt lịch và Hủy lịch khám, Phòng khám An Tâm

Nhóm 04 · Căn cứ: **Đặc tả phiên bản 1.0** (`BT09_Nhom04_DacTa_DatHuyLich.md`) · App kiểm thử: xem phiên bản ở góc phải trên mọi màn hình

> Kết quả mong đợi được viết **từ đặc tả**, không từ cách app đang chạy. Nếu app khác kết quả mong đợi, ghi "Không đạt" và lập báo cáo lỗi; chỉ sửa test case khi đặc tả đổi phiên bản.

## 0. Quy ước chung

**Tên màn hình (thanh menu trên cùng của app):** *Đặt lịch khám* · *Lịch hẹn của tôi* · *Danh sách lịch bác sĩ* · *Nhật ký thông báo* · *Trạng thái dữ liệu*.

**R0 · Reset trước mỗi ca:** mở *Trạng thái dữ liệu* → bấm **Reset dữ liệu mẫu** → xác nhận. Kiểm tra trạng thái ban đầu:

| Mục | Giá trị sau reset |
|---|---|
| Đồng hồ hệ thống | 16/11/2026 08:00 |
| Số bệnh nhân | 3 (BN01, BN02, BN03) |
| Số lịch hẹn | 4: LH000001, LH000002, LH000004 "Đã xác nhận"; LH000003 "Bệnh nhân hủy" |
| Số thông báo | 5 |

Dữ liệu mẫu chi tiết: mục 7 của đặc tả. OTP giả lập: `123456`.

**Đặt đồng hồ:** *Trạng thái dữ liệu* → ô **Đồng hồ hệ thống** → nhập ngày giờ → **Đặt đồng hồ**. Đồng hồ hiện ở góc phải trên mọi màn hình.

**Thao tác đặt lịch chuẩn (ĐL):** *Đặt lịch khám* → chọn Chuyên khoa, Bác sĩ, Ngày khám → **Xem khung giờ** → bấm khung giờ → nhập Số điện thoại → **Gửi OTP** → nhập Mã OTP → **Xác thực** → (bệnh nhân mới) nhập Họ tên, Ngày sinh, Giới tính → (tùy chọn) Lý do khám → **Đặt lịch**.

**Thao tác hủy lịch chuẩn (HL):** *Lịch hẹn của tôi* → nhập Số điện thoại → **Gửi OTP** → nhập Mã OTP → **Xem lịch hẹn** → bấm **Hủy lịch** ở dòng cần hủy → hộp xác nhận → **Đồng ý hủy** hoặc **Không**.

---

## 1. Danh sách test case

| ID | Chức năng | Mục tiêu | Loại |
|---|---|---|---|
| TC-D01 | Đặt lịch | Bệnh nhân mới đặt thành công | Thành công |
| TC-D02 | Đặt lịch | Bệnh nhân cũ đặt, không tạo hồ sơ trùng | Thành công |
| TC-D03 | Đặt lịch | Thiếu trường bắt buộc bị chặn | Ngoại lệ |
| TC-D04 | Đặt lịch | Dữ liệu sai định dạng bị chặn | Ngoại lệ |
| TC-D05 | Đặt lịch | Sai OTP bị chặn | Ngoại lệ |
| TC-D06 | Đặt lịch | Danh sách khung hiển thị đúng trạng thái | Quy tắc |
| TC-D07 | Đặt lịch | Bác sĩ nghỉ / ngày không làm việc | Ngoại lệ |
| TC-D08 | Đặt lịch | Khung vừa bị người khác đặt (SC-02) | Ngoại lệ |
| TC-D09 | Đặt lịch | Hai yêu cầu đồng thời vào khung còn 1 chỗ | Quy tắc |
| TC-D10 | Đặt lịch | Biên 24 giờ: dưới ngưỡng bị từ chối | Biên |
| TC-D11 | Đặt lịch | Biên 24 giờ: đúng ngưỡng được đặt | Biên |
| TC-D12 | Đặt lịch | Biên 14 ngày | Biên |
| TC-D13 | Đặt lịch | Trùng giờ với lịch khác của chính mình | Quy tắc |
| TC-D14 | Đặt lịch | Lịch thứ hai cùng bác sĩ cùng ngày | Quy tắc |
| TC-H01 | Hủy lịch | Hủy thành công | Thành công |
| TC-H02 | Hủy lịch | Chọn "Không" ở bước xác nhận | Luồng thay thế |
| TC-H03 | Hủy lịch | Dưới 24 giờ bị từ chối | Biên / Ngoại lệ |
| TC-H04 | Hủy lịch | Đúng 24 giờ được hủy | Biên |
| TC-H05 | Hủy lịch | Lịch đã qua giờ khám không hủy được | Ngoại lệ |
| TC-H06 | Hủy lịch | Chỉ thấy lịch của mình; lịch đã hủy không có nút hủy | Quy tắc |
| TC-H07 | Hủy lịch | Sai OTP / số điện thoại chưa có hồ sơ | Ngoại lệ |
| TC-LQ01 | Cả hai | Đặt → hết chỗ → hủy → người khác đặt lại được | Liên quan |
| TC-LQ02 | Cả hai | Hủy lịch rồi đặt lại cùng bác sĩ cùng ngày | Liên quan |
| TC-LQ03 | Cả hai | Lịch vừa đặt, tới sát giờ khám thì không hủy được | Liên quan |

---

## 2. Test case chi tiết – CN-1 Đặt lịch khám

### TC-D01 · Bệnh nhân mới đặt lịch thành công

| Trường | Nội dung |
|---|---|
| Mục tiêu | Bệnh nhân chưa có hồ sơ đặt được lịch tại phòng khám; dữ liệu và thông báo đúng sau khi đặt |
| Yêu cầu liên quan | FR-01, FR-02, FR-03, FR-04, FR-07, FR-09; SC-01 luồng chính; BR-01, BR-06, BR-07, BR-08 |
| Tiền điều kiện | R0. Đồng hồ 16/11/2026 08:00 |
| Dữ liệu | Da liễu · BS Đỗ Thanh Tâm · 19/11/2026 · khung 09:00 · SĐT 0912345678 · OTP 123456 · Họ tên "Phạm Thị Dung" · Ngày sinh 15/03/1995 · Giới tính Nữ · Lý do "Nổi mẩn đỏ ở tay" |

**Các bước**
1. *Đặt lịch khám*: chọn Da liễu, BS Đỗ Thanh Tâm, ngày 19/11/2026 → **Xem khung giờ**.
2. Quan sát khung 09:00.
3. Bấm khung 09:00, nhập SĐT 0912345678 → **Gửi OTP** → nhập 123456 → **Xác thực**.
4. Nhập Họ tên, Ngày sinh, Giới tính, Lý do theo dữ liệu → **Đặt lịch**.
5. Mở *Danh sách lịch bác sĩ*: BS Đỗ Thanh Tâm, 19/11/2026 → **Xem danh sách**.
6. Mở *Nhật ký thông báo*, lọc mã lịch vừa nhận.
7. Mở *Trạng thái dữ liệu*, xem số bệnh nhân, số lịch hẹn, số thông báo.
8. Quay lại *Đặt lịch khám*, xem khung giờ BS Đỗ Thanh Tâm 19/11/2026.

**Kết quả mong đợi**
- Bước 2: khung 09:00 "Còn chỗ".
- Bước 3: hệ thống yêu cầu nhập thông tin bệnh nhân mới (không hiện "Bệnh nhân cũ").
- Bước 4: báo đặt lịch thành công, mã lịch **LH000005**, trạng thái "Đã xác nhận", hiển thị BS Đỗ Thanh Tâm, Da liễu, Tại phòng khám, 19/11/2026 09:00.
- Bước 5: đúng 1 lịch: 09:00 · LH000005 · Phạm Thị Dung.
- Bước 6: đúng 1 thông báo của LH000005, loại "Xác nhận đặt lịch", nội dung có LH000005, Đỗ Thanh Tâm, Da liễu, Tại phòng khám, 19/11/2026 09:00.
- Bước 7: bệnh nhân 4, lịch hẹn 5, thông báo 6.
- Bước 8: khung 09:00 "Hết chỗ".

### TC-D02 · Bệnh nhân cũ đặt lịch, không tạo hồ sơ trùng

| Trường | Nội dung |
|---|---|
| Mục tiêu | Hệ thống nhận ra bệnh nhân theo số điện thoại, dùng hồ sơ cũ |
| Yêu cầu liên quan | FR-07, FR-01; SC-01 bước 4; ASM-20; BR-06 |
| Tiền điều kiện | R0 |
| Dữ liệu | Răng Hàm Mặt · BS Vũ Ngọc Lan · 21/11/2026 · 08:00 · SĐT 0901000003 (BN03 Lê Văn Cường) · OTP 123456 |

**Các bước**
1. Thực hiện ĐL với dữ liệu trên đến bước **Xác thực**.
2. Quan sát phần thông tin bệnh nhân.
3. Bấm **Đặt lịch**.
4. *Trạng thái dữ liệu*: xem số bệnh nhân và bảng Lịch hẹn.

**Kết quả mong đợi**
- Bước 2: hiện "Bệnh nhân cũ: Lê Văn Cường · 03/01/1978 · Nam"; không có ô nhập Họ tên, Ngày sinh, Giới tính.
- Bước 3: đặt thành công, mã LH000005.
- Bước 4: số bệnh nhân vẫn **3**; LH000005 thuộc BN03; BN03 có 2 lịch "Đã xác nhận" (LH000004, LH000005).

### TC-D03 · Thiếu trường bắt buộc

| Trường | Nội dung |
|---|---|
| Mục tiêu | Không cho gửi khi thiếu thông tin bắt buộc; báo đúng trường thiếu; không sinh dữ liệu |
| Yêu cầu liên quan | FR-07; SC-01 luồng 5a; BR-06; Mini-SRS TC-02 |
| Tiền điều kiện | R0 |
| Dữ liệu | Da liễu · BS Đỗ Thanh Tâm · 19/11/2026 · 08:00 · SĐT 0912000001 · OTP 123456 |

**Các bước**
1. Thực hiện ĐL đến bước **Xác thực** (hệ thống yêu cầu thông tin bệnh nhân mới).
2. (a) Để trống Họ tên, Ngày sinh, Giới tính → **Đặt lịch**.
3. (b) Họ tên "Hồ Văn Em", Ngày sinh 01/01/2000, Giới tính để "-- Chọn --" → **Đặt lịch**.
4. (c) Họ tên chỉ gồm 3 dấu cách, Ngày sinh 01/01/2000, Giới tính Nam → **Đặt lịch**.
5. *Trạng thái dữ liệu*: xem số bệnh nhân, lịch hẹn, thông báo.
6. Quay lại, nhập đủ: Họ tên "Hồ Văn Em", Ngày sinh 01/01/2000, Giới tính Nam → **Đặt lịch**.

**Kết quả mong đợi**
- Bước 2: báo lỗi nêu đủ 3 trường Họ tên, Ngày sinh, Giới tính; không có mã lịch.
- Bước 3: báo lỗi chỉ nêu Giới tính.
- Bước 4: báo lỗi chỉ nêu Họ tên.
- Bước 5: bệnh nhân 3, lịch hẹn 4, thông báo 5 (không đổi so với R0).
- Bước 6: đặt thành công LH000005; bệnh nhân 4.

### TC-D04 · Dữ liệu sai định dạng

| Trường | Nội dung |
|---|---|
| Mục tiêu | Từ chối số điện thoại, ngày sinh, họ tên không hợp lệ |
| Yêu cầu liên quan | FR-07; BR-05, BR-06 |
| Tiền điều kiện | R0. Đồng hồ 16/11/2026 08:00 |
| Dữ liệu | Da liễu · BS Đỗ Thanh Tâm · 19/11/2026 · 08:00 |

**Các bước**
1. Bấm khung 08:00, nhập SĐT `090100000` (9 chữ số) → **Gửi OTP**.
2. Nhập SĐT `09010000ab` → **Gửi OTP**.
3. Nhập SĐT `0912000002` → **Gửi OTP** → OTP 123456 → **Xác thực**.
4. Họ tên "Hồ Văn Em", Ngày sinh **17/11/2026**, Giới tính Nam → **Đặt lịch**.
5. Họ tên "A", Ngày sinh 01/01/2000, Giới tính Nam → **Đặt lịch**.
6. *Trạng thái dữ liệu*: xem số bệnh nhân, lịch hẹn, thông báo.

**Kết quả mong đợi**
- Bước 1, 2: báo "Số điện thoại phải gồm 10 chữ số và bắt đầu bằng 0"; không hiện mã OTP.
- Bước 4: báo ngày sinh không được sau ngày hiện tại; không tạo lịch.
- Bước 5: báo họ tên phải từ 2 đến 100 ký tự; không tạo lịch.
- Bước 6: bệnh nhân 3, lịch hẹn 4, thông báo 5.

### TC-D05 · Sai OTP

| Trường | Nội dung |
|---|---|
| Mục tiêu | Không xác thực và không đặt được khi OTP sai |
| Yêu cầu liên quan | ASM-19; BR-05; SC-01 bước 4 |
| Tiền điều kiện | R0 |
| Dữ liệu | Da liễu · BS Đỗ Thanh Tâm · 19/11/2026 · 08:00 · SĐT 0901000001 · OTP **654321** |

**Các bước**
1. Thực hiện ĐL đến bước nhập OTP, nhập 654321 → **Xác thực**.
2. Quan sát phần thông tin bệnh nhân và nút **Đặt lịch**.
3. *Trạng thái dữ liệu*: xem số lịch hẹn.

**Kết quả mong đợi**
- Bước 1: báo "Mã OTP không đúng".
- Bước 2: không hiện thông tin "Bệnh nhân cũ", không đặt được lịch.
- Bước 3: lịch hẹn 4.

### TC-D06 · Danh sách khung hiển thị đúng trạng thái

| Trường | Nội dung |
|---|---|
| Mục tiêu | Mỗi khung hiển thị đúng Còn chỗ / Hết chỗ / Ngoài thời hạn đặt; lịch đã hủy không chiếm chỗ |
| Yêu cầu liên quan | FR-02, FR-03; BR-01, BR-02 |
| Tiền điều kiện | R0. Đồng hồ 16/11/2026 08:00 |
| Dữ liệu | Nội tổng quát · BS Lê Minh Hoàng (BS01) · ngày 18/11, 17/11, 16/11/2026; Nhi · BS Nguyễn Quốc Bảo (BS03) · 19/11/2026 |

**Các bước**
1. Xem khung giờ BS01 ngày 18/11/2026.
2. Xem khung giờ BS01 ngày 17/11/2026.
3. Xem khung giờ BS01 ngày 16/11/2026.
4. Xem khung giờ BS03 ngày 19/11/2026.

**Kết quả mong đợi**
- Bước 1: 12 khung; 08:00 "Hết chỗ" (LH000001); 11 khung còn lại "Còn chỗ".
- Bước 2: 08:00 "Hết chỗ" (LH000002); 11 khung còn lại "Còn chỗ".
- Bước 3: cả 12 khung "Ngoài thời hạn đặt" (đều cách hiện tại dưới 24 giờ); không bấm chọn được.
- Bước 4: 09:00 "Còn chỗ" (LH000003 đã hủy không chiếm chỗ); cả 12 khung "Còn chỗ".

### TC-D07 · Bác sĩ nghỉ / ngày không làm việc

| Trường | Nội dung |
|---|---|
| Mục tiêu | Không có khung nào đặt được khi bác sĩ nghỉ hoặc không có lịch làm việc |
| Yêu cầu liên quan | FR-02; SC-02 luồng 2a; BR-10 |
| Tiền điều kiện | R0 |
| Dữ liệu | Tai Mũi Họng · BS Hoàng Gia Huy (BS05) · 18/11/2026 (nghỉ) và 19/11/2026; BS Lê Minh Hoàng · 22/11/2026 (Chủ nhật) |

**Các bước**
1. Xem khung giờ BS05 ngày 18/11/2026.
2. Xem khung giờ BS05 ngày 19/11/2026.
3. Xem khung giờ BS Lê Minh Hoàng ngày 22/11/2026.

**Kết quả mong đợi**
- Bước 1: báo "Bác sĩ không làm việc vào ngày này"; không có khung nào chọn được.
- Bước 2 (đối chứng): 12 khung "Còn chỗ".
- Bước 3: báo "Bác sĩ không làm việc vào ngày này".

### TC-D08 · Khung vừa bị người khác đặt

| Trường | Nội dung |
|---|---|
| Mục tiêu | Yêu cầu thứ hai vào khung đã hết chỗ bị từ chối, danh sách khung được cập nhật |
| Yêu cầu liên quan | FR-03, FR-02; SC-02 luồng chính; SC-01 6a; BR-01 |
| Tiền điều kiện | R0. Mở **2 tab** trình duyệt cùng ở *Đặt lịch khám* |
| Dữ liệu | Nội tổng quát · BS Phạm Thu Hà (BS02) · 19/11/2026 · 08:00. Tab 1: SĐT 0901000001 (BN01). Tab 2: SĐT 0901000002 (BN02). OTP 123456 |

**Các bước**
1. Tab 1: thực hiện ĐL đến bước **Xác thực** (chưa bấm Đặt lịch).
2. Tab 2: thực hiện ĐL cùng khung đến bước **Xác thực** (chưa bấm Đặt lịch).
3. Tab 1: bấm **Đặt lịch**.
4. Tab 2: bấm **Đặt lịch**.
5. *Danh sách lịch bác sĩ*: BS02, 19/11/2026.
6. *Trạng thái dữ liệu*: số lịch hẹn, số thông báo.

**Kết quả mong đợi**
- Bước 3: tab 1 đặt thành công LH000005.
- Bước 4: tab 2 báo "Khung giờ đã hết chỗ"; danh sách khung tải lại, 08:00 "Hết chỗ"; không có mã lịch.
- Bước 5: đúng 1 lịch: 08:00 · LH000005 · Nguyễn Văn An.
- Bước 6: lịch hẹn 5, thông báo 6.

### TC-D09 · Hai yêu cầu đồng thời vào khung còn 1 chỗ

| Trường | Nội dung |
|---|---|
| Mục tiêu | Khi 2 yêu cầu đến cùng lúc, đúng 1 lịch được tạo |
| Yêu cầu liên quan | FR-03 (tiêu chí kiểm chứng); BR-01; Mini-SRS TC-03 |
| Tiền điều kiện | R0. App đang chạy. Mở thêm một cửa sổ dòng lệnh tại thư mục `app/` |
| Dữ liệu | Script gửi đồng thời 2 yêu cầu đặt BS Vũ Ngọc Lan (BS06) · 20/11/2026 · 09:00, của 2 bệnh nhân mới SĐT 0977000001 và 0977000002 |

**Các bước**
1. Chạy `npm run dong-thoi`.
2. Đọc kết quả in ra.
3. *Trạng thái dữ liệu*: chọn BS06, 20/11/2026 ở bảng Khung giờ.
4. *Danh sách lịch bác sĩ*: BS06, 20/11/2026.

**Kết quả mong đợi**
- Bước 2: đúng 1 yêu cầu thành công (có mã lịch), 1 yêu cầu báo hết chỗ.
- Bước 3: khung 09:00 có số chỗ đã đặt = 1, số lịch hiệu lực = 1, giới hạn = 1.
- Bước 4: đúng 1 lịch lúc 09:00.

> Ghi chú: ca này cần công cụ gửi yêu cầu song song vì thao tác tay không tạo được 2 yêu cầu thực sự cùng lúc. Script chỉ gửi yêu cầu; kết luận dựa trên dữ liệu quan sát ở bước 3, 4.

### TC-D10 · Biên 24 giờ – dưới ngưỡng bị từ chối

| Trường | Nội dung |
|---|---|
| Mục tiêu | Khung cách hiện tại dưới 24 giờ không được đặt, kể cả khi đã chọn từ trước |
| Yêu cầu liên quan | BR-02; SC-01 luồng 6b |
| Tiền điều kiện | R0. 2 tab: tab A ở *Đặt lịch khám*, tab B ở *Trạng thái dữ liệu* |
| Dữ liệu | BS Phạm Thu Hà (BS02) · 17/11/2026 · 08:00 · SĐT 0901000001 · OTP 123456 |

**Các bước**
1. Tab A: thực hiện ĐL với khung 08:00 đến bước **Xác thực** (đồng hồ đang 16/11/2026 08:00, khung "Còn chỗ").
2. Tab B: đặt đồng hồ **16/11/2026 08:01**.
3. Tab A: bấm **Đặt lịch**.
4. Tab A: xem lại khung giờ BS02 ngày 17/11/2026.

**Kết quả mong đợi**
- Bước 3: báo "Chỉ nhận đặt lịch trước ít nhất 24 giờ và không quá 14 ngày"; không có mã lịch.
- Bước 4: 08:00 "Ngoài thời hạn đặt"; 08:20 "Còn chỗ".
- Số lịch hẹn vẫn 4.

### TC-D11 · Biên 24 giờ – đúng ngưỡng được đặt

| Trường | Nội dung |
|---|---|
| Mục tiêu | Khung cách hiện tại đúng 24 giờ được đặt |
| Yêu cầu liên quan | BR-02 |
| Tiền điều kiện | R0. Đồng hồ 16/11/2026 08:00 |
| Dữ liệu | BS Phạm Thu Hà (BS02) · 17/11/2026 · 08:00 · SĐT 0901000001 · OTP 123456 |

**Các bước**
1. Xem khung giờ BS02 ngày 17/11/2026.
2. Thực hiện ĐL với khung 08:00 → **Đặt lịch**.

**Kết quả mong đợi**
- Bước 1: 08:00 "Còn chỗ".
- Bước 2: đặt thành công LH000005, 17/11/2026 08:00.

### TC-D12 · Biên 14 ngày

| Trường | Nội dung |
|---|---|
| Mục tiêu | Khung cách hiện tại đúng 14 ngày được đặt; xa hơn thì không |
| Yêu cầu liên quan | BR-02 |
| Tiền điều kiện | R0. Đồng hồ 16/11/2026 08:00 |
| Dữ liệu | BS Phạm Thu Hà (BS02) · 30/11/2026 và 01/12/2026 · SĐT 0901000001 · OTP 123456 |

**Các bước**
1. Xem khung giờ BS02 ngày 30/11/2026.
2. Xem khung giờ BS02 ngày 01/12/2026.
3. Thực hiện ĐL khung 30/11/2026 08:00 → **Đặt lịch**.

**Kết quả mong đợi**
- Bước 1: 08:00 "Còn chỗ"; 08:20 đến 15:40 (11 khung) "Ngoài thời hạn đặt".
- Bước 2: cả 12 khung "Ngoài thời hạn đặt".
- Bước 3: đặt thành công LH000005, 30/11/2026 08:00.

### TC-D13 · Trùng giờ với lịch khác của chính mình

| Trường | Nội dung |
|---|---|
| Mục tiêu | Không cho một bệnh nhân giữ 2 lịch cùng thời điểm |
| Yêu cầu liên quan | BR-04; SC-01 luồng 6c |
| Tiền điều kiện | R0. BN01 có LH000001 (BS01, 18/11/2026 08:00) |
| Dữ liệu | BS Phạm Thu Hà (BS02) · 18/11/2026 · 08:00 · SĐT 0901000001 · OTP 123456 |

**Các bước**
1. Thực hiện ĐL với dữ liệu trên → **Đặt lịch**.
2. *Trạng thái dữ liệu*: số lịch hẹn, thông báo; xem khung giờ BS02 18/11/2026.

**Kết quả mong đợi**
- Bước 1: báo "Bạn đã có lịch khác vào cùng thời điểm"; không có mã lịch.
- Bước 2: lịch hẹn 4, thông báo 5; khung BS02 18/11 08:00 vẫn "Còn chỗ".

### TC-D14 · Lịch thứ hai với cùng bác sĩ trong ngày

| Trường | Nội dung |
|---|---|
| Mục tiêu | Không cho quá 1 lịch hiệu lực với cùng bác sĩ trong ngày; ngày khác thì được |
| Yêu cầu liên quan | BR-04; SC-01 luồng 6d |
| Tiền điều kiện | R0. BN01 có LH000001 (BS01, 18/11/2026 08:00) |
| Dữ liệu | BS Lê Minh Hoàng (BS01) · 18/11/2026 09:00 và 19/11/2026 09:00 · SĐT 0901000001 · OTP 123456 |

**Các bước**
1. Thực hiện ĐL khung BS01 18/11/2026 09:00 → **Đặt lịch**.
2. Thực hiện ĐL khung BS01 19/11/2026 09:00 → **Đặt lịch**.

**Kết quả mong đợi**
- Bước 1: báo "Bạn đã có lịch với bác sĩ này trong ngày"; không tạo lịch.
- Bước 2 (đối chứng): đặt thành công LH000005.

---

## 3. Test case chi tiết – CN-2 Hủy lịch khám

### TC-H01 · Hủy lịch thành công

| Trường | Nội dung |
|---|---|
| Mục tiêu | Bệnh nhân hủy lịch hợp lệ; trạng thái, khung, danh sách bác sĩ và thông báo đúng |
| Yêu cầu liên quan | FR-06, FR-04, FR-09, FR-02; SC-03 luồng 1a; BR-03, BR-08, BR-09; Mini-SRS TC-06 |
| Tiền điều kiện | R0. Đồng hồ 16/11/2026 08:00. LH000001 "Đã xác nhận" (BS01, 18/11/2026 08:00, cách hiện tại 48 giờ) |
| Dữ liệu | SĐT 0901000001 · OTP 123456 · LH000001 |

**Các bước**
1. *Danh sách lịch bác sĩ*: BS Lê Minh Hoàng, 18/11/2026 → ghi nhận danh sách.
2. Thực hiện HL đến bước **Xem lịch hẹn**.
3. Bấm **Hủy lịch** ở LH000001; đọc hộp xác nhận.
4. Bấm **Đồng ý hủy**.
5. *Danh sách lịch bác sĩ*: BS Lê Minh Hoàng, 18/11/2026.
6. *Đặt lịch khám*: xem khung BS Lê Minh Hoàng 18/11/2026.
7. *Nhật ký thông báo*: lọc LH000001.
8. *Trạng thái dữ liệu*: xem khung BS01 18/11/2026 và số thông báo.

**Kết quả mong đợi**
- Bước 1: có LH000001 lúc 08:00.
- Bước 2: danh sách có LH000001 "Đã xác nhận" kèm nút **Hủy lịch**.
- Bước 3: hộp xác nhận ghi LH000001, BS Lê Minh Hoàng, 18/11/2026 08:00.
- Bước 4: báo hủy thành công; LH000001 chuyển "Bệnh nhân hủy", không còn nút Hủy lịch.
- Bước 5: không còn LH000001 (0 lịch).
- Bước 6: khung 08:00 "Còn chỗ".
- Bước 7: 2 thông báo của LH000001: "Xác nhận đặt lịch" (có sẵn) và **1** "Hủy lịch bởi bệnh nhân" mới, nội dung có LH000001, Lê Minh Hoàng, Nội tổng quát, 18/11/2026 08:00.
- Bước 8: khung 08:00 số chỗ đã đặt 0, số lịch hiệu lực 0; thông báo 6.

### TC-H02 · Chọn "Không" ở bước xác nhận

| Trường | Nội dung |
|---|---|
| Mục tiêu | Thoát hộp xác nhận không làm thay đổi dữ liệu |
| Yêu cầu liên quan | FR-06; SC-03 luồng 1a (bước xác nhận); BR-09 |
| Tiền điều kiện | R0 |
| Dữ liệu | SĐT 0901000001 · OTP 123456 · LH000001 |

**Các bước**
1. Thực hiện HL, bấm **Hủy lịch** ở LH000001 → **Không**.
2. Xem lại danh sách lịch; *Trạng thái dữ liệu*: số thông báo.

**Kết quả mong đợi**
- Bước 1: hộp xác nhận đóng, không có thông báo hủy thành công.
- Bước 2: LH000001 vẫn "Đã xác nhận" và còn nút Hủy lịch; thông báo 5.

### TC-H03 · Hủy khi còn dưới 24 giờ

| Trường | Nội dung |
|---|---|
| Mục tiêu | Từ chối hủy khi còn dưới 24 giờ tới giờ khám; lịch giữ nguyên |
| Yêu cầu liên quan | FR-06; SC-03 luồng 2a; BR-03; ASM-18 |
| Tiền điều kiện | R0, sau đó đặt đồng hồ **16/11/2026 08:01**. LH000002 (BN02, BS01, 17/11/2026 08:00) còn 23 giờ 59 phút |
| Dữ liệu | SĐT 0901000002 · OTP 123456 · LH000002 |

**Các bước**
1. Thực hiện HL: bấm **Hủy lịch** ở LH000002 → **Đồng ý hủy**.
2. Xem lại danh sách lịch của BN02.
3. *Danh sách lịch bác sĩ*: BS Lê Minh Hoàng, 17/11/2026.
4. *Nhật ký thông báo*: lọc LH000002.

**Kết quả mong đợi**
- Bước 1: báo "Chỉ được hủy lịch trước giờ khám ít nhất 24 giờ".
- Bước 2: LH000002 vẫn "Đã xác nhận".
- Bước 3: vẫn có LH000002 lúc 08:00.
- Bước 4: chỉ 1 thông báo "Xác nhận đặt lịch"; không có thông báo hủy.

### TC-H04 · Hủy khi còn đúng 24 giờ

| Trường | Nội dung |
|---|---|
| Mục tiêu | Còn đúng 24 giờ vẫn hủy được |
| Yêu cầu liên quan | BR-03 |
| Tiền điều kiện | R0. Đồng hồ 16/11/2026 08:00; LH000002 lúc 17/11/2026 08:00 |
| Dữ liệu | SĐT 0901000002 · OTP 123456 · LH000002 |

**Các bước**
1. Thực hiện HL: **Hủy lịch** LH000002 → **Đồng ý hủy**.

**Kết quả mong đợi**
- Hủy thành công; LH000002 "Bệnh nhân hủy"; có 1 thông báo hủy mới (tổng thông báo 6).

### TC-H05 · Lịch đã qua giờ khám

| Trường | Nội dung |
|---|---|
| Mục tiêu | Không hủy được lịch đã qua giờ khám |
| Yêu cầu liên quan | BR-03; FR-06 ("lịch sắp tới") |
| Tiền điều kiện | R0, sau đó đặt đồng hồ **18/11/2026 09:00**. LH000001 lúc 18/11/2026 08:00 |
| Dữ liệu | SĐT 0901000001 · OTP 123456 · LH000001 |

**Các bước**
1. Thực hiện HL: **Hủy lịch** LH000001 → **Đồng ý hủy**.
2. Xem lại danh sách lịch.

**Kết quả mong đợi**
- Bước 1: báo "Chỉ được hủy lịch trước giờ khám ít nhất 24 giờ".
- Bước 2: LH000001 vẫn "Đã xác nhận"; số thông báo vẫn 5.

### TC-H06 · Chỉ thấy lịch của mình; lịch đã hủy không có nút hủy

| Trường | Nội dung |
|---|---|
| Mục tiêu | Danh sách chỉ gồm lịch của bệnh nhân đã xác thực; chỉ lịch "Đã xác nhận" có nút hủy |
| Yêu cầu liên quan | FR-14 (phần bệnh nhân); BR-09; SC-03 luồng 2a của CN-2 |
| Tiền điều kiện | R0 |
| Dữ liệu | SĐT 0901000002 (BN02) · OTP 123456 |

**Các bước**
1. Thực hiện HL đến bước **Xem lịch hẹn**.

**Kết quả mong đợi**
- Đúng 2 lịch: LH000002 "Đã xác nhận" có nút **Hủy lịch**; LH000003 "Bệnh nhân hủy" **không** có nút.
- Không có LH000001, LH000004 (của bệnh nhân khác).

### TC-H07 · Sai OTP / số điện thoại chưa có hồ sơ

| Trường | Nội dung |
|---|---|
| Mục tiêu | Không lộ lịch khi xác thực sai; báo đúng khi chưa có hồ sơ |
| Yêu cầu liên quan | ASM-19; BR-05; CN-2 luồng 1a, 1b |
| Tiền điều kiện | R0 |
| Dữ liệu | (a) 0901000001 + OTP 111111 · (b) 0999999999 + OTP 123456 |

**Các bước**
1. *Lịch hẹn của tôi*: nhập (a) → **Xem lịch hẹn**.
2. Nhập (b) → **Xem lịch hẹn**.

**Kết quả mong đợi**
- Bước 1: báo "Mã OTP không đúng"; không hiện bảng lịch.
- Bước 2: báo "Không có lịch hẹn nào".

---

## 4. Test case liên quan cả hai chức năng

### TC-LQ01 · Đặt → hết chỗ → hủy → người khác đặt lại được

| Trường | Nội dung |
|---|---|
| Mục tiêu | Thao tác đặt và hủy trên cùng khung giờ phản ánh đúng cho nhau; số chỗ không lệch |
| Yêu cầu liên quan | FR-01, FR-02, FR-03, FR-04, FR-06, FR-09; SC-01, SC-02, SC-03 1a; BR-01, BR-08, BR-09 |
| Tiền điều kiện | R0 |
| Dữ liệu | Khung Da liễu · BS Đỗ Thanh Tâm · 20/11/2026 · 14:00. P1 (mới): SĐT 0933000001, "Ngô Minh Khoa", 07/07/1992, Nam. P2: BN02 SĐT 0901000002. OTP 123456 |

**Các bước**
1. P1 thực hiện ĐL vào khung 20/11/2026 14:00 → **Đặt lịch**.
2. Xem khung giờ BS Đỗ Thanh Tâm 20/11/2026 (vai P2).
3. P1 thực hiện HL: **Hủy lịch** lịch vừa đặt → **Đồng ý hủy**.
4. Xem lại khung giờ BS Đỗ Thanh Tâm 20/11/2026.
5. P2 thực hiện ĐL vào khung 14:00 → **Đặt lịch**.
6. *Danh sách lịch bác sĩ*: BS Đỗ Thanh Tâm, 20/11/2026.
7. *Trạng thái dữ liệu*: khung BS04 20/11/2026; bảng Lịch hẹn; số thông báo.

**Kết quả mong đợi**
- Bước 1: thành công, LH000005.
- Bước 2: 14:00 "Hết chỗ", không chọn được.
- Bước 3: LH000005 "Bệnh nhân hủy".
- Bước 4: 14:00 "Còn chỗ".
- Bước 5: thành công, LH000006.
- Bước 6: đúng 1 lịch: 14:00 · LH000006 · Trần Thị Bình.
- Bước 7: khung 14:00 số chỗ đã đặt 1 = số lịch hiệu lực 1, không vượt giới hạn 1; LH000005 "Bệnh nhân hủy", LH000006 "Đã xác nhận"; thông báo 8 (5 + đặt P1 + hủy P1 + đặt P2).

### TC-LQ02 · Hủy lịch rồi đặt lại cùng bác sĩ cùng ngày

| Trường | Nội dung |
|---|---|
| Mục tiêu | Lịch đã hủy không còn tính vào giới hạn 1 lịch/bác sĩ/ngày |
| Yêu cầu liên quan | BR-04, FR-06, FR-01 |
| Tiền điều kiện | R0. BN01 có LH000001 (BS01, 18/11/2026 08:00) |
| Dữ liệu | SĐT 0901000001 · OTP 123456 · khung BS Lê Minh Hoàng 18/11/2026 09:00 |

**Các bước**
1. BN01 thực hiện ĐL khung BS01 18/11/2026 09:00 → **Đặt lịch**.
2. BN01 thực hiện HL: hủy LH000001 → **Đồng ý hủy**.
3. BN01 thực hiện lại ĐL khung BS01 18/11/2026 09:00 → **Đặt lịch**.
4. *Danh sách lịch bác sĩ*: BS01, 18/11/2026.

**Kết quả mong đợi**
- Bước 1: báo "Bạn đã có lịch với bác sĩ này trong ngày".
- Bước 2: LH000001 "Bệnh nhân hủy".
- Bước 3: thành công, LH000005.
- Bước 4: đúng 1 lịch: 09:00 · LH000005 · Nguyễn Văn An; thông báo tổng 7.

### TC-LQ03 · Lịch vừa đặt, tới sát giờ khám thì không hủy được

| Trường | Nội dung |
|---|---|
| Mục tiêu | Lịch tạo bởi CN-1 tuân theo hạn hủy của CN-2 theo đồng hồ hệ thống |
| Yêu cầu liên quan | FR-01, FR-06; BR-02, BR-03 |
| Tiền điều kiện | R0 |
| Dữ liệu | BN03 SĐT 0901000003 · khung Nhi · BS Nguyễn Quốc Bảo · 18/11/2026 · 14:00 · OTP 123456 |

**Các bước**
1. BN03 thực hiện ĐL khung trên → **Đặt lịch**.
2. *Trạng thái dữ liệu*: đặt đồng hồ **17/11/2026 14:01**.
3. BN03 thực hiện HL: hủy lịch vừa đặt → **Đồng ý hủy**.
4. Đặt đồng hồ **17/11/2026 14:00**, thực hiện lại bước 3.

**Kết quả mong đợi**
- Bước 1: thành công LH000005.
- Bước 3: báo "Chỉ được hủy lịch trước giờ khám ít nhất 24 giờ"; LH000005 vẫn "Đã xác nhận".
- Bước 4: hủy thành công; LH000005 "Bệnh nhân hủy".

---

## 5. Bảng liên kết yêu cầu – test case

| Yêu cầu | Nội dung | Test case | Phần chưa được kiểm tra |
|---|---|---|---|
| FR-01 | Đặt lịch khám | D01, D02, D11, D12, LQ01, LQ02, LQ03 | Hình thức trực tuyến (ngoài phạm vi); số bước tối đa (Q-02) |
| FR-02 | Xem khung giờ khả dụng | D01, D06, D07, D08, D10, D12, H01, LQ01 | Khung đang giữ chờ thanh toán (ngoài phạm vi); thay đổi lịch làm việc (FR-12) |
| FR-03 | Không vượt giới hạn, chống đặt trùng | D06, D08, D09, LQ01 | Đồng thời ở mức tải cao (> 2 yêu cầu) |
| FR-04 | Thông báo | D01, H01, H03, H04, LQ01, LQ02 | Gửi thật qua SMS/email (Q-07); thông báo đổi lịch |
| FR-06 | Hủy lịch bởi bệnh nhân | H01–H05, LQ01–LQ03 | Lịch trực tuyến đã thanh toán ("chờ chính sách") – ngoài phạm vi |
| FR-07 | Thông tin bệnh nhân | D01–D05 | Sửa thông tin bệnh nhân cũ |
| FR-09 | Danh sách lịch của bác sĩ | D01, D08, H01, H03, LQ01, LQ02 | Lọc theo ca; quyền xem của bác sĩ (FR-13) |
| FR-14 | Bệnh nhân xem lịch của mình | H06, H07 | Nhân viên tra cứu theo mã lịch / SĐT |
| BR-01 | Giới hạn 1 bệnh nhân/khung | D06, D08, D09, LQ01 | — |
| BR-02 | Đặt trước 24 giờ – 14 ngày | D06, D10, D11, D12 | — |
| BR-03 | Hủy trước ≥ 24 giờ | H03, H04, H05, LQ03 | — |
| BR-04 | Không trùng giờ, 1 lịch/bác sĩ/ngày | D13, D14, LQ02 | — |
| BR-05 | SĐT + OTP | D04, D05, H07 | OTP thật, hết hạn OTP |
| BR-06 | Trường bắt buộc, bệnh nhân cũ | D02, D03, D04 | Họ tên dài hơn 100 ký tự; lý do khám dài hơn 500 ký tự |
| BR-07 | Mã lịch duy nhất | D01 và mọi ca đặt thành công | — |
| BR-08 | Đúng 1 thông báo / thao tác thành công | D01, D03, D08, D13, H01, H02, H03, LQ01 | — |
| BR-09 | Xác nhận hủy, chỉ lịch của mình | H01, H02, H06 | Gọi API trực tiếp để hủy lịch người khác |
| BR-10 | Bác sĩ nghỉ | D07 | Bác sĩ nghỉ một ca (chỉ có dữ liệu nghỉ cả ngày) |
| SC-01 | Đặt lịch thành công | D01, D02, D03, D05, D11 | Luồng 1a, 1a-1 (trực tuyến) |
| SC-02 | Khung không còn khả dụng | D07, D08 | Luồng 4a (hết khung cả ngày) chỉ kiểm tra gián tiếp qua D06 bước 3 |
| SC-03 | Đổi hoặc hủy lịch | H01–H05 (luồng 1a, 2a) | Luồng đổi lịch, 1a-1, 3a, 4a – ngoài phạm vi |

---

## 6. Kết quả từng lần chạy

> Ghi **mỗi lần chạy** một dòng; không xóa dòng của lần chạy trước khi chạy lại trên phiên bản mới. Trạng thái: **Đạt / Không đạt / Bị chặn / Chưa chạy**.

| Test case | Lần | Phiên bản app | Môi trường | Người thực hiện | Ngày | Kết quả thực tế | Trạng thái | Mã lỗi | Minh chứng (clip @ mốc / ảnh) |
|---|---|---|---|---|---|---|---|---|---|
| TC-D01 | 1 | | | | | | Chưa chạy | | |
| TC-D02 | 1 | | | | | | Chưa chạy | | |
| TC-D03 | 1 | | | | | | Chưa chạy | | |
| TC-D04 | 1 | | | | | | Chưa chạy | | |
| TC-D05 | 1 | | | | | | Chưa chạy | | |
| TC-D06 | 1 | | | | | | Chưa chạy | | |
| TC-D07 | 1 | | | | | | Chưa chạy | | |
| TC-D08 | 1 | | | | | | Chưa chạy | | |
| TC-D09 | 1 | | | | | | Chưa chạy | | |
| TC-D10 | 1 | | | | | | Chưa chạy | | |
| TC-D11 | 1 | | | | | | Chưa chạy | | |
| TC-D12 | 1 | | | | | | Chưa chạy | | |
| TC-D13 | 1 | | | | | | Chưa chạy | | |
| TC-D14 | 1 | | | | | | Chưa chạy | | |
| TC-H01 | 1 | | | | | | Chưa chạy | | |
| TC-H02 | 1 | | | | | | Chưa chạy | | |
| TC-H03 | 1 | | | | | | Chưa chạy | | |
| TC-H04 | 1 | | | | | | Chưa chạy | | |
| TC-H05 | 1 | | | | | | Chưa chạy | | |
| TC-H06 | 1 | | | | | | Chưa chạy | | |
| TC-H07 | 1 | | | | | | Chưa chạy | | |
| TC-LQ01 | 1 | | | | | | Chưa chạy | | |
| TC-LQ02 | 1 | | | | | | Chưa chạy | | |
| TC-LQ03 | 1 | | | | | | Chưa chạy | | |

**Gợi ý ca quay clip (mục 04 đề bài):** TC-D01 (thành công CN-1), TC-H01 (thành công CN-2), TC-H03 hoặc TC-D08 (ngoại lệ), TC-LQ01 (liên quan cả hai). Mỗi ca trong clip: hiện mã TC, phiên bản app và kết quả mong đợi → trạng thái ban đầu ở *Trạng thái dữ liệu* → các bước → kết quả thực tế và dữ liệu → kết luận.

---

## 7. Mẫu báo cáo lỗi

| Trường | Nội dung |
|---|---|
| Mã lỗi | BUG-01 |
| Tiêu đề | |
| Test case liên quan | |
| Phiên bản app / môi trường | |
| Điều kiện tái hiện | (dữ liệu, đồng hồ hệ thống) |
| Bước tái hiện | 1. … |
| Kết quả mong đợi | (trích từ test case, ghi căn cứ đặc tả) |
| Kết quả thực tế | |
| Minh chứng | (clip @ mốc / ảnh) |
| Ảnh hưởng | (người dùng / dữ liệu) |
| Phân loại | Lỗi triển khai / Thiếu hoặc sai trong đặc tả |
| Mức độ | Cao / Trung bình / Thấp |
| Tình trạng | Mới / Đang sửa / Đã sửa – chờ kiểm tra lại / Đóng / Không sửa |
| Sửa ở phiên bản | |
| Kết quả kiểm tra lại | (phiên bản mới, ngày, người chạy, trạng thái) |

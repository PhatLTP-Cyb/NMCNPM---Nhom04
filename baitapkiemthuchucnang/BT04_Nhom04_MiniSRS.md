# BT04 · Mini-SRS – Hệ thống quản lý lịch khám Phòng khám An Tâm

Nhóm 04 · Lớp 24_3 · Ngày nộp 06/10/2026 · Phiên bản 1.2

| Vai | MSSV | Họ tên | Phụ trách |
|---|---|---|---|
| TV1 | 24120115 | Lê Tấn Phát | Vấn đề, phạm vi, stakeholder, thuật ngữ; ghép Mini-SRS; ma trận truy vết |
| TV2 | 24120091 | Lâm Duy Minh | Kế hoạch khảo sát; NFR |
| TV3 | 24120089 | Tạ Quang Mạnh | FR; CR-01 |
| TV4 | 24120070 | Vương Hữu Khang | Scenario; test case |

### Lịch sử phiên bản

| Phiên bản | Nội dung | Change request |
|---|---|---|
| 1.0 | Bản đầu: vấn đề, phạm vi, STK-01…STK-04, thuật ngữ; FR-01…FR-14; NFR-01…NFR-06; SC-01…SC-04; TC-01…TC-10; kế hoạch khảo sát; ASM-01…ASM-03, ASM-07, ASM-08, ASM-10…ASM-12; Q-01…Q-08, Q-13 | — |
| 1.1 | Áp dụng CR-01: sửa 12 FR (FR-01…FR-06, FR-08, FR-09, FR-11…FR-14); thêm FR-15…FR-19, TC-11…TC-14; sửa SC-01…SC-04, TC-01, TC-06, TC-07; thêm STK-05, phạm vi và thuật ngữ khám trực tuyến, ASM-04…ASM-06, ASM-09, Q-09…Q-12 | CR-01 |
| 1.2 | Xử lý peer review ISS-01…ISS-18 (mục 3.1): sửa FR-06, FR-09, NFR-01…NFR-06, SC-01, SC-04, kế hoạch khảo sát, bộ câu hỏi, mục 1.12.1, mục 2.4; thêm NFR-07…NFR-09 (ISS-07), TC-15…TC-22 (ISS-15), ASM-13…ASM-17, Q-14, cột đối chiếu câu hỏi khảo sát ở mục 1.7, bảng tóm tắt NFR; sửa lỗi biên tập (mục 1.1, FR-12, FR-19) | — (NFR-07…NFR-09, TC-17, TC-21, TC-22 truy vết CR-01) |

---

# 1. Mini-SRS

## 1.1 Giới thiệu

**Mục đích.** Đặc tả yêu cầu cho hệ thống hỗ trợ đặt lịch, tiếp nhận bệnh nhân và theo dõi lịch khám của Phòng khám An Tâm, làm căn cứ để thống nhất phạm vi với phòng khám, thiết kế và kiểm thử.

**Đối tượng đọc.** Quản lý phòng khám (duyệt phạm vi, trả lời câu hỏi mở), nhóm phát triển và người kiểm thử.

**Căn cứ.** Case study Phòng khám An Tâm, buổi phân tích tình huống ngày 02/10/2026 (mục 2.3) và CR-01. Thông tin case không nêu được ghi thành giả định (ASM) hoặc câu hỏi mở (Q).

**Cấu trúc.** Mục 1 là Mini-SRS (1.1–1.11) và phân tích CR-01 (1.12); mục 2 là minh chứng khảo sát; mục 3 là validation report và test scenarios; mục 4 là ma trận truy vết.

## 1.2 Vấn đề và mục tiêu

**Vấn đề hiện tại.** Phòng khám có 6 bác sĩ, 80–120 lượt bệnh nhân/ngày, 2 nhân viên tiếp nhận/ca. Lịch được đặt qua điện thoại và ghi sổ, dẫn đến:

- Bệnh nhân phải gọi nhiều lần mới đặt được lịch.
- Lịch sửa trên sổ, người khác không biết.
- Bác sĩ chỉ nhận danh sách đầu ca, không chuẩn bị hồ sơ trước được.
- Bệnh nhân không đổi lịch từ xa được.
- Bác sĩ nghỉ đột xuất thì nhân viên phải gọi từng bệnh nhân.

**Mục tiêu.**

- Bệnh nhân tự đặt, đổi, hủy lịch từ xa.
- Lịch lưu tập trung, thay đổi hiển thị ngay cho người liên quan.
- Bác sĩ xem trước danh sách khám và hồ sơ cần chuẩn bị.
- Hệ thống tự thông báo cho bệnh nhân khi lịch thay đổi.

**Giá trị mong đợi.** Giảm cuộc gọi đặt và xác nhận lịch, không còn sai lệch lịch, bác sĩ chủ động trước ca. Ngưỡng định lượng chờ phòng khám xác nhận (Q-13).

## 1.3 Phạm vi

**Trong phạm vi**

1. Quản lý lịch làm việc của bác sĩ và khung giờ khám
2. Đặt lịch (bệnh nhân tự đặt hoặc nhân viên đặt hộ)
3. Đổi, hủy lịch
4. Tiếp nhận bệnh nhân; ghi nhận đến trễ, vắng mặt, khám gấp
5. Danh sách khám theo ca cho bác sĩ
6. Xử lý bác sĩ nghỉ đột xuất
7. Thông báo cho bệnh nhân khi lịch được tạo, đổi, hủy
8. Đăng nhập, phân quyền theo vai trò
9. *(v1.1 – CR-01)* Khám trực tuyến: thanh toán trước, hoàn tiền và thông báo khi bác sĩ hủy

**Ngoài phạm vi**

1. Bệnh án chuyên môn, kê đơn
2. Thu viện phí tại quầy, bảo hiểm y tế
3. Quản lý thuốc, kho
4. Chấm công, tính lương nhân sự
5. *(v1.1)* Tổ chức buổi khám trực tuyến (cuộc gọi video) – ASM-06

## 1.4 Thuật ngữ

| Thuật ngữ | Định nghĩa |
|---|---|
| Lịch hẹn | Lượt khám đã đặt, gắn với một bệnh nhân, một bác sĩ, một khung giờ |
| Khung giờ | Khoảng thời gian bác sĩ nhận khám (độ dài, số bệnh nhân tối đa: Q-01) |
| Ca | Buổi làm việc; danh sách khám lập theo ca |
| Hình thức khám | Tại phòng khám hoặc trực tuyến (CR-01) |
| Tiếp nhận | Ghi nhận bệnh nhân đã có mặt tại phòng khám |
| Đến trễ / Vắng mặt / Khám gấp | Bệnh nhân đến sau giờ hẹn / không đến, không hủy / cần khám ngay ngoài lịch (quy tắc: Q-04) |
| Bác sĩ nghỉ đột xuất | Bác sĩ báo nghỉ trong ca đã có lịch hẹn |
| Giữ chỗ | Khung giờ tạm dành cho bệnh nhân trong lúc chờ thanh toán (CR-01) |
| Khám trực tuyến | Khám từ xa; lịch chỉ được xác nhận sau khi thanh toán trước (CR-01) |
| Hoàn tiền | Trả lại khoản đã thanh toán khi bác sĩ hủy lịch trực tuyến (CR-01) |

| Viết tắt | Ý nghĩa |
|---|---|
| SRS | Software Requirements Specification – đặc tả yêu cầu phần mềm |
| STK | Stakeholder |
| N | Nhu cầu |
| FR / NFR | Yêu cầu chức năng / phi chức năng |
| SC / TC | Scenario / Test case |
| ISS | Vấn đề review |
| ASM / Q | Giả định / Câu hỏi mở |
| CR | Change Request – yêu cầu thay đổi |
| RBAC | Role-Based Access Control – phân quyền theo vai trò |

## 1.5 Stakeholder

| ID | Stakeholder | Vai trò | Nhu cầu | Ảnh hưởng |
|---|---|---|---|---|
| STK-01 | Quản lý phòng khám | Đặt hàng, duyệt quy định | Bệnh nhân đặt lịch nhanh, không gọi nhiều lần | Cao |
| STK-02 | Bác sĩ | Khám theo lịch | Biết hôm nay ai đến khám, hồ sơ nào cần chuẩn bị | Cao |
| STK-03 | Nhân viên tiếp nhận | Ghi lịch, tiếp nhận | Lịch thay đổi thì mọi người cùng biết | Trung bình |
| STK-04 | Bệnh nhân | Đặt, đổi, hủy lịch | Đổi lịch không phải đến tận nơi | Trung bình |
| STK-05 | Cổng thanh toán *(v1.1)* | Thu tiền, hoàn tiền | Giao tiếp theo API nhà cung cấp | Trung bình |

## 1.6 Môi trường hoạt động

- Ứng dụng web, chạy trên trình duyệt (ASM-01).
- Nhân viên, bác sĩ dùng máy tính có Internet tại phòng khám (ASM-07).
- Bệnh nhân dùng điện thoại hoặc máy tính; vẫn đặt được qua điện thoại với nhân viên (ASM-03).
- Hệ thống ngoài: dịch vụ gửi thông báo (ASM-08); *(v1.1)* cổng thanh toán (ASM-09).

## 1.7 Giả định, phụ thuộc, câu hỏi mở

| ID | Nội dung | Cần ai xác nhận |
|---|---|---|
| ASM-01 | Hệ thống là ứng dụng web; bệnh nhân tự đặt, đổi, hủy lịch qua đó | STK-01 |
| ASM-02 | Mỗi khung giờ có giới hạn số bệnh nhân do quản lý cấu hình; giá trị chưa biết | STK-01 |
| ASM-03 | Nhân viên tiếp nhận vẫn nhận đặt lịch qua điện thoại sau khi hệ thống vận hành | STK-03 |
| ASM-04 | *(v1.1)* Thanh toán trước chỉ áp dụng cho khám trực tuyến; khám tại phòng khám giữ nguyên | STK-01 |
| ASM-05 | *(v1.1)* Khi bác sĩ hủy, hoàn toàn bộ số đã thanh toán, trả về phương thức thanh toán ban đầu | STK-01 |
| ASM-06 | *(v1.1)* Phạm vi CR-01 gồm đặt lịch, thanh toán, hoàn tiền; buổi khám trực tuyến diễn ra ngoài hệ thống | STK-01, STK-02 |
| ASM-07 | Phòng khám có máy tính kết nối Internet | STK-01 |
| ASM-08 | Phụ thuộc dịch vụ gửi thông báo bên ngoài (SMS/email) | STK-01 |
| ASM-09 | *(v1.1)* Phụ thuộc cổng thanh toán bên thứ ba | STK-01 |
| ASM-10 | Nhân viên tiếp nhận chỉ xem thông tin hành chính của bệnh nhân | STK-01, STK-02 |
| ASM-11 | Bệnh nhân đặt lịch trực tuyến được xác thực qua số điện thoại | STK-01, STK-04 |
| ASM-12 | Tạm tính mỗi khung giờ 20 phút | STK-01, STK-02 |
| ASM-13 | Thời gian phản hồi chấp nhận được tối đa 3 giây | STK-01 |
| ASM-14 | Tối đa 50 người dùng đồng thời | STK-01 |
| ASM-15 | Mức sẵn sàng 99% trong giờ hoạt động; bảo trì ngoài giờ | STK-01 |
| ASM-16 | Sao lưu hằng ngày; chấp nhận mất tối đa 24 giờ dữ liệu | STK-01 |
| ASM-17 | *(v1.1)* Bệnh nhân tự hủy lịch trực tuyến đã thanh toán: không hoàn tự động, khoản tiền ở trạng thái "chờ chính sách" | STK-01 |

| ID | Câu hỏi | Hỏi ai | Ảnh hưởng | Câu hỏi khảo sát (mục 2.2) |
|---|---|---|---|---|
| Q-01 | Một khung giờ dài bao lâu, nhận tối đa bao nhiêu bệnh nhân? Hẹn theo giờ cụ thể hay theo ca? | STK-01 | FR-02, FR-03, FR-12 | Q-OP01, Q-CL01, Q-CL02 |
| Q-02 | "Đặt lịch nhanh" nghĩa là tối đa bao nhiêu bước hoặc bao nhiêu phút? | STK-01 | FR-01, NFR-01 | Q-OP05 |
| Q-03 | Hạn chót đổi, hủy trước giờ khám là bao lâu? Mỗi lịch được đổi tối đa mấy lần? | STK-01 | FR-05, FR-06 | Q-CL05, Q-CL06 |
| Q-04 | Bệnh nhân đến trễ bao lâu thì mất lượt? Vắng mặt xử lý ra sao? Khám gấp có nhận không và chèn vào đâu? | STK-01, STK-02, STK-03 | FR-03, FR-08, FR-10 | Q-EX01, Q-EX02, Q-EX03 |
| Q-05 | Thông tin tối thiểu của bệnh nhân mới là gì? Nhận ra bệnh nhân cũ bằng gì? "Hồ sơ cần chuẩn bị" gồm những gì? | STK-02, STK-03 | FR-07, FR-09, FR-14 | Q-OP06 |
| Q-06 | Mỗi vai được xem và sửa dữ liệu nào? Ai được xem giao dịch thanh toán? | STK-01 | FR-13, NFR-04 | Q-OP02, Q-CL03, Q-CL04 |
| Q-07 | Thông báo gửi qua kênh nào: SMS, email, ứng dụng hay gọi điện? | STK-01, STK-04 | FR-04, FR-18 | Q-CL07 |
| Q-08 | Bác sĩ nghỉ đột xuất thì chuyển lịch sang bác sĩ khác cùng chuyên khoa hay để bệnh nhân tự chọn? | STK-01, STK-03 | FR-11 | Q-EX04 |
| Q-09 | Buổi khám trực tuyến diễn ra ở đâu? Bệnh nhân nhận liên kết tham gia bằng cách nào? | STK-01, STK-02 | FR-04, FR-09 | Q-OP08 |
| Q-10 | Thanh toán bằng những phương thức nào? Giá khám trực tuyến tính ra sao? Có xuất biên lai không? | STK-01 | FR-15 | Q-OP09, Q-CL08 |
| Q-11 | Giữ chỗ chờ thanh toán trong bao lâu? Thanh toán thành công sau khi hết hạn thì xác nhận lịch hay hoàn tiền? | STK-01 | FR-16 | Q-CL09, Q-EX06 |
| Q-12 | Bệnh nhân tự hủy có được hoàn tiền không? Hoàn trong bao lâu, ai chịu phí cổng? Đổi lịch trực tuyến đã trả tiền xử lý khoản đó thế nào? | STK-01 | FR-05, FR-06, FR-17 | Q-EX07 |
| Q-13 | Đo hiệu quả hệ thống bằng chỉ số nào? | STK-01 | Mục 1.2 | Q-OP07 |
| Q-14 | Ngưỡng hiệu năng, mức sẵn sàng, tần suất sao lưu và thời hạn lưu trữ? | STK-01 | NFR-01, NFR-02, NFR-05, NFR-06, NFR-09 | Q-NFR01, Q-NFR02, Q-NFR03, Q-NFR04 |

## 1.8 Nhu cầu

| ID | Nhu cầu | Stakeholder |
|---|---|---|
| N-01 | Đặt lịch nhanh, không gọi nhiều lần | STK-01, STK-04 |
| N-02 | Lịch thay đổi thì mọi người cùng thấy | STK-03 |
| N-03 | Biết hôm nay ai đến khám, hồ sơ cần chuẩn bị | STK-02 |
| N-04 | Đổi, hủy lịch từ xa | STK-04 |
| N-05 | Báo bệnh nhân khi bác sĩ nghỉ đột xuất | STK-03, STK-04 |
| N-06 | Xử lý đến trễ, vắng mặt, khám gấp | STK-03 |
| N-07 | Bảo mật, hiệu năng, lưu trữ dữ liệu | STK-01 |
| N-08 | Khám trực tuyến, thanh toán trước, hoàn tiền khi bác sĩ hủy | STK-01, STK-04, STK-05 |

## 1.9 Yêu cầu chức năng

| ID    | Yêu cầu                                      | Ưu tiên | Phiên bản   |
| ----- | -------------------------------------------- | ------- | ----------- |
| FR-01 | Đặt lịch khám                                | Must    | 1.1 (CR-01) |
| FR-02 | Xem khung giờ khả dụng                       | Must    | 1.1 (CR-01) |
| FR-03 | Chống đặt trùng, giữ giới hạn số bệnh nhân   | Must    | 1.1 (CR-01) |
| FR-04 | Xác nhận và thông báo lịch hẹn               | Must    | 1.1 (CR-01) |
| FR-05 | Đổi lịch                                     | Must    | 1.1 (CR-01) |
| FR-06 | Hủy lịch bởi bệnh nhân                       | Must    | 1.2 (CR-01, ISS-02) |
| FR-07 | Khai thông tin bệnh nhân khi đặt lịch        | Should  | 1.0         |
| FR-08 | Nhân viên đặt, đổi, hủy lịch thay bệnh nhân  | Must    | 1.1 (CR-01) |
| FR-09 | Danh sách lịch khám theo ngày, ca của bác sĩ | Must    | 1.2 (CR-01, ISS-01) |
| FR-10 | Cập nhật trạng thái lượt khám                | Should  | 1.0         |
| FR-11 | Xử lý khi bác sĩ nghỉ đột xuất               | Must    | 1.1 (CR-01) |
| FR-12 | Quản lý lịch làm việc của bác sĩ             | Must    | 1.1 (CR-01) |
| FR-13 | Đăng nhập và phân quyền theo vai             | Must    | 1.1 (CR-01) |
| FR-14 | Tra cứu lịch hẹn                             | Should  | 1.1 (CR-01) |
| FR-15 | Thanh toán trước cho lịch khám trực tuyến    | Must    | 1.1 (CR-01) |
| FR-16 | Giữ chỗ trong thời gian chờ thanh toán       | Must    | 1.1 (CR-01) |
| FR-17 | Hoàn tiền khi bác sĩ hủy lịch                | Must    | 1.1 (CR-01) |
| FR-18 | Thông báo hủy lịch và hoàn tiền              | Must    | 1.1 (CR-01) |
| FR-19 | Theo dõi giao dịch thanh toán và hoàn tiền   | Should  | 1.1 (CR-01) |

### FR-01 · Đặt lịch khám

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-01</b></td><td>Chức năng</td><td>STK-01, STK-04</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân muốn hẹn khám mà không phải gọi điện nhiều lần, hệ thống phải cho bệnh nhân chọn chuyên khoa, bác sĩ, hình thức khám (tại phòng khám hoặc trực tuyến), ngày và một khung giờ còn trống, rồi gửi yêu cầu đặt lịch. Lịch tại phòng khám được xác nhận ngay khi đặt thành công; lịch trực tuyến chỉ được xác nhận sau khi thanh toán (FR-15). Bệnh nhân tự thao tác qua kênh trực tuyến của hệ thống (ASM-01).</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Quản lý muốn bệnh nhân đặt lịch nhanh, không phải gọi nhiều lần; hiện việc đặt lịch đi qua điện thoại và sổ. CR-01 thêm hình thức khám trực tuyến nên bệnh nhân phải chọn được hình thức ngay từ lúc đặt.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Bệnh nhân hoàn tất một lịch tại phòng khám mà không liên hệ nhân viên; lịch vừa đặt xuất hiện trong danh sách của đúng bác sĩ, đúng hình thức khám (FR-09); lịch trực tuyến chưa thanh toán không ở trạng thái "đã xác nhận". Ngưỡng thời gian phản hồi: NFR-01; số bước tối đa: Q-02.</td></tr>
</tbody>
</table>

### FR-02 · Xem khung giờ khả dụng

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-02</b></td><td>Chức năng</td><td>Dữ kiện (06 bác sĩ, nhiều chuyên khoa), STK-04</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh 06 bác sĩ thuộc nhiều chuyên khoa có lịch làm việc khác nhau, hệ thống phải hiển thị theo từng bác sĩ và từng hình thức khám những khung giờ còn khả dụng, và loại bỏ hoặc đánh dấu "hết chỗ" với khung đã đủ số bệnh nhân hoặc bác sĩ không làm việc. Khung đang được giữ chờ thanh toán (FR-16) không được tính là còn trống. Cách chia khung giờ: Q-01.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Bệnh nhân chỉ đặt được ngay khi biết khung nào còn chỗ; nếu không biết, họ vẫn phải gọi hỏi như hiện nay.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Với dữ liệu thử gồm một bác sĩ nghỉ, một khung đã đầy và một khung đang giữ chỗ, danh sách trả về không chứa ba khung đó. Sau khi có lịch được đặt, hủy hoặc lịch làm việc đổi (FR-12), lần tải danh sách tiếp theo phản ánh đúng thay đổi.</td></tr>
</tbody>
</table>

### FR-03 · Chống đặt trùng, giữ giới hạn số bệnh nhân

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-03</b></td><td>Chức năng</td><td>STK-03, dữ kiện (80–120 lượt/ngày, 02 nhân viên/ca)</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh nhiều người cùng đặt lịch và nhân viên cùng chỉnh lịch, hệ thống phải bảo đảm số lịch đang hiệu lực của một khung giờ không vượt giới hạn do quản lý cấu hình (ASM-02). Khi có hai yêu cầu đồng thời đặt vào khung giờ chỉ còn một chỗ, chỉ một yêu cầu thành công; yêu cầu còn lại nhận thông báo khung đã hết chỗ và được gợi ý chọn khung khác. Lịch đang giữ chỗ chờ thanh toán được tính vào số chỗ đã dùng. Khám gấp có được vượt giới hạn hay không: Q-04.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Nhân viên nói sửa lịch ở sổ thì đôi khi người khác không biết, dẫn tới lịch lệch nhau. Hệ thống dùng chung phải là nơi duy nhất quyết định khung nào còn chỗ.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Mô phỏng hai yêu cầu đồng thời vào khung còn đúng một chỗ: đúng một lịch được tạo. Sau mọi thao tác đặt, đổi, hủy, số lịch hiệu lực cộng số chỗ đang giữ của mỗi khung không vượt giới hạn đã cấu hình.</td></tr>
</tbody>
</table>

### FR-04 · Xác nhận và thông báo lịch hẹn

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-04</b></td><td>Chức năng</td><td>Dữ kiện (nhân viên gọi điện xác nhận), STK-04</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh nhân viên hiện phải gọi điện xác nhận từng lịch, hệ thống phải tạo mã lịch hẹn và gửi bệnh nhân thông báo gồm bác sĩ, chuyên khoa, hình thức khám, ngày giờ và mã lịch; thông báo cũng được gửi khi lịch bị đổi hoặc hủy. Với khám trực tuyến, thông báo xác nhận chỉ gửi sau khi thanh toán thành công và ghi kèm số tiền đã trả. Kênh gửi: Q-07. Cách bệnh nhân vào buổi khám trực tuyến: Q-09.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Thay cuộc gọi xác nhận thủ công, và để bệnh nhân luôn có thông tin xác nhận lịch hẹn của mình.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Sau mỗi lần đặt, đổi, hủy thành công có đúng một thông báo được ghi nhận đã gửi, nội dung khớp lịch hiện hành. Lịch trực tuyến chưa thanh toán không có thông báo xác nhận.</td></tr>
</tbody>
</table>

### FR-05 · Đổi lịch

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-05</b></td><td>Chức năng</td><td>STK-04</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân muốn đổi lịch mà không phải đến tận nơi, hệ thống phải cho bệnh nhân đổi lịch sắp tới sang khung giờ hoặc bác sĩ khác còn khả dụng. Khung cũ chỉ được nhả khi khung mới đã nhận thành công, nên bệnh nhân không bao giờ rơi vào tình trạng mất lịch cũ mà chưa có lịch mới. Hạn chót đổi và số lần đổi: Q-03. Với lịch trực tuyến đã thanh toán, khoản tiền khi đổi (giữ nguyên, bù chênh lệch hay hoàn): Q-12.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Bệnh nhân muốn đổi lịch từ xa; hiện việc đổi phải đi qua nhân viên, sổ và một cuộc gọi.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Đổi sang khung còn chỗ: khung cũ hiển thị còn chỗ trở lại, khung mới có lịch, thông báo được gửi (FR-04). Đổi sang khung đã hết chỗ: thao tác bị từ chối và lịch cũ giữ nguyên.</td></tr>
</tbody>
</table>

### FR-06 · Hủy lịch bởi bệnh nhân

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-06</b></td><td>Chức năng</td><td>STK-04, STK-03</td><td>Must</td><td>1.2 (CR-01, ISS-02)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân không đến khám được, hệ thống phải cho bệnh nhân hủy lịch sắp tới, chuyển lịch sang trạng thái "bệnh nhân hủy" và mở lại khung giờ cho người khác. CR-01 chỉ quy định hoàn tiền khi bác sĩ hủy, chưa nói gì về trường hợp bệnh nhân tự hủy lịch trực tuyến đã trả tiền; với trường hợp đó hệ thống chỉ ghi nhận hủy và đánh dấu khoản thanh toán là "chờ chính sách", không tự động hoàn tiền (ASM-17, Q-12). Hạn chót hủy: Q-03.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Nhân viên cần biết lịch nào đã trống để xếp người khác; hủy sớm trên hệ thống giúp nhả chỗ sớm.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Sau khi hủy, khung hiển thị còn chỗ và lịch không còn trong danh sách của bác sĩ. Hủy lịch trực tuyến đã trả tiền: khoản thanh toán có trạng thái "chờ chính sách" và không sinh giao dịch hoàn tự động.</td></tr>
</tbody>
</table>

### FR-07 · Khai thông tin bệnh nhân khi đặt lịch

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-07</b></td><td>Chức năng</td><td>Dữ kiện (bệnh nhân mới khai khi đến), STK-02</td><td>Should</td><td>1.0</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân mới hiện chỉ khai thông tin khi đến phòng khám, hệ thống phải cho bệnh nhân mới nhập thông tin cần thiết ngay lần đặt lịch đầu tiên và tạo hồ sơ bệnh nhân, để lần sau không phải khai lại. Danh sách trường tối thiểu và cách nhận ra bệnh nhân cũ: Q-05.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Rút ngắn thời gian khai tại quầy; bác sĩ biết trước hồ sơ nào cần chuẩn bị.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Bệnh nhân mới đặt xong thì hồ sơ đã tồn tại và gắn với lịch; lần đặt sau hệ thống nhận ra bệnh nhân cũ và không tạo hồ sơ trùng; thiếu trường bắt buộc thì không gửi được.</td></tr>
</tbody>
</table>

### FR-08 · Nhân viên đặt, đổi, hủy lịch thay bệnh nhân

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-08</b></td><td>Chức năng</td><td>STK-03, dữ kiện (hiện đặt lịch qua điện thoại)</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh nhiều bệnh nhân vẫn gọi điện (ASM-03), hệ thống phải cho nhân viên tiếp nhận tạo, đổi, hủy lịch thay bệnh nhân với cùng quy tắc khả dụng như bệnh nhân tự đặt (FR-02, FR-03), và ghi lại ai thao tác, lúc nào. Lịch trực tuyến do nhân viên tạo hộ cũng chỉ được xác nhận sau khi thanh toán xong (FR-15).</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Hai nhân viên mỗi ca phải xử lý 80–120 lượt mỗi ngày; thao tác trên hệ thống chung thì người khác thấy ngay, khác với sổ.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Lịch do nhân viên tạo hiện ngay trong danh sách bác sĩ và làm đổi số chỗ của khung; mỗi thao tác có bản ghi người làm và thời điểm; nhân viên không tạo được lịch vượt giới hạn khung, trừ trường hợp khám gấp nếu Q-04 cho phép.</td></tr>
</tbody>
</table>

### FR-09 · Danh sách lịch khám theo ngày, ca của bác sĩ

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-09</b></td><td>Chức năng</td><td>STK-02, dữ kiện (bác sĩ nhận danh sách đầu ca)</td><td>Must</td><td>1.2 (CR-01, ISS-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bác sĩ cần biết danh sách bệnh nhân trong ngày và hồ sơ nào cần chuẩn bị, hệ thống phải hiển thị cho bác sĩ danh sách lịch của riêng mình theo ngày và ca, xếp theo giờ hẹn, gồm tên bệnh nhân, giờ hẹn, hình thức khám (tại phòng khám hoặc trực tuyến), trạng thái, và đánh dấu bệnh nhân mới. Mỗi lần mở hoặc tải lại, danh sách phản ánh dữ liệu lịch tại thời điểm đó. "Hồ sơ cần chuẩn bị" cụ thể gồm gì: Q-05.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Bác sĩ hiện nhận danh sách vào đầu ca, nên lịch đổi hoặc hủy sau đó không tới tay bác sĩ.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Lịch đặt, đổi, hủy sau đầu ca xuất hiện ở lần mở hoặc tải lại danh sách kế tiếp; bác sĩ A không thấy lịch của bác sĩ B; lịch trực tuyến có nhãn riêng; lịch đã hủy không nằm trong nhóm lịch cần khám.</td></tr>
</tbody>
</table>

### FR-10 · Cập nhật trạng thái lượt khám

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-10</b></td><td>Chức năng</td><td>STK-03, STK-02</td><td>Should</td><td>1.0</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh nhân viên và bác sĩ cần biết ai đã đến, ai đang khám, hệ thống phải cho nhân viên tiếp nhận (và bác sĩ với lượt của mình) cập nhật trạng thái lượt khám: chưa đến, đã đến, đang khám, hoàn thành, vắng mặt. Quy tắc cho bệnh nhân đến trễ, vắng mặt, khám gấp chưa có (Q-04), nên hệ thống chỉ ghi nhận trạng thái do người dùng chọn, không tự suy luận.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Case nêu đến trễ, vắng mặt và khám gấp là tình huống thực tế nhưng chưa nói cách xử lý; ghi nhận trạng thái là bước tối thiểu để mọi người cùng nắm tình hình trong ngày.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Mỗi lượt khám có đúng một trạng thái tại một thời điểm; mọi lần chuyển trạng thái được lưu cùng người thực hiện và thời điểm; trạng thái hiển thị giống nhau ở màn tiếp nhận và danh sách của bác sĩ.</td></tr>
</tbody>
</table>

### FR-11 · Xử lý khi bác sĩ nghỉ đột xuất

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-11</b></td><td>Chức năng</td><td>Dữ kiện (nhân viên gọi từng bệnh nhân), STK-03, CR-01</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bác sĩ nghỉ đột xuất và nhân viên hiện phải gọi từng bệnh nhân, hệ thống phải cho quản lý hoặc nhân viên tiếp nhận đánh dấu bác sĩ nghỉ theo ngày hoặc ca, lập danh sách các lịch bị ảnh hưởng, chuyển các lịch đó sang trạng thái "bác sĩ hủy" và thông báo cho từng bệnh nhân (FR-18). Với lịch trực tuyến đã thanh toán, hệ thống hoàn tiền theo FR-17. Có chuyển sang bác sĩ khác cùng chuyên khoa hay không: Q-08.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Gọi từng người vừa chậm vừa dễ sót khi một bác sĩ có nhiều lịch trong ca. CR-01 thêm yêu cầu hoàn tiền cho lịch trực tuyến bị hủy theo đường này.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Đánh dấu nghỉ một ca có N lịch: sau thao tác cả N lịch ở trạng thái "bác sĩ hủy", N bệnh nhân đều có thông báo, các khung giờ của ca đó không còn khả dụng; mỗi lịch trực tuyến đã thanh toán có đúng một giao dịch hoàn; không có lịch nào bị bỏ sót.</td></tr>
</tbody>
</table>

### FR-12 · Quản lý lịch làm việc của bác sĩ

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-12</b></td><td>Chức năng</td><td>STK-01, dữ kiện (06 bác sĩ, nhiều chuyên khoa)</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh mỗi bác sĩ có ca và chuyên khoa riêng, hệ thống phải cho người có quyền (FR-13) tạo và sửa lịch làm việc của từng bác sĩ: ngày, ca, khung giờ, chuyên khoa, giới hạn số bệnh nhân mỗi khung, và hình thức khám mà mỗi khung mở (tại phòng khám, trực tuyến). Khi sửa một khung đã có lịch hẹn, hệ thống phải cảnh báo và liệt kê các lịch bị ảnh hưởng, không tự xóa. Quy tắc phân bổ khung giờ: Q-01.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> FR-02 và FR-03 dựa hoàn toàn vào dữ liệu này; case ghi quy tắc phân bổ khung giờ và giới hạn số bệnh nhân còn phải khảo sát.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Tạo một ca thì các khung của ca xuất hiện ở FR-02; sửa khung đã có lịch thì hiện cảnh báo kèm danh sách lịch trước khi áp dụng; người dùng không có quyền thực hiện thao tác phải bị từ chối và không được để lộ dữ liệu.</td></tr>
</tbody>
</table>

### FR-13 · Đăng nhập và phân quyền theo vai

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-13</b></td><td>Chức năng</td><td>Dữ kiện (cần khảo sát quyền xem, sửa), STK-01 đến STK-04</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bốn nhóm người dùng cần xem và sửa dữ liệu khác nhau, hệ thống phải xác thực người dùng và chỉ cho mỗi vai (quản lý, bác sĩ, nhân viên tiếp nhận, bệnh nhân) xem và sửa phần dữ liệu được cấp phép. Bệnh nhân chỉ thấy lịch và hồ sơ của mình; bác sĩ chỉ thấy lịch của mình; dữ liệu giao dịch thanh toán và hoàn tiền (CR-01) chỉ vai được cấp quyền mới thấy. Ma trận quyền chi tiết: Q-06.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Hồ sơ khám và thông tin liên lạc là dữ liệu cá nhân; case yêu cầu khảo sát rõ ai được xem, ai được sửa. CR-01 thêm dữ liệu tiền nên cần thêm một lớp quyền.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Với từng cặp vai và chức năng trong ma trận quyền đã chốt, các thao tác không được cấp quyền phải bị từ chối và không được để lộ dữ liệu; tài khoản bệnh nhân A không truy cập được lịch của bệnh nhân B qua bất kỳ màn hình nào.</td></tr>
</tbody>
</table>

### FR-14 · Tra cứu lịch hẹn

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-14</b></td><td>Chức năng</td><td>STK-04, STK-03</td><td>Should</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân hiện phải gọi hỏi còn nhân viên phải lật sổ, hệ thống phải cho bệnh nhân xem các lịch sắp tới và đã qua của mình kèm trạng thái, gồm trạng thái thanh toán và hoàn tiền với lịch trực tuyến; nhân viên tiếp nhận tìm lịch theo tên, số điện thoại hoặc mã lịch. Khóa tìm kiếm: Q-05.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Rút ngắn các cuộc gọi hỏi lại lịch và cho bệnh nhân tự biết tiền của mình đang ở trạng thái nào.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Tìm bằng mã lịch trả đúng một lịch; tìm bằng tên hoặc số điện thoại trả đủ các lịch khớp; bệnh nhân chỉ thấy lịch của chính mình.</td></tr>
</tbody>
</table>

### FR-15 · Thanh toán trước cho lịch khám trực tuyến

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-15</b></td><td>Chức năng</td><td>CR-01</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh phòng khám bắt đầu cung cấp khám trực tuyến và yêu cầu thanh toán trước để xác nhận lịch, hệ thống phải chuyển bệnh nhân sang bước thanh toán ngay sau khi chọn khung giờ trực tuyến, hiển thị số tiền phải trả, và chỉ chuyển lịch sang "đã xác nhận" khi nhận được kết quả thanh toán thành công. Thanh toán thất bại hoặc bỏ dở thì lịch không được xác nhận. Thanh toán trước áp dụng cho khám trực tuyến, khám tại phòng khám giữ nguyên (ASM-04). Phương thức thanh toán, cách tính giá, biên lai: Q-10.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> CR-01 quy định bệnh nhân phải thanh toán trước để xác nhận lịch.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Thanh toán thành công thì có đúng một lịch ở "đã xác nhận" và đúng một giao dịch gắn mã lịch; thanh toán thất bại hoặc bị hủy thì lịch không được xác nhận; không có đường nào khác đưa lịch trực tuyến sang "đã xác nhận", kể cả thao tác của nhân viên.</td></tr>
</tbody>
</table>

### FR-16 · Giữ chỗ trong thời gian chờ thanh toán

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-16</b></td><td>Chức năng</td><td>CR-01 (hệ quả của việc xác nhận sau thanh toán), cần STK-01 xác nhận</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh khung giờ có giới hạn mà thanh toán cần thời gian, hệ thống phải giữ chỗ cho bệnh nhân từ lúc bắt đầu thanh toán đến khi có kết quả hoặc hết thời hạn giữ. Hết hạn hoặc thanh toán thất bại thì chỗ tự được nhả và bệnh nhân được báo. Nếu thanh toán thành công sau khi đã hết hạn, kết quả phải là một trong hai: xác nhận lịch (khi khung còn chỗ) hoặc hoàn tiền; bệnh nhân không được ở tình trạng đã mất tiền mà không có lịch. Thời hạn giữ và cách chọn giữa hai kết quả: Q-11.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Không giữ chỗ thì hai người có thể cùng thanh toán cho một chỗ cuối; giữ không hạn thì khung bị chiếm vô ích.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Khi một lịch đang chờ thanh toán trong khung chỉ còn một chỗ, bệnh nhân khác không đặt được chỗ đó; khi hết hạn giữ khung hiển thị còn chỗ trở lại; ca thanh toán thành công muộn kết thúc bằng lịch được xác nhận hoặc một giao dịch hoàn.</td></tr>
</tbody>
</table>

### FR-17 · Hoàn tiền khi bác sĩ hủy lịch

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-17</b></td><td>Chức năng</td><td>CR-01</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân đã thanh toán trước cho lịch trực tuyến, khi bác sĩ hủy lịch (kể cả do nghỉ đột xuất, FR-11), hệ thống phải tạo yêu cầu hoàn tiền cho toàn bộ số đã thanh toán, trả về phương thức thanh toán ban đầu (ASM-05), và theo dõi đến khi hoàn tất hoặc báo lỗi. Mỗi lịch chỉ được hoàn một lần. Thời gian hoàn và phí cổng thanh toán: Q-12.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> CR-01 quy định nếu bác sĩ hủy lịch thì hệ thống hoàn tiền.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Bác sĩ hủy lịch trực tuyến đã thanh toán thì hệ thống có đúng một giao dịch hoàn, số tiền bằng số đã trả, gắn với lịch đó; thao tác hủy lặp lại không sinh giao dịch hoàn thứ hai; hoàn lỗi thì giao dịch ở trạng thái "hoàn lỗi" và xuất hiện trong danh sách cần xử lý (FR-19).</td></tr>
</tbody>
</table>

### FR-18 · Thông báo hủy lịch và hoàn tiền

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-18</b></td><td>Chức năng</td><td>CR-01</td><td>Must</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bác sĩ hủy lịch, hệ thống phải gửi bệnh nhân thông báo nêu rõ lịch bị hủy (bác sĩ, ngày giờ, hình thức khám) và, với lịch trực tuyến đã thanh toán, số tiền hoàn cùng trạng thái hoàn tiền hiện tại. Lịch tại phòng khám bị bác sĩ hủy vẫn được thông báo, không có phần tiền. Kênh gửi: Q-07.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> CR-01 quy định hệ thống phải thông báo cho bệnh nhân khi hoàn tiền; thông báo cũng thay cho việc nhân viên gọi từng người khi bác sĩ nghỉ.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Mỗi lịch bị bác sĩ hủy có một thông báo gửi tới bệnh nhân với đủ các trường nêu trên; thông báo không ghi "đã hoàn tiền" khi giao dịch hoàn chưa thành công.</td></tr>
</tbody>
</table>

### FR-19 · Theo dõi giao dịch thanh toán và hoàn tiền

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>FR-19</b></td><td>Chức năng</td><td>CR-01 (hệ quả của việc có tiền trong hệ thống), cần STK-01 xác nhận</td><td>Should</td><td>1.1 (CR-01)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh hệ thống bắt đầu lưu trữ dữ liệu thanh toán, hệ thống phải cho quản lý và nhân viên được cấp quyền xem giao dịch thanh toán và hoàn tiền của từng lịch, lọc theo ngày và trạng thái (thành công, thất bại, đang chờ, hoàn lỗi), và lọc riêng các giao dịch cần xử lý thủ công.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Khi có tiền sẽ có sai lệch (tiền đã trừ nhưng lịch chưa xác nhận, hoàn lỗi); nhân viên cần tra được giao dịch để phản hồi bệnh nhân về trạng thái thanh toán.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Với mỗi lịch trực tuyến tra được đủ giao dịch liên quan; bộ lọc "hoàn lỗi" và "đang chờ" trả đúng tập giao dịch; vai không có quyền không truy cập được (FR-13).</td></tr>
</tbody>
</table>

## 1.10 Yêu cầu phi chức năng

| ID | Yêu cầu | Nhóm | Ưu tiên | Phiên bản |
|---|---|---|---|---|
| NFR-01 | Thời gian phản hồi | Hiệu năng | Should | 1.2 (ISS-03, ISS-04) |
| NFR-02 | Chịu tải đồng thời | Hiệu năng | Must | 1.2 (ISS-03, ISS-04) |
| NFR-03 | Bảo mật truyền tải và mật khẩu | Bảo mật | Must | 1.2 (ISS-04) |
| NFR-04 | Kiểm soát truy cập phía máy chủ | Bảo mật | Must | 1.2 (ISS-04, ISS-05) |
| NFR-05 | Tính sẵn sàng | Sẵn sàng | Should | 1.2 (ISS-03, ISS-04) |
| NFR-06 | Sao lưu và khôi phục | Lưu trữ | Must | 1.2 (ISS-04, ISS-06) |
| NFR-07 | Bảo mật dữ liệu thanh toán | Bảo mật | Must | 1.2 (CR-01, ISS-07) |
| NFR-08 | Không trừ tiền trùng | Độ tin cậy | Must | 1.2 (CR-01, ISS-07) |
| NFR-09 | Lưu vết giao dịch | Lưu trữ | Should | 1.2 (CR-01, ISS-07) |

### NFR-01 · Thời gian phản hồi

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-01</b></td><td>Phi chức năng – Hiệu năng</td><td>STK-01, N-01</td><td>Should</td><td>1.2 (ISS-03, ISS-04)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân đặt lịch trực tuyến, hệ thống phải trả danh sách khung giờ khả dụng và kết quả xác nhận đặt lịch trong tối đa 3 giây (ASM-13).</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Quản lý muốn bệnh nhân đặt lịch nhanh; phản hồi chậm khiến bệnh nhân quay lại gọi điện.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Đo 100 yêu cầu ở mức tải của NFR-02: ít nhất 95 yêu cầu có thời gian phản hồi ≤ 3 giây. Ngưỡng chờ xác nhận qua Q-14 / Q-NFR01.</td></tr>
</tbody>
</table>

### NFR-02 · Chịu tải đồng thời

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-02</b></td><td>Phi chức năng – Hiệu năng</td><td>Dữ kiện (80–120 lượt/ngày, 6 bác sĩ, 2 nhân viên/ca)</td><td>Must</td><td>1.2 (ISS-03, ISS-04)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân, nhân viên và bác sĩ cùng dùng hệ thống, hệ thống phải phục vụ ít nhất 50 người dùng đồng thời (ASM-14) mà không phát sinh lỗi.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Đầu ca nhiều người cùng đặt lịch và xem danh sách; hệ thống lỗi lúc đó thì nhân viên phải quay về ghi sổ.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Kiểm thử tải với 50 phiên đồng thời trong 10 phút: tỉ lệ lỗi 0% và NFR-01 vẫn đạt. Số người dùng thực tế chờ xác nhận qua Q-14 / Q-NFR01.</td></tr>
</tbody>
</table>

### NFR-03 · Bảo mật truyền tải và mật khẩu

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-03</b></td><td>Phi chức năng – Bảo mật</td><td>Dữ kiện (yêu cầu bảo mật cần khảo sát), N-07</td><td>Must</td><td>1.2 (ISS-04)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh hệ thống truyền và lưu thông tin cá nhân của bệnh nhân, hệ thống phải dùng HTTPS cho mọi kết nối và chỉ lưu mật khẩu dưới dạng băm có salt.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Thông tin liên lạc và lịch khám là dữ liệu cá nhân; lộ dữ liệu ảnh hưởng uy tín phòng khám.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Truy cập bằng HTTP bị chuyển sang HTTPS; kiểm tra cơ sở dữ liệu không có mật khẩu ở dạng đọc được.</td></tr>
</tbody>
</table>

### NFR-04 · Kiểm soát truy cập phía máy chủ

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-04</b></td><td>Phi chức năng – Bảo mật</td><td>Dữ kiện (quyền xem, sửa cần khảo sát), STK-01</td><td>Must</td><td>1.2 (ISS-04, ISS-05)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh mỗi vai chỉ được xem, sửa một phần dữ liệu (FR-13), hệ thống phải kiểm tra quyền ở phía máy chủ cho mọi yêu cầu truy cập dữ liệu và ghi nhật ký các lần truy cập bị từ chối. Nhân viên tiếp nhận chỉ xem thông tin hành chính của bệnh nhân (ASM-10).</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Chặn quyền chỉ ở giao diện thì vẫn lấy được dữ liệu bằng cách gọi thẳng máy chủ.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Gửi trực tiếp yêu cầu tới máy chủ bằng tài khoản không đủ quyền: yêu cầu bị từ chối, không trả dữ liệu, có bản ghi nhật ký. Ma trận quyền chờ Q-06.</td></tr>
</tbody>
</table>

### NFR-05 · Tính sẵn sàng

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-05</b></td><td>Phi chức năng – Sẵn sàng</td><td>STK-04, N-01</td><td>Should</td><td>1.2 (ISS-03, ISS-04)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân đặt lịch qua web, hệ thống phải sẵn sàng tối thiểu 99% thời gian trong giờ hoạt động của phòng khám; bảo trì có kế hoạch thực hiện ngoài giờ hoạt động (ASM-15).</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Hệ thống ngừng trong giờ làm việc thì nhân viên không xem được lịch và phải quay về sổ.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Theo dõi một tháng: tổng thời gian ngừng trong giờ hoạt động ≤ 1% thời gian hoạt động. Giờ hoạt động và mức sẵn sàng chờ Q-14 / Q-NFR01.</td></tr>
</tbody>
</table>

### NFR-06 · Sao lưu và khôi phục

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-06</b></td><td>Phi chức năng – Lưu trữ</td><td>Dữ kiện (lưu trữ dữ liệu cần khảo sát), N-07</td><td>Must</td><td>1.2 (ISS-04, ISS-06)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh sổ giấy được thay bằng dữ liệu điện tử, hệ thống phải sao lưu dữ liệu ít nhất mỗi ngày một lần và khôi phục được bản sao lưu gần nhất; lượng dữ liệu mất tối đa 24 giờ (ASM-16). Thời hạn lưu trữ: Q-14.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Mất dữ liệu lịch thì phòng khám không biết ai đã hẹn khám.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Khôi phục thử bản sao lưu vào môi trường kiểm thử: dữ liệu khớp với thời điểm sao lưu; nhật ký sao lưu có bản ghi mỗi ngày.</td></tr>
</tbody>
</table>

### NFR-07 · Bảo mật dữ liệu thanh toán

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-07</b></td><td>Phi chức năng – Bảo mật</td><td>CR-01</td><td>Must</td><td>1.2 (CR-01, ISS-07)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh bệnh nhân thanh toán trước qua cổng thanh toán (ASM-09), hệ thống không được lưu số thẻ hay thông tin đăng nhập tài khoản thanh toán; chỉ lưu mã giao dịch, số tiền và trạng thái do cổng trả về.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> CR-01 đưa tiền vào hệ thống; giữ ít dữ liệu thanh toán nhất thì giảm hậu quả khi bị lộ.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Rà soát cấu trúc dữ liệu và nhật ký sau một giao dịch thử: không có trường nào chứa số thẻ hoặc thông tin đăng nhập thanh toán.</td></tr>
</tbody>
</table>

### NFR-08 · Không trừ tiền trùng

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-08</b></td><td>Phi chức năng – Độ tin cậy</td><td>CR-01</td><td>Must</td><td>1.2 (CR-01, ISS-07)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh cổng thanh toán có thể gửi lại cùng một kết quả nhiều lần, hệ thống phải bảo đảm mỗi lịch có tối đa một giao dịch thanh toán thành công và mỗi giao dịch được hoàn tối đa một lần.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Ghi nhận trùng dẫn tới thu tiền hai lần hoặc hoàn tiền hai lần.</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Gửi cùng một kết quả thanh toán thành công 3 lần: chỉ có một giao dịch và một lịch được xác nhận. Gửi lệnh hoàn 2 lần cho cùng lịch: chỉ một giao dịch hoàn.</td></tr>
</tbody>
</table>

### NFR-09 · Lưu vết giao dịch

<table>
<colgroup><col width="12%"><col width="14%"><col width="34%"><col width="14%"><col width="26%"></colgroup>
<thead><tr><th>ID</th><th>Loại</th><th>Nguồn</th><th>Độ ưu tiên</th><th>Phiên bản</th></tr></thead>
<tbody>
<tr><td><b>NFR-09</b></td><td>Phi chức năng – Lưu trữ</td><td>CR-01</td><td>Should</td><td>1.2 (CR-01, ISS-07)</td></tr>
<tr><td colspan="5"><b>Mô tả:</b> Trong bối cảnh có sai lệch giữa hệ thống và cổng thanh toán (rủi ro 1, mục 1.12.3), hệ thống phải ghi nhật ký mọi thay đổi trạng thái của lịch hẹn và giao dịch, gồm thời điểm, người hoặc hệ thống thực hiện, trạng thái trước và sau; nhật ký không sửa, xóa được qua giao diện. Thời hạn lưu: Q-14.</td></tr>
<tr><td colspan="5"><b>Lý do:</b> Nhân viên cần đối chiếu khi bệnh nhân khiếu nại về tiền (FR-19).</td></tr>
<tr><td colspan="5"><b>Tiêu chí kiểm chứng:</b> Thực hiện thanh toán rồi hoàn tiền một lịch thử: nhật ký có đủ các lần chuyển trạng thái với đủ trường; không vai nào sửa hay xóa được bản ghi.</td></tr>
</tbody>
</table>

## 1.11 Scenario

### SC-01 · Bệnh nhân đặt lịch thành công

- **Tác nhân chính:** Bệnh nhân · **Tiền điều kiện:** Bác sĩ có lịch làm việc với khung giờ còn chỗ (FR-12) · **Kích hoạt:** Bệnh nhân chọn chức năng đặt lịch.
- **Luồng chính:**
  1. Bệnh nhân chọn chuyên khoa, hình thức "tại phòng khám", bác sĩ và ngày.
  2. Hệ thống hiển thị các khung giờ khả dụng (FR-02).
  3. Bệnh nhân chọn một khung giờ.
  4. Hệ thống xác thực bệnh nhân qua số điện thoại (ASM-11) và yêu cầu thông tin bệnh nhân; bệnh nhân mới nhập thông tin (FR-07), bệnh nhân cũ được hệ thống nhận ra để không tạo hồ sơ trùng (cách nhận ra: Q-05).
  5. Bệnh nhân gửi yêu cầu đặt lịch.
  6. Hệ thống kiểm tra khung còn chỗ (FR-03), tạo lịch ở trạng thái "đã xác nhận" kèm mã lịch.
  7. Hệ thống gửi thông báo xác nhận (FR-04); lịch hiện trong danh sách của bác sĩ (FR-09).
- **Luồng thay thế/ngoại lệ:**
  - *1a. (v1.1 – CR-01) Chọn hình thức trực tuyến:* sau bước 5, hệ thống giữ chỗ (FR-16) và chuyển sang thanh toán (FR-15). Thanh toán thành công → lịch "đã xác nhận", thông báo kèm số tiền (FR-04).
  - *1a-1. Thanh toán thất bại, bị hủy hoặc hết hạn giữ chỗ (Q-11):* lịch không được xác nhận, khung được nhả, bệnh nhân được báo (FR-16).
  - *5a. Thiếu trường bắt buộc:* hệ thống báo trường còn thiếu, không cho gửi (FR-07).
  - *6a. Khung vừa hết chỗ:* chuyển sang SC-02.
- **Hậu điều kiện:** Thành công: có một lịch "đã xác nhận", số chỗ của khung giảm 1. Thất bại: không tạo lịch, số chỗ của khung không đổi.
- **Yêu cầu liên quan:** FR-01, FR-02, FR-03, FR-04, FR-07, FR-09, FR-15, FR-16.

### SC-02 · Khung giờ hoặc bác sĩ không còn khả dụng

- **Tác nhân chính:** Bệnh nhân · **Tiền điều kiện:** Bệnh nhân đang đặt lịch (SC-01, bước 3–5) · **Kích hoạt:** Bệnh nhân gửi yêu cầu vào khung vừa hết chỗ.
- **Luồng chính:**
  1. Bệnh nhân gửi yêu cầu đặt khung đã chọn.
  2. Hệ thống phát hiện khung đã đủ số bệnh nhân hoặc chỗ cuối đang được giữ chờ thanh toán (FR-03, FR-16).
  3. Hệ thống từ chối, báo khung đã hết chỗ, không tạo lịch.
  4. Hệ thống hiển thị lại danh sách khung khả dụng đã cập nhật (FR-02).
  5. Bệnh nhân chọn khung khác; tiếp tục SC-01 từ bước 4.
- **Luồng thay thế/ngoại lệ:**
  - *2a. Bác sĩ đã được đánh dấu nghỉ hoặc không làm việc ngày đó (FR-11, FR-12):* hệ thống báo bác sĩ không khả dụng; bệnh nhân chọn bác sĩ hoặc ngày khác.
  - *4a. Không còn khung nào trong ngày:* hệ thống báo hết chỗ; bệnh nhân chọn ngày khác.
  - *5a. Bệnh nhân dừng:* không có lịch nào được tạo.
- **Hậu điều kiện:** Không khung nào vượt giới hạn số bệnh nhân. Nếu bệnh nhân chọn được khung khác: như SC-01; nếu không: không tạo lịch.
- **Yêu cầu liên quan:** FR-02, FR-03, FR-11, FR-12, FR-16.

### SC-03 · Bệnh nhân đổi hoặc hủy lịch

- **Tác nhân chính:** Bệnh nhân · **Tiền điều kiện:** Bệnh nhân có lịch sắp tới ở trạng thái "đã xác nhận" · **Kích hoạt:** Bệnh nhân mở danh sách lịch của mình (FR-14) và chọn một lịch.
- **Luồng chính (đổi lịch):**
  1. Bệnh nhân chọn "Đổi lịch".
  2. Hệ thống kiểm tra còn trong hạn đổi (Q-03) và hiển thị các khung khả dụng (FR-02).
  3. Bệnh nhân chọn khung mới.
  4. Hệ thống nhận khung mới, sau đó nhả khung cũ (FR-05).
  5. Hệ thống gửi thông báo đổi lịch (FR-04); danh sách của bác sĩ cập nhật (FR-09).
- **Luồng thay thế/ngoại lệ:**
  - *1a. Bệnh nhân chọn "Hủy lịch":* hệ thống yêu cầu xác nhận; bệnh nhân xác nhận; hệ thống chuyển lịch sang "bệnh nhân hủy", mở lại khung (FR-06) và gửi thông báo (FR-04).
  - *1a-1. (v1.1 – CR-01) Lịch trực tuyến đã thanh toán:* hệ thống ghi nhận hủy, khoản tiền ở trạng thái "chờ chính sách", không hoàn tự động (FR-06, ASM-17).
  - *2a. Quá hạn đổi/hủy:* hệ thống từ chối, lịch giữ nguyên.
  - *3a. (v1.1 – CR-01) Đổi lịch trực tuyến đã thanh toán:* cách xử lý khoản đã trả chờ Q-12.
  - *4a. Khung mới vừa hết chỗ:* hệ thống từ chối, lịch cũ giữ nguyên (FR-05); quay lại bước 2.
- **Hậu điều kiện:** Đổi thành công: lịch ở khung mới, khung cũ còn chỗ trở lại. Hủy thành công: lịch "bệnh nhân hủy", khung còn chỗ trở lại. Thất bại: lịch cũ giữ nguyên.
- **Yêu cầu liên quan:** FR-02, FR-04, FR-05, FR-06, FR-09, FR-14.

### SC-04 · Bác sĩ nghỉ đột xuất

- **Tác nhân chính:** Nhân viên tiếp nhận · **Tiền điều kiện:** Nhân viên đã đăng nhập, có quyền (FR-13); bác sĩ có lịch hẹn trong ca · **Kích hoạt:** Bác sĩ báo nghỉ một ca.
- **Luồng chính:**
  1. Nhân viên chọn bác sĩ, ngày, ca và đánh dấu nghỉ (FR-11).
  2. Hệ thống liệt kê các lịch bị ảnh hưởng; nhân viên xác nhận.
  3. Hệ thống chuyển các lịch sang "bác sĩ hủy" và khóa các khung của ca (FR-11).
  4. Hệ thống gửi thông báo hủy lịch cho từng bệnh nhân (FR-18).
  5. Hệ thống hiển thị số lịch đã hủy và số thông báo đã gửi.
- **Luồng thay thế/ngoại lệ:**
  - *2a. Ca không có lịch hẹn:* hệ thống chỉ khóa khung, không gửi thông báo.
  - *3a. (v1.1 – CR-01) Lịch trực tuyến đã thanh toán:* hệ thống tạo yêu cầu hoàn toàn bộ số đã trả (FR-17); thông báo ghi số tiền và trạng thái hoàn (FR-18).
  - *3a-1. Hoàn tiền lỗi:* giao dịch ở trạng thái "hoàn lỗi" và vào danh sách cần xử lý (FR-19); thông báo không ghi "đã hoàn tiền".
  - *3b. Chuyển bệnh nhân sang bác sĩ khác cùng chuyên khoa:* chưa đặc tả vì chờ Q-08; phiên bản này chỉ hủy lịch và thông báo, bệnh nhân tự đặt lại theo SC-01.
  - *4a. Gửi thông báo thất bại:* hệ thống liệt kê các lịch chưa gửi được thông báo để nhân viên liên hệ trực tiếp.
- **Hậu điều kiện:** Không còn lịch hiệu lực trong ca; mọi bệnh nhân bị ảnh hưởng có thông báo; mỗi lịch trực tuyến đã trả có đúng một giao dịch hoàn.
- **Yêu cầu liên quan:** FR-11, FR-13, FR-17, FR-18, FR-19.

## 1.12 CR-01 – Khám trực tuyến

**Nội dung thay đổi:** Phòng khám bắt đầu cung cấp khám trực tuyến. Bệnh nhân phải thanh toán trước để xác nhận lịch; nếu bác sĩ hủy lịch, hệ thống hoàn tiền và thông báo cho bệnh nhân.

### 1.12.1 Yêu cầu bị ảnh hưởng

| Yêu cầu      | Thay đổi (1.0 → 1.1)                                                                                  | Loại    |
| ------------ | ----------------------------------------------------------------------------------------------------- | ------- |
| FR-01        | Thêm lựa chọn hình thức khám; lịch trực tuyến chỉ xác nhận sau thanh toán.                            | Sửa     |
| FR-02        | Khung giờ hiển thị theo hình thức khám; khung đang giữ chỗ không tính là trống.                       | Sửa     |
| FR-03        | Số chỗ đã dùng tính cả lịch đang giữ chờ thanh toán.                                                  | Sửa     |
| FR-04        | Lịch trực tuyến chỉ gửi xác nhận khi đã thanh toán, kèm số tiền.                                      | Sửa     |
| FR-05        | Thêm trường hợp đổi lịch trực tuyến đã trả tiền (chờ Q-12).                                           | Sửa     |
| FR-06        | Thêm trường hợp bệnh nhân tự hủy lịch trực tuyến đã trả tiền (chờ Q-12).                              | Sửa     |
| FR-08        | Lịch trực tuyến do nhân viên tạo hộ cũng phải qua thanh toán.                                         | Sửa     |
| FR-09        | Danh sách của bác sĩ hiển thị hình thức khám.                                                         | Sửa     |
| FR-11        | Bác sĩ nghỉ đột xuất kéo theo hoàn tiền cho lịch trực tuyến đã trả.                                   | Sửa     |
| FR-12        | Khung giờ có thêm thuộc tính hình thức khám được mở.                                                  | Sửa     |
| FR-13        | Thêm quyền xem dữ liệu thanh toán và hoàn tiền.                                                       | Sửa     |
| FR-14        | Hiển thị trạng thái thanh toán, hoàn tiền trong lịch của bệnh nhân.                                   | Sửa     |
| FR-15        | Thanh toán trước cho lịch trực tuyến.                                                                 | Mới     |
| FR-16        | Giữ chỗ trong thời gian chờ thanh toán.                                                               | Mới     |
| FR-17        | Hoàn tiền khi bác sĩ hủy lịch.                                                                        | Mới     |
| FR-18        | Thông báo hủy lịch và hoàn tiền.                                                                      | Mới     |
| FR-19        | Theo dõi giao dịch thanh toán và hoàn tiền.                                                           | Mới     |
| NFR-07       | Bảo mật dữ liệu thanh toán (bổ sung ở 1.2 theo ISS-07).                                                                           | Mới     |
| NFR-08       | Không trừ tiền, không hoàn tiền trùng (bổ sung ở 1.2 theo ISS-07).                                                                | Mới     |
| NFR-09       | Lưu vết giao dịch (bổ sung ở 1.2 theo ISS-07).                                                                                    | Mới     |
| FR-07, FR-10 | Không đổi: thông tin bệnh nhân và trạng thái lượt khám không phụ thuộc hình thức khám hay thanh toán. | Giữ 1.0 |

**Scenario và test case bị ảnh hưởng**

| Mục | Thay đổi (1.0 → 1.1) | Loại |
|---|---|---|
| SC-01 | Thêm luồng 1a (đặt lịch trực tuyến, thanh toán) và 1a-1 (thanh toán thất bại) | Sửa |
| SC-02 | Bước 2: chỗ cuối đang giữ chờ thanh toán được tính là hết chỗ | Sửa |
| SC-03 | Thêm 1a-1 (tự hủy lịch đã thanh toán) và 3a (đổi lịch đã thanh toán) | Sửa |
| SC-04 | Thêm 3a (hoàn tiền) và 3a-1 (hoàn lỗi) | Sửa |
| TC-01, TC-06, TC-07 | Ghi rõ hình thức "tại phòng khám" trong dữ liệu vào để tách khỏi luồng trực tuyến | Sửa |
| TC-11…TC-14 | Kiểm thử thanh toán, giữ chỗ, hoàn tiền, tự hủy lịch đã thanh toán | Mới |
| TC-17, TC-21, TC-22 | Kiểm thử FR-19, NFR-07, NFR-09 (bổ sung ở 1.2 theo ISS-15) | Mới |
| TC-02…TC-05, TC-08…TC-10 | Không đổi: dữ liệu vào và kết quả mong đợi vẫn đúng với FR bản 1.1 | Giữ 1.0 |

### 1.12.2 Dữ liệu bị ảnh hưởng

| Dữ liệu                | Thay đổi                                                                                                      |
| ---------------------- | ------------------------------------------------------------------------------------------------------------- |
| Lịch hẹn               | Thêm hình thức khám; thêm trạng thái "chờ thanh toán", "bác sĩ hủy", "bệnh nhân hủy"; liên kết tới giao dịch. |
| Khung giờ, ca làm việc | Thêm hình thức khám được mở; thêm số chỗ đang giữ chờ thanh toán.                                             |
| Giao dịch thanh toán   | Mới: mã giao dịch, mã lịch, số tiền, thời điểm, phương thức, trạng thái.                                      |
| Giao dịch hoàn tiền    | Mới: mã giao dịch hoàn, mã giao dịch gốc, số tiền, thời điểm, trạng thái.                                     |
| Hồ sơ bệnh nhân        | Thông tin liên lạc trở thành bắt buộc để nhận thông báo hủy và hoàn tiền.                                     |


### 1.12.3 Rủi ro và câu hỏi mới

| #   | Loại    | Nội dung                                                                                                                  | Ảnh hưởng tới       | Q liên quan |
| --- | ------- | ------------------------------------------------------------------------------------------------------------------------- | ------------------- | ----------- |
| 1   | Rủi ro  | Cổng thanh toán và hệ thống lệch trạng thái: tiền đã trừ nhưng lịch chưa được xác nhận.                                   | FR-15, FR-16        | Q-11        |
| 2   | Rủi ro  | Bác sĩ nghỉ đột xuất khiến hàng loạt khoản hoàn phát sinh cùng lúc; hoàn lỗi hoặc chậm sẽ dồn về hai nhân viên tiếp nhận. | FR-11, FR-17, FR-19 | Q-12        |
| 3   | Rủi ro  | Bệnh nhân giữ chỗ rồi không thanh toán làm khung giờ bị chiếm trong thời gian chờ.                                        | FR-03, FR-16        | Q-11        |
| 4   | Rủi ro  | Hệ thống bắt đầu lưu dữ liệu thanh toán cùng thông tin khám bệnh; lộ dữ liệu có hậu quả nặng hơn trước.                   | FR-13, FR-19        | Q-06, Q-10  |
| 5   | Câu hỏi | Bệnh nhân tự hủy lịch trực tuyến đã trả tiền thì có được hoàn không, hoàn bao nhiêu? CR-01 chỉ nói trường hợp bác sĩ hủy. | FR-05, FR-06        | Q-12        |
| 6   | Câu hỏi | Buổi khám trực tuyến diễn ra bằng công cụ nào và bệnh nhân vào bằng cách nào? CR-01 không nói.                            | FR-04, FR-09        | Q-09        |

Mọi yêu cầu phiên bản 1.1 (CR-01) đều truy vết về CR-01 (xem mục 4).

---

# 2. Minh chứng khảo sát

## 2.1 Kế hoạch thu thập yêu cầu

#### Kỹ thuật 1: Phân tích tình huống
- **Mục tiêu:** Khai thác dữ kiện hiện trạng của phòng khám An Tâm, bóc tách các bất cập trong 4 phát biểu của stakeholder để xác định phạm vi vấn đề và các khoảng trống thông tin.
- **Đối tượng:** Dữ liệu hiện trạng (80–120 bệnh nhân/ngày, 6 bác sĩ, 2 tiếp tân) và 4 phát biểu của Quản lý, Bác sĩ, Tiếp nhận, Bệnh nhân.
- **Vai trò:** Cả nhóm phân tích; TV1 tổng hợp.
- **Thời lượng:** 1 buổi họp nhóm (02/10/2026).
- **Cách ghi nhận:** Biên bản phân tích tình huống (mục 2.3) và danh sách vấn đề chưa rõ (mục 2.4).

#### Kỹ thuật 2: Phỏng vấn
- **Mục tiêu:** Thu thập trực tiếp các quy tắc nghiệp vụ nội bộ, giải quyết các mâu thuẫn về cập nhật sổ hẹn, và làm rõ các kịch bản ngoại lệ cùng yêu cầu phi chức năng.
- **Đối tượng:** 4 nhóm stakeholder: Quản lý (STK-01), Bác sĩ (STK-02), Nhân viên tiếp nhận (STK-03), Bệnh nhân (STK-04).
- **Vai trò:** TV2 đặt câu hỏi; TV3 ghi biên bản; TV1 cập nhật Q-xx đã có câu trả lời.
- **Thời lượng:** 20 – 30 phút cho mỗi buổi phỏng vấn; vòng 2 (sau CR-01) phỏng vấn thêm Quản lý và Bác sĩ theo chủ đề 4.
- **Cách ghi nhận:** Biên bản phỏng vấn, ghi nhận phản hồi vào mã câu hỏi `Q-xx`.

## 2.2 Bộ câu hỏi

### Chủ đề 1: Phân bổ khung giờ & Giới hạn lượt khám
* **Câu hỏi mở:**
  - **Q-OP01 (Quản lý & Bác sĩ):** Phòng khám hiện chia khung giờ khám cho 6 bác sĩ như thế nào để phục vụ 80–120 bệnh nhân/ngày mà không xảy ra quá tải tại sảnh chờ?
* **Câu hỏi đóng:**
  - **Q-CL01 (Bác sĩ):** Thời lượng khám tiêu chuẩn dành cho 1 bệnh nhân là bao lâu?  
    `[ ] 10 – 15 phút` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] 15 – 20 phút` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] 20 – 30 phút` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Khác`
  - **Q-CL02 (Quản lý):** Số lượng bệnh nhân tối đa một bác sĩ tiếp nhận trong 1 ca làm việc là bao nhiêu?  
    `[ ] 10 – 12 người` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] 13 – 15 người` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] 16 – 20 người` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Không giới hạn`

### Chủ đề 2: Quyền xem & Chỉnh sửa thông tin
* **Câu hỏi mở:**
  - **Q-OP02 (Quản lý):** Phòng khám quy định ranh giới xem và chỉnh sửa thông tin giữa Nhân viên tiếp nhận và Bác sĩ như thế nào để vừa làm việc nhanh vừa bảo mật bệnh án?
* **Câu hỏi đóng:**
  - **Q-CL03 (Quản lý):** Nhân viên tiếp nhận được phép xem thông tin y tế nào của bệnh nhân?  
    `[ ] Chỉ thông tin hành chính (Họ tên, SĐT, Ngày sinh)`  
    `[ ] Thông tin hành chính + Lý do khám sơ bộ`  
    `[ ] Xem toàn bộ bệnh án và đơn thuốc cũ`
  - **Q-CL04 (Bác sĩ):** Bác sĩ có được tự thay đổi ca khám trên phần mềm không hay chỉ Quản lý mới có quyền duyệt?  
    `[ ] Bác sĩ tự đổi` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Gửi yêu cầu Quản lý duyệt` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Chỉ Quản lý xếp`

### Chủ đề 3: Đặt lịch, Tiếp nhận & Xử lý thay đổi lịch
* **Câu hỏi mở:**
  - **Q-OP03 (Nhân viên tiếp nhận):** Quy trình hiện tại từ khi nhận điện thoại, ghi sổ đến bàn giao danh sách cho bác sĩ gặp những khó khăn gì dẫn đến việc sửa sổ mà người khác không biết?
  - **Q-OP04 (Bệnh nhân & Tiếp nhận):** Bệnh nhân khi muốn đổi hoặc hủy lịch hiện tại phải làm những bước gì, và nhân viên điều phối lại slot trống đó ra sao?
  - **Q-OP05 (Quản lý):** Mục tiêu thời gian đặt lịch thành công của một bệnh nhân trên hệ thống mới là bao lâu và mong muốn triển khai trên kênh nào?
  - **Q-OP06 (Bác sĩ & Nhân viên tiếp nhận):** Khi bệnh nhân mới đến, quầy tiếp nhận đang ghi những thông tin gì, bác sĩ cần chuẩn bị hồ sơ nào trước ca, và hiện nay làm sao nhận ra một người đã từng khám ở phòng khám?
  - **Q-OP07 (Quản lý):** Sau một thời gian vận hành, phòng khám sẽ dựa vào những con số nào để đánh giá hệ thống có hiệu quả (ví dụ số cuộc gọi đặt lịch, số lịch bị sai lệch)?
* **Câu hỏi đóng:**
  - **Q-CL05 (Quản lý):** Bệnh nhân được phép đổi hoặc hủy lịch hẹn trước giờ khám tối thiểu bao lâu?  
    `[ ] Trước 2 giờ` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Trước 6 giờ` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Trước 24 giờ` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Bất kỳ lúc nào`
  - **Q-CL06 (Quản lý):** Mỗi lịch hẹn được đổi tối đa bao nhiêu lần?  
    `[ ] 1 lần` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] 2 lần` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] 3 lần` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Không giới hạn`
  - **Q-CL07 (Quản lý & Bệnh nhân):** Phòng khám muốn gửi thông báo lịch hẹn cho bệnh nhân qua kênh nào? (chọn nhiều)  
    `[ ] SMS` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Email` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Zalo` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Gọi điện` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Khác`

### Chủ đề 4: Khám trực tuyến & Thanh toán (CR-01, phỏng vấn vòng 2)
* **Câu hỏi mở:**
  - **Q-OP08 (Quản lý & Bác sĩ):** Buổi khám trực tuyến sẽ diễn ra trên công cụ nào, và bệnh nhân nhận thông tin để tham gia buổi khám bằng cách nào?
  - **Q-OP09 (Quản lý):** Giá khám trực tuyến được tính thế nào (theo bác sĩ, theo chuyên khoa hay đồng giá), và bệnh nhân có cần biên lai sau khi thanh toán không?
* **Câu hỏi đóng:**
  - **Q-CL08 (Quản lý):** Phòng khám chấp nhận phương thức thanh toán nào? (chọn nhiều)  
    `[ ] Thẻ ngân hàng` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Ví điện tử` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Chuyển khoản qua mã QR` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Khác`
  - **Q-CL09 (Quản lý):** Khung giờ được giữ cho bệnh nhân trong bao lâu khi chờ thanh toán?  
    `[ ] 5 phút` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] 10 phút` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] 15 phút` &nbsp;&nbsp;&nbsp;&nbsp; `[ ] Khác`

### Câu hỏi làm rõ ngoại lệ và yêu cầu phi chức năng

#### Ngoại lệ
1. **Q-EX01 (Bệnh nhân đến trễ):** Nếu bệnh nhân đến trễ quá 15 phút so với giờ hẹn, hệ thống sẽ tự hủy slot, chuyển sang danh sách chờ chèn vào cuối ca hay giữ nguyên cho bác sĩ gọi vào?
2. **Q-EX02 (Bệnh nhân không đến):** Nếu bệnh nhân đặt lịch nhưng không đến và không báo trước, hệ thống xử lý trạng thái lịch này thế nào và có cảnh báo/khóa quyền đặt lịch lần sau không?
3. **Q-EX03 (Cấp cứu):** Khi có ca bệnh nặng cần khám gấp chen ngang, hệ thống điều chỉnh thứ tự khám trong ca và thông báo độ trễ cho các bệnh nhân đang chờ như thế nào?
4. **Q-EX04 (Bác sĩ nghỉ đột xuất):** Khi bác sĩ nghỉ đột xuất, hệ thống tự động gợi ý chuyển bệnh nhân sang bác sĩ khác hay tự động gửi tin nhắn đề xuất dời ngày?
5. **Q-EX05 (Trùng slot khám):** Nếu hai bệnh nhân cùng bấm xác nhận một slot khám duy nhất tại cùng một thời điểm, hệ thống khóa giữ chỗ và thông báo cho bệnh nhân thao tác sau như thế nào?
6. **Q-EX06 (Thanh toán sau khi hết hạn giữ chỗ):** Nếu tiền của bệnh nhân về sau khi đã hết thời gian giữ chỗ, phòng khám muốn xác nhận lịch (nếu khung còn chỗ) hay hoàn tiền?
7. **Q-EX07 (Bệnh nhân tự hủy hoặc đổi lịch trực tuyến đã trả tiền):** Bệnh nhân có được hoàn tiền không, hoàn bao nhiêu, trong bao lâu, ai chịu phí cổng thanh toán; nếu đổi lịch thì khoản đã trả được xử lý thế nào?

#### Phi chức năng
8. **Q-NFR01 (Hiệu năng):** Hệ thống cần chịu tải bao nhiêu người truy cập đồng thời và thời gian phản hồi tối đa là bao nhiêu giây?
9. **Q-NFR02 (Bảo mật):** Thông tin cá nhân và dữ liệu lịch hẹn của bệnh nhân cần được mã hóa theo chuẩn nào khi lưu trữ và truyền qua internet?
10. **Q-NFR03 (Sao lưu):** Dữ liệu lịch hẹn và tiếp nhận bệnh nhân cần sao lưu dự phòng định kỳ với tần suất thế nào và lưu trữ trong bao lâu?
11. **Q-NFR04 (Sẵn sàng):** Giờ hoạt động của phòng khám là khi nào, và trong giờ đó hệ thống được phép ngừng tối đa bao lâu mỗi tháng?

## 2.3 Biên bản khảo sát

### Biên bản phân tích tình huống (02/10/2026)

| Dữ kiện trong case | Phát hiện | Kết quả |
|---|---|---|
| Đặt lịch qua điện thoại, ghi sổ | Bệnh nhân phải gọi nhiều lần; 2 nhân viên xử lý 80–120 lượt/ngày | N-01 |
| "Sửa ở sổ thì đôi khi người khác không biết" | Không có nguồn lịch dùng chung | N-02 |
| Bác sĩ nhận danh sách đầu ca | Thay đổi sau đầu ca không tới bác sĩ; không chuẩn bị hồ sơ trước | N-03, Q-05 |
| Bệnh nhân mới khai thông tin khi đến | Thông tin chỉ có tại quầy | N-03, Q-05 |
| "Muốn đổi lịch mà không phải đến tận nơi" | Không có kênh đổi lịch từ xa | N-04, Q-03 |
| Bác sĩ nghỉ thì gọi từng bệnh nhân | Tốn công, dễ sót | N-05, Q-08 |
| Mục "cần khảo sát": khung giờ, giới hạn bệnh nhân | Chưa có quy tắc | Q-01 |
| Mục "cần khảo sát": quyền xem, sửa | Chưa có ma trận quyền | Q-06 |
| Mục "cần khảo sát": đến trễ, vắng mặt, khám gấp | Chưa có quy tắc | N-06, Q-04 |
| Mục "cần khảo sát": hiệu năng, bảo mật, lưu trữ | Chưa có ngưỡng | N-07, Q-14 |

### Biên bản phỏng vấn

Chưa thực hiện: Phòng khám An Tâm là tình huống giả định, không có stakeholder để phỏng vấn. Bộ câu hỏi ở mục 2.2 giữ nguyên để dùng khi phỏng vấn; các nội dung cần stakeholder trả lời được ghi thành Q-01…Q-14 và giả định tương ứng (mục 1.7).

## 2.4 Vấn đề chưa rõ

| # | Vấn đề chưa rõ | Căn cứ phát sinh từ hiện trạng | Stakeholder cần xác nhận | Trạng thái | Q liên quan |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1 | Độ dài 1 slot và số bệnh nhân tối đa/ca | Tải 80–120 bệnh nhân/ngày trên 6 bác sĩ nhưng chưa có thời lượng cố định cho 1 lượt khám. | STK-01 (Quản lý), STK-02 (Bác sĩ) | `[ASM-12]` Tạm tính 20 phút/slot; chờ xác nhận qua Q-CL01. | Q-01 |
| 2 | Xử lý bệnh nhân đến trễ hẹn | Hiện trạng chưa có quy tắc xử lý khi bệnh nhân đến trễ: trễ bao lâu thì mất lượt, hủy lượt hay chèn cuối ca. | STK-01 (Quản lý), STK-03 (Tiếp nhận) | Chờ xác nhận qua Q-EX01. | Q-04 |
| 3 | Chế tài với bệnh nhân vắng mặt (No-show) | Bệnh nhân đặt nhưng không đến làm trống slot của bác sĩ; chưa rõ có khóa quyền đặt không. | STK-01 (Quản lý) | Chờ xác nhận qua Q-EX02. | Q-04 |
| 4 | Quy trình chèn ca khám cấp cứu / khám gấp | Chưa có quy định phân luồng khi có ca gấp chen ngang các lịch đã hẹn trước. | STK-02 (Bác sĩ), STK-03 (Tiếp nhận) | Chờ xác nhận qua Q-EX03. | Q-04 |
| 5 | Kênh thông báo tự động khi bác sĩ nghỉ đột xuất | Hiện tại tiếp tân gọi điện từng người gây quá tải; chưa rõ hệ thống dùng SMS, Zalo hay Email. | STK-01 (Quản lý), STK-03 (Tiếp nhận) | Chờ xác nhận qua Q-CL07. | Q-07 |
| 6 | Ranh giới phân quyền hồ sơ bệnh án | Tiếp tân chỉ cần biết thông tin hành chính hay được xem cả lý do khám chi tiết. | STK-01 (Quản lý), STK-02 (Bác sĩ) | `[ASM-10]` Tiếp tân chỉ xem hành chính; chờ Q-CL03. | Q-06 |
| 7 | Quy định thời gian tối thiểu đổi / hủy lịch | Bệnh nhân muốn đổi lịch từ xa nhưng chưa rõ phải đổi trước mấy tiếng để mở lại slot. | STK-01 (Quản lý), STK-04 (Bệnh nhân) | Chờ xác nhận qua Q-CL05. | Q-03 |
| 8 | Cơ chế định danh khi đặt lịch trực tuyến | Bệnh nhân đặt lịch có bắt buộc nhập CCCD/tạo tài khoản không hay chỉ cần OTP qua SĐT. | STK-01 (Quản lý), STK-04 (Bệnh nhân) | `[ASM-11]` Xác thực nhanh qua SĐT; chờ Q-OP06. | Q-05 |

---

# 3. Validation report

## 3.1 Vấn đề review

| ID | Vị trí | Vấn đề | Tiêu chí | Tác giả | Người review | Phản hồi của tác giả | Quyết định |
|---|---|---|---|---|---|---|---|
| ISS-01 | FR-09 | "Danh sách phải được cập nhật theo dữ liệu hiện tại" không kiểm chứng được | Đo lường được | TV3 | TV1 | Đồng ý; "dữ liệu hiện tại" không có điểm đo | Sửa: cập nhật ở lần mở/tải lại kế tiếp |
| ISS-02 | FR-06 | Trạng thái "chờ chính sách" do nhóm tự đặt, không có nguồn stakeholder | Đúng đắn | TV3 | TV1 | Đồng ý; trạng thái do nhóm suy ra vì CR-01 không nói tới | Sửa: ghi thành ASM-17 |
| ISS-03 | NFR-01, 02, 05 | Tiêu chí dùng từ mơ hồ ("đủ nhanh", "không chờ lâu"), không có ngưỡng | Đo lường được | TV2 | TV3 | Đồng ý; chưa có số liệu từ stakeholder nên dùng ngưỡng tạm có nhãn ASM | Sửa: thêm ngưỡng tạm ASM-13…ASM-15 |
| ISS-04 | NFR-01…06 | Thiếu nguồn, độ ưu tiên, lý do, phiên bản theo mẫu | Đầy đủ | TV2 | TV3 | Đồng ý | Sửa: viết lại theo mẫu |
| ISS-05 | NFR-04 | Nhắc "lịch sử chẩn đoán bệnh án" trong khi bệnh án nằm ngoài phạm vi | Nhất quán | TV2 | TV3 | Đồng ý; bệnh án nằm ngoài phạm vi (mục 1.3) | Sửa: bỏ phần bệnh án, dẫn FR-13, ASM-10 |
| ISS-06 | NFR-06 | Thời hạn "5 năm theo Thông tư 46/2018/TT-BYT" chưa kiểm chứng; thông tư áp dụng cho bệnh án điện tử, không phải lịch hẹn | Đúng đắn | TV2 | TV3 | Đồng ý; chưa đối chiếu được phạm vi áp dụng của thông tư | Sửa: chuyển thời hạn lưu trữ sang Q-14 |
| ISS-07 | Mục 1.12 | CR-01 chưa có NFR cho thanh toán | Đầy đủ | TV3 | TV1 | Đồng ý | Sửa: thêm NFR-07…NFR-09 |
| ISS-08 | Mục 2.1 | Kế hoạch khảo sát thiếu vai trò và thời lượng phân tích tình huống | Đầy đủ | TV2 | TV3 | Đồng ý | Sửa: bổ sung |
| ISS-09 | Q-OP05 | Một câu hỏi hai ý (thời gian đặt lịch và kênh triển khai) | Rõ ràng | TV2 | TV3 | Hai ý cùng do Quản lý quyết định; tách ra làm buổi phỏng vấn dài thêm | Không sửa: cùng chủ đề, hỏi trong một lượt phỏng vấn với Quản lý |
| ISS-10 | SC-03 (2a) | Hạn đổi/hủy chưa xác định nên luồng 2a không kiểm thử được | Đo lường được | TV4 | TV2 | Ngưỡng phụ thuộc Q-03; bỏ luồng thì mất một ngoại lệ quan trọng | Không sửa: giữ luồng, dẫn Q-03; bổ sung test case khi có câu trả lời |
| ISS-11 | SC-04 | Thiếu ngoại lệ khi gửi thông báo thất bại; nhân viên không biết bệnh nhân nào chưa được báo | Đầy đủ | TV4 | TV2 | Đồng ý | Sửa: thêm luồng 4a |
| ISS-12 | FR-15, FR-17 | Thanh toán và hoàn tiền tự động phụ thuộc cổng thanh toán có hỗ trợ hoàn tiền qua API; nếu không thì FR-17 không khả thi | Khả thi | TV3 | TV1 | Chưa chọn cổng thanh toán nên chưa kiểm tra được | Không sửa: đã ghi phụ thuộc ASM-09; xác nhận khi chọn cổng thanh toán |
| ISS-13 | Lịch sử phiên bản | Bản xử lý review ("1.0r") đặt trước CR-01 nhưng ISS-02, ISS-07, ISS-12 lại review nội dung của CR-01; "1.0r" không phải số phiên bản; dòng 1.1 thiếu ASM-09; chưa ghi Q-13, Q-14 thêm ở bản nào | Nhất quán | TV1 | TV4 | Đồng ý; review thực hiện sau khi đã áp CR-01 | Sửa: đổi thành 1.0 → 1.1 (CR-01) → 1.2 (review); bổ sung ASM-09, Q-13, Q-14 vào lịch sử; cập nhật cột phiên bản của FR-06, FR-09, NFR-01…NFR-09 |
| ISS-14 | Mục 1.7, 2.2, 2.4 | Q-01…Q-14 và câu hỏi khảo sát (Q-OP/CL/EX/NFR) không liên kết với nhau; mục 2.4 dòng 5 trỏ Q-EX04 (chuyển bác sĩ), dòng 8 trỏ Q-CL03 (quyền xem), sai nội dung; Q-05, Q-07, Q-09…Q-13 không có câu hỏi khảo sát tương ứng | Nhất quán | TV1, TV2 | TV4 | Đồng ý | Sửa: thêm cột "Câu hỏi khảo sát" ở mục 1.7; thêm Q-OP06…Q-OP09, Q-CL06…Q-CL09, Q-EX06, Q-EX07, Q-NFR04; sửa mục 2.4 |
| ISS-15 | Mục 3.2, 4 | FR-08, FR-14, FR-19, NFR-03, NFR-05, NFR-06, NFR-07, NFR-09 chưa có test case; ma trận truy vết thiếu liên kết yêu cầu → test | Đầy đủ | TV4, TV1 | TV2 | Đồng ý | Sửa: thêm TC-15…TC-22, cập nhật ma trận |
| ISS-16 | SC-01 bước 4 | Dẫn ASM-11 (xác thực qua số điện thoại) làm căn cứ nhận ra bệnh nhân cũ, trong khi cách nhận ra bệnh nhân cũ còn là câu hỏi mở Q-05 | Đúng đắn | TV4 | TV2 | Đồng ý | Sửa: tách bước xác thực (ASM-11) và nhận ra bệnh nhân cũ (Q-05) |
| ISS-17 | Mục 1.12.1 | Phân tích tác động CR-01 chỉ liệt kê TC mới, không nêu TC-01, TC-06, TC-07 (đã ghi rõ "tại phòng khám") bị sửa và các TC còn lại có bị ảnh hưởng không | Đầy đủ | TV3 | TV1 | Đồng ý | Sửa: bổ sung các dòng TC bị sửa và không đổi |
| ISS-18 | SC-04 | Luồng thay thế không theo thứ tự bước (2a, 4a, 3a); nhánh "chờ Q-08" không có mã bước | Rõ ràng | TV4 | TV3 | Đồng ý | Sửa: sắp lại thứ tự, đặt mã 3b cho nhánh chờ Q-08 |

Review chéo: không thành viên nào review phần do mình phụ trách (cột Tác giả theo bảng phân công đầu tài liệu). Đủ 6 tiêu chí: Đúng đắn (ISS-02, 06, 16), Đầy đủ (ISS-04, 07, 08, 11, 15, 17), Nhất quán (ISS-05, 13, 14), Khả thi (ISS-12), Rõ ràng (ISS-09, 18), Đo lường được (ISS-01, 03, 10).

## 3.2 Test scenarios

| ID | Requirement ID | Scenario | Tiền điều kiện | Bước / dữ liệu vào | Kết quả mong đợi |
|---|---|---|---|---|---|
| TC-01 | FR-01, FR-02, FR-04, FR-09 | SC-01 | Bác sĩ A có khung 08:00 ngày D còn chỗ | Bệnh nhân đặt khung 08:00, hình thức tại phòng khám, đủ thông tin | Lịch "đã xác nhận" có mã lịch; đúng 1 thông báo; lịch hiện trong danh sách ngày D của bác sĩ A |
| TC-02 | FR-07 | SC-01 (5a) | Bệnh nhân mới | Gửi yêu cầu thiếu trường bắt buộc; sau đó gửi đủ; đặt thêm một lịch khác | Lần 1 bị chặn, báo trường thiếu; lần 2 tạo 1 hồ sơ; lần 3 không tạo hồ sơ trùng |
| TC-03 | FR-03 | SC-02 | Khung còn đúng 1 chỗ | Hai bệnh nhân gửi yêu cầu đồng thời | Đúng 1 lịch được tạo; người còn lại nhận thông báo hết chỗ; số lịch không vượt giới hạn |
| TC-04 | FR-02, FR-12 | SC-02 (2a) | Bác sĩ B nghỉ ngày D; khung X ngày D đã đầy | Mở danh sách khung ngày D | Không có khung của bác sĩ B; khung X không hiển thị là còn chỗ |
| TC-05 | FR-05 | SC-03 | Bệnh nhân có lịch 08:00; khung 09:00 còn chỗ; khung 10:00 đã đầy | Đổi sang 10:00, rồi đổi sang 09:00 | Đổi sang 10:00 bị từ chối, lịch 08:00 giữ nguyên; đổi sang 09:00 thành công, khung 08:00 còn chỗ trở lại, có thông báo |
| TC-06 | FR-06 | SC-03 (1a) | Lịch tại phòng khám "đã xác nhận" | Bệnh nhân hủy lịch | Lịch "bệnh nhân hủy"; khung còn chỗ trở lại; lịch không còn trong danh sách bác sĩ |
| TC-07 | FR-11, FR-18 | SC-04 | Bác sĩ C có 3 lịch tại phòng khám trong ca sáng ngày D | Nhân viên đánh dấu bác sĩ C nghỉ ca sáng | Cả 3 lịch "bác sĩ hủy"; 3 thông báo được gửi; khung ca sáng không còn khả dụng |
| TC-08 | FR-10 | — | Bệnh nhân có lịch hôm nay | Nhân viên chuyển trạng thái "chưa đến" → "đã đến" | Trạng thái giống nhau ở màn tiếp nhận và danh sách bác sĩ; có bản ghi người thực hiện, thời điểm; lượt khám chỉ có 1 trạng thái |
| TC-09 | FR-13, NFR-04 | — | Tài khoản bệnh nhân A và B | Bệnh nhân A gửi trực tiếp tới máy chủ yêu cầu xem lịch của B | Yêu cầu bị từ chối, không trả dữ liệu, có bản ghi nhật ký |
| TC-10 | NFR-01, NFR-02 | — | Dữ liệu thử có lịch làm việc của 6 bác sĩ | 50 phiên đồng thời xem khung giờ và đặt lịch trong 10 phút | Tỉ lệ lỗi 0%; ít nhất 95% yêu cầu phản hồi ≤ 3 giây |
| TC-11 | FR-15, FR-16 *(CR-01)* | SC-01 (1a) | Khung trực tuyến còn 1 chỗ | Bệnh nhân 1 bắt đầu thanh toán; bệnh nhân 2 đặt cùng khung; bệnh nhân 1 thanh toán thành công | Bệnh nhân 2 bị từ chối; lịch của bệnh nhân 1 "đã xác nhận" sau thanh toán, có đúng 1 giao dịch |
| TC-12 | FR-15, FR-16 *(CR-01)* | SC-01 (1a-1) | Khung trực tuyến còn chỗ | Bệnh nhân bắt đầu thanh toán rồi hủy thanh toán | Lịch không được xác nhận; khung còn chỗ trở lại; bệnh nhân được báo |
| TC-13 | FR-17, FR-18, NFR-08 *(CR-01)* | SC-04 (3a) | Bác sĩ D có 1 lịch trực tuyến đã thanh toán | Đánh dấu bác sĩ D nghỉ; lặp lại thao tác hủy | Đúng 1 giao dịch hoàn bằng số đã trả; thông báo ghi số tiền và trạng thái hoàn; lần lặp không tạo giao dịch hoàn thứ hai |
| TC-14 | FR-06 *(CR-01)* | SC-03 (1a-1) | Lịch trực tuyến đã thanh toán | Bệnh nhân tự hủy lịch | Lịch "bệnh nhân hủy"; khoản tiền "chờ chính sách"; không có giao dịch hoàn |
| TC-15 | FR-08 | — | Nhân viên tiếp nhận đã đăng nhập; khung 09:00 của bác sĩ A còn đúng 1 chỗ | Nhân viên tạo lịch tại phòng khám vào khung 09:00 cho một bệnh nhân gọi điện; sau đó tạo thêm một lịch nữa vào cùng khung | Lần 1: lịch hiện ngay trong danh sách của bác sĩ A, khung hết chỗ, có bản ghi người thao tác và thời điểm; lần 2 bị từ chối vì hết chỗ |
| TC-16 | FR-14 | SC-03 | Bệnh nhân A có 1 lịch sắp tới và 1 lịch đã qua; bệnh nhân B có 1 lịch | Nhân viên tìm theo mã lịch của A, rồi theo số điện thoại của A; bệnh nhân A mở danh sách lịch của mình | Tìm theo mã lịch trả đúng 1 lịch; tìm theo số điện thoại trả đủ 2 lịch của A; A thấy đủ 2 lịch kèm trạng thái và không thấy lịch của B |
| TC-17 | FR-19, FR-13 *(CR-01)* | SC-04 (3a-1) | Có giao dịch ở các trạng thái thành công, đang chờ, hoàn lỗi; tài khoản quản lý và tài khoản bác sĩ | Quản lý lọc "hoàn lỗi", rồi lọc "đang chờ"; bác sĩ mở màn hình giao dịch | Mỗi bộ lọc trả đúng tập giao dịch có trạng thái đó; tài khoản bác sĩ bị từ chối truy cập |
| TC-18 | NFR-03 | — | Hệ thống triển khai trên môi trường kiểm thử | Truy cập bằng địa chỉ http://; tạo 2 tài khoản cùng mật khẩu; kiểm tra bảng tài khoản trong cơ sở dữ liệu | Truy cập HTTP được chuyển sang HTTPS; không có mật khẩu ở dạng đọc được; 2 tài khoản cùng mật khẩu có giá trị băm khác nhau |
| TC-19 | NFR-05 | — | Hệ thống vận hành 1 tháng, có công cụ giám sát thời gian hoạt động | Tổng hợp thời gian ngừng trong giờ hoạt động của tháng | Thời gian ngừng ≤ 1% giờ hoạt động; các lần bảo trì có kế hoạch nằm ngoài giờ hoạt động |
| TC-20 | NFR-06 | — | Có bản sao lưu cuối ngày D | Tạo thêm lịch ở ngày D+1; khôi phục bản sao lưu ngày D vào môi trường kiểm thử | Dữ liệu sau khôi phục khớp thời điểm sao lưu ngày D; nhật ký sao lưu có bản ghi cho mỗi ngày |
| TC-21 | NFR-07 *(CR-01)* | SC-01 (1a) | Cổng thanh toán ở chế độ thử | Thực hiện một thanh toán bằng thẻ thử; rà soát cơ sở dữ liệu và nhật ký | Không có trường nào chứa số thẻ hoặc thông tin đăng nhập thanh toán; chỉ có mã giao dịch, số tiền, trạng thái |
| TC-22 | NFR-09 *(CR-01)* | SC-04 (3a) | Bác sĩ D có 1 lịch trực tuyến | Bệnh nhân thanh toán lịch; đánh dấu bác sĩ D nghỉ để hoàn tiền; dùng từng vai thử sửa, xóa bản ghi nhật ký | Nhật ký có đủ các lần chuyển trạng thái của lịch và giao dịch, mỗi bản ghi có thời điểm, người hoặc hệ thống thực hiện, trạng thái trước và sau; không vai nào sửa hay xóa được |

---

# 4. Ma trận truy vết

| Nhu cầu | Stakeholder | Requirement ID | Scenario | Test case | Change request |
|---|---|---|---|---|---|
| N-01 | STK-01, STK-04 | FR-01, FR-02, FR-03, FR-04, FR-07, FR-08, FR-12, NFR-01, NFR-02 | SC-01, SC-02 | TC-01, TC-02, TC-03, TC-04, TC-10, TC-15 | CR-01 |
| N-02 | STK-03 | FR-03, FR-08, FR-09, FR-10 | SC-02, SC-03 | TC-01, TC-03, TC-08, TC-15 | CR-01 |
| N-03 | STK-02 | FR-07, FR-09, FR-12 | SC-01 | TC-01, TC-02, TC-04 | CR-01 |
| N-04 | STK-04 | FR-05, FR-06, FR-14 | SC-03 | TC-05, TC-06, TC-14, TC-16 | CR-01 |
| N-05 | STK-03, STK-04 | FR-11, FR-18 | SC-04 | TC-07, TC-13 | CR-01 |
| N-06 | STK-03 | FR-10 | — | TC-08 | — |
| N-07 | STK-01 | FR-13, NFR-01…NFR-06 | — | TC-09, TC-10, TC-17, TC-18, TC-19, TC-20 | CR-01 |
| N-08 | STK-01, STK-04, STK-05 | FR-15, FR-16, FR-17, FR-18, FR-19, NFR-07, NFR-08, NFR-09 | SC-01, SC-03, SC-04 | TC-11, TC-12, TC-13, TC-14, TC-17, TC-21, TC-22 | CR-01 |

Kiểm tra độ phủ (phiên bản 1.2): mọi FR-01…FR-19 và NFR-01…NFR-09 đều xuất hiện trong ma trận và có ít nhất một test case; mọi TC-01…TC-22 đều gắn Requirement ID.

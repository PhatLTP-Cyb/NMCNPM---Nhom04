# Phân chia công việc nhóm LT05: ứng dụng sức khoẻ và prototype

**Bài liên quan:** Bài tập tuần 5 (mô hình hoá yêu cầu) và Bài tập tuần 6 (công cụ phác thảo prototype bằng AI)
**Hạn nộp:** ghi theo thông báo của giảng viên (điền: 17/10/2026)

---

## 1. Tổng quan phân công

| Thành viên | Vai trò | Bài | Phạm vi chính |
|---|---|---|---|
| **TV-A** | Làm prototype | Tuần 6 | Chạy prompt chuẩn cho bài sức khoẻ và bài sàn đấu giá; ghi nhật ký; làm slide và báo cáo 8 phút |
| **TV-B** | Phân tích phân hệ smartwatch | Tuần 5 | Các phần liên quan đến đồng hồ thông minh; state chart "Hoạt động thể chất" |
| **TV-C** | Phân tích phân hệ smartphone | Tuần 5 | Các phần liên quan đến điện thoại; activity diagram; bảng giả định |

**Cách hiểu phân công:** tuần 5 có một bộ sản phẩm chung (một sơ đồ use case, hai đặc tả, một activity diagram, một state chart). TV-B và TV-C cùng làm bộ đó, mỗi người chịu trách nhiệm một phân hệ. TV-A độc lập với tuần 5 về mặt thời gian, nhưng phải đối chiếu với tuần 5 khi viết báo cáo.

---

## 2. Bảng phân công chi tiết

### 2.1. Bài tuần 5: ứng dụng theo dõi sức khoẻ

| Hạng mục | Người chính | Người hỗ trợ | Đầu ra | Hạn |
|---|---|---|---|---|
| Thống nhất phân hệ và danh sách actor, use case | TV-B + TV-C | TV-A | Danh sách actor, danh sách use case theo hộp | ____ |
| Sơ đồ use case (2 hộp: smartwatch, smartphone) | TV-B (vẽ) | TV-C (rà soát) | Sơ đồ SVG, ghi chú include/extend, ghi chú phân hệ | ____ |
| Bảng giả định (≥5 mục, ≥1 về giao tiếp giữa hai thiết bị) | TV-C | TV-B | Bảng giả định GĐ-01 trở đi | ____ |
| Đặc tả use case A (phân hệ smartwatch, ví dụ "Ghi nhận hoạt động thể chất") | TV-B | TV-C | Bảng 14 mục, luồng chính, luồng thay thế, ngoại lệ, BR | ____ |
| Đặc tả use case B (phân hệ smartphone, ví dụ "Nhắc nhở theo lịch biểu") | TV-C | TV-B | Bảng 14 mục | ____ |
| Activity diagram (dựng từ một đặc tả) | TV-C | TV-B | Sơ đồ có swimlane, bảng truy vết | ____ |
| State chart "Hoạt động thể chất" + bảng chuyển trạng thái + ≥3 cặp bị từ chối | TV-B | TV-C | Sơ đồ, hai bảng | ____ |
| Danh sách kiểm tra nhất quán | TV-A | Cả nhóm | Checklist đã đánh dấu | ____ |
| Ghép thành một file HTML, đúng thứ tự mục 03 đến 08 | TV-A | Cả nhóm | File HTML duy nhất | ____ |

*Lưu ý: hai use case đặc tả ở trên chỉ là ví dụ. Nhóm chốt cuối cùng sau khi thống nhất phân hệ và danh sách use case.*

### 2.2. Bài tuần 6: công cụ phác thảo prototype

| Hạng mục | Người chính | Người hỗ trợ | Đầu ra | Hạn |
|---|---|---|---|---|
| Chọn công cụ, kiểm tra điều kiện truy cập và ghi ngày thử | TV-A | Cả nhóm | Ghi chú gói dùng, ngày, mô hình | ____ |
| Ghi tiêu chí đếm 24 thành phần (SK) và 22 thành phần (DG) trước khi chạy prompt | TV-A | TV-B, TV-C | Mục đầu nhật ký | ____ |
| Bài 1 (sức khoẻ): lượt prompt chuẩn, lượt thành phần, 3 yêu cầu chỉnh sửa | TV-A | TV-B (kiểm tra phân hệ smartwatch), TV-C (kiểm tra phân hệ smartphone) | Nhật ký, ảnh chụp, bảng SK đã đánh dấu | ____ |
| Bài 2 (đấu giá): lượt prompt chuẩn, lượt thành phần, 3 yêu cầu chỉnh sửa | TV-A | TV-B, TV-C cùng đối chiếu công thức tiền | Nhật ký, ảnh chụp, bảng DG đã đánh dấu | ____ |
| Phụ lục A (nhật ký nguyên văn), Phụ lục B (hai bảng thành phần) | TV-A | Cả nhóm | Tệp phụ lục | ____ |
| Slide báo cáo (5 phần) | TV-A | TV-B, TV-C viết phần giới hạn và khuyến nghị | Slide PDF hoặc PPTX | ____ |
| Video minh hoạ dự phòng (≤ 90 giây) | TV-B | TV-C | Tệp video | ____ |
| Chuẩn bị hỏi đáp | Cả nhóm | — | Trả lời bằng dữ liệu nhật ký | ____ |

### 2.3. Thứ tự và phụ thuộc

1. **Ngay từ đầu:** TV-A bắt đầu tuần 6 vì bài này không phụ thuộc vào sản phẩm tuần 5. TV-B và TV-C thống nhất phân hệ và actor trước.
2. **Tuần 5:** sơ đồ use case → đặc tả → activity diagram và state chart → kiểm tra nhất quán.
3. **Giao nhau:** khi TV-B hoặc TV-C phát hiện giả định mới trong tuần 5, cần báo TV-A để đối chiếu với prototype.
4. **Trước khi nộp:** cả nhóm đọc lại danh sách kiểm tra ở Mục 5.

---

## 3. Quy tắc làm việc chung

- Mỗi thành viên ghi công việc đã xong vào cột "Đã xong" của bảng trên, kèm ngày.
- Tệp làm chung đặt trong thư mục LT04, tên theo mẫu `BT05_Nhom04_<nội dung>` và `BT06_Nhom04_<nội dung>`.
- Mọi giả định đều ghi vào bảng giả định, không thay đổi âm thầm trong sơ đồ.
- Nhật ký tuần 6 ghi ngay khi chạy prompt, không dựng lại sau.
- Dữ liệu mẫu tự đặt, không dùng vị trí, nhịp tim hoặc thông tin cá nhân thật của thành viên.

---

## 4. Lưu ý từng bài tập

### 4.1. Bài tuần 5: mô hình hoá yêu cầu

**Vì sao hai phân hệ khác nhau:**

| Tiêu chí | Phân hệ smartwatch (đồng hồ) | Phân hệ smartphone (điện thoại) |
|---|---|---|
| Vai trò | Ghi nhận hoạt động khi đang tập | Phân tích, thống kê, lập lịch, đặt mục tiêu, chia sẻ |
| Cách kích hoạt | Cảm biến tự nhận biết hoạt động; người dùng ra lệnh kết thúc | Người dùng thao tác; nhắc nhở do thời gian kích hoạt |
| Dữ liệu | Tạm thời lưu trên đồng hồ | Lưu lâu dài, hiển thị bản đồ và biểu đồ |
| Kết nối | Gửi dữ liệu qua Bluetooth khi đã ghép đôi | Nhận dữ liệu đồng bộ từ đồng hồ |
| Hệ thống ngoài | Không có | Dịch vụ bản đồ, mạng xã hội |

Hệ quả khi làm bài:
- Mỗi use case đặt đúng một hộp phân hệ. Use case xuyên hai phân hệ (như đồng bộ) phải giải thích vì sao đặt ở hộp đó.
- Đồng hồ và điện thoại là **hai hộp**, không phải actor. "Người dùng" là một actor.
- Activity diagram có swimlane theo phân hệ khi use case có cả hai phân hệ tham gia.
- State chart của "Hoạt động thể chất" chủ yếu nằm ở phân hệ smartwatch, nhưng các trạng thái đồng bộ liên quan đến phân hệ smartphone.

**Điểm đề chưa rõ, ghi vào bảng giả định:**
- Đồng bộ gửi những gì: lộ trình GPS, nhịp tim theo thời gian, số liệu từng km?
- Calo tính theo công thức nào, có cần cân nặng, tuổi không?
- Độ cao lấy từ đâu, vì đề không nêu cảm biến độ cao?
- Bơi lội: GPS thường không hoạt động dưới nước, quãng đường tính thế nào?
- Mất tín hiệu GPS hoặc đứt Bluetooth giữa chừng thì xử lý ra sao?
- Đạt mục tiêu khi nào (đúng bằng mục tiêu có tính là đạt không)? Đánh giá lúc nào?
- Nhắc nhở khi điện thoại tắt hoặc bỏ qua một lần nhắc thì sao?
- Dữ liệu lưu tạm trên đồng hồ được xoá khi nào?
- "Tức thời" trong đề phải đổi thành ngưỡng cụ thể và ghi mã GĐ.

**Quy tắc dễ sai:**
- Không chọn "Chia sẻ kết quả" hoặc "Xem danh sách hoạt động" làm use case đặc tả.
- Hai use case đặc tả phải khác mục tiêu và khác cách kích hoạt, không cùng hộp.
- Use case do thời gian kích hoạt (nhắc nhở) thì ghi rõ bên kích hoạt là thời gian, không có actor người tại thời điểm đó.
- Đặc tả phải có ít nhất 2 luồng thay thế và 1 luồng ngoại lệ, và đủ 14 mục, không viết thành đoạn văn.
- Sơ đồ dùng ký pháp UML (Unified Modeling Language, ngôn ngữ mô hình hoá thống nhất) như bài giảng, chữ trong SVG là văn bản.

### 4.2. Bài tuần 6: công cụ phác thảo prototype bằng AI

**Đếm thành phần:**
- Bài 1 (sức khoẻ): 24 thành phần, gồm 8 của smartwatch (SK-01 đến SK-08) và 16 của smartphone (SK-09 đến SK-24). Đếm và báo cáo tách riêng theo phân hệ.
- Bài 2 (đấu giá): 22 thành phần (DG-01 đến DG-22).
- Chỉ đếm thành phần nhìn thấy được trong prototype, không đếm lời giải thích của công cụ.
- Trước khi chạy, chốt tiêu chí cho các mục mơ hồ: SK-11 (tuần, tháng, năm: cần đủ ba?), SK-17 (tốc độ hoặc nhịp tim: đủ một trong hai?).

**Giới hạn:**
- Lượt đầu của mỗi bài: dán nguyên văn prompt chuẩn, chỉ thêm danh sách màn hình của nhóm ở cuối.
- Phần thành phần: tối đa 10 lượt prompt cho mỗi bài, tính cả lượt đầu.
- Mỗi yêu cầu chỉnh sửa: tối đa 3 lượt.

**Điểm cần chú ý ở bài 1 (hai phân hệ):**
- Công cụ có thể gộp hai phân hệ thành một ứng dụng điện thoại, khiến màn hình đồng hồ thiếu. Ghi lại đây là kết quả đo được.
- Màn hình smartwatch phải có khổ đồng hồ. Kiểm tra lại đầu ra.
- CS-2 (đổi giao diện): mẫu số là tổng số màn hình của **cả hai phân hệ**.
- CS-3 (nối màn hình): theo prompt, bài 1 có khoảng 5 chuyển (1 trên đồng hồ, 4 trên điện thoại). Không đưa chuyển giữa hai thiết bị vào danh sách vì prompt không yêu cầu.

**Điểm cần chú ý ở bài 2 (đấu giá):**
- Phí đăng (DG-09): 10.000 đồng + 5.000 đồng mỗi ngày gia hạn + 10.000 đồng nếu có giá tối thiểu. Prompt không giới hạn số ngày gia hạn.
- Phí giao nhận (DG-17): prompt không có công thức, công cụ thường tự đưa ra con số. Ghi là thành phần sai hoặc chưa kiểm chứng.
- Bước giá 5.000 đồng (DG-18) và trường hợp giá kết thúc thấp hơn giá tối thiểu (DG-21): kiểm tra công cụ có tính phí sai không.

**Báo cáo:**
- Mỗi nhận định ghi nhãn: "Đã chạy", "Theo tài liệu" hoặc "Chưa kiểm chứng".
- Chỉ ghi "xuất được PPTX" là "Đã chạy" khi nhóm đã xuất và mở được tệp.
- Báo cáo 8 phút gồm 5 phần: công cụ (1 phút), quy trình (1,5 phút), kết quả (2,5 phút), minh hoạ (1,5 phút), giới hạn và khuyến nghị (1,5 phút). Cộng 2 phút hỏi đáp.

---

## 5. Danh sách kiểm tra trước khi nộp

**Tuần 5**
- [ ] Sơ đồ use case có 2 hộp, include và extend đúng chiều.
- [ ] Mỗi use case đặc tả có đủ 14 mục, ít nhất 2 luồng thay thế, 1 luồng ngoại lệ.
- [ ] Bảng giả định có ít nhất 5 mục, có mục về giao tiếp giữa hai thiết bị.
- [ ] Activity diagram và state chart khớp với đặc tả.
- [ ] Danh sách kiểm tra nhất quán đã đánh dấu.

**Tuần 6**
- [ ] Lượt đầu mỗi bài trùng nguyên văn prompt chuẩn.
- [ ] Không quá 10 lượt thành phần cho mỗi bài; không quá 3 lượt cho mỗi yêu cầu chỉnh sửa.
- [ ] Có ảnh chụp cho thành phần thừa và sai.
- [ ] Mỗi nhận định trong slide có nhãn.
- [ ] Ghi gói dùng, ngày thử và mô hình.
- [ ] Video dự phòng mở được.

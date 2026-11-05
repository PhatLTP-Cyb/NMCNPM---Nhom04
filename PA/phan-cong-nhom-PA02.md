# Phân chia công việc nhóm 04: PA02 – Phân tích yêu cầu VeriCite

**Bài liên quan:** PA02 – Tài liệu phân tích yêu cầu (theo biểu mẫu *Template1-PhanTich-2019*), phát triển từ Project Proposal VeriCite (PA01)
**Hạn nộp:** ghi theo thông báo của giảng viên (điền: __/__/2026)

---

## 1. Tổng quan phân công

| Thành viên | Vai trò | Mục trong PA02 | Phạm vi chính |
|---|---|---|---|
| **Lâm Duy Minh** | Mô hình hoá use case | Mục 4 | Sơ đồ use case tổng thể; đặc tả 7 use case của luồng tài khoản và kiểm tra (U001–U005, U008, U009) |
| **Tạ Quang Mạnh** | Đặc tả use case kết quả, phản hồi, quản trị; rà prototype | Mục 4 (8 UC), rà mục 5 | Đặc tả U006, U007, U010–U015; đối chiếu prototype với đặc tả |
| **Vương Hữu Khang** | Mô tả bài toán và yêu cầu | Mục 2, 3 | Mô tả bài toán, stakeholder, context diagram, FR, NFR, quy định, biểu mẫu |
| **Lê Tấn Phát** | Prototype; tổng hợp, kiểm tra cuối | Mục 1, 5, toàn bộ | Wireframe khoảng 11 màn hình; bảng đánh giá thành viên; duyệt danh sách use case; ghép file; kiểm tra nhất quán trước khi nộp |

**Cách hiểu phân công:** PA02 có một bộ sản phẩm chung gồm một danh sách 15 use case, một sơ đồ use case, 15 bảng đặc tả, danh sách yêu cầu và bộ wireframe. Danh sách use case do Minh chốt là **gốc chung**: Phát vẽ màn hình, Mạnh và Minh viết đặc tả, Khang phân nhóm yêu cầu dựa trên danh sách này. Phát làm prototype và kiểm tra cuối; vì vậy prototype do Mạnh rà soát, không tự kiểm.

---

## 2. Bảng phân công chi tiết

### 2.1. Danh sách use case thống nhất

| ID | Use case | Tác nhân | Yêu cầu, scenario gốc | Người đặc tả |
|---|---|---|---|---|
| U001 | Đăng ký tài khoản | Khách | FR-01, QĐ9 | Minh |
| U002 | Đăng nhập / đăng xuất | Mọi vai đã đăng ký | FR-01, QĐ9 | Minh |
| U003 | Dùng thử kiểm tra | Khách | FR-02, QĐ1, SC-05 | Minh |
| U004 | Kiểm tra nội dung | Sinh viên, Giảng viên | FR-03…FR-10, QĐ2, QĐ4–QĐ7, SC-01 | Minh |
| U005 | Tải tài liệu nguồn (`<<extend>>` U004) | Sinh viên, Giảng viên | FR-03, FR-07, QĐ6, SC-02 | Minh |
| U006 | Xem báo cáo kết quả | Sinh viên, Giảng viên | FR-09, QĐ4, QĐ7 | Mạnh |
| U007 | Xuất báo cáo PDF (`<<extend>>` U006) | Sinh viên, Giảng viên | FR-11, QĐ7 | Mạnh |
| U008 | Xem / xoá lịch sử kiểm tra | Sinh viên, Giảng viên | FR-12, QĐ8 | Minh |
| U009 | Kiểm tra hàng loạt | Giảng viên | FR-13, QĐ3, SC-03 | Minh |
| U010 | Báo lỗi kết quả | Sinh viên, Giảng viên | FR-14, SC-04 | Mạnh |
| U011 | Duyệt báo lỗi | Moderator | FR-15, QĐ10, SC-04 | Mạnh |
| U012 | Quản lý kho trích dẫn ma và danh sách trích dẫn thật | Moderator | FR-15, QĐ10 | Mạnh |
| U013 | Quản lý người dùng và phân vai | Quản trị viên | FR-16 | Mạnh |
| U014 | Quản lý hạn mức | Quản trị viên | FR-16, QĐ1–QĐ3 | Mạnh |
| U015 | Xem thống kê lượt kiểm tra và chi phí API | Quản trị viên | FR-17 | Mạnh |

*Lưu ý: danh sách trên là bản đề xuất. Minh chốt lại vào ngày 1; mọi thay đổi sau đó phải báo Phát và cập nhật bảng này.*

### 2.2. Mục 4: sơ đồ và đặc tả use case (Lâm Duy Minh)

| Hạng mục | Người chính | Người hỗ trợ | Đầu ra | Hạn / Đã xong |
|---|---|---|---|---|
| Chốt danh sách actor và 15 use case | Lâm Duy Minh | Lê Tấn Phát (duyệt) | Bảng 2.1 đã chốt, gửi nhóm | Đã xong (04/11/2026) |
| Sơ đồ use case tổng thể | Lâm Duy Minh | Vương Hữu Khang (rà soát) | Ảnh PNG độ phân giải cao và tệp gốc (StarUML hoặc draw.io) | Đã xong (04/11/2026) |
| Đặc tả U001, U002, U003 | Lâm Duy Minh | — | 3 bảng đặc tả theo mẫu | Đã xong (04/11/2026) |
| Đặc tả U004 Kiểm tra nội dung (UC lớn nhất) | Lâm Duy Minh | Vương Hữu Khang | Bảng đặc tả từ SC-01 | Đã xong (04/11/2026) |
| Đặc tả U005, U008, U009 | Lâm Duy Minh | — | 3 bảng đặc tả, U005 từ SC-02, U009 từ SC-03 | Đã xong (04/11/2026) |

### 2.3. Đặc tả use case kết quả, phản hồi, quản trị (Tạ Quang Mạnh)

| Hạng mục | Người chính | Người hỗ trợ | Đầu ra | Hạn / Đã xong |
|---|---|---|---|---|
| Đặc tả U006 Xem báo cáo kết quả, U007 Xuất báo cáo PDF | Tạ Quang Mạnh | Lâm Duy Minh (đối chiếu U004) | 2 bảng đặc tả theo mẫu | ____ |
| Đặc tả U010 Báo lỗi, U011 Duyệt báo lỗi | Tạ Quang Mạnh | — | 2 bảng đặc tả từ SC-04 | ____ |
| Đặc tả U012–U015 (kho trích dẫn, người dùng, hạn mức, thống kê) | Tạ Quang Mạnh | Vương Hữu Khang (đối chiếu FR-15–FR-17) | 4 bảng đặc tả theo mẫu | ____ |
| Rà soát prototype với đặc tả U001–U015 | Tạ Quang Mạnh | Lâm Duy Minh | Danh sách góp ý gửi Phát | ____ |

### 2.4. Mục 2, 3: mô tả bài toán và yêu cầu (Vương Hữu Khang)

| Hạng mục | Người chính | Người hỗ trợ | Đầu ra | Hạn / Đã xong |
|---|---|---|---|---|
| Mục 2 – Mô tả bài toán (tối đa 2 trang) | Vương Hữu Khang | Lê Tấn Phát | Văn bản rút gọn từ mục 2.1–2.5 của proposal | Đã xong (02/11/2026) |
| Mục 3.1 – Bảng stakeholder và context diagram | Vương Hữu Khang | — | Bảng STT / Stakeholder / Mô tả; sơ đồ ngữ cảnh | Đã xong (02/11/2026) |
| Mục 3.2.1 – Yêu cầu chức năng chia 5 nhóm, bảng QĐ1–QĐ10 | Vương Hữu Khang | Lâm Duy Minh | Danh sách FR-01–FR-17 có đánh số, phân nhóm | Đã xong (02/11/2026) |
| Biểu mẫu BM1 (form nhập kiểm tra), BM2 (báo cáo kết quả), nếu kịp | Vương Hữu Khang | Lê Tấn Phát (khớp với wireframe) | 2 biểu mẫu | Đã xong (02/11/2026) |
| Mục 3.2.2 – Yêu cầu phi chức năng | Vương Hữu Khang | — | NFR-01–NFR-11, giữ tiêu chí đo | Đã xong (02/11/2026) |
| Sơ đồ trạng thái (State Charts) Lượt kiểm tra, Báo lỗi, Tài khoản, Trích dẫn trong kho | Vương Hữu Khang | — | 4 sơ đồ .drawio, 4 ảnh .png kèm 4 bảng chuyển trạng thái (PA02_Nhom04_StateCharts_Khang.md) | Đã xong (05/11/2026) |

### 2.5. Mục 5 prototype, tổng hợp và kiểm tra cuối (Lê Tấn Phát)

| Hạng mục | Người chính | Người hỗ trợ | Đầu ra | Hạn / Đã xong |
|---|---|---|---|---|
| Duyệt danh sách use case của Minh | Lê Tấn Phát | — | Bảng 2.1 đã duyệt | ____ |
| Màn **Báo cáo kết quả** (ưu tiên số 1) | Lê Tấn Phát | Tạ Quang Mạnh (đối chiếu U006) | Wireframe và chú thích | ____ |
| Màn Kiểm tra mới (có thông báo gửi văn bản tới LLM) và màn tiến độ | Lê Tấn Phát | Lâm Duy Minh (đối chiếu U004, U005) | Wireframe và chú thích | ____ |
| Trang chủ / dùng thử; đăng nhập, đăng ký | Lê Tấn Phát | — | Wireframe và chú thích | ____ |
| Lịch sử; kiểm tra hàng loạt và bảng tổng hợp | Lê Tấn Phát | — | Wireframe và chú thích | ____ |
| Hộp thoại báo lỗi; hàng chờ moderator | Lê Tấn Phát | Tạ Quang Mạnh (đối chiếu U010, U011) | Wireframe và chú thích | ____ |
| Quản trị người dùng và hạn mức; thống kê | Lê Tấn Phát | Tạ Quang Mạnh (đối chiếu U013–U015) | Wireframe và chú thích | ____ |
| Mục 1 – Bảng đánh giá thành viên | Lê Tấn Phát | Cả nhóm (ký) | Bảng có % đóng góp và chữ ký | ____ |
| Góp ý bản nháp 1 | Lê Tấn Phát | — | Nhận xét cho từng người | ____ |
| Ghép file, mục lục, đánh số bảng và hình | Lê Tấn Phát | Cả nhóm | File PA02 hoàn chỉnh | ____ |
| Kiểm tra nhất quán theo Mục 5 | Lê Tấn Phát | Cả nhóm | Checklist đã đánh dấu | ____ |
| Xuất PDF và nộp | Lê Tấn Phát | — | `PA02_Nhom04_PhanTichYeuCau.pdf` | ____ |

### 2.6. Thứ tự và phụ thuộc

| Mốc | Việc |
|---|---|
| **Ngày 1** | Minh gửi danh sách 15 use case và bản nháp sơ đồ → Phát duyệt. Khang bắt đầu mục 2 (không phụ thuộc). |
| **Ngày 3** | Bản nháp 1 của mỗi người. Phát có ít nhất màn Báo cáo kết quả và Kiểm tra mới. |
| **Ngày 4** | Phát góp ý đặc tả và yêu cầu; Mạnh góp ý prototype. Rà chéo: Minh ↔ Mạnh (U004 với U006), Khang ↔ Minh (FR với use case). |
| **Ngày 5** | Nộp bản hoàn chỉnh cho Phát ghép; Phát sửa prototype theo góp ý của Mạnh. |
| **Ngày 6** | Phát kiểm tra cuối, xuất PDF. |

1. **Ngay từ đầu:** Khang làm mục 2 và 3.1 trước, vì hai phần này không phụ thuộc danh sách use case.
2. **Sau khi chốt use case:** Phát vẽ màn hình, Minh và Mạnh viết đặc tả, Khang phân nhóm FR.
3. **Giao nhau:** khi đặc tả phát sinh bước hoặc thông báo mới trên giao diện, người viết đặc tả báo Phát để thêm vào wireframe, và ngược lại.
4. **Trước khi nộp:** cả nhóm đọc lại danh sách kiểm tra ở Mục 5.

*Ngày 1–6 là ngày tương đối; đổi sang ngày thật khi biết hạn nộp.*

---

## 3. Quy tắc làm việc chung

- Viết đúng bảng mẫu trong *Template1-PhanTich-2019.pdf*, không đổi tên cột, không đổi thứ tự mục.
- Mỗi thành viên ghi công việc đã xong vào cột "Hạn / Đã xong" của bảng trên, kèm ngày.
- Tệp làm chung đặt trong thư mục NMCNPM, tên theo mẫu `PA02_Nhom04_<nội dung>` (ví dụ `PA02_Nhom04_UseCase.png`, `PA02_Nhom04_DacTaUC_Minh.docx`).
- Mã dùng chung: U001–U015, FR-01–FR-17, NFR-01–NFR-11, QĐ1–QĐ10, STK-01–STK-08. **Không tự thêm hay đổi mã**; cần thêm thì báo Phát.
- Thuật ngữ theo Bảng A.2 của proposal: *trích dẫn, câu trích, nhận định, mục, trích dẫn ma, kho trích dẫn ma, danh sách trích dẫn thật đã xác nhận*. Ba nhãn viết nghiêng, đúng chữ: *Đã xác minh*, *Chưa xác minh được*, *Mâu thuẫn với nguồn*.
- PA02 là tài liệu độc lập: không viết "xem Phụ lục A", "xem Bảng 6 của proposal".
- Dữ liệu mẫu trong wireframe tự đặt (trích dẫn, tên người dùng), không dùng thông tin cá nhân thật.

---

## 4. Lưu ý từng phần

### 4.1. Mục 2 – Mô tả bài toán

- Giới hạn **1–2 trang** theo template. Bối cảnh rút còn một đoạn; bỏ Bảng 3 (số liệu ảo giác) và Bảng 4 (giải pháp hiện có).
- Giữ: phát biểu bài toán và 6 nghiệp vụ chính (mục 2.3), môi trường hoạt động (2.4), bảng ràng buộc thiết kế và triển khai (2.5).
- Nêu rõ nguyên tắc "LLM chỉ tách thông tin, nguồn tất định mới xác minh", vì đây là điểm khác biệt của hệ thống.

### 4.2. Mục 3 – Tổng quan yêu cầu

- Stakeholder lấy từ Bảng A.4 (STK-01–STK-08). Context diagram: VeriCite ở giữa; xung quanh là Khách, Sinh viên, Giảng viên, Moderator, Quản trị viên, CSDL học thuật (CrossRef, Semantic Scholar, OpenAlex), Nhà cung cấp LLM; mũi tên ghi luồng dữ liệu.
- FR chia 5 nhóm:

| Nhóm | Yêu cầu |
|---|---|
| Tài khoản | FR-01, FR-02 |
| Kiểm tra | FR-03 – FR-10 |
| Kết quả | FR-11, FR-12, FR-13 |
| Phản hồi và kiểm duyệt | FR-14, FR-15 |
| Quản trị | FR-16, FR-17 |

- Mỗi FR viết bằng ngôn ngữ tự nhiên, giữ độ ưu tiên MoSCoW; quy định viết thành bảng QĐ riêng và dẫn chiếu từ FR.
- NFR giữ nguyên tiêu chí đo (ví dụ 20 trích dẫn ≤ 30 giây, phát hiện ≥ 90% trích dẫn bịa, báo nhầm ≤ 5%).

### 4.3. Mục 4 – Sơ đồ và đặc tả use case

**Sơ đồ:**
- 5 tác nhân người dùng: Khách, Sinh viên, Giảng viên, Moderator, Quản trị viên. Sinh viên và Giảng viên kế thừa (generalization) từ "Người dùng đã đăng ký".
- 2 tác nhân hệ thống ngoài: CSDL học thuật, Nhà cung cấp LLM, nối vào U004 (và U003, U009).
- `<<include>>` và `<<extend>>` đúng chiều: U005 extend U004, U007 extend U006.

**Đặc tả – bảng mẫu gồm 9 mục:** Use case ID, Tên Use Case, Tóm tắt, Tác nhân, Điều kiện tiên quyết, Kết quả, Kịch bản chính, Kịch bản phụ, Ràng buộc phi chức năng.

**Chuyển từ scenario của proposal:**

| Scenario | Use case | Ghi chú |
|---|---|---|
| SC-01 | U004 | Sửa thứ tự luồng thay thế 5d/5e |
| SC-02 | U005 | Ngưỡng khớp theo QĐ6; chế độ nghiêm ngặt 95% |
| SC-03 | U009 | Tối đa 30 tệp (QĐ3) |
| SC-04 | U010, U011 | Tách phần sinh viên báo lỗi và phần moderator duyệt (Mạnh) |
| SC-05 | U003 | 3 lượt/ngày, 5 trích dẫn/lượt (QĐ1) |

"Hậu điều kiện" → mục **Kết quả**; "Yêu cầu liên quan" (NFR) → mục **Ràng buộc phi chức năng**.

**Quy tắc dễ sai:**
- Tách thông tin, tra cứu trích dẫn (Lớp 1), so khớp (Lớp 2), gợi ý nguồn (Lớp 3) là **các bước trong kịch bản chính của U004**, không phải use case riêng.
- Tên use case là cụm động từ theo góc nhìn tác nhân.
- Kịch bản chính đánh số, xen kẽ hành động của tác nhân và phản hồi của hệ thống; bỏ tham chiếu FR trong ngoặc giữa bước.
- Mỗi kịch bản phụ ghi rõ rẽ nhánh từ bước nào (ví dụ "4a"), quay lại bước nào hoặc kết thúc.
- U004 phải có luồng phụ cho: vượt giới hạn QĐ2 / hết hạn mức; LLM lỗi (không trừ hạn mức); không tìm thấy trích dẫn; sai trường; trùng kho trích dẫn ma; trùng danh sách trích dẫn thật; CSDL ngoài không phản hồi.

### 4.4. Mục 5 – Prototype

- Màn **Báo cáo kết quả** phải thể hiện: nhãn 3 màu, mã lý do, trường sai kèm giá trị đúng, liên kết nguồn, tô sáng từ khác biệt khi khớp một phần, nút "Báo kết quả sai", nút xuất PDF. Không có mục nào bị ẩn ở bất kỳ chế độ nào (QĐ7).
- Màn Kiểm tra mới phải có: ô dán văn bản / tải tệp, ô tải tài liệu nguồn, chọn chế độ rủi ro, thông báo văn bản sẽ được gửi tới dịch vụ LLM, thông báo giới hạn (QĐ2).
- Mỗi màn hình có chú thích 1–2 dòng: dùng cho use case nào, tác nhân nào.
- Công cụ: Figma, Balsamiq hoặc Pencil. Xuất ảnh PNG để chèn vào tài liệu.

---

## 5. Danh sách kiểm tra trước khi nộp

**Hình thức**
- [ ] Đủ 5 mục theo template, đúng thứ tự, không thừa mục ngoài mẫu.
- [ ] Mục lục, số bảng và số hình đúng.
- [ ] Bảng đánh giá thành viên có đủ % đóng góp và chữ ký.
- [ ] Không còn tham chiếu sang proposal.

**Mục 2, 3**
- [ ] Mục 2 không quá 2 trang, có môi trường hoạt động và ràng buộc thiết kế, triển khai.
- [ ] Có bảng stakeholder hoặc context diagram.
- [ ] FR đánh số và chia nhóm; ngưỡng QĐ1–QĐ10 giống nhau ở mọi chỗ.
- [ ] NFR có tiêu chí đo.

**Mục 4**
- [ ] Mỗi FR ứng với ít nhất một use case.
- [ ] Không có use case kiểu "Tách thông tin", "So khớp".
- [ ] Tên use case khớp ở sơ đồ, bảng đặc tả và chú thích prototype.
- [ ] Include và extend đúng chiều.
- [ ] Đủ 15 bảng đặc tả, mỗi bảng đủ 9 mục; kịch bản phụ ghi rõ bước rẽ nhánh.
- [ ] Mục "Ràng buộc phi chức năng" dẫn đúng NFR.

**Mục 5**
- [ ] Mỗi use case có ít nhất một màn hình prototype.
- [ ] Màn Báo cáo kết quả có đủ các thành phần ở mục 4.4.
- [ ] Mỗi màn hình có chú thích use case và tác nhân.

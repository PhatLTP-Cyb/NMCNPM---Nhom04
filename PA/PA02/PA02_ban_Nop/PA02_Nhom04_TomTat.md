# VeriCite – Phân tích yêu cầu (PA02, Nhóm 04)

> Bản tóm tắt để trình bày. Nội dung đầy đủ nằm trong báo cáo `PA02_Nhom04_PhanTichYeuCau.docx`.

**Đề tài:** Hệ thống phát hiện và kiểm chứng ảo giác AI trong nội dung học thuật  
**Học phần:** Nhập môn Công nghệ phần mềm, lớp 24_3 · **GVHD:** ThS. Ngô Ngọc Đăng Khoa  
**Thành viên:** Lê Tấn Phát (24120115), Lâm Duy Minh (24120091), Tạ Quang Mạnh (24120089), Vương Hữu Khang (24120070)

| Stakeholder | Quy định | Yêu cầu chức năng | Yêu cầu phi chức năng | Use case | Màn hình |
|---|---|---|---|---|---|
| 8 | 10 | 18 | 11 | 18 | 21 |

## 1. Bài toán

**Vấn đề: ảo giác trích dẫn (citation hallucination)**

- LLM bịa tài liệu tham khảo: tác giả có thật nhưng bài báo không tồn tại, DOI giả hoặc trỏ sai bài.
- Sai năm, sai tạp chí, sửa câu trích nguyên văn làm lệch nghĩa.
- Công cụ hiện có dùng LLM kiểm tra LLM, chỉ cho điểm tổng mơ hồ, không tích lũy được trích dẫn ma đã phát hiện.

**Nguyên tắc của VeriCite:** LLM chỉ bóc tách thông tin từ văn bản; việc xác minh dựa trên nguồn tất định (CSDL học thuật mở và tài liệu gốc người dùng tải lên), nên kết quả tái lập được.

| Nhãn | Ý nghĩa |
|---|---|
| 🟢 **Đã xác minh** | Trích dẫn có thật và khớp bản ghi gốc, hoặc câu trích khớp tài liệu nguồn. |
| 🟡 **Chưa xác minh được** | Không tìm thấy trên CSDL mở hoặc nhận định chưa có nguồn. Không bao giờ quy là bịa khi chưa có căn cứ. |
| 🔴 **Mâu thuẫn với nguồn** | Sai trường (năm, tác giả, tạp chí), DOI sai bài, câu trích bị sửa, hoặc trùng kho trích dẫn ma. |

**Mục tiêu** (bộ kiểm thử 120 trích dẫn): **≥ 90%** trích dẫn bịa bị phát hiện; **≤ 5%** trích dẫn thật bị báo nhầm; **≤ 30 giây** cho một lượt 20 trích dẫn.

## 2. Quy trình kiểm chứng 3 lớp

**Đầu vào** → **Bóc tách** → **Lớp 1 · Trích dẫn** → **Lớp 2 · Câu trích** → **Lớp 3 · Nhận định** → **Báo cáo**

1. **Đầu vào:** Văn bản AI, danh mục tham khảo hoặc tệp PDF/DOCX/TXT, kèm tài liệu nguồn nếu có.
2. **Bóc tách:** LLM tách trích dẫn, câu trích, nhận định. Đây là bước duy nhất dùng LLM.
3. **Lớp 1 · Trích dẫn:** Tra CrossRef, Semantic Scholar, OpenAlex; đối chiếu từng trường; so với kho trích dẫn ma.
4. **Lớp 2 · Câu trích:** So khớp câu trích với tài liệu nguồn, chỉ ra trang và đoạn, tô sáng chỗ sai.
5. **Lớp 3 · Nhận định:** Đánh dấu nhận định thiếu nguồn, gợi ý tối đa 5 tài liệu liên quan.
6. **Báo cáo:** Tô 3 màu trên văn bản gốc, mã lý do, liên kết nguồn, xuất PDF.

## 3. Tác nhân và sơ đồ ngữ cảnh

| Tác nhân | Vai trò |
|---|---|
| Khách | Dùng thử có giới hạn |
| Sinh viên | Kiểm tra bài viết cá nhân |
| Giảng viên | Kiểm tra hàng loạt bài nộp |
| Moderator | Duyệt báo lỗi, quản lý kho trích dẫn |
| Quản trị viên | Người dùng, hạn mức, chi phí API |
| CSDL học thuật | CrossRef, Semantic Scholar, OpenAlex |
| Nhà cung cấp LLM | Chỉ phục vụ bước bóc tách |

![Sơ đồ ngữ cảnh](media/context.png)

## 4. Quy định nghiệp vụ

| Mã | Quy định | Nội dung |
|---|---|---|
| QĐ1 | Dùng thử | Khách tối đa 3 lượt/ngày, 5 trích dẫn/lượt, chỉ dán văn bản. |
| QĐ2 | Đầu vào | ≤ 10.000 từ, ≤ 50 trích dẫn; tệp PDF/DOCX/TXT ≤ 10 MB. |
| QĐ3 | Hàng loạt | Giảng viên ≤ 30 tệp/đợt, xử lý nền, lỗi một tệp không ảnh hưởng tệp khác. |
| QĐ4 | Gán nhãn | Mỗi mục đúng một trong ba nhãn, luôn kèm mã lý do. |
| QĐ5 | Gợi ý Lớp 3 | Nhận định thiếu nguồn: gợi ý ≤ 5 tài liệu, không dùng LLM phán xét. |
| QĐ6 | Ngưỡng so khớp | ≥ 90% là Đã xác minh; 70–90% hoặc không thấy là Mâu thuẫn; tô sáng chỗ sai. |
| QĐ7 | Chế độ rủi ro | Thông thường hoặc Học thuật nghiêm ngặt (ngưỡng 95%); không được ẩn mục lỗi. |
| QĐ8 | Lưu trữ | Tệp tải lên tự xóa sau 30 ngày hoặc khi người dùng xóa lượt. |
| QĐ9 | Tài khoản | Mật khẩu ≥ 8 ký tự, chặn mật khẩu yếu; khóa 15 phút sau 5 lần sai. |
| QĐ10 | Kiểm duyệt | Báo lỗi vào hàng chờ; chỉ moderator duyệt mới cập nhật kho trích dẫn. |

## 5. Yêu cầu chức năng (18 FR)

| Nhóm | Mã | Yêu cầu | MoSCoW |
|---|---|---|---|
| Quản lý tài khoản | FR-01 | Đăng ký, đăng nhập, phân quyền theo vai | Must |
|  | FR-02 | Kiểm tra dùng thử cho khách | Should |
|  | FR-18 | Vòng đời tài khoản: kích hoạt, đặt lại mật khẩu, xóa | Should |
| Kiểm tra nội dung | FR-03 | Nhập dữ liệu và tải tài liệu nguồn | Must |
|  | FR-04 | Bóc tách trích dẫn, câu trích, nhận định | Must |
|  | FR-05 | Xác minh sự tồn tại trích dẫn (Lớp 1) | Must |
|  | FR-06 | Đối chiếu chi tiết các trường (Lớp 1) | Must |
|  | FR-07 | So khớp câu trích với nguồn (Lớp 2) | Must |
|  | FR-08 | Nhận định thiếu nguồn, gợi ý tài liệu (Lớp 3) | Should |
|  | FR-09 | Gán nhãn và tổng hợp báo cáo | Must |
|  | FR-10 | Chế độ rủi ro kiểm tra | Should |
| Kết quả và lịch sử | FR-11 | Xuất báo cáo PDF | Must |
|  | FR-12 | Lịch sử kiểm tra cá nhân | Must |
|  | FR-13 | Kiểm tra hàng loạt cho giảng viên | Should |
| Phản hồi và kiểm duyệt | FR-14 | Báo lỗi kết quả kiểm tra | Should |
|  | FR-15 | Duyệt báo lỗi, quản lý kho trích dẫn | Should |
| Quản trị hệ thống | FR-16 | Quản lý người dùng và hạn mức | Should |
|  | FR-17 | Thống kê lượt kiểm tra, chi phí API | Could |

## 6. Yêu cầu phi chức năng (11 NFR)

| Mã | Yêu cầu | Chỉ tiêu |
|---|---|---|
| NFR-01 | Thời gian xử lý | 20 trích dẫn ≤ 30 giây (95% lượt) |
| NFR-02 | Độ chính xác | Phát hiện ≥ 90% bịa, báo nhầm ≤ 5% |
| NFR-03 | Chịu tải | 30 người dùng đồng thời, phản hồi ≤ 3 giây |
| NFR-04 | Bảo mật | 100% HTTPS, mật khẩu được băm, khóa sau 5 lần sai |
| NFR-05 | Quyền riêng tư | Tự xóa tệp sau 30 ngày, chặn truy cập chéo |
| NFR-06 | Minh bạch | 100% mục có lý do tiếng Việt và liên kết nguồn |
| NFR-07 | Tái lập | Lớp 1–3 không gọi LLM, cùng đầu vào cho cùng kết quả |
| NFR-08 | Chịu lỗi | CSDL ngoài lỗi thì gán Chưa xác minh được, không quy là bịa |
| NFR-09 | Dễ dùng | Tiếng Việt, từ 360 px, 8/10 người mới tự làm được trong 5 phút |
| NFR-10 | Chi phí | Lưu đệm tra cứu, chỉ bóc tách gọi LLM, ≤ 10 USD |
| NFR-11 | Sao lưu | Hằng ngày, giữ 7 bản, mất dữ liệu tối đa 24 giờ |

## 7. Use case (18 UC)

![Sơ đồ use case](media/usecase.png)

| Tác nhân | Use case |
|---|---|
| Khách | U001 Đăng ký tài khoản<br>U003 Dùng thử kiểm tra<br>U016 Kích hoạt tài khoản qua email |
| Người dùng đã đăng ký | U002 Đăng nhập / đăng xuất<br>U017 Đặt lại mật khẩu<br>U018 Xóa tài khoản |
| Sinh viên, Giảng viên | U004 Kiểm tra nội dung<br>U005 Tải tài liệu nguồn «extend» U004<br>U006 Xem báo cáo kết quả<br>U007 Xuất báo cáo PDF «extend» U006<br>U008 Xem / xóa lịch sử kiểm tra<br>U010 Báo lỗi kết quả |
| Giảng viên | U009 Kiểm tra hàng loạt |
| Moderator | U011 Duyệt báo lỗi<br>U012 Quản lý kho trích dẫn ma và trích dẫn thật |
| Quản trị viên | U013 Quản lý người dùng và phân vai<br>U014 Quản lý hạn mức<br>U015 Thống kê lượt kiểm tra, chi phí API |

## 8. Sơ đồ hoạt động

Mỗi use case có bảng đặc tả 9 mục và một sơ đồ hoạt động hai làn (tác nhân | hệ thống). Hai ví dụ:

![Sơ đồ hoạt động U016 – Kích hoạt tài khoản](media/ad_u016.png)

![Sơ đồ hoạt động U010 – Báo lỗi kết quả](media/ad_u010.png)

## 9. Sơ đồ trạng thái

**Lượt kiểm tra:** Khởi tạo → Chờ xử lý → Đang bóc tách → Đang kiểm chứng → Hoàn tất → Lưu trữ → Đã xóa; nhánh Lỗi xử lý (hoàn hạn mức).

![Lượt kiểm tra](media/sc_luotkiemtra.png)

**Phiếu báo lỗi:** Khởi tạo → Chờ duyệt → Đang thẩm định → Đã chấp nhận / Đã từ chối → Đã đóng.

![Phiếu báo lỗi](media/sc_baoloi.png)

**Tài khoản người dùng:** Chưa kích hoạt → Đang hoạt động ⇄ Bị khóa tạm thời; Bị khóa vĩnh viễn; → Đã xóa (U016–U018).

![Tài khoản người dùng](media/sc_taikhoan.png)

**Bản ghi trích dẫn trong kho:** Mới phát hiện → Chưa xác minh → Xác minh thật / Xác nhận ma ⇄ Nghi ngờ → Đã gỡ bỏ.

![Bản ghi trích dẫn trong kho](media/sc_trichdan.png)

## 10. Prototype (21 màn hình)

Bản bấm được: <https://claude.ai/artifact/42JzbbDu8LMK5fiVpBMXfR>

| Vai | Màn hình |
|---|---|
| Khách | S01 Dùng thử · S02 Đăng ký · S19 Kích hoạt tài khoản |
| Sinh viên, Giảng viên | S03 Đăng nhập · S04 Kiểm tra mới · S05 Đang xử lý · S06 Báo cáo · S07 Báo kết quả sai · S08 Xem trước PDF · S09 Lịch sử · S10 Hàng loạt · S11 Báo cáo 360 px · S17 Từ chối quyền · S18 Chế độ nghiêm ngặt · S20 Đặt lại mật khẩu · S21 Xóa tài khoản |
| Moderator | S12 Hàng chờ duyệt · S13 Kho trích dẫn |
| Quản trị viên | S14 Người dùng và phân vai · S15 Hạn mức · S16 Thống kê |

**S01 – Trang chủ và Dùng thử** (Khách)

![S01](media/s01.png)

**S04 – Kiểm tra mới, tải tài liệu nguồn** (Sinh viên)

![S04](media/s04.png)

**S06 – Báo cáo kết quả 3 nhãn** (Sinh viên)

![S06](media/s06.png)

**S10 – Kiểm tra hàng loạt** (Giảng viên)

![S10](media/s10.png)

**S12 – Hàng chờ duyệt báo lỗi** (Moderator)

![S12](media/s12.png)

**S16 – Thống kê và chi phí API** (Quản trị viên)

![S16](media/s16.png)

## 11. Truy vết yêu cầu

| FR | Use case | Màn hình |
|---|---|---|
| FR-01 | U001, U002, U013 | S02, S03, S14, S17 |
| FR-02 | U003 | S01 |
| FR-03 | U004, U005 | S04 |
| FR-04 | U004 | S05 |
| FR-05 – FR-08 | U004 (U005) | S06 |
| FR-09 | U004, U006 | S06, S11 |
| FR-10 | U004, U006 | S04, S09, S18 |
| FR-11 | U007 | S08 |
| FR-12 | U008 | S09 |
| FR-13 | U009 | S10 |
| FR-14 | U010 | S07 |
| FR-15 | U011, U012 | S12, S13 |
| FR-16 | U013, U014 | S03, S14, S15 |
| FR-17 | U015 | S16 |
| FR-18 | U016, U017, U018 | S19, S20, S21 |

Mọi FR đều có use case và màn hình tương ứng; mọi use case U001–U018 có ít nhất một màn hình.

## 12. Phân công

| Thành viên | MSSV | Phụ trách |
|---|---|---|
| Lê Tấn Phát | 24120115 | Nhóm trưởng · Mục 1, 5 (prototype S01–S21) · bổ sung U016–U018 · vẽ lại sơ đồ hoạt động · ghép và rà soát |
| Lâm Duy Minh | 24120091 | Tác nhân, 15 use case ban đầu, sơ đồ use case · đặc tả và sơ đồ hoạt động U001–U005, U008, U009 |
| Tạ Quang Mạnh | 24120089 | Đặc tả U006, U007, U010–U015 · rà soát prototype theo đặc tả |
| Vương Hữu Khang | 24120070 | Mục 2, 3: bài toán, stakeholder, sơ đồ ngữ cảnh, QĐ, FR, NFR, biểu mẫu · bốn sơ đồ trạng thái |

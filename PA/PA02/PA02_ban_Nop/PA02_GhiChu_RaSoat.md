# PA02 – Ghi chú rà soát bản báo cáo tổng hợp

**Tệp chính:** `PA02_Nhom04_PhanTichYeuCau.docx` (141 trang, A4). `PA02_Nhom04_PhanTichYeuCau_xemthu.pdf` chỉ là bản xem thử: LibreOffice nén ảnh, nên bản nộp nên xuất PDF lại từ Word.

## Cấu trúc (theo Template#1-PhanTich-2019)
- Trang bìa, Mục lục, Các nội dung chính (gồm bảng quy ước mã).
- **1. Bảng đánh giá thành viên**: có bảng thành viên và bảng phân công.
- **2. Mô tả bài toán**: lấy từ bản của Khang, có thêm sơ đồ ngữ cảnh (context diagram).
- **3. Tổng quan yêu cầu**: gồm QĐ1–10, FR-01–17, BM1–2, NFR-01–11.
- **4. Đặc tả yêu cầu**:
  - 4.1 Sơ đồ use case, danh sách tác nhân và danh sách 15 UC.
  - 4.2 Mười lăm bảng đặc tả 9 dòng, U001–U015.
  - 4.3 Sơ đồ hoạt động (activity diagram) của cả 15 UC, đặt trên trang ngang.
  - 4.4 Bốn sơ đồ trạng thái (state chart), đặt trên trang ngang.
- **5. Prototype**: lấy từ `VeriCite-Bao-cao-thu-nghiem.docx`, gồm 18 màn hình S01–S18, mô tả và các bảng đối chiếu FR, kịch bản (scenario) và NFR.
- **Phụ lục A**: ma trận truy vết FR – UC – màn hình (phần tôi bổ sung).

## Những gì tôi đã sửa hoặc bổ sung
1. **Đồng bộ QĐ2.** Bản của Khang ghi 5.000 từ / 20 trang / 50 MB. Tôi sửa thành **10.000 từ, 50 trích dẫn, PDF/DOCX/TXT ≤ 10 MB** cho khớp PA01 và prototype. Các chỗ đã sửa: QĐ2, FR-03, BM1 và phần mô tả state chart.
2. **FR-14**: tôi thống nhất loại lỗi báo cáo thành Nhãn sai / Nguồn đối chiếu sai / Khác, khớp màn hình S07.
3. **Sơ đồ use case**: tệp PNG export cũ bị mất tác nhân và đường nối, nên tôi vẽ lại từ tệp `.drawio` (`PA02_Nhom04_UseCase_vebai.png`).
4. Sắp xếp lại 15 đặc tả UC đúng thứ tự U001–U015 và đánh số bảng, hình theo mục.
5. Thêm Phụ lục A (ma trận truy vết) và bảng phân công.

## Cần nhóm kiểm tra và quyết định
- [ ] **% đóng góp**: hiện tôi tạm để mỗi người 25%. Cần điền lại và ký tên.
- [x] ~~SC Tài khoản thừa trạng thái không có UC~~ → **đã bổ sung U016–U018** (xem mục bên dưới).
- [x] ~~Sơ đồ hoạt động của Mạnh rối~~ → **đã vẽ lại** U006, U007, U010–U015 (xem mục bên dưới).
- [ ] Rà lại nội dung đặc tả U016–U018 (do tôi viết) và các chỉnh sửa ở U001, U002, U013.
- [ ] Prototype **chưa có màn hình** cho U016–U018. Đề xuất thêm S19 Kích hoạt tài khoản, S20 Đặt lại mật khẩu, S21 Xóa tài khoản.
- [ ] Các sơ đồ dài (U011, U012, U013 và vài sơ đồ của Minh) được cắt làm 2 phần trong báo cáo cho dễ đọc. Ảnh nguyên vẹn nằm trong thư mục `SoDoHoatDong_PlantUML/`.
- [ ] Trong Word: nhấn chuột phải vào Mục lục, chọn **Update Field** rồi **Update entire table** trước khi xuất PDF.
- [ ] Phần Prototype không đưa vào nhật ký prompt, ảnh dark mode và component StageProgress (S20). Các phần này vẫn còn trong báo cáo thử nghiệm gốc nếu thầy cần.
- [ ] Hạn nộp: chưa rõ.

## Đợt chỉnh sửa 2 (06/11)
### Bổ sung 3 use case cho khớp SC Tài khoản
| UC | Tên | Tác nhân | Khớp chuyển trạng thái SC Tài khoản |
|---|---|---|---|
| U016 | Kích hoạt tài khoản qua email | Khách | Chưa kích hoạt → Đang hoạt động; token quá 24 giờ thì hủy |
| U017 | Đặt lại mật khẩu | Người dùng đã đăng ký | Bị khóa tạm thời → Đang hoạt động (đặt lại mật khẩu) |
| U018 | Xóa tài khoản | Người dùng đã đăng ký | Đang hoạt động → Đã xóa |

Mỗi UC mới có bảng đặc tả 9 mục và sơ đồ hoạt động. Kèm theo đó, tôi cập nhật cho đồng bộ:
- **U001**: tài khoản mới ở trạng thái *Chưa kích hoạt*; bước 6 gửi email kích hoạt thay vì chuyển sang Đăng nhập.
- **U002**: thêm luồng 3a (Quên mật khẩu → U017) và 4d (tài khoản chưa kích hoạt → gửi lại email, U016).
- **U013**: thêm thao tác xóa vĩnh viễn tài khoản đã bị khóa do vi phạm (chuyển trạng thái *Bị khóa vĩnh viễn → Đã xóa* trong SC).
- **FR-01**: bổ sung câu về kích hoạt, đặt lại mật khẩu và xóa tài khoản. Cột căn cứ của QĐ9 thêm U016–U018.
- Bảng chuyển trạng thái SC Tài khoản: cột căn cứ trỏ đúng U016, U017, U018.
- Sơ đồ use case: thêm 3 ellipse và 3 đường liên kết (`PA02_Nhom04_UseCase_v2.drawio`). Danh sách UC, bảng mã, ma trận truy vết đều đã chuyển sang 18 UC.

### Vẽ lại sơ đồ hoạt động
- Các sơ đồ U006, U007, U010–U015 của Mạnh được viết lại bằng PlantUML, cùng phong cách với sơ đồ của Minh: 2 làn (tác nhân | Hệ thống VeriCite), mỗi nhánh có nhãn mã kịch bản phụ (2a, 4b, …), vòng lặp “quay lại bước N” vẽ bằng `repeat … repeat while`. Nội dung bám sát bảng đặc tả của Mạnh.
- U001 và U002 của Minh được cập nhật theo luồng mới. U003, U004, U005, U008, U009 giữ nguyên ảnh gốc.
- Tệp nguồn `.puml` nằm trong `SoDoHoatDong_PlantUML/`. Muốn sửa thì dán nội dung tệp vào plantuml.com hoặc dùng extension PlantUML trên VS Code. Ảnh PNG trong thư mục do tôi tự dựng từ chính các tệp này. Nếu nhóm render lại bằng PlantUML thì bố cục có thể hơi khác, còn nội dung giữ nguyên.

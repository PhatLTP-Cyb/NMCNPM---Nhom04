---
title: PA02 – Phân tích yêu cầu hệ thống VeriCite
---

- [Các nội dung chính](#các-nội-dung-chính)
- [1 Bảng đánh giá thành viên](#bảng-đánh-giá-thành-viên)
- [2 Mô tả bài toán](#mô-tả-bài-toán)
  - [2.1 Phát biểu bài toán](#phát-biểu-bài-toán)
  - [2.2 Môi trường hoạt động](#môi-trường-hoạt-động)
  - [2.3 Ràng buộc thiết kế và triển khai](#ràng-buộc-thiết-kế-và-triển-khai)
- [3 Tổng quan yêu cầu](#tổng-quan-yêu-cầu)
  - [3.1 Danh sách các stakeholder và Sơ đồ ngữ cảnh](#danh-sách-các-stakeholder-và-sơ-đồ-ngữ-cảnh)
  - [3.2 Danh sách yêu cầu](#danh-sách-yêu-cầu)
- [4 Đặc tả yêu cầu](#đặc-tả-yêu-cầu)
  - [4.1 Sơ đồ Use Case](#sơ-đồ-use-case)
  - [4.2 Đặc tả Use Case](#đặc-tả-use-case)
  - [4.3 Sơ đồ hoạt động (Activity Diagram)](#sơ-đồ-hoạt-động-activity-diagram)
  - [4.4 Sơ đồ trạng thái (State Chart)](#sơ-đồ-trạng-thái-state-chart)
- [5 Bản mẫu (Prototype)](#bản-mẫu-prototype)
  - [5.1 Giới thiệu](#giới-thiệu)
  - [5.2 Bảng đối chiếu màn hình](#bảng-đối-chiếu-màn-hình)
  - [5.3 Các màn hình](#các-màn-hình)
  - [5.4 Kết quả đối chiếu prototype với yêu cầu](#kết-quả-đối-chiếu-prototype-với-yêu-cầu)
  - [5.5 Ghi chú](#ghi-chú)
- [Phụ lục A. Ma trận truy vết yêu cầu](#phụ-lục-a.-ma-trận-truy-vết-yêu-cầu)

ĐẠI HỌC QUỐC GIA THÀNH PHỐ HỒ CHÍ MINH

TRƯỜNG ĐẠI HỌC KHOA HỌC TỰ NHIÊN

KHOA CÔNG NGHỆ THÔNG TIN  
BỘ MÔN CÔNG NGHỆ PHẦN MỀM

![Logo Trường ĐH Khoa học Tự nhiên](media/logo.png)

Đồ án PA02: Phân tích yêu cầu

Đề tài: VeriCite – Hệ thống phát hiện và kiểm chứng ảo giác AI trong nội dung học thuật

Học phần: Nhập môn Công nghệ phần mềm, lớp 24_3

*Thành viên nhóm 04:*  
Lê Tấn Phát (24120115) – nhóm trưởng  
Lâm Duy Minh (24120091)  
Tạ Quang Mạnh (24120089)  
Vương Hữu Khang (24120070)

*Giảng viên hướng dẫn:*  
ThS. Ngô Ngọc Đăng Khoa

Thành phố Hồ Chí Minh, tháng 11 năm 2026

# Các nội dung chính

Tài liệu trình bày kết quả phân tích yêu cầu của hệ thống VeriCite theo biểu mẫu *Template#1-PhanTich-2019* của Bộ môn Công nghệ phần mềm, gồm các nội dung:

- Mô tả phát biểu bài toán, môi trường hoạt động và ràng buộc thiết kế, triển khai (Mục 2).
- Tổng quan yêu cầu: stakeholder, sơ đồ ngữ cảnh, quy định nghiệp vụ, yêu cầu chức năng và phi chức năng (Mục 3).
- Mô hình use case và đặc tả 18 use case; bổ sung sơ đồ hoạt động (activity diagram) cho từng use case và sơ đồ trạng thái (state chart) cho bốn đối tượng chính theo yêu cầu của giảng viên (Mục 4).
- Bản mẫu (prototype) giao diện của hệ thống và kết quả đối chiếu với yêu cầu (Mục 5).

Các mã định danh dùng thống nhất trong toàn tài liệu:

| Mã | Ý nghĩa | Phạm vi |
|---|---|---|
| STK-xx | Stakeholder (bên liên quan) | STK-01 – STK-08 |
| QĐx | Quy định nghiệp vụ | QĐ1 – QĐ10 |
| FR-xx | Functional Requirement – yêu cầu chức năng | FR-01 – FR-18 |
| NFR-xx | Non-Functional Requirement – yêu cầu phi chức năng | NFR-01 – NFR-11 |
| BMx | Biểu mẫu nghiệp vụ | BM1, BM2 |
| Uxxx | Use case | U001 – U018 |
| SC-xx | Scenario (kịch bản sử dụng) dùng để đối chiếu prototype | SC-01 – SC-05 |
| Sxx | Màn hình prototype | S01 – S21 |

Ba nhãn kết quả kiểm chứng được viết nghiêng và dùng đúng chữ ở mọi nơi: *Đã xác minh* (xanh lá), *Chưa xác minh được* (vàng cam), *Mâu thuẫn với nguồn* (đỏ).

# 1 Bảng đánh giá thành viên

Bảng 1.1. Bảng đánh giá thành viên

| MSSV | Họ Tên | % đóng góp (tối đa 100%) | Chữ ký |
|---|---|---|---|
| 24120115 | Lê Tấn Phát | 25% |  |
| 24120091 | Lâm Duy Minh | 25% |  |
| 24120089 | Tạ Quang Mạnh | 25% |  |
| 24120070 | Vương Hữu Khang | 25% |  |

Phần việc của từng thành viên trong PA02:

Bảng 1.2. Phân công thực hiện PA02

| Thành viên | Phần phụ trách |
|---|---|
| Lê Tấn Phát | Mục 1, Mục 5 (prototype 18 màn hình và báo cáo thử nghiệm, bổ sung S19–S21); duyệt danh sách use case; bổ sung U016–U018 và vẽ lại sơ đồ hoạt động U006, U007, U010–U015; ghép tài liệu và kiểm tra nhất quán cuối. |
| Lâm Duy Minh | Danh sách tác nhân và 15 use case ban đầu; sơ đồ use case; đặc tả và sơ đồ hoạt động U001–U005, U008, U009. |
| Tạ Quang Mạnh | Đặc tả U006, U007, U010–U015; rà soát prototype theo đặc tả. |
| Vương Hữu Khang | Mục 2, Mục 3 (bài toán, stakeholder, sơ đồ ngữ cảnh, quy định, FR, NFR, biểu mẫu); bốn sơ đồ trạng thái. |

# 2 Mô tả bài toán

## 2.1 Phát biểu bài toán

Sự bùng nổ của các mô hình ngôn ngữ lớn (LLM) đã mang lại tiện ích to lớn trong việc hỗ trợ soạn thảo nội dung, nhưng đồng thời làm bùng phát vấn nạn nghiêm trọng: **“ảo giác trích dẫn” (citation hallucination)**. Các mô hình LLM thường xuyên tự tạo ra các tài liệu tham khảo hoàn toàn bịa đặt nhưng gán tên tác giả có thật, tạo ra các mã định danh số (DOI) giả mạo hoặc trỏ sang bài báo khác, sai lệch năm xuất bản, gán sai nơi công bố, hoặc tự ý diễn giải sai lệch các câu trích nguyên văn so với tài liệu gốc. Các giải pháp hiện nay chủ yếu dùng chính LLM để kiểm tra LLM (dẫn đến nguy cơ ảo giác lặp lại), chỉ đưa ra điểm số tổng thể mơ hồ mà thiếu giải thích chi tiết sai lệch từng trường, và hoàn toàn không có khả năng tích lũy tri thức về các trích dẫn ma đã phát hiện.

Hệ thống **VeriCite** được xây dựng trên một nguyên tắc cốt lõi làm nên sự khác biệt: **“LLM chỉ đảm nhận việc nó làm tốt là bóc tách thông tin từ văn bản tự do; việc xác minh tuyệt đối ưu tiên các nguồn dữ liệu học thuật tất định”** (các cơ sở dữ liệu học thuật mở CrossRef, Semantic Scholar, OpenAlex và tệp tài liệu gốc do người dùng cung cấp). Nhờ nguyên tắc này, quá trình kiểm chứng đạt tính tái lập 100%, không bị ảnh hưởng bởi tính ngẫu nhiên hay ảo giác của trí tuệ nhân tạo.

**VeriCite** là một ứng dụng nền tảng web cho phép người dùng đưa vào một trong ba dạng dữ liệu: (1) đoạn văn bản do AI sinh ra, (2) danh mục tài liệu tham khảo, hoặc (3) tệp báo cáo hoàn chỉnh (định dạng PDF, DOCX hoặc TXT); cùng tùy chọn tải lên tài liệu nguồn đối chiếu (PDF, DOCX hoặc TXT) mà văn bản đã trích dẫn. Hệ thống tự động bóc tách nội dung thành từng thực thể độc lập gồm: trích dẫn, câu trích và nhận định học thuật; sau đó đưa qua quy trình kiểm chứng 3 lớp tất định và trả về báo cáo chi tiết. Trong báo cáo, mỗi mục được gán đúng một trong ba nhãn chuẩn học thuật: - *Đã xác minh* (được tô màu xanh lá): Trích dẫn có thật, khớp chính xác bản ghi nguồn hoặc câu trích khớp trung thực với tài liệu đối chiếu. - *Chưa xác minh được* (được tô màu vàng/cam): Không tìm thấy bản ghi trên các CSDL mở (sách, luận văn nội bộ, tài liệu tiếng Việt…) hoặc nhận định chưa có nguồn; hệ thống tuyệt đối không bao giờ quy chụp là bịa khi chưa có căn cứ. - *Mâu thuẫn với nguồn* (được tô màu đỏ): Trích dẫn có thật nhưng sai lệch chi tiết trường (năm, tác giả, tạp chí), DOI sai bài, câu trích bị sửa đổi làm sai lệch nghĩa, hoặc trích dẫn trùng khớp với Kho trích dẫn ma đã được cộng đồng xác nhận là bịa đặt.

Mỗi nhãn đều đi kèm mã lý do minh bạch, vị trí đoạn văn, liên kết kiểm chứng nguồn gốc trực tiếp và các từ ngữ sai khác được tô sáng trực quan.

**Sáu (06) nghiệp vụ chính của hệ thống bao gồm:** 1. **Kiểm tra trích dẫn (Lớp 1):** Xác định sự tồn tại thực tế của tài liệu tham khảo thông qua tra cứu tất định trên CrossRef, Semantic Scholar, OpenAlex; đối chiếu chi tiết từng trường (tác giả, năm xuất bản, tiêu đề, nơi đăng/tạp chí, DOI) với bản ghi gốc; kiểm tra đối chiếu nhanh với Kho trích dẫn ma và Danh sách trích dẫn thật đã xác nhận. 2. **So khớp câu trích (Lớp 2):** Đối chiếu các câu trích dẫn nguyên văn với tài liệu nguồn do người dùng tải lên, xác định đoạn khớp nhất, tính toán độ tương đồng và chỉ rõ vị trí (trang, đoạn); tô sáng các từ ngữ bị thay đổi/sai lệch. 3. **Đánh dấu nhận định không có nguồn và gợi ý tài liệu (Lớp 3):** Nhận diện các nhận định học thuật không kèm nguồn tham khảo, gán cảnh báo và truy vấn tự động tối đa 5 tài liệu liên quan từ CSDL học thuật mở để người dùng tự đối chiếu (không gọi LLM phán xét đúng sai). 4. **Báo cáo và lưu trữ:** Trực quan hóa kết quả bằng màu sắc trực tiếp trên văn bản gốc; cung cấp danh mục chi tiết sắp xếp theo mức độ rủi ro; cho phép xuất báo cáo PDF độc lập làm minh chứng học thuật; quản lý lịch sử kiểm tra có thời hạn lưu trữ an toàn. 5. **Phản hồi và kiểm duyệt:** Cho phép người dùng gửi báo lỗi kết quả kiểm tra kèm chứng cứ; cung cấp giao diện hàng đợi cho Moderator thẩm định và phê duyệt để cập nhật Kho trích dẫn ma và Danh sách trích dẫn thật đã xác nhận. 6. **Quản trị hệ thống:** Quản lý tài khoản người dùng, phân quyền các vai trò (Sinh viên, Giảng viên, Moderator, Quản trị viên), thiết lập và giám sát hạn mức kiểm tra, theo dõi thống kê lượt dùng và kiểm soát chi phí token API gọi LLM.

**Mục tiêu định lượng:** Trên bộ dữ liệu kiểm thử chuẩn 120 trích dẫn (gồm 60 trích dẫn thật và 60 trích dẫn bịa), hệ thống cam kết đạt các chỉ tiêu: phát hiện ít nhất 90% trích dẫn bịa; tỷ lệ báo nhầm trích dẫn thật thành bịa không vượt quá 5%; và thời gian xử lý một lượt 20 trích dẫn không quá 30 giây.

## 2.2 Môi trường hoạt động

- **Phía người dùng (Client):**
  - Trình duyệt web hiện đại hỗ trợ chuẩn HTML5 và ES2020: Google Chrome, Microsoft Edge, Mozilla Firefox, Apple Safari (hỗ trợ hai phiên bản phát hành gần nhất).
  - Giao diện web responsive thích ứng đa nền tảng: máy tính để bàn (Desktop), máy tính xách tay (Laptop), máy tính bảng (Tablet) và điện thoại thông minh (Mobile với chiều rộng màn hình tối thiểu từ 360px trở lên; trên điện thoại tối ưu trải nghiệm dán văn bản và xem báo cáo).
  - Yêu cầu thiết bị có kết nối mạng Internet ổn định; không yêu cầu người dùng cài đặt thêm bất kỳ phần mềm hay tiện ích mở rộng nào.
- **Phía máy chủ (Server):**
  - Hệ điều hành Linux (khuyến nghị phiên bản Ubuntu Server 24.04 LTS 64-bit).
  - Nền tảng ứng dụng được đóng gói và vận hành hoàn toàn trong các container Docker qua Docker Compose trên máy chủ ảo (VPS) với cấu hình tối thiểu 2 vCPU, 4 GB RAM và 40 GB dung lượng lưu trữ SSD.
  - Mọi luồng truyền thông giữa máy khách và máy chủ đều bắt buộc mã hóa qua giao thức HTTPS (sử dụng chứng chỉ TLS 1.2 trở lên). Máy chủ có kết nối Internet băng thông ổn định để gửi truy vấn ra các API học thuật và dịch vụ LLM bên ngoài.
- **Dịch vụ tích hợp bên ngoài (External Services):**
  - Cơ sở dữ liệu học thuật mở: CrossRef REST API (định danh DOI và bài báo), Semantic Scholar Academic Graph API (tra cứu trích dẫn và bài viết), OpenAlex API (tra cứu học thuật quy mô lớn).
  - Nhà cung cấp dịch vụ mô hình ngôn ngữ lớn (LLM Provider API): OpenAI API, Google Gemini API hoặc Anthropic Claude API; hỗ trợ giao thức gọi hàm hoặc xuất dữ liệu JSON có cấu trúc (Structured Outputs/JSON Schema) phục vụ bóc tách thông tin bám sát văn bản gốc.

## 2.3 Ràng buộc thiết kế và triển khai

Các ràng buộc kỹ thuật, công nghệ và tiêu chuẩn mà nhóm phát triển cam kết tuân thủ trong suốt vòng đời dự án được tổng hợp tại Bảng 2.1.

**Bảng 2.1.** *Các ràng buộc thiết kế và triển khai của hệ thống VeriCite*

| **STT** | **Hạng mục** | **Lựa chọn công nghệ / Chuẩn quy định** | **Lý do lựa chọn & Ràng buộc** |
|---|---|---|---|
| 1 | **Giao diện người dùng (Frontend)** | React, TypeScript, Vite, Tailwind CSS | Xây dựng ứng dụng trang đơn (SPA) mượt mà; bản build tĩnh được Nginx phục vụ trực tiếp, giảm tải tài nguyên CPU/RAM cho VPS 4 GB; TypeScript kiểm soát chặt chẽ kiểu dữ liệu, hạn chế lỗi lúc runtime. |
| 2 | **Máy chủ nghiệp vụ (Backend)** | Python 3.12, FastAPI, Uvicorn | Python sở hữu hệ sinh thái xử lý văn bản và tài liệu khoa học xuất sắc (PyMuPDF, python-docx, RapidFuzz) cùng SDK chính thức của các hãng LLM; FastAPI hỗ trợ bất đồng bộ (asyncio) hiệu năng cao và tự động sinh tài liệu chuẩn OpenAPI. |
| 3 | **Cơ sở dữ liệu (Database)** | PostgreSQL 16 | Hệ quản trị CSDL quan hệ chuẩn mực, độ tin cậy và toàn vẹn dữ liệu cao; kiểu dữ liệu JSONB hỗ trợ lưu trữ linh hoạt cấu trúc kết quả phân tích; tích hợp tính năng tìm kiếm toàn văn (Full-text search). |
| 4 | **Bộ nhớ đệm & Hàng đợi (Cache & Queue)** | Redis 7, Celery | Redis lưu đệm (cache) kết quả tra cứu CSDL học thuật để tránh vượt giới hạn gọi API (Rate limit) và tiết kiệm chi phí; Celery quản lý hàng đợi tác vụ xử lý nền cho các lượt kiểm tra dài và kiểm tra hàng loạt, có cơ chế thử lại có giãn cách. |
| 5 | **Tích hợp mô hình LLM** | Adapter Pattern, JSON Schema cố định, Thuật toán kiểm tra bám văn bản gốc | Đóng gói qua lớp trừu tượng (Adapter) để dễ dàng hoán đổi nhà cung cấp LLM; áp dụng schema JSON cố định; áp dụng thuật toán so khớp chuỗi tất định bắt buộc mọi giá trị tách ra phải trùng nguyên văn vị trí trong văn bản gốc. |
| 6 | **Đóng gói & Triển khai** | Docker, Docker Compose, Nginx Reverse Proxy, GitHub Actions | Đảm bảo tính nhất quán tuyệt đối giữa môi trường phát triển cục bộ và môi trường máy chủ demo; tích hợp quy trình CI/CD tự động chạy kiểm thử đơn vị và kiểm thử hồi quy trước mỗi bản phát hành. |
| 7 | **Quy trình & Tiêu chuẩn tài liệu** | Mô hình RUP/Scrum lai, Chuẩn mô hình hóa UML 2.5, Chuẩn đặc tả ISO/IEC/IEEE 29148 | Phù hợp với nhóm sinh viên quy mô nhỏ và tiến độ đồ án; tài liệu tuân thủ nghiêm ngặt quy định học thuật của bộ môn và chuẩn mực công nghiệp phần mềm. |
| 8 | **An toàn thông tin & Bảo mật** | Nguyên tắc bảo mật OWASP Top 10, Thuật toán băm mật khẩu Argon2id, Mã hóa đường truyền TLS 1.2+ | Bảo vệ dữ liệu cá nhân của người dùng; bảo vệ bản quyền và tính riêng tư của các tài liệu học thuật tải lên; phòng chống tấn công dò quét mật khẩu (brute-force) và tấn công trung gian (MitM). |

# 3 Tổng quan yêu cầu

## 3.1 Danh sách các stakeholder và Sơ đồ ngữ cảnh

### 3.1.1 Danh sách Stakeholder

Dự án xác định rõ 8 nhóm stakeholder trực tiếp và gián tiếp có ảnh hưởng hoặc chịu sự tác động từ hệ thống, được chi tiết hóa tại Bảng 3.1.

**Bảng 3.1.** *Danh sách các bên liên quan (Stakeholder) của hệ thống VeriCite*

| **STT** | **Mã** | **Tên Stakeholder** | **Mô tả vai trò trong hệ thống** | **Nhu cầu chính đối với hệ thống** | **Mức độ ảnh hưởng** |
|---|---|---|---|---|---|
| 1 | **STK-01** | Giảng viên hướng dẫn đồ án | Người định hướng nghiệp vụ, thẩm định phạm vi bài toán, theo dõi tiến độ và đánh giá nghiệm thu sản phẩm. | Sản phẩm giải quyết đúng bài toán thực tế, bám sát phạm vi đề ra; tài liệu kỹ thuật tuân thủ biểu mẫu và chuẩn mực môn học. | Rất cao |
| 2 | **STK-02** | Sinh viên (Người dùng chính) | Người dùng trực tiếp sử dụng hệ thống để rà soát bài viết học thuật, tiểu luận, khóa luận do AI hỗ trợ soạn thảo. | Kiểm tra nhanh chóng xem trích dẫn và câu trích có thật và chính xác hay không trước khi nộp bài; nhận cảnh báo rõ ràng kèm nguồn đối chiếu để sửa lỗi. | Rất cao |
| 3 | **STK-03** | Giảng viên (Người dùng) | Người dùng sử dụng hệ thống để thẩm tra bài nộp của học viên, đánh giá mức độ trung thực học thuật của danh mục tham khảo. | Khả năng kiểm tra hàng loạt nhiều bài nộp cùng lúc; báo cáo tổng hợp chỉ rõ bài nào có dấu hiệu ngụy tạo trích dẫn; xuất báo cáo PDF làm chứng cứ. | Cao |
| 4 | **STK-04** | Khách (Guest User) | Người dùng vãng lai truy cập hệ thống lần đầu mà chưa thực hiện đăng ký tài khoản. | Trải nghiệm nhanh tính năng kiểm tra trích dẫn cơ bản với số lượng giới hạn mà không cần tốn thời gian đăng ký tài khoản. | Thấp |
| 5 | **STK-05** | Moderator (Kiểm duyệt viên) | Thành viên chuyên trách tiếp nhận, xem xét và xử lý các yêu cầu báo cáo lỗi kết quả kiểm tra do người dùng gửi lên. | Công cụ quản lý hàng đợi báo lỗi trực quan; xem xét bằng chứng đối chiếu và thực hiện phê duyệt/từ chối để cập nhật Kho trích dẫn ma và Danh sách trích dẫn thật. | Trung bình |
| 6 | **STK-06** | Quản trị viên (Administrator) | Người chịu trách nhiệm vận hành, giám sát hoạt động kỹ thuật, quản lý người dùng và an toàn hệ thống. | Quản lý danh sách tài khoản, phân quyền vai trò; cấu hình hạn mức kiểm tra; giám sát số lượng token LLM tiêu thụ và chi phí API để không vượt ngân sách. | Trung bình |
| 7 | **STK-07** | CSDL học thuật mở (CrossRef, Semantic Scholar, OpenAlex) | Hệ thống máy chủ bên ngoài cung cấp nguồn dữ liệu thư tịch học thuật tất định làm căn cứ xác minh. | Các yêu cầu truy vấn từ VeriCite phải tuân thủ nghiêm ngặt điều khoản sử dụng, đúng định dạng và không vượt quá ngưỡng giới hạn tần suất (Rate limit). | Rất cao |
| 8 | **STK-08** | Nhà cung cấp dịch vụ LLM (OpenAI, Google, Anthropic) | Hệ thống trí tuệ nhân tạo bên ngoài cung cấp năng lực bóc tách thông tin có cấu trúc từ văn bản tự do qua API. | Dữ liệu đầu vào chuẩn xác; quản lý số lượng token gọi trong hạn mức gói cước; thanh toán chi phí tiêu thụ theo quy định dịch vụ. | Trung bình |

### 3.1.2 Sơ đồ ngữ cảnh (Context Diagram)

Sơ đồ ngữ cảnh mô tả ranh giới hệ thống VeriCite, vị trí tương tác của 5 tác nhân người dùng và 2 tác nhân hệ thống bên ngoài, cùng các luồng dữ liệu vào/ra tương ứng.

![Hình 3.1. Sơ đồ ngữ cảnh (Context Diagram) của hệ thống VeriCite](media/PA02_Nhom04_ContextDiagram.png)

Hình 3.1. Sơ đồ ngữ cảnh (Context Diagram) của hệ thống VeriCite

**Bảng 3.2.** *Mô tả chi tiết các luồng dữ liệu trong Sơ đồ ngữ cảnh*

| **Tác nhân tương tác** | **Luồng dữ liệu vào hệ thống (Input Data Flow)** | **Luồng dữ liệu ra tới tác nhân (Output Data Flow)** |
|---|---|---|
| **Khách (STK-04)** | Đoạn văn bản dán trực tiếp chứa tối đa 5 trích dẫn dùng thử (tuân thủ QĐ1). | Báo cáo kết quả kiểm tra tại chỗ trên màn hình, thể hiện trạng thái xác minh sơ bộ. |
| **Sinh viên (STK-02)** | Thông tin tài khoản đăng ký/đăng nhập; văn bản cần kiểm tra (dán trực tiếp hoặc tệp PDF/DOCX); tệp tài liệu nguồn đối chiếu (PDF); tùy chọn chế độ rủi ro (*Thông thường* hoặc *Học thuật nghiêm ngặt*); yêu cầu báo lỗi kết quả kèm chứng cứ. | Giao diện báo cáo kết quả chi tiết với văn bản được tô 3 màu nhãn (*Đã xác minh*, *Chưa xác minh được*, *Mâu thuẫn với nguồn*); mã lý do; liên kết nguồn gốc; tệp báo cáo PDF tải về; danh sách lịch sử kiểm tra. |
| **Giảng viên (STK-03)** | Gói tệp bài nộp của học viên (tải hàng loạt tối đa 30 tệp PDF/DOCX); các tham số kiểm tra lớp học. | Thanh tiến độ xử lý hàng đợi nền; bảng tổng hợp thống kê kết quả toàn bộ các bài nộp; báo cáo chi tiết cho từng bài nộp của học viên; tệp xuất PDF tổng hợp. |
| **Moderator (STK-05)** | Quyết định phê duyệt/từ chối báo lỗi; lý do thẩm định; yêu cầu thêm mới, sửa đổi hoặc xóa bỏ bản ghi trong Kho trích dẫn ma và Danh sách trích dẫn thật đã xác nhận. | Danh sách hàng đợi các báo lỗi đang chờ duyệt; chi tiết văn bản báo lỗi kèm chứng cứ do người dùng cung cấp; bản ghi nguồn đã khớp; nhật ký kiểm duyệt hệ thống. |
| **Quản trị viên (STK-06)** | Lệnh quản lý tài khoản (khóa/mở khóa); quyết định phân vai (Sinh viên, Giảng viên, Moderator); cấu hình hạn mức kiểm tra (số lượt/ngày, số trích dẫn/lượt); thiết lập ngưỡng cảnh báo ngân sách. | Bảng điều khiển (Dashboard) thống kê tổng lượt kiểm tra, phân bố số lượng mục theo các nhãn; báo cáo chi phí token LLM ước tính; thống kê tỷ lệ lỗi và thời gian phản hồi của CSDL ngoài; thông báo cảnh báo vượt 80% ngân sách. |
| **CSDL học thuật mở (STK-07)** | Yêu cầu tra cứu siêu dữ liệu bài báo qua mã định danh DOI hoặc truy vấn tiêu đề, tác giả, năm công bố; truy vấn tìm kiếm tài liệu gợi ý theo từ khóa. | Tập dữ liệu siêu dữ liệu (metadata) thư tịch gốc chuẩn hóa (tiêu đề, tác giả, năm, tạp chí/hội nghị, DOI chính thức); mã trạng thái phản hồi HTTP. |
| **Nhà cung cấp LLM (STK-08)** | Nội dung văn bản thô kèm prompt yêu cầu bóc tách và định dạng JSON Schema quy định nghiêm ngặt vị trí ký tự. | Cấu trúc dữ liệu JSON chứa danh sách trích dẫn, câu trích và nhận định học thuật kèm tọa độ ký tự bám sát nguyên văn văn bản gốc; lượng token đã tiêu thụ. |

## 3.2 Danh sách yêu cầu

### Quy định nghiệp vụ (QĐ1 – QĐ10)

Để đảm bảo tính nhất quán giữa các yêu cầu chức năng, đặc tả use case và giao diện người dùng, toàn bộ hệ thống áp dụng thống nhất 10 quy định nghiệp vụ cốt lõi tại Bảng 3.3.

**Bảng 3.3.** *Bảng quy định nghiệp vụ hệ thống (QĐ1 – QĐ10)*

| **Mã QĐ** | **Tên quy định nghiệp vụ** | **Nội dung chi tiết quy định** | **Yêu cầu & Use Case liên quan** |
|---|---|---|---|
| **QĐ1** | Hạn mức dùng thử cho khách vãng lai | Khách vãng lai không cần đăng nhập được thực hiện tối đa 3 lượt kiểm tra trong một ngày (kiểm soát theo địa chỉ IP và phiên làm việc); mỗi lượt kiểm tra tối đa 5 trích dẫn; chỉ hỗ trợ hình thức dán trực tiếp danh mục trích dẫn (không hỗ trợ tải tệp tài liệu nguồn đối chiếu). | FR-02, U003, SC-05 |
| **QĐ2** | Giới hạn dữ liệu đầu vào cho một lượt kiểm tra | Mỗi lượt kiểm tra của người dùng đã đăng nhập chấp nhận văn bản (dán trực tiếp hoặc trong tệp) không quá 10.000 từ và không quá 50 trích dẫn. Tệp kiểm tra và tệp tài liệu nguồn đối chiếu có định dạng PDF (có lớp văn bản), DOCX hoặc TXT, mỗi tệp không quá 10 MB. Vượt quá giới hạn trên, hệ thống từ chối xử lý, nêu rõ chỉ số vượt ngưỡng và không trừ hạn mức của người dùng. | FR-03, FR-04, U004, SC-01 |
| **QĐ3** | Giới hạn kiểm tra hàng loạt cho giảng viên | Tài khoản vai trò Giảng viên được phép tải lên tối đa 30 tệp bài nộp trong một đợt kiểm tra hàng loạt. Tác vụ được đẩy vào hàng đợi xử lý nền (Celery), hiển thị tiến độ tổng thể. Lỗi xử lý tại một tệp cục bộ không được làm gián đoạn hay dừng quá trình xử lý của 29 tệp còn lại. | FR-13, U009, SC-03 |
| **QĐ4** | Quy tắc gán nhãn 3 trạng thái và mã lý do | Mọi mục (trích dẫn, câu trích, nhận định) sau khi kiểm chứng phải được gán đúng một trong ba nhãn chuẩn:<br>• **Đã xác minh** *(Verified - Xanh lá)*: Tìm thấy bản ghi gốc trùng khớp trên CSDL học thuật; hoặc trùng khớp với Danh sách trích dẫn thật đã xác nhận; hoặc câu trích khớp chính xác/đạt ngưỡng với tài liệu nguồn.<br>• **Chưa xác minh được** *(Unverified - Vàng/Cam)*: Không tìm thấy bản ghi trên CSDL mở (sách, luận văn, tài liệu tiếng Việt); hoặc CSDL ngoài gặp sự cố mạng/timeout; hoặc nhận định không có tài liệu nguồn đối chiếu. Tuyệt đối không quy chụp là bịa đặt.<br>• **Mâu thuẫn với nguồn** *(Conflicted - Đỏ)*: Trích dẫn có thật nhưng sai lệch chi tiết trường (năm, tác giả, nơi công bố); DOI trỏ tới bài khác; câu trích sai lệch so với nguồn; hoặc trích dẫn trùng khớp với Kho trích dẫn ma. | FR-05, FR-06, FR-09, U004, U006 |
| **QĐ5** | Nguyên tắc gợi ý tài liệu ở Lớp 3 | Với các nhận định học thuật không có nguồn trích dẫn và người dùng không tải tài liệu nguồn đối chiếu, hệ thống sử dụng các từ khóa đã bóc tách để truy vấn tìm kiếm tối đa 5 tài liệu liên quan trên Semantic Scholar và OpenAlex. Tài liệu gợi ý chỉ mang tính chất tham khảo cho người dùng tự tra cứu đối chiếu, **tuyệt đối không bao giờ làm nhãn của nhận định đổi thành *Đã xác minh***. Lớp 3 không gọi LLM để phán xét đúng/sai. | FR-08, U004, U006 |
| **QĐ6** | Ngưỡng so khớp câu trích ở Lớp 2 | Câu trích dẫn nguyên văn được đối chiếu với tài liệu nguồn qua so khớp chính xác và so khớp gần đúng (RapidFuzz/Levenshtein):<br>• Khớp chính xác (100%): Gán nhãn *Đã xác minh*, chỉ rõ trang và đoạn văn.<br>• Khớp gần đúng đạt ngưỡng tiêu chuẩn từ 90% trở lên (ở chế độ *Thông thường*): Gán nhãn *Đã xác minh*.<br>• Khớp một phần từ 70% đến dưới 90% (hoặc không tìm thấy): Gán nhãn *Mâu thuẫn với nguồn* kèm trích đoạn nguồn gần nhất.<br>• Mọi trường hợp khớp gần đúng dưới 100% bắt buộc phải **tô sáng các từ ngữ bị sai lệch, thay đổi hoặc số liệu bị sửa**. | FR-07, U004, U005, SC-02 |
| **QĐ7** | Quy tắc hiển thị báo cáo và chế độ rủi ro | Hệ thống cung cấp tối thiểu hai chế độ kiểm tra: *Thông thường* và *Học thuật nghiêm ngặt*. **Không có bất kỳ chế độ nào được phép ẩn các mục *Chưa xác minh được* hay *Mâu thuẫn với nguồn* khỏi báo cáo trên màn hình hoặc tệp xuất PDF** (tránh làm báo cáo trông “sạch” giả tạo). Ở chế độ *Học thuật nghiêm ngặt*, ngưỡng so khớp câu trích nâng lên 95%, và toàn bộ các mục có nhãn khác *Đã xác minh* được tự động đưa lên đầu báo cáo thành danh mục ưu tiên xử lý. | FR-10, FR-11, U006, U007 |
| **QĐ8** | Chính sách lưu trữ dữ liệu và quyền riêng tư | Tệp tài liệu người dùng tải lên (văn bản kiểm tra, tài liệu nguồn) chỉ được sử dụng cho phiên kiểm tra của chính họ và được hệ thống tự động xóa vĩnh viễn khỏi máy chủ sau 30 ngày hoặc ngay khi người dùng chủ động xóa lượt kiểm tra. Người dùng A tuyệt đối không xem được dữ liệu của người dùng B. Tuyệt đối không gửi thông tin định danh cá nhân (tên, email) của người dùng sang các dịch vụ LLM bên ngoài. | FR-12, NFR-05, U008 |
| **QĐ9** | Quy định bảo mật tài khoản và xác thực | Mật khẩu tài khoản phải có độ dài tối thiểu từ 8 ký tự trở lên, áp dụng hướng dẫn an toàn NIST SP 800-63B (chặn các mật khẩu phổ biến, dễ đoán, mật khẩu đã bị rò rỉ). Mật khẩu được lưu trữ dưới dạng mã băm Argon2id có salt ngẫu nhiên. Hệ thống tự động khóa tài khoản tạm thời 15 phút sau 5 lần nhập sai mật khẩu liên tiếp nhằm ngăn chặn tấn công brute-force. | FR-01, FR-18, NFR-04, U001, U002, U016–U018 |
| **QĐ10** | Quy trình kiểm duyệt kho trích dẫn ma và trích dẫn thật | Báo lỗi kết quả từ người dùng được đưa vào hàng đợi kiểm duyệt ở trạng thái “Chờ duyệt” và không làm thay đổi kết quả kiểm tra tự động cho đến khi có quyết định chính thức. Moderator thẩm định chứng cứ:<br>• Chấp nhận báo lỗi “Trích dẫn là bịa”: Thêm trích dẫn vào *Kho trích dẫn ma*.<br>• Chấp nhận báo lỗi “Trích dẫn có thật bị gán sai”: Gỡ khỏi Kho trích dẫn ma (nếu có) và thêm vào *Danh sách trích dẫn thật đã xác nhận* kèm liên kết bằng chứng xác thực.<br>Mọi thao tác can thiệp đều phải được lưu vết trong nhật ký kiểm toán (Audit log) gồm người duyệt, thời điểm và lý do. | FR-14, FR-15, U010, U011, U012, SC-04 |

### 3.2.1 Đặc tả yêu cầu chức năng

Hệ thống VeriCite có 18 yêu cầu chức năng (FR-01 đến FR-18), chia thành 5 nhóm nghiệp vụ. Mỗi yêu cầu được trình bày theo ba cột tại Bảng 3.4: câu chuyện người dùng (user story) nêu ai cần gì và để làm gì; mã và tên yêu cầu; chi tiết gồm mô tả, tiêu chí kiểm chứng, độ ưu tiên (MoSCoW), tác nhân và quy định liên quan.

**Bảng 3.4.** *Danh sách yêu cầu chức năng (FR-01 đến FR-18)*

| User Story | Requirement | Details |
|---|---|---|
| **Nhóm 1: Quản lý tài khoản** |  |  |
| Là người dùng, tôi muốn đăng ký và đăng nhập bằng email để sử dụng các chức năng đúng với vai trò của mình. | **FR-01**<br>Đăng ký, đăng nhập và phân quyền theo vai | Hệ thống cung cấp chức năng cho phép người dùng đăng ký tài khoản mới bằng địa chỉ email và mật khẩu hợp lệ theo quy định QĐ9 (độ dài tối thiểu 8 ký tự, không chứa chuỗi dễ đoán hay mật khẩu lộ lọt). Tài khoản đăng ký mới mặc định được gán vai trò Sinh viên. Hệ thống cung cấp chức năng đăng nhập, đăng xuất an toàn; duy trì phiên làm việc bằng JSON Web Token (JWT) có thời hạn; tự động khóa tài khoản tạm thời 15 phút sau 5 lần đăng nhập thất bại liên tiếp nhằm chống brute-force. Hệ thống kiểm soát quyền truy cập tài nguyên nghiêm ngặt ở cấp API dựa trên vai trò người dùng (Role-Based Access Control - RBAC).<br>**Tiêu chí kiểm chứng:**<br>1. Đăng ký với mật khẩu dưới 8 ký tự hoặc nằm trong danh sách mật khẩu yếu/phổ biến (ví dụ: `12345678`, `password`) bị hệ thống từ chối và hiển thị thông báo lý do rõ ràng.<br>2. Đăng ký thành công với mật khẩu hợp lệ, mật khẩu lưu trong cơ sở dữ liệu bắt buộc phải được mã hóa băm bằng thuật toán Argon2id có salt.<br>3. Thực hiện đăng nhập sai 5 lần liên tiếp trên một tài khoản, hệ thống từ chối lượt đăng nhập thứ 6 và hiển thị thông báo khóa tạm thời trong 15 phút.<br>4. Người dùng vai trò Sinh viên gọi trực tiếp API của Quản trị viên hoặc Moderator bị chặn với mã phản hồi HTTP 403 Forbidden.<br>*Độ ưu tiên: Must Have · Tác nhân: Khách (STK-04), Người dùng đã đăng ký (STK-02, STK-03, STK-05, STK-06) · Quy định liên quan: QĐ9* |
| Là khách, tôi muốn kiểm tra thử vài trích dẫn mà không cần tạo tài khoản để đánh giá hệ thống trước khi đăng ký. | **FR-02**<br>Kiểm tra dùng thử cho khách vãng lai | Hệ thống cho phép người dùng vãng lai chưa có tài khoản trải nghiệm tính năng kiểm tra trích dẫn trực tiếp tại trang chủ. Khách dán tối đa 5 trích dẫn vào ô nhập liệu; hệ thống thực hiện kiểm tra Lớp 1 (xác minh sự tồn tại và đối chiếu trường trích dẫn qua CSDL mở) và trả về kết quả hiển thị trên màn hình. Mỗi địa chỉ IP/phiên làm việc chỉ được thực hiện tối đa 3 lượt kiểm tra trong một ngày. Chức năng dùng thử không hỗ trợ tải tệp tài liệu đối chiếu (Lớp 2), không lưu lịch sử và không hỗ trợ xuất báo cáo PDF.<br>**Tiêu chí kiểm chứng:**<br>1. Khách dán từ 1 đến 5 trích dẫn, hệ thống xử lý và trả về nhãn trạng thái trực tiếp trên giao diện mà không yêu cầu đăng nhập.<br>2. Khách dán nhiều hơn 5 trích dẫn, hệ thống thông báo vượt quá số lượng cho phép của lượt dùng thử và yêu cầu xóa bớt hoặc đăng ký tài khoản.<br>3. Sau 3 lượt dùng thử thành công trong cùng một ngày từ một IP, lượt thứ 4 bị chặn kèm thông báo đã hết hạn mức dùng thử trong ngày và nút điều hướng tới trang Đăng ký.<br>*Độ ưu tiên: Should Have · Tác nhân: Khách (STK-04) · Quy định liên quan: QĐ1* |
| Là người dùng đã đăng ký, tôi muốn kích hoạt tài khoản, lấy lại mật khẩu khi quên và tự xóa tài khoản để chủ động quản lý tài khoản và dữ liệu của mình. | **FR-18**<br>Quản lý vòng đời tài khoản cá nhân | Tài khoản vừa đăng ký ở trạng thái chưa kích hoạt; người dùng kích hoạt bằng liên kết gửi qua email, liên kết có hiệu lực 24 giờ và dùng một lần; tài khoản quá 24 giờ chưa kích hoạt bị hủy. Người dùng quên mật khẩu yêu cầu liên kết đặt lại qua email (hiệu lực 30 phút); đặt lại thành công thì mọi phiên cũ bị hủy và trạng thái tạm khóa do nhập sai được gỡ. Người dùng tự xóa tài khoản sau khi xác nhận bằng mật khẩu hiện tại; hệ thống xóa thông tin định danh, lịch sử kiểm tra và tệp tải lên theo QĐ8. Hệ thống không tiết lộ một email đã đăng ký hay chưa trong mọi thông báo.<br>**Tiêu chí kiểm chứng:**<br>1. Đăng nhập bằng tài khoản chưa kích hoạt bị từ chối kèm thông báo yêu cầu kích hoạt; sau khi mở liên kết kích hoạt hợp lệ, đăng nhập thành công.<br>2. Liên kết kích hoạt hoặc đặt lại mật khẩu đã dùng hay đã hết hạn bị từ chối khi mở lại.<br>3. Yêu cầu đặt lại mật khẩu cho email chưa đăng ký và cho email đã đăng ký hiển thị cùng một thông báo.<br>4. Sau khi xóa tài khoản, đăng nhập bằng email và mật khẩu cũ bị từ chối; lịch sử kiểm tra và tệp tải lên của tài khoản không còn truy cập được.<br>*Độ ưu tiên: Should Have · Tác nhân: Khách (STK-04), Người dùng đã đăng ký (STK-02, STK-03, STK-05, STK-06) · Quy định liên quan: QĐ8, QĐ9* |
| **Nhóm 2: Kiểm tra nội dung** |  |  |
| Là sinh viên, tôi muốn dán văn bản hoặc tải tệp bài viết kèm tài liệu nguồn để hệ thống kiểm tra toàn bộ trích dẫn trong bài. | **FR-03**<br>Nhập dữ liệu kiểm tra và tải tài liệu nguồn | Hệ thống cung cấp giao diện cho người dùng đã đăng nhập nhập dữ liệu kiểm tra thông qua một trong hai hình thức: dán văn bản trực tiếp hoặc tải lên tệp văn bản (định dạng PDF, DOCX hoặc TXT, dung lượng tối đa 10 MB), văn bản không quá 10.000 từ. Người dùng có thể tùy chọn tải kèm một hoặc nhiều tệp tài liệu nguồn đối chiếu (PDF có lớp văn bản, DOCX hoặc TXT, mỗi tệp tối đa 10 MB) để phục vụ so khớp câu trích (Lớp 2). Hệ thống kiểm tra dung lượng, định dạng tệp và số lượng trích dẫn (tối đa 50 trích dẫn theo QĐ2). Giao diện hiển thị rõ ràng thông báo cảnh báo về việc nội dung văn bản sẽ được gửi tới dịch vụ LLM bên ngoài để bóc tách thông tin và yêu cầu người dùng xác nhận trước khi bắt đầu.<br>**Tiêu chí kiểm chứng:**<br>1. Tải lên tệp không đúng định dạng (ví dụ `.png`, `.exe`) hoặc vượt quá 10 MB bị hệ thống từ chối ngay tại giao diện với thông báo lỗi cụ thể.<br>2. Tệp PDF scan không có lớp văn bản (text layer) khi tải làm tài liệu nguồn đối chiếu bị hệ thống phát hiện và yêu cầu cung cấp tệp có lớp văn bản.<br>3. Khi văn bản vượt quá 10.000 từ hoặc chứa quá 50 trích dẫn, hệ thống từ chối tạo lượt kiểm tra và nêu rõ giới hạn vi phạm theo QĐ2.<br>4. Nút bấm kích hoạt kiểm tra chỉ khả dụng khi người dùng đã đánh dấu vào ô xác nhận đồng ý gửi văn bản tới dịch vụ LLM.<br>*Độ ưu tiên: Must Have · Tác nhân: Sinh viên (STK-02), Giảng viên (STK-03) · Quy định liên quan: QĐ2* |
| Là sinh viên, tôi muốn hệ thống tự tách các trích dẫn, câu trích và nhận định trong bài để tôi không phải liệt kê thủ công. | **FR-04**<br>Bóc tách trích dẫn, câu trích và nhận định | Hệ thống trích xuất mã định danh số (DOI) bằng biểu thức chính quy (Regex), sau đó gửi văn bản tới dịch vụ LLM kèm prompt chuyên biệt để bóc tách thành danh sách các thực thể theo định dạng JSON Schema cố định, bao gồm:<br>**Tiêu chí kiểm chứng:**<br>1. 100% đầu ra bóc tách được lưu trữ đều hợp lệ theo đúng cấu trúc JSON Schema đã quy định.<br>2. Kiểm tra bám văn bản: Nếu giá trị trường bóc tách bị sai khác dù chỉ 1 ký tự so với văn bản gốc tại tọa độ chỉ định, hệ thống phát hiện và kích hoạt gọi lại.<br>3. Dữ liệu trích xuất hoàn toàn không chứa nhận xét hay gán nhãn phán xét đúng/sai của mô hình LLM.<br>*Độ ưu tiên: Must Have · Tác nhân: Hệ thống (tự động) · Quy định liên quan: QĐ2* |
| Là sinh viên, tôi muốn biết mỗi tài liệu tham khảo có thực sự tồn tại hay không để loại bỏ trích dẫn do AI bịa. | **FR-05**<br>Xác minh sự tồn tại của trích dẫn (Lớp 1) | Với từng trích dẫn đã bóc tách, hệ thống chuẩn hóa chuỗi và tính toán mã băm (dấu vân tay trích dẫn) để tra cứu trước trong *Kho trích dẫn ma* và *Danh sách trích dẫn thật đã xác nhận*. Nếu trùng khớp với Kho trích dẫn ma, hệ thống gán ngay nhãn *Mâu thuẫn với nguồn* kèm mã lý do cảnh báo “Đã xác nhận là trích dẫn bịa” mà không cần gọi API ra ngoài. Nếu trùng với Danh sách trích dẫn thật, hệ thống gán nhãn *Đã xác minh* kèm bằng chứng của Moderator. Nếu không trùng, hệ thống tiến hành tra cứu tất định theo DOI hoặc truy vấn tiêu đề trên CrossRef, Semantic Scholar và OpenAlex. Nếu không tìm thấy ở bất kỳ nguồn nào, hệ thống gán nhãn *Chưa xác minh được* với mã lý do cảnh báo cao “Không tìm thấy trên các CSDL học thuật mở” và liệt kê các nguồn đã tra cứu. Nếu DOI trỏ sang một bài viết hoàn toàn khác, hệ thống gán nhãn *Mâu thuẫn với nguồn*.<br>**Tiêu chí kiểm chứng:**<br>1. Trên bộ kiểm thử chuẩn 120 trích dẫn: ít nhất 90% trích dẫn bịa không bị gán nhãn *Đã xác minh*; không quá 5% trích dẫn thật bị gán nhãn khác *Đã xác minh*.<br>2. Trích dẫn đã nằm trong Kho trích dẫn ma được nhận diện chính xác ngay cả khi có sai khác nhỏ về chữ hoa/thường hoặc dấu câu, không phát sinh bất kỳ lệnh gọi API ra CSDL ngoài.<br>3. Khi một trích dẫn không tìm thấy trên cả 3 CSDL, hệ thống gán nhãn *Chưa xác minh được*, tuyệt đối không tự ý gán nhãn *Mâu thuẫn với nguồn* (trừ khi sai DOI hoặc trùng kho ma).<br>*Độ ưu tiên: Must Have · Tác nhân: Hệ thống (tự động) · Quy định liên quan: QĐ4* |
| Là sinh viên, tôi muốn biết trích dẫn sai ở trường nào (tác giả, năm, tạp chí, DOI) để sửa đúng chỗ. | **FR-06**<br>Đối chiếu chi tiết các trường trích dẫn (Lớp 1) | Đối với các trích dẫn tìm thấy bản ghi gốc trên CSDL học thuật mở, hệ thống thực hiện thuật toán so khớp chi tiết từng trường thông tin chính: tên các tác giả, năm xuất bản, tiêu đề bài viết, tên tạp chí/hội nghị và DOI. Nếu tất cả các trường cốt lõi đều trùng khớp (chấp nhận sai khác về cách viết tắt tên tác giả hoặc dấu câu chuẩn hóa), trích dẫn được gán nhãn *Đã xác minh*. Nếu phát hiện có trường bị sai lệch (ví dụ: đúng tên bài nhưng sai năm xuất bản, bịa tên đồng tác giả, hoặc sai tên tạp chí), hệ thống gán nhãn *Mâu thuẫn với nguồn*, đồng thời ghi rõ trường bị sai lệch kèm theo giá trị chính xác trích xuất từ bản ghi gốc để người dùng sửa đổi.<br>**Tiêu chí kiểm chứng:**<br>1. Một bài báo có thật nhưng bị sửa năm xuất bản từ 2020 thành 2024: hệ thống gán nhãn *Mâu thuẫn với nguồn*, chỉ rõ trường “Năm xuất bản” bị sai và hiển thị giá trị đúng là “2020”.<br>2. Tên tác giả viết tắt (ví dụ: “A. Vaswani” so với bản gốc “Ashish Vaswani”) được hệ thống nhận diện là tương đương và vẫn giữ nhãn *Đã xác minh*.<br>*Độ ưu tiên: Must Have · Tác nhân: Hệ thống (tự động) · Quy định liên quan: QĐ4* |
| Là sinh viên, tôi muốn so câu trích nguyên văn với tài liệu gốc để biết câu trích có bị sửa hay không và nằm ở trang nào. | **FR-07**<br>So khớp câu trích với tài liệu nguồn (Lớp 2) | Khi người dùng có tải lên tệp tài liệu nguồn đối chiếu (PDF có lớp văn bản), hệ thống trích xuất nội dung văn bản từ tệp và thực hiện tìm kiếm từng câu trích dẫn nguyên văn trong tài liệu nguồn. Hệ thống thực hiện so khớp chính xác trước, sau đó áp dụng thuật toán so khớp chuỗi gần đúng (Levenshtein distance/RapidFuzz) theo ngưỡng quy định tại QĐ6:<br>**Tiêu chí kiểm chứng:**<br>1. Câu trích hoàn toàn khớp nguyên văn với trang 15 của giáo trình tải lên: hệ thống gán nhãn *Đã xác minh* và ghi chú “Trang 15”.<br>2. Câu trích bị AI cố tình sửa đổi một con số hoặc thay đổi từ khóa quan trọng (độ tương đồng 85%): hệ thống gán nhãn *Mâu thuẫn với nguồn* và tô màu nổi bật đúng vị trí các từ bị sửa.<br>3. Ở chế độ *Học thuật nghiêm ngặt*, câu trích đạt độ tương đồng 92% (dưới ngưỡng 95%) bắt buộc phải bị chuyển sang nhãn *Mâu thuẫn với nguồn*.<br>*Độ ưu tiên: Must Have · Tác nhân: Hệ thống (tự động) · Quy định liên quan: QĐ6, QĐ7* |
| Là sinh viên, tôi muốn được cảnh báo các nhận định chưa có nguồn và được gợi ý tài liệu liên quan để bổ sung trích dẫn. | **FR-08**<br>Đánh dấu nhận định thiếu nguồn và gợi ý tài liệu (Lớp 3) | Đối với các câu nhận định học thuật không được gắn kèm trích dẫn trong văn bản và người dùng không cung cấp tài liệu nguồn đối chiếu, hệ thống tự động gán nhãn *Chưa xác minh được* kèm thông báo cảnh báo “Nhận định chưa có nguồn đối chiếu”. Hệ thống sử dụng 2–4 từ khóa học thuật đã được bóc tách từ nhận định ở bước FR-04 để gửi truy vấn tìm kiếm tự động trên Semantic Scholar và OpenAlex; trả về tối đa 5 tài liệu học thuật liên quan nhất gồm: tiêu đề bài viết, năm công bố, tác giả và liên kết URL/DOI để người dùng tự tra cứu tham khảo. Tuân thủ nghiêm ngặt QĐ5: các tài liệu gợi ý tuyệt đối không làm thay đổi nhãn của nhận định sang *Đã xác minh*, và quy trình gợi ý Lớp 3 không gọi mô hình LLM để phán xét đúng/sai.<br>**Tiêu chí kiểm chứng:**<br>1. Không có bất kỳ nhận định nào đi qua Lớp 3 được hệ thống tự động chuyển sang nhãn *Đã xác minh*.<br>2. Nhật ký hệ thống (System logs) chứng minh Lớp 3 không phát sinh bất kỳ lệnh gọi API nào tới nhà cung cấp LLM.<br>3. Kết quả hiển thị đúng cảnh báo và danh sách tối đa 5 tài liệu gợi ý có liên kết mở được trang bài báo gốc.<br>*Độ ưu tiên: Should Have · Tác nhân: Hệ thống (tự động) · Quy định liên quan: QĐ5* |
| Là sinh viên, tôi muốn xem báo cáo tô màu theo ba nhãn kèm lý do và liên kết nguồn để biết ngay mục nào cần sửa. | **FR-09**<br>Gán nhãn và tổng hợp báo cáo chi tiết | Hệ thống tổng hợp toàn bộ kết quả thẩm tra từ Lớp 1, Lớp 2 và Lớp 3; gán đúng một nhãn học thuật chuẩn và một mã lý do duy nhất cho từng mục theo quy tắc tại QĐ4 và QĐ5. Hệ thống xây dựng giao diện báo cáo trực quan hai phần:<br>**Tiêu chí kiểm chứng:**<br>1. 100% các mục trong văn bản đều được gán đúng một nhãn duy nhất kèm một mã lý do giải thích.<br>2. Tổng số mục thống kê ở thanh tóm tắt bằng chính xác tổng số mục chi tiết bên dưới.<br>3. Thao tác nhấp chuột vào một đoạn tô màu trên văn bản lập tức kích hoạt mở đúng thẻ thông tin chi tiết của mục đó.<br>*Độ ưu tiên: Must Have · Tác nhân: Hệ thống (tự động) · Quy định liên quan: QĐ4, QĐ5* |
| Là giảng viên, tôi muốn chọn chế độ kiểm tra nghiêm ngặt để áp dụng ngưỡng so khớp cao hơn cho bài cần độ chính xác cao. | **FR-10**<br>Tùy chọn chế độ rủi ro kiểm tra | Trước khi tiến hành kiểm tra, hệ thống cho phép người dùng lựa chọn một trong hai chế độ rủi ro: *Thông thường* (Default) hoặc *Học thuật nghiêm ngặt* (Strict Academic). Chế độ được chọn sẽ lưu cùng lượt kiểm tra và thể hiện rõ trên báo cáo. Ở chế độ *Học thuật nghiêm ngặt*, ngưỡng so khớp câu trích nguyên văn được nâng lên 95% (theo QĐ6) và toàn bộ các mục có nhãn khác *Đã xác minh* được tự động đưa lên đầu danh mục báo cáo thành “Danh sách cần xử lý khẩn cấp”. Tuân thủ tuyệt đối quy định QĐ7: cả hai chế độ đều hiển thị đầy đủ 100% các mục, không có chế độ nào được ẩn mục khỏi báo cáo hoặc tệp PDF xuất ra.<br>**Tiêu chí kiểm chứng:**<br>1. Cùng một văn bản đầu vào, báo cáo xuất ra ở cả hai chế độ có tổng số lượng mục hoàn toàn bằng nhau (không mục nào bị ẩn).<br>2. Ở chế độ *Học thuật nghiêm ngặt*, câu trích đạt độ tương đồng 92% bị gán nhãn *Mâu thuẫn với nguồn*, và toàn bộ mục *Mâu thuẫn với nguồn* cùng *Chưa xác minh được* được gom lên đầu báo cáo.<br>3. Thông tin tên chế độ rủi ro được in rõ ràng trên giao diện báo cáo, tệp xuất PDF và danh sách lịch sử.<br>*Độ ưu tiên: Should Have · Tác nhân: Sinh viên (STK-02), Giảng viên (STK-03) · Quy định liên quan: QĐ7* |
| **Nhóm 3: Kết quả và lịch sử** |  |  |
| Là sinh viên, tôi muốn xuất báo cáo ra tệp PDF để nộp kèm bài làm minh chứng. | **FR-11**<br>Xuất báo cáo kết quả định dạng PDF | Hệ thống cho phép người dùng đã đăng nhập xuất toàn bộ kết quả kiểm tra thành một tệp tài liệu PDF độc lập, phục vụ lưu trữ hoặc đính kèm làm minh chứng khi nộp bài học thuật. Tệp PDF được định dạng trang nghiêm, hiển thị đầy đủ thông tin: Mã định danh lượt kiểm tra (Check ID), thời điểm kiểm tra, tên tài khoản, chế độ rủi ro áp dụng; khối thống kê tóm tắt số lượng mục theo 3 nhãn; danh sách chi tiết từng mục gồm nhãn trạng thái, trích đoạn văn bản, mã lý do, liên kết nguồn gốc mở được và đoạn văn bản đối chiếu; mã phản hồi nhanh (QR Code) để tra cứu xác thực báo cáo trên hệ thống. Tuân thủ QĐ7, tệp PDF không ẩn bất kỳ mục nào.<br>**Tiêu chí kiểm chứng:**<br>1. Tệp PDF xuất ra hiển thị tiếng Việt hoàn toàn đúng font chữ, không lỗi dấu hoặc định dạng bảng.<br>2. Số lượng mục, trạng thái nhãn và mã lý do trong tệp PDF khớp chính xác 100% với giao diện báo cáo web.<br>3. Các đường link liên kết nguồn ngoài trong tệp PDF có thể nhấp chuột trực tiếp để mở trình duyệt tới trang gốc.<br>*Độ ưu tiên: Must Have · Tác nhân: Sinh viên (STK-02), Giảng viên (STK-03) · Quy định liên quan: QĐ7* |
| Là sinh viên, tôi muốn xem lại và xóa các lượt kiểm tra cũ để theo dõi việc sửa bài và kiểm soát dữ liệu của mình. | **FR-12**<br>Quản lý và tra cứu lịch sử kiểm tra cá nhân | Hệ thống tự động lưu trữ thông tin các lượt kiểm tra của người dùng đã đăng nhập vào lịch sử cá nhân. Người dùng có thể xem danh sách lịch sử gồm: thời điểm kiểm tra, tên tệp/tiêu đề lượt kiểm tra, chế độ rủi ro, tóm tắt số lượng mục theo từng nhãn; cho phép nhấp vào để mở lại báo cáo chi tiết hoặc tải lại tệp PDF. Người dùng có quyền chủ động xóa một lượt kiểm tra khỏi lịch sử. Tuân thủ QĐ8, các tệp văn bản và tài liệu nguồn tải lên sẽ được tiến trình nền của hệ thống tự động xóa vĩnh viễn sau 30 ngày (chỉ giữ lại dữ liệu siêu dữ liệu báo cáo), hoặc xóa ngay lập tức khi người dùng xóa lượt kiểm tra. Đảm bảo tính riêng tư tuyệt đối: người dùng A không thể xem lịch sử của người dùng B.<br>**Tiêu chí kiểm chứng:**<br>1. Người dùng A đăng nhập không thể thấy hoặc truy cập vào bất kỳ lượt kiểm tra nào của người dùng B (kể cả khi cố tình nhập ID trên thanh địa chỉ URL).<br>2. Khi người dùng bấm xóa một lượt kiểm tra, toàn bộ bản ghi báo cáo và tệp đính kèm trên máy chủ bị xóa vĩnh viễn, không thể khôi phục hay truy cập lại.<br>3. Tiến trình dọn dẹp chạy định kỳ quét và xóa thành công các tệp tài liệu lưu trữ có thời gian quá 30 ngày.<br>*Độ ưu tiên: Must Have · Tác nhân: Sinh viên (STK-02), Giảng viên (STK-03) · Quy định liên quan: QĐ8* |
| Là giảng viên, tôi muốn kiểm tra cùng lúc nhiều bài nộp của lớp để phát hiện nhanh bài có trích dẫn ngụy tạo. | **FR-13**<br>Kiểm tra bài nộp hàng loạt cho giảng viên | Hệ thống cung cấp giao diện riêng cho tài khoản có vai trò Giảng viên cho phép chọn và tải lên đồng thời tối đa 30 tệp bài nộp của học viên (định dạng PDF hoặc DOCX) trong một đợt kiểm tra theo quy định QĐ3. Hệ thống tiếp nhận gói tệp, sinh tác vụ nền và xử lý tuần tự/song song qua hàng đợi Celery, hiển thị thanh tiến độ phần trăm theo thời gian thực trên màn hình. Khi hoàn tất, hệ thống trả về bảng tổng hợp kết quả toàn lớp gồm: Tên học viên/tên tệp bài nộp, tổng số trích dẫn, số mục *Mâu thuẫn với nguồn*, số mục *Chưa xác minh được*, số mục *Đã xác minh*, và nút bấm mở xem báo cáo chi tiết hoặc xuất PDF riêng cho từng bài. Đảm bảo nguyên tắc cô lập lỗi: một tệp bị lỗi định dạng hoặc hỏng không làm dừng quá trình xử lý của các tệp còn lại trong danh sách.<br>**Tiêu chí kiểm chứng:**<br>1. Giảng viên tải lên danh sách 30 tệp bài nộp, hệ thống tiếp nhận và khởi tạo tiến trình xử lý nền thành công.<br>2. Giả lập đưa vào 1 tệp bị hỏng (corrupted PDF) trong gói 10 tệp: hệ thống đánh dấu tệp đó bị lỗi, 9 tệp còn lại vẫn được xử lý hoàn tất và hiển thị kết quả bình thường trên bảng tổng hợp.<br>3. Bảng tổng hợp hiển thị đầy đủ thống kê của từng bài nộp và cho phép nhấp mở xem báo cáo chi tiết từng bài.<br>*Độ ưu tiên: Should Have · Tác nhân: Giảng viên (STK-03) · Quy định liên quan: QĐ3* |
| **Nhóm 4: Phản hồi và kiểm duyệt** |  |  |
| Là sinh viên, tôi muốn báo lại kết quả mà tôi cho là sai, kèm bằng chứng, để kết quả được xem xét và sửa. | **FR-14**<br>Báo lỗi kết quả kiểm tra | Tại giao diện xem báo cáo kết quả chi tiết, bên cạnh mỗi mục (trích dẫn, câu trích) hệ thống cung cấp nút bấm “Báo kết quả sai”. Khi nhấp vào, hệ thống hiển thị hộp thoại cho phép người dùng chọn phân loại lỗi (*Nhãn sai*, *Nguồn đối chiếu sai*, *Khác*), nhập đoạn văn bản giải trình lý do và đính kèm đường dẫn (URL) hoặc tệp minh chứng xác thực. Sau khi gửi, yêu cầu báo lỗi được ghi nhận vào hàng đợi kiểm duyệt với trạng thái “Chờ duyệt”. Tuân thủ QĐ10, việc gửi báo lỗi không làm thay đổi kết quả kiểm tra tức thì; người báo lỗi nhận được mã theo dõi và nhận thông báo khi có kết quả duyệt từ Moderator.<br>**Tiêu chí kiểm chứng:**<br>1. Người dùng gửi báo lỗi thành công kèm lý do và chứng cứ; trạng thái báo lỗi được ghi nhận vào hệ thống là “Chờ duyệt”.<br>2. Báo cáo kiểm tra của lượt đó không bị tự ý thay đổi nhãn hay nội dung ngay sau khi gửi báo lỗi.<br>3. Người dùng có thể theo dõi danh sách các phản hồi báo lỗi của mình và trạng thái xử lý trong mục thông báo cá nhân.<br>*Độ ưu tiên: Should Have · Tác nhân: Sinh viên (STK-02), Giảng viên (STK-03) · Quy định liên quan: QĐ10* |
| Là moderator, tôi muốn duyệt các báo lỗi và cập nhật kho trích dẫn ma, danh sách trích dẫn thật để các lượt kiểm tra sau chính xác hơn. | **FR-15**<br>Kiểm duyệt báo lỗi và quản lý kho trích dẫn | Hệ thống cung cấp bảng điều khiển dành riêng cho vai trò Moderator để quản lý hàng đợi các phản hồi báo lỗi từ người dùng. Moderator có thể xem chi tiết nội dung mục bị báo lỗi, giải trình của người dùng, bằng chứng đính kèm và bản ghi nguồn của hệ thống. Moderator thực hiện thẩm định và đưa ra quyết định:<br>**Tiêu chí kiểm chứng:**<br>1. Khi Moderator duyệt chấp nhận một trích dẫn là bịa, thực hiện kiểm tra lại chính trích dẫn đó trong một lượt mới: hệ thống gán ngay nhãn *Mâu thuẫn với nguồn* với cảnh báo “Trùng khớp Kho trích dẫn ma”, không phát sinh gọi CSDL ngoài.<br>2. Khi Moderator duyệt chấp nhận một trích dẫn có thật bị báo nhầm, trích dẫn đó được ghi nhận vào Danh sách trích dẫn thật; lượt kiểm tra mới lập tức gán nhãn *Đã xác minh*.<br>3. Nhật ký kiểm toán ghi nhận đầy đủ ID người duyệt, thời điểm chính xác và lý do duyệt cho từng hành động.<br>*Độ ưu tiên: Should Have · Tác nhân: Moderator (STK-05) · Quy định liên quan: QĐ10* |
| **Nhóm 5: Quản trị hệ thống** |  |  |
| Là quản trị viên, tôi muốn quản lý tài khoản, phân vai và hạn mức để hệ thống được dùng đúng mục đích và không quá tải. | **FR-16**<br>Quản lý người dùng và hạn mức | Hệ thống cung cấp giao diện quản trị cho phép Quản trị viên tra cứu danh sách người dùng, xem chi tiết thông tin tài khoản, thực hiện thao tác khóa hoặc mở khóa tài khoản người dùng, cấp hoặc thu hồi các vai trò đặc quyền (Giảng viên, Moderator). Quản trị viên có quyền cấu hình hạn mức kiểm tra linh hoạt (số lượt kiểm tra tối đa trong ngày, số lượng trích dẫn tối đa trong một lượt) áp dụng chung theo từng nhóm vai trò hoặc áp dụng riêng biệt cho từng tài khoản cá biệt. Khi người dùng đạt tới hạn mức cho phép, hệ thống từ chối tạo lượt kiểm tra mới và gửi thông báo giải thích rõ ràng; các lượt kiểm tra bị lỗi hệ thống nội bộ tuyệt đối không bị khấu trừ vào hạn mức của người dùng.<br>**Tiêu chí kiểm chứng:**<br>1. Tài khoản bị Quản trị viên khóa không thể đăng nhập vào hệ thống; phiên làm việc hiện tại (nếu có) bị vô hiệu hóa ngay lập tức.<br>2. Quản trị viên thay đổi hạn mức của Sinh viên từ 10 lượt/ngày thành 15 lượt/ngày: chính sách mới có hiệu lực ngay lập tức ở lượt kiểm tra kế tiếp của người dùng.<br>3. Một lượt kiểm tra bị lỗi do máy chủ LLM quá tải không làm giảm số lượt kiểm tra còn lại trong ngày của người dùng.<br>*Độ ưu tiên: Should Have · Tác nhân: Quản trị viên (STK-06) · Quy định liên quan: QĐ1, QĐ2, QĐ3* |
| Là quản trị viên, tôi muốn xem thống kê lượt kiểm tra và chi phí API để kiểm soát ngân sách vận hành. | **FR-17**<br>Thống kê lượt kiểm tra và giám sát chi phí API | Hệ thống cung cấp trang thống kê trực quan (Dashboard) cho Quản trị viên theo dõi hoạt động vận hành theo mốc thời gian (hôm nay, 7 ngày qua, 30 ngày qua hoặc khoảng ngày tùy chọn): tổng số lượt kiểm tra đã thực hiện; biểu đồ phân bố số lượng mục theo 3 nhãn (*Đã xác minh*, *Chưa xác minh được*, *Mâu thuẫn với nguồn*); tổng số lượng token LLM đã tiêu thụ và ước tính chi phí quy đổi (USD / VNĐ) so với ngân sách định mức; tần suất và tỷ lệ thành công/lỗi khi gọi các CSDL học thuật mở (CrossRef, Semantic Scholar, OpenAlex). Hệ thống tự động kích hoạt cảnh báo nổi bật trên trang quản trị khi chi phí tiêu thụ token LLM chạm ngưỡng 80% ngân sách trần quy định.<br>**Tiêu chí kiểm chứng:**<br>1. Số liệu thống kê token LLM trên giao diện quản trị khớp chính xác với tổng số token ghi nhận trong nhật ký gọi API hệ thống trong cùng khoảng thời gian.<br>2. Khi chi phí tích lũy giả lập vượt 80% ngân sách (ví dụ vượt 8 USD trên ngân sách 10 USD), giao diện quản trị tự động xuất hiện cảnh báo viền đỏ nổi bật.<br>*Độ ưu tiên: Could Have · Tác nhân: Quản trị viên (STK-06) · Quy định liên quan: Không có* |

#### Biểu mẫu nghiệp vụ

##### Biểu mẫu BM1: Biểu mẫu nhập kiểm tra mới (Form nhập kiểm tra)

Biểu mẫu BM1 quy định cấu trúc và ràng buộc dữ liệu tại màn hình Khởi tạo lượt kiểm tra mới (Use Case U004, U005), mô tả chi tiết tại Bảng 3.5.

**Bảng 3.5.** *Đặc tả biểu mẫu BM1 – Form nhập kiểm tra mới*

| **STT** | **Tên trường dữ liệu** | **Kiểu dữ liệu** | **Bắt buộc** | **Giá trị mặc định** | **Quy tắc và Ràng buộc dữ liệu** |
|---|---|---|---|---|---|
| 1 | **Tiêu đề đợt kiểm tra** | Text | Không | “Kiểm tra ngày dd/mm/yyyy” | Độ dài từ 1 đến 150 ký tự; dùng để hiển thị gợi nhớ trong danh sách lịch sử cá nhân. |
| 2 | **Hình thức nhập dữ liệu** | Radio Button | Có | “Dán văn bản” | Một trong hai lựa chọn: `Dán văn bản` hoặc `Tải tệp văn bản`. |
| 3 | **Khung dán văn bản kiểm tra** | Text Area | Điều kiện | Trống | Bắt buộc nếu chọn hình thức “Dán văn bản”; độ dài không quá 10.000 từ; chứa văn bản học thuật hoặc danh mục tham khảo. |
| 4 | **Tệp văn bản kiểm tra tải lên** | File Upload | Điều kiện | Trống | Bắt buộc nếu chọn “Tải tệp văn bản”; chấp nhận định dạng `.pdf`, `.docx`, `.txt`; dung lượng tệp tối đa 10 MB (theo QĐ2). |
| 5 | **Tệp tài liệu nguồn đối chiếu** | File Upload | Không | Trống | Tùy chọn, có thể chọn nhiều tệp; chấp nhận `.pdf` có lớp văn bản (text layer), `.docx`, `.txt`; mỗi tệp tối đa 10 MB; dùng để thực hiện đối chiếu câu trích nguyên văn ở Lớp 2. |
| 6 | **Chế độ rủi ro kiểm tra** | Dropdown / Radio | Có | “Thông thường” | Chọn một trong hai giá trị: `Thông thường` (ngưỡng khớp câu trích 90%) hoặc `Học thuật nghiêm ngặt` (ngưỡng 95%, ưu tiên mục cần xử lý theo QĐ7). |
| 7 | **Xác nhận gửi dữ liệu tới LLM** | Checkbox | Có | Chưa chọn (False) | Bắt buộc phải đánh dấu chọn (True) để xác nhận người dùng đã đọc và đồng ý việc văn bản sẽ được chuyển tới dịch vụ LLM bên ngoài để bóc tách thông tin. |

##### Biểu mẫu BM2: Biểu mẫu báo cáo kết quả kiểm tra

Biểu mẫu BM2 quy định cấu trúc dữ liệu xuất bản và hiển thị trên màn hình Báo cáo kết quả kiểm tra (U006) và Báo cáo PDF xuất ra (U007), mô tả chi tiết tại Bảng 3.6.

**Bảng 3.6.** *Đặc tả biểu mẫu BM2 – Báo cáo kết quả kiểm tra VeriCite*

| **Thành phần báo cáo** | **Tên trường dữ liệu** | **Ý nghĩa và Quy cách hiển thị** |
|---|---|---|
| **Phần 1: Thông tin chung (Header)** | Mã lượt kiểm tra (Check ID) | Mã chuỗi định danh duy nhất (UUID), ví dụ: `VC-2026-04821`. |
|  | Thời điểm thực hiện | Ngày giờ hoàn tất kiểm tra theo định dạng chuẩn `dd/mm/yyyy hh:mm:ss`. |
|  | Người thực hiện | Tên hiển thị và email tài khoản người dùng đã đăng nhập. |
|  | Tên tài liệu / Tiêu đề lượt | Tên tệp đã tải lên hoặc tiêu đề do người dùng tự đặt. |
|  | Chế độ rủi ro áp dụng | Thể hiện rõ một trong hai nhãn: `Thông thường` hoặc `Học thuật nghiêm ngặt`. |
|  | Tài liệu nguồn đối chiếu | Tên tệp tài liệu nguồn đã dùng (hoặc ghi rõ “Không cung cấp”). |
| **Phần 2: Tóm tắt chỉ số (Summary)** | Tổng số mục đã kiểm chứng | Tổng số lượng trích dẫn, câu trích và nhận định được phát hiện (N). |
|  | Số lượng & Tỷ lệ *Đã xác minh* | Số lượng mục và tỷ lệ % mang nhãn xanh lá. |
|  | Số lượng & Tỷ lệ *Chưa xác minh được* | Số lượng mục và tỷ lệ % mang nhãn vàng/cam. |
|  | Số lượng & Tỷ lệ *Mâu thuẫn với nguồn* | Số lượng mục và tỷ lệ % mang nhãn đỏ. |
| **Phần 3: Trực quan hóa văn bản** | Khung văn bản tô màu | Toàn văn bản gốc được phân đoạn và tô màu nền trực tiếp theo 3 màu nhãn; cho phép nhấp chuột để cuộn xuống bảng chi tiết. |
| **Phần 4: Danh mục chi tiết từng mục** | Số thứ tự & Vị trí mục | Thứ tự mục (Mục #01, #02…) và vị trí chỉ số ký tự trong văn bản. |
|  | Phân loại mục | Loại thực thể: `Trích dẫn`, `Câu trích nguyên văn`, hoặc `Nhận định học thuật`. |
|  | Nội dung trích xuất | Chuỗi văn bản gốc trích xuất từ bài nộp. |
|  | Nhãn trạng thái kiểm chứng | Một trong 3 nhãn: *Đã xác minh*, *Chưa xác minh được*, *Mâu thuẫn với nguồn*. |
|  | Lớp kiểm chứng thực hiện | Chỉ rõ lớp nghiệp vụ đã xử lý: `Lớp 1 (CSDL học thuật)`, `Lớp 2 (So khớp nguồn)`, hoặc `Lớp 3 (Gợi ý tài liệu)`. |
|  | Mã lý do & Giải thích chi tiết | Mã lý do chuẩn (ví dụ: `C01: Khớp bản ghi CSDL`, `C04: Sai lệch năm xuất bản`, `Q02: Câu trích sai lệch từ ngữ`, `N01: Không tìm thấy nguồn`) kèm câu giải thích bằng tiếng Việt. |
|  | Dữ liệu đối chiếu & Tô sáng khác biệt | Đối với trích dẫn: hiển thị giá trị trường đúng từ bản ghi gốc.<br>Đối với câu trích: hiển thị đoạn văn bản nguồn và tô màu nổi bật các từ bị thay đổi/sai lệch.<br>Đối với nhận định: hiển thị danh sách tối đa 5 tài liệu gợi ý tham khảo. |
|  | Liên kết kiểm chứng (Source URL) | Đường dẫn URL/DOI mở trực tiếp bản ghi trên CrossRef, Semantic Scholar hoặc OpenAlex. |
|  | Thao tác phản hồi | Nút bấm “Báo kết quả sai” dẫn tới hộp thoại báo lỗi (FR-14). |
| **Phần 5: Xác thực & Điều hướng** | Mã QR xác thực báo cáo | Mã QR Code chứa đường dẫn trực tiếp xác thực tính toàn vẹn của báo cáo trên máy chủ VeriCite (dành riêng cho bản PDF). |
|  | Nút xuất tệp PDF | Nút bấm tải về bản PDF chính thức theo chuẩn BM2. |

### 3.2.2 Đặc tả yêu cầu phi chức năng

Hệ thống VeriCite có 11 yêu cầu phi chức năng (NFR-01 đến NFR-11), mỗi yêu cầu có chỉ tiêu đo được, trình bày theo cùng ba cột tại Bảng 3.7.

**Bảng 3.7.** *Danh sách yêu cầu phi chức năng (NFR-01 đến NFR-11)*

| User Story | Requirement | Details |
|---|---|---|
| Là sinh viên, tôi muốn nhận kết quả kiểm tra trong khoảng nửa phút để không phải chờ lâu. | **NFR-01**<br>Thời gian xử lý kiểm tra | Trong bối cảnh người dùng chờ đợi kết quả trực tiếp trên màn hình trình duyệt, một lượt kiểm tra thông thường gồm 20 trích dẫn (không tính thời gian chạy Lớp 3) phải hoàn tất toàn bộ quy trình bóc tách và đối chiếu trong thời gian không quá 30 giây. Trong suốt thời gian xử lý, giao diện phải hiển thị thanh tiến độ sinh động phản ánh các công đoạn đang diễn ra (Bóc tách văn bản → Tra cứu CSDL học thuật → So khớp tài liệu nguồn → Tổng hợp báo cáo).<br>**Tiêu chí kiểm chứng:**<br>1. Chạy thử nghiệm 20 lượt kiểm tra độc lập, mỗi lượt chứa 20 trích dẫn học thuật với bộ nhớ đệm Redis ở trạng thái trống: có ít nhất 19/20 lượt (tỷ lệ ≥ 95%) hoàn tất và hiển thị báo cáo đầy đủ trong thời gian ≤ 30 giây.<br>*Phân nhóm: Hiệu năng hệ thống (Performance) · Mức độ ưu tiên: Must Have* |
| Là giảng viên, tôi muốn kết quả đủ chính xác để dùng làm căn cứ khi đánh giá bài nộp. | **NFR-02**<br>Độ chính xác phát hiện trích dẫn | Hệ thống phải đạt độ tin cậy khoa học cao trong việc phân biệt giữa trích dẫn có thật và trích dẫn do AI bịa đặt. Trên bộ dữ liệu kiểm thử chuẩn gồm 120 trích dẫn (60 trích dẫn có thật từ nhiều nguồn bài báo, sách, giáo trình tiếng Việt và 60 trích dẫn ảo giác do ChatGPT/Claude tự tạo ra), hệ thống phải phát hiện và ngăn chặn việc gán nhãn sai lệch.<br>**Tiêu chí kiểm chứng:**<br>1. Tỷ lệ phát hiện trích dẫn bịa (Recall trên tập trích dẫn ảo giác): ít nhất 90% trích dẫn bịa (tối thiểu 54/60 mục) không bị gán nhãn nhầm thành *Đã xác minh*.<br>2. Tỷ lệ báo nhầm trích dẫn thật (False Positive Rate): không vượt quá 5% số trích dẫn có thật (tối đa 3/60 mục) bị gán nhãn thành *Mâu thuẫn với nguồn*.<br>3. Kết quả kiểm thử trên toàn bộ tập dữ liệu mẫu được nghiệm thu và xác nhận đạt chỉ tiêu tại mốc đồ án M4.<br>*Phân nhóm: Chất lượng phần mềm (Accuracy & Quality) · Mức độ ưu tiên: Must Have* |
| Là quản trị viên, tôi muốn hệ thống vẫn ổn định khi cả lớp cùng sử dụng một lúc. | **NFR-03**<br>Khả năng chịu tải đồng thời | Hệ thống phải đáp ứng ổn định nhu cầu truy cập cùng lúc của quy mô một lớp học đại học (tương đương 30 sinh viên cùng truy cập và thực hiện kiểm tra trước thời hạn nộp bài). Các lượt kiểm tra dài hoặc kiểm tra hàng loạt được điều phối xử lý qua hàng đợi tác vụ nền Celery để đảm bảo máy chủ không bị nghẽn và giao diện người dùng luôn phản hồi mượt mà.<br>**Tiêu chí kiểm chứng:**<br>1. Thực hiện kiểm thử tải (Stress test) giả lập 30 phiên người dùng tương tác đồng thời liên tục trong 10 phút: tỷ lệ lỗi HTTP 5xx đạt 0%, và ít nhất 95% các yêu cầu điều hướng giao diện có thời gian phản hồi dưới 3 giây.<br>*Phân nhóm: Hiệu năng & Khả năng chịu tải (Scalability & Concurrency) · Mức độ ưu tiên: Should Have* |
| Là người dùng, tôi muốn mật khẩu và dữ liệu truyền đi được bảo vệ để tài khoản không bị chiếm đoạt. | **NFR-04**<br>Bảo mật truyền tải và mật khẩu | Toàn bộ các kết nối truyền thông giữa máy khách và máy chủ bắt buộc phải được mã hóa qua HTTPS với giao thức TLS 1.2 trở lên, cấu hình chuyển hướng tự động toàn bộ lưu lượng HTTP sang HTTPS. Mật khẩu người dùng tuyệt đối không được lưu dưới dạng văn bản thô (plain-text), chỉ được lưu trữ dưới dạng chuỗi băm bằng thuật toán Argon2id với độ phức tạp cao kèm salt ngẫu nhiên riêng cho từng tài khoản. Áp dụng cơ chế khóa tạm thời tài khoản 15 phút sau 5 lần đăng nhập thất bại liên tiếp nhằm chống tấn công vét cạn.<br>**Tiêu chí kiểm chứng:**<br>1. Quét an toàn giao thức HTTPS bằng công cụ chuyên dụng (SSL Labs hoặc testssl.sh) đạt điểm đánh giá từ cấp A trở lên.<br>2. Kiểm tra trực tiếp trong bảng `users` của cơ sở dữ liệu PostgreSQL: 100% bản ghi mật khẩu đều là chuỗi băm định dạng `argon2id`.<br>3. Giả lập kịch bản tấn công gửi 6 yêu cầu đăng nhập sai mật khẩu liên tiếp: tài khoản bị khóa lập tức tại lần thứ 5 và từ chối xử lý ở lần thứ 6 trong vòng 15 phút.<br>*Phân nhóm: An toàn thông tin (Security) · Mức độ ưu tiên: Must Have* |
| Là sinh viên, tôi muốn tài liệu tải lên chỉ mình tôi truy cập được và được xóa sau thời hạn quy định. | **NFR-05**<br>Bảo vệ tài liệu và kiểm soát truy cập | Bài nộp và tài liệu học thuật của người dùng là tài sản học thuật riêng tư. Hệ thống thực thi phân quyền truy cập nghiêm ngặt ở tầng cơ sở dữ liệu và API: người dùng A tuyệt đối không thể đọc, chỉnh sửa hoặc xóa tệp và báo cáo kiểm tra của người dùng B. Tệp văn bản kiểm tra và tài liệu nguồn tải lên máy chủ sẽ được tiến trình tự động dọn dẹp xóa vĩnh viễn sau 30 ngày hoặc ngay khi người dùng chủ động xóa lượt kiểm tra. Khi gửi văn bản tới dịch vụ LLM để bóc tách, hệ thống tuyệt đối loại bỏ các trường định danh cá nhân (tên người dùng, email, mã số sinh viên).<br>**Tiêu chí kiểm chứng:**<br>1. Người dùng A sử dụng mã Check ID của người dùng B để gọi trực tiếp API `GET /api/reports/{id}`: máy chủ chặn đứng và trả về mã lỗi HTTP 403 Forbidden hoặc 404 Not Found, đồng thời ghi log cảnh báo an ninh.<br>2. Rà soát toàn bộ nhật ký gói tin gửi sang API của nhà cung cấp LLM: 100% nội dung không chứa chuỗi ký tự thể hiện email hoặc họ tên của người dùng.<br>*Phân nhóm: Quyền riêng tư và bảo mật dữ liệu (Privacy & Access Control) · Mức độ ưu tiên: Must Have* |
| Là sinh viên, tôi muốn biết vì sao một mục bị gán nhãn để tự kiểm tra lại kết quả. | **NFR-06**<br>Tính minh bạch của kết quả | Mọi kết luận gán nhãn đưa ra trên hệ thống VeriCite đều phải minh bạch và có căn cứ khoa học rõ ràng, giúp người dùng hiểu chính xác vì sao một mục bị coi là lỗi để tự đối chiếu lại. Mỗi mục được phân tích bắt buộc phải có mã lý do giải thích bằng tiếng Việt, ghi rõ lớp nghiệp vụ đã kiểm chứng và liên kết mở trực tiếp tới nguồn tham khảo hoặc trích đoạn đối chiếu trong tệp gốc. Mỗi lượt kiểm tra đều lưu kèm siêu dữ liệu về phiên bản prompt bóc tách, phiên bản mô hình LLM và dấu thời gian tra cứu CSDL để phục vụ việc tái hiện giải trình khi có khiếu nại.<br>**Tiêu chí kiểm chứng:**<br>1. Lấy mẫu ngẫu nhiên 50 mục kết quả bất kỳ trong cơ sở dữ liệu: 100% mục đều có đầy đủ mã lý do, mô tả lý do bằng tiếng Việt và chỉ định rõ lớp kiểm chứng (Lớp 1, 2 hoặc 3).<br>2. 100% các mục mang nhãn *Đã xác minh* ở Lớp 1 đều chứa liên kết URL/DOI truy cập được tới bản ghi thư tịch gốc của bài báo.<br>*Phân nhóm: Khả năng truy vết và giải thích (Traceability & Explainability) · Mức độ ưu tiên: Must Have* |
| Là giảng viên, tôi muốn kiểm tra lại cùng một bài cho ra cùng kết quả để có thể tin vào kết quả đó. | **NFR-07**<br>Tính tái lập của lớp tất định | Để đảm bảo tính công bằng và nhất quán trong học thuật, các lớp kiểm chứng cốt lõi của hệ thống (Lớp 1: Tra cứu CSDL học thuật; Lớp 2: So khớp câu trích; Lớp 3: Tìm kiếm tài liệu gợi ý) bắt buộc phải hoạt động theo nguyên tắc tất định (Deterministic), tuyệt đối không gọi mô hình LLM để phán xét suy luận đúng/sai. Với cùng một tập đầu vào đã bóc tách và cùng dữ liệu nguồn đối chiếu, việc chạy lại quy trình kiểm chứng phải luôn cho ra kết quả gán nhãn và mã lý do trùng khớp 100%.<br>**Tiêu chí kiểm chứng:**<br>1. Chạy lặp lại 3 lần trên cùng một bộ dữ liệu 50 trích dẫn với trạng thái lưu đệm cố định: 100% kết quả phân loại nhãn và mã lý do ở cả 3 lần chạy hoàn toàn trùng khớp từng ký tự.<br>2. Kiểm tra toàn bộ mã nguồn và nhật ký thực thi của Lớp 1, Lớp 2 và Lớp 3: xác nhận không có bất kỳ dòng lệnh nào khởi tạo kết nối hay gửi prompt tới API LLM.<br>*Phân nhóm: Độ tin cậy hệ thống (Reliability & Determinism) · Mức độ ưu tiên: Must Have* |
| Là sinh viên, tôi không muốn trích dẫn thật bị quy là bịa chỉ vì dịch vụ bên ngoài gặp sự cố. | **NFR-08**<br>Khả năng chịu lỗi dịch vụ bên ngoài | Hệ thống phải vận hành ổn định trước các sự cố thường gặp từ dịch vụ bên thứ ba (CSDL học thuật ngoài bị nghẽn mạng, quá tải giới hạn tần suất 429 Too Many Requests, lỗi máy chủ 503 Service Unavailable, hoặc API LLM bị quá thời gian chờ Timeout). Khi gặp lỗi CSDL học thuật, hệ thống kích hoạt cơ chế thử lại có giãn cách (Exponential Backoff); nếu vẫn thất bại, hệ thống gán nhãn *Chưa xác minh được* với lý do “Không thể kết nối CSDL ngoài để tra cứu”, tuyệt đối không bao giờ suy diễn trích dẫn là bịa đặt. Khi dịch vụ LLM gặp lỗi không thể bóc tách, toàn bộ lượt kiểm tra chuyển sang trạng thái “Lỗi xử lý” và hoàn lại hạn mức cho người dùng, không tạo ra dữ liệu kết quả dở dang.<br>**Tiêu chí kiểm chứng:**<br>1. Giả lập ngắt kết nối hoặc phản hồi lỗi HTTP 503 từ máy chủ CrossRef: trích dẫn liên quan được ghi nhận mã lý do “Sự cố kết nối CSDL”, nhãn giữ nguyên là *Chưa xác minh được*, không bị gán nhãn *Mâu thuẫn với nguồn*.<br>2. Giả lập thời gian chờ gọi LLM vượt quá 60 giây (Timeout): lượt kiểm tra được đánh dấu trạng thái thất bại, không phát sinh dữ liệu rác trong bảng kết quả và hạn mức của người dùng không bị khấu trừ.<br>*Phân nhóm: Độ tin cậy và khả năng chịu lỗi (Fault Tolerance) · Mức độ ưu tiên: Must Have* |
| Là người dùng mới, tôi muốn tự dùng được hệ thống bằng tiếng Việt, kể cả trên điện thoại. | **NFR-09**<br>Khả năng sử dụng và giao diện | Toàn bộ giao diện người dùng được thiết kế bằng tiếng Việt chuẩn xác, giao diện hiện đại, trực quan, hỗ trợ thiết kế thích ứng (Responsive) hiển thị mượt mà trên màn hình máy tính để bàn, máy tính bảng và điện thoại di động (độ phân giải chiều rộng từ 360px trở lên). Bố cục giao diện đơn giản, rõ ràng, cho phép người dùng mới lần đầu tiếp cận có thể dễ dàng hiểu cách nhập dữ liệu kiểm tra và đọc hiểu tường tận báo cáo kết quả mà không cần phải đọc tài liệu hướng dẫn sử dụng.<br>**Tiêu chí kiểm chứng:**<br>1. Tiến hành thử nghiệm chấp nhận người dùng (UAT) trên nhóm 10 sinh viên chưa từng sử dụng VeriCite: ít nhất 8/10 sinh viên tự hoàn thành một lượt kiểm tra văn bản và giải thích được ý nghĩa 3 nhãn màu trên báo cáo kết quả trong vòng dưới 5 phút mà không cần bất kỳ sự trợ giúp nào.<br>2. Giao diện hiển thị đúng chuẩn, không bị vỡ khung hay lỗi bố cục trên hai phiên bản phát hành gần nhất của các trình duyệt Chrome, Edge, Firefox và Safari.<br>*Phân nhóm: Khả dụng và trải nghiệm người dùng (Usability) · Mức độ ưu tiên: Should Have* |
| Là quản trị viên, tôi muốn chi phí gọi API được giữ ở mức thấp để vận hành trong ngân sách của nhóm. | **NFR-10**<br>Kiểm soát chi phí gọi API | Do ngân sách tài chính đồ án có hạn (ngân sách tiền mặt khoảng 1 triệu đồng, tương đương khoảng 40 USD), hệ thống phải áp dụng triệt để các biện pháp kỹ thuật nhằm tối ưu hóa chi phí gọi API. Hệ thống áp dụng cơ chế lưu đệm Redis cho mọi kết quả tra cứu CSDL học thuật (với thời gian TTL hợp lý) để tránh gọi trùng lặp; chỉ sử dụng LLM duy nhất ở bước bóc tách văn bản thô theo prompt ngắn gọn; Lớp 3 chỉ thực hiện truy vấn khi nhận định hoàn toàn không có nguồn. Toàn bộ chi phí tiêu thụ token LLM trong suốt các giai đoạn phát triển và kiểm thử đồ án bắt buộc phải được kiểm soát không vượt quá 10 USD. Thiết lập giới hạn chi tiêu cứng (Hard limit) trên trang quản trị của nhà cung cấp LLM để ngăn ngừa rủi ro vượt ngân sách ngoài ý muốn.<br>**Tiêu chí kiểm chứng:**<br>1. Báo cáo thống kê chi phí API tại mốc nghiệm thu đồ án M4 ghi nhận tổng số tiền tiêu thụ token LLM lũy kế không vượt quá 10 USD.<br>2. Thực hiện kiểm tra lại cùng một danh mục trích dẫn lần thứ hai liên tiếp: hệ thống tái sử dụng kết quả trong bộ nhớ đệm Redis, nhật ký ghi nhận số lượng lệnh gọi API ra CSDL ngoài là 0.<br>*Phân nhóm: Quản trị chi phí vận hành (Cost Management) · Mức độ ưu tiên: Should Have* |
| Là quản trị viên, tôi muốn dữ liệu được sao lưu hằng ngày để khôi phục được khi có sự cố. | **NFR-11**<br>Sao lưu và khôi phục dữ liệu | Để phòng ngừa sự cố mất mát dữ liệu tài khoản, lịch sử kiểm tra và đặc biệt là Kho trích dẫn ma đã được tích lũy công phu qua thời gian, hệ thống phải thiết lập tiến trình tự động sao lưu toàn bộ cơ sở dữ liệu PostgreSQL định kỳ hằng ngày vào khung giờ thấp điểm (02:00 sáng). Hệ thống duy trì lưu giữ tối thiểu 7 bản sao lưu gần nhất. Quy trình khôi phục dữ liệu từ bản sao lưu phải được văn bản hóa và diễn tập thử nghiệm, đảm bảo khả năng khôi phục hoạt động hệ thống bình thường với lượng dữ liệu tổn thất tối đa không vượt quá 24 giờ (RPO ≤ 24 giờ).<br>**Tiêu chí kiểm chứng:**<br>1. Tiến hành diễn tập khôi phục thử nghiệm một bản sao lưu ngẫu nhiên vào môi trường cơ sở dữ liệu kiểm thử (Staging): toàn bộ cấu trúc bảng và dữ liệu được phục hồi nguyên vẹn và hoạt động bình thường.<br>2. Thư mục lưu trữ bản sao lưu ghi nhận liên tục sự hiện diện của đầy đủ 7 tệp sao lưu tương ứng với 7 ngày gần nhất.<br>*Phân nhóm: Quản trị lưu trữ và phục hồi (Data Recovery & Backup) · Mức độ ưu tiên: Should Have* |

# 4 Đặc tả yêu cầu

## 4.1 Sơ đồ Use Case

Hệ thống có 5 tác nhân người dùng và 2 tác nhân là hệ thống bên ngoài. Sinh viên và Giảng viên kế thừa (generalization – tổng quát hoá) từ tác nhân trừu tượng *Người dùng đã đăng ký*. Hai quan hệ mở rộng (`<<extend>>`): U005 mở rộng U004, U007 mở rộng U006. Các bước tách thông tin, tra cứu trích dẫn (Lớp 1), so khớp câu trích (Lớp 2) và gợi ý nguồn (Lớp 3) là các bước trong kịch bản của U004, không phải use case riêng. Ba use case U016 (kích hoạt tài khoản qua email), U017 (đặt lại mật khẩu) và U018 (xóa tài khoản) được bổ sung để mọi chuyển trạng thái trong sơ đồ trạng thái Tài khoản (Mục 4.4.3) đều có use case tương ứng.

![Hình 4.1. Sơ đồ use case tổng thể của hệ thống VeriCite](media/uc_crop.png)

Hình 4.1. Sơ đồ use case tổng thể của hệ thống VeriCite

Bảng 4.1. Danh sách tác nhân

| Tác nhân | Phân loại | Mô tả vai trò |
|---|---|---|
| **Khách** (*Guest*) | Người dùng | Người dùng chưa đăng nhập hệ thống, được phép trải nghiệm tính năng kiểm tra dùng thử có giới hạn nghiêm ngặt. |
| **Người dùng đã đăng ký** (*Registered User*) | Người dùng (Lớp cha) | Tác nhân trừu tượng đại diện cho mọi tài khoản đã kích hoạt trên hệ thống (Sinh viên, Giảng viên kế thừa từ tác nhân này; Moderator và Quản trị viên cũng sử dụng luồng đăng nhập chung). |
| **Sinh viên** (*Student*) | Người dùng | Kế thừa từ *Người dùng đã đăng ký*. Sử dụng hệ thống để kiểm tra tính xác thực của trích dẫn, câu trích và nhận định trong bài viết/tiểu luận cá nhân. |
| **Giảng viên** (*Lecturer*) | Người dùng | Kế thừa từ *Người dùng đã đăng ký*. Có hạn mức kiểm tra cao hơn và được sử dụng tính năng kiểm tra bài nộp hàng loạt của sinh viên theo lớp. |
| **Moderator** (*Người kiểm duyệt*) | Người dùng | Tiếp nhận và thẩm định các báo lỗi kết quả từ người dùng; cập nhật kho trích dẫn ma và danh sách trích dẫn thật đã xác nhận. |
| **Quản trị viên** (*Administrator*) | Người dùng | Quản lý danh sách người dùng, phân quyền, cấu hình hạn mức tài nguyên và theo dõi thống kê lượt kiểm tra, chi phí sử dụng API. |
| **CSDL học thuật** (*Academic DB*) | Tác nhân ngoài (*External*) | Các hệ thống chỉ mục học thuật mở (CrossRef, Semantic Scholar, OpenAlex) cung cấp API tra cứu siêu dữ liệu bài báo tất định. |
| **Nhà cung cấp LLM** (*LLM Provider*) | Tác nhân ngoài (*External*) | Dịch vụ mô hình ngôn ngữ lớn bên ngoài chỉ phục vụ bước tách trích dẫn, câu trích và nhận định từ văn bản. |

Bảng 4.2. Danh sách 18 use case của hệ thống

| Mã UC | Tên use case | Tác nhân chính | Quan hệ | Căn cứ yêu cầu |
|---|---|---|---|---|
| **U001** | Đăng ký tài khoản | Khách | — | FR-01, QĐ9 |
| **U002** | Đăng nhập / đăng xuất | Người dùng đã đăng ký | — | FR-01, QĐ9 |
| **U003** | Dùng thử kiểm tra | Khách *(hỗ trợ bởi Nhà cung cấp LLM, CSDL học thuật)* | — | FR-02, QĐ1, SC-05 |
| **U004** | Kiểm tra nội dung | Sinh viên, Giảng viên *(hỗ trợ bởi Nhà cung cấp LLM, CSDL học thuật)* | Gốc của `<<extend>>` U005 | FR-03 → FR-10, QĐ2, QĐ4–QĐ7, SC-01 |
| **U005** | Tải tài liệu nguồn | Sinh viên, Giảng viên | `<<extend>>` U004 | FR-03, FR-07, QĐ2, QĐ6, SC-02 |
| **U006** | Xem báo cáo kết quả | Sinh viên, Giảng viên | Gốc của `<<extend>>` U007 | FR-09, QĐ4, QĐ7 |
| **U007** | Xuất báo cáo PDF | Sinh viên, Giảng viên | `<<extend>>` U006 | FR-11, QĐ7 |
| **U008** | Xem / xoá lịch sử kiểm tra | Sinh viên, Giảng viên | — | FR-12, QĐ8 |
| **U009** | Kiểm tra hàng loạt | Giảng viên *(hỗ trợ bởi Nhà cung cấp LLM, CSDL học thuật)* | — | FR-13, QĐ3, SC-03 |
| **U010** | Báo lỗi kết quả | Sinh viên, Giảng viên | — | FR-14, SC-04 |
| **U011** | Duyệt báo lỗi | Moderator | — | FR-15, QĐ10, SC-04 |
| **U012** | Quản lý kho trích dẫn ma và danh sách trích dẫn thật | Moderator | — | FR-15, QĐ10 |
| **U013** | Quản lý người dùng và phân vai | Quản trị viên | — | FR-01, FR-16 |
| **U014** | Quản lý hạn mức | Quản trị viên | — | FR-16, QĐ1–QĐ3 |
| **U015** | Xem thống kê lượt kiểm tra và chi phí API | Quản trị viên | — | FR-17 |
| **U016** | Kích hoạt tài khoản qua email | Khách | — | FR-18, QĐ9 |
| **U017** | Đặt lại mật khẩu | Người dùng đã đăng ký | — | FR-18, QĐ9 |
| **U018** | Xóa tài khoản | Người dùng đã đăng ký | — | FR-18, QĐ8, NFR-05 |

## 4.2 Đặc tả Use Case

Mỗi use case được đặc tả theo bảng mẫu gồm 9 mục. Kịch bản phụ ghi rõ bước rẽ nhánh (ví dụ “4a” rẽ từ bước 4 của kịch bản chính) và nơi quay lại hoặc kết thúc.

### 4.2.1 Đặc tả Use Case U001 – Đăng ký tài khoản

Bảng 4.3. Đặc tả use case U001 – Đăng ký tài khoản

| **Use case ID** | **U001** |
|---|---|
| **Tên Use Case** | **Đăng ký tài khoản** |
| **Tóm tắt** | Cho phép khách chưa có tài khoản đăng ký tài khoản mới trên hệ thống VeriCite bằng email và mật khẩu để sử dụng đầy đủ các tính năng kiểm tra, lưu lịch sử và xuất báo cáo. |
| **Tác nhân** | Khách |
| **Điều kiện tiên quyết** | Khách chưa đăng nhập vào hệ thống. |
| **Kết quả** | - **Thành công:** Một tài khoản người dùng mới (mặc định gán vai trò Sinh viên) được tạo ở trạng thái *Chưa kích hoạt*; hệ thống gửi email kích hoạt, người dùng kích hoạt tài khoản (U016) rồi mới đăng nhập được.<br>- **Thất bại:** Tài khoản không được tạo; hệ thống giữ nguyên giao diện đăng ký kèm thông báo nêu rõ lý do từ chối. |
| **Kịch bản chính** | 1. Khách truy cập trang web VeriCite và nhấn nút **"Đăng ký"** trên thanh điều hướng.<br>2. Hệ thống hiển thị biểu mẫu đăng ký bao gồm các trường: Họ và tên, Email, Mật khẩu, Xác nhận mật khẩu và điều khoản sử dụng dịch vụ.<br>3. Khách nhập đầy đủ thông tin vào các trường yêu cầu, tích chọn đồng ý với điều khoản sử dụng và nhấn nút **"Tạo tài khoản"**.<br>4. Hệ thống kiểm tra tính hợp lệ của dữ liệu nhập theo quy định QĐ9: định dạng email hợp lệ, email chưa tồn tại trong hệ thống, mật khẩu có độ dài ít nhất 8 ký tự, mật khẩu không nằm trong danh sách mật khẩu phổ biến hoặc đã bị lộ (theo hướng dẫn NIST SP 800-63B), và mật khẩu xác nhận trùng khớp.<br>5. Hệ thống tạo tài khoản mới ở trạng thái *Chưa kích hoạt* với vai trò mặc định là Sinh viên.<br>6. Hệ thống gửi email chứa liên kết kích hoạt (hiệu lực 24 giờ) và hiển thị thông báo đăng ký thành công, yêu cầu khách kiểm tra hộp thư để kích hoạt tài khoản (**U016**). |
| **Kịch bản phụ** | **4a. Dữ liệu nhập thiếu hoặc mật khẩu không đạt quy định QĐ9:**<br>1. Hệ thống đánh dấu đỏ trường bị lỗi và hiển thị thông báo nêu đúng lý do từ chối dưới ô nhập (ví dụ: *"Mật khẩu phải có ít nhất 8 ký tự"* hoặc *"Mật khẩu này nằm trong danh sách mật khẩu phổ biến/đã bị lộ, vui lòng chọn mật khẩu khác"*).<br>2. Khách sửa lại thông tin và quay lại bước 3 của kịch bản chính.<br><br>**4b. Địa chỉ email đã tồn tại trong hệ thống:**<br>1. Hệ thống từ chối tạo mới và hiển thị thông báo: *"Địa chỉ email này đã được đăng ký. Vui lòng chuyển sang trang Đăng nhập"*, kèm liên kết đến U002.<br>2. Use case kết thúc.<br><br>**5a. Hệ thống gặp sự cố khi lưu tài khoản:**<br>1. Hệ thống hủy giao dịch, hiển thị thông báo: *"Không thể tạo tài khoản vào lúc này do lỗi hệ thống. Vui lòng thử lại sau"*.<br>2. Use case kết thúc. |
| **Ràng buộc phi chức năng** | - **NFR-04 (Bảo mật truyền tải và mật khẩu):** Mọi kết nối đăng ký phải truyền qua HTTPS (TLS 1.2 trở lên); mật khẩu chỉ được lưu dạng băm Argon2 có salt trong CSDL, tuyệt đối không lưu mật khẩu dạng đọc được; tuân thủ quy định QĐ9.<br>- **NFR-03 (Chịu tải đồng thời):** Giao diện biểu mẫu và yêu cầu xác thực phản hồi cho người dùng trong vòng 3 giây. |

### 4.2.2 Đặc tả Use Case U002 – Đăng nhập / đăng xuất

Bảng 4.4. Đặc tả use case U002 – Đăng nhập / đăng xuất

| **Use case ID** | **U002** |
|---|---|
| **Tên Use Case** | **Đăng nhập / đăng xuất** |
| **Tóm tắt** | Cho phép người dùng đã đăng ký xác thực danh tính để truy cập hệ thống theo đúng phân quyền của từng vai (Sinh viên, Giảng viên, Moderator, Quản trị viên), hoặc kết thúc phiên làm việc an toàn khi rời khỏi hệ thống. |
| **Tác nhân** | Người dùng đã đăng ký (Sinh viên, Giảng viên, Moderator, Quản trị viên). |
| **Điều kiện tiên quyết** | - Đối với Đăng nhập: Người dùng đã có tài khoản trên hệ thống và hiện chưa đăng nhập.<br>- Đối với Đăng xuất: Người dùng đang có phiên đăng nhập hợp lệ. |
| **Kết quả** | - **Đăng nhập thành công:** Một phiên làm việc có kiểm soát quyền được khởi tạo; bộ đếm số lần đăng nhập sai được đặt lại về 0; người dùng được điều hướng vào màn hình chức năng tương ứng với vai trò.<br>- **Đăng nhập thất bại:** Không tạo phiên làm việc; tăng bộ đếm nhập sai hoặc tạm khóa đăng nhập 15 phút nếu sai 5 lần liên tiếp.<br>- **Đăng xuất thành công:** Phiên làm việc hiện tại bị hủy; người dùng quay về trang chủ ở chế độ Khách. |
| **Kịch bản chính** | **\[Luồng Đăng nhập\]**<br>1. Người dùng nhấn nút **"Đăng nhập"** trên thanh điều hướng.<br>2. Hệ thống hiển thị biểu mẫu đăng nhập gồm các trường: Email và Mật khẩu, kèm liên kết “Quên mật khẩu”.<br>3. Người dùng nhập Email, Mật khẩu và nhấn nút **"Đăng nhập"**.<br>4. Hệ thống kiểm tra trạng thái tài khoản (không bị khóa bởi Quản trị viên, không trong thời gian tạm khóa 15 phút, đã kích hoạt) và đối chiếu mật khẩu nhập vào với mật khẩu đã đăng ký.<br>5. Hệ thống xác nhận thông tin hợp lệ, đặt lại bộ đếm số lần đăng nhập sai về 0 và khởi tạo phiên làm việc gắn với vai trò của tài khoản.<br>6. Hệ thống chuyển hướng người dùng tới giao diện làm việc theo vai trò (Sinh viên/Giảng viên vào màn hình Kiểm tra mới, Moderator vào màn hình Hàng chờ duyệt báo lỗi, Quản trị viên vào màn hình Quản trị hệ thống).<br><br>**\[Luồng Đăng xuất\]**<br>7. Khi đang đăng nhập, người dùng nhấn vào tên tài khoản trên thanh điều hướng và chọn **"Đăng xuất"**.<br>8. Hệ thống kết thúc phiên làm việc của người dùng.<br>9. Hệ thống chuyển hướng người dùng về trang chủ công khai (chế độ Khách). |
| **Kịch bản phụ** | **3a. Người dùng chọn “Quên mật khẩu”:**<br>1. Hệ thống chuyển sang use case Đặt lại mật khẩu (U017).<br>2. Use case kết thúc.<br><br>**4a. Nhập sai email hoặc mật khẩu (chưa chạm ngưỡng 5 lần):**<br>1. Hệ thống tăng bộ đếm số lần đăng nhập sai liên tiếp của tài khoản thêm 1.<br>2. Hệ thống hiển thị thông báo: *"Email hoặc mật khẩu không chính xác"*.<br>3. Người dùng quay lại bước 3 của kịch bản chính.<br><br>**4b. Nhập sai mật khẩu đủ 5 lần liên tiếp (theo QĐ9):**<br>1. Hệ thống tự động khóa quyền đăng nhập của tài khoản này trong thời gian 15 phút.<br>2. Hệ thống hiển thị thông báo: *"Tài khoản tạm thời bị khóa đăng nhập trong 15 phút do nhập sai mật khẩu 5 lần liên tiếp. Vui lòng thử lại sau"*.<br>3. Use case kết thúc.<br><br>**4c. Tài khoản đang bị Quản trị viên khóa:**<br>1. Hệ thống từ chối yêu cầu đăng nhập và hiển thị thông báo: *"Tài khoản của bạn đã bị khóa bởi quản trị viên. Vui lòng liên hệ quản trị viên để được hỗ trợ"*.<br>2. Use case kết thúc.<br><br>**4d. Tài khoản chưa kích hoạt:**<br>1. Hệ thống từ chối đăng nhập, thông báo: *“Tài khoản chưa được kích hoạt. Vui lòng kiểm tra email”* và cho phép gửi lại email kích hoạt (U016).<br>2. Use case kết thúc. |
| **Ràng buộc phi chức năng** | - **NFR-04 (Bảo mật truyền tải và mật khẩu):** Dữ liệu đăng nhập truyền qua HTTPS (TLS 1.2+); đối chiếu mật khẩu qua hàm băm Argon2 có salt; tự động khóa đăng nhập 15 phút sau 5 lần nhập sai liên tiếp (QĐ9).<br>- **NFR-05 (Bảo vệ tài liệu và kiểm soát truy cập):** Hệ thống kiểm tra phân quyền theo vai ở phía máy chủ cho mọi yêu cầu sau khi đăng nhập; ghi nhật ký mọi truy cập trái quyền bị từ chối. |

### 4.2.3 Đặc tả Use Case U003 – Dùng thử kiểm tra

Bảng 4.5. Đặc tả use case U003 – Dùng thử kiểm tra

| **Use case ID** | **U003** |
|---|---|
| **Tên Use Case** | **Dùng thử kiểm tra** |
| **Tóm tắt** | Cho phép khách chưa đăng nhập kiểm tra thử một danh mục tài liệu tham khảo nhỏ (tối đa 5 trích dẫn mỗi lượt, tối đa 3 lượt mỗi ngày) để trải nghiệm khả năng phát hiện trích dẫn bịa của VeriCite trước khi đăng ký tài khoản. |
| **Tác nhân** | - **Tác nhân chính:** Khách.<br>- **Tác nhân hệ thống ngoài:** Nhà cung cấp LLM, CSDL học thuật (CrossRef, Semantic Scholar, OpenAlex). |
| **Điều kiện tiên quyết** | Khách chưa đăng nhập và chưa sử dụng hết 3 lượt dùng thử trong ngày (theo QĐ1). |
| **Kết quả** | - **Thành công:** Kết quả kiểm tra của tối đa 5 trích dẫn hiển thị trực tiếp trên màn hình với đầy đủ nhãn (*Đã xác minh*, *Chưa xác minh được*, *Mâu thuẫn với nguồn*), mã lý do và liên kết nguồn; bộ đếm lượt dùng thử trong ngày của khách tăng thêm 1; không có dữ liệu lịch sử nào được lưu lại.<br>- **Thất bại:** Yêu cầu bị từ chối khi vượt giới hạn QĐ1 kèm lời mời đăng ký tài khoản, hoặc báo lỗi khi dịch vụ ngoài gặp sự cố mà không trừ lượt dùng thử. |
| **Kịch bản chính** | 1. Khách mở trang chủ VeriCite và chọn chức năng **"Dùng thử"**.<br>2. Hệ thống hiển thị vùng nhập văn bản dùng thử kèm thông báo rõ giới hạn quy định QĐ1 (tối đa 5 trích dẫn/lượt, tối đa 3 lượt/ngày) và thông báo văn bản sẽ được gửi tới dịch vụ LLM bên ngoài để tách thông tin.<br>3. Khách dán danh mục tài liệu tham khảo (tối đa 5 trích dẫn) vào ô nhập và nhấn nút **"Kiểm tra dùng thử"**.<br>4. Hệ thống kiểm tra bộ đếm lượt dùng thử trong ngày của khách và gọi dịch vụ LLM để tách danh sách trích dẫn, đảm bảo mỗi mục bám đúng đoạn văn gốc.<br>5. Hệ thống xác nhận số lượng trích dẫn không vượt quá 5 mục, sau đó chuẩn hóa và tính dấu vân tay từng trích dẫn để tra cứu trong kho trích dẫn ma, danh sách trích dẫn thật đã xác nhận và các CSDL học thuật mở (CrossRef, Semantic Scholar, OpenAlex), đồng thời đối chiếu chi tiết các trường tác giả, năm, tiêu đề, nơi đăng, DOI.<br>6. Hệ thống tổng hợp kết quả, gán nhãn (*Đã xác minh*, *Chưa xác minh được* hoặc *Mâu thuẫn với nguồn*) kèm mã lý do cho từng trích dẫn và tăng bộ đếm lượt dùng thử trong ngày của khách lên 1.<br>7. Hệ thống hiển thị kết quả kiểm tra trực tiếp trên màn hình (ẩn chức năng lưu lịch sử và vô hiệu hóa xuất PDF), kèm thông điệp mời khách đăng ký tài khoản để kiểm tra tài liệu đầy đủ. |
| **Kịch bản phụ** | **4a. Khách đã dùng hết 3 lượt dùng thử trong ngày (theo QĐ1):**<br>1. Hệ thống từ chối xử lý ngay từ đầu mà không gọi API LLM.<br>2. Hệ thống hiển thị thông báo: *"Bạn đã sử dụng hết 3 lượt dùng thử miễn phí trong ngày. Vui lòng đăng ký tài khoản để tiếp tục kiểm tra"* kèm nút dẫn tới **Đăng ký tài khoản (U001)**.<br>3. Use case kết thúc.<br><br>**5a. Nội dung khách dán vào chứa nhiều hơn 5 trích dẫn (theo QĐ1):**<br>1. Hệ thống dừng xử lý tra cứu, hiển thị thông báo: *"Chế độ dùng thử chỉ cho phép tối đa 5 trích dẫn mỗi lượt. Vui lòng rút gọn danh mục hoặc đăng ký tài khoản"* kèm liên kết tới **U001**.<br>2. Hệ thống không trừ lượt dùng thử của khách.<br>3. Use case kết thúc.<br><br>**7a. Khách nhấn vào nút muốn xuất báo cáo PDF trên màn hình kết quả:**<br>1. Hệ thống hiển thị hộp thoại thông báo chức năng xuất PDF chỉ dành cho thành viên đã đăng nhập và mời khách chuyển sang trang **Đăng ký tài khoản (U001)**.<br>2. Use case kết thúc.<br><br>**4b. Dịch vụ LLM hoặc CSDL học thuật gặp lỗi không thể xử lý:**<br>1. Hệ thống thông báo lỗi dịch vụ tạm thời và bảo toàn (không trừ) lượt dùng thử của khách.<br>2. Use case kết thúc. |
| **Ràng buộc phi chức năng** | - **NFR-01 (Thời gian xử lý):** Lượt kiểm tra dùng thử (tối đa 5 trích dẫn) hoàn tất phản hồi trong thời gian dưới 30 giây, có hiển thị tiến độ trong lúc chờ.<br>- **NFR-06 (Minh bạch kết quả):** Mỗi trích dẫn trên màn hình dùng thử đều hiển thị nhãn, lý do bằng tiếng Việt và liên kết nguồn đối chiếu.<br>- **NFR-10 (Kiểm soát chi phí API):** Chặn nghiêm ngặt hạn mức QĐ1 (3 lượt/ngày, 5 trích dẫn/lượt) và tận dụng bộ đệm tra cứu để kiểm soát chi phí token LLM. |

### 4.2.4 Đặc tả Use Case U004 – Kiểm tra nội dung

Bảng 4.6. Đặc tả use case U004 – Kiểm tra nội dung

| **Use case ID** | **U004** |
|---|---|
| **Tên Use Case** | **Kiểm tra nội dung** |
| **Tóm tắt** | Cho phép Sinh viên hoặc Giảng viên dán văn bản/danh mục tham khảo hoặc tải tệp tài liệu (PDF, DOCX, TXT) để hệ thống tách các trích dẫn, câu trích, nhận định bằng LLM (có kiểm tra bám văn bản gốc), sau đó kiểm chứng qua 3 lớp tất định (Lớp 1: tra cứu kho nội bộ và CSDL học thuật; Lớp 2: so khớp nguyên văn với tài liệu nguồn nếu có mở rộng U005; Lớp 3: gợi ý tài liệu cho nhận định không có nguồn), gán nhãn kết quả, lưu vào lịch sử và hiển thị báo cáo. |
| **Tác nhân** | - **Tác nhân chính:** Sinh viên, Giảng viên.<br>- **Tác nhân hệ thống ngoài:** Nhà cung cấp LLM, CSDL học thuật (CrossRef, Semantic Scholar, OpenAlex). |
| **Điều kiện tiên quyết** | 1. Người dùng đã đăng nhập với vai trò Sinh viên hoặc Giảng viên (U002).<br>2. Tài khoản của người dùng còn đủ hạn mức kiểm tra khả dụng trong ngày. |
| **Kết quả** | - **Thành công:** Một lượt kiểm tra mới được lưu vào lịch sử tài khoản; mỗi mục (trích dẫn, câu trích, nhận định) được gán đúng một nhãn (*Đã xác minh*, *Chưa xác minh được*, *Mâu thuẫn với nguồn*) kèm mã lý do và nguồn đối chiếu; hạn mức khả dụng trừ 1 lượt; người dùng được chuyển sang xem báo cáo kết quả (U006).<br>- **Thất bại:** Không có lượt kiểm tra nào được tạo, hoặc lượt kiểm tra chuyển sang trạng thái lỗi và hạn mức của người dùng **không** bị trừ. |
| **Kịch bản chính** | 1. Người dùng chọn chức năng **"Kiểm tra mới"** trên thanh điều hướng.<br>2. Hệ thống hiển thị biểu mẫu nhập liệu gồm: vùng dán văn bản/danh mục tham khảo, vùng tải tệp kiểm tra (.pdf, .docx, .txt), tùy chọn tải tài liệu nguồn để đối chiếu câu trích (điểm mở rộng sang **U005**), vùng chọn chế độ rủi ro (*Thông thường* hoặc *Học thuật nghiêm ngặt*), thông báo giới hạn đầu vào theo QĐ2 (tối đa 10.000 từ, 50 trích dẫn, tệp tối đa 10 MB), số lượt hạn mức còn lại và thông báo rõ văn bản sẽ được gửi tới dịch vụ LLM bên ngoài để tách thông tin.<br>3. Người dùng dán văn bản hoặc chọn tệp cần kiểm tra, chọn chế độ rủi ro và nhấn nút **"Kiểm tra"**.<br>4. Hệ thống kiểm tra dữ liệu đầu vào thỏa mãn giới hạn QĐ2, xác nhận tài khoản còn hạn mức, khởi tạo lượt kiểm tra chạy nền và hiển thị thanh tiến độ xử lý trên màn hình.<br>5. **Bước tách thông tin:** Hệ thống trích xuất trước các mã DOI bằng biểu thức chính quy (regex), sau đó gửi văn bản (không kèm thông tin tài khoản) tới dịch vụ LLM để tách thành danh sách các mục (trích dẫn, câu trích, nhận định kèm từ khóa tìm kiếm) có gắn vị trí ký tự. Hệ thống thực hiện **kiểm tra bám văn bản gốc**: đối chiếu mọi giá trị LLM tách ra phải trùng nguyên văn với đoạn văn bản gốc tại vị trí khai báo.<br>6. **Lớp 1 – Kiểm chứng trích dẫn:** Với mỗi trích dẫn tách được, hệ thống chuẩn hóa, tính dấu vân tay trích dẫn (tiêu đề chuẩn hóa, họ tác giả đầu, năm) để tra trong **Kho trích dẫn ma** và **Danh sách trích dẫn thật đã xác nhận**, sau đó tra cứu theo DOI hoặc tiêu đề trên CrossRef, Semantic Scholar, OpenAlex và đối chiếu từng trường (tác giả, năm, tiêu đề, nơi đăng, DOI).<br>7. **Lớp 2 – So khớp câu trích:** Với mỗi câu trích, nếu người dùng đã tải tài liệu nguồn (qua **U005**), hệ thống thực hiện so khớp chính xác rồi khớp gần đúng (fuzzy matching) câu trích với văn bản tài liệu nguồn theo ngưỡng quy định QĐ6 và QĐ7 để tìm đoạn khớp nhất, độ tương đồng và số trang/đoạn.<br>8. **Lớp 3 – Gợi ý nguồn cho nhận định không có nguồn:** Với các nhận định không gắn trích dẫn và không có tài liệu nguồn đối chiếu, hệ thống dùng từ khóa đã tách để tìm tối đa 5 tài liệu liên quan trên OpenAlex và Semantic Scholar (không gọi LLM, không tự phán xét đúng/sai).<br>9. **Tổng hợp và lưu kết quả:** Hệ thống gán đúng một nhãn (*Đã xác minh*, *Chưa xác minh được*, *Mâu thuẫn với nguồn*) và một mã lý do cho từng mục theo quy định QĐ4, QĐ5; sắp xếp thứ tự mục theo chế độ rủi ro đã chọn (QĐ7); lưu toàn bộ kết quả cùng thông tin phiên bản mô hình/prompt vào lịch sử, trừ 1 lượt hạn mức và điều hướng người dùng sang màn hình **Xem báo cáo kết quả (U006)**. |
| **Kịch bản phụ** | **4a. Dữ liệu đầu vào vượt giới hạn QĐ2, sai định dạng, PDF scan hoặc tài khoản hết hạn mức:**<br>1. Hệ thống từ chối bắt đầu kiểm tra và hiển thị thông báo nêu đúng nguyên nhân (ví dụ: *"Văn bản vượt quá giới hạn 10.000 từ"*, *"Tệp vượt quá 10 MB"*, *"Tệp PDF không đọc được lớp văn bản"* hoặc *"Bạn đã hết hạn mức kiểm tra trong ngày"*).<br>2. Hệ thống không tạo lượt kiểm tra, không gọi API và không trừ hạn mức.<br>3. Use case kết thúc.<br><br>**5a. Dịch vụ LLM lỗi, hết thời gian chờ, trả sai schema hoặc không qua kiểm tra bám văn bản sau số lần thử lại:**<br>1. Hệ thống dừng tiến trình, chuyển trạng thái lượt kiểm tra sang *"Lỗi xử lý"* và hiển thị thông báo lỗi cho người dùng.<br>2. Hệ thống không gán nhãn dở dang và **không trừ hạn mức** của người dùng.<br>3. Use case kết thúc.<br><br>**6a. Trích dẫn trùng dấu vân tay trong Kho trích dẫn ma:**<br>1. Hệ thống gán ngay nhãn *Mâu thuẫn với nguồn* kèm mã lý do và cảnh báo *"Đã được xác nhận là trích dẫn bịa trong kho trích dẫn ma"*.<br>2. Hệ thống không gọi CSDL học thuật ngoài cho trích dẫn này và tiếp tục xử lý các mục còn lại.<br><br>**6b. Trích dẫn trùng Danh sách trích dẫn thật đã xác nhận:**<br>1. Hệ thống gán nhãn *Đã xác minh* kèm liên kết tới bằng chứng đã được Moderator xác nhận.<br>2. Hệ thống tiếp tục xử lý các mục còn lại.<br><br>**6c. Trích dẫn tìm thấy bản gốc trên CSDL học thuật nhưng bị lệch trường thông tin (ví dụ sai năm, sai tên tạp chí) hoặc DOI trỏ sang bài khác:**<br>1. Hệ thống gán nhãn *Mâu thuẫn với nguồn*, chỉ rõ tên trường bị sai và hiển thị giá trị đúng lấy từ bản ghi gốc.<br>2. Hệ thống tiếp tục xử lý các mục còn lại.<br><br>**6d. Không tìm thấy trích dẫn ở bất kỳ nguồn CSDL nào:**<br>1. Hệ thống gán nhãn *Chưa xác minh được*, mã lý do *"Không tìm thấy"* (xếp ở mức cảnh báo cao) và liệt kê rõ tên các CSDL đã tra cứu.<br>2. Hệ thống tiếp tục xử lý các mục còn lại.<br><br>**6e. CSDL học thuật bên ngoài lỗi, quá giới hạn tốc độ hoặc hết thời gian chờ sau khi đã thử lại có giãn cách:**<br>1. Hệ thống gán nhãn *Chưa xác minh được* với mã lý do *"Không tra cứu được"* (tuyệt đối không suy diễn trích dẫn là bịa).<br>2. Hệ thống tiếp tục xử lý các mục còn lại.<br><br>**7a. Văn bản có câu trích nhưng người dùng không tải lên tài liệu nguồn:**<br>1. Hệ thống gán nhãn *Chưa xác minh được* cho nội dung câu trích kèm ghi chú chưa có tài liệu nguồn để so khớp nguyên văn, chỉ kiểm tra trích dẫn đi kèm ở Lớp 1 (nếu có).<br>2. Hệ thống tiếp tục bước 8. |
| **Ràng buộc phi chức năng** | - **NFR-01 (Thời gian xử lý):** Một lượt kiểm tra 20 trích dẫn (không gồm Lớp 3) phải hoàn tất trong không quá 30 giây; hiển thị tiến độ trong lúc chờ.<br>- **NFR-02 (Độ chính xác phát hiện):** Phát hiện ít nhất 90% trích dẫn bịa (không gán *Đã xác minh*) và báo nhầm trích dẫn thật không quá 5% trên bộ dữ liệu kiểm thử.<br>- **NFR-05 (Bảo vệ tài liệu và kiểm soát truy cập):** Văn bản gửi tới nhà cung cấp LLM tuyệt đối không kèm thông tin định danh tài khoản của người dùng.<br>- **NFR-06 (Minh bạch kết quả):** Mỗi mục phải có nhãn, lý do bằng tiếng Việt, lớp đã kiểm và liên kết nguồn; lưu kèm phiên bản mô hình LLM, phiên bản prompt và thời điểm tra cứu.<br>- **NFR-07 (Tính tái lập của lớp tất định):** Lớp 1, Lớp 2 và Lớp 3 hoàn toàn tất định, không gọi LLM; cùng đầu vào đã tách và cùng dữ liệu nguồn phải luôn cho kết quả giống hệt nhau.<br>- **NFR-08 (Chịu lỗi dịch vụ bên ngoài):** Thử lại có giãn cách khi CSDL ngoài lỗi; nếu vẫn lỗi thì gán *Chưa xác minh được* ("không tra cứu được"); khi LLM lỗi thì chuyển lượt sang trạng thái lỗi và không trừ hạn mức.<br>- **NFR-10 (Kiểm soát chi phí API):** Lưu đệm (cache) kết quả tra cứu CSDL ngoài; chỉ bước tách mới được gọi LLM; Lớp 3 chỉ chạy cho nhận định không kiểm được ở Lớp 1 và Lớp 2. |

### 4.2.5 Đặc tả Use Case U005 – Tải tài liệu nguồn

Bảng 4.7. Đặc tả use case U005 – Tải tài liệu nguồn

| **Use case ID** | **U005** |
|---|---|
| **Tên Use Case** | **Tải tài liệu nguồn** |
| **Tóm tắt** | Là use case mở rộng (`<<extend>>`) của **U004**. Cho phép Sinh viên hoặc Giảng viên tải lên một hoặc nhiều tệp tài liệu nguồn gốc (giáo trình, bài báo PDF/DOCX/TXT) để hệ thống trích xuất văn bản gốc và thực hiện Lớp 2 – so khớp nguyên văn các câu trích trong bài kiểm tra với tài liệu nguồn. |
| **Tác nhân** | Sinh viên, Giảng viên |
| **Điều kiện tiên quyết** | Người dùng đã đăng nhập và đang ở màn hình nhập dữ liệu của Use Case **U004 (Kiểm tra nội dung)**. |
| **Kết quả** | - **Thành công:** Tệp tài liệu nguồn được tải lên, trích xuất lớp văn bản thành công và gắn vào lượt kiểm tra U004; tại bước Lớp 2 của U004, từng câu trích được so khớp chính xác/gần đúng và trả về độ tương đồng, vị trí trang/đoạn cùng các từ khác biệt được tô sáng.<br>- **Thất bại:** Tệp tài liệu nguồn bị từ chối (do vượt quá 10 MB, sai định dạng) hoặc báo không đọc được nội dung (PDF scan); các câu trích không có nguồn hợp lệ sẽ được gán *Chưa xác minh được*. |
| **Kịch bản chính** | 1. Tại bước 2 của **U004**, người dùng chọn khu vực **"Tải tài liệu nguồn đối chiếu"**.<br>2. Người dùng chọn một hoặc nhiều tệp tài liệu gốc (định dạng .pdf, .docx hoặc .txt) từ máy cá nhân.<br>3. Hệ thống kiểm tra định dạng tệp và dung lượng mỗi tệp không vượt quá 10 MB theo quy định QĐ2.<br>4. Hệ thống tải tệp lên vùng lưu trữ riêng có kiểm soát quyền, trích xuất nội dung văn bản kèm vị trí trang/đoạn và hiển thị trạng thái *"Tài liệu nguồn đã sẵn sàng"* trên biểu mẫu U004.<br>5. Luồng xử lý quay lại bước 3 của **U004**. Khi tiến trình kiểm tra chạy tới **Bước 7 (Lớp 2)** của U004:<br> a. Hệ thống tìm từng câu trích trong văn bản tài liệu nguồn bằng so khớp chính xác trước, sau đó dùng so khớp gần đúng (fuzzy matching).<br> b. Nếu độ tương đồng đạt từ **90% trở lên** (hoặc từ **95% trở lên** khi chọn chế độ *Học thuật nghiêm ngặt* theo QĐ6, QĐ7): hệ thống gán nhãn ***Đã xác minh*** kèm số trang/đoạn của đoạn khớp trong tài liệu nguồn.<br> c. Nếu độ tương đồng dưới 100%, hệ thống đánh dấu tô sáng toàn bộ các từ khác biệt giữa câu trích và văn bản gốc để hiển thị trên báo cáo. |
| **Kịch bản phụ** | **3a. Tệp tài liệu nguồn vượt quá 10 MB hoặc sai định dạng (theo QĐ2):**<br>1. Hệ thống từ chối nhận tệp và hiển thị thông báo nêu rõ giới hạn bị vượt (ví dụ: *"Tệp tài liệu nguồn vượt quá giới hạn 10 MB"* hoặc *"Định dạng tệp không được hỗ trợ, chỉ nhận .pdf, .docx, .txt"*).<br>2. Người dùng chọn lại tệp hợp lệ hoặc bỏ qua việc đính kèm tệp nguồn.<br><br>**4a. Tệp PDF tài liệu nguồn là bản scan không có lớp văn bản:**<br>1. Hệ thống phát hiện không trích xuất được văn bản và hiển thị cảnh báo: *"Không đọc được nội dung văn bản từ tệp PDF (tài liệu scan chưa được hỗ trợ ở phiên bản đầu)"*.<br>2. Nếu người dùng vẫn tiếp tục kiểm tra mà không đổi tệp, các câu trích liên quan sẽ được gán nhãn *Chưa xác minh được*.<br><br>**5a. Câu trích chỉ khớp một phần (độ tương đồng từ 70% đến dưới 90%, hoặc từ 70% đến dưới 95% ở chế độ Học thuật nghiêm ngặt):**<br>1. Hệ thống gán nhãn ***Mâu thuẫn với nguồn***, gắn mã lý do *"Khớp một phần"*, hiển thị đoạn văn bản gốc gần nhất kèm số trang và tô sáng các từ bị thay đổi/khác biệt.<br>2. Tiếp tục tổng hợp tại bước 9 của U004.<br><br>**5b. Câu trích không tìm thấy trong tài liệu nguồn (độ tương đồng dưới 70%):**<br>1. Hệ thống gán nhãn ***Mâu thuẫn với nguồn***, gắn mã lý do không tìm thấy câu trích trong tài liệu nguồn kèm đoạn gốc có độ tương đồng gần nhất để người dùng đối chiếu.<br>2. Tiếp tục tổng hợp tại bước 9 của U004. |
| **Ràng buộc phi chức năng** | - **NFR-05 (Bảo vệ tài liệu và kiểm soát truy cập):** Tệp tài liệu nguồn tải lên được lưu ngoài thư mục công khai, chỉ phục vụ cho lượt kiểm tra của chính người dùng đó, kiểm tra quyền ở phía máy chủ và tự động xóa sau 30 ngày theo QĐ8.<br>- **NFR-06 (Minh bạch kết quả):** Mọi kết quả so khớp câu trích phải chỉ rõ độ tương đồng, vị trí trang/đoạn trong tài liệu nguồn và tô sáng các từ khác biệt khi khớp dưới 100%.<br>- **NFR-07 (Tính tái lập của lớp tất định):** Thuật toán so khớp nguyên văn và khớp gần đúng tại Lớp 2 hoàn toàn tất định, không gọi LLM. |

### 4.2.6 Đặc tả Use Case U006 – Xem báo cáo kết quả

Bảng 4.8. Đặc tả use case U006 – Xem báo cáo kết quả

| **Use case ID** | **U006** |
|---|---|
| **Tên Use Case** | **Xem báo cáo kết quả** |
| **Tóm tắt** | Người dùng mở báo cáo của một lượt kiểm tra đã hoàn tất để biết mục nào đã có căn cứ, mục nào cần xử lý và vì sao. Mỗi mục kèm lý do và liên kết nguồn để người dùng tự kiểm tra lại. |
| **Tác nhân** | Sinh viên, Giảng viên |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập.<br>• Lượt kiểm tra thuộc về người dùng và đã hoàn tất (không ở trạng thái lỗi). |
| **Kết quả** | • Thành công: báo cáo được hiển thị; mỗi mục có đúng một nhãn và một mã lý do; tổng số đếm ở phần tóm tắt bằng số mục; không mục nào bị ẩn ở bất kỳ chế độ nào.<br>• Thất bại: hệ thống không hiển thị dữ liệu của lượt đó và nêu lý do. |
| **Kịch bản chính** | 1. Người dùng chọn một lượt kiểm tra (vừa hoàn tất hoặc từ lịch sử) để xem báo cáo.<br>2. Hệ thống kiểm tra quyền truy cập của người dùng đối với lượt kiểm tra đó.<br>3. Hệ thống hiển thị phần tóm tắt: thời điểm, chế độ rủi ro, số mục theo từng nhãn.<br>4. Hệ thống hiển thị văn bản gốc với từng mục được tô màu theo nhãn, cùng danh sách mục xếp theo mức cảnh báo (cao trước).<br>5. Người dùng chọn một mục.<br>6. Hệ thống hiển thị chi tiết mục: nhãn, mã lý do bằng tiếng Việt, lớp đã kiểm, trường sai kèm giá trị đúng (nếu có), liên kết tới bản ghi nguồn hoặc đoạn khớp trong tài liệu nguồn.<br>7. Người dùng mở liên kết nguồn để tự kiểm tra lại. |
| **Kịch bản phụ** | **2a:** Lượt kiểm tra không thuộc người dùng, không tồn tại hoặc đã bị xóa: hệ thống từ chối, không trả dữ liệu, ghi nhật ký truy cập bị từ chối; use case kết thúc.<br>**4a:** Lượt được kiểm tra ở chế độ *Học thuật nghiêm ngặt*: hệ thống ghi chế độ trên báo cáo, áp dụng ngưỡng khớp câu trích 95% và đưa mọi mục khác *Đã xác minh* lên đầu thành danh sách cần xử lý; không ẩn mục nào; tiếp tục bước 5.<br>**6a:** Mục là câu trích khớp một phần với tài liệu nguồn: hệ thống tô sáng các từ khác biệt giữa câu trích và tài liệu nguồn; tiếp tục bước 7.<br>**6b:** Mục có nhãn *Chưa xác minh được* do không tìm thấy hoặc không tra cứu được: hệ thống nêu các nguồn đã tra và lý do, không kết luận đó là trích dẫn bịa; tiếp tục bước 7.<br>**6c:** Mục trùng kho trích dẫn ma: hệ thống gán *Mâu thuẫn với nguồn* kèm cảnh báo "đã được xác nhận là trích dẫn bịa"; tiếp tục bước 7.<br>**6d:** Mục là nhận định không có nguồn: hệ thống hiển thị tối đa 5 tài liệu gợi ý, ghi rõ đây không phải bằng chứng và không gán *Đã xác minh*; tiếp tục bước 7.<br>**7a:** Người dùng chọn xuất báo cáo thành PDF: chuyển sang use case U007.<br>**7b:** Người dùng thấy kết quả sai và chọn "Báo kết quả sai": chuyển sang use case U010. |
| **Ràng buộc phi chức năng** | • NFR-06: mỗi nhãn có lý do bằng tiếng Việt, lớp đã kiểm và liên kết nguồn hoặc đoạn khớp.<br>• NFR-05: quyền truy cập được kiểm tra ở phía máy chủ; người dùng không xem được báo cáo của người khác.<br>• NFR-09: giao diện tiếng Việt, hiển thị tốt từ chiều rộng 360 px. |

### 4.2.7 Đặc tả Use Case U007 – Xuất báo cáo PDF

Bảng 4.9. Đặc tả use case U007 – Xuất báo cáo PDF

| **Use case ID** | **U007** |
|---|---|
| **Tên Use Case** | **Xuất báo cáo PDF** |
| **Tóm tắt** | Người dùng tải báo cáo của một lượt kiểm tra dưới dạng PDF để đính kèm vào bài nộp hoặc lưu làm bằng chứng. Use case mở rộng (\<\>) của U006. |
| **Tác nhân** | Sinh viên, Giảng viên |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập.<br>• Người dùng đang xem báo cáo của một lượt kiểm tra thuộc về mình (U006). |
| **Kết quả** | • Thành công: người dùng tải được tệp PDF; số mục và nhãn trong PDF khớp báo cáo trên màn hình; PDF có đủ mọi mục, kể cả mục *Chưa xác minh được* và *Mâu thuẫn với nguồn*.<br>• Thất bại: không có PDF được tạo; hệ thống báo lỗi; báo cáo trên màn hình không thay đổi. |
| **Kịch bản chính** | 1. Người dùng bấm "Xuất PDF" trên báo cáo.<br>2. Hệ thống kiểm tra quyền truy cập báo cáo.<br>3. Hệ thống tạo tệp PDF gồm thông tin lượt kiểm tra (thời điểm, chế độ, mã lượt), phần tóm tắt theo nhãn và danh sách mục với nhãn, lý do, liên kết nguồn.<br>4. Hệ thống cho phép người dùng tải tệp PDF về máy. |
| **Kịch bản phụ** | **1a:** Người dùng chưa đăng nhập (ví dụ khách vừa dùng thử): hệ thống mời đăng ký hoặc đăng nhập, không tạo PDF; use case kết thúc.<br>**2a:** Người dùng không còn quyền truy cập hoặc lượt kiểm tra đã bị xóa: hệ thống từ chối và báo lý do; use case kết thúc.<br>**3a:** Báo cáo ở chế độ *Học thuật nghiêm ngặt*: PDF ghi rõ chế độ và đưa các mục cần xử lý lên đầu; vẫn giữ đủ mọi mục; tiếp tục bước 4.<br>**3b:** Tạo PDF thất bại: hệ thống báo lỗi và cho phép thử lại từ bước 1; báo cáo trên màn hình không bị ảnh hưởng. |
| **Ràng buộc phi chức năng** | • NFR-06: lý do và liên kết nguồn trong PDF giống báo cáo trên màn hình; liên kết mở được.<br>• NFR-05: chỉ chủ sở hữu lượt kiểm tra mới xuất được PDF của lượt đó.<br>• Tiếng Việt trong PDF hiển thị đúng dấu.<br>• Cơ chế xác thực báo cáo PDF (mã kiểm tra, dấu thời gian) chưa được chốt, sẽ làm rõ với giảng viên. |

### 4.2.8 Đặc tả Use Case U008 – Xem / xoá lịch sử kiểm tra

Bảng 4.10. Đặc tả use case U008 – Xem / xoá lịch sử kiểm tra

| **Use case ID** | **U008** |
|---|---|
| **Tên Use Case** | **Xem / xoá lịch sử kiểm tra** |
| **Tóm tắt** | Cho phép người dùng đã đăng nhập xem danh sách các lượt kiểm tra đã thực hiện của chính mình, mở lại báo cáo kết quả chi tiết của một lượt cũ, hoặc xóa vĩnh viễn một lượt kiểm tra (bao gồm cả báo cáo và tệp gốc tải lên). |
| **Tác nhân** | Sinh viên, Giảng viên |
| **Điều kiện tiên quyết** | Người dùng đã đăng nhập vào hệ thống (U002). |
| **Kết quả** | - **Xem lịch sử:** Danh sách các lượt kiểm tra của riêng tài khoản đang đăng nhập được hiển thị; khi chọn một lượt, báo cáo chi tiết tương ứng (U006) được mở lại.<br>- **Xoá lịch sử:** Lượt kiểm tra được chọn cùng toàn bộ tệp tải lên và báo cáo của lượt đó bị xóa ngay lập tức, không còn truy cập được kể cả qua đường dẫn trực tiếp. |
| **Kịch bản chính** | **\[Luồng Xem lịch sử và mở lại báo cáo\]**<br>1. Người dùng chọn mục **"Lịch sử kiểm tra"** trên thanh điều hướng.<br>2. Hệ thống kiểm tra quyền của tài khoản hiện tại và hiển thị danh sách các lượt kiểm tra của người dùng đó, mỗi dòng gồm: Thời điểm kiểm tra, Tên tệp hoặc đoạn đầu văn bản, Chế độ rủi ro đã chọn, Số lượng mục theo từng nhãn (*Đã xác minh*, *Chưa xác minh được*, *Mâu thuẫn với nguồn*) và các nút thao tác.<br>3. Người dùng nhấn vào một lượt kiểm tra trong danh sách để xem lại.<br>4. Hệ thống kiểm tra quyền sở hữu lượt kiểm tra ở phía máy chủ, tải dữ liệu báo cáo và chuyển hướng người dùng tới màn hình **Xem báo cáo kết quả (U006)**.<br><br>**\[Luồng Xoá một lượt kiểm tra\]**<br>5. Tại danh sách lịch sử, người dùng nhấn nút **"Xoá"** ở một lượt kiểm tra muốn hủy bỏ.<br>6. Hệ thống hiển thị hộp thoại xác nhận: *"Bạn có chắc chắn muốn xóa lượt kiểm tra này? Báo cáo kết quả và các tệp tải lên của lượt này sẽ bị xóa vĩnh viễn và không thể khôi phục"*.<br>7. Người dùng nhấn nút **"Xác nhận xoá"**.<br>8. Hệ thống kiểm tra quyền sở hữu trên máy chủ, xóa ngay tệp gốc đã tải lên và báo cáo của lượt đó (theo QĐ8), sau đó cập nhật lại danh sách lịch sử trên màn hình. |
| **Kịch bản phụ** | **2a. Tài khoản chưa có lượt kiểm tra nào:**<br>1. Hệ thống hiển thị thông báo danh sách lịch sử trống kèm nút dẫn tới màn hình **Kiểm tra nội dung (U004)**.<br>2. Use case kết thúc.<br><br>**4a / 8a. Người dùng cố tình truy cập hoặc gọi thẳng API xem/xóa lượt kiểm tra của tài khoản khác (hoặc lượt đã xóa):**<br>1. Hệ thống kiểm tra quyền ở phía máy chủ, từ chối yêu cầu và ghi nhận hành vi truy cập bị từ chối vào nhật ký bảo mật.<br>2. Use case kết thúc.<br><br>**7a. Người dùng chọn "Hủy" trên hộp thoại xác nhận xóa:**<br>1. Hệ thống đóng hộp thoại, giữ nguyên dữ liệu của lượt kiểm tra.<br>2. Use case kết thúc. |
| **Ràng buộc phi chức năng** | - **NFR-05 (Bảo vệ tài liệu và kiểm soát truy cập):** Mọi yêu cầu xem danh sách, mở báo cáo hay xóa lượt kiểm tra đều phải được kiểm tra quyền sở hữu ở phía máy chủ (người dùng A tuyệt đối không xem hoặc xóa được lượt của người dùng B); ghi nhật ký mọi truy cập bị từ chối; các tệp tải lên chưa xóa thủ công sẽ tự động bị xóa sau 30 ngày bởi tác vụ dọn dẹp hệ thống (QĐ8).<br>- **NFR-03 (Chịu tải đồng thời):** Danh sách lịch sử phản hồi và hiển thị trên giao diện trong vòng 3 giây. |

### 4.2.9 Đặc tả Use Case U009 – Kiểm tra hàng loạt

Bảng 4.11. Đặc tả use case U009 – Kiểm tra hàng loạt

| **Use case ID** | **U009** |
|---|---|
| **Tên Use Case** | **Kiểm tra hàng loạt** |
| **Tóm tắt** | Cho phép Giảng viên tải lên tối đa 30 tệp bài nộp của sinh viên trong một lượt để hệ thống xử lý kiểm tra nền, hiển thị tiến độ và trả về bảng tổng hợp kết quả theo từng tệp kèm liên kết tới báo cáo chi tiết và xuất PDF cho từng bài. |
| **Tác nhân** | - **Tác nhân chính:** Giảng viên.<br>- **Tác nhân hệ thống ngoài:** Nhà cung cấp LLM, CSDL học thuật (CrossRef, Semantic Scholar, OpenAlex). |
| **Điều kiện tiên quyết** | 1. Người dùng đã đăng nhập với tài khoản được cấp vai **Giảng viên** (FR-01).<br>2. Tài khoản của Giảng viên còn đủ hạn mức sử dụng cho tổng số tệp trong lượt kiểm tra hàng loạt. |
| **Kết quả** | - **Thành công:** Một lượt kiểm tra hàng loạt được tạo và xử lý nền; bảng tổng hợp hiển thị kết quả đếm số mục theo từng nhãn cho tất cả các tệp hợp lệ và đánh dấu rõ lý do cho tệp bị lỗi (nếu có); Giảng viên mở được báo cáo chi tiết (U006) và xuất PDF (U007) cho từng bài nộp.<br>- **Thất bại:** Toàn bộ lượt tải lên bị từ chối nếu tài khoản không có vai Giảng viên, số lượng tệp vượt quá 30 tệp (QĐ3) hoặc không đủ hạn mức. |
| **Kịch bản chính** | 1. Giảng viên chọn chức năng **"Kiểm tra hàng loạt"** trên thanh điều hướng.<br>2. Hệ thống kiểm tra vai trò Giảng viên và hiển thị biểu mẫu kiểm tra hàng loạt gồm: vùng chọn nhiều tệp bài nộp (.pdf, .docx, .txt), tùy chọn chế độ rủi ro (*Thông thường* hoặc *Học thuật nghiêm ngặt*), thông báo giới hạn QĐ3 (tối đa 30 tệp mỗi lượt, mỗi tệp tối đa 10 MB theo QĐ2) và thông báo văn bản sẽ được gửi tới dịch vụ LLM bên ngoài.<br>3. Giảng viên chọn danh sách các tệp bài nộp (tối đa 30 tệp), chọn chế độ rủi ro và nhấn nút **"Bắt đầu kiểm tra hàng loạt"**.<br>4. Hệ thống kiểm tra số lượng tệp ( ≤ 30 tệp), kiểm tra hạn mức khả dụng cho cả lượt, khởi tạo một lượt kiểm tra hàng loạt và đưa từng tệp vào xử lý nền.<br>5. Hệ thống hiển thị màn hình tiến độ của lượt hàng loạt (số tệp đã xử lý xong / tổng số tệp, trạng thái từng tệp). Giảng viên có thể rời khỏi trang hoặc đóng trình duyệt và mở lại sau mà không làm gián đoạn quá trình xử lý.<br>6. Hệ thống lần lượt xử lý từng tệp độc lập qua quy trình tách thông tin bằng LLM (kèm kiểm tra bám văn bản), kiểm chứng Lớp 1, Lớp 3 và tổng hợp gán nhãn giống như bước 5, 6, 8, 9 của **U004**.<br>7. Khi các tệp xử lý hoàn tất, hệ thống hiển thị **Bảng tổng hợp kết quả theo từng tệp**, gồm: Tên tệp bài nộp, Trạng thái hoàn thành, Số mục *Đã xác minh*, Số mục *Chưa xác minh được*, Số mục *Mâu thuẫn với nguồn*, cùng nút mở xem **Báo cáo kết quả chi tiết (U006)** và nút **Xuất báo cáo PDF (U007)** cho từng bài nộp để Giảng viên trao đổi với sinh viên. |
| **Kịch bản phụ** | **1a. Tài khoản Sinh viên cố tình truy cập trang hoặc gọi thẳng API Kiểm tra hàng loạt:**<br>1. Hệ thống kiểm tra phân quyền ở phía máy chủ, từ chối yêu cầu truy cập và ghi nhận vào nhật ký bảo mật.<br>2. Use case kết thúc.<br><br>**4a. Số lượng tệp tải lên nhiều hơn 30 tệp (vượt QĐ3) hoặc tài khoản không đủ hạn mức cho cả lượt:**<br>1. Hệ thống từ chối tạo lượt kiểm tra hàng loạt và hiển thị thông báo nêu rõ lý do (ví dụ: *"Mỗi lượt kiểm tra hàng loạt chỉ cho phép tối đa 30 tệp"* hoặc *"Hạn mức còn lại không đủ cho số tệp đã chọn"*).<br>2. Hệ thống không đưa tệp vào xử lý, không gọi API và không trừ hạn mức.<br>3. Use case kết thúc.<br><br>**6a. Một hoặc một số tệp trong lô bị hỏng, vượt quá 10 MB hoặc là PDF scan không đọc được lớp văn bản:**<br>1. Hệ thống đánh dấu riêng tệp đó ở trạng thái *"Lỗi"* kèm lý do cụ thể trên bảng tổng hợp và không trừ hạn mức cho tệp lỗi.<br>2. Hàng đợi tiếp tục xử lý bình thường toàn bộ các tệp hợp lệ còn lại trong lượt (ví dụ: 30 tệp có 1 tệp hỏng sẽ trả về 29 báo cáo hoàn chỉnh và 1 dòng báo lỗi tệp).<br><br>**5a. Giảng viên đóng trình duyệt trong lúc các tệp đang được xử lý và mở lại sau:**<br>1. Hệ thống vẫn tiếp tục xử lý cho đến khi hoàn tất cả lô.<br>2. Khi Giảng viên đăng nhập lại và mở mục Kiểm tra hàng loạt / Lịch sử, hệ thống hiển thị đúng tiến độ hiện tại hoặc bảng tổng hợp đã hoàn tất. |
| **Ràng buộc phi chức năng** | - **NFR-03 (Chịu tải đồng thời):** Toàn bộ tệp trong lượt kiểm tra hàng loạt phải được xử lý bất đồng bộ qua hàng đợi nền để giao diện người dùng luôn phản hồi trong vòng 3 giây và không làm nghẽn hệ thống khi có 30 người dùng đồng thời.<br>- **NFR-05 (Bảo vệ tài liệu và kiểm soát truy cập):** Kiểm tra chặt chẽ quyền vai trò Giảng viên ở phía máy chủ; chỉ Giảng viên tạo lượt hàng loạt mới được quyền xem bảng tổng hợp và báo cáo của lượt đó; tệp bài nộp tự động xóa sau 30 ngày theo QĐ8.<br>- **NFR-08 (Chịu lỗi dịch vụ bên ngoài):** Các tệp trong cùng một lô được cô lập lỗi độc lập; một tệp gặp lỗi đọc tệp hoặc lỗi dịch vụ ngoài tuyệt đối không làm dừng các tệp còn lại. |

### 4.2.10 Đặc tả Use Case U010 – Báo lỗi kết quả

Bảng 4.12. Đặc tả use case U010 – Báo lỗi kết quả

| **Use case ID** | **U010** |
|---|---|
| **Tên Use Case** | **Báo lỗi kết quả** |
| **Tóm tắt** | Người dùng báo một mục trong báo cáo là sai (nhãn sai, nguồn đối chiếu sai hoặc lỗi khác) để hệ thống xem xét sửa. Báo lỗi chỉ vào hàng chờ "chờ duyệt", không làm thay đổi kết quả hay kho trích dẫn ma cho đến khi moderator duyệt. |
| **Tác nhân** | Sinh viên, Giảng viên |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập.<br>• Người dùng đang xem một mục trong báo cáo của chính mình (U006).<br>• Người dùng chưa báo lỗi cho mục này. |
| **Kết quả** | • Thành công: một báo lỗi ở trạng thái "chờ duyệt" nằm trong hàng chờ của moderator, đủ thông tin; kết quả gốc và kho trích dẫn ma không đổi.<br>• Thất bại: không có báo lỗi nào được lưu. |
| **Kịch bản chính** | 1. Người dùng chọn một mục trong báo cáo và bấm "Báo kết quả sai".<br>2. Hệ thống hiển thị biểu mẫu báo lỗi.<br>3. Người dùng chọn loại lỗi (nhãn sai, nguồn đối chiếu sai, khác), nhập ghi chú, dán liên kết bằng chứng nếu có và bấm gửi.<br>4. Hệ thống kiểm tra dữ liệu nhập hợp lệ.<br>5. Hệ thống lưu báo lỗi ở trạng thái "chờ duyệt", đưa vào hàng chờ của moderator và thông báo gửi thành công; kết quả gốc không đổi.<br>6. Khi moderator có quyết định (U011), hệ thống thông báo cho người báo. |
| **Kịch bản phụ** | **1a:** Người dùng đã báo lỗi mục này trước đó: hệ thống thông báo đã có báo lỗi đang xử lý; use case kết thúc.<br>**3a:** Người dùng hủy biểu mẫu: hệ thống đóng biểu mẫu, không lưu; use case kết thúc.<br>**4a:** Chưa chọn loại lỗi hoặc liên kết bằng chứng sai định dạng: hệ thống chỉ ra trường lỗi và quay lại bước 3.<br>**5a:** Lưu báo lỗi thất bại do lỗi hệ thống: hệ thống báo lỗi, giữ nguyên nội dung đã nhập và quay lại bước 3. |
| **Ràng buộc phi chức năng** | • NFR-05: người dùng chỉ báo lỗi được các mục thuộc lượt kiểm tra của mình.<br>• NFR-06: báo lỗi gắn với mục và lượt kiểm tra có đủ phiên bản mô hình, phiên bản prompt, thời điểm tra cứu để moderator tái hiện kết quả. |

### 4.2.11 Đặc tả Use Case U011 – Duyệt báo lỗi

Bảng 4.13. Đặc tả use case U011 – Duyệt báo lỗi

| **Use case ID** | **U011** |
|---|---|
| **Tên Use Case** | **Duyệt báo lỗi** |
| **Tóm tắt** | Moderator xem hàng chờ báo lỗi, đối chiếu bằng chứng và bản ghi nguồn đã khớp, rồi chấp nhận hoặc từ chối kèm lý do. Chỉ khi chấp nhận thì kho trích dẫn ma hoặc danh sách trích dẫn thật đã xác nhận mới được cập nhật. |
| **Tác nhân** | Moderator |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập với vai moderator.<br>• Có ít nhất một báo lỗi ở trạng thái "chờ duyệt". |
| **Kết quả** | • Thành công: báo lỗi có quyết định; kho chỉ thay đổi khi báo lỗi được chấp nhận; mọi thay đổi có nhật ký (người, thời điểm, lý do); người báo được thông báo.<br>• Thất bại: báo lỗi giữ trạng thái "chờ duyệt" và kho không đổi. |
| **Kịch bản chính** | 1. Moderator mở hàng chờ báo lỗi.<br>2. Hệ thống hiển thị danh sách báo lỗi đang chờ duyệt.<br>3. Moderator chọn một báo lỗi.<br>4. Hệ thống hiển thị mục bị báo, loại lỗi, ghi chú, bằng chứng và bản ghi nguồn đã khớp.<br>5. Moderator đối chiếu và chấp nhận báo lỗi, xác nhận trích dẫn là bịa.<br>6. Hệ thống thêm trích dẫn vào kho trích dẫn ma, ghi nhật ký, đổi trạng thái báo lỗi thành đã chấp nhận và thông báo cho người báo.<br>7. Từ các lượt kiểm tra sau, mọi người dùng có trích dẫn này đều được hệ thống nhận diện từ kho. |
| **Kịch bản phụ** | **2a:** Hàng chờ không có báo lỗi: hệ thống hiển thị "không có báo lỗi chờ duyệt"; use case kết thúc.<br>**5a:** Moderator từ chối và nhập lý do: kho không đổi; hệ thống đổi trạng thái báo lỗi thành đã từ chối, thông báo lý do cho người báo; use case kết thúc.<br>**5b:** Báo lỗi loại "trích dẫn thật bị gán sai" được chấp nhận: hệ thống gỡ trích dẫn khỏi kho trích dẫn ma nếu đang có; nếu trích dẫn không có trên CSDL học thuật mở thì thêm vào danh sách trích dẫn thật đã xác nhận kèm bằng chứng; ghi nhật ký, thông báo cho người báo; use case kết thúc.<br>**5c:** Moderator xác nhận một trích dẫn thật nhưng thiếu bằng chứng (liên kết thư viện, ảnh trang bản quyền): hệ thống không cho lưu, yêu cầu bổ sung và quay lại bước 5. |
| **Ràng buộc phi chức năng** | • NFR-05: chỉ moderator được xem hàng chờ và quyết định, kể cả khi gọi trực tiếp API; mọi truy cập bị từ chối được ghi nhật ký.<br>• NFR-06: moderator tái hiện được kết quả gốc nhờ phiên bản mô hình, phiên bản prompt và thời điểm tra cứu đã lưu. |

### 4.2.12 Đặc tả Use Case U012 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật

Bảng 4.14. Đặc tả use case U012 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật

| **Use case ID** | **U012** |
|---|---|
| **Tên Use Case** | **Quản lý kho trích dẫn ma và danh sách trích dẫn thật** |
| **Tóm tắt** | Moderator xem, tìm kiếm, sửa và gỡ các mục trong kho trích dẫn ma và danh sách trích dẫn thật đã xác nhận, để dữ liệu trong hai nơi này luôn đáng tin. Mọi thay đổi đều được ghi nhật ký. |
| **Tác nhân** | Moderator |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập với vai moderator. |
| **Kết quả** | • Thành công: kho hoặc danh sách phản ánh thay đổi; mỗi thay đổi có nhật ký (người, thời điểm, lý do); lượt kiểm tra sau dùng dữ liệu mới.<br>• Thất bại: dữ liệu không đổi. |
| **Kịch bản chính** | 1. Moderator mở trang quản lý và chọn kho trích dẫn ma hoặc danh sách trích dẫn thật đã xác nhận.<br>2. Hệ thống hiển thị danh sách mục (thông tin mô tả trích dẫn, ngày thêm, người thêm; với danh sách trích dẫn thật có kèm bằng chứng).<br>3. Moderator tìm kiếm và chọn một mục.<br>4. Moderator chọn xem, sửa hoặc gỡ mục.<br>5. Hệ thống yêu cầu nhập lý do, kiểm tra dữ liệu hợp lệ và cập nhật.<br>6. Hệ thống ghi nhật ký thay đổi và thông báo thành công. |
| **Kịch bản phụ** | **3a:** Tìm kiếm không có kết quả: hệ thống thông báo không tìm thấy; quay lại bước 3.<br>**4a:** Moderator chuyển một mục từ kho trích dẫn ma sang danh sách trích dẫn thật: hệ thống yêu cầu bằng chứng, gỡ mục khỏi kho trích dẫn ma, thêm vào danh sách trích dẫn thật; tiếp tục bước 6.<br>**4b:** Thêm hoặc sửa mục của danh sách trích dẫn thật mà thiếu bằng chứng: hệ thống từ chối và quay lại bước 4.<br>**5a:** Mục sau khi sửa trùng một mục khác (cùng dấu vân tay trích dẫn): hệ thống báo trùng, không lưu và quay lại bước 4.<br>**5b:** Moderator không nhập lý do: hệ thống yêu cầu nhập và quay lại bước 5. |
| **Ràng buộc phi chức năng** | • NFR-05: chỉ moderator được truy cập; kiểm tra quyền ở phía máy chủ.<br>• NFR-11: kho và danh sách nằm trong CSDL được sao lưu hằng ngày.<br>• Kho chỉ lưu thông tin mô tả trích dẫn, không lưu văn bản của người dùng. |

### 4.2.13 Đặc tả Use Case U013 – Quản lý người dùng và phân vai

Bảng 4.15. Đặc tả use case U013 – Quản lý người dùng và phân vai

| **Use case ID** | **U013** |
|---|---|
| **Tên Use Case** | **Quản lý người dùng và phân vai** |
| **Tóm tắt** | Quản trị viên tìm, xem, khóa, mở khóa tài khoản, cấp hoặc thu hồi vai giảng viên, moderator và xóa vĩnh viễn tài khoản đã bị khóa do vi phạm. Tài khoản mới mặc định có vai sinh viên; các vai khác do quản trị viên cấp. |
| **Tác nhân** | Quản trị viên |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập với vai quản trị viên. |
| **Kết quả** | • Thành công: tài khoản ở trạng thái hoặc vai mới; tài khoản bị khóa không đăng nhập được; thay đổi được ghi nhận.<br>• Thất bại: tài khoản giữ nguyên trạng thái và vai. |
| **Kịch bản chính** | 1. Quản trị viên mở trang quản lý người dùng.<br>2. Hệ thống hiển thị danh sách tài khoản (email, vai, trạng thái).<br>3. Quản trị viên tìm và chọn một tài khoản.<br>4. Hệ thống hiển thị chi tiết tài khoản.<br>5. Quản trị viên chọn thao tác: khóa, mở khóa, cấp hoặc thu hồi vai giảng viên hoặc moderator, hoặc xóa vĩnh viễn tài khoản đang bị khóa do vi phạm.<br>6. Hệ thống yêu cầu xác nhận thao tác.<br>7. Quản trị viên xác nhận.<br>8. Hệ thống cập nhật tài khoản và thông báo thành công. |
| **Kịch bản phụ** | **3a:** Không tìm thấy tài khoản: hệ thống thông báo không có kết quả; quay lại bước 3.<br>**5a:** Quản trị viên chọn khóa, thu hồi vai hoặc xóa chính tài khoản mình: hệ thống từ chối; quay lại bước 5.<br>**7a:** Quản trị viên hủy: hệ thống không thay đổi gì; use case kết thúc.<br>**8a:** Cập nhật thất bại do lỗi hệ thống: hệ thống báo lỗi, tài khoản giữ nguyên; quay lại bước 5.<br>**8b:** Thao tác là khóa hoặc xóa: hệ thống hủy mọi phiên đăng nhập của tài khoản; tài khoản bị khóa đăng nhập lại sẽ bị từ chối và được báo đã bị khóa. |
| **Ràng buộc phi chức năng** | • NFR-05: kiểm tra quyền ở phía máy chủ; tài khoản không phải quản trị viên gọi trực tiếp chức năng này bị từ chối.<br>• NFR-04: chức năng chỉ hoạt động qua HTTPS. |

### 4.2.14 Đặc tả Use Case U014 – Quản lý hạn mức

Bảng 4.16. Đặc tả use case U014 – Quản lý hạn mức

| **Use case ID** | **U014** |
|---|---|
| **Tên Use Case** | **Quản lý hạn mức** |
| **Tóm tắt** | Quản trị viên đặt hạn mức sử dụng (số lượt mỗi ngày, số trích dẫn mỗi lượt) theo vai hoặc theo từng tài khoản để ngăn lạm dụng và giữ chi phí trong ngân sách. |
| **Tác nhân** | Quản trị viên |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập với vai quản trị viên. |
| **Kết quả** | • Thành công: hạn mức mới được lưu và có hiệu lực từ lượt kiểm tra kế tiếp. Khi người dùng hết hạn mức, hệ thống báo cho người dùng, không tạo lượt kiểm tra và không gọi dịch vụ ngoài; lượt bị lỗi do hệ thống không bị trừ hạn mức.<br>• Thất bại: hạn mức giữ nguyên. |
| **Kịch bản chính** | 1. Quản trị viên mở trang quản lý hạn mức.<br>2. Hệ thống hiển thị hạn mức hiện tại theo từng vai và các tài khoản có hạn mức riêng.<br>3. Quản trị viên chọn một vai hoặc một tài khoản.<br>4. Quản trị viên nhập số lượt mỗi ngày và số trích dẫn mỗi lượt, rồi bấm lưu.<br>5. Hệ thống kiểm tra giá trị hợp lệ, lưu hạn mức và thông báo thành công. |
| **Kịch bản phụ** | **3a:** Quản trị viên chọn một tài khoản cụ thể: hạn mức nhập ở bước 4 áp dụng cho riêng tài khoản đó thay cho hạn mức theo vai; tiếp tục bước 4.<br>**4a:** Quản trị viên hủy: hệ thống không thay đổi gì; use case kết thúc.<br>**5a:** Giá trị không hợp lệ (không phải số nguyên dương hoặc vượt giới hạn tối đa của một lượt kiểm tra): hệ thống báo lỗi và quay lại bước 4.<br>**5b:** Lưu thất bại do lỗi hệ thống: hệ thống báo lỗi, hạn mức giữ nguyên; quay lại bước 4. |
| **Ràng buộc phi chức năng** | • NFR-10: hạn mức góp phần giữ chi phí API trong ngân sách.<br>• NFR-05: kiểm tra quyền ở phía máy chủ.<br>• Giá trị hạn mức mặc định chưa được chốt, sẽ hiệu chỉnh ở giai đoạn thiết kế. |

### 4.2.15 Đặc tả Use Case U015 – Xem thống kê lượt kiểm tra và chi phí API

Bảng 4.17. Đặc tả use case U015 – Xem thống kê lượt kiểm tra và chi phí API

| **Use case ID** | **U015** |
|---|---|
| **Tên Use Case** | **Xem thống kê lượt kiểm tra và chi phí API** |
| **Tóm tắt** | Quản trị viên xem thống kê theo ngày hoặc tuần: số lượt kiểm tra, số mục theo nhãn, số token LLM, chi phí ước tính so với ngân sách trần, số lần gọi từng CSDL học thuật và tỷ lệ lỗi, để phát hiện sớm chi phí bất thường và dịch vụ ngoài hoạt động kém. |
| **Tác nhân** | Quản trị viên |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập với vai quản trị viên. |
| **Kết quả** | • Thành công: số liệu hiển thị khớp nhật ký gọi API trong cùng khoảng thời gian; dữ liệu hệ thống không bị thay đổi.<br>• Thất bại: không hiển thị số liệu và nêu lý do. |
| **Kịch bản chính** | 1. Quản trị viên mở trang thống kê.<br>2. Hệ thống hiển thị thống kê của ngày hiện tại.<br>3. Quản trị viên chọn xem theo ngày hoặc theo tuần.<br>4. Hệ thống hiển thị số lượt kiểm tra, số mục theo nhãn, số token LLM, chi phí ước tính so với ngân sách trần, số lần gọi từng CSDL học thuật và tỷ lệ lỗi. |
| **Kịch bản phụ** | **2a:** Chi phí ước tính đã đạt 80% ngân sách trần: hệ thống hiển thị cảnh báo nổi bật cùng số liệu.<br>**4a:** Khoảng thời gian được chọn không có dữ liệu: hệ thống hiển thị giá trị 0 và thông báo không có lượt kiểm tra; use case kết thúc.<br>**4b:** Không đọc được nhật ký số liệu: hệ thống báo lỗi và cho phép thử lại từ bước 3. |
| **Ràng buộc phi chức năng** | • NFR-10: chi phí LLM trong giai đoạn phát triển và kiểm thử không vượt ngân sách; thống kê là căn cứ theo dõi.<br>• NFR-05: chỉ quản trị viên được xem thống kê; kiểm tra quyền ở phía máy chủ. |

### 4.2.16 Đặc tả Use Case U016 – Kích hoạt tài khoản qua email

Bảng 4.18. Đặc tả use case U016 – Kích hoạt tài khoản qua email

| **Use case ID** | **U016** |
|---|---|
| **Tên Use Case** | **Kích hoạt tài khoản qua email** |
| **Tóm tắt** | Khách vừa đăng ký xác thực địa chỉ email bằng liên kết kích hoạt hệ thống gửi tới hộp thư, để tài khoản chuyển từ trạng thái *Chưa kích hoạt* sang *Đang hoạt động* và đăng nhập được. |
| **Tác nhân** | Khách (người vừa đăng ký tài khoản ở U001) |
| **Điều kiện tiên quyết** | • Tài khoản đã được tạo ở U001 và đang ở trạng thái *Chưa kích hoạt*.<br>• Hệ thống đã gửi email chứa liên kết kích hoạt (hiệu lực 24 giờ). |
| **Kết quả** | • Thành công: tài khoản ở trạng thái *Đang hoạt động* với vai trò Sinh viên; liên kết đã dùng bị vô hiệu; người dùng được chuyển sang Đăng nhập (U002).<br>• Thất bại: tài khoản giữ trạng thái *Chưa kích hoạt*; nếu đã quá 24 giờ thì bản ghi tài khoản chưa kích hoạt bị hủy và khách phải đăng ký lại. |
| **Kịch bản chính** | 1. Khách mở email kích hoạt và nhấp vào liên kết kích hoạt.<br>2. Hệ thống kiểm tra liên kết kích hoạt: tồn tại, chưa được dùng và còn trong thời hạn 24 giờ.<br>3. Hệ thống chuyển tài khoản sang trạng thái *Đang hoạt động*, gán vai trò mặc định Sinh viên và vô hiệu liên kết đã dùng.<br>4. Hệ thống thông báo kích hoạt thành công và chuyển khách sang màn hình Đăng nhập (U002). |
| **Kịch bản phụ** | **1a:** Khách không nhận được email: tại thông báo sau đăng ký hoặc tại màn hình Đăng nhập (U002, 4d), khách chọn “Gửi lại email kích hoạt” và nhập email; hệ thống vô hiệu liên kết cũ, gửi liên kết mới (tối đa 1 lần mỗi 60 giây); quay lại bước 1.<br>**2a:** Liên kết sai hoặc đã được dùng mà tài khoản vẫn chưa kích hoạt: hệ thống báo liên kết không hợp lệ và đề nghị gửi lại email; quay lại bước 1. Nếu tài khoản đã kích hoạt trước đó, hệ thống chỉ báo “Tài khoản đã được kích hoạt” và gợi ý đăng nhập; use case kết thúc.<br>**2b:** Liên kết đã quá 24 giờ: hệ thống báo liên kết hết hạn; tài khoản chưa kích hoạt đã bị hủy theo quy định; gợi ý đăng ký lại (U001); use case kết thúc. |
| **Ràng buộc phi chức năng** | • NFR-04: liên kết kích hoạt chỉ dùng qua HTTPS; token sinh ngẫu nhiên, dùng một lần, lưu dạng băm trong CSDL.<br>• Email kích hoạt được gửi trong vòng 1 phút sau khi đăng ký hoặc yêu cầu gửi lại. |

### 4.2.17 Đặc tả Use Case U017 – Đặt lại mật khẩu

Bảng 4.19. Đặc tả use case U017 – Đặt lại mật khẩu

| **Use case ID** | **U017** |
|---|---|
| **Tên Use Case** | **Đặt lại mật khẩu** |
| **Tóm tắt** | Người dùng quên mật khẩu yêu cầu liên kết đặt lại qua email và tạo mật khẩu mới theo QĐ9. Đặt lại thành công cũng gỡ trạng thái tạm khóa 15 phút do nhập sai mật khẩu. |
| **Tác nhân** | Người dùng đã đăng ký (chưa đăng nhập) |
| **Điều kiện tiên quyết** | • Người dùng chưa đăng nhập và đang ở màn hình Đăng nhập (U002). |
| **Kết quả** | • Thành công: mật khẩu mới (đạt QĐ9) được lưu; mọi phiên đăng nhập cũ bị hủy; bộ đếm nhập sai về 0 và trạng thái tạm khóa được gỡ; người dùng được chuyển sang Đăng nhập.<br>• Thất bại: mật khẩu cũ giữ nguyên. |
| **Kịch bản chính** | 1. Người dùng chọn “Quên mật khẩu” tại màn hình Đăng nhập.<br>2. Hệ thống hiển thị ô nhập email.<br>3. Người dùng nhập email và bấm “Gửi liên kết”.<br>4. Hệ thống luôn hiển thị cùng một thông báo “Nếu email đã đăng ký, bạn sẽ nhận được liên kết đặt lại mật khẩu”; với tài khoản đang hoạt động hoặc đang tạm khóa, hệ thống gửi email chứa liên kết đặt lại (hiệu lực 30 phút, dùng một lần).<br>5. Người dùng nhấp liên kết trong email.<br>6. Hệ thống kiểm tra liên kết đặt lại và hiển thị biểu mẫu mật khẩu mới, xác nhận mật khẩu.<br>7. Người dùng nhập mật khẩu mới, xác nhận và bấm “Lưu”.<br>8. Hệ thống kiểm tra mật khẩu theo QĐ9, lưu mật khẩu mới, vô hiệu liên kết đặt lại, hủy mọi phiên cũ, đặt lại bộ đếm nhập sai và gỡ tạm khóa.<br>9. Hệ thống thông báo đặt lại thành công và chuyển sang Đăng nhập (U002). |
| **Kịch bản phụ** | **4a:** Email không thuộc tài khoản nào hoặc tài khoản bị Quản trị viên khóa: hệ thống không gửi email nhưng vẫn hiển thị cùng thông báo ở bước 4 để không lộ việc email có tồn tại hay không; use case kết thúc.<br>**4b:** Tài khoản đang ở trạng thái *Chưa kích hoạt*: hệ thống gửi lại email kích hoạt (U016) thay cho email đặt lại mật khẩu; use case kết thúc.<br>**6a:** Liên kết sai, đã hết hạn hoặc đã được dùng: hệ thống báo liên kết không hợp lệ và mời yêu cầu liên kết mới; quay lại bước 2.<br>**8a:** Mật khẩu mới không đạt QĐ9 hoặc hai lần nhập không khớp: hệ thống chỉ ra lỗi dưới ô nhập; quay lại bước 7. |
| **Ràng buộc phi chức năng** | • NFR-04: mọi bước qua HTTPS; token ngẫu nhiên, dùng một lần, lưu dạng băm; mật khẩu chỉ lưu dạng băm Argon2 có salt.<br>• Giới hạn tối đa 3 yêu cầu gửi liên kết mỗi giờ cho một email để chống lạm dụng. |

### 4.2.18 Đặc tả Use Case U018 – Xóa tài khoản

Bảng 4.20. Đặc tả use case U018 – Xóa tài khoản

| **Use case ID** | **U018** |
|---|---|
| **Tên Use Case** | **Xóa tài khoản** |
| **Tóm tắt** | Người dùng tự xóa vĩnh viễn tài khoản của mình. Hệ thống xóa thông tin định danh, lịch sử kiểm tra và tệp đã tải lên theo chính sách lưu trữ (QĐ8); thao tác không thể hoàn tác. |
| **Tác nhân** | Người dùng đã đăng ký (Sinh viên, Giảng viên, Moderator, Quản trị viên) |
| **Điều kiện tiên quyết** | • Người dùng đã đăng nhập; tài khoản ở trạng thái *Đang hoạt động*. |
| **Kết quả** | • Thành công: tài khoản chuyển sang trạng thái *Đã xóa*, không đăng nhập lại được; email, họ tên, lịch sử kiểm tra và tệp tải lên bị xóa; báo lỗi đã gửi được giữ ở dạng ẩn danh; có nhật ký kiểm toán.<br>• Thất bại: tài khoản và dữ liệu giữ nguyên. |
| **Kịch bản chính** | 1. Người dùng mở “Tài khoản của tôi” và chọn “Xóa tài khoản”.<br>2. Hệ thống hiển thị cảnh báo về dữ liệu sẽ bị xóa, nêu rõ không thể khôi phục, và yêu cầu nhập mật khẩu hiện tại.<br>3. Người dùng nhập mật khẩu và bấm “Xóa vĩnh viễn”.<br>4. Hệ thống kiểm tra mật khẩu.<br>5. Hệ thống xóa thông tin định danh, lịch sử kiểm tra và tệp tải lên; ẩn danh hóa báo lỗi đã gửi; hủy mọi phiên đăng nhập; ghi nhật ký kiểm toán.<br>6. Hệ thống thông báo tài khoản đã bị xóa và chuyển về trang chủ ở chế độ Khách. |
| **Kịch bản phụ** | **2a:** Tài khoản là Quản trị viên duy nhất của hệ thống: hệ thống từ chối và yêu cầu cấp vai Quản trị viên cho tài khoản khác trước; use case kết thúc.<br>**3a:** Người dùng bấm “Hủy”: hệ thống không thay đổi gì; use case kết thúc.<br>**4a:** Mật khẩu sai: hệ thống báo sai mật khẩu và tăng bộ đếm nhập sai; quay lại bước 3.<br>**4b:** Sai mật khẩu đủ 5 lần liên tiếp: hệ thống tạm khóa tài khoản 15 phút theo QĐ9, hủy thao tác xóa; use case kết thúc.<br>**5a:** Lỗi hệ thống khi xóa: hệ thống hủy giao dịch, dữ liệu giữ nguyên và báo lỗi; use case kết thúc. |
| **Ràng buộc phi chức năng** | • NFR-05: chỉ chủ tài khoản thực hiện được; kiểm tra quyền và mật khẩu ở phía máy chủ.<br>• QĐ8: tệp tải lên bị xóa vĩnh viễn khỏi máy chủ cùng lúc với tài khoản.<br>• NFR-04: thao tác chỉ thực hiện qua HTTPS. |

## 4.3 Sơ đồ hoạt động (Activity Diagram)

Mỗi use case có một sơ đồ hoạt động thể hiện trình tự các bước của kịch bản chính và các nhánh của kịch bản phụ, chia làn (swimlane) theo tác nhân, hệ thống VeriCite và hệ thống bên ngoài. Sơ đồ được viết bằng cú pháp PlantUML; tệp nguồn `.puml` nộp kèm tài liệu.

### 4.3.1 Sơ đồ hoạt động U001 – Đăng ký tài khoản

![Hình 4.2. Sơ đồ hoạt động U001 – Đăng ký tài khoản](media/PA02_Nhom04_AD_U001.png)

Hình 4.2. Sơ đồ hoạt động U001 – Đăng ký tài khoản

### 4.3.2 Sơ đồ hoạt động U002 – Đăng nhập / đăng xuất

![Hình 4.3. Sơ đồ hoạt động U002 – Đăng nhập / đăng xuất](media/PA02_Nhom04_AD_U002.png)

Hình 4.3. Sơ đồ hoạt động U002 – Đăng nhập / đăng xuất

### 4.3.3 Sơ đồ hoạt động U003 – Dùng thử kiểm tra

![Hình 4.4. Sơ đồ hoạt động U003 – Dùng thử kiểm tra](media/PA02_Nhom04_AD_U003.png)

Hình 4.4. Sơ đồ hoạt động U003 – Dùng thử kiểm tra

### 4.3.4 Sơ đồ hoạt động U004 – Kiểm tra nội dung

![Hình 4.5. Sơ đồ hoạt động U004 – Kiểm tra nội dung](media/PA02_Nhom04_AD_U004.png)

Hình 4.5. Sơ đồ hoạt động U004 – Kiểm tra nội dung

### 4.3.5 Sơ đồ hoạt động U005 – Tải tài liệu nguồn

![Hình 4.6. Sơ đồ hoạt động U005 – Tải tài liệu nguồn](media/PA02_Nhom04_AD_U005.png)

Hình 4.6. Sơ đồ hoạt động U005 – Tải tài liệu nguồn

### 4.3.6 Sơ đồ hoạt động U006 – Xem báo cáo kết quả

![Hình 4.7. Sơ đồ hoạt động U006 – Xem báo cáo kết quả](media/PA02_Nhom04_AD_U006.png)

Hình 4.7. Sơ đồ hoạt động U006 – Xem báo cáo kết quả

### 4.3.7 Sơ đồ hoạt động U007 – Xuất báo cáo PDF

![Hình 4.8. Sơ đồ hoạt động U007 – Xuất báo cáo PDF](media/PA02_Nhom04_AD_U007.png)

Hình 4.8. Sơ đồ hoạt động U007 – Xuất báo cáo PDF

### 4.3.8 Sơ đồ hoạt động U008 – Xem / xoá lịch sử kiểm tra

![Hình 4.9. Sơ đồ hoạt động U008 – Xem / xoá lịch sử kiểm tra](media/PA02_Nhom04_AD_U008.png)

Hình 4.9. Sơ đồ hoạt động U008 – Xem / xoá lịch sử kiểm tra

### 4.3.9 Sơ đồ hoạt động U009 – Kiểm tra hàng loạt

![Hình 4.10. Sơ đồ hoạt động U009 – Kiểm tra hàng loạt](media/PA02_Nhom04_AD_U009.png)

Hình 4.10. Sơ đồ hoạt động U009 – Kiểm tra hàng loạt

### 4.3.10 Sơ đồ hoạt động U010 – Báo lỗi kết quả

![Hình 4.11. Sơ đồ hoạt động U010 – Báo lỗi kết quả](media/PA02_Nhom04_AD_U010.png)

Hình 4.11. Sơ đồ hoạt động U010 – Báo lỗi kết quả

### 4.3.11 Sơ đồ hoạt động U011 – Duyệt báo lỗi

![Hình 4.12. Sơ đồ hoạt động U011 – Duyệt báo lỗi (phần 1/2)](media/ad_split_U011_1.png)

Hình 4.12. Sơ đồ hoạt động U011 – Duyệt báo lỗi (phần 1/2)

![Hình 4.13. Sơ đồ hoạt động U011 – Duyệt báo lỗi (phần 2/2)](media/ad_split_U011_2.png)

Hình 4.13. Sơ đồ hoạt động U011 – Duyệt báo lỗi (phần 2/2)

### 4.3.12 Sơ đồ hoạt động U012 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật

![Hình 4.14. Sơ đồ hoạt động U012 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật (phần 1/2)](media/ad_split_U012_1.png)

Hình 4.14. Sơ đồ hoạt động U012 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật (phần 1/2)

![Hình 4.15. Sơ đồ hoạt động U012 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật (phần 2/2)](media/ad_split_U012_2.png)

Hình 4.15. Sơ đồ hoạt động U012 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật (phần 2/2)

### 4.3.13 Sơ đồ hoạt động U013 – Quản lý người dùng và phân vai

![Hình 4.16. Sơ đồ hoạt động U013 – Quản lý người dùng và phân vai (phần 1/2)](media/ad_split_U013_1.png)

Hình 4.16. Sơ đồ hoạt động U013 – Quản lý người dùng và phân vai (phần 1/2)

![Hình 4.17. Sơ đồ hoạt động U013 – Quản lý người dùng và phân vai (phần 2/2)](media/ad_split_U013_2.png)

Hình 4.17. Sơ đồ hoạt động U013 – Quản lý người dùng và phân vai (phần 2/2)

### 4.3.14 Sơ đồ hoạt động U014 – Quản lý hạn mức

![Hình 4.18. Sơ đồ hoạt động U014 – Quản lý hạn mức](media/PA02_Nhom04_AD_U014.png)

Hình 4.18. Sơ đồ hoạt động U014 – Quản lý hạn mức

### 4.3.15 Sơ đồ hoạt động U015 – Xem thống kê lượt kiểm tra và chi phí API

![Hình 4.19. Sơ đồ hoạt động U015 – Xem thống kê lượt kiểm tra và chi phí API](media/PA02_Nhom04_AD_U015.png)

Hình 4.19. Sơ đồ hoạt động U015 – Xem thống kê lượt kiểm tra và chi phí API

### 4.3.16 Sơ đồ hoạt động U016 – Kích hoạt tài khoản qua email

![Hình 4.20. Sơ đồ hoạt động U016 – Kích hoạt tài khoản qua email](media/PA02_Nhom04_AD_U016.png)

Hình 4.20. Sơ đồ hoạt động U016 – Kích hoạt tài khoản qua email

### 4.3.17 Sơ đồ hoạt động U017 – Đặt lại mật khẩu

![Hình 4.21. Sơ đồ hoạt động U017 – Đặt lại mật khẩu](media/PA02_Nhom04_AD_U017.png)

Hình 4.21. Sơ đồ hoạt động U017 – Đặt lại mật khẩu

### 4.3.18 Sơ đồ hoạt động U018 – Xóa tài khoản

![Hình 4.22. Sơ đồ hoạt động U018 – Xóa tài khoản](media/PA02_Nhom04_AD_U018.png)

Hình 4.22. Sơ đồ hoạt động U018 – Xóa tài khoản

## 4.4 Sơ đồ trạng thái (State Chart)

Sơ đồ trạng thái mô tả vòng đời của bốn đối tượng có nhiều trạng thái nhất trong hệ thống: Lượt kiểm tra, Phiếu báo lỗi kết quả, Tài khoản người dùng và Bản ghi trích dẫn trong kho. Tên trạng thái là danh từ hoặc tính từ chỉ trạng thái; nhãn chuyển trạng thái theo cú pháp UML `sự kiện [điều kiện] / hành động`. Mỗi sơ đồ kèm bảng chuyển trạng thái và các cặp chuyển trạng thái không hợp lệ.

### 4.4.1 Sơ đồ trạng thái Lượt kiểm tra

#### Ý nghĩa và Căn cứ nghiệp vụ

Thực thể **Lượt kiểm tra** đại diện cho một phiên làm việc kiểm chứng văn bản hoặc danh mục tham khảo do người dùng khởi tạo (U003 cho Khách dùng thử, U004 cho Sinh viên/Giảng viên kiểm tra văn bản đơn lẻ, U005 tải tài liệu nguồn đối chiếu, U008 xem/xóa lịch sử, U009 kiểm tra hàng loạt). Vòng đời của lượt kiểm tra được chi phối bởi: - **QĐ1:** Hạn mức dùng thử cho khách vãng lai (tối đa 3 lượt/ngày, 5 trích dẫn/lượt, không tải tài liệu nguồn). - **QĐ2:** Giới hạn đầu vào (tối đa 10.000 từ và 50 trích dẫn; tệp PDF, DOCX, TXT tối đa 10 MB). - **QĐ3:** Giới hạn hàng loạt (≤ 30 tệp, xử lý bất đồng bộ qua Celery, cô lập lỗi từng tệp). - **QĐ4, QĐ6, QĐ7:** Quy tắc gán nhãn 3 màu, ngưỡng so khớp 90%/95%, không ẩn mục khỏi báo cáo. - **QĐ8:** Chính sách tự động xóa vĩnh viễn tệp tải lên sau 30 ngày hoặc khi người dùng chủ động xóa lượt. - **NFR-01, NFR-08:** Thời gian xử lý ≤ 30 giây cho 20 trích dẫn; chịu lỗi và hoàn hạn mức khi LLM hoặc dịch vụ ngoài gặp sự cố.

#### Sơ đồ trạng thái (State Diagram)

![Hình 4.23. Sơ đồ trạng thái Lượt kiểm tra](media/PA02_Nhom04_SC_LuotKiemTra.png)

Hình 4.23. Sơ đồ trạng thái Lượt kiểm tra

#### Bảng chuyển trạng thái (State Transition Table) – Lượt kiểm tra

Bảng 4.21. Bảng chuyển trạng thái – Lượt kiểm tra

| STT | Trạng thái nguồn | Sự kiện kích hoạt (Trigger) \[Điều kiện bảo vệ - Guard\] | Hành động thực hiện (Action) | Trạng thái đích | Căn cứ Use Case & Quy định |
|---|---|---|---|---|---|
| 1 | `[*]` (Bắt đầu) | Người dùng truy cập trang kiểm tra | Khởi tạo biểu mẫu nhập liệu trống theo chuẩn BM1 | `Khởi tạo` | U003, U004 |
| 2 | `Khởi tạo` | Bấm nút “Bắt đầu kiểm tra” \[Dữ liệu hợp lệ theo QĐ1/QĐ2 & còn đủ hạn mức ngày\] | Sinh mã định danh duy nhất (Check ID), trừ tạm thời hạn mức, đẩy tác vụ vào hàng đợi Celery | `Đang chờ xử lý` | U004, QĐ2, QĐ9 |
| 3 | `Khởi tạo` | Người dùng đóng trình duyệt / chuyển trang HOẶC \[Dữ liệu vượt giới hạn QĐ2/hết hạn mức\] | Hủy dữ liệu form tạm thời, hiển thị thông báo lỗi giới hạn (nếu vi phạm), không trừ hạn mức | `[*]` (Kết thúc) | U004 (4a), QĐ2 |
| 4 | `Đang chờ xử lý` | Tiến trình nền (Worker) tiếp nhận tác vụ từ hàng đợi | Tải văn bản/tệp đính kèm, trích xuất DOI bằng Regex, chuẩn bị prompt và gửi yêu cầu tới LLM | `Đang bóc tách thông tin` | U004 (bước 5), FR-04 |
| 5 | `Đang bóc tách thông tin` | LLM trả về kết quả nhưng sai schema hoặc không qua kiểm tra bám văn bản \[Số lần thử lại \< 2\] | Tăng biến đếm thử lại, gửi lại prompt yêu cầu LLM bóc tách lại bám sát tọa độ ký tự | `Đang bóc tách thông tin` | FR-04 |
| 6 | `Đang bóc tách thông tin` | LLM trả về lỗi/timeout HOẶC \[Đã thử lại ≥ 2 lần vẫn sai schema/bám văn bản\] | Đánh dấu phiên thất bại, ghi log chi tiết lỗi, tự động hoàn trả hạn mức cho người dùng | `Lỗi xử lý` | FR-04, NFR-08 |
| 7 | `Đang bóc tách thông tin` | Bóc tách hoàn tất \[100% thực thể khớp JSON schema và bám sát nguyên văn\] | Chuyển danh sách trích dẫn, câu trích và nhận định sang bộ điều phối kiểm chứng 3 lớp | `Đang kiểm chứng` | U004 (bước 6), FR-04 |
| 8 | `Đang kiểm chứng` | Lớp 1, 2, 3 hoàn tất quy trình tra cứu và so khớp | Tổng hợp kết quả, gán nhãn chuẩn theo QĐ4 & QĐ5, lưu bản ghi báo cáo vào CSDL PostgreSQL (JSONB) | `Hoàn tất` | U004 (bước 9), FR-09, QĐ4 |
| 9 | `Đang kiểm chứng` | Phát sinh lỗi nghiêm trọng \[Hỏng kết nối CSDL nội bộ PostgreSQL/Redis\] | Hủy tiến trình kiểm chứng, ghi nhận mã lỗi hệ thống nội bộ, hoàn trả hạn mức kiểm tra | `Lỗi xử lý` | NFR-08 |
| 10 | `Lỗi xử lý` | Người dùng xác nhận thông báo lỗi trên màn hình hoặc đóng phiên | Đóng thông báo, giải phóng các tài nguyên bộ nhớ tạm | `[*]` (Kết thúc) | U004 |
| 11 | `Hoàn tất` | Người dùng đã đăng nhập hoàn thành xem báo cáo kết quả | Tự động đồng bộ và lưu trữ lượt kiểm tra vào danh sách lịch sử cá nhân | `Đã lưu trữ` | U006, U008, FR-12 |
| 12 | `Hoàn tất` | Khách vãng lai xem xong báo cáo dùng thử \[Theo QĐ1\] | Kết thúc phiên dùng thử; không lưu vào lịch sử, không lưu tệp | `[*]` (Kết thúc) | U003, QĐ1 |
| 13 | `Đã lưu trữ` | Người dùng yêu cầu xuất báo cáo PDF (U007) | Biên dịch dữ liệu báo cáo sang định dạng PDF chuẩn BM2, gửi tệp về trình duyệt | `Đã lưu trữ` | U007, FR-11 |
| 14 | `Đã lưu trữ` | Người dùng nhấn nút “Báo kết quả sai” tại một mục (U010) | Mở hộp thoại báo lỗi, tạo liên kết trỏ tới mục kiểm tra đang xét | `Đã lưu trữ` | U010, FR-14 |
| 15 | `Đã lưu trữ` | Người dùng bấm “Xóa lượt kiểm tra” (U008) HOẶC \[Thời gian lưu trữ tệp đạt 30 ngày theo QĐ8\] | Tiến trình hệ thống xóa vĩnh viễn tệp văn bản và tệp tài liệu nguồn đối chiếu khỏi máy chủ | `Đã xóa` | U008, QĐ8, FR-12 |
| 16 | `Đã xóa` | Quá trình xóa dữ liệu trên hệ thống tệp và CSDL hoàn tất | Ghi nhận nhật ký thu hồi tài nguyên lưu trữ | `[*]` (Kết thúc) | QĐ8 |

#### Phân tích các cặp chuyển trạng thái bị từ chối (Invalid Transitions)

1.  **`Khởi tạo` → `Đang kiểm chứng` (BỊ TỪ CHỐI):** Không thể bỏ qua bước bóc tách thông tin vì các lớp kiểm chứng tất định đòi hỏi đầu vào có cấu trúc (tác giả, năm, tiêu đề, DOI, vị trí ký tự) chứ không thể xử lý trực tiếp văn bản thô.
2.  **`Đang bóc tách thông tin` → `Hoàn tất` (BỊ TỪ CHỐI):** Bước bóc tách tuyệt đối không đưa ra phán xét hay gán nhãn học thuật; bắt buộc phải đi qua Lớp 1/Lớp 2/Lớp 3 để xác minh tất định.
3.  **`Lỗi xử lý` → `Đã lưu trữ` (BỊ TỪ CHỐI):** Các lượt kiểm tra bị lỗi hệ thống không tạo báo cáo dở dang và không được lưu vào lịch sử để tránh làm sai lệch thống kê và gây hiểu lầm cho người dùng.
4.  **`Đã xóa` → `Đã lưu trữ` (BỊ TỪ CHỐI):** Tệp và dữ liệu đã bị xóa vĩnh viễn theo QĐ8 không thể phục hồi lại trạng thái khả dụng.

### 4.4.2 Sơ đồ trạng thái Phiếu báo lỗi kết quả

#### Ý nghĩa và Căn cứ nghiệp vụ

Thực thể **Phiếu báo lỗi kết quả** thể hiện quy trình phản hồi chất lượng và cơ chế “Human-in-the-loop” giữa người dùng và người kiểm duyệt (U010: Báo lỗi kết quả; U011: Duyệt báo lỗi; U012: Quản lý kho trích dẫn). Vòng đời phiếu báo lỗi tuân thủ nghiêm ngặt: - **QĐ10:** Báo lỗi từ người dùng được đưa vào hàng đợi kiểm duyệt ở trạng thái “Chờ duyệt”, tuyệt đối không làm thay đổi nhãn báo cáo hay kho dữ liệu ngay lập tức. - **Thẩm định chứng cứ:** Moderator xem xét minh chứng và quyết định: - Nếu chấp nhận báo lỗi *“Trích dẫn là bịa”*: tự động đưa trích dẫn vào *Kho trích dẫn ma*. - Nếu chấp nhận báo lỗi *“Trích dẫn có thật bị gán sai”*: gỡ khỏi Kho trích dẫn ma (nếu có) và thêm vào *Danh sách trích dẫn thật đã xác nhận*. - Nếu từ chối: nêu rõ lý do giải thích bằng tiếng Việt và thông báo lại cho người báo. - **Audit log:** Mọi thao tác phê duyệt bắt buộc phải ghi vết kiểm toán (người duyệt, thời điểm, lý do).

#### Sơ đồ trạng thái (State Diagram)

![Hình 4.24. Sơ đồ trạng thái Phiếu báo lỗi kết quả](media/PA02_Nhom04_SC_BaoLoi.png)

Hình 4.24. Sơ đồ trạng thái Phiếu báo lỗi kết quả

#### Bảng chuyển trạng thái (State Transition Table) – Phiếu báo lỗi

Bảng 4.22. Bảng chuyển trạng thái – Phiếu báo lỗi kết quả

| STT | Trạng thái nguồn | Sự kiện kích hoạt (Trigger) \[Điều kiện bảo vệ - Guard\] | Hành động thực hiện (Action) | Trạng thái đích | Căn cứ Use Case & Quy định |
|---|---|---|---|---|---|
| 1 | `[*]` (Bắt đầu) | Người dùng nhấp nút “Báo kết quả sai” tại một mục trên báo cáo | Mở hộp thoại modal báo lỗi, tải sẵn thông tin trích đoạn và mã mục | `Khởi tạo` | U010 |
| 2 | `Khởi tạo` | Người dùng điền phân loại lỗi, lý do, đính kèm URL/tệp chứng cứ và nhấn “Gửi” \[Dữ liệu hợp lệ\] | Sinh mã phiếu theo dõi (Feedback ID), lưu vào bảng `feedbacks`, đẩy vào hàng đợi duyệt của Moderator | `Chờ duyệt` | U010, QĐ10, FR-14 |
| 3 | `Khởi tạo` | Người dùng nhấn nút “Hủy” hoặc nhấp chuột ngoài vùng modal | Đóng hộp thoại, giải phóng dữ liệu nhập tạm thời | `[*]` (Kết thúc) | U010 |
| 4 | `Chờ duyệt` | Moderator mở phiếu báo lỗi từ bảng điều khiển kiểm duyệt (U011) | Khóa tạm thời phiếu để tránh xung đột giữa nhiều Moderator, tải chi tiết chứng cứ và bản ghi nguồn | `Đang thẩm định` | U011, FR-15 |
| 5 | `Đang thẩm định` | Moderator chọn “Hoãn lại để kiểm tra thêm” \[Chưa đủ căn cứ kết luận\] | Mở khóa phiếu, hoàn trả trạng thái về hàng đợi để thẩm định lại sau | `Chờ duyệt` | U011 |
| 6 | `Đang thẩm định` | Moderator bấm “Chấp nhận báo lỗi” \[Chứng cứ xác thực bài báo có thật hoặc trích dẫn bịa\] | Nếu báo trích dẫn bịa: ghi vào Kho ma. Nếu báo trích dẫn thật: gỡ khỏi Kho ma và ghi vào Danh sách thật | `Đã chấp nhận` | U011, U012, QĐ10, FR-15 |
| 7 | `Đang thẩm định` | Moderator bấm “Từ chối báo lỗi” \[Chứng cứ ngụy tạo hoặc trích dẫn vẫn sai lệch\] | Ghi nhận lý do bác bỏ chi tiết bằng tiếng Việt vào hệ thống | `Đã từ chối` | U011, QĐ10 |
| 8 | `Đã chấp nhận` | Hệ thống cập nhật thành công dữ liệu kho tri thức | Ghi nhận bản ghi Audit log (Moderator ID, thời điểm, hành động, lý do); gửi thông báo kết quả cho người báo | `Đã đóng` | U011, QĐ10, FR-15 |
| 9 | `Đã từ chối` | Hệ thống lưu lý do bác bỏ | Ghi nhận bản ghi Audit log; gửi thông báo từ chối kèm lý do phản hồi cho người báo | `Đã đóng` | U011, QĐ10 |
| 10 | `Đã đóng` | Phiếu đã hoàn tất toàn bộ quy trình xử lý và thông báo | Lưu trữ hồ sơ phiếu vào cơ sở dữ liệu phục vụ tra cứu lịch sử kiểm duyệt | `[*]` (Kết thúc) | U011 |

#### Phân tích các cặp chuyển trạng thái bị từ chối (Invalid Transitions)

1.  **`Khởi tạo` → `Đã chấp nhận` (BỊ TỪ CHỐI):** Người dùng không thể tự duyệt báo lỗi của chính mình; bắt buộc phải trải qua khâu thẩm định độc lập của Moderator (chống phá hoại theo R-05, QĐ10).
2.  **`Chờ duyệt` → `Đã chấp nhận` / `Đã từ chối` (BỊ TỪ CHỐI):** Không thể ra quyết định khi chưa chuyển sang trạng thái `Đang thẩm định` (tránh duyệt tự động hoặc duyệt mà không kiểm tra bằng chứng).
3.  **`Đã đóng` → `Chờ duyệt` (BỊ TỪ CHỐI):** Phiếu đã có quyết định chính thức và lưu Audit log thì không được mở lại tùy tiện; nếu có tranh chấp mới, người dùng phải tạo phiếu báo lỗi mới.

### 4.4.3 Sơ đồ trạng thái Tài khoản người dùng

#### Ý nghĩa và Căn cứ nghiệp vụ

Thực thể **Tài khoản người dùng** quản lý vòng đời truy cập, an toàn danh tính và kiểm soát quyền hạn (RBAC) của người dùng trên VeriCite (U001: Đăng ký; U016: Kích hoạt tài khoản; U002: Đăng nhập/Đăng xuất; U017: Đặt lại mật khẩu; U018: Xóa tài khoản; U013: Quản lý người dùng và phân vai; U014: Quản lý hạn mức). Căn cứ quy định: - **QĐ9:** Mật khẩu ≥ 8 ký tự, tuân thủ chuẩn NIST SP 800-63B; băm bằng thuật toán Argon2id; khóa tạm thời 15 phút sau 5 lần đăng nhập thất bại liên tiếp để chống tấn công brute-force. - **FR-01, FR-16:** Phân quyền theo vai (Sinh viên, Giảng viên, Moderator, Quản trị viên); Quản trị viên có quyền khóa/mở khóa tài khoản hoặc thu hồi quyền truy cập khi phát hiện hành vi lạm dụng/vi phạm.

#### Sơ đồ trạng thái (State Diagram)

![Hình 4.25. Sơ đồ trạng thái Tài khoản người dùng](media/PA02_Nhom04_SC_TaiKhoan.png)

Hình 4.25. Sơ đồ trạng thái Tài khoản người dùng

#### Bảng chuyển trạng thái (State Transition Table) – Tài khoản

Bảng 4.23. Bảng chuyển trạng thái – Tài khoản người dùng

| STT | Trạng thái nguồn | Sự kiện kích hoạt (Trigger) \[Điều kiện bảo vệ - Guard\] | Hành động thực hiện (Action) | Trạng thái đích | Căn cứ Use Case & Quy định |
|---|---|---|---|---|---|
| 1 | `[*]` (Bắt đầu) | Người dùng gửi biểu mẫu đăng ký tài khoản (U001) \[Email hợp lệ & mật khẩu đạt chuẩn QĐ9\] | Tạo bản ghi tài khoản ở trạng thái chờ, băm mật khẩu bằng Argon2id, gửi email chứa token kích hoạt | `Chưa kích hoạt` | U001, QĐ9, FR-01 |
| 2 | `Chưa kích hoạt` | Người dùng nhấp vào liên kết xác thực trong email \[Token hợp lệ và còn trong 24 giờ\] | Kích hoạt tài khoản, thiết lập cờ `is_active=True`, gán vai trò mặc định là Sinh viên | `Đang hoạt động` | U016, FR-18 |
| 3 | `Chưa kích hoạt` | Hết thời gian chờ xác thực \[Token quá 24 giờ chưa kích hoạt\] | Xóa bản ghi tài khoản rác khỏi hệ thống | `[*]` (Kết thúc) | U016, QĐ9 |
| 4 | `Đang hoạt động` | Người dùng đăng nhập đúng tài khoản/mật khẩu (U002) | Sinh mã JWT phiên làm việc, thiết lập bộ đếm đăng nhập sai về 0 | `Đang hoạt động` | U002, FR-01 |
| 5 | `Đang hoạt động` | Quản trị viên thực hiện cấp hoặc thu hồi quyền hạn (U013) | Cập nhật vai trò (Sinh viên ≤ftrightarrowGiảng viên ≤ftrightarrow Moderator) và điều chỉnh hạn mức tương ứng (QĐ1–QĐ3) | `Đang hoạt động` | U013, U014, FR-16 |
| 6 | `Đang hoạt động` | Người dùng nhập sai mật khẩu \[Bộ đếm số lần sai đạt mốc 5 lần liên tiếp\] | Tự động kích hoạt cơ chế khóa tài khoản, ghi nhận mốc thời gian khóa 15 phút theo quy định QĐ9 | `Bị khóa tạm thời` | U002 (3a), QĐ9, NFR-04 |
| 7 | `Bị khóa tạm thời` | Người dùng đăng nhập lại \[Thời gian hiện tại ≥ Thời điểm khóa + 15 phút\] HOẶC Thực hiện đặt lại mật khẩu qua email thành công | Tự động mở khóa tài khoản, đặt lại bộ đếm đăng nhập sai về 0, cho phép đăng nhập lại bình thường | `Đang hoạt động` | U002, U017, QĐ9 |
| 8 | `Đang hoạt động` | Quản trị viên kích hoạt chức năng “Khóa tài khoản” (U013) \[Phát hiện tài khoản vi phạm chính sách/spam API\] | Thiết lập trạng thái `is_suspended=True`, lập tức vô hiệu hóa mọi phiên JWT hiện hành của tài khoản | `Bị khóa vĩnh viễn` | U013, FR-16 |
| 9 | `Bị khóa vĩnh viễn` | Quản trị viên chọn “Mở khóa tài khoản” (U013) \[Sau khi kiểm tra giải trình của người dùng\] | Khôi phục trạng thái `is_suspended=False`, gửi email thông báo mở khóa cho người dùng | `Đang hoạt động` | U013, FR-16 |
| 10 | `Đang hoạt động` | Người dùng gửi yêu cầu “Xóa tài khoản cá nhân” \[Xác nhận mật khẩu chính xác\] | Xóa bỏ toàn bộ thông tin cá nhân (email, họ tên), xóa lịch sử kiểm tra theo chính sách quyền riêng tư | `Đã xóa` | U018, QĐ8, NFR-05 |
| 11 | `Bị khóa vĩnh viễn` | Quản trị viên thực hiện chức năng “Xóa vĩnh viễn tài khoản vi phạm” | Xóa vĩnh viễn bản ghi tài khoản khỏi CSDL hệ thống | `Đã xóa` | U013 |
| 12 | `Đã xóa` | Quá trình xóa tài nguyên dữ liệu hoàn tất | Ghi nhận Audit log xóa tài khoản | `[*]` (Kết thúc) | QĐ8 |

#### Phân tích các cặp chuyển trạng thái bị từ chối (Invalid Transitions)

1.  **`Chưa kích hoạt` → `Bị khóa tạm thời` (BỊ TỪ CHỐI):** Tài khoản chưa xác thực email thì chưa thể tham gia quy trình đăng nhập xác thực mật khẩu; do đó không thể bị khóa do nhập sai mật khẩu.
2.  **`Bị khóa tạm thời` → `Đã xóa` (BỊ TỪ CHỐI):** Khi tài khoản đang trong trạng thái bị khóa an ninh 15 phút, mọi thao tác thay đổi thông tin hay xóa tài khoản đều bị chặn để phòng chống kẻ tấn công xóa dấu vết.
3.  **`Bị khóa vĩnh viễn` → `Bị khóa tạm thời` (BỊ TỪ CHỐI):** Khóa vĩnh viễn là quyết định hành chính của Quản trị viên có độ ưu tiên cao hơn khóa tạm thời; không thể tự động hạ cấp xuống khóa tạm thời sau 15 phút.

### 4.4.4 Sơ đồ trạng thái Bản ghi trích dẫn trong kho

#### Ý nghĩa và Căn cứ nghiệp vụ

Thực thể **Bản ghi trích dẫn trong kho tri thức** biểu diễn sự tích lũy tri thức của hệ thống VeriCite, giúp giải quyết triệt để nhược điểm “không tích lũy tri thức” của các công cụ hiện nay (mục 2.1 PA02). Bản ghi này đại diện cho một trích dẫn cụ thể được định danh bằng dấu vân tay (mã băm chuỗi chuẩn hóa tác giả, năm, tiêu đề, nơi đăng, DOI). Căn cứ quy định: - **QĐ4, FR-05:** Tra cứu đối chiếu nhanh dấu vân tay: - Nếu trùng với *Kho trích dẫn ma*: gán ngay nhãn *Mâu thuẫn với nguồn* (được xác nhận là trích dẫn bịa), không gọi API ra ngoài. - Nếu trùng với *Danh sách trích dẫn thật đã xác nhận*: gán ngay nhãn *Đã xác minh*. - **QĐ10, FR-15, U012:** Quy trình cập nhật, điều chỉnh trạng thái và gỡ bỏ bản ghi trong kho bởi Moderator/Quản trị viên.

#### Sơ đồ trạng thái (State Diagram)

![Hình 4.26. Sơ đồ trạng thái Bản ghi trích dẫn trong kho](media/PA02_Nhom04_SC_TrichDanTrongKho.png)

Hình 4.26. Sơ đồ trạng thái Bản ghi trích dẫn trong kho

#### Bảng chuyển trạng thái (State Transition Table) – Trích dẫn trong kho

Bảng 4.24. Bảng chuyển trạng thái – Bản ghi trích dẫn trong kho

| STT | Trạng thái nguồn | Sự kiện kích hoạt (Trigger) \[Điều kiện bảo vệ - Guard\] | Hành động thực hiện (Action) | Trạng thái đích | Căn cứ Use Case & Quy định |
|---|---|---|---|---|---|
| 1 | `[*]` (Bắt đầu) | Hệ thống bóc tách được một trích dẫn học thuật từ văn bản kiểm tra | Chuẩn hóa chuỗi (bỏ ký tự thừa, chữ thường hóa), tính mã băm vân tay (Fingerprint hash) | `Mới phát hiện` | FR-04, FR-05 |
| 2 | `Mới phát hiện` | Tra cứu trong Kho trích dẫn ma \[Trùng khớp mã băm vân tay\] | Gán ngay nhãn *Mâu thuẫn với nguồn*, gắn cảnh báo “Đã xác nhận là trích dẫn bịa”, không gọi CSDL ngoài | `Đã xác nhận ma` | FR-05, QĐ4 |
| 3 | `Mới phát hiện` | Tra cứu Danh sách thật \[Trùng khớp\] HOẶC Tra CSDL mở (Lớp 1) \[Khớp chính xác các trường theo FR-06\] | Gán nhãn *Đã xác minh*, lưu đệm kết quả vào Redis | `Đã xác minh thật` | FR-05, FR-06, QĐ4 |
| 4 | `Mới phát hiện` | Tra cứu tất định trên CrossRef, Semantic Scholar, OpenAlex \[Không tìm thấy bản ghi hoặc lỗi mạng timeout\] | Gán nhãn *Chưa xác minh được* kèm cảnh báo không tìm thấy nguồn (tuyệt đối không quy kết là bịa) | `Chưa xác minh được` | FR-05, QĐ4, NFR-08 |
| 5 | `Chưa xác minh được` | Người dùng báo lỗi kèm minh chứng bài báo có thật và Moderator thẩm tra chấp thuận (U011) | Thêm trích dẫn vào *Danh sách trích dẫn thật đã xác nhận* kèm liên kết chứng cứ | `Đã xác minh thật` | U011, QĐ10, FR-15 |
| 6 | `Chưa xác minh được` | Người dùng hoặc Moderator xác minh độc lập phát hiện đây là trích dẫn do AI tự bịa (U011) | Thêm trích dẫn vào *Kho trích dẫn ma* để chặn đứng các lượt kiểm tra tương lai | `Đã xác nhận ma` | U011, QĐ10, FR-15 |
| 7 | `Đã xác minh thật` | Người dùng gửi phiếu báo lỗi (U010) \[Nghi ngờ bài báo này là trích dẫn ma hoặc bị gán nhầm\] | Gắn cờ cảnh báo nghi ngờ, tạo phiếu chuyển vào hàng đợi thẩm tra của Moderator | `Nghi ngờ sai lệch` | U010, FR-14 |
| 8 | `Đã xác nhận ma` | Người dùng gửi phiếu báo lỗi (U010) \[Khẳng định trích dẫn có thật nhưng bị gắn nhầm vào kho ma\] | Gắn cờ cảnh báo nghi ngờ, tạo phiếu chuyển vào hàng đợi thẩm tra của Moderator | `Nghi ngờ sai lệch` | U010, FR-14 |
| 9 | `Nghi ngờ sai lệch` | Moderator thẩm định \[Xác nhận bằng chứng hợp lệ, trích dẫn là bài báo có thật\] | Gỡ bỏ khỏi Kho trích dẫn ma, thêm vào Danh sách trích dẫn thật đã xác nhận | `Đã xác minh thật` | U011, U012, QĐ10 |
| 10 | `Nghi ngờ sai lệch` | Moderator thẩm định \[Xác nhận khiếu nại không đúng, trích dẫn vẫn hoàn toàn là bịa\] | Giữ nguyên trích dẫn trong Kho trích dẫn ma, đóng cờ nghi ngờ | `Đã xác nhận ma` | U011, QĐ10 |
| 11 | `Đã xác minh thật` | Moderator hoặc Quản trị viên thực hiện chức năng gỡ bỏ (U012) \[Dữ liệu sai lệch hoặc trùng lặp\] | Gỡ bỏ bản ghi khỏi Danh sách trích dẫn thật đã xác nhận | `Đã gỡ bỏ` | U012, FR-15 |
| 12 | `Đã xác nhận ma` | Moderator hoặc Quản trị viên thực hiện chức năng gỡ bỏ (U012) \[Dữ liệu lỗi thời hoặc nhầm lẫn\] | Gỡ bỏ bản ghi khỏi Kho trích dẫn ma | `Đã gỡ bỏ` | U012, FR-15 |
| 13 | `Đã gỡ bỏ` | Quá trình gỡ bỏ bản ghi hoàn tất | Ghi nhận Audit log chi tiết (người gỡ, thời điểm, lý do) | `[*]` (Kết thúc) | U012, QĐ10 |

#### Phân tích các cặp chuyển trạng thái bị từ chối (Invalid Transitions)

1.  **`Mới phát hiện` → `Đã gỡ bỏ` (BỊ TỪ CHỐI):** Trích dẫn mới phát hiện chưa từng được nạp vào kho lưu trữ tri thức (Kho ma hay Danh sách thật) thì không thể thực hiện thao tác gỡ bỏ.
2.  **`Đã xác nhận ma` → `Đã xác minh thật` (BỊ TỪ CHỐI TRỰC TIẾP):** Không thể chuyển trạng thái tức thì từ trích dẫn ma sang trích dẫn thật mà không đi qua bước trung gian `Nghi ngờ sai lệch` và quy trình thẩm định bằng chứng của Moderator (phòng ngừa sửa đổi trái phép).
3.  **`Chưa xác minh được` → `Đã gỡ bỏ` (BỊ TỪ CHỐI):** Trạng thái chưa xác minh chỉ là nhãn đánh giá tạm thời của lượt kiểm tra, chưa phải bản ghi chính thức trong kho tri thức nên không có đối tượng để gỡ bỏ.

# 5 Bản mẫu (Prototype)

## 5.1 Giới thiệu

Prototype của VeriCite là bản mẫu giao diện web có thể bấm chuyển màn hình, dựng bằng công cụ Claude Design (tạo artifact từ loại Design System) với mô hình Claude Opus 5.5, trong 9 lượt chỉnh sửa qua khung chat, qua 6 phiên bản (v1–v6). Bản cuối gồm 18 màn hình cho cả 4 vai (khách, sinh viên/giảng viên, moderator, quản trị viên), có chế độ sáng và tối, và một bản báo cáo trên khổ điện thoại 360 px để thể hiện NFR-09.

Mọi màn hình dùng chung một bộ dữ liệu mẫu tự đặt (không dùng thông tin cá nhân thật): lượt kiểm tra mã **VC-2026-00042** gồm 8 mục, trong đó 3 mục *Đã xác minh*, 2 mục *Chưa xác minh được* và 3 mục *Mâu thuẫn với nguồn*, đủ cả ba lớp kiểm chứng. Nhờ vậy số đếm trên màn hình Báo cáo, bản PDF và Lịch sử phải bằng nhau và kiểm tra được ngay.

Bản prototype bấm được: <https://claude.ai/artifact/42JzbbDu8LMK5fiVpBMXfR>. Nhật ký prompt, các phiên bản và ảnh chế độ tối nằm trong báo cáo thử nghiệm prototype nộp kèm.

Hệ thống màu (design system): màu chính \#4F46E5, nền \#F8FAFC, chữ \#0F172A; nhãn *Đã xác minh* \#15803D trên nền \#DCFCE7, *Chưa xác minh được* \#B45309 trên nền \#FEF3C7, *Mâu thuẫn với nguồn* \#B91C1C trên nền \#FEE2E2; phông Be Vietnam Pro. Nhãn luôn có cả màu, chữ và biểu tượng, không chỉ dùng màu.

## 5.2 Bảng đối chiếu màn hình

Bảng 5.1. Danh sách màn hình prototype và use case tương ứng

| Mã | Màn hình | Vai | Use case | Yêu cầu |
|---|---|---|---|---|
| S01 | Trang chủ và Dùng thử | Khách | U003 | FR-02, QĐ1 |
| S02 | Đăng ký tài khoản | Khách | U001 | FR-01, QĐ9 |
| S03 | Đăng nhập | Mọi vai | U002 | FR-01, FR-16, QĐ9 |
| S04 | Kiểm tra mới (kèm tải tài liệu nguồn) | SV, GV | U004, U005 | FR-03, FR-10, QĐ2, BM1 |
| S05 | Đang xử lý | SV, GV | U004 | FR-04, NFR-01 |
| S06 | Báo cáo kết quả | SV, GV | U006 | FR-05 – FR-09, QĐ4 – QĐ7, BM2 |
| S07 | Hộp thoại Báo kết quả sai | SV, GV | U010 | FR-14, QĐ10 |
| S08 | Xem trước bản PDF | SV, GV | U007 | FR-11, QĐ7, BM2 |
| S09 | Lịch sử kiểm tra | SV, GV | U008 | FR-12, QĐ8 |
| S10 | Kiểm tra hàng loạt | GV | U009 | FR-13, QĐ3 |
| S11 | Báo cáo trên điện thoại (360 px) | SV | U006 | FR-09, NFR-09 |
| S12 | Hàng chờ duyệt báo lỗi | Moderator | U011 | FR-15, QĐ10 |
| S13 | Quản lý kho trích dẫn ma và danh sách trích dẫn thật | Moderator | U012 | FR-15, QĐ10 |
| S14 | Quản lý người dùng và phân vai | Quản trị viên | U013 | FR-01, FR-16 |
| S15 | Quản lý hạn mức | Quản trị viên | U014 | FR-16, QĐ1 – QĐ3 |
| S16 | Thống kê lượt kiểm tra và chi phí API | Quản trị viên | U015 | FR-17, NFR-10 |
| S17 | Từ chối quyền | SV (truy cập trái vai) | U009 (1a), U013 | FR-01, NFR-05 |
| S18 | Báo cáo chế độ Học thuật nghiêm ngặt | SV, GV | U006 (4a), U007 | FR-10, QĐ7 |
| S19 | Kích hoạt tài khoản qua email | Khách | U016 | FR-18, QĐ9 |
| S20 | Đặt lại mật khẩu | Người dùng đã đăng ký | U017 | FR-18, QĐ9 |
| S21 | Xóa tài khoản | Người dùng đã đăng ký | U018 | FR-18, QĐ8 |

Mỗi use case U001–U018 có ít nhất một màn hình. Ba màn hình S19–S21 được bổ sung sau bản prototype v6 cho ba use case U016–U018, cùng hệ thống màu và cách trình bày theo trạng thái như các màn hình còn lại. Hai use case mở rộng được thể hiện trên màn hình của use case gốc: U005 (tải tài liệu nguồn) là vùng tải tệp trong S04; U007 (xuất PDF) mở từ nút “Xuất PDF” của S06 và S18.

## 5.3 Các màn hình

### 5.3.1 S01 – Trang chủ và Dùng thử

![Hình 5.1. S01 – Trang chủ và Dùng thử (U003; FR-02, QĐ1)](media/S01.png)

Hình 5.1. S01 – Trang chủ và Dùng thử (U003; FR-02, QĐ1)

Khách dán tối đa 5 trích dẫn mỗi lượt, tối đa 3 lượt mỗi ngày, có hiển thị số lượt còn lại và thông báo văn bản sẽ được gửi tới dịch vụ LLM. Lượt 6 trích dẫn bị từ chối; hết 3/3 lượt thì mời đăng ký; kết quả dùng thử không lưu lịch sử và khoá nút xuất PDF.

### 5.3.2 S02 – Đăng ký tài khoản

![Hình 5.2. S02 – Đăng ký tài khoản (U001; FR-01, QĐ9)](media/S02.png)

Hình 5.2. S02 – Đăng ký tài khoản (U001; FR-01, QĐ9)

Biểu mẫu đăng ký gồm họ tên, email, mật khẩu, xác nhận mật khẩu và ô đồng ý điều khoản. Mật khẩu chỉ cần ít nhất 8 ký tự và không nằm trong danh sách mật khẩu phổ biến hoặc đã bị lộ (QĐ9), không ép tổ hợp ký tự.

### 5.3.3 S03 – Đăng nhập

![Hình 5.3. S03 – Đăng nhập (U002; FR-01, FR-16, QĐ9)](media/S03.png)

Hình 5.3. S03 – Đăng nhập (U002; FR-01, FR-16, QĐ9)

Ba trạng thái đăng nhập: sai mật khẩu, tạm khoá 15 phút sau 5 lần sai liên tiếp (QĐ9), và tài khoản bị quản trị viên khoá (FR-16).

### 5.3.4 S04 – Kiểm tra mới (kèm tải tài liệu nguồn)

![Hình 5.4. S04 – Kiểm tra mới (kèm tải tài liệu nguồn) (U004, U005; FR-03, FR-10, QĐ2, BM1)](media/S04.png)

Hình 5.4. S04 – Kiểm tra mới (kèm tải tài liệu nguồn) (U004, U005; FR-03, FR-10, QĐ2, BM1)

Dán văn bản hoặc tải tệp PDF, DOCX, TXT; tải một hoặc nhiều tài liệu nguồn (U005); chọn chế độ Thông thường (90%) hoặc Học thuật nghiêm ngặt (95%); hiển thị giới hạn QĐ2, hạn mức còn lại và thông báo gửi văn bản tới LLM. Các lỗi đầu vào (tệp quá 10 MB, sai định dạng, quá 10.000 từ, PDF scan) được báo ngay.

### 5.3.5 S05 – Đang xử lý

![Hình 5.5. S05 – Đang xử lý (U004; FR-04, NFR-01)](media/S05.png)

Hình 5.5. S05 – Đang xử lý (U004; FR-04, NFR-01)

Thanh tiến độ theo bốn công đoạn: tách thông tin, tra cứu CSDL học thuật, so khớp tài liệu nguồn, tổng hợp báo cáo. Có trạng thái lượt lỗi khi LLM lỗi: không gán nhãn dở dang và không trừ hạn mức.

### 5.3.6 S06 – Báo cáo kết quả

![Hình 5.6. S06 – Báo cáo kết quả (U006; FR-05 – FR-09, QĐ4 – QĐ7, BM2)](media/S06.png)

Hình 5.6. S06 – Báo cáo kết quả (U006; FR-05 – FR-09, QĐ4 – QĐ7, BM2)

Phần tóm tắt (mã lượt, thời điểm, chế độ, số mục theo nhãn, tổng 3 + 2 + 3 = 8), văn bản gốc tô màu theo nhãn, danh sách mục xếp theo mức cảnh báo. Mỗi mục có nhãn, mã lý do tiếng Việt, lớp đã kiểm, trường sai kèm giá trị đúng, liên kết nguồn, tô sáng từ khác biệt khi khớp một phần, nút “Báo kết quả sai”; nút “Xuất PDF” ở đầu trang. Không mục nào bị ẩn (QĐ7).

### 5.3.7 S07 – Hộp thoại Báo kết quả sai

![Hình 5.7. S07 – Hộp thoại Báo kết quả sai (U010; FR-14, QĐ10)](media/S07.png)

Hình 5.7. S07 – Hộp thoại Báo kết quả sai (U010; FR-14, QĐ10)

Hộp thoại chọn loại lỗi (Nhãn sai, Nguồn đối chiếu sai, Khác), ghi chú và liên kết bằng chứng. Sau khi gửi hiển thị “Đã gửi, chờ duyệt”; nhãn của mục không đổi và không báo lại được lần hai.

### 5.3.8 S08 – Xem trước bản PDF

![Hình 5.8. S08 – Xem trước bản PDF, trang 1 (U007; FR-11, QĐ7, BM2)](media/S08.png)

Hình 5.8. S08 – Xem trước bản PDF, trang 1 (U007; FR-11, QĐ7, BM2)

![Hình 5.9. S08 – Xem trước bản PDF, trang 2](media/S09.png)

Hình 5.9. S08 – Xem trước bản PDF, trang 2

Bản xem trước PDF có mã lượt, thời điểm, chế độ, phần tóm tắt và đủ 8 mục với nhãn, lý do, liên kết nguồn (khớp S06).

### 5.3.9 S09 – Lịch sử kiểm tra

![Hình 5.10. S09 – Lịch sử kiểm tra (U008; FR-12, QĐ8)](media/S10.png)

Hình 5.10. S09 – Lịch sử kiểm tra (U008; FR-12, QĐ8)

Mỗi dòng lịch sử gồm thời điểm, tên tệp hoặc đoạn đầu văn bản, chế độ, số mục theo 3 nhãn; bấm để mở lại báo cáo. Nút Xoá có hộp thoại xác nhận xoá vĩnh viễn cả báo cáo và tệp; tệp tự xoá sau 30 ngày (QĐ8).

### 5.3.10 S10 – Kiểm tra hàng loạt

![Hình 5.11. S10 – Kiểm tra hàng loạt (U009; FR-13, QĐ3)](media/S11.png)

Hình 5.11. S10 – Kiểm tra hàng loạt (U009; FR-13, QĐ3)

Chỉ giảng viên thấy. Chọn tối đa 30 tệp (31 tệp bị từ chối), tiến độ theo số tệp, bảng tổng hợp theo tệp với số mục theo 3 nhãn, nút xem báo cáo và xuất PDF từng bài; tệp lỗi được đánh dấu kèm lý do mà không dừng các tệp khác.

### 5.3.11 S11 – Báo cáo trên điện thoại (360 px)

![Hình 5.12. S11 – Báo cáo trên điện thoại (360 px) (U006; FR-09, NFR-09)](media/S12.png)

Hình 5.12. S11 – Báo cáo trên điện thoại (360 px) (U006; FR-09, NFR-09)

Báo cáo kết quả trên khổ điện thoại 360 px, giữ đủ tóm tắt, nhãn và danh sách mục (NFR-09).

### 5.3.12 S12 – Hàng chờ duyệt báo lỗi

![Hình 5.13. S12 – Hàng chờ duyệt báo lỗi (U011; FR-15, QĐ10)](media/S13.png)

Hình 5.13. S12 – Hàng chờ duyệt báo lỗi (U011; FR-15, QĐ10)

Hàng chờ báo lỗi ở trạng thái Chờ duyệt; chi tiết gồm mục bị báo, loại lỗi, ghi chú, bằng chứng và bản ghi nguồn hệ thống đã khớp. Ba quyết định, bắt buộc có bằng chứng hoặc lý do (QĐ10).

### 5.3.13 S13 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật

![Hình 5.14. S13 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật (U012; FR-15, QĐ10)](media/S14.png)

Hình 5.14. S13 – Quản lý kho trích dẫn ma và danh sách trích dẫn thật (U012; FR-15, QĐ10)

Hai thẻ Kho trích dẫn ma và Danh sách trích dẫn thật đã xác nhận (có cột bằng chứng); tìm kiếm, sửa, gỡ; nhật ký thay đổi ghi người, thời điểm, lý do.

### 5.3.14 S14 – Quản lý người dùng và phân vai

![Hình 5.15. S14 – Quản lý người dùng và phân vai (U013; FR-01, FR-16)](media/S15.png)

Hình 5.15. S14 – Quản lý người dùng và phân vai (U013; FR-01, FR-16)

Bảng tài khoản (email, vai, trạng thái); khoá, mở khoá, cấp hoặc thu hồi vai Giảng viên, Moderator, có hộp thoại xác nhận trước khi đổi.

### 5.3.15 S15 – Quản lý hạn mức

![Hình 5.16. S15 – Quản lý hạn mức (U014; FR-16, QĐ1 – QĐ3)](media/S16.png)

Hình 5.16. S15 – Quản lý hạn mức (U014; FR-16, QĐ1 – QĐ3)

Hạn mức số lượt mỗi ngày và số trích dẫn mỗi lượt, đặt theo vai hoặc theo từng tài khoản.

### 5.3.16 S16 – Thống kê lượt kiểm tra và chi phí API

![Hình 5.17. S16 – Thống kê lượt kiểm tra và chi phí API (U015; FR-17, NFR-10)](media/S17.png)

Hình 5.17. S16 – Thống kê lượt kiểm tra và chi phí API (U015; FR-17, NFR-10)

Thống kê theo ngày hoặc tuần: số lượt kiểm tra, số mục theo nhãn, số token LLM, chi phí ước tính so với ngân sách (\$8,20/\$10), số lần gọi và tỷ lệ lỗi từng CSDL học thuật; cảnh báo nổi bật khi chi phí vượt 80% ngân sách.

### 5.3.17 S17 – Từ chối quyền

![Hình 5.18. S17 – Từ chối quyền (U009 (1a), U013; FR-01, NFR-05)](media/S18.png)

Hình 5.18. S17 – Từ chối quyền (U009 (1a), U013; FR-01, NFR-05)

Thông báo từ chối khi sinh viên mở chức năng Kiểm tra hàng loạt; quyền được kiểm tra ở phía máy chủ và truy cập trái quyền được ghi nhật ký.

### 5.3.18 S18 – Báo cáo chế độ Học thuật nghiêm ngặt

![Hình 5.19. S18 – Báo cáo chế độ Học thuật nghiêm ngặt (U006 (4a), U007; FR-10, QĐ7)](media/S19.png)

Hình 5.19. S18 – Báo cáo chế độ Học thuật nghiêm ngặt (U006 (4a), U007; FR-10, QĐ7)

Cùng lượt VC-2026-00042 ở chế độ Học thuật nghiêm ngặt: chế độ ghi trên báo cáo, nhóm “Cần xử lý (5)” đưa lên đầu, vẫn đủ 8 mục (QĐ7).

### 5.3.19 S19 – Kích hoạt tài khoản qua email

![Hình 5.20. S19 – Kích hoạt tài khoản qua email (U016; FR-18, QĐ9)](media/5c47d5_S19.png)

Hình 5.20. S19 – Kích hoạt tài khoản qua email (U016; FR-18, QĐ9)

Ba trạng thái sau khi đăng ký: chờ kích hoạt (đã gửi liên kết hiệu lực 24 giờ, nút gửi lại có đếm ngược 60 giây và vô hiệu liên kết cũ), kích hoạt thành công (tài khoản Đang hoạt động, vai Sinh viên) và liên kết không dùng được (hết hạn thì tài khoản bị hủy, phải đăng ký lại; đã dùng hoặc sai thì gửi lại email).

### 5.3.20 S20 – Đặt lại mật khẩu

![Hình 5.21. S20 – Đặt lại mật khẩu (U017; FR-18, QĐ9)](media/S20.png)

Hình 5.21. S20 – Đặt lại mật khẩu (U017; FR-18, QĐ9)

Yêu cầu liên kết bằng email; thông báo sau khi gửi giống nhau cho mọi email để không lộ email nào đã đăng ký; liên kết hiệu lực 30 phút, tối đa 3 lần mỗi giờ. Biểu mẫu mật khẩu mới kiểm tra theo QĐ9 và báo trước rằng mọi phiên cũ sẽ bị đăng xuất.

### 5.3.21 S21 – Xóa tài khoản

![Hình 5.22. S21 – Xóa tài khoản (U018; FR-18, QĐ8)](media/S21.png)

Hình 5.22. S21 – Xóa tài khoản (U018; FR-18, QĐ8)

Trang Tài khoản của tôi: cảnh báo không thể hoàn tác và liệt kê dữ liệu sẽ bị xóa, yêu cầu nhập mật khẩu hiện tại; trạng thái sai mật khẩu (tính vào bộ đếm QĐ9); sau khi xóa, người dùng về trang chủ ở chế độ Khách.

## 5.4 Kết quả đối chiếu prototype với yêu cầu

Prototype được đối chiếu với từng yêu cầu chức năng, từng scenario và các yêu cầu phi chức năng có thể hiện trên giao diện. “Đạt” nghĩa là prototype thể hiện đủ hành vi và trạng thái mà mô tả và tiêu chí kiểm chứng yêu cầu ở phía giao diện; phần xử lý máy chủ (tra cứu thật, băm mật khẩu, thời gian xử lý) nằm ngoài phạm vi một prototype.

Bảng 5.2. Đối chiếu prototype với yêu cầu chức năng FR-01 – FR-18

| ID | Yêu cầu | Màn hình | Bằng chứng trên prototype | Kết quả |
|---|---|---|---|---|
| FR-01 | Đăng ký, đăng nhập, phân quyền theo vai | S02, S03, S14, S17 | Mật khẩu ≥ 8 ký tự, không phổ biến hoặc đã bị lộ; khoá 15 phút sau 5 lần sai; tài khoản mới là Sinh viên; sinh viên mở Kiểm tra hàng loạt bị từ chối | **Đạt** |
| FR-02 | Kiểm tra dùng thử cho khách | S01 | 5 trích dẫn/lượt, 3 lượt/ngày; lượt 6 trích dẫn bị từ chối; hết 3/3 lượt mời đăng ký; không lịch sử, PDF bị khoá | **Đạt** |
| FR-03 | Nhập dữ liệu và tài liệu nguồn | S04 | Dán văn bản, tải PDF/DOCX/TXT, nhiều tài liệu nguồn; lỗi 10 MB, .png, 10.001 từ, PDF scan; thông báo gửi LLM | **Đạt** |
| FR-04 | Tách trích dẫn, câu trích, nhận định | S05 | Công đoạn Tách thông tin, số mục đã tách; lượt lỗi khi LLM lỗi, không gán nhãn. Kiểm tra bám văn bản là xử lý máy chủ | **Đạt (giao diện)** |
| FR-05 | Xác minh sự tồn tại | S06 mục 3, 4, 5 | Không tìm thấy: Chưa xác minh được, liệt kê CSDL đã tra; trùng kho ma: không tra CSDL ngoài, cảnh báo "đã được xác nhận là trích dẫn bịa"; danh sách thật: Đã xác minh | **Đạt** |
| FR-06 | Đối chiếu chi tiết trường | S06 mục 2 | Sai năm: Mâu thuẫn với nguồn, ghi 2021, giá trị đúng 2023 | **Đạt** |
| FR-07 | So khớp câu trích | S06 mục 6, 7 | Khớp 100% trang 12: Đã xác minh; khớp một phần 85% trang 27: Mâu thuẫn, tô sáng từ khác biệt | **Đạt** |
| FR-08 | Nhận định không nguồn, Lớp 3 | S06 mục 8 | Chưa xác minh được, "Chưa có nguồn đối chiếu", 3 tài liệu gợi ý "chỉ để tự tham khảo, không phải bằng chứng" | **Đạt** |
| FR-09 | Gán nhãn và báo cáo | S06, S11 | Văn bản gốc tô màu, bấm số tới mục; xếp theo mức cảnh báo; lý do, lớp, liên kết; tổng 3 + 2 + 3 = 8 | **Đạt** |
| FR-10 | Chọn chế độ rủi ro | S04, S18, S09 | Thông thường 90% / Học thuật nghiêm ngặt 95%; S18 đưa "Cần xử lý (5)" lên đầu, cùng 8 mục; chế độ ghi trên báo cáo, PDF, lịch sử | **Đạt** |
| FR-11 | Xuất báo cáo PDF | S08 | Mã lượt, thời điểm, chế độ, tóm tắt, đủ 8 mục với nhãn, lý do, liên kết | **Đạt** |
| FR-12 | Lịch sử kiểm tra | S09 | Thời điểm, tệp/đoạn đầu, chế độ, số mục theo nhãn, tệp tự xoá sau 30 ngày; xoá có xác nhận | **Đạt** |
| FR-13 | Kiểm tra hàng loạt | S10 | ≤ 30 tệp; tiến độ theo tệp; tệp lỗi kèm lý do; từ chối 31 tệp; đóng trình duyệt vẫn giữ tiến độ | **Đạt** |
| FR-14 | Báo lỗi kết quả | S07 | Loại lỗi, ghi chú, bằng chứng; "Đã gửi, chờ duyệt"; nhãn không đổi; không báo lại lần hai | **Đạt** |
| FR-15 | Kiểm duyệt, kho trích dẫn ma | S12, S13 | 3 quyết định, bắt buộc bằng chứng hoặc lý do; 2 kho có tìm, sửa, gỡ; nhật ký người, thời điểm, lý do | **Đạt** |
| FR-16 | Người dùng và hạn mức | S14, S15, S03, S04 | Khoá, mở khoá, cấp/thu hồi vai có xác nhận; hạn mức theo vai, tài khoản; tài khoản bị khoá không đăng nhập; hết hạn mức không tạo lượt | **Đạt** |
| FR-17 | Thống kê và chi phí API | S16 | Theo ngày/tuần; lượt, mục theo nhãn, token, chi phí $8,20/$10; tỷ lệ lỗi từng CSDL; cảnh báo 80% | **Đạt** |
| FR-18 | Quản lý vòng đời tài khoản cá nhân | S19, S20, S21 | Kích hoạt bằng liên kết 24 giờ, gửi lại có giới hạn; liên kết hết hạn hoặc đã dùng bị từ chối. Đặt lại mật khẩu hiển thị cùng thông báo cho mọi email, kiểm tra mật khẩu mới theo QĐ9. Xóa tài khoản yêu cầu mật khẩu, liệt kê dữ liệu bị xóa, sai mật khẩu tính vào bộ đếm QĐ9. | Đạt |

Năm scenario dùng để kiểm tra prototype: SC-01 sinh viên kiểm tra danh mục tham khảo do AI tạo; SC-02 so khớp câu trích với giáo trình; SC-03 giảng viên kiểm tra hàng loạt; SC-04 báo lỗi và cập nhật kho trích dẫn ma; SC-05 khách dùng thử.

Bảng 5.3. Đối chiếu prototype với scenario SC-01 – SC-05

| ID | Scenario | Luồng thay thế đã thể hiện | Màn hình | Kết quả |
|---|---|---|---|---|
| SC-01 | Sinh viên kiểm tra danh mục tham khảo do AI tạo | 2a vượt giới hạn / hết hạn mức; 4a LLM lỗi; 5a không tìm thấy; 5b sai năm; 5c trùng kho ma; 5d không tra cứu được (mẫu ResultItem); 5e danh sách thật | S04, S05, S06, S08, S09 | **Đạt** |
| SC-02 | Sinh viên so khớp câu trích với giáo trình | 1a PDF scan; 3a khớp một phần, tô sáng; 5a chế độ nghiêm ngặt 95% | S04, S06, S18 | **Đạt** |
| SC-03 | Giảng viên kiểm tra hàng loạt | 1a không phải giảng viên; 2a hơn 30 tệp; 3a tệp hỏng kèm lý do | S10, S17 | **Đạt** |
| SC-04 | Báo lỗi và cập nhật kho trích dẫn ma | 1a đã báo trước đó; 4a từ chối kèm lý do; 4b trích dẫn thật kèm bằng chứng | S07, S12, S13 | **Đạt** |
| SC-05 | Khách dùng thử | 1a hơn 5 trích dẫn; 1b hết 3 lượt; 3a muốn xuất PDF thì mời đăng ký | S01 | **Đạt** |

Bảng 5.4. Đối chiếu prototype với yêu cầu phi chức năng

| ID | Yêu cầu | Ghi chú | Kết quả |
|---|---|---|---|
| NFR-06 | Minh bạch kết quả | Mỗi mục có lý do tiếng Việt, lớp đã kiểm, liên kết; dòng truy vết mô hình, prompt, thời điểm tra cứu | **Đạt** |
| NFR-08 | Chịu lỗi dịch vụ ngoài | Mã L1-KHONG-TRA-CUU "không tra cứu được"; lượt lỗi LLM không có kết quả dở dang | **Đạt (giao diện)** |
| NFR-09 | Dễ dùng | Giao diện tiếng Việt; báo cáo khổ 360 px; chế độ sáng/tối; nhãn có chữ, màu và hình | **Đạt (giao diện)** |
| NFR-01, 02, 03, 04, 05, 07, 10, 11 | Hiệu năng, độ chính xác, tải, bảo mật, tái lập, chi phí, sao lưu | Cần đo trên hệ thống đã cài đặt (TC-04, TC-05, TC-19–TC-24); prototype chỉ thể hiện thông báo liên quan (ví dụ ghi nhật ký khi từ chối quyền) | **Kiểm ở hệ thống thật** |

## 5.5 Ghi chú

- Tất cả 18 yêu cầu chức năng và 5 scenario đều đạt ở phía giao diện. Các NFR về hiệu năng, độ chính xác, chịu tải, bảo mật, tái lập, chi phí và sao lưu chỉ đo được trên hệ thống đã cài đặt; prototype chỉ thể hiện thông báo liên quan.
- Hai điểm prototype đang thể hiện tạm: cơ chế đồng ý gửi dữ liệu tới LLM (hiện là thông báo kèm ô xác nhận) và cách xác thực bản PDF (mã lượt, dấu thời gian, mã QR) sẽ được chốt ở giai đoạn thiết kế.
- Ba màn hình S19–S21 (U016–U018) được bổ sung sau bản v6 dưới dạng ảnh tĩnh theo cùng hệ thống màu; cần đưa vào bản prototype bấm chuyển màn hình ở lần cập nhật kế tiếp.

# Phụ lục A. Ma trận truy vết yêu cầu

Bảng dưới cho thấy mỗi yêu cầu chức năng đều có ít nhất một use case và một màn hình prototype tương ứng.

Bảng A.1. Ma trận truy vết FR – use case – màn hình

| Yêu cầu | Tên yêu cầu | Use case | Màn hình |
|---|---|---|---|
| FR-01 | Đăng ký, đăng nhập và phân quyền theo vai | U001, U002, U013 | S02, S03, S14, S17 |
| FR-02 | Kiểm tra dùng thử cho khách vãng lai | U003 | S01 |
| FR-03 | Nhập dữ liệu kiểm tra và tải tài liệu nguồn | U004, U005 | S04 |
| FR-04 | Bóc tách trích dẫn, câu trích và nhận định | U004 | S05 |
| FR-05 | Xác minh sự tồn tại của trích dẫn (Lớp 1) | U004 | S06 |
| FR-06 | Đối chiếu chi tiết các trường trích dẫn (Lớp 1) | U004 | S06 |
| FR-07 | So khớp câu trích với tài liệu nguồn (Lớp 2) | U004, U005 | S06 |
| FR-08 | Đánh dấu nhận định thiếu nguồn và gợi ý tài liệu (Lớp 3) | U004 | S06 |
| FR-09 | Gán nhãn và tổng hợp báo cáo chi tiết | U004, U006 | S06, S11 |
| FR-10 | Tùy chọn chế độ rủi ro kiểm tra | U004, U006 | S04, S09, S18 |
| FR-11 | Xuất báo cáo kết quả định dạng PDF | U007 | S08 |
| FR-12 | Quản lý và tra cứu lịch sử kiểm tra cá nhân | U008 | S09 |
| FR-13 | Kiểm tra bài nộp hàng loạt cho giảng viên | U009 | S10 |
| FR-14 | Báo lỗi kết quả kiểm tra | U010 | S07 |
| FR-15 | Kiểm duyệt báo lỗi và quản lý kho trích dẫn | U011, U012 | S12, S13 |
| FR-16 | Quản lý người dùng và hạn mức | U013, U014 | S03, S14, S15 |
| FR-17 | Thống kê lượt kiểm tra và giám sát chi phí API | U015 | S16 |
| FR-18 | Quản lý vòng đời tài khoản cá nhân | U016, U017, U018 | S19, S20, S21 |

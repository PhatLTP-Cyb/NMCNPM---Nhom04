# BÀI TẬP TUẦN 5: MÔ HÌNH HOÁ YÊU CẦU PHẦN MỀM
## ỨNG DỤNG THEO DÕI SỨC KHOẺ TRÊN SMARTWATCH VÀ SMARTPHONE

**Nhóm:** Nhóm 04 · **Môn học:** Nhập môn Công nghệ Phần mềm  
**Thành viên thực hiện (TV-B):** Vương Hữu Khang · **MSSV:** 24120070  
**Phạm vi phụ trách:** Phân tích phân hệ Smartwatch, Sơ đồ Use Case toàn hệ thống, Đặc tả Use Case A ("Ghi nhận hoạt động thể chất"), và State Chart diagram đối tượng "Hoạt động thể chất".  
**Ngày hoàn thành:** 15/10/2026  

---

## MỤC LỤC BÁO CÁO TV-B
1. [Thống nhất phân hệ, danh sách Actor và Use Case](#1-thong-nhat-phan-he-actor-va-use-case)
2. [Yêu cầu 1: Sơ đồ Use Case toàn hệ thống](#2-so-do-use-case-toan-he-thong)
   - 2.1. Sơ đồ Use Case SVG (2 hộp phân hệ Smartwatch & Smartphone)
   - 2.2. Bảng ghi chú quan hệ include và extend
   - 2.3. Bảng ghi chú phân hệ (Use case liên quan cả hai phân hệ)
3. [Yêu cầu 2: Bản đặc tả Use Case A (Phân hệ Smartwatch)](#3-dac-ta-use-case-a-ghi-nhan-hoat-dong-the-chat)
   - 3.1. Lý do chọn Use Case
   - 3.2. Bản đặc tả chi tiết 14 mục theo chuẩn bài giảng (UC-01)
4. [Yêu cầu 4: State Chart Diagram đối tượng "Hoạt động thể chất"](#4-state-chart-diagram-hoat-dong-the-chat)
   - 4.1. Sơ đồ State Chart SVG
   - 4.2. Bảng chuyển trạng thái (State Transition Table)
   - 4.3. Bảng các cặp (trạng thái, sự kiện) bị từ chối

---

<a id="1-thong-nhat-phan-he-actor-va-use-case"></a>
## 1. THỐNG NHẤT PHÂN HỆ, ACTOR VÀ USE CASE

Hệ thống được thiết kế phân định rạch ròi thành hai phân hệ phần mềm chạy trên hai nền tảng phần cứng khác nhau:
- **Phân hệ Smartwatch (Đồng hồ thông minh):** Chuyên trách thu thập dữ liệu thời gian thực từ phần cứng cảm biến (gia tốc kế, nhịp tim quang học PPG, chip GPS), phát hiện vận động, hiển thị thông số tức thời và lưu trữ bộ đệm phiên tập khi hoạt động diễn ra.
- **Phân hệ Smartphone (Điện thoại di động):** Chuyên trách nhận dữ liệu đồng bộ, lưu trữ lâu dài, phân tích dữ liệu chuyên sâu (lộ trình bản đồ, biểu đồ tốc độ/nhịp tim, calo, độ cao), quản lý lịch biểu lặp lại, phát cảnh báo nhắc nhở và chia sẻ kết quả lên mạng xã hội.

### 1.1. Danh sách Actor
| Tên Actor | Phân loại | Mô tả vai trò | Phân hệ tương tác |
|---|---|---|---|
| **Người dùng** *(User)* | Actor chính (Human) | Người đeo đồng hồ thông minh và sở hữu điện thoại; thực hiện hoạt động thể chất, ra lệnh dừng/kết thúc trên đồng hồ, xem thống kê, đặt mục tiêu, lập lịch và chia sẻ kết quả trên điện thoại. | Cả hai phân hệ |
| **Dịch vụ bản đồ** *(Map Service)* | Actor phụ / Hệ thống ngoài (External System) | Dịch vụ bản đồ trực quan của bên thứ ba (Google Maps, Apple Maps API, OpenStreetMap); cung cấp dữ liệu bản đồ nền và hiển thị lộ trình GPS di chuyển. | Phân hệ Smartphone |
| **Mạng xã hội** *(Social Networks)* | Actor phụ / Hệ thống ngoài (External System) | Các nền tảng xã hội (Facebook, Twitter, Instagram...); tiếp nhận bài đăng chia sẻ kết quả hoạt động thể chất từ smartphone. | Phân hệ Smartphone |

*Ghi chú về các kích hoạt tự động (không phải Actor người):*
- **Cảm biến chuyển động (Smartwatch):** Tự động phát hiện vận động thể chất và kích hoạt theo dõi sức khỏe mà không cần người dùng bấm bắt đầu.
- **Bộ đếm thời gian hệ thống (Smartphone Timer):** Tự động quét lịch biểu và kích hoạt use case nhắc nhở khi sắp đến giờ tập.
- **Bộ phát hiện kết nối Bluetooth:** Tự động kích hoạt quy trình đồng bộ dữ liệu khi hai thiết bị đã ghép đôi vào vùng kết nối.

### 1.2. Danh sách Use Case theo 2 hộp phân hệ
| Phân hệ | Mã UC | Tên Use Case | Actor liên kết | Mục tiêu chính |
|---|---|---|---|---|
| **Smartwatch** | **UC-01** | **Ghi nhận hoạt động thể chất** *(Use case trọng tâm - TV-B đặc tả)* | Người dùng | Theo dõi, thu thập và hiển thị thông số sức khỏe trong khi tập luyện. |
| Smartwatch | UC-02 | Tự động nhận biết hoạt động thể chất | Cảm biến chuyển động | Phân loại hoạt động (đi bộ, chạy bộ, đạp xe, bơi lội) dựa trên dữ liệu gia tốc. |
| Smartwatch | UC-03 | Cập nhật thông số tức thời | Smartwatch | Lấy mẫu và hiển thị quãng đường, thời gian, tốc độ, nhịp tim chu kỳ 1s. |
| Smartwatch | UC-04 | Tạm dừng / Tiếp tục hoạt động thể chất | Người dùng | Tạm dừng tính thời gian và quãng đường khi người dùng dừng nghỉ. |
| Smartwatch | UC-05 | Kết thúc hoạt động thể chất | Người dùng | Nhận lệnh kết thúc, chốt dữ liệu và lưu tạm vào bộ nhớ đồng hồ. |
| Smartwatch | UC-06 | Tự động đồng bộ dữ liệu sang điện thoại | Smartwatch / Bluetooth | Gửi gói dữ liệu hoạt động đã lưu tạm sang smartphone qua Bluetooth. |
| **Smartphone** | UC-07 | Nhận dữ liệu đồng bộ từ đồng hồ | Smartphone / Bluetooth | Tiếp nhận gói dữ liệu từ đồng hồ, lưu vào CSDL smartphone và gửi ACK xác nhận. |
| Smartphone | UC-08 | Xem danh sách hoạt động thể chất | Người dùng | Hiển thị toàn bộ các hoạt động thể chất đã thực hiện theo trình tự thời gian. |
| Smartphone | UC-09 | Xem thống kê tổng hợp | Người dùng | Tổng hợp số lượng hoạt động, tổng quãng đường theo tuần, tháng, năm. |
| Smartphone | UC-10 | Xem phân tích chi tiết hoạt động | Người dùng, Dịch vụ bản đồ | Xem chi tiết 1 hoạt động: lộ trình bản đồ, calo tiêu thụ, độ cao thay đổi. |
| Smartphone | UC-11 | Xem biểu đồ phân tích tốc độ và nhịp tim | Người dùng | Xem thống kê tốc độ/nhịp tim trung bình, chi tiết từng km và biểu đồ thời gian. |
| Smartphone | UC-12 | Chia sẻ kết quả lên mạng xã hội | Người dùng, Mạng xã hội | Đăng hình ảnh, thông số kết quả hoạt động lên Facebook, Twitter, Instagram... |
| Smartphone | UC-13 | Quản lý lịch biểu hoạt động | Người dùng | Tạo mới, chỉnh sửa, xóa lịch biểu hoạt động lặp lại định kỳ. |
| Smartphone | UC-14 | Nhắc nhở theo lịch biểu | Thời gian (Timer) | Phát thông báo nhắc nhở trước giờ diễn ra hoạt động theo lịch đã cài đặt. |
| Smartphone | UC-15 | Đặt mục tiêu hoạt động | Người dùng | Thiết lập chỉ tiêu quãng đường, thời gian, tốc độ trung bình cho hoạt động. |
| Smartphone | UC-16 | Đánh giá mục tiêu và đưa ra lời khuyên | Smartphone | So sánh kết quả thực hiện với mục tiêu, hiển thị lời khuyên khi không đạt. |

---

<a id="2-so-do-use-case-toan-he-thong"></a>
## 2. SƠ ĐỒ USE CASE TOÀN HỆ THỐNG (YÊU CẦU 1)

### 2.1. Sơ đồ Use Case SVG (2 hộp phân hệ: Smartwatch & Smartphone)
Sơ đồ tuân thủ chặt chẽ chuẩn UML:
- 2 ranh giới phân hệ rõ ràng (2 boxes): `Phân hệ Smartwatch` và `Phân hệ Smartphone`.
- Actor nằm bên ngoài các hộp.
- Quan hệ `<<include>>` và `<<extend>>` dùng đường nét đứt, mũi tên nhọn hở đầu hướng đúng chuẩn UML (include: từ use case cơ sở trỏ đến use case thành phần; extend: từ use case mở rộng trỏ về use case cơ sở kèm điều kiện trong ngoặc vuông `[...]`).

```xml
<svg id="uc-svg" viewBox="0 0 1140 780" xmlns="http://www.w3.org/2000/svg" font-family="'Be Vietnam Pro', system-ui, sans-serif">
  <defs>
    <!-- Mũi tên nét đứt include / extend -->
    <marker id="uc-open" markerUnits="userSpaceOnUse" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="11" markerHeight="11" orient="auto">
      <path d="M1 1L9 5L1 9" fill="none" stroke="#2f4b7c" stroke-width="1.6"/>
    </marker>
    <style>
      .sys-box { fill: #ffffff; stroke: #2f4b7c; stroke-width: 2; rx: 14; }
      .box-head { fill: #e8eef9; stroke: #2f4b7c; stroke-width: 1.5; }
      .uc-oval { fill: #fbfcfe; stroke: #2f4b7c; stroke-width: 1.6; }
      .uc-oval.core { fill: #f2f6fd; stroke: #2f4b7c; stroke-width: 2.2; }
      .uc-text { font-size: 13.5px; fill: #1f2937; text-anchor: middle; font-weight: 500; }
      .uc-text.bold { font-weight: 700; fill: #1f2f52; }
      .actor-line { stroke: #1f2937; stroke-width: 1.8; fill: none; stroke-linecap: round; }
      .actor-head { fill: #f7f8fa; stroke: #1f2937; stroke-width: 1.8; }
      .actor-label { font-size: 14px; font-weight: 700; fill: #1f2937; text-anchor: middle; }
      .assoc { stroke: #475569; stroke-width: 1.4; fill: none; }
      .dep-inc { stroke: #2f4b7c; stroke-width: 1.5; stroke-dasharray: 6 4; fill: none; }
      .dep-ext { stroke: #b9852f; stroke-width: 1.5; stroke-dasharray: 6 4; fill: none; }
      .dep-lbl { font-size: 12px; font-style: italic; font-weight: 600; text-anchor: middle; }
      .lbl-inc { fill: #2f4b7c; }
      .lbl-ext { fill: #925f18; }
      .cond-lbl { font-size: 11px; fill: #70472f; text-anchor: middle; }
      .halo { paint-order: stroke; stroke: #ffffff; stroke-width: 5px; stroke-linejoin: round; }
    </style>
  </defs>

  <!-- NỀN TỔNG THỂ -->
  <rect x="0" y="0" width="1140" height="780" fill="#f7f8fa" rx="16"/>

  <!-- ==================== HỘP 1: PHÂN HỆ SMARTWATCH ==================== -->
  <g id="box-smartwatch">
    <rect x="150" y="30" width="410" height="710" class="sys-box"/>
    <rect x="150" y="30" width="410" height="38" rx="14" class="box-head"/>
    <rect x="150" y="54" width="410" height="14" fill="#e8eef9"/>
    <line x1="150" y1="68" x2="560" y2="68" stroke="#2f4b7c" stroke-width="1.5"/>
    <text x="355" y="55" text-anchor="middle" font-size="15px" font-weight="800" fill="#1f2f52" letter-spacing="0.04em">PHÂN HỆ SMARTWATCH (ĐỒNG HỒ THÔNG MINH)</text>

    <!-- UC-02: Tự động nhận biết HĐ -->
    <g id="uc-02">
      <ellipse cx="355" cy="110" rx="140" ry="26" class="uc-oval"/>
      <text x="355" y="115" class="uc-text">UC-02: Tự động nhận biết HĐ thể chất</text>
    </g>

    <!-- UC-01: Ghi nhận hoạt động thể chất (Chính) -->
    <g id="uc-01">
      <ellipse cx="355" cy="205" rx="148" ry="30" class="uc-oval core"/>
      <text x="355" y="202" class="uc-text bold">UC-01: Ghi nhận hoạt động thể chất</text>
      <text x="355" y="220" font-size="11.5px" fill="#5b6472" text-anchor="middle">(Đặc tả chính của TV-B)</text>
    </g>

    <!-- UC-03: Cập nhật thông số tức thời -->
    <g id="uc-03">
      <ellipse cx="355" cy="300" rx="140" ry="26" class="uc-oval"/>
      <text x="355" y="305" class="uc-text">UC-03: Cập nhật thông số tức thời</text>
    </g>

    <!-- UC-04: Tạm dừng / Tiếp tục -->
    <g id="uc-04">
      <ellipse cx="270" cy="405" rx="105" ry="26" class="uc-oval"/>
      <text x="270" y="402" class="uc-text">UC-04: Tạm dừng /</text>
      <text x="270" y="418" class="uc-text">Tiếp tục hoạt động</text>
    </g>

    <!-- UC-05: Kết thúc hoạt động thể chất -->
    <g id="uc-05">
      <ellipse cx="445" cy="405" rx="100" ry="26" class="uc-oval"/>
      <text x="445" y="402" class="uc-text">UC-05: Kết thúc</text>
      <text x="445" y="418" class="uc-text">hoạt động thể chất</text>
    </g>

    <!-- UC-06: Tự động đồng bộ dữ liệu sang điện thoại -->
    <g id="uc-06">
      <ellipse cx="355" cy="540" rx="148" ry="30" class="uc-oval core"/>
      <text x="355" y="537" class="uc-text bold">UC-06: Tự động đồng bộ</text>
      <text x="355" y="555" class="uc-text">dữ liệu sang điện thoại</text>
    </g>

    <!-- QUAN HỆ TRONG SMARTWATCH -->
    <!-- UC-01 include UC-02 -->
    <path d="M355 175 L355 137" class="dep-inc" marker-end="url(#uc-open)"/>
    <text x="355" y="158" class="dep-lbl lbl-inc halo">«include»</text>

    <!-- UC-01 include UC-03 -->
    <path d="M355 235 L355 273" class="dep-inc" marker-end="url(#uc-open)"/>
    <text x="355" y="258" class="dep-lbl lbl-inc halo">«include»</text>

    <!-- UC-04 extend UC-01 -->
    <path d="M295 380 L330 234" class="dep-ext" marker-end="url(#uc-open)"/>
    <text x="282" y="295" class="dep-lbl lbl-ext halo">«extend»</text>
    <text x="282" y="310" class="cond-lbl halo">[người dùng tạm dừng]</text>

    <!-- UC-01 include UC-05 -->
    <path d="M380 234 L425 380" class="dep-inc" marker-end="url(#uc-open)"/>
    <text x="430" y="295" class="dep-lbl lbl-inc halo">«include»</text>
  </g>

  <!-- ==================== HỘP 2: PHÂN HỆ SMARTPHONE ==================== -->
  <g id="box-smartphone">
    <rect x="620" y="30" width="460" height="710" class="sys-box"/>
    <rect x="620" y="30" width="460" height="38" rx="14" class="box-head"/>
    <rect x="620" y="54" width="460" height="14" fill="#e8eef9"/>
    <line x1="620" y1="68" x2="1080" y2="68" stroke="#2f4b7c" stroke-width="1.5"/>
    <text x="850" y="55" text-anchor="middle" font-size="15px" font-weight="800" fill="#1f2f52" letter-spacing="0.04em">PHÂN HỆ SMARTPHONE (ĐIỆN THOẠI DI ĐỘNG)</text>

    <!-- UC-08: Xem danh sách HĐ -->
    <g id="uc-08">
      <ellipse cx="760" cy="105" rx="115" ry="24" class="uc-oval"/>
      <text x="760" y="110" class="uc-text">UC-08: Xem danh sách HĐ</text>
    </g>

    <!-- UC-09: Xem thống kê tổng hợp -->
    <g id="uc-09">
      <ellipse cx="760" cy="165" rx="120" ry="24" class="uc-oval"/>
      <text x="760" y="170" class="uc-text">UC-09: Xem thống kê tổng hợp</text>
    </g>

    <!-- UC-10: Xem phân tích chi tiết hoạt động -->
    <g id="uc-10">
      <ellipse cx="760" cy="235" rx="125" ry="26" class="uc-oval core"/>
      <text x="760" y="239" class="uc-text bold">UC-10: Xem phân tích chi tiết HĐ</text>
    </g>

    <!-- UC-11: Xem biểu đồ tốc độ & nhịp tim -->
    <g id="uc-11">
      <ellipse cx="945" cy="235" rx="115" ry="26" class="uc-oval"/>
      <text x="945" y="232" class="uc-text">UC-11: Xem biểu đồ</text>
      <text x="945" y="248" class="uc-text">tốc độ &amp; nhịp tim</text>
    </g>

    <!-- UC-12: Chia sẻ kết quả lên mạng xã hội -->
    <g id="uc-12">
      <ellipse cx="760" cy="315" rx="125" ry="26" class="uc-oval"/>
      <text x="760" y="320" class="uc-text">UC-12: Chia sẻ lên mạng xã hội</text>
    </g>

    <!-- UC-13: Quản lý lịch biểu hoạt động -->
    <g id="uc-13">
      <ellipse cx="760" cy="390" rx="125" ry="26" class="uc-oval"/>
      <text x="760" y="395" class="uc-text">UC-13: Quản lý lịch biểu HĐ</text>
    </g>

    <!-- UC-14: Nhắc nhở theo lịch biểu -->
    <g id="uc-14">
      <ellipse cx="945" cy="390" rx="115" ry="26" class="uc-oval core"/>
      <text x="945" y="387" class="uc-text bold">UC-14: Nhắc nhở</text>
      <text x="945" y="403" class="uc-text">theo lịch biểu</text>
    </g>

    <!-- UC-15: Đặt mục tiêu hoạt động -->
    <g id="uc-15">
      <ellipse cx="760" cy="465" rx="120" ry="25" class="uc-oval"/>
      <text x="760" y="470" class="uc-text">UC-15: Đặt mục tiêu hoạt động</text>
    </g>

    <!-- UC-16: Đánh giá mục tiêu & lời khuyên -->
    <g id="uc-16">
      <ellipse cx="945" cy="465" rx="118" ry="26" class="uc-oval"/>
      <text x="945" y="462" class="uc-text">UC-16: Đánh giá mục tiêu</text>
      <text x="945" y="478" class="uc-text">&amp; đưa ra lời khuyên</text>
    </g>

    <!-- UC-07: Nhận dữ liệu đồng bộ từ đồng hồ -->
    <g id="uc-07">
      <ellipse cx="760" cy="540" rx="125" ry="30" class="uc-oval core"/>
      <text x="760" y="537" class="uc-text bold">UC-07: Nhận dữ liệu đồng bộ</text>
      <text x="760" y="555" class="uc-text">từ đồng hồ thông minh</text>
    </g>

    <!-- QUAN HỆ TRONG SMARTPHONE -->
    <!-- UC-11 extend UC-10 -->
    <path d="M830 235 L884 235" class="dep-ext" marker-end="url(#uc-open)"/>
    <text x="857" y="222" class="dep-lbl lbl-ext halo">«extend»</text>
    <text x="857" y="253" class="cond-lbl halo">[xem chi tiết km/biểu đồ]</text>

    <!-- UC-14 include/extend từ lịch biểu -->
    <path d="M885 390 L831 390" class="dep-inc" marker-end="url(#uc-open)"/>
    <text x="858" y="380" class="dep-lbl lbl-inc halo">«include»</text>

    <!-- UC-16 extend UC-15 -->
    <path d="M827 465 L881 465" class="dep-ext" marker-end="url(#uc-open)"/>
    <text x="854" y="452" class="dep-lbl lbl-ext halo">«extend»</text>
    <text x="854" y="490" class="cond-lbl halo">[không đạt mục tiêu]</text>
  </g>

  <!-- ==================== QUAN HỆ GIỮA 2 PHÂN HỆ ==================== -->
  <!-- UC-06 đồng bộ sang UC-07 qua Bluetooth -->
  <path d="M504 540 L634 540" class="dep-inc" stroke-width="2.2" marker-end="url(#uc-open)"/>
  <rect x="525" y="515" width="90" height="20" rx="4" fill="#ffffff" stroke="#2f4b7c" stroke-width="1"/>
  <text x="570" y="529" font-size="11.5px" font-weight="700" fill="#2f4b7c" text-anchor="middle">«Bluetooth»</text>
  <text x="570" y="555" font-size="11px" font-style="italic" fill="#5b6472" text-anchor="middle">[đã ghép đôi]</text>

  <!-- ==================== ACTORS ==================== -->
  <!-- ACTOR 1: NGƯỜI DÙNG (BÊN TRÁI) -->
  <g id="actor-user" transform="translate(65, 300)">
    <circle cx="0" cy="0" r="14" class="actor-head"/>
    <line x1="0" y1="14" x2="0" y2="52" class="actor-line"/>
    <line x1="-22" y1="26" x2="22" y2="26" class="actor-line"/>
    <line x1="0" y1="52" x2="-18" y2="82" class="actor-line"/>
    <line x1="0" y1="52" x2="18" y2="82" class="actor-line"/>
    <text x="0" y="106" class="actor-label">Người dùng</text>
    <text x="0" y="122" font-size="11.5px" fill="#5b6472" text-anchor="middle">(User)</text>
  </g>

  <!-- ĐƯỜNG NỐI (ASSOCIATION) TỪ NGƯỜI DÙNG SANG CÁC USE CASE -->
  <!-- Nối tới Smartwatch UC-01 -->
  <line x1="90" y1="310" x2="218" y2="220" class="assoc"/>
  <!-- Nối tới Smartwatch UC-04 -->
  <line x1="90" y1="330" x2="175" y2="395" class="assoc"/>
  <!-- Nối tới Smartwatch UC-05 -->
  <line x1="90" y1="350" x2="350" y2="415" class="assoc"/>

  <!-- Nối tới Smartphone UC-08 -->
  <path d="M85 270 Q 200 120 645 105" class="assoc"/>
  <!-- Nối tới Smartphone UC-09 -->
  <path d="M85 285 Q 300 160 640 165" class="assoc"/>
  <!-- Nối tới Smartphone UC-10 -->
  <path d="M90 300 Q 320 220 635 235" class="assoc"/>
  <!-- Nối tới Smartphone UC-12 -->
  <path d="M90 320 Q 340 310 635 315" class="assoc"/>
  <!-- Nối tới Smartphone UC-13 -->
  <path d="M90 340 Q 330 380 635 390" class="assoc"/>
  <!-- Nối tới Smartphone UC-15 -->
  <path d="M90 360 Q 320 460 640 465" class="assoc"/>

  <!-- ACTOR 2: DỊCH VỤ BẢN ĐỒ (BÊN PHẢI TRÊN) -->
  <g id="actor-map" transform="translate(1010, 140)">
    <rect x="-48" y="-18" width="96" height="36" rx="8" fill="#eef1f5" stroke="#2f4b7c" stroke-width="1.8"/>
    <text x="0" y="-1" font-size="12.5px" font-weight="700" fill="#1f2f52" text-anchor="middle">«hệ thống»</text>
    <text x="0" y="14" font-size="12.5px" font-weight="700" fill="#2f4b7c" text-anchor="middle">Dịch vụ bản đồ</text>
  </g>
  <line x1="962" y1="140" x2="880" y2="225" class="assoc"/>

  <!-- ACTOR 3: MẠNG XÃ HỘI (BÊN PHẢI GIỮA) -->
  <g id="actor-social" transform="translate(1010, 315)">
    <rect x="-48" y="-18" width="96" height="36" rx="8" fill="#eef1f5" stroke="#2f4b7c" stroke-width="1.8"/>
    <text x="0" y="-1" font-size="12.5px" font-weight="700" fill="#1f2f52" text-anchor="middle">«hệ thống»</text>
    <text x="0" y="14" font-size="12.5px" font-weight="700" fill="#2f4b7c" text-anchor="middle">Mạng xã hội</text>
  </g>
  <line x1="962" y1="315" x2="885" y2="315" class="assoc"/>

  <!-- ACTOR 4: THỜI GIAN (HỆ THỐNG PHÁT NHẮC NHỞ) -->
  <g id="actor-time" transform="translate(1010, 390)">
    <circle cx="0" cy="0" r="14" fill="#fffdf8" stroke="#b9852f" stroke-width="1.8"/>
    <path d="M0 -9 L0 0 L6 4" stroke="#b9852f" stroke-width="1.8" fill="none"/>
    <text x="0" y="26" font-size="11.5px" font-weight="700" fill="#925f18" text-anchor="middle">Thời gian</text>
  </g>
  <line x1="996" y1="390" x2="1060" y2="390" class="assoc" stroke="#b9852f"/>

  <!-- CHÚ THÍCH KÝ HIỆU (LEGEND) -->
  <g id="legend" transform="translate(150, 746)">
    <rect x="0" y="0" width="830" height="26" fill="#ffffff" stroke="#d8dde5" rx="6"/>
    <text x="15" y="18" font-size="11.5px" font-weight="700" fill="#1f2937">Chú thích:</text>
    <line x1="80" y1="13" x2="115" y2="13" stroke="#475569" stroke-width="1.5"/>
    <text x="122" y="17" font-size="11.5px" fill="#5b6472">Association</text>
    <line x1="210" y1="13" x2="245" y2="13" stroke="#2f4b7c" stroke-width="1.5" stroke-dasharray="5 3"/>
    <text x="252" y="17" font-size="11.5px" fill="#2f4b7c">«include» (bắt buộc)</text>
    <line x1="390" y1="13" x2="425" y2="13" stroke="#b9852f" stroke-width="1.5" stroke-dasharray="5 3"/>
    <text x="432" y="17" font-size="11.5px" fill="#925f18">«extend» [kèm điều kiện]</text>
    <rect x="600" y="5" width="22" height="15" rx="3" fill="#f2f6fd" stroke="#2f4b7c" stroke-width="2"/>
    <text x="630" y="17" font-size="11.5px" fill="#1f2f52">Use case trọng tâm đặc tả</text>
  </g>
</svg>
```

---

### 2.2. Bảng ghi chú quan hệ Include và Extend
Theo đúng hướng dẫn bài giảng và mẫu ở mục 04 của đề bài:

| Loại quan hệ | Use case gốc (Base) | Use case được bao gồm / mở rộng | Lý do chọn quan hệ; Với extend, ghi rõ điều kiện kích hoạt |
|---|---|---|---|
| **`<<include>>`** | **UC-01: Ghi nhận hoạt động thể chất** | UC-02: Tự động nhận biết hoạt động thể chất | Mỗi lần bắt đầu phiên ghi nhận, đồng hồ bắt buộc phải phân loại loại hình vận động (đi bộ, chạy bộ, đạp xe, bơi lội) để áp dụng thuật toán đo và mức tiêu hao năng lượng phù hợp. |
| **`<<include>>`** | **UC-01: Ghi nhận hoạt động thể chất** | UC-03: Cập nhật thông số tức thời | Trong suốt quá trình hoạt động diễn ra, hệ thống bắt buộc phải liên tục lấy mẫu cảm biến và làm mới các thông số (quãng đường, thời gian, tốc độ, nhịp tim) trên màn hình theo chu kỳ 1 giây. |
| **`<<include>>`** | **UC-01: Ghi nhận hoạt động thể chất** | UC-05: Kết thúc hoạt động thể chất | Khi người dùng hoàn thành vận động, thao tác kết thúc và đóng gói dữ liệu phiên tập là bước bắt buộc để chuyển dữ liệu vào bộ nhớ đệm lưu tạm. |
| **`<<extend>>`** | **UC-01: Ghi nhận hoạt động thể chất** | UC-04: Tạm dừng / Tiếp tục hoạt động thể chất | **Điều kiện:** `[Người dùng ấn tạm dừng khi nghỉ ngơi hoặc dừng đèn đỏ]`. Hành vi tạm dừng là tùy chọn, không bắt buộc diễn ra trong mọi phiên tập. Khi kích hoạt, đồng hồ tạm ngưng tính thời gian và quãng đường cho đến khi người dùng chọn tiếp tục. |
| **`<<extend>>`** | **UC-10: Xem phân tích chi tiết hoạt động** | UC-11: Xem biểu đồ phân tích tốc độ và nhịp tim | **Điều kiện:** `[Người dùng có nhu cầu bấm xem chi tiết từng km hoặc xem biểu đồ biến thiên theo thời gian]`. Màn hình chi tiết cơ bản chỉ hiển thị lộ trình, bản đồ và con số tổng quát; phần đồ thị là nhánh mở rộng chuyên sâu. |
| **`<<include>>`** | **UC-13: Quản lý lịch biểu hoạt động** | UC-14: Nhắc nhở theo lịch biểu | Mỗi khi có lịch biểu được thiết lập có bật tùy chọn thông báo, cơ chế kiểm tra và phát thông báo nhắc nhở trước giờ tập là thành phần tất yếu đi kèm. |
| **`<<extend>>`** | **UC-15: Đặt mục tiêu hoạt động** | UC-16: Đánh giá mục tiêu và đưa ra lời khuyên | **Điều kiện:** `[Kết quả thực hiện của người dùng không đạt mục tiêu đã đặt]`. Hệ thống sẽ kích hoạt đưa ra lời khuyên điều chỉnh hoặc động viên người dùng. |

---

### 2.3. Bảng ghi chú phân hệ (Use case liên quan cả hai phân hệ)
Theo đúng quy định của đề bài: *Use case xuyên hai phân hệ phải giải thích vì sao đặt ở hộp đó và vai trò của phân hệ còn lại.*

| Use case | Phân hệ đặt Use case | Vai trò của phân hệ còn lại | Lý do chọn phân hệ đặt Use case |
|---|---|---|---|
| **UC-06: Tự động đồng bộ dữ liệu sang điện thoại** | **Phân hệ Smartwatch** | **Phân hệ Smartphone** đóng vai trò máy chủ tiếp nhận (Listener/Receiver), xác thực dữ liệu gửi đến, ghi vào CSDL cục bộ trên điện thoại và gửi phản hồi xác nhận (ACK) cho đồng hồ. | Dữ liệu phiên tập gốc đang nằm trên bộ nhớ đệm của Smartwatch. Smartwatch đóng vai trò là bên chủ động khởi tạo tiến trình truyền (Sender/Client) ngay khi phát hiện kết nối Bluetooth với điện thoại đã được ghép đôi. |
| **UC-07: Nhận dữ liệu đồng bộ từ đồng hồ** | **Phân hệ Smartphone** | **Phân hệ Smartwatch** là thiết bị ngoại vi truyền phát dữ liệu thô (Raw packet stream). | Phân hệ Smartphone chịu trách nhiệm toàn bộ về lưu trữ vĩnh viễn, giải mã dữ liệu hành trình, phục vụ cho các chức năng phân tích thống kê lâu dài và tải bản đồ từ Map Service. |

---

<a id="3-dac-ta-use-case-a-ghi-nhan-hoat-dong-the-chat"></a>
## 3. ĐẶC TẢ USE CASE A (PHÂN HỆ SMARTWATCH)
### UC-01: GHI NHẬN HOẠT ĐỘNG THỂ CHẤT

### 3.1. Lý do chọn Use Case
Use case **"Ghi nhận hoạt động thể chất"** là hạt nhân cốt lõi của toàn bộ phân hệ Smartwatch và của ứng dụng theo dõi sức khỏe nói chung. Nếu thiếu use case này, đồng hồ không thể thu thập các thông số vận động (quãng đường, thời gian, tốc độ, nhịp tim) của người dùng, dẫn đến phân hệ Smartphone hoàn toàn không có dữ liệu để phân tích, vẽ biểu đồ, lập lịch hay đánh giá mục tiêu. Hơn nữa, use case này có phương thức kích hoạt đa dạng (tự động qua cảm biến hoặc thủ công), tích hợp nhiều luồng xử lý phần cứng thời gian thực phức tạp và chứa đựng hầu hết các quy tắc nghiệp vụ đặc thù của đề bài.

---

### 3.2. Bản đặc tả chi tiết 14 mục

| Mục | Nội dung chi tiết |
|---|---|
| **1. Mã và tên** | **UC-01: Ghi nhận hoạt động thể chất** *(Tracking physical activity)* |
| **2. Mô tả tóm tắt** | Phân hệ Smartwatch tự động hoặc theo lệnh người dùng tiến hành thu thập, đo đạc và hiển thị liên tục, tức thời các thông số sức khỏe (quãng đường, thời gian di chuyển, tốc độ trung bình, nhịp tim hiện tại) trong suốt quá trình diễn ra hoạt động thể chất (đi bộ, chạy bộ, đạp xe, bơi lội); kết thúc việc theo dõi khi người dùng ra lệnh và lưu trữ an toàn dữ liệu vào bộ nhớ tạm của đồng hồ chờ đồng bộ. |
| **3. Actor chính** | **Người dùng** *(User)* |
| **4. Actor phụ** | **Cảm biến Smartwatch** *(Cảm biến gia tốc/chuyển động 3 trục, Cảm biến nhịp tim quang học PPG, Chip định vị vệ tinh GPS)* |
| **5. Kích hoạt** | Cảm biến gia tốc trên Smartwatch tự động nhận diện mẫu chuyển động của người dùng liên tục tương ứng với hoạt động thể chất (đi bộ, chạy bộ, đạp xe, bơi lội); **hoặc** Người dùng chủ động mở ứng dụng trên Smartwatch, chọn loại hoạt động và ấn nút bắt đầu. |
| **6. Tiền điều kiện** | 1. Đồng hồ thông minh đang được đeo trên cổ tay người dùng và đang bật nguồn.<br>2. Dung lượng pin của Smartwatch còn tối thiểu từ 5% trở lên.<br>3. Bộ nhớ đệm (Flash storage) của Smartwatch còn dung lượng trống khả dụng để lưu phiên tập.<br>4. Các cảm biến phần cứng (gia tốc, nhịp tim) và chip GPS hoạt động bình thường, không bị vô hiệu hóa. |
| **7. Hậu điều kiện (thành công)** | 1. Đối tượng "Hoạt động thể chất" chuyển sang trạng thái **"Đã lưu tạm"** *(Temporarily Saved)* trên bộ nhớ Smartwatch.<br>2. Toàn bộ dữ liệu tổng hợp (loại hoạt động, thời gian bắt đầu, thời gian kết thúc, tổng thời gian di chuyển, tổng quãng đường, tốc độ trung bình, nhịp tim trung bình, chuỗi tọa độ GPS/bước chân) được đóng gói nguyên vẹn thành một bản ghi phiên tập sẵn sàng tự động đồng bộ sang Smartphone.<br>3. Màn hình đồng hồ hiển thị bảng tóm tắt kết quả phiên tập cho người dùng xem trước khi trở về màn hình chính. |
| **8. Hậu điều kiện (thất bại)** | 1. Phiên hoạt động chuyển sang trạng thái **"Đã hủy"** *(Cancelled)* nếu thời lượng hoạt động dưới 1 phút (bị xem là kích hoạt nhầm) hoặc người dùng chủ động chọn hủy bỏ.<br>2. Nếu xảy ra sự cố phần cứng/sập nguồn pin, dữ liệu đã thu thập đến thời điểm gần nhất được lưu khẩn cấp ở dạng bản ghi lỗi, ghi nhận mã sự cố và thông báo cho người dùng khi thiết bị khởi động lại. |
| **9. Luồng chính (Happy Path)** | **1.** Cảm biến chuyển động trên Smartwatch phát hiện chuỗi chuyển động liên tục của người dùng và kích hoạt use case UC-02 để tự động nhận dạng loại hoạt động thể chất (đi bộ, chạy bộ, đạp xe, bơi lội).<br>**2.** Smartwatch phát tín hiệu rung nhẹ thông báo, kích hoạt phiên theo dõi sức khỏe và khởi tạo đối tượng Hoạt động thể chất ở trạng thái "Đang theo dõi".<br>**3.** Smartwatch kích hoạt chip định vị GPS và cảm biến nhịp tim quang học PPG bắt đầu đo đạc tọa độ và nhịp tim.<br>**4.** Smartwatch thực hiện use case UC-03: liên tục lấy mẫu tín hiệu cảm biến mỗi 1 giây, tính toán và hiển thị các thông số tức thời lên màn hình đồng hồ gồm: quãng đường di chuyển (km), thời gian di chuyển (phút:giây), tốc độ trung bình (km/h) và nhịp tim hiện tại (bpm) theo các quy tắc nghiệp vụ BR-01, BR-02.<br>**5.** Người dùng hoàn thành bài tập thể lực và thực hiện thao tác chạm nút "Kết thúc" (Finish) trên màn hình đồng hồ.<br>**6.** Smartwatch ngừng việc lấy mẫu tín hiệu từ cảm biến nhịp tim và tắt chip GPS để tiết kiệm pin.<br>**7.** Smartwatch tính toán các chỉ số thống kê tổng quát của toàn bộ phiên tập (tổng thời gian, tổng quãng đường, tốc độ trung bình toàn chặng, nhịp tim trung bình) và hiển thị màn hình tóm tắt kết quả cho người dùng.<br>**8.** Smartwatch lưu trữ toàn bộ gói dữ liệu của phiên tập vào bộ nhớ đệm cục bộ, chuyển trạng thái của hoạt động sang "Đã lưu tạm" và kết thúc use case. |
| **10. Luồng thay thế** | **1a. Người dùng chủ động kích hoạt thủ công bằng tay:**<br>&nbsp;&nbsp;&nbsp;&nbsp;1a1. Người dùng mở menu ứng dụng thể thao trên Smartwatch, chủ động chọn loại hoạt động (đi bộ, chạy bộ, đạp xe, bơi lội) và nhấn nút "Bắt đầu" (Start).<br>&nbsp;&nbsp;&nbsp;&nbsp;1a2. Smartwatch bỏ qua bước tự nhận diện (bước 1) và tiếp tục thực hiện ngay từ bước 2 của luồng chính.<br><br>**4a. Người dùng tạm dừng và tiếp tục hoạt động (UC-04):**<br>&nbsp;&nbsp;&nbsp;&nbsp;4a1. Tại bước 4 của luồng chính, người dùng dừng nghỉ chân (chờ đèn đỏ, uống nước) và chạm nút "Tạm dừng" (Pause) trên màn hình đồng hồ.<br>&nbsp;&nbsp;&nbsp;&nbsp;4a2. Smartwatch chuyển trạng thái hoạt động sang "Đang tạm dừng", ngưng đếm thời gian di chuyển và ngưng cộng dồn quãng đường, chỉ duy trì đo nhịp tim.<br>&nbsp;&nbsp;&nbsp;&nbsp;4a3. Người dùng chạm nút "Tiếp tục" (Resume).<br>&nbsp;&nbsp;&nbsp;&nbsp;4a4. Smartwatch chuyển trạng thái trở lại "Đang theo dõi", tiếp tục cộng dồn thời gian di chuyển và quãng đường, quay trở lại bước 4 của luồng chính.<br><br>**5a. Hoạt động kéo dài dưới 1 phút (kích hoạt nhầm):**<br>&nbsp;&nbsp;&nbsp;&nbsp;5a1. Tại bước 5, khi người dùng bấm kết thúc, hệ thống kiểm tra thấy tổng thời gian vận động thực tế < 1 phút (theo quy tắc BR-03).<br>&nbsp;&nbsp;&nbsp;&nbsp;5a2. Smartwatch hiển thị hộp thoại xác nhận: "Thời gian hoạt động quá ngắn (< 1 phút), bạn có muốn lưu không?".<br>&nbsp;&nbsp;&nbsp;&nbsp;5a3. Người dùng chọn "Hủy bỏ": Smartwatch xóa dữ liệu bộ đệm, chuyển trạng thái sang "Đã hủy" và kết thúc use case theo hậu điều kiện thất bại. *(Nếu người dùng chọn "Lưu", hệ thống tiếp tục bước 6 của luồng chính).* |
| **11. Luồng ngoại lệ** | **3a. Mất tín hiệu GPS hoặc cảm biến nhịp tim không tiếp xúc da:**<br>&nbsp;&nbsp;&nbsp;&nbsp;3a1. Tại bước 3 hoặc bước 4, chip GPS bị mất kết nối vệ tinh (đi vào hầm, bóng râm dày hoặc bơi lội dưới nước - BR-04) hoặc cảm biến PPG không đo được nhịp tim do đeo lỏng cổ tay.<br>&nbsp;&nbsp;&nbsp;&nbsp;3a2. Smartwatch hiển thị biểu tượng cảnh báo mất GPS / nhịp tim mờ trên góc màn hình.<br>&nbsp;&nbsp;&nbsp;&nbsp;3a3. Smartwatch tự động chuyển sang thuật toán ước tính quãng đường dựa trên đếm bước chân bằng cảm biến gia tốc (với đi bộ/chạy bộ) hoặc đếm số vòng bể bơi (với bơi lội - BR-04); nhịp tim hiển thị giá trị đo hợp lệ gần nhất.<br>&nbsp;&nbsp;&nbsp;&nbsp;3a4. Khi tín hiệu phục hồi, Smartwatch tự động đồng bộ lại tọa độ và tiếp tục bước 4 của luồng chính.<br><br>**4b. Smartwatch cạn kiệt pin đột ngột (Pin ≤ 2%):**<br>&nbsp;&nbsp;&nbsp;&nbsp;4b1. Tại bước 4, Smartwatch phát hiện mức pin tụt xuống ngưỡng nguy hiểm ≤ 2%.<br>&nbsp;&nbsp;&nbsp;&nbsp;4b2. Smartwatch phát chuỗi rung cảnh báo mạnh và hiển thị thông báo "Pin yếu - Tự động lưu phiên tập".<br>&nbsp;&nbsp;&nbsp;&nbsp;4b3. Smartwatch lập tức ngắt cảm biến và GPS, đóng gói toàn bộ dữ liệu đã thu thập được từ đầu phiên đến thời điểm hiện tại, lưu khẩn cấp vào bộ nhớ Flash và chuyển trạng thái sang "Đã lưu tạm".<br>&nbsp;&nbsp;&nbsp;&nbsp;4b4. Smartwatch tắt màn hình để bảo toàn nguồn điện; use case kết thúc. |
| **12. Quy tắc nghiệp vụ (BR)** | **BR-01 (Tần suất hiển thị tức thời):** Cụm từ "tức thời" trong yêu cầu đề bài được quy định là chu kỳ lấy mẫu cảm biến, tính toán và làm mới hiển thị trên màn hình Smartwatch đạt tần suất 1 lần/giây (1 Hz, sai số không quá ±0.1 giây) *(Tham chiếu giả định GĐ-02)*.<br><br>**BR-02 (Quy chuẩn đại lượng và đơn vị đo):**<br>- Quãng đường: đơn vị ki-lô-mét (km), làm tròn 2 chữ số thập phân (ví dụ: `4.35 km`).<br>- Thời gian di chuyển: định dạng `mm:ss` (nếu < 1 giờ) hoặc `hh:mm:ss` (nếu ≥ 1 giờ).<br>- Tốc độ trung bình: đơn vị km/h, làm tròn 1 chữ số thập phân, tính theo công thức: $v_{tb} = \frac{\text{Tổng quãng đường (km)}}{\text{Thời gian di chuyển thực tế (giờ)}}$ (không tính thời gian tạm dừng).<br>- Nhịp tim hiện thời: đơn vị nhịp/phút (bpm - beats per minute), hiển thị số nguyên.<br><br>**BR-03 (Thời lượng hợp lệ tối thiểu):** Một phiên hoạt động thể chất chỉ được hệ thống ghi nhận hợp lệ và lưu trữ nếu thời gian vận động thực tế đạt tối thiểu từ 60 giây (1 phút) trở lên *(Tham chiếu giả định GĐ-03)*.<br><br>**BR-04 (Xử lý hoạt động bơi lội dưới nước):** Khi hoạt động là bơi lội, tín hiệu GPS dưới nước bị suy hao không khả dụng. Quãng đường bơi được tính bằng số lần quay đầu (được nhận biết qua cảm biến con quay hồi chuyển 6 trục) nhân với chiều dài mặc định của bể bơi là 25m hoặc 50m do người dùng cấu hình trước *(Tham chiếu giả định GĐ-04)*.<br><br>**BR-05 (Bảo toàn dữ liệu đệm):** Dữ liệu phiên tập lưu tạm trên Smartwatch được bảo vệ không bị ghi đè hay xóa bỏ cho đến khi nhận được tín hiệu phản hồi xác nhận (ACK) đồng bộ thành công từ phân hệ Smartphone *(Tham chiếu giả định GĐ-01)*. |
| **13. Yêu cầu phi chức năng** | **NFR-01 (Độ trễ hiển thị):** Độ trễ từ thời điểm cảm biến phần cứng ghi nhận dữ liệu thực tế đến khi hiển thị thay đổi lên màn hình đồng hồ không vượt quá 1.0 giây.<br>**NFR-02 (Hiệu năng pin):** Mức độ tiêu thụ năng lượng của phần mềm Smartwatch khi bật đồng thời cả chip GPS và cảm biến đo nhịp tim quang học tối đa không vượt quá 10% pin mỗi 1 giờ hoạt động liên tục.<br>**NFR-03 (Khả năng chịu lỗi và bền vững dữ liệu):** Dữ liệu đang theo dõi được lưu vết tạm thời vào bộ nhớ cố định (Flash) định kỳ mỗi 30 giây để đảm bảo nếu xảy ra khởi động lại đột ngột thì dữ liệu mất mát không vượt quá 30 giây cuối cùng. |
| **14. Include, Extend** | - **Include:** UC-02 (Tự động nhận biết hoạt động thể chất), UC-03 (Cập nhật thông số tức thời), UC-05 (Kết thúc hoạt động thể chất).<br>- **Extend:** UC-04 (Tạm dừng / Tiếp tục hoạt động thể chất) tại điểm mở rộng bước 4 với điều kiện kích hoạt: `[Người dùng ấn nút tạm dừng]`. |

---

<a id="4-state-chart-diagram-hoat-dong-the-chat"></a>
## 4. STATE CHART DIAGRAM ĐỐI TƯỢNG "HOẠT ĐỘNG THỂ CHẤT" (YÊU CẦU 4)

### 4.1. Sơ đồ State Chart SVG
Sơ đồ bao phủ toàn bộ vòng đời của đối tượng **"Hoạt động thể chất"** *(Physical Activity)* từ lúc sinh ra trên Smartwatch, chuyển qua các trạng thái vận động, lưu tạm, truyền nhận Bluetooth sang Smartphone và kết thúc:
- **Tên trạng thái chuẩn UML:** Dùng tính từ hoặc dạng "đang, đã": `Đang theo dõi`, `Đang tạm dừng`, `Đã lưu tạm`, `Đang đồng bộ`, `Đã đồng bộ`, `Đã hủy`.
- **Cú pháp chuyển trạng thái:** `Sự kiện [guard] / Action`.

```xml
<svg id="st-svg" viewBox="0 0 1080 560" xmlns="http://www.w3.org/2000/svg" font-family="'Be Vietnam Pro', system-ui, sans-serif">
  <defs>
    <marker id="st-arrow" markerUnits="userSpaceOnUse" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="11" markerHeight="11" orient="auto">
      <path d="M1 1L9 5L1 9" fill="none" stroke="#2f4b7c" stroke-width="1.6"/>
    </marker>
    <style>
      .st-box { fill: #ffffff; stroke: #2f4b7c; stroke-width: 2; rx: 12; }
      .st-box.alt { fill: #f2f6fd; stroke: #2f4b7c; stroke-width: 2.2; }
      .st-box.term { fill: #fbf7ef; stroke: #b9852f; stroke-width: 2; rx: 12; }
      .st-name { font-size: 15px; font-weight: 700; fill: #1f2f52; text-anchor: middle; }
      .st-sub { font-size: 11px; fill: #5b6472; text-anchor: middle; font-style: italic; }
      .st-edge { stroke: #2f4b7c; stroke-width: 1.6; fill: none; }
      .st-edge.alt { stroke: #b9852f; stroke-width: 1.6; }
      .st-edge.err { stroke: #b4474f; stroke-width: 1.6; stroke-dasharray: 6 3; }
      .st-lbl { font-size: 12px; font-weight: 600; fill: #1f2937; }
      .st-guard { fill: #70472f; font-weight: 600; }
      .st-act { fill: #3f7d6b; font-weight: 600; font-style: italic; }
      .init-dot { fill: #1f2f52; stroke: none; }
      .final-out { fill: none; stroke: #1f2f52; stroke-width: 2; }
      .final-in { fill: #1f2f52; stroke: none; }
      .halo { paint-order: stroke; stroke: #ffffff; stroke-width: 6px; stroke-linejoin: round; }
    </style>
  </defs>

  <!-- NỀN -->
  <rect x="0" y="0" width="1080" height="560" fill="#f7f8fa" rx="16"/>

  <!-- TIÊU ĐỀ SƠ ĐỒ -->
  <text x="30" y="36" font-size="16px" font-weight="800" fill="#1f2f52">VÒNG ĐỜI ĐỐI TƯỢNG: HOẠT ĐỘNG THỂ CHẤT (PHYSICAL ACTIVITY)</text>

  <!-- ==================== CÁC TRẠNG THÁI ==================== -->
  <!-- 1. Điểm bắt đầu (Initial) -->
  <circle cx="60" cy="170" r="12" class="init-dot"/>

  <!-- 2. Trạng thái Đang theo dõi (Tracking) -->
  <g id="state-tracking">
    <rect x="160" y="130" width="200" height="80" class="st-box alt"/>
    <text x="260" y="165" class="st-name">Đang theo dõi</text>
    <text x="260" y="185" class="st-sub">(Tracking on Smartwatch)</text>
    <line x1="160" y1="195" x2="360" y2="195" stroke="#d8dde5" stroke-width="1"/>
    <text x="260" y="206" font-size="10px" fill="#475569" text-anchor="middle">do / đo đạc &amp; hiển thị 1s</text>
  </g>

  <!-- 3. Trạng thái Đang tạm dừng (Paused) -->
  <g id="state-paused">
    <rect x="160" y="320" width="200" height="70" class="st-box"/>
    <text x="260" y="355" class="st-name">Đang tạm dừng</text>
    <text x="260" y="375" class="st-sub">(Paused)</text>
  </g>

  <!-- 4. Trạng thái Đã lưu tạm (Temporarily Saved) -->
  <g id="state-temp-saved">
    <rect x="470" y="130" width="200" height="80" class="st-box alt"/>
    <text x="570" y="165" class="st-name">Đã lưu tạm</text>
    <text x="570" y="185" class="st-sub">(Temporarily Saved)</text>
    <line x1="470" y1="195" x2="670" y2="195" stroke="#d8dde5" stroke-width="1"/>
    <text x="570" y="206" font-size="10px" fill="#475569" text-anchor="middle">entry / ghi Flash bộ đệm</text>
  </g>

  <!-- 5. Trạng thái Đang đồng bộ (Syncing) -->
  <g id="state-syncing">
    <rect x="780" y="130" width="200" height="80" class="st-box"/>
    <text x="880" y="165" class="st-name">Đang đồng bộ</text>
    <text x="880" y="185" class="st-sub">(Syncing via Bluetooth)</text>
    <line x1="780" y1="195" x2="980" y2="195" stroke="#d8dde5" stroke-width="1"/>
    <text x="880" y="206" font-size="10px" fill="#475569" text-anchor="middle">do / gửi dữ liệu qua BT</text>
  </g>

  <!-- 6. Trạng thái Đã đồng bộ (Synced) -->
  <g id="state-synced">
    <rect x="780" y="330" width="200" height="70" class="st-box term"/>
    <text x="880" y="365" class="st-name">Đã đồng bộ</text>
    <text x="880" y="385" class="st-sub">(Synced to Smartphone)</text>
  </g>

  <!-- 7. Trạng thái Đã hủy (Cancelled) -->
  <g id="state-cancelled">
    <rect x="470" y="330" width="200" height="70" class="st-box term"/>
    <text x="570" y="365" class="st-name" fill="#b4474f">Đã hủy</text>
    <text x="570" y="385" class="st-sub">(Cancelled / Discarded)</text>
  </g>

  <!-- 8. Điểm kết thúc (Final State) -->
  <g id="final-state" transform="translate(880, 485)">
    <circle cx="0" cy="0" r="16" class="final-out"/>
    <circle cx="0" cy="0" r="10" class="final-in"/>
    <text x="0" y="32" font-size="11.5px" font-weight="700" fill="#1f2f52" text-anchor="middle">Kết thúc vòng đời</text>
  </g>

  <!-- ==================== CÁC CHUYỂN TRẠNG THÁI (TRANSITIONS) ==================== -->
  <!-- T1: Bắt đầu -> Đang theo dõi -->
  <path d="M72 170 L150 170" class="st-edge" marker-end="url(#st-arrow)"/>
  <text x="110" y="145" class="st-lbl halo" text-anchor="middle">Phát hiện vận động</text>
  <text x="110" y="160" font-size="10.5px" class="st-act halo" text-anchor="middle">/ khởi tạo phiên tập</text>

  <!-- T2: Đang theo dõi -> Đang tạm dừng -->
  <path d="M225 210 L225 310" class="st-edge" marker-end="url(#st-arrow)"/>
  <text x="215" y="260" class="st-lbl halo" text-anchor="end">Ấn tạm dừng</text>
  <text x="215" y="275" font-size="10.5px" class="st-act halo" text-anchor="end">/ dừng tính giờ</text>

  <!-- T3: Đang tạm dừng -> Đang theo dõi -->
  <path d="M295 320 L295 220" class="st-edge" marker-end="url(#st-arrow)"/>
  <text x="305" y="260" class="st-lbl halo" text-anchor="start">Ấn tiếp tục</text>
  <text x="305" y="275" font-size="10.5px" class="st-act halo" text-anchor="start">/ đếm giờ tiếp</text>

  <!-- T4: Đang theo dõi -> Đã lưu tạm -->
  <path d="M360 170 L460 170" class="st-edge" marker-end="url(#st-arrow)"/>
  <text x="415" y="142" class="st-lbl halo" text-anchor="middle">Ra lệnh kết thúc</text>
  <text x="415" y="156" class="st-lbl st-guard halo" text-anchor="middle">[thời gian ≥ 1 phút]</text>
  <text x="415" y="170" font-size="10.5px" class="st-act halo" text-anchor="middle">/ lưu bộ đệm Flash</text>

  <!-- T5: Đang theo dõi -> Đã hủy (thời gian < 1 phút) -->
  <path d="M340 210 L480 330" class="st-edge err" marker-end="url(#st-arrow)"/>
  <text x="385" y="265" class="st-lbl halo" fill="#b4474f" text-anchor="middle">Ra lệnh kết thúc</text>
  <text x="385" y="280" class="st-lbl st-guard halo" text-anchor="middle">[thời gian &lt; 1 phút]</text>
  <text x="385" y="295" font-size="10.5px" class="st-act halo" text-anchor="middle">/ hủy bản ghi</text>

  <!-- T6: Đã lưu tạm -> Đang đồng bộ -->
  <path d="M670 170 L770 170" class="st-edge" marker-end="url(#st-arrow)"/>
  <text x="720" y="142" class="st-lbl halo" text-anchor="middle">Phát hiện Bluetooth</text>
  <text x="720" y="156" class="st-lbl st-guard halo" text-anchor="middle">[đã ghép đôi]</text>
  <text x="720" y="170" font-size="10.5px" class="st-act halo" text-anchor="middle">/ truyền gói tin</text>

  <!-- T7: Đang đồng bộ -> Đã lưu tạm (Mất kết nối Bluetooth giữa chừng) -->
  <path d="M790 130 C 740 80, 690 80, 640 130" class="st-edge err" marker-end="url(#st-arrow)"/>
  <text x="715" y="70" class="st-lbl halo" fill="#b4474f" text-anchor="middle">Mất kết nối Bluetooth</text>
  <text x="715" y="86" font-size="10.5px" class="st-act halo" text-anchor="middle">/ ngừng truyền, giữ nguyên Flash</text>

  <!-- T8: Đang đồng bộ -> Đã đồng bộ -->
  <path d="M880 210 L880 320" class="st-edge" marker-end="url(#st-arrow)"/>
  <text x="890" y="260" class="st-lbl halo" text-anchor="start">Nhận xác nhận (ACK)</text>
  <text x="890" y="275" class="st-lbl st-guard halo" text-anchor="start">[toàn vẹn dữ liệu]</text>
  <text x="890" y="290" font-size="10.5px" class="st-act halo" text-anchor="start">/ xóa bộ đệm Smartwatch</text>

  <!-- T9: Đã đồng bộ -> Điểm kết thúc -->
  <path d="M880 400 L880 465" class="st-edge" marker-end="url(#st-arrow)"/>
  <text x="890" y="435" class="st-lbl halo" text-anchor="start">Hoàn tất lưu trữ điện thoại</text>

  <!-- T10: Đã hủy -> Điểm kết thúc -->
  <path d="M670 370 L860 480" class="st-edge alt" marker-end="url(#st-arrow)"/>
  <text x="720" y="440" class="st-lbl halo" text-anchor="middle">Xác nhận xóa</text>
</svg>
```

---

### 4.2. Bảng chuyển trạng thái (State Transition Table)
Theo chuẩn bài giảng, bảng mô tả đầy đủ mọi biến chuyển trạng thái và nguồn kích hoạt của sự kiện:

| Từ trạng thái | Sự kiện | Điều kiện [guard] | Hành động / Action | Đến trạng thái | Nguồn sự kiện |
|---|---|---|---|---|---|
| **[Điểm bắt đầu]** | Bắt đầu hoạt động thể chất | Cảm biến phát hiện chuyển động hoặc người dùng bấm Start | Khởi tạo đối tượng hoạt động; kích hoạt cảm biến nhịp tim và chip GPS | **Đang theo dõi** | Cảm biến chuyển động hoặc Người dùng thao tác Smartwatch |
| **Đang theo dõi** | Người dùng ấn nút "Tạm dừng" | Đang trong phiên theo dõi | Ngừng đếm thời gian di chuyển; ngừng cộng dồn quãng đường; duy trì đo nhịp tim | **Đang tạm dừng** | Người dùng thao tác trên Smartwatch |
| **Đang tạm dừng** | Người dùng ấn nút "Tiếp tục" | Đang ở trạng thái tạm dừng | Khôi phục bộ đếm thời gian và tính tiếp quãng đường di chuyển | **Đang theo dõi** | Người dùng thao tác trên Smartwatch |
| **Đang theo dõi** | Người dùng ra lệnh kết thúc | `[Thời gian di chuyển thực tế >= 1 phút]` | Dừng đo GPS và cảm biến; tính toán các thông số tổng hợp; đóng gói và ghi dữ liệu vào bộ nhớ Flash | **Đã lưu tạm** | Người dùng thao tác trên Smartwatch (hoặc tự động khi pin ≤ 2%) |
| **Đang theo dõi** | Người dùng ra lệnh kết thúc | `[Thời gian di chuyển thực tế < 1 phút]` | Hiển thị cảnh báo kích hoạt nhầm; xóa bộ đệm phiên tập thô | **Đã hủy** | Người dùng thao tác trên Smartwatch |
| **Đã lưu tạm** | Phát hiện tín hiệu Bluetooth | `[Hai thiết bị Smartwatch và Smartphone đã ghép đôi thành công]` | Mở kênh socket truyền tin; bắt đầu truyền phát các gói dữ liệu hoạt động sang điện thoại | **Đang đồng bộ** | Kết nối Bluetooth giữa hai thiết bị |
| **Đang đồng bộ** | Ngắt kết nối Bluetooth | `[Chưa nhận đủ các gói dữ liệu hoặc mất sóng]` | Hủy phiên truyền; bảo toàn nguyên vẹn bản ghi trong Flash Smartwatch; hẹn giờ thử lại | **Đã lưu tạm** | Trạng thái sóng Bluetooth / Phần cứng kết nối |
| **Đang đồng bộ** | Nhận gói tin xác nhận (ACK) từ Smartphone | `[Smartphone xác nhận đã nhận đủ 100% dữ liệu và giải mã thành công]` | Đánh dấu phiên tập đã lên điện thoại; giải phóng (xóa) bản ghi trong bộ nhớ tạm Smartwatch | **Đã đồng bộ** | Phân hệ Smartphone (phản hồi qua Bluetooth) |
| **Đã đồng bộ** | Lưu trữ thành công trên Smartphone | Dữ liệu đã lưu vào CSDL vĩnh viễn trên Smartphone | Kết thúc vòng đời đối tượng trên Smartwatch | **[Điểm kết thúc]** | Phân hệ Smartphone |
| **Đã hủy** | Xác nhận xóa bỏ | Người dùng xác nhận hoặc hệ thống tự động hủy | Giải phóng hoàn toàn đối tượng | **[Điểm kết thúc]** | Hệ thống Smartwatch |

---

### 4.3. Bảng các cặp (trạng thái, sự kiện) bị từ chối
Liệt kê các trường hợp ngoại lệ mà hệ thống **tuyệt đối từ chối** nhằm đảm bảo tính toàn vẹn dữ liệu theo đề bài và giả định:

| Trạng thái hiện tại | Sự kiện phát sinh | Hệ thống xử lý | Lý do theo đề bài hoặc theo giả định |
|---|---|---|---|
| **1. Đang theo dõi** | Yêu cầu bắt đầu đồng bộ dữ liệu sang điện thoại qua Bluetooth | **Từ chối / Bỏ qua sự kiện.** Hệ thống không kích hoạt truyền dữ liệu của phiên tập này. | Phiên hoạt động thể chất đang diễn ra, người dùng chưa kết thúc bài tập nên các thông số (tổng quãng đường, thời gian, tốc độ trung bình) chưa được chốt cố định và chưa đóng gói hoàn chỉnh thành bản ghi lưu tạm. |
| **2. Đã lưu tạm** | Cảm biến phát hiện chuyển động thể chất mới | **Từ chối gộp vào phiên cũ / Khởi tạo phiên mới tách rời.** Hệ thống không ghi đè dữ liệu mới vào bản ghi đã lưu tạm. | Bản ghi ở trạng thái "Đã lưu tạm" đã được niêm phong tính toàn vẹn dữ liệu để chờ truyền sang Smartphone (BR-05). Một hoạt động thể chất mới bắt đầu phải được cấp mã định danh mới và khởi tạo một vòng đời độc lập. |
| **3. Đang đồng bộ** | Người dùng thao tác ra lệnh "Kết thúc hoạt động" | **Báo lỗi / Hiển thị thông báo "Phiên tập đã kết thúc từ trước".** | Hoạt động thể chất đã kết thúc trước đó thì mới chuyển sang lưu tạm và đồng bộ. Lệnh kết thúc tại thời điểm này là thao tác phi logic hoặc do người dùng chạm nhầm. |
| **4. Đã đồng bộ** | Smartphone gửi yêu cầu yêu cầu Smartwatch phát lại dữ liệu phiên tập cũ | **Báo lỗi / Phản hồi "Dữ liệu đã được giải phóng khỏi đồng hồ".** | Theo cơ chế quản lý bộ nhớ của đề bài, bộ nhớ đồng hồ chỉ có vai trò lưu trữ tạm thời. Sau khi đồng bộ thành công và nhận được ACK từ điện thoại, bản ghi trên đồng hồ đã được xóa để giải phóng dung lượng cho các phiên tập tiếp theo. |

---

## 5. TỔNG KẾT VÀ BÀN GIAO SẢN PHẨM CỦA TV-B

1. **Về phân hệ Smartwatch:** Đã phân tích trọn vẹn đặc thù của đồng hồ thông minh (tính tức thời 1s, tiết kiệm pin, lưu trữ tạm thời trên bộ nhớ flash, cơ chế hoạt động khi mất GPS hoặc bơi lội dưới nước).
2. **Về Sơ đồ Use Case:** Đã dựng hoàn chỉnh sơ đồ 2 hộp phân hệ (Smartwatch & Smartphone), xác định đầy đủ các Actor, use case và liên kết `<<include>>`, `<<extend>>` chuẩn xác theo cú pháp UML.
3. **Về Đặc tả Use Case A:** Đã xây dựng hoàn thiện bản đặc tả 14 mục chi tiết cho use case trọng tâm **UC-01: Ghi nhận hoạt động thể chất**, đáp ứng tối đa yêu cầu bài giảng (2 luồng thay thế, 2 luồng ngoại lệ, 5 quy tắc nghiệp vụ BR rõ ràng đại lượng đo lường).
4. **Về State Chart Diagram:** Đã mô hình hóa chính xác vòng đời của đối tượng **"Hoạt động thể chất"**, kèm bảng chuyển trạng thái chi tiết và 4 cặp trạng thái/sự kiện bị từ chối có giải thích cơ sở logic.

*Sản phẩm này sẵn sàng để thành viên **TV-A** tích hợp vào tệp HTML duy nhất nộp chung của nhóm 04.*

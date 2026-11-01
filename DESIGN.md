---
name: Nhịp
direction: Chanh điện
version: 2
source_of_truth: project/tokens.json
themes: [light, dark]
watch_theme: dark
fonts:
  sans: { family: "Archivo", weights: [400, 500, 600, 700], source: "Google Fonts" }
  num:  { family: "Archivo Narrow", weights: [500, 600, 700], source: "Google Fonts", numerals: tabular }
colors:
  #                 light      dark
  surface:        ["#f2f3ee", "#0d0f10"]
  surface-raised: ["#ffffff", "#17191c"]
  surface-sunken: ["#e5e7e0", "#060708"]
  line:           ["#d7dad2", "#2a2e33"]
  line-strong:    ["#858a91", "#676d75"]
  ink:            ["#121417", "#f1f3ee"]
  ink-muted:      ["#555a61", "#a2a8ae"]
  brand:          ["#4a7500", "#c5f03a"]
  on-brand:       ["#ffffff", "#121a04"]
  brand-soft:     ["#e3f1c2", "#27320b"]
  heart:          ["#c51f47", "#ff5c7c"]
  stop:           ["#c2262e", "#ff5f57"]
  success:        ["#0e7655", "#3fd99a"]
  warning:        ["#8c5000", "#ffb43f"]
  info:           ["#1c5ccc", "#76a9ff"]
  act-walk:       ["#9a4f00", "#ff9f45"]
  act-run:        ["{brand}", "{brand}"]
  act-bike:       ["#5a43d1", "#a99bff"]
  act-swim:       ["#006e86", "#36cbe3"]
  act-other:      ["#5f646b", "#a2a8ae"]
  map-ground:     ["#e8eae3", "#1a1d20"]
  map-road:       ["#ffffff", "#30343a"]
  map-park:       ["#d6e6c6", "#1b2a1e"]
  map-water:      ["#bfd9e6", "#122b37"]
  watch-case:     ["#23262a", "#383c42"]
---

# Nhịp — DESIGN.md · hướng “Chanh điện”

Tệp này mô tả giao diện mới của Nhịp: bảng màu, font và cách áp dụng cho cả 5 màn hình (2 màn đồng hồ, 3 màn điện thoại). Giá trị chuẩn nằm trong `tokens.json`; tệp này là bản đọc được cho người và cho công cụ thiết kế nhận DESIGN.md. Hai nơi phải luôn khớp — sửa token trước, rồi cập nhật bảng ở đây.

## 1. Tinh thần

**Đêm chạy.** Nền than chì lạnh, một màu chanh điện duy nhất làm điểm nhấn, số đo hẹp và chắc như bảng điểm thể thao.

- Đồng hồ luôn ở theme Tối, và màu chanh điện là màu đọc rõ nhất trên nền đen khi liếc nhanh ngoài nắng (14,5:1). Màu nhận diện được chọn từ màn hình nhỏ nhất trước.
- Trung tính chuyển từ kem ấm sang xám xi măng hơi lạnh, để màu loại hoạt động và nhịp tim nổi lên, không bị nền “ăn” mất.
- Một họ chữ (Archivo) cho cả chữ và số: chữ thường độ rộng chuẩn, số dùng bản Narrow — cùng nét, khác nhịp, nên bố cục gọn mà không lệch giọng.

## 2. Bảng màu

Mọi cặp chữ/nền dưới đây đã đo theo WCAG (Web Content Accessibility Guidelines – hướng dẫn tiếp cận nội dung web). Chữ đạt ≥4,5:1 trên `surface` và `surface-raised` ở cả hai theme; viền điều khiển và icon đạt ≥3:1.

### Nền, đường kẻ, chữ

| Token | Sáng | Tối | Dùng cho |
| --- | --- | --- | --- |
| `surface` | `#f2f3ee` | `#0d0f10` | Nền trang, nền màn hình |
| `surface-raised` | `#ffffff` | `#17191c` | Thẻ, tab bar, bottom sheet |
| `surface-sunken` | `#e5e7e0` | `#060708` | Ô nhập, segmented, rãnh tiến độ, nền màn đồng hồ |
| `line` | `#d7dad2` | `#2a2e33` | Đường kẻ 1px, viền thẻ |
| `line-strong` | `#858a91` | `#676d75` | Viền ô nhập, chip chưa chọn (3,1–3,7:1) |
| `ink` | `#121417` | `#f1f3ee` | Chữ chính (16,5–18,5:1) |
| `ink-muted` | `#555a61` | `#a2a8ae` | Nhãn, đơn vị, chú thích (6,2–8:1) |

### Thương hiệu

| Token | Sáng | Tối | Dùng cho |
| --- | --- | --- | --- |
| `brand` | `#4a7500` | `#c5f03a` | Nút chính, tab đang chọn, lộ trình, số tổng, Chạy bộ |
| `on-brand` | `#ffffff` | `#121a04` | Chữ/icon trên nền `brand` và `stop` |
| `brand-soft` | `#e3f1c2` | `#27320b` | Nền nhạt của chip thương hiệu; chữ trên nó dùng `ink` |

Ở theme Sáng, chanh điện quá sáng để làm chữ trên nền trắng (chỉ ~1,3:1), nên `brand` đổi sang xanh ô-liu đậm cùng sắc độ. Ở theme Tối, chữ trên nút `brand` là màu đen lục `on-brand`, không phải trắng.

### Chỉ số và trạng thái

| Token | Sáng | Tối | Dùng cho |
| --- | --- | --- | --- |
| `heart` | `#c51f47` | `#ff5c7c` | Nhịp tim: icon, đường biểu đồ, vùng nhịp tim |
| `info` | `#1c5ccc` | `#76a9ff` | Tốc độ, “Đang đồng bộ”, vòng sóng khi tìm đồng hồ |
| `success` | `#0e7655` | `#3fd99a` | “Đã đồng bộ”, “Đã ghi nhận”, mục tiêu đạt, điểm bắt đầu lộ trình |
| `warning` | `#8c5000` | `#ffb43f` | “Chờ ghép đôi” |
| `stop` | `#c2262e` | `#ff5f57` | Nút Kết thúc, thông báo lỗi |

### Loại hoạt động

| Token | Sáng | Tối | Sắc |
| --- | --- | --- | --- |
| `act-walk` | `#9a4f00` | `#ff9f45` | Cam hổ phách |
| `act-run` | = `brand` | = `brand` | Chanh điện |
| `act-bike` | `#5a43d1` | `#a99bff` | Tím chàm |
| `act-swim` | `#006e86` | `#36cbe3` | Lam ngọc |
| `act-other` | `#5f646b` | `#a2a8ae` | Xám |

Năm màu cách nhau cả về sắc lẫn độ sáng, nhưng vẫn luôn đi cùng icon và tên loại — màu chỉ hỗ trợ, không thay chữ.

### Bản đồ và thiết bị

| Token | Sáng | Tối |
| --- | --- | --- |
| `map-ground` | `#e8eae3` | `#1a1d20` |
| `map-road` | `#ffffff` | `#30343a` |
| `map-park` | `#d6e6c6` | `#1b2a1e` |
| `map-water` | `#bfd9e6` | `#122b37` |
| `watch-case` | `#23262a` | `#383c42` |

Lộ trình `brand` có viền `surface-raised` để tách khỏi nền bản đồ (4,2–4,5:1 ở theme Sáng, >11:1 ở theme Tối).

## 3. Chữ

| Họ | Font | Trọng lượng | Dùng cho |
| --- | --- | --- | --- |
| `sans` | **Archivo** | 400 · 500 · 600 · 700 | Mọi chữ giao diện |
| `num` | **Archivo Narrow** | 500 · 600 · 700 | Mọi con số đo được |

Nạp từ Google Fonts:

```
https://fonts.googleapis.com/css2?family=Archivo:wght@400;500;600;700&family=Archivo+Narrow:wght@500;600;700&display=swap
```

Đã kiểm tra trực tiếp trên tệp font: cả hai có đủ nguyên âm có dấu tiếng Việt (ạ, ặ, ệ, ự, ỹ, ơ, ư, đ…) và ký tự ′ ″ dùng cho nhịp độ `5′52″/km`. Archivo Narrow có số tabular mặc định — đồng hồ bấm giờ không bị “nhảy” khi chữ số đổi.

**Thang chữ** (giữ nguyên kích thước, chỉ đổi font):

| Style | Họ | Cỡ / dòng | Đậm | Ví dụ |
| --- | --- | --- | --- | --- |
| `metric-xl` | num | 48 / 48 | 600 | `24:37` trên đồng hồ |
| `metric-lg` | num | 34 / 36 | 600 | `45,4 km` tổng |
| `metric-md` | num | 24 / 26 | 600 | `10,2 km/h` ô số liệu |
| `title` | sans | 22 / 28 | 700 | Hoạt động |
| `heading` | sans | 16 / 22 | 600 | Theo từng km |
| `body` | sans | 15 / 22 | 400 | Đồng hồ tự nhận biết loại hoạt động. |
| `label` | sans | 13 / 18 | 500 | Quãng đường |
| `caption` | sans | 12 / 16 | 400 | CN 18/10 · 06:05 |

Đơn vị đi sau số, dùng `sans`, cỡ nhỏ, màu `ink-muted`.

## 4. Khoảng cách, bo góc, bóng

Không đổi so với bản trước: lưới 4px (`space-1` 4 → `space-6` 32), `radius-sm` 8, `radius-md` 14, `radius-lg` 22, `radius-pill` 999. Phân tầng bằng đường kẻ; chỉ bottom sheet và khung thiết bị có bóng.

## 5. Áp dụng cho từng màn hình

| Màn hình | Thay đổi nhìn thấy |
| --- | --- |
| **1 · Đồng hồ – Đang theo dõi** | Thời gian `metric-xl` bằng Archivo Narrow; vòng loại Chạy bộ chanh điện; nhịp tim hồng `heart`; nút Kết thúc `stop` với chữ đen lục `on-brand`. |
| **2 · Đồng hồ – Đã ghi nhận / đồng bộ** | Chờ ghép đôi hổ phách, Đang đồng bộ xanh `info`, Đã đồng bộ xanh lục `success` — mỗi trạng thái kèm icon và chữ. |
| **3 · Điện thoại – Danh sách** | Tổng quãng đường và cột biểu đồ màu `brand`; segmented trên rãnh `surface-sunken`; nhãn loại theo 5 màu `act-*`. Trạng thái trống: nút “Hướng dẫn ghép đôi đồng hồ” nền `brand`. |
| **4 · Điện thoại – Chi tiết** | Lộ trình `brand` trên bản đồ xám lạnh; tốc độ `info`, nhịp tim `heart`; ô số liệu Archivo Narrow. |
| **5 · Điện thoại – Lịch biểu & mục tiêu** | Vòng tiến độ `brand`, đạt thì chuyển `success`; lỗi dưới trường dùng `stop`. |

## 6. Nên / không nên

- **Nên** dùng `brand` cho đúng một hành động chính mỗi màn hình.
- **Nên** gọi màu qua token (`var(--brand)`), không viết cứng mã HEX trong thành phần.
- **Không** đặt chữ màu (`brand`, `act-*`, trạng thái) lên `surface-sunken` ở theme Sáng — chỉ còn 4,4–4,9:1; dùng `ink` hoặc `ink-muted`.
- **Không** dùng chanh điện làm chữ ở theme Sáng; đó là việc của `brand` bản ô-liu.
- **Không** dùng gradient, emoji hay thẻ viền trái làm điểm nhấn.

## 7. Cách nạp trong công cụ

Công cụ đang dùng (design system Nhịp trên Claude) có design system riêng, nên giao diện mới được **nạp qua design system**, không dán HEX vào từng màn hình:

1. `tokens.json` — thay toàn bộ giá trị màu hai theme và hai họ chữ `sans`, `num`. Mọi màn hình đọc màu và font qua biến CSS sinh từ tệp này, nên đổi một lần là áp dụng cho cả 5 màn hình và các thành phần dùng chung.
2. `components/bundle.css` — đổi dòng `@import` Google Fonts sang Archivo + Archivo Narrow.
3. `DESIGN.md` (tệp này) — thêm vào design system như một mục của brand book, để người và công cụ khác đọc được cùng một quy ước.

Với công cụ khác chỉ nhận lời nhắn, dùng prompt:

> Đổi giao diện sang bảng màu và font sau, áp dụng cho tất cả màn hình. Font: Archivo (chữ giao diện, 400–700) và Archivo Narrow (mọi con số, 500–700). Màu theme Sáng / Tối: nền `#f2f3ee` / `#0d0f10`, thẻ `#ffffff` / `#17191c`, chữ chính `#121417` / `#f1f3ee`, chữ phụ `#555a61` / `#a2a8ae`, thương hiệu `#4a7500` / `#c5f03a` (chữ trên nó `#ffffff` / `#121a04`), nhịp tim `#c51f47` / `#ff5c7c`, kết thúc `#c2262e` / `#ff5f57`, thành công `#0e7655` / `#3fd99a`, cảnh báo `#8c5000` / `#ffb43f`, thông tin `#1c5ccc` / `#76a9ff`. Đồng hồ luôn dùng theme Tối. Chi tiết đầy đủ trong DESIGN.md kèm theo.

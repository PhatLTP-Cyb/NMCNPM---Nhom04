
# Task Manager – Tiến hóa kiến trúc (Bài tập tuần 7)

Ứng dụng quản lý công việc với 4 chức năng cố định: **tạo task, xem danh sách, đổi trạng thái (chưa xong/hoàn thành), xóa task**.
Một codebase duy nhất, phát triển tuần tự qua 5 mốc, mỗi mốc là một git tag trên nhánh `main`:

```
v1 ──► v2 ──► v3 ──► v3.5 ──► v4
JSON   Client  N-Layer  tên người dùng  P2P mesh hoàn chỉnh
1 máy  –Server  + MVC    + P2P nhiều    (bắt tay dự phòng, đồng bộ
              + SQLite   người          ngược, mở lại trang offline)
```

| Tag | NFR mới | Kiến trúc | Lưu trữ |
|---|---|---|---|
| `v1` | Dữ liệu còn sau khi khởi động lại | Express + REST + 1 trang HTML | `tasks.json` |
| `v2` | Nhiều client dùng chung dữ liệu | Client–Server, listen `0.0.0.0`, polling 2 giây, ghi file atomic | `tasks.json` trên server |
| `v3` | Modifiability: đổi UI + đổi DB | N-Layer (routes/service/repository) + DI, MVC phía client, Kanban | SQLite `tasks.db` (+ script migrate) |
| `v3.5` | Nhiều người dùng; cộng tác nhóm >2 người khi mất server | + tên người dùng qua mọi tầng, P2P full mesh (WebRTC), server chỉ để bắt tay | SQLite + bản sao localStorage (LWW + tombstone) |
| `v4` | Availability khi server **không truy cập được**, kể cả sập từ đầu | + bắt tay thủ công, giới thiệu peer qua mesh, đồng bộ ngược về SQLite, Service Worker | như v3.5 + `POST /api/tasks/sync` |

Bản V4 đầu tiên (2 peer, chỉ copy/paste mã, không có tên người dùng) được giữ ở tag **`v4-prototype`** để đối chiếu.

## Công nghệ
Node.js ≥ 18 (đã thử Node 22), Express 4, better-sqlite3, HTML/CSS/JavaScript thuần (ES modules), WebRTC DataChannel, Service Worker.

## Cài đặt và chạy
```bash
npm install
npm run migrate   # từ v3: chuyển tasks.json -> tasks.db, chạy lại nhiều lần không trùng
npm start         # http://localhost:3000 (terminal in thêm địa chỉ LAN)
```
Xem từng mốc: dừng server, `git checkout v1` (… `v2`, `v3`, `v3.5`, `v4`), `npm start`, rồi **Ctrl+F5** trong trình duyệt. Quay về bản mới nhất: `git checkout main`.
Giữ nguyên `tasks.json`/`tasks.db` khi chuyển mốc để thấy dữ liệu đi xuyên suốt v1 → v4.

## Cách thử từng mốc
| Mốc | Thao tác | Đạt khi |
|---|---|---|
| v1 | Tạo 2 task, tick 1, Ctrl+C rồi `npm start`, F5 | 2 task và trạng thái còn nguyên |
| v2 | Mở 2 trình duyệt độc lập (Chrome + Edge/ẩn danh). A thêm task, chờ 2 giây ở B; B tick, chờ ở A | Hai bên thấy cùng dữ liệu; tắt server thì cả hai báo mất kết nối |
| v3 | `npm run migrate` (2 lần), `npm start`, Kanban: tạo, chuyển cột, xóa, restart | Task từ v2 còn; `git show --stat v3~1` chỉ có file View, `git show --stat v3` chỉ có Data Access |
| v3.5 | 3 cửa sổ riêng, mỗi cửa sổ nhập tên, bấm **Tham gia nhóm P2P**; tắt server (không F5); tạo/chuyển cột/xóa | Mọi người nhận thay đổi, thẻ ghi "Tạo bởi … · sửa bởi …"; người vào sau không làm task đã xóa sống lại |
| v4 | Tắt server **trước**; mở "Kết nối thủ công": A nối B, A nối C (C tự nối B qua A); tạo/sửa/xóa; F5 một cửa sổ rồi nối lại; `npm start` lại | Đồng bộ 3 chiều không cần server; F5 vẫn mở trang (localhost); server sống lại thì thông báo "đã đồng bộ: thêm/sửa/xóa …" và DB đúng |

## Kiểm thử tự động (tùy chọn)
`npm i -D playwright && npx playwright install chromium`
| Script | Chạy ở | Kiểm tra |
|---|---|---|
| `tests/e2e-v1.js`, `e2e-v2.js`, `e2e-v3.js` | tag tương ứng* | Bảng kiểm chứng V1, V2, V3 của đề |
| `tests/e2e-v3.5.js` | `v3.5` hoặc `v4` | 4 người, bắt tay qua server, người vào sau, tắt server vẫn đồng bộ |
| `tests/e2e-v4-manual.js` | `v4` | Server sập từ đầu: nối thủ công + giới thiệu qua mesh, đồng bộ 3 chiều |
| `tests/e2e-v4-sync.js` | `v4` | Thay đổi offline ghi về SQLite khi server sống lại, đồng bộ lặp lại không đổi |
| `tests/e2e-v4-reload.js` | `v4` | F5 khi mất server vẫn mở trang, nối lại được |
| `tests/e2e-v4-server.js` | `v4` | Hồi quy chế độ Server: migrate, 2 client polling, tên người tạo/sửa |

\* Ví dụ: `git checkout v1 && git checkout main -- tests/e2e-v1.js && node tests/e2e-v1.js`, xong chạy `git checkout main`.

## Cấu trúc thư mục (v4)
```
server.js                          composition root: chọn repository, gắn task routes + signaling routes
src/presentation/taskRoutes.js     REST /api/tasks (+ POST /sync)
src/presentation/signalRoutes.js   /api/signal: join, poll, send – chỉ để bắt tay WebRTC
src/business/taskService.js        nghiệp vụ: kiểm tra, tên người dùng, gộp LWW khi đồng bộ
src/signaling/signalingHub.js      điểm hẹn trong bộ nhớ
src/data/sqliteTaskRepository.js   SQLite (tự thêm cột khi DB cũ)
src/data/jsonTaskRepository.js     JSON (giữ để đổi lại được)
scripts/migrate-json-to-sqlite.js
public/index.html, css/style.css, sw.js
public/js/api.js, model.js, view.js, controller.js   MVC
public/js/mesh.js                  WebRTC full mesh, 3 cách bắt tay
public/js/localStore.js            bản sao cục bộ, LWW + tombstone
docs/KIEN-TRUC.md                  sơ đồ Mermaid V1, V2, V3, V3.5, V4
docs/NHAT-KY.md                    nhật ký quyết định, prompt, lỗi
tests/                             kịch bản kiểm thử Playwright
```

## Giới hạn đã biết
- v2: polling 2 giây nên có độ trễ, không realtime.
- v3.5/v4: full mesh cần n(n−1)/2 kết nối, hợp nhóm nhỏ (≤ ~6); cập nhật task không được chuyển tiếp qua peer thứ ba (chỉ offer/answer được chuyển tiếp).
- Gộp Last-Write-Wins theo đồng hồ máy: hai người sửa cùng task gần như cùng lúc thì một thay đổi bị ghi đè; máy lệch giờ ảnh hưởng kết quả. Hướng cải thiện: vector clock hoặc CRDT.
- Service Worker chỉ chạy với `localhost`/HTTPS; qua `http://192.168.x.x` thì F5 khi mất server không mở được trang.
- Chỉ thử trong LAN / cùng máy (`iceServers: []`), không xuyên NAT qua Internet.
- Tên người dùng không xác thực (đề không yêu cầu đăng nhập).
- v4 đăng ký Service Worker cho `localhost:3000`: khi demo các mốc cũ nên dùng cửa sổ ẩn danh mới.

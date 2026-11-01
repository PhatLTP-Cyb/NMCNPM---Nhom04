# Nhật ký quyết định kiến trúc

Chuỗi phát triển trên nhánh `main`: **v1 → v2 → v3 → v3.5 → v4**. Bản V4 đầu tiên (2 peer, copy/paste) giữ ở tag `v4-prototype` để đối chiếu.

| Version | NFR mới | Quyết định thiết kế | File/thành phần đổi | Kết quả test |
|---|---|---|---|---|
| V1 | Dữ liệu còn sau khi khởi động lại (persistence) trên 1 máy | Express phục vụ trang tĩnh + REST API; đọc/ghi toàn bộ `tasks.json` mỗi request; HTML + JS viết chung 1 file | `server.js`, `public/index.html` | Tạo 2 task, tick 1, restart → còn đủ 2 task, trạng thái đúng |
| V2 | Chia sẻ trạng thái tập trung giữa nhiều client | Client–Server: listen `0.0.0.0`, polling 2 giây, ghi file atomic (tmp + rename), hiển thị trạng thái kết nối | `server.js`, `public/index.html` | A tạo → B thấy sau ≤ 2 giây; B tick → A thấy; tắt server → client báo mất kết nối |
| V3 | Modifiability: thay UI và persistence mà nghiệp vụ giữ nguyên | Tách N-Layer (routes / service / repository), dependency injection ở `server.js`; MVC phía client; repository SQLite cùng interface; script migrate idempotent | Đổi UI: `view.js`, `index.html`, `style.css`. Đổi DB: `sqliteTaskRepository.js` (mới), `migrate-json-to-sqlite.js` (mới), `server.js` (2 dòng), `package.json` | Migrate 2 lần không trùng; task V2 hiện trên Kanban; tạo/chuyển cột/xóa; restart vẫn còn |
| V3.5 (từ V3) | Nhiều người dùng có tên; cộng tác P2P cho nhóm >2 người khi mất server | Tên hiển thị (không đăng nhập) đi xuyên các tầng; signaling qua server chỉ để bắt tay; full mesh WebRTC; mỗi thay đổi gửi dạng "phiên bản mới nhất của task", gộp LWW + tombstone | V3.5a: service, routes, repo SQLite (+cột), api/model/view/controller. V3.5b: `signalingHub.js`, `signalRoutes.js`, `server.js`. V3.5c: `mesh.js`, `localStore.js`, model/controller/view | 4 người nối mesh; người vào sau không làm task đã xóa sống lại; tắt server: tạo/chuyển cột/xóa lan tới cả 3 người còn lại |
| V4 (từ V3.5) | Availability khi server trung tâm không truy cập được, kể cả khi sập **trước** khi nhóm hình thành; giao tiếp ngang hàng; không mất dữ liệu khi server sống lại; mở lại được trang khi mất server | Bắt tay dự phòng copy/paste; peer giới thiệu danh sách và chuyển tiếp offer/answer để người mới nối đủ mesh; `POST /api/tasks/sync` gộp LWW ở tầng nghiệp vụ, client tự đẩy khi server sống lại; Service Worker network-first cho giao diện | a: `mesh.js`, `controller.js`, `view.js`, `index.html`, `style.css`. b: `taskService.js`, `taskRoutes.js`, `api.js`, `model.js`, `controller.js`, `view.js`, `index.html`. c: `sw.js` (mới), `controller.js`, `mesh.js` | Server sập từ đầu: A–B, A–C thủ công, C tự nối B qua A, đồng bộ 3 chiều; offline thêm/sửa/xóa → server sống lại ghi đúng 1/1/1, lặp lại 0/0/0; F5 khi mất server vẫn mở trang và nối lại được; chế độ Server + migrate vẫn đúng |

*Tham khảo – V4-prototype (tag `v4-prototype`, phát triển từ V3):* Availability khi mất server; giao tiếp ngang hàng · Giữ chế độ Server của V3; thêm chế độ P2P: WebRTC DataChannel, signaling thủ công bằng copy/paste, `iceServers: []`; bản sao localStorage; gửi thao tác (create/setDone/delete) + snapshot khi kết nối · `p2p.js` (mới), `localStore.js` (mới), `model.js`, `controller.js`, `index.html`, `style.css` · Kết nối A–B, tắt server; A tạo → B nhận; B chuyển cột → A nhận; A xóa → B nhận

## Ràng buộc mới và hạn chế của thiết kế cũ (viết trước mỗi phiên bản)
- **Trước V2** – Ràng buộc: hai thiết bị phải thấy cập nhật của nhau. Hạn chế V1: server chỉ nghe `localhost`, client chỉ tải dữ liệu khi chính nó thao tác.
- **Trước V3** – Ràng buộc: đổi UI sang Kanban và JSON sang SQLite mà không mất dữ liệu. Hạn chế V2: route vừa xử lý HTTP, vừa kiểm tra dữ liệu, vừa đọc/ghi file; HTML trộn với logic gọi API.
- **Trước V3.5** – Ràng buộc: nhóm hơn 2 người cần cộng tác khi mất server, và cần biết ai tạo/sửa task. Hạn chế V3: không có khái niệm người dùng, mọi thao tác phải qua server; copy/paste mã như V4 không khả thi khi nhiều người (n(n−1)/2 lần).
- **Trước V4** – Ràng buộc: tình huống V4 là server *không truy cập được*, có thể sập trước khi ai kịp vào nhóm. Hạn chế V3.5: bắt tay chỉ qua chính server đó; thay đổi lúc offline không về DB; F5 khi mất server là mất trang.
- **Trước V4-prototype** (bản đầu, tham khảo) – Ràng buộc: server không truy cập được, 2 máy vẫn cộng tác. Hạn chế V3: mọi thao tác phải qua server – server là điểm lỗi duy nhất.

## Prompt chính đã dùng
- V1: "Tạo ứng dụng quản lý công việc Node.js + Express: tạo, xem, đánh dấu hoàn thành, xóa task. Lưu vào tasks.json ở backend, giao diện 1 trang HTML đơn giản. Không cần đăng nhập."
- V2: "Sửa code hiện có (không tạo project mới) để 2 trình duyệt trên 2 máy dùng chung dữ liệu: server nghe 0.0.0.0, client polling 2 giây, ghi file an toàn, hiển thị khi mất kết nối server."
- V3a: "Chỉ ra chỗ code đang trộn giao diện, nghiệp vụ và truy cập dữ liệu. Tách thành presentation/business/data với repository interface, frontend tách model/view/controller. Không đổi hành vi."
- V3b: "Đổi giao diện danh sách sang Kanban 2 cột Chưa hoàn thành / Hoàn thành. Chỉ sửa View."
- V3c: "Thêm SqliteTaskRepository cùng interface với JsonTaskRepository, script migrate tasks.json sang tasks.db chạy lại không trùng, đổi server.js sang SQLite."
- V3.5: "Từ tag v3, thêm tên người dùng (createdBy/updatedBy) qua mọi tầng; thêm signaling hub trên server chỉ để bắt tay; client nối full mesh WebRTC giữa nhiều peer, bản sao localStorage, gộp LWW có tombstone; hiển thị danh sách người đang kết nối."
- V4: "Từ v3.5, thêm bắt tay thủ công copy/paste vào mesh khi không gặp được server; khi kênh mở, gửi danh sách peer để người mới tự mời những người còn lại, offer/answer được chuyển tiếp qua peer chung. Thêm POST /api/tasks/sync gộp LWW trong TaskService, client tự đồng bộ khi server sống lại. Thêm Service Worker cache giao diện."
- V4-prototype: "Giữ chế độ server của V3, thêm chế độ P2P bằng WebRTC DataChannel với signaling thủ công copy/paste, không dùng server chuyển tiếp. Mỗi peer lưu bản sao localStorage, gửi thao tác trực tiếp."

## Lỗi phát sinh
- `EADDRINUSE: address already in use :3000` khi chạy lại test trong lúc server cũ vẫn chạy → tắt tiến trình cũ trước khi `npm start`.
- V4: mã copy/paste chứa tên tiếng Việt làm `btoa` lỗi "characters outside of the Latin1 range" → mã hóa UTF-8 trước khi base64.
- V4: người F5 vào lại với id mới nên danh sách hiện hai dòng cùng tên → ẩn kết nối cũ đã đóng khi đã có kết nối mới cùng tên.


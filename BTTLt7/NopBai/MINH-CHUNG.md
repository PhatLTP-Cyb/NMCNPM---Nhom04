# Minh chứng kiểm chứng từng phiên bản

**Ngày chạy:** 27/10/2026 · **Máy:** laptop Windows của nhóm · **Code:** `taskapp`, lần lượt `git checkout v1 → v2 → v3 → v3.5 → v4` trên cùng một thư mục, dữ liệu giữ nguyên giữa các mốc.

**Cách chạy:**
- **Server:** chạy bằng `chay-thu\1-chay-server.bat`, tắt bằng cách đóng cửa sổ server. Migrate chạy bằng `chay-thu\2-migrate.bat`.
- **Client:** dùng trình duyệt tích hợp trong app Claude (nhân Chromium), mỗi client là một tab.
  - **A** = `http://localhost:3000`, **B** = `http://127.0.0.1:3000`. Hai origin khác nhau nên localStorage tách riêng, tương đương hai trình duyệt độc lập.
  - **C** (từ V3.5) = tab `localhost` thứ hai. C dùng chung localStorage với A, nhưng có mã peer, bộ nhớ và kết nối WebRTC riêng.
- **Thao tác:** gõ và bấm trên giao diện. Riêng một số nút trên thẻ Kanban được bấm bằng script `element.click()` ngay trên trang, vì giao diện vẽ lại sau mỗi lần polling. Script này vẫn gọi đúng handler của nút như khi người dùng bấm. Mã kết nối thủ công ở V4 được chuyển giữa các tab bằng script, thay cho thao tác copy/paste tay.

Ảnh nằm trong thư mục `minh-chung/`.

## V1 – Chạy trên một máy, lưu `tasks.json`
| Bước | Thao tác | Kết quả | Ảnh | Trạng thái |
|---|---|---|---|---|
| 1 | Chạy server V1 | "V1 đang chạy tại http://localhost:3000" | `v1-1-server-chay.png` | Đạt |
| 2 | Tạo "Viết báo cáo", "Họp nhóm"; tick "Viết báo cáo" | 2 task, task 1 gạch ngang | `v1-2-tao-2-task-hoan-thanh-1.png` | Đạt |
| 3 | Xem `tasks.json` | 2 bản ghi, `"done": true` ở task 1 | `v1-5-noi-dung-tasks-json.png` | Đạt |
| 4 | Đóng cửa sổ server (gọi API báo "Failed to fetch"), chạy lại | Server chạy lại | `v1-3-khoi-dong-lai-server.png` | Đạt |
| 5 | Tải lại trang | Còn đủ 2 task và trạng thái | `v1-4-sau-khi-khoi-dong-lai.png` | **Đạt** |

## V2 – Hai client dùng chung server
| Bước | Thao tác | Kết quả | Ảnh | Trạng thái |
|---|---|---|---|---|
| 1 | Chạy server V2 | Nghe `0.0.0.0`, in 5 địa chỉ LAN | `v2-1-server-lan.png` | Đạt |
| 2 | A tạo "Task từ A", B không thao tác | B thấy task sau polling | `v2-2-A-tao-B-thay.png` | Đạt |
| 3 | B tick "Task từ A" | A thấy task gạch ngang | `v2-3-B-cap-nhat-A-thay.png` | **Đạt** |
| 4 | Đóng cửa sổ server | Cả A và B báo "Mất kết nối server" | `v2-4-tat-server.png` | Đạt (minh họa server là điểm lỗi duy nhất) |

## V3 – Kanban + SQLite + N-Layer/MVC
| Bước | Thao tác | Kết quả | Ảnh | Trạng thái |
|---|---|---|---|---|
| 1 | `2-migrate.bat` (chạy migrate 2 lần) | Lần 1 "thêm mới 3", lần 2 "thêm mới 0" | `v3-1-migrate-2-lan.png` | Đạt |
| 2 | Chạy server, mở Kanban | Đủ 3 task của V1, V2 đúng cột | `v3-2-kanban-sau-migrate.png` | **Đạt** |
| 3 | Tạo "Task mới ở V3" | Thẻ mới ở cột Chưa hoàn thành | `v3-3-tao-task.png` | Đạt |
| 4 | Chuyển cột task mới; xóa "Họp nhóm" | Task sang Hoàn thành; "Họp nhóm" biến mất | `v3-4-chuyen-cot-va-xoa.png` | Đạt |
| 5 | Đóng và chạy lại server, tải lại | Dữ liệu còn nguyên | `v3-5-…`, `v3-6-sau-khi-khoi-dong-lai.png` | **Đạt** |
| 6 | `git show --stat v3~1` và `v3` | Đổi UI chỉ chạm 3 file View; đổi DB chỉ chạm Data Access + migrate + 2 dòng `server.js` | `v3-7-git-show-tach-biet.png` | **Đạt** |

## V3.5 – Tên người dùng + nhóm P2P nhiều người (bắt tay qua server)
| Bước | Thao tác | Kết quả | Ảnh | Trạng thái |
|---|---|---|---|---|
| 1 | Chạy server V3.5 | Chạy bình thường, DB cũ tự thêm cột | `v35-1-server.png` | Đạt |
| 2 | A nhập tên "An", tạo task | "Tạo bởi An"; task cũ "Ẩn danh" | `v35-2-ten-nguoi-dung.png` | Đạt |
| 3 | An, Bình, Chi bấm "Tham gia nhóm P2P" | Chi nối trực tiếp với An và Bình | `v35-3-mesh-3-nguoi.png` | Đạt |
| 4 | **Tắt server** (gọi API báo "Failed to fetch"); An tạo task | Bình nhận ngay | `v35-4-tat-server-A-tao-B-thay.png` | **Đạt** |
| 5 | Chi chuyển cột | An thấy "Tạo bởi An · sửa bởi Chi" | `v35-5-C-chuyen-cot-A-thay.png` | **Đạt** |
| 6 | Bình xóa một task | Task biến mất ở Chi | `v35-6-B-xoa-C-thay.png` | **Đạt** |
| 7 | `git show --stat v3.5~3` | Thêm một trường dữ liệu phải sửa xuyên mọi tầng | `v35-7-git-show-them-truong-xuyen-tang.png` | Ghi nhận đánh đổi |

## V4 – Server sập từ đầu: bắt tay thủ công, giới thiệu qua mesh, đồng bộ ngược
| Bước | Thao tác | Kết quả | Ảnh | Trạng thái |
|---|---|---|---|---|
| 1 | Chạy server V4 để tải trang ở 3 tab, rồi **tắt server trước khi ai vào nhóm** | Gọi API báo "Failed to fetch" | `v4-1-server-v4.png` | Đạt |
| 2 | An ↔ Bình bắt tay thủ công; An ↔ Chi bắt tay thủ công | Bình thấy cả Chi "đã kết nối trực tiếp" dù không trao mã với Chi | `v4-2-noi-thu-cong-va-gioi-thieu.png` | **Đạt** |
| 3 | Bình tạo task → Chi chuyển cột → An xóa "Viết báo cáo" | Cả ba thấy giống nhau; "Tạo bởi Bình · sửa bởi Chi" | `v4-3-dong-bo-3-chieu.png` | **Đạt** |
| 4 | Chạy lại server | Bình: "đã đồng bộ: thêm 2, sửa 0, xóa 2"; An: "0/0/0" | `v4-4-server-song-lai.png`, `v4-5-dong-bo-nguoc.png` | **Đạt** |
| 5 | So sánh bảng `tasks` trước và sau | DB khớp với bản P2P (2 task mới, 2 task đã xóa) | `v4-6-db-truoc-va-sau-dong-bo.png` | **Đạt** |
| 6 | F5 khi server đã tắt (Service Worker) | **Chưa kiểm chứng được trên máy này.** Trình duyệt tích hợp của app Claude từ chối đăng ký Service Worker ("An unknown error occurred when fetching the script"), dù `/sw.js` tải được với mã 200 | — | **Chưa đạt trên máy này** |

**Về bước V4-6:**
- **Đã kiểm chứng ở đâu:** bằng test tự động Chromium `tests/e2e-v4-reload.js`. Kết quả: F5 khi server tắt vẫn mở được trang, dữ liệu còn, và nối lại được.
- **Cách tự chụp:** mở app bằng Chrome hoặc Edge thường tại `http://localhost:3000` khi server đang chạy, tắt server, nhấn F5.
- **Giới hạn đã nêu trong README:** Service Worker không chạy khi truy cập qua địa chỉ LAN dạng `http://192.168.x.x`.

## Ghi chú
- **Bản V4 đầu tiên:** tag `v4-prototype` (2 peer, copy/paste) không được chụp lại. Kết quả của nó nằm trong tài liệu hướng dẫn và test `e2e-v4.js` cũ.
- **Dữ liệu tập dượt cũ:** đã được sao lưu vào `BTTLt7\sao-luu-du-lieu-tap-duot\` trước khi chạy minh chứng.

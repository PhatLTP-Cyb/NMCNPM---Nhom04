// TC-D09: gui dong thoi 2 yeu cau dat cung mot khung con 1 cho.
// Chay khi app dang chay: npm run dong-thoi   (doi cong: set PORT=...)
const PORT = Number(process.env.PORT) || 3000;
const BASE = `http://localhost:${PORT}`;
const BAC_SI = 'BS06', NGAY = '2026-11-20', GIO = '09:00';

async function main() {
  const d = await (await fetch(`${BASE}/api/khung-gio?bacSi=${BAC_SI}&ngay=${NGAY}`)).json();
  const khung = (d.khung || []).find((k) => k.gio_bat_dau === GIO);
  if (!khung) throw new Error(`Không tìm thấy khung ${BAC_SI} ${NGAY} ${GIO}`);
  console.log(`Khung ${BAC_SI} ${NGAY} ${GIO} (mã ${khung.ma_khung_gio}) trước khi gửi: ${khung.trang_thai}`);

  const yeuCau = [
    { sdt: '0977000001', hoTen: 'Khách Đồng Thời Một', ngaySinh: '1990-01-01', gioiTinh: 'Nam' },
    { sdt: '0977000002', hoTen: 'Khách Đồng Thời Hai', ngaySinh: '1991-02-02', gioiTinh: 'Nữ' },
  ].map((bn) => fetch(`${BASE}/api/dat-lich`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ ...bn, otp: '123456', maKhungGio: khung.ma_khung_gio }),
  }).then(async (r) => ({ sdt: bn.sdt, status: r.status, body: await r.json() })));

  const kq = await Promise.all(yeuCau);   // gui ca hai cung luc
  for (const r of kq) {
    console.log(r.status === 200
      ? `  ${r.sdt}: THÀNH CÔNG – mã lịch ${r.body.lich.ma_code_lich}`
      : `  ${r.sdt}: TỪ CHỐI – ${r.body.loi}`);
  }
  const soThanhCong = kq.filter((r) => r.status === 200).length;
  console.log(`Số yêu cầu thành công: ${soThanhCong}/2. Kiểm tra tiếp ở trang Trạng thái dữ liệu (bảng Khung giờ ${BAC_SI} ${NGAY}).`);
}

main().catch((e) => { console.error('Lỗi:', e.message, '\nApp đã chạy chưa? (npm start)'); process.exit(1); });

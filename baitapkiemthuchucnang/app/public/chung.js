// Ham dung chung cho moi trang.
const TRANG = [
  ['/dat-lich.html', 'Đặt lịch khám'],
  ['/lich-cua-toi.html', 'Lịch hẹn của tôi'],
  ['/bac-si.html', 'Danh sách lịch bác sĩ'],
  ['/thong-bao.html', 'Nhật ký thông báo'],
  ['/trang-thai.html', 'Trạng thái dữ liệu'],
];

async function api(method, url, body) {
  const res = await fetch(url, {
    method,
    headers: body ? { 'Content-Type': 'application/json' } : {},
    body: body ? JSON.stringify(body) : undefined,
  });
  const data = await res.json().catch(() => ({ loi: 'Phản hồi không hợp lệ từ máy chủ' }));
  if (!res.ok) { const e = new Error(data.loi || 'Lỗi'); Object.assign(e, data); throw e; }
  return data;
}

function esc(s) {
  return String(s ?? '').replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]));
}
const ngayVN = (ymd) => (ymd ? ymd.slice(0, 10).split('-').reverse().join('/') : '');
const thoiDiemVN = (s) => (s ? `${ngayVN(s.slice(0, 10))} ${s.slice(11, 16)}` : '');
const $ = (sel) => document.querySelector(sel);

function hopThongBao(el, loai, html) {
  el.className = 'hop ' + loai;
  el.innerHTML = html;
  el.hidden = !html;
}

async function capNhatDauTrang() {
  try {
    const info = await api('GET', '/api/info');
    $('#phien-ban').textContent = info.version;
    $('#dong-ho').textContent = thoiDiemVN(info.dongHo);
    return info;
  } catch { return null; }
}

function veDauTrang() {
  const nav = TRANG.map(([href, ten]) =>
    `<a href="${href}" class="${location.pathname === href ? 'dang-o' : ''}">${ten}</a>`).join('');
  document.body.insertAdjacentHTML('afterbegin', `
    <header class="dau-trang">
      <a class="logo" href="/">Phòng khám An Tâm</a>
      <nav>${nav}</nav>
      <div class="phien-ban">Phiên bản app <b id="phien-ban">…</b> · Đồng hồ hệ thống: <b id="dong-ho">…</b></div>
    </header>`);
  capNhatDauTrang();
}

// Bo chon chuyen khoa -> bac si dung chung cho cac trang.
async function napChonBacSi(selCk, selBs, coTatCaCk = true) {
  const dm = await api('GET', '/api/danh-muc');
  selCk.innerHTML = (coTatCaCk ? '<option value="">-- Tất cả chuyên khoa --</option>' : '') +
    dm.chuyenKhoa.map((c) => `<option value="${c.ma_chuyen_khoa}">${esc(c.ten)}</option>`).join('');
  const loc = () => {
    const ds = dm.bacSi.filter((b) => !selCk.value || b.ma_chuyen_khoa === selCk.value);
    selBs.innerHTML = '<option value="">-- Chọn bác sĩ --</option>' +
      ds.map((b) => `<option value="${b.ma_bac_si}">BS ${esc(b.ho_ten)} (${esc(b.chuyen_khoa)})</option>`).join('');
  };
  selCk.onchange = loc;
  loc();
  return dm;
}

document.addEventListener('DOMContentLoaded', veDauTrang);

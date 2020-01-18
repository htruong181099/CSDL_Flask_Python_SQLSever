----Liet ke san pham va cua hang theo gia ban ra san pham ------------------
select S.MaSanPham,S.TenSanPham,S.MoTa,S.ThongTin,S.GiaBan,C.TenCuaHang
from SanPham S,KinhDoanh_SanPham_CuaHang K,CuaHang C
where S.MaSanPham=K.MaSanPham and K.MaCuaHang=C.MaCuaHang
order by S.GiaBan

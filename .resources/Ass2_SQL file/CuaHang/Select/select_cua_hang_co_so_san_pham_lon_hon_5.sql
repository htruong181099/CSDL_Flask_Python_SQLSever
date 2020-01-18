-------------------------Cua hang co so san pham lon hon 5--------------------------
select C.MaCuaHang,TenCuaHang,HoTenChuCuaHang,Email,COUNT(S.MaSanPham) as SoSanPhamHienCo
from CuaHang C, KinhDoanh_SanPham_CuaHang K, SanPham S
where C.MaCuaHang=K.MaCuaHang and K.MaSanPham=S.MaSanPham
group by C.MaCuaHang,TenCuaHang,HoTenChuCuaHang,Email
having count(S.MaSanPham)>5
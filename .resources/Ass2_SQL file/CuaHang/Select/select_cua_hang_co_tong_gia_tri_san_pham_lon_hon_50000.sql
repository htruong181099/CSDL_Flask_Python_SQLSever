-----------------Cua hang co tong gia tri san pham dang ban lon hon 50000-------------
select C.MaCuaHang,C.TenCuaHang,C.HoTenChuCuaHang,C.Email, sum(S.GiaBan) as TongGiaTriSanPham
from CuaHang C, KinhDoanh_SanPham_CuaHang K, SanPham S
where C.MaCuaHang=K.MaCuaHang and K.MaSanPham=S.MaSanPham
group by C.MaCuaHang,C.TenCuaHang,C.HoTenChuCuaHang,C.Email
having sum(S.GiaBan)>50000
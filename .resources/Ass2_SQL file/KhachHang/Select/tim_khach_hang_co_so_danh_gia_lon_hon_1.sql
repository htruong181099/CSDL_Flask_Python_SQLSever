-----Tim nhung khach hang co so danh gia lon hon 1 sap xep theo so danh gia-----------
select K.MaKhachHang,K.HoTen,K.Email,K.SDT,count(D.MaKhachHang) as SoDanhGia 
from KhachHang K, DanhGia_KhachHang_SanPham D
where K.MaKhachHang=D.MaKhachHang
group by K.MaKhachHang,K.HoTen,K.Email,K.SDT
having count(D.MaKhachHang)>1
order by SoDanhGia
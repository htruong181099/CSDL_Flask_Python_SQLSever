----Liet ke nhung san pham co so luong mua lon hon 0 theo thu tu so luong ban ra------------
select S.MaSanPham,S.TenSanPham,S.GiaBan,sum(C.SoLuong) as SoSanPhamBanRa
from SanPham S, Chua_DonHang_SanPham C
where S.MaSanPham=C.MaSanPham
group by S.MaSanPham,S.TenSanPham,S.GiaBan
having sum(C.SoLuong)>0
order by SoSanPhamBanRa
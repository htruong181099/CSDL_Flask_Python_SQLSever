-------Tim san pham co so sao trung binh lon hon 2 theo thu tu tu  nho den lon--------------------

select S.MaSanPham,S.TenSanPham,AVG(Sao) SaoTrungBinh
from SanPham S, DanhGia_KhachHang_SanPham D
where S.MaSanPham=D.MaSanPham
group by S.MaSanPham,S.TenSanPham
having AVG(Sao)>2
order by SaoTrungBinh
--------Tim nhung don hang cua khach hang Nguyen Cau Sinh sap xep theo so tien don hang tu it den nhieu------------------ 
select K.MaKhachHang,K.HoTen,K.Email,K.SDT,Don.MaDonHang,Don.TongSoTienDonHang
from KhachHang K, Dat_DonHang_KhachHang Dat, DonHang Don
where K.MaKhachHang=Dat.MaKhachHang and Dat.MaDonHang=Don.MaDonHang and K.HoTen=N'Nguyễn Cầu Sinh'
order by Don.TongSoTienDonHang
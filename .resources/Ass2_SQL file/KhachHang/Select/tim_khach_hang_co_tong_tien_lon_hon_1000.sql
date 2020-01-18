----Tim khach hang co tong tien lon hon 1000 sap xep theo thu tu tu nho den lon-------------------
select K.MaKhachHang,K.HoTen,K.SDT,sum(TongSoTienDonHang) as TongTienDonHang
from KhachHang K , Dat_DonHang_KhachHang Dat, DonHang Don
where K.MaKhachHang=Dat.MaKhachHang and Don.MaDonHang=Dat.MaDonHang
group by K.MaKhachHang,K.HoTen,K.SDT
having sum(TongSoTienDonHang)>1000
order by TongTienDonHang

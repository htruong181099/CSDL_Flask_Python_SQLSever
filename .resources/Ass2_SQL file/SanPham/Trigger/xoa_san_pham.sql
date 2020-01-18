create trigger xoa_san_pham on SanPham
instead of delete 
as
begin
	delete from UaThich_KhachHang_SanPham where MaSanPham in (select MaSanPham from deleted)
	delete from Chua_DonHang_SanPham where MaSanPham in (select MaSanPham from deleted)
	delete from DanhGia_KhachHang_SanPham where MaSanPham in (select MaSanPham from deleted)
	delete from ApDung_MaGiamGia_SanPham where MaSanPham in (select MaSanPham from deleted)
	delete from ThuocTinhSanPham where MaSanPham in (select MaSanPham from deleted)
	delete from Thuoc_DanhMuc_SanPham where MaSanPham in (select MaSanPham from deleted)
	delete from KinhDoanh_SanPham_CuaHang where MaSanPham in (select MaSanPham from deleted)
	update HoiDap set MaSanPham=null where MaSanPham in (select MaSanPham from deleted)
	delete from SanPham where MaSanPham in (select MaSanPham from deleted)
end
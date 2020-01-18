create procedure tim_cac_san_pham_cua_cua_hang_theo_id
	@id int
as
begin
	select S.MaSanPham,TenSanPham,GiaBan,K.SoLuong
	from SanPham S join KinhDoanh_SanPham_CuaHang K on S.MaSanPham=K.MaSanPham
	where MaCuaHang = @id
end
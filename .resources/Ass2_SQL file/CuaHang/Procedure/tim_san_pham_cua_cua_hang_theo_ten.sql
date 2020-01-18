create procedure tim_cac_san_pham_cua_cua_hang_theo_ten
	@tencuahang nvarchar(50)
as
begin
	select S.MaSanPham,S.TenSanPham,S.ThongTin,S.MoTa,S.GiaBan,K.SoLuong
	from SanPham S join KinhDoanh_SanPham_CuaHang K on S.MaSanPham=K.MaSanPham join CuaHang as C on C.MaCuaHang=K.MaCuaHang 
	where TenCuaHang = @tencuahang
end
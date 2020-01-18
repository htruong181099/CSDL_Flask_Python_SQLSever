create trigger xoa_cua_hang on CuaHang
instead of delete
as
begin
	delete from KinhDoanh_SanPham_CuaHang where MaCuaHang in (select MaCuaHang from deleted)
	delete from SoDiaChiCuaHang where MaCuaHang in (select MaCuaHang from deleted)
	delete from ApDung_MaGiamGia_CuaHang where MaCuaHang in (select MaCuaHang from deleted)
		update HoiDap
	set MaCuaHang=null
	where MaCuaHang in (select MaCuaHang from deleted)
	delete from CuaHang where MaCuaHang=(select MaCuaHang from deleted)
end
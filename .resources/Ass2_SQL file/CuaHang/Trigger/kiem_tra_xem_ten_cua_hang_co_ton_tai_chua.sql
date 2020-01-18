--------------Kiểm tra xem tên cửa hàng đã có chưa, nếu có thì thông báo để tránh gây nhầm lẫn-----------------
create trigger them_tai_khoan_cua_hang on CuaHang
after insert
as
begin
	if (select count(*) from CuaHang where TenCuaHang= (select TenCuaHang from inserted))>1
	begin
		print(N'Tên Cửa hàng đã tồn tại. Chủ cửa hàng cần lưu ý!!!!');
	end
end
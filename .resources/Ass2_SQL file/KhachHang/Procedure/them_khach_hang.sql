create procedure them_tai_khoan_khach_hang
	@hoten nvarchar(100),
	@matkhau nvarchar(50),
	@email nvarchar(50)
as
begin
	if (@email not like '%@gmail.com')
	begin
		raiserror ('Wrong email type !',11,1)
		return 0;
	end;
	if len(@matkhau) <8 
	begin
		raiserror('Password too short!',11,1)
		return 0;
	end
	insert into 
	KhachHang(HoTen,MatKhau,Email)
	values(@hoten,@matkhau,@email)
	return @@rowcount
end
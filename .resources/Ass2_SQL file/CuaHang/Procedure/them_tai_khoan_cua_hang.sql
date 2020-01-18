create procedure them_tai_khoan_cua_hang
	@hotenchu nvarchar(100),
	@matkhau nvarchar(50),
	@tencuahang nvarchar(50),
	@email nvarchar(50),
	@matrungtam char(10)
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
	if not exists (select * from TrungTam where @matrungtam=MaTrungTam)
	begin
		raiserror('Trung tam khong ton tai!',11,1)
		return 0;
	end
	insert into CuaHang(
		HoTenChuCuaHang,
		MatKhau,
		TenCuaHang,
		Email,
		MaTrungTam
	)values(
		@hotenchu,
		@matkhau,
		@tencuahang,
		@email,
		@matrungtam
	)
	return @@rowcount;
end
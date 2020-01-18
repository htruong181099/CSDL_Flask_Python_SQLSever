create procedure them_san_pham
	@macuahang int,
	@ten nvarchar(100),
	@thongtin nvarchar(1000),
	@mota nvarchar(500),
	@giaban money,
	@soluong int
as
begin
	if (@giaban < 0)
	begin
		raiserror('Gia ban khong the la so am!',11,1)
		return 0;
	end
	insert into SanPham
	(
		tensanpham,
		thongtin,
		mota,
		giaban
	)values(
		@ten,
		@thongtin,
		@mota,
		@giaban
	)
	insert into KinhDoanh_SanPham_CuaHang
	(
		MaCuaHang,
		MaSanPham,
		SoLuong
	)values(
		@macuahang,
		(select SCOPE_IDENTITY()),
		@soluong
	)
	return @@rowcount;
end
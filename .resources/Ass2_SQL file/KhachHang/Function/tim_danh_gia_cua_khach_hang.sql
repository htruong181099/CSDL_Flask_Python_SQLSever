------Tim nhung danh gia cua khach hang co so sao lon hon value-------
create function tim_danh_gia_cua_khach_hang(@makhachhang int,@value int)
returns @result table(
	MaSanPham int,
	TenSanPham nvarchar(100),
	HinhAnh nvarchar(200),
	Mota nvarchar(500),
	Sao int)
as
begin
	if(@value<0 or @value >5)
	begin
		declare @error int
		set @error = cast('So sao khong the <0 hay >5!' as int)
		return;
	end
	if(not exists(select * from KhachHang where MaKhachHang=@makhachhang))
	begin
		set @error=cast('Khach hang khong ton tai!' as int)
		return ;
	end
	declare @cursor cursor
	declare @masanpham int
	declare @tensanpham nvarchar(100)
	declare @mota nvarchar(500)
	declare @hinhanh nvarchar(200)
	declare @sao int
	set @cursor=cursor for
		select D.MaSanPham,s.TenSanPham,D.MoTa,D.HinhAnh,D.Sao
		from KhachHang k,DanhGia_KhachHang_SanPham D, SanPham S
		where K.MaKhachHang=@makhachhang and K.MaKhachHang=D.MaKhachHang and D.MaSanPham=S.MaSanPham
	open @cursor
	fetch next from @cursor into @masanpham,@tensanpham,@mota,@hinhanh,@sao
	while (@@FETCH_STATUS=0)
	begin
		if (@sao>@value)
		begin
			insert into @result(
				MaSanPham,
				TenSanPham,
				Mota,
				HinhAnh,
				Sao)
			values(
				@masanpham,
				@tensanpham,
				@mota,
				@hinhanh,
				@sao
			)
		end
		fetch next from @cursor into @masanpham,@tensanpham,@mota,@hinhanh,@sao
	end
	close @cursor
	deallocate @cursor
	return;
end
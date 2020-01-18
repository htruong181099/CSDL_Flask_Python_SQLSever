-----Tim nhung san pham co so lan yeu thich lon hon value-----
create function tim_san_pham_co_so_lan_yeu_thich(@solanyeuthich int)
returns @result table(
	MaSanPham int,
	TenSanPham nvarchar(100),
	ThongTin nvarchar(1000),
	Mota nvarchar(500),
	GiaBan money,
	SoLanYeuThich int)
as
begin
	if (@solanyeuthich<0)
	begin
		declare @error int
		set @error= cast('So lan yeu thich khong the be hon 0!' as int)
		return;
	end
	declare @cursor cursor
	declare @masanpham int
	declare @tensanpham nvarchar(100)
	declare @thongtin nvarchar(1000)
	declare @mota nvarchar(500)
	declare @giaban int
	declare @yeuthich int
	set @cursor = cursor for	
		select S.MaSanPham,S.TenSanPham,S.ThongTin,S.MoTa,S.GiaBan,count(*)
		from SanPham S join UaThich_KhachHang_SanPham U on S.MaSanPham=U.MaSanPham
		group by S.MaSanPham,S.TenSanPham,S.ThongTin,S.MoTa,S.GiaBan
	open @cursor
	fetch next from @cursor into @masanpham,@tensanpham,@thongtin,@mota,@giaban,@yeuthich
	while (@@FETCH_STATUS=0)
	begin
		if(@yeuthich>@solanyeuthich)
		begin
			insert into @result(
				MaSanPham,
				TenSanPham,
				ThongTin,
				Mota,
				GiaBan,
				SoLanYeuThich)
			values(
				@masanpham,
				@tensanpham,
				@thongtin,
				@mota,
				@giaban,
				@yeuthich)
		end
		fetch next from @cursor into @masanpham,@tensanpham,@thongtin,@mota,@giaban,@yeuthich
	end 
	close @cursor
	deallocate @cursor
	return;
end
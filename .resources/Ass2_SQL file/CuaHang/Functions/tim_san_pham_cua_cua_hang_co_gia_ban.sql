------------Tim cac san pham cua cua hang co gia ban lon hon value----------------
create function tim_san_pham_cua_cua_hang_co_gia_ban(@emailcuahang nvarchar(50),@value money)
returns @Result table(
	MaSanPham int,
	TenSanPham nvarchar(1000),
	ThongTin nvarchar(500),
	MoTa nvarchar(500),
	GiaBan money)
as
begin
	declare @cursor cursor
	declare @masanpham int
	declare @tensanpham nvarchar(1000)
	declare @thongtin nvarchar(500)
	declare @mota nvarchar(500)
	declare @giaban money
	declare @error nvarchar(100)
	if not exists(select * from CuaHang where @emailcuahang=Email)
	begin
		set @error = cast('Cua Hang Khong Ton Tai!' as int)
		return
	end
	if (@value<0) 
	begin
		set @error= cast ('Value khong the be hon 0!' as int)
		return
	end
	set @cursor=cursor for
	select S.MaSanPham,S.TenSanPham,S.ThongTin,S.MoTa,S.GiaBan
	from CuaHang C, KinhDoanh_SanPham_CuaHang K, SanPham S 
	where C.MaCuaHang=K.MaCuaHang and K.MaSanPham=S.MaSanPham and C.Email=@emailcuahang
	open @cursor
	fetch next from @cursor into @masanpham,@tensanpham,@thongtin,@mota,@giaban
	while @@FETCH_STATUS=0
	begin
		if (@giaban>@value)
		begin
			insert into @Result
			values (
				@masanpham,
				@tensanpham,
				@thongtin,
				@mota,
				@giaban
				)
		end
		fetch next from @cursor into @masanpham,@tensanpham,@thongtin,@mota,@giaban
	end
	close @cursor
	deallocate @cursor
	return;
end

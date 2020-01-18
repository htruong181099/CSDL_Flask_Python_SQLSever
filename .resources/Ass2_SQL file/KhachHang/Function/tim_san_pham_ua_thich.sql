------- Tim cac san pham ma khach hang ua thich co gia ban nho hon value --------
create function tim_san_pham_ua_thich(@makhachhang int,@value money)
returns @result table(
	MaSoSanPham int,
	TenSanPham nvarchar(100),
	GiaBan money,
	ThongTin nvarchar(1000)
	)
as begin
	if(@value<0)
	begin
		declare @error1 int
		set @error1=cast('Value khong the nhon hon 0!' as int)
		return ;
	end
	if (not exists(select * from KhachHang where MaKhachHang=@makhachhang))
	begin
		declare @error2 int
		set @error2=cast('Khach hang khong ton tai!' as int)
		return ;
	end
	declare @cursor cursor
	declare @MaSanPham int
	declare @TenSanPham nvarchar(100)
	declare @GiaBan money
	declare @ThongTin nvarchar(1000)
	set @cursor = cursor for
		select S.MaSanPham,S.TenSanPham,S.GiaBan,S.ThongTin
		from KhachHang K, UaThich_KhachHang_SanPham U, SanPham S
		where K.MaKhachHang=U.MaKhachHang and U.MaSanPham=S.MaSanPham and k.MaKhachHang=@makhachhang
	open @cursor
	fetch next from @cursor into @MaSanPham,@TenSanPham,@GiaBan,@ThongTin
	while (@@FETCH_STATUS=0)
	begin
		if(@GiaBan<@value)
		begin
			insert into @result(
				MaSoSanPham,
				TenSanPham,
				GiaBan,
				ThongTin)
			values(
				@MaSanPham,
				@TenSanPham,
				@GiaBan,
				@ThongTin)
		end
		fetch next from @cursor into @MaSanPham,@TenSanPham,@GiaBan,@ThongTin
	end
	close @cursor
	deallocate @cursor
	return;
end


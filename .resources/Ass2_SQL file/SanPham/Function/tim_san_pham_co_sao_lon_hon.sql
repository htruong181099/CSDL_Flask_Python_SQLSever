----Tim cac san pham co so sao lon hon value-------
use Ass2;
go
create function tim_san_pham_co_sao_lon_hon(@value int)
returns @result table(
	MaSanPham int,
	TenSanPham nvarchar(100),
	ThongTin nvarchar(1000),
	MoTa nvarchar(500),
	GiaBan money,
	SaoTrungBinh decimal(3,2)
	)
as
begin
	if(@value<0 or @value>5)
	begin
		declare @error int
		set @error = cast('So sao khong the be hon 0 hay lon hon 5!' as int)
		return;
	end
	declare @cursor cursor
	declare @masanpham int
	declare @tensanpham nvarchar(100)
	declare @thongtin nvarchar(1000)
	declare @mota nvarchar(500)
	declare @giaban int
	declare @sao decimal(3,2)
	set @cursor = cursor for	
		select S.MaSanPham,S.TenSanPham,S.ThongTin,S.MoTa,S.GiaBan,avg(sao)
		from SanPham S join DanhGia_KhachHang_SanPham D on S.MaSanPham=D.MaSanPham
		group by S.MaSanPham,S.TenSanPham,S.ThongTin,S.MoTa,S.GiaBan
	open @cursor
	fetch next from @cursor into @masanpham,@tensanpham,@thongtin,@mota,@giaban,@sao
	while (@@FETCH_STATUS=0)
	begin
		if(@sao>@value)
		begin
			insert into @result(
				MaSanPham,
				TenSanPham,
				ThongTin,
				Mota,
				GiaBan,
				SaoTrungBinh)
			values(
				@masanpham,
				@tensanpham,
				@thongtin,
				@mota,
				@giaban,
				@sao)
		end
		fetch next from @cursor into @masanpham,@tensanpham,@thongtin,@mota,@giaban,@sao
	end 
	close @cursor
	deallocate @cursor
	return;
end
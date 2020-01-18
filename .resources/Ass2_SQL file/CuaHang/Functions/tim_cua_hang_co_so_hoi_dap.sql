-----------Tim cac cua hang co so tra loi hoi dap lon hon value-----------------
create function tim_cua_hang_co_so_hoi_dap(@value int)
returns @Result table(
	MaCuaHang int,
	TenCuaHang nvarchar(50),
	Email nvarchar(50),
	SDT nvarchar(10),
	SoHoiDap int
	)
as
begin
	declare @cursor cursor
	declare @macuahang int
	declare @tencuahang nvarchar(50)
	declare @email nvarchar(50)
	declare @sdt nvarchar(10)
	declare @sohoidap int
	declare @error nvarchar(100)
	if (@value<0)
	begin
		set @error= cast ('Value khong the be hon 0!' as int)
		return
	end
	set @cursor = cursor for 
	select C.MaCuaHang,C.TenCuaHang,C.Email,C.SDT,count(H.MaId) as SoHoiDap
	from CuaHang C, HoiDap H
	where C.MaCuaHang=H.MaCuaHang
	group by C.MaCuaHang,C.TenCuaHang,C.Email,C.SDT
	open @cursor
	fetch next from @cursor into @macuahang,@tencuahang,@email,@sdt,@sohoidap
	while @@FETCH_STATUS=0
	begin
		if (@sohoidap>@value)
		begin
			insert into @Result
			values(
				@macuahang,
				@tencuahang,
				@email,
				@sdt,
				@sohoidap)
		end
		fetch next from @cursor into @macuahang,@tencuahang,@email,@sdt,@sohoidap
	end
	close @cursor
	deallocate @cursor
	return ;
end 
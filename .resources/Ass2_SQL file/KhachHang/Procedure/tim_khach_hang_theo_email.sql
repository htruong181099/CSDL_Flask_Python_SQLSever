create procedure tim_khach_hang_theo_email
	@email nvarchar(50)
as
begin
	select Email,MatKhau,MaKhachHang
	from khachhang
	where Email=@email;
end
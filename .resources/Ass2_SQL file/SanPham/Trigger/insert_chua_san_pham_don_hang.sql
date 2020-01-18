---------------------Cảnh báo người dùng khi 1 loại hàng lơn hơn 10.000.000đ------------------
create trigger insert_chua_san_pham_don_hang on Chua_DonHang_SanPham
after insert 
as
begin
	declare @giamua money
	declare @soluong int
	set @giamua=(select GiaMua from inserted)
	set @soluong=(select SoLuong from inserted)
	if (@giamua*@soluong>10000000)
	begin
		print(N'Bạn đang mua hàng với tổng giá trị lớn hơn 10.000.000đ!')
	end
end
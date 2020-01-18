create procedure tim_san_pham_theo_ten
	@ten nvarchar(100)
as 
begin
	select *
	from SanPham
	where TenSanPham like '%'+@ten+'%'
end
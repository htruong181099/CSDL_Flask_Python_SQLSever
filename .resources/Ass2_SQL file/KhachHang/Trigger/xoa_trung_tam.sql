-------Trigger sẽ chuyễn Cửa hàng và trung tâm đã xóa về 1 trung tâm bất kỳ khác------------------

create trigger xoa_trung_tam on TrungTam
instead of delete
as
begin
	if (select count(*) from TrungTam)<1
	begin
		raiserror('Khong the xoa trung tam duy nhat dang ton tai!',11,1)
		return;
	end
	update CuaHang
	set MaTrungTam=(select top 1 MaTrungTam from TrungTam where MaTrungTam != (select MaTrungTam from deleted))

	update BoPhan
	set MaTrungTam=(select top 1 MaTrungTam from TrungTam where MaTrungTam != (select MaTrungTam from deleted))

	delete from TrungTam
	where MaTrungTam = (select MaTrungTam from deleted)
end
-------------------Liet ke cac cua hang thuoc trung tam nao theo thu tu ten cua hang------------------
select TenCuaHang,HoTenChuCuaHang,Email,SDT,TenTrungTam,DiaChiTruSo
from CuaHang C,TrungTam T
where C.MaTrungTam=T.MaTrungTam
order by TenCuaHang
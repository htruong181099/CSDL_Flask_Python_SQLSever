USE Ass2

INSERT INTO TrungTam
VALUES
	('TT001',N'huyện Đống Đa, TP Hà Nội',N'Trung Tâm cơ sở Hà Nội'),
	('TT002',N'252A1 Cô Bắc, P. Cô Giang, Quận 1, TP. HCM',N'Trung Tâm cơ sở Hồ Chí Minh')

INSERT INTO BoPhan
VALUES 
	('BP001',N'Bộ phận Chăm sóc khách hàng','TT001'),
	('BP002',N'Bộ phận Vận chuyển','TT002'),
	('BP003',N'Bộ phận Kế toán','TT001')

INSERT INTO DiaChiBoPhan
VALUES
	('BP001',N'Số 22, huyện Ba Vì, TP Hà Nội'),
	('BP001',N'Số 431, huyện Đống Đa, TP Hà Nội'),
	('BP002',N'55 Đặng Văn Ngữ, P. 14, Quận Phú Nhuận, TP. HCM'),
	('BP003',N'Số 78, huyện Ba Vì')

INSERT INTO NhanVien
VALUES
	('1234567890','01-02-1989',N'91 Nguyễn Thái Học, P. Cầu Ông Lãnh, Quận 1, TP. HCM',N'Nguyễn Văn Tiến',N'Nam',N'TP HCM','BP002'),
	('1478523698','12-12-1989',N'509 Nguyễn Văn Quá, P. Đông Hưng Thuận, Quận 12, TP. HCM',N'Nguyễn Thị Hương',N'Nữ',N'TP HCM','BP001'),
	('1593578524','05-10-1999',N'212A/A37 Nguyễn Trãi, P. Nguyễn Cư Trinh, Quận 1, TP. HCM',N'Nguyễn Thị Giang','Nam',N'TP HCM','BP003'),
	('1593578524','05-10-1999',N'814A Nguyễn Văn Quá, P. Đông Hưng Thuận, Quận 12, TP. HCM',N'Nguyễn Cầu Tiến','Nam',N'TP HCM','BP002'),
	('1478632598','10-10-1990',N'106A Nơ Trang Long, P. 14, Quận Bình Thạnh, TP. HCM',N'Nguyễn Sơn Tùng','Nam',N'Hà Nội','BP001'),
	('3468957564','10-06-1997',N'543/36 Nguyễn Đình Chiểu, P. 2, Quận 3, TP. HCM',N'Nguyễn Tùng Sơn',N'Nữ',N'Hải Phòng','BP001'),
	('1459876532','10-12-1997',N'299 Võ Văn Tần, Quận 3, TP. HCM',N'Nguyễn Thủy Tiên',N'Nữ',N'Hà Giang','BP002'),
	('3254789654','10-12-1988',N'446 Trường Sa, P. 2, Quận Phú Nhuận, TP. HCM',N'Nguyễn Đức Chinh',N'Nam',N'Hà Giang','BP003'),
	('2457896541','01-01-1988',N'16 Bùi Viện, P. Phạm Ngũ Lão, Quận 1, TP. HCM',N'Nguyễn Đức',N'Nam',N'Tây Nguyên','BP003')

INSERT INTO KhachHang
VALUES
	(N'Nguyễn Cầu Sinh','nguyencausinh','nguyencausinh@gmail.com','0123458745','12345678925',N'Ngân Hàng Đông Á',N'Nguyễn Cầu Sinh','DAB'),
	(N'Nguyễn Cầu Sống','nguyencausong','nguyencausong@gmail.com','0236547841','54123678925',N'Ngân Hàng Đông Phương',N'Nguyễn Cầu Sống','DPB'),
	(N'Nguyễn Cầu Ổn','nguyencauon','nguyencauon@gmail.com','0236517894','56321478541',N'Ngân Hàng ACB',N'Nguyễn Cầu Ổn','ACB')

INSERT INTO SoDiaChiKhachHang
VALUES
	(N'98 Lê Lai',N'P. Bến Thành',N'Quận 1',N'TP HCM',1),
	(N'92 Nam Kỳ Khởi Nghĩa',N'P. Bến Nghé',N'Quận 1',N'TP HCM',1),
	(N'40 Đồng Nai',N'P. 15',N'Quận 10',N'TP HCM',2),
	(N'145 Chấn Hưng',N'P. 6',N'Quận Tân Bình',N'TP HCM',3)

INSERT INTO CuaHang
VALUES
	(N'Nguyễn Bán Đồ','nguyenbando',N'Cửa Hàng Bán Đồ','12469857892',N'Ngân Hàng Đông Á',N'Nguyễn Bán Đồ','DAB','nguyenbando@gmail.com','0123658947','TT001'),
	(N'Nguyễn Buôn Đồ','nguyenbuondo',N'Cửa Hàng Buôn Đồ','25436587412',N'Ngân Hàng Đông Á',N'Nguyễn Buôn Đồ','DAB','nguyenbuondo@gmail.com','0254965321','TT001')

INSERT INTO SoDiaChiCuaHang
VALUES
	(N'336 Tôn Đản',N'P. 4',N'Quận 4',N'TP HCM',1),
	(N'447 Huỳnh Văn Bánh',N'P. 13',N'Quận Phú Nhuận',N'TP HCM',1),
	(N'119 Tôn Thất Đạm',N'P. Bến Nghé',N'Quận 1',N'TP HCM',1),
	(N'40/24 Bùi Viện',N'P. Phạm Ngũ Lão',N'Quận 1',N'TP HCM',1),
	(N'Hẻm 391 TK40/24 Trần Hưng Đạo',N'P. Cầu Kho',N'Quận 1',N'TP HCM',2),
	(N'Tầng 2, Vincom Landmark 81',N'772 Điện Biên Phủ',N'Quận Bình Thạnh',N'TP HCM',2),
	(N'225/9 Nguyễn Đình Chiểu',N'P. 5',N'Quận 3',N'TP HCM',2)

INSERT INTO MaGiamGia
VALUES
	('GG001',NULL,NULL,'01-02-2019','01-12-2019',700000,NULL,NULL),
	('GG002',NULL,100000,'10-12-2019','10-22-2019',NULL,20,NULL),
	('GG003',10000,100000,'01-01-2019','01-10-2019',NULL,30,N'Nguyễn Giảm Giá')

INSERT INTO SanPham
VALUES
	(N'Nước tăng lực Sting dâu',NULL,NULL,10000),
	(N'Nước uống tinh khiết Aquafina',NULL,NULL,10000),
	(N'Nước khoáng Lavie',NULL,NULL,10000),
	(N'Áo thun',NULL,NULL,30000),
	(N'Áo khoác',NULL,N'Lớp trong có lông vũ, ấm',100000),
	(N'Áo thể thao',N'Có hỗ trợ in logo',N'Áo thoáng mát',50000),
	(N'Bút bi',NULL,NULL,3000),
	(N'Tập trắng 200 trang',NULL,NULL,20000),
	(N'Cộc giấy A4',NULL,N'Chứa 200 tờ giấy A4',50000),
	(N'Máy in Brother',NULL,NULL,10000000)

INSERT INTO ThuocTinhSanPham
VALUES
	(6,N'Nam',20,N'Đen'),
	(6,N'Nam',20,N'Trắng'),
	(6,N'Nam',23,N'Đen'),
	(6,N'Nam',23,N'Trắng'),
	(6,N'Nữ',20,N'Đen'),
	(6,N'Nữ',20,N'Trắng'),
	(7,N'Nam',20,N'Lam'),
	(7,N'Nam',20,N'Lục'),
	(7,N'Nam',23,N'Lam'),
	(7,N'Nam',23,N'Lục'),
	(7,N'Nữ',20,N'Lam'),
	(7,N'Nữ',20,N'Lục'),
	(8,N'Nam',25,N'Đỏ'),
	(8,N'Nam',25,N'Vàng'),
	(8,N'Nam',27,N'Đỏ'),
	(8,N'Nam',27,N'Vàng'),
	(8,N'Nữ',24,N'Đỏ'),
	(8,N'Nữ',24,N'Vàng')

INSERT INTO KinhDoanh_SanPham_CuaHang
VALUES
	(1,1,6),
	(2,1,5),
	(3,1,7),
	(4,1,12),
	(5,1,7),
	(5,2,8),
	(6,2,8),
	(7,2,9),
	(8,2,6),
	(9,2,13),
	(10,2,7)

INSERT INTO DanhMucSanPham
VALUES
	(N'Nước uống'),
	(N'Thời trang'),
	(N'Văn phòng phẩm'),
	(N'Điện tử')

INSERT INTO DanhMucCon
VALUES
	(1,N'Nước ngọt',NULL),
	(1,N'Nước lọc',NULL),
	(2,N'Ngày thường',NULL),
	(2,N'Thể thao',NULL),
	(3,N'Bút',NULL),
	(3,N'Giấy',NULL),
	(4,N'Máy in',NULL)

INSERT INTO Thuoc_DanhMuc_SanPham
VALUES
	(1,1),
	(1,2),
	(1,3),
	(2,4),
	(2,5),
	(2,6),
	(3,7),
	(3,8),
	(3,9),
	(4,10)

INSERT INTO ApDung_MaGiamGia_SanPham
VALUES
	('GG001',10)

INSERT INTO ApDung_MaGiamGia_CuaHang
VALUES
	('GG002',1)

INSERT INTO ApDung_MaGiamGia_DanhMucSanPham
VALUES
	('GG003',2)

INSERT INTO UaThich_KhachHang_SanPham
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(4,2),
	(5,2),
	(6,2),
	(10,3)

INSERT INTO DanhGia_KhachHang_SanPham
VALUES
	(10,3,NULL,N'Máy rẻ nhưng xài tốt, bền',5),
	(4,2,NULL,N'Áo mát',4),
	(3,2,NULL,N'Nước lạt nhách', 0),
	(3,1,NULL,N'Nước ngon',5),
	(10,1,NULL,N'Quên mua giấy, không xài được',1)

INSERT INTO DonHang
VALUES
	(N'42 Hưng Gia 4, P. Tân Phong, Quận 7, TP. HCM',N'Tiền mặt',NULL,10000,NULL),
	(N'33 Đặng Thị Nhu, Quận 1, TP. HCM',N'Quẹt thẻ',NULL,10000000,100000)

INSERT INTO Dat_DonHang_KhachHang
VALUES
	(1,1,'01-01-2019 12:23:00','Recieved'),
	(2,2,'01-10-2019 22:33:11','Recieved')

INSERT INTO Chua_DonHang_SanPham
VALUES
	(1,1,10000,1),
	(2,10,10000000,1)

INSERT INTO KhieuNai_KhachHang_SanPham
VALUES
	(2,2,N'Không chạy được',N'Cắm điện nhưng máy không chạy được')

INSERT INTO DoiTacGiaoHang
VALUES
	(N'165 Nguyễn Thái Học, P. Phạm Ngũ Lão, Quận 1, TP. HCM',N'Công ty TNHH Giao Nhanh','giaonhanh@gmail.com','1548965842','OCB'),
	(N'260A Pasteur, Quận 3, TP. HCM',N'Công ty TNHH Giao Chậm','giaocham@gmail.com','78541236594','OCB')

INSERT INTO PhieuGiaoHang
VALUES
	('12-25-2019 12:55:48',N'Xe máy','38A-6888',N'Nguyễn Văn Tới',253),
	('12-20-2019 21:30:48',N'Xe tải','29-E1 118.52',N'Nguyễn Văn Cam',254)

INSERT INTO Ship_DonHang_DoiTacGH_PhieuGH
VALUES
	(1,2,1),
	(2,1,2)

INSERT INTO HoiDap
VALUES
	(N'Khi nào có mã giảm giá nữa?',N'Giáng sinh này nhé bạn',1,NULL,1,NULL),
	(N'Mặt hàng này còn bán không shop?',N'Còn nhé bạn',1,NULL,1,1),
	(N'Muốn làm việc vào công ty thì nộp hồ sơ ở đâu?',N'Bạn vui lòng đến 1 trong 2 trụ sở của công ty để biết thêm chi tiết nhé',1,1,NULL,NULL)
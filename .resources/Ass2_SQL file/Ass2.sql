CREATE DATABASE Ass2
GO
USE Ass2

CREATE TABLE TrungTam(
	MaTrungTam CHAR(10) NOT NULL PRIMARY KEY,
	DiaChiTruSo NVARCHAR(100) NOT NULL,
	TenTrungTam NVARCHAR(50) NOT NULL
)

CREATE TABLE BoPhan(
	MaBoPhan CHAR(10) NOT NULL PRIMARY KEY,
	TenBoPhan NVARCHAR(50) NOT NULL,
	MaTrungTam CHAR(10) NOT NULL FOREIGN KEY REFERENCES TrungTam(MaTrungTam)
)

CREATE TABLE DiaChiBoPhan(
	MaBoPhan CHAR(10) NOT NULL FOREIGN KEY REFERENCES BoPhan(MaBoPhan),
	DiaChi NVARCHAR(100) NOT NULL,
	CONSTRAINT PK_DiaChiBoPhan PRIMARY KEY (MaBoPhan, DiaChi)
)

CREATE TABLE NhanVien(
	MaNhanVien INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	SoCMND CHAR(10) NOT NULL,
	NgaySinh DATE NOT NULL,
	DiaChi NVARCHAR(100) NOT NULL,
	HoTen NVARCHAR(100) NOT NULL,
	GioiTinh NVARCHAR(5) NOT NULL,
	NoiSinh NVARCHAR(50) NOT NULL,
	MaBoPhan CHAR(10) NOT NULL FOREIGN KEY REFERENCES BoPhan(MaBoPhan)
)

CREATE TABLE KhachHang(
	MaKhachHang INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	HoTen NVARCHAR(100) NOT NULL,
	MatKhau NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL UNIQUE,
	SDT NVARCHAR(10) NULL,
	SoTaiKhoan NVARCHAR(20) NULL,
	TenNganHang NVARCHAR(50) NULL,
	TenNguoiThuHuong NVARCHAR(50) NULL,
	MaNganHang NVARCHAR(10) NULL
)

CREATE TABLE SoDiaChiKhachHang(
	ID INT NOT NULL IDENTITY(1,1),
	DiaChiNha NVARCHAR(100) NOT NULL,
	Phuong NVARCHAR(50) NOT NULL,
	Quan NVARCHAR(50) NOT NULL,
	TinhThanhPho NVARCHAR(10) NOT NULL,
	MaKhachHang INT NOT NULL FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
	CONSTRAINT PK_SoDiaChiKhachHang PRIMARY KEY (ID, MaKhachHang)
)

CREATE TABLE CuaHang(
	MaCuaHang INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	HoTenChuCuaHang NVARCHAR(100) NOT NULL,
	MatKhau NVARCHAR(50) NOT NULL,
	TenCuaHang NVARCHAR(50) NOT NULL,
	SoTaiKhoan NVARCHAR(20) NULL,
	TenNganHang NVARCHAR(50) NULL,
	TenNguoiThuHuong NVARCHAR(50) NULL,
	MaNganHang NVARCHAR(10) NULL,
	Email NVARCHAR(50) NOT NULL UNIQUE,
	SDT NVARCHAR(10) NULL,
	MaTrungTam CHAR(10) NOT NULL FOREIGN KEY REFERENCES TrungTam(MaTrungTam)
)

CREATE TABLE SoDiaChiCuaHang(
	ID INT NOT NULL IDENTITY(1,1),
	DiaChiNha NVARCHAR(100) NOT NULL,
	Phuong NVARCHAR(50) NOT NULL,
	Quan NVARCHAR(50) NOT NULL,
	TinhThanhPho NVARCHAR(10) NOT NULL,
	MaCuaHang INT NOT NULL FOREIGN KEY REFERENCES CuaHang(MaCuaHang),
	CONSTRAINT PK_SoDiaChiCuaHang PRIMARY KEY (ID, MaCuaHang)
)

CREATE TABLE MaGiamGia(
	MaGiamGia CHAR(10) NOT NULL PRIMARY KEY,
	GiaTienToiThieu INT NULL,
	GiaTienToiDa INT NULL,
	ThoiGianBatDau DATE NOT NULL,
	ThoiGianKetThuc DATE NOT NULL,
	SoTienGiam INT NULL,
	PhanTramGiamGia INT NULL,
	NguoiCungCapMaGiam NVARCHAR(100) NULL
)

CREATE TABLE SanPham(
	MaSanPham INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	TenSanPham NVARCHAR(100) NOT NULL,
	ThongTin NVARCHAR(1000) NULL,
	MoTa NVARCHAR(500) NULL,
	GiaBan INT NOT NULL,
	CONSTRAINT CHK_GiaBan CHECK (GiaBan > 0)
)

CREATE TABLE ThuocTinhSanPham(
	MaSanPham INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham),
	Mau NVARCHAR(20) NULL,
	Size INT NULL,
	MauSac NVARCHAR(20) NULL
)

CREATE TABLE KinhDoanh_SanPham_CuaHang(
	MaSanPham INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham),
	MaCuaHang INT NOT NULL FOREIGN KEY REFERENCES CuaHang(MaCuaHang),
	SoLuong INT NOT NULL,
	CONSTRAINT PK_KinhDoanh_SP_CH PRIMARY KEY (MaSanPham, MaCuaHang) 
)

CREATE TABLE DanhMucSanPham(
	MaDanhMuc INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	TenDanhMuc NVARCHAR(50) NOT NULL
)

CREATE TABLE DanhMucCon(
	MaDanhMucCon INT NOT NULL IDENTITY(1,1),
	MaDanhMuc INT NOT NULL FOREIGN KEY REFERENCES DanhMucSanPham(MaDanhMuc),
	TenDanhMucCon NVARCHAR(50) NOT NULL,
	MoTa NVARCHAR(500) NULL,
	CONSTRAINT PK_DanhMucCon PRIMARY KEY (MaDanhMuc, MaDanhMucCon)
)

CREATE TABLE Thuoc_DanhMuc_SanPham(
	MaDanhMuc INT NOT NULL FOREIGN KEY REFERENCES DanhMucSanPham(MaDanhMuc),
	MaSanPham INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham),
	CONSTRAINT PK_Thuoc_DM_SP PRIMARY KEY (MaDanhMuc, MaSanPham)
)

CREATE TABLE ApDung_MaGiamGia_SanPham(
	MaGiamGia CHAR(10) NOT NULL FOREIGN KEY REFERENCES MaGiamGia(MaGiamGia),
	MaSanPham INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham),
	CONSTRAINT PK_ApDung_MGG_SP PRIMARY KEY (MaGiamGia, MaSanPham)
)

CREATE TABLE ApDung_MaGiamGia_CuaHang(
	MaGiamGia CHAR(10) NOT NULL FOREIGN KEY REFERENCES MaGiamGia(MaGiamGia),
	MaCuaHang INT NOT NULL FOREIGN KEY REFERENCES CuaHang(MaCuaHang),
	CONSTRAINT PK_ApDung_MGG_CH PRIMARY KEY (MaGiamGia, MaCuaHang) 
)

CREATE TABLE ApDung_MaGiamGia_DanhMucSanPham(
	MaGiamGia CHAR(10) NOT NULL FOREIGN KEY REFERENCES MaGiamGia(MaGiamGia),
	MaDanhMuc INT NOT NULL FOREIGN KEY REFERENCES DanhMucSanPham(MaDanhMuc),
	CONSTRAINT PK_ApDung_MGG_DMSP PRIMARY KEY (MaGiamGia, MaDanhMuc) 
)

CREATE TABLE UaThich_KhachHang_SanPham(
	MaSanPham INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham),
	MaKhachHang INT NOT NULL FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
	CONSTRAINT PK_UaThich_KH_SP PRIMARY KEY (MaSanPham, MaKhachHang) 
)

CREATE TABLE DanhGia_KhachHang_SanPham(
	MaSanPham INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham),
	MaKhachHang INT NOT NULL FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
	HinhAnh NVARCHAR(200) NULL,
	MoTa NVARCHAR(500) NULL,
	Sao INT NOT NULL,
	CONSTRAINT CHK_Sao CHECK( Sao >=0 AND Sao <=5),
	CONSTRAINT PK_DanhGia_KH_SP PRIMARY KEY (MaSanPham, MaKhachHang) 
)

CREATE TABLE DonHang(
	MaDonHang INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	DiaChiGiaoHang NVARCHAR(100) NOT NULL,
	HinhThucThanhToan NVARCHAR(100) NOT NULL,
	GhiChu NVARCHAR(500) NULL,
	TongSoTienDonHang INT NOT NULL,
	PhiShip INT NULL
)

CREATE TABLE Dat_DonHang_KhachHang(
	MaDonHang INT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDonHang),
	MaKhachHang INT NOT NULL FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
	NgayTaoDonHang DATETIME NOT NULL,
	TrangThaiDonHang CHAR(20) NOT NULL,
	CONSTRAINT PK_Dat_DH_KH PRIMARY KEY (MaDonHang, MaKhachHang) 
)

CREATE TABLE Chua_DonHang_SanPham(
	MaDonHang INT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDonHang),
	MaSanPham INT NOT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham),
	GiaMua INT NOT NULL,
	SoLuong INT NOT NULL,
	CONSTRAINT PK_Chua_DH_SP PRIMARY KEY (MaDonHang, MaSanPham) 
)

CREATE TABLE KhieuNai_KhachHang_SanPham(
	MaDonHang INT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDonHang),
	MaKhachHang INT NOT NULL FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
	TieuDe NVARCHAR(100) NOT NULL,
	NoiDung NVARCHAR(1000) NOT NULL,
	CONSTRAINT PK_KhieuNai_KH_SP PRIMARY KEY (MaDonHang, MaKhachHang) 
)

CREATE TABLE DoiTacGiaoHang(
	MaSoKinhDoanh INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	DiaChiTruSo NVARCHAR(100) NOT NULL,
	TenDoiTac NVARCHAR(50) NOT NULL,
	Email NVARCHAR(50) NOT NULL,
	TaiKhoanNganHang NVARCHAR(20) NOT NULL,
	MaNganHang NVARCHAR(10) NOT NULL
)

CREATE TABLE PhieuGiaoHang(
	MaPhieuGiao INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ThoiGianLayHang DATETIME NOT NULL,
	PhuongTienLayHang NVARCHAR(50) NOT NULL,
	BienSoXe NVARCHAR(50) NOT NULL,
	TenNhanVienLayHang NVARCHAR(50) NOT NULL,
	MaNhanVienLayHang INT NOT NULL
)

CREATE TABLE Ship_DonHang_DoiTacGH_PhieuGH(
	MaDonHang INT NOT NULL FOREIGN KEY REFERENCES DonHang(MaDonHang),
	MaSoKinhDoanh INT NOT NULL FOREIGN KEY REFERENCES DoiTacGiaoHang(MaSoKinhDoanh),
	MaPhieuGiao INT NOT NULL FOREIGN KEY REFERENCES PhieuGiaoHang(MaPhieuGiao),
	CONSTRAINT PK_Ship_DH_DTGH_PGH PRIMARY KEY (MaDonHang, MaSoKinhDoanh) 
)

CREATE TABLE HoiDap(
	MaID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	NoiDungCauHoi NVARCHAR(500) NOT NULL,
	NoiDungTraLoi NVARCHAR(500) NOT NULL,
	MaKhachHang INT NOT NULL FOREIGN KEY REFERENCES KhachHang(MaKhachHang),
	MaNhanVien INT NULL FOREIGN KEY REFERENCES NhanVien(MaNhanVien),
	MaCuaHang INT NULL FOREIGN KEY REFERENCES CuaHang(MaCuaHang),
	MaSanPham INT NULL FOREIGN KEY REFERENCES SanPham(MaSanPham),
)

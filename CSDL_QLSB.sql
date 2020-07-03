create database QuanLySanBong
use QuanLySanBong

drop database QuanLySanBong

create table LoaiSan(
	MaLs int identity(1,1),
	TenLs nvarchar(50),
	primary key(MaLS)
)

create table BangGiaSan(
	GioBatDau time,
	GioKetThuc time,
	DonGia money,
	MaLs int ,
	primary key(MaLs),
	foreign key(MaLs) references LoaiSan (MaLs)
)
create table NhaCungCap(
	MaNcc int identity(1,1),
	TenNcc nvarchar(50),
	DiaChi nvarchar(50),
	SoDienThoai nvarchar(50),
	primary key(MaNcc)
)

create table NhanVien(
	MaNv nvarchar(50),
	TenNv nvarchar(50),
	NgayVaoLam date,
	SoDienThoai nvarchar(50),
	primary key(MaNv)
)

create table TaiKhoan(
	UserName nvarchar(50),
	Pass nvarchar(50),
	MaNv nvarchar(50),
	primary key(MaNv),
	foreign key(MaNv) references NhanVien(MaNv)
)

create table KhachHang(
	MaKh int identity(1,1),
	TenKh nvarchar(50),
	DiaChi nvarchar(50),
	SoDienThoai nvarchar(50),
	Email nvarchar(50),
	primary key(MaKh)
)

create table San(
	MaSan int identity(1,1),
	TenSan nvarchar(50),
	TrangThai nvarchar(50),
	MaNv nvarchar(50),
	MaLs int,
	primary key(MaSan),
	foreign key(MaNv) references NhanVien(MaNv),
	foreign key(MaLs) references LoaiSan(MaLs)
)

create table HoaDon(
	MaHd int identity(1,1),
	GioBatDau time,
	GioKetThuc time,
	ThoiGianSuDung time,
	NgayXuat date,
	ThanhTien money,
	MaNv nvarchar(50),
	MaKh int,
	MaSan int,
	primary key(MaHd),
	foreign key(MaNv) references NhanVien(MaNv),
	foreign key(MaKh) references KhachHang(MaKh),
	foreign key(MaSan) references San(MaSan),
)
create table HangHoa(
	MaHh int identity(1,1),
	TenHh nvarchar(50),
	DVT nvarchar(50),
	SoLuongTon int,
	DonGia money,
	primary key(MaHh)
) 

create table CTHoaDon(
	SoLuongBan int,
	MaHd int,
	MaHh int ,
	primary key(MaHh,MaHd),
	foreign key (MaHh) references HangHoa(MaHh),
	foreign key (MaHd) references HoaDon(MaHd)
)



create table PhieuNhap(
	MaPhieu int identity(1,1),
	NgayNhap date,
	MaNcc int,
	ThanhTien money,
	MaNv nvarchar(50),
	primary key(MaPhieu),
	foreign key(MaNv) references NhanVien(MaNv),
	foreign key(MaNcc) references NhaCungCap(MaNcc)
)
--drop table PhieuNhap

create table CTPhieuNhap(
	MaPhieu int,
	SoLuongNhap int,
	GiaNhap money,
	MaNv nvarchar(50),
	MaHh int ,
	primary key(MaPhieu,MaHh),
	foreign key (MaPhieu) references PhieuNhap(MaPhieu),
	foreign key (MaHh) references HangHoa(MaHh),
	foreign key (MaHh) references HangHoa(MaHh),
	foreign key (MaNv) references NhanVien(MaNv)
)
--drop table DatSan
create table DatSan(
	MaDatSan int identity(1,1),
	MaSan int,
	MaKh int,
	TuGio time,
	DenGio time,
	TuNgay date,
	DenNgay date
	primary key(MaDatSan)
	foreign key(MaSan) references San(MaSan),
	foreign key(MaKh) references KhachHang(MaKh)
)

create table DatSanCD(
	MaDatSan int,
	ThuHai bit,
	ThuBa bit,
	ThuTu bit,
	ThuNam bit,
	ThuSau bit, 
	ThuBay bit, 
	ChuNhat bit,
	primary key(MaDatSan),
	foreign key(MaDatSan) references DatSan(MaDatSan)
)
--drop table DatSanCD
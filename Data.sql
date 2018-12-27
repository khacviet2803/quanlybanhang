CREATE DATABASE QuanLyQuanBanhNgot
GO

USE QuanLyQuanBanhNgot
GO

-- Food
-- Table
-- FoodCategory
-- Account
-- Bill
-- BillInfo

CREATE TABLE Ban
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Bàn chưa có tên',
	status NVARCHAR(100) NOT NULL DEFAULT N'Trống'	-- Trống || Có người
)
GO

CREATE TABLE TaiKhoan
(
	UserName NVARCHAR(100) PRIMARY KEY,	
	DisplayName NVARCHAR(100) NOT NULL DEFAULT N'Kter',
	PassWord NVARCHAR(1000) NOT NULL DEFAULT 0,
	Type INT NOT NULL  DEFAULT 0 -- 1: admin && 0: staff
)
GO

CREATE TABLE LoaiDoAn
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên'
)
GO

CREATE TABLE DoAn
(
	id INT IDENTITY PRIMARY KEY,
	name NVARCHAR(100) NOT NULL DEFAULT N'Chưa đặt tên',
	idLoaiDoAn INT NOT NULL,
	price FLOAT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idLoaiDoAn) REFERENCES dbo.LoaiDoAn(id)
)
GO

CREATE TABLE HoaDon
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL DEFAULT GETDATE(),
	DateCheckOut DATE,
	idBan INT NOT NULL,
	status INT NOT NULL DEFAULT 0 -- 1: đã thanh toán && 0: chưa thanh toán
	
	FOREIGN KEY (idBan) REFERENCES dbo.Ban(id)
)
GO

CREATE TABLE ChiTietHoaDon
(
	id INT IDENTITY PRIMARY KEY,
	idHoaDon INT NOT NULL,
	idDoAn INT NOT NULL,
	count INT NOT NULL DEFAULT 0
	
	FOREIGN KEY (idHoaDon) REFERENCES dbo.HoaDon(id),
	FOREIGN KEY (idDoAn) REFERENCES dbo.DoAn(id)
)
GO
CREATE DATABASE BTL2BK
USE BTL2BK
CREATE TABLE KHACHHANG
(
    CCCD VARCHAR(100) PRIMARY KEY,
    HOTEN VARCHAR(100) NOT NULL ,
    GIOITINH VARCHAR(100) NOT NULL,
    NGAYSINH DATE NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    DIEMTICHLUY INT NOT NULL,
    SONHA VARCHAR(100) NOT NULL ,
    DUONG VARCHAR(100) NOT NULL,
    XAPHUONG VARCHAR(100) NOT NULL,
    QUANHUYEN VARCHAR(100) NOT NULL,
    TINHTHANHPHO VARCHAR(100) NOT NULL
)

CREATE TABLE TAIKHOAN
(
    MATAIKHOAN VARCHAR(100) PRIMARY KEY,
    TENDANGNHAP VARCHAR(100) NOT NULL,
    MATKHAU VARCHAR(100) NOT NULL,
    CCCD VARCHAR(100) NOT NULL,
    CONSTRAINT FK_TAIKHOAN FOREIGN KEY(CCCD) REFERENCES KHACHHANG(CCCD)
)

CREATE TABLE DONHANG
(
    MADONHANG VARCHAR(100) PRIMARY KEY,
    NGAYDATHANG DATE,
    NGAYGIAOHANG DATE,
    TRANGTHAI VARCHAR(100),
    DIACHIGIAOHANG VARCHAR(100)
)

CREATE TABLE VOUCHER
(
    MAVOUCHER VARCHAR(100) PRIMARY KEY ,
    TANGMON VARCHAR(100),
    QUATANG VARCHAR(100),
    GIAMGIATHEOTIEN BIGINT,
    GIAMGIATHEOPHANTRAM INT,
    NGAYBATDAU DATE NOT NULL,
    NGAYHETHAN DATE NOT NULL
)

CREATE TABLE HOADON
(
    MAHOADON VARCHAR(100) PRIMARY KEY,
    NGAYTAOHDON DATE,
    TONGTIEN BIGINT NOT NULL,
    PTTHANHTOAN VARCHAR(100),
    MADONHANG VARCHAR(100),
    CONSTRAINT FK_HOADON2 FOREIGN KEY(MADONHANG) REFERENCES DONHANG(MADONHANG)
)

CREATE TABLE FOODANDDRINK
(
    TEN VARCHAR(100),
    VERSION INT,
    GIA BIGINT NOT NULL,
    NGUYENLIEU VARCHAR(100) NOT NULL,
    MOTA VARCHAR(100),
    NGAYTHEM DATE,
    TINHTRANG VARCHAR(100),
    CONSTRAINT PK_FOODANDDRINK PRIMARY KEY (TEN,VERSION)
)

CREATE TABLE NHANVIEN
(
    MANHANVIEN VARCHAR(100) PRIMARY KEY,
    HOTEN VARCHAR(100) NOT NULL,
    GIOITINH VARCHAR(100) NOT NULL,
    NGAYSINH DATE NOT NULL,
    DIACHI VARCHAR(1000) NOT NULL,
    NGAYBATDAULAM DATE NOT NULL,
    TKNGANHANG VARCHAR(100) NOT NULL,
    BANGCAP VARCHAR(100),
    LUONGTHEOTHANG BIGINT,
    LUONGTHEOGIO BIGINT ,
    MANVQUANLY VARCHAR(100),
    CONSTRAINT FK_NHANVIEN FOREIGN KEY (MANVQUANLY) REFERENCES NHANVIEN(MANHANVIEN)
)

CREATE TABLE PHONG
(
    SOPHONG VARCHAR(100) PRIMARY KEY,
    SUCCHUA INT NOT NULL,
    LOAI VARCHAR(100) NOT NULL
)

CREATE TABLE BAN
(
    SOPHONG VARCHAR(100),
    SOBAN VARCHAR(100),
    TINHTRANG VARCHAR(100) NOT NULL,
    SUCCHUA INT NOT NULL,
    CONSTRAINT PK_BAN PRIMARY KEY(SOBAN,SOPHONG),
    CONSTRAINT FK_BAN FOREIGN KEY(SOPHONG) REFERENCES PHONG(SOPHONG)
)

CREATE TABLE DONVIVANCHUYEN
(
    MADONVI VARCHAR(100) PRIMARY KEY,
    TENDONVI VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    SONHA INT NOT NULL,
    DUONG VARCHAR(100) NOT NULL,
    XAPHUONG VARCHAR(100) NOT NULL,
    QUANHUYEN VARCHAR(100) NOT NULL,
    TINHTHANHPHO VARCHAR(100) NOT NULL,
)

CREATE TABLE SDTKHACHHANG
(
    CCCDKH VARCHAR(100),
    SDT VARCHAR(100) NOT NULL,
    CONSTRAINT PK_SDTKH PRIMARY KEY(CCCDKH,SDT),
    CONSTRAINT FK_SDTKHACHHANG FOREIGN KEY(CCCDKH) REFERENCES KHACHHANG(CCCD)
)

CREATE TABLE SDTDONVIVANCHUYEN
(
    MADONVI VARCHAR(100),
    SDT VARCHAR(100),
    CONSTRAINT PK PRIMARY KEY (MADONVI,SDT),
    CONSTRAINT FK FOREIGN KEY (MADONVI) REFERENCES DONVIVANCHUYEN(MADONVI)
)

CREATE TABLE PHUCVU
(
    MANHANVIEN VARCHAR(100) PRIMARY KEY,
    CONSTRAINT FK_PHUCVU FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN)
)

CREATE TABLE DAUBEP
(
    MANHANVIEN VARCHAR(100) PRIMARY KEY,
    CONSTRAINT FK_DAUBEP FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN)
)

CREATE TABLE THUNGAN
(
    MANHANVIEN VARCHAR(100) PRIMARY KEY,
    CONSTRAINT FK_THNGAN FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN)
)

CREATE TABLE THONGTINLIENHE
(
    MANHANVIEN VARCHAR(100),
    EMAIL VARCHAR(100),
    SDT VARCHAR(100),
    CONSTRAINT PK_TTLH PRIMARY KEY(MANHANVIEN,EMAIL,SDT),
    CONSTRAINT FK_TTLIENHE FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN)
)

CREATE TABLE MON_AN
(
    TEN VARCHAR(100),
    VERSION INT,
    CACHCHEBIEN VARCHAR(1000) NOT NULL,
    CANHBAODIUNG VARCHAR(100),
    CONSTRAINT PK_MONAN PRIMARY KEY(TEN,VERSION),
    CONSTRAINT FK_MONAN2 FOREIGN KEY (TEN,VERSION) REFERENCES FOODANDDRINK(TEN,VERSION)
)

CREATE TABLE DO_UONG
(
    TEN VARCHAR(100) ,
    VERSION INT ,
    XUATXU VARCHAR (100) NOT NULL,
    CONSTRAINT PK_DOUONG PRIMARY KEY(TEN,VERSION),
    CONSTRAINT FK_DOUONG2 FOREIGN KEY (TEN,VERSION) REFERENCES FOODANDDRINK(TEN,VERSION)
)

CREATE TABLE DONHANG_KHACHHANG
(
    MADONHANG VARCHAR(100) PRIMARY KEY,
    CCCD VARCHAR(100),
    CONSTRAINT FK_DHKH1 FOREIGN KEY(MADONHANG) REFERENCES DONHANG(MADONHANG),
    CONSTRAINT FK_DHKH2 FOREIGN KEY(CCCD) REFERENCES KHACHHANG(CCCD)
)

CREATE TABLE DONHANG_PHUCVU
(
    MADONHANG VARCHAR(100) PRIMARY KEY,
    MANHANVIEN VARCHAR(100),
    CONSTRAINT FK_DHPV1 FOREIGN KEY(MADONHANG) REFERENCES DONHANG(MADONHANG),
    CONSTRAINT FK_DHPV2 FOREIGN KEY(MANHANVIEN) REFERENCES PHUCVU(MANHANVIEN)
)

CREATE TABLE DONHANG_BAN
(
    MADONHANG VARCHAR(100),
    SOPHONG VARCHAR(100),
    SOBAN VARCHAR(100),
    CONSTRAINT PK_DH PRIMARY KEY(MADONHANG,SOBAN,SOPHONG),
    CONSTRAINT FK_DH1 FOREIGN KEY(MADONHANG) REFERENCES DONHANG(MADONHANG),
    CONSTRAINT FK_DH2 FOREIGN KEY(SOBAN,SOPHONG) REFERENCES BAN(SOBAN,SOPHONG)
)

CREATE TABLE DONHANG_VANCHUYEN
(
    MDH VARCHAR(100),
    MADVVANCHUYEN VARCHAR(100) NOT NULL,
    TENSHIPPER VARCHAR(100) NOT NULL,
    SDT VARCHAR(100) NOT NULL,
    MAVANDON VARCHAR(100) NOT NULL,
    CONSTRAINT PK_VANCHUYEN PRIMARY KEY(MDH),
    CONSTRAINT FK_VANCHUYEN_MDH FOREIGN KEY(MDH) REFERENCES DONHANG(MADONHANG),
    CONSTRAINT FK_DVVANCHUYEN FOREIGN KEY(MADVVANCHUYEN) REFERENCES DONVIVANCHUYEN(MADONVI)
)

CREATE TABLE DONHANG_FD
(
    MDH VARCHAR(100) ,
    TEN VARCHAR(100) ,
    VERSION INT ,
    GIA BIGINT NOT NULL,
    SOLUONG INT NOT NULL,
    CONSTRAINT PK_FD_DH PRIMARY KEY (TEN,VERSION,MDH),
    CONSTRAINT FK_FD_DH_TENMON FOREIGN KEY(TEN,VERSION) REFERENCES FOODANDDRINK(TEN,VERSION),
    CONSTRAINT FK_FD_DH_MDH FOREIGN KEY(MDH) REFERENCES DONHANG(MADONHANG)
)

CREATE TABLE HOADON_VOUCHER
(
    MAHOADON VARCHAR(100) PRIMARY KEY,
    MAVOUCHER VARCHAR(100),
    CONSTRAINT FK_HDVCH1 FOREIGN KEY(MAHOADON) REFERENCES HOADON(MAHOADON),
    CONSTRAINT FK_HDVCH2 FOREIGN KEY(MAVOUCHER) REFERENCES VOUCHER(MAVOUCHER)
)

CREATE TABLE HOADON_THUNGAN
(
    MAHOADON VARCHAR(100) PRIMARY KEY,
    MANHANVIEN VARCHAR(100) NOT NULL,
    CONSTRAINT FK_HDTN1 FOREIGN KEY(MAHOADON) REFERENCES HOADON(MAHOADON),
    CONSTRAINT FK_HDTN2 FOREIGN KEY(MANHANVIEN) REFERENCES THUNGAN(MANHANVIEN)
)

CREATE TABLE PHUCVU_PHONG
(
    SOPHONG VARCHAR(100),
    MANVPHUCVU VARCHAR(100),
    NGAYPHUCVU DATE,
    CONSTRAINT PK_PHUCVU_PHONG PRIMARY KEY(MANVPHUCVU,SOPHONG,NGAYPHUCVU),
    CONSTRAINT FK_MANVPHUCVU FOREIGN KEY(MANVPHUCVU) REFERENCES PHUCVU(MANHANVIEN),
    CONSTRAINT FK_SOPHONG FOREIGN KEY(SOPHONG) REFERENCES PHONG(SOPHONG)
)


CREATE TABLE CHEBIEN_MON_AN
(
    TEN VARCHAR(100),
    VERSION INT,
    MANVDAUBEP VARCHAR(100) ,
    TENDAUBEP VARCHAR(100) NOT NULL,
    CONSTRAINT PK_CHEBIEN PRIMARY KEY (TEN,VERSION,MANVDAUBEP),
    CONSTRAINT FK_TENMON FOREIGN KEY (TEN,VERSION) REFERENCES MON_AN(TEN,VERSION),
    CONSTRAINT FK_MANVDAUBEP FOREIGN KEY (MANVDAUBEP) REFERENCES DAUBEP(MANHANVIEN)
)

CREATE TABLE FD_VOUCHER_APDUNG
(
    TEN VARCHAR(100),
    VERSION INT,
    MAVOUCHER VARCHAR(100),
    SOLUONG INT NOT NULL,
    CONSTRAINT PK_FD_VOUVHER_APDUNG PRIMARY KEY (TEN,VERSION,MAVOUCHER),
    CONSTRAINT FK_FD_VOUCHER_APDUNG_TENMON FOREIGN KEY (TEN,VERSION) REFERENCES FOODANDDRINK(TEN,VERSION),
    CONSTRAINT FK_FD_VOUCHER_APDUNG_MAVOUCHER FOREIGN KEY (MAVOUCHER) REFERENCES VOUCHER(MAVOUCHER)
)

ALTER TABLE NHANVIEN ADD CONSTRAINT KT_LUONG CHECK (LUONGTHEOGIO>0 AND LUONGTHEOTHANG>LUONGTHEOGIO)

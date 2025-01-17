USE [NmhK22CNT1Lesson10]
GO
/****** Object:  Table [dbo].[KetQua]    Script Date: 24/06/2024 10:24:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQua](
	[MaSV] [int] NOT NULL,
	[MaMH] [int] NOT NULL,
	[Diem] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 24/06/2024 10:24:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[MaKH] [nvarchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 24/06/2024 10:24:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [int] NOT NULL,
	[TenMH] [nvarchar](50) NOT NULL,
	[SoTiet] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 24/06/2024 10:24:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [int] NOT NULL,
	[HoSV] [nvarchar](50) NOT NULL,
	[TenSV] [nvarchar](50) NOT NULL,
	[Phai] [char](1) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[NoiSinh] [nvarchar](50) NOT NULL,
	[MaKH] [nvarchar](10) NULL,
	[HocBong] [float] NULL,
	[DiemTrungBinh] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KetQua] ([MaSV], [MaMH], [Diem]) VALUES (1, 1, 8)
INSERT [dbo].[KetQua] ([MaSV], [MaMH], [Diem]) VALUES (1, 2, 7.5)
INSERT [dbo].[KetQua] ([MaSV], [MaMH], [Diem]) VALUES (2, 1, 9)
INSERT [dbo].[KetQua] ([MaSV], [MaMH], [Diem]) VALUES (2, 3, 9.5)
INSERT [dbo].[KetQua] ([MaSV], [MaMH], [Diem]) VALUES (3, 2, 6)
INSERT [dbo].[KetQua] ([MaSV], [MaMH], [Diem]) VALUES (3, 3, 7)
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'CNTT', N'Công ngh? thông tin')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'KTT', N'Kinh t?')
INSERT [dbo].[Khoa] ([MaKH], [TenKH]) VALUES (N'QTKD', N'Qu?n tr? kinh doanh')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet]) VALUES (1, N'Toán', 45)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet]) VALUES (2, N'Lý', 30)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTiet]) VALUES (3, N'Hóa', 30)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (1, N'Nguy?n', N'An', N'M', CAST(N'2000-01-15' AS Date), N'Hà N?i', N'CNTT', 1000, 8.5)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (2, N'Lê', N'Bình', N'F', CAST(N'2000-05-20' AS Date), N'H?i Phòng', N'KTT', 1500, 9)
INSERT [dbo].[SinhVien] ([MaSV], [HoSV], [TenSV], [Phai], [NgaySinh], [NoiSinh], [MaKH], [HocBong], [DiemTrungBinh]) VALUES (3, N'Tr?n', N'Cu?ng', N'M', CAST(N'1999-09-10' AS Date), N'Ðà N?ng', N'QTKD', 0, 7)
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[KetQua]  WITH CHECK ADD FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[Khoa] ([MaKH])
GO

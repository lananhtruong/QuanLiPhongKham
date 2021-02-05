USE [QLPKDK]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/15/2020 7:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/15/2020 7:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/15/2020 7:55:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/15/2020 7:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/15/2020 7:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/15/2020 7:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/15/2020 7:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[UserId] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/15/2020 7:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[UserId] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 12/15/2020 7:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code_medicine] [nvarchar](50) NULL,
	[Name] [nvarchar](max) NULL,
	[Unit_measurement] [nvarchar](50) NULL,
	[Origin] [nvarchar](50) NULL,
	[Unit_price] [nvarchar](50) NULL,
	[Quanlity] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Thuoc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription]    Script Date: 12/15/2020 7:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Customer_id] [int] NULL,
	[Doctor_id] [int] NULL,
	[Mediator_id] [int] NULL,
	[Status] [tinyint] NULL,
	[Note] [nvarchar](200) NULL,
 CONSTRAINT [PK_Don_Thuoc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prescription_Detail]    Script Date: 12/15/2020 7:55:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prescription_Detail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Prescription_id] [int] NULL,
	[Medicine_id] [int] NULL,
	[Quanlity] [int] NULL,
	[Morning] [int] NULL,
	[Noon] [int] NULL,
	[Afternoon] [int] NULL,
	[Night] [int] NULL,
	[Note] [nvarchar](100) NULL,
 CONSTRAINT [PK_Don_Thuoc_Chi_Tiet] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202012131712057_InitialCreate', N'QLPKDK.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C6D6FE33612FE7E40FF83A04FD7436AE5E576B117D82D5227B90B366FB7CE16F76D414BB423AC44A912952638F497F5437F52FF42877AB3F82651B6623BC5020B8B1C3E331C0EC9E170983F7EFB7DFCC37318584F3849FD884CECA3D1A16D61E2469E4F96133BA38BEF3ED83F7CFFCDDFC6175EF86CFD54D19D303A6849D289FD48697CEA38A9FB8843948E42DF4DA2345AD0911B850EF222E7F8F0F05FCED1918301C2062CCB1A7FCA08F5439C7FC0E734222E8E6986829BC8C3415A9643CD2C47B56E5188D318B97862FFF7FAFEE3F9C75141685B67818F4088190E16B685088928A220E2E9E714CF681291E52C8602143CBCC418E81628487129FAE98ADCB41787C7AC17CEAA6105E566298DC29E804727A55A1CB1F95ACAB56BB581E22E40C1F485F53A57DEC4BEF2705EF4290A400122C3D3699030E2897D53B3384BE35B4C4755C35101799900DC2F51F275D4443CB08CDB1DD466743C3A64FF0EAC6916D02CC11382339AA0E0C0BACFE681EF7EC42F0FD1574C262747F3C5C98777EF9177F2FE9FF8E45DB3A7D057A0E30AA0E83E89629C806C7851F7DFB61CBE9D2336AC9B35DA145A015B8219615B37E8F91A93257D84B972FCC1B62EFD67EC5525A5717D263E4C206844930C3E6FB32040F300D7F54E2B4FF67F0BD7E377EF07E17A8B9EFC653EF4027F983809CCAB4F38C86BD3473F2EA61737DE5F4AB2CB240AD9376F5F45ED975994252EEB4CA4257940C912535EBAB1B3325E23936650C39B7585BAFFA6CD2495CD5B49CA3AB4CE4CA8586C7B3654F2BE2E5F638B3B8B6318BCDCB49846DA0C8EDBA74642C303ABA85E19CC91A9C110E8C85F79FDBB08911F0CB0001A7001B763E12721AE7BF96304E686486F99EF519AC2FCF7FE83D2C716D1E1E700A2CFB09B256096338AC2F8D5B9DD3F4604DF66E19C59FBF6780D36340FBF4497C8A551724158AB8DF1AE23F76B94D10BE29D238A3F53B702649F0F7E680E30883867AE8BD3F4128C197BD308BCEA0AF08AD093E3DE706C6DDAB503320D901FAA3D106115FD5291AEBC103585E48968C854DE489BA8D7D1D22766A256A47A510B8A4E514BB2BEA2323033494B4ABDA03941A79C05D560FE5D3E42C33B7839ECFE7B789B6DDEBAB5A0A1C619AC90F8DF98E0049631EF1E518A13B21A0193756317CE423E7C8CE9ABEF4D39A79F50900DCD6AADD9902F02C3CF861C76FF67432E26143FF91EF34A0C8E3D1531C01BD1AB4F54DD734E906CDBD381EBE6B6996F670DD04D97B3348D5C3F9F058A805719AEE0E5071FCEEA8E5D14BD11E31FD03130749F6D7950027DB345A3BA23E738C0145B676E11109CA2D4459EAC46E890D743B06A475508B68A83F0C2FD43E209968E13D608B143500A33D527549E163E71FD18059D5A125A1A6E61ACEF350FB1E61CC79830869D9A3061AE0E7B30016A3EC2A0746968EC342CAEDD10355EAB6ECCBB5CD8D5B84BD188ADD86487EFACB1CBD27F7B15C36CD7D8168CB35D252602684378BB30D0F2AC626A00E2C165DF0C543831690CB474A9B662A0BCC67660A0BC4ADE9C81164754D3F117CEABFB669EFC4179FBDB7AABBA76609B9C3EF6CC340BDF13DA50688113D93CCFE7AC123F53C5E10CE42CCF6769E9EA8A26C2C06798F2219B95BFABF4439D7610D188DA005786D6015A5EFE4940D284EA215C15CB6B95AEF4227AC05671B756D872ED17601B362063372F411B84FAAB52D1388D4E1F75CF6A6B908CDCE8B0D0C0511884B878F11D37508A2E2E2B2BC6C417EEE30D373A560E468B823A3C578D92AACE0CAEA5CA34BBB5A472C8FAB8641B6949709F345AAA3A33B8964A1BED5692C229E8E1166CA4227E0B1F68B255918E7AB7A9EBC64E911655168C1D4DFED4F806C5B14F968D7CAAB2C49A15C954D3EF66FD538DC202C3715345C6512D6DCD8946095A62A1165883A4977E92D27344D11CB138CFD40B2532E5DEAA59FE2B96CDED531EC46A1FA8A8D9EFA2057F65CF6DB3B21F5236BF84CE85CC99C923E88AA15737B7586A1B0A50A208DA4FA3200B89DEB7D2B72EAEEE9AED8B121961EC08F24BBE93A428C9C3E5B56E3426F27CD87C7C6AAF65FD31D243E8345DF99C4D5DEBFC503D4A15966AA2E842553B1B339DFB623A4EA253D87F983A115E67369599284D80B2A82746239941026BD499A3F2F9264D4CBEC61C51482A69420A553DA46CA68E7042362BD6C2D368544D61CE414E1669A2CBB5E6C88AB49126B4A27A0D6C85CC629D39AA22B3A409ACA836C75EA59988EBE71EEF57DAA3CA3A1B567190DD6CC7D260BCCE6238CC86D7B8AF6F02358A7B629537F2125859BE9786A43DCDAD634845E8623343D260E8D71BEE929B5F6E5A6FE6F598DCCD35B7A4B7DDDCEBF1FA99EBAB1A85748E13496AEEF5794E38B78DCB3354F7E318E9505590D856A546D8CE5F528AC3112318CD7E0EA6818FD9E25D11DC20E22F704A8B6C0DFBF8F0E8587864B33F0F5E9C34F502C51954F7EA851FB32D245E912794B88F2891D320367814B2029522CC57C4C3CF13FBFF79ABD33C58C17EE5C507D655FA99F83F6750F19064D8FA554EEB1C2649DEE059462DE8AF6FE2BD83B9CAAFFEF7A5687A60DD25309D4EAD4341D1EB0C3FFF0AA2973445D30DA459FB6DC4DB9D6DDC130425AA305BD67F7130F7E920AF0D2A29FF1EA2E76FFB8AA67C51B011A2E2D5C0507883A850F72A601D2CED8B000F3E69FE22A05F67D52F04D6114DFB3AC027FDC1C4B701E6CB50D57287FB90E2ACB48D2529D773676EF5468996BBDE9BA414EC8D26BA9C66DD036ED054EACD5C943796A23CD8D6A9C8401E0C7B9776FFEA69C7FB9269BC72DA779B60BCCD9CE2961BA4BF542AF11E24BF299279769F30BC6D5BD3057FF73CEBB25F5AF09E195BB9CDEF3EF977DBC6A60B10EFB9B1F54AF1DD335BDBD5FEB9634B33DE42779EB02BE71E692E715451E4AE84DC22E40EC7FF790446507894C53B4A7506585BF66A07C315899EA93EF54C642C4D1C89AF44D1CEB65F5FCB0DBFB5B3254D3B5B4DC2661BEF72FD6FE55DD2B4F3D6A441EE2295589988A84AEFEE58C7DAF2A5DE52EA30D7938E4CF52E9FB5F546FE2D650A0FA2146EF6686E97DF4E62F0202A1972EAF44804962F8A61EF6CFCAD45D8BF537FB982607F79916097DB356B9A2BB288AACD5B90A8221122343798220FB6D4B384FA0BE452A86601E8FC21781ED463D72073EC5D91BB8CC619852EE3701E70012FE604B4F1CFB39D7999C77731FB4A87E80288E9B3C0FD1DF931F303AF96FB521113D24030EFA20CF7B2B1A42CECBB7CA9916E23620854AAAF768A1E7018070096DE91197AC2EBC806E6778D97C87D5945007520DD03C1AB7D7CEEA36582C2B4C458B5874FB0612F7CFEFE4F1F00FC7272540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'fe9bc119-ba9f-46a1-972d-3775bf66e9b3', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'9e838b7f-9253-456c-b30f-c15091156880', N'Customer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'a2881a14-3440-4437-8f2e-30196010dc7e', N'Employee')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'c38b927c-5c61-4737-982b-ec21dc3799cb', N'Manager')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1ed5efb2-e3c5-4dbf-8d58-5f536dcb944f', N'9e838b7f-9253-456c-b30f-c15091156880')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cf7f861d-cdb3-4b82-8d3e-a4dc9aeefd36', N'a2881a14-3440-4437-8f2e-30196010dc7e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f6eb1a7c-bf71-4ec8-a25c-f0c565ff7558', N'a2881a14-3440-4437-8f2e-30196010dc7e')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fad8bbb4-d28e-4972-af66-024a9f4b1b89', N'fe9bc119-ba9f-46a1-972d-3775bf66e9b3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1ed5efb2-e3c5-4dbf-8d58-5f536dcb944f', N'ngoc@gmail.com', 0, N'AGmLrOfie02J3L6JXQQFvUG+dgK+a4A4JiZ8lN2LjV1LRs812YE79oiUIUVHVJXzbw==', N'291db7dd-997c-4367-bdc7-a013f8a9094b', NULL, 0, 0, NULL, 1, 0, N'ngoc@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b5477dd2-eae0-47c6-941a-679595457913', N'anh@gmail.com', 0, N'APGHMqtso67SS7lYZQtr51iRkvlzuP0NT2RxMBpyeednx6Mgn9oBqPi+n1dHh7ONUg==', N'8ba81ae0-a8dc-4bf7-ae2a-8d8b40dba571', NULL, 0, 0, NULL, 1, 0, N'anh@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cf7f861d-cdb3-4b82-8d3e-a4dc9aeefd36', N'kien@gmail.com', 0, N'AEpIKZ/HHc/dnNcWUrsqqgZJmEGxFFnuOgA3ZZHkNrhnZSFTsJ6bd09Sq//OgeHSWQ==', N'433bf034-074f-4c3e-b057-5f4080dbcd3a', NULL, 0, 0, NULL, 1, 0, N'kien@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f6eb1a7c-bf71-4ec8-a25c-f0c565ff7558', N'tram@gmail.com', 0, N'AK4zUDG9DrBgogWd1TgeqWQge6o1MO0E2YuEtt1v4XQYfWg1UNpq3iBxYN1g2Nh2Cw==', N'83438516-89ad-4272-8705-3eb47b0992c3', NULL, 0, 0, NULL, 1, 0, N'tram@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fad8bbb4-d28e-4972-af66-024a9f4b1b89', N'admin@gmail.com', 0, N'AG0xmaU/KhwI+XW1sMyJa/UzFd7INql4BN6NSfDQYIepkv1TvoFSX6nXetdKHYrgVg==', N'b36d0fc0-29e7-48c8-ad67-e9b40e803a3a', NULL, 0, 0, NULL, 0, 0, N'admin@gmail.com')
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Name], [Address], [Phone], [Email], [UserId]) VALUES (1, N'Ngọc', N'...', N'0357697543', N'ngoc@gmail.com', N'1ed5efb2-e3c5-4dbf-8d58-5f536dcb944f')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Address], [Phone], [Email], [Position], [UserId]) VALUES (1, N'Trâm', N'...', N'0987659876', N'tram@gmail.com', N'Employee', N'f6eb1a7c-bf71-4ec8-a25c-f0c565ff7558')
INSERT [dbo].[Employee] ([Id], [Name], [Address], [Phone], [Email], [Position], [UserId]) VALUES (2, N'Lê Đức Kiên', N'...', N'0978654783', N'kien@gmail.com', N'Employee', N'cf7f861d-cdb3-4b82-8d3e-a4dc9aeefd36')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Medicine] ON 

INSERT [dbo].[Medicine] ([Id], [Code_medicine], [Name], [Unit_measurement], [Origin], [Unit_price], [Quanlity], [Date]) VALUES (1, N'M098', N'Dalacin 1%', N'Tuýp', N'Nhật Bản', N'160.000', 650, CAST(N'2019-12-12' AS Date))
INSERT [dbo].[Medicine] ([Id], [Code_medicine], [Name], [Unit_measurement], [Origin], [Unit_price], [Quanlity], [Date]) VALUES (2, N'M867', N'Kẹo ngậm Bảo thanh', N'Vỉ', N'Việt Nam', N'14.000', 100, CAST(N'2019-09-14' AS Date))
INSERT [dbo].[Medicine] ([Id], [Code_medicine], [Name], [Unit_measurement], [Origin], [Unit_price], [Quanlity], [Date]) VALUES (3, N'M906', N'Panadon', N'Vỉ', NULL, N'25.000', 1000, CAST(N'2019-09-12' AS Date))
INSERT [dbo].[Medicine] ([Id], [Code_medicine], [Name], [Unit_measurement], [Origin], [Unit_price], [Quanlity], [Date]) VALUES (4, N'M674', N'Aluzaine 800mg', N'Vỉ', NULL, N'30.000', 500, CAST(N'2019-09-12' AS Date))
INSERT [dbo].[Medicine] ([Id], [Code_medicine], [Name], [Unit_measurement], [Origin], [Unit_price], [Quanlity], [Date]) VALUES (5, N'M534', N'Cephalexin 500mg', N'Vỉ', N'Việt Nam', N'45.000', 670, CAST(N'2019-09-12' AS Date))
SET IDENTITY_INSERT [dbo].[Medicine] OFF
SET IDENTITY_INSERT [dbo].[Prescription] ON 

INSERT [dbo].[Prescription] ([Id], [Date], [Customer_id], [Doctor_id], [Mediator_id], [Status], [Note]) VALUES (1, CAST(N'2020-10-23' AS Date), NULL, NULL, NULL, 0, N'Tái khám sau 1 tuần')
SET IDENTITY_INSERT [dbo].[Prescription] OFF
SET IDENTITY_INSERT [dbo].[Prescription_Detail] ON 

INSERT [dbo].[Prescription_Detail] ([ID], [Prescription_id], [Medicine_id], [Quanlity], [Morning], [Noon], [Afternoon], [Night], [Note]) VALUES (1, 1, NULL, 4, 1, NULL, 1, 1, N'uống')
SET IDENTITY_INSERT [dbo].[Prescription_Detail] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_customer] FOREIGN KEY([Customer_id])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_customer]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_doctor] FOREIGN KEY([Doctor_id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_doctor]
GO
ALTER TABLE [dbo].[Prescription]  WITH CHECK ADD  CONSTRAINT [FK_mediator] FOREIGN KEY([Mediator_id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Prescription] CHECK CONSTRAINT [FK_mediator]
GO
ALTER TABLE [dbo].[Prescription_Detail]  WITH CHECK ADD  CONSTRAINT [FK_medicine] FOREIGN KEY([Medicine_id])
REFERENCES [dbo].[Medicine] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Detail] CHECK CONSTRAINT [FK_medicine]
GO
ALTER TABLE [dbo].[Prescription_Detail]  WITH CHECK ADD  CONSTRAINT [FK_pres] FOREIGN KEY([Prescription_id])
REFERENCES [dbo].[Prescription] ([Id])
GO
ALTER TABLE [dbo].[Prescription_Detail] CHECK CONSTRAINT [FK_pres]
GO

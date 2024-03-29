USE [master]
GO
/****** Object:  Database [VinylRecords]    Script Date: 17.02.2024 9:07:48 ******/
CREATE DATABASE [VinylRecords]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VinylRecords', FILENAME = N'/var/opt/mssql/data/VinylRecords.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VinylRecords_log', FILENAME = N'/var/opt/mssql/data/VinylRecords_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [VinylRecords] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VinylRecords].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VinylRecords] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VinylRecords] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VinylRecords] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VinylRecords] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VinylRecords] SET ARITHABORT OFF 
GO
ALTER DATABASE [VinylRecords] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VinylRecords] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VinylRecords] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VinylRecords] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VinylRecords] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VinylRecords] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VinylRecords] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VinylRecords] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VinylRecords] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VinylRecords] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VinylRecords] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VinylRecords] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VinylRecords] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VinylRecords] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VinylRecords] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VinylRecords] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VinylRecords] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VinylRecords] SET RECOVERY FULL 
GO
ALTER DATABASE [VinylRecords] SET  MULTI_USER 
GO
ALTER DATABASE [VinylRecords] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VinylRecords] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VinylRecords] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VinylRecords] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VinylRecords] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [VinylRecords] SET QUERY_STORE = OFF
GO
USE [VinylRecords]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 17.02.2024 9:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 17.02.2024 9:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CountryCode] [int] NULL,
	[Phone] [nvarchar](11) NULL,
	[Mail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Record]    Script Date: 17.02.2024 9:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Year] [int] NULL,
	[Format] [int] NULL,
	[Size] [int] NULL,
	[IdManufacturer] [int] NULL,
	[Price] [float] NULL,
	[IdState] [int] NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 17.02.2024 9:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Subname] [nvarchar](10) NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supple]    Script Date: 17.02.2024 9:07:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supple](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdManufacturer] [int] NULL,
	[IdRecord] [int] NULL,
	[DateDelivery] [date] NULL,
	[Count] [int] NULL,
 CONSTRAINT [PK_Supple] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name]) VALUES (1, N'Австралия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (2, N'Австрия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (3, N'Азербайджан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (4, N'Албания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (5, N'Алжир')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (6, N'Ангола')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (7, N'Андорра')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (8, N'Антигуа и Барбуда')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (9, N'Аргентина')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (10, N'Армения')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (11, N'Афганистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (12, N'Багамы')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (13, N'Бангладеш')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (14, N'Барбадос')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (15, N'Бахрейн')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (16, N'Белоруссия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (17, N'Белиз')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (18, N'Бельгия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (19, N'Бенин')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (20, N'Болгария')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (21, N'Боливия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (22, N'Босния и Герцеговина')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (23, N'Ботсвана')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (24, N'Бразилия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (25, N'Бруней')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (26, N'Буркина-Фасо')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (27, N'Бурунди')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (28, N'Бутан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (29, N'Вануату')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (30, N'Великобритания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (31, N'Венгрия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (32, N'Венесуэла')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (33, N'Восточный Тимор')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (34, N'Вьетнам')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (35, N'Габон')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (36, N'Гаити')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (37, N'Гайана')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (38, N'Гамбия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (39, N'Гана')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (40, N'Гватемала')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (41, N'Гвинея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (42, N'Гвинея-Бисау')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (43, N'Германия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (44, N'Гондурас')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (45, N'Гренада')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (46, N'Греция')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (47, N'Грузия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (48, N'Дания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (49, N'Джибути')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (50, N'Доминика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (51, N'Доминикана')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (52, N'Египет')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (53, N'Замбия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (54, N'Зимбабве')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (55, N'Израиль')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (56, N'Индия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (57, N'Индонезия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (58, N'Иордания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (59, N'Ирак')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (60, N'Иран')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (61, N'Ирландия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (62, N'Исландия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (63, N'Испания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (64, N'Италия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (65, N'Йемен')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (66, N'Кабо-Верде')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (67, N'Казахстан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (68, N'Камбоджа')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (69, N'Камерун')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (70, N'Канада')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (71, N'Катар')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (72, N'Кения')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (73, N'Кипр')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (74, N'Киргизия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (75, N'Кирибати')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (76, N'Китай')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (77, N'Колумбия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (78, N'Коморы')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (79, N'Конго')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (80, N'ДР Конго')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (81, N'КНДР')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (82, N'Корея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (83, N'Коста-Рика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (84, N'Кот-д’Ивуар')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (85, N'Куба')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (86, N'Кувейт')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (87, N'Лаос')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (88, N'Латвия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (89, N'Лесото')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (90, N'Либерия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (91, N'Ливан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (92, N'Ливия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (93, N'Литва')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (94, N'Лихтенштейн')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (95, N'Люксембург')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (96, N'Маврикий')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (97, N'Мавритания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (98, N'Мадагаскар')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (99, N'Малави')
GO
INSERT [dbo].[Country] ([Id], [Name]) VALUES (100, N'Малайзия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (101, N'Мали')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (102, N'Мальдивы')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (103, N'Мальта')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (104, N'Марокко')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (105, N'Маршалловы Острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (106, N'Мексика')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (107, N'Микронезия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (108, N'Мозамбик')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (109, N'Молдавия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (110, N'Монако')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (111, N'Монголия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (112, N'Мьянма')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (113, N'Намибия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (114, N'Науру')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (115, N'Непал')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (116, N'Нигер')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (117, N'Нигерия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (118, N'Нидерланды')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (119, N'Никарагуа')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (120, N'Новая Зеландия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (121, N'Норвегия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (122, N'ОАЭ')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (123, N'Оман')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (124, N'Пакистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (125, N'Палау')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (126, N'Панама')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (127, N'Папуа — Новая Гвинея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (128, N'Парагвай')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (129, N'Перу')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (130, N'Польша')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (131, N'Португалия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (132, N'Россия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (133, N'Руанда')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (134, N'Румыния')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (135, N'Сальвадор')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (136, N'Самоа')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (137, N'Сан-Марино')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (138, N'Сан-Томе и Принсипи')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (139, N'Саудовская Аравия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (140, N'Северная Македония')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (141, N'Сейшелы')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (142, N'Сенегал')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (143, N'Сент-Винсент и Гренадины')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (144, N'Сент-Китс и Невис')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (145, N'Сент-Люсия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (146, N'Сербия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (147, N'Сингапур')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (148, N'Сирия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (149, N'Словакия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (150, N'Словения')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (151, N'США')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (152, N'Соломоновы Острова')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (153, N'Сомали')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (154, N'Судан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (155, N'Суринам')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (156, N'Сьерра-Леоне')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (157, N'Таджикистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (158, N'Таиланд')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (159, N'Танзания')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (160, N'Того')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (161, N'Тонга')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (162, N'Тринидад и Тобаго')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (163, N'Тувалу')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (164, N'Тунис')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (165, N'Туркменистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (166, N'Турция')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (167, N'Уганда')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (168, N'Узбекистан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (169, N'Украина')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (170, N'Уругвай')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (171, N'Фиджи')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (172, N'Филиппины')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (173, N'Финляндия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (174, N'Франция')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (175, N'Хорватия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (176, N'ЦАР')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (177, N'Чад')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (178, N'Черногория')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (179, N'Чехия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (180, N'Чили')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (181, N'Швейцария')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (182, N'Швеция')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (183, N'Шри-Ланка')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (184, N'Эквадор')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (185, N'Экваториальная Гвинея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (186, N'Эритрея')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (187, N'Эсватини')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (188, N'Эстония')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (189, N'Эфиопия')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (190, N'ЮАР')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (191, N'Южный Судан')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (192, N'Ямайка')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (193, N'Япония')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [Name], [CountryCode], [Phone], [Mail]) VALUES (6, N'ООО "Бит"', 132, N'89143693427', N'Ochepkov_Alesk@mail.ru')
INSERT [dbo].[Manufacturer] ([Id], [Name], [CountryCode], [Phone], [Mail]) VALUES (8, N'ООО "Наушник"', 151, N'89143693427', N'test@test.ru')
INSERT [dbo].[Manufacturer] ([Id], [Name], [CountryCode], [Phone], [Mail]) VALUES (11, N'Тестовый поставщик №5', 5, N'89143693421', N'test@test.ri')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
SET IDENTITY_INSERT [dbo].[Record] ON 

INSERT [dbo].[Record] ([Id], [Name], [Year], [Format], [Size], [IdManufacturer], [Price], [IdState], [Description]) VALUES (25, N'Тестовая пластинка №2', 2023, 0, 0, 6, 12800, 3, N'Тест 3')
INSERT [dbo].[Record] ([Id], [Name], [Year], [Format], [Size], [IdManufacturer], [Price], [IdState], [Description]) VALUES (26, N'Тестовая пластинка №1', 2022, 1, 0, 8, 15000, 9, N'Тестовая заметка №1')
INSERT [dbo].[Record] ([Id], [Name], [Year], [Format], [Size], [IdManufacturer], [Price], [IdState], [Description]) VALUES (1025, N'Тестовая пластинка №3', 2019, 1, 1, 6, 16000, 6, N'лывоал выады воалдыовд лыдвоадл оылао ыоад ываолыд оалдоылд воа')
SET IDENTITY_INSERT [dbo].[Record] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([Id], [Name], [Subname], [Description]) VALUES (1, N'Mint', N'MT', N'Пластинка или конверт в идеальном состоянии, без дефектов и видимых следов эксплуатации. Пластинка либо вообще не использовалась, либо была очень аккуратно прослушана считанное число раз')
INSERT [dbo].[State] ([Id], [Name], [Subname], [Description]) VALUES (3, N'Near mint', N'NM', N'Почти идеальное состояние. Допустимы минимальные изъяны, не влияющие на звучание, «волосяные» царапины от конверта, незначительные потёртости. Конверт может иметь незначительные изъяны, не портящие внешний вид.')
INSERT [dbo].[State] ([Id], [Name], [Subname], [Description]) VALUES (4, N'Excellent', N'EX', N'Отличное состояние. Пластинка проигрывалась и имеет незначительные следы эксплуатации, минимально влияющие на звучание, возможен лёгкий «песок». Конверт может иметь потёртости на углах и рёбрах или желтизну изображения от времени.')
INSERT [dbo].[State] ([Id], [Name], [Subname], [Description]) VALUES (5, N'Very good', N'VG', N'Очень хорошее состояние. Очевидно, что пластинка проигрывалась много раз, на ней есть царапины, а при воспроизведении слышны шумы, не перекрывающие музыку по уровню громкости. На конверте заметные потёртости, но целостность не нарушена.')
INSERT [dbo].[State] ([Id], [Name], [Subname], [Description]) VALUES (6, N'Good', N'G', N'Хорошее состояние. Пластинка проигрывается без перескоков, но отчётливо слышны шумы, щелчки или искажения, на поверхности глубокие, длинные царапины. Конверт с загибами, края стёрты, корешок может быть порван.')
INSERT [dbo].[State] ([Id], [Name], [Subname], [Description]) VALUES (7, N'Fair', N'F', N'Посредственное состояние. Пластинку всё ещё можно использовать, но звук будет с сильными шумами и искажениями, может соскакивать игла. Конверт сильно потрёпан, может быть порван или испачкан.')
INSERT [dbo].[State] ([Id], [Name], [Subname], [Description]) VALUES (8, N'Poor', N'P', N'Плохое состояние. Пластинка непригодна для использования из-за обилия царапин и повреждений. Конверт сильно повреждён, вложения могут быть не в полной комплектации.')
INSERT [dbo].[State] ([Id], [Name], [Subname], [Description]) VALUES (9, N'Bad', N'B', N'Всё совсем плохо. Пластинка может быть даже сломана. Конверт может быть сильно повреждён, порван, испачкан и присутствует лишь номинально. Такую пластинку стоит покупать только для галочки в коллекции.')
SET IDENTITY_INSERT [dbo].[State] OFF
ALTER TABLE [dbo].[Manufacturer]  WITH CHECK ADD  CONSTRAINT [FK_Manufacturer_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Manufacturer] CHECK CONSTRAINT [FK_Manufacturer_Country]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Manufacturer] FOREIGN KEY([IdManufacturer])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Manufacturer]
GO
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_State] FOREIGN KEY([IdState])
REFERENCES [dbo].[State] ([Id])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_State]
GO
ALTER TABLE [dbo].[Supple]  WITH CHECK ADD  CONSTRAINT [FK_Supple_Manufacturer] FOREIGN KEY([IdManufacturer])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Supple] CHECK CONSTRAINT [FK_Supple_Manufacturer]
GO
ALTER TABLE [dbo].[Supple]  WITH CHECK ADD  CONSTRAINT [FK_Supple_Record] FOREIGN KEY([IdRecord])
REFERENCES [dbo].[Record] ([Id])
GO
ALTER TABLE [dbo].[Supple] CHECK CONSTRAINT [FK_Supple_Record]
GO
USE [master]
GO
ALTER DATABASE [VinylRecords] SET  READ_WRITE 
GO

CREATE DATABASE [RMS_DEMO1]
Go
USE [RMS_DEMO1]
GO
/****** Object:  Database [RMS_DEMO1]    Script Date: 19.03.2026 0:24:15 ******/
CREATE DATABASE [RMS_DEMO1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RMS_DEMO1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\RMS_DEMO1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RMS_DEMO1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\RMS_DEMO1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RMS_DEMO1] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RMS_DEMO1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RMS_DEMO1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET ARITHABORT OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [RMS_DEMO1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RMS_DEMO1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RMS_DEMO1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RMS_DEMO1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RMS_DEMO1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RMS_DEMO1] SET  MULTI_USER 
GO
ALTER DATABASE [RMS_DEMO1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RMS_DEMO1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RMS_DEMO1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RMS_DEMO1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RMS_DEMO1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RMS_DEMO1] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [RMS_DEMO1] SET QUERY_STORE = ON
GO
ALTER DATABASE [RMS_DEMO1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RMS_DEMO1]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 19.03.2026 0:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[Номер заказа] [int] IDENTITY(1,1) NOT NULL,
	[Дата заказа] [date] NOT NULL,
	[Дата доставки] [date] NOT NULL,
	[Адрес пункта выдачи] [int] NOT NULL,
	[ФИО авторизированного клиента] [int] NOT NULL,
	[Код для получения] [varchar](max) NOT NULL,
	[Статус заказа] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[Номер заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 19.03.2026 0:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Роль] [varchar](max) NOT NULL,
	[ФИО] [varchar](max) NOT NULL,
	[Логин] [varchar](max) NOT NULL,
	[Пароль] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пункт_выдачи]    Script Date: 19.03.2026 0:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пункт_выдачи](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Адрес] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Пункт_выдачи] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Состав_заказа]    Script Date: 19.03.2026 0:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Состав_заказа](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Номер заказа] [int] NOT NULL,
	[Артикул заказа] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Состав_заказа] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Товар]    Script Date: 19.03.2026 0:24:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Товар](
	[Артикул] [varchar](50) NOT NULL,
	[Наименование ] [varchar](max) NOT NULL,
	[Единица измерения] [varchar](max) NOT NULL,
	[Цена] [decimal](10, 2) NOT NULL,
	[Поставщик] [varchar](max) NOT NULL,
	[Производитель] [varchar](max) NOT NULL,
	[Категория] [varchar](max) NOT NULL,
	[Действующая скидка] [decimal](10, 2) NULL,
	[Кол-во] [int] NULL,
	[Описание] [varchar](max) NOT NULL,
	[Фото] [varchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Товар_1] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Заказ] ON 
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (1, CAST(N'2025-02-27' AS Date), CAST(N'2025-04-20' AS Date), 1, 4, N'901', N'Завершен')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (2, CAST(N'2022-09-28' AS Date), CAST(N'2025-04-21' AS Date), 11, 1, N'902', N'Завершен')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (3, CAST(N'2025-03-21' AS Date), CAST(N'2025-04-22' AS Date), 2, 2, N'903', N'Завершен')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (4, CAST(N'2025-02-20' AS Date), CAST(N'2025-04-23' AS Date), 11, 3, N'904', N'Завершен')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (5, CAST(N'2025-03-17' AS Date), CAST(N'2025-04-24' AS Date), 2, 4, N'905', N'Завершен')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (6, CAST(N'2025-03-01' AS Date), CAST(N'2025-04-25' AS Date), 15, 1, N'906', N'Завершен')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (7, CAST(N'2025-02-28' AS Date), CAST(N'2025-04-26' AS Date), 3, 2, N'907', N'Завершен')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (8, CAST(N'2025-03-31' AS Date), CAST(N'2025-04-27' AS Date), 19, 3, N'908', N'Новый')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (9, CAST(N'2025-04-02' AS Date), CAST(N'2025-04-28' AS Date), 5, 4, N'909', N'Новый')
GO
INSERT [dbo].[Заказ] ([Номер заказа], [Дата заказа], [Дата доставки], [Адрес пункта выдачи], [ФИО авторизированного клиента], [Код для получения], [Статус заказа]) VALUES (10, CAST(N'2025-04-03' AS Date), CAST(N'2025-04-29' AS Date), 19, 4, N'910', N'Новый')
GO
SET IDENTITY_INSERT [dbo].[Заказ] OFF
GO
SET IDENTITY_INSERT [dbo].[Пользователь] ON 
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (1, N'Администратор', N'Никифорова Весения Николаевна', N'94d5ous@gmail.com', N'uzWC67')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (2, N'Администратор', N'Сазонов Руслан Германович', N'uth4iz@mail.com', N'2L6KZG')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (3, N'Администратор', N'Одинцов Серафим Артёмович', N'yzls62@outlook.com', N'JlFRCZ')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (4, N'Менеджер', N'Степанов Михаил Артёмович', N'1diph5e@tutanota.com', N'8ntwUp')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (5, N'Менеджер', N'Ворсин Петр Евгеньевич', N'tjde7c@yahoo.com', N'YOyhfR')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (6, N'Менеджер', N'Старикова Елена Павловна', N'wpmrc3do@tutanota.com', N'RSbvHv')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (7, N'Авторизированный клиент', N'Михайлюк Анна Вячеславовна', N'5d4zbu@tutanota.com', N'rwVDh9')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (8, N'Авторизированный клиент', N'Ситдикова Елена Анатольевна', N'ptec8ym@yahoo.com', N'LdNyos')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (9, N'Авторизированный клиент', N'Ворсин Петр Евгеньевич', N'1qz4kw@mail.com', N'gynQMT')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (10, N'Авторизированный клиент', N'Старикова Елена Павловна', N'4np6se@mail.com', N'AtnDjr')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (11, N'Менеджер', N'Буликов Бублик Бубликович', N'Byblik@mail.ru', N'qwerty123')
GO
INSERT [dbo].[Пользователь] ([Код], [Роль], [ФИО], [Логин], [Пароль]) VALUES (12, N'Гость', N'Гость', N'Гость', N'Гость')
GO
SET IDENTITY_INSERT [dbo].[Пользователь] OFF
GO
SET IDENTITY_INSERT [dbo].[Пункт_выдачи] ON 
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (1, N'420151, г. Лесной, ул. Вишневая, 32')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (2, N'125061, г. Лесной, ул. Подгорная, 8')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (3, N'630370, г. Лесной, ул. Шоссейная, 24')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (4, N'400562, г. Лесной, ул. Зеленая, 32')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (5, N'614510, г. Лесной, ул. Маяковского, 47')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (6, N'410542, г. Лесной, ул. Светлая, 46')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (7, N'620839, г. Лесной, ул. Цветочная, 8')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (8, N'443890, г. Лесной, ул. Коммунистическая, 1')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (9, N'603379, г. Лесной, ул. Спортивная, 46')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (10, N'603721, г. Лесной, ул. Гоголя, 41')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (11, N'410172, г. Лесной, ул. Северная, 13')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (12, N'614611, г. Лесной, ул. Молодежная, 50')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (13, N'454311, г.Лесной, ул. Новая, 19')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (14, N'660007, г.Лесной, ул. Октябрьская, 19')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (15, N'603036, г. Лесной, ул. Садовая, 4')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (16, N'394060, г.Лесной, ул. Фрунзе, 43')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (17, N'410661, г. Лесной, ул. Школьная, 50')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (18, N'625590, г. Лесной, ул. Коммунистическая, 20')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (19, N'625683, г. Лесной, ул. 8 Марта')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (20, N'450983, г.Лесной, ул. Комсомольская, 26')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (21, N'394782, г. Лесной, ул. Чехова, 3')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (22, N'603002, г. Лесной, ул. Дзержинского, 28')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (23, N'450558, г. Лесной, ул. Набережная, 30')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (24, N'344288, г. Лесной, ул. Чехова, 1')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (25, N'614164, г.Лесной,  ул. Степная, 30')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (26, N'394242, г. Лесной, ул. Коммунистическая, 43')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (27, N'660540, г. Лесной, ул. Солнечная, 25')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (28, N'125837, г. Лесной, ул. Шоссейная, 40')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (29, N'125703, г. Лесной, ул. Партизанская, 49')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (30, N'625283, г. Лесной, ул. Победы, 46')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (31, N'614753, г. Лесной, ул. Полевая, 35')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (32, N'426030, г. Лесной, ул. Маяковского, 44')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (33, N'450375, г. Лесной ул. Клубная, 44')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (34, N'625560, г. Лесной, ул. Некрасова, 12')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (35, N'630201, г. Лесной, ул. Комсомольская, 17')
GO
INSERT [dbo].[Пункт_выдачи] ([Код], [Адрес]) VALUES (36, N'190949, г. Лесной, ул. Мичурина, 26')
GO
SET IDENTITY_INSERT [dbo].[Пункт_выдачи] OFF
GO
SET IDENTITY_INSERT [dbo].[Состав_заказа] ON 
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (1, 1, N'А112Т4')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (2, 2, N'H782T5')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (3, 3, N'J384T6')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (4, 4, N'F572H7')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (5, 5, N'А112Т4')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (6, 6, N'H782T5')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (7, 7, N'J384T6')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (8, 8, N'F572H7')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (10, 10, N'S213E3')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (11, 1, N'F635R4')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (12, 2, N'G783F5')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (13, 3, N'D572U8')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (14, 4, N'D329H3')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (15, 5, N'F635R4')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (16, 6, N'G783F5')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (17, 7, N'D572U8')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (18, 8, N'D329H3')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (19, 9, N'G432E4')
GO
INSERT [dbo].[Состав_заказа] ([Код], [Номер заказа], [Артикул заказа]) VALUES (20, 10, N'E482R4')
GO
SET IDENTITY_INSERT [dbo].[Состав_заказа] OFF
GO
SET IDENTITY_INSERT [dbo].[Товар] ON 
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'B431R5', N'Ботинки', N'шт.', CAST(2800.00 AS Decimal(10, 2)), N'Обувь для вас', N'Rieker', N'Мужская обувь', CAST(2.00 AS Decimal(10, 2)), 5, N'Мужские кожаные ботинки/мужские ботинки', N'2.jpg', 2)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'C436G5', N'Ботинки', N'шт.', CAST(10900.00 AS Decimal(10, 2)), N'Kari', N'Alessio Nesca', N'Женская обувь', CAST(15.00 AS Decimal(10, 2)), 9, N'Ботинки женские, ARGO, размер 40', N'3.jpg', 3)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'D268G5', N'Туфли', N'шт.', CAST(4699.00 AS Decimal(10, 2)), N'Обувь для вас', N'Rieker', N'Женская обувь', CAST(3.00 AS Decimal(10, 2)), 16, N'Туфли Rieker женские демисезонные, размер 36, цвет коричневый', N'1.jpg', 4)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'D329H3', N'Полуботинки', N'шт.', CAST(1990.00 AS Decimal(10, 2)), N'Обувь для вас', N'Alessio Nesca', N'Женская обувь', CAST(4.00 AS Decimal(10, 2)), 4, N'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый', N'5.jpg', 5)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'D364R4', N'Туфли', N'шт.', CAST(15400.00 AS Decimal(10, 2)), N'Kari', N'Kari', N'Женская обувь', CAST(16.00 AS Decimal(10, 2)), 5, N'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши', N'6.jpg', 6)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'D572U8', N'Кроссовки', N'шт.', CAST(4100.00 AS Decimal(10, 2)), N'Обувь для вас', N'Рос', N'Мужская обувь', CAST(3.00 AS Decimal(10, 2)), 6, N'129615-4 Кроссовки мужские', N'7.jpg', 7)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'E482R4', N'Полуботинки', N'шт.', CAST(1800.00 AS Decimal(10, 2)), N'Kari', N'Kari', N'Женская обувь', CAST(2.00 AS Decimal(10, 2)), 14, N'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный', N'8.jpg', 8)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'F427R5', N'Ботинки', N'шт.', CAST(11800.00 AS Decimal(10, 2)), N'Обувь для вас', N'Rieker', N'Женская обувь', CAST(15.00 AS Decimal(10, 2)), 11, N'Ботинки на молнии с декоративной пряжкой FRAU', N'9.jpg', 9)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'F572H7', N'Туфли', N'шт.', CAST(2700.00 AS Decimal(10, 2)), N'Kari', N'Marco Tozzi', N'Женская обувь', CAST(2.00 AS Decimal(10, 2)), 14, N'Туфли Marco Tozzi женские летние, размер 39, цвет черный', N'10.jpg', 10)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'F635R4', N'Ботинки', N'шт.', CAST(3244.00 AS Decimal(10, 2)), N'Обувь для вас', N'Marco Tozzi', N'Женская обувь', CAST(2.00 AS Decimal(10, 2)), 13, N'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый', N'1.jpg', 11)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'G432E4', N'Туфли', N'шт.', CAST(2800.00 AS Decimal(10, 2)), N'Kari', N'Kari', N'Женская обувь', CAST(3.00 AS Decimal(10, 2)), 15, N'Туфли kari женские TR-YR-413017, размер 37, цвет: черный', N'2.jpg', 12)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'G531F4', N'Ботинки', N'шт.', CAST(6600.00 AS Decimal(10, 2)), N'Kari', N'Kari', N'Женская обувь', CAST(12.00 AS Decimal(10, 2)), 10, N'Ботинки женские зимние ROMER арт. 893167-01 Черный', N'3.jpg', 13)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'G783F5', N'Ботинки', N'шт.', CAST(5900.00 AS Decimal(10, 2)), N'Kari', N'Рос', N'Мужская обувь', CAST(2.00 AS Decimal(10, 2)), 8, N'Мужские ботинки Рос-Обувь кожаные с натуральным мехом', N'4.jpg', 14)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'H535R5', N'Ботинки', N'шт.', CAST(2300.00 AS Decimal(10, 2)), N'Обувь для вас', N'Rieker', N'Женская обувь', CAST(2.00 AS Decimal(10, 2)), 7, N'Женские Ботинки демисезонные', N'5.jpg', 15)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'H782T5', N'Туфли', N'шт.', CAST(4499.00 AS Decimal(10, 2)), N'Kari', N'Kari', N'Мужская обувь', CAST(4.00 AS Decimal(10, 2)), 5, N'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный', N'6.jpg', 16)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'J384T6', N'Ботинки', N'шт.', CAST(3800.00 AS Decimal(10, 2)), N'Обувь для вас', N'Rieker', N'Мужская обувь', CAST(2.00 AS Decimal(10, 2)), 16, N'B3430/14 Полуботинки мужские Rieker', N'7.jpg', 17)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'J542F5', N'Тапочки', N'шт.', CAST(550.00 AS Decimal(10, 2)), N'Kari', N'Kari', N'Мужская обувь', CAST(13.00 AS Decimal(10, 2)), 0, N'Тапочки мужские Арт.70701-55-67син р.41', N'8.jpg', 18)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'K345R4', N'Полуботинки', N'шт.', CAST(2100.00 AS Decimal(10, 2)), N'Обувь для вас', N'CROSBY', N'Мужская обувь', CAST(2.00 AS Decimal(10, 2)), 3, N'407700/01-02 Полуботинки мужские CROSBY', N'9.jpg', 19)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'K358H6', N'Тапочки', N'шт.', CAST(599.00 AS Decimal(10, 2)), N'Kari', N'Rieker', N'Мужская обувь', CAST(20.00 AS Decimal(10, 2)), 2, N'Тапочки мужские син р.41', N'10.jpg', 20)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'L754R4', N'Полуботинки', N'шт.', CAST(1700.00 AS Decimal(10, 2)), N'Kari', N'Kari', N'Женская обувь', CAST(2.00 AS Decimal(10, 2)), 7, N'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный', N'1.jpg', 21)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'M542T5', N'Кроссовки', N'шт.', CAST(2800.00 AS Decimal(10, 2)), N'Обувь для вас', N'Rieker', N'Мужская обувь', CAST(18.00 AS Decimal(10, 2)), 3, N'Кроссовки мужские TOFA', N'2.jpg', 22)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'N457T5', N'Полуботинки', N'шт.', CAST(4600.00 AS Decimal(10, 2)), N'Kari', N'CROSBY', N'Женская обувь', CAST(3.00 AS Decimal(10, 2)), 13, N'Полуботинки Ботинки черные зимние, мех', N'3.jpg', 23)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'O754F4', N'Туфли', N'шт.', CAST(5400.00 AS Decimal(10, 2)), N'Обувь для вас', N'Rieker', N'Женская обувь', CAST(4.00 AS Decimal(10, 2)), 18, N'Туфли женские демисезонные Rieker артикул 55073-68/37', N'4.jpg', 24)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'P764G4', N'Туфли', N'шт.', CAST(6800.00 AS Decimal(10, 2)), N'Kari', N'CROSBY', N'Женская обувь', CAST(15.00 AS Decimal(10, 2)), 15, N'Туфли женские, ARGO, размер 38', N'5.jpg', 25)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'S213E3', N'Полуботинки', N'шт.', CAST(2156.00 AS Decimal(10, 2)), N'Обувь для вас', N'CROSBY', N'Мужская обувь', CAST(3.00 AS Decimal(10, 2)), 6, N'407700/01-01 Полуботинки мужские CROSBY', N'6.jpg', 26)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'S326R5', N'Тапочки', N'шт.', CAST(9900.00 AS Decimal(10, 2)), N'Обувь для вас', N'CROSBY', N'Мужская обувь', CAST(17.00 AS Decimal(10, 2)), 15, N'"Мужские кожаные тапочки ""Профиль С.Дали"" "', N'7.jpg', 27)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'S634B5', N'Кеды', N'шт.', CAST(5500.00 AS Decimal(10, 2)), N'Обувь для вас', N'CROSBY', N'Мужская обувь', CAST(3.00 AS Decimal(10, 2)), 0, N'Кеды Caprice мужские демисезонные, размер 42, цвет черный', N'8.jpg', 28)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'T324F5', N'Сапоги', N'шт.', CAST(4699.00 AS Decimal(10, 2)), N'Kari', N'CROSBY', N'Женская обувь', CAST(2.00 AS Decimal(10, 2)), 5, N'Сапоги замша Цвет: синий', N'9.jpg', 29)
GO
INSERT [dbo].[Товар] ([Артикул], [Наименование ], [Единица измерения], [Цена], [Поставщик], [Производитель], [Категория], [Действующая скидка], [Кол-во], [Описание], [Фото], [Id]) VALUES (N'А112Т4', N'Ботинки', N'шт.', CAST(4990.00 AS Decimal(10, 2)), N'Kari', N'Kari', N'Женская обувь', CAST(3.00 AS Decimal(10, 2)), 6, N'Женские Ботинки демисезонные kari', N'10.jpg', 30)
GO
SET IDENTITY_INSERT [dbo].[Товар] OFF
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пользователь] FOREIGN KEY([ФИО авторизированного клиента])
REFERENCES [dbo].[Пользователь] ([Код])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пользователь]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Пункт_выдачи] FOREIGN KEY([Адрес пункта выдачи])
REFERENCES [dbo].[Пункт_выдачи] ([Код])
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Пункт_выдачи]
GO
ALTER TABLE [dbo].[Состав_заказа]  WITH CHECK ADD  CONSTRAINT [FK_Состав_заказа_Заказ] FOREIGN KEY([Номер заказа])
REFERENCES [dbo].[Заказ] ([Номер заказа])
GO
ALTER TABLE [dbo].[Состав_заказа] CHECK CONSTRAINT [FK_Состав_заказа_Заказ]
GO
ALTER TABLE [dbo].[Состав_заказа]  WITH CHECK ADD  CONSTRAINT [FK_Состав_заказа_Товар] FOREIGN KEY([Артикул заказа])
REFERENCES [dbo].[Товар] ([Артикул])
GO
ALTER TABLE [dbo].[Состав_заказа] CHECK CONSTRAINT [FK_Состав_заказа_Товар]
GO
USE [master]
GO
ALTER DATABASE [RMS_DEMO1] SET  READ_WRITE 
GO

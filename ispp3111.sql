USE [master]
GO
/****** Object:  Database [ispp3107]    Script Date: 16.10.2025 11:50:36 ******/
CREATE DATABASE [ispp3107]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ispp3107', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQL\MSSQL\DATA\ispp3107.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ispp3107_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQL\MSSQL\DATA\ispp3107_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ispp3107] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ispp3107].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ispp3107] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ispp3107] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ispp3107] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ispp3107] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ispp3107] SET ARITHABORT OFF 
GO
ALTER DATABASE [ispp3107] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ispp3107] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ispp3107] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ispp3107] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ispp3107] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ispp3107] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ispp3107] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ispp3107] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ispp3107] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ispp3107] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ispp3107] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ispp3107] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ispp3107] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ispp3107] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ispp3107] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ispp3107] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ispp3107] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ispp3107] SET RECOVERY FULL 
GO
ALTER DATABASE [ispp3107] SET  MULTI_USER 
GO
ALTER DATABASE [ispp3107] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ispp3107] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ispp3107] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ispp3107] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ispp3107] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ispp3107] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ispp3107', N'ON'
GO
ALTER DATABASE [ispp3107] SET QUERY_STORE = ON
GO
ALTER DATABASE [ispp3107] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ispp3107]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeletedVisiors]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeletedVisiors](
	[VisiorId] [int] NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](100) NULL,
	[DeleteDate] [datetime] NULL,
	[DeletedBy] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailChanges]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailChanges](
	[VisiorId] [int] NOT NULL,
	[OldEmail] [varchar](150) NOT NULL,
	[ChangeDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film](
	[FilmId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Duration] [smallint] NOT NULL,
	[ReleaseYear] [smallint] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Poster] [varbinary](max) NULL,
	[AgeRating] [varchar](10) NULL,
	[RentalStart] [date] NULL,
	[RentalEnd] [date] NULL,
	[isDeleted] [bit] NULL,
 CONSTRAINT [PK_Film] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmGenre]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmGenre](
	[FilmId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
 CONSTRAINT [PK_FilmGenre] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [decimal](16, 2) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GameId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GamePrice]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePrice](
	[GameId] [int] NOT NULL,
	[OldPrice] [decimal](16, 2) NOT NULL,
	[Changing] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hall](
	[HallId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Cinema] [nvarchar](50) NOT NULL,
	[HallNumber] [tinyint] NOT NULL,
	[RowsQuantity] [tinyint] NOT NULL,
	[SeatsQuantity] [tinyint] NOT NULL,
	[IsVip] [bit] NOT NULL,
 CONSTRAINT [PK_Hall] PRIMARY KEY CLUSTERED 
(
	[HallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NOT NULL,
	[HallId] [tinyint] NOT NULL,
	[Price] [decimal](4, 0) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[Is3d] [bit] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [int] NOT NULL,
	[VisitorId] [int] NOT NULL,
	[Row] [tinyint] NOT NULL,
	[Seat] [tinyint] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor](
	[VisitorId] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [char](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Birthday] [datetime2](7) NULL,
	[Email] [varchar](150) NULL,
 CONSTRAINT [PK_Visior] PRIMARY KEY CLUSTERED 
(
	[VisitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251016082718_Initial', N'9.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251016082936_AddDescriptionCategory', N'9.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251016083158_AddDescriptionCategory', N'9.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20251016083855_AddDescriptionCategory', N'9.0.10')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (1, N'444444', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (2, N'Шутер', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (3, N'RPG', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (4, N'arcade', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (6, N'casual', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (7, N'casual', NULL)
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (8, N'casual', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[DeletedVisiors] ([VisiorId], [Email], [Phone], [DeleteDate], [DeletedBy]) VALUES (11, N'a3423432', N'2 213     ', CAST(N'2025-09-26T10:08:32.220' AS DateTime), N'ispp3107')
INSERT [dbo].[DeletedVisiors] ([VisiorId], [Email], [Phone], [DeleteDate], [DeletedBy]) VALUES (13, N'ivan@example.com', N'9991234567', CAST(N'2025-10-02T11:02:47.180' AS DateTime), N'ispp3107')
INSERT [dbo].[DeletedVisiors] ([VisiorId], [Email], [Phone], [DeleteDate], [DeletedBy]) VALUES (15, N'markPetr@example.com', N'9901234567', CAST(N'2025-10-02T11:03:07.920' AS DateTime), N'ispp3107')
INSERT [dbo].[DeletedVisiors] ([VisiorId], [Email], [Phone], [DeleteDate], [DeletedBy]) VALUES (16, N'markPetr@example.com', N'9901234567', CAST(N'2025-10-02T11:04:40.363' AS DateTime), N'ispp3107')
INSERT [dbo].[DeletedVisiors] ([VisiorId], [Email], [Phone], [DeleteDate], [DeletedBy]) VALUES (19, N'markPetr@example.com', N'9901234567', CAST(N'2025-10-02T11:26:34.553' AS DateTime), N'ispp3107')
INSERT [dbo].[DeletedVisiors] ([VisiorId], [Email], [Phone], [DeleteDate], [DeletedBy]) VALUES (20, N'markPetr@example.com', N'9901234567', CAST(N'2025-10-02T11:33:17.240' AS DateTime), N'ispp3107')
INSERT [dbo].[DeletedVisiors] ([VisiorId], [Email], [Phone], [DeleteDate], [DeletedBy]) VALUES (17, N'markPetr@example.com', N'9901234567', CAST(N'2025-10-02T11:05:37.363' AS DateTime), N'ispp3107')
INSERT [dbo].[DeletedVisiors] ([VisiorId], [Email], [Phone], [DeleteDate], [DeletedBy]) VALUES (18, N'markPetr@example.com', N'9901234567', CAST(N'2025-10-02T11:06:25.023' AS DateTime), N'ispp3107')
GO
INSERT [dbo].[EmailChanges] ([VisiorId], [OldEmail], [ChangeDate]) VALUES (2, N'lalal@mail.ru', CAST(N'2025-09-26T09:17:31.473' AS DateTime))
INSERT [dbo].[EmailChanges] ([VisiorId], [OldEmail], [ChangeDate]) VALUES (3, N'dwahdjwhaj@mai.ru', CAST(N'2025-09-26T09:27:23.560' AS DateTime))
INSERT [dbo].[EmailChanges] ([VisiorId], [OldEmail], [ChangeDate]) VALUES (2, N'lalal@mail', CAST(N'2025-09-26T09:27:37.680' AS DateTime))
INSERT [dbo].[EmailChanges] ([VisiorId], [OldEmail], [ChangeDate]) VALUES (2, N'al@mail', CAST(N'2025-09-26T09:27:55.757' AS DateTime))
INSERT [dbo].[EmailChanges] ([VisiorId], [OldEmail], [ChangeDate]) VALUES (3, N'dwhaj@mai.ru', CAST(N'2025-09-26T09:33:40.347' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([FilmId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalStart], [RentalEnd], [isDeleted]) VALUES (1, N'Заклятие 4: Последний обряд', 135, 2025, N'Исследователи паранормальных явлений Эд и Лоррейн Уоррен берутся за самый тревожный случай в своей практике. Семья переезжает в новый дом своей мечты, но вскоре их жилище начинает проявлять признаки демонической активности, превращая жизнь в кошмар.', NULL, N'18+', CAST(N'2025-09-22' AS Date), CAST(N'2025-10-22' AS Date), 0)
INSERT [dbo].[Film] ([FilmId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalStart], [RentalEnd], [isDeleted]) VALUES (2, N'Зверопоезд', 86, 2025, N'Оказавшиеся в ловушке на мчащемся поезде домашние питомцы должны сорвать планы мстительного барсука Ганса. Пушистые заложники могут рассчитывать лишь на Сокола — хитрого и изобретательного енота, готового на все, чтобы их спасти.', NULL, N'6+', CAST(N'2025-08-13' AS Date), CAST(N'2025-09-11' AS Date), NULL)
INSERT [dbo].[Film] ([FilmId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalStart], [RentalEnd], [isDeleted]) VALUES (3, N'Формула-1', 155, 2025, N'Звезда «Формулы-1» Сонни Хейс ушел из спорта после серьезной аварии еще в 1990-х. Спустя много лет к нему обращается владелец гоночной команды APXGP с просьбой присоединиться к ним в качестве второго пилота и наставника для вундеркинда Джошуа Пирса.', NULL, N'12+', CAST(N'2025-06-03' AS Date), CAST(N'2025-10-03' AS Date), NULL)
INSERT [dbo].[Film] ([FilmId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalStart], [RentalEnd], [isDeleted]) VALUES (4, N'Лило и Стич', 108, 2025, NULL, NULL, N'6+', NULL, NULL, NULL)
INSERT [dbo].[Film] ([FilmId], [Title], [Duration], [ReleaseYear], [Description], [Poster], [AgeRating], [RentalStart], [RentalEnd], [isDeleted]) VALUES (7, N'На деревню дедушке', 96, 2025, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Film] OFF
GO
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (1, 1)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (2, 3)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (3, 5)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (4, 4)
INSERT [dbo].[FilmGenre] ([FilmId], [GenreId]) VALUES (7, 2)
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (1, 1, N'SimCity', CAST(1499.00 AS Decimal(16, 2)), N'Градостроительный симулятор снова с вами! Создайте город своей мечты', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (2, 2, N'TITANFALL', CAST(2299.00 AS Decimal(16, 2)), N'Эта игра перенесет вас во вселенную, где малое противопоставляется большому, природа – индустрии, а человек – машине', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (3, 2, N'Battlefield 4', CAST(899.40 AS Decimal(16, 2)), N'Battlefield 4 – это определяющий для жанра, полный экшена боевик, известный своей разрушаемостью, равных которой нет', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (4, 1, N'The Sims 4', CAST(15.00 AS Decimal(16, 2)), N'В реальности каждому человеку дано прожить лишь одну жизнь. Но с помощью The Sims 4 это ограничение можно снять! Вам решать — где, как и с кем жить, чем заниматься, чем украшать и обустраивать свой дом', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (5, 3, N'Dark Souls 2', CAST(949.00 AS Decimal(16, 2)), N'Продолжение знаменитого ролевого экшена вновь заставит игроков пройти через сложнейшие испытания. Dark Souls II предложит нового героя, новую историю и новый мир. Лишь одно неизменно – выжить в мрачной вселенной Dark Souls очень непросто.', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (6, 3, N'The Elder Scrolls V: Skyrim', CAST(1399.00 AS Decimal(16, 2)), N'После убийства короля Скайрима империя оказалась на грани катастрофы. Вокруг претендентов на престол сплотились новые союзы, и разгорелся конфликт. К тому же, как предсказывали древние свитки, в мир вернулись жестокие и беспощадные драконы. Теперь будущее Скайрима и всей империи зависит от драконорожденного — человека, в жилах которого течет кровь легендарных существ.', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (7, 1, N'FIFA 14', CAST(699.00 AS Decimal(16, 2)), N'Достоверный, красивый, эмоциональный футбол! Проверенный временем геймплей FIFA стал ещё лучше благодаря инновациям, поощряющим творческую игру в центре поля и позволяющим задавать её темп.', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (8, 1, N'Need for Speed Rivals', CAST(15.00 AS Decimal(16, 2)), N'Забудьте про стандартные режимы игры. Сотрите грань между одиночным и многопользовательским режимом в постоянном соперничестве между гонщиками и полицией. Свободно войдите в мир, в котором ваши друзья уже участвуют в гонках и погонях. ', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (9, 2, N'Crysis 3', CAST(1299.00 AS Decimal(16, 2)), N'Действие игры разворачивается в 2047 году, а вам предстоит выступить в роли Пророка.', 0)
INSERT [dbo].[Game] ([GameId], [CategoryId], [Name], [Price], [Description], [IsDeleted]) VALUES (10, 2, N'Dead Space 3', CAST(499.00 AS Decimal(16, 2)), N'В Dead Space 3 Айзек Кларк и суровый солдат Джон Карвер отправляются в космическое путешествие, чтобы узнать о происхождении некроморфов.', 0)
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (1, N'Триллер')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (2, N'Семейная Комедия')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (3, N'Комедия')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (4, N'Фантастика')
INSERT [dbo].[Genre] ([GenreId], [GenreName]) VALUES (5, N'Спорт')
SET IDENTITY_INSERT [dbo].[Genre] OFF
GO
SET IDENTITY_INSERT [dbo].[Hall] ON 

INSERT [dbo].[Hall] ([HallId], [Cinema], [HallNumber], [RowsQuantity], [SeatsQuantity], [IsVip]) VALUES (1, N'Макси', 3, 11, 15, 0)
INSERT [dbo].[Hall] ([HallId], [Cinema], [HallNumber], [RowsQuantity], [SeatsQuantity], [IsVip]) VALUES (2, N'Титан-Арена', 1, 10, 13, 1)
INSERT [dbo].[Hall] ([HallId], [Cinema], [HallNumber], [RowsQuantity], [SeatsQuantity], [IsVip]) VALUES (4, N'Макси', 4, 11, 15, 1)
INSERT [dbo].[Hall] ([HallId], [Cinema], [HallNumber], [RowsQuantity], [SeatsQuantity], [IsVip]) VALUES (5, N'Русь', 1, 9, 12, 0)
INSERT [dbo].[Hall] ([HallId], [Cinema], [HallNumber], [RowsQuantity], [SeatsQuantity], [IsVip]) VALUES (6, N'Русь', 2, 8, 10, 0)
SET IDENTITY_INSERT [dbo].[Hall] OFF
GO
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([SessionId], [FilmId], [HallId], [Price], [StartDate], [Is3d]) VALUES (1, 1, 2, CAST(300 AS Decimal(4, 0)), CAST(N'2025-09-24T15:20:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [FilmId], [HallId], [Price], [StartDate], [Is3d]) VALUES (2, 2, 5, CAST(200 AS Decimal(4, 0)), CAST(N'2025-09-24T12:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [FilmId], [HallId], [Price], [StartDate], [Is3d]) VALUES (3, 3, 1, CAST(300 AS Decimal(4, 0)), CAST(N'2025-09-24T17:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Session] ([SessionId], [FilmId], [HallId], [Price], [StartDate], [Is3d]) VALUES (4, 4, 6, CAST(250 AS Decimal(4, 0)), CAST(N'2025-09-24T13:30:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Session] ([SessionId], [FilmId], [HallId], [Price], [StartDate], [Is3d]) VALUES (5, 7, 4, CAST(250 AS Decimal(4, 0)), CAST(N'2025-09-24T14:45:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([TicketId], [SessionId], [VisitorId], [Row], [Seat]) VALUES (2, 2, 3, 2, 2)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[Visitor] ON 

INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (2, N'34455     ', N'Маша', CAST(N'2000-12-12T00:00:00.0000000' AS DateTime2), N'a11l@mail')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (3, N'245553    ', N'Катя', CAST(N'2003-04-25T00:00:00.0000000' AS DateTime2), N'haj@mai.ru')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (4, N'3445465   ', N'Настя', CAST(N'2005-09-18T00:00:00.0000000' AS DateTime2), N'wadwda')
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (5, N'345454    ', N'Паша', CAST(N'1999-07-20T00:00:00.0000000' AS DateTime2), NULL)
INSERT [dbo].[Visitor] ([VisitorId], [Phone], [Name], [Birthday], [Email]) VALUES (6, N'4356467   ', N'Костя', CAST(N'2006-02-15T00:00:00.0000000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Visitor] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Hall]    Script Date: 16.10.2025 11:50:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Hall] ON [dbo].[Hall]
(
	[HallNumber] ASC,
	[Cinema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Ticket]    Script Date: 16.10.2025 11:50:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Ticket] ON [dbo].[Ticket]
(
	[SessionId] ASC,
	[Row] ASC,
	[Seat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Visior]    Script Date: 16.10.2025 11:50:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Visior] ON [dbo].[Visitor]
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DeletedVisiors] ADD  CONSTRAINT [DF__DeletedVi__Delet__208CD6FA]  DEFAULT (getdate()) FOR [DeleteDate]
GO
ALTER TABLE [dbo].[EmailChanges] ADD  CONSTRAINT [DF__EmailChan__Chang__1332DBDC]  DEFAULT (getdate()) FOR [ChangeDate]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_Duration]  DEFAULT ((90)) FOR [Duration]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_ReleaseYear]  DEFAULT (datepart(year,getdate())) FOR [ReleaseYear]
GO
ALTER TABLE [dbo].[Film] ADD  CONSTRAINT [DF_Film_isDeleted]  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Game] ADD  CONSTRAINT [DF_Game_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[GamePrice] ADD  CONSTRAINT [DF_GamePrice_Changing]  DEFAULT (getdate()) FOR [Changing]
GO
ALTER TABLE [dbo].[Hall] ADD  CONSTRAINT [DF_Hall_Cinema]  DEFAULT (N'Макси') FOR [Cinema]
GO
ALTER TABLE [dbo].[Hall] ADD  CONSTRAINT [DF_Hall_VIP]  DEFAULT ((0)) FOR [IsVip]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_Price]  DEFAULT ((200)) FOR [Price]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_TimeDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_3D]  DEFAULT ((0)) FOR [Is3d]
GO
ALTER TABLE [dbo].[EmailChanges]  WITH CHECK ADD  CONSTRAINT [FK_EmailChanges_Visior] FOREIGN KEY([VisiorId])
REFERENCES [dbo].[Visitor] ([VisitorId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EmailChanges] CHECK CONSTRAINT [FK_EmailChanges_Visior]
GO
ALTER TABLE [dbo].[FilmGenre]  WITH CHECK ADD  CONSTRAINT [FK_FilmGenre_Film] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Film] ([FilmId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FilmGenre] CHECK CONSTRAINT [FK_FilmGenre_Film]
GO
ALTER TABLE [dbo].[FilmGenre]  WITH CHECK ADD  CONSTRAINT [FK_FilmGenre_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([GenreId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FilmGenre] CHECK CONSTRAINT [FK_FilmGenre_Genre]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Category]
GO
ALTER TABLE [dbo].[GamePrice]  WITH CHECK ADD  CONSTRAINT [FK_GamePrice_Game] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([GameId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GamePrice] CHECK CONSTRAINT [FK_GamePrice_Game]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Film] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Film] ([FilmId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Film]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Hall] FOREIGN KEY([HallId])
REFERENCES [dbo].[Hall] ([HallId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Hall]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Session]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Visior] FOREIGN KEY([VisitorId])
REFERENCES [dbo].[Visitor] ([VisitorId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Visior]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [CK_Hall_1] CHECK  (([RowsQuantity]<(31) AND [RowsQuantity]>(4)))
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [CK_Hall_1]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [CK_Hall_3] CHECK  (([SeatsQuantity]<(31) AND [SeatsQuantity]>(4)))
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [CK_Hall_3]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [CK_Hall_4] CHECK  (([Cinema]='Макси' OR [Cinema]='Титан-Арена' OR [Cinema]='Русь'))
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [CK_Hall_4]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [CK_Ticket_Row] CHECK  (([Row]>(0)))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [CK_Ticket_Row]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [CK_Ticket_Seat] CHECK  (([Seat]>(0)))
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [CK_Ticket_Seat]
GO
/****** Object:  Trigger [dbo].[TrSaveCategory]    Script Date: 16.10.2025 11:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CREATE TRIGGER TrGamesRowsCount
--    ON Game
--    AFTER DELETE, INSERT, UPDATE
--    AS
--		PRINT 'Количество измененных строк:' + CAST(@@ROWCOUNT AS VARCHAR(10))
    
--UPDATE Game
--SET Price+=1;


--CREATE TRIGGER TrSavePrice
--    ON Game
--    AFTER UPDATE
--    AS
--	  If UPDATE(Price)-- 
--		INSERT INTO GamePrice(GameId, OldPrice)
--		SELECT GameId, Price
--		FROM deleted;

--UPDATE Game
--SET Price+=10
--WHERE GameId<3;


CREATE TRIGGER [dbo].[TrSaveCategory]
    ON [dbo].[Category]
    AFTER DELETE
    AS
		INSERT INTO DeletedCategiry(CategoryId, [Name])
		SELECT CategoryId, [Name]
		FROM deleted;

insert into category(name) values('рогалик')

delete
from category
where categoryId=4
GO
ALTER TABLE [dbo].[Category] DISABLE TRIGGER [TrSaveCategory]
GO
/****** Object:  Trigger [dbo].[TR_Film_InsteadDelete]    Script Date: 16.10.2025 11:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_Film_InsteadDelete]
ON [dbo].[Film]
INSTEAD OF DELETE
AS
BEGIN
	UPDATE Film
	SET isDeleted = 1
	WHERE FilmId IN (SELECT FilmId FROM deleted);
END;
GO
ALTER TABLE [dbo].[Film] ENABLE TRIGGER [TR_Film_InsteadDelete]
GO
/****** Object:  Trigger [dbo].[TrGamesRowsCount]    Script Date: 16.10.2025 11:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[TrGamesRowsCount]
    ON [dbo].[Game]
    AFTER DELETE, INSERT, UPDATE
    AS
		PRINT 'Количество измененных строк:' + CAST(@@ROWCOUNT AS VARCHAR(10))
    
UPDATE Game
SET Price+=1;
GO
ALTER TABLE [dbo].[Game] ENABLE TRIGGER [TrGamesRowsCount]
GO
/****** Object:  Trigger [dbo].[TrSavePrice]    Script Date: 16.10.2025 11:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CREATE TRIGGER TrGamesRowsCount
--    ON Game
--    AFTER DELETE, INSERT, UPDATE
--    AS
--		PRINT 'Количество измененных строк:' + CAST(@@ROWCOUNT AS VARCHAR(10))
    
--UPDATE Game
--SET Price+=1;


CREATE TRIGGER [dbo].[TrSavePrice]
    ON [dbo].[Game]
    AFTER UPDATE
    AS
	  If UPDATE(Price)
		INSERT INTO GamePrice(GameId, OldPrice)
		SELECT GameId, Price
		FROM deleted;

UPDATE Game
SET Price+=10
WHERE GameId<3;
GO
ALTER TABLE [dbo].[Game] ENABLE TRIGGER [TrSavePrice]
GO
/****** Object:  Trigger [dbo].[TR_Visior_EmailChanges]    Script Date: 16.10.2025 11:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_Visior_EmailChanges]
ON [dbo].[Visitor]
AFTER UPDATE
AS
BEGIN
	INSERT INTO EmailChanges(VisiorId, OldEmail)
	SELECT deleted.VisiorId, deleted.Email
	FROM deleted
	JOIN inserted ON
deleted.VisiorId = inserted.VisiorId
	WHERE deleted.Email <>
	inserted.Email
END;
GO
ALTER TABLE [dbo].[Visitor] ENABLE TRIGGER [TR_Visior_EmailChanges]
GO
/****** Object:  Trigger [dbo].[TR_Visiors_After_Delete]    Script Date: 16.10.2025 11:50:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_Visiors_After_Delete]
ON [dbo].[Visitor]
AFTER DELETE
AS
BEGIN
	INSERT INTO DeletedVisiors(VisiorId, Email, Phone, DeleteDate, DeletedBy)
	SELECT VisiorId, Email, Phone, GetDate(), SYSTEM_USER
	FROM deleted;
END;
GO
ALTER TABLE [dbo].[Visitor] ENABLE TRIGGER [TR_Visiors_After_Delete]
GO
USE [master]
GO
ALTER DATABASE [ispp3107] SET  READ_WRITE 
GO

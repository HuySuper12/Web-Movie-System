USE [master]
GO
/****** Object:  Database [CinemaHub]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE DATABASE [CinemaHub]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CinemaHub', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\CinemaHub.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CinemaHub_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\CinemaHub_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CinemaHub] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CinemaHub].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CinemaHub] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CinemaHub] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CinemaHub] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CinemaHub] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CinemaHub] SET ARITHABORT OFF 
GO
ALTER DATABASE [CinemaHub] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CinemaHub] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CinemaHub] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CinemaHub] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CinemaHub] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CinemaHub] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CinemaHub] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CinemaHub] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CinemaHub] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CinemaHub] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CinemaHub] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CinemaHub] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CinemaHub] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CinemaHub] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CinemaHub] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CinemaHub] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CinemaHub] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CinemaHub] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CinemaHub] SET  MULTI_USER 
GO
ALTER DATABASE [CinemaHub] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CinemaHub] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CinemaHub] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CinemaHub] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CinemaHub] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CinemaHub] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CinemaHub] SET QUERY_STORE = ON
GO
ALTER DATABASE [CinemaHub] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CinemaHub]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/10/2025 4:07:02 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[ProfilePicture] [nvarchar](max) NULL,
	[Balance] [decimal](18, 2) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[Status] [bit] NULL,
	[OtpCode] [nvarchar](max) NULL,
	[OtpExpiration] [datetime2](7) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ViolationCount] [int] NULL,
	[AccountLockUntil] [datetime2](7) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[MovieID] [int] NOT NULL,
	[Content] [nvarchar](1000) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK__Comments__C3B4DFAAAB9D27CA] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Action] [nvarchar](255) NOT NULL,
	[UserID] [nvarchar](450) NULL,
	[Timestamp] [datetime] NULL,
 CONSTRAINT [PK__Logs__5E5499A84C461684] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenreMapping]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenreMapping](
	[MovieID] [int] NOT NULL,
	[GenreID] [int] NOT NULL,
 CONSTRAINT [PK__MovieGen__BBEAC46F16BE84B9] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC,
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__MovieGen__0385055E5CB3ED1D] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ReleaseDate] [date] NULL,
	[Duration] [int] NOT NULL,
	[Language] [nvarchar](50) NULL,
	[TrailerURL] [nvarchar](255) NULL,
	[VideoURL] [nvarchar](255) NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[UploadedBy] [nvarchar](450) NOT NULL,
	[Director] [nvarchar](255) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK__Movies__4BD2943AF6A04ED5] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ReceiverId] [nvarchar](450) NOT NULL,
	[Status] [bit] NULL,
	[ContentDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK__Notifica__20CF2E32ECE77725] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentCode] [nvarchar](255) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[SubscriptionPlanID] [int] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
	[PaymentStatus] [nvarchar](50) NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[MovieID] [int] NOT NULL,
	[Rating] [float] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK__Ratings__FCCDF85C80D7F09B] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionPlans]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionPlans](
	[PlanID] [int] IDENTITY(1,1) NOT NULL,
	[PlanName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Duration] [int] NOT NULL,
	[CreatedAt] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PlanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFavorites]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFavorites](
	[FavoriteID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[MovieID] [int] NOT NULL,
 CONSTRAINT [PK__UserFavo__CE74FAF53B3A6860] PRIMARY KEY CLUSTERED 
(
	[FavoriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRefreshToken]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRefreshToken](
	[Id] [uniqueidentifier] NOT NULL,
	[Token] [nvarchar](200) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[ExpiresAt] [datetime] NULL,
	[Revoked] [bit] NULL,
	[UserId] [nvarchar](450) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchHistory]    Script Date: 5/10/2025 4:07:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[MovieID] [int] NOT NULL,
	[WatchedAt] [datetime] NULL,
	[Progress] [int] NOT NULL,
 CONSTRAINT [PK__WatchHis__4D7B4ADDB0BD44E8] PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241209150533_AddIdentityAuthentication', N'8.0.11')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'78855c59-8f54-4743-b2a2-e8210e1aa95f', N'User', N'USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'bc822af5-5e01-427d-9ea7-59db14a78543', N'Manager', N'MANAGER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'cbce5bd7-52aa-4fab-aa7d-6e4ad01941c9', N'Staff', N'STAFF', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'26b6cecc-c555-4535-8450-0f3acc00216b', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3d9fba72-035c-4510-8d9c-57651f727e2b', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6169bf4d-7542-4ee9-acbb-136bebedf019', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'79aebce5-a6de-415e-bfaf-a903d714a05a', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a24f5267-6e6b-4569-b77c-2ff867db827e', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e9d362f2-799f-4eb4-b062-72514ebd3b13', N'78855c59-8f54-4743-b2a2-e8210e1aa95f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'bc822af5-5e01-427d-9ea7-59db14a78543')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'040c3da1-8d1d-418c-8381-28d289fd4611', N'cbce5bd7-52aa-4fab-aa7d-6e4ad01941c9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'16dfb1a7-51cb-4c28-8e72-e96ed6f1617d', N'cbce5bd7-52aa-4fab-aa7d-6e4ad01941c9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'28e1aef4-7a8a-40f3-a0f5-fd3e325d0726', N'cbce5bd7-52aa-4fab-aa7d-6e4ad01941c9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'97f4dc40-b9b7-45d1-97db-9dfef58351e8', N'cbce5bd7-52aa-4fab-aa7d-6e4ad01941c9')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Thanh Thanh', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/HR-staff-al-gi-2.jpg?alt=media&token=0cfc3343-b4c4-49fd-b261-7dc7e2da776f', NULL, CAST(N'2024-12-31T15:41:56.0825074' AS DateTime2), 1, NULL, NULL, N'thanh1212@gmail.com', N'THANH1212@GMAIL.COM', N'thanh1212@gmail.com', N'THANH1212@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAELyMP07ixjno2B/ajSKuNHKfqxAG5n8OOxhAbeveNKWRddBbbAu8k7JgrleJsjn1PA==', N'XAMH7YBXF4VOB2DZE74AX4HABPJSXCHD', N'8ed1724d-303e-411d-9aa8-b49bcc9464ba', N'0933445567', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', N'Huynh Nhat Huy (K18 HCM)', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/channels4_profile.jpg?alt=media&token=b7651a9d-319e-4d7e-a20c-1084d32c604f', NULL, CAST(N'2025-01-10T14:06:47.9736858' AS DateTime2), 1, NULL, NULL, N'huyhnse183498@fpt.edu.vn', N'HUYHNSE183498@FPT.EDU.VN', N'huyhnse183498@fpt.edu.vn', N'HUYHNSE183498@FPT.EDU.VN', 0, N'AQAAAAIAAYagAAAAEA7JiDmp1bYgvBV8tp8h9V/MGF+zd6hzAya5RpCq3/eMhSpD86uiPIXZRR7CW9wCPg==', N'NHZT5BS5DD42DL5UUR7USDSPCETK3NWW', N'27afb5ff-ea77-4628-ab1d-9860413c0480', N'0982101494', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'16dfb1a7-51cb-4c28-8e72-e96ed6f1617d', N'Huynh Nhat Huy 12', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/hinh-anh-avatar-nam-chibi.jpg?alt=media&token=db8cac67-7bba-4086-9152-d3b0018addac', NULL, CAST(N'2024-12-24T13:54:07.1724057' AS DateTime2), 1, NULL, NULL, N'huy1234@gmail.com', N'HUY1234@GMAIL.COM', N'huy1234@gmail.com', N'HUY1234@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEC9FEjHd05V/q/uC2PRkv/cvVItdn/8f0yWyD1DSLOQnFowGCnytsuZBeK6Dy0/+uw==', N'CUBWQDCULKU37EU4XA5I2S3DIZCHYJTC', N'e0d37f6b-aba0-4c7b-be51-f5d8b72c160b', N'0939378310', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'26b6cecc-c555-4535-8450-0f3acc00216b', N'Nguyen Tran Dinh Huy', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/242185eaef43192fc3f9646932fe3b46.jpg?alt=media&token=c6e036f1-06e1-4afb-a90c-f32d3bbe18cb', NULL, CAST(N'2025-03-30T21:00:07.5027159' AS DateTime2), 1, NULL, NULL, N'abc1234@gmail.com', N'ABC1234@GMAIL.COM', N'abc1234@gmail.com', N'ABC1234@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEDlrLjbtM4MpCtJyEOAqFJ8Uz12lCXlbyFpKErApnZFTeZfUQbHRV4SDQjQua0FQ5g==', N'WSG6VMFPKFWWP67MIP7OVQKKLDDPVGMZ', N'000b1ce0-af53-44c5-91f1-4d6ad18c4acf', N'0987555666', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'28e1aef4-7a8a-40f3-a0f5-fd3e325d0726', N'Nguyen Minh Anh', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/images%20(1).jpg?alt=media&token=85f61133-3e97-4665-a615-f42c6fb40f86', NULL, CAST(N'2025-03-30T21:12:16.0275152' AS DateTime2), 1, NULL, NULL, N'minhanh123@gmail.com', N'MINHANH123@GMAIL.COM', N'minhanh123@gmail.com', N'MINHANH123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKFQw9jxzfjHu3gNPFoRKDOGaK4Mbbu17+u5f1fCgBY0dz4PwVd71JvTff9hLKTTug==', N'KDCBAUM3GEARW5WQWFYNNRBU3IPFVSIR', N'6e6301d3-9ec8-46fb-891e-b96102e6fa91', N'0896667808', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'3d9fba72-035c-4510-8d9c-57651f727e2b', N'Tuan Minh', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/3fe74de5e4bdf7aa12e152736bc8faa9.jpg?alt=media&token=fc39f52b-8799-48df-8d90-876b77b34715', NULL, CAST(N'2025-04-08T11:16:18.5123038' AS DateTime2), 1, NULL, NULL, N'tuanminh123@gmail.com', N'TUANMINH123@GMAIL.COM', N'tuanminh123@gmail.com', N'TUANMINH123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEJCJV0XhXpyUYUwG6TJLh5mJ9mz6gu0YzHYHuurx9SPn+PwpLNdInFewNtcqFP/TKQ==', N'ZADUMUEZ6W7QCUHFGUZQAZJLHMA24LPN', N'f424b25a-2166-4298-8ae6-099a5a9d8eb8', N'0912345678', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Khanh Minh', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/general-manger.png?alt=media&token=b9e3bedb-ebfb-46a9-9b73-0088c9cffaf9', NULL, CAST(N'2025-01-12T14:46:21.1750985' AS DateTime2), 1, NULL, NULL, N'minh0412@gmail.com', N'MINH0412@GMAIL.COM', N'minh0412@gmail.com', N'MINH0412@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEAAIzrVhx6O5c3+ypGBKZQkztbzxnIamS3RJ2yw/oh4vKIh2f5FiYF50qdw2VXHKwg==', N'GHRAQQGI4TRAJLJANHBIAFUXRNIXEEQ5', N'd63ac533-9ad1-47e7-abf1-93bc9a7cf899', N'0966666889', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'6169bf4d-7542-4ee9-acbb-136bebedf019', N'Ngoc Hau', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/949b8d8d9229693ba9d53b054b738e2a.jpg?alt=media&token=9280fd55-49e9-4328-b256-f2b3c82c5893', NULL, CAST(N'2025-04-14T19:03:53.1050264' AS DateTime2), 1, NULL, NULL, N'hau1109@gmail.com', N'HAU1109@GMAIL.COM', N'hau1109@gmail.com', N'HAU1109@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAED0KwxzRXPE7u973LYK2qfgzQHDasfLRv0jLHnR8Q/tuyd8/HB7OOxybqhyNEDfMhg==', N'QD5MV6VLXTKER23BBYKBAPN6EQFTW6ZC', N'53f505ce-9fc6-4db0-abd1-2038f0dd25cf', N'0987654321', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', N'Huynh Nhat Huy', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/photo-1-1498758176544.png?alt=media&token=44578b07-43c7-450a-8e70-2b5af643f0a5', NULL, CAST(N'2024-12-31T16:17:18.0719834' AS DateTime2), 1, NULL, NULL, N'huy260704@gmail.com', N'HUY260704@GMAIL.COM', N'huy260704@gmail.com', N'HUY260704@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEH36EvsB++VPZjTRJw3DwmjkaTkF6zb1Wy09TKb4x7syiy0f7Nxmv6yLWpvJeSMHtw==', N'UEDAXSDVEFVH4CJRGFENQFPXTRYZK5YQ', N'5b235d17-ed53-428f-b6e9-6b497c212437', N'0939378310', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', N'Khuu Thanh Tai', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/dcc4eb3e52a85452de8923689301df98.jpg?alt=media&token=86593bfc-8ca3-41aa-80a4-969fc4805d0b', NULL, CAST(N'2025-03-30T20:56:58.8922931' AS DateTime2), 1, NULL, NULL, N'abc123@gmail.com', N'ABC123@GMAIL.COM', N'abc123@gmail.com', N'ABC123@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEItOuiZcJMQ02FAkDSh4v99bG6ScSfjMoLAUJEC11Koa3DHCscoWfQP92PMcjNXtlg==', N'GXK7HY3XZNZ2XTSUZO3CRCNM27TVRD5I', N'cf6ca625-a8f6-485c-877e-a9b01cd49d62', N'0387242738', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'79aebce5-a6de-415e-bfaf-a903d714a05a', N'Nguyen Hai Tu', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/images%20(1).jpg?alt=media&token=0986ce24-9c4b-47e7-b055-b075a0c71df4', NULL, CAST(N'2025-05-09T13:23:36.0187536' AS DateTime2), 1, NULL, NULL, N'haitu1234@gmail.com', N'HAITU1234@GMAIL.COM', N'haitu1234@gmail.com', N'HAITU1234@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEHydEwDvBarx43Oez54iKruld7z2/aUAnqhwcSORbIHVSlFOP9bRQh/TOCVSq5eD1Q==', N'UXUTSOL2KLYGL2ECLPTFRQPDCPHJT24S', N'4a27cc10-c3b8-4770-aa98-56148e77dc85', N'0123456789', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', N'Nguyen Tran Dinh Huy 12', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/images%20(2).jpg?alt=media&token=7bffbfca-1a0e-4f49-b179-37b2e6966b15', NULL, CAST(N'2025-04-14T19:04:42.3153609' AS DateTime2), 1, NULL, NULL, N'abc12345@gmail.com', N'ABC12345@GMAIL.COM', N'abc12345@gmail.com', N'ABC12345@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEC0mUX6Dm/4qf7johK30y4zM3EouMaLUIfy/Ah1tVu5PaxkNDFMm1zPMXutkEl/Dbw==', N'BI6I6NOFIGWPPTBZED6OJONB2YNORSY3', N'593da074-41c3-494f-842c-03d17e876a2d', N'0987555666', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'97f4dc40-b9b7-45d1-97db-9dfef58351e8', N'Nguyen Hong Thu', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/hinh-anh-avatar-facebook-em-be-de-thuong.jpg?alt=media&token=53831dcb-3178-4ad2-9bfc-179890399efd', NULL, CAST(N'2025-05-08T14:51:29.5928743' AS DateTime2), 1, NULL, NULL, N'hongthu6262@gmail.com', N'HONGTHU6262@GMAIL.COM', N'hongthu6262@gmail.com', N'HONGTHU6262@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEIUUH8J030TfZQTMIP4fuh1ErN2cNrEzc5J7UrqO9XY69imfDas3VdNWzv9agG0ndg==', N'KK2QUBLHXFJSGA6LRAA6326CCHMDOP5F', N'776bee74-fe29-4b6e-8950-4a995e225a4c', N'0123456789', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'a24f5267-6e6b-4569-b77c-2ff867db827e', N'Ta Quy Minh', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/images.jpg?alt=media&token=016f4927-02d3-4e7c-a5c9-b34e963b7086', NULL, CAST(N'2024-12-31T15:56:11.1862290' AS DateTime2), 1, NULL, NULL, N'taquyminh0702@gmail.com', N'TAQUYMINH0702@GMAIL.COM', N'taquyminh0702@gmail.com', N'TAQUYMINH0702@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBB17YriWinrdDx8bMXkTKpKIqsH603wpkGWfsPH44+pgy5N8KIwY30zlhaBBs0nbQ==', N'2W2E2YOGGLNM5R6VBWI2LVN53MJSWXF3', N'61e3c25a-b584-4f9d-8890-91275c56c860', N'0911676664', 0, 0, NULL, 1, 0, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [ProfilePicture], [Balance], [CreatedAt], [Status], [OtpCode], [OtpExpiration], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [ViolationCount], [AccountLockUntil]) VALUES (N'e9d362f2-799f-4eb4-b062-72514ebd3b13', N'Minh Trieu', N'https://firebasestorage.googleapis.com/v0/b/movie-management-9c882.appspot.com/o/0d6f4b8d02f3b3b5b9f3ac12002b5f0d-29-10-19-16.jpg?alt=media&token=dcd502ad-0ba4-4ae2-95ea-60647757ea54', NULL, CAST(N'2025-04-14T19:02:28.1268502' AS DateTime2), 1, NULL, NULL, N'trieu1234@gmail.com', N'TRIEU1234@GMAIL.COM', N'trieu1234@gmail.com', N'TRIEU1234@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEIr1Ldo2m9gHESHm5WFflcdaImLGDVqd0wVxNWAlht4qW8Ed+AEWVUxsIF5DALc60A==', N'ZSK6ALKSZFNCR5ZREGYLWAWNJSMFGTLU', N'aaebf631-a2d4-4c9c-b0d7-9fd930aa3297', N'0987654321', 0, 0, NULL, 1, 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, N'Tenet là một bom tấn được thả vào các rạp chiếu phim hay 2020 sau gần 6 tháng bị ngưng trệ do ảnh hưởng của dịch bệnh Covid-19. Tuy nhiên đây có lẽ không phải là một bộ phim thích hợp để xem một mình vì phim chứa nhiều thông tin cũng như nhiều học thuyết xoắn não nên sẽ thật tuyệt nếu chúng ta đi cùng bạn bè.', CAST(N'2025-01-01T11:43:07.933' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (2, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 104, N'Phim cũng dành cho những ai thực sự thích cách làm phim của Nolan cũng như thích những câu chuyện được lồng yếu tố khoa học tràn đầy sự “hack não” trong kịch bản mà Nolan viết lên.', CAST(N'2025-01-01T11:44:08.527' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (13, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, N'Bối cảnh phim được đầu tư hoành tráng, chân thật nhờ nguyên tắc hạn chế kỹ xảo của đạo diễn. Các cảnh hành động, chiến đấu lạ mắt khi được xây dựng theo giả thuyết đảo nghịch thời gian.', CAST(N'2025-01-01T20:52:33.483' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (15, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, N'Tenet quá khó hiểu, kể cả khi fan của Christopher Nolan vốn đã quen với lối làm phim phức tạp của ông. Giống những dự án trước, đạo diễn người Anh dành nhiều thời gian để giải thích "đảo nghịch thời gian" trên màn ảnh. Ông đưa ra nhiều khái niệm và giả thuyết khoa học. Tuy nhiên, càng về cuối, khán giả càng khó nắm bắt mạch truyện và những khái niệm được nêu trước đó.', CAST(N'2025-01-01T20:57:06.717' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (16, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, N'Phim dở không hấp dẫn', CAST(N'2025-01-01T20:58:01.423' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (17, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, N'Phim tạm ổn', CAST(N'2025-01-01T20:59:23.217' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (18, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, N'Phim dở', CAST(N'2025-01-01T21:00:05.950' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (19, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, N'Phim tạm được. Kịch bản hay', CAST(N'2025-01-01T21:01:02.590' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (23, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, N'Lật mặt là sự đầu tư những cảnh quay, góc quay đẹp ở núi rừng Tây Nguyên và các pha rượt đuổi ngoạn mục trên đường phố, mái nhà, trong rừng sâu hay cảnh lao xe xuống vực đầy mạo hiểm. ', CAST(N'2025-01-01T21:11:08.657' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (24, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, N'Nội dung Mắt biếc ít kịch tính, diễn biến đơn giản, nhiều đoạn trong phim gây cảm giác lê thê. Khán giả, dù biết trước nội dung qua truyện gốc hay chưa, đều phải kiên nhẫn để vượt qua những đoạn này.', CAST(N'2025-01-01T21:15:32.460' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (25, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, N'Về cơ bản, đây là một bộ phim hay, đáng để xem và suy ngẫm. Tuy nhiên, ở phân cảnh sau khi nghe bạn trai nói mẹ đã mất thì nên để nhân vật Vy nghĩ về mẹ và những kỷ niệm đẹp, hạnh phúc giữa cô với mẹ hơn là tuôn ra những cảnh phim ghi lại khoảnh khắc yêu đương của cặp đôi. Nếu như thế, phim sẽ trọn vẹn hơn về mặt cảm xúc', CAST(N'2025-01-01T21:18:09.163' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (26, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, N'Phim "Contagion of Fear" là một bộ phim giả tưởng (hoặc một dự án trong trí tưởng tượng của bạn) mà tôi chưa có thông tin cụ thể. Tuy nhiên, dựa trên tiêu đề, có thể đây là một bộ phim liên quan đến chủ đề đại dịch, sự lây lan của một loại virus hoặc mối đe dọa toàn cầu, kết hợp yếu tố tâm lý và kinh dị.', CAST(N'2025-01-01T21:46:26.817' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (27, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, N'Thường các phim về đại dịch mang thông điệp nhân văn, nhấn mạnh tầm quan trọng của đoàn kết, khoa học và sự hy sinh cá nhân vì lợi ích chung.', CAST(N'2025-01-01T21:47:19.750' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (28, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 102, N'Bộ phim phù hợp với những ai tìm kiếm một câu chuyện tình yêu lạ lẫm, nhưng không dành cho người kỳ vọng một tác phẩm nghệ thuật sâu sắc hoặc mang thông điệp tích cực.', CAST(N'2025-01-01T21:48:28.723' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (29, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, N'Đây là một trong những bộ phim xuất sắc nhất của MCU, không chỉ vì giá trị giải trí mà còn vì ý nghĩa văn hóa và xã hội mà nó mang lại. Bộ phim đã ghi dấu ấn sâu đậm nhờ vào cốt truyện giàu cảm xúc, nhân vật phản diện đáng nhớ, và sự đầu tư vào bối cảnh văn hóa châu Phi.', CAST(N'2025-01-01T21:50:21.890' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (30, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, N'Một số cảnh chiến đấu, đặc biệt là ở đoạn cuối giữa T’Challa và Killmonger, bị nhận xét là chưa thực sự mượt mà, với hiệu ứng CGI chưa đạt kỳ vọng so với tiêu chuẩn của Marvel. Nhưng nhìn chung thì bộ phim này ở mức tốt', CAST(N'2025-01-01T21:51:26.703' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (31, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, N'Nếu bạn yêu thích những bộ phim chiến tranh với phong cách kể chuyện độc đáo, 1917 là một tác phẩm không thể bỏ qua. Phim không chỉ để giải trí mà còn để chiêm nghiệm về sự khốc liệt của chiến tranh và lòng quả cảm trong những hoàn cảnh khó khăn nhất.', CAST(N'2025-01-01T21:52:28.003' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (32, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, N'George MacKay (vai Schofield) mang đến một màn trình diễn xuất sắc, truyền tải được sự mệt mỏi, căng thẳng và quyết tâm trong hành trình đầy thử thách. Dean-Charles Chapman (vai Blake) cũng để lại ấn tượng sâu sắc với sự chân thật và cảm xúc trong vai diễn.', CAST(N'2025-01-01T21:53:22.560' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (33, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, N'Dàn diễn viên, bao gồm Song Kang-ho (ông Kim), Choi Woo-sik (Ki-woo), Park So-dam (Ki-jung) và Lee Sun-kyun (ông Park), mang đến những màn trình diễn tuyệt vời, thể hiện rõ nét từng khía cạnh của nhân vật. Các nhân vật được xây dựng với chiều sâu, từ gia đình họ Kim khôn khéo nhưng bất lực trước xã hội, đến gia đình họ Park giàu có nhưng ngây thơ.', CAST(N'2025-01-01T21:54:09.783' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (34, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, N'Bộ phim đi sâu vào vấn đề bất bình đẳng xã hội, sự phân cách giữa tầng lớp giàu và nghèo, cùng cách mà hệ thống xã hội "ký sinh" lẫn nhau. Bong Joon-ho sử dụng những chi tiết mang tính biểu tượng (như cầu thang, mùi hương, hay tầng hầm) để làm nổi bật sự phân hóa giữa các tầng lớp.', CAST(N'2025-01-01T21:54:42.017' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (35, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, N'Bộ phim tôn vinh sự bình đẳng giới, lòng dũng cảm và giá trị của bản thân. Đây là một trong những bộ phim Disney đầu tiên phá vỡ khuôn mẫu "công chúa cần được giải cứu". Mulan không chỉ là một nữ anh hùng mà còn là hình mẫu truyền cảm hứng về sự độc lập và quyết tâm.', CAST(N'2025-01-01T21:55:20.080' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (36, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, N'Lưu Diệc Phi trong vai Mulan đã cố gắng thể hiện một hình ảnh dũng cảm và mạnh mẽ, mặc dù diễn xuất vẫn còn hạn chế.', CAST(N'2025-01-01T21:55:57.470' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (37, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, N'Live-action đã loại bỏ các yếu tố tưởng tượng như Mushu để tập trung vào các giá trị truyền thống của Trung Quốc, nhấn mạnh vào tinh thần hiếu thảo và nghĩa vụ với quốc gia.', CAST(N'2025-01-01T21:56:29.037' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (38, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 97, N'Dirty Angel mang đến một câu chuyện đầy kịch tính và những tình huống gay cấn. Mối quan hệ phức tạp giữa các nhân vật chính và thứ bậc trong cuộc chiến tội phạm tạo ra những cú xoay chuyển bất ngờ, khiến người xem không thể rời mắt khỏi màn hình.', CAST(N'2025-01-01T21:57:18.183' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (39, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 97, N'Một số diễn biến trong phim có thể làm người xem cảm thấy khó tin, nhất là trong cách giải quyết các mối quan hệ và tình huống. Một số nhân vật phụ chưa được phát triển đầy đủ, khiến cho một vài yếu tố trong câu chuyện không đạt được sự tương tác cần thiết.', CAST(N'2025-01-01T21:57:40.577' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (40, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, N'Jensen Ackles đã mang đến một màn trình diễn đầy sức hút và lôi cuốn trong vai Soldier Boy, thể hiện một hình mẫu siêu anh hùng bị vỡ mộng và giận dữ. Màn trình diễn này được đánh giá cao bởi khả năng khắc họa sâu sắc những xung đột nội tâm của nhân vật.', CAST(N'2025-01-01T21:58:37.713' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (41, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, N'Soldier Boy không phải là một nhân vật dễ đồng cảm. Hành động cực đoan của anh ta, đôi khi mang tính bạo lực và tàn nhẫn, có thể khiến một số khán giả khó tiếp cận hoặc cảm thấy không hài lòng. Tuy nhiên, đây là một lựa chọn có chủ đích để phản ánh sự tối tăm trong vũ trụ của The Boys.', CAST(N'2025-01-01T21:58:57.103' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (42, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, N'Các cảnh hành động với Soldier Boy đầy kịch tính và gay cấn, đặc biệt là khi anh ta đối đầu với các nhân vật chính trong phim. Những màn đấu tranh không chỉ dựa vào sức mạnh mà còn là sự đấu trí, tạo ra những giây phút căng thẳng.', CAST(N'2025-01-01T21:59:07.033' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (43, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, N'Chạy đi rồi tính có một cốt truyện gây cười nhưng cũng đầy kịch tính, tạo nên một sự kết hợp vừa hợp lý lại vừa bất ngờ giữa các yếu tố hành động và hài hước. Phim không chỉ mang đến tiếng cười mà còn làm khán giả phải suy nghĩ về những tình huống trớ trêu trong cuộc sống.', CAST(N'2025-01-01T21:59:54.477' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (44, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, N'Phim có những cảnh hành động được dàn dựng khá thú vị, không quá phức tạp nhưng đủ để tạo ra những giây phút kịch tính. Những cảnh quay hài hước cũng được thực hiện một cách sáng tạo và hợp lý, khiến người xem cảm thấy thú vị.', CAST(N'2025-01-01T22:00:08.890' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (45, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, N'Một số yếu tố hài hước trong phim có thể không phù hợp với tất cả khán giả, vì chúng có phần hơi "kỳ quái" và có thể tạo ra sự khó chịu cho một số người không thích thể loại hài "quá đà".', CAST(N'2025-01-01T22:00:25.873' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (46, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, N'Trường Giang và Nhã Phương là hai diễn viên có sức hút lớn với khán giả. Trường Giang mang đến một hình tượng tài xế taxi đáng yêu, với sự ngây ngô, hài hước nhưng cũng rất chân thật. Trong khi đó, Nhã Phương thể hiện một vai diễn nhẹ nhàng, tinh tế và lãng mạn. Cả hai diễn viên đã tạo nên một cặp đôi ăn ý, khiến người xem cảm thấy dễ chịu và gần gũi.', CAST(N'2025-01-01T22:01:18.437' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (47, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, N'Nhạc nền của phim khá nhẹ nhàng và phù hợp với không khí tình cảm mà bộ phim muốn truyền tải. Những bài hát và giai điệu trong phim góp phần làm tăng sự lãng mạn và cảm xúc cho các cảnh quay.', CAST(N'2025-01-01T22:01:33.290' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (48, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, N'Dù phim có tính giải trí cao, nhưng một số tình huống trong phim có phần thiếu logic hoặc không thực tế, đặc biệt là khi các nhân vật liên tục rơi vào các tình huống ngẫu nhiên mà không thực sự tạo nên sự bất ngờ cho khán giả.', CAST(N'2025-01-01T22:01:47.133' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (49, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, N'Kẻ Án Hồn có một cốt truyện khá đặc sắc với những tình tiết gay cấn và những pha xoay chuyển bất ngờ. Bộ phim khai thác yếu tố tâm lý và hình sự, giữ người xem luôn trong trạng thái hồi hộp. Các vụ án không chỉ đơn giản là việc giải quyết tội phạm mà còn có sự liên kết chặt chẽ với các mối quan hệ cá nhân và quá khứ của các nhân vật.', CAST(N'2025-01-01T22:02:36.853' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (50, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, N'Một số nhân vật phụ trong phim chưa được khai thác đầy đủ, làm cho họ trở nên mờ nhạt và thiếu sự nổi bật trong câu chuyện. Điều này làm giảm phần nào sự hấp dẫn của bộ phim, đặc biệt khi các nhân vật này có thể đóng vai trò quan trọng hơn trong việc giải quyết các tình huống.', CAST(N'2025-01-01T22:02:58.983' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (51, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, N'Phim không chỉ tập trung vào các vụ án mà còn khai thác sâu vào tâm lý nhân vật, đặc biệt là nhân vật chính Thảo. Khán giả có thể cảm nhận được sự đấu tranh nội tâm của cô và những gì cô phải đối mặt trong quá trình điều tra. Điều này giúp phim trở nên sâu sắc và không chỉ là một bộ phim hình sự đơn thuần.', CAST(N'2025-01-01T22:03:14.270' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (52, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, N'Trấn Thành là điểm sáng trong phim, với khả năng diễn hài và cảm xúc xuất sắc. Anh thể hiện tốt vai một người đàn ông phải đối mặt với ba người vợ, tạo ra nhiều tình huống dở khóc dở cười', CAST(N'2025-01-01T22:03:55.073' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (53, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, N'Bộ phim mang đến những tình huống rất hài hước, chủ yếu xoay quanh những tình cảm rối ren và phức tạp trong gia đình. Các tình huống này được xây dựng theo cách tự nhiên và dễ tiếp cận, khiến người xem cảm thấy thoải mái và thư giãn.', CAST(N'2025-01-01T22:04:08.770' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (54, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, N'Nhạc nền trong phim khá dễ nghe và phù hợp với các tình huống, làm tăng thêm sự hài hước hoặc cảm xúc của mỗi cảnh quay.', CAST(N'2025-01-01T22:04:20.933' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (55, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, N'Phim khắc họa cuộc sống của những người trẻ tuổi đầy hoài bão nhưng cũng phải đối mặt với những khó khăn, thử thách trong cuộc sống và tình yêu.', CAST(N'2025-01-01T22:05:34.463' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (56, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, N'Mặc dù có một cốt truyện tình cảm sâu sắc, nhưng một số tình tiết trong phim có phần dễ đoán và thiếu kịch tính. Điều này có thể khiến một số khán giả cảm thấy nhàm chán, đặc biệt là những ai yêu thích các bộ phim có yếu tố gây cấn.', CAST(N'2025-01-01T22:05:58.467' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (57, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, N'Bộ phim mang đến những tình huống hài hước đầy bất ngờ, khi các nhân vật chính phải đối diện với những tình huống khó xử, đôi khi là những tình huống ngớ ngẩn nhưng lại rất gần gũi. ', CAST(N'2025-01-01T22:06:37.197' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (58, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, N'Ngoài yếu tố giải trí, phim cũng lồng ghép một số thông điệp về sự tự do, độc lập, và khả năng đấu tranh của người phụ nữ trong xã hội hiện đại. Các vấn đề về quyền lực, tài chính và sự đối đầu trong giới doanh nhân được phản ánh một cách sắc nét.', CAST(N'2025-01-01T22:06:58.263' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (59, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, N'Bộ phim rất mạnh về mặt tạo dựng không khí, với những tình huống siêu nhiên, âm u và đầy kịch tính. Phim sử dụng các hiệu ứng âm thanh và hình ảnh rất tốt để tạo nên cảm giác hồi hộp, căng thẳng và đầy sự ám ảnh cho người xem.', CAST(N'2025-01-01T22:08:02.863' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (60, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, N'Các diễn viên phụ cũng hoàn thành tốt vai trò của mình, đóng góp vào việc xây dựng sự hấp dẫn cho câu chuyện.', CAST(N'2025-01-01T22:08:21.040' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (61, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, N'Các nhân vật phụ trong phim chưa được khai thác đầy đủ, khiến cho mối quan hệ giữa họ và nhân vật chính có phần nông và chưa thực sự gây được ấn tượng mạnh.', CAST(N'2025-01-01T22:08:43.913' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (62, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, N'Bộ phim tạo dựng rất tốt bầu không khí đáng sợ, với những tình huống siêu nhiên, những hồn ma và hiện tượng kỳ quái. Cảnh quay tối tăm, âm thanh ma mị và các hiệu ứng đặc biệt khiến người xem luôn trong trạng thái căng thẳng, hồi hộp.', CAST(N'2025-01-01T22:09:23.967' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (63, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, N'Bộ phim có một cốt truyện khá hấp dẫn với sự kết hợp giữa yếu tố tâm linh và những tình huống đầy bí ẩn. Việc những học sinh khám phá ra các sự kiện kỳ lạ, sau đó phải tìm cách đối mặt với chúng, tạo ra một câu chuyện thú vị và đầy tính kịch tính.', CAST(N'2025-01-01T22:09:35.000' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (64, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, N'Cốt truyện đơn giản nhưng rất dễ hiểu và lôi cuốn. Mặc dù không có nhiều yếu tố phức tạp, nhưng bộ phim lại gây ấn tượng nhờ vào sự kết hợp giữa những tình huống dở khóc dở cười và các mưu mô lừa đảo. Sự đối đầu giữa một kẻ lừa đảo tinh ranh và một cô gái "lầy" tạo nên những tình huống thú vị và đầy bất ngờ.', CAST(N'2025-01-01T22:10:45.177' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (65, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, N'Bên cạnh yếu tố giải trí, phim cũng mang đến một thông điệp nhẹ nhàng về tình bạn và sự chân thành. Dù cả hai nhân vật chính đều có những tính cách có phần tiêu cực, nhưng qua quá trình đối mặt và gắn bó với nhau, họ dần nhận ra giá trị của sự chân thành và sự giúp đỡ lẫn nhau.', CAST(N'2025-01-01T22:10:55.353' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (66, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, N'Siêu Lừa Gặp Siêu Lầy là một bộ phim hài Việt Nam khá nhẹ nhàng và giải trí. Mặc dù cốt truyện đơn giản và dễ đoán, nhưng sự kết hợp giữa các tình huống hài hước, diễn xuất duyên dáng của các diễn viên chính, và thông điệp về tình bạn và sự chân thành khiến phim trở thành một lựa chọn thú vị cho những ai tìm kiếm một bộ phim hài dễ xem, vui nhộn.', CAST(N'2025-01-01T22:11:15.147' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (67, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, N'Những nhân vật trong phim đều có mục đích riêng, họ tìm mọi cách để leo lên, bao gồm cả việc sử dụng các thủ đoạn, lừa đảo và chiến lược "dưới bàn" để đạt được lợi ích cá nhân. Tuy nhiên, với sự thông minh và sắc sảo của một số nhân vật, bộ phim đã khéo léo lồng ghép những tình huống trớ trêu và những màn đối đầu đầy hài hước.', CAST(N'2025-01-01T22:11:54.927' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (68, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, N'Dàn diễn viên trong phim thể hiện khá tốt vai diễn của mình, đặc biệt là sự khéo léo trong việc tạo ra những tình huống hài hước, nhưng không quá phô trương. Họ đã lột tả tốt sự ranh mãnh và lém lỉnh của nhân vật mà không làm mất đi yếu tố giải trí.', CAST(N'2025-01-01T22:12:08.910' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (69, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, N'Mặc dù phim có những tình huống hài hước và các nhân vật chính khá thú vị, nhưng một số nhân vật phụ chưa được phát triển đầy đủ. Điều này khiến mối quan hệ giữa các nhân vật chưa thực sự có chiều sâu, làm giảm đi sự hấp dẫn của một số tình huống.', CAST(N'2025-01-01T22:12:37.353' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (70, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, N'Inception is widely praised for its original concept of dream manipulation and its creative approach to storytelling. The idea of constructing and navigating multiple dream levels is fascinating and executed in a way that keeps the audience engaged and challenge', CAST(N'2025-01-01T22:13:21.057' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (71, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, N'Hans Zimmer''s score is haunting and unforgettable, with the iconic "Time" track serving as a central theme. The music enhances the emotional intensity of the film and complements its dreamlike atmosphere.', CAST(N'2025-01-01T22:13:29.053' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (72, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, N'While Cobb''s character is well-developed, some of the supporting characters, such as Ariadne, Arthur, and Eames, are not given as much depth. They serve their roles in the heist but don''t explore their backstories or motivations in great detail.', CAST(N'2025-01-01T22:13:38.647' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (73, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, N'The film''s cinematography by Linus Sandgren is breathtaking, featuring vibrant colors, sweeping camera movements, and unforgettable sequences. The famous opening number on the freeway, along with many other iconic scenes, highlights the film''s visual splendor. The film beautifully captures Los Angeles and its energy, adding to the dream-like quality of the story.', CAST(N'2025-01-01T22:14:11.560' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (74, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, N'La La Land is a love letter to the pursuit of dreams, but it also acknowledges the sacrifices that come with it. The film portrays the tension between love and ambition, as Sebastian and Mia grapple with their personal desires and the demands of their careers.', CAST(N'2025-01-01T22:14:29.297' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (75, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, N'The action in Mission: Impossible – Fallout is nothing short of breathtaking. Tom Cruise''s commitment to performing his own stunts brings an authenticity and excitement to the film. Highlights include a thrilling helicopter chase, a skydiving sequence, and an intense fistfight in a bathroom. The physicality and choreography of these stunts are meticulously crafted, making the film one of the most thrilling in the franchise.', CAST(N'2025-01-01T22:16:20.443' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (76, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, N'Tom Cruise once again delivers a strong performance as Ethan Hunt, showing both vulnerability and determination. His ability to perform high-intensity stunts and maintain emotional depth in his character is a key factor in the film''s success. His commitment to the role is evident in the daring stunts he performs, such as hanging from a helicopter in mid-air.', CAST(N'2025-01-01T22:16:28.183' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (77, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, N'Christopher McQuarrie, who also wrote the screenplay, directs Mission: Impossible – Fallout with precision, ensuring that each action sequence serves the story while maintaining tension and excitement. The cinematography is top-notch, capturing the grandeur of the action while emphasizing the intensity of the personal conflicts.', CAST(N'2025-01-01T22:16:40.700' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (78, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, N'The film has a runtime of nearly three hours, and while much of it is engaging, some viewers may feel the pacing lags in certain stretches. The film is deliberately slow and introspective at times, which may feel drawn-out for those expecting a more action-packed experience. A more focused edit could have tightened the pacing without losing the emotional depth.', CAST(N'2025-01-01T22:17:37.360' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (79, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, N'The Batman delves into themes of corruption, both in the city of Gotham and within Bruce Wayne’s own family. The film explores the consequences of inherited legacies, the impact of privilege, and the importance of breaking cycles of corruption. Batman''s evolution throughout the film from vengeance-driven vigilante to a symbol of hope reflects his growing understanding of his purpose in Gotham.', CAST(N'2025-01-01T22:17:47.247' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (80, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, N'Greig Fraser''s cinematography is a standout feature of the film. The use of shadows, dim lighting, and rain-soaked streets contributes to the film’s moody, noir atmosphere. The visual style mirrors the film''s dark themes, creating a sense of unease and tension. The action sequences are also well-choreographed, particularly a high-speed chase and a brutal fight sequence in the dark.', CAST(N'2025-01-01T22:17:56.167' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (81, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, N'As expected from a James Cameron film, Avatar: The Way of Water is a visual masterpiece. The underwater sequences, in particular, are breathtaking. The film uses cutting-edge technology to create photorealistic environments, making the ocean scenes feel immersive and alive. The movement and interaction with aquatic creatures are incredibly detailed, providing a sense of awe and wonder throughout the film. The lush forests, bioluminescent jungles, and alien fauna all contribute to the immersive world-building that made the first Avatar film so successful.', CAST(N'2025-01-01T22:18:29.950' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (82, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, N'Much like its predecessor, The Way of Water explores themes of environmentalism, colonization, and the need to protect the planet. The film emphasizes the deep connection between the Na''vi people and their environment, showcasing the importance of preserving natural resources and ecosystems. The destruction caused by human exploitation is a central concern in the story, adding an emotional and urgent call for environmental awareness.', CAST(N'2025-01-01T22:18:43.687' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (83, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, N'Christopher Nolan masterfully balances the complex narrative structure, weaving between different timelines and perspectives. His direction is precise, and he brings a level of intensity and urgency to the story, especially when dealing with Oppenheimer''s moral dilemmas and the weight of his decisions.', CAST(N'2025-01-01T22:19:22.803' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (84, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, N'The film does an excellent job of exploring not just the historical events surrounding the creation of the atomic bomb but also the ethical and philosophical dilemmas that Oppenheimer faced. The consequences of his work are deeply examined, particularly his later regret over the bomb’s use in Hiroshima and Nagasaki. It also touches on the broader political context of the Cold War, McCarthyism, and Oppenheimer’s eventual fall from grace.', CAST(N'2025-01-01T22:19:36.123' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (85, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, N'Margot Robbie shines as Barbie, balancing the film''s comedic, surreal tone with moments of depth and vulnerability. She brings a mix of charm and sincerity to the character, making Barbie more than just a toy icon. Robbie''s ability to convey Barbie''s internal transformation adds emotional weight to the film, as Barbie grapples with her identity and purpose.', CAST(N'2025-01-01T22:20:07.793' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (86, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, N'Dune is a visually breathtaking film, with stunning cinematography by Greig Fraser. Villeneuve''s direction and the film''s production design create an immersive and grand scale, bringing the barren desert landscapes of Arrakis to life. ', CAST(N'2025-01-01T22:20:37.813' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (87, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, N'The score by Hans Zimmer is one of the standout elements of Dune, enhancing the film’s grandeur and intensity. The music blends electronic and orchestral elements, creating a haunting and immersive soundscape that complements the visuals. The sound design also plays a crucial role in bringing the world of Dune to life, from the thundering footsteps of the sandworms to the eerie hum of the stillsuits worn by the characters.', CAST(N'2025-01-01T22:21:02.700' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (88, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, N'One of the film''s most impressive features is its jaw-dropping aerial combat scenes. The use of practical effects, including real fighter jets and onboard cameras, creates a visceral and thrilling experience for the audience. The sequences are intense, realistic, and showcase the skill and bravery of the pilots. These sequences were a major highlight of the film and were highly praised by critics and audiences alike.', CAST(N'2025-01-01T22:21:50.407' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (89, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, N'The ensemble cast, including Miles Teller as Rooster, Jennifer Connelly as Maverick’s love interest Penny Benjamin, and Jon Hamm as the by-the-book Vice Admiral Cyclone, delivers strong performances that complement Cruise’s presence. Teller in particular does a fantastic job portraying Rooster, bringing depth to his character and effectively capturing the conflict with Maverick.', CAST(N'2025-01-01T22:22:00.353' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (90, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, N'The return of classic villains like Willem Dafoe’s Green Goblin and Alfred Molina’s Doctor Octopus adds layers of nostalgia for fans of the original Spider-Man films. The villains are given more depth in this film, particularly Green Goblin, whose actions carry significant consequences for Peter. The film successfully balances these established villains with new threats, keeping the stakes high.', CAST(N'2025-01-01T22:22:49.603' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (91, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, N'The supporting characters, including Zendaya (MJ), Jacob Batalon (Ned), and Benedict Cumberbatch (Doctor Strange), are well-utilized in the story. Zendaya and Batalon provide comedic relief and emotional support for Peter, while Doctor Strange’s involvement ties the multiverse plot to the larger MCU.', CAST(N'2025-01-01T22:22:57.487' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (92, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 33, N'Frozen II boasts stunning animation and visual effects, with the depiction of the enchanted forest, the mystical elements, and Elsa''s ice powers being particularly breathtaking. The film showcases Disney''s technological advancements, with gorgeous landscapes and intricate details that enhance the magical experience.', CAST(N'2025-01-01T22:23:36.010' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (93, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, N'Joaquin Phoenix''s portrayal of Arthur Fleck/Joker is widely regarded as a career-defining performance. His ability to convey the character''s internal anguish, instability, and eventual transformation into the Joker is mesmerizing. Phoenix''s commitment to the role, including his physical transformation, has earned him numerous awards, including an Academy Award for Best Actor.', CAST(N'2025-01-01T22:24:03.223' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (94, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, N'Joker is a deeply psychological film that delves into the mental health issues faced by Arthur Fleck. The film doesn''t shy away from showing how neglect, bullying, and societal apathy can lead to the creation of a villain. The portrayal of Arthur''s struggles with his identity, societal rejection, and mental illness is nuanced and empathetic, providing a more complex understanding of the character.', CAST(N'2025-01-01T22:24:14.433' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (95, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, N'While Nala is an important character, her role in the film is somewhat limited compared to Simba’s, and her character is often overshadowed by Simba’s journey. Some critics have pointed out the lack of significant female characters in the film, especially in the context of the leadership of the Pride Lands.', CAST(N'2025-01-01T22:24:59.737' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (96, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, N'The voice acting in The Lion King is outstanding, with Matthew Broderick voicing Simba, James Earl Jones giving a powerful performance as Mufasa, and Jeremy Irons bringing menace to Scar. The voice actors give their characters depth and nuance, making the story even more engaging.', CAST(N'2025-01-01T22:25:09.163' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (97, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, N'The film’s soundtrack, composed by Hans Zimmer, is one of the most memorable and powerful in Disney history. Elton John and Tim Rice''s songs, such as "Circle of Life," "Hakuna Matata," "Can You Feel the Love Tonight," and "I Just Can''t Wait to Be King," have become timeless classics that evoke emotion and joy. The music perfectly complements the film’s emotional highs and lows.', CAST(N'2025-01-01T22:25:18.323' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (98, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, N'The characters in The Lion King are well-developed and have distinct personalities that contribute to the film''s emotional depth. Simba, Mufasa, Scar, Nala, Timon, and Pumbaa all play essential roles in the narrative, and their interactions help drive the themes of the film. The contrast between Simba’s growth and Scar’s manipulations adds tension and drama to the story.
', CAST(N'2025-01-01T22:25:28.217' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (99, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, N'The film provides satisfying arcs for multiple characters. Tony Stark/Iron Man and Steve Rogers/Captain America both experience emotional growth and resolution of their personal stories. The journey of Thor, Hulk, and other Avengers also adds depth to their characters. Black Widow''s sacrifice and Hawkeye''s redemption arc are also powerful and meaningful.', CAST(N'2025-01-01T22:25:58.483' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (100, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, N'The visual effects are stunning, particularly in the final battle, where CGI is used to create massive landscapes and characters in action. The time travel scenes and alternate timelines are visually distinct and add a fresh dimension to the MCU''s storytelling. The film also makes excellent use of lighting and color to enhance the mood and tone of key moments.', CAST(N'2025-01-01T22:26:10.123' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (101, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 29, N'Các diễn viên trong Lật Mặt 6 thể hiện khá tốt vai diễn của mình, với sự nhập vai đầy cảm xúc và chân thật. Những khoảnh khắc kịch tính, căng thẳng được thể hiện rõ ràng qua từng ánh mắt và cử chỉ, khiến người xem dễ dàng đồng cảm với nhân vật.', CAST(N'2025-01-01T22:26:58.233' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (102, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 29, N'Phim có phần nhạc nền khá ấn tượng, kết hợp cùng các cảnh quay đẹp mắt, tạo ra không khí căng thẳng và kịch tính. Những cảnh quay hành động, truy đuổi được thực hiện công phu, khiến người xem cảm thấy như đang sống trong tình huống phim.', CAST(N'2025-01-01T22:27:07.330' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (103, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 29, N'Lật Mặt 6 không thiếu các tình huống bất ngờ, đặc biệt là các diễn biến tâm lý phức tạp. Câu chuyện được xây dựng xoay quanh những quyết định khó khăn và những bước ngoặt, giữ cho người xem luôn phải chú ý và suy đoán những gì sẽ xảy ra tiếp theo.', CAST(N'2025-01-01T22:27:17.407' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (104, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 28, N'Dàn diễn viên, đặc biệt là Hứa Vĩ Văn trong vai Thiều và Hạ Anh trong vai Tấm, thể hiện rất tốt những cảm xúc và tâm lý của nhân vật. Các tình huống tình cảm được xử lý tinh tế, tạo cảm giác thật sự tự nhiên và gần gũi với người xem.', CAST(N'2025-01-01T22:27:56.203' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (105, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 28, N'Phim mang đến thông điệp về sự trưởng thành của mỗi cá nhân trong tình yêu. Những mối quan hệ trong phim không chỉ là chuyện tình yêu đơn thuần mà còn là quá trình khám phá bản thân, học cách yêu thương và chấp nhận những gì không thể thay đổi.', CAST(N'2025-01-01T22:28:05.007' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (106, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 27, N'578: Phát Dàn Của Kẻ Điên tập trung khai thác những vấn đề nhức nhối của xã hội như tham nhũng, bạo lực và sự đen tối trong hệ thống công lý. Bộ phim muốn truyền tải thông điệp về sự tha hóa của những con người trong xã hội hiện đại, đặc biệt là trong môi trường đầy rẫy những cám dỗ và những hành vi sai trái.', CAST(N'2025-01-01T22:28:51.357' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (107, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 27, N'Một số tình tiết trong phim có thể gây khó hiểu và thiếu sự kết nối chặt chẽ. Một vài pha hành động hay diễn biến câu chuyện có thể khiến người xem cảm thấy không hợp lý hoặc thiếu sự mạch lạc.', CAST(N'2025-01-01T22:29:10.423' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (108, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, N'Một số khán giả có thể cảm thấy cốt truyện của Bóng Đề thiếu sự rõ ràng và giải thích chi tiết về nguồn gốc của bóng ma. Một số tình tiết có thể khiến người xem cảm thấy rối rắm hoặc không thỏa mãn với lời giải thích.', CAST(N'2025-01-01T22:29:44.100' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (109, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, N'Cảnh quay trong phim rất sáng tạo và hấp dẫn, đặc biệt là những cảnh có yếu tố kinh dị. Âm thanh, nhạc nền được sử dụng một cách tinh tế, làm tăng cường cảm giác căng thẳng, giúp người xem dễ dàng hòa mình vào không khí của bộ phim.', CAST(N'2025-01-01T22:30:03.197' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (110, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, N'Một số tình tiết trong Dao Của Dân Ngụ Cư có thể gây khó hiểu, đặc biệt là khi có quá nhiều nhân vật và các mối quan hệ chồng chéo. ', CAST(N'2025-01-01T22:30:57.150' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (111, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, N'Câu chuyện không chỉ là về tình yêu mà còn là về quyền lực, sự chấp nhận và hy sinh trong một xã hội đầy định kiến.', CAST(N'2025-01-01T22:31:28.687' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (112, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, N'Mỗi nhân vật trong phim, dù là vợ cả, vợ hai, hay vợ ba, đều có một câu chuyện riêng biệt và được khắc họa một cách rõ nét. Điều này giúp người xem cảm nhận được những mâu thuẫn, tranh đấu trong gia đình và trong lòng mỗi nhân vật.', CAST(N'2025-01-01T22:31:46.817' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (113, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, N'Phim mang đến một cái nhìn mới mẻ về thế giới siêu nhiên, với nhân vật chính là một người mù nhưng có khả năng nhìn thấy linh hồn và giúp đỡ họ siêu thoát. Sự kết hợp giữa yếu tố kinh dị và truyền thuyết Việt Nam tạo ra một câu chuyện hấp dẫn và độc đáo.', CAST(N'2025-01-01T22:32:16.813' AS DateTime), 1)
GO
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (114, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, N'Bộ phim có ý tưởng và bối cảnh thú vị, nhưng lại gặp phải một số khó khăn trong việc giữ cho cốt truyện mạch lạc và nhịp độ ổn định', CAST(N'2025-01-01T22:32:43.893' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (115, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, N'Cốt truyện của phim không có quá nhiều sự phức tạp và đôi khi có thể khiến người xem cảm thấy đơn giản và không gây ấn tượng lâu dài.', CAST(N'2025-01-01T22:33:18.623' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (116, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, N'Mặc dù phim khá hài hước, nhưng có vài tình huống không được xử lý tinh tế, đôi khi quá lố và thiếu độ sâu, khiến cho một số khán giả có thể cảm thấy phim hơi "rẻ tiền".', CAST(N'2025-01-01T22:33:29.267' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (117, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, N'Cốt truyện của phim không có quá nhiều sự phức tạp và đôi khi có thể khiến người xem cảm thấy đơn giản và không gây ấn tượng lâu dài. Những tình huống có phần có thể dự đoán được, thiếu đi các cú twist hấp dẫn.', CAST(N'2025-01-01T22:33:52.980' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (118, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, N'Phim khai thác một chủ đề sâu sắc và dễ xúc động, đó là tình mẹ con, sự hy sinh của người mẹ vì con cái. Đây là một thông điệp đầy nhân văn về tình yêu thương và hy vọng.', CAST(N'2025-01-01T22:34:49.907' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (119, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, N'Một số cảnh phim có phần kéo dài, khiến nhịp độ phim bị chậm và làm giảm đi sự hấp dẫn trong một số đoạn.', CAST(N'2025-01-01T22:34:57.880' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (120, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, N'Phim phản ánh những vấn đề xã hội như sự nổi tiếng ảo, sự nghiện ngập của giới trẻ vào những hào quang của showbiz. Tuy nhiên, nó vẫn giữ được yếu tố giải trí, với những tình huống hài hước và dễ tiếp cận.', CAST(N'2025-01-01T22:35:31.863' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (121, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, N' Dù có một số điểm yếu trong cốt truyện và tình huống hài, nhưng phim vẫn mang lại những giây phút thư giãn và tiếng cười cho người xem. Bộ phim cũng chứa đựng thông điệp về sự nổi tiếng ảo và những gì mà giới showbiz có thể mang lại.', CAST(N'2025-01-01T22:35:50.963' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (122, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, N'Bộ phim mang đến nhiều tình huống gây cười, nhưng cũng có những khoảnh khắc lãng mạn dễ thương. Những cảnh quay đẹp và âm nhạc cũng góp phần làm tăng sự hấp dẫn của bộ phim.', CAST(N'2025-01-01T22:36:34.447' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (123, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, N'Dù có những tình huống hài hước và tình cảm, nhưng cốt truyện của Em Chưa 18 khá đơn giản và có thể dễ dàng đoán trước. Một số yếu tố trong phim có phần hơi sáo rỗng và không tạo ra nhiều sự bất ngờ.', CAST(N'2025-01-01T22:36:44.097' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (124, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, N'Bộ phim khám phá sâu sắc mối quan hệ tình bạn và những kỷ niệm của tuổi trẻ. Tháng Năm Rực Rỡ gợi lại một thời kỳ đầy hoài niệm, khi mà tình bạn là tất cả, là nơi các nhân vật tìm thấy sự đồng cảm, hỗ trợ và yêu thương vô điều kiện.', CAST(N'2025-01-01T22:37:22.100' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (125, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, N'Các diễn viên trong phim như Maya, Hồng Ánh, và Minh Hằng đã thể hiện rất tốt vai trò của mình. Đặc biệt, sự phối hợp giữa các diễn viên ở hai thời điểm quá khứ và hiện tại đã mang đến một sự gần gũi, dễ cảm nhận đối với khán giả.', CAST(N'2025-01-01T22:37:40.797' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (126, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, N'Bộ phim khéo léo lồng ghép bối cảnh văn hóa và xã hội của Việt Nam trong những năm 1980, đặc biệt là thế giới nghệ thuật cải lương, làm nổi bật những giá trị truyền thống của dân tộc. Bộ phim cũng phản ánh những xung đột trong xã hội và những thay đổi trong con người khi đối diện với nghệ thuật và tình yêu.', CAST(N'2025-01-01T22:38:25.107' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (127, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, N'Liên Bỉnh Phát và Isaac mang đến những màn trình diễn rất ấn tượng. Liên Bỉnh Phát trong vai Cường thể hiện rất tốt sự mạnh mẽ, bất cần của một tay anh chị nhưng cũng không thiếu sự sâu sắc và dễ cảm nhận trong mối quan hệ với Ba Son. Isaac lại truyền tải được sự mượt mà, tinh tế và cảm xúc của một nghệ sĩ cải lương đích thực.', CAST(N'2025-01-01T22:38:35.100' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (128, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, N'Câu chuyện của Chàng Vợ Của Em không có nhiều bất ngờ và đôi khi có thể dễ đoán. Các tình huống trong phim có thể hơi sáo rỗng và không có sự sáng tạo đột phá, điều này có thể làm một số khán giả cảm thấy nhàm chán.', CAST(N'2025-01-01T22:39:15.667' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (129, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, N'Bộ phim cũng sử dụng âm nhạc rất hợp lý, tạo thêm sự xúc động và làm nổi bật những khoảnh khắc cảm động giữa các nhân vật. Cảnh quay đẹp, đặc biệt là những cảnh lãng mạn, cũng là một điểm cộng cho bộ phim.', CAST(N'2025-01-01T22:39:24.293' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (130, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, N'Bộ phim khai thác một cách nhẹ nhàng và duyên dáng về những tình huống dở khóc dở cười trong tình yêu, sự hiểu lầm và mối quan hệ giữa các nhân vật. Mặc dù câu chuyện không quá mới mẻ, nhưng sự kết hợp giữa các yếu tố hài hước và lãng mạn khiến bộ phim trở nên hấp dẫn.', CAST(N'2025-01-01T22:39:32.987' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (131, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, N'Trấn Thành mang đến những màn hài hước cực kỳ duyên dáng, trong khi Hari Won tạo nên một hình ảnh vợ hiền nhưng cũng rất cá tính. Cả hai đã thể hiện tốt sự hòa hợp trong mối quan hệ vợ chồng và tạo ra nhiều khoảnh khắc dễ thương, hài hước.', CAST(N'2025-01-01T22:40:12.850' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (132, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, N'Bộ phim chủ yếu mang tính giải trí, với những tình huống hài hước và các trò đùa thú vị. Những màn "cưa lại vợ" đầy sáng tạo và đôi khi ngớ ngẩn của Hải giúp phim trở nên nhẹ nhàng và dễ tiếp cận đối với khán giả.', CAST(N'2025-01-01T22:40:21.610' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (133, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, N'Bộ phim có sự kết hợp giữa hài hước và tình cảm rất hợp lý. Những tình huống "dở khóc dở cười" khi Châu cố gắng chinh phục Khang mang lại tiếng cười sảng khoái cho khán giả, nhưng đồng thời cũng khắc họa được những vấn đề nội tâm của nhân vật.', CAST(N'2025-01-01T22:40:58.680' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (134, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, N'Gái Già Lắm Chiêu 3 không chỉ xoay quanh câu chuyện tình yêu mà còn phản ánh những giá trị về gia đình, tình bạn và sự trưởng thành. Bộ phim mang lại những thông điệp sâu sắc về việc đối diện với tuổi tác, sự tự do và chấp nhận bản thân.', CAST(N'2025-01-01T22:41:06.300' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (135, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, N'Maya có một màn trình diễn ấn tượng, khi cô phải đảm nhận hai vai diễn trong một bộ phim: một cô gái trẻ và một bà nội già. Cô đã thể hiện xuất sắc vai diễn của mình, từ việc thể hiện cảm xúc của một cô gái trẻ đến những biểu cảm của một người bà lớn tuổi.', CAST(N'2025-01-01T22:41:40.427' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (136, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, N'Những tình huống dở khóc dở cười khi Hà sống trong cơ thể bà nội mang lại rất nhiều tiếng cười, nhưng đồng thời phim cũng khám phá được những vấn đề sâu sắc về gia đình và tình yêu.', CAST(N'2025-01-01T22:41:50.230' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (137, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, N'Võ Hoàng Yến đã thể hiện xuất sắc vai Chị Mười Ba, với một nhân vật giang hồ mạnh mẽ nhưng cũng đầy cảm xúc và yếu đuối trong những khoảnh khắc quan trọng. Cô truyền tải sự phức tạp của nhân vật qua từng hành động, ánh mắt và lời thoại.', CAST(N'2025-01-01T22:42:27.040' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (138, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, N'Phim không thiếu những pha hành động, đấu đá giang hồ với những cảnh chiến đấu mạnh mẽ. Các tình huống trong phim diễn ra nhanh chóng và liên tục, khiến khán giả không thể rời mắt khỏi màn hình.', CAST(N'2025-01-01T22:42:36.760' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (139, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, N'Bên cạnh các cảnh hành động, Chị Mười Ba - Phần Kết Thập Tam Muội cũng khai thác các mối quan hệ tình bạn, tình yêu, và tình thân trong giới giang hồ, làm nổi bật những cảm xúc và chiều sâu tâm lý của các nhân vật.', CAST(N'2025-01-01T22:42:48.077' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (140, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, N'Bộ phim không chỉ đơn giản là một câu chuyện kỳ bí mà còn là sự khám phá tâm lý của các nhân vật, đặc biệt là những xung đột bên trong mỗi người. Sự phản bội, lừa dối, và những suy nghĩ phức tạp của các nhân vật được thể hiện rõ ràng, tạo nên một câu chuyện đậm chất tâm lý.', CAST(N'2025-01-01T22:43:19.333' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (141, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, N'Các diễn viên trong phim, đặc biệt là Quang Minh và Diễm My, đều thể hiện rất tốt vai trò của mình, mang đến những cảm xúc chân thật và đầy sức nặng. Diễm My cũng gây ấn tượng với khả năng thể hiện sự bí ẩn và nội tâm phức tạp của nhân vật.', CAST(N'2025-01-01T22:43:27.950' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (142, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, N'Mặc dù bộ phim rất thực tế và đầy cảm xúc, nhưng một số khán giả có thể cảm thấy thiếu sự kịch tính hoặc cao trào. Phim có một nhịp điệu khá chậm và chủ yếu tập trung vào những tình huống bình dị, điều này có thể làm giảm sự hấp dẫn đối với những người tìm kiếm sự căng thẳng và hành động trong phim.', CAST(N'2025-01-01T22:44:03.167' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (143, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, N'Bộ phim không chỉ đơn thuần là câu chuyện cá nhân mà còn là một bức tranh lớn về xã hội Việt Nam hiện đại. ROM đặt ra câu hỏi về sự chênh lệch giàu nghèo, những khó khăn mà tầng lớp nghèo phải đối mặt và những cách mà họ cố gắng để thay đổi hoàn cảnh.', CAST(N'2025-01-01T22:44:14.667' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (144, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, N'Các diễn viên trong phim, đặc biệt là Hữu Tín trong vai ROM, mang đến những màn trình diễn rất tự nhiên và thuyết phục. Từ ánh mắt cho đến từng cử chỉ, họ đã thể hiện một cách rất chân thật cảm xúc của những người lao động nghèo đang đối diện với cuộc sống khắc nghiệt.', CAST(N'2025-01-01T22:44:25.267' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (145, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, N'Bố Già không chỉ là một bộ phim về mối quan hệ cha con, mà còn khám phá sâu vào những mâu thuẫn trong gia đình, giữa sự hy sinh của người cha và khát khao tự do, thành công của người con. Những vấn đề như sự tha thứ, tình yêu thương không lời và hy sinh lặng lẽ của cha mẹ dành cho con cái được thể hiện rất chân thực và cảm động.', CAST(N'2025-01-01T22:45:09.683' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (146, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, N'Bộ phim phản ánh được phần nào những khó khăn trong cuộc sống của tầng lớp lao động nghèo, và những mâu thuẫn giữa việc bảo tồn truyền thống và tiếp cận với lối sống hiện đại. Bố Già cũng mang lại những hình ảnh, tình huống rất đặc trưng trong cuộc sống Việt Nam, từ việc đối mặt với khó khăn tài chính cho đến việc khẳng định giá trị gia đình.', CAST(N'2025-01-01T22:45:17.630' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (147, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, N'Bộ phim mang đến những thông điệp sâu sắc về gia đình và tình yêu thương, với diễn xuất rất ấn tượng từ Trấn Thành. Tuy nhiên, kịch bản có phần thiếu bất ngờ và sự sáng tạo mới mẻ.', CAST(N'2025-01-01T22:45:48.080' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (148, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, N'Hai Phượng là một bộ phim hành động với các pha chiến đấu rất gay cấn và mãn nhãn. Những cảnh hành động được choreograph rất chuyên nghiệp và thực tế, giúp phim không chỉ thu hút những người yêu thích thể loại hành động mà còn gây ấn tượng mạnh mẽ đối với khán giả.', CAST(N'2025-01-01T22:46:28.600' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (149, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, N'Mặc dù cốt truyện của Hai Phượng không quá phức tạp, nhưng sự đơn giản lại giúp nó trở nên dễ hiểu và dễ tiếp cận đối với khán giả. Bộ phim tập trung vào mối quan hệ mẹ con và cuộc chiến của một người mẹ để cứu con, mang đến một thông điệp mạnh mẽ về tình mẫu tử và sự hy sinh.', CAST(N'2025-01-01T22:46:36.910' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (150, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, N'Mặc dù bộ phim có chứa các yếu tố kinh dị, nhưng chúng không thực sự đáng sợ hay ám ảnh. Các tình huống kỳ lạ và giật gân đôi khi thiếu sự đột phá về mặt hình ảnh và âm thanh để tạo sự hồi hộp thật sự.', CAST(N'2025-01-01T22:47:27.477' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (151, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, N'Cốt truyện của Lật Mặt 1 có nhiều yếu tố bất ngờ và kịch tính, những bí ẩn dần dần được hé lộ qua các tình tiết, khiến người xem luôn phải chú ý và không thể đoán trước được kết quả. Những pha "lật mặt" bất ngờ trong phim giúp tăng thêm sự hấp dẫn và kịch tính.', CAST(N'2025-01-01T22:48:03.950' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (152, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, N'Mắt Biếc có khả năng chạm vào trái tim người xem nhờ vào những khoảnh khắc tình cảm chân thật, những nỗi buồn không thể vơi đi theo thời gian. Bộ phim khiến khán giả không chỉ xúc động với mối tình của các nhân vật chính, mà còn cảm nhận được những giá trị về tình yêu và sự hi sinh.', CAST(N'2025-01-02T12:09:00.190' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (153, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, N'Cốt truyện của Vòng Eo 56 chủ yếu kể về cuộc đời của Ngọc Trinh, nhưng phim không chỉ đơn thuần là một câu chuyện về sự nổi tiếng mà còn khám phá các khía cạnh khác trong cuộc sống, bao gồm tình yêu, gia đình và những đánh đổi trong sự nghiệp. Mặc dù có tính chất tự truyện, nhưng câu chuyện của phim có phần đơn giản và dễ đoán, thiếu đi những sự kiện bất ngờ hay kịch tính mạnh mẽ.', CAST(N'2025-01-02T13:15:29.823' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (154, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, N'Diễn xuất của Ngọc Trinh còn thiếu tự nhiên và không đủ chiều sâu để lột tả hết cảm xúc của nhân vật.', CAST(N'2025-01-02T13:15:48.760' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (156, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 119, N'Nói chung kịch bản Việt quá hiền, làm cho thế giới của hai cha con trở nên quá lý tưởng đồng nghĩa với nhạt chuyện. Phim thuộc dạng sử dụng tình tiết ngoại cảnh, kiểu “tai nạn” để tạo bước ngoặt. Nhưng bản gốc có sự chuẩn bị để đưa tình tiết này vào một cách trơn tru. Trong khi phim Việt đem lại cảm giác phải dựa vào cú ngoặt này để gây kịch tính.', CAST(N'2025-01-08T22:11:24.747' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (157, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 127, N'Em Là Của Em may mắn đã có thể bù lại bằng các phân đoạn gọn gàng, nhanh chóng và cố gắng không làm mất thời gian của người xem ở đầu phim. Tuy vậy, các phân đoạn này được biên tập hơi lộn xộn và khá vội vàng để đẩy nội dung đến đoạn Hoàng lấy thân phận là nữ giới để tiếp cận Quỳnh Anh (Maya), nhưng lại dài dòng ở phần kết, vốn đang cần phải đẩy nhanh cách giải quyết.', CAST(N'2025-01-12T22:51:43.533' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (158, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 126, N'Kịch bản dở quá', CAST(N'2025-01-16T10:15:30.197' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (160, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, N'Bộ phim có một cốt truyện khá hấp dẫn và những diễn viên thể hiện tốt vai trò của mình, nhưng đôi khi những tình tiết có thể trở nên dễ đoán và chưa khai thác hết tiềm năng của các nhân vật phụ. Mặc dù vậy, với những ai yêu thích dòng phim tình cảm gia đình, bộ phim vẫn đáng xem.', CAST(N'2025-02-10T18:17:57.073' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (161, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 111, N'Phim mang dáng vẻ thuần Việt, từ câu nói đến cử chỉ và hành động đều mang đậm chất Việt Nam. Tuy nhiên vì tôi không thích Thuần Việt nên có lẽ phim này không hợp với tôi. Phim không tạo được cảm giác có chiều sâu cho tôi so với các phim nước ngoài khác. Nhân vật được phóng đại quá mức để tạo sự nghịch cảnh vào cuối phim nên tôi thấy hơi không thoải mái.', CAST(N'2025-02-21T16:18:14.710' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (162, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, N'Phim ngu si dở ẹc', CAST(N'2025-02-21T17:25:10.037' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (163, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, N'Công bằng mà nói, đặc sản của Chị Chị Em Em là có rất nhiều twist, nhiều đến nỗi phim không có gì ngoài những cú twist, và cho đến cái twist cuối cùng thì mọi người ra khỏi rạp vẫn không ngừng hoang mang: "Phim này hoàn toàn có thể làm thêm 30 phút nữa và vẫn tiếp tục twist được và twist kiểu gì cũng được!".', CAST(N'2025-03-23T22:33:41.820' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (164, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, N'Công bằng mà nói, đặc sản của Chị Chị Em Em là có rất nhiều twist, nhiều đến nỗi phim không có gì ngoài những cú twist, và cho đến cái twist cuối cùng thì mọi người ra khỏi rạp vẫn không ngừng hoang mang: "Phim này hoàn toàn có thể làm thêm 30 phút nữa và vẫn tiếp tục twist được và twist kiểu gì cũng được!".', CAST(N'2025-03-23T22:34:12.097' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (165, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, N'Hình ảnh Thiên Kim như nhòe đi và thay vào đó là siêu mẫu Thanh Hằng của Vietnam’s Next Top Model hay The Face, và Nhi bỗng chốc hiện thân là một cô gái tỉnh lẻ ôm giấc mộng trở thành người mẫu, ngoan ngoãn vâng lời làm theo đàn chị.', CAST(N'2025-03-23T22:37:36.277' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (206, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, N'Phim hấp dẫn', CAST(N'2025-03-26T19:14:46.060' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (211, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, N'Cũng phải thừa nhận thêm rằng Cưới ngay kẻo lỡ không thiếu những chi tiết xem mà tiếc. Ngoài việc một số cảnh quay được dàn dựng hơi thiếu chất xinê mà đậm chất truyền hình thì mục đích đem lại tiếng cười cho khán giả (trong một bộ phim được xác định thuộc thể loại hài) đôi khi đã đẩy tiếng cười đi quá đà. Hầu hết tình tiết trong phim đều được sử dụng để gây cười, nhiều lúc cười duyên nhưng cũng không hiếm những đoạn yếu tố gây cười bị lạm dụng, hài thành hài nhảm.', CAST(N'2025-03-26T19:23:19.023' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (212, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, N'Xét về thể loại hài hước lãng mạn thì Cưới ngay kẻo lỡ là một trong những phim VN được làm chỉn chu, bởi sự hài hòa cân đối giữa chất tình cảm lãng mạn với chất hài. Không bị sa đà vào một tuyến nhân vật như Ðể Mai tính (vai phụ của Thái Hòa khiến cho cặp đôi Dustin Nguyễn/ Kathy Uyên mờ nhạt) hay Long ruồi (gần như là "sô diễn một mình" của Thái Hòa trong hai vai), Cưới ngay kẻo lỡ chia đều "mảng miếng" hài cho tất cả nhân vật trong phim, từ cặp đôi chính Khánh Linh (Ngọc Diệp)/ Hồ Sơn (Johnny Trí Nguyễn), đến các quý vị phụ huynh cũng như những nhân vật phụ khác như cậu Ba (Tấn Beo) hay cô hoa hậu (người mẫu lần đầu đóng phim Trâm Anh). Với tôi, điều đáng tiếc nhất trong phim là âm nhạc - nhạc phim khá thất bại trong việc tạo ra cảm xúc, dù là cảm xúc hài hước hay xúc động', CAST(N'2025-03-26T19:23:57.637' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (213, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, N'đây vẫn là một bộ phim tốt trong mặt bằng phim thời điểm này: chắc tay, dàn diễn viên phá cách, hình ảnh trau chuốt và đạo diễn có nghề. Bộ phim này cùng với Lật mặt 3, chắc chắn sẽ là hai chọn lựa sáng giá cho khán giả yêu phim Việt đến rạp trong mùa nghỉ lễ năm nay.', CAST(N'2025-03-26T19:24:43.150' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (214, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, N'Nội dung 100 ngày bên em vẫn vấp phải không ít lỗ hổng. Nhiều tình tiết phim diễn ra nhanh, gượng gạo. Nhân vật của Khả Ngân thường xuyên có quyết định khó hiểu và bất nhất trong lối suy nghĩ, cũng như cảm xúc giữa hai chàng trai. Cao trào của tác phẩm diễn ra quá nhanh, và có phần chưa thỏa đáng.', CAST(N'2025-03-26T19:26:59.557' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (217, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 128, N'Phim được làm chỉn chu, có ý tưởng tốt mang đậm màu sắc bản địa, dàn diễn viên đóng tròn vai. Tiếc rằng đoạn kết của phim gây hụt hẫng ít nhiều nên chưa thể trở thành một bộ phim thật sự ấn tượng và bùng nổ của điện ảnh Việt. Nhưng nếu đang tìm kiếm phim kinh dị để giải trí hay muốn ủng hộ một bộ phim Việt được làm nghiêm túc thì Ma Da thực sự là lựa chọn không tồi.', CAST(N'2025-03-26T19:31:30.937' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (218, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 126, N'"A True Story" là một bộ phim cuốn hút với cốt truyện hấp dẫn, diễn xuất ấn tượng và những tình tiết đầy cảm xúc. Một lựa chọn đáng cân nhắc!', CAST(N'2025-03-26T19:35:03.193' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (221, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 125, N'"12 Rounds" (2009) là một bộ phim hành động gay cấn với nhịp phim nhanh, kịch tính và đầy những pha rượt đuổi nghẹt thở. John Cena thể hiện vai chính khá tốt, mang đến sự căng thẳng và hồi hộp xuyên suốt phim. Dù không quá mới mẻ về mặt nội dung, nhưng đây vẫn là một lựa chọn giải trí hấp dẫn cho fan phim hành động!', CAST(N'2025-03-26T19:39:07.323' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (222, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, N'Phim được đầu tư chỉn chu trong từng khung hình, bối cảnh, trang phục, đạo cụ để toát lên được sự xa hoa, lộng lẫy của biệt phủ Lê gia, của những người sang giàu và cuộc chiến ngầm của những tầng lớp thượng lưu. Yếu tố hài hước được khai thác duyên dáng và đều đặn suốt phim, tạo nên những tiếng cười.', CAST(N'2025-03-31T16:56:13.493' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (223, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 134, N'Làm Giàu Với Ma nhìn chung là một bộ phim khá tiềm năng trong dịp lễ 2/9 năm nay bởi không có bom tấn nào cạnh tranh trực tiếp ở thời điểm này. Tác phẩm ở mức trung bình khá, thích hợp xem cùng người thân, bạn bè bởi có nhiều yếu tố giải trí, hài hước nhưng cũng không kém phần cảm động và sâu lắng về tình cảm gia đình.', CAST(N'2025-04-01T11:11:44.343' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (224, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 121, N'Điểm trừ của phim là một số cảnh to tiếng, quát tháo chưa được tiết chế dễ khiến người xem mệt mỏi. Cậu bé nhiều lần gào lên ầm ĩ với cha, khiến trích đoạn ồn ào với phần thoại khó nghe. Một số cảnh được cài cắm trên hành trình của hai cha con với dụng ý tạo hài hước nhưng lại kéo dài, đẩy nhịp điệu trật khỏi mạch trước đó, tiêu biểu như cuộc tranh chấp của hai cha con với bà cụ dưới cầu.', CAST(N'2025-04-01T11:16:58.050' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (225, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 114, N'Dù trong hoàn cảnh tồi tệ kinh khủng như thế nào thì bản thân vẫn luôn có giá trị. Tất cả sự bế tắc chắc chắn vẫn còn một lối đi để ta tìm lại đúng nơi mình thuộc về. Vấn đề là chúng ta phải đủ bình tĩnh để nhìn nhận ra, không lạc đường. Đó là những gì tôi muốn truyền tải trong bộ phim này', CAST(N'2025-04-04T21:07:51.773' AS DateTime), 1)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (226, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, N'asdadsadasd', CAST(N'2025-04-21T22:23:11.760' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (227, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, N'Do nhu hach', CAST(N'2025-05-03T16:01:42.387' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (228, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, N'Do nhu hach', CAST(N'2025-05-03T16:02:18.947' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (229, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, N'Chiahdsuhdnjasndjka', CAST(N'2025-05-07T16:16:01.593' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (230, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, N'ádadasd', CAST(N'2025-05-07T16:16:19.633' AS DateTime), 0)
INSERT [dbo].[Comments] ([CommentID], [UserID], [MovieID], [Content], [CreatedAt], [Status]) VALUES (231, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 150, N'Ở hồi cuối, tác phẩm bộc lộ nhiều hạn chế, đánh mất sự chặt chẽ trong câu chuyện. Sau khi một người bí ẩn tiết lộ thân phận, phim không còn chất kinh dị mà thiên về hướng tâm lý - bi kịch. ', CAST(N'2025-05-10T10:32:42.677' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (5, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (6, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (7, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (10, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (12, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (27, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (29, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (41, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (79, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (87, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (88, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (89, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (90, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (95, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (96, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (97, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (98, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (99, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (100, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (101, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (104, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (111, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (112, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (115, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (117, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (118, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (122, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (123, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (125, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (129, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (134, 9)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (5, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (6, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (9, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (11, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (12, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (13, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (14, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (15, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (16, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (18, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (19, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (20, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (22, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (23, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (29, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (79, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (87, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (90, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (92, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (94, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (95, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (97, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (98, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (99, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (102, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (111, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (112, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (113, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (114, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (115, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (116, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (117, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (119, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (120, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (121, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (126, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (127, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (129, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (130, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (131, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (133, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (134, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (135, 10)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (7, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (8, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (13, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (14, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (15, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (16, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (17, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (19, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (21, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (28, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (42, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (92, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (94, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (95, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (102, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (107, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (119, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (120, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (127, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (130, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (131, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (133, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (135, 11)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (8, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (9, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (11, 12)
GO
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (17, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (18, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (24, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (25, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (79, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (94, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (113, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (114, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (115, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (116, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (124, 12)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (10, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (21, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (88, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (89, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (93, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (99, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (100, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (103, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (124, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (128, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (150, 13)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (20, 14)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (92, 14)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (95, 14)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (107, 14)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (114, 14)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (134, 14)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (27, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (89, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (97, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (98, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (101, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (122, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (123, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (125, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (128, 15)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (22, 16)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (24, 16)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (91, 16)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (96, 16)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (99, 16)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (100, 16)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (122, 16)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (28, 17)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (26, 18)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (36, 18)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (38, 18)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (43, 18)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (101, 18)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (104, 18)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (30, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (31, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (32, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (33, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (34, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (35, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (37, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (39, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (40, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (101, 19)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (34, 20)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (23, 21)
INSERT [dbo].[MovieGenreMapping] ([MovieID], [GenreID]) VALUES (128, 21)
GO
SET IDENTITY_INSERT [dbo].[MovieGenres] ON 

INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (9, N'Action')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (10, N'Comedy')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (11, N'Romance')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (12, N'Psychological')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (13, N'Horror')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (14, N'Family')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (15, N'Thriller')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (16, N'Historical')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (17, N'School')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (18, N'Science Fiction')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (19, N'Superhero')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (20, N'Adventure')
INSERT [dbo].[MovieGenres] ([GenreID], [GenreName]) VALUES (21, N'Spiritual')
SET IDENTITY_INSERT [dbo].[MovieGenres] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (5, N'LAT MAT', N'Lật mặt là câu chuyện xoay quanh những biến cố cuộc đời của Khải (Lý Hải đóng) kể từ khi cùng người bạn thân tên Thắng (Tiết Cương) vào bãi khai thác đá để tìm đá quý và phát hiện được ba viên kim cương. Sau đó, những tên giang hồ bảo kê ở bãi đá đã quyết giết chết Thắng và đổ tội cho Khải để chiếm trọn số đá quý. Từ đó, Khải phải liên tục chạy trốn sự truy đuổi của băng nhóm giang hồ lẫn cảnh sát. Anh vô tình gắn bó với anh xe ôm nhiệt tình thái quá tên Toàn (Trường Giang) trên đường trốn chạy rồi từ đó xảy ra biết bao tình huống bi hài. …', CAST(N'2015-04-29' AS Date), 100, N'Vietnamese', N'12yRKim5F7g', N'o0xfsSaOI4Y', N'https://www.skyline.vn/UploadImages/shops/VN-Films/Poster/latmat1.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ly Hai', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (6, N'LAT MAT 4: NHA CO KHACH', N'Lật Mặt: Nhà Có Khách xoay quanh chuyến trở về nhà ngỡ tưởng rất vui vẻ đầm ấm của Vy cùng bạn bè. Ở nơi đây có nhiều giai thoại được “đồn đại” về ma quỷ – mà người dân địa phương thường gọi là “khách”. Trong đó, ngôi nhà của Vy sống cùng mẹ và em trai là một trong những nơi có “nhiều khách” nhất! Bởi vậy một chuỗi những tai nạn và sự việc bất thường diễn ra đã đẩy tình thế của tất cả mọi người, đặc biệt là Vy vào tình thế nguy hiểm. Làm sao để có thể cứu Vy và ngăn những mối nguy hiểm tiếp theo xảy ra? Tai nạn đã xảy đến với mẹ của Vy và cậu em trai có liên quan gì đến những thế lực hiểm ác đang đeo bám tất cả mọi người?', CAST(N'2019-04-12' AS Date), 110, N'Vietnamese', N'Fw3NAveg578', N'Fw3NAveg578', N'https://thanhnien.mediacdn.vn/uploaded/hienth/2019_04_08/en_officialposter1_fixnew_KNGZ.jpg?width=500', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ly Hai', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (7, N'HAI PHUONG', N'Nội dung phim kể về cô gái con nhà võ tên Hai Phượng - có quá khứ tăm tối nhưng quyết định rời bỏ giang hồ, về miền Tây cùng bào thai trong bụng. Hai Phượng chọn nghề đòi nợ mướn để mưu sinh, chăm lo cho con gái tên Mai (Cát Vy diễn) - nguồn sống và tia sáng duy nhất trong đời cô. Mai tuy còn nhỏ nhưng mạnh mẽ hơn vẻ ngoài, có chính kiến, tự trọng cao nên khuyên mẹ chuyển sang nuôi cá bè để tránh định kiến của mọi người do nghề đòi nợ mướn của mẹ mang lại. Mọi dự định chưa kịp thực hiện thì vụ bắt cóc xảy ra, Hai Phượng lao đi cứu con trước khi bé Mai bị bọn buôn người lấy nội tạng. Suốt hành trình tìm kiếm manh mối, đeo bám đường dây tội phạm, quá khứ của Hai Phượng dần hé mở.', CAST(N'2019-02-22' AS Date), 98, N'Vietnamese', N'THXPCF6UHh8', N'kFfDFN0xvrw', N'https://upload.wikimedia.org/wikipedia/vi/4/41/Hai_Phuong_-_Furie_poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Le Van Kiet', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (8, N'MAT BIEC', N'Mắt biếc kể về cuộc đời của nhân vật chính tên Ngạn. Ngạn sinh ra và lớn lên ở một ngôi làng tên là làng Đo Đo (thuộc xã Bình Quế, huyện Thăng Bình, tỉnh Quảng Nam – cũng là nguyên quán của tác giả). Lớn lên cùng với Ngạn là cô bạn hàng xóm có đôi mắt tuyệt đẹp tên là Hà Lan. Tuổi thơ của Ngạn và Hà Lan gắn bó với bao nhiêu kỉ niệm cùng đồi sim, đánh trống trường... Tình bạn trẻ thơ dần dần biến thành tình yêu thầm lặng của Ngạn dành cho Hà Lan. Đến khi lớn hơn một chút, cả hai phải rời làng ra thành phố để tiếp tục học. Trong khi tấm lòng của Ngạn luôn hướng về Hà Lan và về làng, thì Hà Lan không cưỡng lại được cám dỗ của cuộc sống xa hoa nơi đô thị và ngã vào vòng tay của Dũng. Việc Hà Lan ngã vào vòng tay Dũng, một thanh niên nhà giàu, sành điệu, giỏi võ nhưng rất thiếu đúng đắn đã làm cho Ngạn đau khổ rất nhiều vì điều Ngạn cần là hạnh phúc của Hà Lan....', CAST(N'2019-12-20' AS Date), 124, N'Vietnamese', N'ITlQ0oU7tDA', N'cykT_5r9-88', N'https://thanhnien.mediacdn.vn/uploaded/sangdt/2020_03_05/poster_MSWL.jpg?width=500', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Victor Vu', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (9, N'BO GIA', N'Lấy bối cảnh chính ở xóm lao động giữa trung tâm Sài Gòn, phim có câu chuyện độc lập, dàn nhân vật khác biệt so với bản gốc. Bố già không đi theo một sườn kịch bản với tuyến truyện rõ rệt, mà tập hợp những lát cắt đời thường, gần gũi. Phim chọn điểm nhìn từ Ba Sang (Trấn Thành) - một người cha đơn thân làm đủ nghề nuôi hai con. Tính thích bao đồng, hay giúp đỡ người khác, dù là kẻ cả xóm khinh ghét, ông Sang thường tự chuốc phiền phức vào thân. Ông có thể hà tiện với con một chai dầu gội, nhưng sẵn sàng bỏ ra hàng chục triệu đồng cứu người em bị giang hồ đòi nợ. Đối lập cha - Quắn (Tuấn Trần) - sống tự lập, không quan tâm đến xung quanh.', CAST(N'2021-03-12' AS Date), 128, N'Vietnamese', N'jluSu8Rw6YE', N'oA-BhGNK7qw', N'https://bizweb.dktcdn.net/thumb/grande/100/064/189/products/5-d254ffb0-f931-4bf3-8ef7-e7682b66f7a8.jpg?v=1624270524467', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Tran Thanh, Vu Ngoc Dang', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (10, N'ROM', N'Trong phim, cậu bé Ròm cũng vì nhà bị giải tỏa mà thành trẻ không nhà. Cha mẹ cùng quẫn bỏ rơi cậu trên vỉa hè cô độc. Trở thành cò đề, đứa trẻ ấy sống dưới "đáy của đáy" xã hội, sinh tồn bằng toàn bộ sức lực non nớt của mình.

Đây là bộ phim hiếm hoi về giải phóng mặt bằng được công chiếu tại Việt Nam. Chủ đề được coi là gai góc không chỉ trong điện ảnh mà còn trong xã hội. Đây vừa là diễn biến ngầm ẩn xuyên suốt bộ phim vừa là vấn đề thời sự nhức nhối, đau đớn, chứa đựng những mâu thuẫn cốt lõi của xã hội đương thời.', CAST(N'2020-09-25' AS Date), 92, N'Vietnamese', N'XRm1P7oGpMQ', N'XRm1P7oGpMQ', N'https://thanhnien.mediacdn.vn/uploaded/caotung/2021_07_09/posterphimromkhichieutainhat_UNEA.jpg?width=500', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Tran Thanh Huy', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (11, N'TIEC TRANG MAU', N'Phim xoay quanh một nhóm bạn thân thiết ở độ tuổi tứ tuần cùng hội tụ vào buổi tiệc tân gia tại căn hộ penthouse sang trọng của cặp vợ chồng giàu có Nguyệt Ánh (Hồng Ánh) - Ngọc Quang (Hứa Vĩ Văn). Tại đây, cả nhóm đã tổ chức trò chơi công khai toàn bộ nội dung mà họ nhận được trong thời gian trò chơi diễn ra. Và từ đây, các bí mật, góc tối của mỗi nhân vật dần được phơi bày.

Quang, Bình, Linh và Mạnh là nhóm bạn thân đã gắn bó hơn 40 năm. Một ngày nọ, cả nhóm được Quang mời đến dự tiệc tân gia tại căn hộ của anh. Bình dẫn theo vợ là nhà thơ Thu Quỳnh, Linh đi cùng vợ sắp cưới là bác sĩ thú y Kathy, còn Mạnh đến một mình. Ánh - vợ của Quang - bày ra một trò chơi gọi là "công khai bí mật": tất cả mọi người để điện thoại lên bàn, người nào nhận được tin nhắn và cuộc gọi đến thì phải chia sẻ cho những người còn lại cùng biết....', CAST(N'2020-10-20' AS Date), 118, N'Vietnamese', N'nh0BklwPN9Q', N'nh0BklwPN9Q', N'https://channel.mediacdn.vn/2020/11/3/photo-1-16043859913241550150228.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Nguyen Quang Dung', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (12, N'CHỊ MƯỜI BA - PHẦN KẾT THẬP TAM MUỘI', N'Chị Mười Ba: Phần Kết Thập Tam Muội tiếp tục khai thác mối quan hệ “cơm không lành, canh không ngọt” giữa 2 băng nhóm giang hồ khu Chợ Cũ và Chợ Mới. Giờ đây, các nhóm nhỏ của Chợ Mới đã chịu hoà hợp dưới sự điều khiển của Anh Hai (Lê Quốc Nam) và hoạt động dưới tên An Cư Nghĩa Đoàn với 5 thành viên chủ lực gồm chị Mười Ba (Thu Trang), anh Đường Băng (Tiến Luật), Vi Cá (Quách Ngọc Tuyên), Hoàng Hí Hửng (Hoàng Mèo) và Bảy Gà (Hứa Minh Đạt). Tuy nhiên, phe Chợ Cũ của Long Bi (Khương Ngọc) và B52 (Hoàng Phi) nay có dịp lăm le, chiếm đoạt địa bàn của An Cư Nghĩa Đoàn khi có sự chống lưng của ông trùm Hắc Hổ. Khi Anh Hai quyết định “rửa tay gác kiếm”, nhường lại vị trí quản lý cho chị Mười Ba thì cũng là lúc thế lực của Hắc Hổ trỗi dậy mạnh mẽ. Sau vụ tai nạn bất thình lình cướp đi mạng sống của Anh Hai, nội bộ An Cư Nghĩa Đoàn rơi vào tình trạng lục đục, chị Mười Ba vừa phải nỗ lực ổn định lại băng nhóm, vừa tính kế hoạch trả thù cho Anh Hai, nhiêu đó có quá sức với một “bà trùm” trẻ?', CAST(N'2019-03-29' AS Date), 105, N'Vietnamese', N'IQZt7ElxH44', N'O7l3IhKRTqs', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWcGhTynqH_3RPPu7u3Dhws2x1yk5GHWfGzA&s', N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Khuong Ngoc', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (13, N'EM LA BA NOI CUA ANH', N'Phim nói về một bà già rất cá tính & mạnh mẽ tên là Tôn Nữ Thị Đại. Trải qua bao nhiêu khó khăn mới nuôi con trai trưởng thành, hi sinh tất cả cho con cháu nhưng vì nhiều nguyên nhân mà gia đình có chút mâu thuẫn. Bà Đại thẫn thờ ngồi chờ xe bus thì thấy một hiệu ảnh bên đường. Nghĩ rằng mình cần có cái ảnh thờ nên bà già tấp tểnh vào đó chụp. Anh thợ ảnh bí ấn nói rằng bà chỉ cần nghĩ đến những năm tháng tươi đẹp của cuộc đời và cười thật tươi là sẽ rạng rỡ như đang sống ở tuổi 20 ấy.', CAST(N'2015-12-11' AS Date), 127, N'Vietnamese', N'L_iOZs6JZe0', N'L_iOZs6JZe0', N'https://vcdn1-giaitri.vnecdn.net/2015/12/03/4-cb54d-9074-1449120889.jpg?w=460&h=0&q=100&dpr=2&fit=crop&s=g21ORGhMd-_lQ73z2G4g5w', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Phan Gia Nhat Linh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (14, N'GAI GIA LAM CHIEU 3', N'Gái già lắm chiêu 3 là bộ phim theo thể loại Chick-Flick (lãng mạn, hài hước). Phim xoay quanh câu chuyện của những người phụ nữ trong giới thượng lưu giàu có bậc nhất xứ Huế. Là nữ hoàng thị phi của showbiz Việt, Ms Q (Ninh Dương Lan Ngọc) với tính cách mạnh mẽ, sang chảnh, tuy nhiên cô không nghĩ rằng sẽ có ngày mình đối mặt với mẹ chồng quyền lực, siêu giàu, và siêu khó tính. Bước vào "hào môn" một cách bất ngờ, cô phải đối mặt với những luật lệ cầu kỳ của Lê Gia. Trong đó có cả người đứng đầu là cựu minh tinh màn bạc, nổi tiếng thị phi một thời: Thái Tuyết Mai. Trong hoàn cảnh nghiệt ngã này, Ms.Q phải tự trấn an bản thân và cùng với “hội gái ế” của mình tìm cách để vượt qua được kiếp nạn "mẹ chồng siêu giàu – nàng dâu siêu chảnh".', CAST(N'2020-02-07' AS Date), 105, N'Vietnamese', N'yiBo3wgJ860', N'yiBo3wgJ860', N'https://homepage.momocdn.net/cinema/momo-cdn-api-220615131230-637908955507654410.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Bao Nhân, Nam Cito', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (15, N'CUA LAI VO BAU', N'Nội dung của "Cua lại vợ bầu" xoay quanh mối quan hệ của cặp đôi Trọng Thoại (do Trấn Thành thủ vai) và Nhã Linh (do Ninh Dương Lan Ngọc đảm nhận). Cả hai bên nhau từ thời còn học trung học nhưng sau 7 năm của mối quan hệ, Thoại dường như vẫn chưa sẵn sàng tiến lên một chương mới - hôn nhân - với bạn gái. Điều này dẫn tới những mâu thuẫn trong mối quan hệ của Linh và Thoại. Mâu thuẫn ngày càng phát triển hơn khi sự nghiệp của Linh nở rộ, còn Thoại thì vẫn tằng tằng, an phận với công việc sửa xe. Rồi Linh vì chán nản với Thoại, có "tình một đêm" với bạn học cũ Qúy Khánh (do Anh Tú đảm nhận) và kịch tính đến khi cô phát hiện mình có bầu nhưng lại không biết đứa trẻ là con của Thoại hay Khánh.', CAST(N'2019-02-05' AS Date), 100, N'Vietnamese', N'lhTtrS98uf4', N'lhTtrS98uf4', N'https://upload.wikimedia.org/wikipedia/vi/7/79/Cua_lai_vo_bau.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Nhat Trung', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (16, N'CHANG VO CUA EM', N'Chuyện phim xoay quanh nhân vật Mai – một cô gái tài giỏi, thông minh luôn cố gắng phấn đấu trong công việc để có thể chứng tỏ năng lực bản thân và quan trọng là thoát khỏi cái bóng của người mẹ nổi tiếng. Nhưng cũng chính vì thế mà cô trở nên bỏ bê nhà cửa, không có thời gian chăm sóc cho chú chó yêu dấu của mình.  Sau nhiều lần thay đổi người giúp việc, cuối cùng Mai cũng có thể nói “ơn giời” khi gặp được Ngọc – một cô bé đang tìm cách vượt qua sự bao bọc quá lớn của anh hai. Tuy nhiên, một điều mà Mai  không hề biết đó là người thực sự dọn dẹp nhà cửa sạch sẽ, nấu những bữa ăn ngon lành cho mình hàng ngày lại chính là Hùng – anh trai của Ngọc và cũng là “kẻ đáng ghét” mà cô chạm trán nhiều lần trong công viên.
', CAST(N'2018-08-24' AS Date), 115, N'Vietnamese', N'Or3SqGR_Qg4', N'nYF8du-8cNI', N'https://static.vieon.vn/vieplay-image/poster_v4/2021/05/10/osnt83m1_660x946-changvocuaem.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Charlie Nguyen', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (17, N'SONG LANG', N'Phim kể về đời sống cải lương những năm của thập niên 1980, Dũng “Thiên Lôi” là con kép nữ chính và nghệ sĩ đàn kìm (đàn nguyệt), say mê cải lương từ bé nhưng vì bố mẹ mâu thuẫn, ly hôn nên anh không theo nghiệp mà trở thành dân xã hội đen chuyên đi đòi nợ thuê. Tình cờ anh gặp Linh Phụng, một nghệ sĩ cải lương đang tỏa sáng ở gánh hát Thiên Lý, giấc mơ theo tổ nghiệp của Dũng sống lại. Anh quyết định bỏ hết mọi thứ, mang đàn đến gánh hát nhưng rồi bị một con nợ đâm chết ngay trước rạp hát.', CAST(N'2018-08-17' AS Date), 101, N'Vietnamese', N'7Fo_SD81-08', N'7Fo_SD81-08', N'https://upload.wikimedia.org/wikipedia/vi/c/c7/Song_Lang_phim_dien_anh_vn.png', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Leon Le', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (18, N'THANG NAM RUC RO', N'Tháng năm rực rỡ là phim điện ảnh Việt Nam của đạo diễn Nguyễn Quang Dũng khởi chiếu năm 2018 và là tác phẩm được làm lại từ bộ phim Sunny rất ăn khách của Hàn Quốc, phát hành vào năm 2011. Bộ phim là hành trình đi tìm lại những ký ức thanh xuân của Hiểu Phương (Hồng Ánh) và nhóm nữ quái có biệt danh Ngựa Hoang gồm sáu thành viên: Hiểu Phương, Mỹ Dung, Tuyết Anh, Bảo Châu, Thùy Linh và Lan Chi. Trải qua nhiều thay đổi vào khoảng thời gian giai đoạn thập niên 1970, nhóm bạn đã tan rã, mỗi người có một cuộc sống riêng. 25 năm sau, vào một lần tình cờ gặp lại cô bạn cũ Mỹ Dung và biết bạn đang mắc bệnh ung thư giai đoạn cuối, Hiểu Phương quyết tâm tìm lại các thành viên, bạn bè cũ của mình để thực hiện tâm nguyện cho người bạn.', CAST(N'2018-03-09' AS Date), 118, N'Vietnamese', N'RyQeBPpZqdY', N'RyQeBPpZqdY', N'https://upload.wikimedia.org/wikipedia/vi/9/99/Ap_phich_phim_Thang_Nam_ruc_ro.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Nguyen Quang Dung', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (19, N'EM CHUA 18', N'Bộ phim xoay quanh mối quan hệ oái oăm giữa gã tay chơi trung niên Hoàng (Kiều Minh Tuấn) và nữ sinh trung học Linh Đan (Kaity Nguyễn). Sau khi bị hot boy bóng rổ (Will) phụ bạc để đi theo một nàng hot girl (Châu Bùi), Linh Đan quyết tâm lên kế hoạch trả đũa. Cô nàng tìm cách cặp một người đàn ông trưởng thành để bạn trai cũ phải hối hận.

Anh chàng đào hoa Hoàng không may trở thành "người được chọn". Linh Đan hóa trang thành cô gái quyến rũ để dụ dỗ Hoàng qua đêm và chỉ tiết lộ với anh mình chưa tròn 18 tuổi vào hôm sau. Cô nàng dùng một đoạn phim nhạy cảm giữa hai người để ép buộc Hoàng đóng giả bạn trai trước mặt các bạn cùng lớp. Tuy nhiên, giữa hai người dần nảy sinh tình cảm thực sự.', CAST(N'2017-04-28' AS Date), 95, N'Vietnamese', N'_affkHceSj4', N'ahNZIewqWYY', N'https://upload.wikimedia.org/wikipedia/vi/1/1f/Em_ch%C6%B0a_18_poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Le Thanh Son', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (20, N'SIEU SAO SIEU NGO', N'Bộ phim Siêu sao siêu ngố xoay quanh hai anh em sinh đôi Thế Sơn - Thế Tùng, cùng do danh hài Trường Giang thể hiện. Một người là ngôi sao điện ảnh nổi tiếng, kẻ còn lại thì theo đuổi nghiệp chăn lợn ở dưới quê.

Do lịch quay dày đặc, Thế Sơn không thể dành nhiều thời gian cho cô bạn gái xinh đẹp tên Trúc (Sam). Không dừng lại ở đó, anh còn phải đối mặt với những màn “gạ tình” lộ liễu của nữ ca sĩ quyền thế Phụng Anna (Thanh Thúy).

Để giảm bớt áp lực, Thế Sơn cùng tay trợ lý Tony Dũng (Đức Thịnh) lên kế hoạch thuê Thế Tùng đóng giả mình. Từ đây, hàng loạt tình tiết tréo ngoe nảy sinh khi anh chàng chăn lợn đứng trước cơ hội tự do thể hiện cá tính trong showbiz.

Chuyện một diễn viên cùng lúc vào vai hai anh em hoặc chị em song sinh trong phim là điều thường thấy tại Hollywood. Khán giả từng được chứng kiến tài năng diễn xuất của Lindsay Lohan ở The Parent Trap (1998) khi cô cùng lúc nhập vai Annie James và Hallie Parker, hay Tom Hardy với vai diễn kép là đôi song sinh tội phạm nhà Kray trong Legend (2015).', CAST(N'2018-02-16' AS Date), 90, N'Vietnamese', N'DULpxY1Vspw', N'o00gSlZcwnQ', N'https://i.imgur.com/NHLaNa9.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Duc Thinh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (21, N'NANG', N'Nắng là câu chuyện về hai mẹ con bé Nắng (Kim Thư) và mẹ Mưa (Thu Trang). Mẹ Mưa bị thiểu năng, khó khăn lắm mới có thể nói tròn vành rõ chữ, nhưng lại phải cưu mang cô con gái bé bỏng. Hai mẹ con sống lay lắt trong căn nhà hoang bên sông, hàng ngày dắt nhau đi lượm ve chai, bán vé số.

Nhưng “con không chê cha mẹ khó”, bé Nắng cứ thế lớn lên, hồn nhiên như cây cỏ, hết mực yêu thương, quấn quýt người mẹ kém may mắn.

Cuộc sống cơ cực nhưng yên bình của hai mẹ con bỗng dưng có thêm sự góp mặt của một cậu thiếu gia bị nhiễm HIV (Trấn Thành) và và một gã giang hồ “tép riu” đang bị truy đuổi (Kiều Minh Tuấn). Những số phận vá víu ấy cứ thế ở bên nhau trong căn nhà đổ nát hoang tàn.

Bỗng một ngày, biến cố kinh hoàng xảy ra. Mẹ Mưa bị kẻ xấu đổ tội buôn bán và tàng trữ ma túy, phải đứng trước bản án tử hình. Tất cả đều cảm thấy sững sờ trước tai họa từ trên trời ập xuống. Liệu hai mẹ con phải cần đến “phép màu” nào mới có thể đoàn tụ bên nhau?', CAST(N'2016-08-31' AS Date), 90, N'Vietnamese', N'tyaq_lOwqmg', N'cZPW0j4v_6A', N'https://photo.znews.vn/w660/Uploaded/xbhunku/2016_08_31/poster2.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Dong Ðang Giao', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (22, N'TRANG QUYNH', N'Nội dung bộ phim Trạng Quỳnh được phóng tác từ những giai thoại về nhân vật cùng tên trong dân gian Việt Nam. Chuyện phim xoay quanh Quỳnh (Quốc Anh) - một anh chàng thông minh, ma mãnh, rất thích bày trò trêu chọc người dân trong làng.

Quỳnh thầm thương trộm nhớ nàng Điềm (Nhã Phương) - con gái của thầy Đoàn (Tùng Tuki). Anh cứ thế ra sức tán tỉnh người trong mộng mà chưa thành. Song, cô gái tài sắc vẹn toàn còn sớm lọt vào mắt xanh của Trịnh Bá (Công Dương) - cháu của chúa Trịnh.

Gã dùng âm mưu hãm hại thầy Đoàn để ép Điềm phải làm đám cưới. Không chịu khuất phục, cô cùng Quỳnh và người bạn thân Xẩm (Trấn Thành) khăn gói lên kinh để báo quan.

Tuy nhiên, chuyến hành trình đòi lại công lý thực sự gian nan bởi mọi quyền hành trong vùng đất đều thuộc về chúa Trịnh.', CAST(N'2019-02-08' AS Date), 106, N'Vietnamese', N'ikXMNocYUeY', N'3Yztwk0opAI', N'https://touchcinema.com/uploads/ho00001267-poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Duc Thinh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (23, N'PHAP SU MU', N'Nội dung của Pháp Sư Mù là hành trình đi chữa mắt, tìm lại ánh sáng cho đôi mắt của nhân vật Tinh Lâm (Huỳnh Lập) mà khán giả đã quen mặt khi xem trên YouTube. Nhắm thẳng đến đối tượng là những người đã xem Ai Chết Giơ Tay nên ngay từ đầu phim, các nhân vật cũ cứ thế lần lượt xuất hiện mà không hề được giới thiệu gì cả. Họ cứ thế gọi tên nhau theo cái cách rất thân thiết như là đã biết nhau rồi (thực sự là họ đã biết nhau trong web drama), nhưng điều này làm nhiều bạn chưa xem loạt phim Ai Chết Gio Tay sẽ bị thắc mắc và bị rối khi tiếp thu nội dung. Ngồi trước mình một dãy ghế là một cặp đôi và bạn nam liên tục phải giải thích cho bạn nữ hiểu xem đó là ai, có mối quan hệ gì với nhân vật Tinh Lâm.', CAST(N'2019-11-08' AS Date), 109, N'Vietnamese', N'alShfrI18qI', N'alShfrI18qI', N'https://metiz.vn/media/poster_film/Poster_Payoff_PSM10_FINAL_16102019.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Huynh Lap', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (24, N'NGUOI VO BA', N'Việt Nam thế kỉ thứ 19: Mây, cô gái 14 tuổi, ngồi trên một con thuyền xuôi theo dòng sông về nhà chồng, người mà cô chưa từng một lần gặp mặt. Cô bắt đầu cuộc sống mới với vai trò vợ ba của một ông chủ đồn điền. Được hai người vợ đầu của ông chủ chỉ bảo tận tình các cung cách ứng xử hàng ngày và những quy tắc trong gia đình, nhưng rồi Mây chợt nhận ra cô chỉ có thể đạt được vị thế bà chủ thực sự của gia đình khi sinh hạ được một cậu con trai. Tuy nhiên, Mây lại phải lòng Xuân, người vợ hai. Bi kịch gia đình thực sự nảy sinh sau một cuộc tình vụng trộm. Sau khi sinh con, Mây đứng trước quyết định sẽ tiếp tục lặng lẽ chịu đựng cuộc sống hiện tại hay đấu tranh cho tự do của bản thân.', CAST(N'2019-05-17' AS Date), 96, N'Vietnamese', N'e3Gr7r7yWU8', N'guxVNmLH9tw', N'https://upload.wikimedia.org/wikipedia/vi/6/6a/The_Third_Wife_poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ash Mayfair', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (25, N'DAO CUA DAN NGU CU', N'Chuyện phim xoay quanh 6 nhân vật là những mảnh đời tứ xứ tụ về trong một ngôi nhà xưa cũ, chịu đựng sự giam hãm bức bách của cuộc mưu sinh hùng hục, tanh tưởi và hèn mọn. Chệt Liếm (Hoàng Phúc) là chủ, ông sở hữu công việc kinh doanh quán lẩu dê tại nhà. Quán nhậu có cái tên rất thơ Đêm Trắng. Đằng sau bầu không khí ô hợp của những đêm quán xá đông đúc là cảnh sống chán chường, ngột ngạt của những nhân vật như xiếm Hoa (Ngọc Hiệp) và những người giúp việc như ông Cao (Hoàng Nhân), người đàn ông lực điền Miên (Nhan Phúc Vinh) và kẻ mới đến – Phước (Phạm Hồng Phước). Ngoài những phần việc đơn điệu phải chu tất cho quán xá, mỗi người đều co ro trong bí mật riêng tư. Thái độ cư xử của chệt Liếm với xiếm Hoa không khác gì phận người ở dù họ nằm chung giường. Vì bà vẫn phải phục tùng ông mọi chuyện từ đáp ứng nhu cầu sinh lý đến hầu hạ đứa con gái riêng tật nguyền bị ông giam hãm trên gác gỗ, nơi ông cấm người khác bén mảng tới. Tất cả những người sống trong ngôi nhà đều trở nên thao thức mỗi khi tiếng hát và tiếng la hét vô cớ đến vô vọng phát đi từ căn gác ấy. Bị thôi thúc về nỗi tò mò bên trong cái hộp gỗ chứa đựng cuộc sống của người con gái tên Chu (Nguyễn Ngọc Thanh Tâm), người con trai đang độ sung mãn, đầy ham muốn là Phước đã quyết định “vượt rào”. Anh cố len qua cửa hẹp mà không ngờ mình đã tự đưa chân bước vào một tấn bi kịch.', CAST(N'2017-05-19' AS Date), 88, N'Vietnamese', N'tgf9a6Ss1WQ', N'EfaLfRJY6So', N'https://upload.wikimedia.org/wikipedia/vi/9/95/%C4%90%E1%BA%A3o_c%E1%BB%A7a_d%C3%A2n_ng%E1%BB%A5_c%C6%B0_poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Hong Anh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (26, N'BONG DE', N'Bóng Đè kể về việc ba cha con Thành (Quang Tuấn), Linh (Lâm Thanh Mỹ) và Yến (Mai Cát Vi) trở về sống tại một vùng quê sau khi gia đình trải qua một biến cố lớn là vợ của Thành, tức mẹ của Linh và Yến qua đời. Họ không ngờ rằng chính quyết định này lại đẩy họ đến với chuỗi ngày ám ảnh nhất cuộc đời. Mỗi khi ba không có mặt, Linh và Yến luôn gặp phải những hiện tượng kì lạ, căn nhà im ắng trở nên ồn ào với sự xuất hiện của những vị khách bí ẩn. Không những thế, cả hai chị em liên tục gặp phải hiện tượng bóng đè kể cả ban ngày khiến cả hai vô cùng hoảng sợ. Bác sĩ tâm lý Hạnh (Diệu Nhi) được mời đến để giúp đỡ hai chị em, nhưng chính cô cũng bị cuốn vào những bí ẩn kinh hoàng xảy ra trong ngôi nhà này. ', CAST(N'2022-03-18' AS Date), 97, N'Vietnamese', N'66Dpvz_KNwY', N'nIxxDt95klY', N'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/p/o/poster_b_ng_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Le Van Kiet', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (27, N'578: PHAT DAN CUA KE DIEN', N'Phim điện ảnh 578: Phát đạn của kẻ điên kể về câu chuyện của một người lái xe container tên Hùng (Alexandre Nguyễn thủ vai) và cô con gái nhỏ. Cuộc sống hai cha con trên chiếc xe màu đỏ cứ êm đềm diễn ra, cho đến ngày cô bé xa cha đi học. Người cha nhận được tin con gái bị trầm cảm nặng sau khi bị xâm hại. Trên hành trình đi tìm công lý cho con, Hùng chợt nhận ra rằng không chỉ đối đầu với một kẻ xâm hại mà là cả một thế giới ngầm. Trên hành trình giành lại công bằng cho con, Hùng được cô gái bí ẩn Bảo Vy (H''Hen Niê) giúp.', CAST(N'2022-05-20' AS Date), 120, N'Vietnamese', N'5bQubBPFEoE', N'5bQubBPFEoE', N'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_578_1_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Luong Dinh Dung', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (28, N'CO GAI DEN TU HOM QUA', N'Lấy bối cảnh năm 1997, phim gợi nhắc thế hệ khán giả 7x, 8x về thời thanh xuân. Giai đoạn đó, bảng xếp hạng âm nhạc Làn Sóng Xanh tạo hiệu ứng lớn, lôi cuốn nhiều bạn trẻ - trong đó có Thư - bằng những Tình đơn phương, Phượng hồng, Hương thầm... Thói quen thu băng nhạc phát trên radio rồi chép lại vào sổ tay được tái hiện. Căn phòng nhân vật chính bày ra những cuốn Bảy viên ngọc rồng in năm 1996 - "bảo vật" của học trò một thời. Khung cảnh phố thị cổ kính ở Hội An - bối cảnh quay chính của phim - gợi cảm giác bảng lảng hoài niệm. Nơi đó có hàng chè tàu giữa sân nhà, giọng phát thanh viên văng vẳng trên loa phường, những con đường trải dài với các ô tường màu vàng, những xe cà rem, rạp chiếu bóng và những poster vẽ tay...

Kỷ niệm học trò được khơi lại qua những dòng tỏ tình trên giấy Thư gửi Việt An, cách cậu dấm dúi giấu kẹo, ổi, chocolate... vào hộc bàn tặng người thương, hay bức họa chân dung bằng bút chì vẽ trộm trong sách... Phim kéo người xem vào dòng hồi ức về một thế hệ trẻ chưa từng biết đến Internet, mạng xã hội, chỉ giãi bày tình cảm qua giấy bút, chương trình quà tặng âm nhạc trên radio...', CAST(N'2017-07-21' AS Date), 120, N'Vietnamese', N'NYowPGxSLzU', N'RDeFuAt-vSU', N'https://bazaarvietnam.vn/wp-content/uploads/2021/07/review-phim-co-gai-den-tu-hom-qua-4-e1626108452211.jpeg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Phan Gia Nhat Linh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (29, N'LAT MAT 6: TAM VE DINH MENH', N'Lật Mặt 6: Tấm Vé Định Mệnh có nội dung tách biệt với 5 phần phim Lật Mặt trước, kể về nhóm bạn gồm 6 người đàn ông vốn chơi thân với nhau từ nhỏ. Để kỷ niệm tình bạn của họ, Phương – nhân vật chính đã mua một tấm vé số theo ngày sinh của sáu người, giao cho An giữ, với lời hứa nếu trúng số sẽ chia đều cho 6 người. Và tấm vé số ấy thực sự đã trúng giải độc đắc khiến nhóm bạn 6 người cực kỳ phấn khích. Nhưng đúng lúc đó An bất ngờ gặp tai nạn và qua đời, mang theo tấm vé số xuống mồ. Những người bạn còn lại không cam lòng để món tiền tỷ ấy bị chôn xuống đất, quyết đào mộ của bạn mình lên để tìm tấm vé. Một khi lòng tham đã nổi dậy đến mức có thể quật mộ người chết, thì không ai trong 5 người muốn “chia đều” tấm vé số kia nữa, gia đình họ cũng bị cuốn theo cuộc tranh giành khốc liệt này.', CAST(N'2023-04-28' AS Date), 118, N'Vietnamese', N'L-XhraxUsAs', N'L-XhraxUsAs', N'https://upload.wikimedia.org/wikipedia/vi/b/bc/L%E1%BA%ADt_m%E1%BA%B7t_6_poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ly Hai', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (30, N'Avengers: Endgame', N'Avengers: Endgame is the movie I''m talking about, with amazing visual effects, an engaging script, and talented actors that have created an amazing Avengers: Endgame. So let''s sit down and review Endgame and see what Marvel has done. Hate it!!!', CAST(N'2019-04-26' AS Date), 181, N'English', N'TcMBFSGVi1c', N'TcMBFSGVi1c', N'https://th.bing.com/th/id/R.e955a1a4702bca3ea4da44898ee872dd?rik=y3Q%2bP3rY9f%2bAhA&riu=http%3a%2f%2fcdn.collider.com%2fwp-content%2fuploads%2f2019%2f03%2favengers-endgame-poster.jpg&ehk=UoQckDV4roR6H27tbcXLyQV5qobxoM7kNAwoXFgcWhk%3d&risl=&pid=ImgRaw&r=0', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Anthony Russo, Joe Russo', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (31, N'The Lion King', N'The content of the Lion King live-action version recreates the entire original story of the 1994 Lion King, revolving around the journey of growing up and reclaiming the throne that belongs to him of the lion Simba from the hands of his cunning uncle Scar, who killed his brother, the lion king Mufasa. Set in the wild, the film has built an organized society of the animal world. In that society, there are also conflicts, disputes and love like the human world.', CAST(N'2019-07-19' AS Date), 118, N'English', N'o17MF9vnabg', N'_-m1jS516G8', N'https://touchcinema.com/uploads/slider-app/wonderwall-instagram-scarteaser-poster-vietnam-poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Jon Favreau', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (32, N'Joker', N'Joker revolves around Arthur Fleck (played by Joaquin Phoenix) - a person living at the bottom of society in the fictional city of Gotham. Arthur makes a living by dressing up as a clown, cheerleading for community events. He suffers from uncontrollable laughter and mental instability.

After being fired and beaten, Arthur faces a turning point in his life. From a bullied person, he becomes the "trigger" for the resistance movement of the underprivileged class in Gotham. After the collapse of the last spiritual support, Arthur becomes the Joker - a dangerous and insane criminal.', CAST(N'2019-10-04' AS Date), 122, N'English', N't433PEQGErc', N't433PEQGErc', N'https://upload.wikimedia.org/wikipedia/en/e/e8/Joker_-_Folie_%C3%A0_Deux_poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Todd Phillips', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (33, N'Frozen II', N'Frozen 2 tells the story of Queen Elsa''s new adventure in the peaceful kingdom of Arendelle, when she hears the mysterious "mermaid singing". Elsa sets out to find the truth about the kingdom''s past and her own, with the help of her sister Anna, her boyfriend Kristoff, the snowman Olaf and the reindeer Sven.', CAST(N'2019-11-22' AS Date), 103, N'English', N'Zi4LMpSDccc', N'mtPQKEkNNhc', N'https://m.media-amazon.com/images/I/71svLGhR0aL._AC_SL1000_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Chris Buck, Jennifer Lee', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (34, N'Spider-Man: No Way Home', N'Spider-Man: No Way Home continues the timeline from the previous film Spider-Man: Far from Home (2019). After defeating the villain Mysterio, Spider-Man''s identity is revealed by him. The film opens in a chaotic scene when the whole world now knows that high school student Peter Parker (Tom Holland) is the one behind the spider web mask. However, the public is also deeply divided, one side supports Spider-Man, the other side demands a boycott and holds him responsible for the death of Mysterio - the cunning man who successfully fooled the world into thinking he was a hero.

At 18, his identity is exposed, he is framed for murder, and becomes the center of every story in the media and on the streets. Peter Parker''s life is completely turned upside down. Unable to bear seeing his family and friends get caught up in the mess, Peter goes to Doctor Strange (Benedict Cumberbatch) to ask him to erase everyone''s memories. However, the spell failed, opening the door to the multiverse, bringing in a series of villains from other worlds. Peter Parker''s mission is to gather this group of villains in one place so that Doctor Strange can cast a spell to bring them back to where they belong. However, things turn out to be more complicated than expected.', CAST(N'2021-12-17' AS Date), 148, N'English', N'JfVOs4VSpmA', N'JfVOs4VSpmA', N'https://i.ebayimg.com/images/g/d-4AAOSwnAtm6WOp/s-l1200.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Jon Watts', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (35, N'Top Gun: Maverick', N'Top Gun: Maverick is a sequel to Top Gun (1986). In the film, Tom Cruise plays Pete "Maverick" Mitchell, a naval pilot assigned to train flight crews for the US military. At the base, he meets Lieutenant Bradley "Rooster" Bradshaw (Miles Teller), the son of his fallen comrade. Top Gun: Maverick impresses not only with its beautiful stunts but also with its emotional content.', CAST(N'2022-05-27' AS Date), 130, N'English', N'giXco2jaZ_4', N'giXco2jaZ_4', N'https://upload.wikimedia.org/wikipedia/vi/1/1c/Top_Gun_Maverick_Poster_VN.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Joseph Kosinski', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (36, N'Dune', N'The film is set in the year 10191 in the future. The main character Paul Atreides (Timothée Chalamet) is the only son of Duke Leto Atreides (Oscar Isaac) and Lady Jessica (Rebecca Ferguson). By order of the Emperor, the Atreides family must manage the desert planet Arrakis, which is rich in "spice" - a substance considered a miracle drug, bringing health benefits, and can be used as fuel for interplanetary travel. As the heir to the family, Paul must learn and perfect the necessary skills to be ready to take his father''s place in an emergency.', CAST(N'2021-10-22' AS Date), 155, N'English', N'n9xhJrPXop4', N'n9xhJrPXop4', N'https://upload.wikimedia.org/wikipedia/vi/9/94/Dune_2_VN_poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Denis Villeneuve', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (37, N'Barbie', N'The film follows Barbie, an iconic character in American animation, as she leaves her comfortable home life in Barbieland and ventures into the real world to find the answer to the question that always lingers in her mind: "Have you ever thought about death?". Along the way, she is joined by her doll Ken, who will bring a lot of bright colors to Barbie''s journey.', CAST(N'2023-07-21' AS Date), 114, N'English', N'pBk4NYhWNMM', N'pBk4NYhWNMM', N'https://i.ebayimg.com/00/s/MTQxN1g5OTI=/z/Pw4AAOSwLu5kwl9F/$_57.JPG?set_id=8800005007', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Greta Gerwig', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (38, N'Oppenheimer', N'The film revolves around the life of the great American theoretical physicist J. Robert Oppenheimer and the historical context of the last years of World War II. He was the one who collaborated in developing the first nuclear weapons in the Manhattan Project, known as the "father" of the atomic bomb. He is a controversial figure and also the contradiction and conflict within himself when faced with the question of being a scientific genius, a hero or a world destroyer, when contributing to the creation of terrifying weapons of destruction.', CAST(N'2023-07-21' AS Date), 180, N'English', N'uYPbbksJxIg', N'uYPbbksJxIg', N'https://m.media-amazon.com/images/M/MV5BN2JkMDc5MGQtZjg3YS00NmFiLWIyZmQtZTJmNTM5MjVmYTQ4XkEyXkFqcGc@._V1_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Christopher Nolan', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (39, N'Avatar: The Way of Water', N'Avatar: The Way of Water opens 15 years after the events of the first film. Emerging from a fierce war with the Sky People, Jake Sully (Sam Worthington) and Neytiri (Zoe Saldana) have found peace together. They become husband and wife, have children and in the blink of an eye, become parents of four children. But that peaceful life does not last forever when danger once again comes from a distant star in the sky. After a painful spiritual struggle, the Sully family must leave their homeland in the mountains and forests, becoming refugees with the Metkayina tribe scattered across the coastal regions of Pandora.

In Metkayina, the Sully family must learn to adapt to a new living environment, integrating into a culture that is both familiar and strange. The Sully children - eldest son Neteyam (Jamie Flatters), second son Lo''ak (Britain Dalton), youngest daughter Tuk (Trinity Jo-Li Bliss), and adopted daughter Kiri (Sigourney Weaver) - quickly befriend the Metkayina children and together explore the majestic ecosystem beneath the ocean. But amid their peaceful existence, Neytiri still feels her life is precarious, Jake is wary of the danger lurking above, and his children react very differently to the sudden migration. To make matters worse, Jake Sully''s arch-enemy has once again arrived at the family''s doorstep.', CAST(N'2022-12-16' AS Date), 192, N'English', N'd9MyW72ELq0', N'QARzhjrG3cU', N'https://m.media-amazon.com/images/I/71Lvqoov42L.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'James Cameron', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (40, N'The Batman', N'The plot picks up two years after Bruce Wayne (Robert Pattinson) dons the black cape and fights crime as Batman. On Halloween, a mysterious man calling himself The Riddler murders the mayor of Gotham City. Police officer James Gordon discovers that the killer left a message directly addressed to Batman. The two work together to find out the identity of the villain. Meanwhile, The Riddler continues to carry out many other missions and constantly sends challenges to Batman. Bruce Wayne follows the traces, discovering secrets about the powerful figures in Gotham and his family''s past.', CAST(N'2022-03-04' AS Date), 176, N'English', N'mqqft2x_Aa4', N'mqqft2x_Aa4', N'https://m.media-amazon.com/images/M/MV5BZGY3ZDI1YmUtNWVhNi00OTk0LThiYjAtZTE5YmNkNmY4MTcxXkEyXkFqcGc@._V1_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Matt Reeves', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (41, N'Mission: Impossible – Fallout', N'Mission: Impossible – Fallout takes place two years after terrorist leader Solomon Lane (played by Sean Harris) was imprisoned. At this time, members of his Syndicate organization gathered into a group called the Apostles. During a clash with this group, agent Ethan Hunt (played by Tom Cruise) made a big mistake. He and his team must race against time to correct their mistake and stop the terrorists. Not completely trusting Hunt, the CIA sends assassin August Walker (played by Henry Cavill) to support and watch over him. The mission becomes complicated with the participation of many factions, including Ilsa Faust (played by Rebecca Ferguson) - a mysterious female agent who has feelings for Hunt. The agents discover a big conspiracy that can disrupt the whole world.', CAST(N'2018-07-27' AS Date), 147, N'English', N'wb49-oV0F78', N'wb49-oV0F78', N'https://artofthemovies.co.uk/cdn/shop/products/mission_impossible_fallout_cast_style_teaser_EB04365_B_2_framed1-522059.jpg?v=1611688123', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Christopher McQuarrie', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (42, N'La La Land', N'Sebastian (Ryan Gosling) is a romantic pianist with a desire to revive the purity of Jazz music. Mia (Emma Stone) is a young girl with a dream of asserting herself under the spotlight. 2 dreamers in the splendid city of Los Angeles, 2 romantic souls in the harsh reality. Their love is like a beautiful dance to charming Jazz music, with harmonious movements combined with high and low notes taking viewers through every range of emotions. The song begins in the cold, lonely atmosphere of winter, where chance encounters are arranged by fate. Then it gradually becomes sweet, mixed with a bit of shyness of a budding love when spring comes. The rays of summer sunshine bring warmth to emotions, bringing love to the peak of happiness. Autumn brings sad notes, when harsh reality begins to invade the beautiful dreams of the couple. And then the winter chorus closes the emotional love song. I will let you watch the movie yourself to know the ending of a love story, but surely you will feel regretful when the song ends.', CAST(N'2016-12-09' AS Date), 128, N'English', N'0pdqf4P9MB8', N'0g56Q7OC1Uc', N'https://www.autograph-gallery.com/cdn/shop/products/57_1e0563e2-ce3d-4ee4-b255-9e54fb2a1003_1200x1200.jpg?v=1578308850', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Damien Chazelle', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (43, N'Inception', N'Inception is set in a time when the military has developed dream-sharing technology, which people like Dom Cobb (Leonardo DiCaprio) use to break into the dreams of their subjects to extract information. This ability makes Cobb sought after in the intelligence and underworld circles, but also makes him a globally wanted criminal, unable to return to the US to see his family.

Cobb is offered a special mission by businessman Saito (Ken Watanabe) in exchange for being cleared of his crimes: planting a new idea in the mind of a businessman, manipulating him to destroy the business left by his recently deceased father. Alongside Cobb is a team of professionals, each with a different expertise, including Ariadne (Ellen Page), Eames (Tom Hardy) and Arthur (Joseph Gordon-Levitt).', CAST(N'2010-07-16' AS Date), 148, N'English', N'YoHD9XEInc0', N'YoHD9XEInc0', N'https://m.media-amazon.com/images/M/MV5BMjExMjkwNTQ0Nl5BMl5BanBnXkFtZTcwNTY0OTk1Mw@@._V1_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Christopher Nolan', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (79, N'TREN BAN NHAU DUOI BAN MUU', N'Trên Bàn Nhậu, Dưới Bàn Mưu xoay quanh nhóm 3 cô gái độc thân với 3 tính cách khác nhau: Gạo (Diệu Nhi) bao dung, ngây ngô &nbsp;trong tình yêu, Du Lai (Khả Như) vô tri, hồn nhiên, Triệu (Thúy Ngân) mạnh mẽ, nóng tính. Ngoài ra là sự hài hước, nhiệt tình lẫn “báo đời” của ông chủ quán Bang Bang kiêm Trí (Kiều Minh Tuấn). Cũng như bao người, 4 nhân vật gặp phải nhiều khó khăn trắc trở trong sự nghiệp lẫn tình cảm. Trực (Trần Ngọc Vàng) vào vai doanh nhân “rởm” chuyên “lùa gà”. Không chỉ lừa đảo tiền, Trực còn lừa luôn tình cảm của Gạo.
Sự gần gũi, sát thực tế về mặt nội dung là điểm cộng đầu tiên của bộ phim. Kịch bản phim được xây dựng khá tốt, dùng ít phút đầu để giới thiệu về hoàn cảnh, số phận của các nhân vật. Phim càng về sau càng nhanh, góp phần để nội dung câu chuyện lên cao trào, nhưng vẫn đảm bảo tính lô-gic.', CAST(N'2023-12-29' AS Date), 100, N'Vietnamese', N'rZYVIK0R6sg', N'nfvIOcn7_UU', N'https://cdn.tuoitre.vn/thumb_w/730/471584752817336320/2023/11/2/teaser-poster-social-16989348779561560301971.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Tien M.Nguyen', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (87, N'SIEU LUA GAP SIEU LAY', N'Trong đoạn giới thiệu của bộ phim Siêu Lầy Gặp Siêu Lừa cho thấy, đây phim mang phong cách hành động kịch tính nhưng đan xen nhiều chi tiết hài hước và thú vị. Khoa là một tên đi lừa đảo nghiệp dư, đến Phú Quốc với mong muốn thực hiện được phi vụ lừa đảo tầm cỡ, từ đó có thể đổi đời. Đến Phú Quốc, Khoa gặp lại Tú. Anh ta vốn là một tay lừa đảo chuyên nghiệp nhiều năm trong nghề. Cả hai nhanh chóng nhận ra nhau và có những màn kết hợp vô cùng ăn ý. Tuy nhiên, cặp đôi cũng vướng vào nhiều tình huống trớ trêu khiến cho người xem dở khóc dở cười. Không lâu sau thì nhóm nhận thêm hai thành viên là ông Năm và bé Mã Lai. Bộ tứ này hứa hẹn sẽ đem lại cho người xem những tràng cười vỡ bụng.', CAST(N'2023-01-22' AS Date), 112, N'Vietnamese', N'ecNMIlP7wIs', N'z_6TfTkAFUw', N'https://th.bing.com/th/id/R.089953ed6d07875a75de02edba10d218?rik=49pwKVTzvEfGHA&pid=ImgRaw&r=0', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Vo Thanh Hoa', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (88, N'PHIM TRUONG MA', N'Câu chuyện kể về một đoàn làm phim tìm đến bối cảnh là một ngôi nhà hoang giữa rừng núi hẻo lánh. Trên đường đi, họ bị cảnh báo về một điều kỳ lạ ở nơi đó. Trong quá trình làm việc, nhiều thành viên trong đoàn nhận ra những hiện tượng lạ lùng. Cao trào là khi đạo diễn (Hà Việt Dũng đóng) phát hiện nữ diễn viên chính (Lan Ngọc đóng) có biểu hiện giống với một cô gái đã mất tích trước đó.', CAST(N'2016-09-09' AS Date), 95, N'Vietnamese', N'dmjhI91gJjE', N'yyqLRXsezag', N'https://i.pinimg.com/originals/82/f1/88/82f188eac377824462cb8fee60236932.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Vu Thai Hoa', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (89, N'DOI MAT AM DUONG - THE EYES', N'Đôi mắt âm dương là câu chuyện về Trang – một họa sĩ tài năng vừa trải qua vụ tai nạn khiến cô mất trí nhớ và đồng thời phải thay luôn đôi mắt của mình. Tỉnh dậy sau vụ tai nạn bị cướp mất trí nhớ, nhưng bù lại Trang họa sĩ có được đôi mắt có khả năng nhìn thấy người cõi âm. Tuy nhiên điều đó chẳng sung sướng gì đôi mắt của Trang thường xuyên nhìn thấy một cô gái mặc váy trắng dài, người đẫm máu và khuôn mặt bị che hoàn toàn bởi mái tóc bù xù. Ám ảnh về linh hồn cô gái mãi bám theo mình, Trang và người họa sĩ của mình đã quyết định lấy thân phận là phóng viên đang muốn tìm hiểu về 1 vụ tự tử của nữ ca sĩ Lisa để tìm ra chân tướng cuối cùng về bóng ma vẫn luôn bám theo Trang. Dần dần Trang phát hiện ra rất nhiều bí mật đã bị che giấu kể từ điểm cô quay trở về từ bệnh viện.', CAST(N'2020-01-25' AS Date), 100, N'Vietnamese', N'J_xN8O0Ag5U', N'kvTCBOHGWCw', N'https://th.bing.com/th/id/R.fc808fb32fd7dee35c4e4c4f61e0d3f1?rik=Zv9IXjCB9O0jKg&pid=ImgRaw&r=0', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Nhat Trung', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (90, N'GIA GAN MY NHAN VA GANG TO', N'Phim Già Gân, Mỹ Nhân Và Găng Tơ: lấy bối cảnh dịp Noel trong cả quá khứ và hiện tại. Ông Tỏi – một lão “già gân” chẳng có gì ngoài tiền và sự cô đơn, bấy lâu nay vẫn luôn sống trong những hồi tưởng về một thời đã qua, một người vợ đã xa… Rồi một ngày nọ, khi ông ta quyết định đi một chuyến thì hàng loạt chuyện gay cấn, kịch tính, thú vị bất ngờ xuất hiện! Ông ta đi đâu? Gặp ai? Chuyện gì đã xảy ra? Mà lại xảy ra với một “Già gân” chính hiệu?', CAST(N'2015-12-24' AS Date), 90, N'Vietnamese', N'xCownQnM0T0', N'xQ-FP5YDPD4', N'https://1.bp.blogspot.com/-8pCLUMYByHQ/Wyjpo-dUAgI/AAAAAAAAD5o/IzzKGwnbozwYPeWyvJmzZ31bSpS7gDmmwCLcBGAs/s1600/gia-gan-my-nhan-va-gang-to.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Duc Thinh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (91, N'DAO PHO VA PIANO', N'Lấy bối cảnh trận chiến đông xuân kéo dài 60 ngày đêm từ cuối năm 1946 đến đầu năm 1947 ở Hà Nội, câu chuyện theo chân chàng dân quân Văn Dân và chuyện tình với nàng tiểu thư đam mê dương cầm Thục Hương. Khi những người khác đã di tản lên chiến khu, họ quyết định cố thủ lại mảnh đất thủ đô đã tan hoang vì bom đạn, mặc cho những hiểm nguy đang chờ đợi trước mắt.', CAST(N'2024-02-20' AS Date), 100, N'Vietnamese', N'qn1t_biQigc', N'mDTtsIjiqzg', N'https://thethaovanhoa.mediacdn.vn/thumb_w/640/372676912336973824/2023/9/24/poster-16955976525061607232379.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Phi Tien Son', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (92, N'BA VO CUOI VO BA', N'Ba Vợ Cưới Vợ Ba là một bộ phim tình cảm hài hước của đạo diễn Eric Hải vừa được ra mắt năm 2016 xoay quanh câu chuyện về một ông lão khó tình tên là Năm Nhẹp và cô cháu gái của mình. Trong phim tuy rất yêu thương cô cháu gái của mình và luôn thúc cô sớm tìm một tấm chồng như ý nhưng mỗi khi người yêu của cô cháu gái đến ra mắt thì Năm Nhẹp luôn tìm cách thử thách các đối tượng bằng vô vàng những chiêu trò thú vị hài hước. Liệu ai sẻ là người vượt qua được những thử thách khó khăn của Năm Nhẹp để cưới được cháu gái ông ta mời các bạn đón xem bộ phim Ba Vợ Cưới Vợ Ba để biết rõ hơn nhé. Chúc các bạn xem phim vui vẻ.
', CAST(N'2016-12-23' AS Date), 90, N'Vietnamese', N'SsU84Wzo23Q', N'JmkizZLfvXs', N'https://th.bing.com/th/id/OIP.hOFkv9L2xjYGJQJ7OEsD7QHaLF?rs=1&pid=ImgDetMain', N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Eric Hai', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (93, N'KE AN HON', N'Kẻ Ăn Hồn kể về hàng loạt cái chết bí ẩn ở Làng Địa Ngục, nơi có ma thuật cổ xưa: 5 mạng đổi bình Rượu Sọ Người. Thập Nương - cô gái áo đỏ là kẻ nắm giữ bí thuật luyện nên loại rượu mạnh nhất! Phim điện ảnh chuyển thể từ tiểu thuyết gốc cùng tên của nhà văn Thảo Trang. Ngoài hình ảnh đám cưới chuột, khán giả còn được thấy những hình tượng đậm văn hóa Việt là bầy rối nước, thủy đình, bài vè… Bên cạnh đó, những chi tiết vốn được yêu thích ở làng Địa Ngục như bà Vạn lái đò chở vong hồn, mồ hôi máu, đom đóm câu hồn sẽ lần lượt xuất hiện trên màn ảnh rộng. Lấy bối cảnh ở ngay làng Địa Ngục, phim sẽ kể về cuộc hành trình tìm ra loại cổ thuật xuất hiện ở chính ngôi làng này. Loại cổ thuật đó có tên là Rượu sọ người, nghe nói nếu ai luyện được loại thuật này thì sẽ có pháp lực cực mạnh, có thể điều khiển ma quỷ, bắt hồn người khác. Thập Nương - cô gái áo đỏ là kẻ nắm giữ bí thuật luyện nên loại rượu mạnh nhất!', CAST(N'2023-12-08' AS Date), 109, N'Vietnamese', N'xWh0g4rKGjI', N'mrneW3E2wU0', N'https://tranglamdep.net/wp-content/uploads/2023/11/poster-ke-an-hon.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Tran Huu Tan', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (94, N'TAXI - EM TEN GI', N'Được trình chiếu nhân dịp Quốc tế phụ nữ, Taxi, em tên gì? lấy câu chuyện về một chàng trai đa tình để miêu tả nỗi lòng của “một nửa thế giới”. Là bộ phim hài hành trình (road trip comedy) đúng nghĩa, tác phẩm dẫn dắt khán giả bước vào chuyến đi định mệnh của nhân vật chính, nhưng đồng thời cũng chính là phép thử để định nghĩa lại tình yêu của anh. Gương mặt ăn khách Trường Giang đã có một màn tung hứng ăn ý cùng bóng hồng Angela Phương Trinh sau khoảng thời gian dài cô vắng bóng trên màn ảnh, tạo nên cuốn phim hài - lãng mạn duyên dáng mà sâu sắc. Trong lúc vội vã về Đà Lạt để gặp mặt người yêu, chàng tiến sĩ đãng trí Thượng Phong (Trường Giang) để lỡ mất chuyến bay. Anh vô tình bước lên chiếc taxi màu vàng của nàng quái xế Bình Chi (Angela Phương Trinh), để rồi từ đó hàng loạt tình huống dở khóc dở cười xảy đến. Trên chuyến xe ấy, cả hai đã trải qua nhiều cung bậc cảm xúc khác nhau, từ những khoảnh khắc chớm nở của tình yêu cho đến giây phút sinh tử. Thượng Phong bắt đầu đem lòng yêu người bạn đồng hành của mình. Nhưng ngay vào lúc đó, người yêu của anh lại xuất hiện…', CAST(N'2016-03-04' AS Date), 95, N'Vietnamese', N'yEB2RqAcuAw', N'Y5nyJKQ_5JE', N'https://upload.wikimedia.org/wikipedia/vi/0/0d/TAXI-EM-TEN-GI.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Duc Thinh, Dinh Tan Vu', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (95, N'CHAY DI ROI TINH', N'Phim kể về nữ ca sĩ hộp đêm ngoài 30 tuổi - Phương Trinh (Diễm My đóng) - nuôi mộng thoát khỏi cảnh sống nghèo túng với anh chồng bán sữa đậu nành tên là Đông Hùng (Hứa Vĩ Văn) và đứa con 12 tuổi Subin (Trọng Khang). Cô quyết định bán nhẫn cưới, song kế hoạch bất thành khi gia đình cô đụng độ một băng cướp trong tiệm kim hoàn. Con trai của Phương Trinh vô tình ghi lại được chân dung hai kẻ cướp. Điều này khiến gia đình ca sĩ trở thành mục tiêu săn lùng của chúng. Cùng lúc, một đặc vụ tự xưng (Việt Hương đóng) bày kế hoạch cứu cả nhà người đẹp bằng cách kéo họ trốn đi xa trên chiếc xe in hình vẽ nhân vật Minion.', CAST(N'2017-01-28' AS Date), 100, N'Vietnamese', N'YmyMXAMbBbg', N'KCqrpd7qJ3Y', N'https://th.bing.com/th/id/OIP.Wcg-bcqGacKGPdAmyIwtXwHaK-?rs=1&pid=ImgDetMain', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Nam Cito', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (96, N'SOLDIER BOY', N'The English title of the film is Soldier Boy, which is based on real events in Russia''s war history. The main character of the film is the youngest soldier in Russia''s Patriotic War at the time of World War II, 6-year-old Sergei Aleshkov. Seryozha Aleshkov lost his family, was rescued by an army regiment and took part in battles. The soldier was awarded the Military Merit Medal. Tragedy and love, danger and hope, the bitterness of separation and the joy of belonging, all bring viewers many emotions, with Vietnamese audiences will surely think of "The little boy" in the poem "Gathering" by poet To Huu.

', CAST(N'2019-01-22' AS Date), 86, N'Russian', N'Tz9ykDw_Ppo', N'DQ6Ncovb8vc', N'https://m.media-amazon.com/images/M/MV5BOTY4NzA0ZDUtNDJlMi00NDYxLWE1ODctYjIxM2VjNTUxOWQwXkEyXkFqcGdeQXVyMzYyMDAzNDU@._V1_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Viktoria Fanasiutina', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (97, N'DIRTY ANGLE', N'In the wake of the U.S. withdrawal from Afghanistan in 2021, a group of female soldiers posing as medical aid workers were sent back to rescue a group of kidnapped teenagers, caught in the middle of the conflict between ISIS and the Taliban.', CAST(N'2024-12-01' AS Date), 105, N'English', N'YBwoSa3n8Yc', N'YBwoSa3n8Yc', N'https://m.media-amazon.com/images/I/51WPnL4XUHL.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N' Martin Campbell', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (98, N'MULAN', N'Starting from a poem about the heroine Mulan pretending to be a boy instead of her father into the fighting army, Disney released an animated version of Mulan in 1998. In 2020, Disney continued to produce a live-action version of Mulan with Liu Yifei''s acting. Mulan (2020) is about a strong, martial arts girl Mulan who doesn''t like to get married. When the country had foreign invaders, worried about her elderly and weak father, Mulan secretly disguised herself as a male and replaced her father to join the army. From here, Mulan practiced martial arts, participated in combat and confronted the witch Fairy Nuong, who was a bird wing perched on the shoulder of the villain Thien Vu.', CAST(N'2020-09-04' AS Date), 110, N'Chinese', N'KK8FHdFluOQ', N'KK8FHdFluOQ', N'https://www.themoviedb.org/t/p/original/8qGnUPWVKO2yJkfpeo1AmRV3WmD.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Niki Caro', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (99, N'PARASITE', N'Unemployed, penniless, and above all, desperate, the breadwinner of the family, Ki-taek, and four equally ambitious members of his family, his supportive wife, Chung-sook; the 20-year-old daughter who is good at counterfeiting Ki Jung and the ambitious son Ki-woo – make a living by folding pizza boxes in a shabby basement in Seoul. Later, thanks to luck, Ki-woo became a tutor for the daughter of the wealthy Park family, from here paving the way for an ingenious cunning plot for the Ki family to "change their lives". Now, the stage seems to be set for a relentless class war. How do I get rid of parasites?', CAST(N'2020-02-07' AS Date), 132, N'Korean', N'5xH0HfJHsaY', N'5xH0HfJHsaY', N'https://i0.wp.com/cafebiblioart.com/wp-content/uploads/2022/08/parasite-korean-movie.webp?resize=1080%2C1441', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Bong Joon Ho', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (100, N'1917', N'1917 is set in World War I, "reconstructed" history by director Sam Mendes based on his grandfather''s account. The film follows 2 ruling soldiers, Blake (Dean-Charles Chapman) and Will (George McKay), who are tasked with bringing the armistice to the front line to prevent 1600 soldiers from falling into the trap of the German army. Not only that, General Erinmore (Colin Firth) also announced that if Blake and Will did not bring the armistice letter by dawn the next day, all the soldiers, &nbsp;including Blake''s brother, would die. Blake, out of anxiety and determination to save his brother, accepted the task with enthusiastic eyes. And Will is more worried because the two of them will have to cross trenches, cross the border area that is fiercely fighting, rain of bombs and bullets and full of corpses.', CAST(N'2020-01-10' AS Date), 120, N'English', N'YqNYrYUiMfg', N'YqNYrYUiMfg', N'https://th.bing.com/th/id/OIP.8k_6_l291ju4FbeETImw3gHaKe?rs=1&pid=ImgDetMain', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Sam Mendes', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (101, N'BLACK PANTHER', N'On August 28, 2020, the main actor of Black Panther, Chadwick Boseman, suddenly passed away at the age of 43 due to cancer. Because of this, Marvel''s Black Panther movie is sought after and rewatched more by fans and audiences to commemorate this talented but short-lived actor. On August 28, 2020, the main actor of Black Panther, Chadwick Boseman, suddenly passed away at the age of 43 due to cancer. Because of this, Marvel''s Black Panther movie is sought after and rewatched more by fans and audiences to commemorate this talented but short-lived actor.', CAST(N'2018-02-13' AS Date), 134, N'English', N'xjDjIWPwcPU', N'xjDjIWPwcPU', N'https://th.bing.com/th/id/OIP.sM28yxHrxqiaiXPSJlD10QHaLH?rs=1&pid=ImgDetMain', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ryan Coogler', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (102, N'365 DNI', N'Massimo Torricelli, a young and handsome boss of a Sicilian Mafia family, had no choice but to take over the family business after his father was assassinated. Laura is a sales manager in a luxury hotel in Warsaw. She has a successful career, but her private life lacks passion. Laura, along with her dry boyfriend, Martin, and several other friends, book a trip to Sicily in hopes of warming up their love. Laura didn''t expect that Massimo, the most dangerous man on the island, would stand in her way, kidnap her, detain her, and give her 365 days — to love him.', CAST(N'2020-02-14' AS Date), 116, N'Polish', N'iXdw5wYI4cY', N'iXdw5wYI4cY', N'https://bloganchoi.com/wp-content/uploads/2020/05/poster-365-dayss-696x980.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Barbara Białowąs, Tomasz Mandes', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (103, N'CONTAGION OF FEAR', N'It was released in 2011, but in 2020, Contagion became famous again because of the appearance of the COVID-19 pandemic, which has many similarities to the pandemic depicted in the film. Shortly after returning from a business trip to Hong Kong, Beth Emhoff died of the flu, or a similar illness. Her young son died later the same day. However, her husband, Mitch seems to be immune. From here, there began to be the spread of the deadly infectious virus. But it must be several days before anyone realizes the extent or severity of this new infection. They must first identify the virus in question and then find a way to fight it, a process that will likely take several months. As the disease spread to millions of people worldwide, the social order began to break down as people panicked at the impending death.', CAST(N'2010-11-21' AS Date), 105, N'English', N'4sYSyuuLk5g', N'cCzu-N043_8', N'https://th.bing.com/th/id/OIP.OpPqsDjnJG-oqKxkGIgYCwHaLH?rs=1&pid=ImgDetMain', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Steven Soderbergh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (104, N'TANET', N'An unnamed CIA agent, known as the Protagonist, is chosen to join the ranks of a shadow government organization called Tenet: a group tasked with ensuring the survival of humanity. Believing in grasping a terrifying advanced technology and an imminent attack from the future, the protagonist teams up with his elusive new partner, Neil, following a faint trail that leads to the Russian villain oligarch Andrei Sator,  a rebellious tycoon with foresight, preparing for World War III. The protagonist will soon master the art of "time reversal" as a way to counter the impending threat.', CAST(N'2020-08-26' AS Date), 150, N'English', N'L3pk_TBkihU', N'L3pk_TBkihU', N'https://th.bing.com/th/id/OIP.J9b9yJvcRxnb3Df5jILAdQHaK-?rs=1&pid=ImgDetMain', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Christopher Nolan', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (107, N'VONG EO 56', N'“Vòng eo 56” kể về cuộc đời cô gái tên Trinh, xuất thân trong gia đình quê mùa, nghèo khó ở miền Tây Nam bộ. Do muốn trả nợ giúp ba mẹ, các anh chị em và cả Trinh đều xin lên Sài Gòn đi làm kiếm tiền. Cũng từ đây, Trinh bén duyên với nghề người mẫu – ước mơ của cô từ thuở ấu thơ. Nhưng đường đến thành công vốn không trải đầy hoa hồng, Trinh phải đối mặt với vô số cạm bẫy về tiền tài, danh vọng, tình yêu, trong khi trên vai vẫn luôn là gánh nặng lo cho gia đình…', CAST(N'2016-04-06' AS Date), 100, N'Vietnamese', N'VpJv6UAv8mU', N'ac6VipTgNUc', N'https://genk.mediacdn.vn/k:2016/4-1454313169052/phim-moi-tinh-cua-ngoc-trinh-vong-eo-56-gay-sot-tai-viet-nam.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Vu Ngoc Dang', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (111, N'NGHE SIEU DE', N'Nội dung Nghề Siêu Dễ xoay quanh Thái (Hứa Vĩ Văn) – một cảnh sát về hưu vì chấn thương chân trong khi làm nhiệm vụ. Tuy nhiên, anh vẫn không thể quen với việc "ở không" và hay tự mình điều tra các vụ án trong khu phố. Một ngày nọ, Thái vô tình gặp lại Hoàng (Tiến Luật) – tay trùm xã hội đen đã lái xe cán chân anh năm xưa. Do không tìm được bằng chứng phạm tội nên Hoàng được mãn hạn tù sớm. Nghi ngờ đối phương tiếp tục buôn ma túy, Thái mua lại quán cơm tấm đối diện căn biệt thự của Hoàng. Chàng cựu cảnh sát cũng thuê một nhóm "đầu đường xó chợ" về làm nhân viên gồm Thu (Thu Trang), Phú (Kiều Minh Tuấn), Vinh (Huỳnh Phương) và Mèo (Quang Tuấn). Vốn chỉ là bức bình phong che dấu việc theo dõi Hoàng, quán cơm tấm của Thái bỗng ăn nên làm ra nhờ món sườn bò nướng vị phở đặc sắc. Công việc kinh doanh khấm khá khiến việc điều tra dần chệch hướng cùng nhiều rắc rối phát sinh.', CAST(N'2022-04-29' AS Date), 113, N'Vietnamese', N'odb5t4i3EKs', N'2x4TdXkZTbw', N'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/r/s/rsz_nsd_main-poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Vo Thanh Hoa', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (112, N'LAT MAT 2: PHIM TRUONG', N'Nội dung phim này chủ yếu nói về Trung, một cascadeur chuyên nghiệp kiêm đạo diễn chỉ đạo võ thuật cho đoàn phim. Nhân vật này tâm huyết với công việc của mình nhưng đoàn phim đang quay thì gặp khó khăn về vốn khiến phải dừng lại đột ngột. Đạo diễn phim này là người có tài, năng lực nhưng lại thiếu vốn đến mức bị xiết nhà và rao bán thêm một cái nhà khác. Trước tình hình khó khăn của đạo diễn, Trung và em trai quyết định nhận lời làm việc cho một “đại gia” với hy vọng ông này tiếp vốn cho đoàn phim…', CAST(N'2016-04-29' AS Date), 90, N'Vietnamese', N'bmZq35kSWio', N'UuobduRJijk', N'https://upload.wikimedia.org/wikipedia/vi/1/17/Lat_Mat_2_Poster.jpeg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ly Hai', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (113, N'LO TO', N'Nội dung phim xoay quanh câu chuyện về cậu bé tên Đực, từ khi sinh ra cho đến lúc trưởng thành, Đực mang hình dáng của một cậu con trai nhưng chứa đựng tâm hồn của một người thiếu nữ. Càng mong muốn được sống là chính mình bao nhiêu, Đực càng bị gia đình phản đối và hàng xóm rẻ khinh bấy nhiêu. Khi gia đình ép Đực cưới vợ, Đực chạy trốn giữa đêm khuya mang theo khát vọng sống mãnh liệt để tìm lại chính bản thân mình. Năm tháng trôi qua, từ sau cái đêm định mệnh đó chàng trai tên Đực ngày nào đã trở thành Lệ Liễu của gánh hát Phù Hoa. Sau khi ông bầu Lê Minh mất, Lệ Liễu tiếp tục chèo lái gánh hát và che chở cho những phận đời bất hạnh giống mình năm xưa.', CAST(N'2017-03-31' AS Date), 90, N'Vietnamese', N'4qSBqPvL6bY', N'xFBIEYbCPL0', N'https://kenh14cdn.com/thumb_w/640/2017/lo-tomob03-1513193822297.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Huynh Tuan Anh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (114, N'HOAN DOI', N'Nội dung của Hoán Đổi làm nhớ đến bộ phim gần đây nhất mà người viết được xem có yếu tố hoán đổi thể xác đó là your Name. Nếu như trong your name., lý do tại sao hai nhân vật chính bị hoán đổi với nhau là một bí ẩn và luôn khiến cho người xem phải tò mò xuyên suốt bộ phim thì trong Hoán Đổi, bà Hoa và Tiên Tiên lại bị một cơn lốc xoáy từ đâu mà ra xuất hiện cuốn vào và từ đó bị hoán đổi với nhau. Dĩ nhiên yếu tố hai người bị hoán đổi thể xác là một yếu tố kỳ ảo, được sử dụng làm công cụ xây dựng nội dung phim, thế nhưng ít nhất nó cũng phải có một chút gì đó phù hợp với bối cảnh của bộ phim, chứ không phải cứ thêm đại vào một chi tiết như thế rồi cho qua để có thể tiếp tục kể câu chuyện chính. Điều này khiến cho bộ phim trở nên rời rạc, khiến cho người xem không thể hiểu chuyện gì đang xảy ra và không thèm giúp họ tìm thấy được câu trả lời.', CAST(N'2018-08-31' AS Date), 95, N'Vietnamese', N'PEDyxW7V25k', N'E2pvdbl-N64', N'https://cdn.galaxycine.vn/media/2020/9/30/hoan-doi-5_1601456552988.jpg', N'28e1aef4-7a8a-40f3-a0f5-fd3e325d0726', N'Vo Thanh Hoa', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (115, N'BI MAT LAI BI MAT', N'Nội dung phim kể về một anh chàng nát rượu tên Sóc (do Lý Hải đóng) được nhận vào cửa chùa để nuôi dưỡng tâm tính. Ngôi chùa này có một bảo vật được cho rằng có khả năng “thay đổi cả nhân gian.” Trong một lần tình cờ, bí mật về bảo vật vô tình lọt tới tai Gà Ác (Nhật Cường) đồng thời cũng nhanh chóng lan truyền đến một tổ chức buôn bán vũ khí của tay trùm (Việt Anh) và tên trợ lý biến thái tên Bóp (Trấn Thành). Vậy là Sóc cùng sư trụ trì (Hoàng Sơn), dì Năm làm bếp (Cát Phượng) cùng các môn hộ của chùa phải chiến đấu để bảo vệ cho bảo vật kia.', CAST(N'2014-04-26' AS Date), 90, N'Vietnamese', N'aqG_FzqzHkU', N'3X9lJjsxkdM', N'https://dep.com.vn/Uploaded/thuytt/2014_05_05/poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ly Hai, Nhat Cuong', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (116, N'VE QUE AN TET', N'Chuyện phim bắt đầu đầy “bão táp” bằng chuyến xe nhốn nháo của nữ tài xế Đậu Xanh (Ngô Thanh Vân) và cậu em lơ xe Đậu Đỏ (Jun Phạm). Không còn là một phụ nữ quyền quý, nghiêm khắc, Ngô Thanh Vân nay thử sức với hình tượng mới mẻ: cô tài xế bụi bặm, nóng nảy, thỉnh thoảng pha trò trêu chọc cậu em trai ương bướng. Bởi lý do giới tính, Đậu Xanh bị bố đuổi khỏi nhà, cùng cậu em trai lang bạt kiếm sống trên chiếc xe khách tồi tàn chuyên chạy tuyến Sài Gòn - miền Tây. Nhưng bởi khả năng lái xe “kinh hoàng” của bộ đôi, rốt cuộc không còn bến nào dám nhận xe của hai chị em nhà Đậu nữa. Đang ngập trong nỗi lo “mất Tết” vì thất nghiệp, Đậu Xanh và Đậu Đỏ được Tư Ếch (Trung Dân) hào phóng bao trọn một chuyến xe. Họ có nhiệm vụ chở ông và chiếc hộp gia bảo về quê. Song, chuyến hành trình không hề suôn sẻ khi có sự xuất hiện của bốn vị khách bí ẩn, dẫn tới hàng loạt tình huống hài hước, ly kỳ.', CAST(N'2018-02-16' AS Date), 78, N'Vietnamese', N'HUxQIqTvqIU', N'v3-JJWs6lu4', N'https://upload.wikimedia.org/wikipedia/vi/c/ca/V%E1%BB%81_qu%C3%AA_%C4%83n_T%E1%BA%BFt_poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Nguyen Hoang Anh', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (117, N'LOC PHAT', N'Nhân vật chính của phim là anh chàng lùn, xấu lại còn... nghèo tên Lộc (Hiếu Hiền). Trái ngược với cái tên đầy may mắn, Lộc luôn gặp xui xẻo khi giúp đỡ người khác. Lòng tốt của anh được đền đáp bằng những cú đấm, cú đánh, sự mắng nhiếc của mọi người. Cho tới một ngày cận Tết, “thần xui xẻo” vẫn tới tìm anh, Lộc quá chán nản và quyết định... không làm người tốt nữa mà chuyển qua nghề ăn cướp. Trong hành trình chạy trốn khỏi sự truy đuổi của tên sát thủ Cát (Bình Minh), Lộc lần lượt gặp những người bạn đồng hành Mai (Đinh Ngọc Diệp), Phát (Kiều Minh Tuấn), Tiền (Hoàng Sơn) và Vui (Hoàng Yến Chibi). Mỗi người một cảnh ngộ trái ngang hội tụ trên chuyến xe “bão táp” định mệnh, mang lại những tràng cười bất tân cùng sư ngâm ngùi, cảm thông của khán giả.', CAST(N'2016-02-05' AS Date), 99, N'Vietnamese', N'pEgvzLUbuTU', N'JjNepZUW0Mw', N'https://photo.znews.vn/w660/Uploaded/xbhunku/2016_02_04/Loc_Phat__Official__poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Le Bao Trung', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (118, N'HON PAPA DA CON GAI', N'Hải (Thái Hòa) và Châu (Kaity Nguyễn) là hai cha con nhưng giữa họ có một khoảng cách lớn kể từ khi mẹ Châu (Mỹ Duyên) qua đời. Châu tuy mới 17 tuổi nhưng là một cô bé độc lập luôn bị ám ảnh bởi hình ảnh của mẹ và muốn trở thành một diễn viên ba lê tài năng, còn Hải là ông bố nhu nhược và hay dựa dẫm vì thế mà mâu thuẫn nảy sinh ngày càng lớn trong mối quan hệ giữa hai cha con. Cho đến một ngày sau trận cãi nhau lớn, linh hồn người mẹ đã hóa thành bướm và chuyển đổi thân xác của hai cha con, kể từ đó hàng loạt những rắc rối hài hước xảy ra khi người cha phải tập sống trong thân xác của con gái và ngược lại. Nhưng bất lợi đó cũng chính là cơ hội để hai cha con hiểu nhau và xích lại gần nhau hơn.', CAST(N'2018-12-28' AS Date), 110, N'Vietnamese', N'78zSq-jxI08', N'x-kSmNWTtWw', N'https://doanhnhanplus.vn/wp-content/uploads/2018/07/DN-poster-phim-hon-papa-da-con-gai-Tin-020718-2.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ken Ochiai', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (119, N'DAN CHOI KHONG SO CON ROI', N'Dân Chơi Không Sợ Con Rơi kể về hành trình gà trống nuôi con của Quân, một dân chơi sát gái chốn miệt vườn bỗng chốc bị kìm kẹp bởi sự xuất hiện của đứa con gái mà người yêu cũ bỏ lại. Hành trình này của Quân đầy rẫy những khó khăn nhưng cũng tràn ngập hạnh phúc với sự giúp đỡ của gia đình Tám Mánh (bạn Quân) cùng đoàn phim ở vùng quê. Hoang mang có, chán ghét có, phân vân và đau lòng cũng có, Quân dường như phải thay đổi từng chút một để hoàn thành nhiệm vụ lớn lao nhất mà cả đời này anh cũng không nghĩ tới: nuôi con. Từ một người cha còn không biết thay tã, còn không biết con mình là trai hay gái, Quân đã dần trưởng thành về mặt suy nghĩ để biết điều gì là cần làm để đem lại những thứ tốt đẹp nhất cho con gái mình. Phần này phim làm khá tốt khi xen kẽ được sự hài hước và tình cảm một cách rất tự nhiên và có duyên.', CAST(N'2022-07-29' AS Date), 98, N'Vietnamese', N'YjOdbS4oMuc', N'yHdcI6t9r18', N'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/8/0/800x1200-dckscr_1_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Huynh Dong', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (120, N'49 NGAY', N'Phim 49 Ngày xoay quanh anh chàng Đông mồ côi từ nhỏ, lớn lên thì bị cô bạn gái phũ phàng bỏ rơi, tài sản bị trộm khoắng sạch đến không còn xu dính túi… và anh quyết định tự tử nhưng không thành mà phải sống dở chết dở mà lại còn bị ba con ma bám theo "mượn xác" để tiêu khiển. Câu chuyện bắt đầu dở khóc dở cười từ đó, và cuộc đời của Đông rẽ sang một hướng khác…phim 49 Ngày, chết để sống tốt hơn.', CAST(N'2015-08-28' AS Date), 89, N'Vietnamese', N'EpKJsVzNv0g', N'lNjZRKO6GTc', N'https://i1-giaitri.vnecdn.net/2015/06/23/49-Ngay-Teaser-Poster-7120-1435027872.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=5j-V47HoRgNelSiGYy7AJw', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Nhat Trung', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (121, N'KHI CON LA NHA', N'Khi Con Là Nhà là một tác phẩm điện ảnh mới của đạo diễn Vũ Ngọc Đãng. Khác với những bộ phim theo đuổi đề tài khá nóng trong xã hội đã làm trước đó, lần này, vị đạo diễn “đầu trọc” cùng với người cộng sự quen thuộc của mình là diễn viên Lương Mạnh Hải thực hiện tác phẩm có đề tài về gia đình, tình cảm cha con. Phim kể về hai nhân vật chính là hai cha con Quang (Lương Mạnh Hải) – Bi (Duy Anh) đang có một cuộc sống tuy thiếu thốn, nghèo khó ở làng quê nhưng rất yên bình và hạnh phúc. Đến một ngày, vì cái thói ham mê cờ bạc, Quang bị công an truy nã. Từ đây, hai cha con bắt đầu một hành trình tha hương đầy cực khổ, vất vả. Họ phải lục rác để tìm thức ăn, đêm đến tranh giành chỗ ngủ với người khác ở dưới gầm cầu, chịu đựng những trận đòn nhừ tử… Nhưng bế tắc hơn cả là giữa thành phố lạ lẫm, xa hoa nhưng cũng lắm hiểm nguy, hai cha con lại bị lạc mất nhau. Liệu Quang sẽ làm gì để tìm được Bi? Hai cha con họ sẽ được sống những tháng ngày hạnh phúc như xưa chứ?', CAST(N'2017-12-28' AS Date), 83, N'Vietnamese', N'6ohkm1DMGjQ', N'kzFBB1ezRdE', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5xqMjIZ3DZoi5jn6Jcz7aYQTC_bWgayBQ3Q&s', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Vu Ngoc Dang', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (122, N'BLACK HAWK DOWN', N'The movie Black Hawk Down is based on the best-selling novel about the war in Somalia in October 1993. Due to disagreements in sharing power, civil war broke out in the country, which was already poor and suffering from chronic drought. The United Nations and humanitarian organizations rushed to intervene, but the relief shipments were stolen by Aidid - the most powerful leader, occupying the capital Mogadishu - to feed his troops. In that situation, 20,000 US troops landed in Somalia to restore order. Operation Black Hawk was deployed with the goal of capturing leader Aidid. Produced after the 9/11 event, the film not only talks about the war in Somalia, but above all, the noble camaraderie between soldiers. The film is staged on a large scale, magnificently with dramatic performances by actors Josh Hartnett, Ewan McGregor, Eric Bana, Orlando Bloom...', CAST(N'2001-12-28' AS Date), 93, N'English', N'2GfBkC3qs78', N'o-SiT7Pa8nk', N'https://posters.movieposterdb.com/06_10/2001/0265086/l_142462_0265086_e24b31c1.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ridley Scott', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (123, N'CRYPTO', N'The film follows Martin Duran (played by Beau Knapp), an anti-money laundering expert working at a major bank. He is assigned to investigate suspicious transactions in his hometown of New York. However, as he begins his investigation, Martin uncovers a complex plot involving money laundering, corruption, and a dangerous criminal organization using cryptocurrency to hide illegal activity. Besides, Martin also faces personal conflicts within his family, including strained relationships with his father and brother, as well as pressure from work. Crypto not only focuses on the world of digital finance, but also reflects the risks and challenges associated with blockchain technology and cryptocurrencies in the modern financial crime landscape.', CAST(N'2019-04-12' AS Date), 98, N'English', N'kYZut3DWvek', N'OYx-wXF57Ck', N'https://upload.wikimedia.org/wikipedia/en/b/b9/Crypto_%282019%29_Film_Poster.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'John Stalberg Jr.', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (124, N'GIRL ON THE THIRD FLOOR', N'A man looking to start his life over buys an old house to renovate for his pregnant wife. However, the house has a dark history, having been a brothel where many women were murdered. Don is gradually haunted by supernatural phenomena and a mysterious girl named Sarah. As the secrets are revealed, he faces his own guilt and the wrath of the haunted spirits. The film explores the themes of guilt, redemption and consequences.', CAST(N'2019-10-25' AS Date), 85, N'English', N'CGSPYUJKJPM', N'e7IA4CvN6zI', N'https://m.media-amazon.com/images/M/MV5BNzdiYWM0MDMtYzVjYy00NTc3LWE0NzYtZmExMDZjZDc4Mzk4XkEyXkFqcGc@._V1_.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Travis Stevens', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (125, N'12 ROUNDS', N'12 Rounds (2009) tells the story of Danny Fisher, a police officer who faces Miles Jackson, a dangerous criminal who has kidnapped his girlfriend, Cynthia. Jackson asks Danny to complete 12 dangerous missions to save her. Each mission is a deadly challenge, pushing Danny into tense and dangerous situations. He must use all his skills to save Cynthia and stop Jackson''s revenge plan. The film focuses on courage, love and determination in dire circumstances.', CAST(N'2009-03-27' AS Date), 140, N'English', N'9PoWpBQq2PY', N'5xSpC3yWHjw', N'https://upload.wikimedia.org/wikipedia/en/e/e0/12_Rounds_2_dvdcover.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Renny Harlin', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (126, N'A TRUE STORY', N'A True Story (2015) is a short film that tells the story of Michael (played by Michael J. White), a man who discovers that his life has been recorded and made into a film by a documentary film crew. Upon learning this truth, Michael decides to confront the people who created the film about his life, while also discovering previously unseen aspects of himself.', CAST(N'2015-04-21' AS Date), 102, N'English', N'Y_NiP_bqlns', N'AldvAr5IBLI', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShw-Wh5hO2_DsbdXf8B3ExaRauCfl4QzpLjB7daDzEsEEf9w59yhPHM19OC1KCovtsBbk&usqp=CAU', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Michael J. White', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (127, N'EM LA CUA EM', N'Hoàng (Ngô Kiến Huy đóng) dành cả tuổi trẻ để theo đuổi Quỳnh Anh (Maya đóng), hơn anh năm tuổi, nhưng không được đáp lại. Lần nọ, em trai Quỳnh Anh là Tú (Hoàng Phi), cũng là bạn thân của Hoàng, nhờ anh đưa người chị đang say xỉn về nhà trọ. Khi tỉnh dậy, cô gái hiểu nhầm Hoàng là kẻ biến thái đang sàm sỡ mình nên đuổi đánh anh. Hoàng đem sự việc kể lại với chị mình là Thanh (Khả Như), tin rằng anh "không có cửa". Thanh gợi ý với Hoàng phải giả làm phụ nữ mới có thể tiếp cận Quỳnh Anh. Trong vai "Hoàng Anh", Hoàng có cơ hội kết bạn và ở bên cạnh người phụ nữ anh thầm thương. Nhiều tình huống dở khóc dở cười xảy ra khi Tú ra sức tán tỉnh "chị Hoàng Anh", còn Quỳnh Anh lại hẹn hò với gã trai đểu Khoa (Hứa Vĩ Văn), khiến Hoàng vô cùng ức chế.', CAST(N'2021-01-08' AS Date), 97, N'Vietnamese', N'9m5HbGDFBrI', N'9m5HbGDFBrI', N'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/1800x/71252117777b696995f01934522c402d/e/l/elce_-_poster_facebook_size.jpg', N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Le Thien Vien', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (128, N'MA DA', N'Ma Da xoay quanh công việc hằng ngày vô cùng đặc biệt của bà Lệ (Việt Hương), đó là vớt xác người chết trên sông. Trong một lần đang đi vớt xác, bà Lệ vô tình đắc tội với Ma Da. Ma Da là một oan hồ sông nước, thường xuyên kéo chân người đang tắm sông để thế mạng cho mình. Bà Lệ bị Ma Da "ghim" nhưng không bị bắt đi, trái lại Ma Da đã bắt bé Nhung, con gái của bà Lệ. Để giải cứu con gái khỏi thế lực tà ác, bà Lệ nhờ đến sự giúp sức của người thân và hàng xóm. Dần dà, bí mật về oan hồn Ma Da vùng này cũng được hé lộ.', CAST(N'2024-08-16' AS Date), 95, N'Vietnamese', N'vC-KNlLNIso', N'8o0OJ_JaHk0', N'https://upload.wikimedia.org/wikipedia/vi/b/bd/%C3%81p_ph%C3%ADch_ch%C3%ADnh_th%E1%BB%A9c_Ma_Da.jpg', N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Nguyen Huu Hoang', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (129, N'100 NGAY BEN EM', N'Chuyện phim 100 ngày bên em xoay quanh Ánh Dương (Khả Ngân) - một vlogger nổi tiếng, trẻ trung, và xinh đẹp trên trên mạng xã hội với cuộc sống khiến bao người phải ghen tỵ. Cô gái chuẩn bị tổ chức đám cưới trong mơ với chàng bạn trai đại gia Lê Huy (B Trần). Nhưng khi đang đắm chìm giữa niềm hạnh phúc, Ánh Dương bỗng suy sụp khi phát hiện ra khối u não, rồi bị người yêu ruồng bỏ. Để lấp vào vị trí chú rể còn trống trong đám cưới sắp sửa diễn ra, nữ vlogger đành tìm đến người bạn cũ Nhật Minh (Jun Phạm). Vốn là một game thủ danh tiếng, anh nay chỉ là kẻ vô công rỗi nghề, ăn bám vợ chồng cậu em trai Minh Sơn - Thu Nga (Gin Tuấn Kiệt - Tam Triều Dâng). Giống như Ánh Dương, Nhật Minh cũng đang “gần đất xa trời” bởi căn bệnh ung thư cột sống. Từ bản “hợp đồng hôn nhân” đôi bên cùng có lợi, cả hai dần nảy sinh tình cảm. Song, cái chết luôn hiện hữu khi bệnh tình của họ ngày một xấu đi.', CAST(N'2018-04-25' AS Date), 98, N'Vietnamese', N'e6ieOmZlizM', N'cNuPVLfn4Wc', N'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/1/image/1800x/71252117777b696995f01934522c402d/1/0/100ngay406x600.jpg', N'28e1aef4-7a8a-40f3-a0f5-fd3e325d0726', N'Vu Ngoc Phuoc', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (130, N'CUOI NGAY KEO LO', N'Khánh Linh là một cô nàng nhân viên tòa soạn xinh đẹp, cô luôn có ước mơ trở thành thư ký tòa soạn. Người bạn thân làm việc chung với Linh tên là Bích Trâm - một người đàn ông nhưng phải giả gái để tiếp cận Linh, vai trò của Trâm trong tòa soạn là nhà tạo mẫu. Ông giám đốc bảo Linh rằng ông sẽ thăng chức cho cô nếu cô mời được anh chàng nhiếp ảnh gia Hồ Sơn về chụp ảnh cho tạp chí. Sơn và Linh gặp nhau trong vụ đụng xe ngoài đường, sau đó họ làm việc cùng nhau mặc dù không ưa nhau....', CAST(N'2012-04-20' AS Date), 85, N'Vietnamese', N'tlUFGUCGY5U', N'xXzeGUWAmeE', N'https://upload.wikimedia.org/wikipedia/vi/thumb/a/a9/Cuoingaykeolo.jpg/260px-Cuoingaykeolo.jpg', N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Charlie Nguyen', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (131, N'CO DAU HAO MON', N'Bộ phim xoay quanh một gia đình phông bạt bao gồm Tú Lạc, ông Hòa, bà Mạt luôn được giới thiệu là một gia đình kinh doanh truyền thống lâu đời đầy danh giá nhưng thực chất nghề truyền thống của nhà Tú Lạc là làm vàng mã. Tú Lạc luôn muốn thoát khỏi cảnh nghèo khó nên đã âm thầm thực hiện một kế hoạch táo bạo: kết hôn với Bảo Hoàng, CEO tập đoàn y tế nổi tiếng. Để có thể bước chân vào giới thượng lưu, gia đình Tú Lạc quyết định tiếp cận bà Phượng - mẹ của Bảo Hoàng bằng cách đóng giả thành một gia đình tri thức giàu có, gia giáo. Trong gia đình đóng giả đó, ông Hòa bỗng chốc trở thành một doanh nhân giàu có chuyên kinh doanh nghề thủ công. Còn bà Mạt đang từ làm giúp việc thành quản lý bất động sản cho giới thượng lưu. Tất cả những nghề nghiệp trên đều được gia đình Tú Lạc dựng nên một cách giả tạo để đổi lấy "môn đăng hộ đối" cho cô dâu Tú Lạc. Tuy nhiên, trong trailer mới nhất của phim, bà Phượng đã hét lên đầy chua xót, trách móc rằng "Các người nói những người giàu như chúng tôi thì độc ác, còn những người nghèo tham lam ích kỉ như các người thì tốt ở chỗ nào?”. Liệu có uẩn khúc gì đằng sau kế hoạch đổi đời của gia đình Tú Lạc và liệu Tú Lạc có thành công trót lọt gả vào nhà giàu hay không?', CAST(N'2024-10-18' AS Date), 114, N'Vietnamese', N'QJ8E9R70csY', N'aiDVSveF2Ro', N'https://cdn2.tuoitre.vn/thumb_w/480/471584752817336320/2024/10/21/sxsxsxs-1729480701617950060301.jpeg', N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Vu Ngoc Dang', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (133, N'CHI CHI EM EM 2', N'Câu chuyện của Chị chị em em 2 lấy bối cảnh Sài Gòn những năm đầu thế kỷ 20, kể về hai đại mỹ nhân xưa là Ba Trà (Minh Hằng) và Tư Nhị (Ngọc Trinh)[4]. Chuyện phim mở đầu bằng vũng nước dơ vô tình văng ra từ chiếc xe của Ba Trà, khiến Tư Nhị (khi đó vẫn là Nhi gái điếm), nổi đóa. Ba Trà xòa tiền đền chiếc áo cho Tư Nhị nhưng nào có ngờ, từ những đồng tiền này, Nhi quyết tâm đi theo làm ''''đệ tử'''' của Ba Trà. Nhi đã tìm mọi cách, bày mưu tính kế để tiếp cận Đệ Nhất Mỹ Nhân Sài Thành – Ba Trà nhằm đổi đời....', CAST(N'2023-01-22' AS Date), 115, N'Vietnamese', N'j3r7kq0UZMw', N'scrtC5NBkvk', N'https://bazaarvietnam.vn/wp-content/uploads/2022/11/BZ-Phim-Chi-Chi-Em-Em-9.jpg', N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Vu Ngoc Dang', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (134, N'LAM GIAU VOI MA', N'Trong Làm Giàu Với Ma, Tuấn Trần vào vai Lanh - một thanh niên lêu lổng, ngỗ ngược, dính vào cờ bạc nợ nần. Trên quãng đường chạy trốn khỏi đám giang hồ chủ nợ hung hăng, anh vô tình "đụng" phải ma nữ Na (Diệp Bảo Ngọc) và bị cô nàng nhờ vả giúp mình tìm gặp đứa con mà cô đã phải lìa xa từ lúc chào đời. Đổi lại, cô sẽ dùng quyền năng tâm linh để giúp anh "làm giàu"', CAST(N'2024-08-30' AS Date), 112, N'Vietnamese', N'MtZ_hf7tLxk', N'eTeOa1ZNS0g', N'https://iguov8nhvyobj.vcdn.cloud/media/catalog/product/cache/3/image/1800x/71252117777b696995f01934522c402d/3/5/350x495-lgvm.jpg', N'28e1aef4-7a8a-40f3-a0f5-fd3e325d0726', N'Nguyen Nhat Trung', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (135, N'GAI GIA LAM CHIEU 3', N'Bộ phim được phát triển tiếp tục từ phần hai trước đó đã ra mắt vào năm 2019. Mạch phim nối tiếp khi Jack (Lê Xuân Tiền đóng) cầu hôn Miss Q. (Lan Ngọc thủ vai) sau 1 năm hẹn hò. Tuy nhiên, hạnh phúc của đôi trẻ đã bị bà Thái Tuyết Mai - mẹ Jack - một người phụ nữ giàu có, quyền lực xứ Huế (NSND Lê Khanh thủ vai) ngăn cản.', CAST(N'2020-01-25' AS Date), 118, N'Vietnamese', N'yiBo3wgJ860', N'iXjhuUXUlNE', N'https://bloganchoi.com/wp-content/uploads/2020/01/gai-gia-lam-chieu-3-poster-1.jpg', N'28e1aef4-7a8a-40f3-a0f5-fd3e325d0726', N'Bao Nhan', 1)
INSERT [dbo].[Movies] ([MovieID], [Title], [Description], [ReleaseDate], [Duration], [Language], [TrailerURL], [VideoURL], [Thumbnail], [UploadedBy], [Director], [Status]) VALUES (150, N'LINH MIEU', N'Linh Miêu là một tấm gương phản chiếu sâu sắc về vấn đề bất bình đẳng giới trong xã hội Việt Nam. Thông qua các tình tiết và nhân vật trong phim, đạo diễn khéo léo phơi bày những bất công mà phụ nữ phải gánh chịu trong một xã hội trọng nam khinh nữ. Trong phim, con dâu nhà họ Dương bao gồm dâu cả Ngọc Lệ (Ngân Thảo) và Mỹ Kim (Thiên An) đều phải ăn những đồ thừa từ bàn trên dọn xuống. Việc phụ nữ, đặc biệt là con dâu, phải ngồi mâm dưới trong khi chồng, con trai và cha mẹ chồng được ngồi bàn trên là biểu tượng cho sự phân cấp địa vị xã hội.', CAST(N'2024-11-22' AS Date), 109, N'Vietnamese', N'XsPl7SbL2kg', N'1Sh-JLaZ_Ss', N'https://bhdstar.vn/wp-content/uploads/2024/11/referenceSchemeHeadOfficeallowPlaceHoldertrueheight700ldapp-20.jpg', N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Luu Thanh Luan', 1)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 

INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (2, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Welcome new user', N'Welcome Huy. I wish you have a great days to experience this movie watching website', CAST(N'2024-12-29T14:10:09.803' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Welcome Huy. I wish you have a great days to experience this movie watching website')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (3, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Phim Mới Được Ra Mắt!', N'Chúng tôi rất vui mừng thông báo về việc phát hành bộ phim mới nhất trên nền tảng của chúng tôi. Đây là siêu phẩm được mong đợi nhất năm nay, với cốt truyện hấp dẫn và dàn diễn viên đỉnh cao! Hãy truy cập ngay để thưởng thức bộ phim độc quyền và tận hưởng không gian giải trí tuyệt vời cùng gia đình và bạn bè!', CAST(N'2024-12-29T18:34:01.570' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Phim Mới Được Ra Mắt!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (10, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Phim HOT Được Ra Mắt', N'Bộ phim "Avengers: Secret Wars" vừa được thêm vào danh mục, xem ngay nhé!', CAST(N'2024-12-29T19:00:00.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Bộ phim "Avengers: Secret Wars" vừa được thêm vào danh mục, xem ngay nhé!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (11, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Ưu Đãi Đặc Biệt Tuần Này', N'Giảm giá 50% gói VIP cho các thành viên đăng ký mới trong tuần này!', CAST(N'2024-12-29T20:00:00.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Giảm giá 50% gói VIP cho các thành viên đăng ký mới trong tuần này!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (12, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Series Đề Cử', N'Top 5 series bạn không thể bỏ lỡ tuần này: Stranger Things, The Witcher, và hơn thế nữa!', CAST(N'2024-12-29T20:30:00.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Top 5 series bạn không thể bỏ lỡ tuần này: Stranger Things, The Witcher, và hơn thế nữa!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (13, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Hướng Dẫn Xem Phim', N'Bạn đã biết cách tải ứng dụng CinemaHub trên Smart TV chưa? Hướng dẫn chi tiết tại đây!', CAST(N'2024-12-29T21:00:00.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Bạn đã biết cách tải ứng dụng CinemaHub trên Smart TV chưa? Hướng dẫn chi tiết tại đây!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (14, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Lịch Chiếu Phim Mới Nhất', N'Cập nhật lịch chiếu mới nhất cho tuần này tại CinemaHub! Đừng bỏ lỡ!', CAST(N'2024-12-29T22:00:00.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Cập nhật lịch chiếu mới nhất cho tuần này tại CinemaHub! Đừng bỏ lỡ!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (15, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Đánh Giá Bộ Phim Bạn Yêu Thích', N'Hãy đánh giá bộ phim bạn vừa xem để nhận ngay 100 điểm thưởng!', CAST(N'2024-12-29T22:30:00.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Hãy đánh giá bộ phim bạn vừa xem để nhận ngay 100 điểm thưởng!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (16, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Quà Tặng Năm Mới', N'Nhận ngay vé xem phim miễn phí khi nâng cấp tài khoản lên VIP trước 31/12!', CAST(N'2024-12-29T23:30:00.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Nhận ngay vé xem phim miễn phí khi nâng cấp tài khoản lên VIP trước 31/12!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (17, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Cộng Đồng CinemaHub', N'Tham gia ngay nhóm Facebook của CinemaHub để nhận thông tin mới nhất về phim ảnh!', CAST(N'2024-12-30T00:00:00.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Tham gia ngay nhóm Facebook của CinemaHub để nhận thông tin mới nhất về phim ảnh!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (26, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Mời Bạn Bè', N'Mời bạn bè tham gia CinemaHub và nhận ngay điểm thưởng hấp dẫn!', CAST(N'2024-12-30T13:41:03.337' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Mời bạn bè tham gia CinemaHub và nhận ngay điểm thưởng hấp dẫn!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (27, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Mời Bạn Bè', N'Mời bạn bè tham gia CinemaHub và nhận ngay điểm thưởng hấp dẫn!', CAST(N'2024-12-30T13:41:03.343' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 1, N'Mời bạn bè tham gia CinemaHub và nhận ngay điểm thưởng hấp dẫn!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (40, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!', CAST(N'2025-01-02T13:11:43.820' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (41, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!', CAST(N'2025-01-02T13:11:43.853' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (42, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!', CAST(N'2025-01-02T22:25:17.247' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (43, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!', CAST(N'2025-01-02T22:25:17.280' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (44, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!', CAST(N'2025-01-02T22:27:05.000' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (45, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!', CAST(N'2025-01-02T22:27:05.000' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (46, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!', CAST(N'2025-01-02T22:32:32.990' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (47, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!', CAST(N'2025-01-02T22:32:33.020' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, VONG EO 56, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (75, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Comment Violates Community Standards', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Community Standards Violation</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class=''violation''>
                <strong>Comment:</strong> Diễn xuất của Ngọc Trinh còn thiếu tự nhiên và không đủ chiều sâu để lột tả hết cảm xúc của nhân vật.
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>5 day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-03T22:12:11.193' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Warning, the first comment violates user community standards by Huynh Nhat Huy')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (114, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Happy Lunar New Year', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Happy Lunar New Year</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> As we welcome the Lunar New Year, may your days be filled with happiness, your heart with peace, and your home with love. Wishing you success in all your endeavors, abundant blessings, and countless reasons to smile. Let’s embrace the new beginnings with hope and positivity. Happy New Year!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-12T22:05:00.690' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'As we welcome the Lunar New Year, may your days be filled with happiness, your heart with peace, and your home with love. Wishing you success in all your endeavors, abundant blessings, and countless reasons to smile. Let’s embrace the new beginnings with hope and positivity. Happy New Year!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (115, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Happy Lunar New Year', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Happy Lunar New Year</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> As we welcome the Lunar New Year, may your days be filled with happiness, your heart with peace, and your home with love. Wishing you success in all your endeavors, abundant blessings, and countless reasons to smile. Let’s embrace the new beginnings with hope and positivity. Happy New Year!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-12T22:05:00.847' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'As we welcome the Lunar New Year, may your days be filled with happiness, your heart with peace, and your home with love. Wishing you success in all your endeavors, abundant blessings, and countless reasons to smile. Let’s embrace the new beginnings with hope and positivity. Happy New Year!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (116, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Happy Lunar New Year', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Happy Lunar New Year</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> As we welcome the Lunar New Year, may your days be filled with happiness, your heart with peace, and your home with love. Wishing you success in all your endeavors, abundant blessings, and countless reasons to smile. Let’s embrace the new beginnings with hope and positivity. Happy New Year!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-12T22:05:00.850' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'As we welcome the Lunar New Year, may your days be filled with happiness, your heart with peace, and your home with love. Wishing you success in all your endeavors, abundant blessings, and countless reasons to smile. Let’s embrace the new beginnings with hope and positivity. Happy New Year!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (117, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Comment Violates Community Standards', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Comment Violates Community Standards</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class=''violation''>
                <strong>Comment:</strong> Phim dở
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>5 day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-12T22:33:54.240' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Warning, the first comment violates user community standards by Huynh Nhat Huy')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (128, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:34.533' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (129, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:34.570' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (130, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:34.573' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (131, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:36.123' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (132, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:36.127' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (133, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:36.130' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (134, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:37.853' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (135, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:37.860' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (136, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:37.863' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (137, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, EM LA CUA EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:39.407' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, EM LA CUA EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (138, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, EM LA CUA EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:39.410' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, EM LA CUA EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (139, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, EM LA CUA EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:39.413' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, EM LA CUA EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (140, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:41.283' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (141, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:41.287' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (142, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:41.290' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (143, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:43.237' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (144, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:43.240' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (145, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:43.243' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (146, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, GIRL ON THE THIRD FLOOR, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:45.153' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, GIRL ON THE THIRD FLOOR, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (147, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, GIRL ON THE THIRD FLOOR, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:45.157' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, GIRL ON THE THIRD FLOOR, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (148, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, GIRL ON THE THIRD FLOOR, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:45.160' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, GIRL ON THE THIRD FLOOR, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (149, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CRYPTO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:46.650' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, CRYPTO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (150, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CRYPTO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:46.653' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, CRYPTO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (151, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CRYPTO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:46.657' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, CRYPTO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (152, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, BLACK HAWK DOWN, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:48.690' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, BLACK HAWK DOWN, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (153, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, BLACK HAWK DOWN, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:48.693' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, BLACK HAWK DOWN, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (154, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, BLACK HAWK DOWN, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:48.697' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, BLACK HAWK DOWN, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (155, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, KHI CON LA NHA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:50.380' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, KHI CON LA NHA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (156, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, KHI CON LA NHA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:50.383' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, KHI CON LA NHA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (157, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, KHI CON LA NHA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:50.383' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, KHI CON LA NHA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (158, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 49 NGAY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:51.927' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, 49 NGAY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (159, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 49 NGAY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:51.930' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, 49 NGAY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (160, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 49 NGAY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:51.930' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, 49 NGAY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (161, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, DAN CHOI KHONG SO CON ROI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:53.553' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, DAN CHOI KHONG SO CON ROI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (162, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, DAN CHOI KHONG SO CON ROI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:53.557' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, DAN CHOI KHONG SO CON ROI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (163, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, DAN CHOI KHONG SO CON ROI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:53.557' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, DAN CHOI KHONG SO CON ROI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (164, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, HON PAPA DA CON GAI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:54.900' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, HON PAPA DA CON GAI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (165, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, HON PAPA DA CON GAI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:54.903' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, HON PAPA DA CON GAI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (166, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, HON PAPA DA CON GAI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:54.903' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, HON PAPA DA CON GAI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (167, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LOC PHAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:56.550' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, LOC PHAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (168, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LOC PHAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:56.553' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, LOC PHAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (169, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LOC PHAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:56.557' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, LOC PHAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (170, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, VE QUE AN TET, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:58.120' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, VE QUE AN TET, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (171, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, VE QUE AN TET, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:58.127' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, VE QUE AN TET, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (172, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, VE QUE AN TET, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:58.127' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, VE QUE AN TET, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (173, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, BI MAT LAI BI MAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:59.483' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, BI MAT LAI BI MAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (174, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, BI MAT LAI BI MAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:59.487' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, BI MAT LAI BI MAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (175, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, BI MAT LAI BI MAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:09:59.487' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, BI MAT LAI BI MAT, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (176, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, HOAN DOI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:01.467' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, HOAN DOI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (177, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, HOAN DOI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:01.470' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, HOAN DOI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (178, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, HOAN DOI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:01.473' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, HOAN DOI, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (179, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LO TO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:03.140' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, LO TO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (180, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LO TO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:03.143' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, LO TO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (181, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LO TO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:03.147' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, LO TO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (182, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LAT MAT 2: PHIM TRUONG, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:04.600' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, LAT MAT 2: PHIM TRUONG, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (183, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LAT MAT 2: PHIM TRUONG, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:04.607' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, LAT MAT 2: PHIM TRUONG, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (184, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LAT MAT 2: PHIM TRUONG, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:04.610' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, LAT MAT 2: PHIM TRUONG, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (185, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, NGHE SIEU DE, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:06.330' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, NGHE SIEU DE, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (186, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, NGHE SIEU DE, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:06.333' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, NGHE SIEU DE, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (187, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, NGHE SIEU DE, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-13T22:10:06.337' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, NGHE SIEU DE, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (189, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Comment Violates Community Standards', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Comment Violates Community Standards</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class=''violation''>
                <strong>Comment:</strong> Phim tạm được. Kịch bản hay
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>5 day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-14T22:03:04.597' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Warning, the first comment violates user community standards by Huynh Nhat Huy')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (190, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-14T22:55:39.300' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (191, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-14T22:55:39.410' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (192, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-14T22:55:39.417' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (193, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-15T13:16:16.007' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (194, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-15T13:16:16.087' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (195, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-15T13:16:16.090' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (199, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Comment Violates Community Standards', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Comment Violates Community Standards</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class=''violation''>
                <strong>Comment:</strong> Kịch bản dở quá
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>5 day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-16T11:07:44.247' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Warning, the first comment violates user community standards by Huynh Nhat Huy')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (200, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'[CinemaHub] Ưu Đãi Hấp Dẫn – Xem Phim Thả Ga!', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>[CinemaHub] Ưu Đãi Hấp Dẫn – Xem Phim Thả Ga!</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Ưu đãi khuyến mãi:
🔥 Giảm giá đến 50% khi đăng ký gói cước bất kỳ trong thời gian từ [Ngày bắt đầu khuyến mãi] đến [Ngày kết thúc khuyến mãi].

💥 Tặng thêm 1 tháng miễn phí khi bạn gia hạn gói cước 12 tháng.

📽️ Hàng ngàn bộ phim và chương trình giải trí đỉnh cao đang chờ bạn!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-01-16T13:27:24.800' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Ưu đãi khuyến mãi:
🔥 Giảm giá đến 50% khi đăng ký gói cước bất kỳ trong thời gian từ [Ngày bắt đầu khuyến mãi] đến [Ngày kết thúc khuyến mãi].

💥 Tặng thêm 1 tháng miễn phí khi bạn gia hạn gói cước 12 tháng.

📽️ Hàng ngàn bộ phim và chương trình giải trí đỉnh cao đang chờ bạn!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (201, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CO DAU HAO MON, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-10T17:14:41.683' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 1, N'Exciting news! A brand-new movie, CO DAU HAO MON, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (202, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CO DAU HAO MON, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-10T17:14:41.703' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, CO DAU HAO MON, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (203, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CO DAU HAO MON, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-10T17:14:41.703' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, CO DAU HAO MON, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (205, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Scheduled Maintenance Notice', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Scheduled Maintenance Notice</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> We would like to inform you that our system will undergo scheduled maintenance on 15/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable.

We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-14T23:15:00.743' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 1, N'We would like to inform you that our system will undergo scheduled maintenance on 15/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable.

We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (206, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Scheduled Maintenance Notice', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Scheduled Maintenance Notice</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> We would like to inform you that our system will undergo scheduled maintenance on 15/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable.

We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-14T23:15:00.870' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'We would like to inform you that our system will undergo scheduled maintenance on 15/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable.

We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.')
GO
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (207, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Scheduled Maintenance Notice', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Scheduled Maintenance Notice</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> We would like to inform you that our system will undergo scheduled maintenance on 15/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable.

We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-14T23:15:00.877' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'We would like to inform you that our system will undergo scheduled maintenance on 15/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable.

We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (211, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Scheduled Maintenance Notice', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Scheduled Maintenance Notice</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> We would like to inform you that our system will undergo scheduled maintenance on 25/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable. We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T17:47:28.280' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'We would like to inform you that our system will undergo scheduled maintenance on 25/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable. We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (212, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Scheduled Maintenance Notice', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Scheduled Maintenance Notice</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> We would like to inform you that our system will undergo scheduled maintenance on 25/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable. We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T17:47:28.447' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'We would like to inform you that our system will undergo scheduled maintenance on 25/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable. We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (213, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Scheduled Maintenance Notice', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Scheduled Maintenance Notice</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> We would like to inform you that our system will undergo scheduled maintenance on 25/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable. We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T17:47:28.453' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'We would like to inform you that our system will undergo scheduled maintenance on 25/02/2024 from 9:00 to 14:00. During this time, our services may be temporarily unavailable. We apologize for any inconvenience this may cause and appreciate your patience. We are working to enhance our system''s performance and ensure better service for you.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (214, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:14.393' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (215, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:14.457' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (216, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:14.460' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, CUOI NGAY KEO LO, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (217, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:15.520' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (218, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:15.523' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (219, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:15.527' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, 100 NGAY BEN EM, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (220, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:16.583' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (221, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:16.587' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (222, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:16.590' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, MA DA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (223, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:17.640' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (224, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:17.643' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (225, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:17.647' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, A TRUE STORY, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (226, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:18.703' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (227, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:18.707' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (228, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-02-24T18:46:18.710' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, 12 ROUNDS, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (229, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CHI CHI EM EM 2, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-23T16:36:27.487' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, CHI CHI EM EM 2, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (230, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CHI CHI EM EM 2, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-23T16:36:27.527' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, CHI CHI EM EM 2, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (231, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, CHI CHI EM EM 2, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-23T16:36:27.533' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, CHI CHI EM EM 2, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (232, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'CinemaHub Promotion Alert!', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>CinemaHub Promotion Alert!</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-24T17:16:40.710' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (233, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'CinemaHub Promotion Alert!', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>CinemaHub Promotion Alert!</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-24T17:16:40.760' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (234, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'CinemaHub Promotion Alert!', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>CinemaHub Promotion Alert!</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-24T17:16:40.767' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (235, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'CinemaHub Special Promotion!', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>CinemaHub Special Promotion!</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-24T17:20:34.583' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (236, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'CinemaHub Special Promotion!', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>CinemaHub Special Promotion!</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Thanh Thanh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-24T17:20:34.597' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Enjoy an incredible movie experience with our limited-time offer—get 10% OFF on all subscription plans! Unlock thousands of movies in premium quality and gain exclusive early access to newly added films. This offer is valid from 2025/03/25 to 2025/03/27, so don’t miss out! Sign up today at CinemaHub Website and immerse yourself in the world of cinema!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (247, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Comment Violates Community Standards', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Comment Violates Community Standards</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class=''violation''>
                <strong>Comment:</strong> adadsadsadasd
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>5 day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-24T18:16:01.437' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Warning, the first comment violates user community standards by Huynh Nhat Huy')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (248, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LAM GIAU VOI MA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-29T21:51:31.607' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, LAM GIAU VOI MA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (249, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LAM GIAU VOI MA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-29T21:51:31.630' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, LAM GIAU VOI MA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (250, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LAM GIAU VOI MA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-29T21:51:31.633' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, LAM GIAU VOI MA, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (251, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, GAI GIA LAM CHIEU 3, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-30T20:53:10.173' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, GAI GIA LAM CHIEU 3, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (252, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, GAI GIA LAM CHIEU 3, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-30T20:53:10.237' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Exciting news! A brand-new movie, GAI GIA LAM CHIEU 3, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (253, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, GAI GIA LAM CHIEU 3, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-03-30T20:53:10.240' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, GAI GIA LAM CHIEU 3, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (254, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Comment Violates Community Standards', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Comment Violates Community Standards</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class=''violation''>
                <strong>Comment:</strong> Dù trong hoàn cảnh tồi tệ kinh khủng như thế nào thì bản thân vẫn luôn có giá trị. Tất cả sự bế tắc chắc chắn vẫn còn một lối đi để ta tìm lại đúng nơi mình thuộc về. Vấn đề là chúng ta phải đủ bình tĩnh để nhìn nhận ra, không lạc đường. Đó là những gì tôi muốn truyền tải trong bộ phim này
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>5 day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-04-04T22:17:01.487' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Warning, the first comment violates user community standards by Huynh Nhat Huy')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (256, N'040c3da1-8d1d-418c-8381-28d289fd4611', N'Comment Violates Community Standards', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Comment Violates Community Standards</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class=''violation''>
                <strong>Comment:</strong> Warning, the first comment violates user community standards by Huynh Nhat Huy
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>5 day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-03T16:13:22.417' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Warning, the first comment violates user community standards by Huynh Nhat Huy')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (257, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.630' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (258, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.663' AS DateTime), N'26b6cecc-c555-4535-8450-0f3acc00216b', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (259, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Tuan Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.667' AS DateTime), N'3d9fba72-035c-4510-8d9c-57651f727e2b', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (260, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ngoc Hau</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.667' AS DateTime), N'6169bf4d-7542-4ee9-acbb-136bebedf019', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (261, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.667' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (262, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Khuu Thanh Tai</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.667' AS DateTime), N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (263, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Hai Tu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.667' AS DateTime), N'79aebce5-a6de-415e-bfaf-a903d714a05a', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (264, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy 12</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.667' AS DateTime), N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (265, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.667' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (266, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Minh Trieu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:12:59.667' AS DateTime), N'e9d362f2-799f-4eb4-b062-72514ebd3b13', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (267, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.590' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (268, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.590' AS DateTime), N'26b6cecc-c555-4535-8450-0f3acc00216b', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (269, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Tuan Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.590' AS DateTime), N'3d9fba72-035c-4510-8d9c-57651f727e2b', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (270, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ngoc Hau</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.590' AS DateTime), N'6169bf4d-7542-4ee9-acbb-136bebedf019', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (271, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.590' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (272, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Khuu Thanh Tai</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.593' AS DateTime), N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (273, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Hai Tu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.593' AS DateTime), N'79aebce5-a6de-415e-bfaf-a903d714a05a', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (274, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy 12</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.593' AS DateTime), N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (275, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.593' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (276, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'New Movie', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>New Movie</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>New Movie</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Minh Trieu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T14:32:21.593' AS DateTime), N'e9d362f2-799f-4eb4-b062-72514ebd3b13', 0, N'Exciting news! A brand-new movie, LINH MIEU, has just been added to our system. This latest addition promises to be an incredible experience for movie lovers like you! You can now enjoy watching this movie and share your thoughts by leaving a rating. Head over to our platform, explore this new release, and be among the first to experience it. Don''t miss out – grab some popcorn and start watching today!')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (277, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (278, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'26b6cecc-c555-4535-8450-0f3acc00216b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (279, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Tuan Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'3d9fba72-035c-4510-8d9c-57651f727e2b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (280, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ngoc Hau</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'6169bf4d-7542-4ee9-acbb-136bebedf019', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (281, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (282, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Khuu Thanh Tai</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (283, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Hai Tu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'79aebce5-a6de-415e-bfaf-a903d714a05a', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (284, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy 12</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (285, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (286, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Minh Trieu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:30.533' AS DateTime), N'e9d362f2-799f-4eb4-b062-72514ebd3b13', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (287, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (288, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'26b6cecc-c555-4535-8450-0f3acc00216b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (289, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Tuan Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'3d9fba72-035c-4510-8d9c-57651f727e2b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (290, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ngoc Hau</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'6169bf4d-7542-4ee9-acbb-136bebedf019', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (291, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (292, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Khuu Thanh Tai</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (293, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Hai Tu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'79aebce5-a6de-415e-bfaf-a903d714a05a', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (294, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy 12</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (295, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (296, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Minh Trieu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:58.907' AS DateTime), N'e9d362f2-799f-4eb4-b062-72514ebd3b13', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (297, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (298, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'26b6cecc-c555-4535-8450-0f3acc00216b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (299, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Tuan Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'3d9fba72-035c-4510-8d9c-57651f727e2b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (300, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ngoc Hau</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'6169bf4d-7542-4ee9-acbb-136bebedf019', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (301, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (302, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Khuu Thanh Tai</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (303, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Hai Tu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'79aebce5-a6de-415e-bfaf-a903d714a05a', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (304, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy 12</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (305, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (306, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Minh Trieu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:19:59.967' AS DateTime), N'e9d362f2-799f-4eb4-b062-72514ebd3b13', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (307, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (308, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'26b6cecc-c555-4535-8450-0f3acc00216b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (309, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Tuan Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'3d9fba72-035c-4510-8d9c-57651f727e2b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (310, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ngoc Hau</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'6169bf4d-7542-4ee9-acbb-136bebedf019', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (311, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (312, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Khuu Thanh Tai</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (313, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Hai Tu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'79aebce5-a6de-415e-bfaf-a903d714a05a', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (314, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy 12</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (315, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (316, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Minh Trieu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:01.860' AS DateTime), N'e9d362f2-799f-4eb4-b062-72514ebd3b13', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (317, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (318, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'26b6cecc-c555-4535-8450-0f3acc00216b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (319, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Tuan Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'3d9fba72-035c-4510-8d9c-57651f727e2b', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (320, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ngoc Hau</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'6169bf4d-7542-4ee9-acbb-136bebedf019', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
GO
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (321, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (322, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Khuu Thanh Tai</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (323, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Hai Tu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'79aebce5-a6de-415e-bfaf-a903d714a05a', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (324, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy 12</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (325, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (326, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice of maintenance of CinemaHub system', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice of maintenance of CinemaHub system</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Minh Trieu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:21:21.853' AS DateTime), N'e9d362f2-799f-4eb4-b062-72514ebd3b13', 0, N'To improve service quality, CinemaHub system will be under maintenance according to the following schedule: Start time: 22:00 on 10/05/2025, End time (expected): 02:00 on 11/05/2025. During this time, you will not be able to access the platform to watch movies or perform other operations.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (327, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Notice to you from CinemaHub', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Notice to you from CinemaHub</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:24.037' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (328, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy (K18 HCM)</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (329, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'26b6cecc-c555-4535-8450-0f3acc00216b', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (330, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Tuan Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'3d9fba72-035c-4510-8d9c-57651f727e2b', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (331, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ngoc Hau</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'6169bf4d-7542-4ee9-acbb-136bebedf019', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (332, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (333, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Khuu Thanh Tai</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (334, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Hai Tu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'79aebce5-a6de-415e-bfaf-a903d714a05a', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (335, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Nguyen Tran Dinh Huy 12</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'7ad79b0d-365b-428e-8ddd-b048a4b84eb1', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (336, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Ta Quy Minh</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'a24f5267-6e6b-4569-b77c-2ff867db827e', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (337, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'adasdasda', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>adasdasda</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Minh Trieu</strong>,</p> <br/>
            <p>We’re thrilled to bring you the latest updates! Check out what’s new:</p>
            <div>
                <strong>Notification:</strong> Your account has been updated successfully.
            </div> <br/>
            <p>
                Don’t miss out! Stay tuned for more exciting updates. </p> 
            <p>
                Thank you for being a valued member of our platform. </p> <br/>
            <p> 
                Best regards, </p> 
            <p>
                Khanh Minh - MovieHub Admin Team</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T15:23:40.503' AS DateTime), N'e9d362f2-799f-4eb4-b062-72514ebd3b13', 0, N'Your account has been updated successfully.')
INSERT [dbo].[Notifications] ([NotificationID], [UserId], [Title], [Content], [CreatedAt], [ReceiverId], [Status], [ContentDetail]) VALUES (338, N'59435a44-2b85-4aed-9474-29f83a72e5c6', N'Comment Violates Community Standards', N'
<!DOCTYPE html>
<html lang=''en''>
<head>
    <meta charset=''UTF-8''>
    <meta name=''viewport'' content=''width=device-width, initial-scale=1.0''>
    <title>Violation Notice</title>
</head>
<body>
    <div>
        <div>
            <center>
                <img src=''https://shopmoviehub.com/cdn/shop/files/Untitled_design_1200x1200.png?v=1693805526'' alt=''MovieHub Logo''  width=''150''>
                <h1>Comment Violates Community Standards</h1>
            </center>
        </div>
        <div>
            <p>Hello <strong>Huynh Nhat Huy</strong>,</p> <br/>
            <p>We have identified that your comment has violated the <strong>Community Standards</strong> of our platform. Specifically:</p>
            <div class=''violation''>
                <strong>Comment:</strong> Warning, the first comment violates user community standards by Huynh Nhat Huy
            </div> <br/>
            <p>This violation pertains to:</p>
            <ul>
                1. Inappropriate language <br/>
                2. Offensive or personal attacks<br/>
                3. Spam or advertising<br/>
                4. Misinformation<br/>
                5. Irrelevant content<br/>
            </ul> <br/>
            <p>Actions Taken:</p>
            <ul>
                <p>- First, your comment has been removed from the platform.</p>
                <p>- Second, your account is temporarily locked until <strong>5 day(s)</strong>.</p>
            </ul> <br/>
            <p>
                This is your <strong>first violation</strong>. As a result, your account has been temporarily suspended. 
                Please review our Community Standards to avoid further issues.
            </p>
            <p>Thank you for your cooperation!</p>
        </div>
    </div>
</body>
</html>', CAST(N'2025-05-09T16:39:43.633' AS DateTime), N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, N'Warning, the first comment violates user community standards by Huynh Nhat Huy')
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (32, N'db8e2f51-c39e-4f71-93ab-4fd5e966cf45', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-06T22:01:29.053' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-02-05T22:01:29.053' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (33, N'ea4dcf84-0754-4ae1-9c76-f96680d2a580', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 2, CAST(N'2025-01-08T13:02:44.833' AS DateTime), CAST(80000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-04-08T13:02:44.833' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (34, N'89d41b3b-c09a-4b4c-a942-e45597f295d2', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-08T13:19:21.123' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-02-07T13:19:21.123' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (35, N'75e6be09-ed0c-49ad-9b3f-239d728bc31e', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 3, CAST(N'2025-01-08T13:21:10.193' AS DateTime), CAST(300000.00 AS Decimal(10, 2)), N'VNPAY', N'Fail', CAST(N'2026-01-08T13:21:10.193' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (115, N'a12fc1f7-c378-4017-bec3-cee7afce3934', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T11:39:10.483' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Fail', CAST(N'2025-02-09T11:39:10.483' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (116, N'd3ba9135-423b-4c66-8269-69cc934cbd2c', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T11:41:56.523' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Success', CAST(N'2025-02-09T11:41:56.523' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (117, N'22fd7f1f-5043-475b-a3e6-83b53fcceb38', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T11:43:28.503' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Success', CAST(N'2025-02-09T11:43:28.503' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (118, N'44926089-c1d3-4ab6-b302-7642fb5f04cf', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T11:44:56.743' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Fail', CAST(N'2025-02-09T11:44:56.743' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (125, N'a58c8cb3-83f3-4d23-a0ee-9c9e9124e12a', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T14:32:14.757' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Success', CAST(N'2025-02-09T14:32:14.757' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (126, N'829fc319-50fe-466c-95c8-91cf4609f29c', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T14:33:28.187' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Success', CAST(N'2025-02-09T14:33:28.187' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (127, N'83dd7308-a7c7-4871-a33d-1d93036935f5', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T14:34:37.827' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-02-09T14:34:37.827' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (130, N'f17e9dbc-0991-45a5-9079-eab9d155efa5', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T23:03:23.003' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-02-09T23:03:23.003' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (141, N'e1a0ab42-037a-47f5-aee8-3cc8c9d14c44', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T23:14:23.397' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-02-09T23:14:23.397' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (142, N'f555c913-cbe7-411b-a573-b0cbe65df345', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T23:16:06.297' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-02-09T23:16:06.297' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (143, N'ebff2c1e-9858-4f20-851a-9b090c3bd368', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T23:17:06.340' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-02-09T23:17:06.340' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (144, N'630ba207-6621-41cd-80c4-2d16fc5a848f', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T23:17:30.067' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Fail', CAST(N'2025-02-09T23:17:30.067' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (145, N'dbcae56e-6628-44ea-9df5-a9677dc32529', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T23:19:13.117' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Fail', CAST(N'2025-02-09T23:19:13.117' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (146, N'8ee5fe39-39ec-478a-a8b1-4c6784d5f7d9', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-10T23:21:17.623' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-02-09T23:21:17.623' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (147, N'fdf8cbde-e80c-4721-ada5-35f3f1a70e4f', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 4, CAST(N'2025-01-10T23:21:44.093' AS DateTime), CAST(10000.00 AS Decimal(10, 2)), N'MoMo', N'Fail', CAST(N'2025-01-25T23:21:44.093' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (148, N'6bea8d8d-f9d4-472f-b48e-c69ebd470c3c', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-11T11:56:11.293' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Fail', CAST(N'2025-02-10T11:56:11.293' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (149, N'16505ab4-24ba-431d-9fc0-d41d95850bb2', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-11T12:00:17.247' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-02-10T12:00:17.247' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (150, N'b1d9dc8b-7e5f-4cd6-8274-529189f647fa', N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 4, CAST(N'2025-01-12T22:47:00.540' AS DateTime), CAST(10000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-01-27T22:47:00.540' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (153, N'498a1c2a-e050-4b92-a322-619484c4221e', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 2, CAST(N'2025-01-13T17:44:07.437' AS DateTime), CAST(80000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-04-13T17:44:07.437' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (154, N'00a785e6-7d49-4840-8aad-67926786a963', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-13T17:46:31.073' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Success', CAST(N'2025-02-12T17:46:31.073' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (155, N'e2bb954f-ea26-4b31-9e1e-ec010fd007ad', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-13T17:48:43.840' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-02-12T17:48:43.840' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (156, N'637bb53f-4ed6-4bf5-92a0-e8a1aa63c41f', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-13T17:50:24.437' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-02-12T17:50:24.437' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (158, N'ff3bd534-b288-4945-810b-f0df2d3e4e75', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-13T17:51:37.040' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Success', CAST(N'2025-02-12T17:51:37.040' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (159, N'9883eaf4-a05c-4035-9701-bbc81714a571', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-13T17:52:52.943' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-02-12T17:52:52.943' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (162, N'0bbb8bb8-90dc-4343-b3cd-56ba8d2eb451', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-14T21:33:57.693' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-02-13T21:33:57.693' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (163, N'7ade8db9-e5e2-4f73-b02b-37997649b448', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-14T21:38:29.753' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-02-13T21:38:29.753' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (164, N'391b3031-94b3-4973-8c44-25da3360b979', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-01-16T13:23:33.200' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-02-15T13:23:33.200' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (165, N'c44abd13-5499-45e0-b729-f27d33f3dd09', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 3, CAST(N'2025-02-06T15:17:15.280' AS DateTime), CAST(300000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2026-02-06T15:17:15.280' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (168, N'd3c6d2e1-5a80-4401-b3ad-77ad95afba6f', N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 1, CAST(N'2025-02-15T13:04:36.703' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-03-17T13:04:36.703' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (169, N'5938f0e5-ceb5-4c4c-a7b6-8b787fcc3b2e', N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 1, CAST(N'2025-03-26T16:45:27.173' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-04-25T16:45:27.173' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (182, N'7543888c-d6f5-43e9-800b-408fe5baed4b', N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 4, CAST(N'2025-03-31T17:54:14.243' AS DateTime), CAST(10000.00 AS Decimal(10, 2)), N'MoMo', N'Success', CAST(N'2025-04-15T17:54:14.243' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (183, N'f9589b85-a871-4770-a3ae-5c8d4b33f74e', N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 2, CAST(N'2025-03-31T18:29:48.913' AS DateTime), CAST(80000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-06-29T18:29:48.917' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (184, N'87a7f66e-442e-4266-b8fe-28b8e7638b32', N'6a0dcec6-4f5a-47dc-a9c1-1edb09481980', 2, CAST(N'2025-03-31T18:33:38.203' AS DateTime), CAST(80000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-06-29T18:33:38.203' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (186, N'4b8340fe-51f8-4a58-a8b6-8952796f6435', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:26:36.873' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'MoMo', N'Success', CAST(N'2025-06-06T16:26:36.877' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (187, N'd9cf12fc-7d01-4b85-b30d-e9e7a44cb64b', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:28:09.240' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'VNPAY', N'Success', CAST(N'2025-06-06T16:28:09.240' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (188, N'3b8a0cd7-4401-43a7-8808-56d9e4ea4e63', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:28:53.627' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-06-06T16:28:53.627' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (189, N'32745868-68a0-4881-8e2a-b0f711d3765e', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:29:27.533' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-06-06T16:29:27.533' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (190, N'72b038fd-4237-461e-9452-b5dbef2029e4', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 2, CAST(N'2025-05-07T16:30:21.000' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-06-06T16:30:21.000' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (191, N'b7646647-e07e-4a79-8386-c23b898f126b', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:31:41.300' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-06-06T16:31:41.300' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (192, N'd6804722-470f-4892-9232-5f6d8d17356f', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:31:49.120' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-06-06T16:31:49.120' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (193, N'98c89506-7b30-48b1-b177-a4b06741778a', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:32:20.610' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-06-06T16:32:20.610' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (194, N'1c323236-d139-4018-9bd5-30dc75272c92', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:34:51.243' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-06-06T16:34:51.243' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (195, N'e709c995-08df-4f73-a64d-3443a686f93e', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:34:57.857' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Fail', CAST(N'2025-06-06T16:34:57.857' AS DateTime))
INSERT [dbo].[Payments] ([PaymentID], [PaymentCode], [UserID], [SubscriptionPlanID], [PaymentDate], [Amount], [PaymentMethod], [PaymentStatus], [ExpiryDate]) VALUES (196, N'2479351a-e176-4cd6-8aa4-d32704b6c3f2', N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 1, CAST(N'2025-05-07T16:35:06.637' AS DateTime), CAST(30000.00 AS Decimal(10, 2)), N'PayPal', N'Success', CAST(N'2025-06-06T16:35:06.637' AS DateTime))
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, 4, CAST(N'2025-01-01T11:42:08.350' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (2, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 104, 5, CAST(N'2025-01-01T11:44:16.517' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (13, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, 4, CAST(N'2025-01-01T20:52:33.533' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (15, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, 3, CAST(N'2025-01-01T20:57:06.760' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (16, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, 1, CAST(N'2025-01-01T20:58:01.483' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (17, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, 2, CAST(N'2025-01-01T20:59:23.270' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (18, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, 1, CAST(N'2025-01-01T21:00:06.007' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (19, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, 3, CAST(N'2025-01-01T21:01:02.683' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (23, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, 5, CAST(N'2025-01-01T21:11:08.693' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (24, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, 4, CAST(N'2025-01-01T21:15:32.513' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (25, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, 5, CAST(N'2025-01-01T21:18:09.193' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (26, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, 4, CAST(N'2025-01-01T21:46:27.043' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (27, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, 5, CAST(N'2025-01-01T21:47:19.787' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (28, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 102, 3, CAST(N'2025-01-01T21:48:28.787' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (29, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, 5, CAST(N'2025-01-01T21:50:21.953' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (30, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, 4, CAST(N'2025-01-01T21:51:26.767' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (31, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, 4, CAST(N'2025-01-01T21:52:28.060' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (32, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, 4, CAST(N'2025-01-01T21:53:22.643' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (33, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, 5, CAST(N'2025-01-01T21:54:09.837' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (34, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, 5, CAST(N'2025-01-01T21:54:42.080' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (35, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, 5, CAST(N'2025-01-01T21:55:20.137' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (36, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, 3, CAST(N'2025-01-01T21:55:57.540' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (37, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, 2, CAST(N'2025-01-01T21:56:29.097' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (38, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 97, 4, CAST(N'2025-01-01T21:57:18.240' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (39, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 97, 2, CAST(N'2025-01-01T21:57:40.637' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (40, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, 5, CAST(N'2025-01-01T21:58:37.790' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (41, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, 5, CAST(N'2025-01-01T21:58:57.147' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (42, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, 5, CAST(N'2025-01-01T21:59:07.063' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (43, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, 4, CAST(N'2025-01-01T21:59:54.543' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (44, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, 4, CAST(N'2025-01-01T22:00:08.937' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (45, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, 3, CAST(N'2025-01-01T22:00:25.907' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (46, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, 5, CAST(N'2025-01-01T22:01:18.497' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (47, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, 4, CAST(N'2025-01-01T22:01:33.330' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (48, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, 3, CAST(N'2025-01-01T22:01:47.180' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (49, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, 5, CAST(N'2025-01-01T22:02:36.920' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (50, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, 2, CAST(N'2025-01-01T22:02:59.040' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (51, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, 3, CAST(N'2025-01-01T22:03:14.303' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (52, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, 5, CAST(N'2025-01-01T22:03:55.130' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (53, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, 4, CAST(N'2025-01-01T22:04:08.813' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (54, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, 4, CAST(N'2025-01-01T22:04:20.983' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (55, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, 3, CAST(N'2025-01-01T22:05:34.527' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (56, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, 3, CAST(N'2025-01-01T22:05:58.527' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (57, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, 4, CAST(N'2025-01-01T22:06:37.257' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (58, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, 4, CAST(N'2025-01-01T22:06:58.357' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (59, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, 4, CAST(N'2025-01-01T22:08:02.933' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (60, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, 4, CAST(N'2025-01-01T22:08:21.077' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (61, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, 3, CAST(N'2025-01-01T22:08:43.987' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (62, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, 4, CAST(N'2025-01-01T22:09:24.023' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (63, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, 5, CAST(N'2025-01-01T22:09:35.040' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (64, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, 5, CAST(N'2025-01-01T22:10:45.263' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (65, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, 5, CAST(N'2025-01-01T22:10:55.393' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (66, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, 4, CAST(N'2025-01-01T22:11:15.187' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (67, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, 4, CAST(N'2025-01-01T22:11:54.993' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (68, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, 5, CAST(N'2025-01-01T22:12:08.950' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (69, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, 3, CAST(N'2025-01-01T22:12:37.417' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (70, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, 5, CAST(N'2025-01-01T22:13:21.120' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (71, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, 4, CAST(N'2025-01-01T22:13:29.090' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (72, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, 2, CAST(N'2025-01-01T22:13:38.687' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (73, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, 5, CAST(N'2025-01-01T22:14:11.637' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (74, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, 5, CAST(N'2025-01-01T22:14:29.337' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (75, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, 5, CAST(N'2025-01-01T22:16:20.503' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (76, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, 5, CAST(N'2025-01-01T22:16:28.227' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (77, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, 5, CAST(N'2025-01-01T22:16:40.730' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (78, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, 4, CAST(N'2025-01-01T22:17:37.433' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (79, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, 5, CAST(N'2025-01-01T22:17:47.287' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (80, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, 5, CAST(N'2025-01-01T22:17:56.200' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (81, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, 5, CAST(N'2025-01-01T22:18:30.010' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (82, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, 5, CAST(N'2025-01-01T22:18:43.723' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (83, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, 4, CAST(N'2025-01-01T22:19:22.867' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (84, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, 5, CAST(N'2025-01-01T22:19:36.160' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (85, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, 3, CAST(N'2025-01-01T22:20:07.840' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (86, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, 4, CAST(N'2025-01-01T22:20:37.873' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (87, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, 5, CAST(N'2025-01-01T22:21:02.773' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (88, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, 5, CAST(N'2025-01-01T22:21:50.463' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (89, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, 5, CAST(N'2025-01-01T22:22:00.393' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (90, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, 5, CAST(N'2025-01-01T22:22:49.667' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (91, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, 5, CAST(N'2025-01-01T22:22:57.530' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (92, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 33, 3, CAST(N'2025-01-01T22:23:36.063' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (93, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, 5, CAST(N'2025-01-01T22:24:03.260' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (94, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, 4, CAST(N'2025-01-01T22:24:14.470' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (95, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, 4, CAST(N'2025-01-01T22:24:59.800' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (96, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, 5, CAST(N'2025-01-01T22:25:09.210' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (97, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, 5, CAST(N'2025-01-01T22:25:18.357' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (98, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, 4, CAST(N'2025-01-01T22:25:28.250' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (99, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, 5, CAST(N'2025-01-01T22:25:58.540' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (100, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, 5, CAST(N'2025-01-01T22:26:10.167' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (101, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 29, 4, CAST(N'2025-01-01T22:26:58.267' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (102, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 29, 5, CAST(N'2025-01-01T22:27:07.357' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (103, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 29, 5, CAST(N'2025-01-01T22:27:17.440' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (104, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 28, 4, CAST(N'2025-01-01T22:27:56.260' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (105, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 28, 4, CAST(N'2025-01-01T22:28:05.040' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (106, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 27, 4, CAST(N'2025-01-01T22:28:51.420' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (107, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 27, 3, CAST(N'2025-01-01T22:29:10.460' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (108, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, 2, CAST(N'2025-01-01T22:29:44.167' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (109, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, 4, CAST(N'2025-01-01T22:30:03.230' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (110, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, 3, CAST(N'2025-01-01T22:30:57.240' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (111, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, 4, CAST(N'2025-01-01T22:31:28.763' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (112, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, 4, CAST(N'2025-01-01T22:31:46.883' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (113, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, 5, CAST(N'2025-01-01T22:32:16.867' AS DateTime), 1)
GO
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (114, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, 3, CAST(N'2025-01-01T22:32:43.960' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (115, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, 2, CAST(N'2025-01-01T22:33:18.677' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (116, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, 3, CAST(N'2025-01-01T22:33:29.303' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (117, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, 3, CAST(N'2025-01-01T22:33:53.043' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (118, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, 5, CAST(N'2025-01-01T22:34:49.973' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (119, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, 3, CAST(N'2025-01-01T22:34:57.917' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (120, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, 4, CAST(N'2025-01-01T22:35:31.927' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (121, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, 4, CAST(N'2025-01-01T22:35:50.997' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (122, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, 4, CAST(N'2025-01-01T22:36:34.507' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (123, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, 4, CAST(N'2025-01-01T22:36:44.140' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (124, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, 4, CAST(N'2025-01-01T22:37:22.167' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (125, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, 5, CAST(N'2025-01-01T22:37:40.833' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (126, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, 5, CAST(N'2025-01-01T22:38:25.163' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (127, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, 5, CAST(N'2025-01-01T22:38:35.140' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (128, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, 3, CAST(N'2025-01-01T22:39:15.733' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (129, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, 4, CAST(N'2025-01-01T22:39:24.327' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (130, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, 4, CAST(N'2025-01-01T22:39:33.020' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (131, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, 5, CAST(N'2025-01-01T22:40:12.913' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (132, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, 5, CAST(N'2025-01-01T22:40:21.660' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (133, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, 4, CAST(N'2025-01-01T22:40:58.743' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (134, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, 4, CAST(N'2025-01-01T22:41:06.333' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (135, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, 4, CAST(N'2025-01-01T22:41:40.500' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (136, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, 4, CAST(N'2025-01-01T22:41:50.263' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (137, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, 5, CAST(N'2025-01-01T22:42:27.103' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (138, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, 5, CAST(N'2025-01-01T22:42:36.793' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (139, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, 4, CAST(N'2025-01-01T22:42:48.117' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (140, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, 4, CAST(N'2025-01-01T22:43:19.393' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (141, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, 4, CAST(N'2025-01-01T22:43:27.990' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (142, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, 4, CAST(N'2025-01-01T22:44:03.237' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (143, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, 5, CAST(N'2025-01-01T22:44:14.703' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (144, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, 5, CAST(N'2025-01-01T22:44:25.300' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (145, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, 5, CAST(N'2025-01-01T22:45:09.740' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (146, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, 5, CAST(N'2025-01-01T22:45:17.670' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (147, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, 4, CAST(N'2025-01-01T22:45:48.153' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (148, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, 5, CAST(N'2025-01-01T22:46:28.667' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (149, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, 4, CAST(N'2025-01-01T22:46:36.947' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (150, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, 4, CAST(N'2025-01-01T22:47:27.543' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (151, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, 4, CAST(N'2025-01-01T22:48:04.033' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (152, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, 5, CAST(N'2025-01-02T12:09:00.270' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (153, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, 4, CAST(N'2025-01-02T13:15:29.953' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (154, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, 3, CAST(N'2025-01-02T13:15:48.797' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (156, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 119, 3, CAST(N'2025-01-08T22:11:24.837' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (157, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 127, 3, CAST(N'2025-01-12T22:51:43.610' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (158, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 126, 1, CAST(N'2025-01-16T10:15:30.370' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (160, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, 4, CAST(N'2025-02-10T18:17:57.427' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (161, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 111, 4, CAST(N'2025-02-21T16:18:14.863' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (162, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, 1, CAST(N'2025-02-21T17:25:10.340' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (163, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, 4, CAST(N'2025-03-23T22:33:41.900' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (164, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, 4, CAST(N'2025-03-23T22:34:12.140' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (165, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, 5, CAST(N'2025-03-23T22:37:36.317' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (206, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, 4, CAST(N'2025-03-26T19:14:46.100' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (211, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, 3, CAST(N'2025-03-26T19:23:19.263' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (212, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, 4, CAST(N'2025-03-26T19:23:57.813' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (213, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, 4, CAST(N'2025-03-26T19:24:43.400' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (214, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, 3, CAST(N'2025-03-26T19:26:59.717' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (217, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 128, 4, CAST(N'2025-03-26T19:31:31.063' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (218, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 126, 3, CAST(N'2025-03-26T19:35:03.230' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (221, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 125, 4, CAST(N'2025-03-26T19:39:07.453' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (222, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, 4, CAST(N'2025-03-31T16:56:13.733' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (223, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 134, 4, CAST(N'2025-04-01T11:11:44.710' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (224, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 121, 3, CAST(N'2025-04-01T11:16:58.327' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (225, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 114, 4, CAST(N'2025-04-04T21:07:52.103' AS DateTime), 1)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (226, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, 3, CAST(N'2025-04-21T22:23:41.367' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (227, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, 1, CAST(N'2025-05-03T16:01:54.293' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (228, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, 1, CAST(N'2025-05-03T16:02:08.447' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (229, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, 3, CAST(N'2025-05-07T16:16:01.800' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (230, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, 2, CAST(N'2025-05-07T16:16:19.673' AS DateTime), 0)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [MovieID], [Rating], [CreatedAt], [Status]) VALUES (231, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 150, 4, CAST(N'2025-05-10T10:32:42.840' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[SubscriptionPlans] ON 

INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (1, N'Basic', N'Unlimited access to all movies for 1 month.', CAST(30000.00 AS Decimal(10, 2)), 30, CAST(N'2025-01-05T17:09:08.307' AS DateTime), 1)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (2, N'Saver', N'Unlimited access for 3 months, more cost-effective', CAST(80000.00 AS Decimal(10, 2)), 90, CAST(N'2025-01-05T17:10:23.640' AS DateTime), 1)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (3, N'Premium', N'Unlimited access for 12 months, maximum savings', CAST(300000.00 AS Decimal(10, 2)), 366, CAST(N'2025-01-05T17:10:59.287' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (4, N'Free Trial', N'Try it for free for 15 days with HD quality.', CAST(10000.00 AS Decimal(10, 2)), 14, CAST(N'2025-01-05T21:04:52.807' AS DateTime), 1)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (13, N'Signature ', N'Unlimited access for 24 months, maximum savings', CAST(500000.00 AS Decimal(10, 2)), 720, CAST(N'2025-01-12T19:02:30.977' AS DateTime), 1)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (14, N'Premium Saver', N'Unlimited access for 48 months, maximum savings', CAST(500000.00 AS Decimal(10, 2)), 720, CAST(N'2025-01-12T19:04:10.130' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (15, N'Premium Saver', N'Unlimited access for 48 months, maximum savings', CAST(500000.00 AS Decimal(10, 2)), 720, CAST(N'2025-01-12T22:06:45.607' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (16, N'Premium Saver', N'Unlimited access for 48 months, maximum savings', CAST(500000.00 AS Decimal(10, 2)), 720, CAST(N'2025-01-13T18:01:17.707' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (17, N'Premium', N'Unlimited access for 48 months, maximum savings	', CAST(200000.00 AS Decimal(10, 2)), 365, CAST(N'2025-03-27T15:42:45.467' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (18, N'Premium', N'Unlimited access for 48 months, maximum savings	', CAST(200000.00 AS Decimal(10, 2)), 100, CAST(N'2025-03-27T15:46:33.710' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (19, N'Premium', N'Unlimited access for 48 months, maximum savings	', CAST(200000.00 AS Decimal(10, 2)), 100, CAST(N'2025-03-27T15:48:20.017' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (20, N'Premium', N'Unlimited access for 48 months, maximum savings	', CAST(100000.00 AS Decimal(10, 2)), 100, CAST(N'2025-03-27T15:49:14.993' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (21, N'Premium', N'Unlimited access for 48 months, maximum savings	', CAST(199999.00 AS Decimal(10, 2)), 365, CAST(N'2025-03-27T15:49:46.077' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (22, N'Premium', N'Unlimited access for 48 months, maximum savings	', CAST(200000.00 AS Decimal(10, 2)), 200, CAST(N'2025-03-27T15:52:42.320' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (23, N'Premium', N'Unlimited access for 48 months, maximum savings	', CAST(199999.00 AS Decimal(10, 2)), 200, CAST(N'2025-03-27T15:56:03.893' AS DateTime), 0)
INSERT [dbo].[SubscriptionPlans] ([PlanID], [PlanName], [Description], [Price], [Duration], [CreatedAt], [IsActive]) VALUES (25, N'Voucher Birthday', N'Having birthday party', CAST(15000.00 AS Decimal(10, 2)), 25, CAST(N'2025-05-08T14:44:18.690' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[SubscriptionPlans] OFF
GO
SET IDENTITY_INSERT [dbo].[UserFavorites] ON 

INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (39, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 119)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (40, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 121)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (41, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 120)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (42, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 124)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (53, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 128)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (55, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (56, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (57, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 127)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (58, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (104, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133)
INSERT [dbo].[UserFavorites] ([FavoriteID], [UserID], [MovieID]) VALUES (105, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135)
SET IDENTITY_INSERT [dbo].[UserFavorites] OFF
GO
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'3bb9a880-1203-4b4e-980e-000442227be3', N'5f57aceb-fc63-4549-90a5-6c6ec9334aa4', CAST(N'2025-05-07T07:56:21.543' AS DateTime), CAST(N'2025-05-14T07:56:21.543' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'adb6d2f1-147e-4c49-a96e-000fe422fa68', N'03fb569b-5d5c-4fee-bdff-c51fdcc11620', CAST(N'2025-05-07T07:57:27.707' AS DateTime), CAST(N'2025-05-14T07:57:27.707' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'2f60c47b-2426-40ad-b00c-0163208ab4a9', N'ba80839f-6198-4989-98df-e38cd79231db', CAST(N'2025-05-10T03:13:46.497' AS DateTime), CAST(N'2025-05-17T03:13:46.497' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'0cb683a4-4c27-41ca-9150-01c2c2162dd9', N'6f9e8a5e-92a3-4c57-8e62-3782969f3374', CAST(N'2025-05-07T10:06:38.103' AS DateTime), CAST(N'2025-05-14T10:06:38.103' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'02f9f3df-ed16-4f08-939f-0877080ace18', N'25e54d19-75d7-4e69-b2a5-acfe3ef434a1', CAST(N'2025-05-09T08:14:01.100' AS DateTime), CAST(N'2025-05-16T08:14:01.100' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'ca13571f-8505-4d41-a061-09dcb6ded876', N'62106574-1cf9-4917-8545-18a3d2486979', CAST(N'2025-05-10T04:49:01.553' AS DateTime), CAST(N'2025-05-17T04:49:01.553' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'f1b65a9a-552b-428c-b4d0-0ecadc6ca70d', N'39e1c3aa-6065-47ee-a80c-83d30098f1a6', CAST(N'2025-04-19T08:32:37.427' AS DateTime), CAST(N'2025-04-26T08:32:37.427' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'94203e88-17e7-48fc-b56f-0f2e7314fd07', N'a6501a3b-9985-427a-98e3-ca55490a217b', CAST(N'2025-05-09T07:00:19.630' AS DateTime), CAST(N'2025-05-16T07:00:19.630' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'417b4e73-87be-4a22-89e2-1462a4227992', N'aabc03a7-67ff-46cb-8d2c-a32a6eacad0e', CAST(N'2025-04-16T11:16:13.047' AS DateTime), CAST(N'2025-04-23T11:16:13.047' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'10c3de51-b41b-47e7-ada3-15414ef8af9b', N'ccdd61c1-eb31-4c3d-b8cf-a9687f4974d2', CAST(N'2025-05-07T08:17:00.693' AS DateTime), CAST(N'2025-05-14T08:17:00.693' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'b0da3f9d-f49a-4864-bc2a-1cb5a8c80123', N'6f0f2db9-cabd-4189-8e37-35f4d2733f18', CAST(N'2025-05-07T07:52:48.213' AS DateTime), CAST(N'2025-05-14T07:52:48.213' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'91b5bc84-f7a1-44df-82ad-205e54cddc23', N'8927672d-3317-4841-b2c0-4a37cd4d597b', CAST(N'2025-05-08T07:12:37.383' AS DateTime), CAST(N'2025-05-15T07:12:37.383' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'f347cccf-3fa4-44f7-9894-2110861543f5', N'4214615d-6792-4713-872d-b9875076eea4', CAST(N'2025-04-14T11:46:58.110' AS DateTime), CAST(N'2025-04-21T11:46:58.110' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'00bf9efa-455c-458e-ab20-2591b04b0eb8', N'6ccc3a5c-d840-4ab0-9837-18c177f56510', CAST(N'2025-05-07T08:42:24.523' AS DateTime), CAST(N'2025-05-14T08:42:24.523' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'ee213fb9-541c-4df4-bfb0-260b4a31a847', N'6729efad-cc3c-4aba-81ea-5e01656cd967', CAST(N'2025-05-07T08:25:13.327' AS DateTime), CAST(N'2025-05-14T08:25:13.327' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'4f0ac749-3fdc-49aa-b351-2953ace9d5bb', N'279b389d-51ad-4897-9534-26356509ebce', CAST(N'2025-04-14T12:07:42.907' AS DateTime), CAST(N'2025-04-21T12:07:42.907' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'422b8513-0fd9-4345-b58e-2b9c687211aa', N'b990afaf-9ec8-43e8-8f76-640f2a16f304', CAST(N'2025-05-07T08:00:46.087' AS DateTime), CAST(N'2025-05-14T08:00:46.087' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'd39865d5-b1b5-4893-a9e4-2ec58ce8d88c', N'75b06323-09c3-4380-90fe-29692ee79245', CAST(N'2025-05-03T09:00:57.797' AS DateTime), CAST(N'2025-05-10T09:00:57.797' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'1268adff-a7b3-47c8-a005-34662c951fb0', N'4072f355-0212-4348-b6de-f63eb4f6a2a4', CAST(N'2025-05-09T08:21:28.020' AS DateTime), CAST(N'2025-05-16T08:21:28.020' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'56417f78-90f7-4f12-9092-379de31d3be3', N'e04d0a09-872a-4177-b4bc-2917796bfe28', CAST(N'2025-05-08T07:31:42.657' AS DateTime), CAST(N'2025-05-15T07:31:42.657' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'e88900ad-587e-4354-a5c6-3993a4a237ec', N'9744fdb9-96c9-41a8-9178-48062a76c46e', CAST(N'2025-05-07T08:00:18.920' AS DateTime), CAST(N'2025-05-14T08:00:18.920' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'ff134898-5f03-417b-bace-40a66159912d', N'c276d4f9-e477-4a34-a929-16adc082ef00', CAST(N'2025-05-07T09:36:01.983' AS DateTime), CAST(N'2025-05-14T09:36:01.983' AS DateTime), 1, N'040c3da1-8d1d-418c-8381-28d289fd4611')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'04619721-4a0b-4bac-8733-42c0e217ba1e', N'20879a91-faeb-4238-894c-d3fc730ac636', CAST(N'2025-05-03T09:03:45.230' AS DateTime), CAST(N'2025-05-10T09:03:45.230' AS DateTime), 1, N'040c3da1-8d1d-418c-8381-28d289fd4611')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'6d436c81-56e8-4c34-a07f-473ee825e545', N'3a08dc9f-6008-4cde-9298-5bd637950588', CAST(N'2025-04-14T11:35:59.173' AS DateTime), CAST(N'2025-04-21T11:35:59.173' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'6956810c-5ed9-46bd-948f-48874959fe52', N'a0c6b613-b2a8-4a8b-8b78-62cc16dbe9df', CAST(N'2025-05-09T14:05:43.413' AS DateTime), CAST(N'2025-05-16T14:05:43.413' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'f3577a00-533e-46d3-8075-51a9e644e47c', N'b692b188-2db5-44cc-b388-74d9f351237f', CAST(N'2025-05-07T08:29:01.033' AS DateTime), CAST(N'2025-05-14T08:29:01.033' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'faf81d7d-7971-4b07-a7c8-533df3958ca2', N'5fc12fa8-ba6c-4408-aa2c-2352b9348651', CAST(N'2025-05-09T13:58:29.310' AS DateTime), CAST(N'2025-05-16T13:58:29.310' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'9b56b9de-c35b-4ebc-8deb-555e51724ec5', N'cac2428a-16fc-4191-a37e-44f213609e92', CAST(N'2025-05-08T07:36:06.770' AS DateTime), CAST(N'2025-05-15T07:36:06.770' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'607850d1-4440-43de-b65d-61441f8a0a27', N'69ba9813-9080-44b6-81c1-f2859af4aade', CAST(N'2025-05-09T06:21:35.763' AS DateTime), CAST(N'2025-05-16T06:21:35.763' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'70665ffe-d1fd-4df4-b6ca-648bc6c7f396', N'9d0a7494-9b05-49b1-8172-c94a636c5693', CAST(N'2025-05-08T07:22:27.217' AS DateTime), CAST(N'2025-05-15T07:22:27.217' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'58055029-3858-403c-93f4-6606c915908d', N'885380c3-f53c-4bc7-9649-e3c79c7f9dd0', CAST(N'2025-05-07T09:31:04.287' AS DateTime), CAST(N'2025-05-14T09:31:04.287' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'947a6666-6418-4acd-8c59-6a5561003581', N'b1944885-dbf4-4d78-a9ce-6f3731338f2b', CAST(N'2025-05-07T09:49:48.100' AS DateTime), CAST(N'2025-05-14T09:49:48.100' AS DateTime), 1, N'040c3da1-8d1d-418c-8381-28d289fd4611')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'e2654cb8-92ff-4c1e-b9d2-73ac2b437e29', N'8104dcb0-ee1f-47a9-9f35-5266a395b898', CAST(N'2025-05-09T06:13:41.787' AS DateTime), CAST(N'2025-05-16T06:13:41.787' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'3c0751bf-c230-4cce-8126-79ae782e28ba', N'dd3cd3ea-0e60-45e8-9b64-863f53f7a604', CAST(N'2025-05-08T07:28:36.217' AS DateTime), CAST(N'2025-05-15T07:28:36.217' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'7a189b58-f63e-410a-8982-7fe5cbf633f9', N'808b9c27-48bc-47ce-b6e3-8da36fd6561b', CAST(N'2025-05-07T08:51:58.530' AS DateTime), CAST(N'2025-05-14T08:51:58.530' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'748dbd5c-1aa7-4a5e-bbb8-88632d8fcbc8', N'8bd19a0c-64ee-4e42-83d9-2bf425f7e18a', CAST(N'2025-05-07T08:50:21.420' AS DateTime), CAST(N'2025-05-14T08:50:21.420' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'8a0b7089-977b-476f-8214-8f751d165083', N'01f9f4f6-7713-457b-a4de-0bb04d81d67d', CAST(N'2025-05-09T07:53:47.770' AS DateTime), CAST(N'2025-05-16T07:53:47.770' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'b108c2d3-f0bf-40b7-be27-922e30187e2b', N'5df43458-bf2d-40de-b9ad-8ed576f08036', CAST(N'2025-05-09T07:49:28.093' AS DateTime), CAST(N'2025-05-16T07:49:28.093' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'c16b1bae-d1ed-4b7c-9aeb-95306b88e755', N'ae39f49f-0a2f-47e4-9245-a49c0d5c3839', CAST(N'2025-05-10T04:39:24.983' AS DateTime), CAST(N'2025-05-17T04:39:24.983' AS DateTime), 0, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'a804f1f6-09c3-41a8-912c-a24df57c0b7c', N'32260c9d-92fc-421d-99aa-e7d980c8de1b', CAST(N'2025-05-09T08:13:26.830' AS DateTime), CAST(N'2025-05-16T08:13:26.830' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'd67e0b7d-27f1-467a-a76b-a3a38fd71930', N'080b626f-d785-47c7-b357-8e41a91195b9', CAST(N'2025-05-09T07:46:16.477' AS DateTime), CAST(N'2025-05-16T07:46:16.477' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'd5bfc209-731e-44d0-a35c-a3a8e9c412be', N'3c3c63da-077d-4aa8-8cac-1e250803adad', CAST(N'2025-05-10T03:09:21.567' AS DateTime), CAST(N'2025-05-17T03:09:21.567' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'bf8324cd-dddb-47a8-91c0-a680d4e794fe', N'5b3f1b09-af11-4a00-8f58-18f109b26618', CAST(N'2025-05-09T06:35:14.973' AS DateTime), CAST(N'2025-05-16T06:35:14.973' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'bc2f6e0b-fc86-43a4-a226-b32b9b6ce7ac', N'b82cb2f1-951a-4138-856b-fd1d44f28fe2', CAST(N'2025-05-09T06:42:49.617' AS DateTime), CAST(N'2025-05-16T06:42:49.617' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'8faf2a78-9613-4b4c-9e03-c225a1c9757f', N'f4b9aa89-4edc-454a-b6bd-4a8c27180591', CAST(N'2025-05-09T09:42:34.633' AS DateTime), CAST(N'2025-05-16T09:42:34.633' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'9a5de383-18b0-4c9e-b27c-ccbcc09dfebf', N'a1dd11c1-77a9-4249-822a-140134f554cf', CAST(N'2025-05-07T09:00:39.730' AS DateTime), CAST(N'2025-05-14T09:00:39.730' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'9bffe7a1-1e9d-4c2a-b11a-d6082f2200cf', N'497992c4-dbbe-40e4-b574-2e0174a87f28', CAST(N'2025-05-09T13:58:48.540' AS DateTime), CAST(N'2025-05-16T13:58:48.540' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'dfcdfe97-a5c4-4665-ac62-defc25ca812a', N'349a4341-0554-493b-bf17-8adb0e1a75e7', CAST(N'2025-05-08T07:34:41.120' AS DateTime), CAST(N'2025-05-15T07:34:41.120' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'c7602529-20b1-4b78-a624-e2388864fa95', N'efb2fff5-507e-4682-8e0a-efa51a22d3ab', CAST(N'2025-05-08T07:38:53.997' AS DateTime), CAST(N'2025-05-15T07:38:53.997' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'cd77dbde-e69a-49d5-8cbd-e65a59dca92a', N'626077db-8168-47ba-8176-078d7288e54f', CAST(N'2025-05-08T07:28:14.710' AS DateTime), CAST(N'2025-05-15T07:28:14.710' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'3c30311a-ed08-4bfe-9bee-e68efebddf8a', N'7c841938-e1e4-4111-a33b-8952fb539cec', CAST(N'2025-05-09T07:52:34.527' AS DateTime), CAST(N'2025-05-16T07:52:34.527' AS DateTime), 1, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'140ea2ff-78ef-478c-a1c1-e6bee08e52ee', N'a05ac53b-c61b-430b-865f-f729bfa9f47c', CAST(N'2025-05-08T07:42:31.927' AS DateTime), CAST(N'2025-05-15T07:42:31.927' AS DateTime), 1, N'59435a44-2b85-4aed-9474-29f83a72e5c6')
INSERT [dbo].[UserRefreshToken] ([Id], [Token], [CreatedAt], [ExpiresAt], [Revoked], [UserId]) VALUES (N'29ba7a8a-31c2-42bc-af71-f80fc8e13baf', N'a83e51d1-7653-4ed5-a02c-8cf3dd05cbd7', CAST(N'2025-05-09T06:23:51.323' AS DateTime), CAST(N'2025-05-16T06:23:51.323' AS DateTime), 1, N'79aebce5-a6de-415e-bfaf-a903d714a05a')
GO
SET IDENTITY_INSERT [dbo].[WatchHistory] ON 

INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (2, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2024-12-27T21:20:58.613' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (3, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2024-12-27T21:21:41.033' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (4, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-27T21:30:17.170' AS DateTime), 15)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (5, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2024-12-27T22:13:28.247' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (18, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:27:49.687' AS DateTime), 138)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (19, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:29:58.367' AS DateTime), 138)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (20, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:30:09.263' AS DateTime), 157)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (24, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:32:34.707' AS DateTime), 151)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (25, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:32:56.263' AS DateTime), 215)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (26, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:34:17.773' AS DateTime), 335)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (27, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:36:40.247' AS DateTime), 331)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (28, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:37:28.193' AS DateTime), 411)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (29, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:39:10.500' AS DateTime), 408)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (30, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:39:23.050' AS DateTime), 402)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (31, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:39:28.300' AS DateTime), 395)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (32, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:43:04.807' AS DateTime), 449)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (33, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:44:13.230' AS DateTime), 450)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (34, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:45:46.570' AS DateTime), 453)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (35, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:46:03.240' AS DateTime), 446)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (36, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:46:37.287' AS DateTime), 516)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (37, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:48:00.223' AS DateTime), 510)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (38, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:48:29.680' AS DateTime), 503)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (39, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:49:30.637' AS DateTime), 548)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (40, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:50:54.973' AS DateTime), 542)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (41, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:51:03.763' AS DateTime), 536)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (42, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:51:43.867' AS DateTime), 601)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (43, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:53:02.063' AS DateTime), 599)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (44, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:53:15.243' AS DateTime), 683)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (45, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:54:52.230' AS DateTime), 677)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (46, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:54:57.533' AS DateTime), 672)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (47, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:55:39.560' AS DateTime), 694)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (48, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:56:14.070' AS DateTime), 690)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (49, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:56:21.107' AS DateTime), 686)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (50, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:57:04.347' AS DateTime), 737)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (51, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:58:09.107' AS DateTime), 731)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (52, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:58:14.080' AS DateTime), 725)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (53, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:59:20.357' AS DateTime), 747)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (54, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T14:59:56.650' AS DateTime), 742)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (55, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:00:03.100' AS DateTime), 796)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (56, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:00:46.503' AS DateTime), 806)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (57, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:01:11.467' AS DateTime), 825)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (58, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:01:46.073' AS DateTime), 840)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (59, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:02:17.363' AS DateTime), 836)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (60, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:02:24.857' AS DateTime), 829)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (61, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:05:17.330' AS DateTime), 918)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (62, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:07:00.020' AS DateTime), 913)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (63, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:07:06.090' AS DateTime), 908)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (64, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:08:06.207' AS DateTime), 960)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (65, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:09:17.577' AS DateTime), 955)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (66, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:10:44.173' AS DateTime), 988)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (67, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:11:32.340' AS DateTime), 1015)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (68, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T15:12:11.543' AS DateTime), 1008)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (69, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T16:38:38.137' AS DateTime), 1019)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (70, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T16:39:02.347' AS DateTime), 1017)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (71, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T16:40:42.573' AS DateTime), 1009)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (72, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T16:54:44.913' AS DateTime), 1009)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (73, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2024-12-28T17:06:24.700' AS DateTime), 16)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (74, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2024-12-28T17:06:43.190' AS DateTime), 20)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (75, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2024-12-28T17:06:50.233' AS DateTime), 23)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (76, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-28T21:38:58.570' AS DateTime), 1069)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (77, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2024-12-29T12:03:59.780' AS DateTime), 200)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (78, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2024-12-30T09:34:16.703' AS DateTime), 1065)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (79, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-01T13:40:45.423' AS DateTime), 22)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (80, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-01T13:41:10.843' AS DateTime), 29)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (81, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-01T13:41:19.990' AS DateTime), 37)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (82, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-01T13:41:31.830' AS DateTime), 30)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (83, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-01T13:44:00.057' AS DateTime), 7)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (84, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-01T13:44:09.780' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (85, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-01T13:44:18.300' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (86, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:39:47.740' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (87, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:43:05.560' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (88, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:43:20.463' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (89, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:43:44.420' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (90, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:43:55.287' AS DateTime), 8)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (91, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:44:37.863' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (92, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:44:49.030' AS DateTime), 3)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (93, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:45:23.687' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (94, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:46:13.213' AS DateTime), 5)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (95, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T11:46:49.837' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (96, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T11:59:56.747' AS DateTime), 26)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (97, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:00:54.947' AS DateTime), 32)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (98, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:01:32.240' AS DateTime), 77)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (99, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 102, CAST(N'2025-01-02T12:02:57.177' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (100, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 102, CAST(N'2025-01-02T12:03:01.883' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (101, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-02T12:09:42.873' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (102, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-02T12:09:46.907' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (103, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-02T12:09:49.233' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (104, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-02T12:09:52.677' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (105, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-02T12:09:56.140' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (106, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-02T12:09:59.780' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (107, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-02T12:10:01.953' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (108, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 104, CAST(N'2025-01-02T12:10:04.090' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (109, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:13.303' AS DateTime), 49)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (110, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:16.647' AS DateTime), 28)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (111, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:26.377' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (112, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:28.940' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (113, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:31.553' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (114, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:35.197' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (115, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:38.727' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (116, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:41.110' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (117, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:43.527' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (118, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:45.820' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (119, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:47.737' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (120, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:49.527' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (121, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:51.423' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (122, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:53.407' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (123, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:55.610' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (124, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:57.587' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (125, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:10:59.863' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (126, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:11:02.597' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (127, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:11:04.537' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (128, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:11:06.727' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (129, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:11:08.477' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (130, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:11:10.480' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (131, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 102, CAST(N'2025-01-02T12:11:17.537' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (132, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 102, CAST(N'2025-01-02T12:11:19.773' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (133, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 103, CAST(N'2025-01-02T12:11:23.303' AS DateTime), 54)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (134, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:12:53.217' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (135, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:12:57.830' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (136, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:00.780' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (137, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:02.550' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (138, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:04.733' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (139, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:06.527' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (140, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:11.330' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (141, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:12.900' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (142, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:14.697' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (143, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:16.527' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (144, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:18.417' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (145, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:20.467' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (146, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:22.417' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (147, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:24.467' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (148, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:26.813' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (149, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:29.193' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (150, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:31.043' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (151, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:32.783' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (152, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:34.803' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (153, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:38.250' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (154, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:39.997' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (155, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 101, CAST(N'2025-01-02T12:13:46.393' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (156, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:13:52.023' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (157, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:13:53.950' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (158, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:13:55.510' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (159, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:13:57.413' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (160, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:13:59.203' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (161, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:14:00.750' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (162, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:14:02.237' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (163, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:14:04.703' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (164, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:14:06.670' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (165, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 100, CAST(N'2025-01-02T12:14:08.857' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (166, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T12:14:20.407' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (167, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 99, CAST(N'2025-01-02T12:14:23.747' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (168, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:31.000' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (169, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:32.810' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (170, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:34.720' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (171, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:36.523' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (172, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:38.703' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (173, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:40.423' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (174, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:42.413' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (175, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:45.903' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (176, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:47.533' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (177, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 98, CAST(N'2025-01-02T12:14:49.460' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (178, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 97, CAST(N'2025-01-02T12:15:01.050' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (179, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 97, CAST(N'2025-01-02T12:15:10.207' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (180, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 97, CAST(N'2025-01-02T12:15:13.140' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (181, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 97, CAST(N'2025-01-02T12:15:16.420' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (182, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:23.523' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (183, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:26.623' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (184, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:31.390' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (185, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:33.507' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (186, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:35.417' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (187, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:38.107' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (188, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:40.150' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (189, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:42.710' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (190, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:45.327' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (191, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:47.220' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (192, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:49.640' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (193, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:51.193' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (194, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:53.723' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (195, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 96, CAST(N'2025-01-02T12:15:58.477' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (196, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:08.550' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (197, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:14.593' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (198, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:16.503' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (199, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:18.233' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (200, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:20.490' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (201, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:22.920' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (202, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:25.747' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (203, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:28.437' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (204, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:30.927' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (205, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:33.217' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (206, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:35.407' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (207, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:37.907' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (208, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:40.070' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (209, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:41.903' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (210, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:44.647' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (211, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:46.800' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (212, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:48.497' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (213, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 95, CAST(N'2025-01-02T12:16:50.117' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (214, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:16:58.027' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (215, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:01.677' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (216, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:03.817' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (217, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:05.960' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (218, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:08.417' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (219, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:11.393' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (220, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:13.700' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (221, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:16.083' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (222, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:18.077' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (223, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:21.147' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (224, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 94, CAST(N'2025-01-02T12:17:24.400' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (225, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:31.473' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (226, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:34.783' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (227, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:37.693' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (228, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:39.853' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (229, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:41.653' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (230, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:43.557' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (231, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:45.490' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (232, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:47.233' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (233, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 93, CAST(N'2025-01-02T12:17:49.180' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (234, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:17:55.873' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (235, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:00.977' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (236, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:03.097' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (237, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:04.867' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (238, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:07.143' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (239, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:09.173' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (240, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:11.433' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (241, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:14.817' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (242, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:17.020' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (243, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:18.873' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (244, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:21.603' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (245, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:23.877' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (246, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:26.103' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (247, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:29.090' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (248, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:31.713' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (249, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 92, CAST(N'2025-01-02T12:18:34.607' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (250, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 91, CAST(N'2025-01-02T12:18:42.747' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (251, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 91, CAST(N'2025-01-02T12:18:44.563' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (252, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 91, CAST(N'2025-01-02T12:18:46.333' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (253, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 91, CAST(N'2025-01-02T12:18:48.823' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (254, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 91, CAST(N'2025-01-02T12:18:51.223' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (255, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 91, CAST(N'2025-01-02T12:18:54.010' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (256, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, CAST(N'2025-01-02T12:19:02.360' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (257, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, CAST(N'2025-01-02T12:19:05.097' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (258, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, CAST(N'2025-01-02T12:19:06.887' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (259, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, CAST(N'2025-01-02T12:19:09.623' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (260, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, CAST(N'2025-01-02T12:19:11.783' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (261, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, CAST(N'2025-01-02T12:19:14.163' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (262, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 91, CAST(N'2025-01-02T12:19:16.187' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (263, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:19:23.673' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (264, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:19:27.373' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (265, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:19:30.407' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (266, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:19:46.600' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (267, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:19:52.733' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (268, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:19:55.447' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (269, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:19:57.617' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (270, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:19:59.837' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (271, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:20:01.870' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (272, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 90, CAST(N'2025-01-02T12:20:03.880' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (273, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:14.273' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (274, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:16.470' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (275, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:18.863' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (276, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:21.260' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (277, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:23.110' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (278, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:25.110' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (279, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:27.003' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (280, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:28.887' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (281, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:30.877' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (282, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:33.427' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (283, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:35.343' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (284, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 89, CAST(N'2025-01-02T12:20:38.443' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (285, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:20:44.877' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (286, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:20:48.147' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (287, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:24:44.913' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (288, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:24:49.870' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (289, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:24:52.047' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (290, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:24:54.147' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (291, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:24:55.970' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (292, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:24:58.053' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (293, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:00.323' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (294, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:02.263' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (295, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:04.560' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (296, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:06.073' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (297, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:07.863' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (298, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:09.577' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (299, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:11.813' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (300, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:13.747' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (301, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:15.457' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (302, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:17.237' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (303, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:19.110' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (304, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:20.890' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (305, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:22.640' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (306, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 88, CAST(N'2025-01-02T12:25:26.147' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (307, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:25:46.623' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (308, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:25:51.833' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (309, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:25:53.950' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (310, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:25:56.057' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (311, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:01.210' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (312, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:03.147' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (313, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:05.090' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (314, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:07.710' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (315, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:09.427' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (316, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:11.360' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (317, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:13.187' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (318, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:14.943' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (319, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:16.867' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (320, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:18.890' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (321, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:20.880' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (322, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:23.230' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (323, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:25.160' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (324, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:26.773' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (325, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:28.373' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (326, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:29.943' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (327, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:31.780' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (328, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:33.437' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (329, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:35.123' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (330, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:37.723' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (331, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:39.823' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (332, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:42.037' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (333, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:43.820' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (334, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 87, CAST(N'2025-01-02T12:26:45.817' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (335, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:26:54.283' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (336, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:26:57.410' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (337, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:01.227' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (338, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:04.143' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (339, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:06.097' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (340, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:08.920' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (341, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:10.810' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (342, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:13.600' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (343, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:15.693' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (344, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:17.927' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (345, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:20.997' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (346, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:22.780' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (347, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:24.447' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (348, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 79, CAST(N'2025-01-02T12:27:26.293' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (349, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:32.373' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (350, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:34.703' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (351, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:38.077' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (352, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:40.203' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (353, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:42.320' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (354, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:44.163' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (355, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:46.233' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (356, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:48.990' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (357, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 43, CAST(N'2025-01-02T12:27:51.143' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (358, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:01.377' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (359, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:05.820' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (360, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:07.980' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (361, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:09.957' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (362, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:11.993' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (363, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:14.023' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (364, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:16.120' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (365, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:18.540' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (366, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:20.660' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (367, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:22.520' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (368, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:24.433' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (369, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:26.153' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (370, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:27.653' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (371, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:29.310' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (372, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:31.297' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (373, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:33.120' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (374, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:35.290' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (375, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:36.917' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (376, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:38.777' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (377, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 42, CAST(N'2025-01-02T12:28:41.380' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (378, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:28:47.370' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (379, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:28:49.903' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (380, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:28:51.850' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (381, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:28:54.257' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (382, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:28:56.260' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (383, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:28:58.530' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (384, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:00.617' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (385, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:02.513' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (386, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:04.483' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (387, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:06.383' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (388, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:08.257' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (389, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:10.100' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (390, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:12.477' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (391, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:14.293' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (392, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:16.300' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (393, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:18.253' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (394, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:20.067' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (395, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:21.860' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (396, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:24.060' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (397, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:25.770' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (398, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:27.330' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (399, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:28.900' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (400, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:30.683' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (401, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 41, CAST(N'2025-01-02T12:29:32.137' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (402, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:40.663' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (403, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:43.340' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (404, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:45.377' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (405, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:48.943' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (406, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:50.803' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (407, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:52.487' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (408, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:54.370' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (409, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:57.313' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (410, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:29:59.773' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (411, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:01.473' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (412, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:03.613' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (413, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:05.913' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (414, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:07.700' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (415, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:09.633' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (416, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:11.647' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (417, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:14.157' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (418, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:16.657' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (419, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:18.413' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (420, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:20.123' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (421, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:21.880' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (422, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 40, CAST(N'2025-01-02T12:30:23.927' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (423, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:32.003' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (424, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:34.767' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (425, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:36.517' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (426, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:38.790' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (427, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:41.113' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (428, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:42.673' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (429, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:45.113' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (430, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:47.370' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (431, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:49.203' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (432, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:51.370' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (433, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:53.400' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (434, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:55.383' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (435, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:30:57.920' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (436, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:00.300' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (437, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:02.383' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (438, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:04.403' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (439, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:06.500' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (440, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:08.750' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (441, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:10.960' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (442, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:12.917' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (443, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:14.967' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (444, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:16.720' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (445, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:18.253' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (446, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:21.760' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (447, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:23.950' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (448, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:27.810' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (449, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:30.097' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (450, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:31.853' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (451, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:33.960' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (452, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:35.810' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (453, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 39, CAST(N'2025-01-02T12:31:37.600' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (454, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:31:52.627' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (455, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:31:55.000' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (456, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:31:59.743' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (457, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:01.670' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (458, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:03.573' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (459, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:06.027' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (460, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:08.053' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (461, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:10.307' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (462, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:12.143' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (463, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:13.867' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (464, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:15.497' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (465, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:17.830' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (466, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:20.260' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (467, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:23.113' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (468, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:26.313' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (469, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:29.263' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (470, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:31.643' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (471, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:33.457' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (472, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:35.080' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (473, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:37.310' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (474, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:39.453' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (475, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 38, CAST(N'2025-01-02T12:32:41.400' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (476, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:32:48.597' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (477, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:32:50.933' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (478, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:32:53.210' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (479, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:32:54.930' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (480, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:32:56.803' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (481, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:32:58.897' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (482, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:01.303' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (483, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:03.110' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (484, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:05.047' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (485, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:07.553' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (486, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:09.290' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (487, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:10.980' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (488, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:13.063' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (489, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:14.807' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (490, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:16.490' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (491, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:18.577' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (492, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:20.563' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (493, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 37, CAST(N'2025-01-02T12:33:22.453' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (494, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:29.720' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (495, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:32.287' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (496, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:34.033' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (497, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:35.580' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (498, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:37.910' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (499, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:39.940' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (500, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:41.863' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (501, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:43.710' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (502, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:45.767' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (503, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:47.530' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (504, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:49.363' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (505, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:51.360' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (506, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:53.517' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (507, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:55.680' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (508, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:57.630' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (509, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:33:59.437' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (510, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 36, CAST(N'2025-01-02T12:34:01.400' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (511, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:11.390' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (512, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:13.443' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (513, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:15.370' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (514, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:17.047' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (515, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:18.700' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (516, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:21.187' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (517, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:23.173' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (518, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:25.360' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (519, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:27.313' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (520, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:29.473' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (521, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:31.940' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (522, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:33.970' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (523, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:35.843' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (524, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:38.057' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (525, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:41.333' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (526, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:43.313' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (527, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:45.060' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (528, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:46.817' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (529, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:48.350' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (530, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:50.297' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (531, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:52.010' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (532, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:53.590' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (533, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 35, CAST(N'2025-01-02T12:34:56.203' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (534, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:05.887' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (535, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:09.137' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (536, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:10.797' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (537, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:12.303' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (538, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:15.487' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (539, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:17.660' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (540, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:20.073' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (541, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:21.787' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (542, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:24.083' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (543, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:26.120' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (544, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:27.847' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (545, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:29.487' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (546, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:31.647' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (547, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:33.850' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (548, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:36.587' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (549, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 34, CAST(N'2025-01-02T12:35:39.083' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (550, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 33, CAST(N'2025-01-02T12:35:49.553' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (551, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 33, CAST(N'2025-01-02T12:35:51.790' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (552, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 33, CAST(N'2025-01-02T12:35:53.750' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (553, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 33, CAST(N'2025-01-02T12:35:56.043' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (554, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 33, CAST(N'2025-01-02T12:35:57.777' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (555, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 33, CAST(N'2025-01-02T12:35:59.450' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (556, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:07.020' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (557, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:10.007' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (558, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:11.630' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (559, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:13.773' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (560, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:15.547' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (561, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:18.517' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (562, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:21.690' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (563, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:23.763' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (564, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:25.830' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (565, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:27.837' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (566, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:29.650' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (567, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:31.700' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (568, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:33.710' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (569, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:35.500' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (570, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 32, CAST(N'2025-01-02T12:36:37.543' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (571, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:36:49.470' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (572, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:36:51.667' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (573, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:36:53.747' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (574, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:36:56.080' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (575, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:36:57.853' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (576, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:36:59.763' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (577, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:01.767' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (578, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:03.787' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (579, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:06.297' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (580, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:08.097' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (581, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:10.347' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (582, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:13.213' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (583, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:14.823' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (584, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:16.500' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (585, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:18.423' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (586, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:20.457' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (587, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 31, CAST(N'2025-01-02T12:37:22.517' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (588, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:34.800' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (589, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:42.953' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (590, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:45.413' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (591, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:47.370' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (592, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:49.107' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (593, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:50.743' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (594, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:52.327' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (595, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:54.210' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (596, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:56.760' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (597, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:37:58.707' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (598, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:01.193' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (599, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:03.230' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (600, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:05.343' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (601, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:07.897' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (602, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:10.063' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (603, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:11.683' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (604, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:13.507' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (605, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:15.593' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (606, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:17.817' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (607, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:19.733' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (608, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:21.260' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (609, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:23.020' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (610, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:26.113' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (611, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 30, CAST(N'2025-01-02T12:38:28.157' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (612, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:37.380' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (613, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:41.653' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (614, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:44.050' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (615, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:46.407' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (616, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:48.320' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (617, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:49.977' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (618, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:51.837' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (619, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:53.703' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (620, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:55.537' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (621, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:38:57.993' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (622, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:39:00.323' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (623, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:39:02.493' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (624, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:39:04.473' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (625, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:39:06.397' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (626, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:39:10.120' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (627, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:39:12.073' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (628, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:39:14.057' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (629, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 29, CAST(N'2025-01-02T12:39:16.043' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (630, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:39:41.273' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (631, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:39:45.177' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (632, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:39:48.067' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (633, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:39:50.067' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (634, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:39:52.277' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (635, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:39:54.200' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (636, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:39:55.997' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (637, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:39:58.427' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (638, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:40:00.193' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (639, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:40:02.737' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (640, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 28, CAST(N'2025-01-02T12:40:04.507' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (641, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:19.207' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (642, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:25.030' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (643, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:27.617' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (644, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:31.163' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (645, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:32.817' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (646, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:35.257' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (647, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:37.150' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (648, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:39.543' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (649, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:41.313' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (650, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:43.103' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (651, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:44.870' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (652, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:47.077' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (653, N'a24f5267-6e6b-4569-b77c-2ff867db827e', 27, CAST(N'2025-01-02T12:40:49.037' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (654, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:13.837' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (655, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:24.227' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (656, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:27.280' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (657, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:29.703' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (658, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:31.800' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (659, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:35.237' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (660, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:36.927' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (661, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:38.897' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (662, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:40.960' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (663, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:43.110' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (664, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:45.723' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (665, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:48.443' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (666, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:50.383' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (667, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:52.263' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (668, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:54.467' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (669, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:56.083' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (670, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:57.920' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (671, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:41:59.990' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (672, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:42:01.840' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (673, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 26, CAST(N'2025-01-02T12:42:03.857' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (674, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:42:12.240' AS DateTime), 16)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (675, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:42:59.613' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (676, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:43:05.450' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (677, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:43:07.037' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (678, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:43:08.920' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (679, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:43:10.827' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (680, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:43:12.487' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (681, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:43:13.870' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (682, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:43:15.177' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (683, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 25, CAST(N'2025-01-02T12:43:16.717' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (684, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:24.207' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (685, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:26.573' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (686, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:29.570' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (687, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:31.600' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (688, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:35.160' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (689, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:37.483' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (690, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:38.933' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (691, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:40.340' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (692, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:41.543' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (693, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 24, CAST(N'2025-01-02T12:43:49.250' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (694, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:43:57.443' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (695, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:00.247' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (696, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:01.947' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (697, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:03.933' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (698, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:05.913' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (699, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:08.107' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (700, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:09.733' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (701, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:11.500' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (702, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:13.527' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (703, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:15.190' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (704, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 23, CAST(N'2025-01-02T12:44:16.533' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (705, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, CAST(N'2025-01-02T12:44:25.000' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (706, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, CAST(N'2025-01-02T12:44:27.840' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (707, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, CAST(N'2025-01-02T12:44:29.743' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (708, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, CAST(N'2025-01-02T12:44:31.697' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (709, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, CAST(N'2025-01-02T12:44:33.243' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (710, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, CAST(N'2025-01-02T12:44:35.167' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (711, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:44:45.793' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (712, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:44:48.343' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (713, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:44:50.127' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (714, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:44:52.030' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (715, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:44:54.353' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (716, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:44:56.233' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (717, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:44:58.237' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (718, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:45:00.110' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (719, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:45:01.653' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (720, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:45:03.507' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (721, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:45:05.540' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (722, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:45:07.130' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (723, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:45:08.950' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (724, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 21, CAST(N'2025-01-02T12:45:10.767' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (725, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:21.157' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (726, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:24.150' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (727, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:26.413' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (728, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:29.170' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (729, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:30.947' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (730, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:32.923' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (731, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:35.283' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (732, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:37.540' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (733, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:40.067' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (734, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:41.910' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (735, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:44.213' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (736, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:46.083' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (737, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:47.987' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (738, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:50.120' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (739, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:52.207' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (740, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:53.870' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (741, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 20, CAST(N'2025-01-02T12:45:55.543' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (742, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:05.353' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (743, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:07.623' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (744, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:09.933' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (745, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:11.703' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (746, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:13.547' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (747, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:15.333' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (748, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:17.360' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (749, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:19.163' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (750, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:20.670' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (751, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:22.437' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (752, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:24.050' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (753, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:25.697' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (754, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:27.680' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (755, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:30.103' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (756, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:32.010' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (757, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:34.007' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (758, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:35.850' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (759, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:38.113' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (760, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 19, CAST(N'2025-01-02T12:46:40.367' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (761, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:46:48.010' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (762, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:46:51.083' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (763, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:46:52.863' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (764, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:46:54.453' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (765, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:46:56.797' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (766, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:46:58.460' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (767, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:46:59.953' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (768, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:02.333' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (769, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:03.793' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (770, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:05.353' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (771, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:07.190' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (772, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:08.947' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (773, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:10.810' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (774, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:12.830' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (775, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:14.873' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (776, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:16.660' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (777, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:18.670' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (778, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:20.513' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (779, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:22.187' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (780, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 18, CAST(N'2025-01-02T12:47:23.613' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (781, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:30.453' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (782, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:32.090' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (783, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:33.680' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (784, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:35.867' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (785, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:38.043' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (786, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:39.520' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (787, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:41.130' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (788, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:43.507' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (789, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:45.227' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (790, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:47.107' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (791, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:48.843' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (792, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:50.480' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (793, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:52.890' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (794, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:54.823' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (795, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:56.350' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (796, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 17, CAST(N'2025-01-02T12:47:57.840' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (797, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:09.487' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (798, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:11.737' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (799, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:20.393' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (800, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:25.573' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (801, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:28.167' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (802, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:30.677' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (803, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:32.490' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (804, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:34.613' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (805, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:36.360' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (806, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:38.173' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (807, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:39.720' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (808, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:41.717' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (809, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:43.363' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (810, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 16, CAST(N'2025-01-02T12:48:44.957' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (811, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:48:53.527' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (812, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:48:55.620' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (813, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:48:57.420' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (814, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:48:59.507' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (815, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:01.653' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (816, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:03.900' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (817, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:05.997' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (818, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:07.810' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (819, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:09.787' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (820, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:11.470' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (821, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:13.443' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (822, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:15.673' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (823, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:17.583' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (824, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:19.260' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (825, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:21.667' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (826, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:23.220' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (827, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:24.860' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (828, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:26.393' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (829, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:28.447' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (830, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 15, CAST(N'2025-01-02T12:49:30.120' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (831, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, CAST(N'2025-01-02T12:49:38.247' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (832, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, CAST(N'2025-01-02T12:49:40.957' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (833, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, CAST(N'2025-01-02T12:49:42.900' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (834, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, CAST(N'2025-01-02T12:49:44.563' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (835, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, CAST(N'2025-01-02T12:49:46.157' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (836, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, CAST(N'2025-01-02T12:49:47.840' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (837, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 14, CAST(N'2025-01-02T12:49:49.510' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (838, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:49:57.980' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (839, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:01.440' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (840, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:03.320' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (841, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:05.057' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (842, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:06.443' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (843, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:08.583' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (844, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:10.393' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (845, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:12.247' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (846, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:15.200' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (847, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:16.830' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (848, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:18.550' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (849, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:20.160' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (850, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:50:22.047' AS DateTime), 12)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (851, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 13, CAST(N'2025-01-02T12:51:04.990' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (852, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:16.063' AS DateTime), 170)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (853, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:17.370' AS DateTime), 140)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (854, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:19.170' AS DateTime), 110)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (855, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:20.643' AS DateTime), 80)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (856, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:22.147' AS DateTime), 50)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (857, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:23.577' AS DateTime), 20)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (858, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:25.053' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (859, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:26.830' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (860, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:28.183' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (861, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:29.440' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (862, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:30.877' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (863, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:32.160' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (864, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:33.737' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (865, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:35.330' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (866, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:37.137' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (867, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:38.377' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (868, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:40.190' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (869, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:42.060' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (870, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:43.877' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (871, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:45.663' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (872, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-01-02T12:51:47.813' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (873, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:51:55.053' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (874, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:51:56.923' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (875, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:51:58.457' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (876, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:00.040' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (877, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:01.377' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (878, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:02.583' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (879, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:03.923' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (880, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:05.057' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (881, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:06.247' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (882, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:08.097' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (883, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:09.663' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (884, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:11.130' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (885, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:13.010' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (886, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:14.413' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (887, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:16.567' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (888, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:18.403' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (889, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:19.793' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (890, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:20.917' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (891, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:22.470' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (892, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:23.893' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (893, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 11, CAST(N'2025-01-02T12:52:25.263' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (894, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:52:33.373' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (895, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:52:35.503' AS DateTime), 64)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (896, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:32.507' AS DateTime), 35)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (897, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:34.313' AS DateTime), 5)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (898, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:35.770' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (899, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:38.077' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (900, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:39.440' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (901, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:40.633' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (902, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:41.960' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (903, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:43.150' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (904, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:44.410' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (905, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 10, CAST(N'2025-01-02T12:54:46.107' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (906, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:54:54.020' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (907, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:54:56.310' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (908, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:54:57.610' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (909, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:54:59.010' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (910, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:00.490' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (911, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:02.893' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (912, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:04.230' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (913, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:05.973' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (914, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:07.280' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (915, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:08.840' AS DateTime), 0)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (916, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:10.513' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (917, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:12.910' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (918, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:14.220' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (919, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:16.030' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (920, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:19.130' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (921, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:20.510' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (922, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:22.297' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (923, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:23.533' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (924, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:25.287' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (925, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:26.663' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (926, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:28.880' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (927, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:30.340' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (928, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:31.570' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (929, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:33.803' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (930, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:35.890' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (931, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 9, CAST(N'2025-01-02T12:55:37.677' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (932, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:55:42.780' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (933, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:55:44.033' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (934, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:55:45.840' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (935, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:55:50.820' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (936, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:55:54.157' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (937, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:55:56.647' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (938, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:55:59.200' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (939, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:00.683' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (940, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:02.123' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (941, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:03.280' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (942, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:05.037' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (943, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:06.527' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (944, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:07.730' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (945, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:09.253' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (946, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:10.620' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (947, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:12.770' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (948, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:14.147' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (949, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:15.647' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (950, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:18.010' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (951, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:19.273' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (952, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:20.470' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (953, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:21.740' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (954, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:23.820' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (955, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 8, CAST(N'2025-01-02T12:56:25.707' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (956, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:32.780' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (957, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:34.843' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (958, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:37.227' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (959, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:38.617' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (960, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:40.577' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (961, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:41.870' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (962, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:43.680' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (963, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:45.063' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (964, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:46.690' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (965, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:48.293' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (966, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:49.607' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (967, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:51.260' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (968, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:52.620' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (969, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:55.487' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (970, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:56.810' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (971, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:58.127' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (972, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:56:59.440' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (973, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 7, CAST(N'2025-01-02T12:57:01.210' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (974, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:06.923' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (975, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:08.260' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (976, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:09.320' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (977, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:11.170' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (978, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:12.437' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (979, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:13.657' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (980, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:14.677' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (981, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:16.080' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (982, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:17.437' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (983, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:18.740' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (984, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:19.730' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (985, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:20.813' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (986, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:22.110' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (987, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:23.290' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (988, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:24.377' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (989, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:25.473' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (990, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:27.290' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (991, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:28.910' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (992, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:31.070' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (993, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:32.267' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (994, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-01-02T12:57:34.023' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (995, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:21.940' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (996, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:29.883' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (997, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:32.767' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (998, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:35.127' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (999, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:36.950' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1000, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:40.050' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1001, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:42.050' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1002, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:44.393' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1003, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:46.480' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1004, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:12:48.447' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1005, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:14:49.027' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1006, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:14:51.070' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1007, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:14:52.757' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1008, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:14:54.593' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1009, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-02T13:14:56.617' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1012, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-03T22:56:57.853' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1013, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 111, CAST(N'2025-01-04T12:06:42.623' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1014, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 120, CAST(N'2025-01-04T14:21:57.133' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1015, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 120, CAST(N'2025-01-04T14:22:05.107' AS DateTime), 50)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1016, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 120, CAST(N'2025-01-04T14:23:26.943' AS DateTime), 22)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1017, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:11:58.027' AS DateTime), 1039)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1018, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:16:41.493' AS DateTime), 1015)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1019, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:17:23.760' AS DateTime), 1776)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1020, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 125, CAST(N'2025-01-06T23:28:42.797' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1021, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:29:57.733' AS DateTime), 1759)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1022, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:30:23.063' AS DateTime), 1716)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1023, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:30:34.977' AS DateTime), 1689)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1024, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:30:38.887' AS DateTime), 1659)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1025, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:30:40.670' AS DateTime), 1632)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1026, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:30:44.543' AS DateTime), 1605)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1027, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:30:49.027' AS DateTime), 1577)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1028, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:30:52.793' AS DateTime), 1548)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1029, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-06T23:30:56.113' AS DateTime), 1523)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1030, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-07T11:46:05.553' AS DateTime), 1498)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1031, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-07T11:46:12.720' AS DateTime), 1471)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1032, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-07T11:46:54.817' AS DateTime), 1443)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1033, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 119, CAST(N'2025-01-08T22:06:02.180' AS DateTime), 107)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1034, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 119, CAST(N'2025-01-08T22:08:23.833' AS DateTime), 182)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1035, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 119, CAST(N'2025-01-11T15:37:33.200' AS DateTime), 298)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1036, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 119, CAST(N'2025-01-11T15:40:01.340' AS DateTime), 271)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1037, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 107, CAST(N'2025-01-11T15:51:49.020' AS DateTime), 95)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1038, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 118, CAST(N'2025-01-11T15:55:05.233' AS DateTime), 83)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1039, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 127, CAST(N'2025-01-12T22:47:33.783' AS DateTime), 202)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1040, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 22, CAST(N'2025-01-12T22:53:14.450' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1041, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-13T17:58:20.773' AS DateTime), 1417)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1042, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 128, CAST(N'2025-01-13T18:22:41.513' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1043, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 119, CAST(N'2025-01-13T22:10:55.923' AS DateTime), 247)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1044, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-14T11:41:41.397' AS DateTime), 1394)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1045, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-14T11:41:50.260' AS DateTime), 1367)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1046, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-01-16T11:00:10.510' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1047, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-01-16T11:08:27.370' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1048, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, CAST(N'2025-01-17T14:41:51.093' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1049, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, CAST(N'2025-01-17T14:42:08.400' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1050, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-01-21T16:03:22.170' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1051, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 128, CAST(N'2025-01-21T16:03:47.870' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1052, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-01-21T16:06:27.207' AS DateTime), 1338)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1053, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-01-21T16:06:55.897' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1054, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-01-21T23:02:14.257' AS DateTime), 17)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1055, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-01-21T23:03:05.510' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1056, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-01-21T23:03:10.447' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1057, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-02-05T21:54:07.610' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1058, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-02-06T15:16:05.173' AS DateTime), 1310)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1059, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 6, CAST(N'2025-02-06T15:19:35.153' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1067, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, CAST(N'2025-02-10T18:18:23.247' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1068, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, CAST(N'2025-02-10T18:18:29.157' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1069, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 113, CAST(N'2025-02-14T14:46:03.300' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1070, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-02-14T14:46:13.583' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1071, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, CAST(N'2025-02-14T14:46:18.240' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1072, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, CAST(N'2025-02-14T14:46:22.393' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1073, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 128, CAST(N'2025-02-14T14:46:27.677' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1074, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 12, CAST(N'2025-02-14T14:46:38.437' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1075, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, CAST(N'2025-02-14T14:49:30.343' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1076, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-02-14T14:49:37.780' AS DateTime), 11881113)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1077, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, CAST(N'2025-02-14T14:49:41.807' AS DateTime), 3960288)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1078, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 128, CAST(N'2025-02-14T14:49:47.050' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1079, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 127, CAST(N'2025-02-14T14:49:54.103' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1080, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 121, CAST(N'2025-02-14T14:50:53.803' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1081, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 120, CAST(N'2025-02-14T14:51:01.930' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1082, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 119, CAST(N'2025-02-14T14:54:24.343' AS DateTime), 218)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1083, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 127, CAST(N'2025-02-15T13:05:13.207' AS DateTime), 177)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1084, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 127, CAST(N'2025-02-15T13:05:20.293' AS DateTime), 148)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1085, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 127, CAST(N'2025-02-15T13:05:23.377' AS DateTime), 119)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1086, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 131, CAST(N'2025-02-15T13:07:59.260' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1087, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, CAST(N'2025-02-15T22:17:35.597' AS DateTime), 38)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1088, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, CAST(N'2025-02-15T22:18:45.450' AS DateTime), 10)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1089, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 111, CAST(N'2025-02-21T16:15:02.830' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1090, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 111, CAST(N'2025-02-21T16:15:06.300' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1091, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-03-01T14:35:42.637' AS DateTime), 1288)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1092, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-03-01T14:35:52.857' AS DateTime), 1260)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1093, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-03-01T14:35:57.357' AS DateTime), 1233)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1094, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, CAST(N'2025-03-23T22:31:51.410' AS DateTime), 31)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1095, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 133, CAST(N'2025-03-26T16:46:15.910' AS DateTime), 9)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1096, N'0ec69f02-8fa8-4eec-815e-8e9ee34409e1', 133, CAST(N'2025-03-26T16:47:04.220' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1097, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, CAST(N'2025-03-31T16:05:09.370' AS DateTime), 16)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1098, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-03-31T16:53:58.910' AS DateTime), 55)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1099, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-03-31T22:11:32.850' AS DateTime), 1207)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1100, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-03-31T22:11:37.967' AS DateTime), 1179)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1101, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 5, CAST(N'2025-03-31T22:13:07.530' AS DateTime), 1151)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1102, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-01T10:42:07.457' AS DateTime), 87)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1103, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-01T10:43:39.653' AS DateTime), 2222)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1104, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 134, CAST(N'2025-04-01T10:54:46.303' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1105, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-01T10:58:28.927' AS DateTime), 2197)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1106, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-01T10:58:35.743' AS DateTime), 2170)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1107, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-01T11:00:07.120' AS DateTime), 2143)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1108, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-01T11:00:11.770' AS DateTime), 2118)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1109, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-01T11:00:17.980' AS DateTime), 2090)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1110, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-04-01T11:00:24.410' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1111, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-04-01T11:00:35.760' AS DateTime), 105)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1112, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-04-01T11:02:52.707' AS DateTime), 78)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1113, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-04-01T11:02:56.787' AS DateTime), 53)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1114, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-04-01T11:03:06.820' AS DateTime), 84)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1115, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 130, CAST(N'2025-04-01T11:04:12.230' AS DateTime), 56)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1116, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 134, CAST(N'2025-04-01T11:11:00.837' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1117, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 134, CAST(N'2025-04-01T11:11:14.377' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1118, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, CAST(N'2025-04-01T11:12:24.180' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1119, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 129, CAST(N'2025-04-01T11:13:01.377' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1120, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 131, CAST(N'2025-04-01T11:13:13.473' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1121, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 127, CAST(N'2025-04-01T11:14:00.427' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1122, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 128, CAST(N'2025-04-01T11:14:57.393' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1123, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 121, CAST(N'2025-04-01T11:15:11.597' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1124, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-04T21:04:00.563' AS DateTime), 2065)
GO
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1125, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-04T21:04:06.667' AS DateTime), 2037)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1126, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-04-04T21:04:10.580' AS DateTime), 2020)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1127, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 114, CAST(N'2025-04-04T21:04:36.263' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1128, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 114, CAST(N'2025-04-04T21:06:43.450' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1129, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 134, CAST(N'2025-04-04T21:08:32.757' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1130, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-05-05T18:51:48.437' AS DateTime), 335)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1131, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-05-05T18:58:44.053' AS DateTime), 335)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1132, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 133, CAST(N'2025-05-07T16:15:34.983' AS DateTime), 0)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1133, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 135, CAST(N'2025-05-07T16:15:42.720' AS DateTime), 291)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1134, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 150, CAST(N'2025-05-10T10:31:15.573' AS DateTime), 50)
INSERT [dbo].[WatchHistory] ([HistoryID], [UserID], [MovieID], [WatchedAt], [Progress]) VALUES (1135, N'65a15ea3-a2c7-4554-a280-2ffc0555e2fb', 150, CAST(N'2025-05-10T10:32:37.500' AS DateTime), 22)
SET IDENTITY_INSERT [dbo].[WatchHistory] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_MovieID]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_MovieID] ON [dbo].[Comments]
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Comments_UserID]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserID] ON [dbo].[Comments]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Logs_UserID]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Logs_UserID] ON [dbo].[Logs]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieGenreMapping_GenreID]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieGenreMapping_GenreID] ON [dbo].[MovieGenreMapping]
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movies_UploadedBy]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Movies_UploadedBy] ON [dbo].[Movies]
(
	[UploadedBy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Notifications_UserId]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notifications_UserId] ON [dbo].[Notifications]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Payments__106D3BA810D12558]    Script Date: 5/10/2025 4:07:02 PM ******/
ALTER TABLE [dbo].[Payments] ADD UNIQUE NONCLUSTERED 
(
	[PaymentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ratings_MovieID]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ratings_MovieID] ON [dbo].[Ratings]
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Ratings_UserID]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_Ratings_UserID] ON [dbo].[Ratings]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserFavorites_MovieID]    Script Date: 5/10/2025 4:07:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserFavorites_MovieID] ON [dbo].[UserFavorites]
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserFavorites_UserID]    Script Date: 5/10/2025 4:07:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserFavorites_UserID] ON [dbo].[UserFavorites]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRefreshToken_Token]    Script Date: 5/10/2025 4:07:03 PM ******/
ALTER TABLE [dbo].[UserRefreshToken] ADD  CONSTRAINT [IX_UserRefreshToken_Token] UNIQUE NONCLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WatchHistory_MovieID]    Script Date: 5/10/2025 4:07:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_WatchHistory_MovieID] ON [dbo].[WatchHistory]
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WatchHistory_UserID]    Script Date: 5/10/2025 4:07:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_WatchHistory_UserID] ON [dbo].[WatchHistory]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Logs] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[SubscriptionPlans] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[SubscriptionPlans] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserRefreshToken] ADD  DEFAULT ((0)) FOR [Revoked]
GO
ALTER TABLE [dbo].[WatchHistory] ADD  DEFAULT (getdate()) FOR [WatchedAt]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_MovieID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_MovieID]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_UserID]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_UserID]
GO
ALTER TABLE [dbo].[MovieGenreMapping]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenreMapping_GenreID] FOREIGN KEY([GenreID])
REFERENCES [dbo].[MovieGenres] ([GenreID])
GO
ALTER TABLE [dbo].[MovieGenreMapping] CHECK CONSTRAINT [FK_MovieGenreMapping_GenreID]
GO
ALTER TABLE [dbo].[MovieGenreMapping]  WITH CHECK ADD  CONSTRAINT [FK_MovieGenreMapping_MovieID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[MovieGenreMapping] CHECK CONSTRAINT [FK_MovieGenreMapping_MovieID]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_UploadedBy] FOREIGN KEY([UploadedBy])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_UploadedBy]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_SubscriptionPlanID] FOREIGN KEY([SubscriptionPlanID])
REFERENCES [dbo].[SubscriptionPlans] ([PlanID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_SubscriptionPlanID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_UserID]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_MovieID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_MovieID]
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD  CONSTRAINT [FK_Ratings_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Ratings] CHECK CONSTRAINT [FK_Ratings_UserID]
GO
ALTER TABLE [dbo].[UserFavorites]  WITH CHECK ADD  CONSTRAINT [FK_UserFavorites_MovieID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[UserFavorites] CHECK CONSTRAINT [FK_UserFavorites_MovieID]
GO
ALTER TABLE [dbo].[UserFavorites]  WITH CHECK ADD  CONSTRAINT [FK_UserFavorites_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserFavorites] CHECK CONSTRAINT [FK_UserFavorites_UserID]
GO
ALTER TABLE [dbo].[UserRefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_UserRefreshToken_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRefreshToken] CHECK CONSTRAINT [FK_UserRefreshToken_UserId]
GO
ALTER TABLE [dbo].[WatchHistory]  WITH CHECK ADD  CONSTRAINT [FK_WatchHistory_MovieID] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[WatchHistory] CHECK CONSTRAINT [FK_WatchHistory_MovieID]
GO
ALTER TABLE [dbo].[WatchHistory]  WITH CHECK ADD  CONSTRAINT [FK_WatchHistory_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WatchHistory] CHECK CONSTRAINT [FK_WatchHistory_UserID]
GO
USE [master]
GO
ALTER DATABASE [CinemaHub] SET  READ_WRITE 
GO

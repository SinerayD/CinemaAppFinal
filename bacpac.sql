USE [master]
GO
/****** Object:  Database [CinemaApp]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE DATABASE [CinemaApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CinemaApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\CinemaApp.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CinemaApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\CinemaApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CinemaApp] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CinemaApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CinemaApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CinemaApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CinemaApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CinemaApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CinemaApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [CinemaApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CinemaApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CinemaApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CinemaApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CinemaApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CinemaApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CinemaApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CinemaApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CinemaApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CinemaApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CinemaApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CinemaApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CinemaApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CinemaApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CinemaApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CinemaApp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CinemaApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CinemaApp] SET RECOVERY FULL 
GO
ALTER DATABASE [CinemaApp] SET  MULTI_USER 
GO
ALTER DATABASE [CinemaApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CinemaApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CinemaApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CinemaApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CinemaApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CinemaApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CinemaApp', N'ON'
GO
ALTER DATABASE [CinemaApp] SET QUERY_STORE = ON
GO
ALTER DATABASE [CinemaApp] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CinemaApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/11/2023 11:11:41 PM ******/
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
/****** Object:  Table [dbo].[AboutSettings]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AboutSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AboutImage] [nvarchar](max) NOT NULL,
	[AboutTitle1] [nvarchar](max) NOT NULL,
	[AboutTitle2] [nvarchar](max) NOT NULL,
	[AboutText1] [nvarchar](max) NOT NULL,
	[AboutText2] [nvarchar](max) NOT NULL,
	[AboutText3] [nvarchar](max) NOT NULL,
	[AboutText4] [nvarchar](max) NOT NULL,
	[AboutImage1] [nvarchar](max) NOT NULL,
	[AboutImage2] [nvarchar](max) NOT NULL,
	[AboutImage3] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AboutSettings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 9/11/2023 11:11:41 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/11/2023 11:11:41 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/11/2023 11:11:41 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/11/2023 11:11:41 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/11/2023 11:11:41 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[SurName] [nvarchar](max) NOT NULL,
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 9/11/2023 11:11:41 PM ******/
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
/****** Object:  Table [dbo].[BasketItems]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NULL,
	[BasketId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Baskets]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baskets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [nvarchar](450) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Baskets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogCategories]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BlogCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogTags]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogTags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagId] [int] NOT NULL,
	[BlogId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_BlogTags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NOT NULL,
	[BlogId] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AppUserId1] [nvarchar](450) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactMessages]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Subject] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ContactMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Galleries]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Galleries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Galleries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieActors]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieActors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MovieActors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieCategories]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MovieCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovieLanguages]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieLanguages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MovieLanguages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[RunningTime] [int] NOT NULL,
	[ReleaseDate] [datetime2](7) NOT NULL,
	[Director] [nvarchar](max) NOT NULL,
	[Rating] [nvarchar](max) NOT NULL,
	[Writer] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[VideoUrl] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[TrailerImage] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SettingFooters]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SettingFooters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FooterLogo] [nvarchar](max) NULL,
	[Link1] [nvarchar](max) NULL,
	[Link2] [nvarchar](max) NULL,
	[Link3] [nvarchar](max) NULL,
	[Link4] [nvarchar](max) NULL,
	[LinkImage1] [nvarchar](max) NULL,
	[LinkImage2] [nvarchar](max) NULL,
	[LinkImage3] [nvarchar](max) NULL,
	[LinkImage4] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SettingFooters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Writer] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[Year] [nvarchar](max) NOT NULL,
	[MovieGenre] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscribes]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscribes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Subscribes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 9/11/2023 11:11:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230902103214_initial', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230902105357_movietableupdated', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230903182401_movietabletrailerimageadded', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230903191058_actortableupdated', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230904001042_addedgallerytable', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230904012634_addedtrailerfileinmovietable', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230904204349_addedusertable', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230908175033_Contact', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230909123552_settingfooter', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230909124251_aboutsetting', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230909125329_aboutsettingupdated', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230909130251_aboutsettingsupdated', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230909130427_aboutsettingaddedimagefile', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230909132013_aboutformfileadded', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230910191043_CreateBasket', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230910214304_commentupdated', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230910214712_RemoveColumn', N'6.0.21')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230910221206_appusercomment', N'6.0.21')
GO
SET IDENTITY_INSERT [dbo].[AboutSettings] ON 

INSERT [dbo].[AboutSettings] ([Id], [AboutImage], [AboutTitle1], [AboutTitle2], [AboutText1], [AboutText2], [AboutText3], [AboutText4], [AboutImage1], [AboutImage2], [AboutImage3], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'hjm', N'ABOUT Cinemax ENTERTAINMENT', N'Get To Know', N'Cinemax Entertainmentis a leader in the premium entertainment cinema sector in the Azerbaijan.', N'Committed to continued growth and development of its premium entertainment ‘big screen’ experience, Cinemax delivers the best choice of content, combined with the best technology in the best environment.', N'Cinemax is leading cinema, with over 89 screens. This includes 20 3D screens, 11 Extreme Screens, 7 Gold Class screens, 6 Scene Screens and Bars and 3 IMAX screens where Cinemax project the majority of our films in Sony Digital Cinema 4K for ultra high definition pictures with four times more detail. With over 20,000 seats, 98% of which are stadium seating, Cinemax innovative development programme has led the way in the Azerbaijan. Cinemax remain the first and third highest grossing cinemas in the country.', N'Cinemax Cinemas around the Azerbaijan offer a range of content, in addition to highly anticipated blockbusters, with event cinema titles including opera, ballet, musicals, national theatre, live streaming of sporting events and concerts through to hosting Gaming championships and dedicating multiple screens to eGaming arenas.', N'gh', N'hg', N'hg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[AboutSettings] OFF
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [FullName], [Role], [CreatedAt], [UpdatedAt], [IsDeleted], [Image]) VALUES (1, N'Cillian Murphy', N'J. Robert Oppenheimer', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Actors] ([Id], [FullName], [Role], [CreatedAt], [UpdatedAt], [IsDeleted], [Image]) VALUES (2, N'SALINA GOMAZE', N'Eleven', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Actors] ([Id], [FullName], [Role], [CreatedAt], [UpdatedAt], [IsDeleted], [Image]) VALUES (3, N'Emily Blunt', N'Kitty Oppenheimer', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Actors] ([Id], [FullName], [Role], [CreatedAt], [UpdatedAt], [IsDeleted], [Image]) VALUES (4, N'STEPHEN FLEMING', N'Eleven', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Actors] ([Id], [FullName], [Role], [CreatedAt], [UpdatedAt], [IsDeleted], [Image]) VALUES (5, N'Robert Downey Jr.', N'Lewis Strauss', CAST(N'2023-09-03T23:31:58.1584682' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'74ab9bf7-5333-415a-a835-1a11a2586092actor-4.jpg')
INSERT [dbo].[Actors] ([Id], [FullName], [Role], [CreatedAt], [UpdatedAt], [IsDeleted], [Image]) VALUES (6, N'Emily Blunt', N'Kitty Oppenheimer', CAST(N'2023-09-03T23:37:38.0882998' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'50bc6fef-ea49-4441-9527-caeff25837d5actor-2.jpg')
INSERT [dbo].[Actors] ([Id], [FullName], [Role], [CreatedAt], [UpdatedAt], [IsDeleted], [Image]) VALUES (7, N'Cillian Murphy', N'J. Robert Oppenheimer', CAST(N'2023-09-03T23:38:22.8499041' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'c7d751f6-f1c5-4521-ba50-c5614e82d7e7actor-1.jpg')
INSERT [dbo].[Actors] ([Id], [FullName], [Role], [CreatedAt], [UpdatedAt], [IsDeleted], [Image]) VALUES (8, N' Matt Damon', N'Leslie Groves', CAST(N'2023-09-03T23:38:45.2710387' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'1903f7e6-f71f-4af1-b418-cd63dfb81e6eactor-3.jpg')
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'85eaa80c-33d2-49ad-ba6d-f6c0dbc9d086', N'Admin', N'ADMIN', N'63e36a03-01f0-4b30-aa36-3d12dc5544e8')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'b3788c35-4c8f-4144-b22d-e9553cfb7441', N'SuperAdmin', N'SUPERADMIN', N'e252a471-9cc0-4e27-ba83-a25232efd7ab')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'cc75f7ca-4b1c-42af-9c7a-e1a6842a1116', N'User', N'USER', N'1ea4055e-84e1-4953-bfdb-0a50e7f2d47b')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1ef16e32-18b3-4e57-ac22-856569315e41', N'85eaa80c-33d2-49ad-ba6d-f6c0dbc9d086')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0df366c6-8dc3-4f70-9d85-3f0f12232923', N'b3788c35-4c8f-4144-b22d-e9553cfb7441')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f926b06b-1838-47f2-a59d-a8200a2bffdd', N'b3788c35-4c8f-4144-b22d-e9553cfb7441')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Name], [SurName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0df366c6-8dc3-4f70-9d85-3f0f12232923', N'huseyin', N'asas', N'huseyin', N'HUSEYIN', N'huseynnj@code.edu.az', N'HUSEYNNJ@CODE.EDU.AZ', 1, N'AQAAAAEAACcQAAAAEMmsmDPFSOrWKrppuT09yVFnH/p9QmGQNrIx6OnTYBsjkEAnjS2R6WG4M6wLYIxU4w==', N'PTNGK6FG5DDCSJVIJZDM5KTVELZR2FJJ', N'dea104d2-656d-44d9-ad53-2531f797f33e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [SurName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1ef16e32-18b3-4e57-ac22-856569315e41', N'Sineray', N'Dayday', N'sineraydayday', N'SINERAYDAYDAY', N'sineraytd@code.edu.az', N'SINERAYTD@CODE.EDU.AZ', 1, N'AQAAAAEAACcQAAAAEA5N/sCO2Te6KFFm06QgSbyCSYdfzltNMA6c8KHJLznZJACv+IV/yZvHUavl/pg8Cw==', N'X2B26VSRXKHIVONTQ64RCSE7MPBC2DKS', N'447d0cb3-a777-4a24-9bf3-89837b57cc45', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [SurName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f926b06b-1838-47f2-a59d-a8200a2bffdd', N'SuperAdmin', N'SuperAdmin', N'SuperAdmin', N'SUPERADMIN', N'SuperAdmin@Mail.ru', N'SUPERADMIN@MAIL.RU', 1, N'AQAAAAEAACcQAAAAEF8upM5I58STlShg8RPPOPZDZsjf7C/i2ZYfwXuPEj5nmAcBgwXge2Z7wIBYEiE9tA==', N'4QB5GMTPS2QLGS36ZACID6EOOGUWVMZT', N'fc5ae2b0-e0d5-4047-bc8c-5b7a34f4a96b', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[BasketItems] ON 

INSERT [dbo].[BasketItems] ([Id], [MovieId], [BasketId], [Quantity], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, 3, 1, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[BasketItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Baskets] ON 

INSERT [dbo].[Baskets] ([Id], [AppUserId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'0df366c6-8dc3-4f70-9d85-3f0f12232923', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Baskets] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogCategories] ON 

INSERT [dbo].[BlogCategories] ([Id], [CategoryId], [BlogId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, 4, 1, CAST(N'2023-09-03T00:09:57.5556963' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[BlogCategories] ([Id], [CategoryId], [BlogId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, 1, 2, CAST(N'2023-09-03T00:10:51.2255651' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[BlogCategories] ([Id], [CategoryId], [BlogId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, 6, 3, CAST(N'2023-09-03T00:11:26.5462244' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[BlogCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [Image], [Title], [Description], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'091dd796-5517-4596-9db6-82852c4e8857blog2.jpeg', N'"Retrospective viewing of classic Azerbaijani films"', N'As it is known, the 2nd of August is a professional holiday in the film industry - the Day of Cinema of Azerbaijan. On the occasion of the 125th anniversary of the Azerbaijani cinema and the 100th anniversary of the film studio "Azerbaycanfilm", from August 3 to 10, the chain of premium cinemas "CinemaPlus" along with the Ministry of Culture of the Republic of Azerbaijan, the Film Agency of the Republic of Azerbaijan and the film studio "Azerbaycanfilm" will organize a "Retrospective viewing of classic Azerbaijani films".  During the event, the chain of cinemas network "CinemaPlus" has scheduled the screening of the following films:', CAST(N'2023-09-03T00:09:57.6211851' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Blogs] ([Id], [Image], [Title], [Description], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, N'0095f30c-b3a8-4f9a-b792-5542f33ddb81blog1.jpg', N'This week''s most anticipated movies at CinemaPlus ', N'From July 20 in the “CinemaPlus” cinema chain, the 2 most anticipated films produced in the UK and the USA are expected.  Based on real events, the biographical movie “Oppenheimer”.  This story is about the life of the American physicist, under whose leadership the atomic bomb was created during World War II.  Despite numerous merits in the field of quantum mechanics and theory, as well as cosmic ray physics, Robert Oppenheimer became widely known around the world thanks to the creation of lethal weapons. It was he who first in the United States, and later throughout the world, became known as the “father of the nuclear bomb”.  The movie is directed and written by Christopher Nolan. In his career, this is the longest movie and the first in 20 years with an age rating of R (up to 17 years old must be an adult).  Cillian Murphy plays the lead role, along with Emily Blunt, Matt Damon, Robert Downey Jr., and others.  The movie has a budget of $100,000,000.  The film in the CinemaPlus theater chain is shown in 2 languages: Russian and English.', CAST(N'2023-09-03T00:10:51.2290996' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Blogs] ([Id], [Image], [Title], [Description], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, N'5ff4c3ca-6a88-4612-a76f-3e2b86119662blog-3.jpg', N'CinemaPlus has phenomenal hype for Barbenheimer', N'A historic event is celebrated in the premium class chain of cinemas “CinemaPlus” - the screening of the films "Barbie" and "Oppenheimer", which were released on the same day. This year this film event has become a real cultural phenomenon. The audience buys tickets to evaluate both films at once. Spectators come to the chain of cinemas “CinemaPlus” in pink and black outfits.  Just in its first week, “Barbie” grossed nearly $530 million worldwide. “Oppenheimer” grossed over $265 million in its first week. However, it would be incorrect to compare films in order to determine the winner in terms of box office. If "Barbie" is based on a doll known to many generations and the picture can be safely watched with children, then "Oppenheimer" is a three-hour biopic about physics with an "adult" R rating.', CAST(N'2023-09-03T00:11:26.5487265' AS DateTime2), CAST(N'2023-09-04T03:31:36.9679968' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogTags] ON 

INSERT [dbo].[BlogTags] ([Id], [TagId], [BlogId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, 2, 1, CAST(N'2023-09-03T00:09:57.6117393' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[BlogTags] ([Id], [TagId], [BlogId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, 1, 2, CAST(N'2023-09-03T00:10:51.2262790' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[BlogTags] ([Id], [TagId], [BlogId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, 4, 3, CAST(N'2023-09-03T00:11:26.5471829' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[BlogTags] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'Action', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, N'Thriller', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, N'Comedy', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (4, N'Documentary', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (5, N'Historical', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Categories] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (6, N'Fiction', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactMessages] ON 

INSERT [dbo].[ContactMessages] ([Id], [Name], [Subject], [Email], [PhoneNumber], [Comment], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'hchdgh', N'hdcdbch', N'hchdh@mailnf.ru', N'6737647', N'jhcjjdh', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[ContactMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[Galleries] ON 

INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, NULL, CAST(N'2023-09-04T04:30:13.2819282' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, NULL, CAST(N'2023-09-04T04:30:25.2466968' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, N'7007caf0-3131-406b-8fdb-cb5df44d8483gallery3.jpg', CAST(N'2023-09-04T04:30:34.2862659' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (4, N'16699545-5ddc-4aac-9139-0acdc60763afgallery4.jpg', CAST(N'2023-09-04T04:30:46.4724640' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (5, N'a31cdbb7-cd2a-4898-a655-5b0bc798ad5cgallery5.jpg', CAST(N'2023-09-04T04:30:54.7905991' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (6, N'1f7c43e4-c9e3-448a-934c-30ed567efe55gallery6.jpg', CAST(N'2023-09-04T04:31:02.6706092' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (7, N'3d51cd43-9335-4518-b8c1-c46c7d8e7f28gallery1.jpg', CAST(N'2023-09-04T04:41:24.9148445' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (8, N'c883f07e-8f83-4144-903d-a63692dce88fgallery1.jpg', CAST(N'2023-09-04T04:53:16.8815003' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (9, N'b220ae32-11b8-4f52-851f-10a4a6969665gallery6.jpg', CAST(N'2023-09-04T05:04:33.3591846' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Galleries] ([Id], [Image], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (10, N'14d2fb2b-cdba-4255-a6f3-e64f6075294fgallery2.jpg', CAST(N'2023-09-04T05:04:46.7754229' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Galleries] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 

INSERT [dbo].[Languages] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'Azerbaycanca', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Languages] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, N'Turkce', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Languages] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, N'English', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Languages] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (4, N'Rusca', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieActors] ON 

INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (38, 3, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (39, 3, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (40, 3, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (41, 3, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (42, 4, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (43, 4, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (44, 4, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (45, 4, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (46, 5, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (47, 5, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (48, 5, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (49, 5, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (50, 6, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (51, 6, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (52, 6, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (53, 6, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (54, 7, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (55, 7, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (56, 7, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (57, 7, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (58, 8, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (59, 8, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (60, 8, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (61, 8, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (62, 9, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (63, 9, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (64, 9, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (65, 9, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (66, 10, 5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (67, 10, 6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (68, 10, 7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (69, 10, 8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (70, 11, 5, CAST(N'2023-09-04T05:08:59.2660314' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (71, 11, 6, CAST(N'2023-09-04T05:08:59.2739121' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (72, 11, 7, CAST(N'2023-09-04T05:08:59.2744622' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (73, 11, 8, CAST(N'2023-09-04T05:08:59.2749241' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (74, 12, 5, CAST(N'2023-09-04T05:16:07.4629488' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (75, 12, 6, CAST(N'2023-09-04T05:16:07.4654823' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (76, 12, 7, CAST(N'2023-09-04T05:16:07.4663944' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (77, 12, 8, CAST(N'2023-09-04T05:16:07.4671315' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (78, 13, 5, CAST(N'2023-09-04T05:17:01.5783062' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (79, 13, 6, CAST(N'2023-09-04T05:17:01.5787980' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (80, 13, 7, CAST(N'2023-09-04T05:17:01.5792390' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (81, 13, 8, CAST(N'2023-09-04T05:17:01.5796697' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (82, 14, 5, CAST(N'2023-09-04T05:20:30.8618731' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (83, 14, 6, CAST(N'2023-09-04T05:20:30.8637283' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (84, 14, 7, CAST(N'2023-09-04T05:20:30.8642673' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (85, 14, 8, CAST(N'2023-09-04T05:20:30.8648441' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (86, 15, 5, CAST(N'2023-09-04T05:35:50.1647694' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (87, 15, 6, CAST(N'2023-09-04T05:35:50.1667114' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (88, 15, 7, CAST(N'2023-09-04T05:35:50.1671742' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (89, 15, 8, CAST(N'2023-09-04T05:35:50.1676279' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (90, 16, 5, CAST(N'2023-09-04T05:45:33.8913712' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (91, 16, 6, CAST(N'2023-09-04T05:45:33.8934390' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (92, 16, 7, CAST(N'2023-09-04T05:45:33.8939938' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (93, 16, 8, CAST(N'2023-09-04T05:45:33.8946047' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (94, 17, 5, CAST(N'2023-09-04T06:33:53.6340741' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (95, 17, 6, CAST(N'2023-09-04T06:33:53.6361905' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (96, 17, 7, CAST(N'2023-09-04T06:33:53.6367860' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (97, 17, 8, CAST(N'2023-09-04T06:33:53.6372668' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (98, 18, 5, CAST(N'2023-09-04T06:36:10.9076324' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (99, 18, 6, CAST(N'2023-09-04T06:36:10.9081637' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (100, 18, 7, CAST(N'2023-09-04T06:36:10.9085155' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (101, 18, 8, CAST(N'2023-09-04T06:36:10.9088441' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1070, 1011, 5, CAST(N'2023-09-04T23:22:30.3493077' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1071, 1011, 6, CAST(N'2023-09-04T23:22:30.3579274' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1072, 1011, 7, CAST(N'2023-09-04T23:22:30.3586024' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieActors] ([Id], [MovieId], [ActorId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1073, 1011, 8, CAST(N'2023-09-04T23:22:30.3591690' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[MovieActors] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieCategories] ON 

INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, 1, 1, CAST(N'2023-09-02T15:31:35.1833729' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, 1, 2, CAST(N'2023-09-02T15:31:40.0076445' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, 2, 1, CAST(N'2023-09-02T15:35:34.4236113' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (6, 4, 3, CAST(N'2023-09-02T15:36:29.4161074' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (8, 6, 1, CAST(N'2023-09-02T15:37:20.5459889' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (9, 7, 2, CAST(N'2023-09-02T15:37:54.7949691' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (16, 1, 4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (17, 2, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (18, 2, 4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (20, 9, 2, CAST(N'2023-09-03T22:54:59.7658548' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (22, 10, 1, CAST(N'2023-09-03T23:01:10.5870421' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (23, 10, 2, CAST(N'2023-09-03T23:01:10.6242577' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (25, 5, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (28, 3, 3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (29, 3, 4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (30, 4, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (31, 4, 4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (32, 5, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (33, 6, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (34, 7, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (35, 7, 3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (36, 8, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (37, 8, 2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (38, 11, 2, CAST(N'2023-09-04T05:08:59.2537968' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (39, 11, 6, CAST(N'2023-09-04T05:08:59.2624162' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (40, 12, 1, CAST(N'2023-09-04T05:16:07.4227673' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (41, 12, 4, CAST(N'2023-09-04T05:16:07.4569506' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (42, 13, 1, CAST(N'2023-09-04T05:17:01.5762039' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (43, 13, 3, CAST(N'2023-09-04T05:17:01.5770276' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (44, 14, 1, CAST(N'2023-09-04T05:20:30.8223626' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (45, 14, 2, CAST(N'2023-09-04T05:20:30.8588741' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (46, 15, 1, CAST(N'2023-09-04T05:35:50.1216544' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (47, 15, 2, CAST(N'2023-09-04T05:35:50.1545501' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (48, 16, 1, CAST(N'2023-09-04T05:45:33.8587598' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (49, 16, 2, CAST(N'2023-09-04T05:45:33.8882930' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (50, 17, 1, CAST(N'2023-09-04T06:33:53.5942547' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (51, 17, 2, CAST(N'2023-09-04T06:33:53.6310415' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (52, 18, 1, CAST(N'2023-09-04T06:36:10.9038355' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (53, 18, 2, CAST(N'2023-09-04T06:36:10.9046673' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1038, 1011, 3, CAST(N'2023-09-04T23:22:30.3069117' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieCategories] ([Id], [MovieId], [CategoryId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1039, 1011, 4, CAST(N'2023-09-04T23:22:30.3458829' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[MovieCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieLanguages] ON 

INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (36, 9, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (37, 10, 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (38, 11, 1, CAST(N'2023-09-04T05:08:59.2778543' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (39, 12, 2, CAST(N'2023-09-04T05:16:07.4716977' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (40, 13, 1, CAST(N'2023-09-04T05:17:01.5813270' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (41, 14, 1, CAST(N'2023-09-04T05:20:30.8685165' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (42, 15, 2, CAST(N'2023-09-04T05:35:50.1708787' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (43, 16, 1, CAST(N'2023-09-04T05:45:33.8974359' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (44, 16, 2, CAST(N'2023-09-04T05:45:33.8992548' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (45, 16, 3, CAST(N'2023-09-04T05:45:33.8996783' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (46, 16, 4, CAST(N'2023-09-04T05:45:33.9000644' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (47, 17, 1, CAST(N'2023-09-04T06:33:53.6400568' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (48, 17, 2, CAST(N'2023-09-04T06:33:53.6419332' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (49, 17, 3, CAST(N'2023-09-04T06:33:53.6424300' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (50, 17, 4, CAST(N'2023-09-04T06:33:53.6428932' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (51, 18, 1, CAST(N'2023-09-04T06:36:10.9102459' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (52, 18, 2, CAST(N'2023-09-04T06:36:10.9106739' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (53, 18, 3, CAST(N'2023-09-04T06:36:10.9110057' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (54, 18, 4, CAST(N'2023-09-04T06:36:10.9113294' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1038, 1011, 2, CAST(N'2023-09-04T23:22:30.3623575' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MovieLanguages] ([Id], [MovieId], [LanguageId], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1039, 1011, 3, CAST(N'2023-09-04T23:22:30.3651934' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[MovieLanguages] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (1, N'Oppenheimer', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'505a6946-5d82-47ce-b84c-a6474d21335cOppenheimerOfficialPoster.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (2, N'Oppenheimer', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'c69c09e3-f581-464e-8dc5-0fb7bc2f997foppenheimer-image.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (3, N'Oppenheimer', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N' Christopher NolanKai BirdMartin Sherwin', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'c57f43c1-c709-46e1-8f31-35e1a6aa8a0fOppenheimerOfficialPoster.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (4, N'Oppenheimer', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'76dc89f5-1495-4c52-aee1-28a1449874abOppenheimerOfficialPoster.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, CAST(10.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (5, N'Barbie', 23, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'54', N' Christopher NolanKai BirdMartin Sherwin', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'831f802c-2f41-4ace-bb63-ff1992ccf7391111111.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (6, N'Barbie', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'54', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'aefeed5b-72e8-4b06-9516-74c2563d97a8barbie.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, CAST(45.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (7, N'Barbie', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'a3133fc4-b6dd-4bee-94f7-f577313424ffbarbie.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, CAST(78.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (8, N'Barbie', 23, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'54', N'Antoine Fuqua Richard WenkMichael SloanRichard Lindheim', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'2389189d-25d7-4ff4-854c-327a27ecf11ebarbie.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (9, N'Oppenheimer', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'49aca287-dfc3-4e86-aaa8-1b04f3352e29OppenheimerOfficialPoster.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (10, N'Oppenheimer', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N' Christopher NolanKai ', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'de259211-f1bd-49a1-8bfc-49494f9cc2eeOppenheimerOfficialPoster.jpg', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, NULL, CAST(19.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (11, N'The Equilazer', 23, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'54', N' Christopher NolanKai BirdMartin Sherwin', N'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'68dce2f1-a3f1-473c-bd20-acd6dd89f4dcthe-equalizer.jpg', CAST(N'2023-09-04T05:08:59.2824596' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, NULL, CAST(21.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (12, N'The Equilazer', 120, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'54', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'e80aa8e7-3b6b-4438-8bbd-86b5a2edef34the-equalizer.jpg', CAST(N'2023-09-04T05:16:07.4814774' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'f47cff04-b7e6-42f7-9a93-700efcd5f785the-equalizer.jpg', CAST(35.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (13, N'The Equilazer', 120, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'dff465ca-facf-4282-a2d7-19d6333004efthe-equalizer.jpg', CAST(N'2023-09-04T05:17:01.5881679' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'bc95e2d1-2a01-4b7e-a8f2-f59723d93ec3the-equalizer.jpg', CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (14, N'The Equilazer', 120, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'b634acd4-94d9-4686-8174-05179011992cthe-equalizer.jpg', CAST(N'2023-09-04T05:20:30.8770468' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'5150c8f8-9deb-43bd-aaf7-c2e726414123the-equalizer.jpg', CAST(14.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (15, N'The Equilazer', 120, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N' Christopher NolanKai BirdMartin Sherwin', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'ef4911a0-f648-4587-9365-5d25c7c8999fthe-equalizer.jpg', CAST(N'2023-09-04T05:35:50.1766287' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'f99e7e74-2393-49d3-88c4-bfba3cd6c2d2equilazer-trailer.jpg', CAST(36.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (16, N'The Equilazer', 23, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'a3fea51d-84a2-488d-b57c-079d35299c3athe-equalizer.jpg', CAST(N'2023-09-04T05:45:33.9040496' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'74de4c34-9d8f-4ea4-8642-023bc3f7f37cequilazer-trailer.jpg', CAST(32.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (17, N'The Equilazer', 23, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N' Christopher NolanKai BirdMartin Sherwin', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'd4b3c232-1ee4-40fa-891a-70d93a9e2399The-equalizer.jpg', CAST(N'2023-09-04T06:33:53.6458350' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'd1a1ae3d-564d-4e19-a8bb-fccd283bf556equilazer-trailer.jpg', CAST(37.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (18, N'The Equilazer', 35, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'055b8f7c-f582-42a5-847e-b48a03b370b8The-equalizer.jpg', CAST(N'2023-09-04T06:36:10.9135833' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'0c5cd8f0-52ac-4ec8-9b07-4a9d2537f732equilazer-3.jpg', CAST(28.00 AS Decimal(18, 2)))
INSERT [dbo].[Movies] ([Id], [Name], [RunningTime], [ReleaseDate], [Director], [Rating], [Writer], [Description], [VideoUrl], [Image], [CreatedAt], [UpdatedAt], [IsDeleted], [TrailerImage], [Price]) VALUES (1011, N'Mission Impossible', 180, CAST(N'2023-03-20T00:00:00.0000000' AS DateTime2), N'Christiene', N'90', N'Greta GerwigNoah Baumbach', N'I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque sa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam volutatem quia voluptas sit asnatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste natus error sit voluptatem accusantium doloremque la udantium, totam rem aperiam  I must explain to you how all this a mistaken idea of denouncing great explorer of the rut the is lder of human haness pcias unde omnis iste na', N'https://youtu.be/uYPbbksJxIg?feature=shared', N'5bb71a14-7f97-435c-b90a-8a2896d28c6dimpossible-mission.jpg', CAST(N'2023-09-04T23:22:30.3689759' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0, N'e69c6cce-ff3a-429c-acee-8b0a73cbdaa0mission-impossible.jpg', CAST(29.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Title], [Writer], [Country], [Year], [MovieGenre], [Image], [IsActive], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'Oppenheimer', N'Greta GerwigNoah Baumbach', N'United States', N'2023', N'Biography Drama History', N'3bc4682e-8bfa-4624-9e77-7a33346ce8e2oppenheimer.jpg', 0, CAST(N'2023-09-02T15:34:09.0345472' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Sliders] ([Id], [Title], [Writer], [Country], [Year], [MovieGenre], [Image], [IsActive], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, N'Barbie', N' Christopher NolanKai BirdMartin Sherwin', N'United States', N'2023', N'Adventure Comedy Fantasy', N'0db85ce2-c86b-486f-bc1a-cce2c90e18abbarbie.jpg', 0, CAST(N'2023-09-02T15:34:26.2095183' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Sliders] ([Id], [Title], [Writer], [Country], [Year], [MovieGenre], [Image], [IsActive], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, N'The Equilazer', N'Antoine Fuqua Richard WenkMichael SloanRichard Lindheim', N'United States', N'2023', N'Action Crime Thriller', N'62acc764-4fbf-4fbf-b54e-8fc7f72792cbequilazer.jpg', 0, CAST(N'2023-09-02T15:34:48.4564860' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1, N'Adventure', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Tags] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (2, N'Film', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Tags] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (3, N'Movie', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Tags] ([Id], [Name], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (4, N'TV Show', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_BasketId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_BasketId] ON [dbo].[BasketItems]
(
	[BasketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_MovieId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_MovieId] ON [dbo].[BasketItems]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Baskets_AppUserId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Baskets_AppUserId] ON [dbo].[Baskets]
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogCategories_BlogId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogCategories_BlogId] ON [dbo].[BlogCategories]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogCategories_CategoryId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogCategories_CategoryId] ON [dbo].[BlogCategories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogTags_BlogId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogTags_BlogId] ON [dbo].[BlogTags]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BlogTags_TagId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_BlogTags_TagId] ON [dbo].[BlogTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Comments_AppUserId1]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_AppUserId1] ON [dbo].[Comments]
(
	[AppUserId1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_BlogId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_BlogId] ON [dbo].[Comments]
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieActors_ActorId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieActors_ActorId] ON [dbo].[MovieActors]
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieActors_MovieId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieActors_MovieId] ON [dbo].[MovieActors]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieCategories_CategoryId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieCategories_CategoryId] ON [dbo].[MovieCategories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieCategories_MovieId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieCategories_MovieId] ON [dbo].[MovieCategories]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieLanguages_LanguageId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieLanguages_LanguageId] ON [dbo].[MovieLanguages]
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovieLanguages_MovieId]    Script Date: 9/11/2023 11:11:41 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieLanguages_MovieId] ON [dbo].[MovieLanguages]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (N'') FOR [Text]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((0.0)) FOR [Price]
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
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Baskets_BasketId] FOREIGN KEY([BasketId])
REFERENCES [dbo].[Baskets] ([Id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Baskets_BasketId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Movies_MovieId]
GO
ALTER TABLE [dbo].[Baskets]  WITH CHECK ADD  CONSTRAINT [FK_Baskets_AspNetUsers_AppUserId] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Baskets] CHECK CONSTRAINT [FK_Baskets_AspNetUsers_AppUserId]
GO
ALTER TABLE [dbo].[BlogCategories]  WITH CHECK ADD  CONSTRAINT [FK_BlogCategories_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogCategories] CHECK CONSTRAINT [FK_BlogCategories_Blogs_BlogId]
GO
ALTER TABLE [dbo].[BlogCategories]  WITH CHECK ADD  CONSTRAINT [FK_BlogCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogCategories] CHECK CONSTRAINT [FK_BlogCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[BlogTags]  WITH CHECK ADD  CONSTRAINT [FK_BlogTags_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogTags] CHECK CONSTRAINT [FK_BlogTags_Blogs_BlogId]
GO
ALTER TABLE [dbo].[BlogTags]  WITH CHECK ADD  CONSTRAINT [FK_BlogTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BlogTags] CHECK CONSTRAINT [FK_BlogTags_Tags_TagId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_AspNetUsers_AppUserId1] FOREIGN KEY([AppUserId1])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_AspNetUsers_AppUserId1]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blogs_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Blogs_BlogId]
GO
ALTER TABLE [dbo].[MovieActors]  WITH CHECK ADD  CONSTRAINT [FK_MovieActors_Actors_ActorId] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieActors] CHECK CONSTRAINT [FK_MovieActors_Actors_ActorId]
GO
ALTER TABLE [dbo].[MovieActors]  WITH CHECK ADD  CONSTRAINT [FK_MovieActors_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieActors] CHECK CONSTRAINT [FK_MovieActors_Movies_MovieId]
GO
ALTER TABLE [dbo].[MovieCategories]  WITH CHECK ADD  CONSTRAINT [FK_MovieCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieCategories] CHECK CONSTRAINT [FK_MovieCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[MovieCategories]  WITH CHECK ADD  CONSTRAINT [FK_MovieCategories_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieCategories] CHECK CONSTRAINT [FK_MovieCategories_Movies_MovieId]
GO
ALTER TABLE [dbo].[MovieLanguages]  WITH CHECK ADD  CONSTRAINT [FK_MovieLanguages_Languages_LanguageId] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieLanguages] CHECK CONSTRAINT [FK_MovieLanguages_Languages_LanguageId]
GO
ALTER TABLE [dbo].[MovieLanguages]  WITH CHECK ADD  CONSTRAINT [FK_MovieLanguages_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieLanguages] CHECK CONSTRAINT [FK_MovieLanguages_Movies_MovieId]
GO
USE [master]
GO
ALTER DATABASE [CinemaApp] SET  READ_WRITE 
GO

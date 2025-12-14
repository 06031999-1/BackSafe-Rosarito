USE [AlertaRosaritobcDB]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [CK__Users__rol__619B8048]
GO
ALTER TABLE [dbo].[Reports] DROP CONSTRAINT [DF__Reports__estado__5AEE82B9]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/12/2025 10:45:28 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 13/12/2025 10:45:28 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Status]') AND type in (N'U'))
DROP TABLE [dbo].[Status]
GO
/****** Object:  Table [dbo].[ReportTypes]    Script Date: 13/12/2025 10:45:28 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportTypes]') AND type in (N'U'))
DROP TABLE [dbo].[ReportTypes]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 13/12/2025 10:45:28 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reports]') AND type in (N'U'))
DROP TABLE [dbo].[Reports]
GO
/****** Object:  User [alerta_rosarito_user]    Script Date: 13/12/2025 10:45:28 p. m. ******/
DROP USER [alerta_rosarito_user]
GO
/****** Object:  User [Gestor_Inventario]    Script Date: 13/12/2025 10:45:28 p. m. ******/
DROP USER [Gestor_Inventario]
GO
USE [master]
GO
/****** Object:  Database [AlertaRosaritobcDB]    Script Date: 13/12/2025 10:45:28 p. m. ******/
DROP DATABASE [AlertaRosaritobcDB]
GO
/****** Object:  Database [AlertaRosaritobcDB]    Script Date: 13/12/2025 10:45:28 p. m. ******/
CREATE DATABASE [AlertaRosaritobcDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AlertaRosaritobcDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AlertaRosaritobcDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AlertaRosaritobcDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AlertaRosaritobcDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AlertaRosaritobcDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AlertaRosaritobcDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AlertaRosaritobcDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET  MULTI_USER 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AlertaRosaritobcDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AlertaRosaritobcDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AlertaRosaritobcDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [AlertaRosaritobcDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AlertaRosaritobcDB]
GO
/****** Object:  User [Gestor_Inventario]    Script Date: 13/12/2025 10:45:29 p. m. ******/
CREATE USER [Gestor_Inventario] FOR LOGIN [Gestor_Inventario] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [alerta_rosarito_user]    Script Date: 13/12/2025 10:45:29 p. m. ******/
CREATE USER [alerta_rosarito_user] FOR LOGIN [alerta_rosarito_user] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [alerta_rosarito_user]
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 13/12/2025 10:45:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reports](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[edad] [int] NOT NULL,
	[sexo] [nvarchar](255) NOT NULL,
	[fecha_desaparicion] [date] NOT NULL,
	[lugar_desaparicion] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](max) NULL,
	[tipo_reporte_id] [int] NOT NULL,
	[foto] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
	[lat] [decimal](12, 8) NULL,
	[lng] [decimal](12, 8) NULL,
	[estado] [varchar](20) NOT NULL,
	[zona] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportTypes]    Script Date: 13/12/2025 10:45:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[color] [nvarchar](255) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 13/12/2025 10:45:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/12/2025 10:45:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[rol] [varchar](255) NULL,
	[createdAt] [datetimeoffset](7) NOT NULL,
	[updatedAt] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Reports] ADD  DEFAULT ('pendiente') FOR [estado]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([rol]=N'visitante' OR [rol]=N'voluntario' OR [rol]=N'admin'))
GO
USE [master]
GO
ALTER DATABASE [AlertaRosaritobcDB] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [TehnickiPregled]    Script Date: 12/8/2022 4:02:13 PM ******/
CREATE DATABASE [TehnickiPregled]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TehnickiPregled', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TehnickiPregled.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TehnickiPregled_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TehnickiPregled_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TehnickiPregled] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TehnickiPregled].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TehnickiPregled] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TehnickiPregled] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TehnickiPregled] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TehnickiPregled] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TehnickiPregled] SET ARITHABORT OFF 
GO
ALTER DATABASE [TehnickiPregled] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TehnickiPregled] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TehnickiPregled] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TehnickiPregled] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TehnickiPregled] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TehnickiPregled] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TehnickiPregled] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TehnickiPregled] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TehnickiPregled] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TehnickiPregled] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TehnickiPregled] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TehnickiPregled] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TehnickiPregled] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TehnickiPregled] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TehnickiPregled] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TehnickiPregled] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TehnickiPregled] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TehnickiPregled] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TehnickiPregled] SET  MULTI_USER 
GO
ALTER DATABASE [TehnickiPregled] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TehnickiPregled] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TehnickiPregled] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TehnickiPregled] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TehnickiPregled] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TehnickiPregled] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TehnickiPregled] SET QUERY_STORE = OFF
GO
USE [TehnickiPregled]
GO
/****** Object:  Table [dbo].[Automobil]    Script Date: 12/8/2022 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automobil](
	[AutomobilID] [int] IDENTITY(1,1) NOT NULL,
	[Marka] [nvarchar](30) NOT NULL,
	[Model] [nvarchar](30) NOT NULL,
	[BrSasije] [nvarchar](30) NOT NULL,
	[BrMotora] [nvarchar](30) NOT NULL,
	[GodProizvodnje] [smallint] NULL,
	[VlasnikID] [int] NOT NULL,
 CONSTRAINT [PK_Automobil] PRIMARY KEY CLUSTERED 
(
	[AutomobilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kontrolor]    Script Date: 12/8/2022 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontrolor](
	[KontrolorID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](30) NULL,
	[DatumZaposlenja] [date] NOT NULL,
 CONSTRAINT [PK_Kontrolor] PRIMARY KEY CLUSTERED 
(
	[KontrolorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TehnickiPregled]    Script Date: 12/8/2022 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TehnickiPregled](
	[TehnickiPregledID] [int] IDENTITY(1,1) NOT NULL,
	[AutomobilID] [int] NOT NULL,
	[KontrolorID] [int] NOT NULL,
	[DatumPregleda] [date] NOT NULL,
	[Cena] [money] NOT NULL,
	[Prosao] [bit] NULL,
 CONSTRAINT [PK_TehnickiPregled] PRIMARY KEY CLUSTERED 
(
	[TehnickiPregledID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vlasnik]    Script Date: 12/8/2022 4:02:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vlasnik](
	[VlasnikID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](30) NOT NULL,
	[BrTelefona] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Vlasnik] PRIMARY KEY CLUSTERED 
(
	[VlasnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Automobil]  WITH CHECK ADD  CONSTRAINT [FK_Automobil_Vlasnik] FOREIGN KEY([VlasnikID])
REFERENCES [dbo].[Vlasnik] ([VlasnikID])
GO
ALTER TABLE [dbo].[Automobil] CHECK CONSTRAINT [FK_Automobil_Vlasnik]
GO
ALTER TABLE [dbo].[TehnickiPregled]  WITH CHECK ADD  CONSTRAINT [FK_TehnickiPregled_Automobil] FOREIGN KEY([AutomobilID])
REFERENCES [dbo].[Automobil] ([AutomobilID])
GO
ALTER TABLE [dbo].[TehnickiPregled] CHECK CONSTRAINT [FK_TehnickiPregled_Automobil]
GO
ALTER TABLE [dbo].[TehnickiPregled]  WITH CHECK ADD  CONSTRAINT [FK_TehnickiPregled_Kontrolor] FOREIGN KEY([KontrolorID])
REFERENCES [dbo].[Kontrolor] ([KontrolorID])
GO
ALTER TABLE [dbo].[TehnickiPregled] CHECK CONSTRAINT [FK_TehnickiPregled_Kontrolor]
GO
USE [master]
GO
ALTER DATABASE [TehnickiPregled] SET  READ_WRITE 
GO

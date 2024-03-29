USE [master]
GO
/****** Object:  Database [Practica3]    Script Date: 14/09/2019 01:12:22 p.m. ******/
CREATE DATABASE [Practica3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica3', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Practica3.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Practica3_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Practica3_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Practica3] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Practica3] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Practica3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Practica3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica3] SET  MULTI_USER 
GO
ALTER DATABASE [Practica3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Practica3]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 14/09/2019 01:12:22 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumnos](
	[id] [int] NULL,
	[nombre] [char](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Practica3] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Consultorio_Medico]    Script Date: 13/10/2019 22:57:10 ******/
CREATE DATABASE [Consultorio_Medico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultorio_Medico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Consultorio_Medico.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Consultorio_Medico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Consultorio_Medico_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Consultorio_Medico] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio_Medico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio_Medico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Consultorio_Medico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio_Medico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultorio_Medico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Consultorio_Medico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultorio_Medico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Consultorio_Medico] SET  MULTI_USER 
GO
ALTER DATABASE [Consultorio_Medico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultorio_Medico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultorio_Medico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultorio_Medico] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Consultorio_Medico] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Consultorio_Medico]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 13/10/2019 22:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[ID_Cita] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[ID_Medico] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Informacion_Consulta]    Script Date: 13/10/2019 22:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Informacion_Consulta](
	[ID_Consulta] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[ID_Medico] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Costo] [money] NOT NULL,
	[ID_Tienda] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medico]    Script Date: 13/10/2019 22:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medico](
	[ID_Medico] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](50) NOT NULL,
	[Apellido_Materno] [varchar](50) NOT NULL,
	[Nombre_Completo_Medico]  AS (((([Apellido_Paterno]+' ')+[Apellido_Materno])+' ')+[Nombre]),
	[Edad] [int] NOT NULL,
	[Especialidad] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 13/10/2019 22:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[ID_Paciente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](50) NOT NULL,
	[Apellido_Materno] [varchar](50) NOT NULL,
	[Nombre_Completo_Paciente]  AS (((([Apellido_Paterno]+' ')+[Apellido_Materno])+' ')+[Nombre]),
	[Edad] [int] NOT NULL,
	[Registrado] [varchar](2) NOT NULL CONSTRAINT [Restriccion_Registrado]  DEFAULT ('No'),
PRIMARY KEY CLUSTERED 
(
	[ID_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente_Registrado]    Script Date: 13/10/2019 22:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente_Registrado](
	[ID_Paciente] [int] NOT NULL,
	[Enfermedades] [varchar](2) NOT NULL,
	[Numero_Enfermedades] [varchar](2) NULL,
	[Tipo_Enfermedades] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Registro_Medico]    Script Date: 13/10/2019 22:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Registro_Medico](
	[ID_Medico] [int] NOT NULL,
	[Especialidad] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Disponible] [varchar](2) NOT NULL,
	[Ingreso_A_Tienda] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 13/10/2019 22:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tienda](
	[ID_Tienda] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [INDX_Medico_ID]    Script Date: 13/10/2019 22:57:10 ******/
CREATE NONCLUSTERED INDEX [INDX_Medico_ID] ON [dbo].[Medico]
(
	[ID_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Cliente_ID]    Script Date: 13/10/2019 22:57:10 ******/
CREATE NONCLUSTERED INDEX [INDX_Cliente_ID] ON [dbo].[Paciente]
(
	[ID_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Paciente_Registrado] ADD  CONSTRAINT [Default_Enfermedades]  DEFAULT ('SE') FOR [Enfermedades]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Medico_Cita] FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medico] ([ID_Medico])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [Foreign_ID_Medico_Cita]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Paciente_Cita] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Paciente] ([ID_Paciente])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [Foreign_ID_Paciente_Cita]
GO
ALTER TABLE [dbo].[Informacion_Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Medico_Consulta] FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medico] ([ID_Medico])
GO
ALTER TABLE [dbo].[Informacion_Consulta] CHECK CONSTRAINT [Foreign_ID_Medico_Consulta]
GO
ALTER TABLE [dbo].[Informacion_Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Paciente_Consulta] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Paciente] ([ID_Paciente])
GO
ALTER TABLE [dbo].[Informacion_Consulta] CHECK CONSTRAINT [Foreign_ID_Paciente_Consulta]
GO
ALTER TABLE [dbo].[Informacion_Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Tienda_Consulta] FOREIGN KEY([ID_Tienda])
REFERENCES [dbo].[Tienda] ([ID_Tienda])
GO
ALTER TABLE [dbo].[Informacion_Consulta] CHECK CONSTRAINT [Foreign_ID_Tienda_Consulta]
GO
ALTER TABLE [dbo].[Paciente_Registrado]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Paciente] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Paciente] ([ID_Paciente])
GO
ALTER TABLE [dbo].[Paciente_Registrado] CHECK CONSTRAINT [Foreign_ID_Paciente]
GO
ALTER TABLE [dbo].[Registro_Medico]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Medico] FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medico] ([ID_Medico])
GO
ALTER TABLE [dbo].[Registro_Medico] CHECK CONSTRAINT [Foreign_ID_Medico]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [CH_Edad_Medico] CHECK  (([Edad]<=(70)))
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [CH_Edad_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [CH_Edad] CHECK  (([Edad]<=(115)))
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [CH_Edad]
GO
ALTER TABLE [dbo].[Registro_Medico]  WITH CHECK ADD  CONSTRAINT [CH_Edad_RegistroMedico] CHECK  (([Edad]<=(70)))
GO
ALTER TABLE [dbo].[Registro_Medico] CHECK CONSTRAINT [CH_Edad_RegistroMedico]
GO
USE [master]
GO
ALTER DATABASE [Consultorio_Medico] SET  READ_WRITE 
GO

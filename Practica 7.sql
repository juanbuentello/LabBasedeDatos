USE [master]
GO
/****** Object:  Database [Consultorio_Medico2]    Script Date: 26/10/2019 1:05:59 ******/
CREATE DATABASE [Consultorio_Medico2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultorio_Medico2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Consultorio_Medico2.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Consultorio_Medico2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Consultorio_Medico2_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Consultorio_Medico2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio_Medico2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio_Medico2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Consultorio_Medico2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio_Medico2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultorio_Medico2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Consultorio_Medico2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultorio_Medico2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Consultorio_Medico2] SET  MULTI_USER 
GO
ALTER DATABASE [Consultorio_Medico2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultorio_Medico2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultorio_Medico2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultorio_Medico2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Consultorio_Medico2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Consultorio_Medico2]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 26/10/2019 1:05:59 ******/
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
/****** Object:  Table [dbo].[Horario]    Script Date: 26/10/2019 1:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[ID_Horario] [int] NOT NULL,
	[Hora_Apertura] [time](7) NOT NULL,
	[Hora_Clausura] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Horario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Informacion_Medico]    Script Date: 26/10/2019 1:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Informacion_Medico](
	[ID_Medico] [int] NOT NULL,
	[Especialidad] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Domicilio] [varchar](100) NOT NULL,
	[Disponible] [varchar](2) NOT NULL,
	[Ingreso_A_Tienda] [date] NOT NULL,
	[Tiempo_Trabajo] [int] NOT NULL,
	[Salario] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 26/10/2019 1:05:59 ******/
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
/****** Object:  Table [dbo].[Paciente]    Script Date: 26/10/2019 1:05:59 ******/
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
/****** Object:  Table [dbo].[Paciente_Registrado]    Script Date: 26/10/2019 1:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente_Registrado](
	[ID_Paciente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido_Paterno] [varchar](50) NOT NULL,
	[Apellido_Materno] [varchar](50) NOT NULL,
	[Nombre_Completo_Paciente]  AS (((([Apellido_Paterno]+' ')+[Apellido_Materno])+' ')+[Nombre]),
	[Edad] [int] NOT NULL,
	[Domicilio] [varchar](100) NOT NULL,
	[Enfermedades] [varchar](2) NOT NULL CONSTRAINT [Default_Enfermedades]  DEFAULT ('SE'),
	[Padecimientos] [varchar](255) NULL,
	[Alergias] [varchar](2) NOT NULL,
	[Tipo_Alergias] [varchar](255) NULL,
	[Telefono] [int] NOT NULL,
	[Sexo] [varchar](1) NOT NULL,
	[Antecedentes_Familiares] [varchar](2) NOT NULL,
	[Tipos_Antecedentes] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket_Consulta]    Script Date: 26/10/2019 1:05:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket_Consulta](
	[ID_Ticket_Consulta] [int] NOT NULL,
	[ID_Paciente] [int] NOT NULL,
	[ID_Medico] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[Costo] [money] NOT NULL,
	[Nombre_Empleado] [varchar](100) NOT NULL,
	[ID_Tienda] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 26/10/2019 1:05:59 ******/
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
	[ID_Horario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Tienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [INDX_Medico_ID]    Script Date: 26/10/2019 1:05:59 ******/
CREATE NONCLUSTERED INDEX [INDX_Medico_ID] ON [dbo].[Medico]
(
	[ID_Medico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [INDX_Cliente_ID]    Script Date: 26/10/2019 1:05:59 ******/
CREATE NONCLUSTERED INDEX [INDX_Cliente_ID] ON [dbo].[Paciente]
(
	[ID_Paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[Informacion_Medico]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Medico] FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medico] ([ID_Medico])
GO
ALTER TABLE [dbo].[Informacion_Medico] CHECK CONSTRAINT [Foreign_ID_Medico]
GO
ALTER TABLE [dbo].[Paciente_Registrado]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Paciente] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Paciente] ([ID_Paciente])
GO
ALTER TABLE [dbo].[Paciente_Registrado] CHECK CONSTRAINT [Foreign_ID_Paciente]
GO
ALTER TABLE [dbo].[Ticket_Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Medico_Consulta] FOREIGN KEY([ID_Medico])
REFERENCES [dbo].[Medico] ([ID_Medico])
GO
ALTER TABLE [dbo].[Ticket_Consulta] CHECK CONSTRAINT [Foreign_ID_Medico_Consulta]
GO
ALTER TABLE [dbo].[Ticket_Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Paciente_Consulta] FOREIGN KEY([ID_Paciente])
REFERENCES [dbo].[Paciente] ([ID_Paciente])
GO
ALTER TABLE [dbo].[Ticket_Consulta] CHECK CONSTRAINT [Foreign_ID_Paciente_Consulta]
GO
ALTER TABLE [dbo].[Ticket_Consulta]  WITH CHECK ADD  CONSTRAINT [Foreign_ID_Tienda_Consulta] FOREIGN KEY([ID_Tienda])
REFERENCES [dbo].[Tienda] ([ID_Tienda])
GO
ALTER TABLE [dbo].[Ticket_Consulta] CHECK CONSTRAINT [Foreign_ID_Tienda_Consulta]
GO
ALTER TABLE [dbo].[Informacion_Medico]  WITH CHECK ADD  CONSTRAINT [CH_Edad_InformacionMedico] CHECK  (([Edad]<=(70)))
GO
ALTER TABLE [dbo].[Informacion_Medico] CHECK CONSTRAINT [CH_Edad_InformacionMedico]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [CH_Edad_Medico] CHECK  (([Edad]<=(70)))
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [CH_Edad_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [CH_Edad] CHECK  (([Edad]<=(115)))
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [CH_Edad]
GO
USE [master]
GO
ALTER DATABASE [Consultorio_Medico2] SET  READ_WRITE 
GO

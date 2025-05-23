USE [master]
GO
CREATE DATABASE [bd_jericoth_castellar_xyz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_jericoth_castellar_xyz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bd_jericoth_castellar_xyz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_jericoth_castellar_xyz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bd_jericoth_castellar_xyz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_jericoth_castellar_xyz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET RECOVERY FULL 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET  MULTI_USER 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bd_jericoth_castellar_xyz', N'ON'
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET QUERY_STORE = ON
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bd_jericoth_castellar_xyz]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[ID_cliente] [int] IDENTITY(1,1) NOT NULL,
	[Extras_seleccionados] [int] NULL,
	[Precio_Individual] [decimal](10, 2) NOT NULL,
	[Fecha_De_Entrega] [date] NULL,
	[Matricula] [varchar](20) NOT NULL,
	[Stock] [int] NULL,
	[Metodo_de_pago] [varchar](50) NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](max) NOT NULL,
	[Tipo_de_Cliente] [varchar](50) NULL,
	[NIF] [varchar](100) NULL,
	[ID_vendedor] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONCESIONARIO](
	[ID_Concesionario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NULL,
	[direccion] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Concesionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXTRAS_OPCIONALES](
	[ID_Elemento] [int] IDENTITY(1,1) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Disponibles] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Stock] [int] NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Elemento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HISTORIAL_DE_VENTAS](
	[ID_Venta] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Rendimiento] [float] NOT NULL,
	[Satisfaccion_Del_cliente] [int] NOT NULL,
	[NIF] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVENTARIO](
	[Numero_de_Bastidor] [varchar](20) NOT NULL,
	[Direccion] [varchar](max) NOT NULL,
	[Disponibilidad] [bit] NOT NULL,
	[NIF] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero_de_Bastidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVICIO_OFICIAL](
	[NIF] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NULL,
	[direccion] [varchar](max) NULL,
	[precio_de_venta] [int] NULL,
	[ID_concesionario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VEHICULOS](
	[Modelo] [varchar](100) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Descuentos] [decimal](10, 2) NULL,
	[Potencia_Fiscal] [int] NOT NULL,
	[Cilindrado] [int] NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[Tamaño] [varchar](50) NOT NULL,
	[Capacidad] [int] NOT NULL,
	[Combustible] [varchar](20) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Numero_de_bastidor] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENDEDORES](
	[NIF] [varchar](100) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](max) NOT NULL,
	[ID_transaccion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA_Y_TRANSACCION](
	[ID_transaccion] [int] IDENTITY(1,1) NOT NULL,
	[Motivo_de_Compra] [varchar](max) NULL,
	[Matricula] [varchar](20) NOT NULL,
	[Garantia] [int] NULL,
	[Fecha_y_hora] [datetime] NOT NULL,
	[Origen] [varchar](100) NULL,
	[NIF] [varchar](100) NOT NULL,
	[ID_cliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTES] ON 

INSERT [dbo].[CLIENTES] ([ID_cliente], [Extras_seleccionados], [Precio_Individual], [Fecha_De_Entrega], [Matricula], [Stock], [Metodo_de_pago], [Nombre], [Direccion], [Tipo_de_Cliente], [NIF], [ID_vendedor]) VALUES (2, 5, CAST(15000.00 AS Decimal(10, 2)), CAST(N'2025-05-15' AS Date), N'ACC143', 1, N'Tarjeta de Crédito', N'Laura', N'Calle1223', N'Estandar', N'1', NULL)
INSERT [dbo].[CLIENTES] ([ID_cliente], [Extras_seleccionados], [Precio_Individual], [Fecha_De_Entrega], [Matricula], [Stock], [Metodo_de_pago], [Nombre], [Direccion], [Tipo_de_Cliente], [NIF], [ID_vendedor]) VALUES (3, 3, CAST(16000.00 AS Decimal(10, 2)), CAST(N'2025-05-15' AS Date), N'ABBC123', 5, N'Tarjeta de Debito', N'Jesus', N'Calle11223', N'Empresa', N'2', NULL)
INSERT [dbo].[CLIENTES] ([ID_cliente], [Extras_seleccionados], [Precio_Individual], [Fecha_De_Entrega], [Matricula], [Stock], [Metodo_de_pago], [Nombre], [Direccion], [Tipo_de_Cliente], [NIF], [ID_vendedor]) VALUES (4, 9, CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-05-15' AS Date), N'AAC123', 3, N'Prestamo', N'Franky', N'Calle11223', N'Estandar', N'3', NULL)
INSERT [dbo].[CLIENTES] ([ID_cliente], [Extras_seleccionados], [Precio_Individual], [Fecha_De_Entrega], [Matricula], [Stock], [Metodo_de_pago], [Nombre], [Direccion], [Tipo_de_Cliente], [NIF], [ID_vendedor]) VALUES (5, 2, CAST(65000.00 AS Decimal(10, 2)), CAST(N'2025-05-15' AS Date), N'ABCC123', 4, N'Tarjeta de Crédito', N'Leo', N'Callefc123', N'Empresa', N'4', NULL)
INSERT [dbo].[CLIENTES] ([ID_cliente], [Extras_seleccionados], [Precio_Individual], [Fecha_De_Entrega], [Matricula], [Stock], [Metodo_de_pago], [Nombre], [Direccion], [Tipo_de_Cliente], [NIF], [ID_vendedor]) VALUES (6, 6, CAST(25000.00 AS Decimal(10, 2)), CAST(N'2025-05-15' AS Date), N'AB1123', 2, N'Tarjeta de Crédito', N'Kita', N'Calle12123', N'Estandar', N'5', NULL)
SET IDENTITY_INSERT [dbo].[CLIENTES] OFF
GO
SET IDENTITY_INSERT [dbo].[CONCESIONARIO] ON 

INSERT [dbo].[CONCESIONARIO] ([ID_Concesionario], [nombre], [direccion]) VALUES (1, N'Juan', N'Calle1')
INSERT [dbo].[CONCESIONARIO] ([ID_Concesionario], [nombre], [direccion]) VALUES (2, N'Peña', N'Calle2')
INSERT [dbo].[CONCESIONARIO] ([ID_Concesionario], [nombre], [direccion]) VALUES (3, N'Laura', N'Calleromanticismo')
INSERT [dbo].[CONCESIONARIO] ([ID_Concesionario], [nombre], [direccion]) VALUES (4, N'Jesulini', N'Callecacho')
INSERT [dbo].[CONCESIONARIO] ([ID_Concesionario], [nombre], [direccion]) VALUES (5, N'Mauricio', N'CalleLoco')
SET IDENTITY_INSERT [dbo].[CONCESIONARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[EXTRAS_OPCIONALES] ON 

INSERT [dbo].[EXTRAS_OPCIONALES] ([ID_Elemento], [Precio], [Disponibles], [Nombre], [Stock], [Modelo]) VALUES (1, CAST(100.00 AS Decimal(10, 2)), 5, N'Aire', 10, N'KIA')
INSERT [dbo].[EXTRAS_OPCIONALES] ([ID_Elemento], [Precio], [Disponibles], [Nombre], [Stock], [Modelo]) VALUES (2, CAST(200.00 AS Decimal(10, 2)), 5, N'Motor', 10, N'CHEVROLET')
INSERT [dbo].[EXTRAS_OPCIONALES] ([ID_Elemento], [Precio], [Disponibles], [Nombre], [Stock], [Modelo]) VALUES (3, CAST(300.00 AS Decimal(10, 2)), 5, N'Nitr', 10, N'NISSAN')
INSERT [dbo].[EXTRAS_OPCIONALES] ([ID_Elemento], [Precio], [Disponibles], [Nombre], [Stock], [Modelo]) VALUES (4, CAST(400.00 AS Decimal(10, 2)), 5, N'Aire', 10, N'HYUNDAI')
INSERT [dbo].[EXTRAS_OPCIONALES] ([ID_Elemento], [Precio], [Disponibles], [Nombre], [Stock], [Modelo]) VALUES (5, CAST(500.00 AS Decimal(10, 2)), 5, N'Cilindro Extra', 10, N'SUBARU')
SET IDENTITY_INSERT [dbo].[EXTRAS_OPCIONALES] OFF
GO
SET IDENTITY_INSERT [dbo].[HISTORIAL_DE_VENTAS] ON 

INSERT [dbo].[HISTORIAL_DE_VENTAS] ([ID_Venta], [Fecha], [Rendimiento], [Satisfaccion_Del_cliente], [NIF]) VALUES (2, CAST(N'2025-04-04' AS Date), 81.7, 6, N'1')
INSERT [dbo].[HISTORIAL_DE_VENTAS] ([ID_Venta], [Fecha], [Rendimiento], [Satisfaccion_Del_cliente], [NIF]) VALUES (3, CAST(N'2025-04-04' AS Date), 55.7, 6, N'2')
INSERT [dbo].[HISTORIAL_DE_VENTAS] ([ID_Venta], [Fecha], [Rendimiento], [Satisfaccion_Del_cliente], [NIF]) VALUES (4, CAST(N'2025-04-04' AS Date), 35.7, 5, N'3')
INSERT [dbo].[HISTORIAL_DE_VENTAS] ([ID_Venta], [Fecha], [Rendimiento], [Satisfaccion_Del_cliente], [NIF]) VALUES (5, CAST(N'2025-04-04' AS Date), 15.7, 3, N'4')
INSERT [dbo].[HISTORIAL_DE_VENTAS] ([ID_Venta], [Fecha], [Rendimiento], [Satisfaccion_Del_cliente], [NIF]) VALUES (6, CAST(N'2025-04-04' AS Date), 85.7, 1, N'5')
SET IDENTITY_INSERT [dbo].[HISTORIAL_DE_VENTAS] OFF
GO
INSERT [dbo].[INVENTARIO] ([Numero_de_Bastidor], [Direccion], [Disponibilidad], [NIF]) VALUES (N'2', N'Calle1', 1, N'1')
INSERT [dbo].[INVENTARIO] ([Numero_de_Bastidor], [Direccion], [Disponibilidad], [NIF]) VALUES (N'3', N'Calle2', 0, N'2')
INSERT [dbo].[INVENTARIO] ([Numero_de_Bastidor], [Direccion], [Disponibilidad], [NIF]) VALUES (N'4', N'Calle3', 1, N'3')
INSERT [dbo].[INVENTARIO] ([Numero_de_Bastidor], [Direccion], [Disponibilidad], [NIF]) VALUES (N'5', N'Calle4', 1, N'4')
INSERT [dbo].[INVENTARIO] ([Numero_de_Bastidor], [Direccion], [Disponibilidad], [NIF]) VALUES (N'6', N'Calle5', 1, N'5')
GO
INSERT [dbo].[SERVICIO_OFICIAL] ([NIF], [nombre], [direccion], [precio_de_venta], [ID_concesionario]) VALUES (N'1', N'Juan', N'Calle1', 100, 1)
INSERT [dbo].[SERVICIO_OFICIAL] ([NIF], [nombre], [direccion], [precio_de_venta], [ID_concesionario]) VALUES (N'2', N'Peña', N'Calle2', 200, 2)
INSERT [dbo].[SERVICIO_OFICIAL] ([NIF], [nombre], [direccion], [precio_de_venta], [ID_concesionario]) VALUES (N'3', N'Laura', N'Calle3', 300, 3)
INSERT [dbo].[SERVICIO_OFICIAL] ([NIF], [nombre], [direccion], [precio_de_venta], [ID_concesionario]) VALUES (N'4', N'Jesulini', N'Calle4', 400, 4)
INSERT [dbo].[SERVICIO_OFICIAL] ([NIF], [nombre], [direccion], [precio_de_venta], [ID_concesionario]) VALUES (N'5', N'Mauricio', N'CalleLoco', 500, 5)
GO
INSERT [dbo].[VEHICULOS] ([Modelo], [Precio], [Descuentos], [Potencia_Fiscal], [Cilindrado], [Tipo], [Tamaño], [Capacidad], [Combustible], [Estado], [Numero_de_bastidor]) VALUES (N'CHEVROLET', CAST(2000.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), 300, 12, N'CARRO', N'Mediano', 4, N'Alto rendimiento', N'Buen estado', N'3')
INSERT [dbo].[VEHICULOS] ([Modelo], [Precio], [Descuentos], [Potencia_Fiscal], [Cilindrado], [Tipo], [Tamaño], [Capacidad], [Combustible], [Estado], [Numero_de_bastidor]) VALUES (N'HYUNDAI', CAST(4000.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), 300, 12, N'CAMION', N'Grande', 4, N'Alto rendimiento', N'Buen estado', N'5')
INSERT [dbo].[VEHICULOS] ([Modelo], [Precio], [Descuentos], [Potencia_Fiscal], [Cilindrado], [Tipo], [Tamaño], [Capacidad], [Combustible], [Estado], [Numero_de_bastidor]) VALUES (N'KIA', CAST(1000.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), 300, 12, N'CARRO', N'Pequeño', 6, N'Alto rendimiento', N'Estado Regular', N'2')
INSERT [dbo].[VEHICULOS] ([Modelo], [Precio], [Descuentos], [Potencia_Fiscal], [Cilindrado], [Tipo], [Tamaño], [Capacidad], [Combustible], [Estado], [Numero_de_bastidor]) VALUES (N'NISSAN', CAST(3000.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), 300, 12, N'CAMIONETA', N'Grande', 8, N'Alto rendimiento', N'Buen estado', N'4')
INSERT [dbo].[VEHICULOS] ([Modelo], [Precio], [Descuentos], [Potencia_Fiscal], [Cilindrado], [Tipo], [Tamaño], [Capacidad], [Combustible], [Estado], [Numero_de_bastidor]) VALUES (N'SUBARU', CAST(5000.00 AS Decimal(10, 2)), CAST(12.00 AS Decimal(10, 2)), 300, 12, N'MOTO', N'Grande', 2, N'Alto rendimiento', N'Buen estado', N'6')
GO
INSERT [dbo].[VENDEDORES] ([NIF], [Nombre], [Direccion], [ID_transaccion]) VALUES (N'1', N'Jesus', N'Calle2334', 1)
INSERT [dbo].[VENDEDORES] ([NIF], [Nombre], [Direccion], [ID_transaccion]) VALUES (N'2', N'Holiwis', N'Calle2234', 2)
INSERT [dbo].[VENDEDORES] ([NIF], [Nombre], [Direccion], [ID_transaccion]) VALUES (N'3', N'Vendedor1', N'Ca1lle234', 3)
INSERT [dbo].[VENDEDORES] ([NIF], [Nombre], [Direccion], [ID_transaccion]) VALUES (N'4', N'Otro', N'Calle234', 4)
INSERT [dbo].[VENDEDORES] ([NIF], [Nombre], [Direccion], [ID_transaccion]) VALUES (N'5', N'Marc', N'Calle2134', 5)
GO
SET IDENTITY_INSERT [dbo].[VENTA_Y_TRANSACCION] ON 

INSERT [dbo].[VENTA_Y_TRANSACCION] ([ID_transaccion], [Motivo_de_Compra], [Matricula], [Garantia], [Fecha_y_hora], [Origen], [NIF], [ID_cliente]) VALUES (1, N'Si', N'ABC123', 10, CAST(N'2025-04-04T10:30:00.000' AS DateTime), N'FABRICA', N'1', 1)
INSERT [dbo].[VENTA_Y_TRANSACCION] ([ID_transaccion], [Motivo_de_Compra], [Matricula], [Garantia], [Fecha_y_hora], [Origen], [NIF], [ID_cliente]) VALUES (2, N'Trabajo', N'ABC123', 10, CAST(N'2025-04-04T10:30:00.000' AS DateTime), N'EXTERNO', N'2', 2)
INSERT [dbo].[VENTA_Y_TRANSACCION] ([ID_transaccion], [Motivo_de_Compra], [Matricula], [Garantia], [Fecha_y_hora], [Origen], [NIF], [ID_cliente]) VALUES (3, N'Compra', N'ABC123', 10, CAST(N'2025-04-04T10:30:00.000' AS DateTime), N'VENDEDOR', N'3', 3)
INSERT [dbo].[VENTA_Y_TRANSACCION] ([ID_transaccion], [Motivo_de_Compra], [Matricula], [Garantia], [Fecha_y_hora], [Origen], [NIF], [ID_cliente]) VALUES (4, N'Trabajo', N'ABC123', 10, CAST(N'2025-04-04T10:30:00.000' AS DateTime), N'EXTERNO', N'4', 4)
INSERT [dbo].[VENTA_Y_TRANSACCION] ([ID_transaccion], [Motivo_de_Compra], [Matricula], [Garantia], [Fecha_y_hora], [Origen], [NIF], [ID_cliente]) VALUES (5, N'Compra', N'ABC123', 10, CAST(N'2025-04-04T10:30:00.000' AS DateTime), N'VENTA', N'5', 5)
SET IDENTITY_INSERT [dbo].[VENTA_Y_TRANSACCION] OFF
GO
ALTER TABLE [dbo].[VEHICULOS] ADD  DEFAULT ((0.00)) FOR [Descuentos]
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD FOREIGN KEY([ID_vendedor])
REFERENCES [dbo].[VENDEDORES] ([NIF])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD FOREIGN KEY([NIF])
REFERENCES [dbo].[SERVICIO_OFICIAL] ([NIF])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[EXTRAS_OPCIONALES]  WITH CHECK ADD FOREIGN KEY([Modelo])
REFERENCES [dbo].[VEHICULOS] ([Modelo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HISTORIAL_DE_VENTAS]  WITH CHECK ADD FOREIGN KEY([NIF])
REFERENCES [dbo].[VENDEDORES] ([NIF])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[INVENTARIO]  WITH CHECK ADD FOREIGN KEY([NIF])
REFERENCES [dbo].[SERVICIO_OFICIAL] ([NIF])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[SERVICIO_OFICIAL]  WITH CHECK ADD FOREIGN KEY([ID_concesionario])
REFERENCES [dbo].[CONCESIONARIO] ([ID_Concesionario])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VEHICULOS]  WITH CHECK ADD FOREIGN KEY([Numero_de_bastidor])
REFERENCES [dbo].[INVENTARIO] ([Numero_de_Bastidor])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VENDEDORES]  WITH CHECK ADD FOREIGN KEY([ID_transaccion])
REFERENCES [dbo].[VENTA_Y_TRANSACCION] ([ID_transaccion])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[VENTA_Y_TRANSACCION]  WITH CHECK ADD FOREIGN KEY([NIF])
REFERENCES [dbo].[SERVICIO_OFICIAL] ([NIF])
GO
USE [master]
GO
ALTER DATABASE [bd_jericoth_castellar_xyz] SET  READ_WRITE 
GO

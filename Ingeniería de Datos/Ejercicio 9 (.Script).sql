USE [AlmacenDB]
GO
/****** Object:  Table [dbo].[ALMACENES]    Script Date: 04/29/2015 22:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ALMACENES](
	[Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Lugar] [varchar](100) NULL,
	[Capacidad] [int] NULL,
 CONSTRAINT [PK_ALMACENES] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ALMACENES] ON
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (1, N'Lima', 2000)
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (2, N'Arequipa', 250)
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (3, N'Chiclayo', 123)
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (4, N'Amazonas', 800)
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (5, N'Callao', 1229)
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (6, N'Iquitos', 22)
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (7, N'Piura', 12)
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (8, N'Cajamarca', 134)
INSERT [dbo].[ALMACENES] ([Codigo], [Lugar], [Capacidad]) VALUES (9, N'Trujillo', 124)
SET IDENTITY_INSERT [dbo].[ALMACENES] OFF
/****** Object:  Table [dbo].[CAJAS]    Script Date: 04/29/2015 22:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAJAS](
	[NumReferencia] [char](5) NOT NULL,
	[Contenido] [varchar](100) NULL,
	[Valor] [int] NULL,
	[Almacen] [int] NULL,
 CONSTRAINT [PK_CAJAS] PRIMARY KEY CLUSTERED 
(
	[NumReferencia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00010', N'Lapiz', 300, 1)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00012', N'cuaderno', 600, 1)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00013', N'ventilador', 1234, 2)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00014', N'tablet', 30000, 8)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00015', N'papel', 2890, 2)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00017', N'boligrafo', 123, 4)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00023', N'televisor', 55000, 5)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00083', N'camara digital', 23000, 1)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00234', N'panel solar', 123004, NULL)
INSERT [dbo].[CAJAS] ([NumReferencia], [Contenido], [Valor], [Almacen]) VALUES (N'00991', N'taladro', 2345, 9)
/****** Object:  ForeignKey [FK_CAJAS_ALMACENES]    Script Date: 04/29/2015 22:11:50 ******/
ALTER TABLE [dbo].[CAJAS]  WITH CHECK ADD  CONSTRAINT [FK_CAJAS_ALMACENES] FOREIGN KEY([Almacen])
REFERENCES [dbo].[ALMACENES] ([Codigo])
GO
ALTER TABLE [dbo].[CAJAS] CHECK CONSTRAINT [FK_CAJAS_ALMACENES]
GO

USE [TehnickiPregled]
GO
/****** Object:  Table [dbo].[Automobil]    Script Date: 12/8/2022 4:22:54 PM ******/
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
/****** Object:  Table [dbo].[Kontrolor]    Script Date: 12/8/2022 4:22:54 PM ******/
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
/****** Object:  Table [dbo].[TehnickiPregled]    Script Date: 12/8/2022 4:22:54 PM ******/
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
/****** Object:  Table [dbo].[Vlasnik]    Script Date: 12/8/2022 4:22:54 PM ******/
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
SET IDENTITY_INSERT [dbo].[Automobil] ON 

INSERT [dbo].[Automobil] ([AutomobilID], [Marka], [Model], [BrSasije], [BrMotora], [GodProizvodnje], [VlasnikID]) VALUES (1, N'Fiat', N'Punto', N'36SD52GF54', N'651-dfs25', 1998, 1)
SET IDENTITY_INSERT [dbo].[Automobil] OFF
GO
SET IDENTITY_INSERT [dbo].[Kontrolor] ON 

INSERT [dbo].[Kontrolor] ([KontrolorID], [Ime], [Prezime], [Email], [DatumZaposlenja]) VALUES (1, N'Mihajlo', N'Ruzicic', N'micko@gmail.com', CAST(N'2022-08-25' AS Date))
SET IDENTITY_INSERT [dbo].[Kontrolor] OFF
GO
SET IDENTITY_INSERT [dbo].[TehnickiPregled] ON 

INSERT [dbo].[TehnickiPregled] ([TehnickiPregledID], [AutomobilID], [KontrolorID], [DatumPregleda], [Cena], [Prosao]) VALUES (2, 1, 1, CAST(N'2022-10-31' AS Date), 2000.0000, 1)
SET IDENTITY_INSERT [dbo].[TehnickiPregled] OFF
GO
SET IDENTITY_INSERT [dbo].[Vlasnik] ON 

INSERT [dbo].[Vlasnik] ([VlasnikID], [Ime], [Prezime], [BrTelefona], [Email]) VALUES (1, N'Nadja', N'Jovovic', N'062555555', N'nadja@gmail.com')
SET IDENTITY_INSERT [dbo].[Vlasnik] OFF
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

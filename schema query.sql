USE [mondial]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[IATACode] [varchar](3) NOT NULL,
	[Name] [varchar](100) NULL,
	[Country] [varchar](4) NULL,
	[City] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[Island] [varchar](50) NULL,
	[AirpLat] [decimal](9, 6) NULL,
	[AirLong] [decimal](9, 6) NULL,
	[Elevation] [float] NULL,
	[gmtOffset] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IATACode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[borders]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[borders](
	[Country1] [varchar](4) NOT NULL,
	[Country2] [varchar](4) NOT NULL,
	[Length] [float] NULL,
 CONSTRAINT [BorderKey] PRIMARY KEY CLUSTERED 
(
	[Country1] ASC,
	[Country2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Name] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
	[Population] [float] NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Elevation] [float] NULL,
 CONSTRAINT [CityKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Country] ASC,
	[Province] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citylocalname]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citylocalname](
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
	[localname] [varchar](300) NULL,
 CONSTRAINT [CitylocalnameKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Province] ASC,
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cityothername]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cityothername](
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
	[othername] [varchar](50) NOT NULL,
 CONSTRAINT [CityOthernameKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Province] ASC,
	[City] ASC,
	[othername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Citypops]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citypops](
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
	[Year] [float] NOT NULL,
	[Population] [float] NULL,
 CONSTRAINT [CityPopKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Province] ASC,
	[City] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Continent]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[Name] [varchar](20) NOT NULL,
	[Area] [bigint] NULL,
 CONSTRAINT [ContinentKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Name] [varchar](50) NOT NULL,
	[Code] [varchar](4) NOT NULL,
	[Capital] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[Area] [float] NULL,
	[Population] [float] NULL,
 CONSTRAINT [CountryKey] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countrylocalname]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countrylocalname](
	[Country] [varchar](4) NOT NULL,
	[localname] [varchar](300) NULL,
 CONSTRAINT [CountrylocalnameKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countryothername]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countryothername](
	[Country] [varchar](4) NOT NULL,
	[othername] [varchar](50) NOT NULL,
 CONSTRAINT [CountryOthernameKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[othername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countrypops]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countrypops](
	[Country] [varchar](4) NOT NULL,
	[Year] [float] NOT NULL,
	[Population] [float] NULL,
 CONSTRAINT [CountryPopsKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desert]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desert](
	[Name] [varchar](50) NOT NULL,
	[Area] [float] NULL,
	[DesLat] [decimal](9, 6) NULL,
	[DesLong] [decimal](9, 6) NULL,
 CONSTRAINT [DesertKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Economy]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Economy](
	[Country] [varchar](4) NOT NULL,
	[GDP] [float] NULL,
	[Agriculture] [float] NULL,
	[Service] [float] NULL,
	[Industry] [float] NULL,
	[Inflation] [float] NULL,
	[Unemployment] [float] NULL,
 CONSTRAINT [EconomyKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[encompasses]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[encompasses](
	[Country] [varchar](4) NOT NULL,
	[Continent] [varchar](20) NOT NULL,
	[Percentage] [float] NULL,
 CONSTRAINT [EncompassesKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Continent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EthnicGroup]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EthnicGroup](
	[Country] [varchar](4) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Percentage] [float] NULL,
 CONSTRAINT [EthnicKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_Desert]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_Desert](
	[Desert] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
 CONSTRAINT [GDesertKey] PRIMARY KEY CLUSTERED 
(
	[Province] ASC,
	[Country] ASC,
	[Desert] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_Estuary]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_Estuary](
	[River] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
 CONSTRAINT [GEstuaryKey] PRIMARY KEY CLUSTERED 
(
	[Province] ASC,
	[Country] ASC,
	[River] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_Island]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_Island](
	[Island] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
 CONSTRAINT [GIslandKey] PRIMARY KEY CLUSTERED 
(
	[Province] ASC,
	[Country] ASC,
	[Island] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_Lake]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_Lake](
	[Lake] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
 CONSTRAINT [GLakeKey] PRIMARY KEY CLUSTERED 
(
	[Province] ASC,
	[Country] ASC,
	[Lake] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_Mountain]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_Mountain](
	[Mountain] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
 CONSTRAINT [GMountainKey] PRIMARY KEY CLUSTERED 
(
	[Province] ASC,
	[Country] ASC,
	[Mountain] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_River]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_River](
	[River] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
 CONSTRAINT [GRiverKey] PRIMARY KEY CLUSTERED 
(
	[Province] ASC,
	[Country] ASC,
	[River] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_Sea]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_Sea](
	[Sea] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
 CONSTRAINT [GSeaKey] PRIMARY KEY CLUSTERED 
(
	[Province] ASC,
	[Country] ASC,
	[Sea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[geo_Source]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[geo_Source](
	[River] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Province] [varchar](50) NOT NULL,
 CONSTRAINT [GSourceKey] PRIMARY KEY CLUSTERED 
(
	[Province] ASC,
	[Country] ASC,
	[River] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Island]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Island](
	[Name] [varchar](50) NOT NULL,
	[Islands] [varchar](50) NULL,
	[Area] [float] NULL,
	[Elevation] [float] NULL,
	[Type] [varchar](15) NULL,
	[IslandLat] [decimal](9, 6) NULL,
	[IslandLong] [decimal](9, 6) NULL,
 CONSTRAINT [IslandKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[islandIn]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[islandIn](
	[Island] [varchar](50) NULL,
	[Sea] [varchar](50) NULL,
	[Lake] [varchar](50) NULL,
	[River] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[isMember]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[isMember](
	[Country] [varchar](4) NOT NULL,
	[Organization] [varchar](12) NOT NULL,
	[Type] [varchar](60) NULL,
 CONSTRAINT [MemberKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Organization] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lake]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lake](
	[Name] [varchar](50) NOT NULL,
	[River] [varchar](50) NULL,
	[Area] [float] NULL,
	[Elevation] [float] NULL,
	[Depth] [float] NULL,
	[Height] [float] NULL,
	[Type] [varchar](12) NULL,
	[LakeLatitude] [decimal](9, 6) NULL,
	[LakeLongitude] [decimal](9, 6) NULL,
 CONSTRAINT [LakeKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LakeOnIsland]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LakeOnIsland](
	[Lake] [varchar](50) NOT NULL,
	[Island] [varchar](50) NOT NULL,
 CONSTRAINT [LakeIslKey] PRIMARY KEY CLUSTERED 
(
	[Lake] ASC,
	[Island] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[Country] [varchar](50) NULL,
	[Name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[located]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[located](
	[City] [varchar](50) NULL,
	[Province] [varchar](50) NULL,
	[Country] [varchar](4) NULL,
	[River] [varchar](50) NULL,
	[Lake] [varchar](50) NULL,
	[Sea] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locatedOn]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locatedOn](
	[City] [varchar](50) NOT NULL,
	[Province] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Island] [varchar](50) NOT NULL,
 CONSTRAINT [locatedOnKey] PRIMARY KEY CLUSTERED 
(
	[City] ASC,
	[Province] ASC,
	[Country] ASC,
	[Island] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mergesWith]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mergesWith](
	[Sea1] [varchar](50) NOT NULL,
	[Sea2] [varchar](50) NOT NULL,
 CONSTRAINT [MergesWithKey] PRIMARY KEY CLUSTERED 
(
	[Sea1] ASC,
	[Sea2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mountain]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mountain](
	[Name] [varchar](50) NOT NULL,
	[Mountains] [varchar](50) NULL,
	[Elevation] [float] NULL,
	[Type] [varchar](10) NULL,
	[Mountlatitude] [decimal](9, 6) NULL,
	[Mountlongitude] [decimal](9, 6) NULL,
 CONSTRAINT [MountainKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MountainOnIsland]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MountainOnIsland](
	[Mountain] [varchar](50) NOT NULL,
	[Island] [varchar](50) NOT NULL,
 CONSTRAINT [MountainIslKey] PRIMARY KEY CLUSTERED 
(
	[Mountain] ASC,
	[Island] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[Abbreviation] [varchar](12) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](4) NULL,
	[Province] [varchar](50) NULL,
	[Established] [datetime] NULL,
 CONSTRAINT [OrgKey] PRIMARY KEY CLUSTERED 
(
	[Abbreviation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [OrgNameUnique] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Politics]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Politics](
	[Country] [varchar](4) NOT NULL,
	[Independence] [datetime] NULL,
	[WasDependent] [varchar](50) NULL,
	[Dependent] [varchar](4) NULL,
	[Government] [varchar](120) NULL,
 CONSTRAINT [PoliticsKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Population]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Population](
	[Country] [varchar](4) NOT NULL,
	[Population_Growth] [float] NULL,
	[Infant_Mortality] [float] NULL,
 CONSTRAINT [PopKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[Name] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Population] [float] NULL,
	[Area] [float] NULL,
	[Capital] [varchar](50) NULL,
	[CapProv] [varchar](50) NULL,
 CONSTRAINT [PrKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincelocalname]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincelocalname](
	[Province] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[localname] [varchar](300) NULL,
 CONSTRAINT [ProvlocalnameKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Province] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provinceothername]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provinceothername](
	[Province] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[othername] [varchar](50) NOT NULL,
 CONSTRAINT [ProvOthernameKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Province] ASC,
	[othername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provpops]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provpops](
	[Province] [varchar](50) NOT NULL,
	[Country] [varchar](4) NOT NULL,
	[Year] [float] NOT NULL,
	[Population] [float] NULL,
 CONSTRAINT [ProvPopKey] PRIMARY KEY CLUSTERED 
(
	[Country] ASC,
	[Province] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Religion]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Religion](
	[Country] [varchar](4) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Percentage] [float] NULL,
 CONSTRAINT [ReligionKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[River]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[River](
	[Name] [varchar](50) NOT NULL,
	[River] [varchar](50) NULL,
	[Lake] [varchar](50) NULL,
	[Sea] [varchar](50) NULL,
	[Length] [float] NULL,
	[Area] [float] NULL,
	[SourceLatitude] [decimal](9, 6) NULL,
	[SourceLongitude] [decimal](9, 6) NULL,
	[Mountains] [varchar](50) NULL,
	[SourceElevation] [float] NULL,
	[EstLat] [decimal](9, 6) NULL,
	[EstLong] [decimal](9, 6) NULL,
	[EstuaryElevation] [float] NULL,
 CONSTRAINT [RiverKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RiverOnIsland]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RiverOnIsland](
	[River] [varchar](50) NOT NULL,
	[Island] [varchar](50) NOT NULL,
 CONSTRAINT [RiverIslKey] PRIMARY KEY CLUSTERED 
(
	[River] ASC,
	[Island] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RiverThrough]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RiverThrough](
	[River] [varchar](50) NOT NULL,
	[Lake] [varchar](50) NOT NULL,
 CONSTRAINT [RThroughKey] PRIMARY KEY CLUSTERED 
(
	[River] ASC,
	[Lake] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sea]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sea](
	[Name] [varchar](50) NOT NULL,
	[Area] [float] NULL,
	[Depth] [float] NULL,
 CONSTRAINT [SeaKey] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[spoken]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[spoken](
	[Country] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[percentage] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sublanguage]    Script Date: 9/30/2023 11:52:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sublanguage](
	[Sublang] [varchar](50) NOT NULL,
	[Suplang] [varchar](50) NULL,
 CONSTRAINT [SubLanguageKey] PRIMARY KEY CLUSTERED 
(
	[Sublang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[isMember] ADD  DEFAULT ('member') FOR [Type]
GO
ALTER TABLE [dbo].[borders]  WITH CHECK ADD CHECK  (([Length]>(0)))
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [CityLat] CHECK  (([Latitude]>=(-90) AND [Latitude]<=(90)))
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [CityLat]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [CityLon] CHECK  (([Longitude]>=(-180) AND [Longitude]<=(180)))
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [CityLon]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [CityPop] CHECK  (([Population]>=(0)))
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [CityPop]
GO
ALTER TABLE [dbo].[Citypops]  WITH CHECK ADD  CONSTRAINT [CityPopsPop] CHECK  (([Population]>=(0)))
GO
ALTER TABLE [dbo].[Citypops] CHECK CONSTRAINT [CityPopsPop]
GO
ALTER TABLE [dbo].[Citypops]  WITH CHECK ADD  CONSTRAINT [CityPopsYear] CHECK  (([Year]>=(0)))
GO
ALTER TABLE [dbo].[Citypops] CHECK CONSTRAINT [CityPopsYear]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [CountryArea] CHECK  (([Area]>=(0)))
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [CountryArea]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [CountryPop] CHECK  (([Population]>=(0)))
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [CountryPop]
GO
ALTER TABLE [dbo].[Countrypops]  WITH CHECK ADD  CONSTRAINT [CountryPopsPop] CHECK  (([Population]>=(0)))
GO
ALTER TABLE [dbo].[Countrypops] CHECK CONSTRAINT [CountryPopsPop]
GO
ALTER TABLE [dbo].[Countrypops]  WITH CHECK ADD  CONSTRAINT [CountryPopsYear] CHECK  (([Year]>=(0)))
GO
ALTER TABLE [dbo].[Countrypops] CHECK CONSTRAINT [CountryPopsYear]
GO
ALTER TABLE [dbo].[Economy]  WITH CHECK ADD  CONSTRAINT [EconomyGDP] CHECK  (([GDP]>=(0)))
GO
ALTER TABLE [dbo].[Economy] CHECK CONSTRAINT [EconomyGDP]
GO
ALTER TABLE [dbo].[encompasses]  WITH CHECK ADD CHECK  (([Percentage]>(0) AND [Percentage]<=(100)))
GO
ALTER TABLE [dbo].[EthnicGroup]  WITH CHECK ADD  CONSTRAINT [EthnicPercent] CHECK  (([Percentage]>(0) AND [Percentage]<=(100)))
GO
ALTER TABLE [dbo].[EthnicGroup] CHECK CONSTRAINT [EthnicPercent]
GO
ALTER TABLE [dbo].[Island]  WITH CHECK ADD  CONSTRAINT [IslandAr] CHECK  (([Area]>=(0)))
GO
ALTER TABLE [dbo].[Island] CHECK CONSTRAINT [IslandAr]
GO
ALTER TABLE [dbo].[Lake]  WITH CHECK ADD  CONSTRAINT [DamHeight] CHECK  (([Height]>(0)))
GO
ALTER TABLE [dbo].[Lake] CHECK CONSTRAINT [DamHeight]
GO
ALTER TABLE [dbo].[Lake]  WITH CHECK ADD  CONSTRAINT [LakeAr] CHECK  (([Area]>=(0)))
GO
ALTER TABLE [dbo].[Lake] CHECK CONSTRAINT [LakeAr]
GO
ALTER TABLE [dbo].[Lake]  WITH CHECK ADD  CONSTRAINT [LakeDpth] CHECK  (([Depth]>=(0)))
GO
ALTER TABLE [dbo].[Lake] CHECK CONSTRAINT [LakeDpth]
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD  CONSTRAINT [PrAr] CHECK  (([Area]>=(0)))
GO
ALTER TABLE [dbo].[Province] CHECK CONSTRAINT [PrAr]
GO
ALTER TABLE [dbo].[Province]  WITH CHECK ADD  CONSTRAINT [PrPop] CHECK  (([Population]>=(0)))
GO
ALTER TABLE [dbo].[Province] CHECK CONSTRAINT [PrPop]
GO
ALTER TABLE [dbo].[Provpops]  WITH CHECK ADD  CONSTRAINT [ProvPopsPop] CHECK  (([Population]>=(0)))
GO
ALTER TABLE [dbo].[Provpops] CHECK CONSTRAINT [ProvPopsPop]
GO
ALTER TABLE [dbo].[Provpops]  WITH CHECK ADD  CONSTRAINT [ProvPopsYear] CHECK  (([Year]>=(0)))
GO
ALTER TABLE [dbo].[Provpops] CHECK CONSTRAINT [ProvPopsYear]
GO
ALTER TABLE [dbo].[Religion]  WITH CHECK ADD  CONSTRAINT [ReligionPercent] CHECK  (([Percentage]>(0) AND [Percentage]<=(100)))
GO
ALTER TABLE [dbo].[Religion] CHECK CONSTRAINT [ReligionPercent]
GO
ALTER TABLE [dbo].[River]  WITH CHECK ADD  CONSTRAINT [RiverArea] CHECK  (([Area]>=(0)))
GO
ALTER TABLE [dbo].[River] CHECK CONSTRAINT [RiverArea]
GO
ALTER TABLE [dbo].[River]  WITH CHECK ADD  CONSTRAINT [RiverLength] CHECK  (([Length]>=(0)))
GO
ALTER TABLE [dbo].[River] CHECK CONSTRAINT [RiverLength]
GO
ALTER TABLE [dbo].[River]  WITH CHECK ADD  CONSTRAINT [RivFlowsInto] CHECK  (([River] IS NULL AND [Lake] IS NULL OR [River] IS NULL AND [Sea] IS NULL OR [Lake] IS NULL AND [Sea] IS NULL))
GO
ALTER TABLE [dbo].[River] CHECK CONSTRAINT [RivFlowsInto]
GO
ALTER TABLE [dbo].[Sea]  WITH CHECK ADD  CONSTRAINT [SeaAr] CHECK  (([Area]>=(0)))
GO
ALTER TABLE [dbo].[Sea] CHECK CONSTRAINT [SeaAr]
GO
ALTER TABLE [dbo].[Sea]  WITH CHECK ADD  CONSTRAINT [SeaDepth] CHECK  (([Depth]>=(0)))
GO
ALTER TABLE [dbo].[Sea] CHECK CONSTRAINT [SeaDepth]
GO

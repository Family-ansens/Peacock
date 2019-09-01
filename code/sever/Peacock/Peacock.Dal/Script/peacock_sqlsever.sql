USE [master]
GO
/****** Object:  Database [antmgr]    Script Date: 2019/9/1 18:04:09 ******/
CREATE DATABASE [antmgr]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'antmgr', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\antmgr.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'antmgr_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\antmgr_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [antmgr] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [antmgr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [antmgr] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [antmgr] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [antmgr] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [antmgr] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [antmgr] SET ARITHABORT OFF 
GO
ALTER DATABASE [antmgr] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [antmgr] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [antmgr] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [antmgr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [antmgr] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [antmgr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [antmgr] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [antmgr] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [antmgr] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [antmgr] SET  DISABLE_BROKER 
GO
ALTER DATABASE [antmgr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [antmgr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [antmgr] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [antmgr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [antmgr] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [antmgr] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [antmgr] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [antmgr] SET RECOVERY FULL 
GO
ALTER DATABASE [antmgr] SET  MULTI_USER 
GO
ALTER DATABASE [antmgr] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [antmgr] SET DB_CHAINING OFF 
GO
ALTER DATABASE [antmgr] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [antmgr] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'antmgr', N'ON'
GO
USE [antmgr]
GO
/****** Object:  Table [dbo].[T_Advertise]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Advertise](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ImgUrl] [nvarchar](200) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Advertise] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Announcement]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Announcement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Content] [text] NULL,
	[TitleLanguageId] [int] NULL,
	[ContentLanguageId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Announcement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Company]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[TitleLanguageId] [int] NULL,
	[IntroductionLanguageId] [int] NULL,
	[Content] [text] NULL,
	[ContentLanguageId] [int] NULL,
	[ImgPath] [nvarchar](500) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Evaluation]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Evaluation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Tel] [nvarchar](20) NULL,
	[Content] [text] NULL,
	[Email] [nvarchar](100) NULL,
	[OtherContact] [nvarchar](500) NOT NULL,
	[IpAddress] [nvarchar](50) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Evaluation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_New]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_New](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Content] [text] NULL,
	[IntroductionLanguageId] [int] NULL,
	[TitleLanguageId] [int] NULL,
	[ContentLanguageId] [int] NULL,
	[ImgUrl] [nvarchar](500) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsPublish] [bit] NOT NULL,
	[PublishTime] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pro_Example]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pro_Example](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [text] NULL,
	[OrderId] [int] NOT NULL,
	[NameLanguageId] [int] NULL,
	[IntroductionLanguageId] [int] NULL,
	[DescriptionLanguageId] [int] NULL,
	[ImgPath] [nvarchar](2000) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pro_Example] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pro_ExampleGroup]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pro_ExampleGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[OrderId] [int] NOT NULL,
	[LanguageId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pro_ExampleGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pro_ExampleImg]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pro_ExampleImg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExampleId] [int] NOT NULL,
	[OrderId] [int] NULL,
	[ImgUrl] [nvarchar](500) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pro_ExampleImg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pro_ExampleProductRelation]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pro_ExampleProductRelation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ExampleId] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pro_ExampleProductRelation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pro_HotSaleProduct]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pro_HotSaleProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pro_HotSaleProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pro_Product]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pro_Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [text] NULL,
	[OrderId] [int] NOT NULL,
	[NameLanguageId] [int] NULL,
	[IntroductionLanguageId] [int] NULL,
	[DescriptionLanguageId] [int] NULL,
	[ImgPath] [nvarchar](2000) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pro_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pro_ProductGroup]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pro_ProductGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[OrderId] [int] NOT NULL,
	[LanguageId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pro_ProductGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Pro_ProductImg]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pro_ProductImg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NULL,
	[ImgUrl] [nvarchar](500) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pro_ProductImg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_System_LanguageContent]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_System_LanguageContent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RelationId] [int] NOT NULL,
	[LanguageType] [varchar](50) NOT NULL,
	[DisplayContent] [text] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_System_LanguageContent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_System_LanguageRelation]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_System_LanguageRelation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_System_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_System_Menu]    Script Date: 2019/9/1 18:04:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_System_Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Url] [varchar](100) NOT NULL,
	[Seq] [int] NOT NULL,
	[LanguageRelationId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_System_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Advertise] ON 

INSERT [dbo].[T_Advertise] ([ID], [OrderId], [ImgUrl], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, 2, N'http://www.puwiremesh.com:2000/file/img/201991-9b449351f633495397ac5e4edd11d380.jpg', 0, N'', CAST(N'2019-09-01T09:28:06.173' AS DateTime), N'', CAST(N'2019-09-01T09:28:12.977' AS DateTime))
INSERT [dbo].[T_Advertise] ([ID], [OrderId], [ImgUrl], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, 1, N'http://www.puwiremesh.com:2000/file/img/201991-11163132c70a4dac8df19c5cbc94c0be.jpg', 0, N'', CAST(N'2019-09-01T09:28:28.983' AS DateTime), N'', CAST(N'2019-09-01T09:28:28.983' AS DateTime))
INSERT [dbo].[T_Advertise] ([ID], [OrderId], [ImgUrl], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, 4, N'http://www.puwiremesh.com:2000/file/img/201991-0584a29167f84a82959828aab63a866b.jpg', 0, N'', CAST(N'2019-09-01T09:28:49.003' AS DateTime), N'', CAST(N'2019-09-01T09:28:49.003' AS DateTime))
INSERT [dbo].[T_Advertise] ([ID], [OrderId], [ImgUrl], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, 3, N'http://www.puwiremesh.com:2000/file/img/201991-1c8ed587cbec46939f7723f9825b0fef.jpg', 1, N'', CAST(N'2019-09-01T09:29:08.610' AS DateTime), N'', CAST(N'2019-09-01T09:29:13.903' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Advertise] OFF
SET IDENTITY_INSERT [dbo].[T_Announcement] ON 

INSERT [dbo].[T_Announcement] ([ID], [Title], [Content], [TitleLanguageId], [ContentLanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, N'公告1', N'<p>测试公告1</p>', 16, NULL, 0, N'', CAST(N'2019-08-17T15:12:31.200' AS DateTime), N'', CAST(N'2019-08-17T15:12:31.200' AS DateTime))
INSERT [dbo].[T_Announcement] ([ID], [Title], [Content], [TitleLanguageId], [ContentLanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, N'测试公告1', N'<p>测试公告1测试公告1</p>', 18, 17, 0, N'', CAST(N'2019-08-17T15:30:37.880' AS DateTime), N'', CAST(N'2019-08-17T15:30:37.880' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Announcement] OFF
SET IDENTITY_INSERT [dbo].[T_Company] ON 

INSERT [dbo].[T_Company] ([ID], [OrderId], [TitleLanguageId], [IntroductionLanguageId], [Content], [ContentLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, 10, 30, 29, N'<p>公司简介公司简介公司简介公司简介公司简介公司简介<img src="http://www.puwiremesh.com:2000/file/img/2019831-d974002367934e398d2de880c61d9be6.jpg" style="width: 48px;" class="fr-fic fr-dii">公司简介公司简介公司简介</p><p>公司简介公司简介公司简介公司简介公司简介公司简介</p>', 28, N'http://www.puwiremesh.com:2000/file/img/2019831-ddf7217e67314aec867c1fcf38340fb0.jpg', 0, N'', CAST(N'2019-08-31T11:55:38.213' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.213' AS DateTime))
INSERT [dbo].[T_Company] ([ID], [OrderId], [TitleLanguageId], [IntroductionLanguageId], [Content], [ContentLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, 9, 33, 32, N'<p>业务介绍业务介绍业务介绍业务介绍业务介绍</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-b01b8d5327b44efe927ac741bd9b14ee.jpg" style="width: 300px;" class="fr-fic fr-dii">业务介绍业务介绍业务介绍业务介绍业务介绍</p><p>业务介绍业务介绍业务介绍业务介绍业务介绍</p>', 31, N'http://www.puwiremesh.com:2000/file/img/2019831-768625ed1bf44e989a019d7ead3af460.jpg', 0, N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Company] OFF
SET IDENTITY_INSERT [dbo].[T_Evaluation] ON 

INSERT [dbo].[T_Evaluation] ([ID], [Name], [Tel], [Content], [Email], [OtherContact], [IpAddress], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, N'游客1', N'13726311111', N'123123123123', N'545345643@qq.com', N'18365340234', N'', N'-1', CAST(N'2019-08-31T19:24:47.943' AS DateTime), N'-1', CAST(N'2019-08-31T19:24:47.943' AS DateTime))
INSERT [dbo].[T_Evaluation] ([ID], [Name], [Tel], [Content], [Email], [OtherContact], [IpAddress], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, N'游客1', N'13726311111', N'123123123123', N'545345643@qq.com', N'18365340234', N'::1', N'-1', CAST(N'2019-08-31T19:26:43.137' AS DateTime), N'-1', CAST(N'2019-08-31T19:26:43.137' AS DateTime))
INSERT [dbo].[T_Evaluation] ([ID], [Name], [Tel], [Content], [Email], [OtherContact], [IpAddress], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, N'1111', N'1111', N'1111111111111111', N'1111', N'1111', N'10.10.4.215', N'-1', CAST(N'2019-08-31T20:31:13.417' AS DateTime), N'-1', CAST(N'2019-08-31T20:31:13.417' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Evaluation] OFF
SET IDENTITY_INSERT [dbo].[T_New] ON 

INSERT [dbo].[T_New] ([ID], [Title], [Content], [IntroductionLanguageId], [TitleLanguageId], [ContentLanguageId], [ImgUrl], [IsDeleted], [IsPublish], [PublishTime], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, N'香港警方回应央视记者：已有19人因恶意“起底”警员信息等罪名被拘捕', N'<p><img src="http://www.puwiremesh.com:2000/file/img/2019831-e158333a62cf4d4bb5461d09b4227d46.jpeg" style="width: 673px;" class="fr-fic fr-dib"></p><p>针对近期香港发生多起警员信息被恶意起底、警员家人被恐吓的案件，香港警方30日在回答央视记者提问时表示，已经有15男4女因为恶意起底、滥用他人信息、刑事恐吓而被拘捕。</p><p>香港警方在29日的例行记者会上提到，由6月至今共有1662名警务人员及其亲友的资料被不当公开，并有人在网上煽动其他人进行违法行为，包括刑事恐吓、恶意滋扰警务人员及其家人、非法使用他人个人资料申请网上借贷等。近日甚至有人做出对警员子女进行伏击、泼漆等恶意行为。针对即将到来的新学期，警方表示针对威胁恐吓警员子女、公开学生资料的行为，制定了处理办法，教育局有接受投诉的机制，警署人事部门、服务科也有相应安排。</p><p>在30日的警署例行记者会上，央视记者追问这些恶意&ldquo;起底&rdquo;案件的调查情况，警方表示，网络犯罪与现实犯罪无异，对于此前发生的恶意&ldquo;起底&rdquo;警员信息的案件警方都在跟进调查当中。7月初至今，以香港警署网络安全调查科为首的调查行动已经进行了很多次，并且已经拘捕了15男4女，年龄在16-40岁之间。他们的罪名包括不诚实取用电脑、个人隐私条例下披露未经同意而取得个人资料、刑事恐吓、诈骗等。对于这些违法行为，警方一直在严肃跟进。（央视记者 李伟 &nbsp;孙继文 杨瑾）</p>', 47, 48, 46, N'http://www.puwiremesh.com:2000/file/img/2019831-841b6c0bb12c42878237aae4542f0ffe.jpeg', 0, 1, CAST(N'2019-08-31T20:05:15.617' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.230' AS DateTime), N'', CAST(N'2019-08-31T20:05:15.617' AS DateTime))
INSERT [dbo].[T_New] ([ID], [Title], [Content], [IntroductionLanguageId], [TitleLanguageId], [ContentLanguageId], [ImgUrl], [IsDeleted], [IsPublish], [PublishTime], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, N'在香港，这些“记者”为何只把镜头对准警察、而非暴徒？', N'<p>这一幕被拍下没多久，昨晚，激进示威者在香港荃湾与警方发生冲突，危急之下，警察鸣枪一响自卫、随即&ldquo;拔枪&rdquo;的画面，又成了港媒报道的重中之重。</p><p>一些香港媒体和西方媒体如何在香港煽动民众情绪、片面报道和扭曲事实，我们之前也有过分析。这些人为何如此？</p><p>今天，我们请到了香港资深媒体人屈颖妍，请她谈谈自己的见闻和思考。</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-7bfc2d535c714f3c8b146903e5db0811.png" style="width: 300px;" class="fr-fic fr-dib"></p><p>港媒&ldquo;全方位、多角度&rdquo;拍摄的警察拔枪图</p><p>一</p><p>那天，香港一幅暴动现场的照片刷了屏：一名擎枪警察守在街角瞄准暴徒，但半百穿着反光背心的记者却拿着摄影机瞄准着他。</p><p>那是一个讽刺的画面，也是今日香港传媒生态的真实写照。</p><p>六月至今的每一场暴动，警察的目标从来都是暴徒，而记者的目标却永远指着警察。他们的镁光灯一直在等执法者开枪的一刻、发飊的一瞬、挥棍的一刹，哪管前文后理、前因后果，暴徒之暴可以视若无睹，警察之暴却不能错过。</p><p>昨天，终于让记者等到警察开枪的一幕，大家明明目击数百暴徒挥舞刀、棍、铁枝袭击6名警员，但在警察鸣枪一响自卫后，记者却把焦点转移，怒斥警员为什么开枪。再没人追究，这几百暴徒是如何欲把执法者置诸死地。</p><p>这几个月看香港的暴动视频，一定会让你衍生许多&ldquo;为什么&rdquo;：为什么暴徒前面总是挡着记者？为什么记者都在阻碍公务？为什么&ldquo;无冕之王&rdquo;可以恶成这样？......</p><p>每个官方记者会，都会看到记者对特首，对警队长官进行&ldquo;审犯式&rdquo;提问。有一回，&ldquo;香港电台&rdquo;记者利君雅问了特首：&ldquo;你晚上睡得着吗&rdquo;；问这种晦气问题的人，竟立即被捧为&ldquo;传媒良心&rdquo;，于是下回特首记者会又有人喊出过激的一问：&ldquo;林太，好多市民问你几时死呀？&rdquo;</p><p><br></p>', 50, 51, 49, N'http://www.puwiremesh.com:2000/file/img/2019831-f137f71804c54cf8828a5db7a749431c.png', 0, 1, CAST(N'2019-08-31T20:09:29.057' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:29.057' AS DateTime))
INSERT [dbo].[T_New] ([ID], [Title], [Content], [IntroductionLanguageId], [TitleLanguageId], [ContentLanguageId], [ImgUrl], [IsDeleted], [IsPublish], [PublishTime], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, N'F1匈牙利站：汉密尔顿绝杀维斯塔潘夺冠 维特尔登领奖台', N'<p><strong>赛前消息</strong></p><p><br></p><p>1.这是夏休期之前的最后一站比赛，在去年的匈牙利大奖赛中，梅赛德斯车队的汉密尔顿获得冠军。今年汉密尔顿已经提前锁定了半程冠军。</p><p>2.在周六进行的排位赛中，红牛车队的维斯塔潘以1分14秒572的成绩获得自己F1生涯的首个杆位，博塔斯和汉密尔顿分别排在第二和第三位。接下来依次是勒克莱尔、维特尔和加斯利。</p><p>3.今日亨格罗林赛道是多云天气，大气温度为25摄氏度，赛道温度为45摄氏度。</p>', 53, 54, 52, N'http://www.puwiremesh.com:2000/file/img/2019831-39296ad78c95416792bc560279be2d91.png', 0, 1, CAST(N'2019-08-31T20:12:19.053' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:19.053' AS DateTime))
INSERT [dbo].[T_New] ([ID], [Title], [Content], [IntroductionLanguageId], [TitleLanguageId], [ContentLanguageId], [ImgUrl], [IsDeleted], [IsPublish], [PublishTime], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (6, N'F1比利时站FP3：法拉利再揽1-2 汉密尔顿撞车', N'<p><img src="http://www.puwiremesh.com:2000/file/img/2019831-09e128ad2aae4bbab412d299b1ce98a2.jpg" style="width: 300px;" class="fr-fic fr-dib"></p><p style="text-align: center;"><strong>汉密尔顿撞车</strong></p><p>　　&nbsp; &nbsp; &nbsp; &nbsp; 2019年F1比利时站FP3在斯帕赛道进行。法拉利车队勒克莱尔最快，维特尔第二，梅赛德斯车队博塔斯第三，雷诺车队里卡多第四，红牛车队维斯塔潘第五。汉密尔顿失误撞车。</p><p>　　&nbsp; &nbsp; &nbsp; &nbsp; F1比利时站第3次练习赛成绩表：</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-15c9832468344025b59c7cdcec151e48.jpg" style="width: 300px;" class="fr-fic fr-dib"></p><p style="text-align: center;"><strong>F1比利时站第3次练习赛成绩表 </strong></p>', 56, 57, 55, N'http://www.puwiremesh.com:2000/file/img/2019831-d4125d8edf2348d3a4dcb0bdbe520f0c.jpg', 0, 1, CAST(N'2019-08-31T20:15:36.270' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:36.270' AS DateTime))
INSERT [dbo].[T_New] ([ID], [Title], [Content], [IntroductionLanguageId], [TitleLanguageId], [ContentLanguageId], [ImgUrl], [IsDeleted], [IsPublish], [PublishTime], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (7, N'2020年F1越南大奖赛定于4月5日举行', N'<p>目前，2020年F1越南站的门票预售已经开始。作为2020年F1赛季的第三站，越南站正赛将于2020年4月5日举行，4月4日进行排位赛。</p><p>据悉，F1越南站比赛将在河内市美亭国家体育场举行，赛道由现有市内道路和新建专用路段组成，全长约5.565公里，共含22个弯道。根据赛事主办方最新公布的赛历，2020年F1赛季将于3月15日在澳大利亚站拉开帷幕，11月29日在阿布扎比站收官，共22场比赛。（完）</p>', 59, 60, 58, N'http://www.puwiremesh.com:2000/file/img/2019831-eeca325c0b2f4a188ba240edceb60fe6.jpg', 0, 1, CAST(N'2019-08-31T20:21:08.587' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:21:08.587' AS DateTime))
INSERT [dbo].[T_New] ([ID], [Title], [Content], [IntroductionLanguageId], [TitleLanguageId], [ContentLanguageId], [ImgUrl], [IsDeleted], [IsPublish], [PublishTime], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (8, N'新车队跃跃欲试，但F1在2022年前不予接受', N'<p>他同时还指出，他认为10支车队的围场挺好的，HRT，马诺和Caterham这样的团队都失败了，所以F1只考虑顶尖团队，&ldquo;我们必然对于这么多人感兴趣感到惊讶。但我们必须告诉那些车队，让我们先搞定规则，稳定住形式。在一切妥当后，我们才考虑寻找其他车队。我想现在有10支车队，F1有10支健康车队实际上已经够了。如果我们有另外的车队加入，他们必须能让比赛更加精彩。&rdquo;</p><p>&ldquo;我们要从历史中学习，有些小车队来了又走，并不曾真正加入F1。所以我想我们必须稳定局势，之后看看是否给新车队以机会。&rdquo;</p><p>中游车队们也表达了宁缺毋滥的意见，雷诺说希望新车队能有很好的支持，可持续性的项目。小红牛车队认为12支车队的数目很好，&ldquo;但你永远不知道其他车队进展如何，所以能有多点赛车总是好事。&rdquo;</p><p>哈斯车队认为FOM需要首先照顾已经参赛的车队，赛点车队也要求FOM要谨慎，考虑到新车队对于F1奖金池的影响。</p><p>目前一支认真准备参赛的车队是名为Panthera Team Asia的车队，由前SMP车队的总经理运作，在银石设置了基地。</p><p>Tim Milne这位前马诺车队的技术人员担任首席空气动力师，项目的支持资金来自于亚洲，他们此前说目标是2021年加入F1。</p>', 62, 63, 61, N'http://www.puwiremesh.com:2000/file/img/2019831-abb108a3386245998468986217d12493.jpg', 0, 1, CAST(N'2019-08-31T20:19:21.737' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:19:21.737' AS DateTime))
INSERT [dbo].[T_New] ([ID], [Title], [Content], [IntroductionLanguageId], [TitleLanguageId], [ContentLanguageId], [ImgUrl], [IsDeleted], [IsPublish], [PublishTime], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (9, N'自由媒体：F1赛历明年21站 后年将超过21站', N'<p>&nbsp; &nbsp; &nbsp; &nbsp;&ldquo;我们重视与现有推广商的合作关系，但我们认为，为我们的车迷和体育事业的发展增加令人兴奋的新地点，并在有限水平内管理好客户的流失，这一点非常重要。&rdquo;</p><p>　　&ldquo;我们有幸拥有比供应更多的需求，但我们认识到我们需要以一种深思熟虑的方式来管理这种现状。&rdquo;</p><p>　　&ldquo;我们在决定一场比赛时考虑的因素包括：伟大比赛的赛道质量，以及吸引世界想象力的位置；主办城市和国家的车迷水平、更广泛的支持和热情；赛道和比赛的历史重要性和未来潜力；日程的全球平衡；以及其他一些因素。&rdquo;</p><p>　　&ldquo;我们显然在2020年有超过21个比赛的需求，并且预计2020年后一年内的比赛数量将略有增加。然而，我们要确保最大限度地为体育运动和车迷提供机会，而不是急于做出决定。&rdquo;</p><p>　　&ldquo;我们相信，赛历的有限扩展和客户流失对于为粉丝和我们的持续发展创造一个新鲜和令人兴奋的动态非常重要。&rdquo;</p>', 65, 66, 64, N'http://www.puwiremesh.com:2000/file/img/2019831-d4b7f7c0d864406682ed601b59bb70a1.jpg', 0, 0, NULL, N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_New] OFF
SET IDENTITY_INSERT [dbo].[T_Pro_Example] ON 

INSERT [dbo].[T_Pro_Example] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, 1, N'洁柔应用1', N'<p>洁柔应用1洁柔应用1洁柔应用1洁柔应用1洁柔应用1</p>', 1, 25, 74, 24, N'/upload/img/cdfb20cf62c945d387793a78dcbcee2d.jpg', 0, N'', CAST(N'2019-08-25T12:08:02.733' AS DateTime), N'', CAST(N'2019-09-01T11:48:11.037' AS DateTime))
INSERT [dbo].[T_Pro_Example] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, 1, N'应用2', N'<p>应用2应用2应用2</p>', 2, 27, 73, 26, N'/upload/img/b538dbe10106462ca8431dab571f6c51.png', 0, N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime), N'', CAST(N'2019-09-01T11:47:59.030' AS DateTime))
INSERT [dbo].[T_Pro_Example] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, 1, N'随便测试', N'<p>随便测试随便测试随便测试随便测试随便测试</p><p><img src="http://www.puwiremesh.com:2000/file/img/201991-7a2b2492706d4877963da996eddf89aa.jpg" style="width: 300px;" class="fr-fic fr-dii"></p><p>随便测试随便测试随便测试随便测试随便测试随便测试</p>', 1, 72, 71, 70, N'http://www.puwiremesh.com:2000/file/img/201991-e5f37c70cebf45b7be1a24a2ffefb3b0.jpg', 0, N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_Pro_Example] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, 3, N'法拉利', N'<p>法拉利法拉利法拉利法拉利法拉利法拉利</p><p>法拉利法拉利法拉利法拉利<img src="http://www.puwiremesh.com:2000/file/img/201991-dc085cc7dfaa41d694b96f7c593373f7.jpg" style="width: 300px;" class="fr-fic fr-dii"></p><p>法拉利法拉利法拉利法拉利法拉利法拉利法拉利</p>', 1, 115, 114, 113, N'http://www.puwiremesh.com:2000/file/img/201991-fdbfda3084944d049056164661c5a4bf.jpg', 0, N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_Pro_Example] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, 3, N'F1匈牙利站：汉密尔顿绝杀维斯塔潘夺冠 维特尔登领奖台', N'<p><strong>赛前消息</strong></p><p><br></p><p>1.这是夏休期之前的最后一站比赛，在去年的匈牙利大奖赛中，梅赛德斯车队的汉密尔顿获得冠军。今年汉密尔顿已经提前锁定了半程冠军。</p><p>2.在周六进行的排位赛中，红牛车队的维斯塔潘以1分14秒572的成绩获得自己F1生涯的首个杆位，博塔斯和汉密尔顿分别排在第二和第三位。接下来依次是勒克莱尔、维特尔和加斯利。</p><p>3.今日亨格罗林赛道是多云天气，大气温度为25摄氏度，赛道温度为45摄氏度。</p>', 0, 118, 117, 116, N'http://www.puwiremesh.com:2000/file/img/201991-d143ece8685a4a0d86d8893631d0cbef.jpg', 0, N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_Pro_Example] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (6, 3, N'F1比利时站FP3：法拉利再揽1-2 汉密尔顿撞车', N'<p style="text-align: center;"><img data-fr-image-pasted="true" src="http://www.puwiremesh.com:2000/file/img/2019831-09e128ad2aae4bbab412d299b1ce98a2.jpg" class="fr-fic fr-dii"></p><p><strong>汉密尔顿撞车</strong></p><p>　　 &nbsp; &nbsp; &nbsp; &nbsp;2019年F1比利时站FP3在斯帕赛道进行。法拉利车队勒克莱尔最快，维特尔第二，梅赛德斯车队博塔斯第三，雷诺车队里卡多第四，红牛车队维斯塔潘第五。汉密尔顿失误撞车。</p><p>　　 &nbsp; &nbsp; &nbsp; &nbsp;F1比利时站第3次练习赛成绩表：</p><p style="text-align: center;"><img data-fr-image-pasted="true" src="http://www.puwiremesh.com:2000/file/img/2019831-15c9832468344025b59c7cdcec151e48.jpg" class="fr-fic fr-dii"></p><p><strong>F1比利时站第3次练习赛成绩表</strong></p>', 0, 121, 120, 119, N'http://www.puwiremesh.com:2000/file/img/201991-a9aec1ad77bc45c29bd615ae7b59663b.jpg', 0, N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pro_Example] OFF
SET IDENTITY_INSERT [dbo].[T_Pro_ExampleGroup] ON 

INSERT [dbo].[T_Pro_ExampleGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, N'ExampleBook', N'书本应用', 1, 22, 0, N'', CAST(N'2019-08-25T11:36:31.053' AS DateTime), N'', CAST(N'2019-08-25T11:36:39.740' AS DateTime))
INSERT [dbo].[T_Pro_ExampleGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, N'ExampleCar', N'汽车应用', 0, 23, 1, N'', CAST(N'2019-08-25T11:37:16.400' AS DateTime), N'', CAST(N'2019-08-25T11:39:44.663' AS DateTime))
INSERT [dbo].[T_Pro_ExampleGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, N'f1', N'F1应用', 1, 112, 0, N'', CAST(N'2019-09-01T17:29:17.853' AS DateTime), N'', CAST(N'2019-09-01T17:29:17.853' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pro_ExampleGroup] OFF
SET IDENTITY_INSERT [dbo].[T_Pro_ExampleImg] ON 

INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, 1, 1, N'/upload/img/f080bd94f75f41089737013740b153a4.jpg', N'', CAST(N'2019-08-25T12:09:21.577' AS DateTime), N'', CAST(N'2019-08-25T12:09:21.577' AS DateTime))
INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, 1, 3, N'/upload/img/2d2a5f82f60c409aaec61df0ae15f9fe.png', N'', CAST(N'2019-08-25T12:12:21.607' AS DateTime), N'', CAST(N'2019-08-25T12:12:21.607' AS DateTime))
INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, 1, 1, N'http://www.puwiremesh.com:2000/file/img/201991-d0e4022d60da43e2931d62dc020c305d.jpg', N'', CAST(N'2019-09-01T11:51:10.783' AS DateTime), N'', CAST(N'2019-09-01T11:51:10.783' AS DateTime))
INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, 1, 2, N'http://www.puwiremesh.com:2000/file/img/201991-4b6d2294e34d43ebaaf93e9e08c4cf08.png', N'', CAST(N'2019-09-01T11:51:19.667' AS DateTime), N'', CAST(N'2019-09-01T11:51:19.667' AS DateTime))
INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (6, 1, 3, N'http://www.puwiremesh.com:2000/file/img/201991-e82d183031734deba5fde07b94b1c6ba.jpeg', N'', CAST(N'2019-09-01T11:51:29.407' AS DateTime), N'', CAST(N'2019-09-01T11:51:29.407' AS DateTime))
INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (7, 2, 1, N'http://www.puwiremesh.com:2000/file/img/201991-3dae89ab08ef458a9023e6f664afd616.jpeg', N'', CAST(N'2019-09-01T12:02:59.273' AS DateTime), N'', CAST(N'2019-09-01T12:02:59.273' AS DateTime))
INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (9, 3, 1, N'http://www.puwiremesh.com:2000/file/img/201991-5304c6b5ee07457589e2f5528187d7fe.jpg', N'', CAST(N'2019-09-01T12:03:10.677' AS DateTime), N'', CAST(N'2019-09-01T12:03:10.677' AS DateTime))
INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (10, 3, 2, N'http://www.puwiremesh.com:2000/file/img/201991-2b97733dd1bd408bb8e54bbbc59af9c6.jpg', N'', CAST(N'2019-09-01T12:03:19.130' AS DateTime), N'', CAST(N'2019-09-01T12:03:19.130' AS DateTime))
INSERT [dbo].[T_Pro_ExampleImg] ([ID], [ExampleId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (11, 3, 3, N'http://www.puwiremesh.com:2000/file/img/201991-be68913cc2d04ecbb68054f2e5f3b0c2.png', N'', CAST(N'2019-09-01T12:03:26.783' AS DateTime), N'', CAST(N'2019-09-01T12:03:26.783' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pro_ExampleImg] OFF
SET IDENTITY_INSERT [dbo].[T_Pro_ExampleProductRelation] ON 

INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, 4, 1, N'', CAST(N'2019-09-01T17:08:22.100' AS DateTime), N'', CAST(N'2019-09-01T17:08:22.100' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, 9, 1, N'', CAST(N'2019-09-01T17:08:41.933' AS DateTime), N'', CAST(N'2019-09-01T17:08:41.933' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, 3, 1, N'', CAST(N'2019-09-01T17:08:48.970' AS DateTime), N'', CAST(N'2019-09-01T17:08:48.970' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, 12, 1, N'', CAST(N'2019-09-01T17:08:54.730' AS DateTime), N'', CAST(N'2019-09-01T17:08:54.730' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (6, 5, 6, N'', CAST(N'2019-09-01T17:37:53.680' AS DateTime), N'', CAST(N'2019-09-01T17:37:53.680' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (7, 11, 6, N'', CAST(N'2019-09-01T17:38:08.940' AS DateTime), N'', CAST(N'2019-09-01T17:38:08.940' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (8, 2, 5, N'', CAST(N'2019-09-01T17:38:30.300' AS DateTime), N'', CAST(N'2019-09-01T17:38:30.300' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (9, 5, 4, N'', CAST(N'2019-09-01T17:38:43.497' AS DateTime), N'', CAST(N'2019-09-01T17:38:43.497' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (10, 9, 4, N'', CAST(N'2019-09-01T17:38:46.753' AS DateTime), N'', CAST(N'2019-09-01T17:38:46.753' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (11, 4, 4, N'', CAST(N'2019-09-01T17:38:53.990' AS DateTime), N'', CAST(N'2019-09-01T17:38:53.990' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (12, 3, 4, N'', CAST(N'2019-09-01T17:38:59.227' AS DateTime), N'', CAST(N'2019-09-01T17:38:59.227' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (13, 7, 4, N'', CAST(N'2019-09-01T17:39:03.340' AS DateTime), N'', CAST(N'2019-09-01T17:39:03.340' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (14, 6, 4, N'', CAST(N'2019-09-01T17:39:07.087' AS DateTime), N'', CAST(N'2019-09-01T17:39:07.087' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (15, 8, 4, N'', CAST(N'2019-09-01T17:39:11.070' AS DateTime), N'', CAST(N'2019-09-01T17:39:11.070' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (16, 10, 4, N'', CAST(N'2019-09-01T17:39:15.053' AS DateTime), N'', CAST(N'2019-09-01T17:39:15.053' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (17, 10, 4, N'', CAST(N'2019-09-01T17:39:19.457' AS DateTime), N'', CAST(N'2019-09-01T17:39:19.457' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (18, 15, 4, N'', CAST(N'2019-09-01T17:39:23.127' AS DateTime), N'', CAST(N'2019-09-01T17:39:23.127' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (19, 14, 4, N'', CAST(N'2019-09-01T17:39:27.260' AS DateTime), N'', CAST(N'2019-09-01T17:39:27.260' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (20, 13, 4, N'', CAST(N'2019-09-01T17:39:31.133' AS DateTime), N'', CAST(N'2019-09-01T17:39:31.133' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (21, 12, 4, N'', CAST(N'2019-09-01T17:39:35.820' AS DateTime), N'', CAST(N'2019-09-01T17:39:35.820' AS DateTime))
INSERT [dbo].[T_Pro_ExampleProductRelation] ([ID], [ProductId], [ExampleId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (22, 11, 4, N'', CAST(N'2019-09-01T17:39:39.347' AS DateTime), N'', CAST(N'2019-09-01T17:39:39.347' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pro_ExampleProductRelation] OFF
SET IDENTITY_INSERT [dbo].[T_Pro_HotSaleProduct] ON 

INSERT [dbo].[T_Pro_HotSaleProduct] ([ID], [ProductId], [OrderId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, 2, 1, N'', CAST(N'2019-08-20T20:56:58.657' AS DateTime), N'', CAST(N'2019-08-20T20:57:07.163' AS DateTime))
INSERT [dbo].[T_Pro_HotSaleProduct] ([ID], [ProductId], [OrderId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, 7, 1, N'', CAST(N'2019-09-01T15:38:26.057' AS DateTime), N'', CAST(N'2019-09-01T15:38:26.057' AS DateTime))
INSERT [dbo].[T_Pro_HotSaleProduct] ([ID], [ProductId], [OrderId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, 8, 0, N'', CAST(N'2019-09-01T15:38:32.550' AS DateTime), N'', CAST(N'2019-09-01T15:38:32.550' AS DateTime))
INSERT [dbo].[T_Pro_HotSaleProduct] ([ID], [ProductId], [OrderId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, 14, 0, N'', CAST(N'2019-09-01T15:38:37.297' AS DateTime), N'', CAST(N'2019-09-01T15:38:37.297' AS DateTime))
INSERT [dbo].[T_Pro_HotSaleProduct] ([ID], [ProductId], [OrderId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, 2, 0, N'', CAST(N'2019-09-01T15:38:43.397' AS DateTime), N'', CAST(N'2019-09-01T15:38:43.397' AS DateTime))
INSERT [dbo].[T_Pro_HotSaleProduct] ([ID], [ProductId], [OrderId], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (6, 4, 0, N'', CAST(N'2019-09-01T15:38:47.740' AS DateTime), N'', CAST(N'2019-09-01T15:38:47.740' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pro_HotSaleProduct] OFF
SET IDENTITY_INSERT [dbo].[T_Pro_Product] ON 

INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, 9, N'洁柔', N'<p>洁柔</p>
', 1, NULL, NULL, NULL, NULL, 1, N'', CAST(N'2019-08-17T11:02:13.087' AS DateTime), N'', CAST(N'2019-08-17T17:55:17.713' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, 9, N'随便弄点', N'<p>&nbsp; &nbsp; &nbsp; &nbsp;新华社北京8月30日电 中共中央政治局8月30日召开会议，决定今年10月在北京召开中国共产党第十九届中央委员会第四次全体会议，主要议程是，中共中央政治局向中央委员会报告工作，研究坚持和完善中国特色社会主义制度、推进国家治理体系和治理能力现代化若干重大问题。会议审议了《中国共产党党内法规制定条例》、《中国共产党党内法规和规范性文件备案审查规定》、《中国共产党党内法规执行责任制规定（试行）》。中共中央总书记习近平主持会议。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;会议认为，中国共产党自成立以来，团结带领人民，坚持把马克思主义基本原理同中国具体实际相结合，赢得了中国革命胜利，并深刻总结国内外正反两方面经验，不断探索、不断实践，建立和完善社会主义制度，形成和发展党的领导和经济、政治、文化、社会、生态文明、军事、外事等各方面制度，不断完善国家治理，取得历史性成就。党的十八大以来，我们党领导人民统筹推进&ldquo;五位一体&rdquo;总体布局、协调推进&ldquo;四个全面&rdquo;战略布局，推动中国特色社会主义制度更加完善、国家治理体系和治理能力现代化水平明显提高，为政治稳定、经济发展、文化繁荣、民族团结、社会安宁、国家统一提供了有力保障。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;会议强调，新中国成立70年来，我们党领导人民创造了世所罕见的经济发展奇迹和政治稳定奇迹，中华民族迎来了从站起来、富起来到强起来的伟大飞跃。实践证明，中国特色社会主义制度和国家治理体系是植根中国大地、具有深厚中华文化根基、深得人民拥护的制度和治理体系，是具有强大生命力和巨大优越性的制度和治理体系，是能够持续推动拥有近14亿人口大国进步和发展、确保拥有5000多年文明史的中华民族实现&ldquo;两个一百年&rdquo;奋斗目标进而实现伟大复兴的制度和治理体系。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;会议认为，当今世界正经历百年未有之大变局，我国正处于实现中华民族伟大复兴关键时期。顺应时代潮流，适应我国社会主要矛盾变化，统揽伟大斗争、伟大工程、伟大事业、伟大梦想，不断满足人民对美好生活新期待，战胜前进道路上各种风险挑战，必须加强对重大问题的研究，坚持改革创新，在坚持和完善中国特色社会主义制度、推进国家治理体系和治理能力现代化上下更大功夫，继续艰苦奋斗、开拓前进，确保党和国家事业蓬勃发展、长治久安。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 会议指出，加强党内法规制度建设，必须以习近平新时代中国特色社会主义思想为指导，坚持正确政治方向，坚持以党章为根本遵循，坚持贯彻民主集中制，坚持服务党和国家工作大局，坚持系统推进，坚持依法治国和依规治党有机统一。修订制定《中国共产党党内法规制定条例》等党内法规是加强新时代党内法规制度建设的重要举措，体现了党的十八大以来坚持全面从严治党、依规治党的实践成果、理论成果、制度成果。</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 会议强调，党内法规制定工作要以新修订的《条例》为遵循，使党的领导和党的建设各方面法规制度相协调，下位法规制度同上位法规制度相衔接，实体性、程序性、保障性法规制度相配套。要认真执行新修订的《党内法规和规范性文件备案审查规定》，坚持有件必备、有备必审、有错必纠，切实维护党内法规和党的政策的统一性和权威性。要严格落实《党内法规执行责任制规定（试行）》，各级党组织和党员领导干部必须切实担负起执行党内法规的政治责任。</p>', 2, 12, 12, 21, N'http://www.puwiremesh.com:2000/file/img/2019831-f284cab116124792b417823d6fc0238d.jpg', 0, N'', CAST(N'2019-08-17T11:43:50.777' AS DateTime), N'', CAST(N'2019-08-31T17:26:21.400' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, 9, N'维达', N'<p>维达一直将&ldquo;成为消费者生活卫生用品的第一选择&rdquo;作为企业远景，在致力于&ldquo;让人们享受高品质的生活卫生用品&rdquo;的使命下，集团上下用&ldquo;专业专注&rdquo;、&ldquo;诚信服务&rdquo;、&ldquo;创新进取&rdquo;、&ldquo;环保健康&rdquo;的核心价值观服务每一位消费者和客户。维达于2007年在香港主板上市（股票代码：3331），并在中国建立包括广东、江门、湖北、浙江、北京、四川、辽宁、山东九大现代化生产基地；在澳洲建立加工基地，销售网络遍布中国、港澳地区、东南亚、欧洲及大洋洲。</p>', 2, 14, 14, 13, N'/upload/img/42c2d86c56e8431a9d0eb2132371d52d.png', 0, N'', CAST(N'2019-08-17T12:22:40.603' AS DateTime), N'', CAST(N'2019-08-28T20:32:57.840' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, 9, N'洁柔', N'<p>中顺洁柔纸业股份有限公司成立于1999年，2008年12月整体改制为股份有限公司，是全国最大的专业生产生活用纸系列产品的企业之一。</p><p><br></p><dl><dt>公司名称</dt><dd>中顺洁柔纸业股份有限公司</dd><dt>成立时间</dt><dd>1999年</dd></dl><dl><dt>经营范围</dt><dd>专业生产生活用纸系列产品</dd><dt>企业荣誉</dt><dd>中国民营500强</dd></dl><h2>目录</h2><ol><li>1&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#1">公司简介</a></li><li>2&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#2">战略布局</a></li><li>3&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#3">企业荣誉</a></li><li>4&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#4">技术设备</a></li><li>5&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#5">社会责任</a></li><li>6&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6">人才管理</a></li><li>?&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6_1">人才理念</a></li><li>?&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6_2">人才储备</a></li><li>?&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6_3">人才培养</a></li><li>?&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6_4">人才竞聘</a></li></ol><p><a name="1"></a><a name="sub4704050_1"></a><a name="公司简介"></a></p><h2>公司简介</h2><p><a data-edit-dl="1" href="javascript%3A;">编辑</a></p><p>公司集研究、开发、生产、销售为一体，拥有广东中山、广东江门、 四川成都、 浙江嘉兴、 湖北孝感、 河北唐山等六大生产基地，销售网络辐射<sup data-ctrmap=":1," data-sup="1">&nbsp;[1]</sup><a name="ref_[1]_4704050">&nbsp;</a> <a href="https://baike.baidu.com/item/%E5%8D%8E%E5%8D%97" target="_blank">华南</a>、华西、华北和华中等区域，产品远销香港、澳门、澳大利亚、日本、中东和东南亚等国家和地区。目前，在中国生活用纸行业的三个中国名牌产品中，&ldquo;洁柔&rdquo;位列其一；在四个驰名商标中，&ldquo;洁柔&rdquo;、&ldquo;太阳&rdquo;占了其中两个。</p>', 3, 35, 36, 34, N'http://www.puwiremesh.com:2000/file/img/2019831-7f2377bb9e5e40b0ae54b5b8b9340941.png', 0, N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime), N'', CAST(N'2019-08-31T17:36:59.390' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, 12, N'法拉利', N'<p>法拉利</p><p><img src="http://www.puwiremesh.com:2000/file/img/201991-844802a9680f43eeb50360459141b31b.jpg" style="width: 300px;" class="fr-fic fr-dii"></p>', 1, 79, 86, 78, N'http://www.puwiremesh.com:2000/file/img/201991-b67a1a9c1433415f8b1d70941c8b2e28.jpg', 0, N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime), N'', CAST(N'2019-09-01T15:04:46.227' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (6, 10, N'语文', N'<p>语文</p>', 0, 81, 82, 80, N'http://www.puwiremesh.com:2000/file/img/201991-8364c455157a42d0a7bdbfae468f2122.jpeg', 0, N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime), N'', CAST(N'2019-09-01T14:36:30.103' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (7, 11, N'玫瑰', N'<p>玫瑰</p>', 0, 84, 85, 83, N'http://www.puwiremesh.com:2000/file/img/201991-eeb0932fc0514b1090176c97ef8e3b16.jpg', 0, N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime), N'', CAST(N'2019-09-01T14:37:08.427' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (8, 9, N'123', N'<p>123</p>', 0, 88, 89, 87, N'http://www.puwiremesh.com:2000/file/img/201991-4b2b42f9dd824679a99d83e993dcdc96.png', 0, N'', CAST(N'2019-09-01T15:10:51.517' AS DateTime), N'', CAST(N'2019-09-01T15:11:42.520' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (9, 9, N'234', N'<p>234</p>', 234, 92, 91, 90, N'http://www.puwiremesh.com:2000/file/img/201991-394312c6c6f94ca0958606572071bb2e.jpg', 0, N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (10, 9, N'345', N'<p>345</p>', 0, 95, 96, 93, N'http://www.puwiremesh.com:2000/file/img/201991-fedc71c1182e4111833b9bd3831926e9.jpg', 0, N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:31.467' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (11, 9, N'456', N'<p>456</p>', 0, 99, 98, 97, N'http://www.puwiremesh.com:2000/file/img/201991-045a371ac7f44f26a1a50ca7ddf765ec.jpg', 0, N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (12, 9, N'567', N'<p>567</p>', 0, 102, 101, 100, N'http://www.puwiremesh.com:2000/file/img/201991-7b0bb4b288594a1ba4c5383dc47e47da.jpg', 0, N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (13, 9, N'678', N'<p>678</p>', 0, 105, 104, 103, N'http://www.puwiremesh.com:2000/file/img/201991-122262042cc3409da85e995d69782229.jpg', 0, N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (14, 9, N'789', N'<p>789</p>', 0, 108, 107, 106, N'http://www.puwiremesh.com:2000/file/img/201991-2baca6afb5e840609d227d6df3e77f78.jpg', 0, N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_Pro_Product] ([ID], [GroupId], [Name], [Description], [OrderId], [NameLanguageId], [IntroductionLanguageId], [DescriptionLanguageId], [ImgPath], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (15, 9, N'890', N'<p>890</p>', 0, 111, 110, 109, N'http://www.puwiremesh.com:2000/file/img/201991-562e2bce236943949f0474e1ffb00fdf.jpg', 0, N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pro_Product] OFF
SET IDENTITY_INSERT [dbo].[T_Pro_ProductGroup] ON 

INSERT [dbo].[T_Pro_ProductGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, N'Test', N'测试', 1, NULL, 1, N'System', CAST(N'2019-07-16T00:00:00.000' AS DateTime), N'', CAST(N'2019-07-22T15:37:50.023' AS DateTime))
INSERT [dbo].[T_Pro_ProductGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, N'groupA', N'分组A', 1, 1, 1, N'', CAST(N'2019-07-18T18:00:48.607' AS DateTime), N'', CAST(N'2019-07-22T15:20:10.387' AS DateTime))
INSERT [dbo].[T_Pro_ProductGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, N'GroupB', N'分组B123', 2, 2, 1, N'', CAST(N'2019-07-18T18:03:35.057' AS DateTime), N'', CAST(N'2019-08-17T10:31:34.553' AS DateTime))
INSERT [dbo].[T_Pro_ProductGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, N'GroupB', N'分组B', 2, 3, 1, N'', CAST(N'2019-07-18T18:04:12.413' AS DateTime), N'', CAST(N'2019-08-17T10:31:37.250' AS DateTime))
INSERT [dbo].[T_Pro_ProductGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (9, N'paper', N'纸巾', 1, 11, 0, N'', CAST(N'2019-08-17T10:42:12.363' AS DateTime), N'', CAST(N'2019-08-17T11:32:38.583' AS DateTime))
INSERT [dbo].[T_Pro_ProductGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (10, N'book', N'书本', 2, 75, 0, N'', CAST(N'2019-09-01T14:33:30.293' AS DateTime), N'', CAST(N'2019-09-01T14:33:30.293' AS DateTime))
INSERT [dbo].[T_Pro_ProductGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (11, N'flower', N'花', 3, 76, 0, N'', CAST(N'2019-09-01T14:33:55.860' AS DateTime), N'', CAST(N'2019-09-01T14:33:55.860' AS DateTime))
INSERT [dbo].[T_Pro_ProductGroup] ([ID], [Code], [Name], [OrderId], [LanguageId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (12, N'F1', N'F1', 6, 77, 0, N'', CAST(N'2019-09-01T14:34:10.273' AS DateTime), N'', CAST(N'2019-09-01T14:34:10.273' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pro_ProductGroup] OFF
SET IDENTITY_INSERT [dbo].[T_Pro_ProductImg] ON 

INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, 2, 2, N'http://www.puwiremesh.com:2000/file/img/2019831-18de1f3c3a7a4a8e953764a728b70c1a.png', N'', CAST(N'2019-08-20T19:27:21.960' AS DateTime), N'', CAST(N'2019-08-31T17:24:17.400' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, 2, 1, N'http://www.puwiremesh.com:2000/file/img/2019831-a189732e2dc44ddd85526fbb67d43e6c.png', N'', CAST(N'2019-08-25T10:48:56.910' AS DateTime), N'', CAST(N'2019-08-31T17:24:06.827' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, 2, 3, N'http://www.puwiremesh.com:2000/file/img/2019831-5c1925a4336542f9a79b9fd59bc9948e.png', N'', CAST(N'2019-08-31T17:24:32.157' AS DateTime), N'', CAST(N'2019-08-31T17:24:32.157' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, 2, 4, N'http://www.puwiremesh.com:2000/file/img/2019831-8550ebfec4b4464cac3b0842c1238f68.gif', N'', CAST(N'2019-08-31T17:24:43.863' AS DateTime), N'', CAST(N'2019-08-31T17:24:43.863' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (6, 2, 5, N'http://www.puwiremesh.com:2000/file/img/2019831-b41455f447d74480b5eb8c4401dce2cf.jpg', N'', CAST(N'2019-08-31T17:24:56.893' AS DateTime), N'', CAST(N'2019-08-31T17:24:56.893' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (7, 2, 6, N'http://www.puwiremesh.com:2000/file/img/2019831-14473fbb02654ab191daef947e77b464.jpg', N'', CAST(N'2019-08-31T17:25:15.233' AS DateTime), N'', CAST(N'2019-08-31T17:25:15.233' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (8, 3, NULL, N'http://www.puwiremesh.com:2000/file/img/2019831-2d248921f7f94ec0b4c4a9f28f7f3116.png', N'', CAST(N'2019-08-31T17:26:42.480' AS DateTime), N'', CAST(N'2019-08-31T17:26:42.480' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (9, 3, NULL, N'http://www.puwiremesh.com:2000/file/img/2019831-17aa4ef2eb1345f29a0ffabc315f7e47.jpg', N'', CAST(N'2019-08-31T17:26:54.427' AS DateTime), N'', CAST(N'2019-08-31T17:26:54.427' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (10, 3, NULL, N'http://www.puwiremesh.com:2000/file/img/2019831-d5434280934d4938bb187d6fb48d35c9.png', N'', CAST(N'2019-08-31T17:27:13.597' AS DateTime), N'', CAST(N'2019-08-31T17:27:13.597' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (11, 3, NULL, N'http://www.puwiremesh.com:2000/file/img/2019831-2bd36bc461f84bb9a886112f74ded083.jpg', N'', CAST(N'2019-08-31T17:27:25.537' AS DateTime), N'', CAST(N'2019-08-31T17:27:25.537' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (15, 3, NULL, N'http://www.puwiremesh.com:2000/file/img/2019831-8062910c2203491c9f186865dfa30b7c.png', N'', CAST(N'2019-08-31T17:28:06.937' AS DateTime), N'', CAST(N'2019-08-31T17:28:06.937' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (17, 3, NULL, N'http://www.puwiremesh.com:2000/file/img/2019831-c229d2ed23774f779ef9be89f81e1eb4.jpg', N'', CAST(N'2019-08-31T17:28:23.130' AS DateTime), N'', CAST(N'2019-08-31T17:28:23.130' AS DateTime))
INSERT [dbo].[T_Pro_ProductImg] ([ID], [ProductId], [OrderId], [ImgUrl], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (18, 5, NULL, N'http://www.puwiremesh.com:2000/file/img/201991-2c194abe1d084cafbe9d5a724125e246.jpg', N'', CAST(N'2019-09-01T14:35:43.943' AS DateTime), N'', CAST(N'2019-09-01T14:35:43.943' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pro_ProductImg] OFF
SET IDENTITY_INSERT [dbo].[T_System_LanguageContent] ON 

INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (1, 1, N'Chinese', N'分组A', N'', CAST(N'2019-07-18T18:00:48.607' AS DateTime), N'', CAST(N'2019-07-18T18:00:48.607' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (2, 1, N'English', N'Group A', N'', CAST(N'2019-07-18T18:00:48.607' AS DateTime), N'', CAST(N'2019-07-18T18:00:48.607' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (3, 2, N'Chinese', N'分组B123', N'', CAST(N'2019-07-18T18:03:35.057' AS DateTime), N'', CAST(N'2019-08-17T10:17:46.660' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (4, 2, N'English', N'Group B321', N'', CAST(N'2019-07-18T18:03:35.057' AS DateTime), N'', CAST(N'2019-08-17T10:17:46.660' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (5, 3, N'Chinese', N'分组B', N'', CAST(N'2019-07-18T18:04:13.873' AS DateTime), N'', CAST(N'2019-07-18T18:04:13.873' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (6, 3, N'English', N'Group B', N'', CAST(N'2019-07-18T18:04:14.057' AS DateTime), N'', CAST(N'2019-07-18T18:04:14.057' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (7, 11, N'Chinese', N'纸巾', N'', CAST(N'2019-08-17T10:42:15.157' AS DateTime), N'', CAST(N'2019-08-17T11:32:38.583' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (8, 11, N'English', N'Paper', N'', CAST(N'2019-08-17T10:42:15.383' AS DateTime), N'', CAST(N'2019-08-17T11:32:38.583' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (9, 12, N'Chinese', N'简介商品简介商品简介商品简介商品简介商品简介商品简介商品简介', N'', CAST(N'2019-08-17T11:43:56.407' AS DateTime), N'', CAST(N'2019-08-31T17:26:21.407' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (10, 12, N'English', N'suibian Introduction IntroductionIntroductionIntroductionIntroductionIntroductionIntroductionIntroduction', N'', CAST(N'2019-08-17T11:43:56.990' AS DateTime), N'', CAST(N'2019-08-31T17:26:21.407' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (11, 13, N'Chinese', N'<p>维达一直将&ldquo;成为消费者生活卫生用品的第一选择&rdquo;作为企业远景，在致力于&ldquo;让人们享受高品质的生活卫生用品&rdquo;的使命下，集团上下用&ldquo;专业专注&rdquo;、&ldquo;诚信服务&rdquo;、&ldquo;创新进取&rdquo;、&ldquo;环保健康&rdquo;的核心价值观服务每一位消费者和客户。维达于2007年在香港主板上市（股票代码：3331），并在中国建立包括广东、江门、湖北、浙江、北京、四川、辽宁、山东九大现代化生产基地；在澳洲建立加工基地，销售网络遍布中国、港澳地区、东南亚、欧洲及大洋洲。</p>', N'', CAST(N'2019-08-17T12:22:40.607' AS DateTime), N'', CAST(N'2019-08-28T20:32:57.970' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (12, 13, N'English', N'<p>vinda vinda vinda<img src="/upload/img/bb2afea393544643afd71a9909a97ebe.jpg" style="width: 300px;" class="fr-fic fr-dib">vinda</p><p>vinda</p>', N'', CAST(N'2019-08-17T12:22:40.607' AS DateTime), N'', CAST(N'2019-08-28T20:32:57.970' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (13, 14, N'Chinese', N'维达', N'', CAST(N'2019-08-17T12:22:40.607' AS DateTime), N'', CAST(N'2019-08-28T20:32:57.970' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (14, 14, N'English', N'vinda', N'', CAST(N'2019-08-17T12:22:40.607' AS DateTime), N'', CAST(N'2019-08-28T20:32:57.970' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (15, 16, N'Chinese', N'<p>测试公告1</p>', N'', CAST(N'2019-08-17T15:12:31.200' AS DateTime), N'', CAST(N'2019-08-17T15:12:31.200' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (16, 16, N'English', N'<p>testAnnouncement1testAnnouncement1</p>', N'', CAST(N'2019-08-17T15:12:31.200' AS DateTime), N'', CAST(N'2019-08-17T15:12:31.200' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (17, 17, N'Chinese', N'<p>测试公告1测试公告1</p>', N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime), N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (18, 17, N'English', N'<p>testAnnouncement1testAnnouncement1</p>', N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime), N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (19, 18, N'Chinese', N'测试公告1', N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime), N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (20, 18, N'English', N'testAnnouncement1', N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime), N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (21, 19, N'Chinese', N'<p>新纸巾上市新纸巾上市新纸巾上市</p><p><img src="/upload/img/b09b92d7dad44710bc61293b4550d13d.jpg" style="width: 180px;" class="fr-fic fr-dii"></p><p>哈哈哈</p>', N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime), N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (22, 19, N'English', N'<p>new paper on sale</p><p>jojo</p><p><strong><img src="/upload/img/85ec861e3a974b26930106333f4054a8.jpg" style="width: 132px;" class="fr-fic fr-dii"></strong></p><p><strong>fighting glod!!!</strong></p>', N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime), N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (23, 20, N'Chinese', N'新纸巾上市', N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime), N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (24, 20, N'English', N'new paper on sale', N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime), N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (25, 21, N'Chinese', N'<p>&nbsp; &nbsp; &nbsp; &nbsp;新华社北京8月30日电 中共中央政治局8月30日召开会议，决定今年10月在北京召开中国共产党第十九届中央委员会第四次全体会议，主要议程是，中共中央政治局向中央委员会报告工作，研究坚持和完善中国特色社会主义制度、推进国家治理体系和治理能力现代化若干重大问题。会议审议了《中国共产党党内法规制定条例》、《中国共产党党内法规和规范性文件备案审查规定》、《中国共产党党内法规执行责任制规定（试行）》。中共中央总书记习近平主持会议。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;会议认为，中国共产党自成立以来，团结带领人民，坚持把马克思主义基本原理同中国具体实际相结合，赢得了中国革命胜利，并深刻总结国内外正反两方面经验，不断探索、不断实践，建立和完善社会主义制度，形成和发展党的领导和经济、政治、文化、社会、生态文明、军事、外事等各方面制度，不断完善国家治理，取得历史性成就。党的十八大以来，我们党领导人民统筹推进&ldquo;五位一体&rdquo;总体布局、协调推进&ldquo;四个全面&rdquo;战略布局，推动中国特色社会主义制度更加完善、国家治理体系和治理能力现代化水平明显提高，为政治稳定、经济发展、文化繁荣、民族团结、社会安宁、国家统一提供了有力保障。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;会议强调，新中国成立70年来，我们党领导人民创造了世所罕见的经济发展奇迹和政治稳定奇迹，中华民族迎来了从站起来、富起来到强起来的伟大飞跃。实践证明，中国特色社会主义制度和国家治理体系是植根中国大地、具有深厚中华文化根基、深得人民拥护的制度和治理体系，是具有强大生命力和巨大优越性的制度和治理体系，是能够持续推动拥有近14亿人口大国进步和发展、确保拥有5000多年文明史的中华民族实现&ldquo;两个一百年&rdquo;奋斗目标进而实现伟大复兴的制度和治理体系。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;会议认为，当今世界正经历百年未有之大变局，我国正处于实现中华民族伟大复兴关键时期。顺应时代潮流，适应我国社会主要矛盾变化，统揽伟大斗争、伟大工程、伟大事业、伟大梦想，不断满足人民对美好生活新期待，战胜前进道路上各种风险挑战，必须加强对重大问题的研究，坚持改革创新，在坚持和完善中国特色社会主义制度、推进国家治理体系和治理能力现代化上下更大功夫，继续艰苦奋斗、开拓前进，确保党和国家事业蓬勃发展、长治久安。</p><p>&nbsp; &nbsp; &nbsp; &nbsp; 会议指出，加强党内法规制度建设，必须以习近平新时代中国特色社会主义思想为指导，坚持正确政治方向，坚持以党章为根本遵循，坚持贯彻民主集中制，坚持服务党和国家工作大局，坚持系统推进，坚持依法治国和依规治党有机统一。修订制定《中国共产党党内法规制定条例》等党内法规是加强新时代党内法规制度建设的重要举措，体现了党的十八大以来坚持全面从严治党、依规治党的实践成果、理论成果、制度成果。</p><p><br></p><p>&nbsp; &nbsp; &nbsp; &nbsp; 会议强调，党内法规制定工作要以新修订的《条例》为遵循，使党的领导和党的建设各方面法规制度相协调，下位法规制度同上位法规制度相衔接，实体性、程序性、保障性法规制度相配套。要认真执行新修订的《党内法规和规范性文件备案审查规定》，坚持有件必备、有备必审、有错必纠，切实维护党内法规和党的政策的统一性和权威性。要严格落实《党内法规执行责任制规定（试行）》，各级党组织和党员领导干部必须切实担负起执行党内法规的政治责任。</p>', N'', CAST(N'2019-08-20T20:14:51.813' AS DateTime), N'', CAST(N'2019-08-31T17:26:21.407' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (26, 21, N'English', N'<p>suibiansuibiansuibiansuibiansuibiansuibian</p><p>suibian</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-65c5bec6fb894eb1b3028d1bee9748ec.jpg" style="width: 300px;" class="fr-fic fr-dii"></p><p>suibiansuibiansuibiansuibian</p>', N'', CAST(N'2019-08-20T20:14:51.813' AS DateTime), N'', CAST(N'2019-08-31T17:26:21.407' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (27, 22, N'Chinese', N'书本应用', N'', CAST(N'2019-08-25T11:36:31.053' AS DateTime), N'', CAST(N'2019-08-25T11:36:39.793' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (28, 22, N'English', N'Example Book', N'', CAST(N'2019-08-25T11:36:31.053' AS DateTime), N'', CAST(N'2019-08-25T11:36:39.793' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (29, 23, N'Chinese', N'汽车应用', N'', CAST(N'2019-08-25T11:37:16.400' AS DateTime), N'', CAST(N'2019-08-25T11:37:16.400' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (30, 23, N'English', N'Example Car', N'', CAST(N'2019-08-25T11:37:16.400' AS DateTime), N'', CAST(N'2019-08-25T11:37:16.400' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (31, 24, N'Chinese', N'<p>洁柔应用1洁柔应用1洁柔应用1洁柔应用1洁柔应用1</p>', N'', CAST(N'2019-08-25T12:08:02.737' AS DateTime), N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (32, 24, N'English', N'<p>C&amp;S Example 1C&amp;S Example 1C&amp;S Example 1C&amp;S Example 1</p>', N'', CAST(N'2019-08-25T12:08:02.737' AS DateTime), N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (33, 25, N'Chinese', N'洁柔应用1', N'', CAST(N'2019-08-25T12:08:02.737' AS DateTime), N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (34, 25, N'English', N'C&S Example 1', N'', CAST(N'2019-08-25T12:08:02.737' AS DateTime), N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (35, 26, N'Chinese', N'<p>应用2应用2应用2</p>', N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime), N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (36, 26, N'English', N'<p>Example2Example2Example2</p>', N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime), N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (37, 27, N'Chinese', N'应用2', N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime), N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (38, 27, N'English', N'Example2', N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime), N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (39, 28, N'Chinese', N'<p>公司简介公司简介公司简介公司简介公司简介公司简介<img src="http://www.puwiremesh.com:2000/file/img/2019831-d974002367934e398d2de880c61d9be6.jpg" style="width: 48px;" class="fr-fic fr-dii">公司简介公司简介公司简介</p><p>公司简介公司简介公司简介公司简介公司简介公司简介</p>', N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (40, 28, N'English', N'<p>IntroductionIntroductionIntroductionIntroductionIntroduction<img src="http://www.puwiremesh.com:2000/file/img/2019831-324a0135bf444e58b2cfafa161202c56.jpg" style="width: 52px;" class="fr-fic fr-dii">IntroductionIntroductionIntroduction</p><p>IntroductionIntroductionIntroductionIntroductionIntroductionIntroductionIntroduction</p>', N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (41, 29, N'Chinese', N'公司简介公司简介公司简介', N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (42, 29, N'English', N'IntroductionIntroductionIntroductionIntroductionIntroductionIntroductionIntroduction', N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (43, 30, N'Chinese', N'公司简介', N'', CAST(N'2019-08-31T11:55:38.440' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.440' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (44, 30, N'English', N'Introduction', N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (45, 31, N'Chinese', N'<p>业务介绍业务介绍业务介绍业务介绍业务介绍</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-b01b8d5327b44efe927ac741bd9b14ee.jpg" style="width: 300px;" class="fr-fic fr-dii">业务介绍业务介绍业务介绍业务介绍业务介绍</p><p>业务介绍业务介绍业务介绍业务介绍业务介绍</p>', N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (46, 31, N'English', N'<p>yewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesao<img src="http://www.puwiremesh.com:2000/file/img/2019831-ed90a778c34e4e82b051a92b3da868a9.jpg" style="width: 300px;" class="fr-fic fr-dii">yewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesao</p>', N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (47, 32, N'Chinese', N'业务介绍业务介绍业务介绍业务介绍业务介绍业务介绍业务介绍', N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (48, 32, N'English', N'yewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesaoyewujiesao', N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (49, 33, N'Chinese', N'业务介绍', N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (50, 33, N'English', N'yewujiesao', N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (51, 34, N'Chinese', N'<p>中顺洁柔纸业股份有限公司成立于1999年，2008年12月整体改制为股份有限公司，是全国最大的专业生产生活用纸系列产品的企业之一。</p><p><br></p><dl><dt>公司名称</dt><dd>中顺洁柔纸业股份有限公司</dd><dt>成立时间</dt><dd>1999年</dd></dl><dl><dt>经营范围</dt><dd>专业生产生活用纸系列产品</dd><dt>企业荣誉</dt><dd>中国民营500强</dd></dl><h2>目录</h2><ol><li>1&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#1">公司简介</a></li><li>2&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#2">战略布局</a></li><li>3&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#3">企业荣誉</a></li><li>4&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#4">技术设备</a></li><li>5&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#5">社会责任</a></li><li>6&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6">人才管理</a></li><li>?&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6_1">人才理念</a></li><li>?&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6_2">人才储备</a></li><li>?&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6_3">人才培养</a></li><li>?&nbsp;<a href="https://baike.baidu.com/item/%E4%B8%AD%E9%A1%BA%E6%B4%81%E6%9F%94%E7%BA%B8%E4%B8%9A%E8%82%A1%E4%BB%BD%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8/8353128?fr=aladdin#6_4">人才竞聘</a></li></ol><p><a name="1"></a><a name="sub4704050_1"></a><a name="公司简介"></a></p><h2>公司简介</h2><p><a data-edit-dl="1" href="javascript%3A;">编辑</a></p><p>公司集研究、开发、生产、销售为一体，拥有广东中山、广东江门、 四川成都、 浙江嘉兴、 湖北孝感、 河北唐山等六大生产基地，销售网络辐射<sup data-ctrmap=":1," data-sup="1">&nbsp;[1]</sup><a name="ref_[1]_4704050">&nbsp;</a> <a href="https://baike.baidu.com/item/%E5%8D%8E%E5%8D%97" target="_blank">华南</a>、华西、华北和华中等区域，产品远销香港、澳门、澳大利亚、日本、中东和东南亚等国家和地区。目前，在中国生活用纸行业的三个中国名牌产品中，&ldquo;洁柔&rdquo;位列其一；在四个驰名商标中，&ldquo;洁柔&rdquo;、&ldquo;太阳&rdquo;占了其中两个。</p>', N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime), N'', CAST(N'2019-08-31T17:37:50.763' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (52, 34, N'English', N'<p>Zhongshunjie Flexible Paper Co., Ltd. was founded in 1999, and was reorganized into a limited company in December 2008. It is one of the largest enterprises specializing in the production of domestic paper products in China.</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p>Corporate name</p><p><br></p><p>Zhongshun Jierou Paper Co., Ltd.</p><p><br></p><p>Time of establishment</p><p><br></p><p>1999</p><p><br></p><p>Scope of Business</p><p><br></p><p>Professional production of domestic paper series products</p><p><br></p><p>Enterprise Honor</p><p><br></p><p>Top 500 Private Enterprises in China</p><p><br></p><p>Catalog</p><p><br></p><p>1 company profile</p><p><br></p><p>2. Strategic layout</p><p><br></p><p>3 Enterprise Honor</p><p><br></p><p>4 Technical Equipment</p><p><br></p><p>5 Social Responsibility</p><p><br></p><p>6 Talent Management</p><p><br></p><p>_Talent Idea</p><p><br></p><p>Talent Reserve</p><p><br></p><p>_Talent Training</p><p><br></p><p>Competition for Talents</p><p><br></p><p><br></p><p><br></p><p>Company Profile</p><p><br></p><p>edit</p><p><br></p><p><br></p><p><br></p><p>The company integrates research, development, production and sales. It has six production bases in Zhongshan, Jiangmen, Sichuan, Chengdu, Zhejiang, Jiaxing, Xiaogan, Hebei, Tangshan, etc. It has sales network radiation [1] South China, West China, North China and middle China. Its products are exported to Hong Kong, Macao, Australia, Japan, and China. Countries and regions such as the Middle East and Southeast Asia. At present, Jierou ranks first among the three famous Chinese products in China&#39;s domestic paper industry, and among the four well-known trademarks, Jierou and Sun account for two of them.</p>', N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime), N'', CAST(N'2019-08-31T17:37:50.763' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (53, 35, N'Chinese', N'洁柔', N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime), N'', CAST(N'2019-08-31T17:37:10.450' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (54, 35, N'English', N'C&S', N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime), N'', CAST(N'2019-08-31T17:37:10.450' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (55, 36, N'Chinese', N'中顺洁柔纸业股份有限公司成立于1999年，2008年12月整体改制为股份有限公司，是全国最大的专业生产生活用纸系列产品的企业之一。', N'', CAST(N'2019-08-31T17:37:24.583' AS DateTime), N'', CAST(N'2019-08-31T17:37:24.583' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (56, 36, N'English', N'Zhongshunjie Flexible Paper Co., Ltd. was founded in 1999, and was reorganized into a limited company in December 2008. It is one of the largest enterprises specializing in the production of domestic paper products in China.', N'', CAST(N'2019-08-31T17:37:26.953' AS DateTime), N'', CAST(N'2019-08-31T17:37:26.953' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (69, 46, N'Chinese', N'<p><img src="http://www.puwiremesh.com:2000/file/img/2019831-e158333a62cf4d4bb5461d09b4227d46.jpeg" style="width: 673px;" class="fr-fic fr-dib"></p><p>针对近期香港发生多起警员信息被恶意起底、警员家人被恐吓的案件，香港警方30日在回答央视记者提问时表示，已经有15男4女因为恶意起底、滥用他人信息、刑事恐吓而被拘捕。</p><p>香港警方在29日的例行记者会上提到，由6月至今共有1662名警务人员及其亲友的资料被不当公开，并有人在网上煽动其他人进行违法行为，包括刑事恐吓、恶意滋扰警务人员及其家人、非法使用他人个人资料申请网上借贷等。近日甚至有人做出对警员子女进行伏击、泼漆等恶意行为。针对即将到来的新学期，警方表示针对威胁恐吓警员子女、公开学生资料的行为，制定了处理办法，教育局有接受投诉的机制，警署人事部门、服务科也有相应安排。</p><p>在30日的警署例行记者会上，央视记者追问这些恶意&ldquo;起底&rdquo;案件的调查情况，警方表示，网络犯罪与现实犯罪无异，对于此前发生的恶意&ldquo;起底&rdquo;警员信息的案件警方都在跟进调查当中。7月初至今，以香港警署网络安全调查科为首的调查行动已经进行了很多次，并且已经拘捕了15男4女，年龄在16-40岁之间。他们的罪名包括不诚实取用电脑、个人隐私条例下披露未经同意而取得个人资料、刑事恐吓、诈骗等。对于这些违法行为，警方一直在严肃跟进。（央视记者 李伟 &nbsp;孙继文 杨瑾）</p>', N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (70, 46, N'English', N'<p><img src="http://www.puwiremesh.com:2000/file/img/2019831-6a2c133cdedb4fe1b3a54966a9b8d84d.jpeg" style="width: 727px;" class="fr-fic fr-dib"></p><p>In response to a number of recent cases in Hong Kong in which police officers&#39;information was maliciously undermined and their families were intimidated, Hong Kong police said in response to a question from CCTV reporters on the 30th that 15 men and 4 women had been arrested for malicious undertaking, abusing other people&#39;s information and criminal intimidation.</p><p>At a regular press conference held on 29 June, the Hong Kong police said that 1662 police officers and their relatives and friends had been inappropriately disclosed, and that some people had incited others to commit illegal acts on the Internet, including criminal intimidation, malicious harassment of police officers and their families, illegal use of other people&#39;s personal data to apply for online lending, etc. In recent days, some people even made vicious acts such as ambushing and spraying paint on the children of police officers. In view of the coming new semester, the police said that in response to threats to the children of police officers and the disclosure of student information, they had formulated measures to deal with them. The Education Bureau had a mechanism to receive complaints, and the personnel department and Service Department of the police department had corresponding arrangements.</p><p>At a routine police press conference on the 30th, CCTV reporters questioned the investigation of these malicious &quot;bottom-up&quot; cases. The police said that cyber crime is no different from real crime. The police are following up the investigation of the previous malicious &quot;bottom-up&quot; police information cases. Since early July, investigations led by the Cyber Security Investigation Section of the Hong Kong Police Force have been carried out many times, and 15 men and 4 women, aged between 16 and 40, have been arrested. Their charges include dishonest access to computers, disclosure of unauthorized access to personal data under the privacy regulations, criminal intimidation, fraud and so on. The police have been seriously following up on these violations. (CCTV reporter Li Weisun Jiwen Yang Jin)</p>', N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (71, 47, N'Chinese', N'香港警方30日在回答央视记者提问时表示，已经有15男4女因为恶意起底、滥用他人信息、刑事恐吓而被拘捕。', N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (72, 47, N'English', N'Hong Kong police said in response to CCTV reporters''questions on the 30th that 15 men and 4 women had been arrested for malicious start-up, abuse of information from others and criminal intimidation.', N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (73, 48, N'Chinese', N'香港警方回应央视记者：已有19人因恶意“起底”警员信息等罪名被拘捕', N'', CAST(N'2019-08-31T20:04:55.240' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.240' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (74, 48, N'English', N'Hong Kong police responded to CCTV reporters: 19 people have been arrested for malicious "bottom-up" police information and other charges', N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (75, 49, N'Chinese', N'<p>这一幕被拍下没多久，昨晚，激进示威者在香港荃湾与警方发生冲突，危急之下，警察鸣枪一响自卫、随即&ldquo;拔枪&rdquo;的画面，又成了港媒报道的重中之重。</p><p>一些香港媒体和西方媒体如何在香港煽动民众情绪、片面报道和扭曲事实，我们之前也有过分析。这些人为何如此？</p><p>今天，我们请到了香港资深媒体人屈颖妍，请她谈谈自己的见闻和思考。</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-7bfc2d535c714f3c8b146903e5db0811.png" style="width: 300px;" class="fr-fic fr-dib"></p><p>港媒&ldquo;全方位、多角度&rdquo;拍摄的警察拔枪图</p><p>一</p><p>那天，香港一幅暴动现场的照片刷了屏：一名擎枪警察守在街角瞄准暴徒，但半百穿着反光背心的记者却拿着摄影机瞄准着他。</p><p>那是一个讽刺的画面，也是今日香港传媒生态的真实写照。</p><p>六月至今的每一场暴动，警察的目标从来都是暴徒，而记者的目标却永远指着警察。他们的镁光灯一直在等执法者开枪的一刻、发飊的一瞬、挥棍的一刹，哪管前文后理、前因后果，暴徒之暴可以视若无睹，警察之暴却不能错过。</p><p>昨天，终于让记者等到警察开枪的一幕，大家明明目击数百暴徒挥舞刀、棍、铁枝袭击6名警员，但在警察鸣枪一响自卫后，记者却把焦点转移，怒斥警员为什么开枪。再没人追究，这几百暴徒是如何欲把执法者置诸死地。</p><p>这几个月看香港的暴动视频，一定会让你衍生许多&ldquo;为什么&rdquo;：为什么暴徒前面总是挡着记者？为什么记者都在阻碍公务？为什么&ldquo;无冕之王&rdquo;可以恶成这样？......</p><p>每个官方记者会，都会看到记者对特首，对警队长官进行&ldquo;审犯式&rdquo;提问。有一回，&ldquo;香港电台&rdquo;记者利君雅问了特首：&ldquo;你晚上睡得着吗&rdquo;；问这种晦气问题的人，竟立即被捧为&ldquo;传媒良心&rdquo;，于是下回特首记者会又有人喊出过激的一问：&ldquo;林太，好多市民问你几时死呀？&rdquo;</p><p><br></p>', N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (76, 49, N'English', N'<p>Shortly after this scene was filmed, last night, radical demonstrators clashed with the police in Tsuen Wan, Hong Kong. In a critical situation, the picture of police shooting in self-defence and then &quot;pulling out guns&quot; became the top priority of Hong Kong media coverage.</p><p>How some Hong Kong and Western media incite public sentiment, one-sided reports and distort facts in Hong Kong has been analyzed before. Why are these people like this?</p><p>Today, we have invited Qu Yingyan, a senior media person in Hong Kong, to talk about her experiences and thoughts.</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-e8d45250bc55419b99c2a1e4c764218e.png" style="width: 300px;" class="fr-fic fr-dib"></p><p>Port Media&#39;s &quot;All-round, Multi-angle&quot; Picture of Police Drawing Guns</p><p><br></p><p>One</p><p><br></p><p>On that day, a picture of the scene of the riot in Hong Kong was painted on the screen: a policeman with a pistol was standing at the corner aiming at the mob, but half a hundred journalists in reflective vests were aiming at him with cameras.</p><p>It is a satirical picture and a true portrayal of the media ecology in Hong Kong today.</p><p>In every riot since June, the goal of the police has always been the mob, while the target of the journalist has always been the police. Their magnesia lamp has been waiting for the moment when the law enforcers shoot, the moment when they stumble, the moment when they swing a stick. Regardless of the context, the causes and consequences, the violence of the mob can be ignored, but the violence of the police can not be missed.</p><p>Yesterday, we finally let the reporters wait for the scene when the police opened fire. We clearly witnessed hundreds of mobs brandishing knives, sticks and iron sticks to attack six police officers, but after the police fired a gun in self-defence, the reporter turned the focus to blame the police officers for shooting. No one is going to find out how these hundreds of thugs tried to kill the law enforcers.</p><p>Watching riot videos in Hong Kong in recent months will surely give you a lot of &quot;why&quot;: why are there always journalists in front of the rioters? Why are journalists obstructing their official duties? Why can the &quot;uncrowned king&quot; be so vile? ...</p><p>Every official press conference will see reporters questioning the Chief Executive and the captain of the police. On one occasion, Radio Hong Kong reporter Le Junya asked the Chief Executive, &quot;Can you sleep at night&quot;. The person who asked such a bad question was immediately praised as &quot;media conscience&quot;. Then at the next CE press conference, someone shouted an excessive question: &quot;Lin Tai, when did many citizens ask you when you died?&quot;</p>', N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (77, 50, N'Chinese', N'这两天，一张“香港街头，只有他的‘镜头’对准暴徒”的照片，显示了香港近期动荡中一些媒体的真实面目。', N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (78, 50, N'English', N'In the past two days, a picture of "only his lens on the streets of Hong Kong is aimed at the mob" shows the true face of some media in the recent turbulence in Hong Kong.', N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (79, 51, N'Chinese', N'在香港，这些“记者”为何只把镜头对准警察、而非暴徒？', N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (80, 51, N'English', N'In Hong Kong, why do these "journalists" only focus on the police, not the rioters?', N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (81, 52, N'Chinese', N'<p><strong>赛前消息</strong></p><p><br></p><p>1.这是夏休期之前的最后一站比赛，在去年的匈牙利大奖赛中，梅赛德斯车队的汉密尔顿获得冠军。今年汉密尔顿已经提前锁定了半程冠军。</p><p>2.在周六进行的排位赛中，红牛车队的维斯塔潘以1分14秒572的成绩获得自己F1生涯的首个杆位，博塔斯和汉密尔顿分别排在第二和第三位。接下来依次是勒克莱尔、维特尔和加斯利。</p><p>3.今日亨格罗林赛道是多云天气，大气温度为25摄氏度，赛道温度为45摄氏度。</p>', N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (82, 52, N'English', N'<p><strong>Pre-competition news</strong></p><p><br></p><p>1. This is the last race before the summer break. In last year&#39;s Hungarian Grand Prix, Hamilton of Mercedes won the championship. Hamilton has already won the half-way championship ahead of schedule this year.</p><p>2. In the qualifying match on Saturday, Red Bull team&#39;s Vestapan won his first pole position in F1 career with a score of 1:14.572, while Botas and Hamilton ranked second and third respectively. Next came Le Claire, Vettel and Gasley.</p><p>3. Today&#39;s Hungaroring track is cloudy with atmospheric temperature of 25 degrees Celsius and track temperature of 45 degrees Celsius.</p>', N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (83, 53, N'Chinese', N'腾讯体育讯 北京时间8月4日消息，2019赛季F1匈牙利大奖赛今日进行了正赛的争夺。汉密尔顿倒数第四圈在赛道上强行超越维斯塔潘，最终带着冠军进入夏休期，维斯塔潘获得第二名。维特尔最后时刻超越队友勒克莱尔获得第三名，接下来依次是勒克莱尔、塞恩斯和加斯利。', N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (84, 53, N'English', N'Tencent Sports News Beijing time, August 4, news, the 2019 season F1 Hungarian Grand Prix today for the race. Hamilton overtook Vestapan on the track in the penultimate lap, eventually leading the champion to the summer break, and Vestapan came second. Vettel finished third after teammate Le Claire, followed by Le Claire, Saynes and Gasley.', N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (85, 54, N'Chinese', N'F1匈牙利站：汉密尔顿绝杀维斯塔潘夺冠 维特尔登领奖台', N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (86, 54, N'English', N'Formula 1 Hungary Station: Hamilton wins the championship by killing Vestapan and Vettelden receives the podium', N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (87, 55, N'Chinese', N'<p><img src="http://www.puwiremesh.com:2000/file/img/2019831-09e128ad2aae4bbab412d299b1ce98a2.jpg" style="width: 300px;" class="fr-fic fr-dib"></p><p style="text-align: center;"><strong>汉密尔顿撞车</strong></p><p>　　&nbsp; &nbsp; &nbsp; &nbsp; 2019年F1比利时站FP3在斯帕赛道进行。法拉利车队勒克莱尔最快，维特尔第二，梅赛德斯车队博塔斯第三，雷诺车队里卡多第四，红牛车队维斯塔潘第五。汉密尔顿失误撞车。</p><p>　　&nbsp; &nbsp; &nbsp; &nbsp; F1比利时站第3次练习赛成绩表：</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-15c9832468344025b59c7cdcec151e48.jpg" style="width: 300px;" class="fr-fic fr-dib"></p><p style="text-align: center;"><strong>F1比利时站第3次练习赛成绩表 </strong></p>', N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (88, 55, N'English', N'<p><img src="http://www.puwiremesh.com:2000/file/img/2019831-2d097d1542964006a3b5ff8c3efed8e2.jpg" style="width: 300px;" class="fr-fic fr-dib"></p><p style="text-align: center;"><strong>Hamilton Crash</strong></p><p>In 2019, F1 Belgium FP3 was held at Spa. Ferrari&#39;s Leclair is the fastest, Vettel&#39;s second, Mercedes&#39;Botas&#39; third, Renault&#39;s Ricardo&#39;s fourth and Red Bull&#39;s Vestapan&#39;s fifth. Hamilton crashed by mistake.</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-03130c7bae7140e8a5d626463f8d378c.jpg" style="width: 300px;" class="fr-fic fr-dib"></p><p style="text-align: center;"><strong>Formula 1 Belgium Station 3rd Practice Competition Score</strong></p>', N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (89, 56, N'Chinese', N'2019年F1比利时站FP3在斯帕赛道进行。法拉利车队勒克莱尔最快，维特尔第二，梅赛德斯车队博塔斯第三，雷诺车队里卡多第四，红牛车队维斯塔潘第五。汉密尔顿失误撞车。', N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (90, 56, N'English', N'In 2019, F1 Belgium FP3 was held at Spa. Ferrari''s Leclair is the fastest, Vettel''s second, Mercedes''Botas'' third, Renault''s Ricardo''s fourth and Red Bull''s Vestapan''s fifth. Hamilton crashed by mistake.', N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (91, 57, N'Chinese', N'F1比利时站FP3：法拉利再揽1-2 汉密尔顿撞车', N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (92, 57, N'English', N'F1 Belgian Station FP3: Ferrari hired another 1-2 Hamilton crash', N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (93, 58, N'Chinese', N'<p>目前，2020年F1越南站的门票预售已经开始。作为2020年F1赛季的第三站，越南站正赛将于2020年4月5日举行，4月4日进行排位赛。</p><p>据悉，F1越南站比赛将在河内市美亭国家体育场举行，赛道由现有市内道路和新建专用路段组成，全长约5.565公里，共含22个弯道。根据赛事主办方最新公布的赛历，2020年F1赛季将于3月15日在澳大利亚站拉开帷幕，11月29日在阿布扎比站收官，共22场比赛。（完）</p>', N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (94, 58, N'English', N'<p>At present, ticket pre-sale of F1 Vietnam Station has begun in 2020. As the third leg of the 2020 F1 season, the Vietnam Grand Prix will be held on April 5, 2020, and the qualifying will be held on April 4, 2020.</p><p>It is reported that the F1 Vietnam race will be held at Meiting National Stadium in Hanoi City. The race track is composed of existing urban roads and newly built special sections. The total length of the race is about 5.565 kilometers and contains 22 bends. According to the latest calendar released by the organizers, the 2020 F1 season will begin in Australia on March 15 and end in Abu Dhabi on November 29, totaling 22 games. (End)</p>', N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (95, 59, N'Chinese', N'新华社河内8月30日电 据外媒30日报道，世界一级方程式赛车（F1）越南大奖赛将于2020年4月5日在越南首都河内举行，这将是越南首次举办F1赛事。', N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (96, 59, N'English', N'Xinhua News Agency, Hanoi, August 30, according to foreign media reports on the 30th, World Formula One Racing (F1) Vietnam Grand Prix will be held in Hanoi, Vietnam''s capital, on April 5, 2020, which will be Vietnam''s first F1 race.', N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (97, 60, N'Chinese', N'2020年F1越南大奖赛定于4月5日举行', N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (98, 60, N'English', N'The 2020 Formula 1 Vietnam Grand Prix is scheduled to be held on April 5', N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (99, 61, N'Chinese', N'<p>他同时还指出，他认为10支车队的围场挺好的，HRT，马诺和Caterham这样的团队都失败了，所以F1只考虑顶尖团队，&ldquo;我们必然对于这么多人感兴趣感到惊讶。但我们必须告诉那些车队，让我们先搞定规则，稳定住形式。在一切妥当后，我们才考虑寻找其他车队。我想现在有10支车队，F1有10支健康车队实际上已经够了。如果我们有另外的车队加入，他们必须能让比赛更加精彩。&rdquo;</p><p>&ldquo;我们要从历史中学习，有些小车队来了又走，并不曾真正加入F1。所以我想我们必须稳定局势，之后看看是否给新车队以机会。&rdquo;</p><p>中游车队们也表达了宁缺毋滥的意见，雷诺说希望新车队能有很好的支持，可持续性的项目。小红牛车队认为12支车队的数目很好，&ldquo;但你永远不知道其他车队进展如何，所以能有多点赛车总是好事。&rdquo;</p><p>哈斯车队认为FOM需要首先照顾已经参赛的车队，赛点车队也要求FOM要谨慎，考虑到新车队对于F1奖金池的影响。</p><p>目前一支认真准备参赛的车队是名为Panthera Team Asia的车队，由前SMP车队的总经理运作，在银石设置了基地。</p><p>Tim Milne这位前马诺车队的技术人员担任首席空气动力师，项目的支持资金来自于亚洲，他们此前说目标是2021年加入F1。</p>', N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (100, 61, N'English', N'<p>He also pointed out that he thought the paddock of the 10 teams was good. Teams like HRT, Mano and Caterham all failed, so F1 only considered top teams. &quot;We must be surprised at how many people are interested. But we have to tell the teams that let&#39;s first work out the rules and stabilize the format. After all is in order, we will consider looking for other teams. I think there are 10 teams now and 10 healthy teams in F1 are actually enough. If we have another team to join, they have to make the game more exciting.</p><p>&quot;We have to learn from history. Some teams have come and gone and never really joined F1. So I think we have to stabilize the situation and see if we can give the new team a chance.</p><p>The midstream teams also expressed their preference for a more sustainable project, and Renault said he hoped the new team would have good support. The Red Bull team thinks the number of 12 teams is good, &quot;but you never know how other teams are going, so it&#39;s always good to have more cars.&quot;</p><p>Hass believes that FOM needs to take care of the teams already competing, and the team at the race point also requires FOM to be cautious, taking into account the impact of the new team on the F1 bonus pool.</p><p>At present, a team seriously preparing for the competition is called Panthera Team Asia, which is operated by the general manager of the former SMP team and has a base in Silverstone.</p><p>Tim Milne, a former Mano team technician and chief aerodynamist, was funded from Asia and had previously said that the goal was to join F1 in 2021.</p>', N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (101, 62, N'Chinese', N'虎扑8月31日讯 布朗在接受采访时说，他很惊讶有这么多团队对于进入F1感兴趣，但考虑到巨大的技术和运动规则改变要在2021年作出，他认为最好保持稳定，在2022年才考虑接纳新的车队。', N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (102, 62, N'English', N'In an interview on August 31, Brown said he was surprised that so many teams were interested in entering F1, but considering the huge technical and sporting changes to be made in 2021, he thought it would be better to remain stable and consider accepting new teams in 2022.', N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (103, 63, N'Chinese', N'新车队跃跃欲试，但F1在2022年前不予接受', N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (104, 63, N'English', N'New teams are eager to try, but F1 won''t be accepted until 2022.', N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (105, 64, N'Chinese', N'<p>&nbsp; &nbsp; &nbsp; &nbsp;&ldquo;我们重视与现有推广商的合作关系，但我们认为，为我们的车迷和体育事业的发展增加令人兴奋的新地点，并在有限水平内管理好客户的流失，这一点非常重要。&rdquo;</p><p>　　&ldquo;我们有幸拥有比供应更多的需求，但我们认识到我们需要以一种深思熟虑的方式来管理这种现状。&rdquo;</p><p>　　&ldquo;我们在决定一场比赛时考虑的因素包括：伟大比赛的赛道质量，以及吸引世界想象力的位置；主办城市和国家的车迷水平、更广泛的支持和热情；赛道和比赛的历史重要性和未来潜力；日程的全球平衡；以及其他一些因素。&rdquo;</p><p>　　&ldquo;我们显然在2020年有超过21个比赛的需求，并且预计2020年后一年内的比赛数量将略有增加。然而，我们要确保最大限度地为体育运动和车迷提供机会，而不是急于做出决定。&rdquo;</p><p>　　&ldquo;我们相信，赛历的有限扩展和客户流失对于为粉丝和我们的持续发展创造一个新鲜和令人兴奋的动态非常重要。&rdquo;</p>', N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (106, 64, N'English', N'<p>&nbsp; &nbsp; &nbsp; &nbsp; &quot;We value the partnership with existing promoters, but we think it is very important to add exciting new locations for the development of our fans and sports industry and manage the loss of customers at a limited level.&quot;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &quot;We are fortunate to have more demand than supply, but we recognize that we need to manage this situation in a deliberate way.&quot;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &quot;The factors we consider when deciding on a race include the quality of the track for a great race and the position that attracts the imagination of the world; the level of fans in host cities and countries, wider support and enthusiasm; the historical importance and future potential of the track and race; the global balance of the schedule; and other factors.&quot;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &quot;We obviously have more than 21 games in 2020, and we expect a slight increase in the number of games in the year after 2020. However, we need to ensure that we maximize opportunities for sports and fans, rather than rushing to make decisions.</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &quot;We believe that the limited expansion of the calendar and the loss of customers are very important to create a fresh and exciting dynamic for our fans and our continued development.&quot;</p>', N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (107, 65, N'Chinese', N'一级方程式赛车的首席执行官蔡斯·凯里预计明年的赛程将稳定保持21场比赛，但将有两个新赛事取代现有的比赛场地。', N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (108, 65, N'English', N'Formula One chief executive, Chase Kerry, expects to maintain a steady schedule of 21 races next year, but two new races will replace the existing venues.', N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (109, 66, N'Chinese', N'自由媒体：F1赛历明年21站 后年将超过21站', N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (110, 66, N'English', N'Free Media: The Formula 1 calendar will exceed 21 stations in the next 21 races', N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (111, 70, N'Chinese', N'<p>随便测试随便测试随便测试随便测试随便测试</p><p><img src="http://www.puwiremesh.com:2000/file/img/201991-7a2b2492706d4877963da996eddf89aa.jpg" style="width: 300px;" class="fr-fic fr-dii"></p><p>随便测试随便测试随便测试随便测试随便测试随便测试</p>', N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
GO
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (112, 70, N'English', N'<p>testtesttesttesttesttesttesttesttest</p><p><img src="http://www.puwiremesh.com:2000/file/img/201991-a95c471780264c449b74f720729667d6.jpg" style="width: 300px;" class="fr-fic fr-dii"></p><p>testtesttesttesttesttesttest</p>', N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (113, 71, N'Chinese', N'随便测试随便测试随便测试随便测试', N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (114, 71, N'English', N'testtesttest', N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (115, 72, N'Chinese', N'随便测试', N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (116, 72, N'English', N'test', N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (117, 73, N'Chinese', N'应用2', N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime), N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (118, 73, N'English', N'Example2', N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime), N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (119, 74, N'Chinese', N'洁柔应用1洁柔应用1洁柔应用1', N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime), N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (120, 74, N'English', N'C&S Example 1C&S Example 1C&S Example 1', N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime), N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (121, 75, N'Chinese', N'书本', N'', CAST(N'2019-09-01T14:33:30.297' AS DateTime), N'', CAST(N'2019-09-01T14:33:30.297' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (122, 75, N'English', N'Book', N'', CAST(N'2019-09-01T14:33:30.297' AS DateTime), N'', CAST(N'2019-09-01T14:33:30.297' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (123, 76, N'Chinese', N'花', N'', CAST(N'2019-09-01T14:33:55.860' AS DateTime), N'', CAST(N'2019-09-01T14:33:55.860' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (124, 76, N'English', N'flower', N'', CAST(N'2019-09-01T14:33:55.860' AS DateTime), N'', CAST(N'2019-09-01T14:33:55.860' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (125, 77, N'Chinese', N'F1', N'', CAST(N'2019-09-01T14:34:10.273' AS DateTime), N'', CAST(N'2019-09-01T14:34:10.273' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (126, 77, N'English', N'F1', N'', CAST(N'2019-09-01T14:34:10.273' AS DateTime), N'', CAST(N'2019-09-01T14:34:10.273' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (127, 78, N'Chinese', N'<p>法拉利</p><p><img src="http://www.puwiremesh.com:2000/file/img/201991-844802a9680f43eeb50360459141b31b.jpg" style="width: 300px;" class="fr-fic fr-dii"></p>', N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime), N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (128, 78, N'English', N'<p>ferrari</p><p><img src="http://www.puwiremesh.com:2000/file/img/201991-59cdf2399b2e4686a77aa03a38c014cd.jpg" style="width: 300px;" class="fr-fic fr-dii"></p>', N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime), N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (129, 79, N'Chinese', N'法拉利', N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime), N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (130, 79, N'English', N'ferrari', N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime), N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (131, 80, N'Chinese', N'<p>语文</p>', N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime), N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (132, 80, N'English', N'<p>YuWen</p>', N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime), N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (133, 81, N'Chinese', N'语文', N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime), N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (134, 81, N'English', N'YuWen', N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime), N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (135, 82, N'Chinese', N'语文', N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime), N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (136, 82, N'English', N'YuWen', N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime), N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (137, 83, N'Chinese', N'<p>玫瑰</p>', N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime), N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (138, 83, N'English', N'<p>Rose</p>', N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime), N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (139, 84, N'Chinese', N'玫瑰', N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime), N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (140, 84, N'English', N'Rose', N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime), N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (141, 85, N'Chinese', N'玫瑰', N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime), N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (142, 85, N'English', N'Rose', N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime), N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (143, 86, N'Chinese', N'法拉利', N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime), N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (144, 86, N'English', N'ferrari', N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime), N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (145, 87, N'Chinese', N'<p>123</p>', N'', CAST(N'2019-09-01T15:10:51.520' AS DateTime), N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (146, 87, N'English', N'<p>123</p>', N'', CAST(N'2019-09-01T15:10:51.520' AS DateTime), N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (147, 88, N'Chinese', N'123', N'', CAST(N'2019-09-01T15:10:51.517' AS DateTime), N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (148, 88, N'English', N'123', N'', CAST(N'2019-09-01T15:10:51.520' AS DateTime), N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (149, 89, N'Chinese', N'123', N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime), N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (150, 89, N'English', N'123', N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime), N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (151, 90, N'Chinese', N'<p>234</p>', N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (152, 90, N'English', N'<p>234</p>', N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (153, 91, N'Chinese', N'234', N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (154, 91, N'English', N'234', N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (155, 92, N'Chinese', N'234', N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (156, 92, N'English', N'234', N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (157, 93, N'Chinese', N'<p>345</p>', N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (158, 93, N'English', N'<p>345</p>', N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (159, 94, N'Chinese', N'345', N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (160, 94, N'English', N'345', N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (161, 95, N'Chinese', N'345', N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (162, 95, N'English', N'345', N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (163, 96, N'Chinese', N'345', N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime), N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (164, 96, N'English', N'345', N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime), N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (165, 97, N'Chinese', N'<p>456</p>', N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (166, 97, N'English', N'<p>456</p>', N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (167, 98, N'Chinese', N'456', N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (168, 98, N'English', N'456', N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (169, 99, N'Chinese', N'456', N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (170, 99, N'English', N'456', N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (171, 100, N'Chinese', N'<p>567</p>', N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (172, 100, N'English', N'<p>567</p>', N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (173, 101, N'Chinese', N'567', N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (174, 101, N'English', N'567', N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (175, 102, N'Chinese', N'567', N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (176, 102, N'English', N'567', N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (177, 103, N'Chinese', N'<p>678</p>', N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (178, 103, N'English', N'<p>678</p>', N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (179, 104, N'Chinese', N'678', N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (180, 104, N'English', N'678', N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (181, 105, N'Chinese', N'678', N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (182, 105, N'English', N'678', N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (183, 106, N'Chinese', N'<p>789</p>', N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (184, 106, N'English', N'<p>789</p>', N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (185, 107, N'Chinese', N'789', N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (186, 107, N'English', N'789', N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (187, 108, N'Chinese', N'789', N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (188, 108, N'English', N'789', N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (189, 109, N'Chinese', N'<p>890</p>', N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (190, 109, N'English', N'<p>890</p>', N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (191, 110, N'Chinese', N'890', N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (192, 110, N'English', N'890', N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (193, 111, N'Chinese', N'890', N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (194, 111, N'English', N'890', N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (195, 112, N'Chinese', N'F1应用', N'', CAST(N'2019-09-01T17:29:17.853' AS DateTime), N'', CAST(N'2019-09-01T17:29:17.853' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (196, 112, N'English', N'F1 Example', N'', CAST(N'2019-09-01T17:29:17.853' AS DateTime), N'', CAST(N'2019-09-01T17:29:17.853' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (197, 113, N'Chinese', N'<p>法拉利法拉利法拉利法拉利法拉利法拉利</p><p>法拉利法拉利法拉利法拉利<img src="http://www.puwiremesh.com:2000/file/img/201991-dc085cc7dfaa41d694b96f7c593373f7.jpg" style="width: 300px;" class="fr-fic fr-dii"></p><p>法拉利法拉利法拉利法拉利法拉利法拉利法拉利</p>', N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (198, 113, N'English', N'<p>FerrariFerrariFerrariFerrari</p><p><img src="http://www.puwiremesh.com:2000/file/img/201991-2cd08ab47407426d8c9a2616c762174c.jpg" style="width: 300px;" class="fr-fic fr-dii"></p><p>FerrariFerrariFerrariFerrari</p>', N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (199, 114, N'Chinese', N'法拉利', N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (200, 114, N'English', N'Ferrari', N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (201, 115, N'Chinese', N'法拉利', N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (202, 115, N'English', N'Ferrari', N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (203, 116, N'Chinese', N'<p><strong>赛前消息</strong></p><p><br></p><p>1.这是夏休期之前的最后一站比赛，在去年的匈牙利大奖赛中，梅赛德斯车队的汉密尔顿获得冠军。今年汉密尔顿已经提前锁定了半程冠军。</p><p>2.在周六进行的排位赛中，红牛车队的维斯塔潘以1分14秒572的成绩获得自己F1生涯的首个杆位，博塔斯和汉密尔顿分别排在第二和第三位。接下来依次是勒克莱尔、维特尔和加斯利。</p><p>3.今日亨格罗林赛道是多云天气，大气温度为25摄氏度，赛道温度为45摄氏度。</p>', N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (204, 116, N'English', N'<p><strong>Pre-competition news</strong></p><p><br></p><p>1. This is the last race before the summer break. In last year&#39;s Hungarian Grand Prix, Hamilton of Mercedes won the championship. Hamilton has already won the half-way championship ahead of schedule this year.</p><p>2. In the qualifying match on Saturday, Red Bull team&#39;s Vestapan won his first pole position in F1 career with a score of 1:14.572, while Botas and Hamilton ranked second and third respectively. Next came Le Claire, Vettel and Gasley.</p><p>3. Today&#39;s Hungaroring track is cloudy with atmospheric temperature of 25 degrees Celsius and track temperature of 45 degrees Celsius.</p>', N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (205, 117, N'Chinese', N'腾讯体育讯 北京时间8月4日消息，2019赛季F1匈牙利大奖赛今日进行了正赛的争夺。汉密尔顿倒数第四圈在赛道上强行超越维斯塔潘，最终带着冠军进入夏休期，维斯塔潘获得第二名。维特尔最后时刻超越队友勒克莱尔获得第三名，接下来依次是勒克莱尔、塞恩斯和加斯利。', N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (206, 117, N'English', N'Tencent Sports News Beijing time, August 4, news, the 2019 season F1 Hungarian Grand Prix today for the race. Hamilton overtook Vestapan on the track in the penultimate lap, eventually leading the champion to the summer break, and Vestapan came second. Vettel finished third after teammate Le Claire, followed by Le Claire, Saynes and Gasley.', N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (207, 118, N'Chinese', N'F1匈牙利站：汉密尔顿绝杀维斯塔潘夺冠 维特尔登领奖台', N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (208, 118, N'English', N'Formula 1 Hungary Station: Hamilton wins the championship by killing Vestapan and Vettelden receives the podium', N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (209, 119, N'Chinese', N'<p style="text-align: center;"><img data-fr-image-pasted="true" src="http://www.puwiremesh.com:2000/file/img/2019831-09e128ad2aae4bbab412d299b1ce98a2.jpg" class="fr-fic fr-dii"></p><p><strong>汉密尔顿撞车</strong></p><p>　　 &nbsp; &nbsp; &nbsp; &nbsp;2019年F1比利时站FP3在斯帕赛道进行。法拉利车队勒克莱尔最快，维特尔第二，梅赛德斯车队博塔斯第三，雷诺车队里卡多第四，红牛车队维斯塔潘第五。汉密尔顿失误撞车。</p><p>　　 &nbsp; &nbsp; &nbsp; &nbsp;F1比利时站第3次练习赛成绩表：</p><p style="text-align: center;"><img data-fr-image-pasted="true" src="http://www.puwiremesh.com:2000/file/img/2019831-15c9832468344025b59c7cdcec151e48.jpg" class="fr-fic fr-dii"></p><p><strong>F1比利时站第3次练习赛成绩表</strong></p>', N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (210, 119, N'English', N'<p><img src="http://www.puwiremesh.com:2000/file/img/2019831-2d097d1542964006a3b5ff8c3efed8e2.jpg" style="width: 300px;" class="fr-fic fr-dib"></p><p style="text-align: center;"><strong>Hamilton Crash</strong></p><p>In 2019, F1 Belgium FP3 was held at Spa. Ferrari&#39;s Leclair is the fastest, Vettel&#39;s second, Mercedes&#39;Botas&#39; third, Renault&#39;s Ricardo&#39;s fourth and Red Bull&#39;s Vestapan&#39;s fifth. Hamilton crashed by mistake.</p><p><img src="http://www.puwiremesh.com:2000/file/img/2019831-03130c7bae7140e8a5d626463f8d378c.jpg" style="width: 300px;" class="fr-fic fr-dib"></p><p style="text-align: center;"><strong>Formula 1 Belgium Station 3rd Practice Competition Score</strong></p>', N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (211, 120, N'Chinese', N'2019年F1比利时站FP3在斯帕赛道进行。法拉利车队勒克莱尔最快，维特尔第二，梅赛德斯车队博塔斯第三，雷诺车队里卡多第四，红牛车队维斯塔潘第五。汉密尔顿失误撞车。', N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
GO
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (212, 120, N'English', N'In 2019, F1 Belgium FP3 was held at Spa. Ferrari''s Leclair is the fastest, Vettel''s second, Mercedes''Botas'' third, Renault''s Ricardo''s fourth and Red Bull''s Vestapan''s fifth. Hamilton crashed by mistake.', N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (213, 121, N'Chinese', N'F1比利时站FP3：法拉利再揽1-2 汉密尔顿撞车', N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
INSERT [dbo].[T_System_LanguageContent] ([ID], [RelationId], [LanguageType], [DisplayContent], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedTime]) VALUES (214, 121, N'English', N'F1 Belgian Station FP3: Ferrari hired another 1-2 Hamilton crash', N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_System_LanguageContent] OFF
SET IDENTITY_INSERT [dbo].[T_System_LanguageRelation] ON 

INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (1, N'', CAST(N'2019-07-18T18:00:48.607' AS DateTime), N'', CAST(N'2019-07-18T18:00:48.607' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (2, N'', CAST(N'2019-07-18T18:03:35.057' AS DateTime), N'', CAST(N'2019-07-18T18:03:35.057' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (3, N'', CAST(N'2019-07-18T18:04:12.413' AS DateTime), N'', CAST(N'2019-07-18T18:04:12.413' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (11, N'', CAST(N'2019-08-17T10:42:12.363' AS DateTime), N'', CAST(N'2019-08-17T10:42:12.363' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (12, N'', CAST(N'2019-08-17T11:43:50.777' AS DateTime), N'', CAST(N'2019-08-17T11:43:50.777' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (13, N'', CAST(N'2019-08-17T12:22:40.607' AS DateTime), N'', CAST(N'2019-08-17T12:22:40.607' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (14, N'', CAST(N'2019-08-17T12:22:40.607' AS DateTime), N'', CAST(N'2019-08-17T12:22:40.607' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (16, N'', CAST(N'2019-08-17T15:12:31.200' AS DateTime), N'', CAST(N'2019-08-17T15:12:31.200' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (17, N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime), N'', CAST(N'2019-08-17T15:30:37.883' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (18, N'', CAST(N'2019-08-17T15:30:37.880' AS DateTime), N'', CAST(N'2019-08-17T15:30:37.880' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (19, N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime), N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (20, N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime), N'', CAST(N'2019-08-17T15:33:08.173' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (21, N'', CAST(N'2019-08-20T20:14:51.813' AS DateTime), N'', CAST(N'2019-08-20T20:14:51.813' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (22, N'', CAST(N'2019-08-25T11:36:31.053' AS DateTime), N'', CAST(N'2019-08-25T11:36:31.053' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (23, N'', CAST(N'2019-08-25T11:37:16.400' AS DateTime), N'', CAST(N'2019-08-25T11:37:16.400' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (24, N'', CAST(N'2019-08-25T12:08:02.737' AS DateTime), N'', CAST(N'2019-08-25T12:08:02.737' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (25, N'', CAST(N'2019-08-25T12:08:02.737' AS DateTime), N'', CAST(N'2019-08-25T12:08:02.737' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (26, N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime), N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (27, N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime), N'', CAST(N'2019-08-25T12:17:08.093' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (28, N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (29, N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.443' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (30, N'', CAST(N'2019-08-31T11:55:38.440' AS DateTime), N'', CAST(N'2019-08-31T11:55:38.440' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (31, N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (32, N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (33, N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime), N'', CAST(N'2019-08-31T11:56:47.437' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (34, N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime), N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (35, N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime), N'', CAST(N'2019-08-31T17:30:17.193' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (36, N'', CAST(N'2019-08-31T17:37:19.933' AS DateTime), N'', CAST(N'2019-08-31T17:37:19.933' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (46, N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (47, N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.243' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (48, N'', CAST(N'2019-08-31T20:04:55.237' AS DateTime), N'', CAST(N'2019-08-31T20:04:55.237' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (49, N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (50, N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (51, N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime), N'', CAST(N'2019-08-31T20:09:07.200' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (52, N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (53, N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (54, N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime), N'', CAST(N'2019-08-31T20:12:11.790' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (55, N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (56, N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (57, N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime), N'', CAST(N'2019-08-31T20:15:27.893' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (58, N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (59, N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (60, N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime), N'', CAST(N'2019-08-31T20:17:24.437' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (61, N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (62, N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (63, N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime), N'', CAST(N'2019-08-31T20:18:47.730' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (64, N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (65, N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (66, N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime), N'', CAST(N'2019-08-31T20:21:04.973' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (70, N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (71, N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (72, N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime), N'', CAST(N'2019-09-01T11:47:21.663' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (73, N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime), N'', CAST(N'2019-09-01T11:47:59.117' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (74, N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime), N'', CAST(N'2019-09-01T11:48:11.043' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (75, N'', CAST(N'2019-09-01T14:33:30.293' AS DateTime), N'', CAST(N'2019-09-01T14:33:30.293' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (76, N'', CAST(N'2019-09-01T14:33:55.860' AS DateTime), N'', CAST(N'2019-09-01T14:33:55.860' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (77, N'', CAST(N'2019-09-01T14:34:10.273' AS DateTime), N'', CAST(N'2019-09-01T14:34:10.273' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (78, N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime), N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (79, N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime), N'', CAST(N'2019-09-01T14:35:23.107' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (80, N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime), N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (81, N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime), N'', CAST(N'2019-09-01T14:36:18.747' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (82, N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime), N'', CAST(N'2019-09-01T14:36:30.177' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (83, N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime), N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (84, N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime), N'', CAST(N'2019-09-01T14:36:59.093' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (85, N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime), N'', CAST(N'2019-09-01T14:37:08.443' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (86, N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime), N'', CAST(N'2019-09-01T15:04:46.277' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (87, N'', CAST(N'2019-09-01T15:10:51.520' AS DateTime), N'', CAST(N'2019-09-01T15:10:51.520' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (88, N'', CAST(N'2019-09-01T15:10:51.517' AS DateTime), N'', CAST(N'2019-09-01T15:10:51.517' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (89, N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime), N'', CAST(N'2019-09-01T15:11:44.607' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (90, N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (91, N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (92, N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime), N'', CAST(N'2019-09-01T15:12:12.247' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (93, N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (94, N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (95, N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime), N'', CAST(N'2019-09-01T15:12:29.610' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (96, N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime), N'', CAST(N'2019-09-01T15:12:31.473' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (97, N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (98, N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (99, N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime), N'', CAST(N'2019-09-01T15:12:47.820' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (100, N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (101, N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (102, N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime), N'', CAST(N'2019-09-01T15:13:05.080' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (103, N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (104, N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (105, N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime), N'', CAST(N'2019-09-01T15:13:20.543' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (106, N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (107, N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (108, N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime), N'', CAST(N'2019-09-01T15:13:37.680' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (109, N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (110, N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (111, N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime), N'', CAST(N'2019-09-01T15:13:56.027' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (112, N'', CAST(N'2019-09-01T17:29:17.853' AS DateTime), N'', CAST(N'2019-09-01T17:29:17.853' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (113, N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (114, N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (115, N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime), N'', CAST(N'2019-09-01T17:30:56.677' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (116, N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (117, N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (118, N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime), N'', CAST(N'2019-09-01T17:32:58.340' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (119, N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
GO
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (120, N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
INSERT [dbo].[T_System_LanguageRelation] ([ID], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (121, N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime), N'', CAST(N'2019-09-01T17:34:07.233' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_System_LanguageRelation] OFF
SET IDENTITY_INSERT [dbo].[T_System_Menu] ON 

INSERT [dbo].[T_System_Menu] ([ID], [ParentId], [Code], [Name], [Url], [Seq], [LanguageRelationId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (1, 9, N'ProductGroup', N'商品分组', N'/Product/ProductGroup/Index', 1, NULL, 0, N'-1', CAST(N'2019-08-17T00:00:00.000' AS DateTime), N'-1', CAST(N'2019-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[T_System_Menu] ([ID], [ParentId], [Code], [Name], [Url], [Seq], [LanguageRelationId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (5, 9, N'Product', N'商品', N'/Product/Product/Index', 2, NULL, 0, N'-1', CAST(N'2019-08-17T00:00:00.000' AS DateTime), N'-1', CAST(N'2019-08-17T00:00:00.000' AS DateTime))
INSERT [dbo].[T_System_Menu] ([ID], [ParentId], [Code], [Name], [Url], [Seq], [LanguageRelationId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (6, 9, N'New', N'新闻管理', N'/News/New/Index', 5, NULL, 0, N'-1', CAST(N'2019-08-17T09:55:07.927' AS DateTime), N'-1', CAST(N'2019-08-17T09:55:07.927' AS DateTime))
INSERT [dbo].[T_System_Menu] ([ID], [ParentId], [Code], [Name], [Url], [Seq], [LanguageRelationId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (7, 9, N'New', N'公告管理', N'/News/Announcement/Index', 6, NULL, 0, N'-1', CAST(N'2019-08-17T09:55:39.857' AS DateTime), N'-1', CAST(N'2019-08-17T09:55:39.857' AS DateTime))
INSERT [dbo].[T_System_Menu] ([ID], [ParentId], [Code], [Name], [Url], [Seq], [LanguageRelationId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (9, 0, N'BusinessManagement', N'业务管理', N'', 1, NULL, 0, N'-1', CAST(N'2019-08-17T09:57:44.983' AS DateTime), N'-1', CAST(N'2019-08-17T09:57:44.983' AS DateTime))
INSERT [dbo].[T_System_Menu] ([ID], [ParentId], [Code], [Name], [Url], [Seq], [LanguageRelationId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (10, 9, N'ExampleGroup', N'应用分组', N'/Product/ExampleGroup/Index', 3, NULL, 0, N'-1', CAST(N'2019-08-25T12:04:14.980' AS DateTime), N'-1', CAST(N'2019-08-25T12:04:14.980' AS DateTime))
INSERT [dbo].[T_System_Menu] ([ID], [ParentId], [Code], [Name], [Url], [Seq], [LanguageRelationId], [IsDeleted], [CreatedBy], [CreatedTime], [LastUpdatedBy], [LastUpdatedDate]) VALUES (11, 9, N'Example', N'应用', N'/Product/Example/Index', 4, NULL, 0, N'-1', CAST(N'2019-08-25T12:04:14.983' AS DateTime), N'-1', CAST(N'2019-08-25T12:04:14.983' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_System_Menu] OFF
ALTER TABLE [dbo].[T_Pro_Product]  WITH CHECK ADD  CONSTRAINT [FK_T_Pro_Product_T_Pro_ProductGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[T_Pro_ProductGroup] ([ID])
GO
ALTER TABLE [dbo].[T_Pro_Product] CHECK CONSTRAINT [FK_T_Pro_Product_T_Pro_ProductGroup]
GO
ALTER TABLE [dbo].[T_System_LanguageContent]  WITH CHECK ADD  CONSTRAINT [FK_T_System_LanguageContent_T_System_LanguageRelation] FOREIGN KEY([RelationId])
REFERENCES [dbo].[T_System_LanguageRelation] ([ID])
GO
ALTER TABLE [dbo].[T_System_LanguageContent] CHECK CONSTRAINT [FK_T_System_LanguageContent_T_System_LanguageRelation]
GO
ALTER TABLE [dbo].[T_System_Menu]  WITH CHECK ADD  CONSTRAINT [FK_T_System_Menu_T_System_LanguageRelation] FOREIGN KEY([LanguageRelationId])
REFERENCES [dbo].[T_System_LanguageRelation] ([ID])
GO
ALTER TABLE [dbo].[T_System_Menu] CHECK CONSTRAINT [FK_T_System_Menu_T_System_LanguageRelation]
GO
USE [master]
GO
ALTER DATABASE [antmgr] SET  READ_WRITE 
GO

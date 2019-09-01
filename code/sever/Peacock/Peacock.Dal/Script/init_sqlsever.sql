
insert into T_System_Menu(ParentId,Code,Name,Url,Seq,LanguageRelationId,IsDeleted,CreatedBy,CreatedTime,LastUpdatedBy,LastUpdatedDate)
values(0,'New','新闻管理','/News/New/Index',3,null,0,-1,GETDATE(),-1,GETDATE());

insert into T_System_Menu(ParentId,Code,Name,Url,Seq,LanguageRelationId,IsDeleted,CreatedBy,CreatedTime,LastUpdatedBy,LastUpdatedDate)
values(0,'New','公告管理','/News/Announcement/Index',3,null,0,-1,GETDATE(),-1,GETDATE());

insert into T_System_Menu(ParentId,Code,Name,Url,Seq,LanguageRelationId,IsDeleted,CreatedBy,CreatedTime,LastUpdatedBy,LastUpdatedDate)
values(0,'BUsinessManagement','业务管理','',1,null,0,-1,GETDATE(),-1,GETDATE());


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
) ON [PRIMARY]
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

CREATE TABLE [dbo].T_Company(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	OrderId int null,
	TitleLanguageId int null,
	IntroductionLanguageId int null,
	[Content] TEXT NULL,
	ContentLanguageId [int] NULL,
	ImgPath [nvarchar](500) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].T_Evaluation(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(20) NOT NULL,
	[Tel] nvarchar(20) null,
	[Content] TEXT NULL,
	[Email] nvarchar(100) NULL,
	[OtherContact] [nvarchar](500) NOT NULL,
	[IpAddress] nvarchar(50) NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[LastUpdatedBy] [nvarchar](50) NOT NULL,
	[LastUpdatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Evaluation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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


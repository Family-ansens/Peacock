
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
	[TitleLanguageId] [int] NULL,
	[ContentLanguageId] [int] NULL,
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



USE [TMSLive]
GO
/****** Object:  Table [dbo].[AddressBook]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressBook](
	[id] [uniqueidentifier] NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Archive]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Archive](
	[archivedId] [uniqueidentifier] NOT NULL,
	[leadId] [uniqueidentifier] NULL,
	[archivedStatusTypeId] [int] NULL,
	[archivedReason] [nvarchar](500) NULL,
	[createdBy] [uniqueidentifier] NULL,
	[createdDate] [datetime] NULL,
	[modifiedBy] [uniqueidentifier] NULL,
	[modifiedDate] [datetime] NULL,
	[isactive] [bit] NULL,
 CONSTRAINT [PK_tbl_Archive] PRIMARY KEY CLUSTERED 
(
	[archivedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ArchivedStatusMaster]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ArchivedStatusMaster](
	[archivedStatusTypeId] [int] IDENTITY(1,1) NOT NULL,
	[archivedStatusName] [nvarchar](50) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_tbl_archivedMaster] PRIMARY KEY CLUSTERED 
(
	[archivedStatusTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Area]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Area](
	[AreaId] [uniqueidentifier] NOT NULL,
	[AreaName] [nvarchar](800) NULL,
	[LeadId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Area] PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Contact]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Contact](
	[ContactId] [uniqueidentifier] NOT NULL,
	[ContactName] [nvarchar](800) NULL,
	[ContactDesignation] [nvarchar](800) NULL,
	[ContactEmail] [nvarchar](800) NULL,
	[ContactPhone] [nvarchar](50) NULL,
	[ContactAddress] [nvarchar](max) NULL,
	[ContactOrg] [nvarchar](800) NULL,
	[LeadId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Files]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Files](
	[FileId] [uniqueidentifier] NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[FilePath] [nvarchar](max) NULL,
	[LeadId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Files] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LeadAccess]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_LeadAccess](
	[AccessID] [uniqueidentifier] NOT NULL,
	[LeadId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_tbl_LeadAccess] PRIMARY KEY CLUSTERED 
(
	[AccessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Leads]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Leads](
	[LeadId] [uniqueidentifier] NOT NULL,
	[LeadName] [nvarchar](max) NULL,
	[LeadValue] [decimal](18, 0) NULL,
	[AssignUser] [uniqueidentifier] NULL,
	[PipeId] [uniqueidentifier] NULL,
	[StageId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[OrgId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Leads] PRIMARY KEY CLUSTERED 
(
	[LeadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Notes]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Notes](
	[NoteId] [uniqueidentifier] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[LeadId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Notes] PRIMARY KEY CLUSTERED 
(
	[NoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Organization]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Organization](
	[OrgID] [uniqueidentifier] NOT NULL,
	[OrgName] [nvarchar](800) NULL,
	[UserLimit] [int] NULL,
	[LeadLimit] [int] NULL,
	[StroageLimit] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
	[CreatedEmail] [nvarchar](800) NULL,
	[Isactive] [bit] NULL,
 CONSTRAINT [PK_tbl_Organization_1] PRIMARY KEY CLUSTERED 
(
	[OrgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_PipeLine]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_PipeLine](
	[PipeID] [uniqueidentifier] NOT NULL,
	[PipeName] [nvarchar](800) NULL,
	[IsActive] [bit] NULL,
	[IsDefault] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[OrgId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_PipeLine] PRIMARY KEY CLUSTERED 
(
	[PipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](800) NULL,
	[ProductPrice] [decimal](18, 0) NULL,
	[ProductDiscount] [decimal](18, 0) NULL,
	[DiscountPercentage] [float] NULL,
	[ProductDiscountPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[LeadId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Role](
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[OrgId] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Source]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Source](
	[SourceId] [uniqueidentifier] NOT NULL,
	[SourceName] [nvarchar](800) NULL,
	[LeadId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Source] PRIMARY KEY CLUSTERED 
(
	[SourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Stage]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Stage](
	[StageId] [uniqueidentifier] NOT NULL,
	[StageName] [nvarchar](800) NULL,
	[SequenceNumber] [int] NULL,
	[PipeID] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Stage] PRIMARY KEY CLUSTERED 
(
	[StageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Tag]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Tag](
	[TagId] [uniqueidentifier] NOT NULL,
	[TagName] [nvarchar](800) NULL,
	[TagColor] [nvarchar](20) NULL,
	[IsActive] [bit] NULL,
	[PipeId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Tag] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Todo]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Todo](
	[TodoId] [uniqueidentifier] NOT NULL,
	[TodoName] [nvarchar](800) NULL,
	[TodoDate] [date] NULL,
	[TodoTime] [nvarchar](10) NULL,
	[TodoType] [nvarchar](50) NULL,
	[LeadId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
	[TodoStatus] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreateBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Todo] PRIMARY KEY CLUSTERED 
(
	[TodoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TodoStatus]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TodoStatus](
	[TodoStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_TodoStatus] PRIMARY KEY CLUSTERED 
(
	[TodoStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[RoleID] [uniqueidentifier] NULL,
	[Password] [nvarchar](800) NULL,
	[IsActive] [bit] NULL,
	[BioPic] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[OrgId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AddressBook] ([id], [name]) VALUES (N'10ceec54-f573-4a84-b5ab-a1131c7ebb56', N'test')
GO
INSERT [dbo].[AddressBook] ([id], [name]) VALUES (N'f488a8c0-b0e5-446a-9c2b-4cb6c9039dd5', N'test')
GO
SET IDENTITY_INSERT [dbo].[tbl_ArchivedStatusMaster] ON 
GO
INSERT [dbo].[tbl_ArchivedStatusMaster] ([archivedStatusTypeId], [archivedStatusName], [isActive]) VALUES (1, N'Won', 1)
GO
INSERT [dbo].[tbl_ArchivedStatusMaster] ([archivedStatusTypeId], [archivedStatusName], [isActive]) VALUES (2, N'Lost', 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_ArchivedStatusMaster] OFF
GO
INSERT [dbo].[tbl_Area] ([AreaId], [AreaName], [LeadId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'bdab9021-6293-43d1-ac8c-30031bc99036', N'New sargasan , Gandhinagar', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, CAST(N'2020-11-13T13:17:23.280' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Area] ([AreaId], [AreaName], [LeadId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'84ea6eac-2309-4e11-b6c7-549a06c8da87', N'sdfdsfdsfdsf', N'acd8b999-8eb4-4294-8f79-273691ec5792', 0, CAST(N'2020-10-16T14:59:18.710' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-16T14:59:29.367' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Area] ([AreaId], [AreaName], [LeadId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'c14a2d08-3765-4b45-9352-8b4619d431a9', N'New gandhingar aheamdabad', N'acd8b999-8eb4-4294-8f79-273691ec5792', 1, CAST(N'2020-10-16T14:54:59.560' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Area] ([AreaId], [AreaName], [LeadId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'3852b7eb-2609-4f3c-bcad-fe28d4ba68d7', N'bhai bhai ', N'acd8b999-8eb4-4294-8f79-273691ec5792', 1, CAST(N'2020-10-16T14:55:06.230' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'84af8cf5-06f8-4ef3-8c32-0ba2f74f6046', N'sadfsadasdsad', NULL, NULL, NULL, NULL, NULL, N'fc7bebd0-dd2d-47fe-b1d2-b999251e0f5b', 1, CAST(N'2020-10-02T14:25:35.640' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'609a5c80-3542-4ad4-b8c1-2d4b69ace2cc', N'This istest contact data', N'54545', N'454545@gmail.com', N'41151', N'15154545454', N'112121', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, CAST(N'2020-10-02T14:51:21.793' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e0d038e1-52ca-41ec-8444-3230dcc150bc', N'Kapil Dev', NULL, NULL, NULL, NULL, NULL, N'ec66e2df-448a-4252-8622-2c69082c0657', 1, CAST(N'2020-10-02T12:53:45.380' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'3ae829f0-9ee8-4fd0-b2c1-397981472602', N'545456456464654', N'56456456456', N'kk@gmail.com', N'kk@gmail.com', N'56465465465465456465', N'4564564564', N'6333e095-134c-4d4e-ad65-146e561cf43a', 1, CAST(N'2020-10-02T14:28:03.170' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'73334cff-e0c6-486f-a1f7-4a2c160b2ce6', N'Kapil bhai Program', NULL, NULL, NULL, NULL, NULL, N'fc7bebd0-dd2d-47fe-b1d2-b999251e0f5b', 0, CAST(N'2020-10-02T13:55:43.177' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-02T14:22:44.067' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'd065d001-323e-4390-bed8-9cab72851dc3', N'xdfdsfsfg', NULL, NULL, NULL, NULL, NULL, N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, CAST(N'2020-11-10T16:00:55.780' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'8fab4a4f-d529-45a3-a2ed-9d7d3072575a', N'This istest data', N'asdfsa', N'sfsfsd@gmail.com', N'564564564', N'56465', N'456456', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, CAST(N'2020-11-10T15:42:10.203' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'35610d4e-1f30-454b-acdf-cd171ba485a9', N'Kapil sharam', NULL, NULL, NULL, NULL, NULL, N'af7d12ac-ac9a-4b32-829d-7679178797ac', 1, CAST(N'2020-10-02T12:50:09.933' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Contact] ([ContactId], [ContactName], [ContactDesignation], [ContactEmail], [ContactPhone], [ContactAddress], [ContactOrg], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ec3b6559-e845-4c03-abdd-e2e4bd5fb756', N'Kapil dev meena', NULL, NULL, NULL, NULL, NULL, N'92b2c781-1696-4785-9a97-4bda260226b7', 1, CAST(N'2020-10-02T12:53:09.880' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e9f33536-ffa2-4fa0-ba69-2e18104c2256', N'PGH-MobileProactive-Agent@2xv2.jpg', N'LeadFiles\af4d8586-794c-4ccc-a51e-7e9332172b31\PGH-MobileProactive-Agent@2xv2.jpg', N'af4d8586-794c-4ccc-a51e-7e9332172b31', 1, CAST(N'2020-10-09T13:06:54.120' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'0f77d48d-70f3-49e8-9a62-441a762f1ad0', N'aws-auto-scaling-load-balancing-2.png', N'LeadFiles\a386db75-17f9-4182-b3e8-d7722118e9bc\aws-auto-scaling-load-balancing-2.png', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T13:02:25.503' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'9dec73ee-652a-42e1-880e-4759289d0336', N'MicrosoftTeams-image.png', N'LeadFiles\6a5be005-935a-4385-a2d8-af9bf64b61fb\MicrosoftTeams-image.png', N'6a5be005-935a-4385-a2d8-af9bf64b61fb', 1, CAST(N'2020-10-09T13:20:21.017' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'd2907a7b-1e36-41b9-b8cc-58771702158d', N'Lowes Desktop Proactive.PNG', N'LeadFiles\a386db75-17f9-4182-b3e8-d7722118e9bc\Lowes Desktop Proactive.PNG', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T12:57:50.453' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'38482e6c-3d09-4e5a-9a69-5e6abd4f0b7a', N'MicrosoftTeams-image.png', N'LeadFiles\a386db75-17f9-4182-b3e8-d7722118e9bc\MicrosoftTeams-image.png', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T12:57:26.090' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'9923a488-b256-4a87-b1c2-8998436e69dc', N'PGH-MobileProactive-Agent@2xv2.jpg', N'LeadFiles\1c6d4d1e-f369-481a-a43d-ffbca5d183f9\PGH-MobileProactive-Agent@2xv2.jpg', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T12:31:50.943' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'1861a899-a14d-419f-8199-94270509189d', N'PGH-MobileProactive-Agent@2xv2.jpg', N'LeadFiles\f44897eb-4ca5-483d-a433-76b555886a89\PGH-MobileProactive-Agent@2xv2.jpg', N'f44897eb-4ca5-483d-a433-76b555886a89', 1, CAST(N'2020-10-09T13:08:58.590' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'3945eca4-d4b0-4482-bbf9-a0e5837f65e9', N'DisableCache.png', N'LeadFiles\a386db75-17f9-4182-b3e8-d7722118e9bc\DisableCache.png', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T13:01:37.570' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e1203f3d-2ea0-4261-9c01-aa6a6345149b', N'MicrosoftTeams-image.png', N'LeadFiles\d7be2757-f1de-479a-802e-7204cdf2a04b\MicrosoftTeams-image.png', N'd7be2757-f1de-479a-802e-7204cdf2a04b', 1, CAST(N'2020-10-09T13:22:14.600' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'0ce7869c-87be-4813-8a7a-bb77696ed306', N'MicrosoftTeams-image.png', N'LeadFiles\44cb3002-68f1-49cd-a503-fff23155debf\MicrosoftTeams-image.png', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T12:48:26.760' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'fbed161f-f5e8-4440-83ae-c3f7c0ff5543', N'PGH-MobileProactive-Agent@2xv2.jpg', N'LeadFiles\a386db75-17f9-4182-b3e8-d7722118e9bc\PGH-MobileProactive-Agent@2xv2.jpg', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T12:57:42.710' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'574a4b8f-f181-462e-acb0-d005680f61e0', N'NewLayoutForvisitorMessage.PNG', N'LeadFiles\1c6d4d1e-f369-481a-a43d-ffbca5d183f9\NewLayoutForvisitorMessage.PNG', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T12:30:44.120' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'221d37a5-c053-4e52-82a0-e20ab21b7ac9', N'NewLayoutForvisitorMessage.PNG', N'LeadFiles\a386db75-17f9-4182-b3e8-d7722118e9bc\NewLayoutForvisitorMessage.PNG', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T12:57:29.170' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'57e61870-8306-4083-91b8-e5fb7229b506', N'aws-auto-scaling-load-balancing-2.png', N'LeadFiles\0bb49d81-2e6f-4762-b6cb-0627757ae836\aws-auto-scaling-load-balancing-2.png', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, CAST(N'2020-11-13T13:16:25.270' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'604f9ebd-cdb4-489a-9390-eb263c3aca09', N'NewLayoutForvisitorMessage.PNG', N'LeadFiles\44cb3002-68f1-49cd-a503-fff23155debf\NewLayoutForvisitorMessage.PNG', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-09T12:48:39.797' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Files] ([FileId], [FileName], [FilePath], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'454d3b83-1d1a-4370-97aa-f6d26c8c17b6', N'MicrosoftTeams-image.png', N'LeadFiles\f44897eb-4ca5-483d-a433-76b555886a89\MicrosoftTeams-image.png', N'f44897eb-4ca5-483d-a433-76b555886a89', 0, CAST(N'2020-10-09T13:08:53.730' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-09T13:09:18.407' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'2424a59e-37b7-4487-b91c-07926c5cc626', N'2ea96903-f96e-42ca-af7c-4859a0590645', N'a7c60bed-21dd-4c21-8674-a1ba34905627', CAST(N'2020-10-19T18:35:38.253' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'375c981a-a9a2-4915-8e25-33fcefeffb8d', N'2ea96903-f96e-42ca-af7c-4859a0590645', N'74d9119e-e6b7-44d5-ba62-1f77d176c086', CAST(N'2020-10-19T18:35:28.207' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-19T18:57:36.550' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', 0)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'43378b51-396a-426a-afd0-598e1c311312', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'2c93fc16-adf1-45ed-aa5a-75aeaefc6cee', CAST(N'2020-11-13T13:50:08.313' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'aa672010-5209-44f7-be9a-5aadcdb77a8b', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'a7c60bed-21dd-4c21-8674-a1ba34905627', CAST(N'2020-11-13T13:39:17.120' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'97b60c52-c648-408a-b476-644757afa0bb', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', CAST(N'2020-11-13T13:17:28.140' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'1e7e883b-9514-4fe6-b032-660a63f7e0cb', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'71d466dd-79f8-4e2c-8607-0ae857bb751a', CAST(N'2020-11-13T13:48:07.240' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'd085d219-ae81-453e-a6a3-9e15874596f7', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'2150fabf-112a-442b-ba2b-15841bbd3733', CAST(N'2020-11-13T13:17:34.557' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'1242b28f-fbcc-4e37-a92d-a968daea41a4', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'a7c60bed-21dd-4c21-8674-a1ba34905627', CAST(N'2020-11-13T13:39:28.127' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'8eda7da7-1aa0-449e-97af-ad587ade142f', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'a7c60bed-21dd-4c21-8674-a1ba34905627', CAST(N'2020-11-13T13:17:40.290' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'4421ba55-4e06-4bea-a746-b2c87a137166', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'82f05fad-b293-4854-b2ac-3dd7e198a523', CAST(N'2020-11-13T13:48:15.450' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'00f13327-4baf-431b-a043-be5fc6e91131', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'd2666264-4655-42a5-8cb6-342987196c36', CAST(N'2020-11-13T12:34:18.040' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'c78a3d75-a05a-4599-9049-cedc942a4b8f', N'2ea96903-f96e-42ca-af7c-4859a0590645', N'2150fabf-112a-442b-ba2b-15841bbd3733', CAST(N'2020-10-19T18:35:20.090' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'09faf1ad-8677-4211-9e06-e6b2258ff260', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'e7df116b-bcf8-4af6-84c3-99ef3952c58f', CAST(N'2020-11-13T13:48:37.960' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_LeadAccess] ([AccessID], [LeadId], [UserId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsActive]) VALUES (N'cf0240c7-21ff-4705-a275-f45c71c0e6eb', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'00000000-0000-0000-0000-000000000000', CAST(N'2020-11-13T13:47:43.167' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, 1)
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd2daf8e4-09f6-4091-9c42-0136d6b775aa', N'Hello this is test data', CAST(21212 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-07T14:13:17.510' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'f7604c0e-356f-4dc6-b253-015d92ceb6a3', N'Hello this ist est d', CAST(2121 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-10-02T12:38:34.977' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T15:13:36.233' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'0bb49d81-2e6f-4762-b6cb-0627757ae836', N'White man', CAST(5454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-02T14:51:01.237' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'f5d42a67-6bc0-46bd-b94c-07e5c88c15dd', N'45544', CAST(54654 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-24T12:54:08.197' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-25T15:22:15.817' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'3b1403b6-2d92-4240-9cf2-092c6918c487', N'Hello', CAST(12123132 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T17:30:29.893' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'8d6b8241-2d33-4f17-86d2-0d01d1db508e', N'5634564', CAST(55464 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-30T14:48:20.723' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'a1b25ae8-4af0-44b2-aab5-0d1f9120fffb', N'Wilmer Deluna', CAST(200 AS Decimal(18, 0)), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-17T16:29:32.437' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-25T15:21:56.797' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'65383b7a-69a5-4138-934d-0e57d82e0276', N'sfsdfsdf', CAST(564564 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-24T14:01:53.633' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:05:47.610' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'11c5c8d8-2c1c-4452-b372-10f8b4afbffa', N'yjgghjgh', CAST(8456465 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-19T14:53:40.397' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'6333e095-134c-4d4e-ad65-146e561cf43a', N'Console log', CAST(22656 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-02T14:26:37.287' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:05:49.240' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'8ad12c86-8a60-4abb-bf4e-162c30c5d92c', N'54654', CAST(564654654 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-10-08T12:25:07.723' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'ffaa8d0c-f506-4a05-b8ba-17da69ba8d29', N'sdfdsfdsfdsf', CAST(21521 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-23T14:18:45.903' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:28:12.147' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'761aa6b1-0282-4a5d-b21f-1ad481ab2465', N'This is stest', CAST(4545 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-30T14:14:01.687' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:18:58.340' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'2c50e5d9-c7e5-4127-bf6c-1eb5ae099d27', N'YYYYY', CAST(254154 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-02T15:46:01.657' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:05:50.083' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'f80e8b64-8ea4-4364-9dbf-1ee0058cefd4', N'RRRRR', CAST(1241 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-23T14:15:24.713' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-23T17:09:23.230' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'acd8b999-8eb4-4294-8f79-273691ec5792', N'May fasdfasdf aa fs dasdf', CAST(545454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-16T14:54:07.733' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'3848c0bd-7d80-4544-bdd5-273b659272bc', N'Test new leads', CAST(54546 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-28T12:47:15.953' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-02T12:36:18.703' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e4fd4fd3-906a-486b-a0c5-2b985512a493', N'Test Lead', CAST(1021 AS Decimal(18, 0)), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-15T13:07:22.163' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-25T15:22:13.567' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'00000000-0000-0000-0000-000000000000')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'ec66e2df-448a-4252-8622-2c69082c0657', N'sfdfsdfsdfsd', CAST(1231 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-10-02T12:53:37.387' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:18:57.333' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'32c9a87c-0dfb-49da-b54c-2deb97ecb1be', N'Wilmer Deluna', CAST(5000 AS Decimal(18, 0)), N'31a4bb2b-f10a-424e-bfc1-7d4a64f6db32', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-17T16:28:34.603' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-25T15:22:01.347' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'7ab93189-d2df-447a-a8ab-32d0161870b7', N'5454', CAST(24515 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-24T14:01:11.990' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:18:59.510' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'c68e729d-bcb7-461a-8a2e-38037ba7dadd', N'Bhai ', CAST(25154 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-15T17:15:34.907' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'18e6a9b2-5517-4687-807e-3e5784c5f2c5', N'don 2', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T18:35:50.750' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'b94595cf-9339-4a82-bfaa-3ef7bfaa8d41', N'4654', CAST(56456 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T17:50:24.160' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'b60ce056-d220-4899-9b69-3fcc3f0e6a3a', N'Helo', CAST(1454 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-02T14:33:36.690' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'26890e17-2d11-4987-8a05-4091eb1d0a47', N'test', NULL, NULL, N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T14:59:30.253' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:29:22.593' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd9e815c0-b3c0-410f-a573-415bbc576791', N'Lead Name', CAST(6545456 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-07T14:06:30.267' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:05:58.713' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'939d95bf-0873-467d-9eeb-45863de49547', N'5656', CAST(4545646 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-23T14:19:19.073' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-23T17:09:23.230' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'2941a853-8b89-4ac7-bfd5-46dc00978684', N'Kapil', CAST(5454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-10-02T12:42:33.730' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:00.683' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'2ea96903-f96e-42ca-af7c-4859a0590645', N'May I know this is test critical ', CAST(5000 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-19T18:35:03.533' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'424cbfa1-86a6-464f-93a0-494884e76f19', N'sfdsdfsdf', CAST(35454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-30T14:37:23.680' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:05:52.107' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'92b2c781-1696-4785-9a97-4bda260226b7', N'sdfsdfdsfd', CAST(351541 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-02T12:52:55.770' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:30:05.973' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'a5a5062b-1a32-4781-9110-4c750e9e5cb4', N'sdfdsfdsf', CAST(5645 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-24T13:55:18.463' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:01.747' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e47a7d71-3479-4bc3-9340-531ae4e7ebe6', N'Hello asdfsdaf dfs fsad', CAST(45665465 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-01T15:48:42.323' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'aa7f76a7-2b18-439e-9a56-56fd6b0cf308', N'fsdfdsf45454', CAST(54654 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-30T14:36:25.103' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:03.167' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'55fe12d8-b42d-4441-be3d-574788455d05', N'TodoLead', CAST(4744 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-28T16:52:46.577' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'3163b6a7-d4c7-4e81-8d84-5ad07a485292', N'test list todod', CAST(454 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-28T17:31:01.923' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'0d4ffb89-4957-43df-902d-5c3126666238', N'Facebook integration', CAST(200 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-17T16:28:52.567' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:30:13.433' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'b7bcf3bf-aa65-495c-ac53-62552a121b86', N'41', CAST(564 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-24T14:03:54.797' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'68160006-fc6f-4b71-8ba9-626bb39c7977', N'Wilmer Deluna', CAST(1021 AS Decimal(18, 0)), N'31a4bb2b-f10a-424e-bfc1-7d4a64f6db32', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-15T13:09:06.463' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'00000000-0000-0000-0000-000000000000')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'9c723e39-9ac0-4c9c-b759-65e72b3abb2a', N'Hello datab ', CAST(45454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-10-01T15:56:08.740' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:04.580' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd1f32f8f-dace-468b-bed7-67d3843911ec', N'Hello', CAST(5454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-10-02T16:21:37.673' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:05.747' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'f9621ecd-ad97-46e2-aa61-686a2c0234e5', N'544', CAST(1564 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-24T14:00:53.743' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:30:16.820' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'0502eaa4-54d7-4da6-ae80-6b3aa9dd2967', N'May I knwo you name asfsaf', CAST(21212 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T14:08:50.760' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'1465e3f7-0a4a-4933-bad6-6b848bca33e4', N'IIIIIIIIII', CAST(21541564 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-29T11:06:40.983' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:08.840' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'0ce59569-e4ca-4b38-88f2-6f991007700c', N'Facebook integration', CAST(200 AS Decimal(18, 0)), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-15T16:31:09.553' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-25T15:22:05.563' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd67ec418-c932-476d-9350-708ffca0a981', N'sff', CAST(3216321 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-08T12:44:29.910' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:05:59.580' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd7be2757-f1de-479a-802e-7204cdf2a04b', N'May I knwo you name asfsaf', CAST(211212 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-09T13:21:38.700' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd2ad9e85-e11c-45a1-af3e-7457300c3eae', N'Bhai bhai ', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T20:29:40.297' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'af7d12ac-ac9a-4b32-829d-7679178797ac', N'Lead Info', CAST(545454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-02T12:49:39.373' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'f44897eb-4ca5-483d-a433-76b555886a89', N'May I know you name', CAST(322313 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-09T13:08:41.597' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:05:52.960' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'09af011d-03d1-4ff9-9de3-77cb5c9955c0', N'Lead data with new reddsf', CAST(21312 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-28T16:59:14.617' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'57bba979-4504-4ae8-832d-797f7ee35c3f', N'I need chat product', NULL, NULL, N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T20:36:34.173' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'2cfd60ed-9e05-4317-923f-7b6c720e49ea', N'Test Idea', CAST(10241 AS Decimal(18, 0)), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-23T14:13:59.170' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:30:33.007' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'8a322253-930a-46bf-bb84-7c113581670b', N'Wilmer Delunasdfs fsdf', CAST(2313132 AS Decimal(18, 0)), N'82f05fad-b293-4854-b2ac-3dd7e198a523', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-23T14:16:56.140' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-25T15:22:04.483' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'3f7ee283-27be-4b63-9e29-7e1a81a4c097', N'Bhai mere kon hai yaha', CAST(54545 AS Decimal(18, 0)), N'e7df116b-bcf8-4af6-84c3-99ef3952c58f', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T13:53:32.357' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'af4d8586-794c-4ccc-a51e-7e9332172b31', N'654564564564', CAST(56465456456 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-09T13:06:46.180' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:05:56.347' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'04532b8f-5bcd-48c5-b388-81d84073da26', N'54564', CAST(5465545 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T17:40:20.430' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'c2c0ce11-67ca-4e75-bc17-822a74a36382', N'May I know your name ', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T20:18:29.510' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'208ac838-e956-41d1-b3ff-847cd161b6ef', N'4456', CAST(54546 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-24T14:03:36.253' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'8ae46ddb-31b9-4a91-ab1b-85df6dac0764', N'This is new test data', CAST(5454 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-10-09T12:15:26.613' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:11.123' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'46a0bdab-1ca4-46f2-a236-8a0abe68c00e', N'This is new Lead created by test', CAST(4455454 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T11:42:16.350' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd2741e2b-5e32-443e-95d0-8b9256fed4d1', N'Kill bill', CAST(201401 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-24T12:49:01.103' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:02.570' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'fb0ae825-bb6f-4859-aac0-8d0f2c8fba92', N'Contact Logo', CAST(41541 AS Decimal(18, 0)), N'd2666264-4655-42a5-8cb6-342987196c36', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-16T14:48:29.910' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'1a6c4081-a939-4559-bb2b-8f5efe1ce099', N'dfsfsdfsdf563456465', CAST(54654 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-01T16:34:45.603' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'bf475ed3-ba0b-4502-9524-8fb74ce02c87', N'89744', CAST(1313 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-29T11:14:46.550' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:12.443' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'79a3689a-9204-45dc-b33a-91202f1a3b21', N'sdefef', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T19:01:46.867' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'a1995a67-f718-4b6e-b55c-927b3d1348d2', N'sfsdfsdf', CAST(6554 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-23T14:23:04.150' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:04:52.740' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'de45d99e-194e-45c2-8410-938ecd359153', N'sadsa', CAST(4 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-30T14:40:31.507' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:03.517' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'28a51fb1-6fa0-4278-b369-9a2c02e1d422', N'86798787456455555555555555555555555', CAST(5644655 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-29T11:13:04.083' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:05.250' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'494618ba-c975-4f99-ac9b-9a56af89544a', N'sdfdsfd', CAST(5456 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-23T14:23:33.423' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-25T15:22:14.317' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'fad1a7ea-2558-4bf9-8177-9c848618eb19', N'5456', CAST(54545 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-30T14:18:04.943' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:04:51.497' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'af1c17eb-f0a6-448e-9fab-9cf9d52d25c8', N'File upload lead', CAST(4545 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-08T16:39:44.230' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:00.357' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'21c5c7ce-7a8c-48fd-89ed-a040cddc8e5a', N'Wilmer Deluna', CAST(1021 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-24T12:52:57.880' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:15.350' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'7292b0c5-e5d3-4723-a010-a92712b9b71d', N'sfssdfsdfds', CAST(54654 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-23T14:21:45.280' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-24T12:48:11.477' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'693efdf7-a033-49c1-a7eb-a9db71976cad', N'sdfsdfsadfasdfasdf', CAST(24455 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-28T17:33:26.737' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'3fc96623-5e20-4307-923f-ace3dc0c3f8f', N'Soure Datra', CAST(54564 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T14:06:38.600' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'13bf4ec8-bd82-45eb-ad5d-add07a3c612c', N'Today Leads', CAST(5141 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-28T12:13:47.660' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:16.873' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'523affb4-3d85-4143-8af2-af4661500c07', N'Hello', CAST(21212 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-29T11:15:53.423' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:18.387' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'02ee942b-a4e0-4d96-bbff-af67d0a90e2e', N'King of KIne', CAST(2014 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-24T13:49:34.753' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:20.580' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'64dbd55f-c745-4f00-9014-af7fecb33119', N'dsfsdf', CAST(121321 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-30T14:24:07.427' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:22.140' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'6a5be005-935a-4385-a2d8-af9bf64b61fb', N'Bhai logo ki lead', CAST(51515 AS Decimal(18, 0)), N'82f05fad-b293-4854-b2ac-3dd7e198a523', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-09T13:14:55.007' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:33:00.937' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e0dc9705-de74-4d96-a5af-b298f5bdd1ba', N'dsfdsfdf', CAST(21231 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T17:34:56.817' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'3b959983-2879-4c57-a4be-b2aeffc806e7', N'sfssdfsdfds', CAST(1021 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-24T13:10:09.100' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'9dc53086-cec9-4777-a143-b2efe854045f', N'Don 5 ', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T19:00:39.610' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'15cdf2e9-d02f-4f1a-9176-b8fe2612dd3c', N'fdsf', CAST(4564 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-24T14:19:41.550' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:23.927' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'fc7bebd0-dd2d-47fe-b1d2-b999251e0f5b', N'Lead Info', CAST(545645 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-10-02T13:55:01.350' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:25.263' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'5cbaf021-d79c-43fd-ad64-ba68d4b0399b', N'Udsfs', CAST(24254 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-30T14:43:49.500' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:05.997' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'72f9a669-1ffc-4518-bfc3-c14904af7843', N'564654', CAST(54564564 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-24T13:58:01.647' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:33:02.373' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'48cb4066-91a1-4dbd-9fc0-c379dee37057', N'12311545dfsdf', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T19:03:36.677' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'58031f8a-aedf-4131-9e95-c3e9e83f724c', N'455645', CAST(456465 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-24T14:09:35.493' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:07.700' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e4f3d82f-e109-44ff-8846-c561a2ce7fa2', N'ICE Lead', CAST(2010 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-11-10T15:41:36.097' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'3ae8337f-14ba-4971-9f41-c82f280edbcb', N'ICE Bot integration', CAST(5000 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-17T16:28:23.560' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-24T17:14:46.467' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'ac238dde-56d5-4c52-988d-cb722bd4be33', N'This is test datra', NULL, NULL, N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-11-03T14:46:57.733' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:33:03.480' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'8435accc-471a-4cff-8e93-cb7b5e46ae16', N'vdsfdsf', CAST(6545456 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-30T17:10:08.987' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:28.397' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'a6df56a8-2ad3-4129-9107-cd25dac10b95', N'Wilmer Deluna', CAST(1564 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-24T13:05:05.507' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:10.833' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'19c2fb74-c117-433f-aba4-cdb04f16eafd', N'don 2', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T18:38:59.243' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'6b828367-1a21-45d3-9298-ce2666987ec8', N'test todo list data', CAST(1000 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-11-06T15:11:33.643' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'a386db75-17f9-4182-b3e8-d7722118e9bc', N'This is test chat for my deail', CAST(5545 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-09T12:57:15.090' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:33:04.410' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'ef973518-ade8-45ff-b1bb-d9126f6a87c9', N'may I know your name', CAST(50000 AS Decimal(18, 0)), N'31a4bb2b-f10a-424e-bfc1-7d4a64f6db32', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-19T18:33:09.157' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'c7963edc-7bf4-47f4-a352-da843225c615', N'45456', CAST(4554 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-08T16:54:18.850' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:04.540' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'418ad4b6-4fc1-42c6-8a9e-db05fee918bb', N'sdffsdaf', CAST(21654 AS Decimal(18, 0)), N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-01T15:22:33.793' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:07.027' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'2377c528-cb00-4efb-bb9b-dc792c503cc1', N'fsdjfsjdf', CAST(11212 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T17:51:30.337' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'bda77ff3-4a11-4609-a95f-dd33eb91d54c', N'Todo List', CAST(41414 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-29T10:51:44.427' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:33:05.900' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'c6362859-7c95-4abf-b9ae-dddfd5c8efc2', N'Lead info data', CAST(54545 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-10-01T15:01:38.123' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'0ca90eda-7b7b-4813-af03-de9fd9350f69', N'sdfvdffdsaf', CAST(1345 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-30T14:16:05.990' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:06:08.633' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'66425560-bf70-4141-8b01-dea10398954f', N'sdfdsf', CAST(151 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-13T17:48:02.273' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'8a44859c-da5d-42ef-aa70-dfb5a9437ed1', N'fd46544', CAST(566465 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-24T14:08:06.710' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-04T13:07:26.937' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'1f565116-ef5c-4e5c-a67b-e16700854b27', N'dsfsafsdf', CAST(2132 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-28T17:52:35.990' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'bf85bea5-db01-4d6c-b70d-e2c540c60a31', N'Wilmer Deluna', CAST(1021 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-09-24T13:14:57.260' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e93faf5d-5f74-4cb6-a3ef-e3993c5d042d', N'45', CAST(2 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-09-24T14:11:56.520' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-04T13:07:32.090' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd4419944-4a89-4fe6-b4d2-e56bb97d8b25', N'Kapil dev teest', CAST(454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-10-01T14:56:50.723' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'c79e9da3-b479-4f49-8db5-ea564501b891', N'Last chance ', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T19:02:26.430' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'0082d638-197c-498c-bb61-eab46cca6e55', N'bhai mere bhai mere', NULL, NULL, N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', 1, CAST(N'2020-10-20T18:53:02.057' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'6d09c804-2490-4b29-8fc0-eb1b578b1536', N'king of data may  I know your name', CAST(54545 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'52581ef1-f796-4ad3-bd24-15e996098e44', 1, CAST(N'2020-10-16T14:36:20.993' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'f046f4b4-c0ef-4758-a190-ed44002a9642', N'fdsf', CAST(1021 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-24T13:12:25.803' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:50.027' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'76a7c5de-8d9f-486c-89cc-ee287b281559', N'fdfdsf', CAST(545 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-30T14:45:46.193' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:54.880' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'458f80dc-5406-4c00-bf3f-efa8e17e816f', N'Hello', CAST(45141 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-30T18:06:17.370' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:51.600' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'691fb794-a5f4-4b39-bdd5-efdb51a51537', N'fdsfdsfdsfd', CAST(2131 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-23T14:24:28.137' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-09-24T12:48:03.930' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'5ba1e433-6ee0-440d-b291-f3aef57e4e7a', N'46545', CAST(564544 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-30T15:05:56.430' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-04T13:07:23.253' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'2c0b1fe7-d05b-4ea1-940d-f5002acc43c3', N'6551', CAST(1351 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-30T14:26:07.750' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:19:53.770' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'0517402d-1b6b-4894-8fca-f6d2c199c3a3', N'Hello', CAST(1212 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-10-14T17:23:06.267' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:35:13.293' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e537a366-7e1d-4a7e-8fe8-f722b5971f1d', N'UUU', CAST(3232 AS Decimal(18, 0)), N'2150fabf-112a-442b-ba2b-15841bbd3733', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'15817dd5-7dba-4784-ae62-f2811fdd5dca', 1, CAST(N'2020-09-23T14:17:50.687' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-04T13:07:21.440' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'7dbdf10b-ce6c-4ee4-b716-f95fb1e32ca9', N'87987987', CAST(54654 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-29T11:09:29.197' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:20:02.250' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'8b74733e-6665-4bc4-845a-fa8fb5c04a68', N'4541', CAST(1021 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-09-24T14:09:03.443' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T14:45:00.350' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'5d4da8f7-a24b-4cb2-82bc-fc79f1e23f9c', N'5445', CAST(454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'cac81221-3313-412e-a7ce-64e1ca89ea7f', 1, CAST(N'2020-09-24T14:20:11.000' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-04T13:07:10.683' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'1c6d4d1e-f369-481a-a43d-ffbca5d183f9', N'Lead Name Files', CAST(545454 AS Decimal(18, 0)), N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-10-09T12:30:21.240' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-14T17:20:05.267' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Leads] ([LeadId], [LeadName], [LeadValue], [AssignUser], [PipeId], [StageId], [IsActive], [CreateDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'44cb3002-68f1-49cd-a503-fff23155debf', N'May know you time', CAST(102212 AS Decimal(18, 0)), N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', 1, CAST(N'2020-10-09T12:48:17.130' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-03T16:33:09.963' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Notes] ([NoteId], [Notes], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'5749ddca-e7bc-46b5-9e31-06817101e745', N'dfsgdfgdfasfasfsdfsdfsd', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, CAST(N'2020-11-13T13:15:57.357' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Notes] ([NoteId], [Notes], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'31edb3c9-2c6a-4a5d-b334-18f664f4c3f5', N'May i Know you name with details and may i know you first name', N'd2daf8e4-09f6-4091-9c42-0136d6b775aa', 0, CAST(N'2020-10-07T14:14:05.160' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-07T14:14:20.383' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Notes] ([NoteId], [Notes], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'988f0673-6ee7-46f4-83f0-86446ea6bd46', N'This isf sfsdfs', N'd2daf8e4-09f6-4091-9c42-0136d6b775aa', 1, CAST(N'2020-10-07T14:13:23.127' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Notes] ([NoteId], [Notes], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'6431a984-e716-4f7e-be9b-876a266fd632', N'THis is test notes', N'00000000-0000-0000-0000-000000000000', 0, CAST(N'2020-10-07T14:08:06.780' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-07T14:08:58.273' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Notes] ([NoteId], [Notes], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'929d49af-5b63-42ef-ab00-ad0800814c2b', N'This lead is important and dfa dfa fad adf fdf df f fsdaf asdf fasd fadsf df sdfd fasd fsdf dfdsfadf asfd asdfas dfasdf dffadfaffd dsaf f fdsdf asd ad dfads fasdf dsf adf sdfdasf dasf daasd fsdafdsfadsf af
This lead is important and dfa dfa fad adf fdf df f fsdaf asdf fasd fadsf df sdfd fasd fsdf dfdsfadf asfd asdfas dfasdf dffadfaffd dsaf f fdsdf asd ad dfads fasdf dsf adf sdfdasf dasf daasd fsdafdsfadsf af

This lead is important and dfa dfa fad adf fdf df f fsdaf asdf fasd fadsf df sdfd fasd fsdf dfdsfadf asfd asdfas dfasdf dffadfaffd dsaf f fdsdf asd ad dfads fasdf dsf adf sdfdasf dasf daasd fsdafdsfadsf af', N'00000000-0000-0000-0000-000000000000', 1, CAST(N'2020-10-07T14:07:25.880' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Organization] ([OrgID], [OrgName], [UserLimit], [LeadLimit], [StroageLimit], [StartDate], [EndDate], [CreateDate], [CreatedEmail], [Isactive]) VALUES (N'82fcabb2-40af-4776-bca4-7bd04daf707e', N'Happpy Home', 100, 100, 100, CAST(N'2020-06-23T21:26:43.770' AS DateTime), CAST(N'2020-06-23T21:26:43.770' AS DateTime), CAST(N'2020-06-23T21:26:43.770' AS DateTime), N'suraj@gmail.com', 1)
GO
INSERT [dbo].[tbl_PipeLine] ([PipeID], [PipeName], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'a784480b-61cb-46d5-acc9-6a56fe2398da', N'ICE Pawan', 0, 0, CAST(N'2020-08-28T13:58:53.727' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-08-28T14:12:01.060' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_PipeLine] ([PipeID], [PipeName], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'133f31b5-1fb4-43f7-8791-7891924ea963', N'ICE Project New2 1Pawan', 0, 0, CAST(N'2020-08-28T14:01:17.527' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-08-28T14:16:21.607' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_PipeLine] ([PipeID], [PipeName], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'60a6e2b9-86a5-475c-befa-9743d4b954b5', N'ICE Pawan', 1, 1, CAST(N'2020-08-28T19:28:59.573' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-08-28T19:32:28.150' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_PipeLine] ([PipeID], [PipeName], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'359040e4-af40-40af-9598-9a6c7fd69624', N'ICE Project', 1, 0, CAST(N'2020-08-28T13:19:25.560' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_PipeLine] ([PipeID], [PipeName], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'f4135a30-017a-4b6b-8e57-a6ccea75df34', N'ICE Project New', 1, 0, CAST(N'2020-08-28T13:55:02.947' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_PipeLine] ([PipeID], [PipeName], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'61f42425-aa19-4d67-8314-e4da7789a13a', N'Test New PipeLIne', 1, 0, CAST(N'2020-11-10T16:00:07.060' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_PipeLine] ([PipeID], [PipeName], [IsActive], [IsDefault], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'9e4a1b5c-49cd-4375-8099-efc90d5f95b2', N'ICE Project New New Data', 0, 0, CAST(N'2020-08-28T13:59:34.413' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-08-28T19:25:00.440' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [ProductPrice], [ProductDiscount], [DiscountPercentage], [ProductDiscountPrice], [Quantity], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'f204c51c-04fc-4517-a9ea-0cb120a5d63d', N'May I know your name', CAST(4544 AS Decimal(18, 0)), CAST(54545 AS Decimal(18, 0)), 4545454, CAST(-50001 AS Decimal(18, 0)), 414, N'0502eaa4-54d7-4da6-ae80-6b3aa9dd2967', 1, CAST(N'2020-10-13T14:15:27.760' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [ProductPrice], [ProductDiscount], [DiscountPercentage], [ProductDiscountPrice], [Quantity], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'e0bbda5f-96c4-45a3-8b52-1b4d653a2959', N'25152125', CAST(1200 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), 10, CAST(1080 AS Decimal(18, 0)), 2, N'e0dc9705-de74-4d96-a5af-b298f5bdd1ba', 1, CAST(N'2020-10-13T17:35:09.380' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [ProductPrice], [ProductDiscount], [DiscountPercentage], [ProductDiscountPrice], [Quantity], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'910f111c-229f-43cc-8799-5c0ef4628232', N'5466556', CAST(454 AS Decimal(18, 0)), CAST(45 AS Decimal(18, 0)), 10, CAST(409 AS Decimal(18, 0)), 2, N'66425560-bf70-4141-8b01-dea10398954f', 1, CAST(N'2020-10-13T17:48:16.183' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [ProductPrice], [ProductDiscount], [DiscountPercentage], [ProductDiscountPrice], [Quantity], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'42e03af1-d245-4f1f-87ef-97791d595132', N'Hello India may i Know you name', CAST(5000 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), 10, CAST(4500 AS Decimal(18, 0)), 2, N'3b1403b6-2d92-4240-9cf2-092c6918c487', 1, CAST(N'2020-10-13T17:31:16.160' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [ProductPrice], [ProductDiscount], [DiscountPercentage], [ProductDiscountPrice], [Quantity], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'4144dcfe-cf02-4b8a-ab59-a1f08ed57b3a', N'65465456', CAST(5646556 AS Decimal(18, 0)), CAST(564656 AS Decimal(18, 0)), 10, CAST(5081900 AS Decimal(18, 0)), 32, N'b94595cf-9339-4a82-bfaa-3ef7bfaa8d41', 1, CAST(N'2020-10-13T17:50:34.963' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [ProductPrice], [ProductDiscount], [DiscountPercentage], [ProductDiscountPrice], [Quantity], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'912e9e2b-1bf5-455a-9c33-bf1c16d1f0bf', N'IIII', CAST(10 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), 10, CAST(9 AS Decimal(18, 0)), 5, N'04532b8f-5bcd-48c5-b388-81d84073da26', 1, CAST(N'2020-10-13T17:40:36.897' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [ProductPrice], [ProductDiscount], [DiscountPercentage], [ProductDiscountPrice], [Quantity], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'0b2195bd-c865-4e49-aefe-fb2223def914', N'ICEEEE', CAST(5000 AS Decimal(18, 0)), CAST(250 AS Decimal(18, 0)), 5, CAST(4750 AS Decimal(18, 0)), 5, N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, CAST(N'2020-11-13T13:16:47.363' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [ProductPrice], [ProductDiscount], [DiscountPercentage], [ProductDiscountPrice], [Quantity], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'48eb4498-a28d-4ad7-a51f-fe610bf6e771', N'May I know you name', CAST(5454 AS Decimal(18, 0)), CAST(545 AS Decimal(18, 0)), 10, CAST(4909 AS Decimal(18, 0)), 2, N'2377c528-cb00-4efb-bb9b-dc792c503cc1', 0, CAST(N'2020-10-13T17:51:42.703' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-13T17:53:29.167' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [IsActive], [OrgId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifedBy]) VALUES (N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'Admin', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [IsActive], [OrgId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifedBy]) VALUES (N'797484de-6ea1-4aff-9ca7-b4065ea6bc94', N'User', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Source] ([SourceId], [SourceName], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'5b26d5fb-c763-4b11-bd8e-0de84daa7da6', N'THis lead we are getting form new data', N'c68e729d-bcb7-461a-8a2e-38037ba7dadd', 0, CAST(N'2020-10-15T17:16:50.340' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-15T17:17:06.163' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Source] ([SourceId], [SourceName], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'14e498a0-2542-47b9-ad34-22f9b57595d6', N'New Ahemaaabdfsd fsdfds fsdfs asdf sfsd fsdf sd sdfds', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, CAST(N'2020-11-13T13:16:58.150' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Source] ([SourceId], [SourceName], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'ba44f08c-3796-49ab-9fb5-4bcd99b48b14', N'sfdsdfsdfdsfds', N'c68e729d-bcb7-461a-8a2e-38037ba7dadd', 0, CAST(N'2020-10-15T17:17:13.163' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-15T17:17:20.090' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Source] ([SourceId], [SourceName], [LeadId], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'300b9c31-ee11-4c65-b32d-a263e94b83c2', N'Hello this is my ne werew fsd sd fsdf fds dsf', N'6d09c804-2490-4b29-8fc0-eb1b578b1536', 1, CAST(N'2020-10-16T14:36:31.363' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Stage] ([StageId], [StageName], [SequenceNumber], [PipeID], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'52581ef1-f796-4ad3-bd24-15e996098e44', N'New', 1, N'f4135a30-017a-4b6b-8e57-a6ccea75df34', 1, CAST(N'2020-08-31T15:53:51.320' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Stage] ([StageId], [StageName], [SequenceNumber], [PipeID], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'cac81221-3313-412e-a7ce-64e1ca89ea7f', N'Review', 4, N'60a6e2b9-86a5-475c-befa-9743d4b954b5', 1, CAST(N'2020-09-17T16:44:22.390' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Stage] ([StageId], [StageName], [SequenceNumber], [PipeID], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'75aba9b7-5d29-4198-bd27-cbd2dc39c759', N'Progress', 1, N'60a6e2b9-86a5-475c-befa-9743d4b954b5', 1, CAST(N'2020-08-31T15:54:11.963' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Stage] ([StageId], [StageName], [SequenceNumber], [PipeID], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'bcfa0986-74fb-46ef-b673-cc3fec95d2de', N'UAT', 5, N'60a6e2b9-86a5-475c-befa-9743d4b954b5', 1, CAST(N'2020-09-17T16:44:43.697' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Stage] ([StageId], [StageName], [SequenceNumber], [PipeID], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'15817dd5-7dba-4784-ae62-f2811fdd5dca', N'QA', 2, N'60a6e2b9-86a5-475c-befa-9743d4b954b5', 1, CAST(N'2020-09-03T11:56:29.447' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Stage] ([StageId], [StageName], [SequenceNumber], [PipeID], [IsActive], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy]) VALUES (N'9a1814c0-5286-4bd5-bc47-f8cea5223f21', N'New Process', 1, N'60a6e2b9-86a5-475c-befa-9743d4b954b5', 0, CAST(N'2020-08-31T15:47:36.987' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-08-31T16:58:37.640' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'5a2c6e57-43a2-4887-bc5d-013d705ec12d', N'fsdfsdfsdfsdfsdf', CAST(N'2020-11-10' AS Date), NULL, N'other', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 1, 1, CAST(N'2020-11-10T16:00:40.673' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'840c82ca-e81d-4293-a4dc-025192e81481', N'5454', CAST(N'1999-01-01' AS Date), NULL, N'email', N'5ba1e433-6ee0-440d-b291-f3aef57e4e7a', 1, 1, CAST(N'2020-09-30T15:06:05.270' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'14aa777d-f563-4911-b324-0832371d2041', N'sdfsfdsf', CAST(N'2020-11-13' AS Date), NULL, N'other', N'6b828367-1a21-45d3-9298-ce2666987ec8', 1, 1, CAST(N'2020-11-06T15:16:19.440' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'2ab22b1b-0244-4d8b-ac3f-0ca8ec130519', N'This is second follow up to the customer', CAST(N'1999-01-01' AS Date), NULL, N'Call', N'd4419944-4a89-4fe6-b4d2-e56bb97d8b25', 1, 1, CAST(N'2020-10-01T14:58:02.530' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'c1148e98-825a-40bd-8398-0ccfcf382ea9', N'sfs', CAST(N'2020-09-01' AS Date), NULL, N'Call', N'0ca90eda-7b7b-4813-af03-de9fd9350f69', 1, 1, CAST(N'2020-09-30T14:16:12.310' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'33d59d87-d6f7-4565-80e6-15482db41b94', N'sasdfsdfsd', CAST(N'2020-11-06' AS Date), NULL, N'other', N'6b828367-1a21-45d3-9298-ce2666987ec8', 1, 1, CAST(N'2020-11-06T15:13:25.990' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'9b9d4cb6-063f-4d2a-93a5-15bfbc5f60aa', N'Hello ths is test TOdo', CAST(N'1999-01-01' AS Date), NULL, N'other', N'f7604c0e-356f-4dc6-b253-015d92ceb6a3', 1, 1, CAST(N'2020-10-02T12:38:46.867' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'53f0f426-7748-4226-8d00-1b78c5a4001d', N'3', CAST(N'2020-09-30' AS Date), NULL, N'other', N'8435accc-471a-4cff-8e93-cb7b5e46ae16', 1, 1, CAST(N'2020-09-30T17:11:35.770' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'63205e5a-289f-4e18-9782-1bb61b5c9575', N'56484', CAST(N'2020-09-16' AS Date), NULL, N'other', N'28a51fb1-6fa0-4278-b369-9a2c02e1d422', 1, 1, CAST(N'2020-09-29T11:13:17.717' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'998fae47-0071-4125-9ad3-2217b283db07', N'BHai muje yaad ni kya bol raha hai tu', CAST(N'1999-01-01' AS Date), NULL, N'Call', N'f7604c0e-356f-4dc6-b253-015d92ceb6a3', 1, 1, CAST(N'2020-10-02T12:39:01.273' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'519469b4-334b-4ad8-837e-23663744f16f', N'65456456', CAST(N'1999-01-01' AS Date), NULL, N'other', N'76a7c5de-8d9f-486c-89cc-ee287b281559', 1, 1, CAST(N'2020-09-30T14:45:52.300' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'f16a527b-c52b-47e4-acbe-269d192b337f', N'Due to customer data', CAST(N'1999-01-01' AS Date), NULL, N'other', N'c6362859-7c95-4abf-b9ae-dddfd5c8efc2', 0, 2, CAST(N'2020-10-01T15:01:47.990' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-01T15:14:51.250' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'64475863-67a4-46c4-b9d9-294ab9c17b83', N'dsfdsf', CAST(N'1999-01-01' AS Date), NULL, N'other', N'6b828367-1a21-45d3-9298-ce2666987ec8', 1, 1, CAST(N'2020-11-06T15:11:37.117' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'8a3a590f-1e1d-4ce9-88b7-2f1e298f2473', N'fsdfasdff', CAST(N'1999-01-01' AS Date), NULL, N'other', N'de45d99e-194e-45c2-8410-938ecd359153', 1, 1, CAST(N'2020-09-30T14:40:34.983' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'fbd8e3eb-c680-4b46-94ed-2f7491c96c3f', N'54546464', CAST(N'1999-01-01' AS Date), NULL, N'other', N'6333e095-134c-4d4e-ad65-146e561cf43a', 1, 1, CAST(N'2020-10-02T14:27:03.420' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'20881147-d133-472c-a948-36ab4a4ea0bf', N'2', CAST(N'2020-10-07' AS Date), NULL, N'other', N'8435accc-471a-4cff-8e93-cb7b5e46ae16', 1, 1, CAST(N'2020-09-30T17:11:30.817' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'7ddfc9b2-e427-418d-a54d-37769c0de0a7', N'Today date', CAST(N'2020-11-06' AS Date), NULL, N'other', N'6b828367-1a21-45d3-9298-ce2666987ec8', 1, 1, CAST(N'2020-11-06T15:17:06.433' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'3b07c719-7b65-49ba-89b0-37954b471d84', N'Call to customer on below phone number 9824319758', CAST(N'2020-09-25' AS Date), NULL, N'Call', N'2c0b1fe7-d05b-4ea1-940d-f5002acc43c3', 1, 1, CAST(N'2020-09-30T14:26:32.500' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'ed7701fc-42d2-476e-8e5b-41858c680fd0', N'fsdfdssfsdfsdffsdfsdf', CAST(N'2020-09-30' AS Date), NULL, N'email', N'0ca90eda-7b7b-4813-af03-de9fd9350f69', 1, 1, CAST(N'2020-09-30T14:16:31.860' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'a0bde3c6-d3ff-4e7b-a395-47f1d4343761', N'sdfdsfsdf', CAST(N'2020-09-10' AS Date), NULL, N'other', N'2c0b1fe7-d05b-4ea1-940d-f5002acc43c3', 1, 1, CAST(N'2020-09-30T14:26:13.673' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'117b3899-572f-4318-b74d-4c09a588e202', N'sdfsdfsdfsdfsdf', CAST(N'1999-01-01' AS Date), NULL, N'email', N'418ad4b6-4fc1-42c6-8a9e-db05fee918bb', 1, 2, CAST(N'2020-10-01T15:22:47.333' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-01T15:22:50.050' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'f5691aca-cef3-44c9-876a-574b9acf8f70', N'Call the customer for next increment ', CAST(N'1999-01-01' AS Date), NULL, N'email', N'd4419944-4a89-4fe6-b4d2-e56bb97d8b25', 1, 1, CAST(N'2020-10-01T14:57:44.430' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'1d3825d2-a835-405d-a5f7-5e1be3602706', N'sdfdsfdsf', CAST(N'1999-01-01' AS Date), NULL, N'other', N'2941a853-8b89-4ac7-bfd5-46dc00978684', 1, 1, CAST(N'2020-10-02T12:42:43.180' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'bb4bb9df-e1d7-425d-a154-694ff60501e1', N'asdfdsf fsd fsdf', CAST(N'1999-01-01' AS Date), NULL, N'other', N'9c723e39-9ac0-4c9c-b759-65e72b3abb2a', 1, 1, CAST(N'2020-10-01T15:56:16.470' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'11522f8c-8044-454a-93a2-7287e0b8fa28', N'8787', CAST(N'2020-09-30' AS Date), NULL, N'other', N'5cbaf021-d79c-43fd-ad64-ba68d4b0399b', 1, 1, CAST(N'2020-09-30T14:43:58.937' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'b7c48849-b4b9-4896-8088-73a9b932c652', N'We need to call customer on every Day', CAST(N'2020-09-10' AS Date), NULL, N'other', N'7dbdf10b-ce6c-4ee4-b716-f95fb1e32ca9', 1, 1, CAST(N'2020-09-29T11:09:59.300' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'520c60db-6b60-490e-a8c5-78922bd625d6', N'ff', CAST(N'1999-01-01' AS Date), NULL, N'other', N'8d6b8241-2d33-4f17-86d2-0d01d1db508e', 1, 1, CAST(N'2020-09-30T14:48:25.390' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'bad75cfd-135e-40d7-8766-7b5000e68418', N'sfdsfsdf', CAST(N'2020-09-26' AS Date), NULL, N'other', N'8435accc-471a-4cff-8e93-cb7b5e46ae16', 1, 1, CAST(N'2020-09-30T17:11:16.433' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'f69c0da4-4a88-4b5e-869a-7e6513a83b15', N'sdfdsfds', CAST(N'2020-09-16' AS Date), NULL, N'other', N'8435accc-471a-4cff-8e93-cb7b5e46ae16', 1, 1, CAST(N'2020-09-30T17:11:08.673' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'611111d2-965f-4715-955e-8b2b8699ce57', N'dfdsfdsf', CAST(N'2020-09-30' AS Date), NULL, N'Call', N'8d6b8241-2d33-4f17-86d2-0d01d1db508e', 1, 1, CAST(N'2020-09-30T14:48:34.177' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'd1a2c91a-371d-4f4b-a00a-8e1c30b83627', N'We can call the customer ', CAST(N'2020-09-24' AS Date), NULL, N'other', N'8435accc-471a-4cff-8e93-cb7b5e46ae16', 1, 1, CAST(N'2020-09-30T17:10:49.973' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'6b9614c4-dba3-4e3c-bdb6-9046e84f5fea', N'dsfsdfsdafsdaf', CAST(N'2020-09-12' AS Date), NULL, N'other', N'64dbd55f-c745-4f00-9014-af7fecb33119', 1, 1, CAST(N'2020-09-30T14:24:14.060' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'7a756def-c665-44fc-aa56-946a21bd6cc0', N'fdfdsfds', CAST(N'2020-09-10' AS Date), NULL, N'Call', N'fad1a7ea-2558-4bf9-8177-9c848618eb19', 1, 1, CAST(N'2020-09-30T14:18:13.330' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'b1dbe909-f3ab-4be6-a39b-959fd81feede', N'affasfasdfas', CAST(N'2020-11-06' AS Date), NULL, N'other', N'6b828367-1a21-45d3-9298-ce2666987ec8', 1, 1, CAST(N'2020-11-06T15:16:51.553' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'21c079ee-bcfe-4682-822e-9852e492f442', N'sdfdsf', CAST(N'1999-01-01' AS Date), NULL, N'other', N'92b2c781-1696-4785-9a97-4bda260226b7', 1, 1, CAST(N'2020-10-02T12:52:58.723' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'ec584003-948c-4d60-bf46-99ffca93d289', N'Test todo', CAST(N'1999-01-01' AS Date), NULL, N'other', N'fc7bebd0-dd2d-47fe-b1d2-b999251e0f5b', 1, 1, CAST(N'2020-10-02T13:55:15.540' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'0dd1d687-2cb4-4631-92c1-9b41950c3a91', N'We need to call customer on ', CAST(N'2020-09-30' AS Date), NULL, N'Call', N'761aa6b1-0282-4a5d-b21f-1ad481ab2465', 1, 1, CAST(N'2020-09-30T14:14:44.330' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'7c52c8c6-b0ba-48e6-8f0e-9b68ea0e1345', N'vdsfsdfssfd', CAST(N'2020-09-16' AS Date), NULL, N'other', N'523affb4-3d85-4143-8af2-af4661500c07', 1, 1, CAST(N'2020-09-29T11:16:04.827' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'f0ef56aa-3422-4d85-8502-a5d44941167e', N'5465454546546', CAST(N'1999-01-01' AS Date), NULL, N'other', N'2941a853-8b89-4ac7-bfd5-46dc00978684', 1, 1, CAST(N'2020-10-02T12:42:40.097' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'92038cf4-cf16-4908-8768-ac2e6ae1cb3d', N'fsdfdsf', CAST(N'2020-09-18' AS Date), NULL, N'other', N'aa7f76a7-2b18-439e-9a56-56fd6b0cf308', 1, 1, CAST(N'2020-09-30T14:36:30.327' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'09d81755-b575-4c53-98e2-ac9e646a309f', N'cffsfsfsdaf', CAST(N'1999-01-01' AS Date), NULL, N'Call', N'523affb4-3d85-4143-8af2-af4661500c07', 1, 1, CAST(N'2020-09-29T11:16:16.157' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'f84f090d-4420-4129-a50e-b6fa06547cc0', N'9788978', CAST(N'2020-09-09' AS Date), NULL, N'other', N'bf475ed3-ba0b-4502-9524-8fb74ce02c87', 1, 1, CAST(N'2020-09-29T11:15:04.093' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'bea5a267-25d7-4025-a867-ba8361434e33', N'How to Clear my Data', CAST(N'1999-01-01' AS Date), NULL, N'email', N'c6362859-7c95-4abf-b9ae-dddfd5c8efc2', 1, 2, CAST(N'2020-10-01T15:02:52.550' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-01T15:14:33.213' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'bc7fa55a-a6aa-490c-89e0-bfcf9cfc2ada', N'54646', CAST(N'1999-01-01' AS Date), NULL, N'other', N'b60ce056-d220-4899-9b69-3fcc3f0e6a3a', 1, 1, CAST(N'2020-10-02T14:33:39.643' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'8900e15f-1785-4bc2-88c3-c085707a0e34', N'Todo', CAST(N'1999-01-01' AS Date), NULL, N'other', N'0bb49d81-2e6f-4762-b6cb-0627757ae836', 0, 1, CAST(N'2020-10-02T14:51:05.580' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-06T15:10:22.403' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'9c3dee7c-66f9-408f-9c4a-c214dc40e11c', N'fsfsdfdsfd', CAST(N'1999-01-01' AS Date), NULL, N'other', N'e47a7d71-3479-4bc3-9340-531ae4e7ebe6', 1, 1, CAST(N'2020-10-01T15:48:47.250' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'1f9460b1-9ff7-4adb-9fd0-c7a7db0f5403', N'dfgdfdsfdf', CAST(N'2020-09-25' AS Date), NULL, N'Call', N'76a7c5de-8d9f-486c-89cc-ee287b281559', 1, 1, CAST(N'2020-09-30T14:46:32.770' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'9e1e595e-db0e-4be1-b252-c7ddf61b7a3f', N'ewfsdfsdfsdfdsfdsf', CAST(N'2020-09-25' AS Date), NULL, N'Call', N'8435accc-471a-4cff-8e93-cb7b5e46ae16', 1, 1, CAST(N'2020-09-30T17:11:05.030' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'36a465f4-01ef-49eb-b172-cb05b21c0e6c', N'Todo test data', CAST(N'1999-01-01' AS Date), NULL, N'other', N'af7d12ac-ac9a-4b32-829d-7679178797ac', 1, 1, CAST(N'2020-10-02T12:49:46.907' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'f37122d2-a322-49b0-9093-cd35bf672899', N'sffsdf', CAST(N'1999-01-01' AS Date), NULL, N'other', N'9c723e39-9ac0-4c9c-b759-65e72b3abb2a', 1, 1, CAST(N'2020-10-01T15:56:39.183' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'92fb259f-d8a8-4e6a-a533-d013b2f243c9', N'gfdgfdgfdg', CAST(N'1999-01-01' AS Date), NULL, N'other', N'6b828367-1a21-45d3-9298-ce2666987ec8', 1, 1, CAST(N'2020-11-06T15:15:13.367' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'd53669e7-9d3a-45a1-8aa9-d0c1fb8f5140', N'sfdsf', CAST(N'2020-09-05' AS Date), NULL, N'other', N'424cbfa1-86a6-464f-93a0-494884e76f19', 1, 1, CAST(N'2020-09-30T14:37:28.217' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'4d9a8ccc-a698-4fa2-b31a-d1bb16f6c106', N'Todo Name', CAST(N'1999-01-01' AS Date), NULL, N'Call', N'6333e095-134c-4d4e-ad65-146e561cf43a', 1, 1, CAST(N'2020-10-02T14:26:52.907' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'255bdfee-ae64-4221-a1b8-d4d72e7602ad', N'fsfsdafsdafsdf', CAST(N'1999-01-01' AS Date), NULL, N'other', N'1a6c4081-a939-4559-bb2b-8f5efe1ce099', 0, 1, CAST(N'2020-10-01T16:34:58.573' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-10-01T16:35:05.233' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'59ff29e7-e473-476a-b46a-d612eb167cfa', N'sdfdsfsf', CAST(N'1999-01-01' AS Date), NULL, N'other', N'6b828367-1a21-45d3-9298-ce2666987ec8', 1, 1, CAST(N'2020-11-06T15:11:39.910' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'adefeaeb-55aa-4aca-904a-d7ba4c82fe6c', N'test this new test', CAST(N'1999-01-01' AS Date), NULL, N'other', N'6b828367-1a21-45d3-9298-ce2666987ec8', 1, 2, CAST(N'2020-11-06T15:13:08.557' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-11-06T15:26:11.313' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a')
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'7674bcdc-07d7-4aac-be45-e4afa7ed61cd', N'fdfsdfdsfdsf', CAST(N'1999-01-01' AS Date), NULL, N'other', N'c6362859-7c95-4abf-b9ae-dddfd5c8efc2', 1, 1, CAST(N'2020-10-01T15:04:43.757' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
INSERT [dbo].[tbl_Todo] ([TodoId], [TodoName], [TodoDate], [TodoTime], [TodoType], [LeadId], [IsActive], [TodoStatus], [CreatedDate], [CreateBy], [ModifiedDate], [ModifedBy]) VALUES (N'190e66c4-ccd1-4046-843c-f3e8361f7427', N'4545', CAST(N'1999-01-01' AS Date), NULL, N'other', N'1a6c4081-a939-4559-bb2b-8f5efe1ce099', 1, 1, CAST(N'2020-10-01T16:34:50.027' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_TodoStatus] ON 
GO
INSERT [dbo].[tbl_TodoStatus] ([TodoStatusId], [Status]) VALUES (1, N'Pending')
GO
INSERT [dbo].[tbl_TodoStatus] ([TodoStatusId], [Status]) VALUES (2, N'Resolve')
GO
INSERT [dbo].[tbl_TodoStatus] ([TodoStatusId], [Status]) VALUES (3, N'System Resolve')
GO
SET IDENTITY_INSERT [dbo].[tbl_TodoStatus] OFF
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'7c87bbf0-c5e0-47a8-b88d-05db8233d825', N'suraj kumarddddd', N'yyy@gmaiul.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-06T18:10:59.953' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-07-09T13:30:00.450' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'71d466dd-79f8-4e2c-8607-0ae857bb751a', N'fsdfsda', N'uuuu@gmail.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-06T18:11:49.597' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-07-09T13:24:13.090' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'2150fabf-112a-442b-ba2b-15841bbd3733', N'Himanshu', N'Himanshu@gmail.com', N'797484de-6ea1-4aff-9ca7-b4065ea6bc94', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-06-30T15:34:13.000' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'74d9119e-e6b7-44d5-ba62-1f77d176c086', N'Kapil dev', N'kapildev@gmail.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-06T19:23:34.420' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'd2666264-4655-42a5-8cb6-342987196c36', N'New Test user', N'iii@gmail.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-06T18:09:17.647' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'82f05fad-b293-4854-b2ac-3dd7e198a523', N'Manoj Kumar', N'maonj@gmail.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-06T18:03:22.357' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'9ab740b0-286b-4ad4-a679-6f71338b2799', N'Pawan Ghosi', N'pawan@gmail.com', N'797484de-6ea1-4aff-9ca7-b4065ea6bc94', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-06-24T17:25:19.413' AS DateTime), N'00000000-0000-0000-0000-000000000000', NULL, NULL, N'00000000-0000-0000-0000-000000000000')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'2c93fc16-adf1-45ed-aa5a-75aeaefc6cee', N'Bhai Mere', N'Maruti@gamil.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-01T15:40:29.130' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'31a4bb2b-f10a-424e-bfc1-7d4a64f6db32', N'Kapil', N'kapil@gmail.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-03T16:51:27.460' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'suraj', N'suraj@gmail.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-06-23T21:26:43.783' AS DateTime), NULL, NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e7df116b-bcf8-4af6-84c3-99ef3952c58f', N'MUkesh kumar ghosi', N'mukesh@gmail.com', N'797484de-6ea1-4aff-9ca7-b4065ea6bc94', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-03T17:01:45.917' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'a7c60bed-21dd-4c21-8674-a1ba34905627', N'M S Dhoni2', N'Msdhoni@gmail.com', N'797484de-6ea1-4aff-9ca7-b4065ea6bc94', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-06T19:24:05.933' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-07-09T13:33:54.447' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e4520578-557e-4211-9c08-a2ee47269af7', N'dev bhai mere', N'dev@gmail.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-09T13:38:27.560' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
ALTER TABLE [dbo].[AddressBook] ADD  CONSTRAINT [DF_AddressBook_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[tbl_Archive] ADD  CONSTRAINT [DF_tbl_Archive_archivedId]  DEFAULT (newid()) FOR [archivedId]
GO
ALTER TABLE [dbo].[tbl_Area] ADD  CONSTRAINT [DF_tbl_Area_AreaId]  DEFAULT (newid()) FOR [AreaId]
GO
ALTER TABLE [dbo].[tbl_Contact] ADD  CONSTRAINT [DF_tbl_Contact_ContactId]  DEFAULT (newid()) FOR [ContactId]
GO
ALTER TABLE [dbo].[tbl_Files] ADD  CONSTRAINT [DF_tbl_Files_FileID]  DEFAULT (newid()) FOR [FileId]
GO
ALTER TABLE [dbo].[tbl_LeadAccess] ADD  CONSTRAINT [DF_tbl_LeadAccess_AccessID]  DEFAULT (newid()) FOR [AccessID]
GO
ALTER TABLE [dbo].[tbl_Leads] ADD  CONSTRAINT [DF_tbl_Leads_LeadId]  DEFAULT (newid()) FOR [LeadId]
GO
ALTER TABLE [dbo].[tbl_Notes] ADD  CONSTRAINT [DF_tbl_Notes_NoteId]  DEFAULT (newid()) FOR [NoteId]
GO
ALTER TABLE [dbo].[tbl_Organization] ADD  CONSTRAINT [DF_tbl_Organization_OrgID_1]  DEFAULT (newid()) FOR [OrgID]
GO
ALTER TABLE [dbo].[tbl_PipeLine] ADD  CONSTRAINT [DF_tbl_PipeLine_PipeID]  DEFAULT (newid()) FOR [PipeID]
GO
ALTER TABLE [dbo].[tbl_Product] ADD  CONSTRAINT [DF_tbl_Product_ProductId]  DEFAULT (newid()) FOR [ProductId]
GO
ALTER TABLE [dbo].[tbl_Role] ADD  CONSTRAINT [DF_tbl_Role_RoleId]  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[tbl_Source] ADD  CONSTRAINT [DF_tbl_Source_SourceId]  DEFAULT (newid()) FOR [SourceId]
GO
ALTER TABLE [dbo].[tbl_Stage] ADD  CONSTRAINT [DF_tbl_Stage_StageId]  DEFAULT (newid()) FOR [StageId]
GO
ALTER TABLE [dbo].[tbl_Tag] ADD  CONSTRAINT [DF_tbl_Tag_TagId]  DEFAULT (newid()) FOR [TagId]
GO
ALTER TABLE [dbo].[tbl_Todo] ADD  CONSTRAINT [DF_tbl_Todo_TodoId]  DEFAULT (newid()) FOR [TodoId]
GO
ALTER TABLE [dbo].[tbl_User] ADD  CONSTRAINT [DF_tbl_User_UserId]  DEFAULT (newid()) FOR [UserId]
GO
/****** Object:  StoredProcedure [dbo].[AddContact]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[AddContact](@contactname nvarchar(800),@ContactDesignation nvarchar(800),@ContactEmail nvarchar(800),@ContactPhone nvarchar(50),@contactAddress nvarchar(max),@ContactOrg nvarchar(800),@leadid nvarchar(100),@createdby nvarchar(100))
As
begin
set nocount on
insert into tbl_Contact(ContactName,ContactDesignation,ContactEmail,ContactPhone,ContactAddress,ContactOrg,LeadId,IsActive,CreatedBy,CreatedDate)
values(@contactname,@ContactDesignation,@ContactEmail,@ContactPhone,@contactAddress,@ContactOrg,@leadid,1,@createdby,getdate())
end
GO
/****** Object:  StoredProcedure [dbo].[AddContactDetails]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddContactDetails](@contactName nvarchar(800),@ContactDesignation nvarchar(800),
@contactEmail nvarchar(50),@contactPhone nvarchar(50),@contactAddress nvarchar(max),@contactOrg nvarchar(max),@leadId uniqueidentifier,
@craetedBy uniqueidentifier)
As
begin 
set nocount on
DECLARE @MyTableVar table([ContactId] [uniqueidentifier]);  
insert into tbl_Contact(ContactName,ContactDesignation,ContactEmail,ContactPhone,ContactAddress,ContactOrg,LeadId,CreatedBy,CreatedDate,IsActive)
OUTPUT INSERTED.[ContactId] INTO @MyTableVar      
values(@contactName,@ContactDesignation,@contactEmail,@contactPhone,@contactAddress,@contactOrg,@leadId,@craetedBy,getdate(),1)        
select [ContactId] from @MyTableVar
END
GO
/****** Object:  StoredProcedure [dbo].[AddFiles]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddFiles](@fileName nvarchar(max),@filePath nvarchar(max),@leadId uniqueidentifier,@createdBy uniqueidentifier)  
As  
Begin  
set nocount on  
DECLARE @MyTableVar table([FileId] [uniqueidentifier]);  
insert into tbl_Files(FileName,FilePath,LeadId,CreatedBy,CreatedDate,IsActive)  
OUTPUT INSERTED.[FileId] INTO @MyTableVar          
values(@fileName,@filePath,@leadId,@createdBy,GETDATE(),1)  
select [FileId] from @MyTableVar    
  
END
GO
/****** Object:  StoredProcedure [dbo].[AddLeadManageAccess]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddLeadManageAccess](@userId uniqueidentifier,@leadId uniqueidentifier,@createdBy uniqueidentifier)    
As    
Begin    
set nocount on    
DECLARE @MyTableVar table([AccessID] [uniqueidentifier]);
if (select count(1)  from tbl_LeadAccess where UserId=@userId and LeadId=@leadId) =0
begin
insert into  tbl_LeadAccess(UserId,LeadId,CreatedBy,CreatedDate,IsActive)    
OUTPUT INSERTED.[AccessID] INTO @MyTableVar            
values(@userId,@leadId,@createdBy,getdate(),1)    
select [AccessID] from @MyTableVar      
end
else 
begin
 select '';
end    
END
GO
/****** Object:  StoredProcedure [dbo].[ADDLEADS]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADDLEADS](@LeadsId nvarchar(100),@LEADNAME NVARCHAR(500),@leadvalue DECIMAL(18,2),@ASSIGNUSER NVARCHAR(100),@PIPEID NVARCHAR(100),@STAGEID NVARCHAR(100),@CREATEDBY NVARCHAR(100),@ORGID NVARCHAR(100))  
AS  
BEGIN  
SET NOCOUNT ON  

IF(@LeadsId <> '' AND @LeadsId is not null AND @LeadsId <> '00000000-0000-0000-0000-000000000000')  
begin
  update tbl_Leads set LeadName=@LEADNAME,LeadValue=@leadvalue,AssignUser=@ASSIGNUSER,StageId=@STAGEID,PipeId=@PIPEID,ModifiedBy=@CREATEDBY,ModifiedDate=getdate()
  where LeadId=@LeadsId
  select '1'
end
else 
begin      

DECLARE @MyTableVar table([LeadId] [uniqueidentifier]);    
 DECLARE @LeadId uniqueidentifier   
INSERT INTO tbl_Leads(LeadName,LeadValue,AssignUser,PipeId,StageId,IsActive,CreateDate,CreatedBy,OrgId)  
OUTPUT INSERTED.[LeadId] INTO @MyTableVar    
VALUES(@LEADNAME,@leadvalue,@ASSIGNUSER,@PIPEID,@STAGEID,1,GETDATE(),@CREATEDBY,@ORGID)  
 SELECT @LeadId=[LeadId] FROM @MyTableVar;   
   
 select  @LeadId
 end  
END
GO
/****** Object:  StoredProcedure [dbo].[AddNotes]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddNotes](@Notes nvarchar(max),@leadId uniqueidentifier,@createdBy uniqueidentifier)
As
Begin
set nocount on
DECLARE @MyTableVar table([NoteId] [uniqueidentifier]);
insert into tbl_Notes(Notes,LeadId,CreatedBy,CreatedDate,IsActive)
OUTPUT INSERTED.[NoteId] INTO @MyTableVar        
values(@Notes,@leadId,@createdBy,getdate(),1)
select [NoteId] from @MyTableVar  

END
GO
/****** Object:  StoredProcedure [dbo].[ADDPRODUCT]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADDPRODUCT](@productName nvarchar(max),@productprice decimal(18,6),
@productDiscount decimal(18,6),@discountpercentage float,@quantity int,@leadid uniqueidentifier,
@createdBy uniqueidentifier)
AS
BEGIN
 set nocount on
  DECLARE @MyTableVar table([ProductId] [uniqueidentifier]);  
insert into tbl_Product(ProductName,ProductPrice,ProductDiscount,DiscountPercentage,
ProductDiscountPrice,Quantity,LeadId,IsActive,CreatedBy,CreatedDate)  
OUTPUT INSERTED.[ProductId] INTO @MyTableVar          
values(@productName,@productprice,@productDiscount,@discountpercentage,(@productprice-@productDiscount),@quantity,@leadid,1,@createdBy,getdate())
select [ProductId] from @MyTableVar
END
GO
/****** Object:  StoredProcedure [dbo].[AddSource]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddSource](@Source nvarchar(max),@leadId uniqueidentifier,@createdBy uniqueidentifier)  
As  
Begin  
set nocount on  
DECLARE @MyTableVar table([SourceId] [uniqueidentifier]);  
insert into  tbl_Source(SourceName,LeadId,CreatedBy,CreatedDate,IsActive)  
OUTPUT INSERTED.[SourceId] INTO @MyTableVar          
values(@Source,@leadId,@createdBy,getdate(),1)  
select [SourceId] from @MyTableVar    
  
END
GO
/****** Object:  StoredProcedure [dbo].[AddTodo]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddTodo](@TodoName nvarchar(800),@tododate datetime,@todoTime nvarchar(10),@Leadid nvarchar(100),@todoType nvarchar(50),@CreatedBy nvarchar(100))      
as      
begin      
set nocount on      
DECLARE @MyTableVar table([todoId] [uniqueidentifier]);
insert into tbl_Todo(TodoName,TodoDate,TodoTime,LeadId,TodoType,IsActive,CreateBy,CreatedDate,todoStatus)      
OUTPUT INSERTED.[TodoId] INTO @MyTableVar    
values(@TodoName,@tododate,@todoTime,@Leadid,@todoType,1,@CreatedBy,getdate(),1)      
 select [todoId] from @MyTableVar
 
end
GO
/****** Object:  StoredProcedure [dbo].[ADDUPDATEPIPELINE]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



    
    
CREATE PROC [dbo].[ADDUPDATEPIPELINE](@PIPELINEID NVARCHAR(100),@PIPELINENAME NVARCHAR(500),@ISDEFAULT BIT,@USERID NVARCHAR(100),@ORGID NVARCHAR(100))      
AS      
BEGIN      
SET NOCOUNT ON      
   
IF(@PIPELINEID <> '' AND @PIPELINEID is not null AND @PIPELINEID <> '00000000-0000-0000-0000-000000000000')      
BEGIN     
    
    IF EXISTS(SELECT 1  FROM tbl_PipeLine WHERE PipeName=@PIPELINENAME AND PipeID <> @PIPELINEID AND OrgId=@ORGID AND IsActive=1)      
  BEGIN      
    SELECT 1  -- MEANS PIPENAME ALREADY EXITS      
  END      
  ELSE      
  BEGIN     
  IF(@ISDEFAULT=1)  
  BEGIN  
  UPDATE tbl_PipeLine SET IsDefault=0  where OrgId=@ORGID
  END  
   
   UPDATE tbl_PipeLine SET PipeName=@PIPELINENAME ,IsDefault=@ISDEFAULT,ModifiedBy=@USERID,ModifiedDate=GETDATE() WHERE PipeID=@PIPELINEID      
   SELECT 3 --- UPDATE SUCCESSFULLY      
  END      
END      
   ELSE      
BEGIN      
    
 IF EXISTS(SELECT 1  FROM tbl_PipeLine WHERE PipeName=@PIPELINENAME  AND OrgId=@ORGID AND IsActive=1)      
  BEGIN      
    SELECT 1  -- MEANS PIPENAME ALREADY EXITS      
  END      
  ELSE      
  BEGIN      
   IF(@ISDEFAULT=1)  
   BEGIN  
  UPDATE tbl_PipeLine SET IsDefault=0  where OrgId=@ORGID
   END  
   INSERT INTO tbl_PipeLine (PipeName,IsDefault,IsActive,CreatedBy,CreatedDate,OrgId)      
   VALUES(@PIPELINENAME,@ISDEFAULT,1,@USERID,GETDATE(),@ORGID)      
   SELECT 2 -- CREATED SUCCESSFULLY      
  END      
      
END      
END      
    
    
    
GO
/****** Object:  StoredProcedure [dbo].[ADDUPDATESTAGE]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADDUPDATESTAGE] (@STAGEID NVARCHAR(100),@STAGENAME NVARCHAR(500),@SEQUENCENUMBER INT,@PIPEID NVARCHAR(100),@USERID NVARCHAR(100))          
AS          
BEGIN          
SET NOCOUNT ON          
       
IF(@STAGEID <> '' AND @STAGEID is not null AND @STAGEID <> '00000000-0000-0000-0000-000000000000')          
BEGIN         
        
    IF EXISTS(SELECT 1  FROM tbl_Stage WHERE  stagename=@STAGENAME and   pipeid=@PIPEID AND stageid <> @STAGEID  AND IsActive=1)          
  BEGIN          
    SELECT 1  -- MEANS PIPENAME ALREADY EXITS          
  END          
  ELSE          
  BEGIN          
   UPDATE tbl_Stage SET StageName=@STAGENAME,SequenceNumber=@SEQUENCENUMBER,PipeID=@PIPEID, ModifiedBy=@USERID,ModifiedDate=GETDATE() WHERE StageId=@STAGEID    
   SELECT 3 --- UPDATE SUCCESSFULLY          
  END          
END          
   ELSE          
BEGIN          
        
 IF EXISTS(SELECT 1  FROM tbl_Stage WHERE StageName=@STAGENAME and PipeID=@PIPEID AND IsActive=1)          
  BEGIN          
    SELECT 1  -- MEANS PIPENAME ALREADY EXITS          
  END          
  ELSE          
  BEGIN          
 declare @count int
select @count=count(1) from  tbl_Stage WHERE PipeID=@PIPEID
   INSERT INTO tbl_Stage (StageName,SequenceNumber,PipeID,IsActive,CreatedBy,CreatedDate)          
   VALUES(@STAGENAME,(@count+1),@PIPEID,1,@USERID,GETDATE())          
   SELECT 2 -- CREATED SUCCESSFULLY          
  END          
          
END          
END          
       
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateUser]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  

  --exec AddUpdateUser '7c87bbf0-c5e0-47a8-b88d-05db8233d825','82fcabb2-40af-4776-bca4-7bd04daf707e','suraj kumar','yyy@gmaiul.com','0b7683f2-4937-437d-bb5c-a5155c3a8ffa','m3GEfvGZMPY4bu9Hw6mF3w==','8360ffdb-0344-4079-b1de-8b16f28a8f7a'

 CREATE proc [dbo].[AddUpdateUser](@id nvarchar(max),@orgid nvarchar(max),@name nvarchar(800),@email nvarchar(800),@roleid nvarchar(max),@password nvarchar(800),@userid nvarchar(max))  
 as  
 begin  
 set nocount on  
  if @id <> '' and @id is not  null and @id <> '00000000-0000-0000-0000-000000000000'
  begin
  
  update tbl_User set Name=@name,@roleid=@roleid,ModifiedDate=GETDATE(),ModifiedBy=@userid where UserId=@id
   select 3 -- udpate user successfully
  end
  else
  begin
 if((select count(1) from tbl_User where Email=@email and IsActive=1) >0)  
  begin  

     select 1 -- email already extis  
  end  
  else  
  begin  
   insert into tbl_User(Name,Email,RoleID,Password,IsActive,CreatedBy,CreatedDate,OrgId)  
   values(@name,@email,@roleid,@password,1,@userid,GETDATE(),@orgid)  
   select 2  
  end  

  end
  end


 
GO
/****** Object:  StoredProcedure [dbo].[AddZone]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AddZone](@AreaName nvarchar(800),@leadid nvarchar(100),@CreatedBy nvarchar(100))  
as  
begin  
set nocount on  
DECLARE @MyTableVar table([AreaId] [uniqueidentifier]);   
insert into tbl_Area(AreaName,LeadId,IsActive,CreatedBy,CreateDate)  
OUTPUT INSERTED.[AreaId] INTO @MyTableVar  
values(@AreaName,@leadid,1,@CreatedBy,getdate())  
select [AreaId] from @MyTableVar
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[DeleteContact](@contactid uniqueidentifier, @modifiedBy uniqueidentifier)
as
begin
update tbl_Contact set IsActive=0,ModifiedBy=@modifiedBy,ModifiedDate=GETDATE() where ContactId=@contactid
end
GO
/****** Object:  StoredProcedure [dbo].[deleteFile]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[deleteFile](@fileid uniqueidentifier,@modifiedBy uniqueidentifier)
As
begin
set nocount on
update tbl_Files set isactive=0 , ModifiedBy=@modifiedBy, ModifiedDate=getdate() where FileId=@fileid

end
GO
/****** Object:  StoredProcedure [dbo].[DeleteLeadManageAccess]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteLeadManageAccess](@Accessid uniqueidentifier,@modifiedby uniqueidentifier)  
As  
BEGIN  
set nocount on  
  update tbl_LeadAccess set IsActive=0,ModifiedBy=@modifiedby,ModifiedDate=getdate()  
  where AccessID=@Accessid  
end
GO
/****** Object:  StoredProcedure [dbo].[deleteNotes]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[deleteNotes](@noteid uniqueidentifier,@modifiedby uniqueidentifier)
AS
BEGIN
set nocount on
update tbl_Notes set IsActive=0,ModifiedBy=@modifiedby,ModifiedDate=GETDATE() 
where NoteId=@noteid
END
GO
/****** Object:  StoredProcedure [dbo].[DELETEPIPELINE]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DELETEPIPELINE](@PIPELINEID NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON

UPDATE tbl_PipeLine SET IsActive=0 WHERE PipeID=@PIPELINEID
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteProduct](@productId uniqueidentifier,@modifiedBy uniqueidentifier)
as
begin
set nocount on
update tbl_Product set IsActive=0 ,ModifiedBy=@modifiedBy,ModifiedDate=getdate()
where ProductId=@productId
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteSource]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteSource](@SourceId uniqueidentifier,@modified uniqueidentifier)
As
BEGIN
set nocount on
  update tbl_Source set IsActive=0,ModifiedBy=@modified,ModifiedDate=getdate()
  where SourceId=@SourceId
end
GO
/****** Object:  StoredProcedure [dbo].[DELETESTAGE]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DELETESTAGE](@STATGEID NVARCHAR(100))  
AS  
BEGIN  
SET NOCOUNT ON  
  
UPDATE tbl_Stage SET IsActive=0 WHERE StageId=@STATGEID
END  
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserId]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Suraj Kumar Ghosi>
-- Create date: <03-07-2020>
-- Description:	<Delete User by ID>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUserId](@id nvarchar(800))
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update tbl_User set IsActive=0 where UserId=@id 
	
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteZone]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteZone](@areaid uniqueidentifier,@modifiedby uniqueidentifier)    
As    
BEGIN    
set nocount on    
  update tbl_Area set IsActive=0,ModifiedBy=@modifiedby,ModifiedDate=getdate()    
  where AreaId=@areaid  
end
GO
/****** Object:  StoredProcedure [dbo].[directAddLead]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[directAddLead](@leadName nvarchar(max),@createdBy uniqueidentifier,@orgId uniqueidentifier )
as
begin
set nocount on
declare @pipeId uniqueidentifier,@stageid uniqueidentifier
select top 1  @pipeId=  PipeID from tbl_PipeLine where OrgId=@orgId and IsActive=1 and IsDefault=1
select top 1  @stageid=  StageId from tbl_Stage where PipeID=@pipeId and SequenceNumber=1

DECLARE @MyTableVar table([LeadId] [uniqueidentifier]);      
 DECLARE @LeadId uniqueidentifier     
INSERT INTO tbl_Leads(LeadName,PipeId,StageId,IsActive,CreateDate,CreatedBy,OrgId)    
OUTPUT INSERTED.[LeadId] INTO @MyTableVar      
VALUES(@LEADNAME,@pipeId,@stageid,1,GETDATE(),@CREATEDBY,@ORGID)    
 SELECT @LeadId=[LeadId] FROM @MyTableVar;     
     
 select LeadId,LeadName,isnull(LeadValue,0) as leadValue,isnull(assignUser,'00000000-0000-0000-0000-000000000000') as assignUser, PipeId,StageId,CreateDate from tbl_Leads where LeadId= @LeadId 
 end
GO
/****** Object:  StoredProcedure [dbo].[GetAllFile]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[GetAllFile](@leadId uniqueidentifier)
as 
begin
set nocount on
select FileName,FilePath from tbl_Files where LeadId=@leadId order by CreatedDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllLeadAccess]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetAllLeadAccess](@leadId uniqueidentifier)
as
begin
set nocount on
select la.UserId,tu.Name,la.AccessID,la.LeadId from tbl_LeadAccess la join tbl_User tu on la.UserId= tu.UserId
where la.LeadId=@leadId
order by la.CreatedDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetAllNotesByLeadId]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetAllNotesByLeadId](@leadId uniqueidentifier)
as
begin
set nocount on
select noteid, notes from tbl_Notes where LeadId=@leadId order by CreatedDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[GETALLPIPELINE]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GETALLPIPELINE](@ORGID NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON
SELECT PipeID,PipeName,IsDefault FROM tbl_PipeLine WHERE OrgId=@ORGID AND IsActive=1 ORDER BY CreatedDate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProduct]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetAllProduct](@leadId uniqueidentifier)
AS
BEGIN
SET NOCOUNT ON
SELECT ProductId,ProductName,ProductPrice,ProductDiscount,ProductDiscountPrice FROM tbl_Product WHERE LeadId=@leadId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSource]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetAllSource](@leadId uniqueidentifier)
AS 
BEGIN
SET NOCOUNT ON
select SourceName,SourceId from tbl_Source where LeadId=@leadId 
end
GO
/****** Object:  StoredProcedure [dbo].[GETALLSTAGE]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GETALLSTAGE](@PIPEID NVARCHAR(100))    
AS    
BEGIN    
SET NOCOUNT ON    
SELECT StageId,StageName,SequenceNumber,PipeID FROM tbl_Stage WHERE PipeID=@PIPEID AND IsActive=1 ORDER BY SequenceNumber
END 
GO
/****** Object:  StoredProcedure [dbo].[GetAllUser]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Suraj,,Name>  
-- Create date: <30-06-2020>  
-- Description: <Get all user from system>  
-- =============================================  
CREATE PROCEDURE [dbo].[GetAllUser](@orgid nvarchar(max),@Page INT,
@Size INT)  
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    SELECT tu.UserId, tu.Name,tu.Email,tr.RoleName FROM tbl_User tu join tbl_Role  tr  
 on tu.RoleID = tr.RoleId  
 WHERE tu.OrgId=@orgid AND tu.IsActive=1 and (tr.OrgId is null or tr.OrgId=@orgid)  
 ORDER BY tu.UserId
	--OFFSET (@Page -1) * @Size ROWS
	--FETCH NEXT @Size ROWS ONLY
END  
GO
/****** Object:  StoredProcedure [dbo].[GetAllZone]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[GetAllZone](@leadId uniqueidentifier)
as
begin
set nocount on
select AreaName,AreaId from tbl_Area where LeadId=@leadId order by CreateDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[GetContactDetailsByLeadId]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetContactDetailsByLeadId](@leadId uniqueidentifier)
as
begin
set nocount on
select ContactId,ContactName,isnull(ContactEmail,'') as ContactEmail
,isnull(ContactAddress,'') as ContactAddress,
isnull(ContactDesignation,'') as ContactDesignation,
isnull(ContactOrg,'') as ContactOrg,
isnull(ContactPhone,'') as ContactPhone  from tbl_contact where LeadId=@leadId
end
GO
/****** Object:  StoredProcedure [dbo].[getLeadByLeadId]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


  
CREATE proc [dbo].[getLeadByLeadId](@leadId uniqueidentifier)  
AS  
BEGIN  
SET NOCOUNT ON  
  
SELECT LeadName,isnull(LeadValue,0) as LeadValue,isnull(TU.Name,'') as assignUserName FROM tbl_Leads TL left JOIN tbl_User TU ON TL.AssignUser=TU.UserId  
WHERE TL.LeadId=@leadId  
  
END
GO
/****** Object:  StoredProcedure [dbo].[getLeadsById]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getLeadsById](@pipeId nvarchar(100),@stageid nvarchar(100))  
as  
begin  
set nocount on  

select tl.LeadId,tl.LeadName,tl.LeadValue,tl.AssignUser,tl.PipeId,tl.StageId,isnull(tu.Name,'') as assignUserName,convert(varchar, CreateDate, 101) as CreateDate from tbl_Leads tl  left join 
tbl_User tu on tl.AssignUser=tu.UserId    where PipeId=@pipeId and StageId=@stageid and tl.IsActive=1
  
end
GO
/****** Object:  StoredProcedure [dbo].[GETPIPELINEBYID]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GETPIPELINEBYID](@PIPELINEID NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON

SELECT PipeID,PipeName,IsDefault FROM tbl_PipeLine WHERE PipeID=@PIPELINEID

END
GO
/****** Object:  StoredProcedure [dbo].[getRoleMaster]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getRoleMaster](@orgid nvarchar(500))
as 
begin
set nocount on

select RoleId,RoleName from tbl_role where OrgId=@orgid or OrgId is null

end
GO
/****** Object:  StoredProcedure [dbo].[GETSTAGEBYID]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[GETSTAGEBYID](@STAGEID NVARCHAR(100))    
AS    
BEGIN    
SET NOCOUNT ON      
SELECT StageId,StageName,SequenceNumber,PipeID FROM tbl_Stage WHERE StageId=@STAGEID   
END 
GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author:  <Suraj Kumar Ghosi>  
-- Create date: <03-07-2020>  
-- Description: <Get user by id>  
-- =============================================  
CREATE PROCEDURE [dbo].[GetUserById](@id nvarchar(800))  
   
AS  
BEGIN  
 -- SET NOCOUNT ON added to prevent extra result sets from  
 -- interfering with SELECT statements.  
 SET NOCOUNT ON;  
  
    -- Insert statements for procedure here  
 select UserId , name as fullName,Email as emailAddress,RoleID as role,Password as password  from tbl_User where UserId=@id   
END  
GO
/****** Object:  StoredProcedure [dbo].[MoveLead]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[MoveLead](@leadId nvarchar(100),@stageId nvarchar(100),@modifiedby nvarchar(100))
as
begin
set nocount on
update tbl_Leads set StageId=@stageId ,ModifiedBy=@modifiedby,ModifiedDate=getdate() where LeadId=@leadId 
end
GO
/****** Object:  StoredProcedure [dbo].[TodoList]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TodoList](@leadId UNIQUEIDENTIFIER)  
as  
begin  
set nocount on  
  
select todoId,TodoName,TodoType,isnull(TodoDate,'') as TodoDate,isnull(TodoTime,'') as TodoTime   
,
 
CASE
    WHEN todostatus = 1 THEN 'Pending'
    WHEN todostatus = 2 THEN 'Completed'
    ELSE 'Completed by System'
END AS todostatus
,todostatus as todoflag
,tu.Name from tbl_Todo tt inner join   
tbl_User tu on tt.CreateBy =tu.UserId  
  
 where LeadId=@leadId and tt.IsActive=1  
  
end 
GO
/****** Object:  StoredProcedure [dbo].[UpdateLeadDetails]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Proc [dbo].[UpdateLeadDetails](@leadId uniqueidentifier,@leadName nvarchar(max),
@leadPipeLineId uniqueidentifier,@leadStageId uniqueidentifier,@leadValue decimal(18,2),@userid uniqueidentifier, @updateFlag int)
as
begin
set nocount on
if @updateFlag=1 
begin
   update tbl_Leads set LeadName=@leadName ,ModifiedBy=@userid,ModifiedDate=GETDATE() where LeadId=@leadId
end
else if @updateFlag=2
begin
  update tbl_Leads set PipeId=@leadPipeLineId,StageId=@leadStageId ,ModifiedBy=@userid,ModifiedDate=GETDATE() where LeadId=@leadId
end
else if @updateFlag=3
begin
update tbl_Leads set LeadValue=@leadValue ,ModifiedBy=@userid,ModifiedDate=GETDATE() where LeadId=@leadId
end
else
begin
update tbl_Leads set IsActive=1 where LeadId=@leadId
insert into tbl_archive(leadId,archivedStatusTypeId,
archivedReason,createdBy,createdDate,modifiedBy,modifiedDate,isactive) values(@leadId,3,'Delete by User',@userid,GETDATE(),null,null,1)
end
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateStage]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROC [dbo].[UpdateStage](@stageid nvarchar(100),@sequenceNumber int)
AS
BEGIN
SET NOCOUNT ON
			update tbl_Stage set SequenceNumber=@sequenceNumber where StageId=@stageid
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTodo]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateTodo](@todoid UNIQUEIDENTIFIER,@todoName nvarchar(max),@todoDate datetime,@todoTime nvarchar(10),@modifiedby UNIQUEIDENTIFIER)
as
begin 
set nocount on

update tbl_Todo set TodoName=@todoName,TodoDate=@todoDate,TodoTime=@todoTime,ModifedBy=@modifiedby,ModifiedDate=getdate()
 where TodoId=@todoid

 end
GO
/****** Object:  StoredProcedure [dbo].[updateTodoStatus]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateTodoStatus](@todoid UNIQUEIDENTIFIER,@updateFlag int,@status int,@modifiedby UNIQUEIDENTIFIER )  
 as  
 begin  
 set nocount on  
 if @updateFlag = 1  
 begin  
 update tbl_Todo set todostatus=@status, ModifedBy=@modifiedby,ModifiedDate=getdate() where TodoId=@todoid  
 end  
 else   
 begin  
  update tbl_Todo set IsActive=0 ,ModifedBy=@modifiedby,ModifiedDate=getdate()where TodoId=@todoid  
 end  
 end
GO
/****** Object:  StoredProcedure [dbo].[Usp_RegisterOrgnization]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec Usp_RegisterOrgnization 'test','test@gmail.com'
CREATE proc [dbo].[Usp_RegisterOrgnization](@orgName nvarchar(800),@emailAddress nvarchar(800),@Name nvarchar(800),@password nvarchar(800))
as
begin
SET NOCOUNT ON
  --- first check user email exits or not

  if ((select count(1) from tbl_User where Email =@emailAddress and isactive=1) > 0)
  begin
    select 1 -- EMAIL ALREADY EXITS
  end
  else  if ((select count(1) from tbl_Organization where OrgName =@orgName and isactive=1) >0 )
  begin
    select 2 -- ORG ALREADY EXITS
  end
  else 
  begin
 
  --- org creation
  DECLARE @MyTableVar table([OrgID] [uniqueidentifier]);
  DECLARE @ORGID uniqueidentifier
 INSERT INTO tbl_Organization (OrgName,UserLimit,LeadLimit,StroageLimit,StartDate,EndDate,CreateDate,CreatedEmail,Isactive)
  OUTPUT INSERTED.[OrgID] INTO @MyTableVar
 VALUES(@orgName,100,100,100,GETDATE(),GETDATE(),GETDATE(),@emailAddress,1)

  SELECT @ORGID=[OrgID] FROM @MyTableVar;
  ----end
  --- user creation part

  INSERT INTO TBL_USER (NAME,EMAIL,RoleID,Password,IsActive,CreatedDate,OrgId)
  values(@Name,@emailAddress,'0B7683F2-4937-437D-BB5C-A5155C3A8FFA',@password,1,GETDATE(),@ORGID)

  SELECT 3 -- ORG AND USER CREATED SUCCESSFULLY
  end
  end
 
 
GO
/****** Object:  StoredProcedure [dbo].[USP_VALIDATEUSER]    Script Date: 12/25/2020 9:38:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_VALIDATEUSER](@USERNAME NVARCHAR(100),@PASSWORD NVARCHAR(100))    
AS    
BEGIN    
SET NOCOUNT ON    
    
SELECT Name,UserID ,OrgId,RoleID FROM tbl_User WHERE Email=@USERNAME AND Password=@PASSWORD    
    
END
GO

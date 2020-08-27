USE [master]
GO
/****** Object:  Database [TMSLive]    Script Date: 27-08-2020 15:08:00 ******/
CREATE DATABASE [TMSLive]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TMSLive', FILENAME = N'C:\Users\Suraj\TMSLive.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TMSLive_log', FILENAME = N'C:\Users\Suraj\TMSLive_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TMSLive] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TMSLive].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TMSLive] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TMSLive] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TMSLive] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TMSLive] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TMSLive] SET ARITHABORT OFF 
GO
ALTER DATABASE [TMSLive] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TMSLive] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TMSLive] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TMSLive] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TMSLive] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TMSLive] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TMSLive] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TMSLive] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TMSLive] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TMSLive] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TMSLive] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TMSLive] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TMSLive] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TMSLive] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TMSLive] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TMSLive] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TMSLive] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TMSLive] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TMSLive] SET  MULTI_USER 
GO
ALTER DATABASE [TMSLive] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TMSLive] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TMSLive] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TMSLive] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TMSLive] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TMSLive] SET QUERY_STORE = OFF
GO
USE [TMSLive]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [TMSLive]
GO
/****** Object:  Table [dbo].[AddressBook]    Script Date: 27-08-2020 15:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressBook](
	[id] [uniqueidentifier] NULL,
	[name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Area]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Contact]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Files]    Script Date: 27-08-2020 15:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Files](
	[FileID] [uniqueidentifier] NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[FilePath] [nvarchar](max) NULL,
	[LeadId] [uniqueidentifier] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_tbl_Files] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_LeadAccess]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Leads]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Notes]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Organization]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_PipeLine]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 27-08-2020 15:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ProductId] [uniqueidentifier] NOT NULL,
	[ProductName] [nvarchar](800) NULL,
	[ProductPrice] [decimal](18, 0) NULL,
	[ProductDiscount] [decimal](18, 0) NULL,
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
/****** Object:  Table [dbo].[tbl_Role]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Source]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Stage]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Tag]    Script Date: 27-08-2020 15:08:01 ******/
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
/****** Object:  Table [dbo].[tbl_Todo]    Script Date: 27-08-2020 15:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Todo](
	[TodoId] [uniqueidentifier] NOT NULL,
	[TodoName] [nvarchar](800) NULL,
	[TodoDate] [date] NULL,
	[TodoTime] [nvarchar](10) NULL,
	[LeadId] [uniqueidentifier] NULL,
	[IsActive] [bit] NULL,
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
/****** Object:  Table [dbo].[tbl_User]    Script Date: 27-08-2020 15:08:01 ******/
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
INSERT [dbo].[tbl_Organization] ([OrgID], [OrgName], [UserLimit], [LeadLimit], [StroageLimit], [StartDate], [EndDate], [CreateDate], [CreatedEmail], [Isactive]) VALUES (N'82fcabb2-40af-4776-bca4-7bd04daf707e', N'Happpy Home', 100, 100, 100, CAST(N'2020-06-23T21:26:43.770' AS DateTime), CAST(N'2020-06-23T21:26:43.770' AS DateTime), CAST(N'2020-06-23T21:26:43.770' AS DateTime), N'suraj@gmail.com', 1)
GO
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [IsActive], [OrgId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifedBy]) VALUES (N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'Admin', 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[tbl_Role] ([RoleId], [RoleName], [IsActive], [OrgId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifedBy]) VALUES (N'797484de-6ea1-4aff-9ca7-b4065ea6bc94', N'User', 1, NULL, NULL, NULL, NULL, NULL)
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
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e7df116b-bcf8-4af6-84c3-99ef3952c58f', N'MUkesh kumar ghosi', N'mukesh@gmail.com', N'797484de-6ea1-4aff-9ca7-b4065ea6bc94', N'm3GEfvGZMPY4bu9Hw6mF3w==', 0, NULL, CAST(N'2020-07-03T17:01:45.917' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'a7c60bed-21dd-4c21-8674-a1ba34905627', N'M S Dhoni2', N'Msdhoni@gmail.com', N'797484de-6ea1-4aff-9ca7-b4065ea6bc94', N'm3GEfvGZMPY4bu9Hw6mF3w==', 0, NULL, CAST(N'2020-07-06T19:24:05.933' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', CAST(N'2020-07-09T13:33:54.447' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
INSERT [dbo].[tbl_User] ([UserId], [Name], [Email], [RoleID], [Password], [IsActive], [BioPic], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [OrgId]) VALUES (N'e4520578-557e-4211-9c08-a2ee47269af7', N'dev bhai mere', N'dev@gmail.com', N'0b7683f2-4937-437d-bb5c-a5155c3a8ffa', N'm3GEfvGZMPY4bu9Hw6mF3w==', 1, NULL, CAST(N'2020-07-09T13:38:27.560' AS DateTime), N'8360ffdb-0344-4079-b1de-8b16f28a8f7a', NULL, NULL, N'82fcabb2-40af-4776-bca4-7bd04daf707e')
GO
ALTER TABLE [dbo].[AddressBook] ADD  CONSTRAINT [DF_AddressBook_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[tbl_Area] ADD  CONSTRAINT [DF_tbl_Area_AreaId]  DEFAULT (newid()) FOR [AreaId]
GO
ALTER TABLE [dbo].[tbl_Contact] ADD  CONSTRAINT [DF_tbl_Contact_ContactId]  DEFAULT (newid()) FOR [ContactId]
GO
ALTER TABLE [dbo].[tbl_Files] ADD  CONSTRAINT [DF_tbl_Files_FileID]  DEFAULT (newid()) FOR [FileID]
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
/****** Object:  StoredProcedure [dbo].[ADDUPDATEPIPELINE]    Script Date: 27-08-2020 15:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ADDUPDATEPIPELINE](@PIPELINEID NVARCHAR(100),@PIPELINENAME NVARCHAR(500),@ISDEFAULT BIT,@USERID NVARCHAR(100),@ORGID NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON

IF(@PIPELINEID <> '' AND @PIPELINEID <> NULL AND @PIPELINEID <> '00000000-0000-0000-0000-000000000000')
BEGIN
        IF EXISTS(SELECT 1  FROM tbl_PipeLine WHERE PipeName=@PIPELINENAME AND PipeID <> @PIPELINEID AND OrgId=@ORGID AND IsActive=1)
		BEGIN
		  SELECT 1  -- MEANS PIPENAME ALREADY EXITS
		END
		ELSE
		BEGIN
		 UPDATE tbl_PipeLine SET PipeName=@PIPELINENAME ,IsDefault=@ISDEFAULT,ModifiedBy=@USERID,ModifiedDate=GETDATE() WHERE PipeID=@PIPELINEID
		 SELECT 2 --- UPDATE SUCCESSFULLY
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
		 INSERT INTO tbl_PipeLine (PipeName,IsDefault,IsActive,CreatedBy,CreatedDate,OrgId)
			VALUES(@PIPELINENAME,@ISDEFAULT,1,@USERID,GETDATE(),@ORGID)
			SELECT 3 -- CREATED SUCCESSFULLY
		END

END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUpdateUser]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[DELETEPIPELINE]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteUserId]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[GETALLPIPELINE]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllUser]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[GETPIPELINEBYID]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[getRoleMaster]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[Usp_RegisterOrgnization]    Script Date: 27-08-2020 15:08:02 ******/
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
/****** Object:  StoredProcedure [dbo].[USP_REGISTERUSER]    Script Date: 27-08-2020 15:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_REGISTERUSER](@USRNAME NVARCHAR(100),@PASSWORD NVARCHAR(20),@FIRSTNAME NVARCHAR(50),@LASTNAME NVARCHAR(50),
@EMAILADDRESS NVARCHAR(200),@ORGNAME NVARCHAR(500),@ADDRESS NVARCHAR(1000),@CONTACTNUMBER NVARCHAR(50))
AS
BEGIN
DECLARE @ORGID uniqueidentifier

insert into tbl_organization(orgname,address,contactnumber,isactive,CreatedDate,isDemo,ExpireDate,limitofuser,StroageLimit)
values(@ORGNAME,@ADDRESS,@CONTACTNUMBER,1,GETDATE(),1,GETDATE(),50,10)




  select top  1  @ORGID= orgid from tbl_organization order by CreatedDate desc

INSERT INTO tbl_Users(UserName,[password],firstname,lastname,isactive,emailaddress,registerdate,orgid)
 values(@USRNAME,@PASSWORD,@FIRSTNAME,@LASTNAME,1,@EMAILADDRESS,GETDATE(),@ORGID)

 select 1

END
GO
/****** Object:  StoredProcedure [dbo].[USP_VALIDATEUSER]    Script Date: 27-08-2020 15:08:02 ******/
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
USE [master]
GO
ALTER DATABASE [TMSLive] SET  READ_WRITE 
GO

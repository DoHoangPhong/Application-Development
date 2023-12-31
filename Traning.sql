USE [master]
GO
/****** Object:  Database [Tranning]    Script Date: 12/17/2023 5:51:01 PM ******/
CREATE DATABASE [Tranning]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tranning', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tranning.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tranning_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tranning_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tranning] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tranning].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tranning] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tranning] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tranning] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Tranning] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tranning] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tranning] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tranning] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tranning] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tranning] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tranning] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tranning] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tranning] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tranning] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tranning] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tranning] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tranning] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tranning] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tranning] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tranning] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tranning] SET RECOVERY FULL 
GO
ALTER DATABASE [Tranning] SET  MULTI_USER 
GO
ALTER DATABASE [Tranning] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tranning] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tranning] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tranning] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tranning] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tranning] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tranning', N'ON'
GO
ALTER DATABASE [Tranning] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tranning] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tranning]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/17/2023 5:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[icon] [varchar](200) NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 12/17/2023 5:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[vote] [int] NULL,
	[avatar] [varchar](200) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/17/2023 5:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[status] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[topics]    Script Date: 12/17/2023 5:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](150) NULL,
	[videos] [nvarchar](250) NULL,
	[documents] [varchar](150) NULL,
	[attach_file] [varchar](150) NULL,
	[status] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
 CONSTRAINT [PK_topics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainee_course]    Script Date: 12/17/2023 5:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainee_course](
	[trainee_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trainner_topic]    Script Date: 12/17/2023 5:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trainner_topic](
	[trainner_id] [int] NOT NULL,
	[topic_id] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/17/2023 5:51:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[address] [varchar](100) NULL,
	[gender] [varchar](50) NOT NULL,
	[birthday] [datetime] NULL,
	[avatar] [varchar](100) NULL,
	[last_login] [datetime] NULL,
	[last_logout] [datetime] NULL,
	[status] [int] NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[deleted_at] [datetime] NULL,
	[full_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name], [description], [icon], [status], [created_at], [updated_at], [deleted_at]) VALUES (1, N'phong123', N'adasdasdasda', N'3d30e7aa-a29a-403b-8aa2-9994db0700bb-Screenshot 2023-08-10 182445.png', N'Active', CAST(N'2023-12-15T20:54:39.000' AS DateTime), NULL, NULL)
INSERT [dbo].[categories] ([id], [name], [description], [icon], [status], [created_at], [updated_at], [deleted_at]) VALUES (2, N'12312312', N'adasdas', N'eaab1a79-d806-4e8b-a402-b1ff6b3fc995-Screenshot 2023-08-10 182517.png', N'Active', CAST(N'2023-12-15T20:55:01.000' AS DateTime), NULL, CAST(N'2023-12-15T20:55:03.000' AS DateTime))
INSERT [dbo].[categories] ([id], [name], [description], [icon], [status], [created_at], [updated_at], [deleted_at]) VALUES (3, N'demo', NULL, N'cb8d1a0d-86c3-4fe5-b5c6-a6591264000b-Screenshot 2023-08-10 182410.png', N'Active', CAST(N'2023-12-15T21:13:26.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [category_id], [name], [description], [start_date], [end_date], [vote], [avatar], [status], [created_at], [updated_at], [deleted_at]) VALUES (1, 1, N'ádqweqwe', N'ádasdasd', CAST(N'2023-12-05' AS Date), CAST(N'2023-12-09' AS Date), NULL, N'5658e523-7132-449b-a642-df29d17e4f67-Screenshot 2023-08-10 182436.png', N'Active', CAST(N'2023-12-15T20:55:18.000' AS DateTime), NULL, NULL)
INSERT [dbo].[courses] ([id], [category_id], [name], [description], [start_date], [end_date], [vote], [avatar], [status], [created_at], [updated_at], [deleted_at]) VALUES (2, 3, N'demo1', N'12', CAST(N'2023-12-15' AS Date), CAST(N'2023-12-30' AS Date), NULL, N'd977c5c2-c01b-4600-b663-aac2829c2af7-Screenshot 2023-08-10 180635.png', N'Active', CAST(N'2023-12-15T21:14:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[courses] ([id], [category_id], [name], [description], [start_date], [end_date], [vote], [avatar], [status], [created_at], [updated_at], [deleted_at]) VALUES (3, 3, N'C#', N'1', CAST(N'2023-12-17' AS Date), CAST(N'2023-12-31' AS Date), NULL, N'9db069ab-90f4-4059-b934-bdeb84350a05-Screenshot 2023-08-10 182458.png', N'Active', CAST(N'2023-12-17T14:29:47.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name], [description], [status], [created_at], [updated_at], [deleted_at]) VALUES (1, N'staff', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[roles] ([id], [name], [description], [status], [created_at], [updated_at], [deleted_at]) VALUES (2, N'admin', NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[roles] ([id], [name], [description], [status], [created_at], [updated_at], [deleted_at]) VALUES (3, N'user', NULL, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[topics] ON 

INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1, 1, N'css', N'ádafad', N'7147b023-9f17-4790-afba-c00e6f34b50b-videosdemo.mp4', NULL, N'Object reference not set to an instance of an object.', 1, CAST(N'2023-12-15T21:44:04.000' AS DateTime), NULL, CAST(N'2023-12-17T10:10:09.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (2, 3, N'html', N'123', N'947f7923-0cc2-41fa-82e7-7acb4a399480-mov_bbb.mp4', N'0b6f7981-75a5-40c0-8b87-d93004278681-Doc1.docx', N'bde1ec88-021a-40dd-aced-9f9ef4d88b2c-Screenshot 2023-08-10 182410.png', 1, CAST(N'2023-12-15T21:47:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (3, 1, N'sa', N'ádafad', NULL, NULL, N'Object reference not set to an instance of an object.', 1, CAST(N'2023-12-15T21:47:43.000' AS DateTime), NULL, CAST(N'2023-12-15T21:47:46.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (4, 1, N'js', N'ádafad', NULL, NULL, N'Object reference not set to an instance of an object.', 1, CAST(N'2023-12-15T21:49:06.000' AS DateTime), NULL, CAST(N'2023-12-16T09:41:36.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1002, 2, N'C#', N'12', NULL, NULL, N'Object reference not set to an instance of an object.', 1, CAST(N'2023-12-16T09:43:46.000' AS DateTime), NULL, CAST(N'2023-12-16T09:43:53.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1003, 2, N'test', N'123', NULL, NULL, N'Object reference not set to an instance of an object.', 1, CAST(N'2023-12-16T10:04:20.000' AS DateTime), NULL, CAST(N'2023-12-16T10:07:38.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1004, 1, N'test', N'sdfghj', NULL, NULL, N'Object reference not set to an instance of an object.', 1, CAST(N'2023-12-16T10:07:32.000' AS DateTime), NULL, CAST(N'2023-12-16T10:07:37.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1006, 1, N'test', N'aa', N'34e581ea-4c1e-4b04-8cc0-83365dd0b078-Argon Dashboard 2 by Creative Tim - C?c C?c 2023-02-14 11-11-24.mp4', NULL, N'f5f778ba-d894-4ff1-93fa-c7421c519004-Screenshot 2023-08-10 180635.png', 0, CAST(N'2023-12-16T13:11:49.000' AS DateTime), NULL, CAST(N'2023-12-16T13:15:48.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1007, 2, N'test', N'aa', N'978255ef-1600-411b-9dfc-668f47877d62-Argon Dashboard 2 by Creative Tim - C?c C?c 2023-02-14 11-11-24.mp4', NULL, N'7430d1ea-faae-49da-97ea-0fb342d6b131-Screenshot 2023-08-10 180635.png', 1, CAST(N'2023-12-16T13:16:37.000' AS DateTime), NULL, CAST(N'2023-12-16T13:17:09.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1008, 2, N'test', N'aaa', N'acffa871-ff73-43f7-9e0b-6afb8bd0ff3d-videosdemo.mp4', N'd88ef0e5-be39-4489-a2f7-1c230739e96a-ASM2-AD-Evaluation_1st-DoVanToan_BH00136.docx', N'aff570b7-6c11-4884-abda-1335c6416405-Screenshot 2023-08-10 180635.png', 1, CAST(N'2023-12-16T13:18:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1009, 1, N'css', N'ádafad', N'fafdb951-4ae4-4bf7-9262-6bb9309b45f0-CapCut 2023-08-14 20-16-42.mp4', NULL, N'2d98dd29-6a56-49a4-951e-43c7a0dafee0-Screenshot 2023-08-10 180635.png', 1, CAST(N'2023-12-16T13:24:57.000' AS DateTime), NULL, CAST(N'2023-12-16T13:25:06.000' AS DateTime))
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1010, 2, N'html', N'112', N'dad09a03-5ecf-4fdd-8767-71763705124e-mov_bbb.mp4', NULL, N'c66b7db5-e674-40ee-b75a-6f6df061150b-Screenshot 2023-08-10 182451.png', 1, CAST(N'2023-12-16T14:56:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1011, 2, N'C#', N'1', N'91007db7-f6fe-46da-8601-1d14a7a88fb2-videosdemo.mp4', N'801eb25c-8830-4a9f-9410-0cd7365c7a6c-ASM2-1ST-ComputingResearch-IT0501-PhiHung-BH00017.docx', N'cb04372a-036c-49d6-b564-8a4415f27b42-Screenshot 2023-08-10 182451.png', 1, CAST(N'2023-12-17T09:45:20.000' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1012, 2, N'demo01', N'1', N'6ca14f26-7f40-4090-8598-a5d85c10d141-videosdemo.mp4', N'8473a6d5-e6b2-487f-93ba-8d6dc4014a1c-272929419_1115689432544258_883349875939500180_n.jpg', N'f241dc75-aa98-41b6-ac55-de2744eca379-Screenshot 2023-08-10 180635.png', 1, CAST(N'2023-12-17T09:47:34.000' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1013, 2, N'JS', N'123', N'9a795346-6dd3-41ca-8268-8c3534933c93-mov_bbb.mp4', N'45e455bc-657a-487f-921d-033a51d31334-SRS-Group3-IT0501-AD.docx', N'7239bcb5-fe1c-4c58-b865-7abcba261712-Screenshot 2023-08-10 182451.png', 1, CAST(N'2023-12-17T10:09:53.000' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1014, 2, N'demo01', N'1', N'a30afb2f-3c66-4ac8-be7a-8dadc24a7ca5-videosdemo.mp4', N'a74e1dba-d065-46aa-8550-a90bde829e38-Doc1.docx', N'61909906-40e1-4bf2-a6e7-5ca6a98c6736-Screenshot 2023-08-10 180635.png', 0, CAST(N'2023-12-17T11:35:46.000' AS DateTime), NULL, NULL)
INSERT [dbo].[topics] ([id], [course_id], [name], [description], [videos], [documents], [attach_file], [status], [created_at], [updated_at], [deleted_at]) VALUES (1015, 2, N'C#', N'1', N'baf66113-041d-49f0-b61c-227fecb339c1-mov_bbb.mp4', N'9d5d1d3c-d92f-4d48-b793-3757a80354b0-Doc1.docx', N'fea207fa-0ca0-4bcf-aa14-84724cb41aa6-Screenshot 2023-08-10 180635.png', 1, CAST(N'2023-12-17T11:43:57.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[topics] OFF
GO
INSERT [dbo].[trainee_course] ([trainee_id], [course_id], [created_at], [updated_at], [deleted_at]) VALUES (7, 1, CAST(N'2023-12-15T21:05:19.000' AS DateTime), NULL, NULL)
INSERT [dbo].[trainee_course] ([trainee_id], [course_id], [created_at], [updated_at], [deleted_at]) VALUES (7, 2, CAST(N'2023-12-15T21:14:56.000' AS DateTime), NULL, NULL)
INSERT [dbo].[trainee_course] ([trainee_id], [course_id], [created_at], [updated_at], [deleted_at]) VALUES (8, 2, CAST(N'2023-12-15T21:19:29.000' AS DateTime), NULL, NULL)
INSERT [dbo].[trainee_course] ([trainee_id], [course_id], [created_at], [updated_at], [deleted_at]) VALUES (7, 2, CAST(N'2023-12-17T09:22:18.000' AS DateTime), NULL, NULL)
INSERT [dbo].[trainee_course] ([trainee_id], [course_id], [created_at], [updated_at], [deleted_at]) VALUES (7, 2, CAST(N'2023-12-17T10:11:36.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[trainner_topic] ([trainner_id], [topic_id], [created_at], [updated_at], [deleted_at]) VALUES (7, 1, CAST(N'2023-12-16T13:35:14.000' AS DateTime), NULL, CAST(N'2023-12-16T14:42:00.000' AS DateTime))
INSERT [dbo].[trainner_topic] ([trainner_id], [topic_id], [created_at], [updated_at], [deleted_at]) VALUES (7, 1, CAST(N'2023-12-16T14:22:22.000' AS DateTime), NULL, CAST(N'2023-12-16T14:42:00.000' AS DateTime))
INSERT [dbo].[trainner_topic] ([trainner_id], [topic_id], [created_at], [updated_at], [deleted_at]) VALUES (7, 2, CAST(N'2023-12-16T14:42:27.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [role_id], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name]) VALUES (2, 1, N'staff', N'123456', N'staff@gmail.com', N'031731231231', N'viet nam', N'nam', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, N'staff')
INSERT [dbo].[users] ([id], [role_id], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name]) VALUES (4, 2, N'admin', N'123456', N'admin@gmail.com', N'012876213', N'ha noi', N'nu', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, N'admin')
INSERT [dbo].[users] ([id], [role_id], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name]) VALUES (7, 3, N'phong123', N'123456', N'phong@gmail.com', N'1254123', N'Liên Hà - Đông Anh - Hà N?i', N'Male', CAST(N'2023-12-29T00:00:00.000' AS DateTime), N'8d942c00-5acd-4654-a3e9-b809e02af16f-Screenshot 2023-08-10 182458.png', NULL, NULL, 1, CAST(N'2023-12-15T21:04:39.000' AS DateTime), NULL, NULL, N'phong')
INSERT [dbo].[users] ([id], [role_id], [username], [password], [email], [phone], [address], [gender], [birthday], [avatar], [last_login], [last_logout], [status], [created_at], [updated_at], [deleted_at], [full_name]) VALUES (8, 3, N'quân', N'123456', N'quansau@gmail.com', N'09218912', N'HN', N'Male', CAST(N'2023-12-15T00:00:00.000' AS DateTime), N'9cd1db3a-dbbf-480e-928d-a37221afce2f-Screenshot 2023-08-10 182507.png', NULL, NULL, 1, CAST(N'2023-12-15T21:19:09.000' AS DateTime), NULL, NULL, N'phan quân')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[categories] ADD  CONSTRAINT [DF_categories_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_vote]  DEFAULT ((0)) FOR [vote]
GO
ALTER TABLE [dbo].[courses] ADD  CONSTRAINT [DF_courses_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [DF_roles_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[topics] ADD  CONSTRAINT [DF_topics_staus]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_gender]  DEFAULT ((1)) FOR [gender]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_categories]
GO
ALTER TABLE [dbo].[topics]  WITH CHECK ADD  CONSTRAINT [FK_topics_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[topics] CHECK CONSTRAINT [FK_topics_courses]
GO
ALTER TABLE [dbo].[trainee_course]  WITH CHECK ADD  CONSTRAINT [FK_trainee_course_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[trainee_course] CHECK CONSTRAINT [FK_trainee_course_courses]
GO
ALTER TABLE [dbo].[trainee_course]  WITH CHECK ADD  CONSTRAINT [FK_trainee_course_users] FOREIGN KEY([trainee_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[trainee_course] CHECK CONSTRAINT [FK_trainee_course_users]
GO
ALTER TABLE [dbo].[trainner_topic]  WITH CHECK ADD  CONSTRAINT [FK_trainner_topic_topics] FOREIGN KEY([topic_id])
REFERENCES [dbo].[topics] ([id])
GO
ALTER TABLE [dbo].[trainner_topic] CHECK CONSTRAINT [FK_trainner_topic_topics]
GO
ALTER TABLE [dbo].[trainner_topic]  WITH CHECK ADD  CONSTRAINT [FK_trainner_topic_users] FOREIGN KEY([trainner_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[trainner_topic] CHECK CONSTRAINT [FK_trainner_topic_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
USE [master]
GO
ALTER DATABASE [Tranning] SET  READ_WRITE 
GO

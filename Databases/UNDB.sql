USE [master]
GO
/****** Object:  Database [UNDP]    Script Date: 14-Mar-21 5:38:34 PM ******/
CREATE DATABASE [UNDP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UNDP', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UNDP.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UNDP_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UNDP_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UNDP] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UNDP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UNDP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UNDP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UNDP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UNDP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UNDP] SET ARITHABORT OFF 
GO
ALTER DATABASE [UNDP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UNDP] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UNDP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UNDP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UNDP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UNDP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UNDP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UNDP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UNDP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UNDP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UNDP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UNDP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UNDP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UNDP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UNDP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UNDP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UNDP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UNDP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UNDP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UNDP] SET  MULTI_USER 
GO
ALTER DATABASE [UNDP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UNDP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UNDP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UNDP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UNDP]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 14-Mar-21 5:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeamID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Gender] [nvarchar](6) NULL,
	[DateOfBirth] [date] NULL,
	[ContactNo] [numeric](15, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teams]    Script Date: 14-Mar-21 5:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](100) NULL,
	[TeamDescription] [nvarchar](max) NULL,
	[ApprovedByManager] [int] NOT NULL,
	[ApprovedByDirector] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 14-Mar-21 5:38:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [char](32) NULL,
	[Role] [nvarchar](30) NULL,
	[DateOfBirth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TeamMembers] ON 

INSERT [dbo].[TeamMembers] ([ID], [TeamID], [Name], [Gender], [DateOfBirth], [ContactNo]) VALUES (1, 1, N'Alin Popa', N'Male', CAST(0x7F180B00 AS Date), CAST(123456789 AS Numeric(15, 0)))
INSERT [dbo].[TeamMembers] ([ID], [TeamID], [Name], [Gender], [DateOfBirth], [ContactNo]) VALUES (2, NULL, N'Alin Popa', N'Male', CAST(0x49420B00 AS Date), CAST(222 AS Numeric(15, 0)))
INSERT [dbo].[TeamMembers] ([ID], [TeamID], [Name], [Gender], [DateOfBirth], [ContactNo]) VALUES (3, NULL, N'George Alexandru', N'Male', CAST(0x57420B00 AS Date), CAST(222 AS Numeric(15, 0)))
INSERT [dbo].[TeamMembers] ([ID], [TeamID], [Name], [Gender], [DateOfBirth], [ContactNo]) VALUES (4, NULL, N'Alin Popa', N'Male', CAST(0x3B420B00 AS Date), CAST(333 AS Numeric(15, 0)))
INSERT [dbo].[TeamMembers] ([ID], [TeamID], [Name], [Gender], [DateOfBirth], [ContactNo]) VALUES (5, 6, N'Alexandru', N'Male', CAST(0x3B420B00 AS Date), CAST(333 AS Numeric(15, 0)))
INSERT [dbo].[TeamMembers] ([ID], [TeamID], [Name], [Gender], [DateOfBirth], [ContactNo]) VALUES (6, 6, N'Alexandru22', N'Other', CAST(0x4B420B00 AS Date), CAST(33333 AS Numeric(15, 0)))
SET IDENTITY_INSERT [dbo].[TeamMembers] OFF
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([ID], [TeamName], [TeamDescription], [ApprovedByManager], [ApprovedByDirector]) VALUES (1, N'Alin''s team', N'Just first example', 0, 0)
INSERT [dbo].[Teams] ([ID], [TeamName], [TeamDescription], [ApprovedByManager], [ApprovedByDirector]) VALUES (2, N'Team 1', N'Team approved by manager', 2, 0)
INSERT [dbo].[Teams] ([ID], [TeamName], [TeamDescription], [ApprovedByManager], [ApprovedByDirector]) VALUES (3, N'Team 2', N'Arroved by director, rejected by manager', 1, 2)
INSERT [dbo].[Teams] ([ID], [TeamName], [TeamDescription], [ApprovedByManager], [ApprovedByDirector]) VALUES (4, N'fff', N'gfgfgfg', 0, 0)
INSERT [dbo].[Teams] ([ID], [TeamName], [TeamDescription], [ApprovedByManager], [ApprovedByDirector]) VALUES (5, N'team bun', N'tttrtrtr', 0, 0)
INSERT [dbo].[Teams] ([ID], [TeamName], [TeamDescription], [ApprovedByManager], [ApprovedByDirector]) VALUES (6, N'test team good', N'test good', 0, 0)
SET IDENTITY_INSERT [dbo].[Teams] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Name], [Email], [Password], [Role], [DateOfBirth]) VALUES (1, N'alinpopa91', N'Alin Popa', N'alin.popa@live.com', N'7E0814966BB4C76E0BB90F97DCAD71A0', N'Manager', CAST(0x5A170B00 AS Date))
INSERT [dbo].[Users] ([ID], [UserName], [Name], [Email], [Password], [Role], [DateOfBirth]) VALUES (2, N'director', N'Director', N'alin91ro@gmail.com', N'7E0814966BB4C76E0BB90F97DCAD71A0', N'Director', CAST(0x5A170B00 AS Date))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Teams] ADD  DEFAULT ((0)) FOR [ApprovedByManager]
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT ((0)) FOR [ApprovedByDirector]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([TeamID])
REFERENCES [dbo].[Teams] ([ID])
GO
USE [master]
GO
ALTER DATABASE [UNDP] SET  READ_WRITE 
GO

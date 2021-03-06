USE [master]
GO
/****** Object:  Database [aa]    Script Date: 2017/3/20 星期一 下午 9:57:41 ******/
CREATE DATABASE [aa] ON  PRIMARY 
( NAME = N'aa', FILENAME = N'D:\作业\数据库\aa.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'aa_log', FILENAME = N'D:\作业\数据库\aa_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aa] SET ARITHABORT OFF 
GO
ALTER DATABASE [aa] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [aa] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [aa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [aa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [aa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [aa] SET  MULTI_USER 
GO
ALTER DATABASE [aa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aa] SET DB_CHAINING OFF 
GO
USE [aa]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2017/3/20 星期一 下午 9:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Cno] [char](6) NOT NULL,
	[Cname] [nvarchar](20) NOT NULL,
	[Ccredit] [tinyint] NULL,
	[Semster] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SC]    Script Date: 2017/3/20 星期一 下午 9:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SC](
	[Sno] [char](7) NOT NULL,
	[Cno] [char](6) NOT NULL,
	[Grade] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2017/3/20 星期一 下午 9:57:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Sno] [char](7) NOT NULL,
	[Sname] [nchar](5) NOT NULL,
	[Ssex] [nchar](1) NULL,
	[Sage] [tinyint] NULL,
	[Sdept] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Course] ([Cno], [Cname], [Ccredit], [Semster]) VALUES (N'C001  ', N'高等数学', 4, 9)
INSERT [dbo].[Course] ([Cno], [Cname], [Ccredit], [Semster]) VALUES (N'C002  ', N'大学英语', 3, 9)
INSERT [dbo].[Course] ([Cno], [Cname], [Ccredit], [Semster]) VALUES (N'C003  ', N'大学英语', 3, 9)
INSERT [dbo].[Course] ([Cno], [Cname], [Ccredit], [Semster]) VALUES (N'C004  ', N'计算机文化学', 2, 9)
INSERT [dbo].[Course] ([Cno], [Cname], [Ccredit], [Semster]) VALUES (N'C005  ', N'VB', 2, 9)
INSERT [dbo].[Course] ([Cno], [Cname], [Ccredit], [Semster]) VALUES (N'C006  ', N'数据库基础', 4, 9)
INSERT [dbo].[Course] ([Cno], [Cname], [Ccredit], [Semster]) VALUES (N'C007  ', N'数据结构', 4, 9)
INSERT [dbo].[Course] ([Cno], [Cname], [Ccredit], [Semster]) VALUES (N'C008  ', N'计算机网络', 4, 9)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611101', N'C001  ', 96)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611101', N'C002  ', 80)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611101', N'C003  ', 84)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611101', N'C005  ', 63)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611101', N'c008  ', 65)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611102', N'C001  ', 92)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611102', N'C002  ', 90)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611102', N'C004  ', 84)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0611102', N'c007  ', 65)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0621102', N'C001  ', 76)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0621102', N'C004  ', 85)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0621102', N'C005  ', 73)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0621102', N'C007  ', NULL)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0621103', N'C001  ', 50)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0621103', N'C004  ', 80)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0631101', N'C001  ', 50)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0631101', N'C004  ', 80)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0631102', N'C007  ', NULL)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0631103', N'c001  ', NULL)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0631103', N'c003  ', NULL)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0631103', N'C004  ', 78)
INSERT [dbo].[SC] ([Sno], [Cno], [Grade]) VALUES (N'0631103', N'C005  ', 65)
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0611101', N'李勇   ', N'男', 21, N'计算机系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0611102', N'刘晨   ', N'男', 20, N'计算机系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0611103', N'王敏   ', N'女', 20, N'计算机系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0611104', N'张小红  ', N'女', 19, N'计算机系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0621101', N'张立   ', N'男', 20, N'信息管理系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0621102', N'吴宾   ', N'女', 19, N'信息管理系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0621103', N'张海   ', N'男', 20, N'信息管理系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0631101', N'钱小平  ', N'女', 21, N'通信工程系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0631102', N'王大力  ', N'男', 20, N'通信工程系')
INSERT [dbo].[Student] ([Sno], [Sname], [Ssex], [Sage], [Sdept]) VALUES (N'0631103', N'张珊珊  ', N'女', 19, N'通信工程系')
USE [master]
GO
ALTER DATABASE [aa] SET  READ_WRITE 
GO

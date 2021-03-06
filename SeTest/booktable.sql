USE [master]
GO
/****** Object:  Database [Soft_item]    Script Date: 2017/12/26 22:03:35 ******/
CREATE DATABASE [Soft_item]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Soft_item', FILENAME = N'F:\sql server\sql实例根\MSSQL11.MSSQLSERVER\MSSQL\DATA\Soft_item.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Soft_item_log', FILENAME = N'F:\sql server\sql实例根\MSSQL11.MSSQLSERVER\MSSQL\DATA\Soft_item_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Soft_item] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Soft_item].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Soft_item] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Soft_item] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Soft_item] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Soft_item] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Soft_item] SET ARITHABORT OFF 
GO
ALTER DATABASE [Soft_item] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Soft_item] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Soft_item] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Soft_item] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Soft_item] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Soft_item] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Soft_item] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Soft_item] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Soft_item] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Soft_item] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Soft_item] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Soft_item] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Soft_item] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Soft_item] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Soft_item] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Soft_item] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Soft_item] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Soft_item] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Soft_item] SET RECOVERY FULL 
GO
ALTER DATABASE [Soft_item] SET  MULTI_USER 
GO
ALTER DATABASE [Soft_item] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Soft_item] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Soft_item] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Soft_item] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Soft_item', N'ON'
GO
USE [Soft_item]
GO
/****** Object:  StoredProcedure [dbo].[delete_Projecting_Complete]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_Projecting_Complete]
	@U_R_Email varchar(50)
as
	begin
	delete from Projecting_Complete
		where U_R_Email = @U_R_Email
	end
GO
/****** Object:  StoredProcedure [dbo].[delete_Projecting_Doing]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_Projecting_Doing]
	@U_R_Email varchar(50)
as
	begin
	delete from Projecting_Doing
		where U_R_Email = @U_R_Email
	end

GO
/****** Object:  StoredProcedure [dbo].[delete_Projecting_NotClose]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_Projecting_NotClose]
	@U_R_Email varchar(50)
as
	begin
	delete from Projecting_NotClose
		where U_R_Email = @U_R_Email
	end
GO
/****** Object:  StoredProcedure [dbo].[delete_User_Partake]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_User_Partake]
	@U_P_Email varchar(50)
as
	begin
	delete from User_Partake
		where U_P_Email = @U_P_Email
	end
GO
/****** Object:  StoredProcedure [dbo].[delete_User_Release]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_User_Release]
	@U_R_Email varchar(50)
as
	begin
	delete from User_Release
		where U_R_Email = @U_R_Email
	end
GO
/****** Object:  StoredProcedure [dbo].[insert_Projecting_NotClose]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_Projecting_NotClose]
	--@P_NC_ID varchar(50),
	@U_R_Email varchar(50),
	@P_NC_Num int,
	@P_NC_Info varchar(500),
	--@P_NC_Date datetime,
	@P_NC_Label varchar(50),
	@P_NC_Current int
as
	begin
	insert into Projecting_NotClose(U_R_Email,P_NC_Num,P_NC_Info,P_NC_Label,P_NC_Current)
	values(@U_R_Email,@P_NC_Num,@P_NC_Info,@P_NC_Label,@P_NC_Current)
	end
GO
/****** Object:  StoredProcedure [dbo].[insert_U_P_info]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_U_P_info]
	@U_P_Pwd  varchar(50),       
	@U_P_Email varchar(50) ,        
	@U_P_Tel varchar(20),       
	@U_P_Nick varchar(50), 
	@U_P_Sco int,
	@U_P_School varchar(50),
	@U_P_Info  varchar(500),       
	@U_P_Label varchar(50),
	@U_R_QQ varchar(50)
as
	begin
	insert into User_Partake
	values(@U_P_Pwd,@U_P_Email,@U_P_Tel,@U_P_Nick,@U_P_Sco,
			@U_P_School,@U_P_Info,@U_P_Label,@U_R_QQ)
	end
GO
/****** Object:  StoredProcedure [dbo].[insert_U_R_info]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insert_U_R_info]
	@U_R_Pwd varchar(50),
	@U_R_Email varchar(50),
	@U_R_Tel varchar(20),
	@U_R_Nick varchar(50),
	@U_R_Sco int,
	@U_R_QQ  varchar(50)
as
	begin
	insert into User_Release
	values(@U_R_Pwd,@U_R_Email,@U_R_Tel,@U_R_Nick,@U_R_Sco,@U_R_QQ)
	end

GO
/****** Object:  StoredProcedure [dbo].[select_P_U]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_P_U]
	@U_P_Email varchar(50)
as
	begin
	select P_U.*,Projecting_NotClose.P_NC_Info from P_U,Projecting_NotClose 
		where U_P_Email = @U_P_Email
	end


GO
/****** Object:  StoredProcedure [dbo].[select_U_P_info]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_U_P_info]
	@U_P_Email varchar(50)
as
	begin
	select * from dbo.User_Partake
		where U_P_Email = @U_P_Email
	end


GO
/****** Object:  StoredProcedure [dbo].[select_U_R_info]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_U_R_info]
	@U_R_Email varchar(50)
as
	begin
	select * from dbo.User_Release
		where U_R_Email = @U_R_Email
	end


GO
/****** Object:  StoredProcedure [dbo].[select_U_R_Project_Complete]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_U_R_Project_Complete]
	@U_R_Email varchar(50)
as
	begin
	select User_Release.U_R_Tel,User_Release.U_R_QQ,User_Release.U_R_Nick,
			User_Release.U_R_Sco,Projecting_Complete.*  from User_Release,Projecting_Complete
		where User_Release.U_R_Email = Projecting_Complete.U_R_Email 
		and User_Release.U_R_Email = @U_R_Email
	end

GO
/****** Object:  StoredProcedure [dbo].[select_U_R_Project_Doing]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_U_R_Project_Doing]
	@U_R_Email varchar(50)
as
	begin
	select User_Release.U_R_Tel,User_Release.U_R_QQ,User_Release.U_R_Nick,
			User_Release.U_R_Sco,Projecting_Doing.*  from User_Release,Projecting_Doing
		where User_Release.U_R_Email = Projecting_Doing.U_R_Email 
		and User_Release.U_R_Email = @U_R_Email
	end

GO
/****** Object:  StoredProcedure [dbo].[select_U_R_Project_NotClose]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_U_R_Project_NotClose]
	@U_R_Email varchar(50)
as
	begin
	select User_Release.U_R_Tel,User_Release.U_R_QQ,User_Release.U_R_Nick,
			User_Release.U_R_Sco,Projecting_NotClose.*  from User_Release,Projecting_NotClose
		where User_Release.U_R_Email = Projecting_NotClose.U_R_Email 
		and User_Release.U_R_Email = @U_R_Email
	end

GO
/****** Object:  Table [dbo].[P_U]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_U](
	[U_P_Email] [varchar](50) NOT NULL,
	[P_NC_ID] [int] NOT NULL,
 CONSTRAINT [PK_P_U] PRIMARY KEY CLUSTERED 
(
	[U_P_Email] ASC,
	[P_NC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projecting_Complete]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projecting_Complete](
	[P_C_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_R_Email] [varchar](50) NULL,
	[P_C_Num] [int] NOT NULL,
	[P_C_Info] [varchar](500) NOT NULL,
	[P_C_Label] [varchar](50) NULL,
 CONSTRAINT [PK_PROJECTING_COMPLETE] PRIMARY KEY NONCLUSTERED 
(
	[P_C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projecting_Doing]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projecting_Doing](
	[P_D_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_R_Email] [varchar](50) NULL,
	[P_D_Num] [int] NOT NULL,
	[P_D_Info] [varchar](500) NOT NULL,
	[P_D_Date] [datetime] NOT NULL,
	[P_D_Label] [varchar](50) NULL,
 CONSTRAINT [PK_PROJECTING_DOING] PRIMARY KEY NONCLUSTERED 
(
	[P_D_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Projecting_NotClose]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Projecting_NotClose](
	[P_NC_ID] [int] IDENTITY(1,1) NOT NULL,
	[U_R_Email] [varchar](50) NOT NULL,
	[P_NC_Num] [int] NOT NULL,
	[P_NC_Info] [varchar](500) NOT NULL,
	[P_NC_Date] [datetime] NOT NULL,
	[P_NC_Label] [varchar](50) NULL,
	[P_NC_Current] [int] NOT NULL,
 CONSTRAINT [PK_PROJECTING_NOTCLOSE] PRIMARY KEY NONCLUSTERED 
(
	[P_NC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Partake]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Partake](
	[U_P_Pwd] [varchar](50) NOT NULL,
	[U_P_Email] [varchar](50) NOT NULL,
	[U_P_Tel] [varchar](20) NOT NULL,
	[U_P_Nick] [varchar](50) NOT NULL,
	[U_P_Sco] [int] NOT NULL,
	[U_P_School] [varchar](50) NULL,
	[U_P_Info] [varchar](500) NULL,
	[U_P_Label] [varchar](50) NULL,
	[U_R_QQ] [varchar](50) NULL,
 CONSTRAINT [PK_USER_PARTAKE] PRIMARY KEY NONCLUSTERED 
(
	[U_P_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Release]    Script Date: 2017/12/26 22:03:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User_Release](
	[U_R_Pwd] [varchar](50) NOT NULL,
	[U_R_Email] [varchar](50) NOT NULL,
	[U_R_Tel] [varchar](20) NOT NULL,
	[U_R_Nick] [varchar](50) NOT NULL,
	[U_R_Sco] [int] NOT NULL,
	[U_R_QQ] [varchar](50) NULL,
 CONSTRAINT [PK_USER_RELEASE] PRIMARY KEY NONCLUSTERED 
(
	[U_R_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [P_U_FK]    Script Date: 2017/12/26 22:03:35 ******/
CREATE NONCLUSTERED INDEX [P_U_FK] ON [dbo].[P_U]
(
	[U_P_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [P_U2_FK]    Script Date: 2017/12/26 22:03:35 ******/
CREATE NONCLUSTERED INDEX [P_U2_FK] ON [dbo].[P_U]
(
	[P_NC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Relationship_3_FK]    Script Date: 2017/12/26 22:03:35 ******/
CREATE NONCLUSTERED INDEX [Relationship_3_FK] ON [dbo].[Projecting_Complete]
(
	[U_R_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Relationship_2_FK]    Script Date: 2017/12/26 22:03:35 ******/
CREATE NONCLUSTERED INDEX [Relationship_2_FK] ON [dbo].[Projecting_Doing]
(
	[U_R_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Relationship_1_FK]    Script Date: 2017/12/26 22:03:35 ******/
CREATE NONCLUSTERED INDEX [Relationship_1_FK] ON [dbo].[Projecting_NotClose]
(
	[U_R_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Projecting_Doing] ADD  CONSTRAINT [DF_P_D_Date]  DEFAULT (getdate()) FOR [P_D_Date]
GO
ALTER TABLE [dbo].[Projecting_NotClose] ADD  CONSTRAINT [DF_P_NC_Date]  DEFAULT (getdate()) FOR [P_NC_Date]
GO
ALTER TABLE [dbo].[User_Partake] ADD  CONSTRAINT [DF_U_P_Sco]  DEFAULT ((0)) FOR [U_P_Sco]
GO
ALTER TABLE [dbo].[User_Release] ADD  CONSTRAINT [DF_U_R_Sco]  DEFAULT ((0)) FOR [U_R_Sco]
GO
ALTER TABLE [dbo].[P_U]  WITH CHECK ADD  CONSTRAINT [FK_P_U_P_U_USER_PAR] FOREIGN KEY([U_P_Email])
REFERENCES [dbo].[User_Partake] ([U_P_Email])
GO
ALTER TABLE [dbo].[P_U] CHECK CONSTRAINT [FK_P_U_P_U_USER_PAR]
GO
ALTER TABLE [dbo].[P_U]  WITH CHECK ADD  CONSTRAINT [FK_P_U_P_U2_PROJECTI] FOREIGN KEY([P_NC_ID])
REFERENCES [dbo].[Projecting_NotClose] ([P_NC_ID])
GO
ALTER TABLE [dbo].[P_U] CHECK CONSTRAINT [FK_P_U_P_U2_PROJECTI]
GO
ALTER TABLE [dbo].[Projecting_Complete]  WITH CHECK ADD  CONSTRAINT [FK_PROJECTI_RELATIONS_USER_REL2] FOREIGN KEY([U_R_Email])
REFERENCES [dbo].[User_Release] ([U_R_Email])
GO
ALTER TABLE [dbo].[Projecting_Complete] CHECK CONSTRAINT [FK_PROJECTI_RELATIONS_USER_REL2]
GO
ALTER TABLE [dbo].[Projecting_Doing]  WITH CHECK ADD  CONSTRAINT [FK_PROJECTI_RELATIONS_USER_REL3] FOREIGN KEY([U_R_Email])
REFERENCES [dbo].[User_Release] ([U_R_Email])
GO
ALTER TABLE [dbo].[Projecting_Doing] CHECK CONSTRAINT [FK_PROJECTI_RELATIONS_USER_REL3]
GO
ALTER TABLE [dbo].[Projecting_NotClose]  WITH CHECK ADD  CONSTRAINT [FK_PROJECTI_RELATIONS_USER_REL1] FOREIGN KEY([U_R_Email])
REFERENCES [dbo].[User_Release] ([U_R_Email])
GO
ALTER TABLE [dbo].[Projecting_NotClose] CHECK CONSTRAINT [FK_PROJECTI_RELATIONS_USER_REL1]
GO
USE [master]
GO
ALTER DATABASE [Soft_item] SET  READ_WRITE 
GO

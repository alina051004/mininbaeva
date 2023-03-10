USE [master]
GO
/****** Object:  Database [apiShop]    Script Date: 10.03.2023 11:50:16 ******/
CREATE DATABASE [apiShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'apiShop', FILENAME = N'C:\Users\user\apiShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'apiShop_log', FILENAME = N'C:\Users\user\apiShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [apiShop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [apiShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [apiShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [apiShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [apiShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [apiShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [apiShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [apiShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [apiShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [apiShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [apiShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [apiShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [apiShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [apiShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [apiShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [apiShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [apiShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [apiShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [apiShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [apiShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [apiShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [apiShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [apiShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [apiShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [apiShop] SET RECOVERY FULL 
GO
ALTER DATABASE [apiShop] SET  MULTI_USER 
GO
ALTER DATABASE [apiShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [apiShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [apiShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [apiShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [apiShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [apiShop] SET QUERY_STORE = OFF
GO
USE [apiShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [apiShop]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[carts_id] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[carts_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id_user] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[delivery_id] [int] NOT NULL,
	[status_id] [int] NOT NULL,
	[date] [date] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_item]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_item](
	[order_item_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Orders_item] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[item_id] [int] NOT NULL,
	[item_name] [nvarchar](50) NOT NULL,
	[item_description] [nvarchar](100) NULL,
	[warehouse_quantity] [int] NOT NULL,
	[price] [int] NULL,
	[category_id] [int] NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_id] [int] NOT NULL,
	[role_name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specs]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specs](
	[spec_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[spec_name] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Specs] PRIMARY KEY CLUSTERED 
(
	[spec_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specs_item]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specs_item](
	[spec_item_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[spec_id] [int] NOT NULL,
	[spec_value] [nvarchar](50) NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Specs_item] PRIMARY KEY CLUSTERED 
(
	[spec_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10.03.2023 11:50:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[role_id] [int] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_ItemsCarts] FOREIGN KEY([item_id])
REFERENCES [dbo].[Products] ([item_id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_ItemsCarts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_UserCarts] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_UserCarts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_UsersOrders] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_UsersOrders]
GO
ALTER TABLE [dbo].[Orders_item]  WITH CHECK ADD  CONSTRAINT [FK_ItemsOrders_item] FOREIGN KEY([item_id])
REFERENCES [dbo].[Products] ([item_id])
GO
ALTER TABLE [dbo].[Orders_item] CHECK CONSTRAINT [FK_ItemsOrders_item]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Specs]  WITH CHECK ADD  CONSTRAINT [FK_Specs_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Specs] CHECK CONSTRAINT [FK_Specs_Categories]
GO
ALTER TABLE [dbo].[Specs_item]  WITH CHECK ADD  CONSTRAINT [FK_ItemsSpecs_item] FOREIGN KEY([item_id])
REFERENCES [dbo].[Products] ([item_id])
GO
ALTER TABLE [dbo].[Specs_item] CHECK CONSTRAINT [FK_ItemsSpecs_item]
GO
ALTER TABLE [dbo].[Specs_item]  WITH CHECK ADD  CONSTRAINT [FK_SpecsSpecs_item] FOREIGN KEY([spec_id])
REFERENCES [dbo].[Specs] ([spec_id])
GO
ALTER TABLE [dbo].[Specs_item] CHECK CONSTRAINT [FK_SpecsSpecs_item]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[Roles] ([role_id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [apiShop] SET  READ_WRITE 
GO

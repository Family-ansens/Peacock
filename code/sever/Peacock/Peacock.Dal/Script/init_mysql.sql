-- --------------------------------------------------------
-- 主机:                           192.168.184.138
-- 服务器版本:                        5.5.62-0ubuntu0.14.04.1 - (Ubuntu)
-- 服务器操作系统:                      debian-linux-gnu
-- HeidiSQL 版本:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 PeacockManage 的数据库结构
CREATE DATABASE IF NOT EXISTS `PeacockManage` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `PeacockManage`;


-- 导出  表 PeacockManage.T_Advertise 结构
CREATE TABLE IF NOT EXISTS `T_Advertise` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `ImgUrl` varchar(200) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Announcement 结构
CREATE TABLE IF NOT EXISTS `T_Announcement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(500) NOT NULL,
  `Content` text,
  `TitleLanguageId` int(11) DEFAULT NULL,
  `ContentLanguageId` int(11) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Company 结构
CREATE TABLE IF NOT EXISTS `T_Company` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) DEFAULT NULL,
  `TitleLanguageId` int(11) DEFAULT NULL,
  `IntroductionLanguageId` int(11) DEFAULT NULL,
  `Content` text,
  `ContentLanguageId` int(11) DEFAULT NULL,
  `ImgPath` varchar(2000) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Evaluation 结构
CREATE TABLE IF NOT EXISTS `T_Evaluation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Tel` varchar(20) NOT NULL,
  `Content` text NOT NULL,
  `Email` varchar(100) NOT NULL,
  `OtherContact` varchar(500) DEFAULT NULL,
  `IpAddress` varchar(50) DEFAULT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_New 结构
CREATE TABLE IF NOT EXISTS `T_New` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(500) NOT NULL,
  `Content` text,
  `TitleLanguageId` int(11) DEFAULT NULL,
  `IntroductionLanguageId` int(11) DEFAULT NULL,
  `ContentLanguageId` int(11) DEFAULT NULL,
  `ImgUrl` varchar(200) NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `IsPublish` bit(1) NOT NULL DEFAULT b'0',
  `PublishTime` datetime DEFAULT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Pro_Example 结构
CREATE TABLE IF NOT EXISTS `T_Pro_Example` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text,
  `OrderId` int(11) NOT NULL,
  `NameLanguageId` int(11) DEFAULT NULL,
  `IntroductionLanguageId` int(11) DEFAULT NULL,
  `DescriptionLanguageId` int(11) DEFAULT NULL,
  `ImgPath` varchar(2000) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Pro_ExampleGroup 结构
CREATE TABLE IF NOT EXISTS `T_Pro_ExampleGroup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `LanguageId` int(11) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Pro_ExampleImg 结构
CREATE TABLE IF NOT EXISTS `T_Pro_ExampleImg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ExampleId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `ImgUrl` varchar(500) DEFAULT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Pro_ExampleProductRelation 结构
CREATE TABLE IF NOT EXISTS `T_Pro_ExampleProductRelation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `ExampleId` int(11) NOT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Pro_HotSaleProduct 结构
CREATE TABLE IF NOT EXISTS `T_Pro_HotSaleProduct` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Pro_Product 结构
CREATE TABLE IF NOT EXISTS `T_Pro_Product` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GroupId` bigint(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text,
  `OrderId` int(11) NOT NULL,
  `NameLanguageId` int(11) DEFAULT NULL,
  `IntroductionLanguageId` int(11) DEFAULT NULL,
  `DescriptionLanguageId` int(11) DEFAULT NULL,
  `ImgPath` varchar(200) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Pro_ProductGroup 结构
CREATE TABLE IF NOT EXISTS `T_Pro_ProductGroup` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `LanguageId` int(11) DEFAULT NULL,
  `OrderId` int(11) NOT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_Pro_ProductImg 结构
CREATE TABLE IF NOT EXISTS `T_Pro_ProductImg` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `ImgUrl` varchar(200) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0',
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_System_LanguageContent 结构
CREATE TABLE IF NOT EXISTS `T_System_LanguageContent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RelationId` int(11) NOT NULL,
  `LanguageType` varchar(50) NOT NULL,
  `DisplayContent` text NOT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedTime` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_T_System_LanguageContent_T_System_LanguageRelation` (`RelationId`),
  CONSTRAINT `FK_T_System_LanguageContent_T_System_LanguageRelation` FOREIGN KEY (`RelationId`) REFERENCES `T_System_LanguageRelation` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_System_LanguageRelation 结构
CREATE TABLE IF NOT EXISTS `T_System_LanguageRelation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。


-- 导出  表 PeacockManage.T_System_Menu 结构
CREATE TABLE IF NOT EXISTS `T_System_Menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentId` int(11) NOT NULL,
  `Code` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Url` varchar(100) NOT NULL,
  `Seq` int(11) NOT NULL,
  `LanguageRelationId` int(11) DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `CreatedBy` varchar(50) NOT NULL,
  `CreatedTime` datetime NOT NULL,
  `LastUpdatedBy` varchar(50) NOT NULL,
  `LastUpdatedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

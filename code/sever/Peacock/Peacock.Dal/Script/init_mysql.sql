
insert into T_System_Menu(ParentId,Code,Name,Url,Seq,LanguageRelationId,IsDeleted,CreatedBy,CreatedTime,LastUpdatedBy,LastUpdatedDate)
values(0,'New','新闻管理','/News/New/Index',3,null,0,-1,now(),-1,now());

insert into T_System_Menu(ParentId,Code,Name,Url,Seq,LanguageRelationId,IsDeleted,CreatedBy,CreatedTime,LastUpdatedBy,LastUpdatedDate)
values(0,'New','公告管理','/News/Announcement/Index',3,null,0,-1,now(),-1,now());

insert into T_System_Menu(ParentId,Code,Name,Url,Seq,LanguageRelationId,IsDeleted,CreatedBy,CreatedTime,LastUpdatedBy,LastUpdatedDate)
values(0,'BUsinessManagement','业务管理','',1,null,0,-1,now(),-1,now());

CREATE TABLE `T_Pro_ProductImg` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`ProductId` int(11) NOT NULL,
	`OrderId` INT(11) NOT NULL,
	`ImgPath` VARCHAR(200) NULL DEFAULT NULL,
	`IsDeleted` BIT(1) NOT NULL DEFAULT b'0',
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_New` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`Title` VARCHAR(500) NOT NULL,
	`Content` TEXT NULL,
	`TitleLanguageId` INT(11) NULL DEFAULT NULL,
	`ContentLanguageId` INT(11) NULL DEFAULT NULL,
	`IsDeleted` BIT(1) NOT NULL DEFAULT b'0',
	`IsPublish` BIT(1) NOT NULL DEFAULT b'0',
	`PublishTime` DATETIME NULL,
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_Announcement` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`Title` VARCHAR(500) NOT NULL,
	`Content` TEXT NULL,
	`TitleLanguageId` INT(11) NULL DEFAULT NULL,
	`ContentLanguageId` INT(11) NULL DEFAULT NULL,
	`IsDeleted` BIT(1) NOT NULL DEFAULT b'0',
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_Pro_HotSaleProduct` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`ProductId` int(11) NOT NULL,
	`OrderId` INT(11) NOT NULL,
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;




CREATE TABLE `T_Pro_ExampleGroup` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`Code` VARCHAR(50) NOT NULL,
	`Name` VARCHAR(50) NOT NULL,
	`OrderId` INT(11) NOT NULL,
	`LanguageId` INT(11) NULL DEFAULT NULL,
	`IsDeleted` BIT(1) NOT NULL DEFAULT b'0',
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_Pro_Example` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`GroupId` int(11) NOT NULL,
	`Name` VARCHAR(50) NOT NULL,
	`Description` TEXT NULL,
	`OrderId` INT(11) NOT NULL,
	`NameLanguageId` INT(11) NULL DEFAULT NULL,
	`IntroductionLanguageId` INT(11) NULL DEFAULT NULL,
	`DescriptionLanguageId` INT(11) NULL DEFAULT NULL,
	`ImgPath` VARCHAR(2000) NULL,
	`IsDeleted` BIT(1) NOT NULL DEFAULT b'0',
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_Pro_ExampleImg` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`ExampleId` int(11) NOT NULL,
	`OrderId` INT(11) NOT NULL,
	`ImgUrl` VARCHAR(500) NULL,
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_Company` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`OrderId` INT(11) NULL DEFAULT NULL,
	`TitleLanguageId` INT(11) NULL DEFAULT NULL,
	`IntroductionLanguageId` INT(11) NULL DEFAULT NULL,
	`Content` TEXT NULL,
	`ContentLanguageId` INT(11) NULL DEFAULT NULL,
	`ImgPath` VARCHAR(2000) NULL,
	`IsDeleted` BIT(1) NOT NULL DEFAULT b'0',
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_Evaluation` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`Name` VARCHAR(20) NOT NULL,
	`Tel` VARCHAR(20) NOT NULL,
	`Content` TEXT NOT NULL,
	`Email` VARCHAR(100) NOT NULL,
	`OtherContact` VARCHAR(500) NULL,
	`IpAddress` VARCHAR(50) NULL,
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_Advertise` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`OrderId` INT(11) NOT NULL,
	`ImgUrl` VARCHAR(200) NULL DEFAULT NULL,
	`IsDeleted` BIT(1) NOT NULL DEFAULT b'0',
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `T_Pro_ExampleProductRelation` (
	`ID` int(11) NOT NULL AUTO_INCREMENT,
	`ProductId` INT(11) NOT NULL,
	`ExampleId` INT(11) NOT NULL,
	`CreatedBy` VARCHAR(50) NOT NULL,
	`CreatedTime` DATETIME NOT NULL,
	`LastUpdatedBy` VARCHAR(50) NOT NULL,
	`LastUpdatedTime` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

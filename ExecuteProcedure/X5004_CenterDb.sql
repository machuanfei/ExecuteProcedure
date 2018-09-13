/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50517
Source Host           : localhost:3306
Source Database       : X5004_CenterDb

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2018-09-11 11:26:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accountinfo`
-- ----------------------------
DROP TABLE IF EXISTS `accountinfo`;
CREATE TABLE `accountinfo` (
  `dwUserID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '账号ID',
  `szAccount` varchar(65) CHARACTER SET utf8 DEFAULT NULL COMMENT '帐号名',
  `szVisitorAccount` varchar(65) CHARACTER SET utf8 DEFAULT NULL COMMENT '游客帐号名',
  `dwPartnerID` int(10) unsigned DEFAULT NULL COMMENT '合作商ID',
  `dwTime` int(10) unsigned DEFAULT NULL COMMENT '注册时间',
  `dwBindTime` int(10) unsigned DEFAULT NULL COMMENT '绑定账号时间',
  `dwAccountID` int(10) unsigned DEFAULT NULL COMMENT '外部帐号id,仅部分合作商有值',
  `dwFestivalGiftTime` int(10) unsigned DEFAULT NULL COMMENT '上次领取节日礼物时间',
  `dwBirthdayGiftTime` int(10) unsigned DEFAULT NULL COMMENT '上次领取生日礼物时间',
  `szPassport` varchar(65) CHARACTER SET utf8 DEFAULT NULL COMMENT '关联通行证账号',
  `dwRegTime` int(10) unsigned DEFAULT NULL COMMENT '关联通行证注册日期',
  `szFromAdv1` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '广告来源一级',
  `szFromAdv2` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '广告来源二级',
  `szFromAdv3` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '广告来源3',
  `szFromAdv4` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '广告来源4',
  `szFromAdv5` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '广告来源5',
  `WhiteList` int(11) DEFAULT NULL COMMENT '是否是测试白名字',
  PRIMARY KEY (`dwUserID`),
  UNIQUE KEY `TAccountInfo_Index_szAccount` (`szAccount`,`dwPartnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='帐号信息表';

-- ----------------------------
-- Records of accountinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `GameIDAlloc`
-- ----------------------------
DROP TABLE IF EXISTS `GameIDAlloc`;
CREATE TABLE `GameIDAlloc` (
  `Rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `MaxID` int(10) unsigned DEFAULT NULL COMMENT '当前分配的最大值',
  PRIMARY KEY (`Rid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='ID分配表';

-- ----------------------------
-- Records of GameIDAlloc
-- ----------------------------

-- ----------------------------
-- Table structure for `roleinfo`
-- ----------------------------
DROP TABLE IF EXISTS `roleinfo`;
CREATE TABLE `roleinfo` (
  `Rid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表自增长ID',
  `dwUserID` int(10) unsigned DEFAULT NULL COMMENT '账号ID',
  `dwWorldID` int(10) unsigned DEFAULT NULL COMMENT '世界id',
  `dwRoleID` int(10) unsigned DEFAULT NULL COMMENT '角色id',
  `szRoleName` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色名',
  `bySex` tinyint(3) unsigned DEFAULT NULL COMMENT '性别',
  `dwNationID` int(10) unsigned DEFAULT NULL COMMENT '国家',
  `wFaceID` smallint(5) unsigned DEFAULT NULL COMMENT '头像',
  `dwTime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `byConfirm` tinyint(3) unsigned DEFAULT NULL COMMENT '确认标志',
  `bRoleDeleted` tinyint(3) unsigned DEFAULT NULL COMMENT '角色删除标记（1已删除，0未删除）',
  `byRoleDelMode` tinyint(3) unsigned DEFAULT NULL COMMENT '删除模式',
  `dwRoleDelTime` int(10) unsigned DEFAULT NULL COMMENT '删除提交时间',
  PRIMARY KEY (`Rid`),
  UNIQUE KEY `TRoleInfo_Index_RoleName` (`szRoleName`),
  KEY `TRoleInfo_Index_UserIDWorldIDRoleID` (`dwUserID`,`dwWorldID`,`dwRoleID`),
  KEY `TRoleInfo_Index_RoleID` (`dwRoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=1181 DEFAULT CHARSET=gbk COMMENT='角色名表';

-- ----------------------------
-- Records of roleinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `rolerename`
-- ----------------------------
DROP TABLE IF EXISTS `rolerename`;
CREATE TABLE `rolerename` (
  `Rid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表自增长ID',
  `szOldName` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '旧名字',
  `szNewName` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '名字',
  `dwRoleID` int(10) unsigned DEFAULT NULL COMMENT '角色id',
  `dwTime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `byConfirm` tinyint(3) unsigned DEFAULT NULL COMMENT '确认标志',
  PRIMARY KEY (`Rid`),
  UNIQUE KEY `TRoleName_Index_Name` (`szOldName`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='角色改名表';

-- ----------------------------
-- Records of rolerename
-- ----------------------------

-- ----------------------------
-- Table structure for `ServerList_Config`
-- ----------------------------
DROP TABLE IF EXISTS `ServerList_Config`;
CREATE TABLE `ServerList_Config` (
  `ZoneId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '区ID',
  `ZoneGroup` varchar(65) DEFAULT NULL COMMENT '区分组标识',
  `PartnerID` int(10) unsigned DEFAULT NULL COMMENT '合作商ID',
  `JoinToZoneID` int(11) DEFAULT NULL COMMENT '合服ID',
  `ZoneName` varchar(65) DEFAULT NULL COMMENT '区名',
  `GameDbHost` varchar(65) DEFAULT NULL COMMENT 'GameDB IP',
  `GameDbPort` int(10) unsigned DEFAULT NULL COMMENT 'GameDB 端口',
  `GameDbUser` varchar(65) DEFAULT NULL COMMENT 'GameDB用户',
  `GameDbPassword` varchar(65) DEFAULT NULL COMMENT 'GameDB密码',
  `GameDbName` varchar(65) DEFAULT NULL COMMENT 'Game DB 名',
  `LogDbHost` varchar(65) DEFAULT NULL COMMENT 'LogDB IP',
  `LogDbPort` int(10) unsigned DEFAULT NULL COMMENT 'LogDB 端口',
  `LogDbUser` varchar(65) DEFAULT NULL COMMENT 'LogDB用户',
  `LogDbPassword` varchar(65) DEFAULT NULL COMMENT 'LogDB密码',
  `LogDbName` varchar(65) DEFAULT NULL COMMENT 'Log DB 名',
  `CenterdbHost` varchar(65) DEFAULT NULL COMMENT '中心DB IP',
  `CenterdbPort` int(10) unsigned DEFAULT NULL COMMENT '中心DB端口',
  `CenterdbUser` varchar(65) DEFAULT NULL COMMENT '中心DB 登录用户',
  `CenterdbPassword` varchar(65) DEFAULT NULL COMMENT '中心DB 密码',
  `CenterdbName` varchar(65) DEFAULT NULL COMMENT '中心DB名字',
  `SocialSvrIp` varchar(65) DEFAULT NULL COMMENT '社会服 IP',
  `SocialSvrPort` int(10) unsigned DEFAULT NULL COMMENT '社会服 端口',
  `GateSvrPort` int(10) unsigned DEFAULT NULL COMMENT '网关 端口',
  `GatewayMaxConn` int(10) unsigned DEFAULT NULL COMMENT '网关容纳的最大人数',
  `ServerIp` varchar(65) DEFAULT NULL COMMENT '服务器IP',
  `ListenPortBase` int(10) unsigned DEFAULT NULL COMMENT '内网port的基准值,    取值范围:   [20 , 290]。memo:   这个值是方便在同一台硬件上, 启动多套游戏服. 游戏各服务器会使用一定的端口来通信, 会与这个参数拼接. 例如这个参数填20，则游戏服使用的端口为 2001 - 2099',
  `AppsvrDir` varchar(512) DEFAULT NULL COMMENT '应用服目录',
  `RootmgrHostForZone` varchar(65) DEFAULT NULL COMMENT 'root管理器 zone IP',
  `RootmgrPortForZone` int(10) unsigned DEFAULT NULL COMMENT 'root管理器 zone port',
  `RootmgrHostForTerm` varchar(65) DEFAULT NULL COMMENT 'root管理器 term IP',
  `RootmgrPortForTerm` int(10) unsigned DEFAULT NULL COMMENT 'root管理器 term port',
  PRIMARY KEY (`ZoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器配置表';

-- ----------------------------
-- Records of ServerList_Config
-- ----------------------------

-- ----------------------------
-- Procedure structure for `PrGs_Center_AccountLoginV3`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PrGs_Center_AccountLoginV3`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrGs_Center_AccountLoginV3`(
	IN _szAccount VARCHAR(65) CHARACTER SET 'utf8', 
	IN _PartnerID INT UNSIGNED, 
	IN _WorldID INT UNSIGNED, 
	
	IN _AccountID INT UNSIGNED, 
	IN _szPassport VARCHAR(65) CHARACTER SET 'utf8', 
	IN _RegTime INT,	
	IN _szFromAdv1 VARCHAR(128) CHARACTER SET 'utf8', 
	IN _szFromAdv2 VARCHAR(128) CHARACTER SET 'utf8', 
	IN _szFromAdv3 VARCHAR(128) CHARACTER SET 'utf8', 
	IN _szFromAdv4 VARCHAR(128) CHARACTER SET 'utf8', 
	IN _szFromAdv5 VARCHAR(128) CHARACTER SET 'utf8'  
)
LABEL_PROC:
BEGIN
  
	DECLARE _ErrorCodeOut,_OutUserID,_OutAccountID INT UNSIGNED ; 
	DECLARE _szErrDesc VARCHAR(256);
	DECLARE _szOutPassport VARCHAR(32);
	DECLARE _szOutFromAdv1, _szOutFromAdv2, _szOutFromAdv3, _szOutFromAdv4, _szOutFromAdv5 VARCHAR(128) CHARACTER SET 'utf8';
	DECLARE _OutRegTime INT UNSIGNED;
	DECLARE _WhiteList INT default 0;
	DECLARE _CreateTime INT UNSIGNED;
	DECLARE _BirthdayGiftTime INT UNSIGNED;
	DECLARE _FestivalGiftTime INT UNSIGNED;
	DECLARE _szVisitorAccount VARCHAR(65) CHARACTER SET 'utf8';
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		ROLLBACK;
		SET _ErrorCodeOut = 999;
		SET _szErrDesc = N'SQL RUN ERROR';
		SET _OutRegTime = 0;
		SET _OutUserID = 0, _OutAccountID = 0;  
		SET _WhiteList = 0;  
		SET _FestivalGiftTime = 0;
		SET _BirthdayGiftTime = 0;
		SET _szOutPassport = '', _szOutFromAdv1='', _szOutFromAdv2='', _szOutFromAdv3='', _szOutFromAdv4='', _szOutFromAdv5='';  
		SELECT _ErrorCodeOut,_szErrDesc, _OutUserID, _OutAccountID, _szOutPassport,_OutRegTime,_szOutFromAdv1,_szOutFromAdv2,
			_szOutFromAdv3,_szOutFromAdv4,_szOutFromAdv5,_WhiteList,_FestivalGiftTime,_BirthdayGiftTime;
		SHOW ERRORS;
	END;	
	SET _ErrorCodeOut = 9;
	SET _szErrDesc = N'';
	SET _OutUserID = 0, _OutAccountID = 0;  
	SET _OutRegTime = 0;
	SET _szOutPassport = '', _szOutFromAdv1='', _szOutFromAdv2='', _szOutFromAdv3='', _szOutFromAdv4='', _szOutFromAdv5='';  
	
	set _CreateTime =  UNIX_TIMESTAMP();
	SET _BirthdayGiftTime = 0;
	SET _FestivalGiftTime = 0;
		
	
	SELECT dwUserID, dwAccountID,szPassport,dwRegTime,szFromAdv1,szFromAdv2,szFromAdv3,szFromAdv4,szFromAdv5,WhiteList,
		dwFestivalGiftTime,dwBirthdayGiftTime
	INTO _OutUserID, _OutAccountID, _szOutPassport,_OutRegTime,_szOutFromAdv1,_szOutFromAdv2, _szOutFromAdv3, _szOutFromAdv4, _szOutFromAdv5, _WhiteList,
		_FestivalGiftTime,_BirthdayGiftTime
	FROM AccountInfo WHERE szAccount=_szAccount and dwPartnerID=_PartnerID;   
	IF _OutUserID <> 0 THEN
		SET _ErrorCodeOut = 0;
		
		
	
		SELECT _ErrorCodeOut, _szErrDesc, _OutUserID, _OutAccountID, _szOutPassport,_OutRegTime,_szOutFromAdv1,_szOutFromAdv2,
			_szOutFromAdv3,_szOutFromAdv4,_szOutFromAdv5,_WhiteList,_FestivalGiftTime,_BirthdayGiftTime;
		LEAVE LABEL_PROC;
	END IF ;
	
	
START TRANSACTION;
	CALL PrGs_Center_GetID(1, 0, _OutUserID, _ErrorCodeOut);
	IF _OutUserID <= 0  THEN
		ROLLBACK;
		SET _ErrorCodeOut = 1;
		SET _szErrDesc = N'ALLOC ACCOUNTID FAIL';
		SELECT _ErrorCodeOut, _szErrDesc, 0, _AccountID, _szOutPassport,_OutRegTime,_szOutFromAdv1,_szOutFromAdv2,
			_szOutFromAdv3,_szOutFromAdv4,_szOutFromAdv5,_WhiteList,_FestivalGiftTime,_BirthdayGiftTime;
		LEAVE LABEL_PROC;
	END IF; 
	
	
	SET _szVisitorAccount = '';
	IF _PartnerID = 6 THEN
		SET _szVisitorAccount = _szAccount;
	END IF;
	
	INSERT INTO AccountInfo(dwUserID,szAccount,szVisitorAccount,dwPartnerID,dwTime,dwBindTime,dwAccountID, szPassport,dwRegTime,szFromAdv1,szFromAdv2,szFromAdv3,szFromAdv4,szFromAdv5,WhiteList,
		dwFestivalGiftTime,dwBirthdayGiftTime) 
	VALUES (_OutUserID, _szAccount, _szVisitorAccount, _PartnerID, _CreateTime, 0, _AccountID, _szPassport, _RegTime,_szFromAdv1,_szFromAdv2,_szFromAdv3,_szFromAdv4,_szFromAdv5,0,
		_FestivalGiftTime,_BirthdayGiftTime);
   
COMMIT; 
	SET _WhiteList = 0; 
	SET _ErrorCodeOut = 0; 
	SELECT _ErrorCodeOut, _szErrDesc, _OutUserID, _AccountID, _szPassport, _RegTime,_szFromAdv1,_szFromAdv2,
		_szFromAdv3,_szFromAdv4,_szFromAdv5,_WhiteList,_FestivalGiftTime,_BirthdayGiftTime;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PrGs_Center_BindAccount`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PrGs_Center_BindAccount`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrGs_Center_BindAccount`(
		IN _szVisitorAccount VARCHAR(65) CHARACTER SET 'utf8',	
		IN _szThirdAccount VARCHAR(65) CHARACTER SET 'utf8', 
		IN _PartnerID INT UNSIGNED 
)
LABEL_PROC:
BEGIN
  
		DECLARE _ErrorOut INT UNSIGNED;
		DECLARE _BindTime INT UNSIGNED;
		DECLARE _ThirdUserID INT UNSIGNED;
		DECLARE _OutUserID INT UNSIGNED;
		DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
				ROLLBACK;
        SET _ErrorOut = 999;
				SELECT _ErrorOut, _OutUserID;
    END;
    
    
    SET _ErrorOut = 0;
    SET _BindTime = 0;
    SET _ThirdUserID = 0;
    SET _OutUserID = 0;
    
     
    SELECT dwUserID INTO _OutUserID FROM AccountInfo where szVisitorAccount=_szVisitorAccount;
    IF _OutUserID = 0 THEN
			SET _ErrorOut = 1;
			SELECT _ErrorOut, _OutUserID;
			LEAVE LABEL_PROC;
		END IF;
		
		
		SELECT dwUserID INTO _ThirdUserID FROM AccountInfo WHERE szAccount=_szThirdAccount AND dwPartnerID=_PartnerID;
		IF _ThirdUserID <> 0 THEN
			
			IF EXISTS(SELECT 1 FROM AccountInfo WHERE dwUserID = _ThirdUserID AND szVisitorAccount <> "") THEN
				SET _ErrorOut = 2;
				SELECT _ErrorOut, _OutUserID;
				LEAVE LABEL_PROC;
			END IF;
		
			
			IF EXISTS(SELECT 1 FROM RoleInfo WHERE dwUserID = _ThirdUserID) THEN
				SET _ErrorOut = 3;
				SELECT _ErrorOut, _OutUserID;
				LEAVE LABEL_PROC;
			END IF;
		END IF;
		
		SET _BindTime = UNIX_TIMESTAMP();
		
START TRANSACTION;
		
		DELETE FROM AccountInfo WHERE szAccount=_szThirdAccount;
		
		UPDATE AccountInfo SET szAccount=_szThirdAccount,dwPartnerID=_PartnerID,dwBindTime=_BindTime WHERE szVisitorAccount=_szVisitorAccount;
		SET _ErrorOut = 0;
		SELECT _ErrorOut, _OutUserID;
COMMIT;
	
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PrGs_Center_GetID`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PrGs_Center_GetID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrGs_Center_GetID`(
IN  _Rid INT,       
IN  _OffsetNum INT,  
OUT _ID INT UNSIGNED,   
OUT _Error INT
)
LABEL_PROC:
BEGIN
  
    declare _Continue Int;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SET _Error = -1;
    END;
    set _ID = 0;  
    set _Error = 9;
    SET _Continue = 1;
    
START TRANSACTION;
    LABEL_checkId: WHILE (_Continue < 10) DO   
        SET _Continue = _Continue + 1;
        
        
        UPDATE GameIDAlloc Set MaxID = MaxID + 1 WHERE Rid=_Rid;
        SELECT MaxID INTO _ID FROM GameIDAlloc WHERE Rid=_Rid;

        
        set _ID = _OffsetNum + _ID;

        
		IF (_Rid = 1) THEN
			IF NOT EXISTS(SELECT 1 FROM AccountInfo WHERE dwUserID = _ID ) THEN
				LEAVE LABEL_checkId;
			END IF;
		ELSEIF (_Rid = 2) THEN
			IF NOT EXISTS(SELECT 1 FROM RoleInfo WHERE dwRoleID = _ID ) THEN
				LEAVE LABEL_checkId;
			END IF;
		ELSEIF (_Rid = 3) THEN
			IF NOT EXISTS(SELECT 1 FROM Kin WHERE dwKinID = _ID ) THEN
				LEAVE LABEL_checkId;
			END IF;
		ELSEIF (_Rid = 4) THEN
			IF NOT EXISTS(SELECT 1 FROM Clan WHERE dwClanID = _ID ) THEN
				LEAVE LABEL_checkId;
			END IF;
        END IF;
    END WHILE;  
COMMIT; 
SET _Error = 0;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PrGs_Center_InitGameIDTab`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PrGs_Center_InitGameIDTab`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrGs_Center_InitGameIDTab`()
LABEL_PROC:
BEGIN
    IF NOT EXISTS(SELECT 1 FROM GameIDAlloc WHERE Rid=1) THEN
        INSERT GameIDAlloc(Rid,MaxID) VALUES (1, 0);
    END IF;
    
    IF NOT EXISTS(SELECT 1 FROM GameIDAlloc WHERE Rid=2) THEN
        INSERT GameIDAlloc(Rid,MaxID) VALUES (2, 0);
    END IF;
    
    IF NOT EXISTS(SELECT 1 FROM GameIDAlloc WHERE Rid=3) THEN
        INSERT GameIDAlloc(Rid,MaxID) VALUES (3, 0);
    END IF;
    IF NOT EXISTS(SELECT 1 FROM GameIDAlloc WHERE Rid=4) THEN
        INSERT GameIDAlloc(Rid,MaxID) VALUES (4, 0);
    END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `PrGs_Center_RoleCreate`
-- ----------------------------
DROP PROCEDURE IF EXISTS `PrGs_Center_RoleCreate`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PrGs_Center_RoleCreate`(
    IN _UserID INT UNSIGNED,	
    IN _WorldID INT UNSIGNED, 
    
    IN _szActorName VARCHAR(32) CHARACTER SET 'utf8', 
    IN _nSex TINYINT UNSIGNED,	
    IN _NationID INT UNSIGNED,	
    IN _nFaceID SMALLINT UNSIGNED	
)
LABEL_PROC:
BEGIN
  
    DECLARE _ErrorOut,_RoleID,_IDErr INT UNSIGNED ;
    DECLARE _CreateTime INT UNSIGNED;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
        ROLLBACK;
        SET _ErrorOut = 999;
    	SET _RoleID = 0; 
		SELECT _ErrorOut,_RoleID;
    END;    
    SET _ErrorOut = 9;
    SET _RoleID = 0; 
    SET _IDErr = 0;
    
    
	IF EXISTS(SELECT 1 FROM RoleInfo where szRoleName=_szActorName) THEN
		SET _ErrorOut = 1;
		SELECT _ErrorOut,_RoleID;
		LEAVE LABEL_PROC;
	END IF;
	IF EXISTS(SELECT 1 FROM RoleRename WHERE szOldName=_szActorName) THEN
		SET _ErrorOut = 1;
		SELECT _ErrorOut, _RoleID;
		LEAVE LABEL_PROC;
	END IF;
    IF EXISTS(SELECT 1 FROM RoleInfo WHERE dwUserID=_UserID) THEN
		SET _ErrorOut = 3;
		SELECT _ErrorOut, _RoleID;
		LEAVE LABEL_PROC;
	END IF;

    set _CreateTime =  UNIX_TIMESTAMP();
START TRANSACTION;
    CALL PrGs_Center_GetID(2, 0, _RoleID, _IDErr);
	IF _RoleID <= 0	THEN
		ROLLBACK;
		SET _ErrorOut = 2;
		SELECT _ErrorOut,_RoleID;
		LEAVE LABEL_PROC;
	END IF;	
	INSERT INTO RoleInfo(dwUserID,dwWorldID,dwRoleID,szRoleName, bySex,dwNationID,wFaceID,dwTime,byConfirm) 
	VALUES(_UserID, _WorldID,_RoleID, _szActorName, _nSex, _NationID, _nFaceID, _CreateTime, 0);
	SET _ErrorOut = 0;
	SELECT _ErrorOut,_RoleID;	
COMMIT;
	
END
;;
DELIMITER ;

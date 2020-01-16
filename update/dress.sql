-- MySQL dump 10.13  Distrib 8.0.15, for osx10.14 (x86_64)
--
-- Host: localhost    Database: dress
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dr_auth_group`
--

DROP TABLE IF EXISTS `dr_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_auth_group`
--

LOCK TABLES `dr_auth_group` WRITE;
/*!40000 ALTER TABLE `dr_auth_group` DISABLE KEYS */;
INSERT INTO `dr_auth_group` VALUES (1,0,'Admin group','*',1490883540,149088354,'normal'),(2,1,'Second group','13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5',1490883540,1505465692,'normal'),(3,2,'Third group','1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5',1490883540,1502205322,'normal'),(4,1,'Second group 2','1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65',1490883540,1502205350,'normal'),(5,2,'Third group 2','1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34',1490883540,1502205344,'normal'),(6,1,'店长','160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,303,310,311,312,313,314,315,316,317,318,319,320,321',1576737610,1576737725,'normal'),(7,1,'礼服师','',1576737626,1576737626,'normal'),(8,1,'邀约','',1576737643,1576737643,'normal'),(9,1,'推广','',1576737665,1576737665,'normal'),(10,1,'供应商','',1576737693,1576737693,'normal'),(11,1,'老板','',1576737709,1576737709,'normal');
/*!40000 ALTER TABLE `dr_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_auth_group_access`
--

DROP TABLE IF EXISTS `dr_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_auth_group_access`
--

LOCK TABLES `dr_auth_group_access` WRITE;
/*!40000 ALTER TABLE `dr_auth_group_access` DISABLE KEYS */;
INSERT INTO `dr_auth_group_access` VALUES (1,1),(2,6),(3,7),(4,7),(5,6),(5,7);
/*!40000 ALTER TABLE `dr_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_auth_rule`
--

DROP TABLE IF EXISTS `dr_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_auth_rule`
--

LOCK TABLES `dr_auth_rule` WRITE;
/*!40000 ALTER TABLE `dr_auth_rule` DISABLE KEYS */;
INSERT INTO `dr_auth_rule` VALUES (1,'file',0,'dashboard','控制台','fa fa-dashboard','','Dashboard tips',1,1497429920,1497429920,143,'normal'),(2,'file',0,'general','常规管理','fa fa-cogs','','',1,1497429920,1497430169,137,'normal'),(5,'file',0,'auth','组织架构','fa fa-sitemap','','',1,1497429920,1573140230,119,'normal'),(6,'file',2,'general/config','系统设置','fa fa-cog','','Config tips',1,1497429920,1497430683,60,'normal'),(9,'file',5,'auth/admin','管理员管理','fa fa-user','','Admin tips',1,1497429920,1573143871,99,'normal'),(10,'file',5,'auth/adminlog','管理员日志','fa fa-list-alt','','Admin log tips',1,1497429920,1573140785,0,'normal'),(11,'file',5,'auth/group','角色组','fa fa-group','','Group tips',1,1497429920,1573143937,97,'normal'),(12,'file',5,'auth/index','菜单规则','fa fa-bars','','',1,1497429920,1573143997,90,'normal'),(13,'file',1,'dashboard/index','View','fa fa-circle-o','','',0,1497429920,1497429920,136,'normal'),(14,'file',1,'dashboard/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,135,'normal'),(15,'file',1,'dashboard/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,133,'normal'),(16,'file',1,'dashboard/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,134,'normal'),(17,'file',1,'dashboard/multi','Multi','fa fa-circle-o','','',0,1497429920,1497429920,132,'normal'),(40,'file',9,'auth/admin/index','View','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,'normal'),(41,'file',9,'auth/admin/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,116,'normal'),(42,'file',9,'auth/admin/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,115,'normal'),(43,'file',9,'auth/admin/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,114,'normal'),(44,'file',10,'auth/adminlog/index','View','fa fa-circle-o','','Admin log tips',0,1497429920,1497429920,112,'normal'),(45,'file',10,'auth/adminlog/detail','Detail','fa fa-circle-o','','',0,1497429920,1497429920,111,'normal'),(46,'file',10,'auth/adminlog/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,110,'normal'),(47,'file',11,'auth/group/index','View','fa fa-circle-o','','Group tips',0,1497429920,1497429920,108,'normal'),(48,'file',11,'auth/group/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,107,'normal'),(49,'file',11,'auth/group/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,106,'normal'),(50,'file',11,'auth/group/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,105,'normal'),(51,'file',12,'auth/rule/index','View','fa fa-circle-o','','Rule tips',0,1497429920,1497429920,103,'normal'),(52,'file',12,'auth/rule/add','Add','fa fa-circle-o','','',0,1497429920,1497429920,102,'normal'),(53,'file',12,'auth/rule/edit','Edit','fa fa-circle-o','','',0,1497429920,1497429920,101,'normal'),(54,'file',12,'auth/rule/del','Delete','fa fa-circle-o','','',0,1497429920,1497429920,100,'normal'),(55,'file',4,'addon/index','View','fa fa-circle-o','','Addon tips',0,1502035509,1502035509,0,'normal'),(56,'file',4,'addon/add','Add','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(57,'file',4,'addon/edit','Edit','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(58,'file',4,'addon/del','Delete','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(59,'file',4,'addon/local','Local install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(60,'file',4,'addon/state','Update state','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(61,'file',4,'addon/install','Install','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(62,'file',4,'addon/uninstall','Uninstall','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(63,'file',4,'addon/config','Setting','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(64,'file',4,'addon/refresh','Refresh','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(65,'file',4,'addon/multi','Multi','fa fa-circle-o','','',0,1502035509,1502035509,0,'normal'),(66,'file',0,'customer','客资管理','fa fa-list','','',1,1516374729,1516374729,0,'normal'),(67,'file',66,'customer/index','我的客资','fa fa-user','','',1,1516374729,1516374729,0,'normal'),(68,'file',66,'customer/today','今日跟进','fa fa-circle-o','','',1,1516374729,1516374729,0,'normal'),(160,'file',0,'dress','礼服管理','fa fa-connectdevelop','','',1,1573132819,1575970290,136,'normal'),(161,'file',160,'dress/index','礼服列表','fa fa-circle-o','','',1,1573132819,1577510490,100,'normal'),(162,'file',161,'dress/create','礼服添加','fa fa-circle-o','','',0,1573132819,1573132819,0,'normal'),(163,'file',161,'dress/recyclebin','礼服回收站','fa fa-circle-o','','',0,1573132819,1573132819,0,'normal'),(165,'file',161,'dress/edit','礼服编辑','fa fa-circle-o','','',0,1573132819,1573132819,0,'normal'),(166,'file',161,'dress/delete','删除礼服','fa fa-circle-o','','',0,1573132819,1573132819,0,'normal'),(167,'file',161,'dress/destroy','真实删除','fa fa-circle-o','','',0,1573132819,1573132819,0,'normal'),(168,'file',161,'dress/restore','礼服还原','fa fa-circle-o','','',0,1573132819,1573132819,0,'normal'),(169,'file',161,'dress/multi','批量更新','fa fa-circle-o','','',0,1573132819,1573132819,0,'normal'),(176,'file',160,'package/index','礼服套餐','fa fa-circle-o','','',1,1573133975,1573133992,0,'normal'),(177,'file',176,'package/create','套餐添加','fa fa-circle-o','','',0,1573133975,1573133975,0,'normal'),(178,'file',176,'package/recyclebin','套餐回收站','fa fa-circle-o','','',0,1573133975,1573133975,0,'normal'),(180,'file',176,'package/edit','套餐编辑','fa fa-circle-o','','',0,1573133975,1573133975,0,'normal'),(181,'file',176,'package/delete','套餐删除','fa fa-circle-o','','',0,1573133975,1573133975,0,'normal'),(182,'file',176,'package/destroy','套餐真实删除','fa fa-circle-o','','',0,1573133975,1573133975,0,'normal'),(183,'file',176,'package/restore','套餐还原','fa fa-circle-o','','',0,1573133975,1573133975,0,'normal'),(194,'file',160,'scrap/index','报废管理','fa fa-circle-o','','',1,1573136222,1573136260,0,'normal'),(195,'file',194,'scrap/create','添加报废','fa fa-circle-o','','',0,1573136222,1573136222,0,'normal'),(198,'file',194,'scrap/edit','编辑报废','fa fa-circle-o','','',0,1573136222,1573136222,0,'normal'),(199,'file',194,'scrap/delete','删除报废','fa fa-circle-o','','',0,1573136222,1573136222,0,'normal'),(200,'file',194,'scrap/destroy','真实删除','fa fa-circle-o','','',0,1573136222,1573136222,0,'normal'),(203,'file',160,'supplier/index','供应商管理','fa fa-circle-o','','',1,1573136222,1573136272,0,'normal'),(206,'file',203,'supplier/create','添加','fa fa-circle-o','','',0,1573136222,1573136222,0,'normal'),(207,'file',203,'supplier/edit','编辑','fa fa-circle-o','','',0,1573136222,1573136222,0,'normal'),(208,'file',203,'supplier/delete','删除','fa fa-circle-o','','',0,1573136222,1573136222,0,'normal'),(213,'file',212,'notice/index','通知类型管理','fa fa-bell-o','','',1,1573138137,1573144222,0,'normal'),(216,'file',213,'notice/add','通知类型添加','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(217,'file',213,'notice/edit','通知类型编辑','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(218,'file',213,'notice/delete','通知类型删除','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(223,'file',2,'source/index','来源管理','fa fa-circle-o','','',1,1573138137,1573138137,0,'normal'),(225,'file',222,'source/create','客资来源添加','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(226,'file',222,'source/edit','客资来源编辑','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(227,'file',222,'source/delete','客资来源删除','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(231,'file',212,'leave/index','请假类型管理','fa fa-at','','',1,1573138137,1573144270,0,'normal'),(234,'file',231,'leave/create','请假类型添加','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(235,'file',231,'leave/edit','请假类型编辑','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(236,'file',231,'leave/delete','请假类型删除','fa fa-circle-o','','',0,1573138137,1573138137,0,'normal'),(240,'file',2,'size/index','礼服尺寸','fa fa-calculator','','',1,1573139595,1573144287,0,'normal'),(243,'file',240,'size/create','礼服尺寸添加','fa fa-circle-o','','',0,1573139595,1573139595,0,'normal'),(244,'file',240,'size/edit','礼服尺寸编辑','fa fa-circle-o','','',0,1573139595,1573139595,0,'normal'),(245,'file',240,'size/delete','礼服尺寸删除','fa fa-circle-o','','',0,1573139595,1573139595,0,'normal'),(250,'file',2,'payment/index','支付方式','fa fa-circle-o','','',1,1573139595,1573139595,0,'normal'),(251,'file',249,'dictionary/dress/recyclebin','回收站','fa fa-circle-o','','',0,1573139595,1573139595,0,'normal'),(252,'file',2,'color/index','颜色管理','fa fa-circle-o','','',1,1573139595,1573139595,0,'normal'),(253,'file',249,'dictionary/dress/edit','编辑','fa fa-circle-o','','',0,1573139595,1573139595,0,'normal'),(267,'file',5,'auth/notice','通知管理','fa fa-bell','','',1,1573140632,1573144052,95,'normal'),(268,'file',267,'auth/notice/index','查看','fa fa-circle-o','','',0,1573140632,1573140632,0,'normal'),(269,'file',267,'auth/notice/recyclebin','回收站','fa fa-circle-o','','',0,1573140632,1573140632,0,'normal'),(270,'file',267,'auth/notice/add','添加','fa fa-circle-o','','',0,1573140632,1573140632,0,'normal'),(271,'file',267,'auth/notice/edit','编辑','fa fa-circle-o','','',0,1573140632,1573140632,0,'normal'),(272,'file',267,'auth/notice/del','删除','fa fa-circle-o','','',0,1573140632,1573140632,0,'normal'),(273,'file',267,'auth/notice/destroy','真实删除','fa fa-circle-o','','',0,1573140632,1573140632,0,'normal'),(274,'file',267,'auth/notice/restore','还原','fa fa-circle-o','','',0,1573140632,1573140632,0,'normal'),(275,'file',267,'auth/notice/multi','批量更新','fa fa-circle-o','','',0,1573140632,1573140632,0,'normal'),(276,'file',5,'auth/leave','请假管理','fa fa-bookmark','','',1,1573141955,1573144068,94,'normal'),(277,'file',276,'auth/leave/index','查看','fa fa-circle-o','','',0,1573141955,1573141955,0,'normal'),(278,'file',276,'auth/leave/recyclebin','回收站','fa fa-circle-o','','',0,1573141955,1573141955,0,'normal'),(279,'file',276,'auth/leave/add','添加','fa fa-circle-o','','',0,1573141955,1573141955,0,'normal'),(280,'file',276,'auth/leave/edit','编辑','fa fa-circle-o','','',0,1573141955,1573141955,0,'normal'),(281,'file',276,'auth/leave/del','删除','fa fa-circle-o','','',0,1573141955,1573141955,0,'normal'),(282,'file',276,'auth/leave/destroy','真实删除','fa fa-circle-o','','',0,1573141955,1573141955,0,'normal'),(283,'file',276,'auth/leave/restore','还原','fa fa-circle-o','','',0,1573141955,1573141955,0,'normal'),(284,'file',276,'auth/leave/multi','批量更新','fa fa-circle-o','','',0,1573141955,1573141955,0,'normal'),(285,'file',5,'auth/position','职位管理','fa fa-circle-o','','',1,1573142040,1573143919,98,'normal'),(286,'file',285,'auth/position/index','查看','fa fa-circle-o','','',0,1573142040,1573142040,0,'normal'),(287,'file',285,'auth/position/recyclebin','回收站','fa fa-circle-o','','',0,1573142040,1573142040,0,'normal'),(288,'file',285,'auth/position/add','添加','fa fa-circle-o','','',0,1573142040,1573142040,0,'normal'),(289,'file',285,'auth/position/edit','编辑','fa fa-circle-o','','',0,1573142040,1573142040,0,'normal'),(290,'file',285,'auth/position/del','删除','fa fa-circle-o','','',0,1573142040,1573142040,0,'normal'),(291,'file',285,'auth/position/destroy','真实删除','fa fa-circle-o','','',0,1573142040,1573142040,0,'normal'),(292,'file',285,'auth/position/restore','还原','fa fa-circle-o','','',0,1573142040,1573142040,0,'normal'),(293,'file',285,'auth/position/multi','批量更新','fa fa-circle-o','','',0,1573142040,1573142040,0,'normal'),(294,'file',5,'auth/department','部门管理','fa fa-bank','','',1,1573143705,1573144087,100,'normal'),(295,'file',294,'auth/department/index','查看','fa fa-circle-o','','',0,1573143705,1573143705,0,'normal'),(296,'file',294,'auth/department/recyclebin','回收站','fa fa-circle-o','','',0,1573143705,1573143705,0,'normal'),(297,'file',294,'auth/department/add','添加','fa fa-circle-o','','',0,1573143705,1573143705,0,'normal'),(298,'file',294,'auth/department/edit','编辑','fa fa-circle-o','','',0,1573143705,1573143705,0,'normal'),(299,'file',294,'auth/department/del','删除','fa fa-circle-o','','',0,1573143705,1573143705,0,'normal'),(300,'file',294,'auth/department/destroy','真实删除','fa fa-circle-o','','',0,1573143705,1573143705,0,'normal'),(301,'file',294,'auth/department/restore','还原','fa fa-circle-o','','',0,1573143705,1573143705,0,'normal'),(302,'file',294,'auth/department/multi','批量更新','fa fa-circle-o','','',0,1573143705,1573143705,0,'normal'),(303,'file',0,'order','订单管理','fa fa-list','','',1,1575970127,1575970320,137,'normal'),(310,'file',303,'sale/index','销售订单','fa fa-circle-o','','',1,1575970796,1575970866,99,'normal'),(316,'file',303,'rent/index','租赁订单','fa fa-circle-o','','',1,1575970796,1575970849,100,'normal'),(322,'file',160,'DressCategory/index','礼服分类','fa fa-circle-o','','',1,1577519168,1577519168,99,'normal'),(369,'file',66,'customer/sea','客资公海','fa fa-user','','',1,1516374729,1516374729,1,'normal');
/*!40000 ALTER TABLE `dr_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_color`
--

DROP TABLE IF EXISTS `dr_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_color`
--

LOCK TABLES `dr_color` WRITE;
/*!40000 ALTER TABLE `dr_color` DISABLE KEYS */;
INSERT INTO `dr_color` VALUES (1,'红色','normal',0,1579082078,1579082078,NULL),(2,'桔色','normal',0,1579082279,1579082279,NULL);
/*!40000 ALTER TABLE `dr_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_customer`
--

DROP TABLE IF EXISTS `dr_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) DEFAULT '0',
  `source_id` int(11) NOT NULL DEFAULT '0',
  `visit_times` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(45) DEFAULT '',
  `sex` int(11) DEFAULT '0',
  `mobile` int(11) DEFAULT '0',
  `mobile1` int(11) DEFAULT '0',
  `mobile2` int(11) DEFAULT '0',
  `mobile3` int(11) DEFAULT '0',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `weigh` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `updatetime` int(11) DEFAULT '0',
  `deletetime` int(11) DEFAULT '0',
  `status` varchar(45) DEFAULT 'normal',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_customer`
--

LOCK TABLES `dr_customer` WRITE;
/*!40000 ALTER TABLE `dr_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_dress`
--

DROP TABLE IF EXISTS `dr_dress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_dress` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品类别',
  `images` varchar(1800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `spec_type` enum('10','20') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10' COMMENT '商品规格:10=单规格,20=多规格',
  `deduct_stock_type` enum('10','20') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '20' COMMENT '库存计算方式:10=下单减库存,20=付款减库存',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述详情',
  `sales_initial` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '初始销量',
  `sales_actual` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '权重',
  `delivery_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `goods_status` enum('10','20') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10' COMMENT '商品状态:10=上架,20=下架',
  `is_delete` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除:0=未删除,1=已删除',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '显示状态',
  `sku` varchar(100) NOT NULL DEFAULT '',
  `rent_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `weigh` int(11) NOT NULL DEFAULT '0',
  `size_id` int(11) DEFAULT '0',
  `color_id` int(11) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_dress`
--

LOCK TABLES `dr_dress` WRITE;
/*!40000 ALTER TABLE `dr_dress` DISABLE KEYS */;
INSERT INTO `dr_dress` VALUES (3,'C1904115L2A',2,'/assets/img/qrcode.png','20','20','1000',0,0,3,0,'10','0',1577522565,1579085396,'normal','2020100001',3000.00,5000.00,0,1,1,0),(4,'秀禾礼服',2,'/assets/img/qrcode.png','20','20','1000',0,0,4,0,'10','0',1577526427,1579085462,'normal','2020100002',1000.00,2000.00,0,2,1,0);
/*!40000 ALTER TABLE `dr_dress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_dress_category`
--

DROP TABLE IF EXISTS `dr_dress_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_dress_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT '0',
  `updatetime` int(11) DEFAULT '0',
  `deletetime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_dress_category`
--

LOCK TABLES `dr_dress_category` WRITE;
/*!40000 ALTER TABLE `dr_dress_category` DISABLE KEYS */;
INSERT INTO `dr_dress_category` VALUES (1,'出门纱','normal',118,1579079283,NULL,NULL),(2,'秀禾服','normal',0,1579079283,NULL,NULL),(3,'男士礼服','normal',0,1579079283,1579079283,NULL);
/*!40000 ALTER TABLE `dr_dress_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_dress_package`
--

DROP TABLE IF EXISTS `dr_dress_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_dress_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_no` varchar(45) DEFAULT NULL,
  `operate_id` int(11) DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rent_price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) unsigned DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_dress_package`
--

LOCK TABLES `dr_dress_package` WRITE;
/*!40000 ALTER TABLE `dr_dress_package` DISABLE KEYS */;
INSERT INTO `dr_dress_package` VALUES (1,NULL,NULL,'588',588.00,588.00,'定制698衬衫+婚鞋+皮鞋','0',1,1577504938,1577504938,NULL),(2,NULL,NULL,'9999',9999.00,9999.00,'定制6980元西服+租赁28888主纱+出门服+齐地纱+敬酒服','0',2,1577504974,1577504974,NULL),(3,NULL,NULL,'4999',4999.00,4999.00,'定制6980元西服+租赁齐地纱+敬酒服','0',3,1577504997,1577504997,NULL),(4,NULL,NULL,'8999',8999.00,8999.00,'定制6980元西服+租赁28888元主纱+出门服+敬酒服','0',4,1577505026,1577505026,NULL),(5,'001',NULL,'001',3000.00,5000.00,NULL,'normal',0,1579083482,1579083482,NULL),(6,'20200002',NULL,'20200002',3000.00,6000.00,NULL,'normal',0,1579083515,1579083515,NULL);
/*!40000 ALTER TABLE `dr_dress_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_payment`
--

DROP TABLE IF EXISTS `dr_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_payment`
--

LOCK TABLES `dr_payment` WRITE;
/*!40000 ALTER TABLE `dr_payment` DISABLE KEYS */;
INSERT INTO `dr_payment` VALUES (1,'微信','normal',0,1579081801,1579081801,NULL),(2,'支付宝','normal',0,1579081912,1579081912,NULL),(3,'现金','normal',0,1579081919,1579081919,NULL),(4,'POS机','normal',0,1579082297,1579082297,NULL);
/*!40000 ALTER TABLE `dr_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_rent`
--

DROP TABLE IF EXISTS `dr_rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_rent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'init',
  `visit_date` int(11) NOT NULL DEFAULT '0',
  `rent_date` int(11) NOT NULL DEFAULT '0',
  `back_date` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  `deletetime` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `totals` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_rent`
--

LOCK TABLES `dr_rent` WRITE;
/*!40000 ALTER TABLE `dr_rent` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_rent_goods`
--

DROP TABLE IF EXISTS `dr_rent_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_rent_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rent_id` int(11) NOT NULL DEFAULT '0',
  `goods_type` varchar(100) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'goods',
  `gogds_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_rent_goods`
--

LOCK TABLES `dr_rent_goods` WRITE;
/*!40000 ALTER TABLE `dr_rent_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_rent_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_rent_payment`
--

DROP TABLE IF EXISTS `dr_rent_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_rent_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) NOT NULL DEFAULT '0',
  `rent_id` int(11) NOT NULL DEFAULT '0',
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `pay_type` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'full',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_rent_payment`
--

LOCK TABLES `dr_rent_payment` WRITE;
/*!40000 ALTER TABLE `dr_rent_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_rent_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_scrap`
--

DROP TABLE IF EXISTS `dr_scrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_scrap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scrap_no` char(45) DEFAULT NULL,
  `operate_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `dress_id` int(11) DEFAULT NULL,
  `deal_user_id` int(11) DEFAULT NULL,
  `confirm_user_id` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `udpatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  `confirmtime` int(11) DEFAULT NULL,
  `confirm_status` varchar(45) DEFAULT 'normal',
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_scrap`
--

LOCK TABLES `dr_scrap` WRITE;
/*!40000 ALTER TABLE `dr_scrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `dr_scrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_size`
--

DROP TABLE IF EXISTS `dr_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_size`
--

LOCK TABLES `dr_size` WRITE;
/*!40000 ALTER TABLE `dr_size` DISABLE KEYS */;
INSERT INTO `dr_size` VALUES (1,'L','normal',0,1579080236,1579080236,NULL),(2,'XL','normal',0,1579081970,1579081970,NULL),(3,'XXXL','normal',0,1579082021,1579082021,NULL);
/*!40000 ALTER TABLE `dr_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_source`
--

DROP TABLE IF EXISTS `dr_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_source`
--

LOCK TABLES `dr_source` WRITE;
/*!40000 ALTER TABLE `dr_source` DISABLE KEYS */;
INSERT INTO `dr_source` VALUES (1,'大众点评','normal',0,1579082364,1579082364,NULL),(2,'抖音','normal',0,1579082373,1579082373,NULL),(3,'微博','normal',0,1579082387,1579082387,NULL),(4,'微信朋友圈','normal',0,1579082394,1579082394,NULL),(5,'朋友转介绍','normal',0,1579082405,1579082405,NULL),(6,'自然进店','normal',0,1579082425,1579082425,NULL);
/*!40000 ALTER TABLE `dr_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_supplier`
--

DROP TABLE IF EXISTS `dr_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dr_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `realname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '银行名称',
  `bank_account` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号名称\n',
  `bank_account_num` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '银行账号',
  `weigh` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `createtime` int(11) DEFAULT NULL,
  `udpatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_supplier`
--

LOCK TABLES `dr_supplier` WRITE;
/*!40000 ALTER TABLE `dr_supplier` DISABLE KEYS */;
INSERT INTO `dr_supplier` VALUES (1,'金犀数据',NULL,'18321277411','山海静安区东海大厦','','','',0,'normal',1579082576,NULL,NULL);
/*!40000 ALTER TABLE `dr_supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-16 10:53:35

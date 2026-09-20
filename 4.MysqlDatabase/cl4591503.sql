-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: cl4591503
-- ------------------------------------------------------
-- Server version	5.7.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cl4591503`
--

/*!40000 DROP DATABASE IF EXISTS `cl4591503`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cl4591503` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cl4591503`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'swiper1','file/swiperPicture1.jpg'),(2,'swiper2','file/swiperPicture2.jpg'),(3,'swiper3','file/swiperPicture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daiyingliebiao`
--

DROP TABLE IF EXISTS `daiyingliebiao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daiyingliebiao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `riqi` date DEFAULT NULL COMMENT '日期',
  `shijianduan` varchar(200) DEFAULT NULL COMMENT '时间段',
  `changci` varchar(200) DEFAULT NULL COMMENT '场次',
  `dianyingmingcheng` varchar(200) DEFAULT NULL COMMENT '电影名称',
  `fengmian` longtext COMMENT '封面',
  `zhuyan` varchar(200) DEFAULT NULL COMMENT '主演',
  `pianzhang` varchar(200) DEFAULT NULL COMMENT '片长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='待映列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daiyingliebiao`
--

LOCK TABLES `daiyingliebiao` WRITE;
/*!40000 ALTER TABLE `daiyingliebiao` DISABLE KEYS */;
INSERT INTO `daiyingliebiao` VALUES (121,'2024-01-22 14:03:14','2024-01-22','时间段1','场次1','电影名称1','file/daiyingliebiaoFengmian1.jpg,file/daiyingliebiaoFengmian2.jpg,file/daiyingliebiaoFengmian3.jpg','主演1','片长1'),(122,'2024-01-22 14:03:14','2024-01-22','时间段2','场次2','电影名称2','file/daiyingliebiaoFengmian2.jpg,file/daiyingliebiaoFengmian3.jpg,file/daiyingliebiaoFengmian4.jpg','主演2','片长2'),(123,'2024-01-22 14:03:14','2024-01-22','时间段3','场次3','电影名称3','file/daiyingliebiaoFengmian3.jpg,file/daiyingliebiaoFengmian4.jpg,file/daiyingliebiaoFengmian5.jpg','主演3','片长3'),(124,'2024-01-22 14:03:14','2024-01-22','时间段4','场次4','电影名称4','file/daiyingliebiaoFengmian4.jpg,file/daiyingliebiaoFengmian5.jpg,file/daiyingliebiaoFengmian6.jpg','主演4','片长4'),(125,'2024-01-22 14:03:14','2024-01-22','时间段5','场次5','电影名称5','file/daiyingliebiaoFengmian5.jpg,file/daiyingliebiaoFengmian6.jpg,file/daiyingliebiaoFengmian7.jpg','主演5','片长5'),(126,'2024-01-22 14:03:14','2024-01-22','时间段6','场次6','电影名称6','file/daiyingliebiaoFengmian6.jpg,file/daiyingliebiaoFengmian7.jpg,file/daiyingliebiaoFengmian8.jpg','主演6','片长6');
/*!40000 ALTER TABLE `daiyingliebiao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dianyingfenlei`
--

DROP TABLE IF EXISTS `dianyingfenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dianyingfenlei` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dianyingfenlei` varchar(200) NOT NULL COMMENT '电影分类',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dianyingfenlei` (`dianyingfenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='电影分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dianyingfenlei`
--

LOCK TABLES `dianyingfenlei` WRITE;
/*!40000 ALTER TABLE `dianyingfenlei` DISABLE KEYS */;
INSERT INTO `dianyingfenlei` VALUES (51,'2024-01-22 14:03:14','电影分类1'),(52,'2024-01-22 14:03:14','电影分类2'),(53,'2024-01-22 14:03:14','电影分类3'),(54,'2024-01-22 14:03:14','电影分类4'),(55,'2024-01-22 14:03:14','电影分类5'),(56,'2024-01-22 14:03:14','电影分类6');
/*!40000 ALTER TABLE `dianyingfenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dianyingpingjia`
--

DROP TABLE IF EXISTS `dianyingpingjia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dianyingpingjia` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dianyingyuanmingcheng` varchar(200) DEFAULT NULL COMMENT '电影院名称',
  `dianyingmingcheng` varchar(200) NOT NULL COMMENT '电影名称',
  `dianyingfenlei` varchar(200) NOT NULL COMMENT '电影分类',
  `daoyan` varchar(200) DEFAULT NULL COMMENT '导演',
  `zhuyan` varchar(200) DEFAULT NULL COMMENT '主演',
  `pianzhang` varchar(200) DEFAULT NULL COMMENT '片长',
  `changci` datetime DEFAULT NULL COMMENT '场次',
  `pingjia` longtext COMMENT '评价',
  `pingfen` varchar(200) DEFAULT NULL COMMENT '评分',
  `pingjiashijian` datetime DEFAULT NULL COMMENT '评价时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='电影评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dianyingpingjia`
--

LOCK TABLES `dianyingpingjia` WRITE;
/*!40000 ALTER TABLE `dianyingpingjia` DISABLE KEYS */;
INSERT INTO `dianyingpingjia` VALUES (111,'2024-01-22 14:03:14','电影院名称1','电影名称1','电影分类1','导演1','主演1','片长1','2024-01-22 22:03:14','评价1','★','2024-01-22 22:03:14','用户账号1','用户姓名1'),(112,'2024-01-22 14:03:14','电影院名称2','电影名称2','电影分类2','导演2','主演2','片长2','2024-01-22 22:03:14','评价2','★','2024-01-22 22:03:14','用户账号2','用户姓名2'),(113,'2024-01-22 14:03:14','电影院名称3','电影名称3','电影分类3','导演3','主演3','片长3','2024-01-22 22:03:14','评价3','★','2024-01-22 22:03:14','用户账号3','用户姓名3'),(114,'2024-01-22 14:03:14','电影院名称4','电影名称4','电影分类4','导演4','主演4','片长4','2024-01-22 22:03:14','评价4','★','2024-01-22 22:03:14','用户账号4','用户姓名4'),(115,'2024-01-22 14:03:14','电影院名称5','电影名称5','电影分类5','导演5','主演5','片长5','2024-01-22 22:03:14','评价5','★','2024-01-22 22:03:14','用户账号5','用户姓名5'),(116,'2024-01-22 14:03:14','电影院名称6','电影名称6','电影分类6','导演6','主演6','片长6','2024-01-22 22:03:14','评价6','★','2024-01-22 22:03:14','用户账号6','用户姓名6');
/*!40000 ALTER TABLE `dianyingpingjia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dianyingxinxi`
--

DROP TABLE IF EXISTS `dianyingxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dianyingxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dianyingyuanmingcheng` varchar(200) DEFAULT NULL COMMENT '电影院名称',
  `dianyingmingcheng` varchar(200) NOT NULL COMMENT '电影名称',
  `haibao` longtext COMMENT '海报',
  `dianyingfenlei` varchar(200) NOT NULL COMMENT '电影分类',
  `daoyan` varchar(200) DEFAULT NULL COMMENT '导演',
  `zhuyan` varchar(200) DEFAULT NULL COMMENT '主演',
  `shangyingriqi` date DEFAULT NULL COMMENT '上映日期',
  `pianzhang` varchar(200) DEFAULT NULL COMMENT '片长',
  `dianyingyugao` longtext COMMENT '电影预告',
  `dianyingjianjie` longtext COMMENT '电影简介',
  `shijianduan` varchar(200) DEFAULT NULL COMMENT '时间段',
  `changci` datetime DEFAULT NULL COMMENT '场次',
  `fangyingting` varchar(200) DEFAULT NULL COMMENT '放映厅',
  `storeupnum` int(11) DEFAULT NULL COMMENT '收藏数量',
  `clicktime` datetime DEFAULT NULL COMMENT '最近点击时间',
  `price` double DEFAULT NULL COMMENT '价格',
  `number` int(11) DEFAULT NULL COMMENT '座位总数',
  `selected` longtext COMMENT '已选座位[用,号隔开]',
  `clicknum` int(11) DEFAULT NULL COMMENT '点击次数',
  `thumbsupnum` int(11) DEFAULT NULL COMMENT '赞',
  `crazilynum` int(11) DEFAULT NULL COMMENT '踩',
  `jf` int(11) DEFAULT NULL COMMENT '积分',
  `vipprice` double DEFAULT NULL COMMENT '会员价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='电影信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dianyingxinxi`
--

LOCK TABLES `dianyingxinxi` WRITE;
/*!40000 ALTER TABLE `dianyingxinxi` DISABLE KEYS */;
INSERT INTO `dianyingxinxi` VALUES (71,'2024-01-22 14:03:14','电影院名称1','电影名称1','file/dianyingxinxiHaibao1.jpg,file/dianyingxinxiHaibao2.jpg,file/dianyingxinxiHaibao3.jpg','电影分类1','导演1','主演1','2024-01-22','片长1','','电影简介1','时间段1','2024-01-22 22:03:14','放映厅1',1,'2024-01-22 22:03:14',99.9,20,'1,3,5,7,9',1,1,1,10000,1),(72,'2024-01-22 14:03:14','电影院名称2','电影名称2','file/dianyingxinxiHaibao2.jpg,file/dianyingxinxiHaibao3.jpg,file/dianyingxinxiHaibao4.jpg','电影分类2','导演2','主演2','2024-01-22','片长2','','电影简介2','时间段2','2024-01-22 22:03:14','放映厅2',2,'2024-01-22 22:03:14',99.9,20,'1,3,5,7,9',2,2,2,10000,2),(73,'2024-01-22 14:03:14','电影院名称3','电影名称3','file/dianyingxinxiHaibao3.jpg,file/dianyingxinxiHaibao4.jpg,file/dianyingxinxiHaibao5.jpg','电影分类3','导演3','主演3','2024-01-22','片长3','','电影简介3','时间段3','2024-01-22 22:03:14','放映厅3',3,'2024-01-22 22:07:00',99.9,20,'1,15,3,5,7,9',5,3,3,10000,3),(74,'2024-01-22 14:03:14','电影院名称4','电影名称4','file/dianyingxinxiHaibao4.jpg,file/dianyingxinxiHaibao5.jpg,file/dianyingxinxiHaibao6.jpg','电影分类4','导演4','主演4','2024-01-22','片长4','','电影简介4','时间段4','2024-01-22 22:03:14','放映厅4',4,'2024-01-22 22:03:14',99.9,20,'1,3,5,7,9',4,4,4,10000,4),(75,'2024-01-22 14:03:14','电影院名称5','电影名称5','file/dianyingxinxiHaibao5.jpg,file/dianyingxinxiHaibao6.jpg,file/dianyingxinxiHaibao7.jpg','电影分类5','导演5','主演5','2024-01-22','片长5','','电影简介5','时间段5','2024-01-22 22:03:14','放映厅5',5,'2024-01-22 22:03:14',99.9,20,'1,3,5,7,9',5,5,5,10000,5),(76,'2024-01-22 14:03:14','电影院名称6','电影名称6','file/dianyingxinxiHaibao6.jpg,file/dianyingxinxiHaibao7.jpg,file/dianyingxinxiHaibao8.jpg','电影分类6','导演6','主演6','2024-01-22','片长6','','电影简介6','时间段6','2024-01-22 22:03:14','放映厅6',6,'2024-01-22 22:03:14',99.9,20,'1,3,5,7,9',6,6,6,10000,6);
/*!40000 ALTER TABLE `dianyingxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dianyingyuanxinxi`
--

DROP TABLE IF EXISTS `dianyingyuanxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dianyingyuanxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dianyingyuanmingcheng` varchar(200) DEFAULT NULL COMMENT '电影院名称',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `lianxifangshi` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `dianyingyuanguimo` varchar(200) DEFAULT NULL COMMENT '电影院规模',
  `fangyingtingshu` varchar(200) DEFAULT NULL COMMENT '放映厅数',
  `fengmian` longtext COMMENT '封面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='电影院信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dianyingyuanxinxi`
--

LOCK TABLES `dianyingyuanxinxi` WRITE;
/*!40000 ALTER TABLE `dianyingyuanxinxi` DISABLE KEYS */;
INSERT INTO `dianyingyuanxinxi` VALUES (101,'2024-01-22 14:03:14','电影院名称1','地址1','联系方式1','电影院规模1','放映厅数1','file/dianyingyuanxinxiFengmian1.jpg,file/dianyingyuanxinxiFengmian2.jpg,file/dianyingyuanxinxiFengmian3.jpg'),(102,'2024-01-22 14:03:14','电影院名称2','地址2','联系方式2','电影院规模2','放映厅数2','file/dianyingyuanxinxiFengmian2.jpg,file/dianyingyuanxinxiFengmian3.jpg,file/dianyingyuanxinxiFengmian4.jpg'),(103,'2024-01-22 14:03:14','电影院名称3','地址3','联系方式3','电影院规模3','放映厅数3','file/dianyingyuanxinxiFengmian3.jpg,file/dianyingyuanxinxiFengmian4.jpg,file/dianyingyuanxinxiFengmian5.jpg'),(104,'2024-01-22 14:03:14','电影院名称4','地址4','联系方式4','电影院规模4','放映厅数4','file/dianyingyuanxinxiFengmian4.jpg,file/dianyingyuanxinxiFengmian5.jpg,file/dianyingyuanxinxiFengmian6.jpg'),(105,'2024-01-22 14:03:14','电影院名称5','地址5','联系方式5','电影院规模5','放映厅数5','file/dianyingyuanxinxiFengmian5.jpg,file/dianyingyuanxinxiFengmian6.jpg,file/dianyingyuanxinxiFengmian7.jpg'),(106,'2024-01-22 14:03:14','电影院名称6','地址6','联系方式6','电影院规模6','放映厅数6','file/dianyingyuanxinxiFengmian6.jpg,file/dianyingyuanxinxiFengmian7.jpg,file/dianyingyuanxinxiFengmian8.jpg');
/*!40000 ALTER TABLE `dianyingyuanxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussdianyingxinxi`
--

DROP TABLE IF EXISTS `discussdianyingxinxi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussdianyingxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `avatarurl` longtext COMMENT '头像',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='电影信息评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussdianyingxinxi`
--

LOCK TABLES `discussdianyingxinxi` WRITE;
/*!40000 ALTER TABLE `discussdianyingxinxi` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussdianyingxinxi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fangyingting`
--

DROP TABLE IF EXISTS `fangyingting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fangyingting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `fangyingting` varchar(200) NOT NULL COMMENT '放映厅',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fangyingting` (`fangyingting`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='放映厅';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fangyingting`
--

LOCK TABLES `fangyingting` WRITE;
/*!40000 ALTER TABLE `fangyingting` DISABLE KEYS */;
INSERT INTO `fangyingting` VALUES (61,'2024-01-22 14:03:14','放映厅1'),(62,'2024-01-22 14:03:14','放映厅2'),(63,'2024-01-22 14:03:14','放映厅3'),(64,'2024-01-22 14:03:14','放映厅4'),(65,'2024-01-22 14:03:14','放映厅5'),(66,'2024-01-22 14:03:14','放映厅6');
/*!40000 ALTER TABLE `fangyingting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menujson` longtext COMMENT '菜单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'2024-01-22 14:03:14','[{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-newshot\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"放映厅\",\"menuJump\":\"列表\",\"tableName\":\"fangyingting\"},{\"appFrontIcon\":\"cuIcon-medal\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\",\"查看评论\"],\"menu\":\"电影信息\",\"menuJump\":\"列表\",\"tableName\":\"dianyingxinxi\"},{\"appFrontIcon\":\"cuIcon-rank\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"电影分类\",\"menuJump\":\"列表\",\"tableName\":\"dianyingfenlei\"}],\"fontClass\":\"icon-common7\",\"menu\":\"电影信息管理\",\"unicode\":\"&#xedb4;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已发货订单\",\"menuJump\":\"已发货\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\",\"销售量统计\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"商品订单\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"}],\"menu\":\"订单管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-pic\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"用户\",\"menuJump\":\"列表\",\"tableName\":\"yonghu\"}],\"fontClass\":\"icon-user3\",\"menu\":\"用户管理\",\"unicode\":\"&#xef99;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-attentionfavor\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"待映列表\",\"menuJump\":\"列表\",\"tableName\":\"daiyingliebiao\"}],\"fontClass\":\"icon-common4\",\"menu\":\"待映列表管理\",\"unicode\":\"&#xedab;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-news\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"轮播图\",\"menuJump\":\"列表\",\"tableName\":\"config\"},{\"appFrontIcon\":\"cuIcon-clothes\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"电影资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"fontClass\":\"icon-common27\",\"menu\":\"管理员管理\",\"unicode\":\"&#xee2c;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-goodsnew\",\"buttons\":[\"新增\",\"查看\",\"修改\",\"删除\"],\"menu\":\"电影院信息\",\"menuJump\":\"列表\",\"tableName\":\"dianyingyuanxinxi\"}],\"fontClass\":\"icon-common34\",\"menu\":\"电影院信息管理\",\"unicode\":\"&#xee85;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"电影评价\",\"menuJump\":\"列表\",\"tableName\":\"dianyingpingjia\"}],\"fontClass\":\"icon-common16\",\"menu\":\"电影评价管理\",\"unicode\":\"&#xedfd;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\"],\"menu\":\"电影院信息\",\"menuJump\":\"列表\",\"tableName\":\"dianyingyuanxinxi\"}],\"menu\":\"电影院信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\"],\"menu\":\"待映列表\",\"menuJump\":\"列表\",\"tableName\":\"daiyingliebiao\"}],\"menu\":\"待映列表管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-newshot\",\"buttons\":[\"查看\"],\"menu\":\"电影资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"电影资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"评价\"],\"menu\":\"电影信息\",\"menuJump\":\"列表\",\"tableName\":\"dianyingxinxi\"}],\"menu\":\"电影信息管理\"}],\"hasBackLogin\":\"是\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"否\",\"hasFrontRegister\":\"否\",\"roleName\":\"管理员\",\"tableName\":\"users\"},{\"backMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已取消订单\",\"menuJump\":\"已取消\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"未支付订单\",\"menuJump\":\"未支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已退款订单\",\"menuJump\":\"已退款\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已支付订单\",\"menuJump\":\"已支付\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"已完成订单\",\"menuJump\":\"已完成\",\"tableName\":\"orders\"},{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\",\"删除\"],\"menu\":\"商品订单\",\"tableName\":\"orders\"}],\"menu\":\"订单管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-time\",\"buttons\":[\"查看\"],\"menu\":\"我的收藏\",\"menuJump\":\"1\",\"tableName\":\"storeup\"}],\"fontClass\":\"icon-common11\",\"menu\":\"我的收藏管理\",\"unicode\":\"&#xeded;\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-discover\",\"buttons\":[\"查看\",\"修改\",\"删除\"],\"menu\":\"电影评价\",\"menuJump\":\"列表\",\"tableName\":\"dianyingpingjia\"}],\"fontClass\":\"icon-common16\",\"menu\":\"电影评价管理\",\"unicode\":\"&#xedfd;\"}],\"frontMenu\":[{\"child\":[{\"appFrontIcon\":\"cuIcon-cardboard\",\"buttons\":[\"查看\"],\"menu\":\"电影院信息\",\"menuJump\":\"列表\",\"tableName\":\"dianyingyuanxinxi\"}],\"menu\":\"电影院信息管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-copy\",\"buttons\":[\"查看\"],\"menu\":\"待映列表\",\"menuJump\":\"列表\",\"tableName\":\"daiyingliebiao\"}],\"menu\":\"待映列表管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-newshot\",\"buttons\":[\"查看\"],\"menu\":\"电影资讯\",\"menuJump\":\"列表\",\"tableName\":\"news\"}],\"menu\":\"电影资讯管理\"},{\"child\":[{\"appFrontIcon\":\"cuIcon-phone\",\"buttons\":[\"查看\",\"评价\"],\"menu\":\"电影信息\",\"menuJump\":\"列表\",\"tableName\":\"dianyingxinxi\"}],\"menu\":\"电影信息管理\"}],\"hasBackLogin\":\"否\",\"hasBackRegister\":\"否\",\"hasFrontLogin\":\"是\",\"hasFrontRegister\":\"是\",\"roleName\":\"用户\",\"tableName\":\"yonghu\"}]');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` longtext NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='电影资讯';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (31,'2024-01-22 14:03:14','青花瓷','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起','file/newsPicture1.jpg','素胚勾勒出青花笔锋浓转淡，瓶身描绘的牡丹一如你初妆，冉冉檀香透过窗心事我了然，宣上走笔至此搁一半，釉色渲染仕女图韵味被私藏，而你嫣然的一笑如含苞待放，你的美缕飘散，去到我去不了的地方，天青色等烟雨 而我在等你，炊烟袅袅升起， 隔江千万里，在瓶底书前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起， 晕开了局，如传世的青花瓷自顾自美丽，你眼带笑意，色白花青的锦鲤跃然于碗底，临摹宋体落款时却惦记着你，你隐藏在窑烧里千年的秘密，极细腻犹如绣花针落地，帘外芭蕉惹骤雨门环惹铜绿，而我路过那江南小镇惹了你，在泼墨山水画里，你从墨色深处被隐去，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天色等烟雨 ，而我在等你，月色被打捞起， 晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意，天青色等烟雨 ，而我在等你，炊烟袅袅升起 ，隔江千万里，在瓶底书汉隶仿前朝的飘逸，就当我为遇见你伏笔，天青色等烟雨， 而我在等你，月色被打捞起 ，晕开了结局，如传世的青花瓷自顾自美丽，你眼带笑意。'),(32,'2024-01-22 14:03:14','理想三旬','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在','file/newsPicture2.jpg','雨后有车驶来，驶过暮色苍白，旧铁皮往南开，恋人已不在，收听浓烟下的，诗歌电台，不动情的咳嗽，至少看起来，归途也还可爱，琴弦少了姿态，再不见那夜里，听歌的小孩，时光匆匆独白，将颠沛磨成卡带，已枯倦的情怀，踏碎成年代，就老去吧，孤独别醒来，你渴望的离开，只是无处停摆，就歌唱吧，眼睛眯起来，而热泪的崩坏，只是没抵达的存在，青春又醉倒在，籍籍无名的怀，靠嬉笑来虚度，聚散得慷慨，辗转却去不到，对的站台，如果漂泊是成长，必经的路牌，你迷醒岁月中，那贫瘠的未来，像遗憾季节里，未结果的爱，弄脏了每一页诗，吻最疼痛的告白，而风声吹到这，已不需要释怀，就老去吧，孤独别醒来，渴望的离开只是无处停摆就歌唱吧，眼睛眯起来而热泪的崩坏，只是没抵达的存在，就甜蜜地忍耐，繁星润湿窗台，光影跳动着像在，困倦里说爱，再无谓的感慨，以为明白，梦倒塌的地方，今已爬满青苔。'),(33,'2024-01-22 14:03:14','七里香','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠','file/newsPicture3.jpg','窗外的麻雀在电线杆上多嘴，你说这一句很有夏天的感觉，手中的铅笔在纸上来来回回，我用几行字形容你是我的谁，秋刀鱼的滋味猫跟你都想了解，初恋的香味就这样被我们寻回，那温暖的阳光像刚摘的鲜艳草莓，你说你舍不得吃掉这一种感觉，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，雨下整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，你是我唯一想要的了解，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，那饱满的稻穗幸福了这个季节，而你的脸颊像田里熟透的番茄，你突然对我说七里香的名字很美，我此刻却只想亲吻你倔强的嘴，雨下整夜我的爱溢出就像雨水，院子落叶跟我的思念厚厚一叠，几句是非也无法将我的热情冷却，你出现在我诗的每一页，整夜我的爱溢出就像雨水，窗台蝴蝶像诗里纷飞的美丽章节，我接着写，把永远爱你写进诗的结尾，是我唯一想要的了解。'),(34,'2024-01-22 14:03:14','江南','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸','file/newsPicture4.jpg','风到这里就是粘，粘住过客的思念，雨到了这里缠成线，缠着我们流连人世间，你在身边就是缘，缘分写在三生石上面，爱有万分之一甜，宁愿我就葬在这一点，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，圈圈圆圆圈圈，天天年年天天的我，深深看你的脸，生气的温柔，埋怨的温柔的脸，不懂爱恨情愁煎熬的我们，都以为相爱就像风云的善变，相信爱一天 抵过永远，在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂，相信爱一天抵过永远。在这一刹那冻结了时间，不懂怎么表现温柔的我们，还以为殉情只是古老的传言，离愁能有多痛 痛有多浓，当梦被埋在江南烟雨中，心碎了才懂。'),(35,'2024-01-22 14:03:14','那些你很冒险的梦','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落','file/newsPicture5.jpg','当两颗心开始震动，当你瞳孔学会闪躲，当爱慢慢被遮住只剩下黑，距离像影子被拉拖，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心多执着就加倍心痛，那些你很冒险的梦， 我陪你去疯，折纸飞机碰到雨天终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，当爱的故事剩听说，我找不到你单纯的面孔，当生命每分每秒都为你转动，心有多执着就加倍心痛，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，我不想放手 你松开的左手，你爱的放纵 我白不回天空，我输了 累了，但你再也 不回头，那些你很冒险的梦 我陪你去疯，折纸飞机 碰到雨天 终究会坠落，太残忍的话我直说 因为爱很重，你却不想懂 只往反方向走，你真的不懂 我的爱已降落。'),(36,'2024-01-22 14:03:14','孤勇者','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望','file/newsPicture6.jpg','都，是勇敢的，你额头的伤口 你的 不同 你犯的错，都 不必隐藏，你破旧的玩偶 你的 面具 你的自我，他们说 要带着光 驯服每一头怪兽，他们说 要缝好你的伤，没有人爱小丑 为何孤独 不可 光荣，人只有不完美 值得歌颂，谁说污泥满身的不算英雄，爱你孤身走暗巷，爱你不跪的模样，爱你对峙过绝望，不肯哭一场，爱你破烂的衣裳，却敢堵命运的枪，爱你和我那么像，缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，他们说 要戒了你的狂，就像擦掉了污垢，他们说 要顺台阶而上，而代价是低头，那就让我 不可 乘风，你一样骄傲着 那种孤勇，谁说对弈平凡的不算英雄，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你破烂的衣裳 却敢堵命运的枪，爱你和我那么像 缺口都一样，去吗 配吗 这褴褛的披风，战吗 战啊 以最卑微的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄，你的斑驳 与众不同 与众不同，你的沉默 震耳欲聋 震耳欲聋，You Are The Hero，爱你孤身走暗巷 爱你不跪的模样，爱你对峙过绝望 不肯哭一场，爱你来自于蛮荒 一生不借谁的光，你将造你的城邦 在废墟之上，去吗 去啊 以最卑微的梦，战吗 战啊 以最孤高的梦，致那黑夜中的呜咽与怒吼，谁说站在光里的才算英雄。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) DEFAULT NULL COMMENT '商品表名',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `buynumber` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` double DEFAULT NULL COMMENT '单价',
  `discountprice` double DEFAULT NULL COMMENT '折扣价',
  `total` double DEFAULT NULL COMMENT '总价',
  `discounttotal` double DEFAULT NULL COMMENT '折扣总价格',
  `type` varchar(200) DEFAULT NULL COMMENT '支付类型',
  `status` varchar(200) DEFAULT NULL COMMENT '订单状态',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) DEFAULT NULL COMMENT '收货人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `logistics` longtext COMMENT '物流',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodtype` varchar(200) DEFAULT NULL COMMENT '商品类型',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=1705932420581 DEFAULT CHARSET=utf8 COMMENT='商品订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1705932420580,'2024-01-22 14:06:59','20241222270501','dianyingxinxi',73,'电影名称3','file/dianyingxinxiHaibao3.jpg',1,99.9,99.9,99.9,99.9,'1','已完成','15',NULL,NULL,'',NULL,41,'电影分类3');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) DEFAULT NULL COMMENT 'refid',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `picture` longtext NOT NULL COMMENT '图片',
  `type` varchar(200) DEFAULT NULL COMMENT '类型(1:收藏,21:赞,22:踩,31:竞拍参与,41:关注)',
  `inteltype` varchar(200) DEFAULT NULL COMMENT '推荐类型',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,41,'用户账号1','yonghu','用户','z0vhvi2jlk1isi37itgmqws3x5oahf6k','2024-01-22 14:06:19','2024-01-22 15:06:20');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(200) NOT NULL COMMENT '用户名',
  `password` varchar(200) NOT NULL COMMENT '密码',
  `role` varchar(200) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-01-22 14:03:14','admin','admin','管理员');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `yonghumima` varchar(200) NOT NULL COMMENT '用户密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `touxiang` longtext COMMENT '头像',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shoujihaoma` varchar(200) DEFAULT NULL COMMENT '手机号码',
  `dizhi` varchar(200) DEFAULT NULL COMMENT '地址',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `jf` double DEFAULT '0' COMMENT '积分',
  `money` double DEFAULT '0' COMMENT '余额',
  `vip` varchar(200) DEFAULT '否' COMMENT '是否会员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (41,'2024-01-22 14:03:14','用户账号1','123456','用户姓名1','file/yonghuTouxiang1.jpg','男','19819881111','地址1','102020001@qq.com',10099,100.1,'否'),(42,'2024-01-22 14:03:14','用户账号2','123456','用户姓名2','file/yonghuTouxiang2.jpg','男','19819881112','地址2','102020002@qq.com',10000,200,'否'),(43,'2024-01-22 14:03:14','用户账号3','123456','用户姓名3','file/yonghuTouxiang3.jpg','男','19819881113','地址3','102020003@qq.com',10000,200,'否'),(44,'2024-01-22 14:03:14','用户账号4','123456','用户姓名4','file/yonghuTouxiang4.jpg','男','19819881114','地址4','102020004@qq.com',10000,200,'否'),(45,'2024-01-22 14:03:14','用户账号5','123456','用户姓名5','file/yonghuTouxiang5.jpg','男','19819881115','地址5','102020005@qq.com',10000,200,'否'),(46,'2024-01-22 14:03:14','用户账号6','123456','用户姓名6','file/yonghuTouxiang6.jpg','男','19819881116','地址6','102020006@qq.com',10000,200,'否');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-22 11:45:30

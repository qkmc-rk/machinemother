/*
 Navicat Premium Data Transfer

 Source Server         : 45.40.193.214
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 45.40.193.214:3306
 Source Schema         : machinemother

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 11/11/2019 15:21:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
BEGIN;
INSERT INTO `hibernate_sequence` VALUES (6443);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
INSERT INTO `hibernate_sequence` VALUES (1);
COMMIT;

-- ----------------------------
-- Table structure for mm_activity
-- ----------------------------
DROP TABLE IF EXISTS `mm_activity`;
CREATE TABLE `mm_activity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL COMMENT '活动起始时间',
  `end` datetime NOT NULL COMMENT '活动结束时间',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '活动创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '活动修改时间',
  `title` varchar(32) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '活动内容',
  `is_delete` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5732 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for mm_addr
-- ----------------------------
DROP TABLE IF EXISTS `mm_addr`;
CREATE TABLE `mm_addr` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `country` varchar(32) NOT NULL COMMENT '国家',
  `province` varchar(32) NOT NULL COMMENT '省',
  `city` varchar(32) NOT NULL COMMENT '市',
  `detail` varchar(255) NOT NULL COMMENT '详细地址',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6316 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mm_addr
-- ----------------------------
BEGIN;
INSERT INTO `mm_addr` VALUES (5860, 59, '中国', '四川省', '成都市', '锦江区川农大9舍', '2019-08-23 09:07:50', '2019-08-23 09:07:50', '18783551223', '阮坤', 1);
INSERT INTO `mm_addr` VALUES (6235, 65, '中国', '四川省', '成都市', '武侯区武侯大道七中', '2019-08-28 21:27:27', '2019-08-28 21:27:27', '18783551223', '中华', 1);
INSERT INTO `mm_addr` VALUES (6258, 66, '中国', '四川省', '成都市', '锦江区三圣乡锦江城市花园1期', '2019-08-30 00:41:47', '2019-08-30 00:41:47', '13608070100', '李生', 1);
INSERT INTO `mm_addr` VALUES (6272, 65, '中国', '北京市', '北京市', '东城区滚滚滚', '2019-08-31 23:53:00', '2019-08-31 23:53:00', '13145487548', '在政治', 1);
INSERT INTO `mm_addr` VALUES (6315, 71, '中国', '海南省', '海口市', '秀英区我们的生活', '2019-09-12 05:52:57', '2019-09-12 05:52:57', '15808277234', '我们的', 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_admin
-- ----------------------------
DROP TABLE IF EXISTS `mm_admin`;
CREATE TABLE `mm_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL COMMENT '账号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `is_lock` tinyint(2) unsigned NOT NULL COMMENT '是否锁定0/1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314445443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mm_admin
-- ----------------------------
BEGIN;
INSERT INTO `mm_admin` VALUES (314445437, 'admin', '689a7f41007215efcd7662de263812ef', 0);
INSERT INTO `mm_admin` VALUES (314445438, 'admin1', '689a7f41007215efcd7662de263812ef', 0);
INSERT INTO `mm_admin` VALUES (314445439, 'admin2', '689a7f41007215efcd7662de263812ef', 0);
INSERT INTO `mm_admin` VALUES (314445440, 'admin3', '689a7f41007215efcd7662de263812ef', 0);
INSERT INTO `mm_admin` VALUES (314445441, 'admin4', '689a7f41007215efcd7662de263812ef', 0);
INSERT INTO `mm_admin` VALUES (314445442, 'admin5', '689a7f41007215efcd7662de263812ef', 0);
COMMIT;

-- ----------------------------
-- Table structure for mm_announcement
-- ----------------------------
DROP TABLE IF EXISTS `mm_announcement`;
CREATE TABLE `mm_announcement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5857 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for mm_comment
-- ----------------------------
DROP TABLE IF EXISTS `mm_comment`;
CREATE TABLE `mm_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL COMMENT '对某个产品评论，所以需要itemid',
  `userid` bigint(20) unsigned NOT NULL COMMENT '评论者的id',
  `score` tinyint(2) unsigned NOT NULL COMMENT '分数，填写1-5',
  `comment` varchar(255) NOT NULL COMMENT '评语',
  `picture1` varchar(255) DEFAULT NULL COMMENT '图片1',
  `picture2` varchar(255) DEFAULT NULL COMMENT '图片2',
  `picture3` varchar(255) DEFAULT NULL COMMENT '图片3',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_rcmd` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐上主页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5762 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for mm_commissionrecord
-- ----------------------------
DROP TABLE IF EXISTS `mm_commissionrecord`;
CREATE TABLE `mm_commissionrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '佣金数量',
  `is_save` tinyint(1) unsigned NOT NULL COMMENT '1-存入佣金,0-消费佣金',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5740 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='佣金记录表';

-- ----------------------------
-- Table structure for mm_creditrecord
-- ----------------------------
DROP TABLE IF EXISTS `mm_creditrecord`;
CREATE TABLE `mm_creditrecord` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录生成时间',
  `amount` int(255) unsigned NOT NULL COMMENT '积分变化数量',
  `is_save` tinyint(1) unsigned NOT NULL COMMENT '是否存入积分1是，0消费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6402 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='积分记录';

-- ----------------------------
-- Records of mm_creditrecord
-- ----------------------------
BEGIN;
INSERT INTO `mm_creditrecord` VALUES (6185, 66, '2019-08-25 20:05:52', 10, 1);
INSERT INTO `mm_creditrecord` VALUES (6225, 64, '2019-08-27 02:05:05', 10, 1);
INSERT INTO `mm_creditrecord` VALUES (6227, 67, '2019-08-27 04:58:22', 10, 1);
INSERT INTO `mm_creditrecord` VALUES (6240, 65, '2019-08-28 21:29:55', 10, 1);
INSERT INTO `mm_creditrecord` VALUES (6281, 64, '2019-09-02 01:17:38', 10, 1);
INSERT INTO `mm_creditrecord` VALUES (6401, 68, '2019-10-08 02:39:28', 10, 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_decoupon
-- ----------------------------
DROP TABLE IF EXISTS `mm_decoupon`;
CREATE TABLE `mm_decoupon` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '优惠券获得时间',
  `gmt_past` datetime NOT NULL COMMENT '过期时间',
  `is_used` tinyint(1) unsigned NOT NULL COMMENT '状态，0未使用，1已使用',
  `is_past` tinyint(1) unsigned NOT NULL COMMENT '是否过期，0未过期，1已过期',
  `min` decimal(10,2) unsigned NOT NULL COMMENT '使用最低额',
  `worth` decimal(10,2) unsigned NOT NULL COMMENT '优惠券额度',
  `is_fromexchange` tinyint(1) unsigned NOT NULL COMMENT '是否是兑换得到优惠券获得来源,0:领取,1:兑换',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5824 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券';

-- ----------------------------
-- Table structure for mm_decouponcdkey
-- ----------------------------
DROP TABLE IF EXISTS `mm_decouponcdkey`;
CREATE TABLE `mm_decouponcdkey` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cdkey` varchar(255) NOT NULL COMMENT '兑换码cdkey',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生成时间',
  `gmt_past` datetime NOT NULL COMMENT '过期时间',
  `is_exchanged` tinyint(1) unsigned NOT NULL COMMENT '是否兑换，0未兑换，1已兑换',
  `is_past` tinyint(1) unsigned NOT NULL COMMENT '是否已过期',
  `min` decimal(10,2) unsigned NOT NULL COMMENT '使用最低额度',
  `worth` decimal(10,2) unsigned NOT NULL COMMENT '优惠券额度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5081 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券的兑换码';

-- ----------------------------
-- Table structure for mm_dict_producttype
-- ----------------------------
DROP TABLE IF EXISTS `mm_dict_producttype`;
CREATE TABLE `mm_dict_producttype` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL COMMENT '类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mm_dict_producttype
-- ----------------------------
BEGIN;
INSERT INTO `mm_dict_producttype` VALUES (7, '开荒服务');
INSERT INTO `mm_dict_producttype` VALUES (8, '家庭保洁');
INSERT INTO `mm_dict_producttype` VALUES (9, '家电清洗');
INSERT INTO `mm_dict_producttype` VALUES (10, '家居清洗');
INSERT INTO `mm_dict_producttype` VALUES (11, '单位服务');
INSERT INTO `mm_dict_producttype` VALUES (12, '储值时长卡');
INSERT INTO `mm_dict_producttype` VALUES (13, '管家服务上线中');
COMMIT;

-- ----------------------------
-- Table structure for mm_index_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `mm_index_advertisement`;
CREATE TABLE `mm_index_advertisement` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imagesrc` varchar(255) NOT NULL COMMENT '图片地址',
  `productid` bigint(20) unsigned NOT NULL COMMENT '产品ID',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_visible` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否可被前端检索',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1786 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for mm_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `mm_index_banner`;
CREATE TABLE `mm_index_banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imagesrc` varchar(255) NOT NULL COMMENT '轮播图图片的地址',
  `productid` bigint(20) NOT NULL COMMENT '该图指向的具体产品',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='主页banner的数据信息';

-- ----------------------------
-- Records of mm_index_banner
-- ----------------------------
BEGIN;
INSERT INTO `mm_index_banner` VALUES (6174, 'http://image.ruankun.xyz/fa68428fb7c044f37c498c3e65e8b82a.jpg', 97, '2019-08-26 00:03:36', '2019-08-26 00:03:36', 1);
INSERT INTO `mm_index_banner` VALUES (6175, 'http://image.ruankun.xyz/a76d27393afe025012d1245d00acad5b.jpg', 95, '2019-08-26 00:03:59', '2019-08-26 00:03:59', 1);
INSERT INTO `mm_index_banner` VALUES (6176, 'http://image.ruankun.xyz/49de195e9d78f901193d1feb22f00138.jpg', 79, '2019-08-26 00:04:29', '2019-08-26 00:04:29', 1);
INSERT INTO `mm_index_banner` VALUES (6177, 'http://image.ruankun.xyz/02965d7d9b2ddec5569a5cc262153a99.jpg', 82, '2019-08-26 00:04:48', '2019-08-26 00:04:48', 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_index_recommend
-- ----------------------------
DROP TABLE IF EXISTS `mm_index_recommend`;
CREATE TABLE `mm_index_recommend` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) NOT NULL COMMENT '产品ID',
  `imagesrc` varchar(255) NOT NULL COMMENT '图',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='主页推荐';

-- ----------------------------
-- Records of mm_index_recommend
-- ----------------------------
BEGIN;
INSERT INTO `mm_index_recommend` VALUES (6229, 78, 'http://image.ruankun.xyz/d9cb33459295049d12dd741b5b6c8b01.jpg', '2019-08-28 02:04:18', '2019-08-28 02:04:18');
INSERT INTO `mm_index_recommend` VALUES (6230, 97, 'http://image.ruankun.xyz/20170e0cf5a829311511581c007e4197.jpg', '2019-08-28 02:04:45', '2019-08-28 02:04:45');
INSERT INTO `mm_index_recommend` VALUES (6231, 85, 'http://image.ruankun.xyz/cb51666f59b75eec49b6cc9c383cc265.jpg', '2019-08-28 02:04:59', '2019-08-28 02:04:59');
COMMIT;

-- ----------------------------
-- Table structure for mm_item
-- ----------------------------
DROP TABLE IF EXISTS `mm_item`;
CREATE TABLE `mm_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL COMMENT '产品id',
  `productpropsid` bigint(20) unsigned NOT NULL COMMENT '产品规格id',
  `quantity` int(10) unsigned NOT NULL COMMENT '数量',
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单号，只有生成订单后才有效，否则该字段无效',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `is_comment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK9o10rw053182mt6x88cwm71yo` (`productid`),
  KEY `FKl39bglm15daub3baptdt7ish0` (`productpropsid`),
  CONSTRAINT `FK9o10rw053182mt6x88cwm71yo` FOREIGN KEY (`productid`) REFERENCES `mm_product` (`id`),
  CONSTRAINT `FKl39bglm15daub3baptdt7ish0` FOREIGN KEY (`productpropsid`) REFERENCES `mm_productprops` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='item表，表示购物车，购物车里面的每一件物品都是item，当生成订单时，item中的订单号就不为空了。表示item从购物车移除，到了订单中';

-- ----------------------------
-- Records of mm_item
-- ----------------------------
BEGIN;
INSERT INTO `mm_item` VALUES (6234, 113, 6233, 1, '95430037181051295736583969337042', '2019-08-29 10:23:52', '2019-08-29 10:26:19', 65, 0);
INSERT INTO `mm_item` VALUES (6238, 113, 6233, 1, '95959382713829241731447926836049', '2019-08-29 10:27:38', '2019-08-29 10:30:47', 65, 0);
INSERT INTO `mm_item` VALUES (6257, 105, 6115, 1, '93001083487377171905629222188401', '2019-08-30 13:40:31', '2019-08-30 13:41:56', 66, 0);
INSERT INTO `mm_item` VALUES (6262, 94, 6026, 2, NULL, '2019-08-30 14:16:16', '2019-08-30 14:16:16', 69, 0);
INSERT INTO `mm_item` VALUES (6264, 111, 6209, 1, '99963499054173802962865937283132', '2019-08-31 10:35:34', '2019-08-31 10:35:44', 66, 0);
INSERT INTO `mm_item` VALUES (6273, 105, 6115, 1, '94631422314300180252214752134684', '2019-09-01 12:58:10', '2019-09-12 18:53:07', 71, 0);
INSERT INTO `mm_item` VALUES (6275, 113, 6233, 20, '91400840637758798845195156979443', '2019-09-01 16:40:27', '2019-09-01 16:40:57', 66, 0);
INSERT INTO `mm_item` VALUES (6278, 107, 6145, 1, '97295016166413933577002584780327', '2019-09-02 13:12:08', '2019-09-02 13:12:22', 66, 0);
INSERT INTO `mm_item` VALUES (6282, 111, 6203, 1, '99862586052749052197065054046730', '2019-09-03 16:16:15', '2019-09-03 16:16:23', 66, 0);
INSERT INTO `mm_item` VALUES (6285, 76, 5889, 1, '91388184967022128079195655650225', '2019-09-04 22:11:33', '2019-09-04 22:12:17', 65, 0);
INSERT INTO `mm_item` VALUES (6287, 113, 6233, 50, '91839457104288149640353548325953', '2019-09-05 08:20:47', '2019-09-05 08:21:22', 66, 0);
INSERT INTO `mm_item` VALUES (6296, 113, 6233, 50, '94979382279678011022949794288464', '2019-09-06 17:49:04', '2019-09-06 17:50:03', 66, 0);
INSERT INTO `mm_item` VALUES (6299, 113, 6233, 100, '90838442533645957751704186756936', '2019-09-07 14:03:46', '2019-09-07 14:06:00', 66, 0);
INSERT INTO `mm_item` VALUES (6302, 105, 6115, 1, '94816080186196097106141953220531', '2019-09-08 18:55:10', '2019-09-08 18:55:20', 66, 0);
INSERT INTO `mm_item` VALUES (6305, 113, 6233, 50, '96165369197075653092594818437122', '2019-09-09 14:37:37', '2019-09-09 14:38:09', 66, 0);
INSERT INTO `mm_item` VALUES (6308, 105, 6120, 1, '92995463904183265101233547725627', '2019-09-10 14:09:27', '2019-09-10 14:09:37', 66, 0);
INSERT INTO `mm_item` VALUES (6311, 113, 6233, 100, '98944695783070656011923848523116', '2019-09-11 17:40:04', '2019-09-11 17:41:20', 66, 0);
INSERT INTO `mm_item` VALUES (6317, 105, 6115, 1, '94999925626611339591338647335225', '2019-09-12 22:27:34', '2019-09-12 22:27:44', 66, 0);
INSERT INTO `mm_item` VALUES (6320, 113, 6233, 50, '98457273223477785563558437615035', '2019-09-13 23:21:55', '2019-09-13 23:22:55', 66, 0);
INSERT INTO `mm_item` VALUES (6323, 113, 6233, 100, '91813082062306324333741588857253', '2019-09-14 19:00:09', '2019-09-14 19:02:07', 66, 0);
INSERT INTO `mm_item` VALUES (6326, 113, 6233, 200, '94951698322205089073174345769435', '2019-09-15 19:13:15', '2019-09-15 19:16:58', 66, 0);
INSERT INTO `mm_item` VALUES (6329, 113, 6233, 160, '90461385074886182814176141676995', '2019-09-16 13:53:38', '2019-09-16 13:56:14', 66, 0);
INSERT INTO `mm_item` VALUES (6332, 113, 6233, 120, '94031688378036829130164120712399', '2019-09-17 22:18:59', '2019-09-17 22:21:06', 66, 0);
INSERT INTO `mm_item` VALUES (6335, 113, 6233, 130, '96244277303483415732862509970168', '2019-09-18 17:51:01', '2019-09-18 17:53:19', 66, 0);
INSERT INTO `mm_item` VALUES (6338, 113, 6233, 220, '97003302471388964852778924568274', '2019-09-19 22:29:47', '2019-09-19 22:29:56', 66, 0);
INSERT INTO `mm_item` VALUES (6341, 113, 6233, 200, '94898260604917132424265531876403', '2019-09-20 15:46:28', '2019-09-20 15:46:36', 66, 0);
INSERT INTO `mm_item` VALUES (6345, 113, 6233, 230, '93149615872585756797854818662928', '2019-09-21 15:14:16', '2019-09-21 15:14:28', 66, 0);
INSERT INTO `mm_item` VALUES (6348, 113, 6233, 240, '92379288361057143503632274649814', '2019-09-22 16:25:15', '2019-09-22 16:25:24', 66, 0);
INSERT INTO `mm_item` VALUES (6351, 113, 6233, 200, '99223240081097209406621802014637', '2019-09-23 23:22:44', '2019-09-23 23:22:52', 66, 0);
INSERT INTO `mm_item` VALUES (6354, 113, 6233, 200, '94070182876248764943041936348952', '2019-09-24 18:58:20', '2019-09-24 19:03:17', 66, 0);
INSERT INTO `mm_item` VALUES (6357, 113, 6233, 200, '97267888721708509842928930332929', '2019-09-25 17:45:19', '2019-09-25 17:45:35', 66, 0);
INSERT INTO `mm_item` VALUES (6360, 81, 5929, 1, NULL, '2019-09-25 19:28:37', '2019-09-25 19:28:37', 65, 0);
INSERT INTO `mm_item` VALUES (6361, 113, 6233, 240, '96214763168324376603798878634915', '2019-09-26 18:19:35', '2019-09-26 18:19:46', 66, 0);
INSERT INTO `mm_item` VALUES (6364, 113, 6233, 240, '91121778143818352490692480004735', '2019-09-27 16:23:30', '2019-09-27 16:23:39', 66, 0);
INSERT INTO `mm_item` VALUES (6367, 113, 6233, 220, '98219984230426484233258605609215', '2019-09-28 17:04:45', '2019-09-28 17:05:02', 66, 0);
INSERT INTO `mm_item` VALUES (6370, 113, 6233, 260, '95805341617001181373637892221990', '2019-09-29 18:31:07', '2019-09-29 18:31:17', 66, 0);
INSERT INTO `mm_item` VALUES (6373, 113, 6233, 220, '94690636147723514341844027474820', '2019-09-30 13:30:36', '2019-09-30 13:30:43', 66, 0);
INSERT INTO `mm_item` VALUES (6376, 113, 6233, 250, '98619068784058656316972336775510', '2019-10-01 18:21:14', '2019-10-01 18:21:22', 66, 0);
INSERT INTO `mm_item` VALUES (6379, 113, 6233, 200, '96043950578124205444353979135553', '2019-10-02 14:41:01', '2019-10-02 14:43:01', 66, 0);
INSERT INTO `mm_item` VALUES (6382, 113, 6233, 200, '99668198455508149246996195475842', '2019-10-03 21:25:42', '2019-10-03 21:25:58', 66, 0);
INSERT INTO `mm_item` VALUES (6385, 113, 6233, 200, '91568113044805310412451897845300', '2019-10-04 16:13:45', '2019-10-04 16:13:52', 66, 0);
INSERT INTO `mm_item` VALUES (6389, 113, 6233, 220, '98440604691540152555403655359712', '2019-10-05 15:33:35', '2019-10-05 15:33:45', 66, 0);
INSERT INTO `mm_item` VALUES (6392, 113, 6233, 200, '90886431905162967061897617982175', '2019-10-06 20:27:38', '2019-10-06 20:27:46', 66, 0);
INSERT INTO `mm_item` VALUES (6395, 113, 6233, 200, '99095611472061801349023221501415', '2019-10-07 15:09:51', '2019-10-07 15:09:59', 66, 0);
INSERT INTO `mm_item` VALUES (6398, 113, 6233, 200, '90558019906090739212162202820458', '2019-10-08 15:13:09', '2019-10-08 15:13:24', 66, 0);
INSERT INTO `mm_item` VALUES (6402, 113, 6233, 200, '91744363651047451387308799109446', '2019-10-09 17:59:53', '2019-10-09 18:02:00', 66, 0);
INSERT INTO `mm_item` VALUES (6405, 113, 6233, 1, '92398857181571587114215957801725', '2019-10-10 09:02:33', '2019-10-10 09:02:44', 71, 0);
INSERT INTO `mm_item` VALUES (6408, 113, 6233, 200, '93576255858096059546153065949278', '2019-10-10 22:25:55', '2019-10-10 22:26:05', 66, 0);
INSERT INTO `mm_item` VALUES (6411, 113, 6233, 220, '92794643959167183468537690470041', '2019-10-11 20:10:14', '2019-10-11 20:10:21', 66, 0);
INSERT INTO `mm_item` VALUES (6414, 77, 5896, 2, NULL, '2019-10-12 15:35:13', '2019-10-12 15:35:13', 67, 0);
INSERT INTO `mm_item` VALUES (6415, 113, 6233, 150, '92834575970138214460736351461114', '2019-10-12 21:03:04', '2019-10-12 21:03:11', 66, 0);
INSERT INTO `mm_item` VALUES (6418, 113, 6233, 150, '96835158960492981643568797184703', '2019-10-13 23:29:46', '2019-10-13 23:29:52', 66, 0);
INSERT INTO `mm_item` VALUES (6421, 113, 6233, 100, '98416111868261499337779109722587', '2019-10-14 23:20:56', '2019-10-14 23:21:04', 66, 0);
INSERT INTO `mm_item` VALUES (6424, 113, 6233, 100, '98861280501819999302807706385558', '2019-10-15 22:14:04', '2019-10-15 22:14:11', 66, 0);
INSERT INTO `mm_item` VALUES (6428, 113, 6233, 100, '90294480989977982397602011349289', '2019-10-16 18:19:26', '2019-10-16 18:19:35', 66, 0);
INSERT INTO `mm_item` VALUES (6431, 113, 6233, 100, '91275598315353556651394950001120', '2019-10-17 20:49:43', '2019-10-17 20:50:05', 66, 0);
INSERT INTO `mm_item` VALUES (6434, 113, 6233, 100, '90646430055793991117350004956459', '2019-10-18 23:30:36', '2019-10-18 23:30:44', 66, 0);
INSERT INTO `mm_item` VALUES (6437, 113, 6233, 100, '93645267685276223220197273619088', '2019-10-19 22:04:26', '2019-10-19 22:04:36', 66, 0);
INSERT INTO `mm_item` VALUES (6440, 113, 6233, 100, '90994680018803026802988946151763', '2019-10-20 22:44:17', '2019-10-20 22:44:27', 66, 0);
COMMIT;

-- ----------------------------
-- Table structure for mm_order
-- ----------------------------
DROP TABLE IF EXISTS `mm_order`;
CREATE TABLE `mm_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `ordernumber` varchar(255) NOT NULL COMMENT '订单号',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '总金额，这个是由各个item金额叠加而成的，其实可以直接计算，有点冗余',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单生成时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单状态更改时间',
  `is_paid` tinyint(1) unsigned NOT NULL COMMENT '是否已经支付,0未支付,1已支付',
  `is_finished` tinyint(1) unsigned NOT NULL COMMENT '是否已完成，后台判断了密码后，才应该确认更改此字段',
  `decouponid` bigint(20) DEFAULT NULL COMMENT '如果使用优惠券，则不为空',
  `is_usedecoupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否使用优惠券',
  `credit` decimal(10,0) DEFAULT NULL COMMENT '使用的积分数量',
  `is_usecredit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '该订单是否使用了积分',
  `addr_id` bigint(20) unsigned NOT NULL COMMENT '服务地址ID',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_cancle` tinyint(1) DEFAULT '0',
  `tip` text COMMENT '订单备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_40j6ry2oumuf7kaubkomxbfx7` (`ordernumber`)
) ENGINE=InnoDB AUTO_INCREMENT=6442 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mm_order
-- ----------------------------
BEGIN;
INSERT INTO `mm_order` VALUES (5861, 59, '93653313594848272947483708641242', 140.00, '2019-08-23 09:07:59', '2019-08-23 09:43:15', 0, 0, 0, 0, 0, 0, 5860, 0, 1, '哈哈哈');
INSERT INTO `mm_order` VALUES (6236, 65, '95430037181051295736583969337042', 0.01, '2019-08-28 21:26:20', '2019-08-28 21:26:20', 1, 0, 0, 0, 0, 0, 6235, 0, 0, '测试');
INSERT INTO `mm_order` VALUES (6242, 65, '95959382713829241731447926836049', 0.01, '2019-08-28 21:30:47', '2019-08-28 21:30:47', 1, 0, 0, 0, 0, 0, 6235, 0, 0, '');
INSERT INTO `mm_order` VALUES (6259, 66, '93001083487377171905629222188401', 7.00, '2019-08-30 00:41:56', '2019-08-30 00:41:56', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6265, 66, '99963499054173802962865937283132', 12.00, '2019-08-30 21:35:45', '2019-08-30 21:35:45', 1, 1, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6276, 66, '91400840637758798845195156979443', 0.20, '2019-09-01 03:40:58', '2019-09-01 03:40:58', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6279, 66, '97295016166413933577002584780327', 9.00, '2019-09-02 00:12:22', '2019-09-02 00:12:22', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6283, 66, '99862586052749052197065054046730', 12.00, '2019-09-03 03:16:23', '2019-09-03 03:16:23', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6286, 65, '91388184967022128079195655650225', 45.00, '2019-09-04 09:12:18', '2019-09-10 23:13:48', 0, 0, 0, 0, 0, 0, 6235, 0, 1, '多带点扫把🧹😂😂');
INSERT INTO `mm_order` VALUES (6288, 66, '91839457104288149640353548325953', 0.50, '2019-09-04 19:21:22', '2019-09-04 19:21:22', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6297, 66, '94979382279678011022949794288464', 0.50, '2019-09-06 04:50:04', '2019-09-06 04:50:04', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6300, 66, '90838442533645957751704186756936', 1.00, '2019-09-07 01:06:00', '2019-09-07 01:06:00', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6303, 66, '94816080186196097106141953220531', 7.00, '2019-09-08 05:55:20', '2019-09-08 05:55:20', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6306, 66, '96165369197075653092594818437122', 0.50, '2019-09-09 01:38:10', '2019-09-09 01:38:10', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6309, 66, '92995463904183265101233547725627', 7.00, '2019-09-10 01:09:37', '2019-09-10 01:09:37', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6312, 66, '98944695783070656011923848523116', 1.00, '2019-09-11 04:41:20', '2019-09-11 04:41:20', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6316, 71, '94631422314300180252214752134684', 7.00, '2019-09-12 05:53:08', '2019-10-09 20:02:09', 0, 0, 0, 0, 0, 0, 6315, 0, 1, '');
INSERT INTO `mm_order` VALUES (6318, 66, '94999925626611339591338647335225', 7.00, '2019-09-12 09:27:45', '2019-09-12 09:27:45', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6321, 66, '98457273223477785563558437615035', 0.50, '2019-09-13 10:22:55', '2019-09-13 10:22:55', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6324, 66, '91813082062306324333741588857253', 1.00, '2019-09-14 06:02:08', '2019-09-14 06:02:08', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6327, 66, '94951698322205089073174345769435', 2.00, '2019-09-15 06:16:59', '2019-09-15 06:16:59', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6330, 66, '90461385074886182814176141676995', 1.60, '2019-09-16 00:56:14', '2019-09-16 00:56:14', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6333, 66, '94031688378036829130164120712399', 1.20, '2019-09-17 09:21:06', '2019-09-17 09:21:06', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6336, 66, '96244277303483415732862509970168', 1.30, '2019-09-18 04:53:19', '2019-09-18 04:53:19', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6339, 66, '97003302471388964852778924568274', 2.20, '2019-09-19 09:29:56', '2019-09-19 09:29:56', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6342, 66, '94898260604917132424265531876403', 2.00, '2019-09-20 02:46:37', '2019-09-20 02:46:37', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6346, 66, '93149615872585756797854818662928', 2.30, '2019-09-21 02:14:28', '2019-09-21 02:14:28', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6349, 66, '92379288361057143503632274649814', 2.40, '2019-09-22 03:25:24', '2019-09-22 03:25:24', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6352, 66, '99223240081097209406621802014637', 2.00, '2019-09-23 10:22:53', '2019-09-23 10:22:53', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6355, 66, '94070182876248764943041936348952', 2.00, '2019-09-24 06:03:18', '2019-09-24 06:03:18', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6358, 66, '97267888721708509842928930332929', 2.00, '2019-09-25 04:45:36', '2019-09-25 04:45:36', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6362, 66, '96214763168324376603798878634915', 2.40, '2019-09-26 05:19:46', '2019-09-26 05:19:46', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6365, 66, '91121778143818352490692480004735', 2.40, '2019-09-27 03:23:39', '2019-09-27 03:23:39', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6368, 66, '98219984230426484233258605609215', 2.20, '2019-09-28 04:05:02', '2019-09-28 04:05:02', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6371, 66, '95805341617001181373637892221990', 2.60, '2019-09-29 05:31:17', '2019-09-29 05:31:17', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6374, 66, '94690636147723514341844027474820', 2.20, '2019-09-30 00:30:44', '2019-09-30 00:30:44', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6377, 66, '98619068784058656316972336775510', 2.50, '2019-10-01 05:21:22', '2019-10-01 05:21:22', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6380, 66, '96043950578124205444353979135553', 2.00, '2019-10-02 01:43:01', '2019-10-02 01:43:01', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6383, 66, '99668198455508149246996195475842', 2.00, '2019-10-03 08:25:58', '2019-10-03 08:25:58', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6386, 66, '91568113044805310412451897845300', 2.00, '2019-10-04 03:13:52', '2019-10-04 03:13:52', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6390, 66, '98440604691540152555403655359712', 2.20, '2019-10-05 02:33:45', '2019-10-05 02:33:45', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6393, 66, '90886431905162967061897617982175', 2.00, '2019-10-06 07:27:47', '2019-10-06 07:27:47', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6396, 66, '99095611472061801349023221501415', 2.00, '2019-10-07 02:09:59', '2019-10-07 02:09:59', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6399, 66, '90558019906090739212162202820458', 2.00, '2019-10-08 02:13:24', '2019-10-08 02:13:24', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6403, 66, '91744363651047451387308799109446', 2.00, '2019-10-09 05:02:00', '2019-10-09 05:02:00', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6406, 71, '92398857181571587114215957801725', 0.01, '2019-10-09 20:02:44', '2019-10-09 20:02:44', 1, 0, 0, 0, 0, 0, 6315, 0, 0, '');
INSERT INTO `mm_order` VALUES (6409, 66, '93576255858096059546153065949278', 2.00, '2019-10-10 09:26:05', '2019-10-10 09:26:05', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6412, 66, '92794643959167183468537690470041', 2.20, '2019-10-11 07:10:22', '2019-10-11 07:10:22', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6416, 66, '92834575970138214460736351461114', 1.50, '2019-10-12 08:03:12', '2019-10-12 08:03:12', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6419, 66, '96835158960492981643568797184703', 1.50, '2019-10-13 10:29:53', '2019-10-13 10:29:53', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6422, 66, '98416111868261499337779109722587', 1.00, '2019-10-14 10:21:05', '2019-10-14 10:21:05', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6425, 66, '98861280501819999302807706385558', 1.00, '2019-10-15 09:14:12', '2019-10-15 09:14:12', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6429, 66, '90294480989977982397602011349289', 1.00, '2019-10-16 05:19:36', '2019-10-16 05:19:36', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6432, 66, '91275598315353556651394950001120', 1.00, '2019-10-17 07:50:05', '2019-10-17 07:50:05', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6435, 66, '90646430055793991117350004956459', 1.00, '2019-10-18 10:30:44', '2019-10-18 10:30:44', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6438, 66, '93645267685276223220197273619088', 1.00, '2019-10-19 09:04:35', '2019-10-19 09:04:35', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
INSERT INTO `mm_order` VALUES (6441, 66, '90994680018803026802988946151763', 1.00, '2019-10-20 09:44:27', '2019-10-20 09:44:27', 1, 0, 0, 0, 0, 0, 6258, 0, 0, '');
COMMIT;

-- ----------------------------
-- Table structure for mm_ordersecret
-- ----------------------------
DROP TABLE IF EXISTS `mm_ordersecret`;
CREATE TABLE `mm_ordersecret` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `secret` varchar(255) NOT NULL COMMENT '密码',
  `orderid` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `is_used` tinyint(1) unsigned NOT NULL COMMENT '是否被使用',
  `employee` varchar(255) DEFAULT NULL COMMENT '订单完成员工,该字段应该在订单finish之后填入',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mm_ordersecret
-- ----------------------------
BEGIN;
INSERT INTO `mm_ordersecret` VALUES (6237, '8921943661', 6236, 0, NULL, '2019-08-28 21:26:34', '2019-08-28 21:26:34', 65);
INSERT INTO `mm_ordersecret` VALUES (6243, '2780199590', 6242, 0, NULL, '2019-08-28 21:30:56', '2019-08-28 21:30:56', 65);
INSERT INTO `mm_ordersecret` VALUES (6260, '3892513272', 6259, 0, NULL, '2019-08-30 00:42:06', '2019-08-30 00:42:06', 66);
INSERT INTO `mm_ordersecret` VALUES (6266, '6167678027', 6265, 1, '小二', '2019-08-30 21:35:53', '2019-08-30 21:35:53', 66);
INSERT INTO `mm_ordersecret` VALUES (6277, '5077258127', 6276, 0, NULL, '2019-09-01 03:41:07', '2019-09-01 03:41:07', 66);
INSERT INTO `mm_ordersecret` VALUES (6280, '5824950844', 6279, 0, NULL, '2019-09-02 00:12:31', '2019-09-02 00:12:31', 66);
INSERT INTO `mm_ordersecret` VALUES (6284, '867750007', 6283, 0, NULL, '2019-09-03 03:16:32', '2019-09-03 03:16:32', 66);
INSERT INTO `mm_ordersecret` VALUES (6289, '8659251749', 6288, 0, NULL, '2019-09-04 19:21:30', '2019-09-04 19:21:30', 66);
INSERT INTO `mm_ordersecret` VALUES (6298, '4837679837', 6297, 0, NULL, '2019-09-06 04:50:13', '2019-09-06 04:50:13', 66);
INSERT INTO `mm_ordersecret` VALUES (6301, '8701563561', 6300, 0, NULL, '2019-09-07 01:06:09', '2019-09-07 01:06:09', 66);
INSERT INTO `mm_ordersecret` VALUES (6304, '4579558129', 6303, 0, NULL, '2019-09-08 05:55:28', '2019-09-08 05:55:28', 66);
INSERT INTO `mm_ordersecret` VALUES (6307, '6238732998', 6306, 0, NULL, '2019-09-09 01:38:20', '2019-09-09 01:38:20', 66);
INSERT INTO `mm_ordersecret` VALUES (6310, '9531536911', 6309, 0, NULL, '2019-09-10 01:09:46', '2019-09-10 01:09:46', 66);
INSERT INTO `mm_ordersecret` VALUES (6313, '1727771047', 6312, 0, NULL, '2019-09-11 04:41:29', '2019-09-11 04:41:29', 66);
INSERT INTO `mm_ordersecret` VALUES (6319, '628916769', 6318, 0, NULL, '2019-09-12 09:27:54', '2019-09-12 09:27:54', 66);
INSERT INTO `mm_ordersecret` VALUES (6322, '9298129318', 6321, 0, NULL, '2019-09-13 10:23:03', '2019-09-13 10:23:03', 66);
INSERT INTO `mm_ordersecret` VALUES (6325, '5007085057', 6324, 0, NULL, '2019-09-14 06:02:16', '2019-09-14 06:02:16', 66);
INSERT INTO `mm_ordersecret` VALUES (6328, '7303886613', 6327, 0, NULL, '2019-09-15 06:17:12', '2019-09-15 06:17:12', 66);
INSERT INTO `mm_ordersecret` VALUES (6331, '210964729', 6330, 0, NULL, '2019-09-16 00:56:23', '2019-09-16 00:56:23', 66);
INSERT INTO `mm_ordersecret` VALUES (6334, '4660456390', 6333, 0, NULL, '2019-09-17 09:21:16', '2019-09-17 09:21:16', 66);
INSERT INTO `mm_ordersecret` VALUES (6337, '2888240478', 6336, 0, NULL, '2019-09-18 04:53:28', '2019-09-18 04:53:28', 66);
INSERT INTO `mm_ordersecret` VALUES (6340, '2574903414', 6339, 0, NULL, '2019-09-19 09:30:06', '2019-09-19 09:30:06', 66);
INSERT INTO `mm_ordersecret` VALUES (6343, '8812061422', 6342, 0, NULL, '2019-09-20 02:46:45', '2019-09-20 02:46:45', 66);
INSERT INTO `mm_ordersecret` VALUES (6347, '8192097492', 6346, 0, NULL, '2019-09-21 02:14:37', '2019-09-21 02:14:37', 66);
INSERT INTO `mm_ordersecret` VALUES (6350, '9201270511', 6349, 0, NULL, '2019-09-22 03:25:33', '2019-09-22 03:25:33', 66);
INSERT INTO `mm_ordersecret` VALUES (6353, '4792136182', 6352, 0, NULL, '2019-09-23 10:23:02', '2019-09-23 10:23:02', 66);
INSERT INTO `mm_ordersecret` VALUES (6356, '8606094906', 6355, 0, NULL, '2019-09-24 06:03:27', '2019-09-24 06:03:27', 66);
INSERT INTO `mm_ordersecret` VALUES (6359, '1973356963', 6358, 0, NULL, '2019-09-25 04:45:45', '2019-09-25 04:45:45', 66);
INSERT INTO `mm_ordersecret` VALUES (6363, '358477844', 6362, 0, NULL, '2019-09-26 05:19:56', '2019-09-26 05:19:56', 66);
INSERT INTO `mm_ordersecret` VALUES (6366, '8089038459', 6365, 0, NULL, '2019-09-27 03:23:49', '2019-09-27 03:23:49', 66);
INSERT INTO `mm_ordersecret` VALUES (6369, '3153375673', 6368, 0, NULL, '2019-09-28 04:05:12', '2019-09-28 04:05:12', 66);
INSERT INTO `mm_ordersecret` VALUES (6372, '7637188437', 6371, 0, NULL, '2019-09-29 05:31:25', '2019-09-29 05:31:25', 66);
INSERT INTO `mm_ordersecret` VALUES (6375, '9125204735', 6374, 0, NULL, '2019-09-30 00:31:16', '2019-09-30 00:31:16', 66);
INSERT INTO `mm_ordersecret` VALUES (6378, '4805921605', 6377, 0, NULL, '2019-10-01 05:21:32', '2019-10-01 05:21:32', 66);
INSERT INTO `mm_ordersecret` VALUES (6381, '7965833395', 6380, 0, NULL, '2019-10-02 01:43:13', '2019-10-02 01:43:13', 66);
INSERT INTO `mm_ordersecret` VALUES (6384, '7363873293', 6383, 0, NULL, '2019-10-03 08:26:10', '2019-10-03 08:26:10', 66);
INSERT INTO `mm_ordersecret` VALUES (6387, '3809396429', 6386, 0, NULL, '2019-10-04 03:14:02', '2019-10-04 03:14:02', 66);
INSERT INTO `mm_ordersecret` VALUES (6391, '9431192771', 6390, 0, NULL, '2019-10-05 02:33:54', '2019-10-05 02:33:54', 66);
INSERT INTO `mm_ordersecret` VALUES (6394, '5694413464', 6393, 0, NULL, '2019-10-06 07:27:55', '2019-10-06 07:27:55', 66);
INSERT INTO `mm_ordersecret` VALUES (6397, '1704870934', 6396, 0, NULL, '2019-10-07 02:10:08', '2019-10-07 02:10:08', 66);
INSERT INTO `mm_ordersecret` VALUES (6400, '5552986092', 6399, 0, NULL, '2019-10-08 02:13:36', '2019-10-08 02:13:36', 66);
INSERT INTO `mm_ordersecret` VALUES (6404, '7526342466', 6403, 0, NULL, '2019-10-09 05:04:40', '2019-10-09 05:04:40', 66);
INSERT INTO `mm_ordersecret` VALUES (6407, '9939838419', 6406, 0, NULL, '2019-10-09 20:02:58', '2019-10-09 20:02:58', 71);
INSERT INTO `mm_ordersecret` VALUES (6410, '7168745948', 6409, 0, NULL, '2019-10-10 09:26:16', '2019-10-10 09:26:16', 66);
INSERT INTO `mm_ordersecret` VALUES (6413, '4202284172', 6412, 0, NULL, '2019-10-11 07:10:33', '2019-10-11 07:10:33', 66);
INSERT INTO `mm_ordersecret` VALUES (6417, '1791534231', 6416, 0, NULL, '2019-10-12 08:03:22', '2019-10-12 08:03:22', 66);
INSERT INTO `mm_ordersecret` VALUES (6420, '7987841967', 6419, 0, NULL, '2019-10-13 10:30:04', '2019-10-13 10:30:04', 66);
INSERT INTO `mm_ordersecret` VALUES (6423, '7055893945', 6422, 0, NULL, '2019-10-14 10:21:16', '2019-10-14 10:21:16', 66);
INSERT INTO `mm_ordersecret` VALUES (6426, '4614937154', 6425, 0, NULL, '2019-10-15 09:14:20', '2019-10-15 09:14:20', 66);
INSERT INTO `mm_ordersecret` VALUES (6430, '1932951912', 6429, 0, NULL, '2019-10-16 05:19:47', '2019-10-16 05:19:47', 66);
INSERT INTO `mm_ordersecret` VALUES (6433, '7278478648', 6432, 0, NULL, '2019-10-17 07:50:15', '2019-10-17 07:50:15', 66);
INSERT INTO `mm_ordersecret` VALUES (6436, '7977028557', 6435, 0, NULL, '2019-10-18 10:30:53', '2019-10-18 10:30:53', 66);
INSERT INTO `mm_ordersecret` VALUES (6439, '5364579454', 6438, 0, NULL, '2019-10-19 09:04:46', '2019-10-19 09:04:46', 66);
INSERT INTO `mm_ordersecret` VALUES (6442, '8376834756', 6441, 0, NULL, '2019-10-20 09:44:36', '2019-10-20 09:44:36', 66);
COMMIT;

-- ----------------------------
-- Table structure for mm_pbdcp_get
-- ----------------------------
DROP TABLE IF EXISTS `mm_pbdcp_get`;
CREATE TABLE `mm_pbdcp_get` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `public_decoupon` int(11) NOT NULL,
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='公共优惠券领取中间表';

-- ----------------------------
-- Table structure for mm_product
-- ----------------------------
DROP TABLE IF EXISTS `mm_product`;
CREATE TABLE `mm_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) unsigned NOT NULL COMMENT '类型字典中去查',
  `title` varchar(32) DEFAULT NULL,
  `picture` varchar(255) NOT NULL COMMENT '主图',
  `content` mediumtext NOT NULL COMMENT '服务主内容',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `intro` text COMMENT '简介',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mm_product
-- ----------------------------
BEGIN;
INSERT INTO `mm_product` VALUES (73, 13, '补差价', 'http://image.ruankun.xyz/7c1d5e1036d759b2e39f542cecd2c7fd.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/5dc81d60e0279beeb459a4e9c5acf7fe.jpg\"></p>', '2019-08-24 23:29:48', '2019-08-24 23:35:03', '补差价专用链接，客户请问随意拍下', 0);
INSERT INTO `mm_product` VALUES (74, 8, '1小时家庭保洁服务累计使用', 'http://image.ruankun.xyz/578d9bfd55d245d0ce77b531aea53c7c.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/0d2a00cdbe474750910eacf0ed6dff25.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/4f24440afffd047431a75bc26a0001f9.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/b2a31af9df4a71d825121f0080741d66.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/6462245f781f8c16313a6950729091e2.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/a1c2f1f470221ba0491ec0b176e4a762.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/bc2ef61f93c78c6abfb47ee8e7aaccb6.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/2d36fa6db7531e4a366168d539c29586.jpg\"></p>', '2019-08-25 11:53:18', '2019-08-25 12:00:21', '优惠价：45元\n\n专业化保洁师上门标准服务', 0);
INSERT INTO `mm_product` VALUES (75, 8, '2小时家庭深度保洁服务', 'http://image.ruankun.xyz/e478d708a9e4404cc98dbac9a0996496.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/fea7dcf455b24cbcd708427c587b98df.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/dfd942ac16e65343c4995cefc15e988d.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/9a0fd605311b5b798b72a3ecf04836cc.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/a072458a946dab51269cc26c14c709ac.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/dee421c1bc426f9b834038793c32ad62.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/5dead49dad049bc0352a4e0c9fd913b8.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/f8b43ced3a0ff430b9666bad7a48dcac.jpg\"></p>', '2019-08-25 11:57:59', '2019-08-25 12:00:25', '优惠价：88元\n\n小户型或租住房较适合', 0);
INSERT INTO `mm_product` VALUES (76, 8, '1小时家庭保洁服务累计使用', 'http://image.ruankun.xyz/3751f4ecdc94b61855253f00b42f1eb6.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/18dd8199c51d46bb3bd815dd6b4f78b4.jpg\"></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/8396b77a28396c9b4e31b52378561954.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/35fd13900cdef4126d373f5bb3c3a928.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7307b5b0451e0a96f463ef70f4f15ee4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/5a6f81df2c754ddbaeff6386fb575c16.jpg\"></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d25f5529767446292c0ba969a721567f.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/420024be12e2f4506d6b9db157a42d8c.jpg\"></p><p class=\"ql-align-center\"><br></p>', '2019-08-25 12:03:39', '2019-08-27 21:14:49', '专业化保洁师上门标准服务', 1);
INSERT INTO `mm_product` VALUES (77, 8, '2小时家庭深度保洁服务', 'http://image.ruankun.xyz/17baf3b674901294cd6bdbb931a299f3.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/539b3fb776931384e9f65fb9215ab4d4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/e9d28f08d2795c32af1fc808c9a8cdb3.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/2229464f578a8c2fcb879577e070da4d.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/9f057afeadfe0d4ca0b81a9e1c46159d.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/abb57ec2a148b1aa6e7cb7dd2d349707.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/112d01f8c1ff8e738e47f0f15ffd7f4b.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/004ab63ce53c6e432282ac7208ac092c.jpg\"></p>', '2019-08-25 12:06:47', '2019-08-27 21:15:26', '小户型或租住房较适合', 1);
INSERT INTO `mm_product` VALUES (78, 8, '3小时家庭深度保洁服务（可擦玻璃）', 'http://image.ruankun.xyz/92e78ae98c4954aef1e68d856cd5266c.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/e9f78fc1b2079b1fb2d94fd1948d3f16.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/8df4aa9b573234186a712670ef8169a3.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/aa36bb8d04e87c22418401ea0ec92467.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/3bcdec1a5725690f5de7326427ccf05c.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/0e1c9d4fe0d0753219c361f9660947e5.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/8e77f8cf750a44838616ec4c32699025.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/3085711200aa1c3c2cd34ecbe0b37bae.jpg\"></p>', '2019-08-25 12:09:27', '2019-08-25 21:05:10', '专业化保洁师上门标准服务,优惠价：139元', 1);
INSERT INTO `mm_product` VALUES (79, 8, '4小时家庭深度保洁服务（可擦玻璃）', 'http://image.ruankun.xyz/6107c3e914e479ad53d0a790e5c4a98b.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/e9f78fc1b2079b1fb2d94fd1948d3f16.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/8df4aa9b573234186a712670ef8169a3.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/aa36bb8d04e87c22418401ea0ec92467.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/3bcdec1a5725690f5de7326427ccf05c.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/0e1c9d4fe0d0753219c361f9660947e5.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/8e77f8cf750a44838616ec4c32699025.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/3085711200aa1c3c2cd34ecbe0b37bae.jpg\"></p>', '2019-08-25 12:11:11', '2019-08-25 21:05:27', '专业化保洁师上门标准服务,优惠价：169元', 1);
INSERT INTO `mm_product` VALUES (80, 8, '3小时家庭保洁+3小时擦玻璃', 'http://image.ruankun.xyz/d1184d76b699d61cd632344331106e82.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/6835ca2c7227f10b9a3275d3b66ecc24.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/675da9ea075cbf0e770494c2f0e0ca51.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/72854898e488a106d1c74a2d2191ec96.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/98fb72448d137161fde16ec63a1f9838.jpg\"></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d144936be274ca2fbeb05974e49e9c0f.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/835b821b4c674ec2316af578e7368f08.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/75b3df1361522aa18670a2d52f3e5c30.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7f749091f60dbdf5f03e72a5b34b0e06.jpg\"></p>', '2019-08-25 12:16:15', '2019-08-25 21:05:40', '专业化保洁师上门标准服务,优惠价：288元', 1);
INSERT INTO `mm_product` VALUES (81, 8, '4小时家庭保洁+4小时擦玻璃', 'http://image.ruankun.xyz/8ac0fe37f055f8debd838d61d07131f3.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/9f3ca761e60e38d50e7484ca0811b59c.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/be0faf8ef591f0bc9a28a15b3c6caa1f.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/ad5f5a350756ae79cb84e89b86b795b6.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/85272a4c44fc407489a8069c87a47786.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/ebdba8b72c3421eefaa4c7bb4a800c81.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/c824d28edfe07327661637895e900016.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/9f015be0168eb4924c6fc76912210368.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/77ec335b2d13c7b7cbbdbd96cacdd1a7.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/a701947d9e3966790eb749e04e3fe456.jpg\"></p>', '2019-08-25 12:21:30', '2019-08-25 21:05:58', '专业化保洁师上门标准服务,优惠价：369元', 1);
INSERT INTO `mm_product` VALUES (82, 8, '1小时专业擦玻璃累计使用', 'http://image.ruankun.xyz/e347697adbf1ae213419d0689b4d08a9.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/f1881625f1469d3f79538f8804ea21b8.jpg\"></p><p class=\"ql-align-center\"><br></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/e8df8b99abf404adddf181aca33148eb.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/3730bfc6cd3a9cc0785591148bd2cd13.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/6b76e14830521bc249008d10bc050403.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/b117dd94e6b6e68cfd5a225e055fe540.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/4b77c1c4895b2286693800165935563a.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/116df1d65291c232ef8d34a441258852.jpg\"></p>', '2019-08-25 12:24:39', '2019-08-25 21:06:10', '专业化保洁师上门标准服务,优惠价：66元', 1);
INSERT INTO `mm_product` VALUES (83, 8, '浴室整体高温消毒清洁服务', 'http://image.ruankun.xyz/8a0a7d859142d6d964e178f14b4f9711.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/102f48b56325705b2da06e6c2b1ef559.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/910cb9d8d21cfbe5692149588b07af3a.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/8f757f105b3aef24bf2378f6c3130e94.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/335157ca1bb9275399ec62fe85550be4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/ac73ba467785d2596c7f10c9a150ccca.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d7e607e5fd4effc0b90e2942dbe0896c.jpg\"></p>', '2019-08-25 12:27:52', '2019-08-25 12:28:58', '优惠价：289元\n\n还您一个健康、清新的浴室环境', 0);
INSERT INTO `mm_product` VALUES (84, 8, '浴室整体高温消毒清洁服务', 'http://image.ruankun.xyz/febdbc9992f35aa00b798a5c94d93a39.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/cd75d2a564d525eca362e0b38722138c.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/b64d3b55db48ccbe8b2b3cb299b066b4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7fa3dd6376d16f3895e5ded1ebd434f4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/48b5297c4447090f7d5dd60e6fdb59ac.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/e88bfece3a2c6e4bc5fe8f575f7e57c3.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/8e7a558ba26aa446852f087a06728778.jpg\"></p>', '2019-08-25 12:32:17', '2019-08-25 21:06:24', '还您一个健康、清新的浴室环境,优惠价：289元', 1);
INSERT INTO `mm_product` VALUES (85, 11, '写字楼、商铺开荒保洁服务', 'http://image.ruankun.xyz/333849174f6a917df15af75241dd617b.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/94a8448be485d658c2d6a66b357972cf.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7d7253d0ba076ab99539a559506fbc85.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d821536620ef9520e85800b29b2f2031.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/b60fbd2a53f4c497dfa97097242be65b.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/4d0c5cd5b2db972e2ab941a465715571.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/76d5ebd5e7cf103b9a4259207af30ef4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/ff10279fdf18663ac36f0e2f084c510f.jpg\"></p>', '2019-08-25 12:51:25', '2019-08-25 21:06:55', '没有时间限制、做到您满意为止,优惠价：6.8元/平方米（10平方米叠加，建议您根据面积选择商品数量）', 1);
INSERT INTO `mm_product` VALUES (86, 11, '办公室、写字楼开荒保洁（单人1小时）', 'http://image.ruankun.xyz/822568ecbcbfade7c9e17c470d8bc905.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/94a8448be485d658c2d6a66b357972cf.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7d7253d0ba076ab99539a559506fbc85.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d821536620ef9520e85800b29b2f2031.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/b60fbd2a53f4c497dfa97097242be65b.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/4d0c5cd5b2db972e2ab941a465715571.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/76d5ebd5e7cf103b9a4259207af30ef4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/ff10279fdf18663ac36f0e2f084c510f.jpg\"></p>', '2019-08-25 12:52:31', '2019-08-25 21:07:11', '服务中途支持投诉、要求换人,优惠价：46元/小时', 1);
INSERT INTO `mm_product` VALUES (87, 11, '写字楼、商铺二次开荒保洁服务', 'http://image.ruankun.xyz/e9ad60c4f430ae7ce5ecce47a0290848.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/94a8448be485d658c2d6a66b357972cf.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7d7253d0ba076ab99539a559506fbc85.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d821536620ef9520e85800b29b2f2031.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/b60fbd2a53f4c497dfa97097242be65b.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/4d0c5cd5b2db972e2ab941a465715571.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/76d5ebd5e7cf103b9a4259207af30ef4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/ff10279fdf18663ac36f0e2f084c510f.jpg\"></p>', '2019-08-25 12:54:20', '2019-08-25 21:07:36', '没有时间限制、做到您满意为止,优惠价：4.4元/平方米（10平方米叠加，建议您根据面积选择商品数量）', 1);
INSERT INTO `mm_product` VALUES (88, 11, '写字楼、商铺二次开荒保洁（单人）', 'http://image.ruankun.xyz/26c48e8e71e2b963c587e6201f5cde65.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/94a8448be485d658c2d6a66b357972cf.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7d7253d0ba076ab99539a559506fbc85.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d821536620ef9520e85800b29b2f2031.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/b60fbd2a53f4c497dfa97097242be65b.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/4d0c5cd5b2db972e2ab941a465715571.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/76d5ebd5e7cf103b9a4259207af30ef4.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/ff10279fdf18663ac36f0e2f084c510f.jpg\"></p>', '2019-08-25 12:54:43', '2019-08-25 21:07:49', '服务中途支持投诉、要求换人,优惠价：44元/小时', 1);
INSERT INTO `mm_product` VALUES (89, 11, '1小全面保洁服务累计使用', 'http://image.ruankun.xyz/5b72dd6a075a7574cff51aaa47a7003f.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/9f932ffecf516bcb41dc5356d8464d03.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/735666976fa33514a8081ba32af678b6.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/502d5b5e5cec08afd91dfdcccfafcfb8.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/af4a4e66d4d66b3845bc995b32385ba4.jpg\"></p>', '2019-08-25 12:56:18', '2019-08-25 21:08:03', '限写字楼、商铺等工程保洁使用,优惠价：42元', 1);
INSERT INTO `mm_product` VALUES (90, 11, '2小时全面保洁服务（含擦玻璃）', 'http://image.ruankun.xyz/e958613e8f9616147b5d5957adc82258.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/9f932ffecf516bcb41dc5356d8464d03.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/735666976fa33514a8081ba32af678b6.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/502d5b5e5cec08afd91dfdcccfafcfb8.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/af4a4e66d4d66b3845bc995b32385ba4.jpg\"></p>', '2019-08-25 12:57:27', '2019-08-25 21:08:15', '限写字楼、商铺等工程保洁使用,优惠价：80元', 1);
INSERT INTO `mm_product` VALUES (91, 11, '3小时全面保洁服务（含擦玻璃）', 'http://image.ruankun.xyz/58dea2ad88e868b7ccffb0cc089deadb.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/9f932ffecf516bcb41dc5356d8464d03.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/735666976fa33514a8081ba32af678b6.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/502d5b5e5cec08afd91dfdcccfafcfb8.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/af4a4e66d4d66b3845bc995b32385ba4.jpg\"></p>', '2019-08-25 12:58:02', '2019-08-25 21:08:26', '限写字楼、商铺等工程保洁使用,优惠价：120元', 1);
INSERT INTO `mm_product` VALUES (92, 11, '4小时全面保洁服务（含擦玻璃）', 'http://image.ruankun.xyz/520caacb43ef53146e0fcf0431b6b1f6.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/9f932ffecf516bcb41dc5356d8464d03.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/735666976fa33514a8081ba32af678b6.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/502d5b5e5cec08afd91dfdcccfafcfb8.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/af4a4e66d4d66b3845bc995b32385ba4.jpg\"></p>', '2019-08-25 12:58:43', '2019-08-25 21:08:51', '限写字楼、商铺等工程保洁使用,优惠价：160元', 1);
INSERT INTO `mm_product` VALUES (93, 9, '挂机空调拆洗服务（高温清洗）', 'http://image.ruankun.xyz/03a7c955a9127b3a345823119ee32159.jpg', '<p><img src=\"http://image.ruankun.xyz/a4da076c583807e2ad8fc044f9c52823.jpg\"></p><p><img src=\"http://image.ruankun.xyz/5defadeb7ec87e4c3a705e00438ec286.jpg\"><img src=\"http://image.ruankun.xyz/804121cae4be8a789b585d1d5a293950.jpg\"><img src=\"http://image.ruankun.xyz/7b25724d8fbfcb929e5283686a3e6cab.jpg\"><img src=\"http://image.ruankun.xyz/a649bbdaf5bd96448c5ab4874f17b6d5.jpg\"><img src=\"http://image.ruankun.xyz/ca2f75f2013784a542f19d1960ae9782.jpg\"><img src=\"http://image.ruankun.xyz/ac7baa5716500fd55eb5f41d19623495.jpg\"></p>', '2019-08-25 14:10:34', '2019-08-25 14:11:27', '专业清洗师上门服务', 0);
INSERT INTO `mm_product` VALUES (94, 9, '挂机空调拆洗服务（高温清洗）', 'http://image.ruankun.xyz/9bf19f696e5e2c5f07abff4606c9e89d.jpg', '<p><img src=\"http://image.ruankun.xyz/f01a74b6f4ab973c12c3bb4b77b36e0c.jpg\"><img src=\"http://image.ruankun.xyz/b9d35b98e2d341ebbd025c54e5761110.jpg\"><img src=\"http://image.ruankun.xyz/1b12802ab720ac3e796a91659ae0986f.jpg\"><img src=\"http://image.ruankun.xyz/655573d2b357445541e252369aa95f9b.jpg\"><img src=\"http://image.ruankun.xyz/dcc47ee6a02e7c18c4ee988665cea8de.jpg\"><img src=\"http://image.ruankun.xyz/89eae62aa5fce4a03d7a052afddc345b.jpg\"><img src=\"http://image.ruankun.xyz/46b5a1b1c79f80f32f27f683203c3003.jpg\"></p>', '2019-08-25 14:21:41', '2019-08-27 21:15:15', '专业清洗师上门服务', 1);
INSERT INTO `mm_product` VALUES (95, 9, '波轮洗衣机高温清洗服务（全拆）', 'http://image.ruankun.xyz/828a604e855ebf129a23bb3244c960cc.jpg', '<p><img src=\"http://image.ruankun.xyz/d4ab9b7a79ad0e9e042b888b56adf445.jpg\"><img src=\"http://image.ruankun.xyz/b60d5c373848642c0bfd44bde5ca8e1c.jpg\"><img src=\"http://image.ruankun.xyz/d2203c8f7e58a0b175f476d8f635c1d4.jpg\"><img src=\"http://image.ruankun.xyz/ef832ce743f7bec78a9b8694c76fb694.jpg\"><img src=\"http://image.ruankun.xyz/719cabed5f5ebc89c04003da898bfa29.jpg\"><img src=\"http://image.ruankun.xyz/3fcd3d5abc3cd7b63cbe3c9545670d3b.jpg\"><img src=\"http://image.ruankun.xyz/27fd8adfb630f06a71dc7576d5e05efe.jpg\"></p>', '2019-08-25 14:27:17', '2019-08-27 21:16:29', '\n专业清洗师上门服务', 1);
INSERT INTO `mm_product` VALUES (96, 9, '滚筒洗衣机高温清洗服务（免拆）', 'http://image.ruankun.xyz/5e3f749f5f7883ae10298ad0be624e63.jpg', '<p><img src=\"http://image.ruankun.xyz/f6eec3deb8924d12c8a5213ada8c049a.jpg\"><img src=\"http://image.ruankun.xyz/6d0e8027af60c7303672b6b072e99b1e.jpg\"><img src=\"http://image.ruankun.xyz/094f81b48a483c0117755283a1209e7c.jpg\"><img src=\"http://image.ruankun.xyz/1cfc12b12842b43565e3ce6ff4397192.jpg\"><img src=\"http://image.ruankun.xyz/0dde300f2f818daeddb34df9bf427689.jpg\"><img src=\"http://image.ruankun.xyz/33da75d81e073d3efbff0bcf64806a22.jpg\"><img src=\"http://image.ruankun.xyz/2e5e4b93e02c1b846ae4d254f8bb7a0a.jpg\"></p>', '2019-08-25 14:29:46', '2019-08-27 21:16:10', '专业清洗师上门服务', 1);
INSERT INTO `mm_product` VALUES (97, 9, '家用油烟机拆洗（蒸汽机杀毒）', 'http://image.ruankun.xyz/583abefe5d7bebe120ae25d2ea99c963.jpg', '<p><img src=\"http://image.ruankun.xyz/4b3ac702eef4b10f2176a40c23a7d4a3.jpg\"><img src=\"http://image.ruankun.xyz/e1d4cebedec31bc123975dd282142a53.jpg\"><img src=\"http://image.ruankun.xyz/cc171b1518cd61953e5ce4e60beab271.jpg\"><img src=\"http://image.ruankun.xyz/debca5b90ba06a8c1d3a51402cc309b4.jpg\"><img src=\"http://image.ruankun.xyz/e638ad682b637239fc0a0d5ecc204836.jpg\"><img src=\"http://image.ruankun.xyz/ae2bce046ab9074f665d92d4bf7d6b86.jpg\"><img src=\"http://image.ruankun.xyz/16333eaad543a0281cd4b7f10531c2b7.jpg\"></p>', '2019-08-25 14:33:21', '2019-08-27 21:15:53', '专业清洗师上门服务', 1);
INSERT INTO `mm_product` VALUES (98, 9, '油烟机拆洗+橱柜（高温清洗）', 'http://image.ruankun.xyz/2e6f874df72d1e12d964a4ae559c6034.jpg', '<p><img src=\"http://image.ruankun.xyz/5cafb386b34d1efeb8df15fc4070da22.jpg\"><img src=\"http://image.ruankun.xyz/c86964e33a10c9ffe43555d6db6d9a21.jpg\"><img src=\"http://image.ruankun.xyz/20dd5c5384cee0a1863748442f44a740.jpg\"><img src=\"http://image.ruankun.xyz/e1c9453facecdfe61fcdd92e755de550.jpg\"><img src=\"http://image.ruankun.xyz/01556cdacf3255745f5dc48f9089a4b8.jpg\"><img src=\"http://image.ruankun.xyz/96e688805635f42f9cf42950efbf5b96.jpg\"><img src=\"http://image.ruankun.xyz/d5ac97dadfa0c29c8734e9137da92236.jpg\"></p>', '2019-08-25 14:35:38', '2019-08-25 10:14:03', '专业清洗师上门服务', 1);
INSERT INTO `mm_product` VALUES (99, 9, '单开门冰箱高温深度清洁服务', 'http://image.ruankun.xyz/bf5730a5a545f44a6b6fabeb36aa269a.jpg', '<p><img src=\"http://image.ruankun.xyz/50e3100f2d8f98ff5276e0a11befdc1a.jpg\"><img src=\"http://image.ruankun.xyz/dfc29e23c9e5ad831ac576e09d65b2fe.jpg\"><img src=\"http://image.ruankun.xyz/d6fc91a1ec9555a882329c69b1ff43ee.jpg\"><img src=\"http://image.ruankun.xyz/a38358adb7582e10377a42f9bdd865e4.jpg\"><img src=\"http://image.ruankun.xyz/ddcd47bdcafe266522f28438bc0a39fa.jpg\"><img src=\"http://image.ruankun.xyz/dbb0299588b0e5095a2768042f3cd18b.jpg\"></p>', '2019-08-25 14:39:00', '2019-08-25 10:14:40', '专业清洗师上门服务', 1);
INSERT INTO `mm_product` VALUES (100, 9, '双开门冰箱高温深度清洁服务', 'http://image.ruankun.xyz/2df6c773713fa3432e62aa98f6e51dc8.jpg', '<p><img src=\"http://image.ruankun.xyz/50e3100f2d8f98ff5276e0a11befdc1a.jpg\"><img src=\"http://image.ruankun.xyz/dfc29e23c9e5ad831ac576e09d65b2fe.jpg\"><img src=\"http://image.ruankun.xyz/d6fc91a1ec9555a882329c69b1ff43ee.jpg\"><img src=\"http://image.ruankun.xyz/a38358adb7582e10377a42f9bdd865e4.jpg\"><img src=\"http://image.ruankun.xyz/ddcd47bdcafe266522f28438bc0a39fa.jpg\"><img src=\"http://image.ruankun.xyz/dbb0299588b0e5095a2768042f3cd18b.jpg\"></p>', '2019-08-25 14:40:25', '2019-08-25 14:40:25', '优惠价：148元\n\n专业清洗师上门服务', 1);
INSERT INTO `mm_product` VALUES (101, 12, '4次3小时家庭深度保洁次数卡', 'http://image.ruankun.xyz/0ae9e29aa519bd9b3cc8faafe0214592.jpg', '<p><img src=\"http://image.ruankun.xyz/243160a85a9ab68daa19b4628006f995.jpg\"><img src=\"http://image.ruankun.xyz/18dfb0ca241ffbc1a1fb5db0c6402aa6.jpg\"><img src=\"http://image.ruankun.xyz/9d1e69d9067c6c6b1b1941f61a499696.jpg\"><img src=\"http://image.ruankun.xyz/7a058a4eeb4d5cbd5dc53d2b73264c1f.jpg\"><img src=\"http://image.ruankun.xyz/1f0dd07b962d1107c49daee8ab6f4a14.jpg\"><img src=\"http://image.ruankun.xyz/203a72a024b19bdebb19475c6c40ec8b.jpg\"></p>', '2019-08-25 14:49:30', '2019-08-25 14:49:30', '优惠价：499元\n\n90天内有效，比购买单次优惠57元', 1);
INSERT INTO `mm_product` VALUES (102, 12, '6次3小时家庭深度保洁次数卡', 'http://image.ruankun.xyz/2e60a65d74d4a12aa5910b322958772e.jpg', '<p><img src=\"http://image.ruankun.xyz/16e3605d5cb14d610e9bdf699f1f39ed.jpg\"><img src=\"http://image.ruankun.xyz/3909de922f87ac96a002048a3adc85b3.jpg\"><img src=\"http://image.ruankun.xyz/a1ee0bc0deebe6479cb2cbf9b8db5bee.jpg\"><img src=\"http://image.ruankun.xyz/dab552919a65d18cc8cba0266b5d1426.jpg\"><img src=\"http://image.ruankun.xyz/edd89d53ce83119f1d8b92535dc40dbb.jpg\"><img src=\"http://image.ruankun.xyz/73e84f982b3294a905b0bcdacd7439e3.jpg\"><img src=\"http://image.ruankun.xyz/7b101ef762bae63f0707b500e80f3f17.jpg\"></p>', '2019-08-25 14:52:25', '2019-08-25 10:14:19', '180天内有效，比购买单次优惠122元', 1);
INSERT INTO `mm_product` VALUES (103, 12, '4次4小时家庭深度保洁次数卡', 'http://image.ruankun.xyz/e09bd557dc804aac003ae57dc9fafe63.jpg', '<p><img src=\"http://image.ruankun.xyz/16e3605d5cb14d610e9bdf699f1f39ed.jpg\"><img src=\"http://image.ruankun.xyz/3909de922f87ac96a002048a3adc85b3.jpg\"><img src=\"http://image.ruankun.xyz/a1ee0bc0deebe6479cb2cbf9b8db5bee.jpg\"><img src=\"http://image.ruankun.xyz/dab552919a65d18cc8cba0266b5d1426.jpg\"><img src=\"http://image.ruankun.xyz/edd89d53ce83119f1d8b92535dc40dbb.jpg\"><img src=\"http://image.ruankun.xyz/73e84f982b3294a905b0bcdacd7439e3.jpg\"><img src=\"http://image.ruankun.xyz/7b101ef762bae63f0707b500e80f3f17.jpg\"></p>', '2019-08-25 14:53:13', '2019-08-25 10:12:09', '90天内有效，比购买单次优惠40元', 1);
INSERT INTO `mm_product` VALUES (104, 12, '6次4小时家庭深度保洁次数卡', 'http://image.ruankun.xyz/ee1f806ccb3b3e6edbd06bcdc8ecf7a4.jpg', '<p><img src=\"http://image.ruankun.xyz/16e3605d5cb14d610e9bdf699f1f39ed.jpg\"><img src=\"http://image.ruankun.xyz/3909de922f87ac96a002048a3adc85b3.jpg\"><img src=\"http://image.ruankun.xyz/a1ee0bc0deebe6479cb2cbf9b8db5bee.jpg\"><img src=\"http://image.ruankun.xyz/dab552919a65d18cc8cba0266b5d1426.jpg\"><img src=\"http://image.ruankun.xyz/edd89d53ce83119f1d8b92535dc40dbb.jpg\"><img src=\"http://image.ruankun.xyz/73e84f982b3294a905b0bcdacd7439e3.jpg\"><img src=\"http://image.ruankun.xyz/7b101ef762bae63f0707b500e80f3f17.jpg\"></p>', '2019-08-25 14:54:19', '2019-08-25 10:11:43', '180天内有效，比购买单次优惠89元', 1);
INSERT INTO `mm_product` VALUES (105, 7, '新房全面开荒保洁服务', 'http://image.ruankun.xyz/1315b7af4d55b00556b984a536228622.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7ca87ff8da77135fb7296f08a13d45b7.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/5eea6c4fe8e93c6fd7de1293dfbb8ad7.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/5ab738c6c374d26a1454e19c64b62c2e.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/212b4d27f9c5fceffa59af96631e152b.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/b018cd5b3ac96593fce4b21a66a903b2.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/0f81e4daf28141ed5b63b5969e43350c.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/6e40d3838f99d466efd5c16601f5ba0b.jpg\"></p>', '2019-08-25 23:40:14', '2019-08-25 10:41:14', '没有时间限制、做到您满意为止, 优惠价：7元/平方米, 建议按房间面积拍。', 1);
INSERT INTO `mm_product` VALUES (106, 7, '新房全面开荒保洁（单人）', 'http://image.ruankun.xyz/6ac62054dc716c745b7a8f648f84d100.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/426c1e0c2a78ea5105b1a95ad561c775.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/315667afab7eefb850bf8f9525deb35c.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/51d919c5d6704becbbeb30723b1c24fc.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/bff3c61b2ca672c38d1f80279c728190.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/1ed6f6db083b27473c0bb92f48f83ad3.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7d518c2354c222fa7800d8323b9c7357.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d28d304a7dab9ada69c98a46d0b6daaf.jpg\"></p>', '2019-08-25 23:47:41', '2019-08-25 23:47:41', '服务中途支持投诉、要求换人， 优惠价：49元/小时', 1);
INSERT INTO `mm_product` VALUES (107, 7, '新房二次全面开荒保洁服务', 'http://image.ruankun.xyz/3a0298855b069173e2029997d44cedc8.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/426c1e0c2a78ea5105b1a95ad561c775.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/315667afab7eefb850bf8f9525deb35c.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/51d919c5d6704becbbeb30723b1c24fc.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/bff3c61b2ca672c38d1f80279c728190.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/1ed6f6db083b27473c0bb92f48f83ad3.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/7d518c2354c222fa7800d8323b9c7357.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d28d304a7dab9ada69c98a46d0b6daaf.jpg\"></p>', '2019-08-25 23:52:58', '2019-08-25 23:52:58', '没有时间限制、做到您满意为止, 优惠价：9元/2平方米, 45元/10平方米, 建议按面积拍', 1);
INSERT INTO `mm_product` VALUES (108, 7, '新房二次全面开荒保洁（单人）', 'http://image.ruankun.xyz/a1de5597d297dae9298d631e0c77eb05.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/d2ffb7fb616155b888b691b8d9dfc18c.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/5143339a4981d0a45b4007fbe1d99a7d.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/2c930090fc1801f4b1c326320803266f.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/a3edbccc843421dc60affea2b6e0df1d.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/01764c78762ee4f6c2fe1594b0d8ccd3.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/215ffc937aaa52879fcf82ec1aff1240.jpg\"></p><p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/71b08558be40a9ac5de6b8f2ddbf5144.jpg\"></p><p class=\"ql-align-center\"><br></p>', '2019-08-25 23:58:37', '2019-08-25 10:59:03', '服务中途支持投诉、要求换人,  优惠价：46元/小时, 92/两小时,建议按需求量拍', 1);
INSERT INTO `mm_product` VALUES (109, 10, '床铺床垫深度除螨虫一张', 'http://image.ruankun.xyz/5bd4e8714a10c9aa833e953565d18b29.jpg', '<p><img src=\"http://image.ruankun.xyz/60a93cbcde8265aed96dbd900aed5d75.jpg\"><img src=\"http://image.ruankun.xyz/d50551620450062fdf7e0f8a084bdde3.jpg\"><img src=\"http://image.ruankun.xyz/ac7989fa6c9465e567c09c7bb171aca2.jpg\"><img src=\"http://image.ruankun.xyz/937dfa5888e39b5ce534d893d74305f6.jpg\"><img src=\"http://image.ruankun.xyz/8eb98df83713f1b6307d683ebeb0787e.jpg\"><img src=\"http://image.ruankun.xyz/6802b4649a493df9b5b4ba51dd197f8d.jpg\"></p>', '2019-08-26 22:44:58', '2019-08-26 22:44:58', '让一切皮肤杀手无处可逃', 1);
INSERT INTO `mm_product` VALUES (110, 10, '沙发除螨虫服务/座', 'http://image.ruankun.xyz/b7a31e144948275f6d5228e8153dc266.jpg', '<p><img src=\"http://image.ruankun.xyz/a4127da61989cba76877c7bb720b8a90.jpg\"><img src=\"http://image.ruankun.xyz/9e35d2416ac43d05b9501aff9087a223.jpg\"><img src=\"http://image.ruankun.xyz/ac7989fa6c9465e567c09c7bb171aca2.jpg\"><img src=\"http://image.ruankun.xyz/937dfa5888e39b5ce534d893d74305f6.jpg\"><img src=\"http://image.ruankun.xyz/8eb98df83713f1b6307d683ebeb0787e.jpg\"><img src=\"http://image.ruankun.xyz/6802b4649a493df9b5b4ba51dd197f8d.jpg\"></p>', '2019-08-26 22:47:04', '2019-08-26 22:47:04', '让一切皮肤杀手无处可逃', 1);
INSERT INTO `mm_product` VALUES (111, 10, '沙发套清洗服务1斤', 'http://image.ruankun.xyz/5117e9de487ce6bd91945f3ffcd27359.jpg', '<p><img src=\"http://image.ruankun.xyz/91b383e6b4b38a9d9f25488d731d7d18.jpg\"><img src=\"http://image.ruankun.xyz/428cb723fa10c5db973e3ea45ef1bd2b.jpg\"><img src=\"http://image.ruankun.xyz/1619a540ff23e729700a1485079d7500.jpg\"><img src=\"http://image.ruankun.xyz/ba67a043cad828283be312d90d09145f.jpg\"><img src=\"http://image.ruankun.xyz/3ca0e4c50e6fc353450598f19bd868cb.jpg\"></p>', '2019-08-26 22:49:30', '2019-08-26 22:49:30', '免费上门取货安装', 1);
INSERT INTO `mm_product` VALUES (112, 10, '窗帘清洗服务1斤', 'http://image.ruankun.xyz/2ad38370b7bd0b5498e0ee18ce1e3ed1.jpg', '<p><img src=\"http://image.ruankun.xyz/91b383e6b4b38a9d9f25488d731d7d18.jpg\"><img src=\"http://image.ruankun.xyz/428cb723fa10c5db973e3ea45ef1bd2b.jpg\"><img src=\"http://image.ruankun.xyz/1619a540ff23e729700a1485079d7500.jpg\"><img src=\"http://image.ruankun.xyz/ba67a043cad828283be312d90d09145f.jpg\"><img src=\"http://image.ruankun.xyz/3ca0e4c50e6fc353450598f19bd868cb.jpg\"></p>', '2019-08-26 22:50:01', '2019-08-26 22:50:01', '免费上门取货安装', 1);
INSERT INTO `mm_product` VALUES (113, 13, '管家服务上线中', 'http://image.ruankun.xyz/b3b5843536641986e2899f1de9ef65ea.jpg', '<p class=\"ql-align-center\"><img src=\"http://image.ruankun.xyz/73c4260b369944396b1d33299096502b.jpg\"></p>', '2019-08-29 10:22:01', '2019-08-29 10:22:01', '管家服务上线中，敬请期待', 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_productprops
-- ----------------------------
DROP TABLE IF EXISTS `mm_productprops`;
CREATE TABLE `mm_productprops` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) NOT NULL COMMENT '产品id',
  `servicedate` tinyint(2) unsigned NOT NULL COMMENT '服务日期1-周1,2-周2...以此类推',
  `servicetime` varchar(255) NOT NULL COMMENT '服务时间，自己填',
  `price` decimal(10,2) NOT NULL COMMENT '服务价格',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品规格';

-- ----------------------------
-- Records of mm_productprops
-- ----------------------------
BEGIN;
INSERT INTO `mm_productprops` VALUES (5868, 73, 1, '1小时   晚8点——晚9点', 1.00, 1);
INSERT INTO `mm_productprops` VALUES (5871, 74, 1, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5872, 74, 2, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5873, 74, 3, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5874, 74, 4, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5875, 74, 5, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5876, 74, 6, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5877, 74, 7, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5879, 75, 1, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5880, 75, 2, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5881, 75, 3, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5882, 75, 4, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5883, 75, 5, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5884, 75, 6, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5885, 75, 7, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5887, 76, 1, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5888, 76, 2, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5889, 76, 3, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5890, 76, 4, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5891, 76, 5, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5892, 76, 6, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5893, 76, 7, '1小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (5895, 77, 1, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5896, 77, 2, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5897, 77, 3, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5898, 77, 4, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5899, 77, 5, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5900, 77, 6, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5901, 77, 7, '2小时   早8点——晚9点', 88.00, 1);
INSERT INTO `mm_productprops` VALUES (5903, 78, 1, '3小时   早8点——晚9点', 139.00, 1);
INSERT INTO `mm_productprops` VALUES (5904, 78, 2, '3小时   早8点——晚9点', 139.00, 1);
INSERT INTO `mm_productprops` VALUES (5905, 78, 3, '3小时   早8点——晚9点', 139.00, 1);
INSERT INTO `mm_productprops` VALUES (5906, 78, 4, '2小时   早8点——晚9点', 139.00, 1);
INSERT INTO `mm_productprops` VALUES (5907, 78, 5, '3小时   早8点——晚9点', 139.00, 1);
INSERT INTO `mm_productprops` VALUES (5908, 78, 6, '3小时   早8点——晚9点', 139.00, 1);
INSERT INTO `mm_productprops` VALUES (5909, 78, 7, '3小时   早8点——晚9点', 139.00, 1);
INSERT INTO `mm_productprops` VALUES (5911, 79, 1, '4小时   早8点——晚9点', 169.00, 1);
INSERT INTO `mm_productprops` VALUES (5912, 79, 2, '4小时   早8点——晚9点', 169.00, 1);
INSERT INTO `mm_productprops` VALUES (5913, 79, 3, '4小时   早8点——晚9点', 169.00, 1);
INSERT INTO `mm_productprops` VALUES (5914, 79, 4, '4小时   早8点——晚9点', 169.00, 1);
INSERT INTO `mm_productprops` VALUES (5915, 79, 5, '4小时   早8点——晚9点', 169.00, 1);
INSERT INTO `mm_productprops` VALUES (5916, 79, 6, '4小时   早8点——晚9点', 169.00, 1);
INSERT INTO `mm_productprops` VALUES (5917, 79, 7, '4小时   早8点——晚9点', 169.00, 1);
INSERT INTO `mm_productprops` VALUES (5919, 80, 1, '6小时   早8点——晚9点', 288.00, 1);
INSERT INTO `mm_productprops` VALUES (5920, 80, 2, '6小时   早8点——晚9点', 288.00, 1);
INSERT INTO `mm_productprops` VALUES (5921, 80, 3, '6小时   早8点——晚9点', 288.00, 1);
INSERT INTO `mm_productprops` VALUES (5922, 80, 4, '6小时   早8点——晚9点', 288.00, 1);
INSERT INTO `mm_productprops` VALUES (5923, 80, 5, '6小时   早8点——晚9点', 288.00, 1);
INSERT INTO `mm_productprops` VALUES (5924, 80, 6, '6小时   早8点——晚9点', 288.00, 1);
INSERT INTO `mm_productprops` VALUES (5925, 80, 7, '6小时   早8点——晚9点', 288.00, 1);
INSERT INTO `mm_productprops` VALUES (5927, 81, 1, '8小时   早8点——晚9点', 369.00, 1);
INSERT INTO `mm_productprops` VALUES (5928, 81, 2, '8小时   早8点——晚9点', 369.00, 1);
INSERT INTO `mm_productprops` VALUES (5929, 81, 3, '8小时   早8点——晚9点', 369.00, 1);
INSERT INTO `mm_productprops` VALUES (5930, 81, 4, '8小时   早8点——晚9点', 369.00, 1);
INSERT INTO `mm_productprops` VALUES (5931, 81, 5, '8小时   早8点——晚9点', 369.00, 1);
INSERT INTO `mm_productprops` VALUES (5932, 81, 6, '8小时   早8点——晚9点', 369.00, 1);
INSERT INTO `mm_productprops` VALUES (5933, 81, 7, '8小时   早8点——晚9点', 369.00, 1);
INSERT INTO `mm_productprops` VALUES (5935, 82, 1, '1小时   早8点——晚9点', 66.00, 1);
INSERT INTO `mm_productprops` VALUES (5936, 82, 2, '1小时   早8点——晚9点', 66.00, 1);
INSERT INTO `mm_productprops` VALUES (5937, 82, 3, '1小时   早8点——晚9点', 66.00, 1);
INSERT INTO `mm_productprops` VALUES (5938, 82, 4, '1小时   早8点——晚9点', 66.00, 1);
INSERT INTO `mm_productprops` VALUES (5939, 82, 5, '1小时   早8点——晚9点', 66.00, 1);
INSERT INTO `mm_productprops` VALUES (5940, 82, 6, '1小时   早8点——晚9点', 66.00, 1);
INSERT INTO `mm_productprops` VALUES (5941, 82, 7, '1小时   早8点——晚9点', 66.00, 1);
INSERT INTO `mm_productprops` VALUES (5943, 83, 1, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5944, 83, 2, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5945, 83, 3, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5946, 83, 4, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5947, 83, 5, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5948, 83, 6, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5949, 83, 7, '3小时   早8点——晚9点', 300.00, 1);
INSERT INTO `mm_productprops` VALUES (5951, 84, 1, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5952, 84, 2, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5953, 84, 3, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5954, 84, 4, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5955, 84, 5, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5956, 84, 6, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5957, 84, 7, '3小时   早8点——晚9点', 289.00, 1);
INSERT INTO `mm_productprops` VALUES (5959, 85, 1, '1小时   早8点——晚9点', 68.00, 1);
INSERT INTO `mm_productprops` VALUES (5960, 85, 2, '1小时   早8点——晚9点', 68.00, 1);
INSERT INTO `mm_productprops` VALUES (5961, 85, 3, '1小时   早8点——晚9点', 68.00, 1);
INSERT INTO `mm_productprops` VALUES (5962, 85, 4, '1小时   早8点——晚9点', 68.00, 1);
INSERT INTO `mm_productprops` VALUES (5963, 85, 5, '1小时   早8点——晚9点', 68.00, 1);
INSERT INTO `mm_productprops` VALUES (5964, 85, 6, '1小时   早8点——晚9点', 68.00, 1);
INSERT INTO `mm_productprops` VALUES (5965, 85, 7, '1小时   早8点——晚9点', 68.00, 1);
INSERT INTO `mm_productprops` VALUES (5967, 86, 1, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (5968, 86, 2, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (5969, 86, 3, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (5970, 86, 4, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (5971, 86, 5, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (5972, 86, 6, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (5973, 86, 7, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (5975, 87, 1, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5976, 87, 2, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5977, 87, 3, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5978, 87, 4, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5979, 87, 5, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5980, 87, 6, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5981, 87, 7, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5983, 88, 1, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5984, 88, 2, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5985, 88, 3, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5986, 88, 4, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5987, 88, 5, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5988, 88, 6, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5989, 88, 7, '1小时   早8点——晚9点', 44.00, 1);
INSERT INTO `mm_productprops` VALUES (5991, 89, 1, '1小时   早8点——晚9点', 42.00, 1);
INSERT INTO `mm_productprops` VALUES (5992, 89, 2, '1小时   早8点——晚9点', 42.00, 1);
INSERT INTO `mm_productprops` VALUES (5993, 89, 3, '1小时   早8点——晚9点', 42.00, 1);
INSERT INTO `mm_productprops` VALUES (5994, 89, 4, '1小时   早8点——晚9点', 42.00, 1);
INSERT INTO `mm_productprops` VALUES (5995, 89, 5, '1小时   早8点——晚9点', 42.00, 1);
INSERT INTO `mm_productprops` VALUES (5996, 89, 6, '1小时   早8点——晚9点', 42.00, 1);
INSERT INTO `mm_productprops` VALUES (5997, 89, 7, '1小时   早8点——晚9点', 42.00, 1);
INSERT INTO `mm_productprops` VALUES (5999, 90, 1, '2小时   早8点——晚9点', 80.00, 1);
INSERT INTO `mm_productprops` VALUES (6000, 90, 2, '2小时   早8点——晚9点', 80.00, 1);
INSERT INTO `mm_productprops` VALUES (6001, 90, 3, '2小时   早8点——晚9点', 80.00, 1);
INSERT INTO `mm_productprops` VALUES (6002, 90, 4, '2小时   早8点——晚9点', 80.00, 1);
INSERT INTO `mm_productprops` VALUES (6003, 90, 5, '2小时   早8点——晚9点', 80.00, 1);
INSERT INTO `mm_productprops` VALUES (6004, 90, 6, '2小时   早8点——晚9点', 80.00, 1);
INSERT INTO `mm_productprops` VALUES (6005, 90, 7, '2小时   早8点——晚9点', 80.00, 1);
INSERT INTO `mm_productprops` VALUES (6007, 91, 1, '3小时   早8点——晚9点', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (6008, 91, 2, '3小时   早8点——晚9点', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (6009, 91, 3, '3小时   早8点——晚9点', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (6010, 91, 4, '3小时   早8点——晚9点', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (6011, 91, 5, '3小时   早8点——晚9点', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (6012, 91, 6, '3小时   早8点——晚9点', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (6013, 91, 7, '3小时   早8点——晚9点', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (6015, 92, 1, '4小时   早8点——晚9点', 160.00, 1);
INSERT INTO `mm_productprops` VALUES (6016, 92, 2, '4小时   早8点——晚9点', 160.00, 1);
INSERT INTO `mm_productprops` VALUES (6017, 92, 3, '4小时   早8点——晚9点', 160.00, 1);
INSERT INTO `mm_productprops` VALUES (6018, 92, 4, '4小时   早8点——晚9点', 160.00, 1);
INSERT INTO `mm_productprops` VALUES (6019, 92, 5, '4小时   早8点——晚9点', 160.00, 1);
INSERT INTO `mm_productprops` VALUES (6020, 92, 6, '4小时   早8点——晚9点', 160.00, 1);
INSERT INTO `mm_productprops` VALUES (6021, 92, 7, '4小时   早8点——晚9点', 160.00, 1);
INSERT INTO `mm_productprops` VALUES (6023, 93, 1, '2小时   早6点——晚8点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6025, 94, 1, '3小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6026, 94, 2, '3小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6027, 94, 3, '3小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6028, 94, 4, '3小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6029, 94, 5, '3小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6030, 94, 6, '3小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6031, 94, 7, '3小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6033, 95, 1, '2小时   早8点——晚9点', 100.00, 1);
INSERT INTO `mm_productprops` VALUES (6034, 95, 2, '2小时   早8点——晚9点', 100.00, 1);
INSERT INTO `mm_productprops` VALUES (6035, 95, 3, '2小时   早8点——晚9点', 100.00, 1);
INSERT INTO `mm_productprops` VALUES (6036, 95, 4, '2小时   早8点——晚9点', 100.00, 1);
INSERT INTO `mm_productprops` VALUES (6037, 95, 5, '2小时   早8点——晚9点', 100.00, 1);
INSERT INTO `mm_productprops` VALUES (6038, 95, 6, '2小时   早8点——晚9点', 100.00, 1);
INSERT INTO `mm_productprops` VALUES (6039, 95, 7, '2小时   早8点——晚9点', 100.00, 1);
INSERT INTO `mm_productprops` VALUES (6041, 96, 1, '2小时   早8点——晚9点', 95.00, 1);
INSERT INTO `mm_productprops` VALUES (6042, 96, 2, '2小时   早8点——晚9点', 95.00, 1);
INSERT INTO `mm_productprops` VALUES (6043, 96, 3, '2小时   早8点——晚9点', 95.00, 1);
INSERT INTO `mm_productprops` VALUES (6044, 96, 4, '2小时   早8点——晚9点', 95.00, 1);
INSERT INTO `mm_productprops` VALUES (6045, 96, 5, '2小时   早8点——晚9点', 95.00, 1);
INSERT INTO `mm_productprops` VALUES (6046, 96, 6, '2小时   早8点——晚9点', 95.00, 1);
INSERT INTO `mm_productprops` VALUES (6047, 96, 7, '2小时   早8点——晚9点', 95.00, 1);
INSERT INTO `mm_productprops` VALUES (6049, 97, 1, '3小时   早8点——晚9点', 176.00, 1);
INSERT INTO `mm_productprops` VALUES (6050, 97, 2, '3小时   早8点——晚9点', 176.00, 1);
INSERT INTO `mm_productprops` VALUES (6051, 97, 3, '3小时   早8点——晚9点', 176.00, 1);
INSERT INTO `mm_productprops` VALUES (6052, 97, 4, '3小时   早8点——晚9点', 176.00, 1);
INSERT INTO `mm_productprops` VALUES (6053, 97, 5, '3小时   早8点——晚9点', 176.00, 1);
INSERT INTO `mm_productprops` VALUES (6054, 97, 6, '3小时   早8点——晚9点', 176.00, 1);
INSERT INTO `mm_productprops` VALUES (6055, 97, 7, '3小时   早8点——晚9点', 176.00, 1);
INSERT INTO `mm_productprops` VALUES (6057, 98, 1, '3小时   早8点——晚9点', 238.00, 1);
INSERT INTO `mm_productprops` VALUES (6058, 98, 2, '3小时   早8点——晚9点', 238.00, 1);
INSERT INTO `mm_productprops` VALUES (6059, 98, 3, '3小时   早8点——晚9点', 238.00, 1);
INSERT INTO `mm_productprops` VALUES (6060, 98, 4, '3小时   早8点——晚9点', 238.00, 1);
INSERT INTO `mm_productprops` VALUES (6061, 98, 5, '3小时   早8点——晚9点', 238.00, 1);
INSERT INTO `mm_productprops` VALUES (6062, 98, 6, '3小时   早8点——晚9点', 238.00, 1);
INSERT INTO `mm_productprops` VALUES (6063, 98, 7, '3小时   早8点——晚9点', 238.00, 1);
INSERT INTO `mm_productprops` VALUES (6065, 99, 1, '2小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6066, 99, 2, '2小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6067, 99, 3, '2小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6068, 99, 4, '2小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6069, 99, 5, '2小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6070, 99, 6, '2小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6071, 99, 7, '2小时   早8点——晚9点', 99.00, 1);
INSERT INTO `mm_productprops` VALUES (6073, 100, 1, '2小时   早8点——晚9点', 148.00, 1);
INSERT INTO `mm_productprops` VALUES (6074, 100, 2, '2小时   早8点——晚9点', 148.00, 1);
INSERT INTO `mm_productprops` VALUES (6075, 100, 3, '2小时   早8点——晚9点', 148.00, 1);
INSERT INTO `mm_productprops` VALUES (6076, 100, 4, '2小时   早8点——晚9点', 148.00, 1);
INSERT INTO `mm_productprops` VALUES (6077, 100, 5, '2小时   早8点——晚9点', 148.00, 1);
INSERT INTO `mm_productprops` VALUES (6078, 100, 6, '2小时   早8点——晚9点', 148.00, 1);
INSERT INTO `mm_productprops` VALUES (6079, 100, 7, '2小时   早8点——晚9点', 148.00, 1);
INSERT INTO `mm_productprops` VALUES (6081, 101, 1, '3小时   早8点——晚9点', 499.00, 1);
INSERT INTO `mm_productprops` VALUES (6082, 101, 2, '3小时   早8点——晚9点', 499.00, 1);
INSERT INTO `mm_productprops` VALUES (6083, 101, 3, '3小时   早8点——晚9点', 499.00, 1);
INSERT INTO `mm_productprops` VALUES (6084, 101, 4, '3小时   早8点——晚9点', 499.00, 1);
INSERT INTO `mm_productprops` VALUES (6085, 101, 5, '3小时   早8点——晚9点', 499.00, 1);
INSERT INTO `mm_productprops` VALUES (6086, 101, 6, '3小时   早8点——晚9点', 499.00, 1);
INSERT INTO `mm_productprops` VALUES (6087, 101, 7, '3小时   早8点——晚9点', 499.00, 1);
INSERT INTO `mm_productprops` VALUES (6089, 102, 1, '3小时   早8点——晚9点', 712.00, 1);
INSERT INTO `mm_productprops` VALUES (6090, 102, 2, '3小时   早8点——晚9点', 712.00, 1);
INSERT INTO `mm_productprops` VALUES (6091, 102, 3, '3小时   早8点——晚9点', 712.00, 1);
INSERT INTO `mm_productprops` VALUES (6092, 102, 4, '3小时   早8点——晚9点', 712.00, 1);
INSERT INTO `mm_productprops` VALUES (6093, 102, 5, '3小时   早8点——晚9点', 712.00, 1);
INSERT INTO `mm_productprops` VALUES (6094, 102, 6, '3小时   早8点——晚9点', 712.00, 1);
INSERT INTO `mm_productprops` VALUES (6095, 102, 7, '3小时   早8点——晚9点', 712.00, 1);
INSERT INTO `mm_productprops` VALUES (6097, 103, 1, '4小时   早8点——晚9点', 636.00, 1);
INSERT INTO `mm_productprops` VALUES (6098, 103, 2, '4小时   早8点——晚9点', 636.00, 1);
INSERT INTO `mm_productprops` VALUES (6099, 103, 3, '4小时   早8点——晚9点', 636.00, 1);
INSERT INTO `mm_productprops` VALUES (6100, 103, 4, '4小时   早8点——晚9点', 636.00, 1);
INSERT INTO `mm_productprops` VALUES (6101, 103, 5, '4小时   早8点——晚9点', 636.00, 1);
INSERT INTO `mm_productprops` VALUES (6102, 103, 6, '4小时   早8点——晚9点', 636.00, 1);
INSERT INTO `mm_productprops` VALUES (6103, 103, 7, '4小时   早8点——晚9点', 636.00, 1);
INSERT INTO `mm_productprops` VALUES (6105, 104, 1, '4小时   早8点——晚9点', 925.00, 1);
INSERT INTO `mm_productprops` VALUES (6106, 104, 2, '4小时   早8点——晚9点', 925.00, 1);
INSERT INTO `mm_productprops` VALUES (6107, 104, 3, '4小时   早8点——晚9点', 925.00, 1);
INSERT INTO `mm_productprops` VALUES (6108, 104, 4, '4小时   早8点——晚9点', 925.00, 1);
INSERT INTO `mm_productprops` VALUES (6109, 104, 5, '4小时   早8点——晚9点', 925.00, 1);
INSERT INTO `mm_productprops` VALUES (6110, 104, 6, '4小时   早8点——晚9点', 925.00, 1);
INSERT INTO `mm_productprops` VALUES (6111, 104, 7, '4小时   早8点——晚9点', 925.00, 1);
INSERT INTO `mm_productprops` VALUES (6115, 105, 1, '10小时   早8点——晚9点', 7.00, 1);
INSERT INTO `mm_productprops` VALUES (6116, 105, 2, '10小时   早8点——晚9点', 7.00, 1);
INSERT INTO `mm_productprops` VALUES (6117, 105, 3, '10小时   早8点——晚9点', 7.00, 1);
INSERT INTO `mm_productprops` VALUES (6118, 105, 4, '10小时   早8点——晚9点', 7.00, 1);
INSERT INTO `mm_productprops` VALUES (6119, 105, 5, '10小时   早8点——晚9点', 7.00, 1);
INSERT INTO `mm_productprops` VALUES (6120, 105, 6, '10小时   早8点——晚9点', 7.00, 1);
INSERT INTO `mm_productprops` VALUES (6121, 105, 7, '10小时   早8点——晚9点', 7.00, 1);
INSERT INTO `mm_productprops` VALUES (6122, 105, 1, '10小时   早8点——晚9点', 70.00, 1);
INSERT INTO `mm_productprops` VALUES (6123, 105, 2, '10小时   早8点——晚9点', 70.00, 1);
INSERT INTO `mm_productprops` VALUES (6124, 105, 3, '10小时   早8点——晚9点', 70.00, 1);
INSERT INTO `mm_productprops` VALUES (6125, 105, 4, '10小时   早8点——晚9点', 70.00, 1);
INSERT INTO `mm_productprops` VALUES (6126, 105, 5, '10小时   早8点——晚9点', 70.00, 1);
INSERT INTO `mm_productprops` VALUES (6127, 105, 6, '10小时   早8点——晚9点', 70.00, 1);
INSERT INTO `mm_productprops` VALUES (6128, 105, 7, '10小时   早8点——晚9点', 70.00, 1);
INSERT INTO `mm_productprops` VALUES (6130, 106, 1, '1小时   早8点——晚9点', 49.00, 1);
INSERT INTO `mm_productprops` VALUES (6131, 106, 1, '2小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6132, 106, 2, '1小时   早8点——晚9点', 49.00, 1);
INSERT INTO `mm_productprops` VALUES (6133, 106, 2, '2小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6134, 106, 3, '1小时   早8点——晚9点', 49.00, 1);
INSERT INTO `mm_productprops` VALUES (6135, 106, 3, '2小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6136, 106, 4, '1小时   早8点——晚9点', 49.00, 1);
INSERT INTO `mm_productprops` VALUES (6137, 106, 4, '2小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6138, 106, 5, '1小时   早8点——晚9点', 49.00, 1);
INSERT INTO `mm_productprops` VALUES (6139, 106, 5, '2小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6140, 106, 6, '1小时   早8点——晚9点', 49.00, 1);
INSERT INTO `mm_productprops` VALUES (6141, 106, 6, '2小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6142, 106, 7, '1小时   早8点——晚9点', 49.00, 1);
INSERT INTO `mm_productprops` VALUES (6143, 106, 7, '2小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6145, 107, 1, '10小时   早8点——晚9点', 9.00, 1);
INSERT INTO `mm_productprops` VALUES (6146, 107, 1, '10小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (6147, 107, 2, '10小时   早8点——晚9点', 9.00, 1);
INSERT INTO `mm_productprops` VALUES (6148, 107, 2, '10小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (6149, 107, 3, '10小时   早8点——晚9点', 9.00, 1);
INSERT INTO `mm_productprops` VALUES (6150, 107, 3, '10小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (6151, 107, 4, '10小时   早8点——晚9点', 9.00, 1);
INSERT INTO `mm_productprops` VALUES (6152, 107, 4, '10小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (6153, 107, 5, '10小时   早8点——晚9点', 9.00, 1);
INSERT INTO `mm_productprops` VALUES (6154, 107, 5, '10小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (6155, 107, 6, '10小时   早8点——晚9点', 9.00, 1);
INSERT INTO `mm_productprops` VALUES (6156, 107, 6, '10小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (6157, 107, 7, '10小时   早8点——晚9点', 9.00, 1);
INSERT INTO `mm_productprops` VALUES (6158, 107, 7, '10小时   早8点——晚9点', 45.00, 1);
INSERT INTO `mm_productprops` VALUES (6160, 108, 1, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (6161, 108, 1, '2小时   早8点——晚9点', 92.00, 1);
INSERT INTO `mm_productprops` VALUES (6162, 108, 2, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (6163, 108, 2, '2小时   早8点——晚9点', 92.00, 1);
INSERT INTO `mm_productprops` VALUES (6164, 108, 3, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (6165, 108, 3, '2小时   早8点——晚9点', 92.00, 1);
INSERT INTO `mm_productprops` VALUES (6166, 108, 4, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (6167, 108, 4, '2小时   早8点——晚9点', 92.00, 1);
INSERT INTO `mm_productprops` VALUES (6168, 108, 5, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (6169, 108, 5, '2小时   早8点——晚9点', 92.00, 1);
INSERT INTO `mm_productprops` VALUES (6170, 108, 6, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (6171, 108, 6, '2小时   早8点——晚9点', 92.00, 1);
INSERT INTO `mm_productprops` VALUES (6172, 108, 7, '1小时   早8点——晚9点', 46.00, 1);
INSERT INTO `mm_productprops` VALUES (6173, 108, 7, '2小时   早8点——晚9点', 92.00, 1);
INSERT INTO `mm_productprops` VALUES (6187, 109, 1, '2小时   早8点——晚9点', 150.00, 1);
INSERT INTO `mm_productprops` VALUES (6188, 109, 2, '2小时   早8点——晚9点', 150.00, 1);
INSERT INTO `mm_productprops` VALUES (6189, 109, 3, '2小时   早8点——晚9点', 150.00, 1);
INSERT INTO `mm_productprops` VALUES (6190, 109, 4, '2小时   早8点——晚9点', 150.00, 1);
INSERT INTO `mm_productprops` VALUES (6191, 109, 5, '2小时   早8点——晚9点', 150.00, 1);
INSERT INTO `mm_productprops` VALUES (6192, 109, 6, '2小时   早8点——晚9点', 150.00, 1);
INSERT INTO `mm_productprops` VALUES (6193, 109, 7, '2小时   早8点——晚9点', 150.00, 1);
INSERT INTO `mm_productprops` VALUES (6195, 110, 1, '1小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6196, 110, 2, '1小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6197, 110, 3, '1小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6198, 110, 4, '1小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6199, 110, 5, '1小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6200, 110, 6, '1小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6201, 110, 7, '1小时   早8点——晚9点', 98.00, 1);
INSERT INTO `mm_productprops` VALUES (6203, 111, 1, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6204, 111, 2, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6205, 111, 3, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6206, 111, 4, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6207, 111, 5, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6208, 111, 6, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6209, 111, 7, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6211, 112, 1, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6212, 112, 2, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6213, 112, 3, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6214, 112, 4, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6215, 112, 5, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6216, 112, 6, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6217, 112, 7, '1小时   早8点——晚9点', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (6233, 113, 1, '1小时   晚8点——晚9点', 0.01, 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_pubdecoupon
-- ----------------------------
DROP TABLE IF EXISTS `mm_pubdecoupon`;
CREATE TABLE `mm_pubdecoupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `endtime` date NOT NULL,
  `min` decimal(19,2) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `starttime` date NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `worth` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for mm_reply
-- ----------------------------
DROP TABLE IF EXISTS `mm_reply`;
CREATE TABLE `mm_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` bigint(20) NOT NULL COMMENT '管理员ID',
  `commentid` bigint(20) NOT NULL COMMENT '回复哪条评论',
  `reply` varchar(255) NOT NULL COMMENT '回复内容',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5761 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for mm_sharetemplate
-- ----------------------------
DROP TABLE IF EXISTS `mm_sharetemplate`;
CREATE TABLE `mm_sharetemplate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imgpath` varchar(255) NOT NULL COMMENT '生成分享图片的底图地址',
  `productId` bigint(20) unsigned DEFAULT NULL COMMENT '产品的Id，二维码跳转哪个产品页面',
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6296 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='小程序分享页面，分享的图片的模板地址';

-- ----------------------------
-- Records of mm_sharetemplate
-- ----------------------------
BEGIN;
INSERT INTO `mm_sharetemplate` VALUES (6181, 'https://image.ruankun.xyz/a6120f81613188932495e1f69cd91b6f.jpg', NULL, 77);
INSERT INTO `mm_sharetemplate` VALUES (6182, 'https://image.ruankun.xyz/2d0009af16b1adbb0c49fbf58314eb2e.jpg', NULL, 78);
INSERT INTO `mm_sharetemplate` VALUES (6183, 'https://image.ruankun.xyz/c2261b03a723bcb67ed9a143154ee641.jpg', NULL, 95);
INSERT INTO `mm_sharetemplate` VALUES (6184, 'https://image.ruankun.xyz/132699d76b61c5caa9d63ac258eb8098.jpg', NULL, 99);
INSERT INTO `mm_sharetemplate` VALUES (6222, 'https://image.ruankun.xyz/5dffa2036112894bcaca23aba2c6935c.jpg', NULL, 94);
INSERT INTO `mm_sharetemplate` VALUES (6226, 'https://image.ruankun.xyz/4481e10803f3dfaa597cc8e34a7bd467.jpg', NULL, 105);
INSERT INTO `mm_sharetemplate` VALUES (6294, 'https://image.ruankun.xyz/c63bbe42380e7d57a5c11c3d5a38cb24.png', NULL, 84);
INSERT INTO `mm_sharetemplate` VALUES (6295, 'https://image.ruankun.xyz/804a3c8267093e8a384be38c45e95409.png', NULL, 97);
COMMIT;

-- ----------------------------
-- Table structure for mm_user
-- ----------------------------
DROP TABLE IF EXISTS `mm_user`;
CREATE TABLE `mm_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `openid` varchar(255) NOT NULL COMMENT '小程序openid',
  `name` varchar(16) DEFAULT NULL COMMENT '姓名',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `invitor_id` bigint(20) unsigned DEFAULT NULL COMMENT '邀请人ID可以为空',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `avator` varchar(255) DEFAULT NULL COMMENT '头像',
  `award` decimal(10,2) unsigned NOT NULL DEFAULT '5.00' COMMENT '每次邀请并下单获得的佣金',
  `integration` decimal(10,0) unsigned NOT NULL DEFAULT '5' COMMENT '每次邀请获得的积分',
  `wxid` varchar(32) DEFAULT NULL COMMENT '微信号，用于提现使用',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `ordered` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否下过单',
  `is_black` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否黑名单用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户基本信息表';

-- ----------------------------
-- Records of mm_user
-- ----------------------------
BEGIN;
INSERT INTO `mm_user` VALUES (64, 'oVy725XAY8TZVWj26k4pnbNdTLFk', 'Eriasan', '2019-08-24 17:32:58', 49, NULL, 'https://image.ruankun.xyz/85a989cd79eeff589b0789a65c2cfeaa', 5.00, 5, NULL, '2019-08-27 10:54:08', 0, 0);
INSERT INTO `mm_user` VALUES (65, 'oVy725aAJ58_GijL87FqgiqRnFUg', '阮中华', '2019-08-24 17:48:45', NULL, '18783551223', 'https://image.ruankun.xyz/298c4777e5b475b743d2e295171cc28a', 5.00, 5, NULL, '2019-08-28 21:27:04', 0, 0);
INSERT INTO `mm_user` VALUES (66, 'oVy725clcQL0UUpF0qVRUH2hZtmw', '李松－家庭生活服务🏠', '2019-08-25 08:08:16', NULL, NULL, 'https://image.ruankun.xyz/fa4d0ba408f66b6c8b2242fa771c539d', 5.00, 5, NULL, '2019-08-27 10:54:03', 0, 0);
INSERT INTO `mm_user` VALUES (67, 'oVy725RhS8rQ5_HYT3aX25iklMYs', '🐶狗东西', '2019-08-25 16:40:34', NULL, NULL, 'https://image.ruankun.xyz/8238a54bee237d7edbece21bbf4c9691', 5.00, 5, NULL, '2019-08-27 10:54:02', 0, 0);
INSERT INTO `mm_user` VALUES (68, 'oVy725SnoqjV76D7Lt8ZYtPhl97o', 'Jason', '2019-08-25 18:59:48', NULL, NULL, 'https://image.ruankun.xyz/dff931e792f6336604e4c1d6cb5e5da0', 5.00, 5, NULL, '2019-08-27 10:54:00', 0, 0);
INSERT INTO `mm_user` VALUES (69, 'oVy725TzkVJn1cuOtSL0XGYA9bGI', '42', '2019-08-30 14:15:07', 59, NULL, 'https://image.ruankun.xyz/1ab4662931b51ab0e753e4f915441364', 5.00, 5, NULL, '2019-08-30 14:15:07', 0, 0);
INSERT INTO `mm_user` VALUES (70, 'oVy725WKocm3P530rT1J1sVUe8C0', 'liubowin', '2019-08-30 15:12:54', NULL, NULL, 'https://image.ruankun.xyz/fa96b957c97e526bdf116580fd3d3734', 5.00, 5, NULL, '2019-08-30 15:12:54', 0, 0);
INSERT INTO `mm_user` VALUES (71, 'oVy725YzLCcIXUFUDFPndCBorM2Y', '3月生', '2019-09-01 12:43:36', NULL, NULL, 'https://image.ruankun.xyz/0767fc1e09344a51d79f855bbd0545f1', 5.00, 5, NULL, '2019-09-01 12:43:36', 0, 0);
COMMIT;

-- ----------------------------
-- Table structure for mm_wallet
-- ----------------------------
DROP TABLE IF EXISTS `mm_wallet`;
CREATE TABLE `mm_wallet` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户ID',
  `commission` decimal(10,2) unsigned NOT NULL COMMENT '佣金余额',
  `credit` decimal(10,0) unsigned NOT NULL COMMENT '积分数量无小数',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6268 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of mm_wallet
-- ----------------------------
BEGIN;
INSERT INTO `mm_wallet` VALUES (5865, 64, 0.00, 20, '2019-08-24 04:32:58');
INSERT INTO `mm_wallet` VALUES (5866, 65, 0.00, 10, '2019-08-24 04:48:45');
INSERT INTO `mm_wallet` VALUES (5869, 66, 0.00, 10, '2019-08-24 19:08:16');
INSERT INTO `mm_wallet` VALUES (6112, 67, 0.00, 10, '2019-08-25 03:40:35');
INSERT INTO `mm_wallet` VALUES (6113, 68, 0.00, 10, '2019-08-25 05:59:49');
INSERT INTO `mm_wallet` VALUES (6261, 69, 0.00, 0, '2019-08-30 01:15:08');
INSERT INTO `mm_wallet` VALUES (6263, 70, 0.00, 0, '2019-08-30 02:12:55');
INSERT INTO `mm_wallet` VALUES (6267, 71, 0.00, 0, '2019-08-31 23:43:36');
COMMIT;

-- ----------------------------
-- Table structure for mm_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `mm_withdraw`;
CREATE TABLE `mm_withdraw` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '究竟是哪个孽畜在提现',
  `recnum` varchar(127) DEFAULT NULL COMMENT '记录号唯一标示一个记录',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '提现金额数',
  `is_confirm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否提现成功',
  `is_failed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '提现是否失败',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ordernum` varchar(255) NOT NULL COMMENT '唯一订单号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5738 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for mm_yinxiao
-- ----------------------------
DROP TABLE IF EXISTS `mm_yinxiao`;
CREATE TABLE `mm_yinxiao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `count` int(11) DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mm_yinxiao_productId_uindex` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='营销数据表';

-- ----------------------------
-- Records of mm_yinxiao
-- ----------------------------
BEGIN;
INSERT INTO `mm_yinxiao` VALUES (5867, 73, 0);
INSERT INTO `mm_yinxiao` VALUES (5870, 74, 10);
INSERT INTO `mm_yinxiao` VALUES (5878, 75, 0);
INSERT INTO `mm_yinxiao` VALUES (5886, 76, 23);
INSERT INTO `mm_yinxiao` VALUES (5894, 77, 23);
INSERT INTO `mm_yinxiao` VALUES (5902, 78, 10);
INSERT INTO `mm_yinxiao` VALUES (5910, 79, 10);
INSERT INTO `mm_yinxiao` VALUES (5918, 80, 10);
INSERT INTO `mm_yinxiao` VALUES (5926, 81, 10);
INSERT INTO `mm_yinxiao` VALUES (5934, 82, 10);
INSERT INTO `mm_yinxiao` VALUES (5942, 83, 10);
INSERT INTO `mm_yinxiao` VALUES (5950, 84, 10);
INSERT INTO `mm_yinxiao` VALUES (5958, 85, 10);
INSERT INTO `mm_yinxiao` VALUES (5966, 86, 10);
INSERT INTO `mm_yinxiao` VALUES (5974, 87, 10);
INSERT INTO `mm_yinxiao` VALUES (5982, 88, 10);
INSERT INTO `mm_yinxiao` VALUES (5990, 89, 10);
INSERT INTO `mm_yinxiao` VALUES (5998, 90, 10);
INSERT INTO `mm_yinxiao` VALUES (6006, 91, 10);
INSERT INTO `mm_yinxiao` VALUES (6014, 92, 10);
INSERT INTO `mm_yinxiao` VALUES (6022, 93, 0);
INSERT INTO `mm_yinxiao` VALUES (6024, 94, 43);
INSERT INTO `mm_yinxiao` VALUES (6032, 95, 45);
INSERT INTO `mm_yinxiao` VALUES (6040, 96, 32);
INSERT INTO `mm_yinxiao` VALUES (6048, 97, 27);
INSERT INTO `mm_yinxiao` VALUES (6056, 98, 32);
INSERT INTO `mm_yinxiao` VALUES (6064, 99, 18);
INSERT INTO `mm_yinxiao` VALUES (6072, 100, 0);
INSERT INTO `mm_yinxiao` VALUES (6080, 101, 0);
INSERT INTO `mm_yinxiao` VALUES (6088, 102, 23);
INSERT INTO `mm_yinxiao` VALUES (6096, 103, 21);
INSERT INTO `mm_yinxiao` VALUES (6104, 104, 12);
INSERT INTO `mm_yinxiao` VALUES (6114, 105, 20);
INSERT INTO `mm_yinxiao` VALUES (6129, 106, 0);
INSERT INTO `mm_yinxiao` VALUES (6144, 107, 0);
INSERT INTO `mm_yinxiao` VALUES (6159, 108, 15);
INSERT INTO `mm_yinxiao` VALUES (6186, 109, 0);
INSERT INTO `mm_yinxiao` VALUES (6194, 110, 0);
INSERT INTO `mm_yinxiao` VALUES (6202, 111, 0);
INSERT INTO `mm_yinxiao` VALUES (6210, 112, 0);
INSERT INTO `mm_yinxiao` VALUES (6232, 113, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

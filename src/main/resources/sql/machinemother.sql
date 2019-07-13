/*
 Navicat Premium Data Transfer

 Source Server         : 45.40.193.214
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 45.40.193.214:3306
 Source Schema         : machinemother

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 12/07/2019 22:37:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------
BEGIN;
INSERT INTO `hibernate_sequence` VALUES (1545);
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
  `title` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动内容',
  `is_delete` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1506 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_activity
-- ----------------------------
BEGIN;
INSERT INTO `mm_activity` VALUES (1059, '2019-06-24 18:44:35', '2019-06-24 18:44:36', '2019-06-24 19:00:49', '2019-06-24 19:00:49', 'dsvfs', 'xssasdsa', NULL);
INSERT INTO `mm_activity` VALUES (1060, '2019-06-24 18:44:35', '2019-06-24 18:44:36', '2019-06-24 19:01:05', '2019-06-24 19:01:05', '.....', 'xcdfdvretyy', NULL);
INSERT INTO `mm_activity` VALUES (1064, '2019-05-29 04:15:52', '2019-06-06 04:15:54', '2019-06-24 20:15:06', '2019-06-24 20:15:06', '1', '111', NULL);
INSERT INTO `mm_activity` VALUES (1504, '2019-07-01 13:12:15', '2019-07-17 13:12:21', '2019-07-11 18:12:25', '2019-07-11 18:12:25', '1', '111', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mm_addr
-- ----------------------------
DROP TABLE IF EXISTS `mm_addr`;
CREATE TABLE `mm_addr` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `country` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '国家',
  `province` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `detail` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '详细地址',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1460 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_addr
-- ----------------------------
BEGIN;
INSERT INTO `mm_addr` VALUES (1178, 27, '中国', '北京市', '北京', '中国北京市朝阳区', '2019-06-29 06:33:52', '2019-06-29 06:33:52', '15233333333', '五阿哥', 1);
INSERT INTO `mm_addr` VALUES (1179, 27, '中国', '北京市', '北京', '中国北京市朝阳区', '2019-06-29 06:34:39', '2019-06-29 06:34:39', '1523444444', '五阿哥', 1);
INSERT INTO `mm_addr` VALUES (1385, 17, '中国', '内蒙古自治区', '包头市', '东河区鸡冠子', '2019-07-04 08:14:54', '2019-07-07 23:14:05', '119029289991', 'mrruan', 0);
INSERT INTO `mm_addr` VALUES (1420, 45, '中国', '北京市', '北京市', '丰台区啊啊啊啊', '2019-07-06 09:16:41', '2019-07-08 08:59:00', '123456789', '啊啊啊啊', 0);
INSERT INTO `mm_addr` VALUES (1421, 45, '中国', '北京市', '北京市', '门头沟区aaaaa', '2019-07-06 09:17:22', '2019-07-08 08:59:03', '12345678910', 'aaaaa', 0);
INSERT INTO `mm_addr` VALUES (1455, 45, '中国', '内蒙古自治区', '呼和浩特市', '新城区4444', '2019-07-07 20:27:38', '2019-07-08 09:30:23', '4444444444', '4444', 0);
INSERT INTO `mm_addr` VALUES (1456, 45, '中国', '内蒙古自治区', '呼和浩特市', '新城区1111', '2019-07-07 20:31:19', '2019-07-08 09:33:34', '1111111', '111', 0);
INSERT INTO `mm_addr` VALUES (1458, 45, '中国', '山西省', '太原市', '小店区aaa', '2019-07-07 20:50:42', '2019-07-08 09:53:00', 'aaaa', 'aaaa', 0);
INSERT INTO `mm_addr` VALUES (1459, 45, '中国', '山西省', '太原市', '小店区sss', '2019-07-07 20:53:56', '2019-07-07 20:53:56', '1111111111', 'ssss', 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_admin
-- ----------------------------
DROP TABLE IF EXISTS `mm_admin`;
CREATE TABLE `mm_admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `is_lock` tinyint(2) unsigned NOT NULL COMMENT '是否锁定0/1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314445440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_admin
-- ----------------------------
BEGIN;
INSERT INTO `mm_admin` VALUES (314445437, 'admin', '689a7f41007215efcd7662de263812ef', 0);
INSERT INTO `mm_admin` VALUES (314445438, 'admin1', '689a7f41007215efcd7662de263812ef', 0);
INSERT INTO `mm_admin` VALUES (314445439, 'admin2', '689a7f41007215efcd7662de263812ef', 0);
COMMIT;

-- ----------------------------
-- Table structure for mm_announcement
-- ----------------------------
DROP TABLE IF EXISTS `mm_announcement`;
CREATE TABLE `mm_announcement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_announcement
-- ----------------------------
BEGIN;
INSERT INTO `mm_announcement` VALUES (1503, '不要乱删除', '测试内容可以自己在数据库中添加后再删除', '2019-07-11 18:12:09', '2019-07-12 16:49:12');
COMMIT;

-- ----------------------------
-- Table structure for mm_comment
-- ----------------------------
DROP TABLE IF EXISTS `mm_comment`;
CREATE TABLE `mm_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `itemid` bigint(20) unsigned NOT NULL COMMENT '对某个产品评论，所以需要itemid',
  `userid` bigint(20) unsigned NOT NULL COMMENT '评论者的id',
  `score` tinyint(2) unsigned NOT NULL COMMENT '分数，填写1-5',
  `comment` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '评语',
  `picture1` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片1',
  `picture2` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片2',
  `picture3` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '图片3',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_rcmd` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐上主页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1465 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_comment
-- ----------------------------
BEGIN;
INSERT INTO `mm_comment` VALUES (1, 1304, 1, 4, '哈哈，还不错，扫的挺干净的', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-06-12 21:54:53', '2019-07-12 18:50:12', 1);
INSERT INTO `mm_comment` VALUES (2, 1251, 1, 3, '这下应该有数据了', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-06-27 15:07:31', '2019-07-12 16:51:01', 1);
INSERT INTO `mm_comment` VALUES (1204, 1211, 16, 1, 'string', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-06-30 06:37:17', '2019-07-12 16:51:02', 1);
INSERT INTO `mm_comment` VALUES (1317, 1273, 16, 5, '', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-02 22:28:15', '2019-07-12 16:51:02', 1);
INSERT INTO `mm_comment` VALUES (1323, 1273, 16, 5, '添加评论', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 13:12:04', '2019-07-12 16:51:02', 1);
INSERT INTO `mm_comment` VALUES (1347, 1345, 45, 5, '评论测试评论测试', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:10:00', '2019-07-12 16:51:02', 1);
INSERT INTO `mm_comment` VALUES (1350, 1348, 45, 5, '电视机维修评价测试嗷', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:11:29', '2019-07-12 16:51:02', 1);
INSERT INTO `mm_comment` VALUES (1354, 1345, 45, 4, '五星好评嗷', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:36:47', '2019-07-12 16:51:03', 0);
INSERT INTO `mm_comment` VALUES (1355, 1335, 45, 4, '电视机维修！！！！！！修！！！', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:38:45', '2019-07-12 16:51:03', 0);
INSERT INTO `mm_comment` VALUES (1356, 1332, 45, 4, '书啊', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:40:32', '2019-07-12 16:51:03', 0);
INSERT INTO `mm_comment` VALUES (1357, 1348, 45, 4, '啊啊啊啊', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:42:46', '2019-07-12 16:51:03', 1);
INSERT INTO `mm_comment` VALUES (1358, 1348, 45, 4, '啊啊啊啊', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:42:52', '2019-07-12 16:51:03', 1);
INSERT INTO `mm_comment` VALUES (1359, 1339, 45, 3, '再测测', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:44:12', '2019-07-12 16:51:03', 1);
INSERT INTO `mm_comment` VALUES (1360, 1332, 45, 3, '最后此测试嗷', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:44:51', '2019-07-12 16:51:03', 1);
INSERT INTO `mm_comment` VALUES (1361, 1345, 45, 5, '真的最后一次了', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:45:25', '2019-07-12 16:51:03', 1);
INSERT INTO `mm_comment` VALUES (1362, 1332, 45, 5, '肯定能成功啊 ', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-03 20:46:52', '2019-07-12 16:51:03', 1);
INSERT INTO `mm_comment` VALUES (1384, 1235, 17, 5, '什么啊', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-04 21:11:07', '2019-07-12 16:51:03', 0);
INSERT INTO `mm_comment` VALUES (1463, 1442, 45, 5, '加点评论', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-08 18:14:18', '2019-07-12 16:51:04', 0);
INSERT INTO `mm_comment` VALUES (1464, 1460, 45, 4, '测试商品添加评论', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', 'http://image.ruankun.xyz/1.png', '2019-07-08 18:14:37', '2019-07-12 16:51:04', 0);
COMMIT;

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
  `reason` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1543 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='佣金记录表';

-- ----------------------------
-- Records of mm_commissionrecord
-- ----------------------------
BEGIN;
INSERT INTO `mm_commissionrecord` VALUES (1, 2, 5.00, 1, '2019-06-24 13:46:23', NULL);
INSERT INTO `mm_commissionrecord` VALUES (2, 16, 5.00, 1, '2019-06-27 09:39:23', NULL);
INSERT INTO `mm_commissionrecord` VALUES (1331, 45, 100.00, 1, '2019-07-03 22:28:37', '系统赠送');
INSERT INTO `mm_commissionrecord` VALUES (1371, 45, 2.99, 0, '2019-07-03 09:54:40', '提现成功，扣除佣金');
INSERT INTO `mm_commissionrecord` VALUES (1377, 27, 0.22, 0, '2019-07-04 07:07:40', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1378, 27, 0.22, 1, '2019-07-04 07:14:08', '提现失败，退还');
INSERT INTO `mm_commissionrecord` VALUES (1380, 27, 0.22, 0, '2019-07-04 07:16:27', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1382, 27, 2.78, 0, '2019-07-04 07:45:21', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1391, 16, 0.01, 0, '2019-07-04 21:07:36', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1393, 16, 0.02, 0, '2019-07-04 21:14:55', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1402, 16, 0.03, 0, '2019-07-05 06:32:21', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1409, 45, 1.00, 0, '2019-07-05 22:05:21', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1411, 45, 1.00, 0, '2019-07-05 22:11:00', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1413, 45, 0.01, 0, '2019-07-06 00:34:53', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1415, 45, 2.00, 0, '2019-07-06 00:39:57', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1417, 45, 3.00, 0, '2019-07-06 00:42:29', '佣金提现');
INSERT INTO `mm_commissionrecord` VALUES (1542, 17, 2.00, 0, '2019-07-12 04:20:47', '佣金提现');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=1389 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='积分记录';

-- ----------------------------
-- Records of mm_creditrecord
-- ----------------------------
BEGIN;
INSERT INTO `mm_creditrecord` VALUES (1, 2, '2019-06-24 13:46:49', 20, 1);
INSERT INTO `mm_creditrecord` VALUES (1262, 16, '2019-07-03 14:43:46', 10000, 1);
INSERT INTO `mm_creditrecord` VALUES (1263, 45, '2019-07-03 20:16:34', 900, 1);
INSERT INTO `mm_creditrecord` VALUES (1365, 45, '2019-07-03 08:40:50', 900, 0);
INSERT INTO `mm_creditrecord` VALUES (1388, 17, '2019-07-04 08:18:26', 190, 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=1473 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='优惠券';

-- ----------------------------
-- Records of mm_decoupon
-- ----------------------------
BEGIN;
INSERT INTO `mm_decoupon` VALUES (1, 17, '2019-07-01 10:20:40', '2019-07-04 13:47:35', 1, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (16, 113, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1085, 2, '2019-06-25 18:32:15', '2019-06-07 02:33:00', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1086, 2, '2019-06-25 18:40:35', '2019-05-31 02:41:19', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1087, 2, '2019-06-25 18:41:27', '2019-06-14 02:41:04', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1088, 2, '2019-06-25 18:43:18', '2019-06-06 02:44:03', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1089, 2, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1090, 3, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1091, 4, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1092, 5, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1093, 6, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1094, 7, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1095, 8, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1096, 9, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1097, 16, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 1, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1098, 11, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1099, 12, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1100, 13, '2019-06-25 19:00:24', '2019-05-30 03:00:09', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1101, 2, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1102, 3, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1103, 16, '2019-07-01 19:25:24', '2019-08-13 03:13:10', 1, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1104, 5, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1105, 6, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1106, 7, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1107, 16, '2019-07-01 20:34:25', '2019-08-13 03:13:10', 1, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1108, 9, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1109, 10, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1110, 16, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 1, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1111, 16, '2019-06-25 19:12:24', '2019-06-13 03:13:10', 0, 1, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1113, 45, '2019-07-03 21:45:52', '2019-07-10 13:45:40', 1, 0, 120.00, 20.00, 0);
INSERT INTO `mm_decoupon` VALUES (1114, 45, '2019-07-03 21:46:24', '2019-07-10 13:46:07', 1, 0, 100.00, 10.00, 0);
INSERT INTO `mm_decoupon` VALUES (1404, 2, '2019-07-05 07:44:51', '2019-07-03 15:43:46', 0, 0, 2.00, 2.00, 0);
INSERT INTO `mm_decoupon` VALUES (1468, 2, '2019-07-10 04:18:22', '2019-07-19 12:16:37', 0, 0, 0.00, 1.00, 0);
INSERT INTO `mm_decoupon` VALUES (1469, 16, '2019-07-10 04:18:22', '2019-07-19 12:16:37', 0, 0, 0.00, 1.00, 0);
INSERT INTO `mm_decoupon` VALUES (1470, 17, '2019-07-10 04:18:22', '2019-07-19 12:16:37', 0, 0, 0.00, 1.00, 0);
INSERT INTO `mm_decoupon` VALUES (1471, 27, '2019-07-10 04:18:22', '2019-07-19 12:16:37', 0, 0, 0.00, 1.00, 0);
INSERT INTO `mm_decoupon` VALUES (1472, 45, '2019-07-10 04:18:22', '2019-07-19 12:16:37', 0, 0, 0.00, 1.00, 0);
COMMIT;

-- ----------------------------
-- Table structure for mm_decouponcdkey
-- ----------------------------
DROP TABLE IF EXISTS `mm_decouponcdkey`;
CREATE TABLE `mm_decouponcdkey` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cdkey` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '兑换码cdkey',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '生成时间',
  `gmt_past` datetime NOT NULL COMMENT '过期时间',
  `is_exchanged` tinyint(1) unsigned NOT NULL COMMENT '是否兑换，0未兑换，1已兑换',
  `is_past` tinyint(1) unsigned NOT NULL COMMENT '是否已过期',
  `min` decimal(10,2) unsigned NOT NULL COMMENT '使用最低额度',
  `worth` decimal(10,2) unsigned NOT NULL COMMENT '优惠券额度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='优惠券的兑换码';

-- ----------------------------
-- Records of mm_decouponcdkey
-- ----------------------------
BEGIN;
INSERT INTO `mm_decouponcdkey` VALUES (16, '24412852877eec5e2140ef33180cdeac', '2019-06-14 22:21:54', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (17, '71699937d9535c03c4afbd5f95fac3b1', '2019-06-14 22:21:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1039, '48b678c28e82b34b247ec9d1c614136a', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1040, 'b8ebe404d10c880338c07665a3175749', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1041, 'c14acaf800bc9428c044b3f4e31a34e5', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1042, '93b0872c27108d2a878171dd13b51953', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1043, '88c4fd6797ea231a59b44ce8b001d72c', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1044, 'cb7a20ad536d51ee351b72ce4454c9df', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1045, 'c3f2ee20f25ab0dc6389bdb5ba1c5918', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1046, 'c71b4927ff4722a60a0b3e95b783f241', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1047, '9b167fd0ee437708bb7d352897cb3ee4', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1048, '22989990c8ea7aee6484ff696c605947', '2019-06-14 22:40:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1161, '1816415cc032bc278254f5a9b74be409', '2019-06-28 04:39:30', '2019-06-27 07:59:09', 0, 0, 0.00, 0.00);
INSERT INTO `mm_decouponcdkey` VALUES (1162, '719c3db104c6c063f648818281541c57', '2019-06-28 04:40:56', '2019-05-28 12:39:54', 0, 0, 1.00, 0.00);
INSERT INTO `mm_decouponcdkey` VALUES (1163, 'eb599d93993dbb57a2a0eecc96a63848', '2019-06-28 08:46:57', '2019-06-08 16:46:55', 0, 0, 1.00, 0.00);
INSERT INTO `mm_decouponcdkey` VALUES (1405, 'c853a2d922528b7113f1bae36f469fa7', '2019-07-05 07:45:01', '2019-07-12 15:36:58', 0, 0, 1.00, 0.00);
COMMIT;

-- ----------------------------
-- Table structure for mm_dict_producttype
-- ----------------------------
DROP TABLE IF EXISTS `mm_dict_producttype`;
CREATE TABLE `mm_dict_producttype` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_dict_producttype
-- ----------------------------
BEGIN;
INSERT INTO `mm_dict_producttype` VALUES (1, '家电维修');
INSERT INTO `mm_dict_producttype` VALUES (2, '家电清洗');
INSERT INTO `mm_dict_producttype` VALUES (3, '家具清洗');
INSERT INTO `mm_dict_producttype` VALUES (4, '保洁套餐');
INSERT INTO `mm_dict_producttype` VALUES (5, '开荒套餐');
INSERT INTO `mm_dict_producttype` VALUES (6, '二次开荒');
COMMIT;

-- ----------------------------
-- Table structure for mm_index_advertisement
-- ----------------------------
DROP TABLE IF EXISTS `mm_index_advertisement`;
CREATE TABLE `mm_index_advertisement` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imagesrc` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `productid` bigint(20) unsigned NOT NULL COMMENT '产品ID',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_visible` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否可被前端检索',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1541 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_index_advertisement
-- ----------------------------
BEGIN;
INSERT INTO `mm_index_advertisement` VALUES (3, 'http://image.ruankun.xyz/adf9b76a9b48a7fd40816905f3c4a454.jpg', 3, '2019-06-24 14:02:21', '2019-06-24 14:02:27', 1);
INSERT INTO `mm_index_advertisement` VALUES (1277, 'http://image.ruankun.xyz/adf9b76a9b48a7fd40816905f3c4a454.jpg', 1, '2019-07-02 01:00:35', '2019-07-02 01:00:35', 1);
INSERT INTO `mm_index_advertisement` VALUES (1509, 'http://image.ruankun.xyz/adf9b76a9b48a7fd40816905f3c4a454.jpg', 10, '2019-07-11 19:12:25', '2019-07-11 19:12:25', 1);
INSERT INTO `mm_index_advertisement` VALUES (1510, 'http://image.ruankun.xyz/adf9b76a9b48a7fd40816905f3c4a454.jpg', 11, '2019-07-11 19:12:33', '2019-07-11 19:12:33', 0);
INSERT INTO `mm_index_advertisement` VALUES (1540, 'http://image.ruankun.xyz/36eb3db0503a6b8bb7bc1161676a5748.jpg', 12, '2019-07-12 04:09:40', '2019-07-12 04:09:40', 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `mm_index_banner`;
CREATE TABLE `mm_index_banner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imagesrc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '轮播图图片的地址',
  `productid` bigint(20) NOT NULL COMMENT '该图指向的具体产品',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1514 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='主页banner的数据信息';

-- ----------------------------
-- Records of mm_index_banner
-- ----------------------------
BEGIN;
INSERT INTO `mm_index_banner` VALUES (1127, 'http://image.ruankun.xyz/2fe3c2ee3ce6da2c3724c29caacdeaa6.jpg', 3, '2019-06-27 14:10:37', '2019-07-11 06:25:38', 0);
INSERT INTO `mm_index_banner` VALUES (1496, 'http://image.ruankun.xyz/6314c9af70d0ab4898abcd4ed7928237.jpg', 4, '2019-07-10 23:07:41', '2019-07-12 16:52:37', 0);
INSERT INTO `mm_index_banner` VALUES (1513, 'http://image.ruankun.xyz/adb18ac789bce1c9dabc8cc2946d5ecf.jpg', 5, '2019-07-11 19:16:28', '2019-07-12 16:52:39', 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_index_recommend
-- ----------------------------
DROP TABLE IF EXISTS `mm_index_recommend`;
CREATE TABLE `mm_index_recommend` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) NOT NULL COMMENT '产品ID',
  `imagesrc` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '图',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1538 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='主页推荐';

-- ----------------------------
-- Records of mm_index_recommend
-- ----------------------------
BEGIN;
INSERT INTO `mm_index_recommend` VALUES (1, 1, 'http://image.ruankun.xyz/1.png', '2019-06-24 14:06:05', '2019-06-24 14:06:02');
INSERT INTO `mm_index_recommend` VALUES (1506, 10, 'http://image.ruankun.xyz/1.png', '2019-07-11 06:08:35', '2019-07-11 06:08:35');
INSERT INTO `mm_index_recommend` VALUES (1507, 10, 'http://image.ruankun.xyz/1.png', '2019-07-11 06:08:52', '2019-07-11 06:08:52');
INSERT INTO `mm_index_recommend` VALUES (1514, 2, 'http://image.ruankun.xyz/6d109850373d935d010b7cc432ff1cbf.jpg', '2019-07-11 07:24:15', '2019-07-11 07:24:15');
INSERT INTO `mm_index_recommend` VALUES (1515, 12, 'http://image.ruankun.xyz/ca499afd0fccc9c869026ce3b38fe4a0.jpg', '2019-07-11 07:24:48', '2019-07-11 07:24:48');
INSERT INTO `mm_index_recommend` VALUES (1524, 13, 'http://image.ruankun.xyz/b6302054df9b0cccb2f78d08db18de3e.jpg', '2019-07-11 07:48:19', '2019-07-11 07:48:19');
INSERT INTO `mm_index_recommend` VALUES (1525, 13, 'http://image.ruankun.xyz/9cb2942db124a7c600be2e8c8deb3b2c.jpg', '2019-07-11 07:48:26', '2019-07-11 07:48:26');
INSERT INTO `mm_index_recommend` VALUES (1531, 11, 'http://image.ruankun.xyz/0be6988a42d59700bd8b463950045ec5.jpg', '2019-07-11 21:29:06', '2019-07-11 21:29:06');
INSERT INTO `mm_index_recommend` VALUES (1536, 12, 'http://image.ruankun.xyz/b3d1a461596673c0d8c708ed1f9c0eb6.jpg', '2019-07-12 04:07:10', '2019-07-12 04:07:10');
INSERT INTO `mm_index_recommend` VALUES (1537, 12, 'http://image.ruankun.xyz/692d40961ef990cd71493e45b573a6d3.jpg', '2019-07-12 04:07:29', '2019-07-12 04:07:29');
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
  `orderid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号，只有生成订单后才有效，否则该字段无效',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `is_comment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1535 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='item表，表示购物车，购物车里面的每一件物品都是item，当生成订单时，item中的订单号就不为空了。表示item从购物车移除，到了订单中';

-- ----------------------------
-- Records of mm_item
-- ----------------------------
BEGIN;
INSERT INTO `mm_item` VALUES (1049, 1, 2, 1, '23423412342342341234234234123434', '2019-06-21 22:55:24', '2019-06-24 14:04:54', 2, 0);
INSERT INTO `mm_item` VALUES (1174, 1, 1, 1, '99956995741034135212886859129465', '2019-06-29 14:04:53', '2019-06-30 19:34:00', 16, 0);
INSERT INTO `mm_item` VALUES (1192, 1, 1, 1, '99956995741034135212886859129465', '2019-06-30 17:03:18', '2019-06-30 19:34:01', 16, 0);
INSERT INTO `mm_item` VALUES (1196, 1, 1, 1, '90370486652796732973096201047185', '2019-06-30 19:38:53', '2019-06-30 19:55:18', 16, 0);
INSERT INTO `mm_item` VALUES (1197, 1, 1, 1, '90370486652796732973096201047185', '2019-06-30 19:39:42', '2019-06-30 19:55:19', 16, 0);
INSERT INTO `mm_item` VALUES (1198, 1, 1, 1, '90370486652796732973096201047185', '2019-06-30 19:41:20', '2019-06-30 19:55:19', 16, 0);
INSERT INTO `mm_item` VALUES (1199, 1, 1, 1, '90370486652796732973096201047185', '2019-06-30 19:42:01', '2019-06-30 19:55:19', 16, 0);
INSERT INTO `mm_item` VALUES (1200, 1, 1, 1, '90631701229720658923076673954436', '2019-06-30 20:10:34', '2019-06-30 20:16:30', 16, 0);
INSERT INTO `mm_item` VALUES (1211, 1, 2, 2, '92672355824325071779976860010895', '2019-07-01 11:17:30', '2019-07-01 11:52:37', 27, 0);
INSERT INTO `mm_item` VALUES (1232, 1, 1, 1, '98731676762347928862395636179498', '2019-07-01 14:40:21', '2019-07-01 18:27:11', 16, 0);
INSERT INTO `mm_item` VALUES (1235, 1, 1, 1, '91846853587271756706443795641643', '2019-07-01 17:24:47', '2019-07-04 21:11:07', 17, 1);
INSERT INTO `mm_item` VALUES (1251, 1, 1, 1, '98648179394702027655142046848388', '2019-07-01 18:36:44', '2019-07-01 21:08:42', 16, 0);
INSERT INTO `mm_item` VALUES (1263, 1, 1, 1, '94533756816147945802971633795873', '2019-07-01 21:20:44', '2019-07-01 21:21:08', 16, 0);
INSERT INTO `mm_item` VALUES (1270, 1, 1, 1, '90352422261140259283048667486430', '2019-07-01 22:13:41', '2019-07-02 08:25:24', 16, 0);
INSERT INTO `mm_item` VALUES (1271, 1, 1, 1, '90352422261140259283048667486430', '2019-07-01 22:14:21', '2019-07-03 10:34:58', 16, 1);
INSERT INTO `mm_item` VALUES (1273, 1, 1, 1, '90352422261140259283048667486430', '2019-07-01 22:23:34', '2019-07-03 10:16:35', 16, 1);
INSERT INTO `mm_item` VALUES (1279, 1, 2, 1, '98078704535512468345194645062712', '2019-07-02 08:43:43', '2019-07-02 09:17:43', 16, 0);
INSERT INTO `mm_item` VALUES (1282, 1, 1, 1, '94279718722385892113590056976410', '2019-07-02 09:32:22', '2019-07-02 09:34:25', 16, 0);
INSERT INTO `mm_item` VALUES (1285, 1, 1, 1, '95258330957573397975254696128653', '2019-07-02 09:37:13', '2019-07-02 10:23:06', 16, 0);
INSERT INTO `mm_item` VALUES (1290, 1, 1, 1, '92798462112834037213987076401734', '2019-07-02 10:25:24', '2019-07-02 10:29:10', 16, 0);
INSERT INTO `mm_item` VALUES (1292, 1, 1, 1, '90024144610012837861008459169206', '2019-07-02 10:29:48', '2019-07-02 10:29:53', 16, 0);
INSERT INTO `mm_item` VALUES (1294, 1, 2, 1, '90510946827006965957140812286903', '2019-07-02 10:31:22', '2019-07-02 10:31:28', 16, 0);
INSERT INTO `mm_item` VALUES (1296, 1, 1, 1, '98247442628203606253385853581600', '2019-07-02 10:32:25', '2019-07-02 10:32:30', 16, 0);
INSERT INTO `mm_item` VALUES (1298, 1, 1, 1, '99348276942927237726549472392174', '2019-07-02 10:32:59', '2019-07-02 10:33:05', 16, 0);
INSERT INTO `mm_item` VALUES (1300, 1, 1, 1, '94556096651103877729615274541057', '2019-07-02 10:33:59', '2019-07-02 10:34:04', 16, 0);
INSERT INTO `mm_item` VALUES (1302, 1, 1, 1, '90225048959336383451435205055161', '2019-07-02 10:35:21', '2019-07-02 10:35:25', 16, 0);
INSERT INTO `mm_item` VALUES (1304, 1, 1, 1, '91492116666311879733181661184401', '2019-07-02 10:42:42', '2019-07-02 10:43:06', 16, 0);
INSERT INTO `mm_item` VALUES (1309, 1, 7, 1, '94762866892689551518748024765173', '2019-07-02 14:46:44', '2019-07-02 14:47:02', 16, 0);
INSERT INTO `mm_item` VALUES (1310, 1, 9, 1, '90316406694398464508811757277345', '2019-07-02 14:48:38', '2019-07-02 14:48:48', 16, 0);
INSERT INTO `mm_item` VALUES (1313, 1, 4, 1, NULL, '2019-07-02 18:11:31', '2019-07-02 18:11:31', 16, 0);
INSERT INTO `mm_item` VALUES (1332, 1, 1, 1, '90920877384242141683642702690361', '2019-07-03 17:30:31', '2019-07-03 20:40:32', 45, 1);
INSERT INTO `mm_item` VALUES (1335, 1, 2, 3, '97885490763149529682019899516398', '2019-07-03 18:11:05', '2019-07-03 20:38:45', 45, 1);
INSERT INTO `mm_item` VALUES (1337, 2, 17, 2, '99712295103439448190683326167223', '2019-07-03 18:11:27', '2019-07-03 18:11:32', 45, 0);
INSERT INTO `mm_item` VALUES (1339, 6, 79, 2, '90575953497526403323564281027853', '2019-07-03 18:11:46', '2019-07-03 20:44:12', 45, 1);
INSERT INTO `mm_item` VALUES (1341, 2, 23, 1, '98658812031731250303980130878260', '2019-07-03 18:15:02', '2019-07-03 18:15:33', 45, 0);
INSERT INTO `mm_item` VALUES (1342, 4, 49, 1, '98658812031731250303980130878260', '2019-07-03 18:15:15', '2019-07-03 18:15:33', 45, 0);
INSERT INTO `mm_item` VALUES (1343, 5, 62, 1, '98658812031731250303980130878260', '2019-07-03 18:15:25', '2019-07-03 18:15:33', 45, 0);
INSERT INTO `mm_item` VALUES (1345, 2, 23, 1, '92092344712291695101311146714397', '2019-07-03 18:25:10', '2019-07-03 20:10:00', 45, 1);
INSERT INTO `mm_item` VALUES (1348, 1, 2, 1, '94476712399288851992385824283031', '2019-07-03 20:10:36', '2019-07-03 20:11:29', 45, 1);
INSERT INTO `mm_item` VALUES (1363, 2, 15, 1, '97752323180844070277695980077257', '2019-07-03 21:40:08', '2019-07-03 21:40:49', 45, 0);
INSERT INTO `mm_item` VALUES (1366, 1, 12, 1, '99347223341412441259505123022011', '2019-07-03 22:25:41', '2019-07-04 09:10:24', 45, 0);
INSERT INTO `mm_item` VALUES (1367, 1, 6, 1, '99347223341412441259505123022011', '2019-07-03 22:27:11', '2019-07-04 09:10:24', 45, 0);
INSERT INTO `mm_item` VALUES (1373, 2, 20, 1, '95455475515148130420326580404945', '2019-07-04 09:11:19', '2019-07-04 09:11:24', 45, 0);
INSERT INTO `mm_item` VALUES (1375, 2, 18, 1, '90284914179505066336973300466427', '2019-07-04 09:19:10', '2019-07-05 16:43:11', 45, 0);
INSERT INTO `mm_item` VALUES (1386, 1, 12, 4, '93206206350719436160615910656373', '2019-07-04 21:17:25', '2019-07-04 21:18:26', 17, 0);
INSERT INTO `mm_item` VALUES (1389, 5, 68, 1, '90284914179505066336973300466427', '2019-07-04 21:42:18', '2019-07-05 16:43:11', 45, 0);
INSERT INTO `mm_item` VALUES (1394, 1, 6, 1, '90284914179505066336973300466427', '2019-07-05 16:37:17', '2019-07-05 16:43:11', 45, 0);
INSERT INTO `mm_item` VALUES (1397, 2, 19, 1, '99070344265028268589133556114596', '2019-07-05 16:48:29', '2019-07-05 16:48:38', 45, 0);
INSERT INTO `mm_item` VALUES (1399, 1, 10, 1, '90909299613615221992337292836179', '2019-07-05 16:55:27', '2019-07-05 16:58:49', 45, 0);
INSERT INTO `mm_item` VALUES (1419, 2, 19, 1, '99229967085205118722761007292108', '2019-07-06 21:29:39', '2019-07-06 22:17:35', 45, 0);
INSERT INTO `mm_item` VALUES (1423, 2, 23, 1, '91940308422322440075513213426609', '2019-07-06 22:19:27', '2019-07-07 21:18:57', 45, 0);
INSERT INTO `mm_item` VALUES (1424, 1, 2, 3, '93168710726225509009404532612826', '2019-07-07 21:18:28', '2019-07-07 21:18:51', 17, 0);
INSERT INTO `mm_item` VALUES (1425, 2, 21, 1, '91940308422322440075513213426609', '2019-07-07 21:18:49', '2019-07-07 21:18:57', 45, 0);
INSERT INTO `mm_item` VALUES (1428, 1, 12, 5, '93662717099116565015794336844783', '2019-07-07 21:24:41', '2019-07-07 21:24:48', 17, 0);
INSERT INTO `mm_item` VALUES (1430, 5, 65, 3, '99631488069777565716558639041726', '2019-07-07 21:26:36', '2019-07-07 21:26:53', 17, 0);
INSERT INTO `mm_item` VALUES (1432, 1, 14, 2, '91708652152378741237495949519747', '2019-07-07 21:27:41', '2019-07-07 21:27:45', 17, 0);
INSERT INTO `mm_item` VALUES (1434, 1, 13, 3, '94427003802838255530238853789136', '2019-07-07 21:29:04', '2019-07-07 21:29:38', 17, 0);
INSERT INTO `mm_item` VALUES (1436, 1, 2, 1, '97227874597848847806540221767487', '2019-07-07 22:00:10', '2019-07-07 22:00:17', 17, 0);
INSERT INTO `mm_item` VALUES (1437, 1, 2, 2, '97227874597848847806540221767487', '2019-07-07 22:00:10', '2019-07-07 22:00:18', 17, 0);
INSERT INTO `mm_item` VALUES (1440, 2, 21, 2, '97906906620263530305790273544126', '2019-07-07 23:12:43', '2019-07-07 23:12:53', 17, 0);
INSERT INTO `mm_item` VALUES (1442, 3, 35, 1, '91444223088210884881452005112271', '2019-07-08 08:53:37', '2019-07-08 18:14:18', 45, 1);
INSERT INTO `mm_item` VALUES (1443, 3, 35, 2, '91444223088210884881452005112271', '2019-07-08 08:53:37', '2019-07-08 08:54:25', 45, 0);
INSERT INTO `mm_item` VALUES (1444, 4, 54, 1, '91444223088210884881452005112271', '2019-07-08 08:53:55', '2019-07-08 08:54:25', 45, 0);
INSERT INTO `mm_item` VALUES (1446, 3, 33, 2, '91125506510022371117096570653808', '2019-07-08 08:57:17', '2019-07-08 08:57:37', 45, 0);
INSERT INTO `mm_item` VALUES (1447, 5, 66, 1, '91125506510022371117096570653808', '2019-07-08 08:57:27', '2019-07-08 08:57:37', 45, 0);
INSERT INTO `mm_item` VALUES (1450, 7, 86, 1, '91328527030425713674616912458089', '2019-07-08 09:20:42', '2019-07-08 09:20:48', 17, 0);
INSERT INTO `mm_item` VALUES (1457, 7, 86, 2, NULL, '2019-07-08 09:37:40', '2019-07-08 09:37:40', 17, 0);
INSERT INTO `mm_item` VALUES (1460, 7, 86, 1, '95769136008899935203007007424881', '2019-07-08 10:14:31', '2019-07-08 18:14:37', 45, 1);
INSERT INTO `mm_item` VALUES (1465, 7, 86, 3, '94919096059442130123180360060934', '2019-07-09 07:51:06', '2019-07-09 07:51:19', 45, 0);
INSERT INTO `mm_item` VALUES (1533, 5, 67, 1, '93772042768500565702013942717024', '2019-07-12 16:36:47', '2019-07-12 16:37:15', 45, 0);
INSERT INTO `mm_item` VALUES (1534, 7, 86, 1, '93772042768500565702013942717024', '2019-07-12 16:37:08', '2019-07-12 16:37:15', 45, 0);
COMMIT;

-- ----------------------------
-- Table structure for mm_order
-- ----------------------------
DROP TABLE IF EXISTS `mm_order`;
CREATE TABLE `mm_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `ordernumber` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1536 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_order
-- ----------------------------
BEGIN;
INSERT INTO `mm_order` VALUES (1, 2, '23423412342342341234234234123434', 12.00, '2019-06-24 14:05:25', '2019-06-24 14:05:25', 0, 0, NULL, 0, NULL, 0, 2);
INSERT INTO `mm_order` VALUES (5, 12, 'AFADFDFA', 323.00, '2019-06-29 18:25:59', '2019-06-29 18:25:59', 0, 0, NULL, 0, NULL, 0, 222);
INSERT INTO `mm_order` VALUES (1224, 27, '92672355824325071779976860010895', 10.00, '2019-06-30 22:52:36', '2019-07-02 10:51:03', 0, 0, 0, 0, 0, 0, 1178);
INSERT INTO `mm_order` VALUES (1275, 17, '90119795788481023983939137291631', 100.00, '2019-07-01 10:20:40', '2019-07-02 00:39:04', 1, 0, 1, 1, 0, 0, 2);
INSERT INTO `mm_order` VALUES (1278, 16, '90352422261140259283048667486430', 340.00, '2019-07-01 19:25:23', '2019-07-01 19:25:23', 0, 0, 1103, 1, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1281, 16, '98078704535512468345194645062712', 130.00, '2019-07-01 20:17:43', '2019-07-01 20:17:43', 0, 0, 1107, 1, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1284, 16, '94279718722385892113590056976410', 100.00, '2019-07-01 20:34:25', '2019-07-01 20:34:25', 0, 0, 1107, 1, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1291, 16, '92798462112834037213987076401734', 120.00, '2019-07-01 21:29:10', '2019-07-01 21:29:10', 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1293, 16, '90024144610012837861008459169206', 120.00, '2019-07-01 21:29:54', '2019-07-01 21:29:54', 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1299, 16, '99348276942927237726549472392174', 120.00, '2019-07-01 21:33:05', '2019-07-01 21:33:05', 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1301, 16, '94556096651103877729615274541057', 120.00, '2019-07-01 21:34:04', '2019-07-01 21:34:04', 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1303, 16, '90225048959336383451435205055161', 120.00, '2019-07-01 21:35:25', '2019-07-01 21:35:25', 0, 0, 0, 0, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1305, 16, '91492116666311879733181661184401', 100.00, '2019-07-01 21:43:06', '2019-07-01 21:43:06', 0, 0, 1103, 1, 0, 0, 3);
INSERT INTO `mm_order` VALUES (1307, 17, '91846853587271756706443795641643', 121.00, '2019-07-01 21:53:05', '2019-07-02 11:23:16', 0, 0, 0, 0, 0, 0, 2);
INSERT INTO `mm_order` VALUES (1334, 45, '90920877384242141683642702690361', 120.00, '2019-07-03 04:31:28', '2019-07-03 04:31:28', 0, 0, 0, 0, 0, 0, 1333);
INSERT INTO `mm_order` VALUES (1336, 45, '97885490763149529682019899516398', 120.00, '2019-07-03 05:11:12', '2019-07-03 05:11:12', 0, 0, 0, 0, 0, 0, 1333);
INSERT INTO `mm_order` VALUES (1338, 45, '99712295103439448190683326167223', 120.00, '2019-07-03 05:11:32', '2019-07-03 05:11:32', 0, 0, 0, 0, 0, 0, 1333);
INSERT INTO `mm_order` VALUES (1340, 45, '90575953497526403323564281027853', 120.00, '2019-07-03 05:11:51', '2019-07-03 05:11:51', 0, 0, 0, 0, 0, 0, 1333);
INSERT INTO `mm_order` VALUES (1344, 45, '98658812031731250303980130878260', 360.00, '2019-07-03 05:15:33', '2019-07-03 05:15:33', 0, 0, 0, 0, 0, 0, 1333);
INSERT INTO `mm_order` VALUES (1346, 45, '92092344712291695101311146714397', 120.00, '2019-07-03 05:25:15', '2019-07-03 05:25:15', 0, 0, 0, 0, 0, 0, 1333);
INSERT INTO `mm_order` VALUES (1349, 45, '94476712399288851992385824283031', 120.00, '2019-07-03 07:10:45', '2019-07-03 07:10:45', 0, 0, 0, 0, 0, 0, 1333);
INSERT INTO `mm_order` VALUES (1364, 45, '97752323180844070277695980077257', 111.00, '2019-07-03 08:40:50', '2019-07-03 08:40:50', 0, 0, 0, 0, 900, 1, 1333);
INSERT INTO `mm_order` VALUES (1372, 45, '99347223341412441259505123022011', 240.00, '2019-07-03 20:10:24', '2019-07-03 20:10:24', 0, 0, 0, 0, 0, 0, 1370);
INSERT INTO `mm_order` VALUES (1374, 45, '95455475515148130420326580404945', 120.00, '2019-07-03 20:11:25', '2019-07-03 20:11:25', 0, 0, 0, 0, 0, 0, 1370);
INSERT INTO `mm_order` VALUES (1387, 17, '93206206350719436160615910656373', 118.10, '2019-07-04 08:18:26', '2019-07-04 08:18:26', 0, 0, 0, 0, 190, 1, 1385);
INSERT INTO `mm_order` VALUES (1396, 45, '90284914179505066336973300466427', 340.00, '2019-07-05 03:43:11', '2019-07-05 03:43:11', 0, 0, 1113, 1, 0, 0, 1395);
INSERT INTO `mm_order` VALUES (1398, 45, '99070344265028268589133556114596', 120.00, '2019-07-05 03:48:39', '2019-07-05 03:48:39', 0, 0, 0, 0, 0, 0, 1395);
INSERT INTO `mm_order` VALUES (1400, 45, '90909299613615221992337292836179', 110.00, '2019-07-05 03:58:50', '2019-07-05 03:58:50', 0, 0, 1114, 1, 0, 0, 1395);
INSERT INTO `mm_order` VALUES (1422, 45, '99229967085205118722761007292108', 120.00, '2019-07-06 09:17:35', '2019-07-06 09:17:35', 0, 0, 0, 0, 0, 0, 1420);
INSERT INTO `mm_order` VALUES (1426, 17, '93168710726225509009404532612826', 120.00, '2019-07-07 08:18:52', '2019-07-07 08:18:52', 0, 0, 0, 0, 0, 0, 1385);
INSERT INTO `mm_order` VALUES (1427, 45, '91940308422322440075513213426609', 240.00, '2019-07-07 08:18:57', '2019-07-07 08:18:57', 0, 0, 0, 0, 0, 0, 1420);
INSERT INTO `mm_order` VALUES (1433, 17, '91708652152378741237495949519747', 240.00, '2019-07-07 08:27:45', '2019-07-07 08:27:45', 0, 0, 0, 0, 0, 0, 1385);
INSERT INTO `mm_order` VALUES (1435, 17, '94427003802838255530238853789136', 360.00, '2019-07-07 08:29:39', '2019-07-07 08:29:39', 0, 0, 0, 0, 0, 0, 1385);
INSERT INTO `mm_order` VALUES (1438, 17, '97227874597848847806540221767487', 480.00, '2019-07-07 09:00:18', '2019-07-07 09:00:18', 0, 0, 0, 0, 0, 0, 1385);
INSERT INTO `mm_order` VALUES (1441, 17, '97906906620263530305790273544126', 240.00, '2019-07-07 10:12:54', '2019-07-07 10:12:54', 0, 0, 0, 0, 0, 0, 1385);
INSERT INTO `mm_order` VALUES (1445, 45, '91444223088210884881452005112271', 600.00, '2019-07-07 19:54:26', '2019-07-07 19:54:26', 0, 0, 0, 0, 0, 0, 1420);
INSERT INTO `mm_order` VALUES (1448, 45, '91125506510022371117096570653808', 360.00, '2019-07-07 19:57:37', '2019-07-07 19:57:37', 0, 0, 0, 0, 0, 0, 1420);
INSERT INTO `mm_order` VALUES (1451, 17, '91328527030425713674616912458089', 0.01, '2019-07-07 20:20:48', '2019-07-07 20:20:48', 1, 0, 0, 0, 0, 0, 1385);
INSERT INTO `mm_order` VALUES (1461, 45, '95769136008899935203007007424881', 0.01, '2019-07-07 21:14:40', '2019-07-07 21:14:40', 1, 0, 0, 0, 0, 0, 1459);
INSERT INTO `mm_order` VALUES (1466, 45, '94919096059442130123180360060934', 0.03, '2019-07-08 18:51:20', '2019-07-08 18:51:20', 1, 0, 0, 0, 0, 0, 1459);
INSERT INTO `mm_order` VALUES (1535, 45, '93772042768500565702013942717024', 120.01, '2019-07-12 03:37:16', '2019-07-12 03:37:16', 0, 0, 0, 0, 0, 0, 1459);
COMMIT;

-- ----------------------------
-- Table structure for mm_ordersecret
-- ----------------------------
DROP TABLE IF EXISTS `mm_ordersecret`;
CREATE TABLE `mm_ordersecret` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `secret` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `orderid` bigint(20) unsigned NOT NULL COMMENT '订单id',
  `is_used` tinyint(1) unsigned NOT NULL COMMENT '是否被使用',
  `employee` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单完成员工,该字段应该在订单finish之后填入',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_ordersecret
-- ----------------------------
BEGIN;
INSERT INTO `mm_ordersecret` VALUES (1452, '9d856180998889e2149f0cc39603d514', 1451, 0, NULL, '2019-07-07 20:21:38', '2019-07-07 20:21:38', 17);
INSERT INTO `mm_ordersecret` VALUES (1462, 'ed4c03680db0a13895f7a031ddf02bd3', 1461, 0, NULL, '2019-07-07 21:15:09', '2019-07-07 21:15:09', 45);
INSERT INTO `mm_ordersecret` VALUES (1467, 'ce4e5d38171bc557182b229755f4dad6', 1466, 0, NULL, '2019-07-08 18:51:56', '2019-07-08 18:51:56', 45);
COMMIT;

-- ----------------------------
-- Table structure for mm_product
-- ----------------------------
DROP TABLE IF EXISTS `mm_product`;
CREATE TABLE `mm_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` bigint(20) unsigned NOT NULL COMMENT '类型字典中去查',
  `title` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '主图',
  `content` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务主内容',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `intro` text COLLATE utf8mb4_general_ci COMMENT '简介',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_product
-- ----------------------------
BEGIN;
INSERT INTO `mm_product` VALUES (3, 3, '擦玻璃+洗沙发+扫地', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-02 11:41:40', '2019-07-12 16:57:41', '简介', 1);
INSERT INTO `mm_product` VALUES (4, 4, '厨房保洁', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-02 11:42:06', '2019-07-12 16:57:43', '简介', 1);
INSERT INTO `mm_product` VALUES (5, 5, '整房开荒', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-02 11:42:38', '2019-07-12 16:57:44', '简介', 1);
INSERT INTO `mm_product` VALUES (6, 6, '三室一厅二次开荒', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-02 11:43:05', '2019-07-12 16:57:45', '简介', 1);
INSERT INTO `mm_product` VALUES (7, 3, '测试产品', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-08 09:19:09', '2019-07-12 16:57:47', '测试产品', 1);
INSERT INTO `mm_product` VALUES (10, 1, '测试产品2', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-10 06:31:45', '2019-07-12 16:57:48', 'string', 1);
INSERT INTO `mm_product` VALUES (11, 0, '测试产品3', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-10 22:32:10', '2019-07-12 16:57:49', 'string', 1);
INSERT INTO `mm_product` VALUES (12, 0, '测试产品5', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-10 09:33:57', '2019-07-12 16:57:51', 'string', 1);
INSERT INTO `mm_product` VALUES (13, 1, '测试产品6', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-10 22:43:23', '2019-07-12 16:57:52', '1', 1);
INSERT INTO `mm_product` VALUES (14, 1, '测试产品7', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-10 22:47:29', '2019-07-12 22:29:49', '213', 0);
INSERT INTO `mm_product` VALUES (15, 1, '测试产品8', 'http://image.ruankun.xyz/1.png', '<div contenteditable=\"true\" style=\"width:100%; height:100%;\" class=\"w-e-text\" id=\"text-elem5845575148057394\"><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\">家具清洗！</span></p><p style=\"text-align: center;\"><span style=\"font-size: xx-large; font-weight: 700;\">120元，新用户用卷减20元！</span></p><p style=\"text-align: center;\"><span style=\"font-weight: bold; font-size: xx-large;\"><img src=\"http://image.ruankun.xyz/1.png\" style=\"max-width:100%;\"></span><br></p></div>', '2019-07-10 22:51:11', '2019-07-12 22:29:09', '1', 0);
INSERT INTO `mm_product` VALUES (16, 1, '1', '1', '1', '2019-07-12 17:39:09', '2019-07-12 17:39:09', '1', 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_productprops
-- ----------------------------
DROP TABLE IF EXISTS `mm_productprops`;
CREATE TABLE `mm_productprops` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) NOT NULL COMMENT '产品id',
  `servicedate` tinyint(2) unsigned NOT NULL COMMENT '服务日期1-周1,2-周2...以此类推',
  `servicetime` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '服务时间，自己填',
  `price` decimal(10,2) NOT NULL COMMENT '服务价格',
  `is_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1544 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='产品规格';

-- ----------------------------
-- Records of mm_productprops
-- ----------------------------
BEGIN;
INSERT INTO `mm_productprops` VALUES (30, 3, 1, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (31, 3, 2, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (32, 3, 3, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (33, 3, 4, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (34, 3, 5, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (35, 3, 6, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (36, 3, 7, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (37, 3, 1, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (38, 3, 2, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (39, 3, 3, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (40, 3, 4, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (41, 3, 5, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (42, 3, 6, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (43, 3, 7, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (44, 4, 1, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (45, 4, 2, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (46, 4, 3, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (47, 4, 4, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (48, 4, 5, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (49, 4, 6, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (50, 4, 7, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (51, 4, 1, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (52, 4, 2, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (53, 4, 3, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (54, 4, 4, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (55, 4, 5, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (56, 4, 6, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (57, 4, 7, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (58, 5, 1, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (59, 5, 2, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (60, 5, 3, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (61, 5, 4, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (62, 5, 5, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (63, 5, 6, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (64, 5, 7, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (65, 5, 1, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (66, 5, 2, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (67, 5, 3, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (68, 5, 4, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (69, 5, 5, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (70, 5, 6, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (71, 5, 7, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (72, 6, 1, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (73, 6, 2, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (74, 6, 3, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (75, 6, 4, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (76, 6, 5, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (77, 6, 6, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (78, 6, 7, '8:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (79, 6, 1, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (80, 6, 2, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (81, 6, 3, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (82, 6, 4, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (83, 6, 5, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (84, 6, 6, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (85, 6, 7, '13:00', 120.00, 1);
INSERT INTO `mm_productprops` VALUES (86, 7, 1, '8:00', 0.01, 1);
INSERT INTO `mm_productprops` VALUES (1475, 10, 2, '8:00', 11.00, 1);
INSERT INTO `mm_productprops` VALUES (1481, 11, 0, 'string', 0.00, 1);
INSERT INTO `mm_productprops` VALUES (1482, 0, 0, 'string', 0.00, 1);
INSERT INTO `mm_productprops` VALUES (1483, 13, 1, '08:30', 1.00, 1);
INSERT INTO `mm_productprops` VALUES (1484, 14, 123, '08:45', 123.00, 1);
INSERT INTO `mm_productprops` VALUES (1485, 14, 123, '09:30', 123.00, 1);
INSERT INTO `mm_productprops` VALUES (1486, 15, 12, '08:30', 12.00, 1);
INSERT INTO `mm_productprops` VALUES (1543, 16, 1, '08:30', 1.00, 1);
COMMIT;

-- ----------------------------
-- Table structure for mm_reply
-- ----------------------------
DROP TABLE IF EXISTS `mm_reply`;
CREATE TABLE `mm_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `adminid` bigint(20) NOT NULL COMMENT '管理员ID',
  `commentid` bigint(20) NOT NULL COMMENT '回复哪条评论',
  `reply` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复内容',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_reply
-- ----------------------------
BEGIN;
INSERT INTO `mm_reply` VALUES (1, 314445437, 1, '哈哈，谢谢评价，下次给你返现', '2019-06-24 14:08:16', '2019-06-24 14:08:16', 1);
INSERT INTO `mm_reply` VALUES (1318, 314445437, 1273, '谢谢亲的支持！', '2019-07-02 23:28:17', '2019-07-12 16:58:26', NULL);
INSERT INTO `mm_reply` VALUES (1500, 314445437, 1304, '谢谢亲的支持！', '2019-07-11 13:12:57', '2019-07-12 16:58:33', NULL);
INSERT INTO `mm_reply` VALUES (1501, 314445437, 1304, '谢谢亲的支持！', '2019-07-11 13:13:03', '2019-07-12 16:58:34', NULL);
INSERT INTO `mm_reply` VALUES (1527, 314445437, 1345, '谢谢亲的支持！', '2019-07-11 21:36:16', '2019-07-12 16:58:35', NULL);
INSERT INTO `mm_reply` VALUES (1528, 314445437, 1345, '谢谢亲的支持！', '2019-07-11 21:36:47', '2019-07-12 16:58:36', NULL);
INSERT INTO `mm_reply` VALUES (1529, 314445437, 1347, '谢谢亲的支持！', '2019-07-11 21:42:51', '2019-07-12 16:58:37', NULL);
INSERT INTO `mm_reply` VALUES (1530, 314445437, 1347, '谢谢亲的支持！', '2019-07-11 23:01:37', '2019-07-12 16:58:39', NULL);
INSERT INTO `mm_reply` VALUES (1532, 314445437, 1359, '谢谢亲的支持！', '2019-07-12 16:05:00', '2019-07-12 16:58:40', NULL);
INSERT INTO `mm_reply` VALUES (1544, 314445437, 1463, '213123', '2019-07-12 19:06:22', '2019-07-12 19:06:22', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mm_sharetemplate
-- ----------------------------
DROP TABLE IF EXISTS `mm_sharetemplate`;
CREATE TABLE `mm_sharetemplate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imgpath` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成分享图片的底图地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='小程序分享页面，分享的图片的模板地址';

-- ----------------------------
-- Records of mm_sharetemplate
-- ----------------------------
BEGIN;
INSERT INTO `mm_sharetemplate` VALUES (6, 'http://image.ruankun.xyz/88986abe81b24ebbd97323a8d3aa05da.jpg');
INSERT INTO `mm_sharetemplate` VALUES (7, 'http://image.ruankun.xyz/ed9898791e3acbe5b9c89ea223680dac.jpg');
INSERT INTO `mm_sharetemplate` VALUES (8, 'http://image.ruankun.xyz/28b6e9d50d1600b080cc4088566cd245.jpg');
INSERT INTO `mm_sharetemplate` VALUES (1474, 'http://image.ruankun.xyz/c6e683149db8e67babfeeb7026cdf8cf.jpg');
COMMIT;

-- ----------------------------
-- Table structure for mm_user
-- ----------------------------
DROP TABLE IF EXISTS `mm_user`;
CREATE TABLE `mm_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `openid` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '小程序openid',
  `name` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `invitor_id` bigint(20) unsigned DEFAULT NULL COMMENT '邀请人ID可以为空',
  `phone` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话号码',
  `avator` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '头像',
  `award` decimal(10,2) unsigned NOT NULL DEFAULT '5.00' COMMENT '每次邀请并下单获得的佣金',
  `integration` decimal(10,0) unsigned NOT NULL DEFAULT '5' COMMENT '每次邀请获得的积分',
  `wxid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信号，用于提现使用',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户基本信息表';

-- ----------------------------
-- Records of mm_user
-- ----------------------------
BEGIN;
INSERT INTO `mm_user` VALUES (2, 'oVibi5NLksGX7bZUr8y0oyIUVMLI', '阮中华', '2019-06-04 22:56:47', 4, NULL, 'http://image.ruankun.xyz/1.png', 1.00, 1, 'ruankun521', '2019-07-10 05:03:03');
INSERT INTO `mm_user` VALUES (16, 'oVy725WKocm3P530rT1J1sVUe8C0', 'MR·SUMMER', '2019-06-26 12:31:03', 111, NULL, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKicT40ibs2TNatKhM5YGTCGM8qM7JEQHELlrmhVWZ1QKC5ESqFq4UToIWEuCXHzaicpgQ8aCTQpQ5AA/132', 1.00, 5, NULL, '2019-06-28 09:46:27');
INSERT INTO `mm_user` VALUES (17, 'oVy725aAJ58_GijL87FqgiqRnFUg', '阮中华', '2019-07-03 15:46:52', NULL, NULL, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKicT40ibs2TNatKhM5YGTCGM8qM7JEQHELlrmhVWZ1QKC5ESqFq4UToIWEuCXHzaicpgQ8aCTQpQ5AA/132', 5.00, 2, NULL, '2019-07-10 04:54:09');
INSERT INTO `mm_user` VALUES (27, 'oVy725SnoqjV76D7Lt8ZYtPhl97o', 'Jason', '2019-06-27 21:09:07', 16, '15280302222', 'https://wx.qlogo.cn/mmopen/vi_32/ibIqkxKWjBgzGOLTd1XxPofNcQh9aSGFxXapWutaEhn8wukqDr2e8wKFORFRsYAvGd7piaEZxajbDFSZm04Jc1Lw/132', 1111.00, 2, 'Jason', '2019-07-10 04:54:05');
INSERT INTO `mm_user` VALUES (45, 'oVy725XAY8TZVWj26k4pnbNdTLFk', 'Eriasan', '2019-07-03 14:05:58', NULL, NULL, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqyNImIJZNghSnXIYzasBR3O3E8bnIX2MqIyqd007sc4jhcia7692CfibsZPkpDOOXibvtUCuxE7nlWw/132', 1.00, 5, NULL, '2019-07-10 04:53:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=1332 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_wallet
-- ----------------------------
BEGIN;
INSERT INTO `mm_wallet` VALUES (1, 2, 5.00, 20, '2019-06-24 14:09:34');
INSERT INTO `mm_wallet` VALUES (2, 16, 1.94, 10000, '2019-07-05 06:32:21');
INSERT INTO `mm_wallet` VALUES (1147, 27, 0.00, 0, '2019-07-04 07:45:21');
INSERT INTO `mm_wallet` VALUES (1148, 17, 8.00, 0, '2019-07-12 04:20:47');
INSERT INTO `mm_wallet` VALUES (1324, 45, 90.00, 0, '2019-07-06 00:42:29');
INSERT INTO `mm_wallet` VALUES (1331, 46, 0.00, 0, '2019-07-03 20:16:08');
COMMIT;

-- ----------------------------
-- Table structure for mm_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `mm_withdraw`;
CREATE TABLE `mm_withdraw` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '究竟是哪个孽畜在提现',
  `recnum` varchar(127) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '记录号唯一标示一个记录',
  `amount` decimal(10,2) unsigned NOT NULL COMMENT '提现金额数',
  `is_confirm` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否提现成功',
  `is_failed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '提现是否失败',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1542 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_withdraw
-- ----------------------------
BEGIN;
INSERT INTO `mm_withdraw` VALUES (1, 16, '', 3.00, 0, 0, '2019-06-27 09:41:09', '2019-06-27 09:41:09');
INSERT INTO `mm_withdraw` VALUES (2, 27, '', 45.20, 0, 0, '2019-06-29 10:20:08', '2019-06-29 10:20:08');
INSERT INTO `mm_withdraw` VALUES (1329, 16, NULL, 3.00, 0, 0, '2019-07-03 01:17:04', '2019-07-03 01:17:04');
INSERT INTO `mm_withdraw` VALUES (1369, 45, '58456189415616575765465', 2.99, 1, 0, '2019-07-03 09:39:27', '2019-07-12 16:59:29');
INSERT INTO `mm_withdraw` VALUES (1376, 27, 'refuse', 0.22, 0, 1, '2019-07-04 07:07:40', '2019-07-04 07:14:08');
INSERT INTO `mm_withdraw` VALUES (1379, 27, '54562166575213246523859', 0.22, 1, 0, '2019-07-04 07:16:27', '2019-07-12 16:59:37');
INSERT INTO `mm_withdraw` VALUES (1381, 27, NULL, 2.78, 0, 0, '2019-07-04 07:45:21', '2019-07-04 07:45:21');
INSERT INTO `mm_withdraw` VALUES (1390, 16, NULL, 0.01, 0, 0, '2019-07-04 21:07:36', '2019-07-04 21:07:36');
INSERT INTO `mm_withdraw` VALUES (1392, 16, NULL, 0.02, 0, 0, '2019-07-04 21:14:55', '2019-07-04 21:14:55');
INSERT INTO `mm_withdraw` VALUES (1401, 16, NULL, 0.03, 0, 0, '2019-07-05 06:32:21', '2019-07-05 06:32:21');
INSERT INTO `mm_withdraw` VALUES (1408, 45, NULL, 1.00, 0, 0, '2019-07-05 22:05:21', '2019-07-05 22:05:21');
INSERT INTO `mm_withdraw` VALUES (1410, 45, NULL, 1.00, 0, 0, '2019-07-05 22:11:00', '2019-07-05 22:11:00');
INSERT INTO `mm_withdraw` VALUES (1412, 45, NULL, 0.01, 0, 0, '2019-07-06 00:34:53', '2019-07-06 00:34:53');
INSERT INTO `mm_withdraw` VALUES (1414, 45, NULL, 2.00, 0, 0, '2019-07-06 00:39:57', '2019-07-06 00:39:57');
INSERT INTO `mm_withdraw` VALUES (1416, 45, NULL, 3.00, 0, 0, '2019-07-06 00:42:29', '2019-07-06 00:42:29');
INSERT INTO `mm_withdraw` VALUES (1541, 17, NULL, 2.00, 0, 0, '2019-07-12 04:20:47', '2019-07-12 04:20:47');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

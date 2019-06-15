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

 Date: 15/06/2019 18:37:45
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
INSERT INTO `hibernate_sequence` VALUES (1049);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_addr
-- ----------------------------
BEGIN;
INSERT INTO `mm_addr` VALUES (2, 2, '中国', '四川', '雅安', '四川农业大学', '2019-06-10 23:14:47', '2019-06-10 23:14:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=314445438 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_admin
-- ----------------------------
BEGIN;
INSERT INTO `mm_admin` VALUES (314445437, 'admin', '689a7f41007215efcd7662de263812ef', 0);
COMMIT;

-- ----------------------------
-- Table structure for mm_announcement
-- ----------------------------
DROP TABLE IF EXISTS `mm_announcement`;
CREATE TABLE `mm_announcement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_announcement
-- ----------------------------
BEGIN;
INSERT INTO `mm_announcement` VALUES (1, '12', '33d', '2019-06-13 14:30:53', '2019-06-13 14:30:47');
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
  `item_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of mm_comment
-- ----------------------------
BEGIN;
INSERT INTO `mm_comment` VALUES (1, 43, 1, 4, '哈哈，还不错，骚的挺干净的', NULL, NULL, NULL, '2019-06-12 21:54:53', '2019-06-12 21:54:53', 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mm_commissionrecord
-- ----------------------------
DROP TABLE IF EXISTS `mm_commissionrecord`;
CREATE TABLE `mm_commissionrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `amount` decimal(10,0) unsigned NOT NULL COMMENT '佣金数量',
  `is_save` tinyint(1) unsigned NOT NULL COMMENT '1-存入佣金,0-消费佣金',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='佣金记录表';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='积分记录';

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='优惠券';

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
) ENGINE=InnoDB AUTO_INCREMENT=1049 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='优惠券的兑换码';

-- ----------------------------
-- Records of mm_decouponcdkey
-- ----------------------------
BEGIN;
INSERT INTO `mm_decouponcdkey` VALUES (16, '24412852877eec5e2140ef33180cdeac', '2019-06-14 22:21:54', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (17, '71699937d9535c03c4afbd5f95fac3b1', '2019-06-14 22:21:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (18, '5650c9cd1d1bb5c1251080a541554960', '2019-06-14 22:22:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (19, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (20, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (21, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (22, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (23, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (24, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (25, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (26, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (27, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:55', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (28, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (29, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (30, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (31, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (32, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (33, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (34, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (35, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (36, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (37, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (38, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (39, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (40, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (41, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (42, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (43, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (44, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (45, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (46, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (47, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (48, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (49, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (50, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (51, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (52, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (53, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (54, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (55, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (56, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (57, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (58, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (59, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (60, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (61, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (62, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (63, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (64, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (65, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (66, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (67, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (68, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (69, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (70, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (71, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (72, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (73, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (74, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (75, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (76, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (77, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (78, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (79, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (80, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (81, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (82, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (83, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (84, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (85, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (86, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (87, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:56', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (88, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (89, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (90, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (91, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (92, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (93, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (94, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (95, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (96, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (97, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (98, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (99, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (100, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (101, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (102, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (103, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (104, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (105, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (106, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (107, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (108, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (109, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (110, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (111, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (112, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (113, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (114, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (115, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (116, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (117, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (118, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (119, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (120, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (121, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (122, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (123, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (124, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (125, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (126, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (127, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (128, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (129, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (130, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (131, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (132, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (133, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (134, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (135, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (136, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (137, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (138, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (139, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (140, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (141, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (142, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (143, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (144, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (145, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (146, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (147, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:57', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (148, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (149, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (150, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (151, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (152, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (153, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (154, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (155, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (156, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (157, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (158, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (159, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (160, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (161, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (162, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (163, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (164, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (165, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (166, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (167, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (168, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (169, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (170, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (171, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (172, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (173, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (174, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (175, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (176, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (177, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (178, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (179, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (180, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (181, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (182, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (183, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (184, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (185, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (186, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (187, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (188, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (189, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (190, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (191, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (192, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (193, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (194, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (195, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (196, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (197, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (198, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (199, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (200, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (201, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (202, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (203, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (204, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (205, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (206, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (207, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:58', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (208, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (209, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (210, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (211, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (212, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (213, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (214, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (215, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (216, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (217, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (218, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (219, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (220, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (221, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (222, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (223, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (224, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (225, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (226, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (227, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (228, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (229, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (230, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (231, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (232, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (233, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (234, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (235, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (236, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (237, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (238, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (239, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (240, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (241, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (242, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (243, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (244, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (245, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (246, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (247, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (248, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (249, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (250, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (251, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (252, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (253, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (254, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (255, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (256, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (257, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (258, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (259, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (260, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (261, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (262, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (263, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (264, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (265, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (266, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (267, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:23:59', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (268, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (269, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (270, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (271, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (272, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (273, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (274, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (275, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (276, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (277, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (278, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (279, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (280, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (281, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (282, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (283, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (284, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (285, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (286, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (287, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (288, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (289, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (290, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (291, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (292, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (293, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (294, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (295, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (296, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (297, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (298, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (299, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (300, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (301, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (302, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (303, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (304, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (305, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (306, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (307, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (308, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (309, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (310, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (311, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (312, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (313, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (314, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (315, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (316, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (317, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (318, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (319, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (320, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (321, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (322, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (323, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (324, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (325, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (326, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (327, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:00', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (328, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (329, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (330, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (331, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (332, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (333, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (334, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (335, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (336, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (337, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (338, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (339, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (340, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (341, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (342, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (343, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (344, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (345, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (346, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (347, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (348, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (349, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (350, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (351, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (352, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (353, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (354, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (355, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (356, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (357, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (358, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (359, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (360, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (361, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (362, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (363, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (364, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (365, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (366, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (367, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (368, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (369, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (370, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (371, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (372, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (373, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (374, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (375, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (376, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (377, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (378, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (379, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (380, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (381, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (382, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (383, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (384, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (385, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (386, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (387, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (388, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:01', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (389, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (390, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (391, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (392, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (393, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (394, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (395, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (396, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (397, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (398, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (399, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (400, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (401, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (402, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (403, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (404, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (405, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (406, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (407, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (408, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (409, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (410, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (411, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (412, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (413, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (414, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (415, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (416, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (417, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (418, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (419, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (420, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (421, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (422, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (423, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (424, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (425, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (426, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (427, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (428, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (429, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (430, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (431, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (432, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (433, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (434, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (435, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (436, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (437, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (438, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (439, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (440, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (441, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (442, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (443, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (444, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (445, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (446, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (447, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (448, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:02', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (449, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (450, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (451, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (452, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (453, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (454, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (455, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (456, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (457, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (458, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (459, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (460, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (461, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (462, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (463, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (464, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (465, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (466, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (467, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (468, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (469, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (470, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (471, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (472, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (473, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (474, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (475, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (476, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (477, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (478, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (479, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (480, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (481, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (482, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (483, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (484, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (485, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (486, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (487, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (488, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (489, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (490, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (491, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (492, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (493, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (494, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (495, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (496, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (497, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (498, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (499, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (500, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (501, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (502, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (503, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (504, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (505, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (506, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (507, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (508, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:03', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (509, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (510, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (511, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (512, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (513, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (514, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (515, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (516, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (517, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (518, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (519, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (520, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (521, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (522, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (523, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (524, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (525, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (526, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (527, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (528, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (529, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (530, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (531, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (532, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (533, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (534, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (535, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (536, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (537, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (538, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (539, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (540, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (541, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (542, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (543, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (544, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (545, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (546, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (547, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (548, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (549, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (550, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (551, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (552, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (553, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (554, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (555, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (556, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (557, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (558, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (559, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (560, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (561, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (562, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (563, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (564, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (565, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (566, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (567, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (568, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:04', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (569, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (570, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (571, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (572, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (573, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (574, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (575, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (576, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (577, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (578, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (579, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (580, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (581, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (582, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (583, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (584, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (585, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (586, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (587, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (588, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (589, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (590, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (591, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (592, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (593, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (594, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (595, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (596, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (597, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (598, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (599, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (600, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (601, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (602, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (603, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (604, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (605, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (606, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (607, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (608, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (609, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (610, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (611, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (612, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (613, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (614, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (615, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (616, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (617, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (618, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (619, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (620, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (621, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (622, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (623, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (624, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (625, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (626, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (627, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (628, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (629, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (630, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:05', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (631, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (632, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (633, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (634, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (635, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (636, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (637, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (638, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (639, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (640, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (641, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (642, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (643, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (644, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (645, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (646, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (647, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (648, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (649, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (650, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (651, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (652, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (653, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (654, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (655, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (656, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (657, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (658, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (659, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (660, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (661, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (662, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (663, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (664, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (665, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (666, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (667, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (668, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (669, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (670, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (671, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (672, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (673, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (674, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (675, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (676, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (677, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (678, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (679, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (680, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (681, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (682, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (683, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (684, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (685, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (686, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (687, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (688, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (689, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (690, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:06', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (691, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (692, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (693, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (694, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (695, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (696, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (697, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (698, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (699, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (700, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (701, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (702, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (703, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (704, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (705, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (706, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (707, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (708, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (709, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (710, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (711, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (712, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (713, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (714, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (715, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (716, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (717, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (718, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (719, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (720, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (721, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (722, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (723, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (724, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (725, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (726, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (727, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (728, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (729, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (730, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (731, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (732, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (733, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (734, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (735, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (736, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (737, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (738, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (739, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (740, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (741, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (742, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (743, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (744, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (745, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (746, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (747, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (748, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (749, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (750, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (751, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (752, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:07', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (753, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (754, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (755, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (756, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (757, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (758, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (759, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (760, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (761, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (762, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (763, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (764, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (765, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (766, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (767, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (768, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (769, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (770, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (771, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (772, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (773, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (774, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (775, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (776, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (777, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (778, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (779, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (780, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (781, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (782, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (783, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (784, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (785, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (786, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (787, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (788, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (789, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (790, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (791, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (792, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (793, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (794, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (795, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (796, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (797, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (798, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (799, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (800, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (801, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (802, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (803, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (804, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (805, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (806, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (807, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (808, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (809, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (810, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (811, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (812, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (813, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (814, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:08', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (815, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (816, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (817, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (818, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (819, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (820, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (821, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (822, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (823, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (824, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (825, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (826, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (827, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (828, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (829, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (830, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (831, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (832, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (833, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (834, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (835, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (836, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (837, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (838, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (839, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (840, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (841, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (842, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (843, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (844, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (845, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (846, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (847, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (848, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (849, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (850, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (851, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (852, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (853, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (854, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (855, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (856, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (857, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (858, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (859, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (860, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (861, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (862, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (863, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (864, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (865, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (866, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (867, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (868, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (869, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (870, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (871, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (872, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (873, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (874, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:09', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (875, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (876, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (877, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (878, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (879, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (880, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (881, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (882, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (883, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (884, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (885, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (886, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (887, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (888, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (889, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (890, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (891, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (892, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (893, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (894, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (895, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (896, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (897, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (898, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (899, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (900, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (901, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (902, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (903, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (904, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (905, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (906, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (907, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (908, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (909, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (910, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (911, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (912, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (913, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (914, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (915, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (916, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (917, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (918, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (919, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (920, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (921, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (922, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (923, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (924, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (925, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (926, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (927, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (928, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (929, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (930, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (931, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (932, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (933, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (934, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (935, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (936, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:10', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (937, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (938, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (939, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (940, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (941, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (942, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (943, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (944, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (945, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (946, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (947, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (948, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (949, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (950, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (951, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (952, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (953, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (954, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (955, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (956, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (957, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (958, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (959, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (960, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (961, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (962, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (963, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (964, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (965, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (966, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (967, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (968, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (969, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (970, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (971, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (972, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (973, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (974, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (975, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (976, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (977, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (978, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (979, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (980, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (981, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (982, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (983, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (984, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (985, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (986, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (987, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (988, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (989, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (990, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (991, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (992, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (993, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (994, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (995, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (996, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (997, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (998, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:11', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (999, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1000, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1001, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1002, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1003, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1004, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1005, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1006, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1007, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1008, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1009, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1010, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1011, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1012, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1013, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1014, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
INSERT INTO `mm_decouponcdkey` VALUES (1015, 'a6abccb798d8879e3e396a45578e1928', '2019-06-14 22:24:12', '2019-06-15 22:11:58', 0, 0, 1000.00, 100.00);
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
  `productid` bigint(20) NOT NULL COMMENT '产品ID',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `is_visible` tinyint(2) NOT NULL COMMENT '是否可被前端检索',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `is_visible` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='主页banner的数据信息';

-- ----------------------------
-- Records of mm_index_banner
-- ----------------------------
BEGIN;
INSERT INTO `mm_index_banner` VALUES (1, 'http://image.ruankun.xyz/31291f79c353f5c2ac334c85ee482344.jpg', 1, '2019-06-09 14:24:03', '2019-06-09 14:54:14', 1);
INSERT INTO `mm_index_banner` VALUES (2, 'http://image.ruankun.xyz/31291f79c353f5c2ac334c85ee482344.jpg', 1, '2019-06-09 14:36:29', '2019-06-09 14:54:14', 1);
INSERT INTO `mm_index_banner` VALUES (11, 'http://image.ruankun.xyz/221e632a5ccf3fb9453e5d77e9a36455.jpg', 1, '2019-06-09 15:55:03', '2019-06-09 15:55:03', 1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='主页推荐';

-- ----------------------------
-- Table structure for mm_item
-- ----------------------------
DROP TABLE IF EXISTS `mm_item`;
CREATE TABLE `mm_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productid` bigint(20) unsigned NOT NULL COMMENT '产品id',
  `productpropsid` bigint(20) unsigned NOT NULL COMMENT '产品规格id',
  `quantity` int(10) unsigned NOT NULL COMMENT '数量',
  `orderid` varchar(0) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号，只有生成订单后才有效，否则该字段无效',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='item表，表示购物车，购物车里面的每一件物品都是item，当生成订单时，item中的订单号就不为空了。表示item从购物车移除，到了订单中';

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='产品规格';

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
  `admin_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for mm_sharetemplate
-- ----------------------------
DROP TABLE IF EXISTS `mm_sharetemplate`;
CREATE TABLE `mm_sharetemplate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imgpath` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成分享图片的底图地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='小程序分享页面，分享的图片的模板地址';

-- ----------------------------
-- Records of mm_sharetemplate
-- ----------------------------
BEGIN;
INSERT INTO `mm_sharetemplate` VALUES (5, 'http://image.ruankun.xyz/31291f79c353f5c2ac334c85ee482344.jpg');
INSERT INTO `mm_sharetemplate` VALUES (6, 'http://image.ruankun.xyz/3965090422abd1b3c40c299a2bbfdae8.jpg');
INSERT INTO `mm_sharetemplate` VALUES (7, 'http://image.ruankun.xyz/b6c2e1c7f6ff132c7840a94f24ad3cc8.jpg');
INSERT INTO `mm_sharetemplate` VALUES (8, 'http://image.ruankun.xyz/28b6e9d50d1600b080cc4088566cd245.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户基本信息表';

-- ----------------------------
-- Records of mm_user
-- ----------------------------
BEGIN;
INSERT INTO `mm_user` VALUES (2, 'oVibi5NLksGX7bZUr8y0oyIUVMLI', '阮中华', '2019-06-04 22:56:47', 4, NULL, 'http://image.ruankun.xyz/1.png', 5.00, 5, NULL, '2019-06-04 22:56:47');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

SET FOREIGN_KEY_CHECKS = 1;

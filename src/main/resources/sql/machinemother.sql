/*
 Navicat MySQL Data Transfer

 Source Server         : 45.40.193.214
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : 45.40.193.214:3306
 Source Schema         : machinemother

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 07/06/2019 19:18:19
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
INSERT INTO `hibernate_sequence` VALUES (1);
COMMIT;

-- ----------------------------
-- Table structure for mm_ announcement
-- ----------------------------
DROP TABLE IF EXISTS `mm_ announcement`;
CREATE TABLE `mm_ announcement` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告内容',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for mm_commissionrecord
-- ----------------------------
DROP TABLE IF EXISTS `mm_commissionrecord`;
CREATE TABLE `mm_commissionrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户id',
  `amount` decimal(10,0) unsigned NOT NULL COMMENT '佣金数量',
  `is_save` tinyint(2) unsigned NOT NULL COMMENT '1-存入佣金,0-消费佣金',
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
  `is_save` tinyint(2) unsigned NOT NULL COMMENT '是否存入积分1是，0消费',
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
  `is_used` tinyint(2) unsigned NOT NULL COMMENT '状态，0未使用，1已使用',
  `is_past` tinyint(2) unsigned NOT NULL COMMENT '是否过期，0未过期，1已过期',
  `min` decimal(10,2) unsigned NOT NULL COMMENT '使用最低额',
  `worth` decimal(10,2) unsigned NOT NULL COMMENT '优惠券额度',
  `is_fromexchange` tinyint(2) unsigned NOT NULL COMMENT '是否是兑换得到优惠券获得来源,0:领取,1:兑换',
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
  `is_exchanged` tinyint(2) unsigned NOT NULL COMMENT '是否兑换，0未兑换，1已兑换',
  `is_past` tinyint(2) unsigned NOT NULL COMMENT '是否已过期',
  `min` decimal(10,2) unsigned NOT NULL COMMENT '使用最低额度',
  `worth` decimal(10,2) unsigned NOT NULL COMMENT '优惠券额度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='优惠券的兑换码';

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
  `is_visible` tinyint(2) unsigned NOT NULL COMMENT '是否可见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='主页banner的数据信息';

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
  `producttypeid` bigint(20) unsigned NOT NULL COMMENT '产品规格id',
  `quantity` decimal(10,0) unsigned NOT NULL COMMENT '数量',
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
  `is_paid` tinyint(2) unsigned NOT NULL COMMENT '是否已经支付,0未支付,1已支付',
  `is_finished` tinyint(2) unsigned NOT NULL COMMENT '是否已完成，后台判断了密码后，才应该确认更改此字段',
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
  `is_used` tinyint(2) unsigned NOT NULL COMMENT '是否被使用',
  `employee` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单完成员工,该字段应该在订单finish之后填入',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='小程序分享页面，分享的图片的模板地址';

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

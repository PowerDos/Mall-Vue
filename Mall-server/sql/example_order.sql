/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.205.112
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 47.101.205.112:3306
 Source Schema         : example_order

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 22/06/2020 17:28:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for example_order
-- ----------------------------
DROP TABLE IF EXISTS `example_order`;
CREATE TABLE `example_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `order_detail_id_list` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单商品详情',
  `total_price` int(11) NULL DEFAULT NULL COMMENT '订单总价（分）',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `vision` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for example_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `example_order_detail`;
CREATE TABLE `example_order_detail`  (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `specs_id` int(11) NULL DEFAULT NULL COMMENT '商品规格id',
  `count` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `price` int(11) NULL DEFAULT NULL COMMENT '商品单价（分）',
  PRIMARY KEY (`order_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for example_pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `example_pay_channel`;
CREATE TABLE `example_pay_channel`  (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付渠道名',
  `channel_bean` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付渠道beanid',
  `app_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'appId',
  `public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '渠道公钥',
  `platform_public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '平台公钥',
  `private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '渠道私钥',
  `statue` tinyint(1) NULL DEFAULT NULL COMMENT '激活状态 0：激活 1：未启用',
  `vision` int(11) NULL DEFAULT NULL COMMENT '乐观锁版本',
  `created_by` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` datetime(0) NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新日期',
  PRIMARY KEY (`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for example_pay_transaction
-- ----------------------------
DROP TABLE IF EXISTS `example_pay_transaction`;
CREATE TABLE `example_pay_transaction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) NULL DEFAULT NULL COMMENT '交易流水号',
  `pay_amount` int(11) NULL DEFAULT NULL COMMENT '实付金额 单位分',
  `pay_statue` tinyint(1) NULL DEFAULT NULL COMMENT '交易状态 0：交易成功 1：待付款  2：取消支付 3：交易失败 4：待验证是否成功',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单id',
  `channel_id` int(11) NULL DEFAULT NULL COMMENT '支付使用的渠道id',
  `third_part_transaction_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方支付流水号',
  `vision` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易记录表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;

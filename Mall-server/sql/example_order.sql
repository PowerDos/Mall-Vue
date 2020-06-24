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

 Date: 24/06/2020 16:30:47
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
-- Records of example_order
-- ----------------------------
INSERT INTO `example_order` VALUES (1, 1, '1', 30000, NULL, 1, 'admin', '2020-04-22 08:31:43', NULL, NULL);
INSERT INTO `example_order` VALUES (2, 1, '2', 119900, NULL, 1, 'admin', '2020-04-30 05:28:26', NULL, NULL);
INSERT INTO `example_order` VALUES (3, 1, '3', 219900, NULL, 1, 'admin', '2020-05-10 07:13:47', NULL, NULL);
INSERT INTO `example_order` VALUES (4, 1, '4', 219900, NULL, 1, 'admin', '2020-05-10 07:15:21', NULL, NULL);
INSERT INTO `example_order` VALUES (5, 1, '5', 129900, NULL, 1, 'admin', '2020-05-10 07:17:32', NULL, NULL);
INSERT INTO `example_order` VALUES (6, 1, '6', 129900, NULL, 1, 'admin', '2020-05-10 07:18:01', NULL, NULL);
INSERT INTO `example_order` VALUES (7, 1, '7', 124700, NULL, 1, 'admin', '2020-05-10 07:19:03', NULL, NULL);
INSERT INTO `example_order` VALUES (8, 1, '8', 124700, NULL, 1, 'admin', '2020-05-10 07:19:32', NULL, NULL);
INSERT INTO `example_order` VALUES (9, 1, '9', 124700, NULL, 1, 'admin', '2020-05-10 07:19:39', NULL, NULL);
INSERT INTO `example_order` VALUES (10, 1, '10', 349900, NULL, 1, 'admin', '2020-05-10 07:32:39', NULL, NULL);
INSERT INTO `example_order` VALUES (11, 1, '11', 349900, NULL, 1, 'admin', '2020-05-10 07:33:44', NULL, NULL);
INSERT INTO `example_order` VALUES (12, 1, '13', 82900, NULL, 1, 'admin', '2020-05-10 07:42:01', NULL, NULL);
INSERT INTO `example_order` VALUES (13, 1, '14', 82900, NULL, 1, 'admin', '2020-05-10 07:42:25', NULL, NULL);
INSERT INTO `example_order` VALUES (14, 1, '15', 82900, NULL, 1, 'admin', '2020-05-10 07:42:51', NULL, NULL);
INSERT INTO `example_order` VALUES (15, 1, '16', 83000, NULL, 1, 'admin', '2020-05-10 07:49:49', NULL, NULL);
INSERT INTO `example_order` VALUES (16, 1, '17', 83000, NULL, 1, 'admin', '2020-05-10 07:49:55', NULL, NULL);
INSERT INTO `example_order` VALUES (17, 1, '18', 119900, NULL, 1, 'admin', '2020-05-10 08:18:21', NULL, NULL);
INSERT INTO `example_order` VALUES (18, 1, '19', 119900, NULL, 1, 'admin', '2020-05-10 08:18:46', NULL, NULL);
INSERT INTO `example_order` VALUES (19, 1, '20', 119900, NULL, 1, 'admin', '2020-05-10 08:19:25', NULL, NULL);
INSERT INTO `example_order` VALUES (20, 1, '22', 38800, NULL, 1, 'admin', '2020-05-10 08:29:26', NULL, NULL);
INSERT INTO `example_order` VALUES (21, 1, '23', 38800, NULL, 1, 'admin', '2020-05-10 08:32:49', NULL, NULL);
INSERT INTO `example_order` VALUES (22, 1, '26', 38800, NULL, 1, 'admin', '2020-05-10 08:37:46', NULL, NULL);
INSERT INTO `example_order` VALUES (23, 1, '27', 38800, NULL, 1, 'admin', '2020-05-10 08:42:17', NULL, NULL);
INSERT INTO `example_order` VALUES (24, 1, '28', 38800, NULL, 1, 'admin', '2020-05-10 08:43:20', NULL, NULL);

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
-- Records of example_order_detail
-- ----------------------------
INSERT INTO `example_order_detail` VALUES (1, 1, 1, 1, 30000);
INSERT INTO `example_order_detail` VALUES (2, 2, 5, 1, 119900);
INSERT INTO `example_order_detail` VALUES (3, 8, 24, 1, 219900);
INSERT INTO `example_order_detail` VALUES (4, 8, 24, 1, 219900);
INSERT INTO `example_order_detail` VALUES (5, 2, 6, 1, 129900);
INSERT INTO `example_order_detail` VALUES (6, 2, 6, 1, 129900);
INSERT INTO `example_order_detail` VALUES (7, 3, 12, 1, 124700);
INSERT INTO `example_order_detail` VALUES (8, 3, 12, 1, 124700);
INSERT INTO `example_order_detail` VALUES (9, 3, 12, 1, 124700);
INSERT INTO `example_order_detail` VALUES (10, 3, 10, 1, 349900);
INSERT INTO `example_order_detail` VALUES (11, 3, 10, 1, 349900);
INSERT INTO `example_order_detail` VALUES (13, 7, 20, 1, 82900);
INSERT INTO `example_order_detail` VALUES (14, 7, 20, 1, 82900);
INSERT INTO `example_order_detail` VALUES (15, 7, 20, 1, 82900);
INSERT INTO `example_order_detail` VALUES (16, 6, 19, 1, 83000);
INSERT INTO `example_order_detail` VALUES (17, 6, 19, 1, 83000);
INSERT INTO `example_order_detail` VALUES (18, 2, 5, 1, 119900);
INSERT INTO `example_order_detail` VALUES (19, 2, 5, 1, 119900);
INSERT INTO `example_order_detail` VALUES (20, 2, 5, 1, 119900);
INSERT INTO `example_order_detail` VALUES (22, 1, 1, 1, 38800);
INSERT INTO `example_order_detail` VALUES (23, 1, 1, 1, 38800);
INSERT INTO `example_order_detail` VALUES (26, 1, 1, 1, 38800);
INSERT INTO `example_order_detail` VALUES (27, 1, 1, 1, 38800);
INSERT INTO `example_order_detail` VALUES (28, 1, 1, 1, 38800);

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
-- Records of example_pay_channel
-- ----------------------------
INSERT INTO `example_pay_channel` VALUES (1, '支付宝沙箱环境', 'aliPayTest', '2016102300747468', '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', 0, 1, 'admin', '2020-04-11 16:34:46', NULL, NULL);

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

-- ----------------------------
-- Records of example_pay_transaction
-- ----------------------------
INSERT INTO `example_pay_transaction` VALUES (1, 412856638085664768, 30000, 1, 1, 1, 1, NULL, 1, 'admin', '2020-04-22 08:31:43', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (2, 415709615297269760, 119900, 0, 1, 2, 1, '2020043022001402450501215644', 1, 'admin', '2020-04-30 05:28:26', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (3, 419360005129637888, 219900, 1, 1, 3, 1, NULL, 1, 'admin', '2020-05-10 07:13:47', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (4, 419360401583640576, 219900, 1, 1, 4, 1, NULL, 1, 'admin', '2020-05-10 07:15:21', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (5, 419360949389103104, 129900, 1, 1, 5, 1, NULL, 1, 'admin', '2020-05-10 07:17:32', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (6, 419361070940033024, 129900, 1, 1, 6, 1, NULL, 1, 'admin', '2020-05-10 07:18:01', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (7, 419361329711812608, 124700, 1, 1, 7, 1, NULL, 1, 'admin', '2020-05-10 07:19:03', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (8, 419361451782836224, 124700, 1, 1, 8, 1, NULL, 1, 'admin', '2020-05-10 07:19:32', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (9, 419361481918910464, 124700, 1, 1, 9, 1, NULL, 1, 'admin', '2020-05-10 07:19:39', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (10, 419364753832546304, 349900, 1, 1, 10, 1, NULL, 1, 'admin', '2020-05-10 07:32:39', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (11, 419365026357448704, 349900, 1, 1, 11, 1, NULL, 1, 'admin', '2020-05-10 07:33:44', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (12, 419367112428097536, 82900, 1, 1, 12, 1, NULL, 1, 'admin', '2020-05-10 07:42:01', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (13, 419367212793597952, 82900, 1, 1, 13, 1, NULL, 1, 'admin', '2020-05-10 07:42:25', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (14, 419367321212162048, 82900, 1, 1, 14, 1, NULL, 1, 'admin', '2020-05-10 07:42:51', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (15, 419369073625927680, 83000, 1, 1, 15, 1, NULL, 1, 'admin', '2020-05-10 07:49:49', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (16, 419369099165044736, 83000, 1, 1, 16, 1, NULL, 1, 'admin', '2020-05-10 07:49:55', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (17, 419376255025156096, 119900, 1, 1, 17, 1, NULL, 1, 'admin', '2020-05-10 08:18:21', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (18, 419376361178796032, 119900, 1, 1, 18, 1, NULL, 1, 'admin', '2020-05-10 08:18:46', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (19, 419376522500116480, 119900, 4, 1, 19, 1, '2020051022001402450501221850', 1, 'admin', '2020-05-10 08:19:25', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (20, 419379042953859072, 38800, 4, 1, 20, 1, '2020051022001402450501222342', 1, 'admin', '2020-05-10 08:29:26', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (21, 419379895739748352, 38800, 4, 1, 21, 1, '2020051022001402450501222180', 1, 'admin', '2020-05-10 08:32:49', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (22, 419381141288652800, 38800, 4, 1, 22, 1, '2020051022001402450501221851', 1, 'admin', '2020-05-10 08:37:46', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (23, 419382279572426752, 38800, 0, 1, 23, 1, '2020051022001402450501221852', 1, 'admin', '2020-05-10 08:42:17', NULL, NULL);
INSERT INTO `example_pay_transaction` VALUES (24, 419382543725498368, 38800, 0, 1, 24, 1, '2020051022001402450501222183', 1, 'admin', '2020-05-10 08:43:20', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

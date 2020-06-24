/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.205.112
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 47.101.205.112:3306
 Source Schema         : example_shop

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 24/06/2020 16:31:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for example_shop
-- ----------------------------
DROP TABLE IF EXISTS `example_shop`;
CREATE TABLE `example_shop`  (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hot_goods_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_shop
-- ----------------------------
INSERT INTO `example_shop` VALUES (1, '奥克斯百润专卖店', '1');
INSERT INTO `example_shop` VALUES (2, '海尔官方旗舰店', '1');
INSERT INTO `example_shop` VALUES (3, '美的专卖店', '1');
INSERT INTO `example_shop` VALUES (4, '海尔统帅旗舰店', '1');
INSERT INTO `example_shop` VALUES (5, '美的冰箱旗舰店', '1');
INSERT INTO `example_shop` VALUES (6, '长虹洗衣机专卖店', '1');
INSERT INTO `example_shop` VALUES (7, '美的洗衣机旗舰店', '1');
INSERT INTO `example_shop` VALUES (8, '小米官方旗舰店', '1');
INSERT INTO `example_shop` VALUES (9, '小天鹅官方旗舰店', '1');
INSERT INTO `example_shop` VALUES (10, '西门子销售专卖店', '1');

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.205.112
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 47.101.205.112:3306
 Source Schema         : example_seckill

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 24/06/2020 16:31:04
*/
CREATE DATABASE
IF
	NOT EXISTS example_seckill DEFAULT CHARACTER
	SET utf8 DEFAULT COLLATE utf8_general_ci;

use example_seckill;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for example_seckill
-- ----------------------------
DROP TABLE IF EXISTS `example_seckill`;
CREATE TABLE `example_seckill`  (
  `seckill_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '秒杀活动id',
  `seckill_good_id` int(11) NULL DEFAULT NULL COMMENT '秒杀活动商品id',
  `stock` int(11) NULL DEFAULT NULL COMMENT '参与秒杀的数量',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '秒杀开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '秒杀结束时间',
  `vision` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`seckill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example_seckill
-- ----------------------------
INSERT INTO `example_seckill` VALUES (1, 1, 27, '2020-04-20 16:59:42', '2020-05-20 17:59:59', 4, NULL, NULL);
INSERT INTO `example_seckill` VALUES (2, 2, 30, '2020-04-20 16:59:42', '2020-04-20 17:59:59', 1, NULL, NULL);
INSERT INTO `example_seckill` VALUES (3, 3, 30, '2020-04-20 16:59:42', '2020-04-20 17:59:59', 1, NULL, NULL);
INSERT INTO `example_seckill` VALUES (4, 4, 30, '2020-04-20 16:59:42', '2020-04-20 17:59:59', 1, NULL, NULL);
INSERT INTO `example_seckill` VALUES (5, 5, 30, '2020-04-20 15:59:54', '2020-04-20 17:59:59', 1, NULL, NULL);

-- ----------------------------
-- Table structure for example_seckill_good
-- ----------------------------
DROP TABLE IF EXISTS `example_seckill_good`;
CREATE TABLE `example_seckill_good`  (
  `seckill_good_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL COMMENT '秒杀的商品id',
  `specs_id` int(11) NULL DEFAULT NULL COMMENT '秒杀的商品规格id',
  `intro` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动页面商品介绍',
  `img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动页面图片地址',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '秒杀价（元）',
  `real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价（元）',
  PRIMARY KEY (`seckill_good_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example_seckill_good
-- ----------------------------
INSERT INTO `example_seckill_good` VALUES (1, 1, 1, '奥克斯家用电冰箱 35升银色35K118L', 'static/img/goodsList/1.jpg', 300.00, 388.00);
INSERT INTO `example_seckill_good` VALUES (2, 1, 2, '奥克斯家用电冰箱 50升银色A款50K128L', 'static/img/goodsList/1.jpg', 400.00, 448.00);
INSERT INTO `example_seckill_good` VALUES (3, 2, 5, '海尔三门小型家用节能冰箱', 'static/img/goodsList/2.jpg', 1000.00, 1199.00);
INSERT INTO `example_seckill_good` VALUES (4, 2, 6, '海尔三门小型家用节能冰箱', 'static/img/goodsList/2.jpg', 1100.00, 1299.00);
INSERT INTO `example_seckill_good` VALUES (5, 2, 7, '海尔三门小型家用节能冰箱', 'static/img/goodsList/2.jpg', 1100.00, 1299.00);

SET FOREIGN_KEY_CHECKS = 1;

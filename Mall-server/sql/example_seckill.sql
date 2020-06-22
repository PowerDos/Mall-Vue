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

 Date: 22/06/2020 17:28:20
*/

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

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.205.112
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 47.101.205.112:3306
 Source Schema         : example_remarks

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 22/06/2020 17:28:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for example_remark_detail
-- ----------------------------
DROP TABLE IF EXISTS `example_remark_detail`;
CREATE TABLE `example_remark_detail`  (
  `remark_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论信息id',
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价人',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '评论人id',
  `values` int(2) NULL DEFAULT NULL COMMENT '评分（5分制）',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `goods` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买商品的规格信息',
  `goods_product_id` int(11) NULL DEFAULT NULL COMMENT '购买的商品id',
  `goods_specs_id` int(11) NULL DEFAULT NULL COMMENT '购买的商品规格id',
  `create_at` datetime(0) NULL DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`remark_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for example_remark_tag
-- ----------------------------
DROP TABLE IF EXISTS `example_remark_tag`;
CREATE TABLE `example_remark_tag`  (
  `remark_tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论标签id',
  `content` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`remark_tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评价关键词表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for example_remarks
-- ----------------------------
DROP TABLE IF EXISTS `example_remarks`;
CREATE TABLE `example_remarks`  (
  `remarks_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品评价id',
  `good_analyse` float(2, 0) NULL DEFAULT NULL COMMENT '好评率',
  `remarks_tag_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价标签id集合',
  `add_remarks_num` int(11) NULL DEFAULT NULL COMMENT '追评数量',
  `good_remarks_num` int(11) NULL DEFAULT NULL COMMENT '好评数量',
  `mid_remarks_num` int(11) NULL DEFAULT NULL COMMENT '中评数量',
  `bad_remarks_num` int(11) NULL DEFAULT NULL COMMENT '差评数量',
  `remarks_detail_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价信息id集合',
  PRIMARY KEY (`remarks_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;

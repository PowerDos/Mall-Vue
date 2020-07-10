/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.205.112
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 47.101.205.112:3306
 Source Schema         : example_goods

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 24/06/2020 16:30:24
*/
CREATE DATABASE
IF
	NOT EXISTS example_goods DEFAULT CHARACTER
	SET utf8 DEFAULT COLLATE utf8_general_ci;

use example_goods;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for example_attribute_key
-- ----------------------------
DROP TABLE IF EXISTS `example_attribute_key`;
CREATE TABLE `example_attribute_key`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `attribute_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性名称',
  `name_sort` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称排序',
  `revision` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格Key表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_attribute_key
-- ----------------------------
INSERT INTO `example_attribute_key` VALUES (1, 8, '品牌', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (2, 8, '箱门结构', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (3, 8, '总容量范围', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (4, 9, '品牌', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (5, 9, '洗衣程序', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (6, 9, '能效等级', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (7, 9, '电机类型', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (12, 10, '品牌', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (13, 10, '电视类型', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (14, 10, '分辨率', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (15, 46, '品牌', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (16, 46, '温控方式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (17, 46, '控制方式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (18, 47, '品牌', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (19, 47, '烹饪方式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_key` VALUES (20, 47, '开门方式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);

-- ----------------------------
-- Table structure for example_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `example_attribute_value`;
CREATE TABLE `example_attribute_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `attribute_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性ID',
  `attribute_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性值',
  `value_sort` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值排序',
  `revision` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_attribute_value
-- ----------------------------
INSERT INTO `example_attribute_value` VALUES (1, '1', '海尔', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (2, '1', '美的', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (3, '1', '奥克斯', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (4, '2', '双门式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (5, '2', '三门式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (6, '2', '对开双门式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (7, '2', '单门式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (8, '3', '101-200L', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (9, '3', '201-400L', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (10, '3', '101L以下', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (11, '3', '401L以上', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (12, '4', '奥克斯', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (13, '4', '海尔', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (14, '4', '美的', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (15, '5', '快洗', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (16, '5', '标准洗', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (17, '5', '单洗', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (18, '6', '一级', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (19, '6', '二级', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (20, '6', '三级', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (21, '6', '四级', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (22, '7', '普通电机', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (23, '7', '变频电机', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (24, '12', '小米', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (25, '12', '长虹', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (26, '12', 'TCL', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (27, '12', '创维', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (28, '13', '全面屏', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (29, '13', 'LED电视', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (30, '13', 'HDR', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (31, '14', '1920*1080', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (32, '14', '3840*2160', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (33, '14', '1366*768', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (34, '15', '美的', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (35, '15', '格兰仕', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (36, '15', '苏泊尔', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (37, '16', '上下管统一控温', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (38, '16', '上下管独立控温', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (39, '16', '上加热管控温', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (40, '17', '机械式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (41, '17', '电脑式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (42, '17', '触摸式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (43, '18', '美的', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (44, '18', '格兰仕', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (45, '18', '海尔', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (46, '18', '松下', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (47, '19', '普通型', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (48, '19', '光波型', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (49, '19', '蒸汽微波炉', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (50, '20', '下拉门', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (51, '20', '按门式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);
INSERT INTO `example_attribute_value` VALUES (52, '20', '手拉式', '0', 1, 'admin', '2019-03-02 15:00:57', NULL, NULL);

-- ----------------------------
-- Table structure for example_category
-- ----------------------------
DROP TABLE IF EXISTS `example_category`;
CREATE TABLE `example_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `sort_order` int(11) NULL DEFAULT NULL COMMENT '分类顺序',
  `revision` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类 商品分类信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_category
-- ----------------------------
INSERT INTO `example_category` VALUES (1, 0, '家用电器', 0, 0, NULL, NULL, '2019-03-02 15:00:57', NULL, '2019-03-02 15:00:57');
INSERT INTO `example_category` VALUES (2, 1, '电器', 0, 0, NULL, NULL, '2019-03-02 15:02:08', NULL, '2019-03-02 15:02:08');
INSERT INTO `example_category` VALUES (3, 1, '数码', 0, 0, NULL, NULL, '2019-03-02 15:02:08', NULL, '2019-03-02 15:02:08');
INSERT INTO `example_category` VALUES (4, 1, '手机', 0, 0, NULL, NULL, '2019-03-02 15:02:08', NULL, '2019-03-02 15:02:08');
INSERT INTO `example_category` VALUES (5, 0, '食物', 0, 0, NULL, NULL, '2019-03-02 15:02:08', NULL, '2019-03-02 15:02:08');
INSERT INTO `example_category` VALUES (6, 5, '生鲜', 0, 0, NULL, NULL, '2019-03-02 15:03:19', NULL, '2019-03-02 15:03:19');
INSERT INTO `example_category` VALUES (7, 5, '水果', 0, 0, NULL, NULL, '2019-03-02 15:03:19', NULL, '2019-03-02 15:03:19');
INSERT INTO `example_category` VALUES (8, 2, '冰箱', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (9, 2, '洗衣机', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (10, 2, '电视机', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (11, 3, '相机', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (12, 3, 'DV', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (13, 3, 'MP3', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (14, 4, '小米', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (15, 4, '苹果', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (16, 4, '华为', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (17, 6, '蔬菜', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (18, 6, '瓜果', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (19, 6, '青豆', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (20, 7, '苹果', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (21, 7, '香蕉', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (22, 7, '橘子', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (23, 5, '零食', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (24, 23, '饼干', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (25, 23, '薯片', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (26, 23, '面包', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (27, 0, '服装', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (28, 27, '男装', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (29, 27, '女装', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (30, 27, '童装', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (31, 28, 'T恤', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (32, 28, '衬衫', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (33, 28, '卫衣', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (34, 28, '风衣', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (35, 28, '西装', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (36, 28, '外套', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (37, 28, '夹克', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (38, 29, '连衣裙', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (39, 29, '半身裙', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (40, 29, 'JK制服', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (41, 29, '汉服', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (42, 29, '牛仔裤', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (43, 30, '针织', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (44, 30, '帽子', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (45, 30, '亲子服', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (46, 2, '烤箱', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (47, 2, '微波炉', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (48, 3, '游戏主机', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');
INSERT INTO `example_category` VALUES (49, 3, '电脑主机', 0, 0, NULL, NULL, '2019-03-02 15:28:39', NULL, '2019-03-02 15:28:39');

-- ----------------------------
-- Table structure for example_product
-- ----------------------------
DROP TABLE IF EXISTS `example_product`;
CREATE TABLE `example_product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '类型ID',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `intro` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小标题',
  `img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主图像',
  `attribute_id_list` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `lowest_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格（元）',
  `shop_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `shop_id` int(11) NULL DEFAULT NULL COMMENT '店铺id',
  `discount_id_list` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品优惠活动',
  `promotion_id_list` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销活动',
  `specs_id_list` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品所有规格',
  `remarks_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sale` int(11) NULL DEFAULT NULL,
  `comment` int(11) NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `product_detail_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情图片路径',
  `revision` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_product
-- ----------------------------
INSERT INTO `example_product` VALUES (1, 8, '奥克斯家用电冰箱', '双门冷藏冷冻节能静音宿舍用', 'static/img/goodsList/1.jpg', '1,2,3', 388.00, '奥克斯百润专卖店', 1, '1,2,3', '1,2', '1,2,3,4', '1', 10000, 8054, 0, 'static/img/goodsDetail/intro/1_1.jpg,static/img/goodsDetail/intro/1_2.jpg,static/img/goodsDetail/intro/1_3.jpg,static/img/goodsDetail/intro/1_4.jpg,static/img/goodsDetail/intro/1_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (2, 8, '海尔三门小型家用节能冰箱', '小型家用官方节能静音宿舍租房', 'static/img/goodsList/2.jpg', '1,2,3', 1299.00, '海尔官方旗舰店', 2, '1,2,3,4,5,6,7,8', '2', '5,6,7,8,9', '2', 7000, 3507, 0, 'static/img/goodsDetail/intro/2_1.jpg,static/img/goodsDetail/intro/2_2.jpg,static/img/goodsDetail/intro/2_3.jpg,static/img/goodsDetail/intro/2_4.jpg,static/img/goodsDetail/intro/2_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (3, 8, '美的电冰箱', '双开门对开门家用双门只能变频风冷无霜节能除味', 'static/img/goodsList/3.jpg', '1,2,3', 3599.00, '美的专卖店', 3, '1,2,3,4,5,6,7,8', '3', '10,11,12', '3', 225, 24, 0, 'static/img/goodsDetail/intro/3_1.jpg,static/img/goodsDetail/intro/3_2.jpg,static/img/goodsDetail/intro/3_3.jpg,static/img/goodsDetail/intro/3_4.jpg,static/img/goodsDetail/intro/3_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (4, 8, '海尔冰箱', '法式多门变频无霜智能', 'static/img/goodsList/4.jpg', '1,2,3', 2999.00, '海尔统帅旗舰店', 4, '1,2,3,4,5,6,7,8', '3,5', '13,14', '4', 108, 11, 0, 'static/img/goodsDetail/intro/4_1.jpg,static/img/goodsDetail/intro/4_2.jpg,static/img/goodsDetail/intro/4_3.jpg,static/img/goodsDetail/intro/4_4.jpg,static/img/goodsDetail/intro/4_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (5, 8, '美的智能电冰箱', '十字四门对开变频智能无霜家用', 'static/img/goodsList/5.jpg', '1,2,3', 4699.00, '美的冰箱旗舰店', 5, '1,2,3,4,5,6,7,8', '3,4,5', '15,16', '5', 340, 34, 0, 'static/img/goodsDetail/intro/5_1.jpg,static/img/goodsDetail/intro/5_2.jpg,static/img/goodsDetail/intro/5_3.jpg,static/img/goodsDetail/intro/5_4.jpg,static/img/goodsDetail/intro/5_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (6, 9, '长虹洗衣机', '长虹7.5/8kg洗衣机全自动家用小型波轮烘干迷你宿舍租房洗脱一体', 'static/img/goodsList/6.jpg', '1,2,3', 448.00, '长虹洗衣机专卖店', 6, '1,2,3,4', '1,2,3,4,5', '17,18,19', '6', 300, 200, 0, 'static/img/goodsDetail/intro/6_1.jpg,static/img/goodsDetail/intro/6_2.jpg,static/img/goodsDetail/intro/6_3.jpg,static/img/goodsDetail/intro/6_4.jpg,static/img/goodsDetail/intro/6_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (7, 9, '美的洗衣机', '美的8公斤kg波轮小型洗衣机 全自动家用大容量 洗脱一体机', 'static/img/goodsList/7.jpg', '1,2,3', 999.00, '美的洗衣机旗舰店', 7, '1,2,3,4,5', '1,5', '20,21', '7', 5500, 4000, 0, 'static/img/goodsDetail/intro/7_1.jpg,static/img/goodsDetail/intro/7_2.jpg,static/img/goodsDetail/intro/7_3.jpg,static/img/goodsDetail/intro/7_4.jpg,static/img/goodsDetail/intro/7_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (8, 9, '小米洗衣机', '小米 米家10公斤变频滚筒洗烘一体Pro 家用全自动洗衣机 烘干除菌', 'static/img/goodsList/8.jpg', '1,2,3', 1999.00, '小米官方旗舰店', 8, '1,2,3,4,5,6,7,8', '2,3,5', '22,23,24', '8', 2461, 2000, 0, 'static/img/goodsDetail/intro/8_1.jpg,static/img/goodsDetail/intro/8_2.jpg,static/img/goodsDetail/intro/8_3.jpg,static/img/goodsDetail/intro/8_4.jpg,static/img/goodsDetail/intro/8_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (9, 9, '小天鹅洗衣机', '小天鹅洗衣机全自动家用除菌滚筒10公斤洗脱一体机', 'static/img/goodsList/9.jpg', '1,2,3', 2799.00, '小天鹅官方旗舰店', 9, '1,2,3,4,5,6,7,8', '4', '25,26,27,28', '9', 5500, 5000, 0, 'static/img/goodsDetail/intro/9_1.jpg,static/img/goodsDetail/intro/9_2.jpg,static/img/goodsDetail/intro/9_3.jpg,static/img/goodsDetail/intro/9_4.jpg,static/img/goodsDetail/intro/9_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');
INSERT INTO `example_product` VALUES (10, 9, '西门子洗衣机', 'SIEMENS/西门子 10KG大容量 1400转变频 滚筒洗衣机', 'static/img/goodsList/9.jpg', '1,2,3', 1135.00, '西门子销售专卖店', 10, '1,2,3,4,5,6,7,8', '4,5', '29,30,31', '10', 50, 17, 0, 'static/img/goodsDetail/intro/10_1.jpg,static/img/goodsDetail/intro/10_2.jpg,static/img/goodsDetail/intro/10_3.jpg,static/img/goodsDetail/intro/10_4.jpg,static/img/goodsDetail/intro/10_5.jpg', 1, 'admin', '2019-03-02 15:00:57', 'admin', '2020-04-18 17:58:25');

-- ----------------------------
-- Table structure for example_product_discount
-- ----------------------------
DROP TABLE IF EXISTS `example_product_discount`;
CREATE TABLE `example_product_discount`  (
  `discount_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '折扣id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`discount_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example_product_discount
-- ----------------------------
INSERT INTO `example_product_discount` VALUES (1, '满148减10');
INSERT INTO `example_product_discount` VALUES (2, '满218减20');
INSERT INTO `example_product_discount` VALUES (3, '满288减30');
INSERT INTO `example_product_discount` VALUES (4, '满388减40');
INSERT INTO `example_product_discount` VALUES (5, '满488减50');
INSERT INTO `example_product_discount` VALUES (6, '满588减60');
INSERT INTO `example_product_discount` VALUES (7, '满688减70');
INSERT INTO `example_product_discount` VALUES (8, '满788减80');

-- ----------------------------
-- Table structure for example_product_promotion
-- ----------------------------
DROP TABLE IF EXISTS `example_product_promotion`;
CREATE TABLE `example_product_promotion`  (
  `promotion_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`promotion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of example_product_promotion
-- ----------------------------
INSERT INTO `example_product_promotion` VALUES (1, '跨店满减');
INSERT INTO `example_product_promotion` VALUES (2, '满减优惠');
INSERT INTO `example_product_promotion` VALUES (3, '显示折扣');
INSERT INTO `example_product_promotion` VALUES (4, '新品上市');
INSERT INTO `example_product_promotion` VALUES (5, '新人专享');

-- ----------------------------
-- Table structure for example_product_specs
-- ----------------------------
DROP TABLE IF EXISTS `example_product_specs`;
CREATE TABLE `example_product_specs`  (
  `specs_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `spec_seq` int(11) NULL DEFAULT NULL COMMENT '规格顺序',
  `big_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格大图',
  `small_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格小图',
  `intro` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格介绍',
  `stock` int(11) NULL DEFAULT NULL COMMENT '商品库存',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格（元）',
  `revision` int(11) NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`specs_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_product_specs
-- ----------------------------
INSERT INTO `example_product_specs` VALUES (1, 0, 'static/img/goodsDetail/specs_big1.jpg', 'static/img/goodsDetail/specs_small1.jpg', '35升银色35K118L', 1, 388.00, 30, 'admin', '2019-03-02 15:50:04', 'admin', '2019-03-02 15:50:04');
INSERT INTO `example_product_specs` VALUES (2, 0, 'static/img/goodsDetail/specs_big2.jpg', 'static/img/goodsDetail/specs_small2.jpg', '50升银色A款50K128L', 30, 448.00, 1, 'admin', '2019-03-02 15:50:04', 'admin', '2019-03-02 15:50:04');
INSERT INTO `example_product_specs` VALUES (3, 0, 'static/img/goodsDetail/specs_big3.jpg', 'static/img/goodsDetail/specs_small3.jpg', '50升银色B款50AD', 30, 478.00, 1, 'admin', '2019-03-02 15:50:04', 'admin', '2019-03-02 15:50:04');
INSERT INTO `example_product_specs` VALUES (4, 0, 'static/img/goodsDetail/specs_big4.jpg', 'static/img/goodsDetail/specs_small4.jpg', '50升金色B款50AD', 15, 498.00, 16, 'admin', '2019-03-02 15:50:04', 'admin', '2019-03-02 15:50:04');
INSERT INTO `example_product_specs` VALUES (5, 0, 'static/img/goodsDetail/specs_big5.jpg', 'static/img/goodsDetail/specs_small5.jpg', '三门206升', 26, 1199.00, 5, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (6, 0, 'static/img/goodsDetail/specs_big6.jpg', 'static/img/goodsDetail/specs_small6.jpg', '炫金206升', 28, 1299.00, 3, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (7, 0, 'static/img/goodsDetail/specs_big7.jpg', 'static/img/goodsDetail/specs_small7.jpg', '银色206升', 30, 1299.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (8, 0, 'static/img/goodsDetail/specs_big8.jpg', 'static/img/goodsDetail/specs_small8.jpg', '金色直冷180升', 29, 999.00, 2, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (9, 0, 'static/img/goodsDetail/specs_big9.jpg', 'static/img/goodsDetail/specs_small9.jpg', '深林棕直冷206升', 30, 1299.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (10, 0, 'static/img/goodsDetail/specs_big10.jpg', 'static/img/goodsDetail/specs_small10.jpg', '星级银', 18, 3499.00, 13, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (11, 0, 'static/img/goodsDetail/specs_big11.jpg', 'static/img/goodsDetail/specs_small11.jpg', '芙蓉金', 30, 2899.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (12, 0, 'static/img/goodsDetail/specs_big12.jpg', 'static/img/goodsDetail/specs_big12.jpg', '爵士棕', 26, 1247.00, 5, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (13, 0, 'static/img/goodsDetail/specs_big13.jpg', 'static/img/goodsDetail/specs_small13.jpg', '深海蓝', 30, 5299.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (14, 0, 'static/img/goodsDetail/specs_big14.jpg', 'static/img/goodsDetail/specs_small14.jpg', '炫金拉丝', 30, 3299.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (15, 0, 'static/img/goodsDetail/specs_big15.jpg', 'static/img/goodsDetail/specs_small15.jpg', '芙蓉金色', 30, 4699.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (16, 0, 'static/img/goodsDetail/specs_big16.jpg', 'static/img/goodsDetail/specs_small16.jpg', '炫晶灰', 30, 4699.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (17, 0, 'static/img/goodsDetail/specs_big17.jpg', 'static/img/goodsDetail/specs_small17.jpg', '8公斤仿手洗带风干', 30, 550.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (18, 0, 'static/img/goodsDetail/specs_big18.jpg', 'static/img/goodsDetail/specs_small18.jpg', '9公斤仿手洗带风干', 30, 600.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (19, 0, 'static/img/goodsDetail/specs_big19.jpg', 'static/img/goodsDetail/specs_small19.jpg', '9公斤强力热烘干', 28, 830.00, 3, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (20, 0, 'static/img/goodsDetail/specs_big20.jpg', 'static/img/goodsDetail/specs_small20.jpg', '智利灰', 23, 829.00, 8, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (21, 0, 'static/img/goodsDetail/specs_big21.jpg', 'static/img/goodsDetail/specs_small21.jpg', '巴赫银', 30, 2999.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (22, 0, 'static/img/goodsDetail/specs_big22.jpg', 'static/img/goodsDetail/specs_small22.jpg', '白色普通', 30, 779.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (23, 0, 'static/img/goodsDetail/specs_big23.jpg', 'static/img/goodsDetail/specs_small23.jpg', '白色只能烘干+空气洗', 30, 2999.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (24, 0, 'static/img/goodsDetail/specs_big24.jpg', 'static/img/goodsDetail/specs_small24.jpg', '钛金灰智能', 28, 2199.00, 3, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (25, 0, 'static/img/goodsDetail/specs_big25.jpg', 'static/img/goodsDetail/specs_small25.jpg', '摩卡金', 30, 2399.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (26, 0, 'static/img/goodsDetail/specs_big26.jpg', 'static/img/goodsDetail/specs_small26.jpg', '灰色普通', 30, 999.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (27, 0, 'static/img/goodsDetail/specs_big27.jpg', 'static/img/goodsDetail/specs_small27.jpg', '摩卡金洗脱一体', 30, 2799.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (28, 0, 'static/img/goodsDetail/specs_big28.jpg', 'static/img/goodsDetail/specs_small28.jpg', '巴赫银全自动', 30, 5499.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (29, 0, 'static/img/goodsDetail/specs_big29.jpg', 'static/img/goodsDetail/specs_small29.jpg', '白色变频洗烘一体', 30, 6299.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (30, 0, 'static/img/goodsDetail/specs_big30.jpg', 'static/img/goodsDetail/specs_small30.jpg', '银色全自动', 30, 4099.00, 1, 'admin', NULL, NULL, NULL);
INSERT INTO `example_product_specs` VALUES (31, 0, 'static/img/goodsDetail/specs_big31.jpg', 'static/img/goodsDetail/specs_small31.jpg', '白色全自动', 30, 2899.00, 1, 'admin', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for example_shop
-- ----------------------------
DROP TABLE IF EXISTS `example_shop`;
CREATE TABLE `example_shop`  (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `shop_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `hot_goods_id_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '热销商品id集合',
  PRIMARY KEY (`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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

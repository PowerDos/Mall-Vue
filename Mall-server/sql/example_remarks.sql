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

 Date: 24/06/2020 16:30:57
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
-- Records of example_remark_detail
-- ----------------------------
INSERT INTO `example_remark_detail` VALUES (1, 'ps****1', NULL, 3, '颜色很好看，质量也不错！，还送了个指环，想不到哦！', '35升银色35K118L', 1, 1, '2018-05-15 09:20:00');
INSERT INTO `example_remark_detail` VALUES (2, '11****5', NULL, 5, '手感没的说，是硬壳，后背带有磨砂手感。很不错，很喜欢，还加送了钢化膜，支架环，物超所值，准备再买一个。很满意。物流很快。很愉快的一次购物！', '50升银色A款50K128L', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (3, 'ga****1', NULL, 5, '好用，优惠，带烘干功能，如能明确水龙头价格更好', '银色', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (4, 'a1****1', NULL, 5, '品牌的力量越来越好，服务一流', '银色', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (5, 'qq****q', NULL, 5, '此用户没有填写评论!', '芙蓉金', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (6, '3a****b', NULL, 5, '苏宁易购的服务还是很好的', '三门206升', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (7, '10****0', NULL, 5, '这个洗衣机真的很伤脑经啊，首先苏宁服务很不错，买了有活动马上退了差价，送货也很快，西门子售后也不错，很快安排了安装。但是这个洗衣机真的有BUG啊，洗了一遍，有泡，在洗一遍快下速的，还是象图片里的一样，洗不干净，已经放很少洗衣液了，总不能不放吧，每次洗衣服就跟它耗半天。', '芙蓉金', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (8, '43****c', NULL, 5, '此用户没有填写评论!', '芙蓉金', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (9, 'y1****y', NULL, 5, '此用户没有填写评论!', '三门206升', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (10, 'i3****4', NULL, 5, '物流师傅非常热情，安装师傅也很专业，还帮我换了另一个水池的水管。', '深林棕直冷206升', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (11, 'hj****1', NULL, 5, '用着是没问题，就是脱水时声音这么大，售后说是正常的，我家第一次用滚筒洗衣机也不知道是不是都这样？苏宁快递赞一个，头天晚上下单第二天就打电话送货了 容量大小：8公斤够用了 洗衣效果：还不错 静音效果：声音有点大 外观材质：挺沉', '深林棕直冷206升', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (12, 'da****1', NULL, 5, '因为疫情影响推迟了两个多月收货，终于安装到位了，西门子的就是大气，希望能用得久。', '深林棕直冷206升', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (13, 'sz****1', NULL, 5, '外观完好 还没使用 使用后再说 冰箱容量：挺大的', '芙蓉金', 1, 2, '2018-05-18 09:20:00');
INSERT INTO `example_remark_detail` VALUES (14, 'sc****3', NULL, 5, '冰箱非常不错，性价比很高。非常适合一家3~5口人。而且康佳也是个大品牌，值得信赖。辛苦快递小哥和搬运工人。总之目前没什么问题。给个好评。', '芙蓉金', 1, 2, '2018-05-18 09:20:00');

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
-- Records of example_remark_tag
-- ----------------------------
INSERT INTO `example_remark_tag` VALUES (1, '颜色可人');
INSERT INTO `example_remark_tag` VALUES (2, '实惠优选');
INSERT INTO `example_remark_tag` VALUES (3, '严丝合缝');
INSERT INTO `example_remark_tag` VALUES (4, '极致轻薄');
INSERT INTO `example_remark_tag` VALUES (5, '质量没话说');
INSERT INTO `example_remark_tag` VALUES (6, '比定做还合适');
INSERT INTO `example_remark_tag` VALUES (7, '完美品质');
INSERT INTO `example_remark_tag` VALUES (8, '正品行货');
INSERT INTO `example_remark_tag` VALUES (9, '不容易发热');
INSERT INTO `example_remark_tag` VALUES (10, '已经买第二个');
INSERT INTO `example_remark_tag` VALUES (11, '是全覆盖');

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

-- ----------------------------
-- Records of example_remarks
-- ----------------------------
INSERT INTO `example_remarks` VALUES (1, 90, '1,2,3,4,5,8,9,11', 2000, 3452, 843, 1, '1,2');
INSERT INTO `example_remarks` VALUES (2, 80, '1,2,4,5,6,7,8,9,10', 1507, 7854, 543, 7, '3');
INSERT INTO `example_remarks` VALUES (3, 80, '1,2,4,5,6,7,8,9,10', 1507, 7854, 543, 7, '3');
INSERT INTO `example_remarks` VALUES (4, 85, '1,2,6,7,8,9,11', 5405, 874, 900, 4, '4,5');
INSERT INTO `example_remarks` VALUES (5, 85, '3,4,5,6,7,8,9,10', 8742, 985, 5331, 9, '6,7');
INSERT INTO `example_remarks` VALUES (6, 81, '1,2,3,5,6,7,8,9,11', 874, 6874, 543, 6, '8');
INSERT INTO `example_remarks` VALUES (7, 86, '1,3,4,5,6,10,11', 258, 87, 755, 5, '9');
INSERT INTO `example_remarks` VALUES (8, 88, '1,2,3,4,6,7,8,9', 8797, 875, 543, 5, '10,11');
INSERT INTO `example_remarks` VALUES (9, 87, '5,6,7,8,9,10,11', 687, 5870, 873, 44, '12');
INSERT INTO `example_remarks` VALUES (10, 79, '11', 788, 857, 543, 11, '13,14');

SET FOREIGN_KEY_CHECKS = 1;

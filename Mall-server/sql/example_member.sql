/*
 Navicat Premium Data Transfer

 Source Server         : 47.101.205.112
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 47.101.205.112:3306
 Source Schema         : example_member

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 24/06/2020 16:30:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for example_user
-- ----------------------------
DROP TABLE IF EXISTS `example_user`;
CREATE TABLE `example_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'user_id',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱号',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `sex` tinyint(1) NULL DEFAULT 0 COMMENT '性别  1男  2女',
  `age` tinyint(3) NULL DEFAULT 0 COMMENT '年龄',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `active` tinyint(1) NULL DEFAULT 1 COMMENT '是否可用 1正常  2冻结',
  `pic_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `qq_openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ联合登陆id',
  `ex_openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信公众号关注id',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `MOBILE_UNIQUE`(`mobile`) USING BTREE,
  UNIQUE INDEX `EMAIL_UNIQUE`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户会员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_user
-- ----------------------------
INSERT INTO `example_user` VALUES (1, '15152609738', '929732982@qq.com', '2803772E3C7E47293148945DD36FD558', '吴昊', NULL, NULL, '2020-03-09 11:51:03', '2020-03-09 11:51:03', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for example_user_token
-- ----------------------------
DROP TABLE IF EXISTS `example_user_token`;
CREATE TABLE `example_user_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录token',
  `login_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录类型',
  `device_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备信息',
  `ipInfo` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `disable` int(1) NULL DEFAULT NULL COMMENT '是否被禁用 0:可用 1：不可用',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of example_user_token
-- ----------------------------
INSERT INTO `example_user_token` VALUES (1, 'loginPC1a015dddac3740f089f40faa25289c3e', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 05:44:57', '2020-04-22 05:56:25');
INSERT INTO `example_user_token` VALUES (2, 'loginPCaf8702c2f0f34416be0780969e1b7bc4', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 05:56:25', '2020-04-22 06:28:11');
INSERT INTO `example_user_token` VALUES (3, 'loginPC303a9f9d48ad40a9875b132b4236df3a', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 06:28:11', '2020-04-22 07:13:34');
INSERT INTO `example_user_token` VALUES (4, 'loginPC0934b381c0c140509403142053070e84', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 07:13:34', '2020-04-22 07:19:37');
INSERT INTO `example_user_token` VALUES (5, 'loginPC816d17106cc740648948fa3fe5c5dcfc', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 07:19:37', '2020-04-22 07:24:11');
INSERT INTO `example_user_token` VALUES (6, 'loginPC24fdf2a246ee4de0b305a3d57699b8ab', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 07:24:11', '2020-04-22 07:29:34');
INSERT INTO `example_user_token` VALUES (7, 'loginPC93392eaf190c4e49bedd3a812be670b8', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 07:29:34', '2020-04-22 07:32:30');
INSERT INTO `example_user_token` VALUES (8, 'loginPC172e77be71d34aea8eb90a6b1ad5f3cb', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 07:32:30', '2020-04-22 07:41:55');
INSERT INTO `example_user_token` VALUES (9, 'loginPCb948e1b3528f47b8aeef35f123274fc6', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 07:41:55', '2020-04-22 07:47:25');
INSERT INTO `example_user_token` VALUES (10, 'loginPC9c7e8ecea0b142bbba7b2065f0cc898f', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 07:47:25', '2020-04-22 07:51:36');
INSERT INTO `example_user_token` VALUES (11, 'loginPC9531715fc8374e5781d42aae202bd451', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 07:51:36', '2020-04-22 08:09:43');
INSERT INTO `example_user_token` VALUES (12, 'loginPC851e99f7ea9e4ac2be002d0acced6f03', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 08:09:43', '2020-04-22 08:31:28');
INSERT INTO `example_user_token` VALUES (13, 'loginPC822c885b7e934ec5856719752ba91e1c', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-22 08:31:28', '2020-04-30 04:36:33');
INSERT INTO `example_user_token` VALUES (14, 'loginPC8dc59b52d7fd41a1bc838f1a343f1c0a', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:36:33', '2020-04-30 04:42:20');
INSERT INTO `example_user_token` VALUES (15, 'loginPCb5ee08474d3845ffb8334518fe4ae6bb', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:42:20', '2020-04-30 04:42:49');
INSERT INTO `example_user_token` VALUES (16, 'loginPCc5c181445c874439b66a552fd19d5995', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:42:49', '2020-04-30 04:48:15');
INSERT INTO `example_user_token` VALUES (17, 'loginPC7f50590737294658937a83eb76430803', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:48:15', '2020-04-30 04:50:53');
INSERT INTO `example_user_token` VALUES (18, 'loginPC2c3cee6563544293b93bab0246b089f5', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:50:53', '2020-04-30 04:51:09');
INSERT INTO `example_user_token` VALUES (19, 'loginPCc929927a976b47d28b727715531755e5', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:51:09', '2020-04-30 04:54:41');
INSERT INTO `example_user_token` VALUES (20, 'loginPC218cd92423144112b639fb8c6f17a525', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:54:41', '2020-04-30 04:54:51');
INSERT INTO `example_user_token` VALUES (21, 'loginPCaa5f568a9d174da38015d80623632848', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:54:51', '2020-04-30 04:58:53');
INSERT INTO `example_user_token` VALUES (22, 'loginPC3740e300ec5e4eb4a9d3cbb56ddafe0b', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:58:53', '2020-04-30 04:59:03');
INSERT INTO `example_user_token` VALUES (23, 'loginPC591d96f1ae1d4fb49d2b431945c79143', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 04:59:03', '2020-04-30 05:01:51');
INSERT INTO `example_user_token` VALUES (24, 'loginPC34483e1983a5484ab34b09aa171f140b', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 05:01:51', '2020-04-30 05:02:03');
INSERT INTO `example_user_token` VALUES (25, 'loginPCa1296198fa02436cb7dcd5fe379e6510', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 05:02:03', '2020-04-30 05:04:05');
INSERT INTO `example_user_token` VALUES (26, 'loginPC0b7607b212dc4e52ba9bd93218f1fe9f', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 05:04:05', '2020-04-30 05:07:33');
INSERT INTO `example_user_token` VALUES (27, 'loginPC6cdbc6d84a6340578089add9e7e76fcd', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 05:07:33', '2020-04-30 05:07:53');
INSERT INTO `example_user_token` VALUES (28, 'loginPCe3024c73c2e0491caeba7ea684509b8d', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 05:07:53', '2020-04-30 05:10:18');
INSERT INTO `example_user_token` VALUES (29, 'loginPC99855d4b28dc44c8b240070447355995', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 05:10:18', '2020-04-30 05:14:05');
INSERT INTO `example_user_token` VALUES (30, 'loginPC7a165dbf69264bbc95757e07aa0de840', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-04-30 05:14:05', '2020-05-10 06:27:46');
INSERT INTO `example_user_token` VALUES (31, 'loginPCf51bdab109454a1e894b061b22eaa366', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:27:46', '2020-05-10 06:28:10');
INSERT INTO `example_user_token` VALUES (32, 'loginPCc50720ece96c4180bd273af308845426', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:28:11', '2020-05-10 06:30:50');
INSERT INTO `example_user_token` VALUES (33, 'loginPCe0301fec1b094cab9e17a9fb90defc5b', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:30:50', '2020-05-10 06:35:19');
INSERT INTO `example_user_token` VALUES (34, 'loginPCa3476dda912740a0a6ab0e3f4ddf3819', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:35:19', '2020-05-10 06:36:00');
INSERT INTO `example_user_token` VALUES (35, 'loginPC7975461f2066447e8af1cdf4f91ade60', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:36:00', '2020-05-10 06:37:39');
INSERT INTO `example_user_token` VALUES (36, 'loginPCb233563269c14cde995f696693bfbffc', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:37:39', '2020-05-10 06:41:35');
INSERT INTO `example_user_token` VALUES (37, 'loginPC43df0898868b4575abc65417157121b5', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:41:35', '2020-05-10 06:42:05');
INSERT INTO `example_user_token` VALUES (38, 'loginPC721bb4a1d73c4d72b28c0bd6293282e6', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:42:05', '2020-05-10 06:43:55');
INSERT INTO `example_user_token` VALUES (39, 'loginPC377d4425414545929fcfa4db1cf9dc8a', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:43:55', '2020-05-10 06:48:32');
INSERT INTO `example_user_token` VALUES (40, 'loginPC36431c23ee384af4be1b6b3cdc902203', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:48:32', '2020-05-10 06:53:06');
INSERT INTO `example_user_token` VALUES (41, 'loginPC78489527ee47420b80f3749e8efee828', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:53:06', '2020-05-10 06:54:25');
INSERT INTO `example_user_token` VALUES (42, 'loginPC3c280c7650474e72b8b618401a3322fd', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:54:25', '2020-05-10 06:57:35');
INSERT INTO `example_user_token` VALUES (43, 'loginPC23e28d66301e48b480d405726229eb33', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 06:57:35', '2020-05-10 07:06:27');
INSERT INTO `example_user_token` VALUES (44, 'loginPCbe11f28d06c54a1086ebb91d34f7b32b', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 07:06:27', '2020-05-10 07:10:30');
INSERT INTO `example_user_token` VALUES (45, 'loginPC5c7124e554b146c5a51f5ffb457a48d7', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 07:10:31', '2020-05-10 07:12:27');
INSERT INTO `example_user_token` VALUES (46, 'loginPC0584f77e4c87407c971a503272172863', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 07:12:37', '2020-05-10 07:16:56');
INSERT INTO `example_user_token` VALUES (47, 'loginPCd89172faa9c74b55b8955cd051adc683', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 07:17:04', '2020-05-10 07:28:58');
INSERT INTO `example_user_token` VALUES (48, 'loginPC3d075ead85da47dc91b1b186701039a8', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 07:28:58', '2020-05-10 07:32:19');
INSERT INTO `example_user_token` VALUES (49, 'loginPCf19144f03e1642fbb1ac38234896d2db', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 07:32:19', '2020-05-10 07:41:06');
INSERT INTO `example_user_token` VALUES (50, 'loginPC14f3a9e113504a8192662ebbc6b2c509', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 07:41:06', '2020-05-10 07:48:13');
INSERT INTO `example_user_token` VALUES (51, 'loginPCfdcc3c87896e47a2944f0914b56cbe7a', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 07:48:13', '2020-05-10 08:08:26');
INSERT INTO `example_user_token` VALUES (52, 'loginPC423d3067ca374c87be475712544b69c2', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 08:08:26', '2020-05-10 08:17:54');
INSERT INTO `example_user_token` VALUES (53, 'loginPCb08397b608b84e6ba309018a6af665de', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 08:17:54', '2020-05-10 08:27:06');
INSERT INTO `example_user_token` VALUES (54, 'loginPC8fe2bfc340514c77b0c68216975d4420', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 08:27:06', '2020-05-10 08:29:01');
INSERT INTO `example_user_token` VALUES (55, 'loginPC56b83edeebb94abda6e5534369a0219e', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 08:29:01', '2020-05-10 08:37:39');
INSERT INTO `example_user_token` VALUES (56, 'loginPCee91919225ff4123bf9b73dcc112460b', 'PC', 'PC', '127.0.0.1', 1, 1, '2020-05-10 08:37:39', '2020-05-10 08:41:00');
INSERT INTO `example_user_token` VALUES (57, 'loginPC8137315267974558a7a1d2e5e6868b19', 'PC', 'PC', '127.0.0.1', 0, 1, '2020-05-10 08:41:00', NULL);

SET FOREIGN_KEY_CHECKS = 1;

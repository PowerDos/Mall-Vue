/*
 Navicat Premium Data Transfer

 Source Server         : mall-basic
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:30002
 Source Schema         : ApolloConfigDB

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 10/07/2020 10:14:53
*/


CREATE DATABASE IF NOT EXISTS ApolloConfigDB DEFAULT CHARACTER SET = utf8mb4;

Use ApolloConfigDB;


SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for AccessKey
-- ----------------------------
DROP TABLE IF EXISTS `AccessKey`;
CREATE TABLE `AccessKey`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Secret',
  `IsEnabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: enabled, 0: disabled',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问密钥' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AccessKey
-- ----------------------------

-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Name`(`Name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of App
-- ----------------------------
INSERT INTO `App` VALUES (1, 'springcloudmember', '会员模块', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `App` VALUES (2, 'springcloudgoods', '商品模块', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `App` VALUES (3, 'springcloudremarks', '评论模块', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `App` VALUES (4, 'springcloudorder', '订单模块', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `App` VALUES (5, 'springcloudseckill', '秒杀模块', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `App` VALUES (6, 'springcloudzuul', '网关模块', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId`(`AppId`) USING BTREE,
  INDEX `Name_AppId`(`Name`, `AppId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用namespace定义' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
INSERT INTO `AppNamespace` VALUES (1, 'application', 'springcloudmember', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `AppNamespace` VALUES (2, 'application', 'springcloudgoods', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `AppNamespace` VALUES (3, 'application', 'springcloudremarks', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `AppNamespace` VALUES (4, 'application', 'springcloudorder', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `AppNamespace` VALUES (5, 'application', 'springcloudseckill', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `AppNamespace` VALUES (6, 'application', 'springcloudzuul', 'properties', b'0', 'default app namespace', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');

-- ----------------------------
-- Table structure for Audit
-- ----------------------------
DROP TABLE IF EXISTS `Audit`;
CREATE TABLE `Audit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Audit
-- ----------------------------
INSERT INTO `Audit` VALUES (1, 'App', 1, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:01:27', NULL, '2020-07-10 10:01:27');
INSERT INTO `Audit` VALUES (2, 'AppNamespace', 1, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:01:27', NULL, '2020-07-10 10:01:27');
INSERT INTO `Audit` VALUES (3, 'Cluster', 1, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:01:27', NULL, '2020-07-10 10:01:27');
INSERT INTO `Audit` VALUES (4, 'Namespace', 1, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:01:27', NULL, '2020-07-10 10:01:27');
INSERT INTO `Audit` VALUES (5, 'Item', 1, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (6, 'Item', 2, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (7, 'Item', 3, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (8, 'Item', 4, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (9, 'Item', 5, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (10, 'Item', 6, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (11, 'Item', 7, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (12, 'Item', 8, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (13, 'Item', 9, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (14, 'Item', 10, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (15, 'Item', 11, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (16, 'Item', 12, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (17, 'Item', 13, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (18, 'Item', 14, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (19, 'Item', 15, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (20, 'Item', 16, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (21, 'Item', 17, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (22, 'Item', 18, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (23, 'Item', 19, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (24, 'Item', 20, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (25, 'Item', 21, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (26, 'Item', 22, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (27, 'Item', 23, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (28, 'Item', 24, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (29, 'Item', 25, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (30, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:04', NULL, '2020-07-10 10:05:04');
INSERT INTO `Audit` VALUES (31, 'Release', 1, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:09', NULL, '2020-07-10 10:05:09');
INSERT INTO `Audit` VALUES (32, 'ReleaseHistory', 1, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:09', NULL, '2020-07-10 10:05:09');
INSERT INTO `Audit` VALUES (33, 'App', 2, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:46', NULL, '2020-07-10 10:05:46');
INSERT INTO `Audit` VALUES (34, 'AppNamespace', 2, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:46', NULL, '2020-07-10 10:05:46');
INSERT INTO `Audit` VALUES (35, 'Cluster', 2, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:46', NULL, '2020-07-10 10:05:46');
INSERT INTO `Audit` VALUES (36, 'Namespace', 2, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:05:46', NULL, '2020-07-10 10:05:46');
INSERT INTO `Audit` VALUES (37, 'Item', 26, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:48', NULL, '2020-07-10 10:06:48');
INSERT INTO `Audit` VALUES (38, 'Item', 27, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (39, 'Item', 28, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (40, 'Item', 29, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (41, 'Item', 30, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (42, 'Item', 31, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (43, 'Item', 32, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (44, 'Item', 33, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (45, 'Item', 34, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (46, 'Item', 35, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (47, 'Item', 36, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (48, 'Item', 37, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (49, 'Item', 38, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (50, 'Item', 39, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (51, 'Item', 40, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (52, 'Item', 41, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (53, 'Item', 42, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (54, 'Item', 43, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (55, 'Item', 44, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (56, 'Item', 45, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (57, 'Item', 46, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (58, 'Item', 47, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (59, 'Item', 48, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (60, 'Item', 49, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (61, 'Item', 50, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (62, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:49', NULL, '2020-07-10 10:06:49');
INSERT INTO `Audit` VALUES (63, 'Release', 2, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:52', NULL, '2020-07-10 10:06:52');
INSERT INTO `Audit` VALUES (64, 'ReleaseHistory', 2, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:06:52', NULL, '2020-07-10 10:06:52');
INSERT INTO `Audit` VALUES (65, 'App', 3, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:07:17', NULL, '2020-07-10 10:07:17');
INSERT INTO `Audit` VALUES (66, 'AppNamespace', 3, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:07:17', NULL, '2020-07-10 10:07:17');
INSERT INTO `Audit` VALUES (67, 'Cluster', 3, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:07:17', NULL, '2020-07-10 10:07:17');
INSERT INTO `Audit` VALUES (68, 'Namespace', 3, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:07:17', NULL, '2020-07-10 10:07:17');
INSERT INTO `Audit` VALUES (69, 'Item', 51, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (70, 'Item', 52, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (71, 'Item', 53, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (72, 'Item', 54, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (73, 'Item', 55, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (74, 'Item', 56, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (75, 'Item', 57, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (76, 'Item', 58, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (77, 'Item', 59, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (78, 'Item', 60, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (79, 'Item', 61, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (80, 'Item', 62, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (81, 'Item', 63, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (82, 'Item', 64, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (83, 'Item', 65, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (84, 'Item', 66, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (85, 'Item', 67, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (86, 'Item', 68, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (87, 'Item', 69, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (88, 'Item', 70, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (89, 'Item', 71, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (90, 'Item', 72, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (91, 'Item', 73, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (92, 'Item', 74, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (93, 'Item', 75, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (94, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:15', NULL, '2020-07-10 10:08:15');
INSERT INTO `Audit` VALUES (95, 'Release', 3, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:20', NULL, '2020-07-10 10:08:20');
INSERT INTO `Audit` VALUES (96, 'ReleaseHistory', 3, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:20', NULL, '2020-07-10 10:08:20');
INSERT INTO `Audit` VALUES (97, 'App', 4, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:50', NULL, '2020-07-10 10:08:50');
INSERT INTO `Audit` VALUES (98, 'AppNamespace', 4, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:50', NULL, '2020-07-10 10:08:50');
INSERT INTO `Audit` VALUES (99, 'Cluster', 4, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:50', NULL, '2020-07-10 10:08:50');
INSERT INTO `Audit` VALUES (100, 'Namespace', 4, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:08:50', NULL, '2020-07-10 10:08:50');
INSERT INTO `Audit` VALUES (101, 'Item', 76, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (102, 'Item', 77, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (103, 'Item', 78, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (104, 'Item', 79, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (105, 'Item', 80, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (106, 'Item', 81, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (107, 'Item', 82, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (108, 'Item', 83, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (109, 'Item', 84, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (110, 'Item', 85, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (111, 'Item', 86, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (112, 'Item', 87, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (113, 'Item', 88, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (114, 'Item', 89, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (115, 'Item', 90, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (116, 'Item', 91, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (117, 'Item', 92, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (118, 'Item', 93, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (119, 'Item', 94, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (120, 'Item', 95, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (121, 'Item', 96, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (122, 'Item', 97, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (123, 'Item', 98, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (124, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:51', NULL, '2020-07-10 10:09:51');
INSERT INTO `Audit` VALUES (125, 'Release', 4, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:53', NULL, '2020-07-10 10:09:53');
INSERT INTO `Audit` VALUES (126, 'ReleaseHistory', 4, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:09:53', NULL, '2020-07-10 10:09:53');
INSERT INTO `Audit` VALUES (127, 'App', 5, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:10:16', NULL, '2020-07-10 10:10:16');
INSERT INTO `Audit` VALUES (128, 'AppNamespace', 5, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:10:16', NULL, '2020-07-10 10:10:16');
INSERT INTO `Audit` VALUES (129, 'Cluster', 5, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:10:16', NULL, '2020-07-10 10:10:16');
INSERT INTO `Audit` VALUES (130, 'Namespace', 5, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:10:16', NULL, '2020-07-10 10:10:16');
INSERT INTO `Audit` VALUES (131, 'Item', 99, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (132, 'Item', 100, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (133, 'Item', 101, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (134, 'Item', 102, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (135, 'Item', 103, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (136, 'Item', 104, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (137, 'Item', 105, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (138, 'Item', 106, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (139, 'Item', 107, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (140, 'Item', 108, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (141, 'Item', 109, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (142, 'Item', 110, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (143, 'Item', 111, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (144, 'Item', 112, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (145, 'Item', 113, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (146, 'Item', 114, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (147, 'Item', 115, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (148, 'Item', 116, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (149, 'Item', 117, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (150, 'Item', 118, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (151, 'Item', 119, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (152, 'Item', 120, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (153, 'Item', 121, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (154, 'Item', 122, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (155, 'Item', 123, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (156, 'Item', 124, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (157, 'Item', 125, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (158, 'Item', 126, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (159, 'Item', 127, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (160, 'Item', 128, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (161, 'Item', 129, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (162, 'Item', 130, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (163, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:52', NULL, '2020-07-10 10:12:52');
INSERT INTO `Audit` VALUES (164, 'Release', 5, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:55', NULL, '2020-07-10 10:12:55');
INSERT INTO `Audit` VALUES (165, 'ReleaseHistory', 5, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:12:55', NULL, '2020-07-10 10:12:55');
INSERT INTO `Audit` VALUES (166, 'App', 6, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:13:15', NULL, '2020-07-10 10:13:15');
INSERT INTO `Audit` VALUES (167, 'AppNamespace', 6, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:13:15', NULL, '2020-07-10 10:13:15');
INSERT INTO `Audit` VALUES (168, 'Cluster', 6, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:13:15', NULL, '2020-07-10 10:13:15');
INSERT INTO `Audit` VALUES (169, 'Namespace', 6, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:13:15', NULL, '2020-07-10 10:13:15');
INSERT INTO `Audit` VALUES (170, 'Item', 131, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (171, 'Item', 132, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (172, 'Item', 133, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (173, 'Item', 134, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (174, 'Item', 135, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (175, 'Item', 136, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (176, 'Item', 137, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (177, 'Item', 138, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (178, 'Item', 139, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (179, 'Item', 140, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (180, 'Item', 141, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (181, 'Item', 142, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (182, 'Item', 143, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (183, 'Item', 144, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (184, 'Item', 145, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (185, 'Item', 146, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (186, 'Item', 147, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (187, 'Item', 148, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (188, 'Item', 149, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (189, 'Item', 150, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (190, 'Item', 151, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (191, 'Item', 152, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (192, 'Item', 153, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (193, 'Item', 154, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (194, 'Item', 155, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (195, 'Item', 156, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (196, 'Item', 157, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (197, 'Item', 158, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (198, 'Item', 159, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (199, 'Item', 160, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (200, 'Item', 161, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (201, 'Item', 162, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (202, 'Item', 163, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (203, 'Item', 164, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (204, 'Item', 165, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (205, 'Item', 166, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (206, 'Item', 167, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (207, 'Item', 168, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (208, 'Item', 169, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (209, 'Item', 170, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (210, 'Item', 171, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (211, 'Item', 172, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (212, 'Item', 173, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (213, 'Item', 174, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (214, 'Item', 175, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (215, 'Item', 176, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (216, 'Item', 177, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (217, 'Item', 178, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (218, 'Item', 179, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (219, 'ItemSet', NULL, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:14', NULL, '2020-07-10 10:14:14');
INSERT INTO `Audit` VALUES (220, 'Release', 6, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:18', NULL, '2020-07-10 10:14:18');
INSERT INTO `Audit` VALUES (221, 'ReleaseHistory', 6, 'INSERT', NULL, b'0', 'apollo', '2020-07-10 10:14:18', NULL, '2020-07-10 10:14:18');

-- ----------------------------
-- Table structure for Cluster
-- ----------------------------
DROP TABLE IF EXISTS `Cluster`;
CREATE TABLE `Cluster`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppId_Name`(`AppId`, `Name`) USING BTREE,
  INDEX `IX_ParentClusterId`(`ParentClusterId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '集群' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Cluster
-- ----------------------------
INSERT INTO `Cluster` VALUES (1, 'default', 'springcloudmember', 0, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Cluster` VALUES (2, 'default', 'springcloudgoods', 0, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Cluster` VALUES (3, 'default', 'springcloudremarks', 0, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Cluster` VALUES (4, 'default', 'springcloudorder', 0, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Cluster` VALUES (5, 'default', 'springcloudseckill', 0, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Cluster` VALUES (6, 'default', 'springcloudzuul', 0, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');

-- ----------------------------
-- Table structure for Commit
-- ----------------------------
DROP TABLE IF EXISTS `Commit`;
CREATE TABLE `Commit`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `ClusterName`(`ClusterName`(191)) USING BTREE,
  INDEX `NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'commit 历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Commit
-- ----------------------------
INSERT INTO `Commit` VALUES (1, '{\"createItems\":[{\"namespaceId\":1,\"key\":\"server.port\",\"value\":\"8001\",\"comment\":\"\",\"lineNum\":1,\"id\":1,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"spring.application.name\",\"value\":\"spring-cloud-member\",\"comment\":\"\",\"lineNum\":3,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://eureka-port.mall-basic:8080/eureka\",\"comment\":\"\",\"lineNum\":5,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"eureka.client.register-with-eureka\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":7,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"swagger.base-package\",\"value\":\"com.example.member.api\",\"comment\":\"\",\"lineNum\":10,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"spring.datasource.driver-class-name\",\"value\":\"com.mysql.cj.jdbc.Driver\",\"comment\":\"\",\"lineNum\":14,\"id\":14,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_member?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"comment\":\"\",\"lineNum\":15,\"id\":15,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"spring.datasource.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":16,\"id\":16,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"spring.datasource.password\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":17,\"id\":17,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"spring.redis.host\",\"value\":\"redis-port:mall-basic\",\"comment\":\"\",\"lineNum\":19,\"id\":19,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":20,\"id\":20,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"mybatis.configuration.map-underscore-to-camel-case\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":21,\"id\":21,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"loginType.supportPlatforms\",\"value\":\"Android,IOS,PC\",\"comment\":\"\",\"lineNum\":22,\"id\":22,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"},{\"namespaceId\":1,\"key\":\"spring.zipkin.base-url\",\"value\":\"http://zipkin-port.mall-basic:9411\",\"comment\":\"\",\"lineNum\":25,\"id\":25,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:05:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:05:04\"}],\"updateItems\":[],\"deleteItems\":[]}', 'springcloudmember', 'default', 'application', NULL, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Commit` VALUES (2, '{\"createItems\":[{\"namespaceId\":2,\"key\":\"server.port\",\"value\":\"8003\",\"comment\":\"\",\"lineNum\":1,\"id\":26,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"spring.application.name\",\"value\":\"spring-cloud-goods\",\"comment\":\"\",\"lineNum\":3,\"id\":28,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://eureka-port.mall-basic:8080/eureka\",\"comment\":\"\",\"lineNum\":5,\"id\":30,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"eureka.client.register-with-eureka\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":7,\"id\":32,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"swagger.base-package\",\"value\":\"com.example.goods.api\",\"comment\":\"\",\"lineNum\":11,\"id\":36,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"spring.datasource.driver-class-name\",\"value\":\"com.mysql.cj.jdbc.Driver\",\"comment\":\"\",\"lineNum\":15,\"id\":40,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_goods?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"comment\":\"\",\"lineNum\":16,\"id\":41,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"spring.datasource.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":17,\"id\":42,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"spring.datasource.password\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":18,\"id\":43,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"mybatis.configuration.map-underscore-to-camel-case\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":19,\"id\":44,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"spring.redis.host\",\"value\":\"redis-port:mall-basic\",\"comment\":\"\",\"lineNum\":22,\"id\":47,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":23,\"id\":48,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"},{\"namespaceId\":2,\"key\":\"spring.zipkin.base-url\",\"value\":\"http://zipkin-port.mall-basic:9411\",\"comment\":\"\",\"lineNum\":25,\"id\":50,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:06:48\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:06:48\"}],\"updateItems\":[],\"deleteItems\":[]}', 'springcloudgoods', 'default', 'application', NULL, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Commit` VALUES (3, '{\"createItems\":[{\"namespaceId\":3,\"key\":\"server.port\",\"value\":\"8004\",\"comment\":\"\",\"lineNum\":1,\"id\":51,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"spring.application.name\",\"value\":\"spring-cloud-remarks\",\"comment\":\"\",\"lineNum\":3,\"id\":53,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://eureka-port.mall-basic:8080/eureka\",\"comment\":\"\",\"lineNum\":5,\"id\":55,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"eureka.client.register-with-eureka\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":7,\"id\":57,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"swagger.base-package\",\"value\":\"com.example.remarks.api\",\"comment\":\"\",\"lineNum\":11,\"id\":61,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"spring.datasource.driver-class-name\",\"value\":\"com.mysql.cj.jdbc.Driver\",\"comment\":\"\",\"lineNum\":15,\"id\":65,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_remarks?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"comment\":\"\",\"lineNum\":16,\"id\":66,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"spring.datasource.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":17,\"id\":67,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"spring.datasource.password\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":18,\"id\":68,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"mybatis.configuration.map-underscore-to-camel-case\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":19,\"id\":69,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"spring.redis.host\",\"value\":\"redis-port:mall-basic\",\"comment\":\"\",\"lineNum\":22,\"id\":72,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":23,\"id\":73,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"},{\"namespaceId\":3,\"key\":\"spring.zipkin.base-url\",\"value\":\"http://zipkin-port.mall-basic:9411\",\"comment\":\"\",\"lineNum\":25,\"id\":75,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:08:15\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:08:15\"}],\"updateItems\":[],\"deleteItems\":[]}', 'springcloudremarks', 'default', 'application', NULL, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Commit` VALUES (4, '{\"createItems\":[{\"namespaceId\":4,\"key\":\"server.port\",\"value\":\"8005\",\"comment\":\"\",\"lineNum\":1,\"id\":76,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"spring.application.name\",\"value\":\"spring-cloud-order\",\"comment\":\"\",\"lineNum\":3,\"id\":78,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://eureka-port.mall-basic:8080/eureka\",\"comment\":\"\",\"lineNum\":5,\"id\":80,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"eureka.client.register-with-eureka\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":7,\"id\":82,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"swagger.base-package\",\"value\":\"com.example.order.api\",\"comment\":\"\",\"lineNum\":10,\"id\":85,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"spring.datasource.driver-class-name\",\"value\":\"com.mysql.cj.jdbc.Driver\",\"comment\":\"\",\"lineNum\":14,\"id\":89,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_order?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"comment\":\"\",\"lineNum\":15,\"id\":90,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"spring.datasource.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":16,\"id\":91,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"spring.datasource.password\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":17,\"id\":92,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"spring.redis.host\",\"value\":\"redis-port:mall-basic\",\"comment\":\"\",\"lineNum\":19,\"id\":94,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":20,\"id\":95,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"mybatis.configuration.map-underscore-to-camel-case\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":21,\"id\":96,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"},{\"namespaceId\":4,\"key\":\"spring.zipkin.base-url\",\"value\":\"http://zipkin-port.mall-basic:9411\",\"comment\":\"\",\"lineNum\":23,\"id\":98,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:09:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:09:50\"}],\"updateItems\":[],\"deleteItems\":[]}', 'springcloudorder', 'default', 'application', NULL, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Commit` VALUES (5, '{\"createItems\":[{\"namespaceId\":5,\"key\":\"server.port\",\"value\":\"8002\",\"comment\":\"\",\"lineNum\":1,\"id\":99,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.application.name\",\"value\":\"spring-cloud-seckill\",\"comment\":\"\",\"lineNum\":3,\"id\":101,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://eureka-port.mall-basic:8080/eureka\",\"comment\":\"\",\"lineNum\":5,\"id\":103,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"eureka.client.register-with-eureka\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":7,\"id\":105,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"swagger.base-package\",\"value\":\"com.example.seckill.api\",\"comment\":\"\",\"lineNum\":11,\"id\":109,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.datasource.driver-class-name\",\"value\":\"com.mysql.cj.jdbc.Driver\",\"comment\":\"\",\"lineNum\":15,\"id\":113,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.datasource.url\",\"value\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_seckill?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"comment\":\"\",\"lineNum\":16,\"id\":114,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.datasource.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":17,\"id\":115,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.datasource.password\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":18,\"id\":116,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:51\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"mybatis.configuration.map-underscore-to-camel-case\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":19,\"id\":117,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.redis.host\",\"value\":\"redis-port:mall-basic\",\"comment\":\"\",\"lineNum\":21,\"id\":119,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":22,\"id\":120,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.rabbitmq.host\",\"value\":\"rabbitmq-port:mall-basic\",\"comment\":\"\",\"lineNum\":26,\"id\":124,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.rabbitmq.port\",\"value\":\"5672\",\"comment\":\"\",\"lineNum\":27,\"id\":125,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.rabbitmq.username\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":28,\"id\":126,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.rabbitmq.password\",\"value\":\"root\",\"comment\":\"\",\"lineNum\":29,\"id\":127,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.rabbitmq.virtual-host\",\"value\":\"/\",\"comment\":\"\",\"lineNum\":30,\"id\":128,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"},{\"namespaceId\":5,\"key\":\"spring.zipkin.base-url\",\"value\":\"http://zipkin-port.mall-basic:9411\",\"comment\":\"\",\"lineNum\":32,\"id\":130,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:12:52\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:12:52\"}],\"updateItems\":[],\"deleteItems\":[]}', 'springcloudseckill', 'default', 'application', NULL, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Commit` VALUES (6, '{\"createItems\":[{\"namespaceId\":6,\"key\":\"server.port\",\"value\":\"8000\",\"comment\":\"\",\"lineNum\":1,\"id\":131,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"spring.application.name\",\"value\":\"spring-cloud-zuul\",\"comment\":\"\",\"lineNum\":3,\"id\":133,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"eureka.client.service-url.defaultZone\",\"value\":\"http://eureka-port.mall-basic:8080/eureka\",\"comment\":\"\",\"lineNum\":5,\"id\":135,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"eureka.client.register-with-eureka\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":7,\"id\":137,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-a.path\",\"value\":\"/api-order/**\",\"comment\":\"\",\"lineNum\":11,\"id\":141,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-a.service-id\",\"value\":\"spring-cloud-order\",\"comment\":\"\",\"lineNum\":12,\"id\":142,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-b.path\",\"value\":\"/api-member/**\",\"comment\":\"\",\"lineNum\":15,\"id\":145,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-b.service-id\",\"value\":\"spring-cloud-member\",\"comment\":\"\",\"lineNum\":16,\"id\":146,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-c.path\",\"value\":\"/api-goods/**\",\"comment\":\"\",\"lineNum\":19,\"id\":149,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-c.service-id\",\"value\":\"spring-cloud-goods\",\"comment\":\"\",\"lineNum\":20,\"id\":150,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-d.path\",\"value\":\"/api-remarks/**\",\"comment\":\"\",\"lineNum\":23,\"id\":153,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-d.service-id\",\"value\":\"spring-cloud-remarks\",\"comment\":\"\",\"lineNum\":24,\"id\":154,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-e.path\",\"value\":\"/api-seckill/**\",\"comment\":\"\",\"lineNum\":27,\"id\":157,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.api-e.service-id\",\"value\":\"spring-cloud-seckill\",\"comment\":\"\",\"lineNum\":28,\"id\":158,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"ribbon.ReadTimeout\",\"value\":\"3000\",\"comment\":\"\",\"lineNum\":32,\"id\":162,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"logging.config\",\"value\":\"classpath:logback-zuul.xml\",\"comment\":\"\",\"lineNum\":36,\"id\":166,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"logging.path\",\"value\":\"/opt/logs/zuul\",\"comment\":\"\",\"lineNum\":37,\"id\":167,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"spring.redis.host\",\"value\":\"redis-port:mall-basic\",\"comment\":\"\",\"lineNum\":40,\"id\":170,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"spring.redis.port\",\"value\":\"6379\",\"comment\":\"\",\"lineNum\":41,\"id\":171,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"spring.http.encoding.charset\",\"value\":\"UTF-8\",\"comment\":\"\",\"lineNum\":44,\"id\":174,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"spring.http.encoding.enabled\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":45,\"id\":175,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"spring.http.encoding.force\",\"value\":\"true\",\"comment\":\"\",\"lineNum\":46,\"id\":176,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"},{\"namespaceId\":6,\"key\":\"zuul.routes.sensitive-headers\",\"value\":\"\",\"comment\":\"\",\"lineNum\":49,\"id\":179,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-07-10 10:14:14\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-07-10 10:14:14\"}],\"updateItems\":[],\"deleteItems\":[]}', 'springcloudzuul', 'default', 'application', NULL, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');

-- ----------------------------
-- Table structure for GrayReleaseRule
-- ----------------------------
DROP TABLE IF EXISTS `GrayReleaseRule`;
CREATE TABLE `GrayReleaseRule`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) NULL DEFAULT 1 COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '灰度规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of GrayReleaseRule
-- ----------------------------

-- ----------------------------
-- Table structure for Instance
-- ----------------------------
DROP TABLE IF EXISTS `Instance`;
CREATE TABLE `Instance`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`AppId`, `ClusterName`, `Ip`, `DataCenter`) USING BTREE,
  INDEX `IX_IP`(`Ip`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '使用配置的应用实例' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Instance
-- ----------------------------

-- ----------------------------
-- Table structure for InstanceConfig
-- ----------------------------
DROP TABLE IF EXISTS `InstanceConfig`;
CREATE TABLE `InstanceConfig`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp(0) NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_UNIQUE_KEY`(`InstanceId`, `ConfigAppId`, `ConfigNamespaceName`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Valid_Namespace`(`ConfigAppId`, `ConfigClusterName`, `ConfigNamespaceName`, `DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用实例的配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of InstanceConfig
-- ----------------------------

-- ----------------------------
-- Table structure for Item
-- ----------------------------
DROP TABLE IF EXISTS `Item`;
CREATE TABLE `Item`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `Key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注释',
  `LineNum` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_GroupId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置项目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Item
-- ----------------------------
INSERT INTO `Item` VALUES (1, 1, 'server.port', '8001', '', 1, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (2, 1, '', '', '###服务名称(服务注册到eureka名称)', 2, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (3, 1, 'spring.application.name', 'spring-cloud-member', '', 3, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (4, 1, '', '', '###服务注册到eureka地址', 4, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (5, 1, 'eureka.client.service-url.defaultZone', 'http://eureka-port.mall-basic:8080/eureka', '', 5, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (6, 1, '', '', '###注册到eureka', 6, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (7, 1, 'eureka.client.register-with-eureka', 'true', '', 7, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (8, 1, '', '', '###从eureka上获取注册信息', 8, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (9, 1, '', '', '###swagger2 API扫包', 9, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (10, 1, 'swagger.base-package', 'com.example.member.api', '', 10, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (11, 1, '', '', '###mybatis日志', 11, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (12, 1, '', '', '#logging.level.com.example.mapper=DEBUG', 12, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (13, 1, '', '', '###datasource', 13, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (14, 1, 'spring.datasource.driver-class-name', 'com.mysql.cj.jdbc.Driver', '', 14, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (15, 1, 'spring.datasource.url', 'jdbc:mysql://mysql-port.mall-basic:3306/example_member?useUnicode=true&characterEncoding=utf8', '', 15, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (16, 1, 'spring.datasource.username', 'root', '', 16, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (17, 1, 'spring.datasource.password', 'root', '', 17, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (18, 1, '', '', '###redis配置', 18, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (19, 1, 'spring.redis.host', 'redis-port:mall-basic', '', 19, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (20, 1, 'spring.redis.port', '6379', '', 20, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (21, 1, 'mybatis.configuration.map-underscore-to-camel-case', 'true', '', 21, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (22, 1, 'loginType.supportPlatforms', 'Android,IOS,PC', '', 22, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (23, 1, '', '', '', 23, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (24, 1, '', '', '#zipkin', 24, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (25, 1, 'spring.zipkin.base-url', 'http://zipkin-port.mall-basic:9411', '', 25, b'0', 'apollo', '2020-07-10 10:05:04', 'apollo', '2020-07-10 10:05:04');
INSERT INTO `Item` VALUES (26, 2, 'server.port', '8003', '', 1, b'0', 'apollo', '2020-07-10 10:06:48', 'apollo', '2020-07-10 10:06:48');
INSERT INTO `Item` VALUES (27, 2, '', '', '###服务名称(服务注册到eureka名称)', 2, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (28, 2, 'spring.application.name', 'spring-cloud-goods', '', 3, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (29, 2, '', '', '###服务注册到eureka地址', 4, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (30, 2, 'eureka.client.service-url.defaultZone', 'http://eureka-port.mall-basic:8080/eureka', '', 5, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (31, 2, '', '', '###注册到eureka', 6, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (32, 2, 'eureka.client.register-with-eureka', 'true', '', 7, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (33, 2, '', '', '###从eureka上获取注册信息', 8, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (34, 2, '', '', '###', 9, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (35, 2, '', '', '###swagger2 API扫包', 10, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (36, 2, 'swagger.base-package', 'com.example.goods.api', '', 11, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (37, 2, '', '', '###mybatis日志', 12, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (38, 2, '', '', '#logging.level.com.example.mapper=DEBUG', 13, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (39, 2, '', '', '###datasource', 14, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (40, 2, 'spring.datasource.driver-class-name', 'com.mysql.cj.jdbc.Driver', '', 15, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (41, 2, 'spring.datasource.url', 'jdbc:mysql://mysql-port.mall-basic:3306/example_goods?useUnicode=true&characterEncoding=utf8', '', 16, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (42, 2, 'spring.datasource.username', 'root', '', 17, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (43, 2, 'spring.datasource.password', 'root', '', 18, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (44, 2, 'mybatis.configuration.map-underscore-to-camel-case', 'true', '', 19, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (45, 2, '', '', '', 20, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (46, 2, '', '', '###redis配置', 21, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (47, 2, 'spring.redis.host', 'redis-port:mall-basic', '', 22, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (48, 2, 'spring.redis.port', '6379', '', 23, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (49, 2, '', '', '#zipkin', 24, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (50, 2, 'spring.zipkin.base-url', 'http://zipkin-port.mall-basic:9411', '', 25, b'0', 'apollo', '2020-07-10 10:06:49', 'apollo', '2020-07-10 10:06:49');
INSERT INTO `Item` VALUES (51, 3, 'server.port', '8004', '', 1, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (52, 3, '', '', '###服务名称(服务注册到eureka名称)', 2, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (53, 3, 'spring.application.name', 'spring-cloud-remarks', '', 3, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (54, 3, '', '', '###服务注册到eureka地址', 4, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (55, 3, 'eureka.client.service-url.defaultZone', 'http://eureka-port.mall-basic:8080/eureka', '', 5, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (56, 3, '', '', '###注册到eureka', 6, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (57, 3, 'eureka.client.register-with-eureka', 'true', '', 7, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (58, 3, '', '', '###从eureka上获取注册信息', 8, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (59, 3, '', '', '###', 9, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (60, 3, '', '', '###swagger2 API扫包', 10, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (61, 3, 'swagger.base-package', 'com.example.remarks.api', '', 11, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (62, 3, '', '', '###mybatis日志', 12, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (63, 3, '', '', '#logging.level.com.example.mapper=DEBUG', 13, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (64, 3, '', '', '###datasource', 14, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (65, 3, 'spring.datasource.driver-class-name', 'com.mysql.cj.jdbc.Driver', '', 15, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (66, 3, 'spring.datasource.url', 'jdbc:mysql://mysql-port.mall-basic:3306/example_remarks?useUnicode=true&characterEncoding=utf8', '', 16, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (67, 3, 'spring.datasource.username', 'root', '', 17, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (68, 3, 'spring.datasource.password', 'root', '', 18, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (69, 3, 'mybatis.configuration.map-underscore-to-camel-case', 'true', '', 19, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (70, 3, '', '', '', 20, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (71, 3, '', '', '###redis配置', 21, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (72, 3, 'spring.redis.host', 'redis-port:mall-basic', '', 22, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (73, 3, 'spring.redis.port', '6379', '', 23, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (74, 3, '', '', '#zipkin', 24, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (75, 3, 'spring.zipkin.base-url', 'http://zipkin-port.mall-basic:9411', '', 25, b'0', 'apollo', '2020-07-10 10:08:15', 'apollo', '2020-07-10 10:08:15');
INSERT INTO `Item` VALUES (76, 4, 'server.port', '8005', '', 1, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (77, 4, '', '', '###服务名称(服务注册到eureka名称)', 2, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (78, 4, 'spring.application.name', 'spring-cloud-order', '', 3, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (79, 4, '', '', '###服务注册到eureka地址', 4, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (80, 4, 'eureka.client.service-url.defaultZone', 'http://eureka-port.mall-basic:8080/eureka', '', 5, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (81, 4, '', '', '###注册到eureka', 6, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (82, 4, 'eureka.client.register-with-eureka', 'true', '', 7, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (83, 4, '', '', '###从eureka上获取注册信息', 8, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (84, 4, '', '', '###swagger2 API扫包', 9, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (85, 4, 'swagger.base-package', 'com.example.order.api', '', 10, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (86, 4, '', '', '###mybatis日志', 11, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (87, 4, '', '', '#logging.level.com.example.mapper=DEBUG', 12, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (88, 4, '', '', '###datasource', 13, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (89, 4, 'spring.datasource.driver-class-name', 'com.mysql.cj.jdbc.Driver', '', 14, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (90, 4, 'spring.datasource.url', 'jdbc:mysql://mysql-port.mall-basic:3306/example_order?useUnicode=true&characterEncoding=utf8', '', 15, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (91, 4, 'spring.datasource.username', 'root', '', 16, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (92, 4, 'spring.datasource.password', 'root', '', 17, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (93, 4, '', '', '###redis配置', 18, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (94, 4, 'spring.redis.host', 'redis-port:mall-basic', '', 19, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (95, 4, 'spring.redis.port', '6379', '', 20, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (96, 4, 'mybatis.configuration.map-underscore-to-camel-case', 'true', '', 21, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (97, 4, '', '', '#zipkin', 22, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (98, 4, 'spring.zipkin.base-url', 'http://zipkin-port.mall-basic:9411', '', 23, b'0', 'apollo', '2020-07-10 10:09:51', 'apollo', '2020-07-10 10:09:51');
INSERT INTO `Item` VALUES (99, 5, 'server.port', '8002', '', 1, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (100, 5, '', '', '###服务名称(服务注册到eureka名称)', 2, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (101, 5, 'spring.application.name', 'spring-cloud-seckill', '', 3, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (102, 5, '', '', '###服务注册到eureka地址', 4, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (103, 5, 'eureka.client.service-url.defaultZone', 'http://eureka-port.mall-basic:8080/eureka', '', 5, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (104, 5, '', '', '###注册到eureka', 6, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (105, 5, 'eureka.client.register-with-eureka', 'true', '', 7, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (106, 5, '', '', '###从eureka上获取注册信息', 8, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (107, 5, '', '', '###', 9, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (108, 5, '', '', '###swagger2 API扫包', 10, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (109, 5, 'swagger.base-package', 'com.example.seckill.api', '', 11, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (110, 5, '', '', '###mybatis日志', 12, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (111, 5, '', '', '#logging.level.com.example.mapper=DEBUG', 13, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (112, 5, '', '', '###datasource', 14, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (113, 5, 'spring.datasource.driver-class-name', 'com.mysql.cj.jdbc.Driver', '', 15, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (114, 5, 'spring.datasource.url', 'jdbc:mysql://mysql-port.mall-basic:3306/example_seckill?useUnicode=true&characterEncoding=utf8', '', 16, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (115, 5, 'spring.datasource.username', 'root', '', 17, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (116, 5, 'spring.datasource.password', 'root', '', 18, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (117, 5, 'mybatis.configuration.map-underscore-to-camel-case', 'true', '', 19, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (118, 5, '', '', '###redis配置', 20, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (119, 5, 'spring.redis.host', 'redis-port:mall-basic', '', 21, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (120, 5, 'spring.redis.port', '6379', '', 22, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (121, 5, '', '', '', 23, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (122, 5, '', '', '', 24, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (123, 5, '', '', '###rabbitmq配置', 25, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (124, 5, 'spring.rabbitmq.host', 'rabbitmq-port:mall-basic', '', 26, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (125, 5, 'spring.rabbitmq.port', '5672', '', 27, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (126, 5, 'spring.rabbitmq.username', 'root', '', 28, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (127, 5, 'spring.rabbitmq.password', 'root', '', 29, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (128, 5, 'spring.rabbitmq.virtual-host', '/', '', 30, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (129, 5, '', '', '#zipkin', 31, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (130, 5, 'spring.zipkin.base-url', 'http://zipkin-port.mall-basic:9411', '', 32, b'0', 'apollo', '2020-07-10 10:12:52', 'apollo', '2020-07-10 10:12:52');
INSERT INTO `Item` VALUES (131, 6, 'server.port', '8000', '', 1, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (132, 6, '', '', '###服务名称(服务注册到eureka名称)', 2, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (133, 6, 'spring.application.name', 'spring-cloud-zuul', '', 3, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (134, 6, '', '', '###服务注册到eureka地址', 4, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (135, 6, 'eureka.client.service-url.defaultZone', 'http://eureka-port.mall-basic:8080/eureka', '', 5, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (136, 6, '', '', '###注册到eureka', 6, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (137, 6, 'eureka.client.register-with-eureka', 'true', '', 7, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (138, 6, '', '', '', 8, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (139, 6, '', '', '### 配置网关反向代理', 9, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (140, 6, '', '', '### 以 /api-order/访问转发到会员服务', 10, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (141, 6, 'zuul.routes.api-a.path', '/api-order/**', '', 11, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (142, 6, 'zuul.routes.api-a.service-id', 'spring-cloud-order', '', 12, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (143, 6, '', '', '', 13, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (144, 6, '', '', '### 以 /api-member/访问转发到订单服务', 14, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (145, 6, 'zuul.routes.api-b.path', '/api-member/**', '', 15, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (146, 6, 'zuul.routes.api-b.service-id', 'spring-cloud-member', '', 16, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (147, 6, '', '', '', 17, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (148, 6, '', '', '### 以 /api-goods/访问转发到订单服务', 18, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (149, 6, 'zuul.routes.api-c.path', '/api-goods/**', '', 19, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (150, 6, 'zuul.routes.api-c.service-id', 'spring-cloud-goods', '', 20, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (151, 6, '', '', '', 21, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (152, 6, '', '', '### 以 /api-remarks/访问转发到订单服务', 22, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (153, 6, 'zuul.routes.api-d.path', '/api-remarks/**', '', 23, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (154, 6, 'zuul.routes.api-d.service-id', 'spring-cloud-remarks', '', 24, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (155, 6, '', '', '', 25, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (156, 6, '', '', '### 以 /api-seckill/访问转发到订单服务', 26, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (157, 6, 'zuul.routes.api-e.path', '/api-seckill/**', '', 27, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (158, 6, 'zuul.routes.api-e.service-id', 'spring-cloud-seckill', '', 28, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (159, 6, '', '', '', 29, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (160, 6, '', '', '', 30, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (161, 6, '', '', '###zuul内置ribbon，当使用服务名访问时使用ribbon配置', 31, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (162, 6, 'ribbon.ReadTimeout', '3000', '', 32, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (163, 6, '', '', '###使用url访问时使用zuul配置', 33, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (164, 6, '', '', '#zuul.host.socket-timeout-millis=3000', 34, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (165, 6, '', '', '', 35, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (166, 6, 'logging.config', 'classpath:logback-zuul.xml', '', 36, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (167, 6, 'logging.path', '/opt/logs/zuul', '', 37, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (168, 6, '', '', '', 38, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (169, 6, '', '', '###redis配置', 39, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (170, 6, 'spring.redis.host', 'redis-port:mall-basic', '', 40, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (171, 6, 'spring.redis.port', '6379', '', 41, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (172, 6, '', '', '', 42, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (173, 6, '', '', '###相应内容编码', 43, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (174, 6, 'spring.http.encoding.charset', 'UTF-8', '', 44, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (175, 6, 'spring.http.encoding.enabled', 'true', '', 45, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (176, 6, 'spring.http.encoding.force', 'true', '', 46, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (177, 6, '', '', '', 47, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (178, 6, '', '', '# 不拦截请求头', 48, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');
INSERT INTO `Item` VALUES (179, 6, 'zuul.routes.sensitive-headers', '', '', 49, b'0', 'apollo', '2020-07-10 10:14:14', 'apollo', '2020-07-10 10:14:14');

-- ----------------------------
-- Table structure for Namespace
-- ----------------------------
DROP TABLE IF EXISTS `Namespace`;
CREATE TABLE `Namespace`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_NamespaceName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_NamespaceName`(`NamespaceName`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '命名空间' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Namespace
-- ----------------------------
INSERT INTO `Namespace` VALUES (1, 'springcloudmember', 'default', 'application', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Namespace` VALUES (2, 'springcloudgoods', 'default', 'application', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Namespace` VALUES (3, 'springcloudremarks', 'default', 'application', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Namespace` VALUES (4, 'springcloudorder', 'default', 'application', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Namespace` VALUES (5, 'springcloudseckill', 'default', 'application', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Namespace` VALUES (6, 'springcloudzuul', 'default', 'application', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');

-- ----------------------------
-- Table structure for NamespaceLock
-- ----------------------------
DROP TABLE IF EXISTS `NamespaceLock`;
CREATE TABLE `NamespaceLock`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  `IsDeleted` bit(1) NULL DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_NamespaceId`(`NamespaceId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'namespace的编辑锁' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of NamespaceLock
-- ----------------------------

-- ----------------------------
-- Table structure for Release
-- ----------------------------
DROP TABLE IF EXISTS `Release`;
CREATE TABLE `Release`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId_ClusterName_GroupName`(`AppId`(191), `ClusterName`(191), `NamespaceName`(191)) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ReleaseKey`(`ReleaseKey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Release
-- ----------------------------
INSERT INTO `Release` VALUES (1, '20200710100508-0bf0e4c284dfa4de', '20200710100505-release', '', 'springcloudmember', 'default', 'application', '{\"server.port\":\"8001\",\"spring.application.name\":\"spring-cloud-member\",\"eureka.client.service-url.defaultZone\":\"http://eureka-port.mall-basic:8080/eureka\",\"eureka.client.register-with-eureka\":\"true\",\"swagger.base-package\":\"com.example.member.api\",\"spring.datasource.driver-class-name\":\"com.mysql.cj.jdbc.Driver\",\"spring.datasource.url\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_member?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"spring.datasource.username\":\"root\",\"spring.datasource.password\":\"root\",\"spring.redis.host\":\"redis-port:mall-basic\",\"spring.redis.port\":\"6379\",\"mybatis.configuration.map-underscore-to-camel-case\":\"true\",\"loginType.supportPlatforms\":\"Android,IOS,PC\",\"spring.zipkin.base-url\":\"http://zipkin-port.mall-basic:9411\"}', b'0', b'0', 'apollo', '2020-07-10 10:05:09', 'apollo', '2020-07-10 10:05:09');
INSERT INTO `Release` VALUES (2, '20200710100652-881ce4c284dfa4df', '20200710100649-release', '', 'springcloudgoods', 'default', 'application', '{\"server.port\":\"8003\",\"spring.application.name\":\"spring-cloud-goods\",\"eureka.client.service-url.defaultZone\":\"http://eureka-port.mall-basic:8080/eureka\",\"eureka.client.register-with-eureka\":\"true\",\"swagger.base-package\":\"com.example.goods.api\",\"spring.datasource.driver-class-name\":\"com.mysql.cj.jdbc.Driver\",\"spring.datasource.url\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_goods?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"spring.datasource.username\":\"root\",\"spring.datasource.password\":\"root\",\"mybatis.configuration.map-underscore-to-camel-case\":\"true\",\"spring.redis.host\":\"redis-port:mall-basic\",\"spring.redis.port\":\"6379\",\"spring.zipkin.base-url\":\"http://zipkin-port.mall-basic:9411\"}', b'0', b'0', 'apollo', '2020-07-10 10:06:52', 'apollo', '2020-07-10 10:06:52');
INSERT INTO `Release` VALUES (3, '20200710100819-dc79e4c284dfa4e0', '20200710100817-release', '', 'springcloudremarks', 'default', 'application', '{\"server.port\":\"8004\",\"spring.application.name\":\"spring-cloud-remarks\",\"eureka.client.service-url.defaultZone\":\"http://eureka-port.mall-basic:8080/eureka\",\"eureka.client.register-with-eureka\":\"true\",\"swagger.base-package\":\"com.example.remarks.api\",\"spring.datasource.driver-class-name\":\"com.mysql.cj.jdbc.Driver\",\"spring.datasource.url\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_remarks?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"spring.datasource.username\":\"root\",\"spring.datasource.password\":\"root\",\"mybatis.configuration.map-underscore-to-camel-case\":\"true\",\"spring.redis.host\":\"redis-port:mall-basic\",\"spring.redis.port\":\"6379\",\"spring.zipkin.base-url\":\"http://zipkin-port.mall-basic:9411\"}', b'0', b'0', 'apollo', '2020-07-10 10:08:20', 'apollo', '2020-07-10 10:08:20');
INSERT INTO `Release` VALUES (4, '20200710100953-5a14e4c284dfa4e1', '20200710100951-release', '', 'springcloudorder', 'default', 'application', '{\"server.port\":\"8005\",\"spring.application.name\":\"spring-cloud-order\",\"eureka.client.service-url.defaultZone\":\"http://eureka-port.mall-basic:8080/eureka\",\"eureka.client.register-with-eureka\":\"true\",\"swagger.base-package\":\"com.example.order.api\",\"spring.datasource.driver-class-name\":\"com.mysql.cj.jdbc.Driver\",\"spring.datasource.url\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_order?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"spring.datasource.username\":\"root\",\"spring.datasource.password\":\"root\",\"spring.redis.host\":\"redis-port:mall-basic\",\"spring.redis.port\":\"6379\",\"mybatis.configuration.map-underscore-to-camel-case\":\"true\",\"spring.zipkin.base-url\":\"http://zipkin-port.mall-basic:9411\"}', b'0', b'0', 'apollo', '2020-07-10 10:09:53', 'apollo', '2020-07-10 10:09:53');
INSERT INTO `Release` VALUES (5, '20200710101254-f7b5e4c284dfa4e2', '20200710101252-release', '', 'springcloudseckill', 'default', 'application', '{\"server.port\":\"8002\",\"spring.application.name\":\"spring-cloud-seckill\",\"eureka.client.service-url.defaultZone\":\"http://eureka-port.mall-basic:8080/eureka\",\"eureka.client.register-with-eureka\":\"true\",\"swagger.base-package\":\"com.example.seckill.api\",\"spring.datasource.driver-class-name\":\"com.mysql.cj.jdbc.Driver\",\"spring.datasource.url\":\"jdbc:mysql://mysql-port.mall-basic:3306/example_seckill?useUnicode\\u003dtrue\\u0026characterEncoding\\u003dutf8\",\"spring.datasource.username\":\"root\",\"spring.datasource.password\":\"root\",\"mybatis.configuration.map-underscore-to-camel-case\":\"true\",\"spring.redis.host\":\"redis-port:mall-basic\",\"spring.redis.port\":\"6379\",\"spring.rabbitmq.host\":\"rabbitmq-port:mall-basic\",\"spring.rabbitmq.port\":\"5672\",\"spring.rabbitmq.username\":\"root\",\"spring.rabbitmq.password\":\"root\",\"spring.rabbitmq.virtual-host\":\"/\",\"spring.zipkin.base-url\":\"http://zipkin-port.mall-basic:9411\"}', b'0', b'0', 'apollo', '2020-07-10 10:12:55', 'apollo', '2020-07-10 10:12:55');
INSERT INTO `Release` VALUES (6, '20200710101418-f068e4c284dfa4e3', '20200710101416-release', '', 'springcloudzuul', 'default', 'application', '{\"server.port\":\"8000\",\"spring.application.name\":\"spring-cloud-zuul\",\"eureka.client.service-url.defaultZone\":\"http://eureka-port.mall-basic:8080/eureka\",\"eureka.client.register-with-eureka\":\"true\",\"zuul.routes.api-a.path\":\"/api-order/**\",\"zuul.routes.api-a.service-id\":\"spring-cloud-order\",\"zuul.routes.api-b.path\":\"/api-member/**\",\"zuul.routes.api-b.service-id\":\"spring-cloud-member\",\"zuul.routes.api-c.path\":\"/api-goods/**\",\"zuul.routes.api-c.service-id\":\"spring-cloud-goods\",\"zuul.routes.api-d.path\":\"/api-remarks/**\",\"zuul.routes.api-d.service-id\":\"spring-cloud-remarks\",\"zuul.routes.api-e.path\":\"/api-seckill/**\",\"zuul.routes.api-e.service-id\":\"spring-cloud-seckill\",\"ribbon.ReadTimeout\":\"3000\",\"logging.config\":\"classpath:logback-zuul.xml\",\"logging.path\":\"/opt/logs/zuul\",\"spring.redis.host\":\"redis-port:mall-basic\",\"spring.redis.port\":\"6379\",\"spring.http.encoding.charset\":\"UTF-8\",\"spring.http.encoding.enabled\":\"true\",\"spring.http.encoding.force\":\"true\",\"zuul.routes.sensitive-headers\":\"\"}', b'0', b'0', 'apollo', '2020-07-10 10:14:18', 'apollo', '2020-07-10 10:14:18');

-- ----------------------------
-- Table structure for ReleaseHistory
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseHistory`;
CREATE TABLE `ReleaseHistory`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Namespace`(`AppId`, `ClusterName`, `NamespaceName`, `BranchName`) USING BTREE,
  INDEX `IX_ReleaseId`(`ReleaseId`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布历史' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ReleaseHistory
-- ----------------------------
INSERT INTO `ReleaseHistory` VALUES (1, 'springcloudmember', 'default', 'application', 'default', 1, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-07-10 10:05:09', 'apollo', '2020-07-10 10:05:09');
INSERT INTO `ReleaseHistory` VALUES (2, 'springcloudgoods', 'default', 'application', 'default', 2, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-07-10 10:06:52', 'apollo', '2020-07-10 10:06:52');
INSERT INTO `ReleaseHistory` VALUES (3, 'springcloudremarks', 'default', 'application', 'default', 3, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-07-10 10:08:20', 'apollo', '2020-07-10 10:08:20');
INSERT INTO `ReleaseHistory` VALUES (4, 'springcloudorder', 'default', 'application', 'default', 4, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-07-10 10:09:53', 'apollo', '2020-07-10 10:09:53');
INSERT INTO `ReleaseHistory` VALUES (5, 'springcloudseckill', 'default', 'application', 'default', 5, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-07-10 10:12:55', 'apollo', '2020-07-10 10:12:55');
INSERT INTO `ReleaseHistory` VALUES (6, 'springcloudzuul', 'default', 'application', 'default', 6, 0, 0, '{\"isEmergencyPublish\":false}', b'0', 'apollo', '2020-07-10 10:14:18', 'apollo', '2020-07-10 10:14:18');

-- ----------------------------
-- Table structure for ReleaseMessage
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseMessage`;
CREATE TABLE `ReleaseMessage`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_Message`(`Message`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发布消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ReleaseMessage
-- ----------------------------
INSERT INTO `ReleaseMessage` VALUES (1, 'springcloudmember+default+application', '2020-07-10 10:05:09');
INSERT INTO `ReleaseMessage` VALUES (2, 'springcloudgoods+default+application', '2020-07-10 10:06:52');
INSERT INTO `ReleaseMessage` VALUES (3, 'springcloudremarks+default+application', '2020-07-10 10:08:20');
INSERT INTO `ReleaseMessage` VALUES (4, 'springcloudorder+default+application', '2020-07-10 10:09:53');
INSERT INTO `ReleaseMessage` VALUES (5, 'springcloudseckill+default+application', '2020-07-10 10:12:55');
INSERT INTO `ReleaseMessage` VALUES (6, 'springcloudzuul+default+application', '2020-07-10 10:14:18');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
  `Value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_Key`(`Key`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'eureka.service.url', 'default', 'http://eureka-port.mall-basic:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (2, 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (3, 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (4, 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (5, 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');

SET FOREIGN_KEY_CHECKS = 1;

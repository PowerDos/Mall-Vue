/*
 Navicat Premium Data Transfer

 Source Server         : mall-basic
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:30002
 Source Schema         : ApolloPortalDB

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 10/07/2020 10:15:01
*/

CREATE DATABASE IF NOT EXISTS ApolloPortalDB DEFAULT CHARACTER SET = utf8mb4;

Use ApolloPortalDB;



SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Table structure for Authorities
-- ----------------------------
DROP TABLE IF EXISTS `Authorities`;
CREATE TABLE `Authorities`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Authority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Authorities
-- ----------------------------
INSERT INTO `Authorities` VALUES (1, 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for Consumer
-- ----------------------------
DROP TABLE IF EXISTS `Consumer`;
CREATE TABLE `Consumer`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
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
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '开放API消费者' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Consumer
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerAudit
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerAudit`;
CREATE TABLE `ConsumerAudit`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_ConsumerId`(`ConsumerId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer审计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ConsumerAudit
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerRole
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerRole`;
CREATE TABLE `ConsumerRole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_ConsumerId_RoleId`(`ConsumerId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ConsumerRole
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerToken
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerToken`;
CREATE TABLE `ConsumerToken`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) UNSIGNED NULL DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime(0) NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_Token`(`Token`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'consumer token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ConsumerToken
-- ----------------------------

-- ----------------------------
-- Table structure for Favorite
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT 10000 COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `AppId`(`AppId`(191)) USING BTREE,
  INDEX `IX_UserId`(`UserId`) USING BTREE,
  INDEX `DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '应用收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Favorite
-- ----------------------------

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_TargetId_PermissionType`(`TargetId`(191), `PermissionType`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'permission表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Permission
-- ----------------------------
INSERT INTO `Permission` VALUES (1, 'CreateApplication', 'SystemRole', b'0', 'apollo', '2020-07-10 09:57:50', 'apollo', '2020-07-10 09:57:50');
INSERT INTO `Permission` VALUES (2, 'CreateCluster', 'springcloudmember', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Permission` VALUES (3, 'CreateNamespace', 'springcloudmember', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Permission` VALUES (4, 'AssignRole', 'springcloudmember', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Permission` VALUES (5, 'ManageAppMaster', 'springcloudmember', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Permission` VALUES (6, 'ModifyNamespace', 'springcloudmember+application', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Permission` VALUES (7, 'ReleaseNamespace', 'springcloudmember+application', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Permission` VALUES (8, 'ModifyNamespace', 'springcloudmember+application+DEV', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Permission` VALUES (9, 'ReleaseNamespace', 'springcloudmember+application+DEV', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Permission` VALUES (10, 'CreateCluster', 'springcloudgoods', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Permission` VALUES (11, 'AssignRole', 'springcloudgoods', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Permission` VALUES (12, 'CreateNamespace', 'springcloudgoods', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Permission` VALUES (13, 'ManageAppMaster', 'springcloudgoods', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Permission` VALUES (14, 'ModifyNamespace', 'springcloudgoods+application', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Permission` VALUES (15, 'ReleaseNamespace', 'springcloudgoods+application', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Permission` VALUES (16, 'ModifyNamespace', 'springcloudgoods+application+DEV', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Permission` VALUES (17, 'ReleaseNamespace', 'springcloudgoods+application+DEV', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Permission` VALUES (18, 'CreateCluster', 'springcloudremarks', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Permission` VALUES (19, 'AssignRole', 'springcloudremarks', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Permission` VALUES (20, 'CreateNamespace', 'springcloudremarks', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Permission` VALUES (21, 'ManageAppMaster', 'springcloudremarks', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Permission` VALUES (22, 'ModifyNamespace', 'springcloudremarks+application', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Permission` VALUES (23, 'ReleaseNamespace', 'springcloudremarks+application', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Permission` VALUES (24, 'ModifyNamespace', 'springcloudremarks+application+DEV', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Permission` VALUES (25, 'ReleaseNamespace', 'springcloudremarks+application+DEV', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Permission` VALUES (26, 'AssignRole', 'springcloudorder', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Permission` VALUES (27, 'CreateCluster', 'springcloudorder', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Permission` VALUES (28, 'CreateNamespace', 'springcloudorder', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Permission` VALUES (29, 'ManageAppMaster', 'springcloudorder', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Permission` VALUES (30, 'ModifyNamespace', 'springcloudorder+application', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Permission` VALUES (31, 'ReleaseNamespace', 'springcloudorder+application', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Permission` VALUES (32, 'ModifyNamespace', 'springcloudorder+application+DEV', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Permission` VALUES (33, 'ReleaseNamespace', 'springcloudorder+application+DEV', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Permission` VALUES (34, 'CreateNamespace', 'springcloudseckill', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Permission` VALUES (35, 'AssignRole', 'springcloudseckill', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Permission` VALUES (36, 'CreateCluster', 'springcloudseckill', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Permission` VALUES (37, 'ManageAppMaster', 'springcloudseckill', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Permission` VALUES (38, 'ModifyNamespace', 'springcloudseckill+application', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Permission` VALUES (39, 'ReleaseNamespace', 'springcloudseckill+application', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Permission` VALUES (40, 'ModifyNamespace', 'springcloudseckill+application+DEV', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Permission` VALUES (41, 'ReleaseNamespace', 'springcloudseckill+application+DEV', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Permission` VALUES (42, 'CreateNamespace', 'springcloudzuul', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Permission` VALUES (43, 'AssignRole', 'springcloudzuul', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Permission` VALUES (44, 'CreateCluster', 'springcloudzuul', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Permission` VALUES (45, 'ManageAppMaster', 'springcloudzuul', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Permission` VALUES (46, 'ModifyNamespace', 'springcloudzuul+application', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Permission` VALUES (47, 'ReleaseNamespace', 'springcloudzuul+application', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Permission` VALUES (48, 'ModifyNamespace', 'springcloudzuul+application+DEV', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Permission` VALUES (49, 'ReleaseNamespace', 'springcloudzuul+application+DEV', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_RoleName`(`RoleName`(191)) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Role
-- ----------------------------
INSERT INTO `Role` VALUES (1, 'CreateApplication+SystemRole', b'0', 'apollo', '2020-07-10 09:57:50', 'apollo', '2020-07-10 09:57:50');
INSERT INTO `Role` VALUES (2, 'Master+springcloudmember', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Role` VALUES (3, 'ManageAppMaster+springcloudmember', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Role` VALUES (4, 'ModifyNamespace+springcloudmember+application', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Role` VALUES (5, 'ReleaseNamespace+springcloudmember+application', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Role` VALUES (6, 'ModifyNamespace+springcloudmember+application+DEV', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Role` VALUES (7, 'ReleaseNamespace+springcloudmember+application+DEV', b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `Role` VALUES (8, 'Master+springcloudgoods', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Role` VALUES (9, 'ManageAppMaster+springcloudgoods', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Role` VALUES (10, 'ModifyNamespace+springcloudgoods+application', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Role` VALUES (11, 'ReleaseNamespace+springcloudgoods+application', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Role` VALUES (12, 'ModifyNamespace+springcloudgoods+application+DEV', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Role` VALUES (13, 'ReleaseNamespace+springcloudgoods+application+DEV', b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `Role` VALUES (14, 'Master+springcloudremarks', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Role` VALUES (15, 'ManageAppMaster+springcloudremarks', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Role` VALUES (16, 'ModifyNamespace+springcloudremarks+application', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Role` VALUES (17, 'ReleaseNamespace+springcloudremarks+application', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Role` VALUES (18, 'ModifyNamespace+springcloudremarks+application+DEV', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Role` VALUES (19, 'ReleaseNamespace+springcloudremarks+application+DEV', b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `Role` VALUES (20, 'Master+springcloudorder', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Role` VALUES (21, 'ManageAppMaster+springcloudorder', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Role` VALUES (22, 'ModifyNamespace+springcloudorder+application', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Role` VALUES (23, 'ReleaseNamespace+springcloudorder+application', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Role` VALUES (24, 'ModifyNamespace+springcloudorder+application+DEV', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Role` VALUES (25, 'ReleaseNamespace+springcloudorder+application+DEV', b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `Role` VALUES (26, 'Master+springcloudseckill', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Role` VALUES (27, 'ManageAppMaster+springcloudseckill', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Role` VALUES (28, 'ModifyNamespace+springcloudseckill+application', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Role` VALUES (29, 'ReleaseNamespace+springcloudseckill+application', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Role` VALUES (30, 'ModifyNamespace+springcloudseckill+application+DEV', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Role` VALUES (31, 'ReleaseNamespace+springcloudseckill+application+DEV', b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `Role` VALUES (32, 'Master+springcloudzuul', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Role` VALUES (33, 'ManageAppMaster+springcloudzuul', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Role` VALUES (34, 'ModifyNamespace+springcloudzuul+application', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Role` VALUES (35, 'ReleaseNamespace+springcloudzuul+application', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Role` VALUES (36, 'ModifyNamespace+springcloudzuul+application+DEV', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `Role` VALUES (37, 'ReleaseNamespace+springcloudzuul+application+DEV', b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');

-- ----------------------------
-- Table structure for RolePermission
-- ----------------------------
DROP TABLE IF EXISTS `RolePermission`;
CREATE TABLE `RolePermission`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_PermissionId`(`PermissionId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和权限的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
INSERT INTO `RolePermission` VALUES (1, 1, 1, b'0', 'apollo', '2020-07-10 09:57:50', 'apollo', '2020-07-10 09:57:50');
INSERT INTO `RolePermission` VALUES (2, 2, 2, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `RolePermission` VALUES (3, 2, 3, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `RolePermission` VALUES (4, 2, 4, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `RolePermission` VALUES (5, 3, 5, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `RolePermission` VALUES (6, 4, 6, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `RolePermission` VALUES (7, 5, 7, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `RolePermission` VALUES (8, 6, 8, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `RolePermission` VALUES (9, 7, 9, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `RolePermission` VALUES (10, 8, 10, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `RolePermission` VALUES (11, 8, 11, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `RolePermission` VALUES (12, 8, 12, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `RolePermission` VALUES (13, 9, 13, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `RolePermission` VALUES (14, 10, 14, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `RolePermission` VALUES (15, 11, 15, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `RolePermission` VALUES (16, 12, 16, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `RolePermission` VALUES (17, 13, 17, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `RolePermission` VALUES (18, 14, 18, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `RolePermission` VALUES (19, 14, 19, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `RolePermission` VALUES (20, 14, 20, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `RolePermission` VALUES (21, 15, 21, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `RolePermission` VALUES (22, 16, 22, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `RolePermission` VALUES (23, 17, 23, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `RolePermission` VALUES (24, 18, 24, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `RolePermission` VALUES (25, 19, 25, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `RolePermission` VALUES (26, 20, 26, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `RolePermission` VALUES (27, 20, 27, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `RolePermission` VALUES (28, 20, 28, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `RolePermission` VALUES (29, 21, 29, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `RolePermission` VALUES (30, 22, 30, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `RolePermission` VALUES (31, 23, 31, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `RolePermission` VALUES (32, 24, 32, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `RolePermission` VALUES (33, 25, 33, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `RolePermission` VALUES (34, 26, 34, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `RolePermission` VALUES (35, 26, 35, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `RolePermission` VALUES (36, 26, 36, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `RolePermission` VALUES (37, 27, 37, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `RolePermission` VALUES (38, 28, 38, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `RolePermission` VALUES (39, 29, 39, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `RolePermission` VALUES (40, 30, 40, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `RolePermission` VALUES (41, 31, 41, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `RolePermission` VALUES (42, 32, 42, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `RolePermission` VALUES (43, 32, 43, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `RolePermission` VALUES (44, 32, 44, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `RolePermission` VALUES (45, 33, 45, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `RolePermission` VALUES (46, 34, 46, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `RolePermission` VALUES (47, 35, 47, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `RolePermission` VALUES (48, 36, 48, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `RolePermission` VALUES (49, 37, 49, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '配置项Key',
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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置服务自身配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES (1, 'apollo.portal.envs', 'dev', '可支持的环境列表', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (2, 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (3, 'superAdmin', 'apollo', 'Portal超级管理员', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (4, 'api.readTimeout', '10000', 'http接口read timeout', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (5, 'consumer.token.salt', 'someSalt', 'consumer token salt', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (6, 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (7, 'configView.memberOnly.envs', 'pro', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');
INSERT INTO `ServerConfig` VALUES (8, 'apollo.portal.meta.servers', '{}', '各环境Meta Service列表', b'0', 'default', '2020-07-10 01:56:22', '', '2020-07-10 01:56:22');

-- ----------------------------
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole`  (
  `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_DataChange_LastTime`(`DataChange_LastTime`) USING BTREE,
  INDEX `IX_RoleId`(`RoleId`) USING BTREE,
  INDEX `IX_UserId_RoleId`(`UserId`, `RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和role的绑定表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of UserRole
-- ----------------------------
INSERT INTO `UserRole` VALUES (1, 'apollo', 2, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `UserRole` VALUES (2, 'apollo', 4, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `UserRole` VALUES (3, 'apollo', 5, b'0', 'apollo', '2020-07-10 10:01:27', 'apollo', '2020-07-10 10:01:27');
INSERT INTO `UserRole` VALUES (4, 'apollo', 8, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `UserRole` VALUES (5, 'apollo', 10, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `UserRole` VALUES (6, 'apollo', 11, b'0', 'apollo', '2020-07-10 10:05:46', 'apollo', '2020-07-10 10:05:46');
INSERT INTO `UserRole` VALUES (7, 'apollo', 14, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `UserRole` VALUES (8, 'apollo', 16, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `UserRole` VALUES (9, 'apollo', 17, b'0', 'apollo', '2020-07-10 10:07:17', 'apollo', '2020-07-10 10:07:17');
INSERT INTO `UserRole` VALUES (10, 'apollo', 20, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `UserRole` VALUES (11, 'apollo', 22, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `UserRole` VALUES (12, 'apollo', 23, b'0', 'apollo', '2020-07-10 10:08:50', 'apollo', '2020-07-10 10:08:50');
INSERT INTO `UserRole` VALUES (13, 'apollo', 26, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `UserRole` VALUES (14, 'apollo', 28, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `UserRole` VALUES (15, 'apollo', 29, b'0', 'apollo', '2020-07-10 10:10:16', 'apollo', '2020-07-10 10:10:16');
INSERT INTO `UserRole` VALUES (16, 'apollo', 32, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `UserRole` VALUES (17, 'apollo', 34, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');
INSERT INTO `UserRole` VALUES (18, 'apollo', 35, b'0', 'apollo', '2020-07-10 10:13:15', 'apollo', '2020-07-10 10:13:15');

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users`  (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES (1, 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', 1);

SET FOREIGN_KEY_CHECKS = 1;

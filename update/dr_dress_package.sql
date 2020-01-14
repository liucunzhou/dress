/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : drseven

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 13/01/2020 21:23:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dr_dress_package
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress_package`;
CREATE TABLE `dr_dress_package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rent_price` decimal(10, 2) DEFAULT NULL,
  `sale_price` decimal(10, 2) DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `status` int(11) DEFAULT NULL,
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_dress_package
-- ----------------------------
INSERT INTO `dr_dress_package` VALUES (1, NULL, '588', 588.00, 588.00, '定制698衬衫+婚鞋+皮鞋', 0, 1, 1577504938, 1577504938, NULL);
INSERT INTO `dr_dress_package` VALUES (2, NULL, '9999', 9999.00, 9999.00, '定制6980元西服+租赁28888主纱+出门服+齐地纱+敬酒服', 0, 2, 1577504974, 1577504974, NULL);
INSERT INTO `dr_dress_package` VALUES (3, NULL, '4999', 4999.00, 4999.00, '定制6980元西服+租赁齐地纱+敬酒服', 0, 3, 1577504997, 1577504997, NULL);
INSERT INTO `dr_dress_package` VALUES (4, NULL, '8999', 8999.00, 8999.00, '定制6980元西服+租赁28888元主纱+出门服+敬酒服', 0, 4, 1577505026, 1577505026, NULL);

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat Premium Data Transfer

 Source Server         : 红丝云
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : platform

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 14/05/2020 11:46:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tk_package
-- ----------------------------
DROP TABLE IF EXISTS `tk_package`;
CREATE TABLE `tk_package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `sort` int(11) NOT NULL DEFAULT 0,
  `is_valid` int(11) NOT NULL DEFAULT 0,
  `delete_time` int(11) NOT NULL DEFAULT 0,
  `modify_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tk_package
-- ----------------------------
INSERT INTO `tk_package` VALUES (1, 0, '老妖精一级消防工程师', 0.00, 10, 1, 1557218038, 1557218038, NULL);
INSERT INTO `tk_package` VALUES (2, 0, '老妖精一级给排水工程师', 0.00, 0, 0, 1557218031, 1557218031, NULL);
INSERT INTO `tk_package` VALUES (3, 0, '老妖精一级建造师', 0.00, 1, 0, 1557218034, 1557218034, NULL);
INSERT INTO `tk_package` VALUES (4, 0, '老妖精一级造价师', 0.00, 0, 0, 1557218028, 1557218028, NULL);
INSERT INTO `tk_package` VALUES (5, 0, '老妖精二级建造师', 0.00, 0, 0, 1557218025, 1557218025, NULL);
INSERT INTO `tk_package` VALUES (6, 0, '老妖精二级消防工程师', 0.00, 0, 0, 1557217855, 1557217855, NULL);
INSERT INTO `tk_package` VALUES (7, 0, '老妖精二级给排水工程师', 0.00, 0, 0, 1557217826, 1557217826, NULL);
INSERT INTO `tk_package` VALUES (8, 0, 'ddd2', 0.00, 0, 0, 1557217806, 1557217806, NULL);
INSERT INTO `tk_package` VALUES (9, 0, '测试时间23', 0.00, 0, 0, 1557217812, 1557217812, 1556030493);
INSERT INTO `tk_package` VALUES (10, 0, 'LK高端婚礼定制', 0.00, 0, 1, 1564051026, 1564051026, 1557296265);
INSERT INTO `tk_package` VALUES (11, 0, '曼格纳一站式主题婚礼会馆', 0.00, 0, 1, 1564051027, 1564051027, 1557296277);
INSERT INTO `tk_package` VALUES (12, 0, '红丝高端婚礼中心3', 0.00, 3, 1, 1564051025, 1564051025, 1557296307);
INSERT INTO `tk_package` VALUES (13, 0, '品牌', 0.00, 0, 1, 1564051027, 1564051027, 1562688340);
INSERT INTO `tk_package` VALUES (14, 0, '测试2', 0.00, 0, 0, 1562720447, 1562720447, 1562720264);
INSERT INTO `tk_package` VALUES (15, 0, '新增', 0.00, 0, 1, 1563686011, 1563686011, 1562720471);
INSERT INTO `tk_package` VALUES (16, 0, '试试', 0.00, 0, 0, 1562720518, 1562720518, 1562720516);
INSERT INTO `tk_package` VALUES (17, 0, '测试', 0.00, 0, 0, 1563686010, 1563686010, 1563024082);
INSERT INTO `tk_package` VALUES (18, 0, '测试', 0.00, 0, 0, 1563686009, 1563686009, 1563622070);
INSERT INTO `tk_package` VALUES (19, 0, '', 0.00, 0, 0, 1563686006, 1563686006, 1563622139);
INSERT INTO `tk_package` VALUES (20, 0, '', 0.00, 0, 0, 1563686002, 1563686002, 1563622148);
INSERT INTO `tk_package` VALUES (21, 0, '', 0.00, 0, 0, 1563686000, 1563686000, 1563622159);
INSERT INTO `tk_package` VALUES (22, 0, '', 0.00, 0, 0, 1563686001, 1563686001, 1563624879);
INSERT INTO `tk_package` VALUES (23, 0, '品牌测试', 0.00, 0, 1, 1564051028, 1564051028, 1563767225);
INSERT INTO `tk_package` VALUES (24, 0, '恒远永爱套系', 39999.00, 4, 1, 0, 1585543012, 1564245781);
INSERT INTO `tk_package` VALUES (25, 0, '恋恋星河套系', 35999.00, 3, 1, 0, 1585543004, 1564986459);
INSERT INTO `tk_package` VALUES (26, 0, '星月童话套系', 29999.00, 2, 1, 0, 1585542993, 1565500354);
INSERT INTO `tk_package` VALUES (27, 0, '繁花似锦套系', 26999.00, 1, 1, 0, 1585542986, 1566268417);
INSERT INTO `tk_package` VALUES (28, 0, '流光溢彩套系', 58999.00, 28, 1, 0, 1585542950, 1585542854);
INSERT INTO `tk_package` VALUES (29, 0, '此生唯一套系', 119999.00, 29, 1, 0, 1585542955, 1585542899);

-- ----------------------------
-- Table structure for tk_ritual
-- ----------------------------
DROP TABLE IF EXISTS `tk_ritual`;
CREATE TABLE `tk_ritual`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT 0,
  `title` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `sort` int(11) NOT NULL DEFAULT 0,
  `is_valid` int(11) NOT NULL DEFAULT 0,
  `delete_time` int(11) NOT NULL DEFAULT 0,
  `modify_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tk_ritual
-- ----------------------------
INSERT INTO `tk_ritual` VALUES (30, 0, '草坪婚礼', 0.00, 0, 1, 0, 1585544719, 1585544719);
INSERT INTO `tk_ritual` VALUES (31, 0, '露台仪式', 0.00, 0, 1, 0, 1585544760, 1585544740);
INSERT INTO `tk_ritual` VALUES (32, 0, '水台仪式', 0.00, 0, 1, 0, 1585544763, 1585544753);
INSERT INTO `tk_ritual` VALUES (33, 0, '仪式堂', 0.00, 0, 1, 0, 1586934792, 1586934792);

SET FOREIGN_KEY_CHECKS = 1;

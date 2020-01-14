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

 Date: 13/01/2020 21:06:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dr_dress
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress`;
CREATE TABLE `dr_dress`  (
  `goods_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品类别',
  `images` varchar(1800) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `spec_type` enum('10','20') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10' COMMENT '商品规格:10=单规格,20=多规格',
  `deduct_stock_type` enum('10','20') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '20' COMMENT '库存计算方式:10=下单减库存,20=付款减库存',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述详情',
  `sales_initial` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '初始销量',
  `sales_actual` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '实际销量',
  `goods_sort` int(11) UNSIGNED NOT NULL DEFAULT 100 COMMENT '权重',
  `delivery_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '运费模板ID',
  `goods_status` enum('10','20') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10' COMMENT '商品状态:10=上架,20=下架',
  `is_delete` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除:0=未删除,1=已删除',
  `createtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_dress
-- ----------------------------
INSERT INTO `dr_dress` VALUES (3, 'C1904115L2A', 2, '/assets/img/qrcode.png', '20', '20', '1000', 0, 0, 3, 0, '10', '0', 1577522565, 1578057298);
INSERT INTO `dr_dress` VALUES (4, '秀禾服', 2, '/assets/img/qrcode.png', '20', '20', '1000', 0, 0, 4, 0, '10', '0', 1577526427, 1578445329);

SET FOREIGN_KEY_CHECKS = 1;

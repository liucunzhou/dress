/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : dress

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 20/04/2020 21:58:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dr_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `dr_auth_rule`;
CREATE TABLE `dr_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 371 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dr_auth_rule
-- ----------------------------
INSERT INTO `dr_auth_rule` VALUES (2, 'file', 0, 'general', '常规管理', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 1000, 'normal');
INSERT INTO `dr_auth_rule` VALUES (5, 'file', 0, 'auth', '组织架构', 'fa fa-sitemap', '', '', 1, 1497429920, 1573140230, 7000, 'normal');
INSERT INTO `dr_auth_rule` VALUES (6, 'file', 2, '/admin/general/config', '系统设置', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `dr_auth_rule` VALUES (9, 'file', 5, '/admin/organize.user/index', '员工管理', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1573143871, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (11, 'file', 5, '/admin/organize.auth/role', '权限分组', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1573143937, 97, 'normal');
INSERT INTO `dr_auth_rule` VALUES (12, 'file', 5, '/admin/auth.AuthRule/index', '菜单规则', 'fa fa-bars', '', '', 1, 1497429920, 1573143997, 90, 'normal');
INSERT INTO `dr_auth_rule` VALUES (13, 'file', 2, '/admin/dictionary.store/index', ' 门店管理', 'fa fa-circle-o', '', '', 1, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `dr_auth_rule` VALUES (66, 'file', 0, 'customer', '客资管理', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 10000, 'normal');
INSERT INTO `dr_auth_rule` VALUES (67, 'file', 66, '/admin/customer.customer/index', '我的客资', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 2, 'normal');
INSERT INTO `dr_auth_rule` VALUES (68, 'file', 66, '/admin/customer.customer/promoter', '邀约客资', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 3, 'normal');
INSERT INTO `dr_auth_rule` VALUES (160, 'file', 0, 'dress', '礼服管理', 'fa fa-connectdevelop', '', '', 1, 1573132819, 1575970290, 8000, 'normal');
INSERT INTO `dr_auth_rule` VALUES (161, 'file', 160, '/admin/dress.dress/index', '礼服列表', 'fa fa-circle-o', '', '', 1, 1573132819, 1577510490, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (162, 'file', 161, '/admin/dress.dress/create', '礼服添加', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (165, 'file', 161, '/admin/dress.dress/edit', '礼服编辑', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (166, 'file', 161, '/admin/dress.dress/delete', '删除礼服', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (176, 'file', 160, '/admin/dress.package/index', '礼服套餐', 'fa fa-circle-o', '', '', 1, 1573133975, 1573133992, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (177, 'file', 176, '/admin/dress.package/create', '套餐添加', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (180, 'file', 176, '/admin/dress.package/edit', '套餐编辑', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (181, 'file', 176, '/admin/dress.package/delete', '套餐删除', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (194, 'file', 160, '/admin/dress.scrap/index', '报废管理', 'fa fa-circle-o', '', '', 1, 1573136222, 1573136260, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (195, 'file', 194, '/admin/dress.scrap/create', '添加报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (198, 'file', 194, '/admin/dress.scrap/edit', '编辑报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (199, 'file', 194, '/admin/dress.scrap/delete', '删除报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (203, 'file', 160, '/admin/dress.supplier/index', '供应商管理', 'fa fa-circle-o', '', '', 1, 1573136222, 1573136272, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (213, 'file', 212, '/admin/notice/index', '通知类型管理', 'fa fa-bell-o', '', '', 1, 1573138137, 1573144222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (216, 'file', 213, '/admin/notice/add', '通知类型添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (217, 'file', 213, '/admin/notice/edit', '通知类型编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (218, 'file', 213, '/admin/notice/delete', '通知类型删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (223, 'file', 2, '/admin/dictionary.source/index', '来源管理', 'fa fa-circle-o', '', '', 1, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (225, 'file', 222, '/admin/dictionary.source/create', '客资来源添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (226, 'file', 222, '/admin/dictionary.source/edit', '客资来源编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (227, 'file', 222, '/admin/dictionary.source/delete', '客资来源删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (231, 'file', 212, '/admin/dictionary.leave/index', '请假类型管理', 'fa fa-at', '', '', 1, 1573138137, 1573144270, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (234, 'file', 231, '/admin/dictionary.leave/create', '请假类型添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (235, 'file', 231, '/admin/dictionary.leave/edit', '请假类型编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (236, 'file', 231, '/admin/dictionary.leave/delete', '请假类型删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (240, 'file', 2, '/admin/dictionary.size/index', '礼服尺寸', 'fa fa-calculator', '', '', 1, 1573139595, 1573144287, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (243, 'file', 240, '/admin/dictionary.size/create', '礼服尺寸添加', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (244, 'file', 240, '/admin/dictionary.size/edit', '礼服尺寸编辑', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (245, 'file', 240, '/admin/dictionary.size/delete', '礼服尺寸删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (250, 'file', 2, '/admin/dictionary.payment/index', '支付方式', 'fa fa-circle-o', '', '', 1, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (252, 'file', 2, '/admin/dictionary.color/index', '颜色管理', 'fa fa-circle-o', '', '', 1, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (294, 'file', 5, '/admin/organize.department/index', '部门管理', 'fa fa-bank', '', '', 1, 1573143705, 1573144087, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (310, 'file', 370, '/admin/sale.sale/index', '销售订单', 'fa fa-circle-o', '', '', 1, 1575970796, 1575970866, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (316, 'file', 370, '/admin/rent.rent/index', '租赁订单', 'fa fa-circle-o', '', '', 1, 1575970796, 1575970849, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (322, 'file', 160, '/admin/dress.DressCategory/index', '礼服分类', 'fa fa-circle-o', '', '', 1, 1577519168, 1577519168, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (369, 'file', 66, '/admin/customer.customer/sea', '客资公海', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (370, 'file', 0, 'order', '订单管理', 'fa fa-list', '', '', 1, NULL, NULL, 9000, 'normal');

SET FOREIGN_KEY_CHECKS = 1;

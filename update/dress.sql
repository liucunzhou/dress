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

 Date: 16/01/2020 14:22:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dr_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `dr_auth_group`;
CREATE TABLE `dr_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dr_auth_group
-- ----------------------------
INSERT INTO `dr_auth_group` VALUES (1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal');
INSERT INTO `dr_auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal');
INSERT INTO `dr_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal');
INSERT INTO `dr_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal');
INSERT INTO `dr_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');
INSERT INTO `dr_auth_group` VALUES (6, 1, '店长', '160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,303,310,311,312,313,314,315,316,317,318,319,320,321', 1576737610, 1576737725, 'normal');
INSERT INTO `dr_auth_group` VALUES (7, 1, '礼服师', '', 1576737626, 1576737626, 'normal');
INSERT INTO `dr_auth_group` VALUES (8, 1, '邀约', '', 1576737643, 1576737643, 'normal');
INSERT INTO `dr_auth_group` VALUES (9, 1, '推广', '', 1576737665, 1576737665, 'normal');
INSERT INTO `dr_auth_group` VALUES (10, 1, '供应商', '', 1576737693, 1576737693, 'normal');
INSERT INTO `dr_auth_group` VALUES (11, 1, '老板', '', 1576737709, 1576737709, 'normal');

-- ----------------------------
-- Table structure for dr_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `dr_auth_group_access`;
CREATE TABLE `dr_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限分组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dr_auth_group_access
-- ----------------------------
INSERT INTO `dr_auth_group_access` VALUES (1, 1);
INSERT INTO `dr_auth_group_access` VALUES (2, 6);
INSERT INTO `dr_auth_group_access` VALUES (3, 7);
INSERT INTO `dr_auth_group_access` VALUES (4, 7);
INSERT INTO `dr_auth_group_access` VALUES (5, 6);
INSERT INTO `dr_auth_group_access` VALUES (5, 7);

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
) ENGINE = InnoDB AUTO_INCREMENT = 370 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dr_auth_rule
-- ----------------------------
INSERT INTO `dr_auth_rule` VALUES (1, 'file', 0, 'dashboard', '控制台', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `dr_auth_rule` VALUES (2, 'file', 0, 'general', '常规管理', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `dr_auth_rule` VALUES (5, 'file', 0, 'auth', '组织架构', 'fa fa-sitemap', '', '', 1, 1497429920, 1573140230, 119, 'normal');
INSERT INTO `dr_auth_rule` VALUES (6, 'file', 2, 'general/config', '系统设置', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `dr_auth_rule` VALUES (9, 'file', 5, 'auth/admin', '管理员管理', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1573143871, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', '管理员日志', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1573140785, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (11, 'file', 5, 'auth/group', '角色组', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1573143937, 97, 'normal');
INSERT INTO `dr_auth_rule` VALUES (12, 'file', 5, 'auth/index', '菜单规则', 'fa fa-bars', '', '', 1, 1497429920, 1573143997, 90, 'normal');
INSERT INTO `dr_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `dr_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `dr_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `dr_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `dr_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `dr_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `dr_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `dr_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `dr_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `dr_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `dr_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `dr_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `dr_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `dr_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `dr_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `dr_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `dr_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `dr_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `dr_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `dr_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (66, 'file', 0, 'customer', '客资管理', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (67, 'file', 66, 'customer/index', '我的客资', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (68, 'file', 66, 'customer/today', '今日跟进', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (160, 'file', 0, 'dress', '礼服管理', 'fa fa-connectdevelop', '', '', 1, 1573132819, 1575970290, 136, 'normal');
INSERT INTO `dr_auth_rule` VALUES (161, 'file', 160, 'dress/index', '礼服列表', 'fa fa-circle-o', '', '', 1, 1573132819, 1577510490, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (162, 'file', 161, 'dress/create', '礼服添加', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (163, 'file', 161, 'dress/recyclebin', '礼服回收站', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (165, 'file', 161, 'dress/edit', '礼服编辑', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (166, 'file', 161, 'dress/delete', '删除礼服', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (167, 'file', 161, 'dress/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (168, 'file', 161, 'dress/restore', '礼服还原', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (169, 'file', 161, 'dress/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (176, 'file', 160, 'package/index', '礼服套餐', 'fa fa-circle-o', '', '', 1, 1573133975, 1573133992, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (177, 'file', 176, 'package/create', '套餐添加', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (178, 'file', 176, 'package/recyclebin', '套餐回收站', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (180, 'file', 176, 'package/edit', '套餐编辑', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (181, 'file', 176, 'package/delete', '套餐删除', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (182, 'file', 176, 'package/destroy', '套餐真实删除', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (183, 'file', 176, 'package/restore', '套餐还原', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (194, 'file', 160, 'scrap/index', '报废管理', 'fa fa-circle-o', '', '', 1, 1573136222, 1573136260, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (195, 'file', 194, 'scrap/create', '添加报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (198, 'file', 194, 'scrap/edit', '编辑报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (199, 'file', 194, 'scrap/delete', '删除报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (200, 'file', 194, 'scrap/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (203, 'file', 160, 'supplier/index', '供应商管理', 'fa fa-circle-o', '', '', 1, 1573136222, 1573136272, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (206, 'file', 203, 'supplier/create', '添加', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (207, 'file', 203, 'supplier/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (208, 'file', 203, 'supplier/delete', '删除', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (213, 'file', 212, 'notice/index', '通知类型管理', 'fa fa-bell-o', '', '', 1, 1573138137, 1573144222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (216, 'file', 213, 'notice/add', '通知类型添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (217, 'file', 213, 'notice/edit', '通知类型编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (218, 'file', 213, 'notice/delete', '通知类型删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (223, 'file', 2, 'source/index', '来源管理', 'fa fa-circle-o', '', '', 1, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (225, 'file', 222, 'source/create', '客资来源添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (226, 'file', 222, 'source/edit', '客资来源编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (227, 'file', 222, 'source/delete', '客资来源删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (231, 'file', 212, 'leave/index', '请假类型管理', 'fa fa-at', '', '', 1, 1573138137, 1573144270, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (234, 'file', 231, 'leave/create', '请假类型添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (235, 'file', 231, 'leave/edit', '请假类型编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (236, 'file', 231, 'leave/delete', '请假类型删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (240, 'file', 2, 'size/index', '礼服尺寸', 'fa fa-calculator', '', '', 1, 1573139595, 1573144287, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (243, 'file', 240, 'size/create', '礼服尺寸添加', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (244, 'file', 240, 'size/edit', '礼服尺寸编辑', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (245, 'file', 240, 'size/delete', '礼服尺寸删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (250, 'file', 2, 'payment/index', '支付方式', 'fa fa-circle-o', '', '', 1, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (251, 'file', 249, 'dictionary/dress/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (252, 'file', 2, 'color/index', '颜色管理', 'fa fa-circle-o', '', '', 1, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (253, 'file', 249, 'dictionary/dress/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (267, 'file', 5, 'auth/notice', '通知管理', 'fa fa-bell', '', '', 1, 1573140632, 1573144052, 95, 'normal');
INSERT INTO `dr_auth_rule` VALUES (268, 'file', 267, 'auth/notice/index', '查看', 'fa fa-circle-o', '', '', 0, 1573140632, 1573140632, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (269, 'file', 267, 'auth/notice/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573140632, 1573140632, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (270, 'file', 267, 'auth/notice/add', '添加', 'fa fa-circle-o', '', '', 0, 1573140632, 1573140632, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (271, 'file', 267, 'auth/notice/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573140632, 1573140632, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (272, 'file', 267, 'auth/notice/del', '删除', 'fa fa-circle-o', '', '', 0, 1573140632, 1573140632, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (273, 'file', 267, 'auth/notice/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573140632, 1573140632, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (274, 'file', 267, 'auth/notice/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573140632, 1573140632, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (275, 'file', 267, 'auth/notice/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573140632, 1573140632, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (276, 'file', 5, 'auth/leave', '请假管理', 'fa fa-bookmark', '', '', 1, 1573141955, 1573144068, 94, 'normal');
INSERT INTO `dr_auth_rule` VALUES (277, 'file', 276, 'auth/leave/index', '查看', 'fa fa-circle-o', '', '', 0, 1573141955, 1573141955, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (278, 'file', 276, 'auth/leave/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573141955, 1573141955, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (279, 'file', 276, 'auth/leave/add', '添加', 'fa fa-circle-o', '', '', 0, 1573141955, 1573141955, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (280, 'file', 276, 'auth/leave/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573141955, 1573141955, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (281, 'file', 276, 'auth/leave/del', '删除', 'fa fa-circle-o', '', '', 0, 1573141955, 1573141955, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (282, 'file', 276, 'auth/leave/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573141955, 1573141955, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (283, 'file', 276, 'auth/leave/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573141955, 1573141955, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (284, 'file', 276, 'auth/leave/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573141955, 1573141955, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (285, 'file', 5, 'auth/position', '职位管理', 'fa fa-circle-o', '', '', 1, 1573142040, 1573143919, 98, 'normal');
INSERT INTO `dr_auth_rule` VALUES (286, 'file', 285, 'auth/position/index', '查看', 'fa fa-circle-o', '', '', 0, 1573142040, 1573142040, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (287, 'file', 285, 'auth/position/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573142040, 1573142040, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (288, 'file', 285, 'auth/position/add', '添加', 'fa fa-circle-o', '', '', 0, 1573142040, 1573142040, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (289, 'file', 285, 'auth/position/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573142040, 1573142040, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (290, 'file', 285, 'auth/position/del', '删除', 'fa fa-circle-o', '', '', 0, 1573142040, 1573142040, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (291, 'file', 285, 'auth/position/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573142040, 1573142040, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (292, 'file', 285, 'auth/position/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573142040, 1573142040, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (293, 'file', 285, 'auth/position/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573142040, 1573142040, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (294, 'file', 5, 'auth/department', '部门管理', 'fa fa-bank', '', '', 1, 1573143705, 1573144087, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (295, 'file', 294, 'auth/department/index', '查看', 'fa fa-circle-o', '', '', 0, 1573143705, 1573143705, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (296, 'file', 294, 'auth/department/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573143705, 1573143705, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (297, 'file', 294, 'auth/department/add', '添加', 'fa fa-circle-o', '', '', 0, 1573143705, 1573143705, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (298, 'file', 294, 'auth/department/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573143705, 1573143705, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (299, 'file', 294, 'auth/department/del', '删除', 'fa fa-circle-o', '', '', 0, 1573143705, 1573143705, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (300, 'file', 294, 'auth/department/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573143705, 1573143705, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (301, 'file', 294, 'auth/department/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573143705, 1573143705, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (302, 'file', 294, 'auth/department/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573143705, 1573143705, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (303, 'file', 0, 'order', '订单管理', 'fa fa-list', '', '', 1, 1575970127, 1575970320, 137, 'normal');
INSERT INTO `dr_auth_rule` VALUES (310, 'file', 303, 'sale/index', '销售订单', 'fa fa-circle-o', '', '', 1, 1575970796, 1575970866, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (316, 'file', 303, 'rent/index', '租赁订单', 'fa fa-circle-o', '', '', 1, 1575970796, 1575970849, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (322, 'file', 160, 'DressCategory/index', '礼服分类', 'fa fa-circle-o', '', '', 1, 1577519168, 1577519168, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (369, 'file', 66, 'customer/sea', '客资公海', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 1, 'normal');

-- ----------------------------
-- Table structure for dr_color
-- ----------------------------
DROP TABLE IF EXISTS `dr_color`;
CREATE TABLE `dr_color`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_color
-- ----------------------------
INSERT INTO `dr_color` VALUES (1, '红色', 'normal', 0, 1579082078, 1579082078, NULL);
INSERT INTO `dr_color` VALUES (2, '桔色', 'normal', 0, 1579082279, 1579082279, NULL);

-- ----------------------------
-- Table structure for dr_customer
-- ----------------------------
DROP TABLE IF EXISTS `dr_customer`;
CREATE TABLE `dr_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) DEFAULT 0,
  `source_id` int(11) NOT NULL DEFAULT 0,
  `visit_times` int(11) NOT NULL DEFAULT 0,
  `realname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `sex` int(11) DEFAULT 0,
  `mobile` int(11) DEFAULT 0,
  `mobile1` int(11) DEFAULT 0,
  `mobile2` int(11) DEFAULT 0,
  `mobile3` int(11) DEFAULT 0,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `weigh` int(11) DEFAULT 0,
  `createtime` int(11) DEFAULT 0,
  `updatetime` int(11) DEFAULT 0,
  `deletetime` int(11) DEFAULT 0,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_dress
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress`;
CREATE TABLE `dr_dress`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
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
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '显示状态',
  `sku` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `rent_price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `sale_price` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `weigh` int(11) NOT NULL DEFAULT 0,
  `size_id` int(11) DEFAULT 0,
  `color_id` int(11) DEFAULT 0,
  `supplier_id` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_dress
-- ----------------------------
INSERT INTO `dr_dress` VALUES (3, 'C1904115L2A', 2, '/assets/img/qrcode.png', '20', '20', '1000', 0, 0, 3, 0, '10', '0', 1577522565, 1579085396, 'normal', '2020100001', 3000.00, 5000.00, 0, 1, 1, 0);
INSERT INTO `dr_dress` VALUES (4, '秀禾礼服', 2, '/assets/img/qrcode.png', '20', '20', '1000', 0, 0, 4, 0, '10', '0', 1577526427, 1579085462, 'normal', '2020100002', 1000.00, 2000.00, 0, 2, 1, 0);

-- ----------------------------
-- Table structure for dr_dress_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress_category`;
CREATE TABLE `dr_dress_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT 0,
  `updatetime` int(11) DEFAULT 0,
  `deletetime` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_dress_category
-- ----------------------------
INSERT INTO `dr_dress_category` VALUES (1, '出门纱', 'normal', 118, 1579079283, NULL, NULL);
INSERT INTO `dr_dress_category` VALUES (2, '秀禾服', 'normal', 0, 1579079283, NULL, NULL);
INSERT INTO `dr_dress_category` VALUES (3, '男士礼服', 'normal', 0, 1579079283, 1579079283, NULL);

-- ----------------------------
-- Table structure for dr_dress_package
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress_package`;
CREATE TABLE `dr_dress_package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_no` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `operate_id` int(11) DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rent_price` decimal(10, 2) DEFAULT NULL,
  `sale_price` decimal(10, 2) UNSIGNED DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_dress_package
-- ----------------------------
INSERT INTO `dr_dress_package` VALUES (1, NULL, NULL, '588', 588.00, 588.00, '定制698衬衫+婚鞋+皮鞋', '0', 1, 1577504938, 1577504938, NULL);
INSERT INTO `dr_dress_package` VALUES (2, NULL, NULL, '9999', 9999.00, 9999.00, '定制6980元西服+租赁28888主纱+出门服+齐地纱+敬酒服', '0', 2, 1577504974, 1577504974, NULL);
INSERT INTO `dr_dress_package` VALUES (3, NULL, NULL, '4999', 4999.00, 4999.00, '定制6980元西服+租赁齐地纱+敬酒服', '0', 3, 1577504997, 1577504997, NULL);
INSERT INTO `dr_dress_package` VALUES (4, NULL, NULL, '8999', 8999.00, 8999.00, '定制6980元西服+租赁28888元主纱+出门服+敬酒服', '0', 4, 1577505026, 1577505026, NULL);
INSERT INTO `dr_dress_package` VALUES (5, '001', NULL, '001', 3000.00, 5000.00, NULL, 'normal', 0, 1579083482, 1579083482, NULL);
INSERT INTO `dr_dress_package` VALUES (6, '20200002', NULL, '20200002', 3000.00, 6000.00, NULL, 'normal', 0, 1579083515, 1579083515, NULL);

-- ----------------------------
-- Table structure for dr_payment
-- ----------------------------
DROP TABLE IF EXISTS `dr_payment`;
CREATE TABLE `dr_payment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_payment
-- ----------------------------
INSERT INTO `dr_payment` VALUES (1, '微信', 'normal', 0, 1579081801, 1579081801, NULL);
INSERT INTO `dr_payment` VALUES (2, '支付宝', 'normal', 0, 1579081912, 1579081912, NULL);
INSERT INTO `dr_payment` VALUES (3, '现金', 'normal', 0, 1579081919, 1579081919, NULL);
INSERT INTO `dr_payment` VALUES (4, 'POS机', 'normal', 0, 1579082297, 1579082297, NULL);

-- ----------------------------
-- Table structure for dr_rent
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent`;
CREATE TABLE `dr_rent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) NOT NULL DEFAULT 0,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'normal',
  `rent_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'init',
  `fetch_date` int(11) NOT NULL DEFAULT 0,
  `rent_date` int(11) NOT NULL DEFAULT 0,
  `back_date` int(11) NOT NULL DEFAULT 0,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `updatetime` int(11) NOT NULL DEFAULT 0,
  `deletetime` int(11) NOT NULL DEFAULT 0,
  `realname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `totals` decimal(10, 2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_rent
-- ----------------------------
INSERT INTO `dr_rent` VALUES (1, 0, 0, '20200116131834234353', 'normal', 'init', 0, 1579104000, 1579104000, 1579147493, 1579147493, 0, 'liucunzhou', '18321277411', 10000.00);
INSERT INTO `dr_rent` VALUES (2, 0, 0, '20200116131834234354', 'normal', 'init', 0, 1579104000, 1579104000, 1579151914, 1579151914, 0, 'liucunzhou', '18321277411', 10000.00);
INSERT INTO `dr_rent` VALUES (3, 0, 0, '202001161331564612', 'normal', 'init', 0, 1579104000, 1579104000, 1579152716, 1579152716, 0, 'liucunzhou', '18321277411', 10000.00);
INSERT INTO `dr_rent` VALUES (4, 0, 0, '202001161332059238', 'normal', 'init', 0, 1579104000, 1579104000, 1579152725, 1579152725, 0, 'liucunzhou', '18321277411', 10000.00);
INSERT INTO `dr_rent` VALUES (5, 0, 0, '202001161332353498', 'normal', 'init', 0, 1579104000, 1579104000, 1579152755, 1579152755, 0, 'liucunzhou', '18321277411', 10000.00);
INSERT INTO `dr_rent` VALUES (9, 0, 0, '202001161336150878', 'normal', 'init', 0, 1579104000, 1579104000, 1579152975, 1579152975, 0, 'liucunzhou', '18321277411', 10000.00);

-- ----------------------------
-- Table structure for dr_rent_goods
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent_goods`;
CREATE TABLE `dr_rent_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rent_id` int(11) NOT NULL DEFAULT 0,
  `goods_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'goods',
  `goods_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_rent_goods
-- ----------------------------
INSERT INTO `dr_rent_goods` VALUES (1, 5, 'dress', 3, NULL, NULL);
INSERT INTO `dr_rent_goods` VALUES (2, 5, 'dress', 4, NULL, NULL);
INSERT INTO `dr_rent_goods` VALUES (3, 9, 'dress', 3, NULL, NULL);
INSERT INTO `dr_rent_goods` VALUES (4, 9, 'dress', 4, NULL, NULL);

-- ----------------------------
-- Table structure for dr_rent_payment
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent_payment`;
CREATE TABLE `dr_rent_payment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) NOT NULL DEFAULT 0,
  `rent_id` int(11) NOT NULL DEFAULT 0,
  `payment_id` int(11) NOT NULL DEFAULT 0,
  `pay_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'full',
  `pay_money` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `createtime` int(11) NOT NULL DEFAULT 0,
  `updatetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_scrap
-- ----------------------------
DROP TABLE IF EXISTS `dr_scrap`;
CREATE TABLE `dr_scrap`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scrap_no` char(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `operate_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `dress_id` int(11) DEFAULT NULL,
  `deal_user_id` int(11) DEFAULT NULL,
  `confirm_user_id` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `udpatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  `confirmtime` int(11) DEFAULT NULL,
  `confirm_status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dr_size
-- ----------------------------
DROP TABLE IF EXISTS `dr_size`;
CREATE TABLE `dr_size`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_size
-- ----------------------------
INSERT INTO `dr_size` VALUES (1, 'L', 'normal', 0, 1579080236, 1579080236, NULL);
INSERT INTO `dr_size` VALUES (2, 'XL', 'normal', 0, 1579081970, 1579081970, NULL);
INSERT INTO `dr_size` VALUES (3, 'XXXL', 'normal', 0, 1579082021, 1579082021, NULL);

-- ----------------------------
-- Table structure for dr_source
-- ----------------------------
DROP TABLE IF EXISTS `dr_source`;
CREATE TABLE `dr_source`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_source
-- ----------------------------
INSERT INTO `dr_source` VALUES (1, '大众点评', 'normal', 0, 1579082364, 1579082364, NULL);
INSERT INTO `dr_source` VALUES (2, '抖音', 'normal', 0, 1579082373, 1579082373, NULL);
INSERT INTO `dr_source` VALUES (3, '微博', 'normal', 0, 1579082387, 1579082387, NULL);
INSERT INTO `dr_source` VALUES (4, '微信朋友圈', 'normal', 0, 1579082394, 1579082394, NULL);
INSERT INTO `dr_source` VALUES (5, '朋友转介绍', 'normal', 0, 1579082405, 1579082405, NULL);
INSERT INTO `dr_source` VALUES (6, '自然进店', 'normal', 0, 1579082425, 1579082425, NULL);

-- ----------------------------
-- Table structure for dr_supplier
-- ----------------------------
DROP TABLE IF EXISTS `dr_supplier`;
CREATE TABLE `dr_supplier`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `realname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `bank` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '银行名称',
  `bank_account` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号名称\n',
  `bank_account_num` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '银行账号',
  `weigh` int(11) DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'normal',
  `createtime` int(11) DEFAULT NULL,
  `udpatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_supplier
-- ----------------------------
INSERT INTO `dr_supplier` VALUES (1, '金犀数据', NULL, '18321277411', '山海静安区东海大厦', '', '', '', 0, 'normal', 1579082576, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

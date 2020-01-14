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

 Date: 14/01/2020 20:56:44
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
INSERT INTO `dr_auth_rule` VALUES (7, 'file', 2, 'Category/index', '类型管理', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `dr_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
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
INSERT INTO `dr_auth_rule` VALUES (185, 'file', 160, 'dress/storage', '入库管理', 'fa fa-circle-o', '', '', 1, 1573135025, 1573135043, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (194, 'file', 160, 'scrap/index', '报废管理', 'fa fa-circle-o', '', '', 1, 1573136222, 1573136260, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (195, 'file', 194, 'scrap/create', '添加报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (198, 'file', 194, 'scrap/edit', '编辑报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (199, 'file', 194, 'scrap/delete', '删除报废', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (200, 'file', 194, 'scrap/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (203, 'file', 160, 'supplier/index', '供应商管理', 'fa fa-circle-o', '', '', 1, 1573136222, 1573136272, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (206, 'file', 203, 'supplier/create', '添加', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (207, 'file', 203, 'supplier/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (208, 'file', 203, 'supplier/delete', '删除', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (212, 'file', 0, 'dictionary', '字典管理', 'fa fa-briefcase', '', '', 1, 1573138137, 1573140318, 135, 'normal');
INSERT INTO `dr_auth_rule` VALUES (213, 'file', 212, 'notice/index', '通知类型管理', 'fa fa-bell-o', '', '', 1, 1573138137, 1573144222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (216, 'file', 213, 'notice/add', '通知类型添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (217, 'file', 213, 'notice/edit', '通知类型编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (218, 'file', 213, 'notice/delete', '通知类型删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (223, 'file', 212, 'source/index', '客资来源管理', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (225, 'file', 222, 'source/create', '客资来源添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (226, 'file', 222, 'source/edit', '客资来源编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (227, 'file', 222, 'source/delete', '客资来源删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (231, 'file', 212, 'leave/index', '请假类型管理', 'fa fa-at', '', '', 1, 1573138137, 1573144270, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (234, 'file', 231, 'leave/create', '请假类型添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (235, 'file', 231, 'leave/edit', '请假类型编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (236, 'file', 231, 'leave/delete', '请假类型删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (240, 'file', 212, 'size/index', '礼服尺寸管理', 'fa fa-calculator', '', '', 1, 1573139595, 1573144287, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (243, 'file', 240, 'size/create', '礼服尺寸添加', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (244, 'file', 240, 'size/edit', '礼服尺寸编辑', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (245, 'file', 240, 'size/delete', '礼服尺寸删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (250, 'file', 249, 'dictionary/dress/index', '查看', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (251, 'file', 249, 'dictionary/dress/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (252, 'file', 249, 'dictionary/dress/add', '添加', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (253, 'file', 249, 'dictionary/dress/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (254, 'file', 249, 'dictionary/dress/del', '删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (255, 'file', 249, 'dictionary/dress/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (256, 'file', 249, 'dictionary/dress/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (257, 'file', 249, 'dictionary/dress/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (258, 'file', 212, 'dictionary/payment', '支付方式', 'fa fa-cubes', '', '', 1, 1573139595, 1573144202, 10, 'normal');
INSERT INTO `dr_auth_rule` VALUES (259, 'file', 258, 'dictionary/payment/index', '查看', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (260, 'file', 258, 'dictionary/payment/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (261, 'file', 258, 'dictionary/payment/add', '添加', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (262, 'file', 258, 'dictionary/payment/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (263, 'file', 258, 'dictionary/payment/del', '删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (264, 'file', 258, 'dictionary/payment/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (265, 'file', 258, 'dictionary/payment/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (266, 'file', 258, 'dictionary/payment/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
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
INSERT INTO `dr_auth_rule` VALUES (310, 'file', 303, 'order/sale', '销售订单', 'fa fa-circle-o', '', '', 1, 1575970796, 1575970866, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (311, 'file', 310, 'order/sale/index', '查看', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (312, 'file', 310, 'order/sale/add', '添加', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (313, 'file', 310, 'order/sale/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (314, 'file', 310, 'order/sale/del', '删除', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (315, 'file', 310, 'order/sale/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (316, 'file', 303, 'order/rent', '租赁订单', 'fa fa-circle-o', '', '', 1, 1575970796, 1575970849, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (317, 'file', 316, 'order/rent/index', '查看', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (318, 'file', 316, 'order/rent/add', '添加', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (319, 'file', 316, 'order/rent/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (320, 'file', 316, 'order/rent/del', '删除', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (321, 'file', 316, 'order/rent/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1575970796, 1575970796, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (322, 'file', 160, 'DressCategory/index', '礼服分类', 'fa fa-circle-o', '', '', 1, 1577519168, 1577519168, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (369, 'file', 66, 'customer/sea', '客资公海', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 1, 'normal');

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
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '显示状态',
  PRIMARY KEY (`goods_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dr_dress
-- ----------------------------
INSERT INTO `dr_dress` VALUES (3, 'C1904115L2A', 2, '/assets/img/qrcode.png', '20', '20', '1000', 0, 0, 3, 0, '10', '0', 1577522565, 1578057298, 'normal');
INSERT INTO `dr_dress` VALUES (4, '秀禾服', 2, '/assets/img/qrcode.png', '20', '20', '1000', 0, 0, 4, 0, '10', '0', 1577526427, 1578445329, 'normal');

-- ----------------------------
-- Table structure for dr_dress_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress_category`;
CREATE TABLE `dr_dress_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `status` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `udpatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

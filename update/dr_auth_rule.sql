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

 Date: 13/01/2020 17:41:22
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
) ENGINE = InnoDB AUTO_INCREMENT = 367 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dr_auth_rule
-- ----------------------------
INSERT INTO `dr_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `dr_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `dr_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', 'Category tips', 0, 1497429920, 1573138687, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1578448223, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (5, 'file', 0, 'auth', '组织架构', 'fa fa-sitemap', '', '', 1, 1497429920, 1573140230, 119, 'normal');
INSERT INTO `dr_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `dr_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `dr_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `dr_auth_rule` VALUES (9, 'file', 5, 'auth/admin', '管理员管理', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1573143871, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', '管理员日志', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1573140785, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (11, 'file', 5, 'auth/group', '角色组', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1573143937, 97, 'normal');
INSERT INTO `dr_auth_rule` VALUES (12, 'file', 5, 'auth/rule', '菜单规则', 'fa fa-bars', '', '', 1, 1497429920, 1573143997, 90, 'normal');
INSERT INTO `dr_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `dr_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `dr_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `dr_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `dr_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `dr_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `dr_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `dr_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `dr_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `dr_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `dr_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `dr_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `dr_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `dr_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `dr_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `dr_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `dr_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `dr_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `dr_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `dr_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `dr_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `dr_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `dr_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal');
INSERT INTO `dr_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal');
INSERT INTO `dr_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal');
INSERT INTO `dr_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal');
INSERT INTO `dr_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal');
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
INSERT INTO `dr_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (153, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', 1, 1573120790, 1573120790, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (154, 'file', 153, 'command/index', '查看', 'fa fa-circle-o', '', '', 0, 1573120790, 1573120790, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (155, 'file', 153, 'command/add', '添加', 'fa fa-circle-o', '', '', 0, 1573120790, 1573120790, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (156, 'file', 153, 'command/detail', '详情', 'fa fa-circle-o', '', '', 0, 1573120790, 1573120790, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (157, 'file', 153, 'command/execute', '运行', 'fa fa-circle-o', '', '', 0, 1573120790, 1573120790, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (158, 'file', 153, 'command/del', '删除', 'fa fa-circle-o', '', '', 0, 1573120790, 1573120790, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (159, 'file', 153, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573120790, 1573120790, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (160, 'file', 0, 'dress', '礼服管理', 'fa fa-connectdevelop', '', '', 1, 1573132819, 1575970290, 136, 'normal');
INSERT INTO `dr_auth_rule` VALUES (161, 'file', 160, 'dress/dress', '礼服列表', 'fa fa-circle-o', '', '', 1, 1573132819, 1577510490, 100, 'normal');
INSERT INTO `dr_auth_rule` VALUES (162, 'file', 161, 'dress/dress/index', '查看', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (163, 'file', 161, 'dress/dress/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (164, 'file', 161, 'dress/dress/add', '添加', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (165, 'file', 161, 'dress/dress/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (166, 'file', 161, 'dress/dress/del', '删除', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (167, 'file', 161, 'dress/dress/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (168, 'file', 161, 'dress/dress/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (169, 'file', 161, 'dress/dress/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573132819, 1573132819, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (170, 'file', 160, 'dress/dress_set', '礼服组合', 'fa fa-circle-o', '', '', 1, 1573133617, 1577519180, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (171, 'file', 170, 'dress/dress_set/index', '查看', 'fa fa-circle-o', '', '', 0, 1573133617, 1573133617, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (172, 'file', 170, 'dress/dress_set/add', '添加', 'fa fa-circle-o', '', '', 0, 1573133617, 1573133617, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (173, 'file', 170, 'dress/dress_set/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573133617, 1573133617, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (174, 'file', 170, 'dress/dress_set/del', '删除', 'fa fa-circle-o', '', '', 0, 1573133617, 1573133617, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (175, 'file', 170, 'dress/dress_set/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573133617, 1573133617, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (176, 'file', 160, 'dress/dress_package', '礼服套餐', 'fa fa-circle-o', '', '', 1, 1573133975, 1573133992, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (177, 'file', 176, 'dress/dress_package/index', '查看', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (178, 'file', 176, 'dress/dress_package/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (179, 'file', 176, 'dress/dress_package/add', '添加', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (180, 'file', 176, 'dress/dress_package/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (181, 'file', 176, 'dress/dress_package/del', '删除', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (182, 'file', 176, 'dress/dress_package/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (183, 'file', 176, 'dress/dress_package/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (184, 'file', 176, 'dress/dress_package/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573133975, 1573133975, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (185, 'file', 160, 'dress/storage', '入库管理', 'fa fa-circle-o', '', '', 1, 1573135025, 1573135043, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (186, 'file', 185, 'dress/storage/index', '查看', 'fa fa-circle-o', '', '', 0, 1573135025, 1573135025, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (187, 'file', 185, 'dress/storage/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573135025, 1573135025, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (188, 'file', 185, 'dress/storage/add', '添加', 'fa fa-circle-o', '', '', 0, 1573135025, 1573135025, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (189, 'file', 185, 'dress/storage/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573135025, 1573135025, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (190, 'file', 185, 'dress/storage/del', '删除', 'fa fa-circle-o', '', '', 0, 1573135025, 1573135025, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (191, 'file', 185, 'dress/storage/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573135025, 1573135025, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (192, 'file', 185, 'dress/storage/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573135025, 1573135025, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (193, 'file', 185, 'dress/storage/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573135025, 1573135025, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (194, 'file', 160, 'dress/scrap', '报废管理', 'fa fa-circle-o', '', '', 1, 1573136222, 1573136260, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (195, 'file', 194, 'dress/scrap/index', '查看', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (196, 'file', 194, 'dress/scrap/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (197, 'file', 194, 'dress/scrap/add', '添加', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (198, 'file', 194, 'dress/scrap/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (199, 'file', 194, 'dress/scrap/del', '删除', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (200, 'file', 194, 'dress/scrap/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (201, 'file', 194, 'dress/scrap/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (202, 'file', 194, 'dress/scrap/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (203, 'file', 160, 'dress/supplier', '供应商管理', 'fa fa-circle-o', '', '', 1, 1573136222, 1573136272, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (204, 'file', 203, 'dress/supplier/index', '查看', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (205, 'file', 203, 'dress/supplier/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (206, 'file', 203, 'dress/supplier/add', '添加', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (207, 'file', 203, 'dress/supplier/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (208, 'file', 203, 'dress/supplier/del', '删除', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (209, 'file', 203, 'dress/supplier/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (210, 'file', 203, 'dress/supplier/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (211, 'file', 203, 'dress/supplier/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573136222, 1573136222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (212, 'file', 0, 'dictionary', '字典管理', 'fa fa-briefcase', '', '', 1, 1573138137, 1573140318, 135, 'normal');
INSERT INTO `dr_auth_rule` VALUES (213, 'file', 212, 'dictionary/notice', '通知类型', 'fa fa-bell-o', '', '', 1, 1573138137, 1573144222, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (214, 'file', 213, 'dictionary/notice/index', '查看', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (215, 'file', 213, 'dictionary/notice/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (216, 'file', 213, 'dictionary/notice/add', '添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (217, 'file', 213, 'dictionary/notice/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (218, 'file', 213, 'dictionary/notice/del', '删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (219, 'file', 213, 'dictionary/notice/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (220, 'file', 213, 'dictionary/notice/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (221, 'file', 213, 'dictionary/notice/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (222, 'file', 212, 'dictionary/source', '来源管理', 'fa fa-automobile', '', '', 1, 1573138137, 1573144253, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (223, 'file', 222, 'dictionary/source/index', '查看', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (224, 'file', 222, 'dictionary/source/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (225, 'file', 222, 'dictionary/source/add', '添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (226, 'file', 222, 'dictionary/source/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (227, 'file', 222, 'dictionary/source/del', '删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (228, 'file', 222, 'dictionary/source/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (229, 'file', 222, 'dictionary/source/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (230, 'file', 222, 'dictionary/source/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (231, 'file', 212, 'dictionary/leave', '请假类型', 'fa fa-at', '', '', 1, 1573138137, 1573144270, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (232, 'file', 231, 'dictionary/leave/index', '查看', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (233, 'file', 231, 'dictionary/leave/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (234, 'file', 231, 'dictionary/leave/add', '添加', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (235, 'file', 231, 'dictionary/leave/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (236, 'file', 231, 'dictionary/leave/del', '删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (237, 'file', 231, 'dictionary/leave/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (238, 'file', 231, 'dictionary/leave/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (239, 'file', 231, 'dictionary/leave/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573138137, 1573138137, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (240, 'file', 212, 'dictionary/size', '礼服尺寸', 'fa fa-calculator', '', '', 1, 1573139595, 1573144287, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (241, 'file', 240, 'dictionary/size/index', '查看', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (242, 'file', 240, 'dictionary/size/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (243, 'file', 240, 'dictionary/size/add', '添加', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (244, 'file', 240, 'dictionary/size/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (245, 'file', 240, 'dictionary/size/del', '删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (246, 'file', 240, 'dictionary/size/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (247, 'file', 240, 'dictionary/size/restore', '还原', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (248, 'file', 240, 'dictionary/size/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1573139595, 1573139595, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (249, 'file', 212, 'dictionary/dress', '礼服分类', 'fa fa-adjust', '', '', 1, 1573139595, 1573144301, 0, 'normal');
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
INSERT INTO `dr_auth_rule` VALUES (322, 'file', 160, 'dress/dress_category', '礼服分类', 'fa fa-circle-o', '', '', 1, 1577519168, 1577519168, 99, 'normal');
INSERT INTO `dr_auth_rule` VALUES (323, 'file', 0, 'example', '开发示例管理', 'fa fa-magic', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (324, 'file', 323, 'example/bootstraptable', '表格完整示例', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (325, 'file', 324, 'example/bootstraptable/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (326, 'file', 324, 'example/bootstraptable/detail', '详情', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (327, 'file', 324, 'example/bootstraptable/change', '变更', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (328, 'file', 324, 'example/bootstraptable/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (329, 'file', 324, 'example/bootstraptable/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (330, 'file', 323, 'example/customsearch', '自定义搜索', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (331, 'file', 330, 'example/customsearch/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (332, 'file', 330, 'example/customsearch/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (333, 'file', 330, 'example/customsearch/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (334, 'file', 323, 'example/customform', '自定义表单示例', 'fa fa-edit', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (335, 'file', 334, 'example/customform/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (336, 'file', 323, 'example/tablelink', '表格联动示例', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (337, 'file', 336, 'example/tablelink/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (338, 'file', 323, 'example/colorbadge', '彩色角标', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (339, 'file', 338, 'example/colorbadge/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (340, 'file', 338, 'example/colorbadge/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (341, 'file', 338, 'example/colorbadge/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (342, 'file', 323, 'example/controllerjump', '控制器间跳转', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (343, 'file', 342, 'example/controllerjump/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (344, 'file', 342, 'example/controllerjump/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (345, 'file', 342, 'example/controllerjump/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (346, 'file', 323, 'example/cxselect', '多级联动', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (347, 'file', 346, 'example/cxselect/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (348, 'file', 346, 'example/cxselect/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (349, 'file', 346, 'example/cxselect/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (350, 'file', 323, 'example/multitable', '多表格示例', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (351, 'file', 350, 'example/multitable/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (352, 'file', 350, 'example/multitable/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (353, 'file', 350, 'example/multitable/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (354, 'file', 323, 'example/relationmodel', '关联模型示例', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (355, 'file', 354, 'example/relationmodel/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (356, 'file', 354, 'example/relationmodel/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (357, 'file', 354, 'example/relationmodel/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (358, 'file', 323, 'example/tabletemplate', '表格模板示例', 'fa fa-table', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (359, 'file', 358, 'example/tabletemplate/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (360, 'file', 358, 'example/tabletemplate/detail', '详情', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (361, 'file', 358, 'example/tabletemplate/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (362, 'file', 358, 'example/tabletemplate/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (363, 'file', 323, 'example/baidumap', '百度地图示例', 'fa fa-map-pin', '', '', 1, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (364, 'file', 363, 'example/baidumap/index', '查看', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (365, 'file', 363, 'example/baidumap/map', '详情', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');
INSERT INTO `dr_auth_rule` VALUES (366, 'file', 363, 'example/baidumap/del', '删除', 'fa fa-circle-o', '', '', 0, 1578448247, 1578448247, 0, 'normal');

SET FOREIGN_KEY_CHECKS = 1;

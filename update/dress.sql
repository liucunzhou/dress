/*
Navicat MySQL Data Transfer

Source Server         : 测试服务器
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : dress

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-03-28 12:32:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dr_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `dr_auth_group`;
CREATE TABLE `dr_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

-- ----------------------------
-- Records of dr_auth_group
-- ----------------------------
INSERT INTO `dr_auth_group` VALUES ('1', '0', 'Admin group', '*', '1490883540', '149088354', 'normal');
INSERT INTO `dr_auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1490883540', '1505465692', 'normal');
INSERT INTO `dr_auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1490883540', '1502205322', 'normal');
INSERT INTO `dr_auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1490883540', '1502205350', 'normal');
INSERT INTO `dr_auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1490883540', '1502205344', 'normal');
INSERT INTO `dr_auth_group` VALUES ('6', '1', '店长', '160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,303,310,311,312,313,314,315,316,317,318,319,320,321', '1576737610', '1576737725', 'normal');
INSERT INTO `dr_auth_group` VALUES ('7', '1', '礼服师', '', '1576737626', '1576737626', 'normal');
INSERT INTO `dr_auth_group` VALUES ('8', '1', '邀约', '', '1576737643', '1576737643', 'normal');
INSERT INTO `dr_auth_group` VALUES ('9', '1', '推广', '', '1576737665', '1576737665', 'normal');
INSERT INTO `dr_auth_group` VALUES ('10', '1', '供应商', '', '1576737693', '1576737693', 'normal');
INSERT INTO `dr_auth_group` VALUES ('11', '1', '老板', '', '1576737709', '1576737709', 'normal');

-- ----------------------------
-- Table structure for dr_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `dr_auth_group_access`;
CREATE TABLE `dr_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

-- ----------------------------
-- Records of dr_auth_group_access
-- ----------------------------
INSERT INTO `dr_auth_group_access` VALUES ('1', '1');
INSERT INTO `dr_auth_group_access` VALUES ('2', '6');
INSERT INTO `dr_auth_group_access` VALUES ('3', '7');
INSERT INTO `dr_auth_group_access` VALUES ('4', '7');
INSERT INTO `dr_auth_group_access` VALUES ('5', '6');
INSERT INTO `dr_auth_group_access` VALUES ('5', '7');

-- ----------------------------
-- Table structure for dr_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `dr_auth_rule`;
CREATE TABLE `dr_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=370 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of dr_auth_rule
-- ----------------------------
INSERT INTO `dr_auth_rule` VALUES ('2', 'file', '0', 'general', '常规管理', 'fa fa-cogs', '', '', '1', '1497429920', '1497430169', '1000', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('5', 'file', '0', 'auth', '组织架构', 'fa fa-sitemap', '', '', '1', '1497429920', '1573140230', '7000', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('6', 'file', '2', 'general/config', '系统设置', 'fa fa-cog', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('9', 'file', '5', 'user/index', '管理员', 'fa fa-user', '', 'Admin tips', '1', '1497429920', '1573143871', '99', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', '管理员日志', 'fa fa-list-alt', '', 'Admin log tips', '1', '1497429920', '1573140785', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('11', 'file', '5', 'auth/group', '角色组', 'fa fa-group', '', 'Group tips', '1', '1497429920', '1573143937', '97', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('12', 'file', '5', 'AuthRule/index', '菜单规则', 'fa fa-bars', '', '', '1', '1497429920', '1573143997', '90', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('13', 'file', '2', 'Store/index', '门店管理', 'fa fa-circle-o', '', '', '1', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('66', 'file', '0', 'customer', '客资管理', 'fa fa-list', '', '', '1', '1516374729', '1516374729', '10000', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('67', 'file', '66', 'customer/index', '我的客资', 'fa fa-user', '', '', '1', '1516374729', '1516374729', '2', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('68', 'file', '66', 'customer/promoter', '邀约客资', 'fa fa-circle-o', '', '', '1', '1516374729', '1516374729', '3', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('160', 'file', '0', 'dress', '礼服管理', 'fa fa-connectdevelop', '', '', '1', '1573132819', '1575970290', '8000', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('161', 'file', '160', 'dress/index', '礼服列表', 'fa fa-circle-o', '', '', '1', '1573132819', '1577510490', '100', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('162', 'file', '161', 'dress/create', '礼服添加', 'fa fa-circle-o', '', '', '0', '1573132819', '1573132819', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('163', 'file', '161', 'dress/recyclebin', '礼服回收站', 'fa fa-circle-o', '', '', '0', '1573132819', '1573132819', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('165', 'file', '161', 'dress/edit', '礼服编辑', 'fa fa-circle-o', '', '', '0', '1573132819', '1573132819', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('166', 'file', '161', 'dress/delete', '删除礼服', 'fa fa-circle-o', '', '', '0', '1573132819', '1573132819', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('167', 'file', '161', 'dress/destroy', '真实删除', 'fa fa-circle-o', '', '', '0', '1573132819', '1573132819', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('168', 'file', '161', 'dress/restore', '礼服还原', 'fa fa-circle-o', '', '', '0', '1573132819', '1573132819', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('169', 'file', '161', 'dress/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1573132819', '1573132819', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('176', 'file', '160', 'package/index', '礼服套餐', 'fa fa-circle-o', '', '', '1', '1573133975', '1573133992', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('177', 'file', '176', 'package/create', '套餐添加', 'fa fa-circle-o', '', '', '0', '1573133975', '1573133975', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('178', 'file', '176', 'package/recyclebin', '套餐回收站', 'fa fa-circle-o', '', '', '0', '1573133975', '1573133975', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('180', 'file', '176', 'package/edit', '套餐编辑', 'fa fa-circle-o', '', '', '0', '1573133975', '1573133975', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('181', 'file', '176', 'package/delete', '套餐删除', 'fa fa-circle-o', '', '', '0', '1573133975', '1573133975', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('182', 'file', '176', 'package/destroy', '套餐真实删除', 'fa fa-circle-o', '', '', '0', '1573133975', '1573133975', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('183', 'file', '176', 'package/restore', '套餐还原', 'fa fa-circle-o', '', '', '0', '1573133975', '1573133975', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('194', 'file', '160', 'scrap/index', '报废管理', 'fa fa-circle-o', '', '', '1', '1573136222', '1573136260', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('195', 'file', '194', 'scrap/create', '添加报废', 'fa fa-circle-o', '', '', '0', '1573136222', '1573136222', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('198', 'file', '194', 'scrap/edit', '编辑报废', 'fa fa-circle-o', '', '', '0', '1573136222', '1573136222', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('199', 'file', '194', 'scrap/delete', '删除报废', 'fa fa-circle-o', '', '', '0', '1573136222', '1573136222', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('200', 'file', '194', 'scrap/destroy', '真实删除', 'fa fa-circle-o', '', '', '0', '1573136222', '1573136222', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('203', 'file', '160', 'supplier/index', '供应商管理', 'fa fa-circle-o', '', '', '1', '1573136222', '1573136272', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('206', 'file', '203', 'supplier/create', '添加', 'fa fa-circle-o', '', '', '0', '1573136222', '1573136222', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('207', 'file', '203', 'supplier/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1573136222', '1573136222', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('208', 'file', '203', 'supplier/delete', '删除', 'fa fa-circle-o', '', '', '0', '1573136222', '1573136222', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('213', 'file', '212', 'notice/index', '通知类型管理', 'fa fa-bell-o', '', '', '1', '1573138137', '1573144222', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('216', 'file', '213', 'notice/add', '通知类型添加', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('217', 'file', '213', 'notice/edit', '通知类型编辑', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('218', 'file', '213', 'notice/delete', '通知类型删除', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('223', 'file', '2', 'source/index', '来源管理', 'fa fa-circle-o', '', '', '1', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('225', 'file', '222', 'source/create', '客资来源添加', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('226', 'file', '222', 'source/edit', '客资来源编辑', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('227', 'file', '222', 'source/delete', '客资来源删除', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('231', 'file', '212', 'leave/index', '请假类型管理', 'fa fa-at', '', '', '1', '1573138137', '1573144270', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('234', 'file', '231', 'leave/create', '请假类型添加', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('235', 'file', '231', 'leave/edit', '请假类型编辑', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('236', 'file', '231', 'leave/delete', '请假类型删除', 'fa fa-circle-o', '', '', '0', '1573138137', '1573138137', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('240', 'file', '2', 'size/index', '礼服尺寸', 'fa fa-calculator', '', '', '1', '1573139595', '1573144287', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('243', 'file', '240', 'size/create', '礼服尺寸添加', 'fa fa-circle-o', '', '', '0', '1573139595', '1573139595', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('244', 'file', '240', 'size/edit', '礼服尺寸编辑', 'fa fa-circle-o', '', '', '0', '1573139595', '1573139595', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('245', 'file', '240', 'size/delete', '礼服尺寸删除', 'fa fa-circle-o', '', '', '0', '1573139595', '1573139595', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('250', 'file', '2', 'payment/index', '支付方式', 'fa fa-circle-o', '', '', '1', '1573139595', '1573139595', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('251', 'file', '249', 'dictionary/dress/recyclebin', '回收站', 'fa fa-circle-o', '', '', '0', '1573139595', '1573139595', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('252', 'file', '2', 'color/index', '颜色管理', 'fa fa-circle-o', '', '', '1', '1573139595', '1573139595', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('253', 'file', '249', 'dictionary/dress/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1573139595', '1573139595', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('268', 'file', '267', 'auth/notice/index', '查看', 'fa fa-circle-o', '', '', '0', '1573140632', '1573140632', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('269', 'file', '267', 'auth/notice/recyclebin', '回收站', 'fa fa-circle-o', '', '', '0', '1573140632', '1573140632', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('270', 'file', '267', 'auth/notice/add', '添加', 'fa fa-circle-o', '', '', '0', '1573140632', '1573140632', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('271', 'file', '267', 'auth/notice/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1573140632', '1573140632', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('272', 'file', '267', 'auth/notice/del', '删除', 'fa fa-circle-o', '', '', '0', '1573140632', '1573140632', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('273', 'file', '267', 'auth/notice/destroy', '真实删除', 'fa fa-circle-o', '', '', '0', '1573140632', '1573140632', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('274', 'file', '267', 'auth/notice/restore', '还原', 'fa fa-circle-o', '', '', '0', '1573140632', '1573140632', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('275', 'file', '267', 'auth/notice/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1573140632', '1573140632', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('276', 'file', '5', 'auth/leave', '请假管理', 'fa fa-bookmark', '', '', '1', '1573141955', '1573144068', '94', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('277', 'file', '276', 'auth/leave/index', '查看', 'fa fa-circle-o', '', '', '0', '1573141955', '1573141955', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('278', 'file', '276', 'auth/leave/recyclebin', '回收站', 'fa fa-circle-o', '', '', '0', '1573141955', '1573141955', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('279', 'file', '276', 'auth/leave/add', '添加', 'fa fa-circle-o', '', '', '0', '1573141955', '1573141955', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('280', 'file', '276', 'auth/leave/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1573141955', '1573141955', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('281', 'file', '276', 'auth/leave/del', '删除', 'fa fa-circle-o', '', '', '0', '1573141955', '1573141955', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('282', 'file', '276', 'auth/leave/destroy', '真实删除', 'fa fa-circle-o', '', '', '0', '1573141955', '1573141955', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('283', 'file', '276', 'auth/leave/restore', '还原', 'fa fa-circle-o', '', '', '0', '1573141955', '1573141955', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('284', 'file', '276', 'auth/leave/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1573141955', '1573141955', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('286', 'file', '285', 'auth/position/index', '查看', 'fa fa-circle-o', '', '', '0', '1573142040', '1573142040', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('287', 'file', '285', 'auth/position/recyclebin', '回收站', 'fa fa-circle-o', '', '', '0', '1573142040', '1573142040', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('288', 'file', '285', 'auth/position/add', '添加', 'fa fa-circle-o', '', '', '0', '1573142040', '1573142040', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('289', 'file', '285', 'auth/position/edit', '编辑', 'fa fa-circle-o', '', '', '0', '1573142040', '1573142040', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('290', 'file', '285', 'auth/position/del', '删除', 'fa fa-circle-o', '', '', '0', '1573142040', '1573142040', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('291', 'file', '285', 'auth/position/destroy', '真实删除', 'fa fa-circle-o', '', '', '0', '1573142040', '1573142040', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('292', 'file', '285', 'auth/position/restore', '还原', 'fa fa-circle-o', '', '', '0', '1573142040', '1573142040', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('293', 'file', '285', 'auth/position/multi', '批量更新', 'fa fa-circle-o', '', '', '0', '1573142040', '1573142040', '0', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('294', 'file', '5', 'department/index', '部门管理', 'fa fa-bank', '', '', '1', '1573143705', '1573144087', '100', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('303', 'file', '0', 'order', '订单管理', 'fa fa-list', '', '', '1', '1575970127', '1575970320', '9000', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('310', 'file', '303', 'sale/index', '销售订单', 'fa fa-circle-o', '', '', '1', '1575970796', '1575970866', '99', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('316', 'file', '303', 'rent/index', '租赁订单', 'fa fa-circle-o', '', '', '1', '1575970796', '1575970849', '100', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('322', 'file', '160', 'DressCategory/index', '礼服分类', 'fa fa-circle-o', '', '', '1', '1577519168', '1577519168', '99', 'normal');
INSERT INTO `dr_auth_rule` VALUES ('369', 'file', '66', 'customer/sea', '客资公海', 'fa fa-user', '', '', '1', '1516374729', '1516374729', '1', 'normal');

-- ----------------------------
-- Table structure for dr_color
-- ----------------------------
DROP TABLE IF EXISTS `dr_color`;
CREATE TABLE `dr_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_color
-- ----------------------------
INSERT INTO `dr_color` VALUES ('1', '红色', 'normal', '0', '1579082078', '1579082078', null);
INSERT INTO `dr_color` VALUES ('2', '桔色', 'normal', '0', '1579082279', '1579082279', null);

-- ----------------------------
-- Table structure for dr_customer
-- ----------------------------
DROP TABLE IF EXISTS `dr_customer`;
CREATE TABLE `dr_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `operate_id` int(11) DEFAULT '0',
  `source_id` int(11) NOT NULL DEFAULT '0',
  `visit_times` int(11) NOT NULL DEFAULT '0',
  `realname` varchar(45) DEFAULT '',
  `sex` int(11) DEFAULT '0',
  `mobile` varchar(45) DEFAULT '0',
  `mobile1` varchar(45) DEFAULT '0',
  `mobile2` varchar(45) DEFAULT '0',
  `mobile3` varchar(45) DEFAULT '0',
  `remark` varchar(200) NOT NULL DEFAULT '',
  `weigh` int(11) DEFAULT '0',
  `createtime` int(11) DEFAULT '0',
  `updatetime` int(11) DEFAULT '0',
  `deletetime` int(11) DEFAULT '0',
  `status` varchar(45) DEFAULT 'normal',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_customer
-- ----------------------------
INSERT INTO `dr_customer` VALUES ('1', null, '0', '1', '1', '刘存州', '0', '18321277411', '15238367711', '', '', '测试电话', '0', '1583302280', '1583906085', '0', '跟进中');

-- ----------------------------
-- Table structure for dr_customer_visit
-- ----------------------------
DROP TABLE IF EXISTS `dr_customer_visit`;
CREATE TABLE `dr_customer_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dr_customer_visit
-- ----------------------------
INSERT INTO `dr_customer_visit` VALUES ('1', '1', '1', '跟进中', '人体的天然呆', '1583906085', '1583906085', null);

-- ----------------------------
-- Table structure for dr_department
-- ----------------------------
DROP TABLE IF EXISTS `dr_department`;
CREATE TABLE `dr_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(64) NOT NULL DEFAULT '',
  `depth` int(11) NOT NULL DEFAULT '1',
  `path` varchar(32) NOT NULL DEFAULT '0',
  `weigh` int(11) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  `deletetime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_department
-- ----------------------------
INSERT INTO `dr_department` VALUES ('1', '0', '礼服部', '1', '0', '0', 'normal', '0', '0', '0');
INSERT INTO `dr_department` VALUES ('3', '0', '收银-2', '1', '0', '0', 'normal', '0', '0', '0');

-- ----------------------------
-- Table structure for dr_dress
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress`;
CREATE TABLE `dr_dress` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品类别',
  `images` varchar(1800) NOT NULL COMMENT '商品图片',
  `spec_type` enum('10','20') NOT NULL DEFAULT '10' COMMENT '商品规格:10=单规格,20=多规格',
  `deduct_stock_type` enum('10','20') NOT NULL DEFAULT '20' COMMENT '库存计算方式:10=下单减库存,20=付款减库存',
  `content` text NOT NULL COMMENT '描述详情',
  `sales_initial` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '初始销量',
  `sales_actual` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '实际销量',
  `goods_sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '权重',
  `delivery_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `goods_status` enum('10','20') NOT NULL DEFAULT '10' COMMENT '商品状态:10=上架,20=下架',
  `is_delete` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否删除:0=未删除,1=已删除',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(32) NOT NULL DEFAULT 'normal' COMMENT '显示状态',
  `sku` varchar(100) NOT NULL DEFAULT '',
  `rent_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sale_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `weigh` int(11) NOT NULL DEFAULT '0',
  `size_id` int(11) DEFAULT '0',
  `color_id` int(11) DEFAULT '0',
  `supplier_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_dress
-- ----------------------------
INSERT INTO `dr_dress` VALUES ('3', 'C1904115L2A', '2', '/storage/dress/20200305/f292e4ad51c08e9314c4385bc8d916be.jpg', '20', '20', '1000', '0', '0', '3', '0', '10', '0', '1577522565', '1583402345', 'normal', '2020100001', '3000.00', '5000.00', '0', '1', '1', '0');
INSERT INTO `dr_dress` VALUES ('4', '秀禾礼服', '2', '/storage/dress/20200305/c085c6349d88ab6fac14af109f4a345f.jpg', '20', '20', '1000', '0', '0', '4', '0', '10', '0', '1577526427', '1583400456', 'normal', '2020100002', '1000.00', '2000.00', '0', '2', '1', '0');

-- ----------------------------
-- Table structure for dr_dress_category
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress_category`;
CREATE TABLE `dr_dress_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT '0',
  `updatetime` int(11) DEFAULT '0',
  `deletetime` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_dress_category
-- ----------------------------
INSERT INTO `dr_dress_category` VALUES ('1', '出门纱', 'normal', '118', '1579079283', null, null);
INSERT INTO `dr_dress_category` VALUES ('2', '秀禾服', 'normal', '0', '1579079283', null, null);
INSERT INTO `dr_dress_category` VALUES ('3', '男士礼服', 'normal', '0', '1579079283', '1579079283', null);

-- ----------------------------
-- Table structure for dr_dress_package
-- ----------------------------
DROP TABLE IF EXISTS `dr_dress_package`;
CREATE TABLE `dr_dress_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_no` varchar(45) DEFAULT NULL,
  `operate_id` int(11) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `rent_price` decimal(10,2) DEFAULT NULL,
  `sale_price` decimal(10,2) unsigned DEFAULT NULL,
  `remark` text,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_dress_package
-- ----------------------------
INSERT INTO `dr_dress_package` VALUES ('1', null, null, '588', '588.00', '588.00', '定制698衬衫+婚鞋+皮鞋', '0', '1', '1577504938', '1577504938', null);
INSERT INTO `dr_dress_package` VALUES ('2', null, null, '9999', '9999.00', '9999.00', '定制6980元西服+租赁28888主纱+出门服+齐地纱+敬酒服', '0', '2', '1577504974', '1577504974', null);
INSERT INTO `dr_dress_package` VALUES ('3', null, null, '4999', '4999.00', '4999.00', '定制6980元西服+租赁齐地纱+敬酒服', '0', '3', '1577504997', '1577504997', null);
INSERT INTO `dr_dress_package` VALUES ('4', null, null, '8999', '8999.00', '8999.00', '定制6980元西服+租赁28888元主纱+出门服+敬酒服', '0', '4', '1577505026', '1577505026', null);
INSERT INTO `dr_dress_package` VALUES ('5', '001', null, '001', '3000.00', '5000.00', null, 'normal', '0', '1579083482', '1579083482', null);
INSERT INTO `dr_dress_package` VALUES ('6', '20200002', null, '20200002', '3000.00', '6000.00', null, 'normal', '0', '1579083515', '1579083515', null);

-- ----------------------------
-- Table structure for dr_payment
-- ----------------------------
DROP TABLE IF EXISTS `dr_payment`;
CREATE TABLE `dr_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_payment
-- ----------------------------
INSERT INTO `dr_payment` VALUES ('1', '微信', 'normal', '0', '1579081801', '1579081801', null);
INSERT INTO `dr_payment` VALUES ('2', '支付宝', 'normal', '0', '1579081912', '1579081912', null);
INSERT INTO `dr_payment` VALUES ('3', '现金', 'normal', '0', '1579081919', '1579081919', null);
INSERT INTO `dr_payment` VALUES ('4', 'POS机', 'normal', '0', '1579082297', '1579082297', null);

-- ----------------------------
-- Table structure for dr_rent
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent`;
CREATE TABLE `dr_rent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(100) DEFAULT '',
  `store_id` int(11) DEFAULT NULL,
  `groom` varchar(64) DEFAULT NULL,
  `bride` varchar(64) DEFAULT NULL,
  `groom_mobile` varchar(20) DEFAULT NULL,
  `bride_mobile` varchar(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'normal',
  `rent_status` varchar(100) NOT NULL DEFAULT 'init',
  `marry_date` int(11) DEFAULT NULL,
  `fetch_date` int(11) NOT NULL DEFAULT '0',
  `return_date` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  `deletetime` int(11) NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '',
  `totals` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_rent
-- ----------------------------
INSERT INTO `dr_rent` VALUES ('14', '0', '0', '202003052242079751', '0', '张三', '李四', '18321277411', '18321277411', 'normal', 'init', '1585320120', '1584718920', '1585928520', '1583419440', '1585185915', '0', '上海海静安区东海大厦', '10000.00', '');
INSERT INTO `dr_rent` VALUES ('15', '0', '0', '202003052242079751', '0', '张三', '李四', '18321277411', '18321277411', 'normal', 'init', '1585320120', '1584718920', '1585928520', '1583420007', '1583462907', '0', '上海海静安区东海大厦', '10000.00', '测试备注');

-- ----------------------------
-- Table structure for dr_rent_fetch
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent_fetch`;
CREATE TABLE `dr_rent_fetch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rent_id` int(11) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_mobile` varchar(255) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_rent_fetch
-- ----------------------------

-- ----------------------------
-- Table structure for dr_rent_goods
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent_goods`;
CREATE TABLE `dr_rent_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rent_id` int(11) NOT NULL DEFAULT '0',
  `goods_type` varchar(100) NOT NULL DEFAULT 'goods',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_rent_goods
-- ----------------------------
INSERT INTO `dr_rent_goods` VALUES ('12', '14', 'dress', '3', null, null);
INSERT INTO `dr_rent_goods` VALUES ('13', '14', 'dress', '4', null, null);

-- ----------------------------
-- Table structure for dr_rent_payment
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent_payment`;
CREATE TABLE `dr_rent_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `rent_id` int(11) NOT NULL DEFAULT '0',
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `pay_type` varchar(64) NOT NULL DEFAULT 'full',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_rent_payment
-- ----------------------------
INSERT INTO `dr_rent_payment` VALUES ('4', '0', '14', '0', 'full', '0.00', '0', '0');
INSERT INTO `dr_rent_payment` VALUES ('5', '0', '15', '1', 'earnest', '1000.00', '0', '0');
INSERT INTO `dr_rent_payment` VALUES ('15', '0', '15', '3', 'tail', '9000.00', '1583459300', '1583459300');

-- ----------------------------
-- Table structure for dr_rent_return
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent_return`;
CREATE TABLE `dr_rent_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rent_id` int(11) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_mobile` varchar(255) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_rent_return
-- ----------------------------

-- ----------------------------
-- Table structure for dr_rent_wash
-- ----------------------------
DROP TABLE IF EXISTS `dr_rent_wash`;
CREATE TABLE `dr_rent_wash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rent_id` int(11) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_mobile` varchar(255) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_rent_wash
-- ----------------------------

-- ----------------------------
-- Table structure for dr_sale
-- ----------------------------
DROP TABLE IF EXISTS `dr_sale`;
CREATE TABLE `dr_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operate_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(100) DEFAULT '',
  `store_id` int(11) DEFAULT NULL,
  `groom` varchar(64) DEFAULT NULL,
  `bride` varchar(64) DEFAULT NULL,
  `groom_mobile` varchar(20) DEFAULT NULL,
  `bride_mobile` varchar(20) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'normal',
  `sale_status` varchar(100) NOT NULL DEFAULT 'init',
  `marry_date` int(11) DEFAULT NULL,
  `fetch_date` int(11) NOT NULL DEFAULT '0',
  `return_date` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  `deletetime` int(11) NOT NULL DEFAULT '0',
  `address` varchar(200) NOT NULL DEFAULT '',
  `totals` decimal(10,2) NOT NULL DEFAULT '0.00',
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_sale
-- ----------------------------
INSERT INTO `dr_sale` VALUES ('18', '0', '0', '202003260906433670', '1', '张三', '李四', '18321277411', '18321277411', 'normal', 'init', '1585184760', '1585184760', '0', '1585185933', '1585185933', '0', '上海海静安区东海大厦', '10000.00', '1000');

-- ----------------------------
-- Table structure for dr_sale_fetch
-- ----------------------------
DROP TABLE IF EXISTS `dr_sale_fetch`;
CREATE TABLE `dr_sale_fetch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_mobile` varchar(255) DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_sale_fetch
-- ----------------------------

-- ----------------------------
-- Table structure for dr_sale_goods
-- ----------------------------
DROP TABLE IF EXISTS `dr_sale_goods`;
CREATE TABLE `dr_sale_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL DEFAULT '0',
  `goods_type` varchar(100) NOT NULL DEFAULT 'goods',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_sale_goods
-- ----------------------------
INSERT INTO `dr_sale_goods` VALUES ('13', '18', 'dress', '3', null, null);

-- ----------------------------
-- Table structure for dr_sale_payment
-- ----------------------------
DROP TABLE IF EXISTS `dr_sale_payment`;
CREATE TABLE `dr_sale_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `sale_id` int(11) NOT NULL DEFAULT '0',
  `payment_id` int(11) NOT NULL DEFAULT '0',
  `pay_type` varchar(64) NOT NULL DEFAULT 'full',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_sale_payment
-- ----------------------------
INSERT INTO `dr_sale_payment` VALUES ('16', '0', '18', '1', 'full', '10000.00', '1585185933', '1585185933');

-- ----------------------------
-- Table structure for dr_scrap
-- ----------------------------
DROP TABLE IF EXISTS `dr_scrap`;
CREATE TABLE `dr_scrap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scrap_no` char(45) DEFAULT NULL,
  `operate_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `dress_id` int(11) DEFAULT NULL,
  `deal_user_id` int(11) DEFAULT NULL,
  `confirm_user_id` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `udpatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  `confirmtime` int(11) DEFAULT NULL,
  `confirm_status` varchar(45) DEFAULT 'normal',
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `remark` text,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_scrap
-- ----------------------------

-- ----------------------------
-- Table structure for dr_size
-- ----------------------------
DROP TABLE IF EXISTS `dr_size`;
CREATE TABLE `dr_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_size
-- ----------------------------
INSERT INTO `dr_size` VALUES ('1', 'L', 'normal', '0', '1579080236', '1579080236', null);
INSERT INTO `dr_size` VALUES ('2', 'XL', 'normal', '0', '1579081970', '1579081970', null);
INSERT INTO `dr_size` VALUES ('3', 'XXXL', 'normal', '0', '1579082021', '1579082021', null);

-- ----------------------------
-- Table structure for dr_source
-- ----------------------------
DROP TABLE IF EXISTS `dr_source`;
CREATE TABLE `dr_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `weigh` int(11) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_source
-- ----------------------------
INSERT INTO `dr_source` VALUES ('1', '大众点评', 'hidden', '0', '1579082364', '1583296684', null);
INSERT INTO `dr_source` VALUES ('3', '微博', 'normal', '0', '1579082387', '1579082387', null);
INSERT INTO `dr_source` VALUES ('4', '微信朋友圈', 'normal', '0', '1579082394', '1579082394', null);
INSERT INTO `dr_source` VALUES ('5', '朋友转介绍', 'normal', '0', '1579082405', '1579082405', null);
INSERT INTO `dr_source` VALUES ('6', '自然进店', 'normal', '0', '1579082425', '1579082425', null);

-- ----------------------------
-- Table structure for dr_store
-- ----------------------------
DROP TABLE IF EXISTS `dr_store`;
CREATE TABLE `dr_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `weigh` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createtime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dr_store
-- ----------------------------
INSERT INTO `dr_store` VALUES ('1', '闵行店', '0', 'normal', '1583893399', '1583893399', null);
INSERT INTO `dr_store` VALUES ('2', '徐汇店', '0', 'normal', '1583893418', '1583893418', null);
INSERT INTO `dr_store` VALUES ('3', '浦东店', '0', 'normal', '1583893432', '1583893432', null);
INSERT INTO `dr_store` VALUES ('4', '宝山店', '0', 'normal', '1583893440', '1583893440', null);
INSERT INTO `dr_store` VALUES ('5', '南京路店', '1', 'normal', '1583893467', '1583893473', null);

-- ----------------------------
-- Table structure for dr_supplier
-- ----------------------------
DROP TABLE IF EXISTS `dr_supplier`;
CREATE TABLE `dr_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `realname` varchar(45) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `bank` varchar(45) DEFAULT NULL COMMENT '银行名称',
  `bank_account` varchar(45) DEFAULT NULL COMMENT '账号名称\n',
  `bank_account_num` varchar(45) DEFAULT NULL COMMENT '银行账号',
  `weigh` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'normal',
  `createtime` int(11) DEFAULT NULL,
  `udpatetime` int(11) DEFAULT NULL,
  `deletetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_supplier
-- ----------------------------
INSERT INTO `dr_supplier` VALUES ('1', '金犀数据', null, '18321277411', '上海静安区东海大厦', '中国银行', '', '', '0', 'normal', '1579082576', null, null);

-- ----------------------------
-- Table structure for dr_user
-- ----------------------------
DROP TABLE IF EXISTS `dr_user`;
CREATE TABLE `dr_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(32) NOT NULL DEFAULT '',
  `department_id` int(11) NOT NULL DEFAULT '0',
  `operator_id` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(100) NOT NULL DEFAULT '',
  `realname` varchar(100) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `dingding` char(32) NOT NULL DEFAULT '',
  `mobile` char(20) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `weigh` int(11) NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL DEFAULT '0',
  `deletetime` int(11) NOT NULL DEFAULT '0',
  `udpatetime` int(11) NOT NULL DEFAULT '0',
  `createtime` int(11) NOT NULL DEFAULT '0',
  `in_time` int(11) DEFAULT NULL,
  `family_mobile` varchar(45) DEFAULT NULL,
  `id_card` varchar(45) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_department_id` (`department_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dr_user
-- ----------------------------
INSERT INTO `dr_user` VALUES ('1', '0', '1', '0', 'liucunzhou', '刘存州', 'c4ca4238a0b923820dcc509a6f75849b', '', '18321277411', '', '0', 'normal', '0', '0', '1583295533', null, null, null, null, '1');
SET FOREIGN_KEY_CHECKS=1;

/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : bbx_web

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-11-20 13:59:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ph_admin
-- ----------------------------
DROP TABLE IF EXISTS `ph_admin`;
CREATE TABLE `ph_admin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `nicename` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `regtime` datetime NOT NULL COMMENT '注册时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1：正常，0：禁用',
  `admin_group_id` smallint(5) unsigned NOT NULL COMMENT 'admin_group表 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `admin_group_id` (`admin_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of ph_admin
-- ----------------------------
INSERT INTO `ph_admin` VALUES ('1', 'admin', '324db4c1c67e07dd3ed660214d1cdeff', '超级管理员', '2018-07-01 00:00:00', '1', '1');
INSERT INTO `ph_admin` VALUES ('2', 'phalcon', '324db4c1c67e07dd3ed660214d1cdeff', '管理员', '2018-07-14 00:00:00', '1', '2');

-- ----------------------------
-- Table structure for ph_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `ph_admin_auth`;
CREATE TABLE `ph_admin_auth` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '权限名称',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父id',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '操作方法',
  `sequence` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序，越小越排在前面',
  `note` varchar(50) NOT NULL DEFAULT '' COMMENT '备注',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：0：隐藏，1：显示',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`status`),
  KEY `auth_ca` (`controller`,`action`,`status`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=10016 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of ph_admin_auth
-- ----------------------------
INSERT INTO `ph_admin_auth` VALUES ('1', '首页', '0', 'Index', 'manage', '0', '首页操作', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('2', '栏目', '0', 'Category', 'manage', '5', '栏目操作', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('3', '内容', '0', 'Categorycontent', 'manage', '10', '内容操作', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('4', '扩展', '0', 'Expand', 'manage', '15', '扩展操作', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('5', '表单', '0', 'Form', 'manage', '20', '表单操作', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('6', '用户', '0', 'Admin', 'manage', '25', '用户操作', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('100', '后台首页', '1', 'Index', 'home', '100', '后台首页浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('101', '系统设置', '1', 'Systemset', 'index', '105', '系统设置浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('102', '模型管理', '1', 'Categorymodel', 'index', '110', '模型管理浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('103', '插件管理', '1', 'Plugin', 'index', '115', '插件管理浏览', '', '0');
INSERT INTO `ph_admin_auth` VALUES ('104', '语言管理', '1', 'Language', 'index', '120', '语言管理浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('105', '翻译管理', '1', 'Translate', 'index', '125', '翻译管理浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('106', '翻译驱动管理', '1', 'Translatedriver', 'index', '130', '翻译驱动浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('107', '管理组管理', '6', 'Admingroup', 'index', '135', '管理组浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('108', '管理员管理', '6', 'Admin', 'index', '140', '管理员浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('109', '后台登录记录', '6', 'Adminlog', 'index', '145', '后台登录记录浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('110', '表单设置', '5', 'Form', 'index', '150', '多用表单浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('111', '扩展模型', '4', 'Expand', 'index', '155', '扩展模型浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('112', '自定义变量', '4', 'Fragment', 'index', '160', '自定义变量浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('113', '内容替换', '4', 'Replace', 'index', '165', '内容替换浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('114', 'TAG管理', '4', 'tags', 'index', '170', 'TAG管理浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('115', '推荐位管理', '4', 'Position', 'index', '175', '推荐位管理浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('116', '附件管理', '4', 'Upload', 'index', '180', '附件管理浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('117', '栏目管理', '2', 'Category', 'index', '185', '栏目浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('118', '内容首页', '3', 'Categorycontent', 'list', '190', '内容首页浏览', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1000', '保存', '101', 'Systemset', 'save', '1000', '系统设置保存', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1001', '添加语言', '104', 'Language', 'add', '1005', '语言管理添加', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1002', '查看', '104', 'Language', 'info', '1010', '语言管理查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1003', '修改', '104', 'Language', 'edit', '1015', '语言管理修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1004', '查看', '105', 'Translate', 'info', '1025', '翻译查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1005', '修改', '105', 'Translate', 'edit', '1030', '翻译修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1006', '添加翻译驱动', '106', 'Translatedriver', 'add', '1035', '翻译驱动添加', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1007', '查看', '106', 'Translatedriver', 'info', '1040', '翻译驱动查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1008', '修改', '106', 'Translatedriver', 'edit', '1045', '翻译驱动修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1009', '添加管理组', '107', 'Admingroup', 'add', '1050', '管理组添加', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1010', '查看', '107', 'Admingroup', 'info', '1055', '管理组查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1011', '修改', '107', 'Admingroup', 'edit', '1060', '管理组修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1012', '删除', '107', 'Admingroup', 'delete', '1065', '管理组删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1013', '添加管理员', '108', 'Admin', 'add', '1050', '管理员添加', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1014', '查看', '108', 'Admin', 'info', '1055', '管理员查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1015', '设置', '108', 'Admin', 'edit', '1060', '管理员设置', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1016', '修改资料', '108', 'Admin', 'editInfo', '1065', '管理员修改资料', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1017', '删除', '108', 'Admin', 'delete', '1070', '管理员删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1018', '添加表单', '110', 'Form', 'add', '1075', '表单添加', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1019', '查看', '110', 'Form', 'info', '1080', '表单查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1020', '修改', '110', 'Form', 'edit', '1085', '表单修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1021', '删除', '110', 'Form', 'delete', '1090', '表单删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1022', '字段管理', '110', 'Formfield', 'index', '1095', '表单字段管理', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1023', '表单数据管理', '110', 'Formdata', 'index', '1100', '浏览用户创建的表单', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1024', '添加模型', '111', 'Expand', 'add', '1105', '模型添加', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1025', '查看', '111', 'Expand', 'info', '1110', '模型查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1026', '修改', '111', 'Expand', 'edit', '1115', '模型修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1027', '删除', '111', 'Expand', 'delete', '1120', '模型删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1028', '字段管理', '111', 'Expandfield', 'index', '1125', '模型字段管理', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1029', '添加自定义变量', '112', 'Fragment', 'add', '1130', '添加自定义变量', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1030', '查看', '112', 'Fragment', 'info', '1135', '自定义变量查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1031', '修改', '112', 'Fragment', 'edit', '1140', '自定义变量修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1032', '删除', '112', 'Fragment', 'delete', '1145', '自定义变量删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1033', '添加内容替换', '113', 'Replace', 'add', '1150', '添加内容替换', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1034', '查看', '113', 'Replace', 'info', '1155', '内容替换查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1035', '修改', '113', 'Replace', 'edit', '1160', '内容替换修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1036', '删除', '113', 'Replace', 'delete', '1175', '内容替换删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1037', '添加TAG', '114', 'tags', 'add', '1180', '添加tag标签', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1038', '分组', '114', 'tags', 'grouping', '1185', 'tag标签分组', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1039', '删除', '114', 'tags', 'delete', '1190', 'tag标签删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1040', 'TAG分组管理', '114', 'tagsgroup', 'index', '1195', 'tag标签分组管理', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1041', '添加推荐位', '115', 'Position', 'add', '1200', '添加推荐位', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1042', '查看', '115', 'Position', 'info', '1205', '推荐位查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1043', '修改', '115', 'Position', 'edit', '1210', '推荐位修改', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1044', '删除', '115', 'Position', 'delete', '1215', '推荐位删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1045', '删除', '116', 'Upload', 'delete', '1220', '附件删除', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1046', '栏目排序', '117', 'Category', 'sequence', '1225', '栏目排序', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1047', '添加新闻栏目', '117', 'categorynews', 'add', '1230', '添加新闻栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1048', '查看新闻栏目', '117', 'categorynews', 'info', '1230', '查看新闻栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1049', '修改新闻栏目', '117', 'categorynews', 'edit', '1230', '修改新闻栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1050', '删除新闻栏目', '117', 'categorynews', 'delete', '1230', '删除新闻栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1051', '添加页面栏目', '117', 'categorypage', 'add', '1230', '添加页面栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1052', '查看页面栏目', '117', 'categorypage', 'info', '1230', '查看页面栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1053', '修改页面栏目', '117', 'categorypage', 'edit', '1230', '修改页面栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1054', '删除页面栏目', '117', 'categorypage', 'delete', '1230', '删除页面栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1055', '添加跳转栏目', '117', 'categoryjump', 'add', '1230', '添加跳转栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1056', '查看跳转栏目', '117', 'categoryjump', 'info', '1230', '查看跳转栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1057', '修改跳转栏目', '117', 'categoryjump', 'edit', '1230', '修改跳转栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1058', '删除跳转栏目', '117', 'categoryjump', 'delete', '1230', '删除跳转栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1059', '审核', '118', 'Categorycontent', 'audit', '1235', '审核内容', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1060', '添加内容', '118', 'Categorycontent', 'add', '1240', '添加内容', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1061', '查看内容', '118', 'Categorycontent', 'info', '1245', '查看内容', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1062', '修改内容', '118', 'Categorycontent', 'edit', '1250', '修改内容', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1063', '删除内容', '118', 'Categorycontent', 'delete', '1255', '删除内容', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1064', '移动', '118', 'Categorycontent', 'move', '1260', '移动内容到某栏目', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1065', '内容管理', '118', 'Categorycontent', 'index', '1234', '浏览某个栏目的内容', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1066', '快速编辑', '118', 'Categorycontent', 'quickEdit', '1251', '快速编辑内容', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1067', '查看', '102', 'Categorymodel', 'info', '1060', '模型查看', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('1068', '修改', '102', 'Categorymodel', 'edit', '1065', '模型配置', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10000', '添加', '1022', 'Formfield', 'add', '10000', '添加表单字段', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10001', '查看', '1022', 'Formfield', 'info', '10005', '查看表单字段', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10002', '修改', '1022', 'Formfield', 'edit', '10010', '修改表单字段', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10003', '删除', '1022', 'Formfield', 'delete', '10015', '删除表单字段', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10004', '添加', '1023', 'Formdata', 'add', '10020', '添加表单数据', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10005', '查看', '1023', 'Formdata', 'info', '10025', '查看表单数据', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10006', '修改', '1023', 'Formdata', 'edit', '10030', '修改表单数据', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10007', '删除', '1023', 'Formdata', 'delete', '10035', '删除表单数据', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10008', '添加', '1028', 'Expandfield', 'add', '10040', '添加模型字段', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10009', '查看', '1028', 'Expandfield', 'info', '10045', '查看模型字段', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10010', '修改', '1028', 'Expandfield', 'edit', '10050', '修改模型字段', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10011', '删除', '1028', 'Expandfield', 'delete', '10055', '删除模型字段', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10012', '添加', '1040', 'tagsgroup', 'add', '10060', '添加tag标签分组', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10013', '查看', '1040', 'tagsgroup', 'info', '10065', '查看tag标签分组', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10014', '修改', '1040', 'tagsgroup', 'edit', '10070', '修改tag标签分组', '', '1');
INSERT INTO `ph_admin_auth` VALUES ('10015', '删除', '1040', 'tagsgroup', 'delete', '10085', '删除tag标签分组', '', '1');

-- ----------------------------
-- Table structure for ph_admin_group
-- ----------------------------
DROP TABLE IF EXISTS `ph_admin_group`;
CREATE TABLE `ph_admin_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '角色名称',
  `admin_auth_ids` varchar(3000) NOT NULL DEFAULT '' COMMENT '操作权限ids,1,2,5',
  `category_ids` varchar(5000) NOT NULL DEFAULT '' COMMENT '栏目权限',
  `form_ids` varchar(5000) NOT NULL DEFAULT '' COMMENT '表单权限',
  `grade` tinyint(4) NOT NULL DEFAULT '1' COMMENT '等级',
  `keep` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否校验权限（允许组合），0：全部校验，1：不校验表单权限，2：不校验栏目权限，4：不校验功能权限，7：全部不校验',
  `group_power` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理组列表权限（只允许增删改下级管理组）（允许组合），1：显示本组，2：显示同级别组，4：显示低级别组',
  `admin_power` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员列表权限（只允许增删改下级管理员（修改资料除外））（允许组合）（这里的修改只针对资料），1：显示管理员本人,2：显示同级别组管理员，4：显示低级别组管理员，8：修改管理员本人，16：修改同级别组管理员，32：修改低级别组管理员',
  `language_power` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否受语言限制（不受限制可以浏览添加修改他国语言管理组、管理员），1：受限制，0：不受限制',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- ----------------------------
-- Records of ph_admin_group
-- ----------------------------
INSERT INTO `ph_admin_group` VALUES ('1', '超级管理组', '', '', '', '1', '7', '7', '63', '0', '1');
INSERT INTO `ph_admin_group` VALUES ('2', '管理员组', '1,100,101,1000,102,1067,1068,104,1001,1002,1003,105,1004,1005,106,1006,1007,1008,2,117,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,3,118,1065,1059,1060,1061,1062,1066,1063,1064,4,111,1024,1025,1026,1027,1028,10008,10009,10010,10011,112,1029,1030,1031,1032,113,1033,1034,1035,1036,114,1037,1038,1039,1040,10012,10013,10014,10015,115,1041,1042,1043,1044,116,1045,5,110,1018,1019,1020,1021,1022,10000,10001,10002,10003,1023,10004,10005,10006,10007,6,107,1009,1010,1011,1012,108,1013,1014,1015,1016,1017,109', '', '', '10', '3', '7', '63', '0', '1');

-- ----------------------------
-- Table structure for ph_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ph_admin_log`;
CREATE TABLE `ph_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` mediumint(8) unsigned NOT NULL COMMENT '表admin id',
  `logintime` datetime NOT NULL COMMENT '登录时间',
  `ip` varchar(64) NOT NULL DEFAULT '' COMMENT 'ip地址',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员登录记录表';

-- ----------------------------
-- Records of ph_admin_log
-- ----------------------------
INSERT INTO `ph_admin_log` VALUES ('1', '1', '2018-11-07 11:17:07', '127.0.0.1');
INSERT INTO `ph_admin_log` VALUES ('2', '1', '2018-11-14 10:42:06', '127.0.0.1');

-- ----------------------------
-- Table structure for ph_category
-- ----------------------------
DROP TABLE IF EXISTS `ph_category`;
CREATE TABLE `ph_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级栏目id',
  `category_model_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'category_model表id',
  `sequence` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序，越小越排在前面',
  `is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否显示，1：显示，0：隐藏',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '栏目类型，1：频道页，2：列表页',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `urlname` varchar(255) NOT NULL COMMENT '栏目url优化',
  `subname` varchar(100) NOT NULL DEFAULT '' COMMENT '副栏目名称',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目形象图',
  `category_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目模板',
  `content_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '内容模板',
  `page` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '内容分页数',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词，","分割',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `seo_content` varchar(255) NOT NULL DEFAULT '' COMMENT 'SEO内容',
  `content_order` varchar(255) NOT NULL DEFAULT '' COMMENT '内容排序，"updatetime DESC"：更新时间 新旧，"updatetime ASC"：更新时间 旧新，"inputtime DESC"：发布时间 新旧，"inputtime ASC"：发布时间 旧新，"sequence DESC"：自定义顺序 大小，"sequence ASC"：自定义顺序 小大',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  `expand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '扩展表id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `urlname` (`urlname`),
  KEY `pid` (`pid`),
  KEY `category_model_id` (`category_model_id`),
  KEY `name` (`name`),
  KEY `urlname2` (`urlname`,`is_show`),
  KEY `sequence` (`sequence`),
  KEY `language_id` (`language_id`),
  KEY `expand_id` (`expand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of ph_category
-- ----------------------------
INSERT INTO `ph_category` VALUES ('1', '0', '3', '0', '1', '1', '首页', 'shouye', '', '', '', '', '10', '', '', '', '', '1', '0');
INSERT INTO `ph_category` VALUES ('2', '0', '1', '1', '1', '1', '热门路线', 'remenluxian', '', '', 'category/hotline', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('3', '2', '1', '0', '1', '1', 'A', 'A', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('4', '2', '1', '0', '1', '1', 'F', 'F', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('5', '2', '1', '0', '1', '1', 'G', 'G', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('6', '2', '1', '0', '1', '1', 'H', 'H', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('7', '2', '1', '0', '1', '1', 'J', 'J', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('8', '3', '1', '0', '1', '1', '安徽', 'anhui', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('9', '4', '1', '0', '1', '1', '福建', 'fujian', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('10', '5', '1', '0', '1', '1', '广东', 'guangdong', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('11', '5', '1', '0', '1', '1', '广西', 'guangxi', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('12', '5', '1', '0', '1', '1', '贵州', 'guizhou', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('13', '6', '1', '0', '1', '1', '海南', 'hainan', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('14', '6', '1', '0', '1', '1', '河南', 'henan', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('15', '6', '1', '0', '1', '1', '黑龙江', 'heilongjiang', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('16', '7', '1', '0', '1', '1', '江苏', 'jiangsu', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('17', '7', '1', '0', '1', '1', '江西', 'jiangxi', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('18', '7', '1', '0', '1', '1', '吉林', 'jilin', '', '', '', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('19', '0', '2', '3', '1', '1', '公务出行', 'gongwuchuxing', '', '', 'categorypage/officialtravel', '', '10', '', '', '', '', '1', '0');
INSERT INTO `ph_category` VALUES ('20', '0', '2', '2', '1', '1', '加盟入驻', 'jiamengruzhu', '', '', 'categorypage/join', '', '10', '', '', '', '', '1', '0');
INSERT INTO `ph_category` VALUES ('21', '0', '1', '4', '1', '1', '新闻资讯', 'xinwenzixun', '', '', 'category/news', '', '6', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('22', '21', '1', '0', '1', '2', '公司新闻', 'gongsixinwen', '', '', 'category/newslist', 'categorycontent/newsdetail', '6', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('23', '21', '1', '0', '1', '2', '行业资讯', 'hangyezixun', '', '', 'category/newslist', 'categorycontent/newsdetail', '6', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('25', '0', '3', '5', '1', '1', '关于我们', 'guanyuwomen', '', '', '', '', '10', '', '', '', '', '1', '0');
INSERT INTO `ph_category` VALUES ('26', '25', '2', '0', '1', '1', '企业介绍', 'qiyejieshao', '', '', 'categorypage/company', '', '10', '', '', '', '', '1', '0');
INSERT INTO `ph_category` VALUES ('27', '25', '1', '0', '1', '1', '资质证书', 'zizhizhengshu', '', '', 'category/certificate', '', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('28', '25', '1', '0', '1', '2', '合作伙伴', 'hezuohuoban', '', '', 'category/partnerlist', '', '9', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('29', '25', '2', '0', '1', '1', '司机招募', 'sijizhaomu', '', '', 'categorypage/driverjoin', '', '10', '', '', '', '', '1', '0');
INSERT INTO `ph_category` VALUES ('30', '25', '2', '0', '1', '1', '联系我们', 'lianxiwomen', '', '', 'categorypage/contactus', '', '10', '', '', '', '', '1', '0');
INSERT INTO `ph_category` VALUES ('31', '8', '1', '0', '1', '2', '芜湖', 'wuhu', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('32', '8', '1', '0', '1', '2', '蚌埠', 'bengbu', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('33', '9', '1', '0', '1', '2', '福州', 'fuzhou', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('34', '9', '1', '0', '1', '2', '厦门', 'xiamen', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('35', '27', '1', '0', '1', '2', '各地牌照', 'gedipaizhao', '', '', 'category/licenselist', '', '21', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('36', '27', '1', '0', '1', '2', '软件著作', 'ruanjianzhuzuo', '', '', 'category/coplist', '', '12', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('37', '27', '1', '0', '1', '2', '商标证书', 'shangbiaozhengshu', '', '', 'category/coplist', '', '12', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('38', '10', '1', '0', '1', '2', '深圳', 'shenzhen', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('39', '10', '1', '0', '1', '2', '广州', 'guangzhou', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('40', '11', '1', '0', '1', '2', '南宁', 'nanning', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('41', '11', '1', '0', '1', '2', '柳州', 'liuzhou', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('42', '12', '1', '0', '1', '2', '贵阳', 'guiyang', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('43', '12', '1', '0', '1', '2', '遵义', 'zunyi', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('44', '13', '1', '0', '1', '2', '海口', 'haikou', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('45', '13', '1', '0', '1', '2', '三亚', 'sanya', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('46', '14', '1', '0', '1', '2', '郑州', 'zhengzhou', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '0');
INSERT INTO `ph_category` VALUES ('47', '15', '1', '0', '1', '2', '哈尔滨', 'haerbin', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('48', '16', '1', '0', '1', '2', '南京', 'nanjing', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('49', '17', '1', '0', '1', '2', '南昌', 'nanchang', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');
INSERT INTO `ph_category` VALUES ('50', '18', '1', '0', '1', '2', '长春', 'changchun', '', '', 'category/linelist', 'categorycontent/linecontent', '10', '', '', '', 'updatetime DESC', '1', '1');

-- ----------------------------
-- Table structure for ph_category_content
-- ----------------------------
DROP TABLE IF EXISTS `ph_category_content`;
CREATE TABLE `ph_category_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'category表id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `urltitle` varchar(100) NOT NULL DEFAULT '' COMMENT 'URL路径',
  `subtitle` varchar(100) NOT NULL DEFAULT '' COMMENT '短标题',
  `font_color` char(7) NOT NULL DEFAULT '' COMMENT '颜色(16进制RGB值)',
  `font_bold` tinyint(4) NOT NULL DEFAULT '0' COMMENT '加粗，0：不加粗，1：加粗',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键词',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `updatetime` datetime NOT NULL COMMENT '更新时间',
  `inputtime` datetime DEFAULT NULL COMMENT '发布时间',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `jump_url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转',
  `sequence` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '模板',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0：草稿，1：发布',
  `copyfrom` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `position` varchar(255) NOT NULL DEFAULT '0' COMMENT '推荐ids',
  `taglink` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否内容自动TAG',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'admin表id，创作者',
  `admin_nicename` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`,`status`),
  KEY `title` (`title`),
  KEY `urltitle` (`urltitle`,`status`),
  KEY `updatetime` (`updatetime`),
  KEY `inputtime` (`inputtime`),
  KEY `views` (`views`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='内容表';

-- ----------------------------
-- Records of ph_category_content
-- ----------------------------
INSERT INTO `ph_category_content` VALUES ('1', '22', '火热图片新闻5', 'huoretupianxinwen', '', '', '0', '', '火热新闻', '2018-11-16 11:48:32', '2018-11-13 16:03:19', '/uploads/scrawls/2018-11/13/995a1e61af65c748403ba255c1235fda.png', '', '0', '', '1', '帮邦行', '18', '2', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('2', '22', '火热图片新闻2', 'huoretupianxinwen2', '', '', '0', '', '火热图片新闻2火热图片新闻2', '2018-11-13 16:37:34', '2018-11-13 16:38:02', '/uploads/scrawls/2018-11/13/aab1dcfeb5cebb9948c30f9f1faa3ba4.png', '', '0', '', '1', '帮邦行', '14', '2', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('3', '23', '行业资讯火热', 'hangyezixunhuore', '', '', '0', '', '行业资讯火热行业资讯火热', '2018-11-13 16:42:07', '2018-11-13 16:42:33', '/uploads/scrawls/2018-11/13/43dcd7881765fe512597817e70248518.png', '', '0', '', '1', '帮邦行', '6', '2', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('4', '22', '公司新闻3', 'gongsixinwen3', '', '', '0', '芜湖', '公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3', '2018-11-15 15:20:01', '2018-11-13 17:50:34', '/uploads/scrawls/2018-11/13/8ce22b01047d5ee549457634bd7daf9d.png', '', '0', '', '1', '帮邦行', '18', '2', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('5', '22', '公司新闻4', 'gongsixinwen4', '', '', '0', '合肥', '公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4', '2018-11-15 15:20:09', '2018-11-13 17:51:05', '/uploads/scrawls/2018-11/13/a563501c017aa9206b0135473e05977c.png', '', '0', '', '1', '帮邦行', '32', '2', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('6', '31', '芜湖 - 马鞍山', 'wuhumaanshan', '', '', '0', '马鞍山,芜湖,线路', '芜湖 - 马鞍山热门线路', '2018-11-15 17:03:29', '2018-11-14 15:33:11', '', '', '0', '', '1', '帮邦行', '3', '1', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('7', '31', '芜湖 - 合肥', 'wuhuhefei', '', '', '0', '芜湖,合肥,线路', '芜湖 - 合肥线路', '2018-11-14 15:34:49', '2018-11-14 15:34:49', '', '', '0', '', '1', '帮邦行', '248', '1', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('8', '31', '马鞍山 - 芜湖', 'maanshanwuhu', '', '', '0', '马鞍山,芜湖', '马鞍山 - 芜湖', '2018-11-15 17:04:16', '2018-11-15 17:04:16', '', '', '0', '', '1', '帮邦行', '10', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('9', '35', '全国网约车牌照1', 'quanguowangyuechepaizhao1', '', '', '0', '', '', '2018-11-16 16:07:06', '2018-11-16 16:07:06', '/uploads/scrawls/2018-11/16/897ac039834399b0e45c343c3af14d98.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('10', '35', '全国网约车牌照2', 'quanguowangyuechepaizhao2', '', '', '0', '', '', '2018-11-16 16:07:33', '2018-11-16 16:07:33', '/uploads/scrawls/2018-11/16/7d46bd6b2b287cc29132884a2df83783.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('11', '35', '全国网约车牌照3', 'quanguowangyuechepaizhao3', '', '', '0', '', '', '2018-11-16 16:07:52', '2018-11-16 16:07:52', '/uploads/scrawls/2018-11/16/0b40763bf3ec451eb54dddef394593df.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('12', '36', '快巴项目软件著作权证书1', 'kuaibaxiangmuruanjianzhuzuoquanzhengshu1', '', '', '0', '', '', '2018-11-16 16:08:49', '2018-11-16 16:08:49', '/uploads/scrawls/2018-11/16/c4c91da017b7106659eaf39dee2625e9.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('13', '36', '快巴项目软件著作权证书2', 'kuaibaxiangmuruanjianzhuzuoquanzhengshu2', '', '', '0', '', '', '2018-11-16 16:09:02', '2018-11-16 16:09:02', '/uploads/scrawls/2018-11/16/a7aff491e775174803221b0e70edd2c6.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('14', '36', '快巴项目软件著作权证书3', 'kuaibaxiangmuruanjianzhuzuoquanzhengshu3', '', '', '0', '', '', '2018-11-16 16:09:39', '2018-11-16 16:09:39', '/uploads/scrawls/2018-11/16/fe61494eeb5c8b12b54659b24337b808.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('15', '36', '快巴项目软件著作权证书4', 'kuaibaxiangmuruanjianzhuzuoquanzhengshu4', '', '', '0', '', '', '2018-11-16 16:09:56', '2018-11-16 16:09:56', '/uploads/scrawls/2018-11/16/2d4098bd715417ac42b63ca06d2ff2ad.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('16', '37', '商标证书1', 'shangbiaozhengshu1', '', '', '0', '', '', '2018-11-16 16:10:30', '2018-11-16 16:10:30', '/uploads/scrawls/2018-11/16/a7d637508c32c695b347b2661dc05960.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('17', '37', '商标证书2', 'shangbiaozhengshu2', '', '', '0', '', '', '2018-11-16 16:10:41', '2018-11-16 16:10:41', '/uploads/scrawls/2018-11/16/5e27f82ea10eb86a4b1d0804569dfee1.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('18', '37', '商标证书3', 'shangbiaozhengshu3', '', '', '0', '', '', '2018-11-16 16:10:54', '2018-11-16 16:10:54', '/uploads/scrawls/2018-11/16/b1fce7fcbf0cccc3112881cfecf26e46.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('19', '37', '商标证书4', 'shangbiaozhengshu4', '', '', '0', '', '', '2018-11-16 16:11:08', '2018-11-16 16:11:08', '/uploads/scrawls/2018-11/16/b122e7931a53d47f399ac080229047ff.png', '', '0', '', '1', '', '0', '0', '0', '1', '超级管理员');
INSERT INTO `ph_category_content` VALUES ('20', '28', '福建漳州市长运集团有限公司', 'fujianzhangzhoushizhangyunjituanyouxiangongsi', '', '', '0', '', '福建漳州市长运集团有限公司，前身为福建省汽车运输总公司漳州分公司，始建于1949年11月。1999年2月经漳州市经委批准，按照现代企业制度要求，改制为福建漳州市长运集团有限公司，并组建福建漳州市长运集团。主要经营道路客运、货运、城市公交、汽车销售、租赁及提供维修、检测等配套服务，为漳州市最大的国有汽车运输企业。', '2018-11-16 17:01:32', '2018-11-16 17:01:32', '/uploads/scrawls/2018-11/16/d8f8ac54e26cdf5ac1dda741253151d1.png', '', '0', '', '1', '', '1', '0', '0', '1', '超级管理员');

-- ----------------------------
-- Table structure for ph_category_content_data
-- ----------------------------
DROP TABLE IF EXISTS `ph_category_content_data`;
CREATE TABLE `ph_category_content_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_content_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'category_content表id',
  `content` text,
  PRIMARY KEY (`id`),
  KEY `category_content_id` (`category_content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='内容数据表';

-- ----------------------------
-- Records of ph_category_content_data
-- ----------------------------
INSERT INTO `ph_category_content_data` VALUES ('1', '1', '&lt;p&gt;火热新闻&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;');
INSERT INTO `ph_category_content_data` VALUES ('2', '2', '&lt;p&gt;火热图片新闻2火热图片新闻2&lt;/p&gt;');
INSERT INTO `ph_category_content_data` VALUES ('3', '3', '&lt;p&gt;行业资讯火热行业资讯火热&lt;/p&gt;');
INSERT INTO `ph_category_content_data` VALUES ('4', '4', '&lt;p&gt;公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3公司新闻3&lt;/p&gt;');
INSERT INTO `ph_category_content_data` VALUES ('5', '5', '&lt;p&gt;公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4公司新闻4&lt;/p&gt;');
INSERT INTO `ph_category_content_data` VALUES ('6', '6', '&lt;p&gt;芜湖 - 马鞍山热门线路&lt;/p&gt;');
INSERT INTO `ph_category_content_data` VALUES ('7', '7', '&lt;p&gt;芜湖 - 合肥线路开通了&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/uploads/images/2018-11/14/introduce2.png&quot; title=&quot;introduce2&quot; alt=&quot;introduce2.png&quot; /&gt;&lt;/p&gt;');
INSERT INTO `ph_category_content_data` VALUES ('8', '8', '&lt;p&gt;马鞍山 - 芜湖&lt;/p&gt;');
INSERT INTO `ph_category_content_data` VALUES ('9', '9', '');
INSERT INTO `ph_category_content_data` VALUES ('10', '10', '');
INSERT INTO `ph_category_content_data` VALUES ('11', '11', '');
INSERT INTO `ph_category_content_data` VALUES ('12', '12', '');
INSERT INTO `ph_category_content_data` VALUES ('13', '13', '');
INSERT INTO `ph_category_content_data` VALUES ('14', '14', '');
INSERT INTO `ph_category_content_data` VALUES ('15', '15', '');
INSERT INTO `ph_category_content_data` VALUES ('16', '16', '');
INSERT INTO `ph_category_content_data` VALUES ('17', '17', '');
INSERT INTO `ph_category_content_data` VALUES ('18', '18', '');
INSERT INTO `ph_category_content_data` VALUES ('19', '19', '');
INSERT INTO `ph_category_content_data` VALUES ('20', '20', '');

-- ----------------------------
-- Table structure for ph_category_content_position
-- ----------------------------
DROP TABLE IF EXISTS `ph_category_content_position`;
CREATE TABLE `ph_category_content_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `category_content_id` int(10) unsigned NOT NULL COMMENT 'category_content表id',
  `position_id` int(10) unsigned NOT NULL COMMENT 'position表id',
  PRIMARY KEY (`id`),
  KEY `category_content_id` (`category_content_id`),
  KEY `position_id` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='推荐位与内容关系表';

-- ----------------------------
-- Records of ph_category_content_position
-- ----------------------------
INSERT INTO `ph_category_content_position` VALUES ('1', '1', '2');
INSERT INTO `ph_category_content_position` VALUES ('2', '2', '2');
INSERT INTO `ph_category_content_position` VALUES ('3', '3', '2');
INSERT INTO `ph_category_content_position` VALUES ('4', '4', '2');
INSERT INTO `ph_category_content_position` VALUES ('5', '5', '2');
INSERT INTO `ph_category_content_position` VALUES ('6', '7', '1');
INSERT INTO `ph_category_content_position` VALUES ('7', '6', '1');

-- ----------------------------
-- Table structure for ph_category_jump
-- ----------------------------
DROP TABLE IF EXISTS `ph_category_jump`;
CREATE TABLE `ph_category_jump` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'category表id',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转地址',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='跳转栏目附加表';

-- ----------------------------
-- Records of ph_category_jump
-- ----------------------------
INSERT INTO `ph_category_jump` VALUES ('1', '1', 'http://bbxweb.com');
INSERT INTO `ph_category_jump` VALUES ('2', '25', 'category/qiyejieshao');

-- ----------------------------
-- Table structure for ph_category_model
-- ----------------------------
DROP TABLE IF EXISTS `ph_category_model`;
CREATE TABLE `ph_category_model` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '模型名称',
  `category` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目控制器名',
  `content` varchar(50) NOT NULL DEFAULT '' COMMENT '内容控制器名',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0：禁用，1：开启',
  `befrom` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模型表';

-- ----------------------------
-- Records of ph_category_model
-- ----------------------------
INSERT INTO `ph_category_model` VALUES ('1', '新闻', 'categorynews', 'categorycontent', '1', '帮邦行\n原创\n转载');
INSERT INTO `ph_category_model` VALUES ('2', '页面', 'categorypage', '', '1', '');
INSERT INTO `ph_category_model` VALUES ('3', '跳转', 'categoryjump', '', '1', '');

-- ----------------------------
-- Table structure for ph_category_page
-- ----------------------------
DROP TABLE IF EXISTS `ph_category_page`;
CREATE TABLE `ph_category_page` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'category表id',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='页面栏目附加表';

-- ----------------------------
-- Records of ph_category_page
-- ----------------------------
INSERT INTO `ph_category_page` VALUES ('1', '19', '');
INSERT INTO `ph_category_page` VALUES ('2', '20', '&lt;h2&gt;立足客运 赋能企业&lt;/h2&gt;&lt;p class=&quot;introduce-title&quot;&gt;技术&lt;/p&gt;&lt;p&gt;500人年+研发投入，集成一线运营经营&lt;/p&gt;&lt;p class=&quot;introduce-title&quot;&gt;运营&lt;/p&gt;&lt;p&gt;融合客运运力&lt;/p&gt;&lt;p class=&quot;introduce-title&quot;&gt;数据&lt;/p&gt;&lt;p&gt;海量结构化，数据驱动&lt;/p&gt;&lt;p&gt;客运企业&lt;/p&gt;&lt;p class=&quot;introduce-title&quot;&gt;牌照&lt;/p&gt;&lt;p&gt;合规经营，安全无忧&lt;/p&gt;&lt;p class=&quot;introduce-title&quot;&gt;网络&lt;/p&gt;&lt;p&gt;可达性更丰富，综合运营成本&lt;/p&gt;&lt;p class=&quot;introduce-title&quot;&gt;金融保险&lt;/p&gt;&lt;p&gt;节省供给成本，提高平台收入&lt;/p&gt;&lt;h2&gt;助力转型千亿级的蓝海市场&lt;/h2&gt;&lt;p&gt;客运企业&lt;/p&gt;&lt;p&gt;传统出行服务专家&lt;/p&gt;&lt;p&gt;网络出行服务平台&lt;/p&gt;&lt;p&gt;联合运营：基于现有的运力和线路，实现互联网运营环境，减少客运企业的投入。&lt;/p&gt;&lt;p&gt;嵌入式服务提供商：结合技术与互联网运营经营，快速实现转化效益&lt;/p&gt;&lt;p&gt;品牌化运营：基于客运企业的安全管理经验，打造安全出行的品牌&lt;/p&gt;&lt;p&gt;市场统一与融合：利用合规性平台和多种增值服务解决方案，全面融合非规市场&lt;/p&gt;&lt;h2&gt;打造便民、高效网约车出行服务平台&lt;/h2&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/platform1.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;客运升级&lt;/h3&gt;&lt;p&gt;依托客运企业，构建基于金融服务和互联网运营的定制客运新生态，实现传统客运业转型。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/platform1.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;城内出行&lt;/h3&gt;&lt;p&gt;专注于2～5线地区、县城、乡镇之间的用户出行，未用户提供门对门接送的出行服务。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/platform1.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;车辆和规划&lt;/h3&gt;&lt;p&gt;整合分散车辆，按法定合规标准，实现三证合一；为用户提供安全的出行服务。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/platform1.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;安置退伍军人&lt;/h3&gt;&lt;p&gt;响应政府号召，讲优异的退伍军人融入帮邦行的服务体系，实现退伍军人的自身价值。&lt;/p&gt;&lt;h2&gt;选择帮邦行的8大优势&lt;/h2&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/advantage1.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;分公司支持&lt;/h3&gt;&lt;p&gt;协助合伙人在其代理城市开办分公司，并获得当地运营商牌照&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/advantage2.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;品牌支持&lt;/h3&gt;&lt;p&gt;共享品牌价值，提供帮邦行当地合法的网约车经营权&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/advantage3.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;培训支持&lt;/h3&gt;&lt;p&gt;提供公司管理、证件办理及公共关系等专业的业务指导和支持&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/advantage4.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;市场支持&lt;/h3&gt;&lt;p&gt;提供物料设计、线上广告投放、媒体报道等统一市场支持。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/advantage5.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;服务支持&lt;/h3&gt;&lt;p&gt;提供运营方案，推行保姆式服务，帮助合作伙伴实现快速盈利。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/advantage6.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;平台支持&lt;/h3&gt;&lt;p&gt;提供代理商专属后台，帮助代理商对运帮助代理商对运营进行监控和管理。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/advantage7.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;技术支持&lt;/h3&gt;&lt;p&gt;对运营需求的新功能进行快速开发和更新。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/home/static%5Czh%5Cimages/joinIn/advantage8.png&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;&lt;h3&gt;运营支持&lt;/h3&gt;&lt;p&gt;呼叫中心、微信、APP后台的数据运营支持和前段服务。&lt;/p&gt;');
INSERT INTO `ph_category_page` VALUES ('3', '26', '&lt;h2&gt;公司介绍&lt;/h2&gt;&lt;h3&gt;“互联网+智慧出行”，为用户提供安全、便捷的出行服务&lt;/h3&gt;&lt;p&gt;&lt;img src=&quot;/uploads/images/2018-11/16/company.png&quot; title=&quot;company&quot; alt=&quot;company.png&quot; width=&quot;483&quot; height=&quot;270&quot; style=&quot;color: rgb(66, 69, 75); font-family: 微软雅黑; float: right; width: 483px; height: 270px;padding-left:20px;&quot; /&gt;&lt;/p&gt;&lt;p style=&quot;margin-top:0px;margin-bottom:0px;padding:0px;font-family:\'微软雅黑\';color:rgb(66,69,75);line-height:30px;white-space:normal;background-color:rgb(248,248,249);&quot;&gt;“帮邦行”网约出行服务平台隶属于蓝海科技有限责任公司，致力于“互联网+智慧出行”，为用户提供安全、便捷的“城际出行、城内出行、跨城闪送、公务用车”等服务。帮邦行已取得全国网络预约出租汽车线上服务能力认证，拥有工信部授予的全国统一客服号（95170）使用证书。&lt;span style=&quot;color:rgb(66,69,75);font-family:\'微软雅黑\';background-color:rgb(248,248,249);&quot;&gt;    &lt;/span&gt;&lt;span style=&quot;color:rgb(66,69,75);font-family:\'微软雅黑\';background-color:rgb(248,248,249);&quot;&gt;    &lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top:0px;margin-bottom:0px;padding:0px;font-family:\'微软雅黑\';color:rgb(66,69,75);line-height:30px;white-space:normal;background-color:rgb(248,248,249);&quot;&gt;&lt;span style=&quot;color:rgb(66,69,75);font-family:\'微软雅黑\';background-color:rgb(248,248,249);&quot;&gt;    公司目前已在各地设立30个以上分公司，5个客服中心，员工总人数超过500人，技术研发团队超过200人，出行业务覆盖全国300多个市、显、自治区，拥有独立产品设计、技术研发以及市场拓展、互联网营销推广、线路运营和7*24*365在线客服服务。公司始终坚持技术创新，并已获得数十个出行相关软件著作权和设计专利。&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `ph_category_page` VALUES ('4', '29', '&lt;h3&gt;工作内容&lt;/h3&gt;&lt;p style=&quot;width:485px;&quot;&gt;帮邦行专线司机，按公司规定的工作时间，使用帮邦行统一提供的车辆和智能系统接受客户订单，并按照公司服务规范要求为客户提供高质量的驾驶服务。&lt;/p&gt;&lt;h3&gt;人员要求&lt;/h3&gt;&lt;p style=&quot;width:540px;&quot;&gt;&lt;span style=&quot;font-family:\'微软雅黑\';font-size:18px;background-color:rgb(255,255,255);&quot;&gt;驾驶技能：持有C1及以上驾照，3年及以上驾龄，且熟悉本地路况 &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-family:\'微软雅黑\';font-size:18px;background-color:rgb(255,255,255);&quot;&gt;形象：22-55周岁，身体健康，品貌端正&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;font-family:\'微软雅黑\';font-size:18px;background-color:rgb(255,255,255);&quot;&gt;素质：诚信正直，有服务意识，三年内无重大交通事故，无犯罪记录符合当地网约车政策：持有《巡游车从业资格证》和《网约车从业资格证》的优先。&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `ph_category_page` VALUES ('5', '30', '&lt;h1&gt;蓝海科技有限责任公司&lt;/h1&gt;&lt;address&gt;地址：厦门市思明区软件园二期观日路24号之一306A&lt;/address&gt;&lt;p class=&quot;company-sub_title&quot;&gt;招商合作&lt;/p&gt;&lt;p class=&quot;company-sub_value&quot;&gt;电话：0592-5962035&lt;/p&gt;&lt;p class=&quot;company-sub_title&quot;&gt;公司邮箱&lt;/p&gt;&lt;p class=&quot;company-sub_value&quot;&gt;邮箱：business@bbxpc.com&lt;/p&gt;');

-- ----------------------------
-- Table structure for ph_expand
-- ----------------------------
DROP TABLE IF EXISTS `ph_expand`;
CREATE TABLE `ph_expand` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `table` varchar(50) NOT NULL DEFAULT '' COMMENT '模型表名称',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '模型名称',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`table`),
  UNIQUE KEY `name` (`name`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='扩展模型表';

-- ----------------------------
-- Records of ph_expand
-- ----------------------------
INSERT INTO `ph_expand` VALUES ('1', 'online', '线路模型', '1');

-- ----------------------------
-- Table structure for ph_expand_data_online
-- ----------------------------
DROP TABLE IF EXISTS `ph_expand_data_online`;
CREATE TABLE `ph_expand_data_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_content_id` int(10) unsigned NOT NULL,
  `open_time` datetime DEFAULT NULL,
  `car_num` int(11) DEFAULT '0',
  `car_type` varchar(250) DEFAULT '1',
  `service_range` int(11) DEFAULT '0',
  `carpooling_price` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `category_content_id` (`category_content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_expand_data_online
-- ----------------------------
INSERT INTO `ph_expand_data_online` VALUES ('1', '6', '2018-11-14 00:00:00', '100', '1', '102', '59');
INSERT INTO `ph_expand_data_online` VALUES ('2', '7', '2018-11-16 15:34:33', '120', '2', '150', '117');
INSERT INTO `ph_expand_data_online` VALUES ('3', '8', '2018-11-15 00:00:00', '11', '1', '111', '111');

-- ----------------------------
-- Table structure for ph_expand_field
-- ----------------------------
DROP TABLE IF EXISTS `ph_expand_field`;
CREATE TABLE `ph_expand_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `expand_id` smallint(5) unsigned NOT NULL COMMENT 'expand表id',
  `name` varchar(50) NOT NULL COMMENT '字段描述',
  `field` varchar(50) NOT NULL COMMENT '字段名',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段类型，1：文本框；2：多行文本；3：编辑器，4：文件上传；5：单图片上传；6：组图上传；7：下拉菜单；8：单选；9：多选',
  `property` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段属性，1：varchar；2：int；3：text；4：datetime；5：decimal；',
  `len` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '长度',
  `decimal` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '小数点位数',
  `default` varchar(255) NOT NULL DEFAULT '' COMMENT '默认值',
  `sequence` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序，越小越排在前面',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '字段提示',
  `config` varchar(255) NOT NULL DEFAULT '' COMMENT '其他配置',
  `is_must` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否必填，0：否，1：是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `expand_id_name` (`expand_id`,`name`),
  UNIQUE KEY `expand_id_field` (`expand_id`,`field`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='扩展模型字段';

-- ----------------------------
-- Records of ph_expand_field
-- ----------------------------
INSERT INTO `ph_expand_field` VALUES ('1', '1', '开通时间', 'open_time', '1', '4', '0', '0', '', '0', '', 'Y-m-d\nyyyy-MM-dd', '1');
INSERT INTO `ph_expand_field` VALUES ('2', '1', '车辆总数', 'car_num', '1', '2', '11', '0', '0', '0', '', '', '1');
INSERT INTO `ph_expand_field` VALUES ('3', '1', '车型', 'car_type', '9', '1', '250', '0', '1', '0', '', '1=7座MPV\n2=5座轿车', '1');
INSERT INTO `ph_expand_field` VALUES ('4', '1', '服务里程', 'service_range', '1', '2', '11', '0', '0', '0', '只能为整数', '', '1');
INSERT INTO `ph_expand_field` VALUES ('5', '1', '拼车价格', 'carpooling_price', '1', '1', '250', '0', '', '0', '', '', '0');

-- ----------------------------
-- Table structure for ph_form
-- ----------------------------
DROP TABLE IF EXISTS `ph_form`;
CREATE TABLE `ph_form` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '表单名称',
  `no` char(32) NOT NULL COMMENT '表单编号',
  `table` varchar(20) NOT NULL DEFAULT '' COMMENT '表单名',
  `sequence` smallint(6) NOT NULL DEFAULT '0' COMMENT '表单排序，越小越排在前面',
  `sort` varchar(20) NOT NULL DEFAULT 'id DESC' COMMENT '内容排序',
  `display` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否在前台显示此表单的分页列表内容，0：否，1：是',
  `page` smallint(6) NOT NULL DEFAULT '10' COMMENT '前台分页数',
  `alone_tpl` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否使用独立模板，0：否，1：是',
  `tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '前台模板',
  `where` varchar(255) NOT NULL DEFAULT '' COMMENT '前台分页条件',
  `return_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '提交表单返回类型，0：JS消息框，1：json',
  `return_msg` varchar(255) NOT NULL DEFAULT '提交成功' COMMENT '提交成功后返回的提示信息',
  `return_url` varchar(255) NOT NULL DEFAULT '' COMMENT '提交成功后跳转的地址',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  `is_captcha` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否使用图片验证码，0：否，1：是',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `no` (`no`),
  UNIQUE KEY `table` (`table`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='多功能表单表';

-- ----------------------------
-- Records of ph_form
-- ----------------------------
INSERT INTO `ph_form` VALUES ('1', '首页banner', '16348ec582d58f20877c20e2b1ad7075', 'index_banner', '0', 'sort ASC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('2', '热门路线banner', 'caa4f987a18337c6859912ec4f45db2d', 'hotline_banner', '0', 'id DESC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('3', '加盟入驻banner', '410309dd4d817d7703fc46a1dd705433', 'jmrz_banner', '0', 'id DESC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('4', '公务出行banner', '8335b6a67609cf087c082f241cad4032', 'gwcx_banner', '0', 'id DESC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('5', '新闻资讯banner', '0fc38f63b97aa75b37fffc25987b0783', 'news_banner', '0', 'id DESC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('6', '关于我们banner', '969b3dfd4a32d4f054319e5e129930ff', 'about_banner', '0', 'id DESC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('7', '留言反馈', '386bc4714d709824cd5d4a19921e33b6', 'feedback', '1', 'id DESC', '1', '10', '1', '', '', '1', '已提交成功，工作人员会在3-5个工作日内联系您', '', '1', '1');
INSERT INTO `ph_form` VALUES ('8', '司机招募', '3c94cfc3c5430bd7796e895936aba4fa', 'driver_recruitment', '2', 'status ASC,id DESC', '1', '10', '1', '', '', '1', '已提交成功，工作人员会在3-5个工作日内联系您', '', '1', '1');
INSERT INTO `ph_form` VALUES ('9', '友情链接', '7ae855a4194dbc86726f15b0727501f7', 'blogroll', '4', 'sort ASC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('11', '加入我们', '1f851ce995300d23bf2dd1cb68a6b362', 'join_us', '0', 'sort ASC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('12', '发展历程', 'bec379d5c0739b5f5d2e9611883a0cd6', 'history', '7', 'time ASC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');
INSERT INTO `ph_form` VALUES ('13', '我们的使命', '0dd31571113456973b9183e30bac367e', 'us_mission', '8', 'sort ASC', '0', '10', '1', '', '', '0', '提交成功', '', '1', '1');

-- ----------------------------
-- Table structure for ph_form_data_about_banner
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_about_banner`;
CREATE TABLE `ph_form_data_about_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_about_banner
-- ----------------------------
INSERT INTO `ph_form_data_about_banner` VALUES ('1', '/uploads/scrawls/2018-11/16/d6d93e82da303fe103f7dba0ebd5d335.png');

-- ----------------------------
-- Table structure for ph_form_data_blogroll
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_blogroll`;
CREATE TABLE `ph_form_data_blogroll` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `url` varchar(250) DEFAULT '',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_blogroll
-- ----------------------------

-- ----------------------------
-- Table structure for ph_form_data_driver_recruitment
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_driver_recruitment`;
CREATE TABLE `ph_form_data_driver_recruitment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '',
  `phone` varchar(11) DEFAULT '',
  `join_line` varchar(100) DEFAULT '',
  `cre_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_driver_recruitment
-- ----------------------------
INSERT INTO `ph_form_data_driver_recruitment` VALUES ('1', 'aa', '15956503644', '福建省 厦门市 海沧区', '2018-10-19 16:13:37', '0');
INSERT INTO `ph_form_data_driver_recruitment` VALUES ('2', 'aaaa', '15956503644', '河北省 石家庄市 新华区', '2018-10-19 16:15:29', '1');

-- ----------------------------
-- Table structure for ph_form_data_feedback
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_feedback`;
CREATE TABLE `ph_form_data_feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(250) DEFAULT '',
  `phone` varchar(11) DEFAULT '',
  `city` varchar(50) DEFAULT '',
  `message` varchar(100) DEFAULT '',
  `msg_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_feedback
-- ----------------------------
INSERT INTO `ph_form_data_feedback` VALUES ('1', 'aa', '15956503644', '厦门', 'hello', null, '1');
INSERT INTO `ph_form_data_feedback` VALUES ('2', 'bb', '15960651555', '泉州', 'aa是骗子', null, '1');
INSERT INTO `ph_form_data_feedback` VALUES ('3', '', '15956503644', '内蒙古自治区 呼和浩特市 土默特左旗', 'aaa', null, '1');
INSERT INTO `ph_form_data_feedback` VALUES ('5', 'test', '15956503644', '新疆维吾尔自治区 克孜勒苏柯尔克孜自治州 阿克陶县', 'test time', '2018-10-15 14:17:28', '0');
INSERT INTO `ph_form_data_feedback` VALUES ('6', 'aa', '15956503644', '河北省 石家庄市 新华区', 'aaa', '2018-10-19 13:50:43', '0');

-- ----------------------------
-- Table structure for ph_form_data_gwcx_banner
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_gwcx_banner`;
CREATE TABLE `ph_form_data_gwcx_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_gwcx_banner
-- ----------------------------
INSERT INTO `ph_form_data_gwcx_banner` VALUES ('1', '/uploads/scrawls/2018-11/15/ac1fdfdb09f29446a0b8de11afcc6c15.png');

-- ----------------------------
-- Table structure for ph_form_data_history
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_history`;
CREATE TABLE `ph_form_data_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `event` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_history
-- ----------------------------
INSERT INTO `ph_form_data_history` VALUES ('1', '2014-05-01 00:00:00', '蓝海科技有限公司成立');
INSERT INTO `ph_form_data_history` VALUES ('2', '2018-11-01 00:00:00', '新官网上线');
INSERT INTO `ph_form_data_history` VALUES ('3', '2015-11-01 00:00:00', 'aaaa');
INSERT INTO `ph_form_data_history` VALUES ('4', '2016-11-01 00:00:00', '蓝海科技有限公司');
INSERT INTO `ph_form_data_history` VALUES ('5', '2017-11-01 00:00:00', 'rrr');

-- ----------------------------
-- Table structure for ph_form_data_hotline_banner
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_hotline_banner`;
CREATE TABLE `ph_form_data_hotline_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_hotline_banner
-- ----------------------------
INSERT INTO `ph_form_data_hotline_banner` VALUES ('1', '/uploads/scrawls/2018-11/14/244735d1e986f9dedca6a19882317d27.png');

-- ----------------------------
-- Table structure for ph_form_data_index_banner
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_index_banner`;
CREATE TABLE `ph_form_data_index_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT '',
  `image` varchar(250) DEFAULT '',
  `sort` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `title` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_index_banner
-- ----------------------------
INSERT INTO `ph_form_data_index_banner` VALUES ('1', '', '/uploads/scrawls/2018-11/13/3dea18a51b963a87790fb1a33b4b6e82.png', '0', '1', '第一张');
INSERT INTO `ph_form_data_index_banner` VALUES ('2', '', '/uploads/scrawls/2018-11/13/3c76a2e984a4cafcfbd23d0929668f13.png', '0', '1', '第二张');

-- ----------------------------
-- Table structure for ph_form_data_jmrz_banner
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_jmrz_banner`;
CREATE TABLE `ph_form_data_jmrz_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_jmrz_banner
-- ----------------------------
INSERT INTO `ph_form_data_jmrz_banner` VALUES ('1', '/uploads/scrawls/2018-11/15/ba043af5d17f3cc11a2a41640897dfb7.png');

-- ----------------------------
-- Table structure for ph_form_data_join_us
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_join_us`;
CREATE TABLE `ph_form_data_join_us` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT '',
  `name` varchar(50) DEFAULT '',
  `phone` varchar(11) DEFAULT '',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_join_us
-- ----------------------------
INSERT INTO `ph_form_data_join_us` VALUES ('1', '定制巴士', '孙经理', '15960651555', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('2', 'aa', 'aaa', '15956503644', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('3', 'bb', 'bbb', '15960651555', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('4', 'cc', 'ccc', '15960651555', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('5', 'dd', 'ddd', '15960651555', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('6', 'ee', 'eee', '15960651555', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('7', 'ff', 'fff', '15960651555', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('8', 'ii', 'iii', '15960651555', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('9', 'jj', 'jjj', '15960651555', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('10', 'kk', 'kkk', '15956503644', '0');
INSERT INTO `ph_form_data_join_us` VALUES ('11', 'll', 'lll', '15956503644', '0');

-- ----------------------------
-- Table structure for ph_form_data_news_banner
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_news_banner`;
CREATE TABLE `ph_form_data_news_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(250) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_news_banner
-- ----------------------------
INSERT INTO `ph_form_data_news_banner` VALUES ('1', '/uploads/scrawls/2018-11/16/1a97338e1b133a428b228d2e1dfe4775.png');

-- ----------------------------
-- Table structure for ph_form_data_us_mission
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_data_us_mission`;
CREATE TABLE `ph_form_data_us_mission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(10) DEFAULT '',
  `image` varchar(250) DEFAULT '',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ph_form_data_us_mission
-- ----------------------------
INSERT INTO `ph_form_data_us_mission` VALUES ('1', '诚信', '/uploads/scrawls/2018-11/16/fbecb5b171ed2974ecb805de91392eca.png', '0');
INSERT INTO `ph_form_data_us_mission` VALUES ('2', '务实', '/uploads/scrawls/2018-11/16/7a9e5854aff9c1f180c3638c0277f6eb.png', '0');
INSERT INTO `ph_form_data_us_mission` VALUES ('3', '创新', '/uploads/scrawls/2018-11/16/029bfbf044140f0016f850ce612ad8f5.png', '0');
INSERT INTO `ph_form_data_us_mission` VALUES ('4', '共赢', '/uploads/scrawls/2018-11/16/7a776ea3645eb4393676c0929e649380.png', '0');

-- ----------------------------
-- Table structure for ph_form_field
-- ----------------------------
DROP TABLE IF EXISTS `ph_form_field`;
CREATE TABLE `ph_form_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned NOT NULL COMMENT 'form表id',
  `name` varchar(50) NOT NULL COMMENT '字段描述',
  `field` varchar(50) NOT NULL COMMENT '字段名',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段类型，1：文本框；2：多行文本；3：编辑器，4：文件上传；5：单图片上传；6：组图上传；7：下拉菜单；8：单选；9：多选',
  `property` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字段属性，1：varchar；2：int；3：text；4：datetime；5：decimal；',
  `len` smallint(6) NOT NULL DEFAULT '0' COMMENT '字段长度',
  `decimal` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '小数点位数',
  `default` varchar(255) NOT NULL DEFAULT '' COMMENT '默认值',
  `sequence` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序，越小越排在前面',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '字段提示',
  `config` varchar(255) NOT NULL DEFAULT '' COMMENT '字段配置',
  `is_must` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否必填，0：否，1：是',
  `is_unique` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否唯一，0：否，1：是',
  `admin_display` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否后台显示，0：否，1：是',
  `admin_display_len` smallint(6) NOT NULL DEFAULT '0' COMMENT '后台列表显示长度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `form_id_name` (`form_id`,`name`),
  UNIQUE KEY `form_id_field` (`form_id`,`field`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='多功能表单字段表';

-- ----------------------------
-- Records of ph_form_field
-- ----------------------------
INSERT INTO `ph_form_field` VALUES ('1', '1', '链接', 'url', '1', '1', '250', '0', '', '1', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('2', '1', '图片', 'image', '5', '1', '250', '0', '', '2', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('5', '2', '图片', 'image', '5', '1', '250', '0', '', '0', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('7', '3', '图片', 'image', '5', '1', '250', '0', '', '0', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('9', '4', '图片', 'image', '5', '1', '250', '0', '', '0', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('11', '5', '图片', 'image', '5', '1', '250', '0', '', '0', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('13', '1', '排序', 'sort', '1', '2', '11', '0', '0', '3', '数字越小越靠前', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('14', '1', '状态', 'status', '8', '2', '11', '0', '1', '4', '', '1=显示\n0=隐藏', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('15', '7', '昵称', 'nickname', '1', '1', '250', '0', '', '0', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('16', '7', '联系方式', 'phone', '1', '1', '11', '0', '', '0', '联系方式不能为空', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('17', '7', '所在城市', 'city', '1', '1', '50', '0', '', '0', '', '', '0', '0', '0', '0');
INSERT INTO `ph_form_field` VALUES ('18', '7', '留言', 'message', '2', '1', '100', '0', '', '0', '留言不能为空', '', '1', '0', '1', '20');
INSERT INTO `ph_form_field` VALUES ('19', '8', '姓名', 'name', '1', '1', '50', '0', '', '0', '姓名不能为空', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('20', '8', '联系方式', 'phone', '1', '1', '11', '0', '', '0', '联系方式不能为空', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('21', '8', '加盟线路', 'join_line', '1', '1', '100', '0', '', '0', '加盟线路不能为空', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('22', '9', '名称', 'name', '1', '1', '50', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('23', '9', '链接', 'url', '1', '1', '250', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('24', '9', '排序', 'sort', '1', '2', '11', '0', '0', '0', '数字越小越靠前', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('25', '10', '姓名', 'name', '1', '1', '50', '0', '', '0', '姓名不能为空', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('26', '10', '联系方式', 'phone', '1', '1', '11', '0', '', '0', '联系方式只能为11位手机号', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('27', '10', '加盟城市', 'city', '1', '1', '100', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('28', '11', '标题', 'title', '1', '1', '50', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('29', '11', '联系人', 'name', '1', '1', '50', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('30', '11', '联系电话', 'phone', '1', '1', '11', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('31', '11', '顺序', 'sort', '1', '2', '11', '0', '0', '0', '数字越小越靠前', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('32', '1', '标题', 'title', '1', '1', '20', '0', '', '0', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('33', '7', '留言时间', 'msg_time', '1', '4', '0', '0', '', '0', '', 'Y-m-d H:i:s\nyyyy-MM-dd HH:mm:ss', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('34', '7', '处理状态', 'status', '7', '2', '11', '0', '0', '0', '', '0=待处理\n1=已处理', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('36', '6', '图片', 'image', '5', '1', '250', '0', '', '0', '', '', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('37', '12', '时间', 'time', '1', '4', '0', '0', '', '0', '', 'Y.m\nyyyy-MM', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('38', '12', '事件', 'event', '1', '1', '250', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('39', '13', '标题', 'title', '1', '1', '10', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('40', '13', '图片', 'image', '5', '1', '250', '0', '', '0', '', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('41', '13', '排序', 'sort', '1', '2', '11', '0', '0', '0', '数字越小越靠前', '', '1', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('42', '8', '提交时间', 'cre_time', '1', '4', '0', '0', '', '0', '', 'Y-m-d H:i:s\nyyyy-MM-dd HH:mm:ss', '0', '0', '1', '0');
INSERT INTO `ph_form_field` VALUES ('43', '8', '状态', 'status', '7', '2', '11', '0', '0', '0', '', '1=已处理\n0=未处理', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for ph_fragment
-- ----------------------------
DROP TABLE IF EXISTS `ph_fragment`;
CREATE TABLE `ph_fragment` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `sign` varchar(100) NOT NULL DEFAULT '' COMMENT '标识',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text COMMENT '内容',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  PRIMARY KEY (`id`),
  KEY `sign` (`sign`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='自定义变量表';

-- ----------------------------
-- Records of ph_fragment
-- ----------------------------
INSERT INTO `ph_fragment` VALUES ('1', 'xcxqrcode', '帮邦行小程序二维码', '<p><img src=\"/uploads/images/2018-11/13/xcx-qr.png\" title=\"xcx-qr\" alt=\"xcx-qr.png\"/></p>', '1');
INSERT INTO `ph_fragment` VALUES ('2', 'wxqrcode', '帮邦行微信二维码', '<p><img src=\"/uploads/images/2018-11/13/gzh-qr.png\" title=\"gzh-qr\" alt=\"gzh-qr.png\"/></p>', '1');
INSERT INTO `ph_fragment` VALUES ('3', 'appqrcode', '帮邦行APP二维码', '<p><img src=\"/uploads/images/2018-11/13/app-qr.png\" title=\"app-qr\" alt=\"app-qr.png\"/></p>', '1');
INSERT INTO `ph_fragment` VALUES ('4', 'license_plate_number', '牌照数', '&lt;p&gt;74&lt;br /&gt;&lt;/p&gt;', '1');
INSERT INTO `ph_fragment` VALUES ('5', 'service_range', '服务里程', '&lt;p&gt;10579&lt;/p&gt;', '1');
INSERT INTO `ph_fragment` VALUES ('6', 'in_areas', '入驻地区数', '&lt;p&gt;329&lt;/p&gt;', '1');
INSERT INTO `ph_fragment` VALUES ('7', 'official_wechat', '官方微信', '', '1');
INSERT INTO `ph_fragment` VALUES ('8', 'official_microblog', '官方微博', '<p><img src=\"/uploads/images/2018-11/13/gzh-qr.png\" title=\"gzh-qr\" alt=\"gzh-qr.png\"/></p>', '1');
INSERT INTO `ph_fragment` VALUES ('9', 'hot_city', '热门城市', '&lt;p&gt;深圳、香港、哈尔滨、重庆、山东、成都&lt;/p&gt;', '1');
INSERT INTO `ph_fragment` VALUES ('10', 'gwc_qrcode', '公务车二维码', '<p><img src=\"/uploads/images/2018-11/15/app-qr.png\" title=\"app-qr\" alt=\"app-qr.png\"/></p>', '1');
INSERT INTO `ph_fragment` VALUES ('11', 'gwcx_kf_app_url', '公务出行客服端app下载地址', '&lt;p&gt;http://www.baidu.com&lt;/p&gt;', '1');

-- ----------------------------
-- Table structure for ph_language
-- ----------------------------
DROP TABLE IF EXISTS `ph_language`;
CREATE TABLE `ph_language` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '各语言名称',
  `zh_name` varchar(100) NOT NULL COMMENT '中文名称',
  `lang` varchar(20) NOT NULL COMMENT '英文简称，标识',
  `theme` varchar(20) NOT NULL COMMENT '前台视图主题',
  `admin_theme` varchar(20) NOT NULL COMMENT '后台视图主题',
  `domain` varchar(50) NOT NULL DEFAULT '' COMMENT '域名，唯一',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用，0：禁用，1：启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `zh_name` (`zh_name`),
  UNIQUE KEY `lang` (`lang`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='语言表';

-- ----------------------------
-- Records of ph_language
-- ----------------------------
INSERT INTO `ph_language` VALUES ('1', '中文', '中文', 'zh', 'zh', 'zh', '', '1');
INSERT INTO `ph_language` VALUES ('2', 'English', '英文', 'en', 'en', 'zh', '', '0');
INSERT INTO `ph_language` VALUES ('3', '日本語', '日文', 'ja', 'ja', 'zh', '', '0');

-- ----------------------------
-- Table structure for ph_position
-- ----------------------------
DROP TABLE IF EXISTS `ph_position`;
CREATE TABLE `ph_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `sequence` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序，升序',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `sequence` (`sequence`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='推荐位表';

-- ----------------------------
-- Records of ph_position
-- ----------------------------
INSERT INTO `ph_position` VALUES ('1', '热门线路', '0', '1');
INSERT INTO `ph_position` VALUES ('2', '热点新闻', '0', '1');

-- ----------------------------
-- Table structure for ph_replace
-- ----------------------------
DROP TABLE IF EXISTS `ph_replace`;
CREATE TABLE `ph_replace` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '要替换的内容',
  `num` smallint(6) NOT NULL DEFAULT '0' COMMENT '替换次数，0：不限制',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0：禁用，1：启用',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  PRIMARY KEY (`id`),
  KEY `language_id` (`language_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容替换表';

-- ----------------------------
-- Records of ph_replace
-- ----------------------------

-- ----------------------------
-- Table structure for ph_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ph_system_config`;
CREATE TABLE `ph_system_config` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `config` varchar(5000) NOT NULL COMMENT '配置',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统设置';

-- ----------------------------
-- Records of ph_system_config
-- ----------------------------
INSERT INTO `ph_system_config` VALUES ('1', '{\"sitename\":\"帮邦行\",\"seoname\":\"互联网城际出行领导者：拼车、包车、闪送\",\"siteurl\":\"http://bbxweb.com\",\"keywords\":\"网约车\",\"description\":\"帮邦行是蓝海(福建)信息科技有限公司旗下的一站式网约出行服务平台,轻松实现市内出行、网约合乘、网约包车、小件快递当日达服务。\",\"masteremail\":\"\",\"copyright\":\"Copyright © 2014-2018\",\"beian\":\"闽ICP15000255号\",\"telephone\":\"95170\",\"linkman\":\"\",\"fax\":\"\",\"qq\":\"\",\"addr\":\"\",\"html_cache_on\":\"0\",\"html_index_cache_time\":\"7200\",\"html_other_cache_time\":\"86400\",\"html_search_cache_time\":\"3600\",\"data_cache_on\":\"0\",\"tpl_cache_on\":\"0\",\"language_status\":\"0\",\"mobile_open\":\"0\",\"mobile_domain\":\"\",\"mobile_views\":\"mobile\",\"theme\":\"zh\",\"index_tpl\":\"index/index\",\"search_tpl\":\"search/index\",\"tags_index_tpl\":\"tags/index\",\"tags_info_tpl\":\"tags/info\",\"tpl_seach_page\":\"20\",\"tpl_tags_index_page\":\"20\",\"tpl_tags_page\":\"20\",\"upload_switch\":\"0\",\"file_size\":\"2\",\"file_num\":\"10\",\"image_type\":\"png,jpg,jpeg,gif,bmp\",\"video_type\":\"flv,swf,mkv,avi,rm,rmvb,mpeg,mpg,ogg,ogv,mov,wmv,mp4,webm,mp3,wav,mid\",\"file_type\":\"png,jpg,jpeg,gif,bmp,flv,swf,mkv,avi,rm,rmvb,mpeg,mpg,ogg,ogv,mov,wmv,mp4,webm,mp3,wav,mid,rar,zip,tar,gz,7z,bz2,cab,iso,doc,docx,xls,xlsx,ppt,pptx,pdf,txt,md,xml\",\"thumbnail_switch\":\"0\",\"thumbnail_cutout\":\"1\",\"thumbnail_maxwidth\":\"210\",\"thumbnail_maxheight\":\"110\",\"watermark_switch\":\"0\",\"watermark_place\":\"0\",\"watermark_image\":\"\"}', '1');

-- ----------------------------
-- Table structure for ph_tags
-- ----------------------------
DROP TABLE IF EXISTS `ph_tags`;
CREATE TABLE `ph_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tags_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'tags_group表id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标签名',
  `click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击次数',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  PRIMARY KEY (`id`),
  KEY `tags_group_id` (`tags_group_id`),
  KEY `name` (`name`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of ph_tags
-- ----------------------------
INSERT INTO `ph_tags` VALUES ('1', '0', '马鞍山', '0', '1');
INSERT INTO `ph_tags` VALUES ('2', '0', '芜湖', '0', '1');
INSERT INTO `ph_tags` VALUES ('3', '0', '线路', '0', '1');
INSERT INTO `ph_tags` VALUES ('4', '0', '合肥', '0', '1');

-- ----------------------------
-- Table structure for ph_tags_group
-- ----------------------------
DROP TABLE IF EXISTS `ph_tags_group`;
CREATE TABLE `ph_tags_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标签组名',
  `language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'language表id',
  PRIMARY KEY (`id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签组表';

-- ----------------------------
-- Records of ph_tags_group
-- ----------------------------

-- ----------------------------
-- Table structure for ph_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `ph_tags_relation`;
CREATE TABLE `ph_tags_relation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_content_id` int(10) unsigned NOT NULL COMMENT 'category_content表id',
  `tags_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'tags表id',
  PRIMARY KEY (`id`),
  KEY `category_content_id` (`category_content_id`),
  KEY `tags_id` (`tags_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='内容标签关系表';

-- ----------------------------
-- Records of ph_tags_relation
-- ----------------------------
INSERT INTO `ph_tags_relation` VALUES ('1', '6', '1');
INSERT INTO `ph_tags_relation` VALUES ('2', '6', '2');
INSERT INTO `ph_tags_relation` VALUES ('3', '6', '3');
INSERT INTO `ph_tags_relation` VALUES ('4', '7', '2');
INSERT INTO `ph_tags_relation` VALUES ('5', '7', '4');
INSERT INTO `ph_tags_relation` VALUES ('6', '7', '3');
INSERT INTO `ph_tags_relation` VALUES ('7', '4', '2');
INSERT INTO `ph_tags_relation` VALUES ('8', '5', '4');
INSERT INTO `ph_tags_relation` VALUES ('9', '8', '1');
INSERT INTO `ph_tags_relation` VALUES ('10', '8', '2');

-- ----------------------------
-- Table structure for ph_translate
-- ----------------------------
DROP TABLE IF EXISTS `ph_translate`;
CREATE TABLE `ph_translate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sign` char(32) NOT NULL COMMENT '原文+"to"+language表标识（lang）后md5',
  `source_text` varchar(255) NOT NULL COMMENT '原文',
  `source_language_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '原文language表 id',
  `translated_text` varchar(255) NOT NULL COMMENT '译文',
  `translated_language_id` tinyint(3) unsigned NOT NULL COMMENT '译文language表 id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sign` (`sign`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='翻译表';

-- ----------------------------
-- Records of ph_translate
-- ----------------------------

-- ----------------------------
-- Table structure for ph_translate_driver
-- ----------------------------
DROP TABLE IF EXISTS `ph_translate_driver`;
CREATE TABLE `ph_translate_driver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '驱动名称',
  `class_name` varchar(100) NOT NULL COMMENT '类名（包含命名空间）',
  `config` varchar(2000) NOT NULL DEFAULT '' COMMENT '配置',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用，0：禁用，1：启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='翻译驱动表';

-- ----------------------------
-- Records of ph_translate_driver
-- ----------------------------

-- ----------------------------
-- Table structure for ph_upload
-- ----------------------------
DROP TABLE IF EXISTS `ph_upload`;
CREATE TABLE `ph_upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL COMMENT '文件',
  `folder` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `title` varchar(255) NOT NULL COMMENT '文件名',
  `ext` varchar(20) NOT NULL DEFAULT '' COMMENT '文件扩展名',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型',
  `time` datetime NOT NULL COMMENT '上传时间',
  `module` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '所属模块，-1:未绑定模块；1：栏目模块，2：内容模块，3：扩展模块，4：表单模块',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `ext` (`ext`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='上传文件表';

-- ----------------------------
-- Records of ph_upload
-- ----------------------------
INSERT INTO `ph_upload` VALUES ('1', '/uploads/images/2018-11/13/xcx-qr.png', '/uploads/images/2018-11/13/', 'xcx-qr', 'png', '15875', 'image/png', '2018-11-13 15:06:54', '3');
INSERT INTO `ph_upload` VALUES ('2', '/uploads/images/2018-11/13/gzh-qr.png', '/uploads/images/2018-11/13/', 'gzh-qr', 'png', '19714', 'image/png', '2018-11-13 15:12:12', '3');
INSERT INTO `ph_upload` VALUES ('3', '/uploads/images/2018-11/13/app-qr.png', '/uploads/images/2018-11/13/', 'app-qr', 'png', '12710', 'image/png', '2018-11-13 15:12:41', '3');
INSERT INTO `ph_upload` VALUES ('4', '/uploads/scrawls/2018-11/13/3dea18a51b963a87790fb1a33b4b6e82.png', '/uploads/scrawls/2018-11/13/', '3dea18a51b963a87790fb1a33b4b6e82', 'png', '892778', 'image/png', '2018-11-13 15:17:51', '4');
INSERT INTO `ph_upload` VALUES ('5', '/uploads/scrawls/2018-11/13/3c76a2e984a4cafcfbd23d0929668f13.png', '/uploads/scrawls/2018-11/13/', '3c76a2e984a4cafcfbd23d0929668f13', 'png', '892778', 'image/png', '2018-11-13 15:18:10', '4');
INSERT INTO `ph_upload` VALUES ('6', '/uploads/scrawls/2018-11/13/995a1e61af65c748403ba255c1235fda.png', '/uploads/scrawls/2018-11/13/', '995a1e61af65c748403ba255c1235fda', 'png', '892778', 'image/png', '2018-11-13 16:02:54', '2');
INSERT INTO `ph_upload` VALUES ('7', '/uploads/scrawls/2018-11/13/aab1dcfeb5cebb9948c30f9f1faa3ba4.png', '/uploads/scrawls/2018-11/13/', 'aab1dcfeb5cebb9948c30f9f1faa3ba4', 'png', '892778', 'image/png', '2018-11-13 16:38:41', '2');
INSERT INTO `ph_upload` VALUES ('8', '/uploads/scrawls/2018-11/13/43dcd7881765fe512597817e70248518.png', '/uploads/scrawls/2018-11/13/', '43dcd7881765fe512597817e70248518', 'png', '892778', 'image/png', '2018-11-13 16:42:24', '2');
INSERT INTO `ph_upload` VALUES ('9', '/uploads/scrawls/2018-11/13/8ce22b01047d5ee549457634bd7daf9d.png', '/uploads/scrawls/2018-11/13/', '8ce22b01047d5ee549457634bd7daf9d', 'png', '892778', 'image/png', '2018-11-13 17:50:17', '2');
INSERT INTO `ph_upload` VALUES ('10', '/uploads/scrawls/2018-11/13/a563501c017aa9206b0135473e05977c.png', '/uploads/scrawls/2018-11/13/', 'a563501c017aa9206b0135473e05977c', 'png', '892778', 'image/png', '2018-11-13 17:50:49', '2');
INSERT INTO `ph_upload` VALUES ('11', '/uploads/scrawls/2018-11/14/244735d1e986f9dedca6a19882317d27.png', '/uploads/scrawls/2018-11/14/', '244735d1e986f9dedca6a19882317d27', 'png', '892778', 'image/png', '2018-11-14 10:57:11', '4');
INSERT INTO `ph_upload` VALUES ('12', '/uploads/images/2018-11/14/introduce2.png', '/uploads/images/2018-11/14/', 'introduce2', 'png', '88855', 'image/png', '2018-11-14 15:34:16', '2');
INSERT INTO `ph_upload` VALUES ('13', '/uploads/scrawls/2018-11/15/ba043af5d17f3cc11a2a41640897dfb7.png', '/uploads/scrawls/2018-11/15/', 'ba043af5d17f3cc11a2a41640897dfb7', 'png', '892778', 'image/png', '2018-11-15 16:08:05', '4');
INSERT INTO `ph_upload` VALUES ('14', '/uploads/scrawls/2018-11/15/ac1fdfdb09f29446a0b8de11afcc6c15.png', '/uploads/scrawls/2018-11/15/', 'ac1fdfdb09f29446a0b8de11afcc6c15', 'png', '892778', 'image/png', '2018-11-15 16:54:06', '4');
INSERT INTO `ph_upload` VALUES ('15', '/uploads/images/2018-11/15/app-qr.png', '/uploads/images/2018-11/15/', 'app-qr', 'png', '12710', 'image/png', '2018-11-15 16:56:20', '3');
INSERT INTO `ph_upload` VALUES ('16', '/uploads/scrawls/2018-11/16/1a97338e1b133a428b228d2e1dfe4775.png', '/uploads/scrawls/2018-11/16/', '1a97338e1b133a428b228d2e1dfe4775', 'png', '892778', 'image/png', '2018-11-16 10:30:45', '4');
INSERT INTO `ph_upload` VALUES ('17', '/uploads/scrawls/2018-11/16/d6d93e82da303fe103f7dba0ebd5d335.png', '/uploads/scrawls/2018-11/16/', 'd6d93e82da303fe103f7dba0ebd5d335', 'png', '892778', 'image/png', '2018-11-16 13:51:54', '4');
INSERT INTO `ph_upload` VALUES ('18', '/uploads/images/2018-11/16/company.png', '/uploads/images/2018-11/16/', 'company', 'png', '256902', 'image/png', '2018-11-16 14:03:24', '1');
INSERT INTO `ph_upload` VALUES ('19', '/uploads/scrawls/2018-11/16/fbecb5b171ed2974ecb805de91392eca.png', '/uploads/scrawls/2018-11/16/', 'fbecb5b171ed2974ecb805de91392eca', 'png', '55262', 'image/png', '2018-11-16 14:46:05', '4');
INSERT INTO `ph_upload` VALUES ('20', '/uploads/scrawls/2018-11/16/7a9e5854aff9c1f180c3638c0277f6eb.png', '/uploads/scrawls/2018-11/16/', '7a9e5854aff9c1f180c3638c0277f6eb', 'png', '59136', 'image/png', '2018-11-16 14:46:19', '4');
INSERT INTO `ph_upload` VALUES ('21', '/uploads/scrawls/2018-11/16/029bfbf044140f0016f850ce612ad8f5.png', '/uploads/scrawls/2018-11/16/', '029bfbf044140f0016f850ce612ad8f5', 'png', '49221', 'image/png', '2018-11-16 14:46:45', '4');
INSERT INTO `ph_upload` VALUES ('22', '/uploads/scrawls/2018-11/16/7a776ea3645eb4393676c0929e649380.png', '/uploads/scrawls/2018-11/16/', '7a776ea3645eb4393676c0929e649380', 'png', '52111', 'image/png', '2018-11-16 14:46:58', '4');
INSERT INTO `ph_upload` VALUES ('23', '/uploads/scrawls/2018-11/16/897ac039834399b0e45c343c3af14d98.png', '/uploads/scrawls/2018-11/16/', '897ac039834399b0e45c343c3af14d98', 'png', '312729', 'image/png', '2018-11-16 16:06:52', '2');
INSERT INTO `ph_upload` VALUES ('24', '/uploads/scrawls/2018-11/16/7d46bd6b2b287cc29132884a2df83783.png', '/uploads/scrawls/2018-11/16/', '7d46bd6b2b287cc29132884a2df83783', 'png', '312729', 'image/png', '2018-11-16 16:07:31', '2');
INSERT INTO `ph_upload` VALUES ('25', '/uploads/scrawls/2018-11/16/0b40763bf3ec451eb54dddef394593df.png', '/uploads/scrawls/2018-11/16/', '0b40763bf3ec451eb54dddef394593df', 'png', '312729', 'image/png', '2018-11-16 16:07:50', '2');
INSERT INTO `ph_upload` VALUES ('26', '/uploads/scrawls/2018-11/16/c4c91da017b7106659eaf39dee2625e9.png', '/uploads/scrawls/2018-11/16/', 'c4c91da017b7106659eaf39dee2625e9', 'png', '375095', 'image/png', '2018-11-16 16:08:46', '2');
INSERT INTO `ph_upload` VALUES ('27', '/uploads/scrawls/2018-11/16/a7aff491e775174803221b0e70edd2c6.png', '/uploads/scrawls/2018-11/16/', 'a7aff491e775174803221b0e70edd2c6', 'png', '375095', 'image/png', '2018-11-16 16:08:59', '2');
INSERT INTO `ph_upload` VALUES ('28', '/uploads/scrawls/2018-11/16/fe61494eeb5c8b12b54659b24337b808.png', '/uploads/scrawls/2018-11/16/', 'fe61494eeb5c8b12b54659b24337b808', 'png', '375095', 'image/png', '2018-11-16 16:09:29', '2');
INSERT INTO `ph_upload` VALUES ('29', '/uploads/scrawls/2018-11/16/2d4098bd715417ac42b63ca06d2ff2ad.png', '/uploads/scrawls/2018-11/16/', '2d4098bd715417ac42b63ca06d2ff2ad', 'png', '375095', 'image/png', '2018-11-16 16:09:53', '2');
INSERT INTO `ph_upload` VALUES ('30', '/uploads/scrawls/2018-11/16/a7d637508c32c695b347b2661dc05960.png', '/uploads/scrawls/2018-11/16/', 'a7d637508c32c695b347b2661dc05960', 'png', '375095', 'image/png', '2018-11-16 16:10:26', '2');
INSERT INTO `ph_upload` VALUES ('31', '/uploads/scrawls/2018-11/16/5e27f82ea10eb86a4b1d0804569dfee1.png', '/uploads/scrawls/2018-11/16/', '5e27f82ea10eb86a4b1d0804569dfee1', 'png', '375095', 'image/png', '2018-11-16 16:10:38', '2');
INSERT INTO `ph_upload` VALUES ('32', '/uploads/scrawls/2018-11/16/b1fce7fcbf0cccc3112881cfecf26e46.png', '/uploads/scrawls/2018-11/16/', 'b1fce7fcbf0cccc3112881cfecf26e46', 'png', '375095', 'image/png', '2018-11-16 16:10:51', '2');
INSERT INTO `ph_upload` VALUES ('33', '/uploads/scrawls/2018-11/16/b122e7931a53d47f399ac080229047ff.png', '/uploads/scrawls/2018-11/16/', 'b122e7931a53d47f399ac080229047ff', 'png', '375095', 'image/png', '2018-11-16 16:11:02', '2');
INSERT INTO `ph_upload` VALUES ('34', '/uploads/scrawls/2018-11/16/d8f8ac54e26cdf5ac1dda741253151d1.png', '/uploads/scrawls/2018-11/16/', 'd8f8ac54e26cdf5ac1dda741253151d1', 'png', '12569', 'image/png', '2018-11-16 17:01:30', '2');

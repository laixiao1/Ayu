/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 5.7.18-log : Database - study-room
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`study-room` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `study-room`;

/*Table structure for table `bas_appointment` */

DROP TABLE IF EXISTS `bas_appointment`;

CREATE TABLE `bas_appointment` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `seat_id` bigint(20) NOT NULL COMMENT '座位id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '预约者id',
  `seat_phone` varchar(32) DEFAULT NULL COMMENT '预约者电话',
  `seat_name` varchar(32) DEFAULT NULL COMMENT '预约者姓名',
  `seat_class` varchar(32) DEFAULT NULL COMMENT '预约者专业班级',
  `seat_time` datetime DEFAULT NULL COMMENT '预约时间',
  `seat_day` varchar(50) DEFAULT NULL COMMENT '预约时间区间',
  `seat_state` tinyint(1) DEFAULT NULL COMMENT '审核状态0通过1未审核2不通过',
  `create_user_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '创建者ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0[正常;1删除]',
  `delete_user_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='预约信息表';

/*Data for the table `bas_appointment` */

insert  into `bas_appointment`(`id`,`seat_id`,`user_id`,`seat_phone`,`seat_name`,`seat_class`,`seat_time`,`seat_day`,`seat_state`,`create_user_id`,`create_time`,`update_time`,`delete_flag`,`delete_user_id`,`delete_time`) values 
(1633033287029506049,1,1633022578761752577,'17674757651','皮皮林','软件工程101','2023-03-07 17:14:11','2023年03月07日-2023年03月08日',1,1633022578761752577,'2023-03-07 17:14:11',NULL,0,NULL,NULL),
(1898913853980504066,1623229638376652802,1898913720794574850,'15586521451','老六','计算机2年级','2025-03-10 09:48:38','2025年03月10日-2025年03月11日',0,1898913720794574850,'2025-03-10 09:48:37','2025-03-10 09:49:14',1,NULL,NULL),
(1898915168630566913,2,1898913720794574850,'19956241251','老气','计算机三年级','2025-03-10 09:53:51','2025年03月10日-2025年03月11日',1,1898913720794574850,'2025-03-10 09:53:50',NULL,0,NULL,NULL);

/*Table structure for table `bas_floor` */

DROP TABLE IF EXISTS `bas_floor`;

CREATE TABLE `bas_floor` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `floor` varchar(50) NOT NULL COMMENT '楼层',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bas_floor` */

insert  into `bas_floor`(`id`,`floor`) values 
(1,'一楼'),
(1622886222061088769,'二楼'),
(1623315482995314690,'三楼');

/*Table structure for table `bas_message` */

DROP TABLE IF EXISTS `bas_message`;

CREATE TABLE `bas_message` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `message` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `message_type` tinyint(1) DEFAULT NULL COMMENT '0举报 1留言',
  `user_id` bigint(20) NOT NULL COMMENT '留言用户',
  `message_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bas_message` */

insert  into `bas_message`(`id`,`message`,`message_type`,`user_id`,`message_time`,`username`) values 
(1623510164144635905,'优化一下',1,1623140809162600450,'2025-05-09 10:32:41','一百袁子'),
(1623511709124902913,'蔡徐坤在自习室大声唱跳Rap',0,1623140809162600450,'2025-05-09 10:38:50','一百袁子'),
(1623559384317579265,'这是留言',0,1622493029438877697,'2025-05-09 13:48:16','Cold Water'),
(1623573133493534721,'我的建议是不要唱跳rap',1,1622493029438877697,'2025-05-09 14:42:54','Cold Water'),
(1623573282563293186,'优化一下小程序把',0,1622493029438877697,'2025-05-09 14:43:30','Cold Water');

/*Table structure for table `bas_notice` */

DROP TABLE IF EXISTS `bas_notice`;

CREATE TABLE `bas_notice` (
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `notice_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发布状态 0 发布 1 未发布',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_content` varchar(255) DEFAULT NULL COMMENT '公告内容',
  `create_user_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '创建者ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0[正常;1删除]',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告表';

/*Data for the table `bas_notice` */

insert  into `bas_notice`(`notice_id`,`notice_state`,`sort`,`notice_title`,`notice_content`,`create_user_id`,`create_time`,`update_time`,`delete_flag`) values 
(1620597283315810306,0,1,'自习室开放时间','一号自习室将在7点开放',2,'2025-05-01 09:37:56','2025-05-09 13:53:52',0),
(1620597629907927041,0,2,'ikun们冲阿','我喜欢唱跳rap',2,'2025-05-01 09:39:18','2025-05-09 14:44:17',0),
(1622529306969468929,0,3,'违规处罚通报','大家注意不要在自习室吃东西',1,'2025-05-06 17:35:06','2025-05-09 14:44:18',0);

/*Table structure for table `bas_seat` */

DROP TABLE IF EXISTS `bas_seat`;

CREATE TABLE `bas_seat` (
  `seat_id` bigint(20) NOT NULL COMMENT '座位id',
  `room_id` bigint(20) NOT NULL COMMENT '自习室id',
  `seat_name` varchar(32) NOT NULL COMMENT '座位名称',
  `room_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '座位预约状态【0开放，1已预约】',
  `create_user_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '创建者ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0[正常;1删除]',
  `delete_user_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`seat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='座位表';

/*Data for the table `bas_seat` */

insert  into `bas_seat`(`seat_id`,`room_id`,`seat_name`,`room_state`,`create_user_id`,`create_time`,`update_time`,`delete_flag`,`delete_user_id`,`delete_time`) values 
(1,1,'A1',0,1,'2025-05-01 17:32:10','2025-03-10 09:49:14',0,NULL,NULL),
(2,1,'A2',1,1,'2025-05-01 17:32:53','2025-03-10 09:53:50',0,NULL,NULL),
(1622953599859671041,1622946237346201601,'1号',0,1,'2025-05-07 21:41:06','2025-05-08 17:56:51',0,NULL,NULL),
(1623229575436926977,1622948185944342529,'1号',0,1,'2025-05-08 15:57:44','2025-05-09 14:50:26',0,NULL,NULL),
(1623229638376652802,1622948185944342529,'2号',0,1,'2025-05-08 15:57:59','2025-03-10 09:49:14',0,NULL,NULL),
(1623229678809743361,1622948185944342529,'3号',0,1,'2025-05-08 15:58:08','2025-05-08 17:46:31',0,NULL,NULL),
(1623229755309654017,1623228589985202177,'1号',0,1,'2025-05-08 15:58:26','2025-05-08 18:22:01',0,NULL,NULL),
(1623229800683634690,1623228589985202177,'2号',0,1,'2025-05-08 15:58:37','2025-05-08 17:57:50',0,NULL,NULL),
(1623233238242918402,1623228422041075714,'一号',0,1,'2025-05-08 16:12:17','2025-05-08 17:46:31',0,NULL,NULL),
(1623233275484143617,1623228422041075714,'二号',0,1,'2025-05-08 16:12:26',NULL,0,NULL,NULL),
(1623556720871624706,1,'A3',0,1,'2025-05-09 13:37:41',NULL,0,NULL,NULL),
(1623556763087294466,1,'A4',0,1,'2025-05-09 13:37:51',NULL,0,NULL,NULL),
(1623556804262776833,1,'A5',0,1,'2025-05-09 13:38:01',NULL,0,NULL,NULL),
(1623556864769806337,1,'A6',0,1,'2025-05-09 13:38:15',NULL,0,NULL,NULL),
(1623556902514348034,1,'A7',0,1,'2025-05-09 13:38:24',NULL,0,NULL,NULL),
(1623557924603318274,1622946237346201601,'2号',0,1,'2025-05-09 13:42:28',NULL,0,NULL,NULL);

/*Table structure for table `bas_study_room` */

DROP TABLE IF EXISTS `bas_study_room`;

CREATE TABLE `bas_study_room` (
  `room_id` bigint(20) NOT NULL COMMENT '自习室id',
  `floor_id` bigint(20) NOT NULL COMMENT '楼层id',
  `room_name` varchar(32) NOT NULL COMMENT '自习室名称',
  `opening_time` varchar(32) DEFAULT NULL COMMENT '开放时间',
  `close_time` varchar(32) DEFAULT NULL COMMENT '结束时间',
  `create_user_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '创建者ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标识0[正常;1删除]',
  `delete_user_id` varchar(32) DEFAULT NULL COMMENT '删除人ID',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='自习室表';

/*Data for the table `bas_study_room` */

insert  into `bas_study_room`(`room_id`,`floor_id`,`room_name`,`opening_time`,`close_time`,`create_user_id`,`create_time`,`update_time`,`delete_flag`,`delete_user_id`,`delete_time`) values 
(1,1,'一号自习室','07:30','17:00',1,'2025-05-01 17:31:24','2025-05-09 13:41:06',0,NULL,NULL),
(1622946237346201601,1,'二号自习室','05:41','14:41',1,'2025-05-07 21:11:51','2025-05-09 13:41:40',0,NULL,NULL),
(1622948185944342529,1622886222061088769,'自习室201','14:18','15:18',1,'2025-05-07 21:19:35','2025-05-09 14:18:21',0,NULL,NULL),
(1623228422041075714,1,'三号自习室','13:41','14:41',1,'2025-05-08 15:53:09','2025-05-09 13:41:55',0,NULL,NULL),
(1623228589985202177,1622886222061088769,'自习室202','14:18','15:18',1,'2025-05-08 15:53:49','2025-05-09 14:18:32',0,NULL,NULL),
(1623311202515144705,1,'哈哈哈','21:21','22:21',1,'2025-05-08 21:22:05','2025-05-08 21:50:49',1,NULL,NULL),
(1623314192705769473,1,'测试更多','21:33','22:53',1,'2025-05-08 21:33:57','2025-05-09 13:36:58',1,NULL,NULL),
(1623558194515169282,1623315482995314690,'考研自习室','01:30','23:30',1,'2025-05-09 13:43:32','2025-05-09 14:47:35',1,NULL,NULL),
(1623573831517995010,1623573745719312386,'唱跳自习室','14:45','15:45',1,'2025-05-09 14:45:40','2025-05-09 14:46:03',1,NULL,NULL);

/*Table structure for table `sys_captcha` */

DROP TABLE IF EXISTS `sys_captcha`;

CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统验证码';

/*Data for the table `sys_captcha` */

insert  into `sys_captcha`(`uuid`,`code`,`expire_time`) values 
('04e77ff0-9e6d-4b43-8217-3af79ed5dce2','54mcn','2023-03-07 17:30:59'),
('51e554a8-2ec3-4930-84ef-413361e9713f','n5n72','2023-03-07 18:02:49'),
('e71800b1-68bc-460b-8459-601df7ffe40d','53dpg','2025-03-10 10:01:23');

/*Table structure for table `sys_log` */

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`username`,`operation`,`method`,`params`,`time`,`ip`,`create_date`) values 
(90,'admin','修改密码','com.selfstudy.modules.sys.controller.SysUserController.password()','[{\"password\":\"admin\",\"newPassword\":\"123456\"}]',10,'0:0:0:0:0:0:0:1','2025-03-10 09:36:22');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values 
(1,0,'系统管理',NULL,NULL,0,'system',0),
(2,1,'管理员列表','sys/user',NULL,1,'admin',1),
(3,1,'角色管理','sys/role',NULL,1,'role',2),
(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),
(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),
(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),
(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),
(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),
(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),
(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),
(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),
(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),
(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),
(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),
(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),
(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),
(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),
(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),
(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),
(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),
(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),
(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),
(45,0,'位置管理','','',0,'zonghe',1),
(46,45,'楼层管理','position/copy','',1,'menu',0),
(47,45,'自习室管理','position/study','',1,'menu',1),
(48,45,'座位管理','position/seat','',1,'menu',2),
(49,0,'预约管理','appointment/index','',1,'bianji',2),
(50,0,'留言管理','message/age','',1,'pinglun',3),
(51,0,'用户管理','user/index','',1,'geren',4),
(52,0,'公告管理','notice/index','',1,'log',5);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`remark`,`create_user_id`,`create_time`) values 
(1,'管理员','所有权限',1,'2023-01-22 05:03:18'),
(2,'普通管理员','非系统权限',1,'2023-01-30 14:06:41');

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`id`,`role_id`,`menu_id`) values 
(516,1,1),
(517,1,2),
(518,1,15),
(519,1,16),
(520,1,17),
(521,1,18),
(522,1,3),
(523,1,19),
(524,1,20),
(525,1,21),
(526,1,22),
(527,1,4),
(528,1,23),
(529,1,24),
(530,1,25),
(531,1,26),
(532,1,5),
(533,1,29),
(534,1,7),
(535,1,8),
(536,1,9),
(537,1,10),
(538,1,11),
(539,1,12),
(540,1,13),
(541,1,14),
(542,1,45),
(543,1,46),
(544,1,47),
(545,1,48),
(546,1,49),
(547,1,50),
(548,1,51),
(549,1,52),
(550,1,-666666),
(551,2,45),
(552,2,46),
(553,2,47),
(554,2,48),
(555,2,49),
(556,2,50),
(557,2,51),
(558,2,52),
(559,2,-666666);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`) values 
(1,'java1234','cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a','YzcmCZNvbXocrsz9dm8e','admin@126.com','12345678901',1,1,'2023-01-01 11:11:11'),
(2,'zhang','cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a','YzcmCZNvbXocrsz9dm8e','1224667966@qq.com','18567073930',1,1,'2023-01-18 12:12:58'),
(3,'yuan','cdac762d0ba79875489f6a8b430fa8b5dfe0cdd81da38b80f02f33328af7fd4a','YzcmCZNvbXocrsz9dm8e','yuan@gmail.com','17593769472',1,1,'2023-01-30 10:55:11');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`id`,`user_id`,`role_id`) values 
(11,3,2),
(12,3,1),
(15,2,1),
(16,2,2);

/*Table structure for table `sys_user_token` */

DROP TABLE IF EXISTS `sys_user_token`;

CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统用户Token';

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`user_id`,`token`,`expire_time`,`update_time`) values 
(1,'117958f4f087b37f6a1fcc97cc95e1d1','2025-03-10 21:57:10','2025-03-10 09:57:10'),
(2,'33bd93e9173649472e94afbfc01f3842','2025-03-10 21:37:07','2025-03-10 09:37:07'),
(3,'231a3b3c4f901f0abd27b40a8a137190','2025-05-08 02:21:24','2025-05-07 14:21:24');

/*Table structure for table `tb_token` */

DROP TABLE IF EXISTS `tb_token`;

CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(255) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='小程序用户Token';

/*Data for the table `tb_token` */

insert  into `tb_token`(`user_id`,`token`,`expire_time`,`update_time`) values 
(1620251653456310274,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNjIwMjUxNjUzNDU2MzEwMjc0IiwiaWF0IjoxNjc1NjUyMjczLCJleHAiOjE2NzYyNTcwNzN9.BAel_YGxIXYj6jCFBdnv_MlvVFotyWHtFfJehU4BCwZRk_UV9fbM19GsZEVnfvJEX4xpFlT0Sfh4GTyigu7sbQ','2025-05-13 10:57:54','2025-05-06 10:57:54'),
(1621444076197490690,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNjIxNDQ0MDc2MTk3NDkwNjkwIiwiaWF0IjoxNjc1NjYzMDA0LCJleHAiOjE2NzYyNjc4MDR9.R7LquE-YU7po64BccZy6rZASaX0Dj9GkSGK94Dz3kyuFEY3Bqg5PUIbb5hyjK310mq8qRcwbkdyXKzhkVfoZXA','2025-05-13 13:56:45','2025-05-06 13:56:45'),
(1622493029438877697,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNjIyNDkzMDI5NDM4ODc3Njk3IiwiaWF0IjoxNjc1OTI0OTQ0LCJleHAiOjE2NzY1Mjk3NDR9.Qnk0JO0rpNQELNNc8dSGruFTxg9KgzhKh7vmE5XBqUpPU6snsfLUUp8z_FpnId2YbPetNQuYBGqMSnvr5rRhRw','2025-05-16 14:42:25','2025-05-09 14:42:25'),
(1623140809162600450,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxNjIzMTQwODA5MTYyNjAwNDUwIiwiaWF0IjoxNjc1OTIzMzU3LCJleHAiOjE2NzY1MjgxNTd9.4ts6E0AICe_LyoE8U8UyeTBIqycBobho0PUoH0FtbsIa_jK73Sfck9gFs_X6fjzDlCqtHsAfsdKz5EnEGqg_yQ','2025-05-16 14:15:57','2025-05-09 14:15:57'),
(1623171761125330945,'69d36d8f9ede4047654e362a293c41fb','2025-05-15 14:08:07','2025-05-08 14:08:07'),
(1633022578761752577,'544819ec4777ca50c32db3ef6a044bc9','2023-03-14 17:59:13','2023-03-07 17:59:13'),
(1633022826821279746,'3e9ad6a65b73f70fd6a52abd7566d6a6','2023-03-14 16:36:03','2023-03-07 16:36:03'),
(1898913720794574850,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxODk4OTEzNzIwNzk0NTc0ODUwIiwiaWF0IjoxNzQxNTcxMjg1LCJleHAiOjE3NDIxNzYwODV9.3zXi5bHoFmkdY0bcBi9MbtNFMWx1ZGhJrio_VVKxouOo2sfvggYQ1-IYOznyooHS6phnPcj0aLgzel8_UovalA','2025-03-17 09:48:06','2025-03-10 09:48:06');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `account` varchar(20) DEFAULT NULL COMMENT '账号',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  0：禁用   1：正常',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `qq` bigint(20) DEFAULT NULL COMMENT 'qq账号',
  `email` varchar(40) DEFAULT NULL COMMENT '邮箱',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `user_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `open_id` varchar(255) DEFAULT NULL COMMENT '微信唯一标识',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1898913720794574851 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`account`,`mobile`,`password`,`create_time`,`status`,`name`,`qq`,`email`,`bz`,`user_img`,`open_id`) values 
(1621444076197490690,'为了节目效果',NULL,NULL,NULL,'2025-05-03 17:42:47',1,NULL,NULL,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/PbibQZ77qlv667BG8L17QHFP2FLJib32UVfLdrhxTrosZanObDbRCriaoDvEFaWXawOfZm5BZ0yMVZG3WN4ECLheg/132','oUzgn5IcvxEO9KpGKZNaoJpySiYk'),
(1622493029438877697,'Cold Water','q123','145645435963',NULL,'2025-05-06 15:10:57',1,'蔡徐坤',122236966,'123512@qq.com','我喜欢唱跳rap','https://thirdwx.qlogo.cn/mmopen/vi_32/30Od6kAwgKRhhO5Nts7hYW7BOQoMP3ZW0erNSCelIraXib7HNlmKnEJPGpcfut1XlV7jPOC6ibUAs3xBp7YmZF3w/132','o1Uf85arlrsPBxsX8boxWwRjhE34'),
(1623140809162600450,'一百袁子',NULL,'1111111',NULL,'2025-05-08 10:05:00',1,'秦志远',12323131,'23123@qweds.com','测试修改','https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTImulUlnXe54DicTspic55Y8zIdHc8rUucBhM3SCMxwibdEnWgTPjHAVF5ALA4ib3iantsefoVqfX5DC0A/132','oKdHQ5TEKNkhV50NUmoOn1k_Pm5I'),
(1623171761125330945,'用户_29152081','admin',NULL,'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','2025-05-08 12:08:00',0,'秦嘉乐',NULL,NULL,NULL,NULL,NULL),
(1633022578761752577,'皮皮林',NULL,'17674757651',NULL,'2023-03-07 16:31:37',1,'皮皮林',1615417393,'1615417393@qq.com',NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/VVgwHQBkDricnn75F1DVVr4uvNeFeLMUNdDZsuD2oJ64ZsELvckwEQAQibXEbujic5XDapNmjpRmCVgpWIA8PhlIQ/132','o1H9u5S48K-8GGZ83LJ08a9FTPEs'),
(1633022826821279746,'用户_a138b029','pipi',NULL,'96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e','2023-03-07 16:32:37',1,NULL,NULL,NULL,NULL,NULL,NULL),
(1898913720794574850,'小锋@java1234&amp;python222',NULL,NULL,NULL,'2025-03-10 09:48:06',1,NULL,NULL,NULL,NULL,'https://thirdwx.qlogo.cn/mmopen/vi_32/FRG2HL6Bmn1t3PkmCfTNgfgyYAkA3djxhbHtz00uvM0V42sb8qLtjXZGvXQghAavnvfzlgdpfL0m4gAkyhia69Q/132','oFjm453HoQFO30ss9OpxcYMdUKHM');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

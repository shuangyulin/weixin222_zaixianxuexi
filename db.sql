/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - zaixianxuexishandong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zaixianxuexishandong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zaixianxuexishandong`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'轮播图1','http://localhost:8080/zaixianxuexishandong/upload/config1.jpg'),(2,'轮播图2','http://localhost:8080/zaixianxuexishandong/upload/config2.jpg'),(3,'轮播图3','http://localhost:8080/zaixianxuexishandong/upload/config3.jpg');

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'kecheng_types','课程类型',1,'课程类型1',NULL,NULL,'2022-03-29 16:19:20'),(2,'kecheng_types','课程类型',2,'课程类型2',NULL,NULL,'2022-03-29 16:19:20'),(3,'kecheng_types','课程类型',3,'课程类型3',NULL,NULL,'2022-03-29 16:19:20'),(4,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2022-03-29 16:19:20'),(5,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2022-03-29 16:19:20'),(6,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2022-03-29 16:19:20'),(7,'sex_types','性别类型',1,'男',NULL,NULL,'2022-03-29 16:19:20'),(8,'sex_types','性别类型',2,'女',NULL,NULL,'2022-03-29 16:19:20'),(9,'forum_state_types','帖子状态',1,'发帖',NULL,NULL,'2022-03-29 16:19:20'),(10,'forum_state_types','帖子状态',2,'回帖',NULL,NULL,'2022-03-29 16:19:20');

/*Table structure for table `forum` */

DROP TABLE IF EXISTS `forum`;

CREATE TABLE `forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `forum_name` varchar(200) DEFAULT NULL COMMENT '帖子标题  Search111 ',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `users_id` int(11) DEFAULT NULL COMMENT '管理员',
  `forum_content` text COMMENT '发布内容',
  `super_ids` int(11) DEFAULT NULL COMMENT '父id',
  `forum_state_types` int(11) DEFAULT NULL COMMENT '帖子状态',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='论坛';

/*Data for the table `forum` */

insert  into `forum`(`id`,`forum_name`,`yonghu_id`,`users_id`,`forum_content`,`super_ids`,`forum_state_types`,`insert_time`,`update_time`,`create_time`) values (1,'帖子标题1',1,NULL,'发布内容1',NULL,1,'2022-03-29 16:19:51','2022-03-29 16:19:51','2022-03-29 16:19:51'),(2,'帖子标题2',1,NULL,'发布内容2',NULL,1,'2022-03-29 16:19:51','2022-03-29 16:19:51','2022-03-29 16:19:51'),(3,'帖子标题3',2,NULL,'发布内容3',NULL,1,'2022-03-29 16:19:51','2022-03-29 16:19:51','2022-03-29 16:19:51'),(4,'帖子标题4',1,NULL,'发布内容4',NULL,1,'2022-03-29 16:19:51','2022-03-29 16:19:51','2022-03-29 16:19:51'),(5,'帖子标题5',1,NULL,'发布内容5',NULL,1,'2022-03-29 16:19:51','2022-03-29 16:19:51','2022-03-29 16:19:51'),(6,NULL,NULL,1,'管理评论123',5,2,'2022-03-29 16:48:04',NULL,'2022-03-29 16:48:04'),(7,NULL,1,NULL,'用户评论123',5,2,'2022-03-29 17:05:17',NULL,'2022-03-29 17:05:17');

/*Table structure for table `kecheng` */

DROP TABLE IF EXISTS `kecheng`;

CREATE TABLE `kecheng` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kecheng_name` varchar(200) DEFAULT NULL COMMENT '课程名称 Search111',
  `kecheng_types` int(11) DEFAULT NULL COMMENT '课程类型 Search111',
  `kecheng_photo` varchar(200) DEFAULT NULL COMMENT '课程封面',
  `kecheng_video` varchar(200) DEFAULT NULL COMMENT '课程视频',
  `kecheng_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `kecheng_shichang` varchar(200) DEFAULT NULL COMMENT '课程时常',
  `kecheng_content` text COMMENT '课程详情',
  `kecheng_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='课程信息';

/*Data for the table `kecheng` */

insert  into `kecheng`(`id`,`kecheng_name`,`kecheng_types`,`kecheng_photo`,`kecheng_video`,`kecheng_new_money`,`kecheng_shichang`,`kecheng_content`,`kecheng_delete`,`create_time`) values (1,'课程名称1',1,'http://localhost:8080/zaixianxuexishandong/upload/kecheng1.jpg','http://localhost:8080/zaixianxuexishandong/upload/video.mp4','440.32','课程时常1','课程详情1',1,'2022-03-29 16:19:51'),(2,'课程名称2',3,'http://localhost:8080/zaixianxuexishandong/upload/kecheng2.jpg','http://localhost:8080/zaixianxuexishandong/upload/video.mp4','107.22','课程时常2','课程详情2',1,'2022-03-29 16:19:51'),(3,'课程名称3',3,'http://localhost:8080/zaixianxuexishandong/upload/kecheng3.jpg','http://localhost:8080/zaixianxuexishandong/upload/video.mp4','324.80','课程时常3','课程详情3',1,'2022-03-29 16:19:51'),(4,'课程名称4',1,'http://localhost:8080/zaixianxuexishandong/upload/kecheng4.jpg','http://localhost:8080/zaixianxuexishandong/upload/video.mp4','177.42','课程时常4','课程详情4',1,'2022-03-29 16:19:51'),(5,'课程名称5',3,'http://localhost:8080/zaixianxuexishandong/upload/kecheng5.jpg','http://localhost:8080/zaixianxuexishandong/upload/video.mp4','295.48','课程时常5','课程详情5',1,'2022-03-29 16:19:51');

/*Table structure for table `kecheng_order` */

DROP TABLE IF EXISTS `kecheng_order`;

CREATE TABLE `kecheng_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `kecheng_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号',
  `kecheng_id` int(11) DEFAULT NULL COMMENT '课程',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `kecheng_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程订单';

/*Data for the table `kecheng_order` */

insert  into `kecheng_order`(`id`,`kecheng_order_uuid_number`,`kecheng_id`,`yonghu_id`,`kecheng_order_true_price`,`insert_time`,`create_time`) values (1,'1648543414789',5,1,NULL,'2022-03-29 16:43:35','2022-03-29 16:43:35'),(2,'1648543478824',4,1,NULL,'2022-03-29 16:44:40','2022-03-29 16:44:40'),(3,'1648544682769',3,1,NULL,'2022-03-29 17:04:43','2022-03-29 17:04:43');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',2,'http://localhost:8080/zaixianxuexishandong/upload/news1.jpg','2022-03-29 16:19:51','公告详情1','2022-03-29 16:19:51'),(2,'公告标题2',2,'http://localhost:8080/zaixianxuexishandong/upload/news2.jpg','2022-03-29 16:19:51','公告详情2','2022-03-29 16:19:51'),(3,'公告标题3',1,'http://localhost:8080/zaixianxuexishandong/upload/news3.jpg','2022-03-29 16:19:51','公告详情3','2022-03-29 16:19:51'),(4,'公告标题4',3,'http://localhost:8080/zaixianxuexishandong/upload/news4.jpg','2022-03-29 16:19:51','公告详情4','2022-03-29 16:19:51'),(5,'公告标题5',2,'http://localhost:8080/zaixianxuexishandong/upload/news5.jpg','2022-03-29 16:19:51','公告详情5','2022-03-29 16:19:51');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','12kfzgvvli1jo02c6ciu3h8g5rtfyqe9','2022-03-29 16:29:28','2022-03-29 18:30:00'),(2,1,'a1','yonghu','用户','55943n8iukmqhmbso1rdyxqpewpa2zpu','2022-03-29 16:34:30','2022-03-29 18:18:26');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`yonghu_phone`,`yonghu_email`,`new_money`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/zaixianxuexishandong/upload/yonghu1.jpg',2,'17703786901','1@qq.com','50.00',1,'2022-03-29 16:19:51'),(2,'a2','123456','用户姓名2','http://localhost:8080/zaixianxuexishandong/upload/yonghu2.jpg',2,'17703786902','2@qq.com','123.00',1,'2022-03-29 16:19:51'),(3,'a3','123456','用户姓名3','http://localhost:8080/zaixianxuexishandong/upload/yonghu3.jpg',2,'17703786903','3@qq.com','32412.00',1,'2022-03-29 16:19:51');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-05-12 00:07:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ---------------------------------- 
-- user表 
-- ---------------------------------- 
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL unique AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(50) NOT NULL unique COMMENT '用户名',
  `email` varchar(64) DEFAULT NULL COMMENT 'email',
  `password` varchar(64) NOT NULL COMMENT 'password',
  `phoneNum` varchar(10) DEFAULT NULL COMMENT 'phoneNum',
  `status` int(1) DEFAULT 1 COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 
INSERT INTO `user` VALUES (NULL, 'leqiang', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang1', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang2', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang3', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang4', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang5', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang6', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang7', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang8', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang9', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang10', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang11', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang12', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang13', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang14', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang15', NULL, '000', null, 1); 
INSERT INTO `user` VALUES (NULL, 'leqiang16', NULL, '000', null, 1); 


-- ---------------------------------- 
-- role表 
-- ---------------------------------- 
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL unique AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(50) NOT NULL unique COMMENT 'role_name',
  `role_desc` varchar(255) DEFAULT NULL COMMENT 'role_desc', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `role` VALUES (NULL, '管理员', NULL); 
INSERT INTO `role` VALUES (NULL, '财务', NULL); 
INSERT INTO `role` VALUES (NULL, '运营', NULL); 
INSERT INTO `role` VALUES (NULL, '总裁办', NULL); 

 
-- ---------------------------------- 
-- users_role表 
-- ---------------------------------- 
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `id` int NOT NULL unique AUTO_INCREMENT COMMENT '用户角色-id',
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `users_role` VALUES (NULL, 1, 1); 
INSERT INTO `users_role` VALUES (NULL, 1, 4); 
INSERT INTO `users_role` VALUES (NULL, 2, 3); 
INSERT INTO `users_role` VALUES (NULL, 3, 3); 
INSERT INTO `users_role` VALUES (NULL, 4, 2);  



-- ---------------------------------- 
-- product表 
-- ---------------------------------- 
DROP TABLE IF EXISTS `product`;
CREATE TABLE product(
  id VARCHAR(32) NOT NULL UNIQUE,
  productNum VARCHAR(50) NOT NULL UNIQUE,
  productName VARCHAR(50),
  cityName VARCHAR(50),
  departuretime INTEGER,
  productPrice DOUBLE(10,2),
  productDesc VARCHAR(500),
  productStatus INTEGER,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('676C5BD1D35E429A8C2E114939C5685A', 'itcast-002', '北京三日游', '北京', 1610723775, 1200, '不错的旅行', 1);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'itcast-003', '上海五日游', '上海', 1610723775, 1800, '魔都我来了', 0);
insert into PRODUCT (id, productnum, productname, cityname, departuretime, productprice, productdesc, productstatus)
values ('9F71F01CB448476DAFB309AA6DF9497F', 'itcast-001', '北京三日游', '北京', 1610723775, 1200, '不错的旅行', 1);
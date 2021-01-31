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

-- ---------------------------------- 
-- orders表 
-- ---------------------------------- 
DROP TABLE IF EXISTS `orders`;
CREATE TABLE orders(
  id VARCHAR(32) NOT NULL UNIQUE,
  order_num VARCHAR(20) NOT NULL UNIQUE,
  order_time datetime,
  people_count INTEGER,
  order_desc VARCHAR(500),
  pay_type INTEGER,
  order_status INTEGER,
  product_id varchar(32),
  user_id INTEGER,
  FOREIGN KEY (product_id) REFERENCES product(id),
  FOREIGN KEY (user_id) REFERENCES user(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into orders (id, order_num, order_time, people_count, order_desc, pay_type, order_status, product_id, user_id)
values ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2021-01-19 13:50:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', '1');
insert into ORDERS (id, order_num, order_time, people_count, order_desc, pay_type, order_status, product_id, user_id)
values ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2021-01-19 13:50:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', '1');
insert into ORDERS (id, order_num, order_time, people_count, order_desc, pay_type, order_status, product_id, user_id)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2021-01-19 13:50:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', '2');
insert into ORDERS (id, order_num, order_time, people_count, order_desc, pay_type, order_status, product_id, user_id)
values ('E4DD4C45EED84870ABA83574A801083E', '11111', '2021-01-19 13:50:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', '2');
insert into ORDERS (id, order_num, order_time, people_count, order_desc, pay_type, order_status, product_id, user_id)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2021-01-19 13:50:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', '3');
insert into ORDERS (id, order_num, order_time, people_count, order_desc, pay_type, order_status, product_id, user_id)
values ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2021-01-19 13:50:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', '4');
insert into ORDERS (id, order_num, order_time, people_count, order_desc, pay_type, order_status, product_id, user_id)
values ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2021-01-19 13:50:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', '5');
insert into ORDERS (id, order_num, order_time, people_count, order_desc, pay_type, order_status, product_id, user_id)
values ('3081770BC3984EF092D9E99760FDABDE', '55555', '2021-01-19 13:50:00', 2, '没什么', 0, 1, '12B7ABF2A4C544568B0A7C69F36BF8B7', '6');


DROP TABLE IF EXISTS `member`;
CREATE TABLE member(
  id VARCHAR(32) NOT NULL UNIQUE, 
  name VARCHAR(50) NOT NULL,
  nickname VARCHAR(50),
  phoneNum VARCHAR(50),
  email VARCHAR(50),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into member (id, name, nickname, phoneNum, email)
values ('MM676C5BD1D35E429A8C2E114939C568', '张三01', '哈哈哈01', '1610723775', 'leqiang222@1221.com');
insert into member (id, name, nickname, phoneNum, email)
values ('MM776C5BD1D35E429A8C2E114939C568', '张三02', '哈哈哈02', '1610723776', 'leqiang222@1222.com');
insert into member (id, name, nickname, phoneNum, email)
values ('MM876C5BD1D35E429A8C2E114939C568', '张三03', '哈哈哈03', '1610723777', 'leqiang222@1223.com');
insert into member (id, name, nickname, phoneNum, email)
values ('MM976C5BD1D35E429A8C2E114939C568', '张三04', '哈哈哈04', '1610723778', 'leqiang222@1224.com');
insert into member (id, name, nickname, phoneNum, email)
values ('MM706C5BD1D35E429A8C2E114939C568', '张三05', '哈哈哈05', '1610723779', 'leqiang222@1225.com');


-- 旅客 
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE traveller(
  id VARCHAR(32) NOT NULL UNIQUE, 
  name varchar(20),
  sex varchar(20),
  phone_num varchar(20),
  credentials_type INTEGER,
  credentials_num varchar(50),
  traveller_type INTEGER
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
insert into traveller (id, name, sex, phone_num, credentials_type, credentials_num, traveller_type)
values ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', 0, '123456789009876543', 0);
insert into traveller (id, name, sex, phone_num, credentials_type, credentials_num, traveller_type)
values ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', 0, '987654321123456789', 1);


-- 订单与旅客中间表 
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE order_traveller(
  order_id varchar(32) NOT NULL,
  traveller_id varchar(32) NOT NULL,
  PRIMARY KEY (order_id, traveller_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (traveller_id) REFERENCES traveller(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into order_traveller (order_id, traveller_id)
values ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (order_id, traveller_id)
values ('5DC6A48DD4E94592AE904930EA866AFA', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (order_id, traveller_id)
values ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (order_id, traveller_id)
values ('2FF351C4AC744E2092DCF08CFD314420', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (order_id, traveller_id)
values ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (order_id, traveller_id)
values ('A0657832D93E4B10AE88A2D4B70B1A28', 'EE7A71FB6945483FBF91543DBE851960');
insert into ORDER_TRAVELLER (order_id, traveller_id)
values ('E4DD4C45EED84870ABA83574A801083E', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
insert into ORDER_TRAVELLER (order_id, traveller_id)
values ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960'); 





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
-- 资源权限表
-- ---------------------------------- 
DROP TABLE IF EXISTS `permission`;
CREATE TABLE permission (
  id VARCHAR(32) NOT NULL UNIQUE, 
  permission_name VARCHAR(50),
  url VARCHAR(150),
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ---------------------------------- 
-- 角色权限关联表
-- ----------------------------------  
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE role_permission(
permission_id varchar(32),
role_id int,
PRIMARY KEY(permission_id,role_id),
FOREIGN KEY (permission_id) REFERENCES permission(id),
FOREIGN KEY (role_id) REFERENCES role(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


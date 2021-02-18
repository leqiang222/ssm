/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 18/02/2021 11:09:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `phone_num` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
BEGIN;
INSERT INTO `member` VALUES (1, '张三01', '哈哈哈01', '1610723775', 'leqiang222@1221.com');
INSERT INTO `member` VALUES (2, '张三05', '哈哈哈05', '1610723779', 'leqiang222@1225.com');
INSERT INTO `member` VALUES (3, '张三02', '哈哈哈02', '1610723776', 'leqiang222@1222.com');
INSERT INTO `member` VALUES (4, '张三03', '哈哈哈03', '1610723777', 'leqiang222@1223.com');
INSERT INTO `member` VALUES (5, '张三04', '哈哈哈04', 'integer1610723778', 'leqiang222@1224.com');
INSERT INTO `member` VALUES (6, '5张三04', '哈哈哈05', 'integer1610723778', 'leqiang222@1224.com');
COMMIT;

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `order_id` int(32) NOT NULL,
  `traveller_id` int(32) NOT NULL,
  `id` int(32) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `traveller_id` (`traveller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
BEGIN;
INSERT INTO `order_traveller` VALUES (1, 1, 1);
INSERT INTO `order_traveller` VALUES (1, 2, 2);
INSERT INTO `order_traveller` VALUES (2, 1, 3);
INSERT INTO `order_traveller` VALUES (2, 2, 4);
INSERT INTO `order_traveller` VALUES (3, 1, 5);
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(20) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `people_count` int(11) DEFAULT NULL,
  `order_desc` varchar(500) DEFAULT NULL,
  `pay_type` int(11) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `product_id` int(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `member_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `order_num` (`order_num`),
  KEY `product_id` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (1, '67890', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 1, 1, 1);
INSERT INTO `orders` VALUES (2, '55555', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 2, 6, 2);
INSERT INTO `orders` VALUES (3, '555553', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 1, 6, 3);
INSERT INTO `orders` VALUES (4, '5555512', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 2, 6, 4);
INSERT INTO `orders` VALUES (5, '55556', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 3, 6, 5);
INSERT INTO `orders` VALUES (6, '555551', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 2, 6, 6);
INSERT INTO `orders` VALUES (7, '33333', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 3, 4, 1);
INSERT INTO `orders` VALUES (8, '54321', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 4, 1, 2);
INSERT INTO `orders` VALUES (9, '555552', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 5, 6, 3);
INSERT INTO `orders` VALUES (10, '22222', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 1, 3, 4);
INSERT INTO `orders` VALUES (11, '98765', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 2, 2, 5);
INSERT INTO `orders` VALUES (12, '44444', '2021-01-19 13:50:00', 2, '安德拉德加拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖安德拉德加拉三等奖拉三等奖拉三等奖', 0, 1, 3, 5, 6);
COMMIT;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
BEGIN;
INSERT INTO `permission` VALUES (1, '产品product权限', '/product/findAll.do');
INSERT INTO `permission` VALUES (2, '订单order权限', '/order/findAll.do');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_num` varchar(50) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `departure_time` datetime(6) DEFAULT NULL,
  `product_price` double(10,2) DEFAULT NULL,
  `product_desc` varchar(500) DEFAULT NULL,
  `product_status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `productNum` (`product_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, 'itcast-003', '上海五日游', '上海', '2020-12-31 23:59:59.000000', 1800.00, '魔都我来了', 0);
INSERT INTO `product` VALUES (2, 'itcast-002', '北京三日游', '北京', '2020-12-31 00:00:00.000000', 1200.00, '不错的旅行', 1);
INSERT INTO `product` VALUES (3, '22222', '333', '333', '2021-01-19 13:50:00.000000', 3333.00, 'reerew', 0);
INSERT INTO `product` VALUES (4, 'qweqweqwe', '安定区二群翁', '阿达', '2021-01-13 09:45:00.000000', 12222.00, '阿达阿达阿达阿达阿达阿达', 0);
INSERT INTO `product` VALUES (5, 'itcast-001', '北京三日游', '北京', '2020-12-30 00:00:00.000000', 1200.00, '不错的旅行', 1);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(50) NOT NULL COMMENT 'role_name',
  `role_desc` varchar(255) DEFAULT NULL COMMENT 'role_desc',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'ROLE_ADMIN', '管理员');
INSERT INTO `role` VALUES (2, 'ROLE_MONEY', '财务财务财务财务财务财务');
INSERT INTO `role` VALUES (3, 'ROLE_MARKET', '市场市场市场市场');
INSERT INTO `role` VALUES (4, 'ROLE_BOSS_HELP', '总裁办总裁办总裁办总裁办总裁办总');
INSERT INTO `role` VALUES (100, 'ROLE_SUPER_ADMIN', '超级管理员');
COMMIT;

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permission_id` int(32) NOT NULL,
  `role_id` int(11) NOT NULL,
  `id` int(32) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
BEGIN;
INSERT INTO `role_permission` VALUES (1, 3, 1);
INSERT INTO `role_permission` VALUES (1, 100, 2);
INSERT INTO `role_permission` VALUES (2, 100, 3);
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `visit_time` datetime(6) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `execution_time` double(10,2) DEFAULT NULL,
  `method` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (2, '2021-02-17 17:08:44.000000', 'leqiang', '0:0:0:0:0:0:0:1', 'user/findAll.do', 242.00, 'com.leqiang222.ssm.controller.UserController.findAll');
INSERT INTO `sys_log` VALUES (3, '2021-02-17 17:09:34.000000', 'leqiang', '0:0:0:0:0:0:0:1', 'user/findUserByIdAndAllRole.do', 17.00, 'com.leqiang222.ssm.controller.UserController.findUserByIdAndAllRole');
INSERT INTO `sys_log` VALUES (4, '2021-02-17 17:09:36.000000', 'leqiang', '0:0:0:0:0:0:0:1', 'user/findAll.do', 10.00, 'com.leqiang222.ssm.controller.UserController.findAll');
INSERT INTO `sys_log` VALUES (5, '2021-02-17 17:09:37.000000', 'leqiang', '0:0:0:0:0:0:0:1', 'user/findById.do', 13.00, 'com.leqiang222.ssm.controller.UserController.findById');
INSERT INTO `sys_log` VALUES (6, '2021-02-17 17:09:41.000000', 'leqiang', '0:0:0:0:0:0:0:1', 'user/findAll.do', 17.00, 'com.leqiang222.ssm.controller.UserController.findAll');
INSERT INTO `sys_log` VALUES (7, '2021-02-17 17:09:45.000000', 'leqiang', '0:0:0:0:0:0:0:1', 'role/findAll.do', 24.00, 'com.leqiang222.ssm.controller.RoleController.findAll');
INSERT INTO `sys_log` VALUES (8, '2021-02-17 17:09:54.000000', 'leqiang', '0:0:0:0:0:0:0:1', 'role/findAll.do', 4.00, 'com.leqiang222.ssm.controller.RoleController.findAll');
INSERT INTO `sys_log` VALUES (9, '2021-02-17 17:09:57.000000', 'leqiang', '0:0:0:0:0:0:0:1', '/sysLog/findAll.do', 26.00, 'com.leqiang222.ssm.controller.SysLogController.findAll');
INSERT INTO `sys_log` VALUES (10, '2021-02-17 17:10:03.000000', 'leqiang', '0:0:0:0:0:0:0:1', 'orders/findAll.do', 71.00, 'com.leqiang222.ssm.controller.OrdersController.findAll');
COMMIT;

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `phone_num` varchar(20) DEFAULT NULL,
  `credentials_type` int(11) DEFAULT NULL,
  `credentials_num` varchar(50) DEFAULT NULL,
  `traveller_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of traveller
-- ----------------------------
BEGIN;
INSERT INTO `traveller` VALUES (1, '张龙-游客', '男', '13333333333', 0, '123456789009876543', 0);
INSERT INTO `traveller` VALUES (2, '张小龙-游客', '男', '15555555555', 0, '987654321123456789', 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `email` varchar(64) DEFAULT NULL COMMENT 'email',
  `password` varchar(64) NOT NULL COMMENT 'password',
  `phone_num` varchar(50) DEFAULT NULL COMMENT 'phoneNum',
  `status` int(1) DEFAULT '1' COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'leqiang', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (2, 'leqiang1', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (3, 'leqiang2', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (4, 'leqiang3', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (5, 'leqiang4', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (6, 'leqiang5', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (7, 'leqiang6', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (8, 'leqiang7', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (9, 'leqiang8', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (10, 'leqiang9', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (11, 'leqiang10', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (12, 'leqiang11', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (13, 'leqiang12', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (14, 'leqiang13', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (15, 'leqiang14', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (16, 'leqiang15', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (17, 'leqiang16', 'leqiang222@qq.com', '$2a$10$G.bxwINDaDUTEobqdd9cHu3fngruRFQrZuXhuinOEW0Tnt5f3aFUW', '18565408337', 1);
INSERT INTO `user` VALUES (18, 'aaa', 'leqiang222@163.com', '000', '1343333', 1);
COMMIT;

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色-id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_role
-- ----------------------------
BEGIN;
INSERT INTO `users_role` VALUES (2, 1, 100);
INSERT INTO `users_role` VALUES (3, 2, 3);
INSERT INTO `users_role` VALUES (4, 3, 3);
INSERT INTO `users_role` VALUES (5, 4, 2);
INSERT INTO `users_role` VALUES (8, 1, 1);
INSERT INTO `users_role` VALUES (9, 1, 2);
INSERT INTO `users_role` VALUES (10, 1, 3);
INSERT INTO `users_role` VALUES (11, 1, 4);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

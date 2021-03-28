/*
 Navicat Premium Data Transfer

 Source Server         : local-mysql
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : CSUMall

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 17/06/2020 16:22:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for csumall_cart
-- ----------------------------
DROP TABLE IF EXISTS `csumall_cart`;
CREATE TABLE `csumall_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID，用户表主键',
  `product_id` int(11) NOT NULL COMMENT '商品ID，商品表主键',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `checked` tinyint(1) NOT NULL COMMENT '是否选择：1-选中，2-未选中',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`),
  KEY `user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of csumall_cart
-- ----------------------------
BEGIN;
INSERT INTO `csumall_cart` VALUES (126, 21, 26, 1, 1, '2020-04-13 21:27:06', '2020-04-13 21:27:06');
COMMIT;

-- ----------------------------
-- Table structure for csumall_category
-- ----------------------------
DROP TABLE IF EXISTS `csumall_category`;
CREATE TABLE `csumall_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` int(11) NOT NULL COMMENT '递归设计，父类别ID，id=0表示根节点',
  `name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类状态：1-使用，2-废弃',
  `sort_order` int(3) DEFAULT NULL COMMENT '排序编号：同级别分类展示时的顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100031 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of csumall_category
-- ----------------------------
BEGIN;
INSERT INTO `csumall_category` VALUES (100001, 0, '家用电器', 1, NULL, '2020-03-25 16:46:00', '2020-03-25 16:46:00');
INSERT INTO `csumall_category` VALUES (100002, 0, '数码3C', 1, NULL, '2020-03-25 16:46:21', '2020-03-25 16:46:21');
INSERT INTO `csumall_category` VALUES (100003, 0, '服装箱包', 1, NULL, '2020-03-25 16:49:53', '2020-03-25 16:49:53');
INSERT INTO `csumall_category` VALUES (100004, 0, '食品生鲜', 1, NULL, '2020-03-25 16:50:19', '2020-03-25 16:50:19');
INSERT INTO `csumall_category` VALUES (100005, 0, '酒水饮料', 1, NULL, '2020-03-25 16:50:29', '2020-03-25 16:50:29');
INSERT INTO `csumall_category` VALUES (100006, 100001, '冰箱', 1, NULL, '2020-03-25 16:52:15', '2020-03-25 16:52:15');
INSERT INTO `csumall_category` VALUES (100007, 100001, '电视', 1, NULL, '2020-03-25 16:52:26', '2020-03-25 16:52:26');
INSERT INTO `csumall_category` VALUES (100008, 100001, '洗衣机', 1, NULL, '2020-03-25 16:52:39', '2020-03-25 16:52:39');
INSERT INTO `csumall_category` VALUES (100009, 100001, '空调', 1, NULL, '2020-03-25 16:52:45', '2020-03-25 16:52:45');
INSERT INTO `csumall_category` VALUES (100010, 100001, '电热水器', 1, NULL, '2020-03-25 16:52:54', '2020-03-25 16:52:54');
INSERT INTO `csumall_category` VALUES (100011, 100002, '电脑', 1, NULL, '2020-03-25 16:53:18', '2020-03-25 16:53:18');
INSERT INTO `csumall_category` VALUES (100012, 100002, '手机', 1, NULL, '2020-03-25 16:53:27', '2020-03-25 16:53:27');
INSERT INTO `csumall_category` VALUES (100013, 100002, '平板电脑', 1, NULL, '2020-03-25 16:53:35', '2020-03-25 16:53:35');
INSERT INTO `csumall_category` VALUES (100014, 100002, '数码相机', 1, NULL, '2020-03-25 16:53:56', '2020-03-25 16:53:56');
INSERT INTO `csumall_category` VALUES (100015, 100002, '3C配件', 1, NULL, '2020-03-25 16:54:07', '2020-03-25 16:54:07');
INSERT INTO `csumall_category` VALUES (100016, 100003, '女装', 1, NULL, '2020-03-25 16:54:44', '2020-03-25 16:54:44');
INSERT INTO `csumall_category` VALUES (100017, 100003, '帽子', 1, NULL, '2020-03-25 16:54:51', '2020-03-25 16:54:51');
INSERT INTO `csumall_category` VALUES (100018, 100003, '旅行箱', 1, NULL, '2020-03-25 16:55:02', '2020-03-25 16:55:02');
INSERT INTO `csumall_category` VALUES (100019, 100003, '手提包', 1, NULL, '2020-03-25 16:55:09', '2020-03-25 16:55:09');
INSERT INTO `csumall_category` VALUES (100020, 100003, '保暖内衣', 1, NULL, '2020-03-25 16:55:18', '2020-03-25 16:55:18');
INSERT INTO `csumall_category` VALUES (100021, 100004, '零食', 1, NULL, '2020-03-25 16:55:30', '2020-03-25 16:55:30');
INSERT INTO `csumall_category` VALUES (100022, 100004, '生鲜', 1, NULL, '2020-03-25 16:55:37', '2020-03-25 16:55:37');
INSERT INTO `csumall_category` VALUES (100023, 100004, '半成品菜', 1, NULL, '2020-03-25 16:55:47', '2020-03-25 16:55:47');
INSERT INTO `csumall_category` VALUES (100024, 100004, '速冻食品', 1, NULL, '2020-03-25 16:55:56', '2020-03-25 16:55:56');
INSERT INTO `csumall_category` VALUES (100025, 100004, '进口食品', 1, NULL, '2020-03-25 16:56:06', '2020-03-25 16:56:06');
INSERT INTO `csumall_category` VALUES (100026, 100005, '白酒', 1, NULL, '2020-03-25 16:56:22', '2020-03-25 16:56:22');
INSERT INTO `csumall_category` VALUES (100027, 100005, '红酒', 1, NULL, '2020-03-25 16:56:30', '2020-03-25 16:56:30');
INSERT INTO `csumall_category` VALUES (100028, 100005, '饮料', 1, NULL, '2020-03-25 16:56:37', '2020-03-25 16:56:37');
INSERT INTO `csumall_category` VALUES (100029, 100005, '调制鸡尾酒', 1, NULL, '2020-03-25 16:56:45', '2020-03-25 16:56:45');
INSERT INTO `csumall_category` VALUES (100030, 100005, '进口洋酒', 1, NULL, '2020-03-25 16:57:05', '2020-03-25 16:57:05');
COMMIT;

-- ----------------------------
-- Table structure for csumall_order
-- ----------------------------
DROP TABLE IF EXISTS `csumall_order`;
CREATE TABLE `csumall_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` bigint(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `shipping_id` int(11) DEFAULT NULL COMMENT '订单地址ID',
  `payment_price` decimal(20,2) DEFAULT NULL COMMENT '实际支付价格',
  `payment_type` int(2) DEFAULT NULL COMMENT '支付类型：1-线上支付，其他扩展',
  `postage` int(10) DEFAULT NULL COMMENT '运费',
  `status` int(10) DEFAULT NULL COMMENT '订单状态：0-已取消，10-未付款，20-已付款，30-已发货，40-交易成功，50-交易关闭',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no_index` (`order_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of csumall_order
-- ----------------------------
BEGIN;
INSERT INTO `csumall_order` VALUES (103, 1491753014256, 1, 25, 13998.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-09 23:50:14', '2020-04-09 23:50:14');
INSERT INTO `csumall_order` VALUES (104, 1491830695216, 1, 26, 13998.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-10 21:24:55', '2020-04-10 21:24:55');
INSERT INTO `csumall_order` VALUES (105, 1492089528889, 1, 29, 3299.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:18:48', '2020-04-13 21:18:48');
INSERT INTO `csumall_order` VALUES (106, 1492090946105, 1, 29, 27894.00, 1, 0, 20, '2020-04-13 21:42:40', NULL, NULL, NULL, '2020-04-13 21:42:26', '2020-04-13 21:42:41');
INSERT INTO `csumall_order` VALUES (107, 1492091003128, 1, 29, 8597.00, 1, 0, 20, '2020-04-13 21:43:38', NULL, NULL, NULL, '2020-04-13 21:43:23', '2020-04-13 21:43:38');
INSERT INTO `csumall_order` VALUES (108, 1492091051313, 1, 29, 1999.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:44:11', '2020-04-13 21:44:11');
INSERT INTO `csumall_order` VALUES (109, 1492091061513, 1, 29, 6598.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:44:21', '2020-04-13 21:44:21');
INSERT INTO `csumall_order` VALUES (110, 1492091069563, 1, 29, 3299.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:44:29', '2020-04-13 21:44:29');
INSERT INTO `csumall_order` VALUES (111, 1492091076073, 1, 29, 4299.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:44:36', '2020-04-13 21:44:36');
INSERT INTO `csumall_order` VALUES (112, 1492091083720, 1, 29, 3299.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:44:43', '2020-04-13 21:44:43');
INSERT INTO `csumall_order` VALUES (113, 1492091089794, 1, 29, 6999.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:44:49', '2020-04-13 21:44:49');
INSERT INTO `csumall_order` VALUES (114, 1492091096400, 1, 29, 6598.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:44:56', '2020-04-13 21:44:56');
INSERT INTO `csumall_order` VALUES (115, 1492091102371, 1, 29, 3299.00, 1, 0, 10, NULL, NULL, NULL, NULL, '2020-04-13 21:45:02', '2020-04-13 21:45:02');
INSERT INTO `csumall_order` VALUES (116, 1492091110004, 1, 29, 8598.00, 1, 0, 40, '2020-04-13 21:55:16', '2020-04-13 21:55:31', NULL, NULL, '2020-04-13 21:45:09', '2020-04-13 21:55:31');
INSERT INTO `csumall_order` VALUES (117, 1492091141269, 1, 29, 22894.00, 1, 0, 20, '2020-04-13 21:46:06', NULL, NULL, NULL, '2020-04-13 21:45:41', '2020-04-13 21:46:07');
COMMIT;

-- ----------------------------
-- Table structure for csumall_order_item
-- ----------------------------
DROP TABLE IF EXISTS `csumall_order_item`;
CREATE TABLE `csumall_order_item` (
  `id` int(11) NOT NULL COMMENT '订单商品表ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `product_id` int(11) DEFAULT NULL COMMENT '商品ID',
  `product_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片URL',
  `current_price` decimal(20,2) DEFAULT NULL COMMENT '订单中的商品单价',
  `quantity` int(10) DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '订单商品总价',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`),
  KEY `order_no_index` (`order_no`) USING BTREE,
  KEY `order_no_user_id_index` (`user_id`,`order_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of csumall_order_item
-- ----------------------------
BEGIN;
INSERT INTO `csumall_order_item` VALUES (113, 1, 1491753014256, 26, 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', 6999.00, 2, 13998.00, '2020-04-09 23:50:14', '2020-04-09 23:50:14');
INSERT INTO `csumall_order_item` VALUES (114, 1, 1491830695216, 26, 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', 6999.00, 2, 13998.00, '2020-04-10 21:24:55', '2020-04-10 21:24:55');
INSERT INTO `csumall_order_item` VALUES (115, 1, 1492089528889, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 1, 3299.00, '2020-04-13 21:18:48', '2020-04-13 21:18:48');
INSERT INTO `csumall_order_item` VALUES (116, 1, 1492090946105, 29, 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', 4299.00, 2, 8598.00, '2020-04-13 21:42:26', '2020-04-13 21:42:26');
INSERT INTO `csumall_order_item` VALUES (117, 1, 1492090946105, 28, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', 1999.00, 1, 1999.00, '2020-04-13 21:42:26', '2020-04-13 21:42:26');
INSERT INTO `csumall_order_item` VALUES (118, 1, 1492090946105, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 1, 3299.00, '2020-04-13 21:42:26', '2020-04-13 21:42:26');
INSERT INTO `csumall_order_item` VALUES (119, 1, 1492090946105, 26, 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', 6999.00, 2, 13998.00, '2020-04-13 21:42:26', '2020-04-13 21:42:26');
INSERT INTO `csumall_order_item` VALUES (120, 1, 1492091003128, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 2, 6598.00, '2020-04-13 21:43:23', '2020-04-13 21:43:23');
INSERT INTO `csumall_order_item` VALUES (121, 1, 1492091003128, 28, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', 1999.00, 1, 1999.00, '2020-04-13 21:43:23', '2020-04-13 21:43:23');
INSERT INTO `csumall_order_item` VALUES (122, 1, 1492091051313, 28, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', 1999.00, 1, 1999.00, '2020-04-13 21:44:11', '2020-04-13 21:44:11');
INSERT INTO `csumall_order_item` VALUES (123, 1, 1492091061513, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 2, 6598.00, '2020-04-13 21:44:21', '2020-04-13 21:44:21');
INSERT INTO `csumall_order_item` VALUES (124, 1, 1492091069563, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 1, 3299.00, '2020-04-13 21:44:29', '2020-04-13 21:44:29');
INSERT INTO `csumall_order_item` VALUES (125, 1, 1492091076073, 29, 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', 4299.00, 1, 4299.00, '2020-04-13 21:44:36', '2020-04-13 21:44:36');
INSERT INTO `csumall_order_item` VALUES (126, 1, 1492091083720, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 1, 3299.00, '2020-04-13 21:44:43', '2020-04-13 21:44:43');
INSERT INTO `csumall_order_item` VALUES (127, 1, 1492091089794, 26, 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', 6999.00, 1, 6999.00, '2020-04-13 21:44:49', '2020-04-13 21:44:49');
INSERT INTO `csumall_order_item` VALUES (128, 1, 1492091096400, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 2, 6598.00, '2020-04-13 21:44:56', '2020-04-13 21:44:56');
INSERT INTO `csumall_order_item` VALUES (129, 1, 1492091102371, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 1, 3299.00, '2020-04-13 21:45:02', '2020-04-13 21:45:02');
INSERT INTO `csumall_order_item` VALUES (130, 1, 1492091110004, 29, 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', 4299.00, 2, 8598.00, '2020-04-13 21:45:09', '2020-04-13 21:45:09');
INSERT INTO `csumall_order_item` VALUES (131, 1, 1492091141269, 26, 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', 6999.00, 1, 6999.00, '2020-04-13 21:45:41', '2020-04-13 21:45:41');
INSERT INTO `csumall_order_item` VALUES (132, 1, 1492091141269, 27, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 3299.00, 1, 3299.00, '2020-04-13 21:45:41', '2020-04-13 21:45:41');
INSERT INTO `csumall_order_item` VALUES (133, 1, 1492091141269, 29, 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', 4299.00, 2, 8598.00, '2020-04-13 21:45:41', '2020-04-13 21:45:41');
INSERT INTO `csumall_order_item` VALUES (134, 1, 1492091141269, 28, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', 1999.00, 2, 3998.00, '2020-04-13 21:45:41', '2020-04-13 21:45:41');
COMMIT;

-- ----------------------------
-- Table structure for csumall_pay_info
-- ----------------------------
DROP TABLE IF EXISTS `csumall_pay_info`;
CREATE TABLE `csumall_pay_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付表ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `pay_platform` int(2) DEFAULT NULL COMMENT '线上支付平台：1-支付宝，2-微信支付',
  `platform_number` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '线上平台返回支付流水号',
  `platform_status` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '线上平台返回支付状态或信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of csumall_pay_info
-- ----------------------------
BEGIN;
INSERT INTO `csumall_pay_info` VALUES (53, 1, 1492090946105, 1, '2020041321001004300200116250', 'WAIT_BUYER_PAY', '2020-04-13 21:42:33', '2020-04-13 21:42:33');
INSERT INTO `csumall_pay_info` VALUES (54, 1, 1492090946105, 1, '2020041321001004300200116250', 'TRADE_SUCCESS', '2020-04-13 21:42:41', '2020-04-13 21:42:41');
INSERT INTO `csumall_pay_info` VALUES (55, 1, 1492091003128, 1, '2020041321001004300200116251', 'WAIT_BUYER_PAY', '2020-04-13 21:43:31', '2020-04-13 21:43:31');
INSERT INTO `csumall_pay_info` VALUES (56, 1, 1492091003128, 1, '2020041321001004300200116251', 'TRADE_SUCCESS', '2020-04-13 21:43:38', '2020-04-13 21:43:38');
INSERT INTO `csumall_pay_info` VALUES (57, 1, 1492091141269, 1, '2020041321001004300200116252', 'WAIT_BUYER_PAY', '2020-04-13 21:45:59', '2020-04-13 21:45:59');
INSERT INTO `csumall_pay_info` VALUES (58, 1, 1492091141269, 1, '2020041321001004300200116252', 'TRADE_SUCCESS', '2020-04-13 21:46:07', '2020-04-13 21:46:07');
INSERT INTO `csumall_pay_info` VALUES (59, 1, 1492091110004, 1, '2020041321001004300200116396', 'WAIT_BUYER_PAY', '2020-04-13 21:55:08', '2020-04-13 21:55:08');
INSERT INTO `csumall_pay_info` VALUES (60, 1, 1492091110004, 1, '2020041321001004300200116396', 'TRADE_SUCCESS', '2020-04-13 21:55:17', '2020-04-13 21:55:17');
COMMIT;

-- ----------------------------
-- Table structure for csumall_product
-- ----------------------------
DROP TABLE IF EXISTS `csumall_product`;
CREATE TABLE `csumall_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `category_id` int(11) NOT NULL COMMENT '分类ID，category表主键',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `subtitle` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品副标题',
  `main_image` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '商品描述主图，url相对地址',
  `sub_images` text COLLATE utf8_bin COMMENT '商品描述图片，json字符串',
  `detail` text COLLATE utf8_bin COMMENT '商品详情',
  `price` decimal(20,2) NOT NULL COMMENT '商品价格，2位小数',
  `stock` int(11) NOT NULL COMMENT '库存数量',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '商品状态：1-在售，2-下架，3-删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of csumall_product
-- ----------------------------
BEGIN;
INSERT INTO `csumall_product` VALUES (26, 100002, 'Apple iPhone 7 Plus (A1661) 128G 玫瑰金色 移动联通电信4G手机', 'iPhone 7，现更以红色呈现。', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg', '241997c4-9e62-4824-b7f0-7425c3c28917.jpeg,b6c56eb0-1748-49a9-98dc-bcc4b9788a54.jpeg,92f17532-1527-4563-aa1d-ed01baa0f7b2.jpeg,3adbe4f7-e374-4533-aa79-cc4a98c529bf.jpeg', '<p>产品描述</p>', 6999.00, 9991, 1, '2020-04-13 21:45:41', '2020-04-13 21:45:41');
INSERT INTO `csumall_product` VALUES (27, 100006, 'Midea/美的 BCD-535WKZM(E)冰箱双开门对开门风冷无霜智能电家用', '送品牌烤箱，五一大促', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg', 'ac3e571d-13ce-4fad-89e8-c92c2eccf536.jpeg,4bb02f1c-62d5-48cc-b358-97b05af5740d.jpeg,36bdb49c-72ae-4185-9297-78829b54b566.jpeg', '<p>产品描述</p>', 3299.00, 8876, 1, '2020-04-13 18:51:54', '2020-04-13 21:45:41');
INSERT INTO `csumall_product` VALUES (28, 100012, '4+64G送手环/Huawei/华为 nova 手机P9/P10plus青春', 'NOVA青春版1999元', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg', '0093f5d3-bdb4-4fb0-bec5-5465dfd26363.jpeg,13da2172-4445-4eb5-a13f-c5d4ede8458c.jpeg,58d5d4b7-58d4-4948-81b6-2bae4f79bf02.jpeg', '<p>产品描述</p>', 1999.00, 9994, 1, '2020-04-13 18:57:18', '2020-04-13 21:45:41');
INSERT INTO `csumall_product` VALUES (29, 100008, 'Haier/海尔HJ100-1HU1 10公斤滚筒洗衣机全自动带烘干家用大容量 洗烘一体', '门店机型 德邦送货', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg', '173335a4-5dce-4afd-9f18-a10623724c4e.jpeg,42b1b8bc-27c7-4ee1-80ab-753d216a1d49.jpeg,2f1b3de1-1eb1-4c18-8ca2-518934931bec.jpeg', '<p>产品描述</p>', 4299.00, 9993, 1, '2020-04-13 19:07:47', '2020-04-13 21:45:41');
COMMIT;

-- ----------------------------
-- Table structure for csumall_shipping
-- ----------------------------
DROP TABLE IF EXISTS `csumall_shipping`;
CREATE TABLE `csumall_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `address_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人姓名',
  `address_phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '固定电话',
  `address_mobile` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '手机号码',
  `address_province` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '省份',
  `address_city` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '城市',
  `address_district` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '区县',
  `address_detail` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '详细地址',
  `address_zip` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '邮编',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of csumall_shipping
-- ----------------------------
BEGIN;
INSERT INTO `csumall_shipping` VALUES (4, 13, 'test1', '010', '18688888888', '北京', '北京市', '海淀区', '中关村', '100000', '2017-01-22 14:26:25', '2017-01-22 14:26:25');
INSERT INTO `csumall_shipping` VALUES (7, 17, 'test2', '13800138000', '13800138000', '北京', '北京', NULL, '中关村', '100000', '2017-03-29 12:11:01', '2017-03-29 12:11:01');
INSERT INTO `csumall_shipping` VALUES (29, 1, 'test3', '13800138000', '13800138000', '北京', '北京', '海淀区', '海淀区中关村', '100000', '2017-04-09 18:33:32', '2017-04-09 18:33:32');
COMMIT;

-- ----------------------------
-- Table structure for csumall_user
-- ----------------------------
DROP TABLE IF EXISTS `csumall_user`;
CREATE TABLE `csumall_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户信息表ID',
  `username` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '加密密码(MD5)',
  `email` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '用户Email，允许空',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户电话，允许空',
  `question` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '找回密码答案',
  `role` int(2) NOT NULL COMMENT '用户角色0-管理员，1-普通用户',
  `create_time` datetime NOT NULL COMMENT '用户注册时间',
  `update_time` datetime NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE COMMENT '用户名唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of csumall_user
-- ----------------------------
BEGIN;
INSERT INTO `csumall_user` VALUES (1, 'admin', '427338237BD929443EC5D48E24FD2B1A', 'admin@csu.edu.cn', '13800138000', '问题', '答案', 1, '2020-11-06 16:56:45', '2020-04-04 19:27:36');
INSERT INTO `csumall_user` VALUES (13, 'test1', '08E9A6EA287E70E7E3F7C982BF7923AC', 'test1@csu.edu.cn', '13800138000', '问题', '答案', 0, '2020-11-19 22:19:25', '2020-11-19 22:19:25');
INSERT INTO `csumall_user` VALUES (17, 'test2', '095AC193FE2212EEC7A93E8FEFF11902', 'test2@csu.edu.cn', '13800138000', '问题', '答案', 0, '2020-03-17 10:51:33', '2020-04-09 23:13:26');
INSERT INTO `csumall_user` VALUES (21, 'test3', 'DE6D76FE7C40D5A1A8F04213F2BEFBEE', 'test3@csu.edu.cn', '13800138000', '105204', '105204', 0, '2020-04-13 21:26:22', '2020-04-13 21:26:22');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

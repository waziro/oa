/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : db_oa

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 19/07/2019 22:02:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_claim_voucher
-- ----------------------------
DROP TABLE IF EXISTS `tb_claim_voucher`;
CREATE TABLE `tb_claim_voucher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `cause` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事由',
  `create_sn` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `next_deal_sn` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '待处理人',
  `total_amount` double NULL DEFAULT NULL COMMENT '总金额',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `next_deal_sn`(`next_deal_sn`) USING BTREE,
  INDEX `create_sn`(`create_sn`) USING BTREE,
  CONSTRAINT `tb_claim_voucher_ibfk_1` FOREIGN KEY (`next_deal_sn`) REFERENCES `tb_employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_claim_voucher_ibfk_2` FOREIGN KEY (`create_sn`) REFERENCES `tb_employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_claim_voucher
-- ----------------------------
INSERT INTO `tb_claim_voucher` VALUES (18, '出差三天', '1005', '2019-07-19 21:54:12', '1005', 2900, '新创建');
INSERT INTO `tb_claim_voucher` VALUES (19, '出差一周', '1004', '2019-07-19 21:56:29', NULL, 3500, '已终止');
INSERT INTO `tb_claim_voucher` VALUES (20, '聚餐', '1004', '2019-07-19 21:56:47', NULL, 800, '已打款');
INSERT INTO `tb_claim_voucher` VALUES (21, '节日旅游', '1004', '2019-07-19 21:57:14', '1003', 7000, '已审核');

-- ----------------------------
-- Table structure for tb_claim_voucher_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_claim_voucher_item`;
CREATE TABLE `tb_claim_voucher_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `claim_voucher_id` int(11) NULL DEFAULT NULL COMMENT '报销单',
  `item` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用类型',
  `amount` double NULL DEFAULT NULL COMMENT '金额',
  `comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `claim_voucher_id`(`claim_voucher_id`) USING BTREE,
  CONSTRAINT `tb_claim_voucher_item_ibfk_1` FOREIGN KEY (`claim_voucher_id`) REFERENCES `tb_claim_voucher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_claim_voucher_item
-- ----------------------------
INSERT INTO `tb_claim_voucher_item` VALUES (30, 18, '交通', 2000, '高铁');
INSERT INTO `tb_claim_voucher_item` VALUES (31, 18, '住宿', 700, '酒店');
INSERT INTO `tb_claim_voucher_item` VALUES (32, 18, '餐饮', 200, '三餐');
INSERT INTO `tb_claim_voucher_item` VALUES (33, 19, '交通', 2000, '飞机');
INSERT INTO `tb_claim_voucher_item` VALUES (34, 19, '餐饮', 500, '三餐');
INSERT INTO `tb_claim_voucher_item` VALUES (35, 19, '住宿', 1000, '旅馆');
INSERT INTO `tb_claim_voucher_item` VALUES (36, 20, '餐饮', 800, '');
INSERT INTO `tb_claim_voucher_item` VALUES (37, 21, '交通', 5000, '飞机');
INSERT INTO `tb_claim_voucher_item` VALUES (38, 21, '餐饮', 2000, '聚餐');

-- ----------------------------
-- Table structure for tb_deal_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_deal_record`;
CREATE TABLE `tb_deal_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `claim_voucher_id` int(11) NULL DEFAULT NULL COMMENT '报销单',
  `deal_sn` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人',
  `deal_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `deal_way` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理类型',
  `deal_result` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  `comment` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `claim_voucher_id`(`claim_voucher_id`) USING BTREE,
  INDEX `deal_sn`(`deal_sn`) USING BTREE,
  CONSTRAINT `tb_deal_record_ibfk_1` FOREIGN KEY (`claim_voucher_id`) REFERENCES `tb_claim_voucher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tb_deal_record_ibfk_2` FOREIGN KEY (`deal_sn`) REFERENCES `tb_employee` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_deal_record
-- ----------------------------
INSERT INTO `tb_deal_record` VALUES (21, 21, '1004', '2019-07-19 21:57:21', '提交', '已提交', '无');
INSERT INTO `tb_deal_record` VALUES (22, 20, '1004', '2019-07-19 21:57:23', '提交', '已提交', '无');
INSERT INTO `tb_deal_record` VALUES (23, 19, '1004', '2019-07-19 21:57:25', '提交', '已提交', '无');
INSERT INTO `tb_deal_record` VALUES (24, 21, '1002', '2019-07-19 21:59:09', '打回', '已打回', '交通费用过高');
INSERT INTO `tb_deal_record` VALUES (25, 20, '1002', '2019-07-19 21:59:17', '通过', '已审核', '');
INSERT INTO `tb_deal_record` VALUES (26, 19, '1002', '2019-07-19 21:59:20', '拒绝', '已终止', '');
INSERT INTO `tb_deal_record` VALUES (27, 21, '1004', '2019-07-19 21:59:44', '提交', '已提交', '无');
INSERT INTO `tb_deal_record` VALUES (28, 20, '1003', '2019-07-19 22:00:05', '打款', '已打款', '三天内到账');
INSERT INTO `tb_deal_record` VALUES (29, 21, '1002', '2019-07-19 22:00:18', '通过', '待复审', '');
INSERT INTO `tb_deal_record` VALUES (30, 21, '1001', '2019-07-19 22:01:16', '通过', '已审核', '');

-- ----------------------------
-- Table structure for tb_department
-- ----------------------------
DROP TABLE IF EXISTS `tb_department`;
CREATE TABLE `tb_department`  (
  `sn` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`sn`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_department
-- ----------------------------
INSERT INTO `tb_department` VALUES ('10001', '总经理办公室', '科技大厦1101');
INSERT INTO `tb_department` VALUES ('10002', '财务部', '科技大厦1002');
INSERT INTO `tb_department` VALUES ('10003', '研发部', '科级大厦1003');
INSERT INTO `tb_department` VALUES ('10004', '后勤部', '科级大厦1004');
INSERT INTO `tb_department` VALUES ('10005', '人事部', '科技大厦1005');
INSERT INTO `tb_department` VALUES ('10006', '保安部', '科技大厦1006');

-- ----------------------------
-- Table structure for tb_employee
-- ----------------------------
DROP TABLE IF EXISTS `tb_employee`;
CREATE TABLE `tb_employee`  (
  `sn` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `department_sn` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `post` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职务',
  PRIMARY KEY (`sn`) USING BTREE,
  INDEX `department_sn`(`department_sn`) USING BTREE,
  CONSTRAINT `tb_employee_ibfk_1` FOREIGN KEY (`department_sn`) REFERENCES `tb_department` (`sn`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_employee
-- ----------------------------
INSERT INTO `tb_employee` VALUES ('1001', '123', '曹操', '10001', '总经理');
INSERT INTO `tb_employee` VALUES ('1002', '123', '孙策', '10003', '部门经理');
INSERT INTO `tb_employee` VALUES ('1003', '123', '赵云', '10002', '财务');
INSERT INTO `tb_employee` VALUES ('1004', '123', '张飞', '10003', '员工');
INSERT INTO `tb_employee` VALUES ('1005', '123', '张良', '10005', '员工');

SET FOREIGN_KEY_CHECKS = 1;

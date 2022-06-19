/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : docmanagement

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 19/06/2022 16:52:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_doc
-- ----------------------------
DROP TABLE IF EXISTS `t_doc`;
CREATE TABLE `t_doc`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文档内容',
  `tid` int NULL DEFAULT NULL COMMENT '分类id',
  `uname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_doc
-- ----------------------------
INSERT INTO `t_doc` VALUES (12, '高等数学Ⅰ', '123456789', 1, '数学老师');
INSERT INTO `t_doc` VALUES (13, '高等数学Ⅱ', 'abc', 1, '数学老师');
INSERT INTO `t_doc` VALUES (14, '股票分析', 'abc', 2, '叶法均');
INSERT INTO `t_doc` VALUES (15, '二次元', '我永远喜欢二次元', 2, '黄启焕');
INSERT INTO `t_doc` VALUES (16, 'xx系统实现', '*********************************************', 4, '');
INSERT INTO `t_doc` VALUES (17, 'SSM框架', '', 3, '');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `employeeId` int NOT NULL AUTO_INCREMENT,
  `employeeName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录账号',
  `employeePass` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `employeeRole` int NULL DEFAULT NULL COMMENT '身份',
  PRIMARY KEY (`employeeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', 1);
INSERT INTO `t_employee` VALUES (17, '叶法均', 'e10adc3949ba59abbe56e057f20f883e', '201543143@m.gduf.edu.cn', 0);
INSERT INTO `t_employee` VALUES (18, '谢文康', 'e10adc3949ba59abbe56e057f20f883e', '201543137@m.gduf.edu.cn', 0);
INSERT INTO `t_employee` VALUES (19, '杨靖夏', 'e10adc3949ba59abbe56e057f20f883e', '201543140@m.gduf.edu.cn', 1);
INSERT INTO `t_employee` VALUES (20, '刘昊扬', 'e10adc3949ba59abbe56e057f20f883e', '201543126@m.gduf.edu.cn', 0);
INSERT INTO `t_employee` VALUES (21, '黄启焕', 'e10adc3949ba59abbe56e057f20f883e', '201543118@m.gduf.edu.cn', 0);
INSERT INTO `t_employee` VALUES (22, '郑炫锋', 'e10adc3949ba59abbe56e057f20f883e', '201543145@m.gduf.edu.cn', 0);
INSERT INTO `t_employee` VALUES (23, '王俊龙', 'e10adc3949ba59abbe56e057f20f883e', '201543137@m.gduf.edu.cn', 0);
INSERT INTO `t_employee` VALUES (24, 'test', '202cb962ac59075b964b07152d234b70', NULL, 0);

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `record` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录',
  `createtime` datetime NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_record
-- ----------------------------
INSERT INTO `t_record` VALUES (13, 'admin', '添加分类：复习资料', '2022-06-19 14:06:04');
INSERT INTO `t_record` VALUES (14, 'admin', '添加分类：兴趣爱好', '2022-06-19 14:06:16');
INSERT INTO `t_record` VALUES (15, 'admin', '添加分类：参考文献', '2022-06-19 14:06:22');
INSERT INTO `t_record` VALUES (16, 'admin', '添加分类：毕业论文', '2022-06-19 14:06:29');
INSERT INTO `t_record` VALUES (17, 'admin', '添加分类：学生资料', '2022-06-19 14:06:37');
INSERT INTO `t_record` VALUES (18, 'admin', '添加用户：叶法均', '2022-06-19 14:12:53');
INSERT INTO `t_record` VALUES (19, 'admin', '添加用户：谢文康', '2022-06-19 14:13:17');
INSERT INTO `t_record` VALUES (20, 'admin', '添加用户：杨靖夏', '2022-06-19 14:13:31');
INSERT INTO `t_record` VALUES (21, 'admin', '添加用户：刘昊扬', '2022-06-19 14:13:53');
INSERT INTO `t_record` VALUES (22, 'admin', '添加用户：黄启焕', '2022-06-19 14:14:10');
INSERT INTO `t_record` VALUES (23, 'admin', '添加用户：郑炫锋', '2022-06-19 14:14:33');
INSERT INTO `t_record` VALUES (24, 'admin', '添加用户：王俊龙', '2022-06-19 14:14:54');
INSERT INTO `t_record` VALUES (25, 'admin', '添加文档：高等数学Ⅰ', '2022-06-19 14:16:12');
INSERT INTO `t_record` VALUES (26, 'admin', '添加文档：高等数学Ⅱ', '2022-06-19 14:16:30');
INSERT INTO `t_record` VALUES (27, 'admin', '添加文档：股票分析', '2022-06-19 14:17:43');
INSERT INTO `t_record` VALUES (28, 'test', '编辑分类：毕业论文', '2022-06-19 14:20:38');
INSERT INTO `t_record` VALUES (29, '黄启焕', '添加文档：二次元', '2022-06-19 16:39:36');
INSERT INTO `t_record` VALUES (30, '黄启焕', '添加文档：xx系统实现', '2022-06-19 16:40:47');
INSERT INTO `t_record` VALUES (31, '黄启焕', '添加文档：SSM框架', '2022-06-19 16:41:36');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, '复习资料');
INSERT INTO `t_type` VALUES (2, '兴趣爱好');
INSERT INTO `t_type` VALUES (3, '参考文献');
INSERT INTO `t_type` VALUES (4, '毕业论文');
INSERT INTO `t_type` VALUES (5, '学生资料');

SET FOREIGN_KEY_CHECKS = 1;

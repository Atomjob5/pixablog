/*
 Navicat MySQL Data Transfer

 Source Server         : aliyun
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 47.93.191.52:3306
 Source Schema         : pixablog

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 19/12/2019 22:22:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_feedback
-- ----------------------------
DROP TABLE IF EXISTS `sys_feedback`;
CREATE TABLE `sys_feedback`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `content` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` date NULL DEFAULT NULL,
  `seen` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_picture
-- ----------------------------
DROP TABLE IF EXISTS `sys_picture`;
CREATE TABLE `sys_picture`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `likes` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_picture
-- ----------------------------
INSERT INTO `sys_picture` VALUES (29, '阿姆斯特丹的夜', '/img/picture/example/1.jpg', 0, '2019-10-01 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (30, '草地上的黑柴', '/img/picture/example/2.jpg', 0, '2019-10-02 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (31, '清晨的罗宾鸟', '/img/picture/example/3.jpg', 0, '2019-10-03 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (32, '笑脸狗', '/img/picture/example/4.jpg', 0, '2019-10-04 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (33, '草地 柴犬 足球', '/img/picture/example/5.jpg', 3, '2019-09-20 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (34, '沙漠 落日 孤城', '/img/picture/example/6.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (35, '象背上的城', '/img/picture/example/7.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (36, '送终鸡', '/img/picture/example/8.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (37, '圣诞树', '/img/picture/example/9.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (38, '雪地 清晨 鸟', '/img/picture/example/10.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (39, '黑夜 树林', '/img/picture/example/11.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (40, '学习者', '/img/picture/example/12.jpg', 0, '2019-11-24 10:00:00', 1);
INSERT INTO `sys_picture` VALUES (41, '柴犬 凝视', '/img/picture/example/13.jpg', 0, '2019-11-24 10:00:00', 1);
INSERT INTO `sys_picture` VALUES (42, '(*^▽^*)', '/img/picture/example/14.jpg', 0, '2019-11-24 01:00:00', 1);
INSERT INTO `sys_picture` VALUES (43, '松鼠 树林', '/img/picture/example/15.jpg', 1, '2019-11-24 01:00:00', 1);
INSERT INTO `sys_picture` VALUES (44, '松鼠 玩耍', '/img/picture/example/16.jpg', 0, '2019-11-23 02:04:02', 1);
INSERT INTO `sys_picture` VALUES (45, '闯入屋子的松鼠', '/img/picture/example/17.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (46, '伊利的古城', '/img/picture/example/18.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (47, '黑暗森林里的城堡', '/img/picture/example/19.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (48, '憨憨布丁', '/img/picture/2019-11-24/7c368b87-97b9-4df8-a8ae-21797d14e815.jpeg', 6, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (49, '红叶 树枝 鸟', '/img/picture/2019-11-24/7419f4f2-5c76-4df1-b359-48a38c36fcb3.jpg', 0, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (52, '草莓果酱ox', '/img/picture/2019-11-24/3a9f2b61-268d-402e-b36f-e2f0058fdfe7.png', 10, '2019-11-24 00:00:00', 1);
INSERT INTO `sys_picture` VALUES (55, 'juhua', '/img/picture/2019-11-28/6cebb6f7-ae92-488c-a771-3e9991a3f80b.jpg', 1, '2019-11-28 09:13:57', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `menu_id` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(1) NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile_photo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `role` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123', '管理员', 1, '管理者测试', NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;

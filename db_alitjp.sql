/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : db_alitjp

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 03/07/2018 08:09:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nb_data
-- ----------------------------
DROP TABLE IF EXISTS `nb_data`;
CREATE TABLE `nb_data`  (
  `Seq` int(30) NOT NULL AUTO_INCREMENT,
  `Time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Node_ID` int(5) NOT NULL,
  `PH` float NULL DEFAULT NULL,
  `Oxy` float NULL DEFAULT NULL,
  `Rate` int(5) NOT NULL,
  `rq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `gx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `px` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Seq`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_data
-- ----------------------------
INSERT INTO `nb_data` VALUES (1, '2017-08-08 23:59:30', 1, 10.7504, 0.378176, 23, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (2, '2017-06-25 22:01:43', 1, 6.12127, 0.121291, 4, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (3, '2017-07-04 02:36:32', 1, 13.4463, 0.98245, 22, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (4, '2017-08-29 05:48:58', 1, 11.8499, 0.571027, 20, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (5, '2017-03-20 10:21:04', 1, 8.32538, 0.634307, 11, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (6, '2017-02-04 21:30:51', 1, 1.31149, 0.967768, 42, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (7, '2017-05-28 05:42:51', 1, 3.06425, 0.730737, 42, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (8, '2017-06-09 07:19:21', 1, 0.874327, 0.210301, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (9, '2017-01-26 15:36:38', 1, 4.5473, 0.900562, 32, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (10, '2017-03-15 05:38:21', 1, 13.3469, 0.0237096, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (11, '2017-11-10 13:59:55', 1, 1.53725, 0.665019, 41, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (12, '2017-12-28 18:39:56', 1, 6.09016, 0.906731, 2, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (13, '2017-04-14 07:00:49', 1, 13.0971, 0.193264, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (14, '2017-04-24 21:23:56', 1, 5.63695, 0.427456, 30, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (15, '2017-02-13 05:58:42', 1, 2.9783, 0.0919561, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (16, '2017-04-05 18:06:51', 1, 7.84626, 0.0350243, 4, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (17, '2017-04-16 07:29:31', 1, 13.0431, 0.863605, 22, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (18, '2017-02-07 22:56:26', 1, 2.19266, 0.28779, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (19, '2017-06-19 11:26:37', 1, 6.97751, 0.327459, 3, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (20, '2017-05-04 06:10:04', 2, 11.6275, 0.682566, 21, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (21, '2017-07-18 01:18:24', 2, 2.89352, 0.568304, 40, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (22, '2017-07-24 12:55:12', 2, 10.7249, 0.786835, 22, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (23, '2017-11-28 18:20:34', 2, 13.6478, 0.731678, 22, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (24, '2017-05-14 05:12:18', 2, 0.810227, 0.504553, 40, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (25, '2017-12-09 01:09:47', 2, 8.74862, 0.474963, 10, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (26, '2017-10-20 09:16:02', 2, 9.60485, 0.934674, 12, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (27, '2017-12-29 11:22:10', 2, 13.1679, 0.685724, 21, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (28, '2017-02-08 15:22:55', 2, 5.52378, 0.299782, 34, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (29, '2017-12-25 18:57:08', 2, 5.45937, 0.495202, 30, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (30, '2017-03-13 00:36:15', 2, 12.6013, 0.158062, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (31, '2017-11-30 11:43:23', 2, 12.6976, 0.26154, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (32, '2017-05-13 06:26:57', 2, 12.3505, 0.888282, 22, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (33, '2017-08-17 10:47:59', 2, 7.9747, 0.145004, 4, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (34, '2017-06-25 10:03:10', 2, 2.90442, 0.0717138, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (35, '2017-12-11 15:05:36', 2, 8.49839, 0.180705, 14, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (36, '2017-05-21 06:58:04', 2, 1.84549, 0.521825, 40, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (37, '2017-10-07 23:38:12', 2, 2.45196, 0.967403, 42, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (38, '2017-12-13 03:50:53', 2, 12.4876, 0.510126, 20, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (39, '2017-12-19 19:15:37', 2, 8.087, 0.484888, 10, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (40, '2017-10-07 09:57:46', 3, 10.957, 0.553482, 20, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (41, '2017-01-30 12:28:24', 3, 2.52058, 0.40273, 40, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (42, '2017-11-20 12:23:50', 3, 7.31123, 0.0473415, 4, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (43, '2017-10-12 23:23:41', 3, 4.8341, 0.55374, 30, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (44, '2017-04-04 23:31:53', 3, 8.3407, 0.183934, 14, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (45, '2017-08-29 18:45:01', 3, 4.69126, 0.581752, 30, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (46, '2017-01-13 02:54:54', 3, 7.45635, 0.0496229, 4, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (47, '2017-07-22 15:36:07', 3, 2.7545, 0.87688, 42, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (48, '2017-06-18 23:16:35', 3, 2.4169, 0.631477, 41, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (49, '2017-02-03 16:04:38', 3, 12.0575, 0.585501, 20, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (50, '2017-03-17 11:44:13', 3, 8.57427, 0.0411173, 14, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (51, '2017-11-02 06:49:51', 3, 13.3313, 0.624858, 21, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (52, '2017-11-23 10:48:35', 3, 1.10143, 0.994349, 42, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (53, '2017-11-14 17:26:11', 3, 0.0969487, 0.686447, 41, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (54, '2017-10-28 10:46:45', 3, 5.72251, 0.226433, 34, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (55, '2017-01-11 21:36:04', 3, 4.52404, 0.502012, 30, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (56, '2017-11-25 10:57:30', 3, 11.4923, 0.697412, 21, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (57, '2017-05-20 10:02:10', 3, 5.47168, 0.994167, 32, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (58, '2017-02-25 16:51:52', 3, 1.97264, 0.0119587, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (59, '2017-08-14 07:11:58', 3, 8.38421, 0.888855, 12, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (60, '2017-04-14 02:46:41', 4, 7.04055, 0.900354, 2, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (61, '2017-02-02 11:50:19', 4, 2.25054, 0.683796, 41, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (62, '2017-07-31 17:11:40', 4, 12.8852, 0.112194, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (63, '2017-12-18 05:29:14', 4, 1.42344, 0.0922151, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (64, '2017-07-11 15:35:39', 4, 12.1674, 0.952025, 22, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (65, '2017-10-18 03:57:23', 4, 10.3755, 0.321, 23, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (66, '2017-06-12 21:11:59', 4, 6.76743, 0.407642, 0, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (67, '2017-04-16 06:17:30', 4, 6.84685, 0.187858, 4, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (68, '2017-03-08 02:29:32', 4, 6.82777, 0.60662, 1, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (69, '2017-01-16 04:20:18', 4, 1.94253, 0.0910172, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (70, '2017-09-19 06:23:07', 4, 9.65726, 0.302803, 13, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (71, '2017-12-19 09:39:38', 4, 6.63999, 0.495914, 0, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (72, '2017-10-21 13:40:46', 4, 12.5951, 0.158209, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (73, '2017-06-10 13:03:53', 4, 7.03089, 0.605763, 1, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (74, '2017-11-01 12:22:55', 4, 7.91172, 0.288067, 4, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (75, '2017-03-08 22:17:02', 4, 12.4243, 0.65036, 21, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (76, '2017-01-09 07:19:47', 4, 10.2329, 0.069077, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (77, '2017-08-07 11:41:07', 4, 9.29987, 0.508926, 10, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (78, '2017-01-08 08:34:10', 4, 8.79733, 0.186103, 14, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (79, '2017-01-01 10:00:48', 4, 6.31926, 0.939565, 2, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (80, '2017-10-24 03:29:16', 5, 11.8539, 0.0128531, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (81, '2017-08-31 03:50:42', 5, 1.59955, 0.221331, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (82, '2017-06-24 22:59:59', 5, 4.0875, 0.2048, 34, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (83, '2017-12-27 18:10:28', 5, 13.5094, 0.495708, 20, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (84, '2017-10-04 10:39:31', 5, 0.976577, 0.633249, 41, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (85, '2017-06-12 02:04:54', 5, 13.3265, 0.255692, 24, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (86, '2017-03-04 05:45:26', 5, 3.97313, 0.830166, 42, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (87, '2017-04-30 21:37:02', 5, 12.249, 0.445684, 20, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (88, '2017-08-06 01:35:20', 5, 10.0059, 0.962952, 22, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (89, '2017-02-02 13:58:32', 5, 12.6429, 0.727638, 22, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (90, '2017-12-10 14:48:29', 5, 9.38874, 0.312177, 13, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (91, '2017-04-27 17:03:17', 5, 2.65322, 0.452749, 40, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (92, '2017-11-14 22:22:38', 5, 2.02939, 0.426792, 40, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (93, '2017-01-23 22:18:06', 5, 5.27085, 0.700341, 32, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (94, '2017-09-25 14:38:58', 5, 0.443509, 0.204986, 44, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (95, '2017-04-26 22:22:47', 5, 10.7462, 0.626629, 21, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (96, '2017-11-17 00:23:08', 5, 10.3021, 0.342324, 23, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (97, '2017-03-11 11:39:51', 5, 4.36052, 0.0510677, 34, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (98, '2017-04-03 21:21:22', 5, 8.73092, 0.519677, 10, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (99, '2017-12-06 21:52:11', 5, 2.04415, 0.605719, 41, NULL, 183, NULL, NULL);
INSERT INTO `nb_data` VALUES (100, '2017-06-04 17:28:39', 1, 9.28599, 0.953521, 12, NULL, 183, NULL, NULL);

-- ----------------------------
-- Table structure for nb_equip
-- ----------------------------
DROP TABLE IF EXISTS `nb_equip`;
CREATE TABLE `nb_equip`  (
  `Node_ID` int(5) NOT NULL,
  `Location_X` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Location_Y` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Location_Z` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MAC` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Last_Upload` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `gx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `px` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Node_ID`, `MAC`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_equip
-- ----------------------------
INSERT INTO `nb_equip` VALUES (1, '117.53453', '39.132959', '10.2', '0123432-12', NULL, NULL, 181, NULL, NULL);
INSERT INTO `nb_equip` VALUES (2, '117.535033', '39.129293', '15.3', '0234623-32', NULL, NULL, 181, NULL, NULL);
INSERT INTO `nb_equip` VALUES (3, '117.531134', '39.129097', '22', '3453451-66', NULL, NULL, 181, NULL, NULL);
INSERT INTO `nb_equip` VALUES (4, '117.533218', '39.13065', '12.8', '4328342-98', NULL, NULL, 181, NULL, NULL);
INSERT INTO `nb_equip` VALUES (5, '117.535958', '39.134047', '18.1', '3218347-54', NULL, NULL, 181, NULL, NULL);

-- ----------------------------
-- Table structure for nb_hisdata
-- ----------------------------
DROP TABLE IF EXISTS `nb_hisdata`;
CREATE TABLE `nb_hisdata`  (
  `Seq` int(30) NOT NULL AUTO_INCREMENT,
  `Time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Node_ID` int(5) NOT NULL,
  `PH` float NULL DEFAULT NULL,
  `Oxy` float NULL DEFAULT NULL,
  `Rate` int(5) NOT NULL,
  `rq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `gx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `px` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Seq`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nb_hisdata
-- ----------------------------
INSERT INTO `nb_hisdata` VALUES (1, '2017-08-08 23:59:30', 1, 10.7504, 0.378176, 23, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (2, '2017-06-25 22:01:43', 1, 6.12127, 0.121291, 4, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (3, '2017-07-04 02:36:32', 1, 13.4463, 0.98245, 22, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (4, '2017-08-29 05:48:58', 1, 11.8499, 0.571027, 20, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (5, '2017-03-20 10:21:04', 1, 8.32538, 0.634307, 11, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (6, '2017-02-04 21:30:51', 1, 1.31149, 0.967768, 42, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (7, '2017-05-28 05:42:51', 1, 3.06425, 0.730737, 42, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (8, '2017-06-09 07:19:21', 1, 0.874327, 0.210301, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (9, '2017-01-26 15:36:38', 1, 4.5473, 0.900562, 32, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (10, '2017-03-15 05:38:21', 1, 13.3469, 0.0237096, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (11, '2017-11-10 13:59:55', 1, 1.53725, 0.665019, 41, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (12, '2017-12-28 18:39:56', 1, 6.09016, 0.906731, 2, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (13, '2017-04-14 07:00:49', 1, 13.0971, 0.193264, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (14, '2017-04-24 21:23:56', 1, 5.63695, 0.427456, 30, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (15, '2017-02-13 05:58:42', 1, 2.9783, 0.0919561, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (16, '2017-04-05 18:06:51', 1, 7.84626, 0.0350243, 4, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (17, '2017-04-16 07:29:31', 1, 13.0431, 0.863605, 22, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (18, '2017-02-07 22:56:26', 1, 2.19266, 0.28779, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (19, '2017-06-19 11:26:37', 1, 6.97751, 0.327459, 3, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (20, '2017-05-04 06:10:04', 2, 11.6275, 0.682566, 21, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (21, '2017-07-18 01:18:24', 2, 2.89352, 0.568304, 40, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (22, '2017-07-24 12:55:12', 2, 10.7249, 0.786835, 22, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (23, '2017-11-28 18:20:34', 2, 13.6478, 0.731678, 22, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (24, '2017-05-14 05:12:18', 2, 0.810227, 0.504553, 40, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (25, '2017-12-09 01:09:47', 2, 8.74862, 0.474963, 10, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (26, '2017-10-20 09:16:02', 2, 9.60485, 0.934674, 12, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (27, '2017-12-29 11:22:10', 2, 13.1679, 0.685724, 21, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (28, '2017-02-08 15:22:55', 2, 5.52378, 0.299782, 34, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (29, '2017-12-25 18:57:08', 2, 5.45937, 0.495202, 30, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (30, '2017-03-13 00:36:15', 2, 12.6013, 0.158062, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (31, '2017-11-30 11:43:23', 2, 12.6976, 0.26154, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (32, '2017-05-13 06:26:57', 2, 12.3505, 0.888282, 22, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (33, '2017-08-17 10:47:59', 2, 7.9747, 0.145004, 4, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (34, '2017-06-25 10:03:10', 2, 2.90442, 0.0717138, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (35, '2017-12-11 15:05:36', 2, 8.49839, 0.180705, 14, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (36, '2017-05-21 06:58:04', 2, 1.84549, 0.521825, 40, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (37, '2017-10-07 23:38:12', 2, 2.45196, 0.967403, 42, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (38, '2017-12-13 03:50:53', 2, 12.4876, 0.510126, 20, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (39, '2017-12-19 19:15:37', 2, 8.087, 0.484888, 10, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (40, '2017-10-07 09:57:46', 3, 10.957, 0.553482, 20, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (41, '2017-01-30 12:28:24', 3, 2.52058, 0.40273, 40, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (42, '2017-11-20 12:23:50', 3, 7.31123, 0.0473415, 4, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (43, '2017-10-12 23:23:41', 3, 4.8341, 0.55374, 30, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (44, '2017-04-04 23:31:53', 3, 8.3407, 0.183934, 14, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (45, '2017-08-29 18:45:01', 3, 4.69126, 0.581752, 30, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (46, '2017-01-13 02:54:54', 3, 7.45635, 0.0496229, 4, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (47, '2017-07-22 15:36:07', 3, 2.7545, 0.87688, 42, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (48, '2017-06-18 23:16:35', 3, 2.4169, 0.631477, 41, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (49, '2017-02-03 16:04:38', 3, 12.0575, 0.585501, 20, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (50, '2017-03-17 11:44:13', 3, 8.57427, 0.0411173, 14, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (51, '2017-11-02 06:49:51', 3, 13.3313, 0.624858, 21, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (52, '2017-11-23 10:48:35', 3, 1.10143, 0.994349, 42, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (53, '2017-11-14 17:26:11', 3, 0.0969487, 0.686447, 41, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (54, '2017-10-28 10:46:45', 3, 5.72251, 0.226433, 34, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (55, '2017-01-11 21:36:04', 3, 4.52404, 0.502012, 30, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (56, '2017-11-25 10:57:30', 3, 11.4923, 0.697412, 21, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (57, '2017-05-20 10:02:10', 3, 5.47168, 0.994167, 32, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (58, '2017-02-25 16:51:52', 3, 1.97264, 0.0119587, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (59, '2017-08-14 07:11:58', 3, 8.38421, 0.888855, 12, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (60, '2017-04-14 02:46:41', 4, 7.04055, 0.900354, 2, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (61, '2017-02-02 11:50:19', 4, 2.25054, 0.683796, 41, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (62, '2017-07-31 17:11:40', 4, 12.8852, 0.112194, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (63, '2017-12-18 05:29:14', 4, 1.42344, 0.0922151, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (64, '2017-07-11 15:35:39', 4, 12.1674, 0.952025, 22, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (65, '2017-10-18 03:57:23', 4, 10.3755, 0.321, 23, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (66, '2017-06-12 21:11:59', 4, 6.76743, 0.407642, 0, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (67, '2017-04-16 06:17:30', 4, 6.84685, 0.187858, 4, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (68, '2017-03-08 02:29:32', 4, 6.82777, 0.60662, 1, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (69, '2017-01-16 04:20:18', 4, 1.94253, 0.0910172, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (70, '2017-09-19 06:23:07', 4, 9.65726, 0.302803, 13, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (71, '2017-12-19 09:39:38', 4, 6.63999, 0.495914, 0, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (72, '2017-10-21 13:40:46', 4, 12.5951, 0.158209, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (73, '2017-06-10 13:03:53', 4, 7.03089, 0.605763, 1, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (74, '2017-11-01 12:22:55', 4, 7.91172, 0.288067, 4, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (75, '2017-03-08 22:17:02', 4, 12.4243, 0.65036, 21, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (76, '2017-01-09 07:19:47', 4, 10.2329, 0.069077, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (77, '2017-08-07 11:41:07', 4, 9.29987, 0.508926, 10, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (78, '2017-01-08 08:34:10', 4, 8.79733, 0.186103, 14, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (79, '2017-01-01 10:00:48', 4, 6.31926, 0.939565, 2, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (80, '2017-10-24 03:29:16', 5, 11.8539, 0.0128531, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (81, '2017-08-31 03:50:42', 5, 1.59955, 0.221331, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (82, '2017-06-24 22:59:59', 5, 4.0875, 0.2048, 34, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (83, '2017-12-27 18:10:28', 5, 13.5094, 0.495708, 20, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (84, '2017-10-04 10:39:31', 5, 0.976577, 0.633249, 41, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (85, '2017-06-12 02:04:54', 5, 13.3265, 0.255692, 24, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (86, '2017-03-04 05:45:26', 5, 3.97313, 0.830166, 42, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (87, '2017-04-30 21:37:02', 5, 12.249, 0.445684, 20, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (88, '2017-08-06 01:35:20', 5, 10.0059, 0.962952, 22, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (89, '2017-02-02 13:58:32', 5, 12.6429, 0.727638, 22, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (90, '2017-12-10 14:48:29', 5, 9.38874, 0.312177, 13, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (91, '2017-04-27 17:03:17', 5, 2.65322, 0.452749, 40, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (92, '2017-11-14 22:22:38', 5, 2.02939, 0.426792, 40, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (93, '2017-01-23 22:18:06', 5, 5.27085, 0.700341, 32, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (94, '2017-09-25 14:38:58', 5, 0.443509, 0.204986, 44, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (95, '2017-04-26 22:22:47', 5, 10.7462, 0.626629, 21, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (96, '2017-11-17 00:23:08', 5, 10.3021, 0.342324, 23, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (97, '2017-03-11 11:39:51', 5, 4.36052, 0.0510677, 34, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (98, '2017-04-03 21:21:22', 5, 8.73092, 0.519677, 10, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (99, '2017-12-06 21:52:11', 5, 2.04415, 0.605719, 41, NULL, 184, NULL, NULL);
INSERT INTO `nb_hisdata` VALUES (100, '2017-06-04 17:28:39', 1, 9.28599, 0.953521, 12, NULL, 184, NULL, NULL);

-- ----------------------------
-- Table structure for t_dashi
-- ----------------------------
DROP TABLE IF EXISTS `t_dashi`;
CREATE TABLE `t_dashi`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nr` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cs` int(11) NOT NULL DEFAULT 0,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delf` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记（0-未删除，1-已删除）',
  `px` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_s` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nian` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体哪一年',
  `lcb` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年内具体时间',
  `uid` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tjpcms_usr中的id，即存储是哪个用户的数据',
  `shzt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待审核' COMMENT '审核状态（待审核、审核通过、审核不通过、退回修改）',
  `shyj` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 307 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dashi
-- ----------------------------
INSERT INTO `t_dashi` VALUES (161, 167, '完成第一个基于jeecms的网站二次开发', '<p style=\"line-height: 2.5em; text-indent: 2em;\"><span style=\"font-size: 20px; font-family: 仿宋, FangSong;\">其实在这个时间点之前一直处于遍地是php的cms但那时还玩不转php，java类cms完全是非主流但自己又只习惯java来开发尴尬境地。这个点之前自己还下过dedecms的视频学习，什么老李dede888仿站，看了半天似懂非懂的，后来想还是找找java的cms吧，网上一圈搜索也就这个jeecms勉强能用吧，算是网上有点诚意的产品，不过商用收费的啦，而且用过之后发现这玩意效率奇低，就一最简单的新闻类cms，启动一下等好几分钟，追了一下代码，我滴妈，套了不知道多少层，还是用的freemarker模板，什么shiro权限控制，我用jeecms实际开发了这个网站后，对它已经全无好感了，二开特别费劲，一个登陆后自动跳转的功能就搞了我半天，一个列表页字段查询的功能追了好久代码才发现系统其实自带这功能，但是文档里不说。只不过聊胜于无，有总比没有好，就这么也用了一段时间，在熟悉的过程中也逐渐总结出来cms最常用的功能是什么，有哪些可以改进的，可以说是tjpcms的一个启蒙。</span></p>', 0, '2017-01-06 15:25:26', '2017-01-10 10:38:50', 0, 44, '/alitjp/dashi_detail.dhtml?id=161', '/alitjp/static/neirong/dashi_detail/161.html', 'dashi_detail', '2015', '5月7号', '', '审核通过', NULL);
INSERT INTO `t_dashi` VALUES (301, 167, '购买tjpcms.com域名', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 20px;\">那么在各种cms的制作过程中，我逐渐萌发了自己做一个cms的想法，尤其是这一年的6月底7月份，利用业余时间完成了对一个ecshop项目的二次开发，那时的节奏就是工作日下班后开始弄ecshop，正常到10点左右，不停的各种尝试，然后到了周末反而放假了，周末事情比平时还多。其实ecshop也和cms差不多，各种增删改查，所以这个弄完之后，更加觉得这所谓cms、ERP、shop、crm不都差不多嘛，刨去各自业务的部分，很大一块都是crud，所以对于tjpcms这个概念也是跃跃欲试。<span style=\"font-family: 仿宋, FangSong; text-indent: 2em;\">到了年底，觉得先把域名买下来吧，因为看tjpcms是可以买的，6位的com域名也能接受，就买了,其实我更中意jpcms的，可惜没了，只好退而求其次了。</span></span></p>', 0, '2017-01-10 10:55:17', '2017-01-10 15:06:50', 0, 45, '/alitjp/dashi_detail.dhtml?id=301', '/alitjp/static/neirong/dashi_detail/301.html', 'dashi_detail', '2015', '12月20日', '', '审核通过', NULL);
INSERT INTO `t_dashi` VALUES (302, 167, 'tjpcms雏形诞生', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">虽然注册了域名，但是也就一直搁置在那了，毕竟从想法到付诸实践还是需要一定的契机。后来借着开发一个cms网站的时机，我就边开发tjpcms边开发这个网站，将以往后台逐个开发的部分都转用tjpcms来配置，所以那时每当有个新的配置需求，就立马开始开发，反正就是要各种需求都能配置出来，因为是实际要用的网站，所以实战性还是比较强的。断断续续开发了一两个月的时间，大致有了一个雏形，也积累了很多需要改进的地方，来不及完善的就先都记下来了，后面有时间了再继续完善。</span></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">这个雏形呢也是耗费了我不少精力，因为希望能做出一个精品。其中静态化的功能，我还是比较满意的，参考了网上的资料，使用jsp作为模板就可以一键全站或局部静态化了，这样也不需要开发者额外学习其他模板技术，算是比较实用的功能。缺点就是虽然支持一个普通的cms网站是足够了，要完善的地方还不少，也需要更多的应用来收集需求继续改善。</span></p>', 0, '2017-01-10 14:17:19', '2017-01-10 15:06:55', 0, 46, '/alitjp/dashi_detail.dhtml?id=302', '/alitjp/static/neirong/dashi_detail/302.html', 'dashi_detail', '2016', '7月左右', '', '审核通过', NULL);
INSERT INTO `t_dashi` VALUES (303, 167, '为tjpcms购买了云服务器', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">我选择了阿里云的ecs，其实也没太多的选择，毕竟阿里云的名气比较大，我的域名也是在阿里买的，双11又有活动，就一下决心买了吧。3年1500多，1核1M内存1M带宽，最低的配置，就没有更低的了，本来还有点担心这样的配置会不会官网都跑步起来，后来发现还好，不过这是后话了。<br/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">要说这价格也不算太高了，但是和php的比起来还是贵多了，毕竟这买的是一个云服务器，php的一般只需要买个服务器空间就行了，直接ftp管理，我买的这个等于是个虚拟机，好处就是可以远程桌面连接，自行安装需要的运行环境。php的那种服务器空间是环境已经预装好的，等于是分配了硬盘的一块空间给你，印象中普通的一个月也就20块钱左右吧，要是像我这样直接买3年的估计更便宜。</span></p>', 0, '2017-01-10 14:36:04', '2017-01-10 14:48:04', 0, 48, '/alitjp/dashi_detail.dhtml?id=303', '/alitjp/static/neirong/dashi_detail/303.html', 'dashi_detail', '2016', '双11', '', '审核通过', NULL);
INSERT INTO `t_dashi` VALUES (304, 167, 'tjp先行上线', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">先做了一个基础的官网，当然也是基于tjpcms的。其实主要是想测试一下买的这个服务器到底行不行，这是当时阿里云能买到的最便宜的，我心里也很没底，根据我以前的经验，曾经买过一个一年1500左右的阿里云ecs，当时就跑了jeecms的一个网站，不开静态化卡爆了，普通一个网页10秒起。<br/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">我这个ecs一年也就500多，还是有点虚啊，想着不行就全站静态化呗，结果一试，有点出乎意料，开全站动态化毫无压力，速度飞起，而且用的畅言也没影响速度嘛，还不错。但是我感觉阿里云的一个通病好像是，这ecs用了一段时间后自己就不行了，大概3个星期到一个月吧，自行就挂掉了，得强制重启ecs，有点坑，不知道是不是因为我买的是比较便宜的？</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">这次的上线呢我定性为先行上线，因为主体功能还有不少没有完成，尤其是因为用了畅言了，这个账号系统就有点头疼了，有了畅言评论是方便了八辈子去了，但这玩意是个免费的，时不时还搞点调整什么的，单点登录的功能也不知道现在能不能用了。没有账号系统，有不少相关的功能暂时就没法开发。因此下一步打算先把除了账号系统外的其他东西先上线了。</span></p>', 0, '2017-01-10 14:54:26', '2017-01-10 15:01:21', 0, 49, '/alitjp/dashi_detail.dhtml?id=304', '/alitjp/static/neirong/dashi_detail/304.html', 'dashi_detail', '2016', '11月24日', '', '审核通过', NULL);
INSERT INTO `t_dashi` VALUES (305, 167, 'tjpcms正式上线', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">时间一过两个月啊，最近有点心事重重、颓废，一直不长肉的节奏啊，16年刷刷的就过去了，md感觉不顺，不过想想也算了，什么都顺那还是生活吗。经过一番梳理后，tjpcms正式上线，算不上精心，也算得上用心了。对付普通的cms类网站，那效果绝对刷刷的，国产Java类cms良心之作啊，最懂。。。<br/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">后面也有不少事情，估计顺利的话17年上半年能再出个版本，必须要继续给个力啊！17年，加紧努力。</span></p>', 0, '2017-01-11 17:17:40', '2017-01-11 17:29:36', 0, 50, '/alitjp/dashi_detail.dhtml?id=305', '/alitjp/static/neirong/dashi_detail/305.html', 'dashi_detail', '2017', '1月11日', '', '审核通过', NULL);

-- ----------------------------
-- Table structure for t_hd
-- ----------------------------
DROP TABLE IF EXISTS `t_hd`;
CREATE TABLE `t_hd`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `lx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nr` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ag` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `yd` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `delf` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1520 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


INSERT INTO `t_hd` VALUES (937, 173, '首页下载', '2017-02-09 13:13:19', NULL, '111.198.187.130', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (938, 173, '首页下载', '2017-02-09 13:24:52', NULL, '111.198.187.130', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (939, 173, '首页下载', '2017-02-09 13:25:09', NULL, '111.198.187.130', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (940, 173, '首页下载', '2017-02-09 13:35:29', NULL, '117.88.59.72', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (941, 173, '首页下载', '2017-02-09 13:35:57', '码云', '117.88.59.72', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (942, 173, '首页下载', '2017-02-09 13:49:13', NULL, '27.187.169.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (943, 173, '首页下载', '2017-02-09 13:52:19', NULL, '1.202.219.154', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (944, 172, '首页点赞', '2017-02-09 13:52:43', NULL, '36.23.180.61', 'Mozilla/5.0 (Linux; U; Android 5.1.1; zh-cn; Redmi 3 Build/LMY47V) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/53.0.2785.146 Mobile Safari/537.36 XiaoMi/MiuiBrowser/8.4.6', '0', 0);
INSERT INTO `t_hd` VALUES (945, 172, '首页点赞', '2017-02-09 13:56:40', NULL, '121.69.2.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393', '0', 0);
INSERT INTO `t_hd` VALUES (946, 173, '首页下载', '2017-02-09 13:56:57', NULL, '183.220.1.29', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (947, 173, '首页下载', '2017-02-09 14:00:34', NULL, '121.69.2.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393', '0', 0);
INSERT INTO `t_hd` VALUES (948, 173, '首页下载', '2017-02-09 14:45:48', NULL, '124.65.183.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (949, 173, '首页下载', '2017-02-09 15:07:01', NULL, '180.110.233.196', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.95 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (950, 173, '首页下载', '2017-02-09 15:21:33', NULL, '110.249.218.124', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393', '0', 0);
INSERT INTO `t_hd` VALUES (951, 173, '首页下载', '2017-02-09 15:37:33', NULL, '113.99.98.231', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (952, 173, '首页下载', '2017-02-09 15:47:40', NULL, '123.127.220.163', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (953, 173, '首页下载', '2017-02-09 16:06:27', NULL, '221.214.120.34', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (954, 173, '首页下载', '2017-02-09 16:38:11', NULL, '125.71.36.228', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (955, 173, '首页下载', '2017-02-09 16:38:31', NULL, '125.71.36.228', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (956, 173, '首页下载', '2017-02-09 16:40:01', NULL, '125.71.36.228', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (957, 173, '首页下载', '2017-02-09 16:40:20', NULL, '125.71.36.228', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (958, 173, '首页下载', '2017-02-09 16:41:33', NULL, '125.71.36.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A', '0', 0);
INSERT INTO `t_hd` VALUES (959, 173, '首页下载', '2017-02-09 16:41:58', NULL, '125.71.36.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A', '0', 0);
INSERT INTO `t_hd` VALUES (960, 173, '首页下载', '2017-02-09 16:42:13', NULL, '125.71.36.228', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A', '0', 0);
INSERT INTO `t_hd` VALUES (961, 173, '首页下载', '2017-02-09 16:42:34', NULL, '113.108.110.26', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (962, 173, '首页下载', '2017-02-09 16:43:05', NULL, '125.71.36.228', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (963, 172, '首页点赞', '2017-02-09 16:43:17', NULL, '113.108.110.26', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (964, 173, '首页下载', '2017-02-09 16:44:21', NULL, '113.247.252.116', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2657.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (965, 173, '首页下载', '2017-02-09 16:46:13', NULL, '121.12.126.226', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (966, 172, '首页点赞', '2017-02-09 16:48:43', NULL, '218.90.129.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3000.4 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (967, 173, '首页下载', '2017-02-09 16:51:08', NULL, '121.12.126.226', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (968, 173, '首页下载', '2017-02-09 17:04:54', NULL, '124.128.36.30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (969, 173, '首页下载', '2017-02-09 17:31:29', NULL, '218.108.24.38', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (970, 173, '首页下载', '2017-02-09 22:24:42', '码云', '101.41.223.83', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (971, 173, '首页下载', '2017-02-09 22:25:14', NULL, '101.41.223.83', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (972, 173, '首页下载', '2017-02-10 00:29:58', NULL, '183.63.220.37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393', '0', 0);
INSERT INTO `t_hd` VALUES (973, 173, '首页下载', '2017-02-10 00:51:46', NULL, '117.14.154.86', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1', '0', 0);
INSERT INTO `t_hd` VALUES (974, 173, '首页下载', '2017-02-10 09:24:19', NULL, '1.202.251.202', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (975, 173, '首页下载', '2017-02-10 10:08:03', NULL, '58.49.177.209', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (976, 172, '首页点赞', '2017-02-10 10:32:42', NULL, '115.33.36.226', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (977, 173, '首页下载', '2017-02-10 10:41:48', NULL, '42.88.72.157', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (978, 173, '首页下载', '2017-02-10 10:41:52', NULL, '42.88.72.157', 'Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (979, 173, '首页下载', '2017-02-10 10:42:09', NULL, '101.226.65.105', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (980, 173, '首页下载', '2017-02-10 10:43:01', NULL, '42.88.72.157', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (981, 173, '首页下载', '2017-02-10 10:43:05', NULL, '42.88.72.157', 'Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (982, 173, '首页下载', '2017-02-10 10:44:04', '码云', '42.88.72.157', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (983, 173, '首页下载', '2017-02-10 10:44:14', '码云', '101.226.68.200', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (984, 173, '首页下载', '2017-02-10 10:45:05', '码云', '42.88.72.157', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (985, 172, '首页点赞', '2017-02-10 10:45:47', NULL, '119.137.52.233', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (986, 173, '首页下载', '2017-02-10 10:47:14', NULL, '119.137.52.233', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (987, 173, '首页下载', '2017-02-10 12:49:01', NULL, '61.183.118.232', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (988, 173, '首页下载', '2017-02-10 12:59:32', NULL, '183.15.147.222', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (989, 173, '首页下载', '2017-02-10 13:40:14', NULL, '180.173.184.33', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (990, 172, '首页点赞', '2017-02-10 13:59:06', NULL, '1.202.251.202', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (991, 173, '首页下载', '2017-02-10 14:38:13', NULL, '218.90.129.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3000.4 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (992, 173, '首页下载', '2017-02-10 14:44:44', NULL, '124.193.211.11', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (993, 172, '首页点赞', '2017-02-10 14:46:19', NULL, '124.193.211.11', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (994, 173, '首页下载', '2017-02-10 15:32:39', NULL, '61.186.204.210', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2914.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (995, 173, '首页下载', '2017-02-10 15:32:48', NULL, '101.226.65.107', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (996, 173, '首页下载', '2017-02-10 15:32:49', NULL, '180.153.214.197', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (997, 173, '首页下载', '2017-02-10 15:32:49', NULL, '180.153.214.200', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (998, 173, '首页下载', '2017-02-10 15:32:54', NULL, '101.226.66.177', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (999, 173, '首页下载', '2017-02-10 16:35:05', NULL, '119.137.53.161', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1000, 173, '首页下载', '2017-02-10 16:35:07', NULL, '119.137.53.161', 'Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1001, 173, '首页下载', '2017-02-10 16:56:19', NULL, '119.137.53.161', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1002, 173, '首页下载', '2017-02-10 16:56:23', NULL, '119.137.53.161', 'Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1003, 173, '首页下载', '2017-02-10 16:57:06', '码云', '119.137.53.161', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1004, 173, '首页下载', '2017-02-10 17:56:09', NULL, '52.86.176.3', 'ia_archiver', '0', 0);
INSERT INTO `t_hd` VALUES (1005, 173, '首页下载', '2017-02-10 19:44:29', NULL, '110.184.161.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1006, 173, '首页下载', '2017-02-10 19:47:45', NULL, '110.184.161.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1007, 173, '首页下载', '2017-02-10 19:47:53', NULL, '110.184.161.44', 'Mozilla/4.0 (compatible; MSIE 9.11; Windows NT 6.2; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.3)', '0', 0);
INSERT INTO `t_hd` VALUES (1008, 173, '首页下载', '2017-02-10 19:49:36', NULL, '110.184.161.44', 'Mozilla/4.0 (compatible; MSIE 9.11; Windows NT 6.2; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.3)', '0', 0);
INSERT INTO `t_hd` VALUES (1009, 173, '首页下载', '2017-02-10 19:49:55', '码云', '110.184.161.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1010, 173, '首页下载', '2017-02-10 20:32:56', NULL, '110.184.161.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1011, 173, '首页下载', '2017-02-10 22:42:40', NULL, '117.93.187.113', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1012, 173, '首页下载', '2017-02-11 01:34:28', NULL, '110.52.244.40', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1013, 173, '首页下载', '2017-02-11 09:53:14', '码云', '110.52.244.40', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1014, 172, '首页点赞', '2017-02-11 10:43:23', NULL, '117.73.147.133', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1015, 172, '首页点赞', '2017-02-11 11:12:04', NULL, '58.116.104.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393', '0', 0);
INSERT INTO `t_hd` VALUES (1016, 172, '首页点赞', '2017-02-11 12:02:31', NULL, '222.85.138.31', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1017, 172, '首页点赞', '2017-02-11 15:41:35', NULL, '66.249.64.83', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '0', 0);
INSERT INTO `t_hd` VALUES (1018, 173, '首页下载', '2017-02-11 17:49:44', NULL, '1.56.23.104', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1019, 173, '首页下载', '2017-02-11 21:26:00', NULL, '1.12.10.168', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1020, 172, '首页点赞', '2017-02-12 13:08:26', NULL, '39.155.186.232', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1021, 173, '首页下载', '2017-02-12 13:45:14', NULL, '119.189.177.62', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1022, 173, '首页下载', '2017-02-12 18:56:42', NULL, '118.247.200.187', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1023, 172, '首页点赞', '2017-02-12 18:58:19', NULL, '118.247.200.187', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1024, 172, '首页点赞', '2017-02-12 20:40:42', NULL, '113.154.94.26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1025, 173, '首页下载', '2017-02-12 23:16:56', NULL, '116.227.9.186', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1026, 173, '首页下载', '2017-02-13 00:42:53', NULL, '59.41.65.248', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1027, 173, '首页下载', '2017-02-13 00:43:08', NULL, '111.206.36.5', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', '0', 0);
INSERT INTO `t_hd` VALUES (1028, 173, '首页下载', '2017-02-13 02:00:28', NULL, '104.42.198.99', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)', '0', 0);
INSERT INTO `t_hd` VALUES (1029, 173, '首页下载', '2017-02-13 08:51:25', NULL, '61.133.217.150', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1030, 173, '首页下载', '2017-02-13 08:51:34', NULL, '180.153.214.180', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1031, 173, '首页下载', '2017-02-13 08:55:00', '码云', '61.133.217.150', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1032, 173, '首页下载', '2017-02-13 08:55:09', '码云', '101.226.66.191', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1033, 173, '首页下载', '2017-02-13 09:18:32', '码云', '113.247.252.116', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2657.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1034, 173, '首页下载', '2017-02-13 09:18:44', '码云', '113.247.252.116', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2657.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1035, 173, '首页下载', '2017-02-13 09:19:09', '码云', '113.247.252.116', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2657.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1036, 173, '首页下载', '2017-02-13 09:57:14', NULL, '116.231.253.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1037, 173, '首页下载', '2017-02-13 09:59:19', NULL, '119.118.227.242', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1038, 173, '首页下载', '2017-02-13 09:59:28', NULL, '101.226.66.173', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1039, 173, '首页下载', '2017-02-13 10:05:09', NULL, '113.247.252.116', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1040, 173, '首页下载', '2017-02-13 10:07:51', '码云', '113.247.252.116', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2657.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1041, 173, '首页下载', '2017-02-13 10:13:14', '码云', '113.247.252.116', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2657.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1042, 173, '首页下载', '2017-02-13 10:13:44', '码云', '113.247.252.116', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2657.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1043, 173, '首页下载', '2017-02-13 10:16:45', NULL, '61.160.96.18', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1044, 172, '首页点赞', '2017-02-13 10:17:53', NULL, '124.65.183.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1045, 173, '首页下载', '2017-02-13 10:40:08', NULL, '112.5.141.190', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1046, 173, '首页下载', '2017-02-13 10:44:06', NULL, '106.120.161.68', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1047, 173, '首页下载', '2017-02-13 10:45:20', NULL, '101.199.112.53', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1048, 173, '首页下载', '2017-02-13 10:45:20', NULL, '171.8.167.64', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1049, 173, '首页下载', '2017-02-13 10:48:16', NULL, '183.131.91.143', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.82 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1050, 172, '首页点赞', '2017-02-13 11:53:51', NULL, '61.133.217.150', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1051, 173, '首页下载', '2017-02-13 12:15:20', NULL, '61.161.237.66', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1052, 173, '首页下载', '2017-02-13 12:37:21', NULL, '180.111.233.112', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0', '0', 0);
INSERT INTO `t_hd` VALUES (1053, 173, '首页下载', '2017-02-13 14:00:34', NULL, '114.242.25.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1054, 173, '首页下载', '2017-02-13 14:09:44', NULL, '202.104.177.214', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1055, 172, '首页点赞', '2017-02-13 14:10:20', NULL, '202.104.177.214', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1056, 172, '首页点赞', '2017-02-13 14:24:42', NULL, '112.117.181.175', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2896.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1057, 173, '首页下载', '2017-02-13 17:59:56', NULL, '123.125.26.226', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1058, 172, '首页点赞', '2017-02-13 18:00:35', NULL, '123.125.26.226', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1059, 173, '首页下载', '2017-02-13 18:20:47', NULL, '117.172.27.152', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0.1 Safari/602.2.14', '0', 0);
INSERT INTO `t_hd` VALUES (1060, 173, '首页下载', '2017-02-13 18:20:56', NULL, '101.226.33.226', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1061, 173, '首页下载', '2017-02-13 20:27:09', NULL, '49.79.161.61', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1062, 173, '首页下载', '2017-02-13 20:46:17', NULL, '203.93.209.172', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1063, 173, '首页下载', '2017-02-13 21:37:01', NULL, '121.71.181.193', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1064, 173, '首页下载', '2017-02-13 21:41:18', NULL, '106.120.161.68', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1065, 173, '首页下载', '2017-02-13 21:42:23', NULL, '101.199.112.49', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1066, 173, '首页下载', '2017-02-13 21:42:23', NULL, '171.13.14.150', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1067, 173, '首页下载', '2017-02-13 21:42:26', NULL, '171.8.167.76', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1068, 173, '首页下载', '2017-02-13 21:42:26', NULL, '119.188.70.22', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1069, 173, '首页下载', '2017-02-13 21:42:29', NULL, '171.8.167.70', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1070, 173, '首页下载', '2017-02-13 23:28:09', NULL, '223.198.65.8', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.82 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1071, 173, '首页下载', '2017-02-13 23:30:08', NULL, '222.128.184.69', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1072, 173, '首页下载', '2017-02-13 23:30:17', NULL, '180.153.201.66', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1073, 172, '首页点赞', '2017-02-14 08:21:47', NULL, '60.190.58.162', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1074, 173, '首页下载', '2017-02-14 08:56:14', '码云', '58.213.119.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 1);
INSERT INTO `t_hd` VALUES (1075, 173, '首页下载', '2017-02-14 09:43:12', NULL, '119.40.48.45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1076, 173, '首页下载', '2017-02-14 09:46:24', NULL, '123.125.26.226', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1077, 172, '首页点赞', '2017-02-14 09:48:10', NULL, '114.242.25.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1078, 173, '首页下载', '2017-02-14 09:59:53', NULL, '124.235.208.38', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1079, 173, '首页下载', '2017-02-14 10:51:37', NULL, '124.115.17.98', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1080, 173, '首页下载', '2017-02-14 10:56:55', NULL, '124.115.17.98', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1081, 173, '首页下载', '2017-02-14 10:58:36', NULL, '124.115.17.98', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1082, 173, '首页下载', '2017-02-14 11:00:34', NULL, '124.115.17.98', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1083, 173, '首页下载', '2017-02-14 11:02:25', NULL, '124.115.17.98', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1084, 173, '首页下载', '2017-02-14 11:24:43', NULL, '124.161.16.164', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1085, 173, '首页下载', '2017-02-14 11:29:35', NULL, '42.91.67.123', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1086, 172, '首页点赞', '2017-02-14 11:33:33', NULL, '114.242.25.239', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1087, 173, '首页下载', '2017-02-14 12:28:08', NULL, '124.200.27.180', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1088, 172, '首页点赞', '2017-02-14 13:39:15', NULL, '111.30.23.7', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1089, 172, '首页点赞', '2017-02-14 15:09:19', NULL, '124.202.223.138', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.122 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1090, 173, '首页下载', '2017-02-14 15:11:23', NULL, '115.236.76.250', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1091, 173, '首页下载', '2017-02-14 15:12:46', NULL, '1.192.217.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1092, 173, '首页下载', '2017-02-14 15:32:35', NULL, '59.41.93.169', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1093, 173, '首页下载', '2017-02-14 17:05:35', NULL, '113.128.218.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1094, 173, '首页下载', '2017-02-14 17:05:42', NULL, '221.182.178.110', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1095, 173, '首页下载', '2017-02-14 17:09:10', NULL, '106.120.160.109', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1096, 173, '首页下载', '2017-02-14 17:12:02', NULL, '220.181.132.196', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1097, 173, '首页下载', '2017-02-14 17:12:02', NULL, '171.8.167.74', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1098, 172, '首页点赞', '2017-02-14 17:12:09', NULL, '113.128.218.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1099, 173, '首页下载', '2017-02-14 17:12:23', NULL, '171.8.167.76', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1100, 173, '首页下载', '2017-02-14 17:12:23', NULL, '182.118.20.152', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1101, 173, '首页下载', '2017-02-14 17:12:40', NULL, '223.104.227.3', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1102, 173, '首页下载', '2017-02-14 17:12:40', NULL, '182.118.20.143', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1103, 173, '首页下载', '2017-02-14 17:13:19', '码云', '113.128.218.58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1104, 173, '首页下载', '2017-02-14 17:18:58', NULL, '123.139.19.199', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1105, 173, '首页下载', '2017-02-14 17:20:10', NULL, '123.139.19.199', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1106, 173, '首页下载', '2017-02-14 17:28:30', NULL, '52.86.176.3', 'ia_archiver', '0', 0);
INSERT INTO `t_hd` VALUES (1107, 173, '首页下载', '2017-02-14 17:50:59', NULL, '125.35.51.162', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2946.0 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1108, 172, '首页点赞', '2017-02-14 17:51:11', NULL, '125.35.51.162', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2946.0 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1109, 173, '首页下载', '2017-02-14 18:04:00', NULL, '124.236.204.64', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1110, 173, '首页下载', '2017-02-14 19:56:56', NULL, '106.2.232.181', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1111, 173, '首页下载', '2017-02-15 08:19:29', NULL, '60.209.221.254', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:49.0) Gecko/20100101 Firefox/49.0', '0', 0);
INSERT INTO `t_hd` VALUES (1112, 173, '首页下载', '2017-02-15 08:58:32', NULL, '111.203.45.2', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1113, 173, '首页下载', '2017-02-15 08:58:34', NULL, '111.203.45.2', 'User-Agent	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1114, 173, '首页下载', '2017-02-15 08:58:56', NULL, '111.203.45.2', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; WOW64; Trident/7.0; .NET4.0E; .NET4.0C; .NET CLR 3.5.30729; .NET CLR 2.0.50727; .NET CLR 3.0.30729)', '0', 0);
INSERT INTO `t_hd` VALUES (1115, 173, '首页下载', '2017-02-15 10:23:54', NULL, '218.241.217.82', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1116, 173, '首页下载', '2017-02-15 10:27:14', NULL, '106.38.97.82', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1117, 172, '首页点赞', '2017-02-15 10:40:42', NULL, '115.228.25.8', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1118, 173, '首页下载', '2017-02-15 11:22:48', NULL, '119.137.93.49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1119, 173, '首页下载', '2017-02-15 11:22:57', NULL, '101.226.33.225', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1120, 173, '首页下载', '2017-02-15 11:23:57', NULL, '119.137.93.49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1121, 173, '首页下载', '2017-02-15 11:24:25', '码云', '119.137.93.49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1122, 173, '首页下载', '2017-02-15 11:24:43', '码云', '119.137.93.49', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1123, 173, '首页下载', '2017-02-15 11:37:53', '码云', '123.125.71.104', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '0', 0);
INSERT INTO `t_hd` VALUES (1124, 172, '首页点赞', '2017-02-15 11:38:51', NULL, '222.223.124.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 UBrowser/6.0.1471.813 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1125, 173, '首页下载', '2017-02-15 11:44:06', NULL, '119.139.199.219', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1126, 173, '首页下载', '2017-02-15 11:44:08', NULL, '119.139.199.219', 'User-Agent	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1127, 173, '首页下载', '2017-02-15 11:44:18', NULL, '119.139.199.219', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/6.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C; .NET4.0E; InfoPath.3)', '0', 0);
INSERT INTO `t_hd` VALUES (1128, 173, '首页下载', '2017-02-15 11:46:14', NULL, '222.223.124.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 UBrowser/6.0.1471.813 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1129, 173, '首页下载', '2017-02-15 13:52:57', NULL, '211.137.18.61', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1130, 173, '首页下载', '2017-02-15 13:56:45', NULL, '106.120.161.68', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1131, 173, '首页下载', '2017-02-15 13:57:53', NULL, '220.181.132.196', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1132, 173, '首页下载', '2017-02-15 13:57:54', NULL, '119.188.70.34', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1133, 173, '首页下载', '2017-02-15 13:57:56', NULL, '182.118.20.156', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1134, 173, '首页下载', '2017-02-15 14:26:14', NULL, '60.194.60.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1135, 172, '首页点赞', '2017-02-15 14:27:40', NULL, '61.161.175.212', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2263.400 QQBrowser/9.5.10433.400', '0', 0);
INSERT INTO `t_hd` VALUES (1136, 173, '首页下载', '2017-02-15 14:37:19', NULL, '115.156.186.36', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1137, 173, '首页下载', '2017-02-15 15:56:27', NULL, '106.38.46.26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1138, 173, '首页下载', '2017-02-15 16:35:36', NULL, '1.13.239.217', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0', '0', 0);
INSERT INTO `t_hd` VALUES (1139, 173, '首页下载', '2017-02-15 16:40:07', NULL, '111.204.35.253', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2859.0 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1140, 173, '首页下载', '2017-02-15 16:46:00', NULL, '222.209.232.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1141, 173, '首页下载', '2017-02-15 16:55:07', NULL, '111.204.35.253', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2859.0 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1142, 173, '首页下载', '2017-02-15 17:20:50', NULL, '61.144.28.109', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1143, 173, '首页下载', '2017-02-15 20:14:42', '码云', '123.186.252.53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586', '0', 0);
INSERT INTO `t_hd` VALUES (1144, 173, '首页下载', '2017-02-15 20:19:35', NULL, '115.181.78.233', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1145, 173, '首页下载', '2017-02-15 20:43:02', NULL, '36.47.18.189', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1146, 173, '首页下载', '2017-02-15 20:43:03', NULL, '36.47.18.189', 'User-Agent	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1147, 173, '首页下载', '2017-02-15 20:43:22', NULL, '36.47.18.189', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1148, 173, '首页下载', '2017-02-15 20:43:22', NULL, '36.47.18.189', 'User-Agent	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1149, 172, '首页点赞', '2017-02-15 22:41:54', NULL, '223.11.69.82', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1150, 172, '首页点赞', '2017-02-15 22:42:32', NULL, '106.2.236.155', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1151, 173, '首页下载', '2017-02-15 22:54:55', NULL, '223.11.69.82', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1152, 173, '首页下载', '2017-02-15 22:55:13', NULL, '101.226.99.197', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '0', 0);
INSERT INTO `t_hd` VALUES (1153, 173, '首页下载', '2017-02-15 23:31:30', NULL, '106.2.232.186', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1154, 173, '首页下载', '2017-02-16 03:48:33', NULL, '180.172.4.162', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0.2 Safari/602.3.12', '0', 0);
INSERT INTO `t_hd` VALUES (1155, 173, '首页下载', '2017-02-16 09:10:56', NULL, '180.169.11.246', 'Mozilla/5.0 (Windows NT 10.0.14393; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2950.5 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1156, 173, '首页下载', '2017-02-16 09:45:14', NULL, '183.15.254.116', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1157, 172, '首页点赞', '2017-02-16 09:50:04', NULL, '211.157.135.2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1158, 173, '首页下载', '2017-02-16 09:56:46', NULL, '58.16.69.226', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36 OPR/43.0.2442.806', '0', 0);
INSERT INTO `t_hd` VALUES (1159, 173, '首页下载', '2017-02-16 09:57:10', NULL, '211.157.135.2', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1160, 173, '首页下载', '2017-02-16 09:57:25', '码云', '58.16.69.226', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36 OPR/43.0.2442.806', '0', 0);
INSERT INTO `t_hd` VALUES (1161, 173, '首页下载', '2017-02-16 10:00:09', NULL, '58.16.69.226', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)', '0', 0);
INSERT INTO `t_hd` VALUES (1162, 173, '首页下载', '2017-02-16 10:01:00', '码云', '58.16.69.226', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36 OPR/43.0.2442.806', '0', 0);
INSERT INTO `t_hd` VALUES (1163, 172, '首页点赞', '2017-02-16 10:23:16', NULL, '220.173.103.116', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1164, 172, '首页点赞', '2017-02-16 10:47:48', NULL, '183.15.254.116', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1165, 172, '首页点赞', '2017-02-16 11:12:29', NULL, '123.125.26.226', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1166, 173, '首页下载', '2017-02-16 12:00:37', NULL, '106.37.198.70', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1167, 173, '首页下载', '2017-02-16 12:12:05', NULL, '104.42.198.99', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)', '0', 0);
INSERT INTO `t_hd` VALUES (1168, 173, '首页下载', '2017-02-16 12:42:36', '码云', '123.125.26.226', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1169, 173, '首页下载', '2017-02-16 13:33:11', NULL, '211.82.244.6', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1170, 173, '首页下载', '2017-02-16 13:33:30', NULL, '112.53.133.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1171, 173, '首页下载', '2017-02-16 13:46:11', NULL, '112.53.133.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1172, 173, '首页下载', '2017-02-16 13:56:46', NULL, '60.191.32.72', 'Mozilla/5.0 (Windows NT 6.1; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1173, 172, '首页点赞', '2017-02-16 14:04:31', NULL, '117.86.201.171', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1174, 172, '首页点赞', '2017-02-16 15:08:04', NULL, '119.248.180.2', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1175, 173, '首页下载', '2017-02-16 15:31:55', NULL, '220.178.7.162', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1176, 173, '首页下载', '2017-02-16 16:14:52', NULL, '124.126.148.10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1177, 173, '首页下载', '2017-02-16 16:14:53', NULL, '124.126.148.10', 'User-Agent	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1178, 173, '首页下载', '2017-02-16 16:14:56', NULL, '124.126.148.10', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C; .NET4.0E)', '0', 0);
INSERT INTO `t_hd` VALUES (1179, 173, '首页下载', '2017-02-16 16:26:12', NULL, '27.17.34.202', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1180, 173, '首页下载', '2017-02-16 16:32:25', NULL, '122.84.76.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1181, 173, '首页下载', '2017-02-16 16:32:42', NULL, '180.153.201.15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) 			Chrome/55.0.2883.95 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1182, 173, '首页下载', '2017-02-16 16:34:23', NULL, '122.84.76.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1183, 173, '首页下载', '2017-02-16 17:44:24', NULL, '116.53.211.166', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1184, 173, '首页下载', '2017-02-16 17:44:33', NULL, '101.226.68.200', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1185, 172, '首页点赞', '2017-02-16 20:20:32', NULL, '115.33.184.238', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1186, 173, '首页下载', '2017-02-16 21:03:11', NULL, '36.7.71.170', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1187, 173, '首页下载', '2017-02-16 21:07:58', NULL, '106.120.161.68', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1188, 173, '首页下载', '2017-02-16 21:09:00', NULL, '101.199.108.54', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1189, 173, '首页下载', '2017-02-16 21:09:01', NULL, '171.13.14.146', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1190, 173, '首页下载', '2017-02-16 21:09:04', NULL, '182.118.20.143', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1191, 173, '首页下载', '2017-02-16 21:09:36', NULL, '182.118.20.150', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1192, 173, '首页下载', '2017-02-16 21:09:37', NULL, '119.188.70.28', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1193, 173, '首页下载', '2017-02-17 11:16:05', NULL, '140.206.115.142', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1194, 173, '首页下载', '2017-02-17 14:04:46', NULL, '202.106.93.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240', '0', 0);
INSERT INTO `t_hd` VALUES (1195, 173, '首页下载', '2017-02-17 14:05:17', NULL, '202.106.93.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.10240', '0', 0);
INSERT INTO `t_hd` VALUES (1196, 173, '首页下载', '2017-02-17 14:07:10', NULL, '124.126.204.30', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1197, 173, '首页下载', '2017-02-17 14:09:48', NULL, '218.19.24.251', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1198, 173, '首页下载', '2017-02-17 14:39:09', NULL, '124.192.162.34', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1199, 173, '首页下载', '2017-02-17 14:39:19', NULL, '101.226.33.217', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '0', 0);
INSERT INTO `t_hd` VALUES (1200, 173, '首页下载', '2017-02-17 14:39:43', NULL, '60.191.32.72', 'Mozilla/5.0 (Windows NT 6.1; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1201, 173, '首页下载', '2017-02-17 14:45:31', NULL, '124.200.191.222', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1202, 172, '首页点赞', '2017-02-17 14:47:15', NULL, '124.200.191.222', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1203, 172, '首页点赞', '2017-02-17 14:49:07', NULL, '124.192.162.34', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1204, 173, '首页下载', '2017-02-17 15:19:35', NULL, '119.166.8.135', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1205, 173, '首页下载', '2017-02-17 15:24:58', NULL, '124.128.159.170', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1206, 173, '首页下载', '2017-02-17 15:26:36', NULL, '124.128.159.170', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1207, 173, '首页下载', '2017-02-17 15:42:39', NULL, '115.238.63.226', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1208, 172, '首页点赞', '2017-02-17 15:47:09', NULL, '218.24.93.138', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0) Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1209, 173, '首页下载', '2017-02-17 22:11:04', NULL, '180.164.197.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1210, 173, '首页下载', '2017-02-17 22:39:22', NULL, '61.131.94.139', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1211, 173, '首页下载', '2017-02-17 22:43:07', NULL, '106.120.161.68', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1212, 173, '首页下载', '2017-02-17 22:44:10', NULL, '101.199.112.52', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1213, 173, '首页下载', '2017-02-17 22:44:10', NULL, '171.8.167.70', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1214, 173, '首页下载', '2017-02-17 22:44:13', NULL, '182.118.20.157', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1215, 173, '首页下载', '2017-02-17 22:44:13', NULL, '119.188.70.32', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1216, 173, '首页下载', '2017-02-17 22:44:16', NULL, '171.13.14.145', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1217, 173, '首页下载', '2017-02-17 22:44:16', NULL, '171.8.167.61', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1218, 173, '首页下载', '2017-02-17 23:22:21', NULL, '223.166.231.90', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1219, 172, '首页点赞', '2017-02-17 23:44:45', NULL, '61.131.94.139', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1220, 173, '首页下载', '2017-02-18 10:57:23', NULL, '218.29.142.43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1221, 173, '首页下载', '2017-02-18 10:57:24', NULL, '218.29.142.43', 'User-Agent	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1222, 173, '首页下载', '2017-02-18 10:57:25', NULL, '218.29.142.43', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)', '0', 0);
INSERT INTO `t_hd` VALUES (1223, 173, '首页下载', '2017-02-18 11:02:23', NULL, '218.29.142.43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1224, 173, '首页下载', '2017-02-18 11:02:24', NULL, '218.29.142.43', 'User-Agent	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1225, 173, '首页下载', '2017-02-18 11:02:26', NULL, '218.29.142.43', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)', '0', 0);
INSERT INTO `t_hd` VALUES (1226, 173, '首页下载', '2017-02-18 11:05:54', NULL, '106.120.160.109', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1227, 173, '首页下载', '2017-02-18 11:06:58', NULL, '101.199.108.50', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1228, 173, '首页下载', '2017-02-18 11:06:58', NULL, '182.118.20.156', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1229, 173, '首页下载', '2017-02-18 11:07:00', NULL, '171.13.14.132', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1230, 173, '首页下载', '2017-02-18 11:07:01', NULL, '119.188.70.34', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1231, 173, '首页下载', '2017-02-18 12:00:54', NULL, '114.245.37.30', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1232, 173, '首页下载', '2017-02-18 15:44:11', NULL, '120.236.155.254', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1233, 173, '首页下载', '2017-02-18 15:51:06', NULL, '59.172.140.225', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.108 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1234, 173, '首页下载', '2017-02-18 16:36:05', NULL, '27.201.15.32', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1235, 173, '首页下载', '2017-02-18 16:36:19', '码云', '27.201.15.32', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1236, 173, '首页下载', '2017-02-18 18:34:20', NULL, '58.61.42.213', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1237, 173, '首页下载', '2017-02-18 21:12:03', NULL, '114.250.179.242', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1238, 173, '首页下载', '2017-02-18 21:14:07', NULL, '114.250.179.242', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1239, 173, '首页下载', '2017-02-18 21:58:23', NULL, '115.181.78.46', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1240, 173, '首页下载', '2017-02-18 21:58:40', NULL, '101.226.33.216', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) 			Chrome/55.0.2883.95 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1241, 173, '首页下载', '2017-02-18 23:41:30', NULL, '139.196.145.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1242, 173, '首页下载', '2017-02-18 23:42:12', NULL, '139.196.145.60', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; WOW64; Trident/7.0; .NET4.0E; .NET4.0C; .NET CLR 3.5.30729; .NET CLR 2.0.50727; .NET CLR 3.0.30729)', '0', 0);
INSERT INTO `t_hd` VALUES (1243, 173, '首页下载', '2017-02-18 23:43:40', '码云', '139.196.145.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1244, 173, '首页下载', '2017-02-18 23:45:09', NULL, '139.196.145.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1245, 173, '首页下载', '2017-02-19 10:04:59', NULL, '104.42.198.99', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)', '0', 0);
INSERT INTO `t_hd` VALUES (1246, 173, '首页下载', '2017-02-19 13:39:49', '码云', '68.180.231.42', 'Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)', '0', 0);
INSERT INTO `t_hd` VALUES (1247, 173, '首页下载', '2017-02-19 14:34:32', NULL, '116.226.216.197', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1248, 173, '首页下载', '2017-02-19 18:29:47', NULL, '123.120.97.206', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1249, 173, '首页下载', '2017-02-19 18:30:11', NULL, '123.120.97.206', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1250, 173, '首页下载', '2017-02-19 18:31:10', NULL, '123.120.97.206', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1251, 173, '首页下载', '2017-02-19 18:31:28', NULL, '123.120.97.206', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1252, 173, '首页下载', '2017-02-19 18:31:42', NULL, '123.120.97.206', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; .NET4.0C; .NET4.0E)', '0', 0);
INSERT INTO `t_hd` VALUES (1253, 173, '首页下载', '2017-02-19 18:31:52', NULL, '101.226.33.223', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; InfoPath.3; rv:11.0) like Gecko', '0', 0);
INSERT INTO `t_hd` VALUES (1254, 173, '首页下载', '2017-02-19 18:32:49', NULL, '123.120.97.206', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2; .NET4.0C; .NET4.0E)', '0', 0);
INSERT INTO `t_hd` VALUES (1255, 173, '首页下载', '2017-02-19 18:33:11', NULL, '123.120.97.206', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1256, 173, '首页下载', '2017-02-19 18:36:17', NULL, '125.33.120.96', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1257, 173, '首页下载', '2017-02-19 18:48:19', NULL, '183.61.163.98', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1258, 172, '首页点赞', '2017-02-19 19:17:29', NULL, '114.250.179.242', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1259, 173, '首页下载', '2017-02-19 20:35:56', NULL, '114.241.169.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '0', 0);
INSERT INTO `t_hd` VALUES (1260, 173, '首页下载', '2017-02-19 20:39:57', NULL, '114.241.169.117', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '0', 0);
INSERT INTO `t_hd` VALUES (1261, 172, '首页点赞', '2017-02-19 23:44:34', NULL, '114.250.179.242', 'Mozilla/5.0 (Linux; U; Android 7.0; zh-CN; KNT-AL20 Build/HUAWEIKNT-AL20) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/40.0.2214.89 UCBrowser/11.3.8.909 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1262, 172, '首页点赞', '2017-02-20 09:18:15', NULL, '60.1.0.130', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1263, 173, '首页下载', '2017-02-20 09:19:15', NULL, '60.1.0.130', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1264, 173, '首页下载', '2017-02-20 09:23:10', NULL, '106.120.160.109', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1265, 173, '首页下载', '2017-02-20 09:24:18', NULL, '101.199.112.54', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1266, 173, '首页下载', '2017-02-20 09:24:18', NULL, '171.13.14.150', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1267, 173, '首页下载', '2017-02-20 09:24:21', NULL, '182.118.20.144', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1268, 173, '首页下载', '2017-02-20 09:24:21', NULL, '171.8.167.71', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1269, 173, '首页下载', '2017-02-20 09:24:25', NULL, '171.8.167.64', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1270, 173, '首页下载', '2017-02-20 09:29:53', NULL, '123.52.73.44', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1271, 173, '首页下载', '2017-02-20 10:06:12', NULL, '222.209.184.239', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1272, 173, '首页下载', '2017-02-20 10:08:29', NULL, '183.69.200.232', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1273, 173, '首页下载', '2017-02-20 11:16:04', NULL, '123.139.29.245', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1274, 173, '首页下载', '2017-02-20 11:16:06', NULL, '123.139.29.245', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; WOW64; Trident/7.0; .NET4.0E; .NET4.0C; .NET CLR 3.5.30729; .NET CLR 2.0.50727; .NET CLR 3.0.30729)', '0', 0);
INSERT INTO `t_hd` VALUES (1275, 173, '首页下载', '2017-02-20 11:38:48', NULL, '202.97.156.178', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1276, 173, '首页下载', '2017-02-20 11:43:19', NULL, '218.22.24.246', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1277, 173, '首页下载', '2017-02-20 11:51:05', NULL, '218.22.24.246', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1278, 173, '首页下载', '2017-02-20 13:27:59', NULL, '61.135.18.122', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1279, 173, '首页下载', '2017-02-20 13:28:25', NULL, '101.226.51.226', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1280, 173, '首页下载', '2017-02-20 14:24:52', NULL, '58.215.221.98', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1281, 173, '首页下载', '2017-02-20 14:31:04', NULL, '221.220.225.170', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2859.0 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1282, 173, '首页下载', '2017-02-20 15:52:02', NULL, '203.192.13.164', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1283, 173, '首页下载', '2017-02-20 15:52:38', NULL, '203.192.13.164', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1284, 173, '首页下载', '2017-02-20 22:48:54', NULL, '183.206.14.254', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.108 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1285, 172, '首页点赞', '2017-02-20 23:40:09', NULL, '121.237.62.25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1286, 173, '首页下载', '2017-02-21 08:53:28', NULL, '221.8.8.251', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1287, 173, '首页下载', '2017-02-21 09:00:26', NULL, '124.128.86.98', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:48.0) Gecko/20100101 Firefox/48.0', '0', 0);
INSERT INTO `t_hd` VALUES (1288, 172, '首页点赞', '2017-02-21 09:28:29', NULL, '116.236.217.150', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1289, 173, '首页下载', '2017-02-21 10:12:55', NULL, '1.203.75.184', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1290, 173, '首页下载', '2017-02-21 11:28:56', NULL, '121.35.101.7', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1291, 172, '首页点赞', '2017-02-21 12:31:53', NULL, '223.74.131.127', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1292, 173, '首页下载', '2017-02-21 13:15:52', NULL, '121.232.41.87', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1293, 172, '首页点赞', '2017-02-21 13:56:43', NULL, '180.173.32.193', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/602.4.8 (KHTML, like Gecko) Version/10.0.3 Safari/602.4.8', '0', 0);
INSERT INTO `t_hd` VALUES (1294, 173, '首页下载', '2017-02-21 14:45:37', NULL, '119.253.58.170', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586', '0', 0);
INSERT INTO `t_hd` VALUES (1295, 173, '首页下载', '2017-02-21 15:57:50', NULL, '119.39.96.234', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1296, 173, '首页下载', '2017-02-21 16:20:57', NULL, '1.197.117.91', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1', '0', 0);
INSERT INTO `t_hd` VALUES (1297, 173, '首页下载', '2017-02-21 16:25:08', NULL, '106.120.160.109', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1298, 173, '首页下载', '2017-02-21 16:26:17', NULL, '220.181.132.199', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1299, 173, '首页下载', '2017-02-21 16:26:17', NULL, '171.8.167.65', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1300, 173, '首页下载', '2017-02-21 16:26:56', NULL, '182.118.20.152', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1301, 173, '首页下载', '2017-02-21 16:26:56', NULL, '119.188.70.23', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1302, 173, '首页下载', '2017-02-21 22:12:32', NULL, '123.123.150.235', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3013.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1303, 173, '首页下载', '2017-02-21 22:15:37', NULL, '111.206.36.17', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', '0', 0);
INSERT INTO `t_hd` VALUES (1304, 173, '首页下载', '2017-02-21 22:25:46', NULL, '180.91.132.39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1305, 172, '首页点赞', '2017-02-21 22:25:53', NULL, '180.91.132.39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1306, 173, '首页下载', '2017-02-21 23:32:32', NULL, '115.34.82.138', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Maxthon/4.4.6.2000 Chrome/30.0.1599.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1307, 173, '首页下载', '2017-02-21 23:33:58', NULL, '115.34.82.138', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Maxthon/4.4.6.2000 Chrome/30.0.1599.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1308, 173, '首页下载', '2017-02-22 00:44:11', NULL, '106.36.218.25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1309, 173, '首页下载', '2017-02-22 00:44:20', NULL, '117.185.27.113', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; InfoPath.3; rv:11.0) like Gecko', '0', 0);
INSERT INTO `t_hd` VALUES (1310, 173, '首页下载', '2017-02-22 00:44:21', NULL, '101.226.85.67', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '0', 0);
INSERT INTO `t_hd` VALUES (1311, 172, '首页点赞', '2017-02-22 10:30:04', NULL, '221.176.223.198', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/21.0.1180.89 Safari/537.1', '0', 0);
INSERT INTO `t_hd` VALUES (1312, 173, '首页下载', '2017-02-22 11:00:20', NULL, '116.21.129.135', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1313, 173, '首页下载', '2017-02-22 11:04:32', NULL, '116.21.129.135', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1314, 173, '首页下载', '2017-02-22 11:13:24', NULL, '116.21.129.135', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1315, 173, '首页下载', '2017-02-22 11:17:19', NULL, '112.91.154.2', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1316, 173, '首页下载', '2017-02-22 11:17:28', NULL, '101.226.33.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1317, 173, '首页下载', '2017-02-22 12:03:32', NULL, '175.0.129.52', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12) AppleWebKit/602.1.50 (KHTML, like Gecko) Version/10.0 Safari/602.1.50', '0', 0);
INSERT INTO `t_hd` VALUES (1318, 173, '首页下载', '2017-02-22 13:53:41', NULL, '1.180.206.206', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1319, 173, '首页下载', '2017-02-22 13:57:10', NULL, '106.120.161.68', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1320, 173, '首页下载', '2017-02-22 13:58:19', NULL, '101.199.108.57', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1321, 173, '首页下载', '2017-02-22 13:58:20', NULL, '182.118.20.143', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1322, 173, '首页下载', '2017-02-22 13:58:24', NULL, '171.13.14.152', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1323, 173, '首页下载', '2017-02-22 13:58:24', NULL, '119.188.70.32', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1324, 173, '首页下载', '2017-02-22 14:12:57', NULL, '183.67.94.44', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1325, 173, '首页下载', '2017-02-22 14:17:00', NULL, '112.64.52.137', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1326, 173, '首页下载', '2017-02-22 14:41:58', NULL, '60.194.65.154', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1327, 173, '首页下载', '2017-02-22 14:54:37', NULL, '58.246.144.98', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1328, 173, '首页下载', '2017-02-22 14:54:43', NULL, '116.247.127.202', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1329, 173, '首页下载', '2017-02-22 15:15:47', NULL, '58.42.241.116', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1330, 173, '首页下载', '2017-02-22 15:27:58', NULL, '113.44.71.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1331, 173, '首页下载', '2017-02-22 15:52:37', NULL, '1.192.167.2', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1332, 173, '首页下载', '2017-02-22 15:52:57', NULL, '180.153.206.24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1333, 173, '首页下载', '2017-02-22 15:59:51', NULL, '1.192.167.2', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1334, 173, '首页下载', '2017-02-22 16:00:00', NULL, '101.226.33.219', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1335, 173, '首页下载', '2017-02-22 16:15:40', NULL, '101.95.189.42', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1336, 173, '首页下载', '2017-02-22 16:36:10', NULL, '113.240.224.29', 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1337, 173, '首页下载', '2017-02-22 17:12:22', NULL, '112.230.79.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1338, 173, '首页下载', '2017-02-22 17:13:51', NULL, '58.250.197.10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1339, 173, '首页下载', '2017-02-22 17:14:00', NULL, '117.185.27.115', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1340, 173, '首页下载', '2017-02-22 22:00:34', NULL, '111.170.51.97', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1341, 173, '首页下载', '2017-02-23 06:24:45', NULL, '223.98.212.219', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1342, 173, '首页下载', '2017-02-23 09:32:59', NULL, '14.131.88.46', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1343, 173, '首页下载', '2017-02-23 09:58:03', NULL, '61.153.49.102', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 UBrowser/6.0.1471.914 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1344, 173, '首页下载', '2017-02-23 09:59:50', NULL, '183.16.188.87', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1345, 173, '首页下载', '2017-02-23 10:24:41', NULL, '111.121.229.211', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1346, 173, '首页下载', '2017-02-23 11:15:37', NULL, '116.226.174.25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1347, 173, '首页下载', '2017-02-23 11:31:40', NULL, '140.206.88.252', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_2 like Mac OS X) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0 Mobile/14C92 Safari/602.1', '0', 0);
INSERT INTO `t_hd` VALUES (1348, 173, '首页下载', '2017-02-23 11:44:55', NULL, '14.215.134.131', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1349, 173, '首页下载', '2017-02-23 12:04:32', NULL, '116.226.174.25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1350, 173, '首页下载', '2017-02-23 12:14:43', '码云', '116.226.174.25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1351, 173, '首页下载', '2017-02-23 14:06:18', NULL, '59.42.128.69', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1352, 173, '首页下载', '2017-02-23 14:19:17', NULL, '183.6.156.14', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1353, 172, '首页点赞', '2017-02-23 15:14:27', NULL, '222.73.24.83', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1354, 173, '首页下载', '2017-02-23 16:26:55', NULL, '118.250.72.224', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1355, 173, '首页下载', '2017-02-23 16:26:58', NULL, '118.250.72.224', 'User-Agent	Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1356, 173, '首页下载', '2017-02-23 16:27:08', NULL, '118.250.72.224', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.2; WOW64; Trident/7.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.3)', '0', 0);
INSERT INTO `t_hd` VALUES (1357, 173, '首页下载', '2017-02-23 18:27:51', NULL, '122.96.144.60', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1358, 173, '首页下载', '2017-02-23 18:31:16', NULL, '110.52.210.220', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1359, 173, '首页下载', '2017-02-23 18:52:27', NULL, '122.224.129.34', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1360, 173, '首页下载', '2017-02-23 22:05:30', NULL, '117.62.182.28', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1361, 173, '首页下载', '2017-02-23 22:06:20', NULL, '117.62.182.28', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', '0', 0);
INSERT INTO `t_hd` VALUES (1362, 172, '首页点赞', '2017-02-23 22:34:51', NULL, '117.62.182.28', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1363, 173, '首页下载', '2017-02-23 23:37:20', NULL, '112.96.145.110', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1364, 173, '首页下载', '2017-02-24 08:59:15', '码云', '183.194.73.162', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BIDUBrowser/8.4 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1365, 173, '首页下载', '2017-02-24 08:59:21', '码云', '111.206.36.132', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', '0', 0);
INSERT INTO `t_hd` VALUES (1366, 173, '首页下载', '2017-02-24 08:59:24', '码云', '101.226.99.197', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1367, 173, '首页下载', '2017-02-24 08:59:31', '码云', '183.194.73.162', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BIDUBrowser/8.4 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1368, 173, '首页下载', '2017-02-24 09:00:10', '码云', '183.194.73.162', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 BIDUBrowser/8.4 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1369, 173, '首页下载', '2017-02-24 09:17:11', NULL, '221.8.8.251', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1370, 173, '首页下载', '2017-02-24 09:44:08', '码云', '116.226.174.25', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0.1) Gecko/20100101 Firefox/5.0.1', '0', 0);
INSERT INTO `t_hd` VALUES (1371, 173, '首页下载', '2017-02-24 09:46:42', NULL, '116.226.174.25', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729)', '0', 0);
INSERT INTO `t_hd` VALUES (1372, 173, '首页下载', '2017-02-24 09:49:51', NULL, '140.207.23.253', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_2 like Mac OS X; zh-CN) AppleWebKit/537.51.1 (KHTML, like Gecko) Mobile/14C92 UCBrowser/11.4.7.931 Mobile  AliApp(TUnionSDK/0.1.12) AliApp(TUnionSDK/0.1.12)', '0', 0);
INSERT INTO `t_hd` VALUES (1373, 173, '首页下载', '2017-02-24 09:50:48', NULL, '211.95.63.212', 'Mozilla/5.0 (iPhone 5SGLOBAL; CPU iPhone OS 10_2 like Mac OS X) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0 MQQBrowser/7.2.1 Mobile/14C92 Safari/8536.25 MttCustomUA/2 QBWebViewType/1', '0', 0);
INSERT INTO `t_hd` VALUES (1374, 173, '首页下载', '2017-02-24 09:50:48', NULL, '140.207.23.253', 'Mozilla/5.0 (iPhone 5SGLOBAL; CPU iPhone OS 10_2 like Mac OS X) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0 MQQBrowser/7.2.1 Mobile/14C92 Safari/8536.25 MttCustomUA/2 QBWebViewType/1', '0', 0);
INSERT INTO `t_hd` VALUES (1375, 173, '首页下载', '2017-02-24 09:50:52', NULL, '140.207.23.253', 'MQQBrowser/7.2.1 (iOS 5SGLOBAL; U; CPU like Mac OS X; zh-cn)', '0', 0);
INSERT INTO `t_hd` VALUES (1376, 173, '首页下载', '2017-02-24 09:50:57', NULL, '180.153.214.197', 'Mozilla/5.0 (Linux; U; Android 6.0.1; zh-cn; OPPO R9s Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko)Version/4.0 Chrome/37.0.0.0 MQQBrowser/7.2 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1377, 173, '首页下载', '2017-02-24 09:59:59', '码云', '116.226.174.25', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0.1) Gecko/20100101 Firefox/5.0.1', '0', 0);
INSERT INTO `t_hd` VALUES (1378, 173, '首页下载', '2017-02-24 11:00:33', NULL, '180.168.13.34', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1379, 173, '首页下载', '2017-02-24 11:04:08', NULL, '106.120.160.109', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1380, 173, '首页下载', '2017-02-24 11:05:19', NULL, '101.199.108.58', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1381, 173, '首页下载', '2017-02-24 11:05:19', NULL, '171.13.14.149', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1382, 173, '首页下载', '2017-02-24 11:05:22', NULL, '182.118.20.152', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1383, 173, '首页下载', '2017-02-24 11:05:22', NULL, '171.13.14.131', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1384, 173, '首页下载', '2017-02-24 15:19:54', NULL, '119.51.13.103', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1385, 173, '首页下载', '2017-02-24 15:40:19', NULL, '202.180.115.228', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1386, 173, '首页下载', '2017-02-24 17:10:01', NULL, '123.124.128.18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1387, 173, '首页下载', '2017-02-24 17:12:50', NULL, '121.60.47.252', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393', '0', 0);
INSERT INTO `t_hd` VALUES (1388, 173, '首页下载', '2017-02-24 17:14:44', NULL, '111.206.36.16', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', '0', 0);
INSERT INTO `t_hd` VALUES (1389, 172, '首页点赞', '2017-02-24 18:17:49', NULL, '121.60.47.252', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2873.0 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1390, 173, '首页下载', '2017-02-24 19:00:07', '码云', '39.189.34.20', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '0', 0);
INSERT INTO `t_hd` VALUES (1391, 173, '首页下载', '2017-02-24 19:00:17', '码云', '101.226.89.123', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1392, 173, '首页下载', '2017-02-24 23:40:13', NULL, '119.39.146.140', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1393, 173, '首页下载', '2017-02-25 08:59:16', NULL, '36.250.199.96', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1394, 173, '首页下载', '2017-02-25 10:23:31', NULL, '163.125.236.28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1395, 173, '首页下载', '2017-02-25 10:26:48', NULL, '111.206.36.16', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', '0', 0);
INSERT INTO `t_hd` VALUES (1396, 173, '首页下载', '2017-02-25 11:17:30', NULL, '183.159.178.45', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1397, 173, '首页下载', '2017-02-25 11:20:43', NULL, '106.120.160.109', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1398, 173, '首页下载', '2017-02-25 11:21:44', NULL, '101.199.108.54', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1399, 173, '首页下载', '2017-02-25 11:21:44', NULL, '171.8.167.71', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1400, 173, '首页下载', '2017-02-25 11:21:47', NULL, '171.13.14.145', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1401, 173, '首页下载', '2017-02-25 11:22:20', NULL, '171.13.14.152', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1402, 173, '首页下载', '2017-02-25 11:22:20', NULL, '119.188.70.21', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1403, 173, '首页下载', '2017-02-25 13:18:18', NULL, '121.60.47.252', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2873.0 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1404, 173, '首页下载', '2017-02-25 13:36:46', NULL, '222.64.125.43', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.94 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1405, 172, '首页点赞', '2017-02-25 14:02:37', NULL, '219.130.219.175', 'Mozilla/5.0 (Windows NT 6.0; WOW64; rv:18.0) Gecko/20100101 Firefox/18.0', '0', 0);
INSERT INTO `t_hd` VALUES (1406, 172, '首页点赞', '2017-02-25 15:18:23', NULL, '221.237.113.22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1407, 173, '首页下载', '2017-02-25 15:32:00', NULL, '14.106.240.70', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1408, 172, '首页点赞', '2017-02-25 16:02:00', NULL, '14.106.240.70', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1409, 173, '首页下载', '2017-02-25 18:28:38', NULL, '119.96.223.254', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.79 Safari/537.36 Edge/14.14393', '0', 0);
INSERT INTO `t_hd` VALUES (1410, 173, '首页下载', '2017-02-25 20:08:14', NULL, '104.42.198.99', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)', '0', 0);
INSERT INTO `t_hd` VALUES (1411, 173, '首页下载', '2017-02-25 20:27:34', NULL, '183.217.45.12', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1412, 173, '首页下载', '2017-02-25 20:27:43', NULL, '101.226.33.206', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1413, 173, '首页下载', '2017-02-25 22:53:12', NULL, '114.249.30.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1414, 172, '首页点赞', '2017-02-25 22:53:50', NULL, '114.249.30.4', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1415, 172, '首页点赞', '2017-02-26 14:55:30', NULL, '36.24.17.241', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1416, 173, '首页下载', '2017-02-26 18:30:59', NULL, '14.155.16.217', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1417, 173, '首页下载', '2017-02-26 19:32:48', NULL, '39.184.133.23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/602.2.14 (KHTML, like Gecko) Version/10.0.1 Safari/602.2.14', '0', 0);
INSERT INTO `t_hd` VALUES (1418, 172, '首页点赞', '2017-02-26 20:28:13', NULL, '182.119.197.81', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1419, 173, '首页下载', '2017-02-26 22:10:12', NULL, '115.152.48.169', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1420, 173, '首页下载', '2017-02-26 22:10:18', NULL, '115.152.48.169', 'Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1421, 173, '首页下载', '2017-02-26 22:10:57', '码云', '115.152.48.169', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1422, 173, '首页下载', '2017-02-26 22:11:06', '码云', '101.226.33.225', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E; InfoPath.3; rv:11.0) like Gecko', '0', 0);
INSERT INTO `t_hd` VALUES (1423, 173, '首页下载', '2017-02-26 22:11:51', NULL, '182.150.22.19', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1424, 172, '首页点赞', '2017-02-26 23:18:47', NULL, '36.184.216.198', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1425, 173, '首页下载', '2017-02-26 23:19:06', NULL, '36.184.216.198', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1426, 173, '首页下载', '2017-02-26 23:19:15', NULL, '101.226.33.237', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1427, 173, '首页下载', '2017-02-27 00:37:05', '码云', '183.57.53.197', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_4 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13G35 QQ/6.5.3.410 V1_IPH_SQ_6.5.3_1_APP_A Pixel/750 Core/UIWebView NetType/2G Mem/117', '0', 0);
INSERT INTO `t_hd` VALUES (1428, 173, '首页下载', '2017-02-27 07:32:22', NULL, '220.114.232.123', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.108 Safari/537.36 2345Explorer/8.4.1.14855', '0', 0);
INSERT INTO `t_hd` VALUES (1429, 173, '首页下载', '2017-02-27 09:01:22', NULL, '118.26.73.233', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.22 Safari/537.36 SE 2.X MetaSr 1.0', '0', 0);
INSERT INTO `t_hd` VALUES (1430, 173, '首页下载', '2017-02-27 09:01:34', NULL, '101.226.125.111', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1431, 172, '首页点赞', '2017-02-27 09:22:28', NULL, '115.58.49.233', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1432, 173, '首页下载', '2017-02-27 10:07:20', NULL, '117.136.0.205', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1433, 173, '首页下载', '2017-02-27 10:25:59', NULL, '122.194.12.10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1434, 173, '首页下载', '2017-02-27 11:15:18', NULL, '124.116.228.0', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1435, 173, '首页下载', '2017-02-27 11:15:19', NULL, '124.116.228.0', 'Mozilla/4.0 (compatible; MSIE 9.0; qdesk 2.5.1279.201; Windows NT 6.1; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C; .NET4.0E)', '0', 0);
INSERT INTO `t_hd` VALUES (1436, 173, '首页下载', '2017-02-27 11:20:45', NULL, '115.233.219.50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1437, 173, '首页下载', '2017-02-27 11:20:54', NULL, '180.153.206.18', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1438, 173, '首页下载', '2017-02-27 12:16:16', NULL, '123.126.1.150', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1439, 173, '首页下载', '2017-02-27 14:31:34', NULL, '122.194.12.36', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1440, 173, '首页下载', '2017-02-27 14:31:55', NULL, '58.213.119.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 1);
INSERT INTO `t_hd` VALUES (1441, 173, '首页下载', '2017-02-27 14:32:54', NULL, '122.194.12.36', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1442, 173, '首页下载', '2017-02-27 14:32:59', NULL, '58.213.119.174', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '0', 1);
INSERT INTO `t_hd` VALUES (1443, 173, '首页下载', '2017-02-27 14:33:37', NULL, '58.213.119.174', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '0', 1);
INSERT INTO `t_hd` VALUES (1444, 173, '首页下载', '2017-02-27 14:36:20', NULL, '58.213.119.174', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '0', 1);
INSERT INTO `t_hd` VALUES (1445, 173, '首页下载', '2017-02-27 14:38:50', NULL, '106.120.160.109', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1446, 173, '首页下载', '2017-02-27 14:40:06', NULL, '101.199.108.118', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1447, 173, '首页下载', '2017-02-27 14:40:06', NULL, '171.13.14.131', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1448, 173, '首页下载', '2017-02-27 14:57:31', NULL, '110.90.26.31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1449, 172, '首页点赞', '2017-02-27 15:08:33', NULL, '123.139.24.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1450, 172, '首页点赞', '2017-02-27 15:30:16', NULL, '125.94.83.120', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1451, 172, '首页点赞', '2017-02-27 15:58:01', NULL, '115.60.59.4', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1452, 173, '首页下载', '2017-02-27 16:26:13', NULL, '58.59.205.249', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1453, 173, '首页下载', '2017-02-27 17:19:36', NULL, '58.211.218.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1454, 173, '首页下载', '2017-02-27 21:21:09', NULL, '60.174.212.40', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1455, 173, '首页下载', '2017-02-27 21:23:17', NULL, '60.174.212.40', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1456, 173, '首页下载', '2017-02-27 21:47:53', NULL, '115.215.43.126', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.991', '0', 0);
INSERT INTO `t_hd` VALUES (1457, 173, '首页下载', '2017-02-27 22:45:38', NULL, '118.113.89.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1458, 173, '首页下载', '2017-02-27 22:45:53', NULL, '118.113.89.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1459, 173, '首页下载', '2017-02-27 22:46:26', NULL, '118.113.89.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1460, 173, '首页下载', '2017-02-27 23:05:55', NULL, '61.166.167.112', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1461, 173, '首页下载', '2017-02-27 23:06:46', NULL, '111.206.36.143', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', '0', 0);
INSERT INTO `t_hd` VALUES (1462, 173, '首页下载', '2017-02-27 23:47:10', NULL, '182.107.45.70', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1463, 173, '首页下载', '2017-02-27 23:47:13', NULL, '182.107.45.70', 'Core/1.53.2141.400 QQBrowser/9.5.10219.400', '0', 0);
INSERT INTO `t_hd` VALUES (1464, 173, '首页下载', '2017-02-27 23:50:00', NULL, '182.107.45.70', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1465, 172, '首页点赞', '2017-02-28 00:48:54', NULL, '211.86.158.151', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1466, 173, '首页下载', '2017-02-28 09:52:06', NULL, '104.42.198.99', 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)', '0', 0);
INSERT INTO `t_hd` VALUES (1467, 173, '首页下载', '2017-02-28 10:45:47', NULL, '115.233.219.50', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1468, 173, '首页下载', '2017-02-28 11:16:29', NULL, '124.128.55.2', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1469, 173, '首页下载', '2017-02-28 11:20:31', NULL, '106.120.160.109', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0)', '0', 0);
INSERT INTO `t_hd` VALUES (1470, 173, '首页下载', '2017-02-28 11:21:45', NULL, '101.199.108.59', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1471, 173, '首页下载', '2017-02-28 11:21:45', NULL, '171.8.167.63', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1472, 173, '首页下载', '2017-02-28 11:21:48', NULL, '171.8.167.66', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1473, 173, '首页下载', '2017-02-28 11:21:49', NULL, '119.188.70.30', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1474, 173, '首页下载', '2017-02-28 11:21:52', NULL, '171.13.14.132', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1475, 173, '首页下载', '2017-02-28 11:21:53', NULL, '171.8.167.76', 'Mozilla/5.0 (Linux; U; Android 5.0.2; zh-CN; Redmi Note 3 Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 OPR/11.2.3.102637 Mobile Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1476, 172, '首页点赞', '2017-02-28 11:46:40', NULL, '123.139.18.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1477, 173, '首页下载', '2017-02-28 11:50:00', NULL, '123.139.18.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1478, 173, '首页下载', '2017-02-28 11:50:29', '码云', '123.139.18.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1479, 173, '首页下载', '2017-02-28 11:50:39', '码云', '123.139.18.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1480, 173, '首页下载', '2017-02-28 12:00:53', '码云', '59.41.62.66', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13G36 QQ/6.6.9.412 V1_IPH_SQ_6.6.9_1_APP_A Pixel/750 Core/UIWebView NetType/WIFI', '0', 0);
INSERT INTO `t_hd` VALUES (1481, 173, '首页下载', '2017-02-28 12:01:03', '码云', '101.226.79.182', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1482, 173, '首页下载', '2017-02-28 13:13:02', NULL, '211.153.11.254', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1483, 173, '首页下载', '2017-02-28 14:00:35', NULL, '121.35.100.146', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1484, 173, '首页下载', '2017-02-28 14:00:45', NULL, '101.226.33.221', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1485, 172, '首页点赞', '2017-02-28 14:11:30', NULL, '211.153.11.254', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1486, 173, '首页下载', '2017-02-28 14:44:45', NULL, '221.12.22.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1487, 173, '首页下载', '2017-02-28 14:45:06', NULL, '221.12.22.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1488, 173, '首页下载', '2017-02-28 14:45:29', '码云', '221.12.22.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1489, 173, '首页下载', '2017-02-28 14:47:09', '码云', '221.12.22.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1490, 173, '首页下载', '2017-02-28 14:48:34', '码云', '221.12.22.35', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:51.0) Gecko/20100101 Firefox/51.0', '0', 0);
INSERT INTO `t_hd` VALUES (1491, 173, '首页下载', '2017-02-28 14:54:14', NULL, '218.28.111.162', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.75 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1492, 173, '首页下载', '2017-02-28 14:54:33', NULL, '122.228.132.213', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3004.3 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1493, 173, '首页下载', '2017-02-28 15:07:39', NULL, '61.129.119.158', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1494, 173, '首页下载', '2017-02-28 15:08:39', NULL, '124.202.168.222', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1495, 173, '首页下载', '2017-02-28 15:42:27', NULL, '111.17.161.148', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1496, 169, '捐赠反馈', '2017-03-02 10:34:53', '111111', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1497, 173, '首页下载', '2017-03-02 15:42:01', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1498, 173, '首页下载', '2017-03-02 22:30:15', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1499, 173, '首页下载', '2017-03-02 22:30:35', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1500, 173, '首页下载', '2017-03-02 22:31:15', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1501, 173, '首页下载', '2017-03-02 22:31:46', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1502, 173, '首页下载', '2017-03-02 22:31:48', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1503, 173, '首页下载', '2017-03-02 22:31:50', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1504, 173, '首页下载', '2017-03-02 22:31:55', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1505, 173, '首页下载', '2017-03-02 22:32:20', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1506, 173, '首页下载', '2017-03-02 22:32:22', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1507, 173, '首页下载', '2017-03-02 22:32:24', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1508, 173, '首页下载', '2017-03-02 22:32:27', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1509, 173, '首页下载', '2017-03-02 22:32:30', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1510, 173, '首页下载', '2017-03-02 22:33:14', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1511, 173, '首页下载', '2017-03-02 22:33:24', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1512, 173, '首页下载', '2017-03-02 22:33:34', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1513, 173, '首页下载', '2017-03-02 22:34:00', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1514, 173, '首页下载', '2017-03-02 22:34:04', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1515, 173, '首页下载', '2017-03-02 22:34:08', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1516, 173, '首页下载', '2017-03-02 22:34:26', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1517, 173, '首页下载', '2017-03-07 11:13:14', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1518, 172, '首页点赞', '2017-03-07 11:13:18', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);
INSERT INTO `t_hd` VALUES (1519, 173, '首页下载', '2017-03-07 17:29:10', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '0', 0);

-- ----------------------------
-- Table structure for t_jz
-- ----------------------------
DROP TABLE IF EXISTS `t_jz`;
CREATE TABLE `t_jz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `jzr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `je` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ly` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jzrq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delf` int(11) NOT NULL DEFAULT 0,
  `bz` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_jz
-- ----------------------------
INSERT INTO `t_jz` VALUES (11, 175, 'sharvy', '6.66', '支付宝', '2016-11-23', '2016-12-14 10:09:04', '2016-12-14 10:14:20', 0, '');
INSERT INTO `t_jz` VALUES (12, 175, 'CT', '8.8', '支付宝', '2016-11-24', '2016-12-14 10:14:40', '2016-12-14 10:14:40', 0, '');
INSERT INTO `t_jz` VALUES (19, 175, '22', '22', '支付宝', '2017-02-07', '2017-02-07 16:46:29', '2017-02-07 16:46:29', 0, '');

-- ----------------------------
-- Table structure for t_kfbj
-- ----------------------------
DROP TABLE IF EXISTS `t_kfbj`;
CREATE TABLE `t_kfbj`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nr` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tu` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '缩略图',
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delf` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记（0-未删除，1-已删除）',
  `px` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `dd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地点',
  `uid` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tjpcms_usr中的id，即存储是哪个用户的数据',
  `shzt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待审核' COMMENT '审核状态（待审核、审核通过、审核不通过、退回修改）',
  `shyj` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 315 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_kfbj
-- ----------------------------
INSERT INTO `t_kfbj` VALUES (308, 165, '', '<p>完成一个先用着的开发笔记功能，界面仿的一个叫做“轮回博客”的博主的，网址<a href=\"http://ilunhui.cn/said.html\" target=\"_blank\" title=\"http://ilunhui.cn/said.html\" textvalue=\" http://ilunhui.cn/said.html \"> http://ilunhui.cn/said.html </a></p>', '/alitjp/upload/pic/2017/02/20170122160120bb7396dc58618.png', '2017-01-22 15:36:34', '2017-01-23 14:19:52', 0, 3, '江苏南京', '', '审核通过', NULL);
INSERT INTO `t_kfbj` VALUES (311, 165, '', '<p>新增可配置的视频上传(VDO)类型，并修复了前台一些显示上的小BUG</p>', '/alitjp/upload/pic/2017/02/20170122160120bb7396dc58618.png', '2017-01-23 18:43:46', '2017-01-23 18:44:59', 0, 6, '江苏南京', '', '审核通过', NULL);
INSERT INTO `t_kfbj` VALUES (312, 165, '', '<p>下面准备开发账号系统，并把畅言单点登录整合进来</p>', '/alitjp/upload/pic/2017/02/20170122160120bb7396dc58618.png', '2017-01-23 20:00:25', '2017-01-23 20:00:25', 0, 7, '江苏南京', '', '审核通过', NULL);
INSERT INTO `t_kfbj` VALUES (313, 165, '', '<p>在反复查看了畅言的开发文档后，终于弄好了畅言单点登录。很奇怪，用畅言的网站超级多吧，但是几乎没有网友的技术文档。好吧，我来写点吧，见技术分享<a href=\"/alitjp/jsfx.dhtml\" target=\"_blank\" title=\"技术分享链接\"> 技术分享链接 </a></p>', '/alitjp/upload/pic/2017/02/20170122160120bb7396dc58618.png', '2017-01-24 16:46:19', '2017-03-02 18:59:21', 0, 8, '江苏南京', '', '审核不通过', '');
INSERT INTO `t_kfbj` VALUES (314, 165, '111', '<p>222</p>', '/alitjp/upload/pic/2017/02/20170122160120bb7396dc58618.png', '2017-03-02 18:43:08', '2017-03-02 18:58:54', 0, 9, '江苏南京', 'GR_test', '审核不通过', '');

-- ----------------------------
-- Table structure for tjpcms_cfg
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_cfg`;
CREATE TABLE `tjpcms_cfg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `py` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zdb` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `val` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `kbj` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `bz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_cfg
-- ----------------------------
INSERT INTO `tjpcms_cfg` VALUES (18, 'LMNRJTH', '栏目内容静态化', '19', '动态化', '0', NULL, '2016-08-25 16:19:55', '2016-08-25 16:19:55');
INSERT INTO `tjpcms_cfg` VALUES (16, 'SYJTH', '首页静态化', '19', '动态化', '0', NULL, '2016-08-10 10:25:20', '2016-08-10 10:25:20');
INSERT INTO `tjpcms_cfg` VALUES (17, 'LMJTH', '栏目静态化', '19', '动态化', '0', NULL, '2016-08-18 09:57:44', '2017-03-07 16:42:20');
INSERT INTO `tjpcms_cfg` VALUES (14, 'WZSFJTH', '网站静态化', '19', '动态化', '0', NULL, '2016-07-19 11:28:53', '2016-07-19 11:30:14');
INSERT INTO `tjpcms_cfg` VALUES (24, 'BB', '版本', '', '3.0.170307', '0', NULL, '2016-11-09 15:02:43', '2016-11-09 15:02:43');

-- ----------------------------
-- Table structure for tjpcms_dhwb
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_dhwb`;
CREATE TABLE `tjpcms_dhwb`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 137 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_dhwb
-- ----------------------------
INSERT INTO `tjpcms_dhwb` VALUES (136, 176, '“2017，朋友们，新的一年，自由驰骋吧！”', '2017-03-02 10:05:46', '2017-03-02 10:05:46');
INSERT INTO `tjpcms_dhwb` VALUES (128, 161, '苏ICP备16055273号-1', '2016-11-04 15:37:05', '2017-03-02 10:49:40');
INSERT INTO `tjpcms_dhwb` VALUES (132, 176, '“感恩感谢！预祝大家新春快乐，身体健康，万事如意！”', '2017-02-13 12:25:19', '2017-02-13 12:25:19');

-- ----------------------------
-- Table structure for tjpcms_fwb
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_fwb`;
CREATE TABLE `tjpcms_fwb`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nr` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zy` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `cs` int(11) NOT NULL DEFAULT 0,
  `bz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_s` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_d` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 132 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_fwb
-- ----------------------------
INSERT INTO `tjpcms_fwb` VALUES (121, 149, '作者简介', '<p style=\"text-indent: 2em; line-height: 2em; margin-bottom: 15px;\"><span style=\"font-size: 18px; font-family: 幼圆, YouYuan;\">男，三十小几，<span style=\"font-family: 幼圆, YouYuan; font-size: 18px; text-indent: 32px;\">扬州人氏</span>，大学前一路坦荡、是好学生好榜样，大学时磕磕碰碰、虚度了不少光阴，工作后往复辗转、事业总不得起色，<span style=\"font-family: 幼圆, YouYuan; font-size: 18px; text-indent: 32px;\">苦笑</span>人生运势高开低走，幸得和睦家庭最视珍贵，有爱心中梦想依旧。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-size: 18px; font-family: 幼圆, YouYuan;\">近些年与cms打了不少交道，逐渐有了自己写个cms的想法并付诸了实践，希望能够给寻找Java类cms的开发者们一个更好的选择，实践咱的广告语：tjpcms - 最懂你的cms。支持我的话，首页上给我</span><a href=\"http://www.tjpcms.com\" target=\"_self\" title=\"去赞一个\" style=\"text-decoration: underline; font-size: 18px; font-family: 幼圆, YouYuan;\"><span style=\"text-decoration: underline; font-size: 18px; font-family: 幼圆, YouYuan;\">赞一个呗！</span></a></p><p style=\"text-indent: 2em; text-align: right;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">2016-11-16 blue</span><span style=\"font-size: 18px; font-family: 黑体, SimHei;\"><br/></span></p>', '', 139, '2017/01/20170123184541cbe434ce8b419.mp4', '2016-11-14 17:17:43', '2017-03-07 17:27:08', '/alitjp/jianjie.dhtml?id=121', '/alitjp/static/neirong/jianjie/121.html', 'jianjie', '');
INSERT INTO `tjpcms_fwb` VALUES (122, 147, '视频教程', '<p style=\"text-align: center;\"><span style=\"font-family: 仿宋, FangSong; font-size: 24px;\"><br/></span></p><p style=\"text-align: center; line-height: 3em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 24px;\">首页点赞10W+，分享2W+开启</span></p><p style=\"text-align: center; line-height: 3em;\"><a href=\"http://www.tjpcms.com\" target=\"_blank\" title=\"去首页点赞、分享\" style=\"text-decoration: underline; font-size: 18px; font-family: 仿宋, FangSong;\"><span style=\"font-size: 18px; font-family: 仿宋, FangSong;\">去首页点赞、分享~</span></a></p><p><br/></p>', '', 198, NULL, '2016-11-16 09:00:19', '2016-11-17 17:26:11', '/alitjp/spjc.dhtml?id=122', '/alitjp/static/neirong/spjc/122.html', 'spjc', NULL);
INSERT INTO `tjpcms_fwb` VALUES (123, 157, '留言', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 18px; font-family: 幼圆, YouYuan;\">欢迎鼓励、吐槽作者！有任何问题也可以QQ或者加群联系作者。</span></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px; font-family: 幼圆, YouYuan;\"><br/></span></p>', '', 0, NULL, '2016-11-22 14:50:38', '2016-11-22 18:10:13', '/alitjp/liuyan.dhtml?id=123', '/alitjp/static/neirong/liuyan/123.html', 'liuyan', NULL);
INSERT INTO `tjpcms_fwb` VALUES (124, 162, '申请友链', '<p style=\"text-indent: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">目前打算先宣传宣传自己，增加百度收录和排名之类。</span></p><p style=\"text-indent: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\"><br/></span></p>', '', 0, NULL, '2016-11-22 15:18:31', '2016-11-23 17:23:51', '/alitjp/sqyl.dhtml?id=124', '/alitjp/static/neirong/sqyl/124.html', 'sqyl', NULL);
INSERT INTO `tjpcms_fwb` VALUES (125, 143, '案例', '<p style=\"text-indent: 2em; line-height: 2em; margin-bottom: 10px;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">有点尴尬，目前只有作者自己的案例，算上本官网，一共3个案例，因为那两个和工作相关就不列出来。第一个案例就是tjpcms从无到有孕育产生的一个过程，当时后台要做一个友情链接的功能，因为有之前代码的底子，前后台都是copy一下改个参数说什么的，其实也很快就搞定了，但是处女座的作者总觉得这样不够简洁啊，来一个相似的功能copy一坨代码，直觉告诉我，这样不是太好，只能算是应付。于是作者先是将常用的几个后台代码封装成函数调用，这样是简洁了一些。后来我想，好像还可以更简洁啊，要不试试，说干就干，经过一番尝试，发现可以，结果符合我的预期，友情链接的最终效果如下：</span><br/></p><p style=\"line-height: 2em; text-align: center; text-indent: 0em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161122/1479801540305037551.png\" title=\"1479801540305037551.png\" alt=\"1479801540305037551.png\" width=\"888\" height=\"287\" border=\"0\" vspace=\"0\" style=\"width: 888px; height: 287px;\"/></span></p><p style=\"line-height: 2em; text-align: center; text-indent: 0em;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161122/1479801894828045212.png\" title=\"1479801894828045212.png\" alt=\"blob.png\"/></p><p style=\"text-indent: 2em; line-height: 2em; margin-bottom: 15px;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">是的，后台只要配置一下，crud的页面、功能、校验、上传等就都好了，这样就实现了当时的想法，并且在后续的使用中逐渐增加了许多接地气的功能，可以说是做一个网站完善一个版本，所以3.0绝对不是忽悠呢，亲！</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">希望能有来自网友们的案例提交给我，也算是对作者的一个支持和鼓励吧，可以在这里留言或者QQ联系等。等积累了部分案例，我会把案例这块改造一下来展示。</span></p>', '', 7, NULL, '2016-11-22 15:45:31', '2016-11-23 11:12:29', '/alitjp/anli.dhtml?id=125', '/alitjp/static/neirong/anli/125.html', 'anli', NULL);
INSERT INTO `tjpcms_fwb` VALUES (126, 159, '问答', '<p style=\"text-indent: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 20px;\">类似论坛的互动提问暂时先不开放，目前目标潜下心来把tjpcms做好。</span></p><p style=\"text-indent: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 20px;\"><br/></span></p>', '', 0, NULL, '2016-11-22 16:26:08', '2016-11-22 16:29:51', '/alitjp/wenda.dhtml?id=126', '/alitjp/static/neirong/wenda/126.html', 'wenda', NULL);
INSERT INTO `tjpcms_fwb` VALUES (128, 165, '开发笔记', '<p style=\"text-indent: 2em;\"><span style=\"font-family: 黑体, SimHei; font-size: 20px;\">暂未上线</span><br/></p>', '', 0, NULL, '2016-11-23 17:08:18', '2016-11-23 17:08:18', '/alitjp/kfbj.dhtml?id=128', '/alitjp/static/neirong/kfbj/128.html', 'kfbj', NULL);
INSERT INTO `tjpcms_fwb` VALUES (130, 163, '最近访客', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 20px; font-family: 黑体, SimHei;\">暂未上线</span></p>', '', 0, NULL, '2016-11-23 17:14:31', '2016-11-23 17:23:31', '/alitjp/zjfk.dhtml?id=130', '/alitjp/static/neirong/zjfk/130.html', 'zjfk', NULL);
INSERT INTO `tjpcms_fwb` VALUES (131, 166, 'Bug反馈', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 20px; font-family: 黑体, SimHei;\">暂未上线</span></p>', '', 0, NULL, '2016-11-23 17:14:51', '2016-11-23 17:15:00', '/alitjp/bgfk.dhtml?id=131', '/alitjp/static/neirong/bgfk/131.html', 'bgfk', NULL);

-- ----------------------------
-- Table structure for tjpcms_lanmu
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_lanmu`;
CREATE TABLE `tjpcms_lanmu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pId` int(11) NULL DEFAULT NULL,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nav` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否显示在导航栏（0-不显示，1-显示）',
  `lx` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '栏目类型，见字典表zdb',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '2级页面url',
  `url_d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_s` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '3级页面url',
  `donly2` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '否' COMMENT '2级页面是否只动态显示，设置后栏目无法静态化',
  `donly3` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '否' COMMENT '3级页面是否只动态显示，设置后栏目内容无法静态化',
  `nrtbl` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目内容存储在哪个表里',
  `px` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 185 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_lanmu
-- ----------------------------
INSERT INTO `tjpcms_lanmu` VALUES (1, NULL, '根节点', '显示', '父栏目zi', '', NULL, NULL, '', '否', '否', NULL, 0, '2016-06-16 14:25:49', '2016-06-16 14:25:49');
INSERT INTO `tjpcms_lanmu` VALUES (184, 182, '历史数据', '显示', '历史数据', '/alitjp/hisdata.dhtml', 'hisdata', '/alitjp/static/lanmu/hisdata.html', 'hisdata_detail', '否', '否', 'nb_hisdata', 3, '2018-04-11 12:21:47', '2018-04-11 14:08:10');
INSERT INTO `tjpcms_lanmu` VALUES (180, 1, '新闻', '显示', '新闻', '/alitjp/news.dhtml', 'news', '/alitjp/static/lanmu/news.html', 'news_detail', '否', '否', 'tjpcms_news', 3, '2018-04-11 12:14:06', '2018-04-11 12:14:06');
INSERT INTO `tjpcms_lanmu` VALUES (181, 1, '设备', '显示', '设备', '/alitjp/equip.dhtml', 'equip', '/alitjp/static/lanmu/equip.html', 'equip_detail', '否', '否', 'nb_equip', 4, '2018-04-11 12:18:38', '2018-04-11 12:19:02');
INSERT INTO `tjpcms_lanmu` VALUES (182, 1, '数据', '显示', '父栏目nr', '', '', '', '', '否', '否', '', 2, '2018-04-11 12:19:40', '2018-04-11 12:20:14');
INSERT INTO `tjpcms_lanmu` VALUES (183, 182, '最新数据', '显示', '数据', '/alitjp/newdata.dhtml', 'newdata', '/alitjp/static/lanmu/newdata.html', 'newdata_detail', '否', '否', 'nb_data', 1, '2018-04-11 12:21:16', '2018-04-11 12:21:16');

-- ----------------------------
-- Table structure for tjpcms_log
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_log`;
CREATE TABLE `tjpcms_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lx` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bz` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 361 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tjpcms_news
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_news`;
CREATE TABLE `tjpcms_news`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nr` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zy` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `tu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `gjc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zz` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `cs` int(11) NOT NULL DEFAULT 0,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delf` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记（0-未删除，1-已删除）',
  `px` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `bz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_s` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tjpcms_usr中的id，即存储是哪个用户的数据',
  `shzt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待审核' COMMENT '审核状态（待审核、审核通过、审核不通过、退回修改）',
  `shyj` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `STR1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 327 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_news
-- ----------------------------
INSERT INTO `tjpcms_news` VALUES (323, 180, '习近平与海南跨越40年的深情故事', '<p>新增新闻新增新闻</p>', '2018年4月13日，海南省迎来了30岁生日。30年前，1988年4月13日，习仲勋作为大会执行主席，主持了七届全国人大一次会议闭幕会。这次大会决定设立海南省，建立海南经济特区。', '', '', NULL, 0, '2018-04-12 13:57:08', '2018-04-14 23:08:15', 0, 1, '', '/alitjp/news_detail.dhtml?id=323', NULL, 'news_detail', 'test', '审核通过', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tjpcms_news` VALUES (324, 180, '习近平：以更高站位更宽视野推进改革开放', '<p>习近平：以更高站位更宽视野推进改革开放</p>', '中共中央总书记、国家主席、中央军委主席习近平近日在海南考察时强调，全面贯彻党的十九大和十九届二中、三中全会精神，统筹推进“五位一体”', '', '', NULL, 0, '2018-04-14 23:08:56', '2018-04-14 23:14:58', 0, 2, '', '/alitjp/news_detail.dhtml?id=324', NULL, 'news_detail', 'test', '审核通过', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tjpcms_news` VALUES (325, 180, '特朗普宣布对叙进行精准军事打击', '<p><span style=\"font-family: 微软雅黑; font-size: medium; background-color: rgb(248, 248, 248);\">美国总统特朗普13日晚宣布，已下令美军联合英国、法国对叙利亚军事设施进行“精准打击”，以作为对日前叙东古塔地区发生“化学武器袭击”的回应。</span></p>', '美国总统特朗普13日晚宣布，已下令美军联合英国、法国对叙利亚军事设施进行“精准打击”，以作为对日前叙东古塔地区发生“化学武器袭击”的回应。', '', '', NULL, 0, '2018-04-14 23:09:38', '2018-04-14 23:09:38', 0, 3, '', '/alitjp/news_detail.dhtml?id=325', NULL, 'news_detail', 'test', '审核通过', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tjpcms_news` VALUES (326, 180, '普京：美国及其盟友军事打击叙利亚是侵略行为', '<p><span style=\"color: rgb(64, 64, 64); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;Microsoft YaHei&quot;, å¾®è½¯é›…é»‘, STHeitiSC-Light, simsun, å®‹ä½“, &quot;WenQuanYi Zen Hei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 18px;\">俄罗斯总统普京１４日表示，美国及其盟友对叙利亚进行军事打击是侵略行为，俄罗斯对此予以强烈谴责。</span></p>', '俄罗斯总统普京１４日表示，美国及其盟友对叙利亚进行军事打击是侵略行为，俄罗斯对此予以强烈谴责。', '', '', NULL, 0, '2018-04-14 23:10:10', '2018-04-14 23:10:10', 0, 4, '', '/alitjp/news_detail.dhtml?id=326', NULL, 'news_detail', 'test', '审核通过', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tjpcms_pic
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_pic`;
CREATE TABLE `tjpcms_pic`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nr` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delf` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记（0-未删除，1-已删除）',
  `px` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `bz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_s` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 305 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tjpcms_tywz
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_tywz`;
CREATE TABLE `tjpcms_tywz`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nr` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zy` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `tu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `gjc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zz` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `cs` int(11) NOT NULL DEFAULT 0,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delf` int(11) NOT NULL DEFAULT 0 COMMENT '删除标记（0-未删除，1-已删除）',
  `px` int(11) UNSIGNED NOT NULL DEFAULT 1,
  `bz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_s` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url_d` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tjpcms_usr中的id，即存储是哪个用户的数据',
  `shzt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '待审核' COMMENT '审核状态（待审核、审核通过、审核不通过、退回修改）',
  `shyj` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `STR1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR7` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STR8` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 323 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for tjpcms_yqlj
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_yqlj`;
CREATE TABLE `tjpcms_yqlj`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `px` int(11) NOT NULL DEFAULT 1,
  `gx` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cs` int(11) NOT NULL DEFAULT 0 COMMENT '点击次数',
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_yqlj
-- ----------------------------
INSERT INTO `tjpcms_yqlj` VALUES (57, '拼图Pintuer', 'http://www.pintuer.com/', '', 1, '2016-11-01 10:59:26', 0, '2016-11-01 10:52:38');
INSERT INTO `tjpcms_yqlj` VALUES (58, 'LigerUI', 'http://www.ligerui.com/', '', 2, '2016-11-01 10:59:32', 0, '2016-11-01 10:53:31');
INSERT INTO `tjpcms_yqlj` VALUES (59, 'Iconfont', 'http://www.iconfont.cn/plus', '', 3, '2016-11-01 10:59:36', 0, '2016-11-01 10:54:42');
INSERT INTO `tjpcms_yqlj` VALUES (60, 'PublicCMS', 'http://www.publiccms.com/', '', 4, '2017-02-27 11:43:27', 0, '2016-11-01 10:55:48');
INSERT INTO `tjpcms_yqlj` VALUES (61, 'JEECMS', 'http://www.jeecms.com/', '', 5, '2017-02-27 11:43:24', 0, '2016-11-01 10:56:20');
INSERT INTO `tjpcms_yqlj` VALUES (62, '织梦CMS', 'http://www.dedecms.com/', '', 6, '2017-02-27 11:43:21', 0, '2016-11-01 10:57:07');
INSERT INTO `tjpcms_yqlj` VALUES (63, 'Layui', 'http://www.layui.com/', '', 7, '2017-02-27 11:43:18', 0, '2016-11-01 10:59:01');

-- ----------------------------
-- Table structure for tjpcms_yqlj_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_yqlj_copy1`;
CREATE TABLE `tjpcms_yqlj_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `wz` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `px` int(11) NOT NULL DEFAULT 1,
  `gx` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cs` int(11) NOT NULL DEFAULT 0 COMMENT '点击次数',
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_yqlj_copy1
-- ----------------------------
INSERT INTO `tjpcms_yqlj_copy1` VALUES (57, '拼图Pintuer', 'http://www.pintuer.com/', '', 1, '2016-11-01 10:59:26', 0, '2016-11-01 10:52:38');
INSERT INTO `tjpcms_yqlj_copy1` VALUES (58, 'LigerUI', 'http://www.ligerui.com/', '', 2, '2016-11-01 10:59:32', 0, '2016-11-01 10:53:31');
INSERT INTO `tjpcms_yqlj_copy1` VALUES (59, 'Iconfont', 'http://www.iconfont.cn/plus', '', 3, '2016-11-01 10:59:36', 0, '2016-11-01 10:54:42');
INSERT INTO `tjpcms_yqlj_copy1` VALUES (60, 'PublicCMS', 'http://www.publiccms.com/', '', 4, '2017-02-27 11:43:27', 0, '2016-11-01 10:55:48');
INSERT INTO `tjpcms_yqlj_copy1` VALUES (61, 'JEECMS', 'http://www.jeecms.com/', '', 5, '2017-02-27 11:43:24', 0, '2016-11-01 10:56:20');
INSERT INTO `tjpcms_yqlj_copy1` VALUES (62, '织梦CMS', 'http://www.dedecms.com/', '', 6, '2017-02-27 11:43:21', 0, '2016-11-01 10:57:07');
INSERT INTO `tjpcms_yqlj_copy1` VALUES (63, 'Layui', 'http://www.layui.com/', '', 7, '2017-02-27 11:43:18', 0, '2016-11-01 10:59:01');
INSERT INTO `tjpcms_yqlj_copy1` VALUES (65, 'nku', 'http://www.baidu.com', '', 8, '2018-04-09 13:26:33', 0, '2018-04-09 13:26:33');

-- ----------------------------
-- Table structure for tjpcms_zdb
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_zdb`;
CREATE TABLE `tjpcms_zdb`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `py` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `px` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_zdb
-- ----------------------------
INSERT INTO `tjpcms_zdb` VALUES (4, '栏目类型', 'lanmuleixing', '2016-06-16 17:16:23', '2017-02-04 10:55:26', 99);
INSERT INTO `tjpcms_zdb` VALUES (8, '江苏省地级市', 'jsdijishi', '2016-06-22 18:04:34', '2016-06-22 18:04:34', 3);
INSERT INTO `tjpcms_zdb` VALUES (9, '导航栏显示', 'navxs', '2016-06-23 14:46:01', '2016-06-23 15:40:37', 4);
INSERT INTO `tjpcms_zdb` VALUES (11, '是否', 'shifou', '2016-06-30 10:49:47', '2016-06-30 10:49:47', 6);
INSERT INTO `tjpcms_zdb` VALUES (12, '是不是', 'shibushi', '2016-06-30 17:31:57', '2016-06-30 17:31:57', 7);
INSERT INTO `tjpcms_zdb` VALUES (22, '文章审核状态', 'wzshzt', '2016-07-20 14:42:43', '2016-07-20 14:42:53', 13);
INSERT INTO `tjpcms_zdb` VALUES (25, '否是', 'foushi', '2016-09-14 16:15:52', '2016-09-14 16:15:52', 16);
INSERT INTO `tjpcms_zdb` VALUES (27, '捐赠来源', 'juanzenglaiyuan', '2016-12-14 09:52:08', '2016-12-14 09:52:08', 17);

-- ----------------------------
-- Table structure for tjpcms_zdx
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_zdx`;
CREATE TABLE `tjpcms_zdx`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `zdxmc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zdxpy` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典项拼音',
  `zdxval` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bz` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rq` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gx` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `px` int(11) NOT NULL,
  `sys` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否系统预置字段',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tjpcms_zdx
-- ----------------------------
INSERT INTO `tjpcms_zdx` VALUES (11, 4, '单行文本（变量型）', 'danhangwenben', '单行文本（变量型）', '只能有一条当行文本的记录，类似单个变量', '2016-06-21 20:07:05', '2017-02-04 15:26:21', 28, '1');
INSERT INTO `tjpcms_zdx` VALUES (10, 4, '富文本', 'fuwenben', '富文本', NULL, '2016-06-21 20:06:56', '2016-06-21 20:06:56', 29, '1');
INSERT INTO `tjpcms_zdx` VALUES (13, 4, '外部链接', 'waibulianjie', '外部链接', NULL, '2016-06-22 09:00:44', '2016-06-22 09:00:44', 24, '1');
INSERT INTO `tjpcms_zdx` VALUES (14, 4, '父栏目zi', 'fulanmu_zi', '父栏目zi', '栏目树中点击后后是显示的是直接子栏目列表', '2016-06-22 09:33:24', '2016-11-25 12:51:28', 25, '1');
INSERT INTO `tjpcms_zdx` VALUES (15, 4, '父栏目nr', 'fulanmu_nr', '父栏目nr', '栏目树中点击后显示的是所有子栏目的内容列表', '2016-06-22 14:12:22', '2016-11-25 12:51:20', 26, '1');
INSERT INTO `tjpcms_zdx` VALUES (21, 8, '南京市', 'nanjingshi', '南京市', '', '2016-06-22 18:04:44', '2016-06-22 18:04:44', 13, '0');
INSERT INTO `tjpcms_zdx` VALUES (22, 8, '无锡市', 'wuxishi', '无锡市', '', '2016-06-22 18:05:03', '2016-06-22 18:05:03', 14, '0');
INSERT INTO `tjpcms_zdx` VALUES (23, 8, '徐州市', 'xuzhoushi', '徐州市', '', '2016-06-22 18:05:09', '2016-06-22 18:05:09', 15, '0');
INSERT INTO `tjpcms_zdx` VALUES (24, 8, '常州市', 'changzhoushi', '常州市', '', '2016-06-22 18:05:18', '2016-06-22 18:05:18', 16, '0');
INSERT INTO `tjpcms_zdx` VALUES (25, 8, '苏州市', 'suzhoushi', '苏州市', '', '2016-06-22 18:05:24', '2016-06-22 18:05:24', 17, '0');
INSERT INTO `tjpcms_zdx` VALUES (26, 8, '南通市', 'nantongshi', '南通市', '', '2016-06-22 18:05:30', '2016-06-22 18:05:30', 18, '0');
INSERT INTO `tjpcms_zdx` VALUES (27, 8, '连云港市', 'lianyungangshi', '连云港市', '', '2016-06-22 18:05:35', '2016-06-22 18:05:35', 19, '0');
INSERT INTO `tjpcms_zdx` VALUES (28, 8, '淮安市', 'huaianshi', '淮安市', '', '2016-06-22 18:05:39', '2016-06-22 18:05:39', 20, '0');
INSERT INTO `tjpcms_zdx` VALUES (29, 8, '盐城市', 'yanchengshi', '盐城市', '', '2016-06-22 18:05:44', '2016-06-22 18:05:44', 21, '0');
INSERT INTO `tjpcms_zdx` VALUES (30, 8, '扬州市', 'yangzhoushi', '扬州市', '', '2016-06-22 18:05:49', '2016-06-22 18:05:49', 22, '0');
INSERT INTO `tjpcms_zdx` VALUES (31, 8, '镇江市', 'zhenjiangshi', '镇江市', '', '2016-06-22 18:05:54', '2016-06-22 18:05:54', 23, '0');
INSERT INTO `tjpcms_zdx` VALUES (32, 8, '泰州市', 'taizhoushi', '泰州市', '', '2016-06-22 18:05:59', '2016-06-22 18:05:59', 24, '0');
INSERT INTO `tjpcms_zdx` VALUES (33, 8, '宿迁市', 'suqianshi', '宿迁市', '', '2016-06-22 18:06:15', '2016-06-22 18:06:15', 25, '0');
INSERT INTO `tjpcms_zdx` VALUES (34, 9, '显示', 'xianshi', '显示', '', '2016-06-23 14:46:12', '2017-02-06 10:42:23', 26, '0');
INSERT INTO `tjpcms_zdx` VALUES (35, 9, '不显示', 'buxianshi', '不显示', '', '2016-06-23 14:46:18', '2017-02-06 10:42:18', 27, '0');
INSERT INTO `tjpcms_zdx` VALUES (42, 11, '是', 'shi', '是', '', '2016-06-30 10:49:54', '2016-06-30 10:49:54', 32, '0');
INSERT INTO `tjpcms_zdx` VALUES (43, 11, '否', 'fou', '否', '', '2016-06-30 10:50:02', '2016-06-30 10:50:02', 33, '0');
INSERT INTO `tjpcms_zdx` VALUES (44, 12, '是', 'shi', '1', '', '2016-06-30 17:32:05', '2017-02-04 17:42:35', 34, '0');
INSERT INTO `tjpcms_zdx` VALUES (45, 12, '不是', 'bushi', '0', '', '2016-06-30 17:32:10', '2017-02-04 17:42:46', 35, '0');
INSERT INTO `tjpcms_zdx` VALUES (50, 4, '图片类', 'tupianlei', '图片类', '', '2016-07-12 10:41:59', '2016-07-12 10:41:59', 22, '1');
INSERT INTO `tjpcms_zdx` VALUES (95, 4, '留言', 'liuyan', '留言', '', '2016-11-04 09:54:47', '2016-11-04 09:54:47', 74, '0');
INSERT INTO `tjpcms_zdx` VALUES (88, 4, '互动', 'hudong', '互动', '', '2016-11-01 10:38:09', '2016-11-01 10:38:09', 70, '0');
INSERT INTO `tjpcms_zdx` VALUES (96, 4, '只显示', 'zhixianshi', '只显示', '', '2016-11-04 10:00:15', '2016-11-04 10:00:15', 23, '1');
INSERT INTO `tjpcms_zdx` VALUES (90, 4, '捐赠', 'juanzeng', '捐赠', '', '2016-11-01 11:30:07', '2016-11-01 11:30:07', 72, '0');
INSERT INTO `tjpcms_zdx` VALUES (97, 4, '问答', 'wenda', '问答', '', '2016-11-04 11:57:47', '2016-11-04 11:57:47', 76, '0');
INSERT INTO `tjpcms_zdx` VALUES (92, 4, '通用文章', 'tywz', '通用文章', '包含标题，摘要，图片，内容和备注等', '2016-11-01 15:06:17', '2016-11-25 12:50:53', 30, '1');
INSERT INTO `tjpcms_zdx` VALUES (93, 4, '图文教程', 'tuwenjiaocheng', '图文教程', '', '2016-11-01 15:12:59', '2016-11-01 15:12:59', 73, '0');
INSERT INTO `tjpcms_zdx` VALUES (69, 22, '待审核', 'daishenhe', '待审核', '', '2016-07-20 14:43:03', '2016-07-20 15:33:48', 55, '0');
INSERT INTO `tjpcms_zdx` VALUES (70, 22, '审核通过', 'yishenhe', '审核通过', '', '2016-07-20 14:43:09', '2016-07-20 14:49:32', 56, '0');
INSERT INTO `tjpcms_zdx` VALUES (71, 22, '审核不通过', 'butongyi', '审核不通过', '', '2016-07-20 14:47:31', '2016-07-20 14:49:37', 57, '0');
INSERT INTO `tjpcms_zdx` VALUES (72, 22, '退回修改', 'tuihuixiugai', '退回修改', '', '2016-07-20 14:51:57', '2016-07-20 14:51:57', 58, '0');
INSERT INTO `tjpcms_zdx` VALUES (80, 25, '否', 'fou', '否', '', '2016-09-14 16:15:58', '2016-09-14 16:15:58', 66, '0');
INSERT INTO `tjpcms_zdx` VALUES (81, 25, '是', 'shi', '是', '', '2016-09-14 16:16:03', '2016-09-14 16:16:03', 67, '0');
INSERT INTO `tjpcms_zdx` VALUES (98, 27, '支付宝', 'zhifubao', '支付宝', '', '2016-12-14 09:53:18', '2016-12-14 09:53:18', 77, '0');
INSERT INTO `tjpcms_zdx` VALUES (99, 27, '微信支付', 'weixinzhifu', '微信支付', '', '2016-12-14 09:53:24', '2016-12-14 09:53:24', 78, '0');
INSERT INTO `tjpcms_zdx` VALUES (100, 4, '网站互动信息', 'wzhdxx', '网站互动信息', '', '2016-12-14 17:34:20', '2016-12-15 09:50:26', 79, '0');
INSERT INTO `tjpcms_zdx` VALUES (101, 4, '大事记', 'dashiji', '大事记', '', '2017-01-09 16:43:14', '2017-01-09 16:43:14', 80, '0');
INSERT INTO `tjpcms_zdx` VALUES (102, 4, '开发笔记', 'kaifabiji', '开发笔记', '', '2017-01-22 10:36:49', '2017-01-22 10:36:49', 81, '0');
INSERT INTO `tjpcms_zdx` VALUES (103, 4, '单行文本（列表型）', 'dhwblbx', '单行文本（列表型）', '可以有多条单行文本的记录，形成列表', '2017-02-03 17:10:31', '2017-02-04 15:25:52', 27, '1');
INSERT INTO `tjpcms_zdx` VALUES (104, 4, '新闻', 'news', '新闻', '包含标题，摘要，图片，内容和备注等', '2016-11-01 15:06:17', '2016-11-25 12:50:53', 30, '1');
INSERT INTO `tjpcms_zdx` VALUES (105, 4, '设备', 'equip', '设备', '包含标题，摘要，图片，内容和备注等', '2016-11-01 15:06:17', '2016-11-25 12:50:53', 30, '1');
INSERT INTO `tjpcms_zdx` VALUES (106, 4, '数据', 'data', '数据', '包含标题，摘要，图片，内容和备注等', '2016-11-01 15:06:17', '2016-11-25 12:50:53', 30, '1');
INSERT INTO `tjpcms_zdx` VALUES (107, 4, '历史数据', 'hisdata', '历史数据', '包含标题，摘要，图片，内容和备注等', '2016-11-01 15:06:17', '2016-11-25 12:50:53', 30, '1');

SET FOREIGN_KEY_CHECKS = 1;

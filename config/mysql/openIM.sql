/*
 Navicat Premium Dump SQL

 Source Server         : openim-local
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : localhost:13306
 Source Schema         : openIM

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 19/05/2025 17:08:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `BLOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `SCHED_NAME`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('CoolScheduler', 'TASK_1', 'DEFAULT', '0 0 1 * * ?', 'UTC');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `ENTRY_ID`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TRIG_INST_NAME`(`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY`(`SCHED_NAME`, `INSTANCE_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_FT_J_G`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_T_G`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_FT_TG`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_J_REQ_RECOVERY`(`SCHED_NAME`, `REQUESTS_RECOVERY`) USING BTREE,
  INDEX `IDX_QRTZ_J_GRP`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('CoolScheduler', 'TASK_1', 'DEFAULT', NULL, 'com.cool.modules.task.run.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `LOCK_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('CoolScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('CoolScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `INSTANCE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('CoolScheduler', 'af0f0e9232af1747636522159', 1747645684749, 10000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `INT_PROP_1` int(11) NULL DEFAULT NULL,
  `INT_PROP_2` int(11) NULL DEFAULT NULL,
  `LONG_PROP_1` bigint(20) NULL DEFAULT NULL,
  `LONG_PROP_2` bigint(20) NULL DEFAULT NULL,
  `DEC_PROP_1` decimal(13, 4) NULL DEFAULT NULL,
  `DEC_PROP_2` decimal(13, 4) NULL DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) NULL DEFAULT NULL,
  `PRIORITY` int(11) NULL DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) NULL DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) NULL DEFAULT NULL,
  `JOB_DATA` blob NULL,
  PRIMARY KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_J`(`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_JG`(`SCHED_NAME`, `JOB_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_C`(`SCHED_NAME`, `CALENDAR_NAME`) USING BTREE,
  INDEX `IDX_QRTZ_T_G`(`SCHED_NAME`, `TRIGGER_GROUP`) USING BTREE,
  INDEX `IDX_QRTZ_T_STATE`(`SCHED_NAME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_STATE`(`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_N_G_STATE`(`SCHED_NAME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NEXT_FIRE_TIME`(`SCHED_NAME`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST`(`SCHED_NAME`, `TRIGGER_STATE`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_STATE`) USING BTREE,
  INDEX `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP`(`SCHED_NAME`, `MISFIRE_INSTR`, `NEXT_FIRE_TIME`, `TRIGGER_GROUP`, `TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('CoolScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1747702800000, -1, 5, 'WAITING', 'CRON', 1747636523000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for base_sys_conf
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_conf`;
CREATE TABLE `base_sys_conf`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `c_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置键',
  `c_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auto_idx_base_sys_conf_c_key`(`c_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_conf
-- ----------------------------
INSERT INTO `base_sys_conf` VALUES (1, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 'logKeep', '31');
INSERT INTO `base_sys_conf` VALUES (2, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 'recycleKeep', '31');
INSERT INTO `base_sys_conf` VALUES (3, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 'db_base.json', 'success');
INSERT INTO `base_sys_conf` VALUES (4, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 'menu_menu.json', 'success');
INSERT INTO `base_sys_conf` VALUES (5, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 'menu_menu_8.0.json', 'success');
INSERT INTO `base_sys_conf` VALUES (6, '2025-05-19 15:25:56', '2025-05-19 15:25:56', 'JWT_SECRET_TOKEN', 'c26e35da4b6440369f73d21d69c67f2d');
INSERT INTO `base_sys_conf` VALUES (7, '2025-05-19 15:25:57', '2025-05-19 15:25:57', 'JWT_SECRET_REFRESH_TOKEN', '5a55efbddd254b05a0960afd32ff3c27');

-- ----------------------------
-- Table structure for base_sys_department
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_department`;
CREATE TABLE `base_sys_department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级部门ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_department
-- ----------------------------
INSERT INTO `base_sys_department` VALUES (1, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 'COOL', NULL, 0);
INSERT INTO `base_sys_department` VALUES (11, '2025-05-19 11:41:59', '2025-05-19 11:41:59', '开发', 12, 2);
INSERT INTO `base_sys_department` VALUES (12, '2025-05-19 11:41:59', '2025-05-19 11:41:59', '测试', 1, 1);
INSERT INTO `base_sys_department` VALUES (13, '2025-05-19 11:41:59', '2025-05-19 11:41:59', '游客', 1, 3);

-- ----------------------------
-- Table structure for base_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_log`;
CREATE TABLE `base_sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `action` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行为',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `params` json NULL COMMENT '参数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_idx_base_sys_log_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_log
-- ----------------------------
INSERT INTO `base_sys_log` VALUES (1, '2025-05-19 13:44:32', '2025-05-19 13:44:32', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (2, '2025-05-19 13:52:19', '2025-05-19 13:52:19', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (3, '2025-05-19 13:52:37', '2025-05-19 13:52:37', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (4, '2025-05-19 13:52:41', '2025-05-19 13:52:41', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (5, '2025-05-19 13:52:42', '2025-05-19 13:52:42', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (6, '2025-05-19 13:52:45', '2025-05-19 13:52:45', NULL, '/admin/base/open/refreshToken', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (7, '2025-05-19 13:52:45', '2025-05-19 13:52:45', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (8, '2025-05-19 13:52:45', '2025-05-19 13:52:45', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (9, '2025-05-19 13:52:46', '2025-05-19 13:52:46', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (10, '2025-05-19 13:57:15', '2025-05-19 13:57:15', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (11, '2025-05-19 13:57:15', '2025-05-19 13:57:15', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (12, '2025-05-19 13:57:15', '2025-05-19 13:57:15', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (13, '2025-05-19 13:57:15', '2025-05-19 13:57:15', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (14, '2025-05-19 13:57:16', '2025-05-19 13:57:16', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (15, '2025-05-19 13:57:16', '2025-05-19 13:57:16', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (16, '2025-05-19 13:57:16', '2025-05-19 13:57:16', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (17, '2025-05-19 13:57:18', '2025-05-19 13:57:18', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (18, '2025-05-19 13:57:18', '2025-05-19 13:57:18', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (19, '2025-05-19 13:57:18', '2025-05-19 13:57:18', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (20, '2025-05-19 13:57:18', '2025-05-19 13:57:18', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (21, '2025-05-19 13:57:18', '2025-05-19 13:57:18', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (22, '2025-05-19 13:57:27', '2025-05-19 13:57:27', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (23, '2025-05-19 13:57:27', '2025-05-19 13:57:27', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (24, '2025-05-19 13:57:27', '2025-05-19 13:57:27', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (25, '2025-05-19 13:57:28', '2025-05-19 13:57:28', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (26, '2025-05-19 13:57:30', '2025-05-19 13:57:30', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (27, '2025-05-19 13:57:30', '2025-05-19 13:57:30', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (28, '2025-05-19 13:57:30', '2025-05-19 13:57:30', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (29, '2025-05-19 13:57:50', '2025-05-19 13:57:50', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (30, '2025-05-19 13:57:50', '2025-05-19 13:57:50', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (31, '2025-05-19 13:57:50', '2025-05-19 13:57:50', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (32, '2025-05-19 13:57:50', '2025-05-19 13:57:50', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (33, '2025-05-19 13:57:51', '2025-05-19 13:57:51', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (34, '2025-05-19 13:57:51', '2025-05-19 13:57:51', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (35, '2025-05-19 13:57:51', '2025-05-19 13:57:51', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (36, '2025-05-19 13:57:59', '2025-05-19 13:57:59', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (37, '2025-05-19 13:57:59', '2025-05-19 13:57:59', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (38, '2025-05-19 13:58:00', '2025-05-19 13:58:00', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (39, '2025-05-19 13:58:00', '2025-05-19 13:58:00', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (40, '2025-05-19 13:58:00', '2025-05-19 13:58:00', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (41, '2025-05-19 13:58:00', '2025-05-19 13:58:00', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (42, '2025-05-19 13:58:00', '2025-05-19 13:58:00', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (43, '2025-05-19 13:58:18', '2025-05-19 13:58:18', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (44, '2025-05-19 13:58:33', '2025-05-19 13:58:33', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (45, '2025-05-19 13:58:34', '2025-05-19 13:58:34', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (46, '2025-05-19 13:58:35', '2025-05-19 13:58:35', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (47, '2025-05-19 13:58:49', '2025-05-19 13:58:49', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (48, '2025-05-19 13:58:49', '2025-05-19 13:58:49', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (49, '2025-05-19 13:58:50', '2025-05-19 13:58:50', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (50, '2025-05-19 13:58:50', '2025-05-19 13:58:50', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (51, '2025-05-19 13:58:51', '2025-05-19 13:58:51', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (52, '2025-05-19 13:58:51', '2025-05-19 13:58:51', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (53, '2025-05-19 13:58:51', '2025-05-19 13:58:51', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (54, '2025-05-19 14:16:54', '2025-05-19 14:16:54', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (55, '2025-05-19 14:16:54', '2025-05-19 14:16:54', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (56, '2025-05-19 14:16:55', '2025-05-19 14:16:55', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (57, '2025-05-19 14:16:55', '2025-05-19 14:16:55', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (58, '2025-05-19 14:16:56', '2025-05-19 14:16:56', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (59, '2025-05-19 14:16:56', '2025-05-19 14:16:56', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (60, '2025-05-19 14:16:56', '2025-05-19 14:16:56', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (61, '2025-05-19 14:17:09', '2025-05-19 14:17:09', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (62, '2025-05-19 14:17:09', '2025-05-19 14:17:09', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (63, '2025-05-19 14:17:10', '2025-05-19 14:17:10', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (64, '2025-05-19 14:17:10', '2025-05-19 14:17:10', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (65, '2025-05-19 14:17:10', '2025-05-19 14:17:10', 1, '/admin/base/comm/permmenu', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (66, '2025-05-19 14:17:10', '2025-05-19 14:17:10', 1, '/admin/base/comm/person', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (67, '2025-05-19 14:17:11', '2025-05-19 14:17:11', 1, '/admin/dict/info/data', '172.18.0.12', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (68, '2025-05-19 14:17:43', '2025-05-19 14:17:43', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (69, '2025-05-19 14:17:43', '2025-05-19 14:17:43', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (70, '2025-05-19 14:17:44', '2025-05-19 14:17:44', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (71, '2025-05-19 15:10:42', '2025-05-19 15:10:42', NULL, '/account/login', '172.18.0.1', '{\"areaCode\": \"+86\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"platform\": 5, \"phoneNumber\": \"13300110011\"}');
INSERT INTO `base_sys_log` VALUES (72, '2025-05-19 15:25:46', '2025-05-19 15:25:46', NULL, '/admin/base/open/captcha', '172.18.0.14', '{\"color\": \"#2c3142\", \"width\": \"150\", \"height\": \"45\"}');
INSERT INTO `base_sys_log` VALUES (73, '2025-05-19 15:25:56', '2025-05-19 15:25:56', NULL, '/admin/base/open/login', '172.18.0.14', '{\"password\": \"123456\", \"username\": \"admin\", \"captchaId\": \"e863834e-0959-4604-8256-6b316567904d\", \"verifyCode\": \"dvrl\"}');
INSERT INTO `base_sys_log` VALUES (74, '2025-05-19 15:25:57', '2025-05-19 15:25:57', 1, '/admin/dict/info/data', '172.18.0.14', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (75, '2025-05-19 15:25:57', '2025-05-19 15:25:57', 1, '/admin/base/comm/permmenu', '172.18.0.14', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (76, '2025-05-19 15:25:57', '2025-05-19 15:25:57', 1, '/admin/base/comm/person', '172.18.0.14', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (77, '2025-05-19 15:26:41', '2025-05-19 15:26:41', NULL, '/account/login', '172.18.0.1', '{\"areaCode\": \"+86\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"platform\": 5, \"phoneNumber\": \"13300110011\"}');
INSERT INTO `base_sys_log` VALUES (78, '2025-05-19 15:35:45', '2025-05-19 15:35:45', NULL, '/account/login', '172.18.0.14', '{\"areaCode\": \"+86\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"platform\": 5, \"phoneNumber\": \"13300110011\"}');
INSERT INTO `base_sys_log` VALUES (79, '2025-05-19 15:35:58', '2025-05-19 15:35:58', NULL, '/account/login', '172.18.0.14', '{\"areaCode\": \"+86\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"platform\": 5, \"phoneNumber\": \"13300110011\"}');
INSERT INTO `base_sys_log` VALUES (80, '2025-05-19 15:36:06', '2025-05-19 15:36:06', 1, '/admin/user/info/page', '172.18.0.14', '{\"page\": 1, \"size\": 20, \"sort\": \"desc\", \"order\": \"createTime\", \"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (81, '2025-05-19 15:36:07', '2025-05-19 15:36:07', 1, '/admin/base/comm/person', '172.18.0.14', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (82, '2025-05-19 15:36:07', '2025-05-19 15:36:07', 1, '/admin/base/comm/permmenu', '172.18.0.14', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (83, '2025-05-19 15:36:07', '2025-05-19 15:36:07', 1, '/admin/dict/info/data', '172.18.0.14', '{\"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (84, '2025-05-19 15:36:08', '2025-05-19 15:36:08', 1, '/admin/user/info/page', '172.18.0.14', '{\"page\": 1, \"size\": 20, \"sort\": \"desc\", \"order\": \"createTime\", \"userId\": 1}');
INSERT INTO `base_sys_log` VALUES (85, '2025-05-19 16:19:23', '2025-05-19 16:19:23', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (86, '2025-05-19 16:19:24', '2025-05-19 16:19:24', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (87, '2025-05-19 16:19:39', '2025-05-19 16:19:39', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (88, '2025-05-19 16:19:39', '2025-05-19 16:19:39', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (89, '2025-05-19 16:19:39', '2025-05-19 16:19:39', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (90, '2025-05-19 16:19:39', '2025-05-19 16:19:39', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (91, '2025-05-19 16:19:39', '2025-05-19 16:19:39', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (92, '2025-05-19 16:19:39', '2025-05-19 16:19:39', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (93, '2025-05-19 16:19:39', '2025-05-19 16:19:39', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (94, '2025-05-19 16:19:39', '2025-05-19 16:19:39', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (95, '2025-05-19 16:19:40', '2025-05-19 16:19:40', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (96, '2025-05-19 16:19:40', '2025-05-19 16:19:40', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (97, '2025-05-19 16:19:40', '2025-05-19 16:19:40', NULL, '/admin/base/comm/program', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (98, '2025-05-19 16:19:40', '2025-05-19 16:19:40', NULL, '/admin/dict/info/types', '172.18.0.12', '{}');
INSERT INTO `base_sys_log` VALUES (99, '2025-05-19 16:35:54', '2025-05-19 16:35:54', NULL, '/account/login', '172.18.0.14', '{\"areaCode\": \"+86\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"platform\": 5, \"phoneNumber\": \"13300110011\"}');
INSERT INTO `base_sys_log` VALUES (100, '2025-05-19 16:47:04', '2025-05-19 16:47:04', NULL, '/account/login', '172.18.0.14', '{\"areaCode\": \"+86\", \"password\": \"e10adc3949ba59abbe56e057f20f883e\", \"platform\": 5, \"phoneNumber\": \"13300110011\"}');

-- ----------------------------
-- Table structure for base_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_menu`;
CREATE TABLE `base_sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `perms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '权限',
  `type` int(11) NULL DEFAULT 0 COMMENT '类型 0：目录 1：菜单 2：按钮',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序',
  `router` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `view_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视图地址',
  `keep_alive` bit(1) NULL DEFAULT b'1' COMMENT '路由缓存',
  `is_show` bit(1) NULL DEFAULT b'1' COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_idx_base_sys_menu_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_menu
-- ----------------------------
INSERT INTO `base_sys_menu` VALUES (1, '2025-05-19 11:41:59', '2025-05-19 11:41:59', NULL, '系统管理', NULL, 0, 'icon-set', 2, '/sys', NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (2, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 1, '权限管理', NULL, 0, 'icon-auth', 1, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (3, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 2, '菜单列表', NULL, 1, 'icon-menu', 2, '/sys/menu', 'modules/base/views/menu/index.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (4, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 3, '新增', 'base:sys:menu:add', 2, NULL, 1, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (5, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 3, '删除', 'base:sys:menu:delete', 2, NULL, 2, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (6, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 3, '查询', 'base:sys:menu:page,base:sys:menu:list,base:sys:menu:info', 2, NULL, 4, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (7, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 3, '参数', NULL, 1, 'icon-goods', 0, '/test/aa', 'modules/base/views/info.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (8, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 3, '编辑', 'base:sys:menu:info,base:sys:menu:update', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (9, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 2, '角色列表', NULL, 1, 'icon-dept', 3, '/sys/role', 'cool/modules/base/views/role.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (10, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 9, '新增', 'base:sys:role:add', 2, NULL, 1, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (11, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 9, '删除', 'base:sys:role:delete', 2, NULL, 2, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (12, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 9, '修改', 'base:sys:role:update', 2, NULL, 3, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (13, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 9, '查询', 'base:sys:role:page,base:sys:role:list,base:sys:role:info', 2, NULL, 4, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (14, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 2, '用户列表', NULL, 1, 'icon-user', 0, '/sys/user', 'modules/base/views/user/index.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (15, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '部门列表', 'base:sys:department:list', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (16, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '新增部门', 'base:sys:department:add', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (17, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '更新部门', 'base:sys:department:update', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (18, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '删除部门', 'base:sys:department:delete', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (19, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '部门排序', 'base:sys:department:order', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (20, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '用户转移', 'base:sys:user:move', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (21, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '新增', 'base:sys:user:add', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (22, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '删除', 'base:sys:user:delete', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (23, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '修改', 'base:sys:user:delete,base:sys:user:update', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (24, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 14, '查询', 'base:sys:user:page,base:sys:user:list,base:sys:user:info', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (25, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 1, '参数配置', NULL, 0, 'icon-params', 3, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (26, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 25, '参数列表', NULL, 1, 'icon-menu', 0, '/sys/param', 'cool/modules/base/views/param.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (27, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 26, '新增', 'base:sys:param:add', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (28, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 26, '修改', 'base:sys:param:info,base:sys:param:update', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (29, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 26, '删除', 'base:sys:param:delete', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (30, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 26, '查看', 'base:sys:param:page,base:sys:param:list,base:sys:param:info', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (31, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 1, '监控管理', NULL, 0, 'icon-monitor', 9, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (32, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 31, '请求日志', NULL, 1, 'icon-log', 1, '/sys/log', 'cool/modules/base/views/log.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (33, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 32, '权限', 'base:sys:log:page,base:sys:log:clear,base:sys:log:getKeep,base:sys:log:setKeep', 2, NULL, 1, NULL, NULL, b'0', b'1');
INSERT INTO `base_sys_menu` VALUES (34, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 1, '任务管理', NULL, 0, 'icon-activity', 9, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (35, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 34, '任务列表', NULL, 1, 'icon-menu', 0, '/task/list', 'modules/task/views/list.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (36, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 35, '权限', 'task:info:page,task:info:list,task:info:info,task:info:add,task:info:delete,task:info:update,task:info:stop,task:info:start,task:info:once,task:info:log', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (37, '2025-05-19 11:41:59', '2025-05-19 11:41:59', NULL, '框架教程', NULL, 0, 'icon-task', 98, '/tutorial', NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (38, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 37, '文档官网', NULL, 1, 'icon-log', 0, '/tutorial/doc', 'https://admin.cool-js.com', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (39, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 37, 'crud 示例', NULL, 1, 'icon-favor', 1, '/demo/crud', 'modules/demo/views/crud/index.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (40, '2025-05-19 11:41:59', '2025-05-19 11:41:59', NULL, '通用', NULL, 0, 'icon-radioboxfill', 99, NULL, NULL, b'1', b'0');
INSERT INTO `base_sys_menu` VALUES (41, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 40, '图片上传', 'space:info:page,space:info:list,space:info:info,space:info:add,space:info:delete,space:info:update,space:type:page,space:type:list,space:type:info,space:type:add,space:type:delete,space:type:update', 2, NULL, 1, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (42, '2025-05-19 11:41:59', '2025-05-19 11:41:59', NULL, '首页', NULL, 1, NULL, 0, '/', 'modules/demo/views/home/index.vue', b'1', b'0');
INSERT INTO `base_sys_menu` VALUES (43, '2025-05-19 11:41:59', '2025-05-19 11:41:59', NULL, '数据管理', NULL, 0, 'icon-data', 7, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (44, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 43, '字典管理', NULL, 1, 'icon-dict', 3, '/dict/list', 'modules/dict/views/list.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (45, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 44, '删除', 'dict:info:delete', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (46, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 44, '修改', 'dict:info:update,dict:info:info', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (47, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 44, '获得字典数据', 'dict:info:data', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (48, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 44, '单个信息', 'dict:info:info', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (49, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 44, '列表查询', 'dict:info:list', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (50, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 44, '分页查询', 'dict:info:page', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (51, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 44, '新增', 'dict:info:add', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (52, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 44, '组权限', 'dict:type:list,dict:type:update,dict:type:delete,dict:type:add', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (53, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 43, '数据回收站', NULL, 1, 'icon-delete', 6, '/recycle/data', 'modules/recycle/views/data.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (54, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 53, '恢复数据', 'recycle:data:restore', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (55, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 53, '单个信息', 'recycle:data:info', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (56, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 53, '分页查询', 'recycle:data:page', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (57, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 43, '文件管理', NULL, 1, 'icon-log', 5, '/upload/list', 'modules/space/views/list.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (58, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 57, '权限', 'space:type:delete,space:type:update,space:type:info,space:type:list,space:type:page,space:type:add,space:info:getConfig,space:info:delete,space:info:update,space:info:info,space:info:list,space:info:page,space:info:add', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (59, '2025-05-19 11:41:59', '2025-05-19 11:41:59', NULL, '用户管理', NULL, 0, 'icon-user', 11, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (60, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 59, '用户列表', NULL, 1, 'icon-menu', 1, '/user/list', 'modules/user/views/list.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (61, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 60, '删除', 'user:info:delete', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (62, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 60, '修改', 'user:info:update,user:info:info', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (63, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 60, '单个信息', 'user:info:info', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (64, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 60, '列表查询', 'user:info:list', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (65, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 60, '分页查询', 'user:info:page', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (66, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 60, '新增', 'user:info:add', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (67, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 44, '字典类型', 'dict:type:delete,dict:type:update,dict:type:info,dict:type:list,dict:type:page,dict:type:add', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (68, '2025-05-19 11:42:00', '2025-05-19 11:42:00', NULL, '扩展管理', NULL, 0, 'icon-favor', 8, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (69, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 68, '插件列表', NULL, 1, 'icon-list', 1, '/helper/plugins', 'modules/helper/views/plugins.vue', b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (70, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 69, '删除', 'plugin:info:delete', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (71, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 69, '分页查询', 'plugin:info:page', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (72, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 69, '单个信息', 'plugin:info:info', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (73, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 69, '安装插件', 'plugin:info:install', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (74, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 69, '修改', 'plugin:info:update', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (75, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 69, '列表查询', 'plugin:info:list', 2, NULL, 0, NULL, NULL, b'1', b'1');
INSERT INTO `base_sys_menu` VALUES (76, '2025-05-19 11:42:00', '2025-05-19 11:42:00', 69, '新增', 'plugin:info:add', 2, NULL, 0, NULL, NULL, b'1', b'1');

-- ----------------------------
-- Table structure for base_sys_param
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_param`;
CREATE TABLE `base_sys_param`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `key_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据',
  `data_type` int(11) NULL DEFAULT 0 COMMENT '数据类型 0:字符串 1:数组 2:键值对',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_idx_base_sys_param_key_name`(`key_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统参数配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_param
-- ----------------------------
INSERT INTO `base_sys_param` VALUES (1, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 'rich', '富文本参数', '<h3><strong>这是一个富文本</strong></h3><p>xxx</p><p>xxxxxxxxxx</p><p><br></p>', 1, NULL);
INSERT INTO `base_sys_param` VALUES (2, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 'json', 'JSON参数', '{\n  \"code\": 111233\n}', 0, NULL);
INSERT INTO `base_sys_param` VALUES (3, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 'file', '文件', '', 2, NULL);
INSERT INTO `base_sys_param` VALUES (4, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 'text', '测试', '这是一段字符串', 0, NULL);

-- ----------------------------
-- Table structure for base_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_role`;
CREATE TABLE `base_sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色标签',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `relevance` int(11) NULL DEFAULT 1 COMMENT '数据权限是否关联上下级',
  `menu_id_list` json NULL COMMENT '菜单权限',
  `department_id_list` json NULL COMMENT '部门权限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auto_idx_base_sys_role_label`(`label`) USING BTREE,
  INDEX `auto_idx_base_sys_role_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_role
-- ----------------------------
INSERT INTO `base_sys_role` VALUES (1, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 1, '超管', 'admin', '最高权限的角色', 1, NULL, NULL);

-- ----------------------------
-- Table structure for base_sys_role_department
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_role_department`;
CREATE TABLE `base_sys_role_department`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `department_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_role_department
-- ----------------------------

-- ----------------------------
-- Table structure for base_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_role_menu`;
CREATE TABLE `base_sys_role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for base_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_user`;
CREATE TABLE `base_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `tenant_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `department_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `password_v` int(11) NULL DEFAULT 1 COMMENT '密码版本',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态 0:禁用 1：启用',
  `socket_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'socketId',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auto_idx_base_sys_user_username`(`username`) USING BTREE,
  INDEX `auto_idx_base_sys_user_department_id`(`department_id`) USING BTREE,
  INDEX `auto_idx_base_sys_user_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_user
-- ----------------------------
INSERT INTO `base_sys_user` VALUES (1, '2025-05-19 11:41:59', '2025-05-19 11:41:59', NULL, 1, '超级管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 7, '管理员', 'https://cool-js.com/admin/headimg.jpg', '18000000000', 'team@cool-js.com', '拥有最高权限的用户', 1, NULL);

-- ----------------------------
-- Table structure for base_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `base_sys_user_role`;
CREATE TABLE `base_sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_idx_base_sys_user_role_role_id`(`role_id`) USING BTREE,
  INDEX `auto_idx_base_sys_user_role_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_sys_user_role
-- ----------------------------
INSERT INTO `base_sys_user_role` VALUES (1, '2025-05-19 11:41:59', '2025-05-19 11:41:59', 1, 1);

-- ----------------------------
-- Table structure for dict_info
-- ----------------------------
DROP TABLE IF EXISTS `dict_info`;
CREATE TABLE `dict_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `type_id` bigint(20) NOT NULL COMMENT '类型ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '排序',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_info
-- ----------------------------

-- ----------------------------
-- Table structure for dict_type
-- ----------------------------
DROP TABLE IF EXISTS `dict_type`;
CREATE TABLE `dict_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auto_idx_dict_type_key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_type
-- ----------------------------

-- ----------------------------
-- Table structure for leaf_alloc
-- ----------------------------
DROP TABLE IF EXISTS `leaf_alloc`;
CREATE TABLE `leaf_alloc`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务key ，比如orderId',
  `max_id` bigint(20) NOT NULL DEFAULT 1 COMMENT '当前最大id',
  `step` int(11) NOT NULL DEFAULT 500 COMMENT '步长',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auto_idx_uk_key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '唯一id分配' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaf_alloc
-- ----------------------------

-- ----------------------------
-- Table structure for plugin_info
-- ----------------------------
DROP TABLE IF EXISTS `plugin_info`;
CREATE TABLE `plugin_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实例对象',
  `hook` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Hook',
  `readme` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
  `logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Logo(base64)',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态 0-禁用 1-启用',
  `plugin_json` json NOT NULL COMMENT '插件的plugin.json',
  `config` json NULL COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auto_idx_plugin_info_key`(`key`) USING BTREE,
  INDEX `auto_idx_plugin_info_hook`(`hook`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '插件信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plugin_info
-- ----------------------------

-- ----------------------------
-- Table structure for recycle_data
-- ----------------------------
DROP TABLE IF EXISTS `recycle_data`;
CREATE TABLE `recycle_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `entity_info` json NULL COMMENT '表信息',
  `user_id` bigint(20) NOT NULL COMMENT '操作人',
  `data` json NULL COMMENT '被删除的数据',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求的接口',
  `params` json NOT NULL COMMENT '请求参数',
  `count` int(11) NULL DEFAULT 1 COMMENT '删除数据条数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_idx_recycle_data_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据回收站表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recycle_data
-- ----------------------------

-- ----------------------------
-- Table structure for redbag_log
-- ----------------------------
DROP TABLE IF EXISTS `redbag_log`;
CREATE TABLE `redbag_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `send_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `receive_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount` int(11) NULL DEFAULT NULL,
  `receive_time` datetime NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '红包发送记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of redbag_log
-- ----------------------------

-- ----------------------------
-- Table structure for redbag_log_collection
-- ----------------------------
DROP TABLE IF EXISTS `redbag_log_collection`;
CREATE TABLE `redbag_log_collection`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `redbag_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_users` int(11) NULL DEFAULT NULL,
  `total_amount` int(11) NULL DEFAULT NULL,
  `collection_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '红包领取记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of redbag_log_collection
-- ----------------------------

-- ----------------------------
-- Table structure for space_info
-- ----------------------------
DROP TABLE IF EXISTS `space_info`;
CREATE TABLE `space_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `classify_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `size` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  `version` bigint(20) NULL DEFAULT 1 COMMENT '文档版本',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件位置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_idx_space_info_file_id`(`file_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件空间信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of space_info
-- ----------------------------

-- ----------------------------
-- Table structure for space_type
-- ----------------------------
DROP TABLE IF EXISTS `space_type`;
CREATE TABLE `space_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片空间信息分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of space_type
-- ----------------------------

-- ----------------------------
-- Table structure for task_info
-- ----------------------------
DROP TABLE IF EXISTS `task_info`;
CREATE TABLE `task_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `job_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务ID',
  `repeat_count` int(11) NULL DEFAULT NULL COMMENT '最大执行次数 不传为无限次',
  `every` int(11) NULL DEFAULT NULL COMMENT '每间隔多少毫秒执行一次 如果cron设置了 这项设置就无效',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态 0:停止 1：运行',
  `service` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务实例名称',
  `task_type` int(11) NULL DEFAULT 0 COMMENT '状态 0:cron 1：时间间隔',
  `type` int(11) NULL DEFAULT 0 COMMENT '状态 0:系统 1：用户',
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务数据',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'cron',
  `next_run_time` datetime NULL DEFAULT NULL COMMENT '下一次执行时间',
  `start_date` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_info
-- ----------------------------
INSERT INTO `task_info` VALUES (1, '2025-05-19 11:41:59', '2025-05-19 14:35:23', '清理日志', '1', NULL, 5000, 1, 'baseSysLogServiceImpl.clear(false)', 0, 0, NULL, NULL, '0 0 1 * * ?', '2025-05-20 09:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for task_log
-- ----------------------------
DROP TABLE IF EXISTS `task_log`;
CREATE TABLE `task_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `task_id` bigint(20) NOT NULL COMMENT '任务ID',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态 0：失败 1：成功',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_idx_task_log_task_id`(`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '市',
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '区',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '地址',
  `is_default` bit(1) NULL DEFAULT b'0' COMMENT '是否默认',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auto_idx_user_address_phone`(`phone`) USING BTREE,
  INDEX `auto_idx_user_address_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户模块-收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for user_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `user_balance_log`;
CREATE TABLE `user_balance_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '余额',
  `type` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '类型',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户余额日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `unionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录唯一ID',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `balance` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '余额',
  `gender` int(11) NULL DEFAULT 0 COMMENT '性别 0-未知 1-男 2-女',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态 0-禁用 1-正常 2-已注销',
  `login_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录方式 0-小程序 1-公众号 2-H5',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auto_idx_user_info_phone`(`phone`) USING BTREE,
  UNIQUE INDEX `auto_idx_user_info_unionid`(`unionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------

-- ----------------------------
-- Table structure for user_wx
-- ----------------------------
DROP TABLE IF EXISTS `user_wx`;
CREATE TABLE `user_wx`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `unionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信unionid',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信openid',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` int(11) NULL DEFAULT 0 COMMENT '性别 0-未知 1-男 2-女',
  `language` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `type` int(11) NULL DEFAULT 0 COMMENT '类型 0-小程序 1-公众号 2-H5 3-APP',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auto_idx_user_wx_openid`(`openid`) USING BTREE,
  INDEX `auto_idx_user_wx_unionid`(`unionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_wx
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

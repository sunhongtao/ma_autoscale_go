/*
Navicat MySQL Data Transfer

Source Server         : 20.26.17.137
Source Server Version : 50710
Source Host           : 20.26.17.137:3366
Source Database       : wz

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-09-21 18:56:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dcos_autoscale_logs
-- ----------------------------
DROP TABLE IF EXISTS `dcos_autoscale_logs`;
CREATE TABLE `dcos_autoscale_logs` (
  `log_time` date NOT NULL,
  `marathon_endpoint` varchar(255) CHARACTER SET latin1 NOT NULL,
  `app_id` int(11) NOT NULL,
  `message` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_autoscale_logs
-- ----------------------------

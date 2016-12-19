/*
Navicat MySQL Data Transfer

Source Server         : 20.26.28.19
Source Server Version : 50710
Source Host           : 20.26.28.19:3366
Source Database       : icloud

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-12-19 08:50:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dcos_autoscale_policy
-- ----------------------------
DROP TABLE IF EXISTS `dcos_autoscale_policy`;
CREATE TABLE `dcos_autoscale_policy` (
  `marathon_endpoint` varchar(255) NOT NULL,
  `app_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `autoscale_admin` tinyint(10) NOT NULL,
  `scale_policy` varchar(2000) NOT NULL COMMENT 'json',
  `last_scale` datetime DEFAULT NULL,
  PRIMARY KEY (`marathon_endpoint`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

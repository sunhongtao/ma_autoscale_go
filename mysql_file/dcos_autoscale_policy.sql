/*
Navicat MySQL Data Transfer

Source Server         : 20.26.17.137
Source Server Version : 50710
Source Host           : 20.26.17.137:3366
Source Database       : wz

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-09-21 18:56:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dcos_autoscale_policy
-- ----------------------------
DROP TABLE IF EXISTS `dcos_autoscale_policy`;
CREATE TABLE `dcos_autoscale_policy` (
  `marathon_endpoint` varchar(255) CHARACTER SET latin1 NOT NULL,
  `app_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `autoscale_admin` varchar(10) CHARACTER SET latin1 NOT NULL,
  `scale_policy` varchar(2000) DEFAULT NULL COMMENT 'json',
  `ast_scale` datetime(6) NOT NULL,
  PRIMARY KEY (`marathon_endpoint`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_autoscale_policy
-- ----------------------------
INSERT INTO `dcos_autoscale_policy` VALUES ('http://20.26.2.20:8080,http://20.26.2.21:8080', '/scrmweb', '1', '{\r\n            \"appId\": \"/scrmweb\",\r\n            \"autoScale\": true,\r\n            \"cooldownSeconds\": 60,\r\n            \"maxTasks\": 20,\r\n            \"minTasks\": 1,\r\n            \"scalePolicy\": {\r\n                \"concurrentScalePolicy\": {\r\n                    \"enable\": false,\r\n                    \"maxConcurrent\": 20,\r\n                    \"minConcurrent\": 10,\r\n                    \"scaleOutPercent\": 20\r\n                },\r\n                \"cpuScalePolicy\": {\r\n                    \"enable\": true,\r\n                    \"maxCpuPercent\": 60,\r\n                    \"minCpuPercent\": 40,\r\n                    \"scaleOutPercent\": 20\r\n                },\r\n                \"staticScalePolicy\": {\r\n                    \"enable\": false,\r\n                    \"scalePoints\": [\r\n                        {\r\n                            \"tasks\": 10,\r\n                            \"time\": \"02:11\"\r\n                        },\r\n                        {\r\n                            \"tasks\": 1,\r\n                            \"time\": \"02:12\"\r\n                        },\r\n                        {\r\n                            \"tasks\": 2,\r\n                            \"time\": \"20:00\"\r\n                        }\r\n                    ]\r\n                }\r\n            }\r\n        }', '2016-09-21 18:03:09.000000');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://20.26.2.20:8080,http://20.26.2.21:8080', 'adcloud-app', 'true', ' {\r\n        \"appId\": \"/adcloud-app\",\r\n        \"appScalePolicy\": {\r\n            \"appId\": \"/adcloud-app\",\r\n            \"autoScale\": true,\r\n            \"cooldownSeconds\": 60,\r\n            \"maxTasks\": 10,\r\n            \"minTasks\": 2,\r\n            \"scalePolicy\": {\r\n                \"concurrentScalePolicy\": {\r\n                    \"enable\": true,\r\n                    \"maxConcurrent\": 50,\r\n                    \"minConcurrent\": 20,\r\n                    \"scaleOutPercent\": 20\r\n                },\r\n                \"cpuScalePolicy\": {\r\n                    \"enable\": true,\r\n                    \"maxCpuPercent\": 60,\r\n                    \"minCpuPercent\": 40,\r\n                    \"scaleOutPercent\": 20\r\n                },\r\n                \"staticScalePolicy\": {\r\n                    \"enable\": false,\r\n                    \"scalePoints\": [\r\n                        {\r\n                            \"tasks\": 10,\r\n                            \"time\": \"09:00\"\r\n                        },\r\n                        {\r\n                            \"tasks\": 2,\r\n                            \"time\": \"20:00\"\r\n                        },\r\n                        {\r\n                            \"tasks\": 1,\r\n                            \"time\": \"23:00\"\r\n                        }\r\n                    ]\r\n                }\r\n            }\r\n        },\r\n        \"autoScaleAdmin\": true,\r\n        \"lastScale\": \"\"\r\n    }', '2016-09-20 18:18:34.000000');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://20.26.25.148:8080', 'test', 'true', '{\"appId\":\"test\",\"autoScaleAdmin\":true,\"lastScale\":\"\",\"appScalePolicy\":{\"appId\":\"\",\"autoScale\":false,\"minTasks\":0,\"maxTasks\":0,\"cooldownSeconds\":0,\"scalePolicy\":{\"staticScalePolicy\":{\"enable\":false,\"scalePoints\":null},\"cpuScalePolicy\":{\"enable\":false,\"minCpuPercent\":0,\"maxCpuPercent\":0,\"scaleOutPercent\":0},\"concurrentScalePolicy\":{\"enable\":false,\"minConcurrent\":0,\"maxConcurrent\":0,\"scaleOutPercent\":0}}}}', '2016-09-21 08:34:35.237008');

/*
Navicat MySQL Data Transfer

Source Server         : 20.26.17.137
Source Server Version : 50710
Source Host           : 20.26.17.137:3366
Source Database       : go_autoscale

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-09-27 10:39:55
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
  `scale_policy` varchar(2000) DEFAULT NULL COMMENT 'json',
  `ast_scale` datetime(6) NOT NULL,
  PRIMARY KEY (`marathon_endpoint`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_autoscale_policy
-- ----------------------------
INSERT INTO `dcos_autoscale_policy` VALUES ('http://10.78.235.14:8082', 'fzpt-web', '0', '{\r\n	\"appId\": \"fzpt-web\",\r\n    \"autoScale\": true,\r\n    \"cooldownSeconds\": 60,\r\n    \"maxTasks\": 20,\r\n    \"minTasks\": 1,\r\n    \"scalePolicy\": {\r\n        \"concurrentScalePolicy\": {\r\n            \"enable\": false,\r\n            \"maxConcurrent\": 20,\r\n            \"minConcurrent\": 10,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"cpuScalePolicy\": {\r\n            \"enable\": true,\r\n            \"maxCpuPercent\": 60,\r\n            \"minCpuPercent\": 40,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"staticScalePolicy\": {\r\n            \"enable\": false,\r\n            \"scalePoints\": [\r\n				{\r\n                \"tasks\": 10,\r\n                \"time\": \"02:11\"\r\n                 },\r\n                {\r\n                \"tasks\": 1,\r\n                \"time\": \"02:12\"\r\n                },\r\n                {\r\n                \"tasks\": 2,\r\n                \"time\": \"20:00\"\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '2016-09-23 14:51:50.000000');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://10.78.235.14:8082', 'yyfx-fap', '0', '{\r\n	\"appId\": \"yyfx-fap\",\r\n    \"autoScale\": true,\r\n    \"cooldownSeconds\": 60,\r\n    \"maxTasks\": 20,\r\n    \"minTasks\": 1,\r\n    \"scalePolicy\": {\r\n        \"concurrentScalePolicy\": {\r\n            \"enable\": false,\r\n            \"maxConcurrent\": 20,\r\n            \"minConcurrent\": 10,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"cpuScalePolicy\": {\r\n            \"enable\": true,\r\n            \"maxCpuPercent\": 60,\r\n            \"minCpuPercent\": 40,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"staticScalePolicy\": {\r\n            \"enable\": false,\r\n            \"scalePoints\": [\r\n				{\r\n                \"tasks\": 10,\r\n                \"time\": \"02:11\"\r\n                 },\r\n                {\r\n                \"tasks\": 1,\r\n                \"time\": \"02:12\"\r\n                },\r\n                {\r\n                \"tasks\": 2,\r\n                \"time\": \"20:00\"\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '2016-09-23 14:52:22.000000');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://10.78.235.14:8082', 'yyfx-nginx', '1', '{\r\n	\"appId\": \"yyfx-nginx\",\r\n    \"autoScale\": true,\r\n    \"cooldownSeconds\": 60,\r\n    \"maxTasks\": 20,\r\n    \"minTasks\": 1,\r\n    \"scalePolicy\": {\r\n        \"concurrentScalePolicy\": {\r\n            \"enable\": false,\r\n            \"maxConcurrent\": 20,\r\n            \"minConcurrent\": 10,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"cpuScalePolicy\": {\r\n            \"enable\": true,\r\n            \"maxCpuPercent\": 60,\r\n            \"minCpuPercent\": 40,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"staticScalePolicy\": {\r\n            \"enable\": false,\r\n            \"scalePoints\": [\r\n				{\r\n                \"tasks\": 10,\r\n                \"time\": \"02:11\"\r\n                 },\r\n                {\r\n                \"tasks\": 1,\r\n                \"time\": \"02:12\"\r\n                },\r\n                {\r\n                \"tasks\": 2,\r\n                \"time\": \"20:00\"\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '2016-09-23 14:53:11.000000');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://10.78.235.14:8082', 'yyfx-web', '1', '{\r\n	\"appId\": \"yyfx-web\",\r\n    \"autoScale\": true,\r\n    \"cooldownSeconds\": 60,\r\n    \"maxTasks\": 20,\r\n    \"minTasks\": 1,\r\n    \"scalePolicy\": {\r\n        \"concurrentScalePolicy\": {\r\n            \"enable\": false,\r\n            \"maxConcurrent\": 20,\r\n            \"minConcurrent\": 10,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"cpuScalePolicy\": {\r\n            \"enable\": true,\r\n            \"maxCpuPercent\": 60,\r\n            \"minCpuPercent\": 40,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"staticScalePolicy\": {\r\n            \"enable\": false,\r\n            \"scalePoints\": [\r\n				{\r\n                \"tasks\": 10,\r\n                \"time\": \"02:11\"\r\n                 },\r\n                {\r\n                \"tasks\": 1,\r\n                \"time\": \"02:12\"\r\n                },\r\n                {\r\n                \"tasks\": 2,\r\n                \"time\": \"20:00\"\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '2016-09-23 14:53:38.000000');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://10.78.235.14:8082', 'yytxd-web', '1', '{\r\n	\"appId\": \"yytxd-web\",\r\n    \"autoScale\": true,\r\n    \"cooldownSeconds\": 60,\r\n    \"maxTasks\": 20,\r\n    \"minTasks\": 1,\r\n    \"scalePolicy\": {\r\n        \"concurrentScalePolicy\": {\r\n            \"enable\": false,\r\n            \"maxConcurrent\": 20,\r\n            \"minConcurrent\": 10,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"cpuScalePolicy\": {\r\n            \"enable\": true,\r\n            \"maxCpuPercent\": 60,\r\n            \"minCpuPercent\": 40,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"staticScalePolicy\": {\r\n            \"enable\": false,\r\n            \"scalePoints\": [\r\n				{\r\n                \"tasks\": 10,\r\n                \"time\": \"02:11\"\r\n                 },\r\n                {\r\n                \"tasks\": 1,\r\n                \"time\": \"02:12\"\r\n                },\r\n                {\r\n                \"tasks\": 2,\r\n                \"time\": \"20:00\"\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '2016-09-23 14:54:06.000000');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://20.26.2.20:8080', 'hunter', '1', '{\"appId\": \"hunter\", \"autoScale\": true,\r\n    \"cooldownSeconds\": 60,\r\n    \"maxTasks\": 20,\r\n    \"minTasks\": 1,\r\n    \"scalePolicy\": {\r\n        \"concurrentScalePolicy\": {\r\n            \"enable\": false,\r\n            \"maxConcurrent\": 20,\r\n            \"minConcurrent\": 10,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"cpuScalePolicy\": {\r\n            \"enable\": false,\r\n            \"maxCpuPercent\": 40,\r\n            \"minCpuPercent\": 20,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"staticScalePolicy\": {\r\n            \"enable\": true,\r\n            \"scalePoints\": [\r\n                {\r\n                \"tasks\": 3,\r\n                \"time\": \"09:55\"\r\n                 },\r\n                {\r\n                \"tasks\": 1,\r\n                \"time\": \"11:50\"\r\n                },\r\n                {\r\n                \"tasks\": 2,\r\n                \"time\": \"20:00\"\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '2016-09-20 18:18:34.000000');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://20.26.2.20:8080', 'klfx-api', '0', '{\r\n	\"appId\": \"klfx-api\",\r\n    \"autoScale\": true,\r\n    \"cooldownSeconds\": 60,\r\n    \"maxTasks\": 20,\r\n    \"minTasks\": 1,\r\n    \"scalePolicy\": {\r\n        \"concurrentScalePolicy\": {\r\n            \"enable\": false,\r\n            \"maxConcurrent\": 20,\r\n            \"minConcurrent\": 10,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"cpuScalePolicy\": {\r\n            \"enable\": true,\r\n            \"maxCpuPercent\": 40,\r\n            \"minCpuPercent\": 20,\r\n            \"scaleOutPercent\": 20\r\n            },\r\n        \"staticScalePolicy\": {\r\n            \"enable\": false,\r\n            \"scalePoints\": [\r\n				{\r\n                \"tasks\": 10,\r\n                \"time\": \"02:11\"\r\n                 },\r\n                {\r\n                \"tasks\": 1,\r\n                \"time\": \"02:12\"\r\n                },\r\n                {\r\n                \"tasks\": 2,\r\n                \"time\": \"20:00\"\r\n                }\r\n            ]\r\n        }\r\n    }\r\n}', '2016-09-21 08:34:35.237008');
INSERT INTO `dcos_autoscale_policy` VALUES ('http://20.26.2.20:8080', 'scrmweb', '0', '{\"appId\": \"scrmweb\",\r\n    \"autoScale\": true,\r\n            \"cooldownSeconds\": 60,\r\n            \"maxTasks\": 20,\r\n            \"minTasks\": 1,\r\n            \"scalePolicy\": {\r\n                \"concurrentScalePolicy\": {\r\n                    \"enable\": false,\r\n                    \"maxConcurrent\": 20,\r\n                    \"minConcurrent\": 10,\r\n                    \"scaleOutPercent\": 20\r\n                },\r\n                \"cpuScalePolicy\": {\r\n                    \"enable\": true,\r\n                    \"maxCpuPercent\": 40,\r\n                    \"minCpuPercent\": 20,\r\n                    \"scaleOutPercent\": 20\r\n                },\r\n                \"staticScalePolicy\": {\r\n                    \"enable\": false,\r\n                    \"scalePoints\": [\r\n                        {\r\n                            \"tasks\": 10,\r\n                            \"time\": \"02:11\"\r\n                        },\r\n                        {\r\n                            \"tasks\": 1,\r\n                            \"time\": \"02:12\"\r\n                        },\r\n                        {\r\n                            \"tasks\": 2,\r\n                            \"time\": \"20:00\"\r\n                  }\r\n                    ]\r\n                }\r\n            }\r\n        }', '2016-09-21 18:03:09.000000');

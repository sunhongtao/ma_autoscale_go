/*
Navicat MySQL Data Transfer

Source Server         : 20.26.25.156
Source Server Version : 50710
Source Host           : 20.26.25.156:3366
Source Database       : icloud

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-12-15 09:35:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alarm_log
-- ----------------------------
DROP TABLE IF EXISTS `alarm_log`;
CREATE TABLE `alarm_log` (
  `time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `hostname` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alarm_log
-- ----------------------------

-- ----------------------------
-- Table structure for alarm_users
-- ----------------------------
DROP TABLE IF EXISTS `alarm_users`;
CREATE TABLE `alarm_users` (
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phonenumber` bigint(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alarm_users
-- ----------------------------
INSERT INTO `alarm_users` VALUES ('ZSH', '15158116209');
INSERT INTO `alarm_users` VALUES ('ZSH', '15158116209');
INSERT INTO `alarm_users` VALUES ('ZSH', '15158116209');
INSERT INTO `alarm_users` VALUES ('ZSH', '15158116209');

-- ----------------------------
-- Table structure for app_deploy
-- ----------------------------
DROP TABLE IF EXISTS `app_deploy`;
CREATE TABLE `app_deploy` (
  `app_name` varchar(255) NOT NULL,
  `app_id` varchar(100) NOT NULL,
  `nginx_ip` varchar(60) NOT NULL,
  `nginx_port` varchar(6) NOT NULL,
  `nginx_path` varchar(100) NOT NULL,
  `slave_ip` varchar(60) NOT NULL,
  `slave_port` varchar(6) NOT NULL,
  `slave_path` varchar(100) NOT NULL,
  `package_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_deploy
-- ----------------------------

-- ----------------------------
-- Table structure for app_deploy_log
-- ----------------------------
DROP TABLE IF EXISTS `app_deploy_log`;
CREATE TABLE `app_deploy_log` (
  `app_id` varchar(125) DEFAULT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `slave_ip` varchar(60) DEFAULT NULL,
  `serial_num` varchar(125) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_deploy_log
-- ----------------------------

-- ----------------------------
-- Table structure for balance_config
-- ----------------------------
DROP TABLE IF EXISTS `balance_config`;
CREATE TABLE `balance_config` (
  `device_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `device_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `device_vendor` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `host_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `security_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `operate_date` datetime DEFAULT NULL,
  `operate_counts` bigint(10) DEFAULT NULL,
  `error_log` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of balance_config
-- ----------------------------
INSERT INTO `balance_config` VALUES ('SQ3-2F-APV8600-YW-external-02', 'array', 'array', '10.70.21.51', 'array', 'Arr1y.2mcc', 'zaq1#EDC', '2015-11-05 00:28:30', '2', null, null);
INSERT INTO `balance_config` VALUES ('array-test', 'array', 'array', '10.70.206.133', 'array', 'admin', 'admin', '2015-12-09 14:44:49', '1', null, null);

-- ----------------------------
-- Table structure for busi_relationship
-- ----------------------------
DROP TABLE IF EXISTS `busi_relationship`;
CREATE TABLE `busi_relationship` (
  `system_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `system_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `color` varchar(7) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of busi_relationship
-- ----------------------------

-- ----------------------------
-- Table structure for cfg_app_public
-- ----------------------------
DROP TABLE IF EXISTS `cfg_app_public`;
CREATE TABLE `cfg_app_public` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `env` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `env_cfg_file` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code_repo_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code_repo_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `trigger_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `os_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `middileware_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `middileware_c_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_id` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_ver_cycle` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_c_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `registry_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `template_service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `template_container_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `last_update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `publish_target` varchar(1024) DEFAULT NULL,
  `app_sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '应用组',
  `deploy_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布构建方式',
  `app_origin` varchar(32) DEFAULT NULL,
  `ha_acl` varchar(50) DEFAULT NULL,
  `pkg_del` tinyint(4) DEFAULT '1',
  `inter_phone` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口人信息',
  `inter_email` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口人信息',
  `inter_company` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口人信息',
  `inter_domain` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口人信息',
  `inter_check_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口人信息',
  `inter_man` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '接口人信息',
  `ci_info` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '持续集成信息',
  `public_vip` varchar(255) DEFAULT NULL,
  `private_vip` varchar(255) DEFAULT NULL,
  `ha_ip` varchar(255) DEFAULT NULL,
  `ha_mode` varchar(255) DEFAULT NULL,
  `bamboo_mode` varchar(255) DEFAULT NULL,
  `firewall_conf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cfg_app_public` (`env`,`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfg_app_public
-- ----------------------------

-- ----------------------------
-- Table structure for cfg_task
-- ----------------------------
DROP TABLE IF EXISTS `cfg_task`;
CREATE TABLE `cfg_task` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cron` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `impl_class` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `impl_method` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `args` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `busi_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cfg_task
-- ----------------------------
INSERT INTO `cfg_task` VALUES ('1', '同步Frameworks', 'SYNC', '10 0/5 * * * ?', 'com.icloud.common.task.impl.MesosTask', 'execute', '1', '0', '2016-06-22 09:41:15', '');
INSERT INTO `cfg_task` VALUES ('2', '同步监控数据', 'SYNC', '0 0 1 1 * ?', 'com.icloud.common.task.impl.MonTask', 'execute', '1', '1', '2016-06-22 09:41:15', '');
INSERT INTO `cfg_task` VALUES ('3', '同步监控数据statis', 'SYNC', '0 0 1 1 * ?', 'com.icloud.common.task.impl.MonStatisTask', 'execute', '1', '1', '2016-06-22 09:41:15', '');
INSERT INTO `cfg_task` VALUES ('4', '同步监控数据detail', 'SYNC', '0 0 1 1 * ?', 'com.icloud.common.task.impl.MonDetailTask', 'execute', '1', '1', '2016-06-22 09:41:15', '');
INSERT INTO `cfg_task` VALUES ('5', '同步监控数据ha', 'SYNC', '0 0 1 1 * ?', 'com.icloud.common.task.impl.MonHaTask', 'execute', '1', '1', '2016-06-22 09:41:15', '');
INSERT INTO `cfg_task` VALUES ('6', '清理监控历史数据', 'SYNC', '*/30 0/10 * * * ?', 'com.icloud.common.task.impl.ClearMonHisTask', 'execute', '1', '0', '2016-06-22 09:41:15', '');

-- ----------------------------
-- Table structure for cluster_mon_detail
-- ----------------------------
DROP TABLE IF EXISTS `cluster_mon_detail`;
CREATE TABLE `cluster_mon_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(255) DEFAULT NULL,
  `sum_cpu` varchar(64) DEFAULT NULL,
  `sum_mem` varchar(64) DEFAULT NULL,
  `cls_id` varchar(128) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cluster_mon_detail
-- ----------------------------

-- ----------------------------
-- Table structure for container_alarm_data
-- ----------------------------
DROP TABLE IF EXISTS `container_alarm_data`;
CREATE TABLE `container_alarm_data` (
  `hostname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_create_time` datetime DEFAULT NULL,
  `container_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_port` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `alarm_time` decimal(4,1) DEFAULT NULL,
  `container_thread_run` decimal(5,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of container_alarm_data
-- ----------------------------

-- ----------------------------
-- Table structure for container_current_data
-- ----------------------------
DROP TABLE IF EXISTS `container_current_data`;
CREATE TABLE `container_current_data` (
  `hostname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_create_time` datetime DEFAULT NULL,
  `container_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_port` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_cpu_used` decimal(5,1) DEFAULT NULL,
  `container_mem_used` decimal(10,1) DEFAULT NULL,
  `container_thread_total` decimal(5,1) DEFAULT NULL,
  `container_thread_idle` decimal(5,1) DEFAULT NULL,
  `container_thread_run` decimal(5,1) DEFAULT NULL,
  `container_session_total` decimal(5,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of container_current_data
-- ----------------------------

-- ----------------------------
-- Table structure for container_resource
-- ----------------------------
DROP TABLE IF EXISTS `container_resource`;
CREATE TABLE `container_resource` (
  `container_resource_id` int(5) NOT NULL,
  `container_resource_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instances` int(5) DEFAULT NULL,
  `cpus` int(5) DEFAULT NULL,
  `memory_size` bigint(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`container_resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of container_resource
-- ----------------------------

-- ----------------------------
-- Table structure for container_thread_history
-- ----------------------------
DROP TABLE IF EXISTS `container_thread_history`;
CREATE TABLE `container_thread_history` (
  `data_collect_time` datetime DEFAULT NULL,
  `container_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `thread_total` int(5) DEFAULT NULL,
  `seq` bigint(10) NOT NULL,
  PRIMARY KEY (`seq`),
  KEY `idx_container_thread_history` (`data_collect_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of container_thread_history
-- ----------------------------

-- ----------------------------
-- Table structure for cpu_his_used
-- ----------------------------
DROP TABLE IF EXISTS `cpu_his_used`;
CREATE TABLE `cpu_his_used` (
  `seq` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL,
  `cpu_used` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mem_used` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`seq`),
  KEY `idx_cpu_his_used` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cpu_his_used
-- ----------------------------

-- ----------------------------
-- Table structure for datacenter
-- ----------------------------
DROP TABLE IF EXISTS `datacenter`;
CREATE TABLE `datacenter` (
  `datacenter_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `datacenter_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `server_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `server_ip_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `application_catagory` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_counts` int(5) DEFAULT NULL,
  `server_status` int(1) DEFAULT NULL,
  `server_cpuresource` int(3) DEFAULT NULL,
  `server_memresource` int(5) DEFAULT NULL,
  `application_catagory_cpu_used` decimal(3,1) DEFAULT NULL,
  `application_catagory_mem_used` int(3) DEFAULT NULL,
  `last_update_date` bigint(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datacenter
-- ----------------------------

-- ----------------------------
-- Table structure for datacenter_configure
-- ----------------------------
DROP TABLE IF EXISTS `datacenter_configure`;
CREATE TABLE `datacenter_configure` (
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `server_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `application_catagory` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data_dimension` int(1) DEFAULT NULL,
  `configure_status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datacenter_configure
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_api_bamboo
-- ----------------------------
DROP TABLE IF EXISTS `dcos_api_bamboo`;
CREATE TABLE `dcos_api_bamboo` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `port` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `port2` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port3` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port4` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `token` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dcos_api_bamboo_1` (`ip`,`port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_api_bamboo
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_api_manage
-- ----------------------------
DROP TABLE IF EXISTS `dcos_api_manage`;
CREATE TABLE `dcos_api_manage` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `gname` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `port` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port2` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port3` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port4` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `token` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dcos_api_manage_1` (`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_api_manage
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_apps
-- ----------------------------
DROP TABLE IF EXISTS `dcos_apps`;
CREATE TABLE `dcos_apps` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_context` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cfg_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dcos_apps_1` (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_apps
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_apps_version
-- ----------------------------
DROP TABLE IF EXISTS `dcos_apps_version`;
CREATE TABLE `dcos_apps_version` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `attach_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cfg_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commit_log` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `publish_log` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `release_version` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '软件发布版本号',
  `release_time` datetime DEFAULT NULL COMMENT '发版时间',
  `deploy_time` datetime DEFAULT NULL COMMENT '发布上线时间',
  `deploy_remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布说明',
  `serial_num` varchar(100) DEFAULT NULL,
  `image_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '应用版本对应的镜像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dcos_apps_version_1` (`app_id`,`attach_id`,`cfg_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_apps_version
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_app_mapi
-- ----------------------------
DROP TABLE IF EXISTS `dcos_app_mapi`;
CREATE TABLE `dcos_app_mapi` (
  `app_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DCOS_API_MANAGE.ID',
  PRIMARY KEY (`app_id`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_app_mapi
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_app_package_store
-- ----------------------------
DROP TABLE IF EXISTS `dcos_app_package_store`;
CREATE TABLE `dcos_app_package_store` (
  `app_id` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `remote_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dcos_app_package_store
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_autoscale_logs
-- ----------------------------
DROP TABLE IF EXISTS `dcos_autoscale_logs`;
CREATE TABLE `dcos_autoscale_logs` (
  `log_time` datetime(6) NOT NULL,
  `marathon_endpoint` varchar(255) CHARACTER SET latin1 NOT NULL,
  `app_id` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_autoscale_logs
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_autoscale_policy
-- ----------------------------
DROP TABLE IF EXISTS `dcos_autoscale_policy`;
CREATE TABLE `dcos_autoscale_policy` (
  `marathon_endpoint` varchar(255) NOT NULL,
  `app_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `autoscale_admin` tinyint(10) NOT NULL,
  `scale_policy` varchar(2000) NOT NULL COMMENT 'json',
  `last_scale` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`marathon_endpoint`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_autoscale_policy
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_autoscale_policy_copy
-- ----------------------------
DROP TABLE IF EXISTS `dcos_autoscale_policy_copy`;
CREATE TABLE `dcos_autoscale_policy_copy` (
  `marathon_endpoint` varchar(255) NOT NULL,
  `app_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `autoscale_admin` tinyint(10) NOT NULL,
  `scale_policy` varchar(2000) NOT NULL COMMENT 'json',
  `last_scale` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`marathon_endpoint`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_autoscale_policy_copy
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_bapi_mapi
-- ----------------------------
DROP TABLE IF EXISTS `dcos_bapi_mapi`;
CREATE TABLE `dcos_bapi_mapi` (
  `bid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DCOS_API_MANAGE.ID',
  PRIMARY KEY (`bid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_bapi_mapi
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_cluster
-- ----------------------------
DROP TABLE IF EXISTS `dcos_cluster`;
CREATE TABLE `dcos_cluster` (
  `id` varchar(255) NOT NULL,
  `type` varchar(32) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `run_status` varchar(10) NOT NULL DEFAULT '0',
  `host_num` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `master_id` varchar(255) DEFAULT NULL COMMENT '依赖的master集群id',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `step` varchar(255) DEFAULT NULL,
  `zk_str` varchar(255) DEFAULT NULL,
  `mesos_str` varchar(255) DEFAULT NULL,
  `marathon_str` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_cluster_host
-- ----------------------------
DROP TABLE IF EXISTS `dcos_cluster_host`;
CREATE TABLE `dcos_cluster_host` (
  `id` varchar(255) NOT NULL,
  `cls_id` varchar(255) DEFAULT NULL,
  `ip_addr` varchar(255) DEFAULT NULL,
  `port_info` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `mem` int(11) DEFAULT NULL,
  `disk` int(11) DEFAULT NULL,
  `cpu_used` int(11) DEFAULT NULL,
  `mem_used` int(11) DEFAULT NULL,
  `disk_used` int(11) DEFAULT NULL,
  `run_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_cluster_host
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_container_instance
-- ----------------------------
DROP TABLE IF EXISTS `dcos_container_instance`;
CREATE TABLE `dcos_container_instance` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `container_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `host` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ip_addresses` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ports` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `started_at` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `staged_at` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `slave_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `alive` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `more` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dcos_container_instance_1` (`container_id`),
  KEY `idx_dcos_container_instance_2` (`app_id`),
  KEY `idx_dcos_container_instance_3` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_container_instance
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_host
-- ----------------------------
DROP TABLE IF EXISTS `dcos_host`;
CREATE TABLE `dcos_host` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `label` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '暂时无用',
  `ip_addr` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cpus` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mem` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `cls_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`ip_addr`),
  UNIQUE KEY `idx_dcos_host_1` (`ip_addr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_host
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_host_serv
-- ----------------------------
DROP TABLE IF EXISTS `dcos_host_serv`;
CREATE TABLE `dcos_host_serv` (
  `host_id` varchar(255) NOT NULL DEFAULT '' COMMENT '关联到dcos_host表id,多对一',
  `service_name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `v1` varchar(255) DEFAULT NULL COMMENT '暂时用来保存marathon name',
  `v2` varchar(255) DEFAULT NULL,
  `v3` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_host_serv
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_mapi_cluster
-- ----------------------------
DROP TABLE IF EXISTS `dcos_mapi_cluster`;
CREATE TABLE `dcos_mapi_cluster` (
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DCOS_API_MANAGE.ID',
  `gid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`mid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_mapi_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_mon_phones
-- ----------------------------
DROP TABLE IF EXISTS `dcos_mon_phones`;
CREATE TABLE `dcos_mon_phones` (
  `contact_name` varchar(16) NOT NULL,
  `contact_phone` varchar(11) NOT NULL,
  `alarm_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`contact_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_mon_phones
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_mon_phones_app_rela
-- ----------------------------
DROP TABLE IF EXISTS `dcos_mon_phones_app_rela`;
CREATE TABLE `dcos_mon_phones_app_rela` (
  `contact_name` varchar(20) NOT NULL,
  `app_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_mon_phones_app_rela
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_res_pool
-- ----------------------------
DROP TABLE IF EXISTS `dcos_res_pool`;
CREATE TABLE `dcos_res_pool` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  `node_num` int(11) NOT NULL COMMENT '节点类型: 1,3,5',
  `create_user` varchar(255) NOT NULL DEFAULT '' COMMENT '创建人',
  `step` varchar(20) DEFAULT '0' COMMENT '创建步骤 0、zookeeper、mesos-master、marathon、nginx、done按照该顺序更新',
  `run_status` varchar(1) DEFAULT '0' COMMENT '运行状态 0 创建中 5 销毁中 9 运行中',
  `remark` varchar(255) DEFAULT NULL,
  `zk_addr` varchar(255) DEFAULT NULL,
  `mesos_str` varchar(255) DEFAULT NULL,
  `marathon_str` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_res_pool
-- ----------------------------

-- ----------------------------
-- Table structure for dcos_user_cluster
-- ----------------------------
DROP TABLE IF EXISTS `dcos_user_cluster`;
CREATE TABLE `dcos_user_cluster` (
  `username` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dcos_user_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for dockerfile
-- ----------------------------
DROP TABLE IF EXISTS `dockerfile`;
CREATE TABLE `dockerfile` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1',
  `dockerfile` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_file` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_image` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `make_json` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`app_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dockerfile
-- ----------------------------

-- ----------------------------
-- Table structure for edgebox_user
-- ----------------------------
DROP TABLE IF EXISTS `edgebox_user`;
CREATE TABLE `edgebox_user` (
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(1) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of edgebox_user
-- ----------------------------

-- ----------------------------
-- Table structure for haproxy_current_data
-- ----------------------------
DROP TABLE IF EXISTS `haproxy_current_data`;
CREATE TABLE `haproxy_current_data` (
  `time` datetime DEFAULT NULL,
  `hostname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `containername` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `haproxy_type` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `queue_cur` bigint(12) DEFAULT NULL,
  `session_rate` bigint(12) DEFAULT NULL,
  `session_cur` bigint(12) DEFAULT NULL,
  `check_cost_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `host` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of haproxy_current_data
-- ----------------------------

-- ----------------------------
-- Table structure for haproxy_history_data
-- ----------------------------
DROP TABLE IF EXISTS `haproxy_history_data`;
CREATE TABLE `haproxy_history_data` (
  `seq` bigint(20) NOT NULL,
  `time` datetime DEFAULT NULL,
  `haproxy_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_session_scur` int(6) DEFAULT NULL,
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of haproxy_history_data
-- ----------------------------

-- ----------------------------
-- Table structure for hosts_mon_detail
-- ----------------------------
DROP TABLE IF EXISTS `hosts_mon_detail`;
CREATE TABLE `hosts_mon_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu` double(255,0) DEFAULT '0',
  `mem` double(255,0) DEFAULT '0',
  `disk_read` double(255,0) DEFAULT '0',
  `disk_write` double(255,0) DEFAULT '0',
  `net_recv` double(255,0) DEFAULT '0',
  `net_sent` double(255,0) DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=807251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hosts_mon_detail
-- ----------------------------
INSERT INTO `hosts_mon_detail` VALUES ('807235', '24', '53', '0', '12288', '9456', '8875', '2016-12-14 18:00:41', '192.168.2.23');
INSERT INTO `hosts_mon_detail` VALUES ('807236', '26', '25', '0', '0', '16647', '17972', '2016-12-14 18:00:41', '192.168.2.24');
INSERT INTO `hosts_mon_detail` VALUES ('807237', '32', '30', '0', '16384', '832', '210', '2016-12-14 18:00:41', '192.168.2.26');
INSERT INTO `hosts_mon_detail` VALUES ('807238', '38', '33', '245760', '17408', '422', '0', '2016-12-14 18:00:41', '192.168.2.27');
INSERT INTO `hosts_mon_detail` VALUES ('807239', '25', '53', '0', '12288', '9244', '9030', '2016-12-14 18:01:11', '192.168.2.23');
INSERT INTO `hosts_mon_detail` VALUES ('807240', '25', '25', '0', '0', '16728', '17939', '2016-12-14 18:01:11', '192.168.2.24');
INSERT INTO `hosts_mon_detail` VALUES ('807241', '32', '30', '278528', '0', '816', '210', '2016-12-14 18:01:11', '192.168.2.26');
INSERT INTO `hosts_mon_detail` VALUES ('807242', '38', '33', '8351744', '650752', '346', '0', '2016-12-14 18:01:11', '192.168.2.27');
INSERT INTO `hosts_mon_detail` VALUES ('807243', '25', '53', '0', '4096', '8911', '8842', '2016-12-14 18:01:41', '192.168.2.23');
INSERT INTO `hosts_mon_detail` VALUES ('807244', '24', '25', '0', '0', '16468', '17612', '2016-12-14 18:01:41', '192.168.2.24');
INSERT INTO `hosts_mon_detail` VALUES ('807245', '31', '30', '1978368', '24576', '468', '210', '2016-12-14 18:01:41', '192.168.2.26');
INSERT INTO `hosts_mon_detail` VALUES ('807246', '36', '33', '8364032', '1936384', '362', '0', '2016-12-14 18:01:41', '192.168.2.27');
INSERT INTO `hosts_mon_detail` VALUES ('807247', '25', '53', '0', '20480', '9856', '11927', '2016-12-14 18:02:11', '192.168.2.23');
INSERT INTO `hosts_mon_detail` VALUES ('807248', '24', '25', '0', '0', '16341', '17709', '2016-12-14 18:02:11', '192.168.2.24');
INSERT INTO `hosts_mon_detail` VALUES ('807249', '30', '30', '1699840', '49152', '714', '210', '2016-12-14 18:02:11', '192.168.2.26');
INSERT INTO `hosts_mon_detail` VALUES ('807250', '35', '33', '12288', '1363968', '332', '0', '2016-12-14 18:02:11', '192.168.2.27');

-- ----------------------------
-- Table structure for image_info
-- ----------------------------
DROP TABLE IF EXISTS `image_info`;
CREATE TABLE `image_info` (
  `id` varchar(64) NOT NULL,
  `img_name` varchar(64) DEFAULT NULL,
  `img_type` varchar(20) DEFAULT NULL,
  `img_info` text,
  `app_name` varchar(20) DEFAULT NULL,
  `version_count` int(11) DEFAULT NULL,
  `latest_version` varchar(64) DEFAULT NULL,
  `environment` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image_info
-- ----------------------------

-- ----------------------------
-- Table structure for image_version_info
-- ----------------------------
DROP TABLE IF EXISTS `image_version_info`;
CREATE TABLE `image_version_info` (
  `id` varchar(64) NOT NULL,
  `img_name` varchar(64) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `config_info` text,
  `docfile` text,
  `env` text,
  `status` varchar(10) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image_version_info
-- ----------------------------

-- ----------------------------
-- Table structure for img_autoreleases
-- ----------------------------
DROP TABLE IF EXISTS `img_autoreleases`;
CREATE TABLE `img_autoreleases` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(32) DEFAULT NULL,
  `image_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of img_autoreleases
-- ----------------------------
INSERT INTO `img_autoreleases` VALUES ('40', 'basic_app_id_', 'basic_image_name_');

-- ----------------------------
-- Table structure for jenkins_ci
-- ----------------------------
DROP TABLE IF EXISTS `jenkins_ci`;
CREATE TABLE `jenkins_ci` (
  `JENKINSCIID` int(11) NOT NULL AUTO_INCREMENT,
  `JOBNAME` varchar(300) NOT NULL,
  `BUILDID` varchar(300) NOT NULL,
  `CREATEDATE` datetime NOT NULL,
  `UPDATEDATA` datetime NOT NULL,
  `LOGLIST` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`JENKINSCIID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jenkins_ci
-- ----------------------------
INSERT INTO `jenkins_ci` VALUES ('7', 'tomcat', '0', '2016-06-23 09:42:22', '2016-06-23 09:42:22', null);
INSERT INTO `jenkins_ci` VALUES ('20', 'sjyyt-web', '0', '2016-06-25 09:49:00', '2016-06-25 09:49:00', null);
INSERT INTO `jenkins_ci` VALUES ('24', 'demo', '0', '2016-06-27 11:18:00', '2016-06-27 11:18:00', null);
INSERT INTO `jenkins_ci` VALUES ('25', 'www', '0', '2016-06-27 11:18:00', '2016-06-27 11:18:00', null);
INSERT INTO `jenkins_ci` VALUES ('26', 'www', '0', '2016-06-27 11:18:00', '2016-06-27 11:18:00', null);
INSERT INTO `jenkins_ci` VALUES ('27', 'foxx000', '0', '2016-06-27 11:18:00', '2016-06-27 11:18:00', null);
INSERT INTO `jenkins_ci` VALUES ('28', 'foxx000', '0', '2016-06-27 11:18:00', '2016-06-27 11:18:00', null);
INSERT INTO `jenkins_ci` VALUES ('29', 'foxx000', '0', '2016-06-27 11:18:00', '2016-06-27 11:18:00', null);
INSERT INTO `jenkins_ci` VALUES ('30', 'foxx001', '0', '2016-06-27 11:18:00', '2016-06-27 11:18:00', null);

-- ----------------------------
-- Table structure for jenkins_task
-- ----------------------------
DROP TABLE IF EXISTS `jenkins_task`;
CREATE TABLE `jenkins_task` (
  `JENKINS_TASK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `JOB_NAME` varchar(200) NOT NULL,
  `CODE_REPO_TYPE` varchar(300) NOT NULL,
  `SCMURL` varchar(600) NOT NULL,
  `POLL` varchar(200) NOT NULL,
  `SHELL` varchar(500) NOT NULL,
  `PROGRESSBAR` varchar(300) NOT NULL,
  `STATUS` varchar(300) NOT NULL,
  `CREATEDATE` datetime NOT NULL,
  `UPDATE_TIME` datetime NOT NULL,
  PRIMARY KEY (`JENKINS_TASK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jenkins_task
-- ----------------------------
INSERT INTO `jenkins_task` VALUES ('20', 'sjyyt-web', 'None', 'None', 'None', '0', '0', '0', '2016-06-27 18:08:12', '2016-06-27 18:08:12');
INSERT INTO `jenkins_task` VALUES ('24', 'demo', 'None', 'None', 'None', '0', '0', '0', '2016-06-27 17:43:45', '2016-06-27 17:43:45');
INSERT INTO `jenkins_task` VALUES ('25', 'www', 'None', 'None', 'None', '0', '0', '0', '2016-06-27 18:34:24', '2016-06-27 18:34:24');
INSERT INTO `jenkins_task` VALUES ('26', 'www', 'None', 'None', 'None', '0', '0', '0', '2016-06-27 18:50:28', '2016-06-27 18:50:28');
INSERT INTO `jenkins_task` VALUES ('27', 'foxx000', 'None', 'None', 'None', '0', '0', '0', '2016-06-27 18:54:30', '2016-06-27 18:54:30');
INSERT INTO `jenkins_task` VALUES ('28', 'foxx000', 'None', 'None', 'None', '0', '0', '0', '2016-06-27 18:56:41', '2016-06-27 18:56:41');
INSERT INTO `jenkins_task` VALUES ('29', 'foxx000', 'None', 'None', 'None', '0', '0', '0', '2016-06-27 19:00:55', '2016-06-27 19:00:55');
INSERT INTO `jenkins_task` VALUES ('30', 'foxx001', 'None', 'None', 'None', '0', '0', '0', '2016-06-27 19:03:03', '2016-06-27 19:03:03');

-- ----------------------------
-- Table structure for marathon_current_data
-- ----------------------------
DROP TABLE IF EXISTS `marathon_current_data`;
CREATE TABLE `marathon_current_data` (
  `data_collect_time` datetime DEFAULT NULL,
  `app_id` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instance_count` bigint(10) DEFAULT NULL,
  `marathon_mem` bigint(10) DEFAULT NULL,
  `marathon_cpu` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marathon_current_data
-- ----------------------------

-- ----------------------------
-- Table structure for marathon_data
-- ----------------------------
DROP TABLE IF EXISTS `marathon_data`;
CREATE TABLE `marathon_data` (
  `cluster_runtime_id` int(11) NOT NULL AUTO_INCREMENT,
  `data_collect_time` datetime DEFAULT NULL,
  `app_id` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instance_count` bigint(10) DEFAULT NULL,
  `marathon_mem` bigint(10) DEFAULT NULL,
  `marathon_cpu` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`cluster_runtime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marathon_data
-- ----------------------------

-- ----------------------------
-- Table structure for mesos_current_data
-- ----------------------------
DROP TABLE IF EXISTS `mesos_current_data`;
CREATE TABLE `mesos_current_data` (
  `cluster_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data_collect_time` datetime DEFAULT NULL,
  `cpu_total` decimal(10,1) DEFAULT NULL,
  `cpu_used` decimal(10,1) DEFAULT NULL,
  `disk_total` decimal(30,1) DEFAULT NULL,
  `disk_used` decimal(30,1) DEFAULT NULL,
  `mem_total` decimal(30,1) DEFAULT NULL,
  `mem_used` decimal(30,1) DEFAULT NULL,
  `slaves_active` decimal(10,1) DEFAULT NULL,
  `slaves_inactive` decimal(10,1) DEFAULT NULL,
  `slaves_connected` decimal(10,1) DEFAULT NULL,
  `slaves_disconnected` decimal(10,1) DEFAULT NULL,
  `tasks_error` decimal(30,1) DEFAULT NULL,
  `tasks_failed` decimal(30,1) DEFAULT NULL,
  `tasks_running` decimal(30,1) DEFAULT NULL,
  `tasks_staging` decimal(30,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mesos_current_data
-- ----------------------------

-- ----------------------------
-- Table structure for mesos_data
-- ----------------------------
DROP TABLE IF EXISTS `mesos_data`;
CREATE TABLE `mesos_data` (
  `cluster_runtime_id` int(11) NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data_collect_time` datetime DEFAULT NULL,
  `cpu_total` decimal(10,1) DEFAULT NULL,
  `cpu_used` decimal(10,1) DEFAULT NULL,
  `disk_total` decimal(30,1) DEFAULT NULL,
  `disk_used` decimal(30,1) DEFAULT NULL,
  `mem_total` decimal(30,1) DEFAULT NULL,
  `mem_used` decimal(30,1) DEFAULT NULL,
  `slaves_active` decimal(10,1) DEFAULT NULL,
  `slaves_inactive` decimal(10,1) DEFAULT NULL,
  `slaves_connected` decimal(10,1) DEFAULT NULL,
  `slaves_disconnected` decimal(10,1) DEFAULT NULL,
  `tasks_error` decimal(30,1) DEFAULT NULL,
  `tasks_failed` decimal(30,1) DEFAULT NULL,
  `tasks_running` decimal(30,1) DEFAULT NULL,
  `tasks_staging` decimal(30,1) DEFAULT NULL,
  PRIMARY KEY (`cluster_runtime_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mesos_data
-- ----------------------------

-- ----------------------------
-- Table structure for mon_app_detail
-- ----------------------------
DROP TABLE IF EXISTS `mon_app_detail`;
CREATE TABLE `mon_app_detail` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cluster_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `host_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_cpu_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_mem_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_disk_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ratio_cpu` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ratio_mem` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ratio_disk` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ratio_jvm` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `thread_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `concurrence_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instance_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instance_port` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instance_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `batch_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mon_app_detail_2` (`create_time`),
  KEY `idx_mon_app_detail_1` (`cluster_id`,`host_id`,`app_id`,`container_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_app_detail
-- ----------------------------

-- ----------------------------
-- Table structure for mon_app_statis
-- ----------------------------
DROP TABLE IF EXISTS `mon_app_statis`;
CREATE TABLE `mon_app_statis` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cluster_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `host_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_cpu_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_mem_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_disk_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ratio_cpu` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ratio_mem` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ratio_disk` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ratio_jvm` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `thread_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `concurrence_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `batch_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mon_app_statis_2` (`create_time`),
  KEY `idx_mon_app_statis_1` (`cluster_id`,`host_id`,`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_app_statis
-- ----------------------------

-- ----------------------------
-- Table structure for mon_dcos
-- ----------------------------
DROP TABLE IF EXISTS `mon_dcos`;
CREATE TABLE `mon_dcos` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `center_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `slave_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `master_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `slave_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `zk_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ha_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `marathon_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `batch_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `total_cpu` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'CPU总共可用资源',
  `total_mem` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '内存总共可用资源',
  `total_disk` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '磁盘总共可用资源',
  `total_cpu_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'CPU总共已用资源',
  `total_mem_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '内存总共已用资源',
  `total_disk_used` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '磁盘总共已用资源',
  `container_count` varchar(255) DEFAULT NULL,
  `info` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '存错误信息 或者 节点leader ip',
  PRIMARY KEY (`id`),
  KEY `idx_mon_dcos_1` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_dcos
-- ----------------------------

-- ----------------------------
-- Table structure for mon_ha_detail
-- ----------------------------
DROP TABLE IF EXISTS `mon_ha_detail`;
CREATE TABLE `mon_ha_detail` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cluster_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `host_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `queue_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `session_rate` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `session_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `check_cost_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instance_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instance_port` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `batch_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mon_ha_detail_2` (`create_time`),
  KEY `idx_mon_ha_detail_1` (`cluster_id`,`host_id`,`app_id`,`container_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mon_ha_detail
-- ----------------------------

-- ----------------------------
-- Table structure for nginx
-- ----------------------------
DROP TABLE IF EXISTS `nginx`;
CREATE TABLE `nginx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL COMMENT 'nginx ip ',
  `port` int(11) DEFAULT '81' COMMENT '默认 81',
  `type` int(11) DEFAULT '0' COMMENT '0 ：程序包下载地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nginx
-- ----------------------------
INSERT INTO `nginx` VALUES ('1', '192.168.2.24', '81', '0');

-- ----------------------------
-- Table structure for rel
-- ----------------------------
DROP TABLE IF EXISTS `rel`;
CREATE TABLE `rel` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `repo_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rel
-- ----------------------------

-- ----------------------------
-- Table structure for restful_api
-- ----------------------------
DROP TABLE IF EXISTS `restful_api`;
CREATE TABLE `restful_api` (
  `restful_api_id` bigint(20) NOT NULL,
  `restful_api_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `restful_api_port` int(5) NOT NULL,
  `restful_api_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `api_username` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `api_password` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `is_default` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `bamboo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`restful_api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of restful_api
-- ----------------------------

-- ----------------------------
-- Table structure for script_store
-- ----------------------------
DROP TABLE IF EXISTS `script_store`;
CREATE TABLE `script_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `script_name` varchar(512) NOT NULL COMMENT '脚本名',
  `script_desc` varchar(1024) DEFAULT NULL COMMENT '脚本描述',
  `script_path` varchar(256) NOT NULL COMMENT '执行目录',
  `script_type` varchar(512) DEFAULT NULL COMMENT '脚本类型 python/sh',
  `upload_people` varchar(125) DEFAULT NULL COMMENT '上传人',
  `upload_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `nginx_ip` varchar(60) NOT NULL COMMENT '下载地址',
  `nginx_port` varchar(10) NOT NULL COMMENT '下载端口',
  `nginx_path` varchar(125) NOT NULL COMMENT '下载目录',
  `nginx_script_name` varchar(125) NOT NULL COMMENT 'nginx_script_name',
  `docklet_ip` varchar(1024) DEFAULT NULL COMMENT 'docklet 执行地址',
  `is_crontab` tinyint(4) DEFAULT '0' COMMENT '1 定时 0 不定时',
  `crontab` varchar(125) DEFAULT NULL COMMENT 'Linux crontab 定时规则',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of script_store
-- ----------------------------

-- ----------------------------
-- Table structure for security_verify
-- ----------------------------
DROP TABLE IF EXISTS `security_verify`;
CREATE TABLE `security_verify` (
  `security_code_id` int(5) DEFAULT NULL,
  `security_verify_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `security_verify_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_verify
-- ----------------------------
INSERT INTO `security_verify` VALUES ('11111', '重启服务器', '1qaz2wsx');
INSERT INTO `security_verify` VALUES ('99999', '关闭数据中心', '1qaz2wsx');
INSERT INTO `security_verify` VALUES ('11111', '重启服务器', '1qaz2wsx');
INSERT INTO `security_verify` VALUES ('99999', '关闭数据中心', '1qaz2wsx');

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `service_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `service_directory` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_resource` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auto_scale_up` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `auto_scale_down` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `service_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `run_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `restart_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `marathon_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `env` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cost_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ha_acl` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ha_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instances` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '应用归类',
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `idx_services_1` (`service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of services
-- ----------------------------

-- ----------------------------
-- Table structure for service_directory
-- ----------------------------
DROP TABLE IF EXISTS `service_directory`;
CREATE TABLE `service_directory` (
  `service_directory_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `service_directory_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `commands` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `service_directory_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`service_directory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_directory
-- ----------------------------

-- ----------------------------
-- Table structure for service_level
-- ----------------------------
DROP TABLE IF EXISTS `service_level`;
CREATE TABLE `service_level` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `cpu` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mem` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cpu_used` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mem_used` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk_used` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_level
-- ----------------------------

-- ----------------------------
-- Table structure for service_level_list
-- ----------------------------
DROP TABLE IF EXISTS `service_level_list`;
CREATE TABLE `service_level_list` (
  `level_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`level_id`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_level_list
-- ----------------------------

-- ----------------------------
-- Table structure for slave_node_type
-- ----------------------------
DROP TABLE IF EXISTS `slave_node_type`;
CREATE TABLE `slave_node_type` (
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of slave_node_type
-- ----------------------------
INSERT INTO `slave_node_type` VALUES ('Web', 'web');
INSERT INTO `slave_node_type` VALUES ('App', 'app');
INSERT INTO `slave_node_type` VALUES ('Web', 'web');
INSERT INTO `slave_node_type` VALUES ('App', 'app');

-- ----------------------------
-- Table structure for sys_app_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_type`;
CREATE TABLE `sys_app_type` (
  `domain` varchar(20) DEFAULT NULL,
  `subsystem` varchar(20) DEFAULT NULL,
  `app` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_type
-- ----------------------------
INSERT INTO `sys_app_type` VALUES ('crm', 'scrm', 'web');
INSERT INTO `sys_app_type` VALUES ('crm', 'ncrm', 'app');
INSERT INTO `sys_app_type` VALUES ('crm', 'scrm', 'app');

-- ----------------------------
-- Table structure for sys_attach
-- ----------------------------
DROP TABLE IF EXISTS `sys_attach`;
CREATE TABLE `sys_attach` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `format` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `raw_filename` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk_filename` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `full_filename` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `length` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `md5` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `busi_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '业务类型',
  `attach_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '附件来源',
  PRIMARY KEY (`id`),
  KEY `idx_sys_attach` (`disk_filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_attach
-- ----------------------------

-- ----------------------------
-- Table structure for sys_base_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_base_data`;
CREATE TABLE `sys_base_data` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sort` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `key` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value2` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value3` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value4` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value5` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value6` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value7` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value8` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value9` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `value10` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_base_data
-- ----------------------------
INSERT INTO `sys_base_data` VALUES ('1464900395188', '', 'CFG_MESOS', '', '192.168.2.23:2181', 'mesos', 'dcosadmin', 'zjdcos01', 'v2', null, null, '', '', '', '', '');
INSERT INTO `sys_base_data` VALUES ('1467971721227', null, 'APP_SORT', null, 'addapps', '测试应用组', 'null', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('1468229272129', null, 'CFG_MESOS', null, '192.168.2.51:2181,192.168.2.54:2181,192.168.2.56:2181', 'mesos', 'dcosadmin', 'zjdcos01', 'v2', null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('1468229422145', null, 'CFG_MESOS', null, '192.168.2.186:2181', 'mesos', 'dcosadmin', 'zjdcos01', 'v2', null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('IDS', null, 'IDS', null, 'LAST_ID', '1468229492149', 'UNLOCK', null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('ao101', null, 'APP_ORIGIN', null, '1', '服务器下载', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('ao102', null, 'APP_ORIGIN', null, '2', '本地上传', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('ao103', null, 'APP_ORIGIN', null, '3', '持续集成', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('as101', null, 'APP_SORT', null, 'sjyyt', '手机营业厅', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('as102', null, 'APP_SORT', null, 'scrm', '营业厅', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('c101', null, 'CODE_REPO_TYPE', null, 'git', 'Git', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('c102', null, 'CODE_REPO_TYPE', null, 'svn', 'SVN', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('c103', null, 'CODE_REPO_TYPE', null, 'cvs', 'CVS', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('dm101', null, 'DEPLOY_MODE', null, '1', '挂载程序包', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('dm102', null, 'DEPLOY_MODE', null, '2', '镜像上传', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('e101', null, 'ENV_TYPE', null, 'yf', '研发', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('e102', null, 'ENV_TYPE', null, 'cs', '测试', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('e103', null, 'ENV_TYPE', null, 'sc', '生产', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('mw101', null, 'MW_NAME', null, 'tomcat', 'TOMCAT', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('mw102', null, 'MW_NAME', null, 'weblogic', 'WEBLOGIC', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('os101', null, 'OS_NAME', null, 'centos', 'CENTOS', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('os102', null, 'OS_NAME', null, 'redhat', 'REDHAT', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('rp101', null, 'RULE_TYPE', null, 'thread', 'thread', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('rp102', null, 'RULE_TYPE', null, 'cpu', 'cpu', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('rp103', null, 'RULE_TYPE', null, 'memory', 'memory', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('ul101', null, 'USER_LEVEL', null, '1', '二级管理员', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('ul102', null, 'USER_LEVEL', null, '2', '普通租户', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('ut101', null, 'USER_TYPE', null, '1', '平台用户', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_base_data` VALUES ('ut102', null, 'USER_TYPE', null, '2', '应用用户', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for sys_data_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_permission`;
CREATE TABLE `sys_data_permission` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `display_status` varchar(32) DEFAULT '1',
  PRIMARY KEY (`username`,`service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_data_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `type` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `info` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `seq` varchar(32) NOT NULL,
  `url` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lv` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `op_obj` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '应用ID',
  `container_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '容器ID',
  `msg_status` tinyint(1) DEFAULT '0' COMMENT '通知状态，0: 未读; 1: 已读',
  `RESULT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `idx_sys_log` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_copy`;
CREATE TABLE `sys_log_copy` (
  `type` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `info` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `seq` varchar(32) NOT NULL,
  `url` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lv` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `op_obj` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '应用ID',
  `container_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '容器ID',
  `msg_status` tinyint(1) DEFAULT '0' COMMENT '通知状态，0: 未读; 1: 已读',
  `RESULT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `idx_sys_log` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log_copy
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mac` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  KEY `idx_sys_log_login` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `explain` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lv` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rank` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dom_class` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dom_style` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `dom_title` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `target` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1460796903659', 'g', '发布', 'FTP文件中转方式发布', '/iCloud/view/publishFtp.html', '2', 'g03', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1461062896045', '', '集群管理', '集群管理', '#', '1', 'h', 'fa-th', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464146417844', 'c', '应用列表', '应用列表', '/iCloud/view/appManage/appList.html', '2', 'a01', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464163251216', '', '镜像管理', '镜像管理', '/iCloud/view/cluster/clusterList.html', '1', 'r', 'list-group-item active', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464163313088', 'c', '镜像仓库', '镜像仓库', '/iCloud/view/repository/repositoryAddDel.html', '2', 'f03', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464164232062', '', '多多视角', '集群视角，服务栈视角，应用视角，主机视角，容器视角', '#', '1', 'v', 'list-group-item active', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464164288079', '1464164232062', '集群视角', '集群角度监控管理', '/iCloud/view/viewAngle/group.html', '2', 'v11', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464164331221', '1464164232062', '应用视角', '应用角度监控管理', '/iCloud/view/viewAngle/application.html', '2', 'v15', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464164645347', '1464164232062', '主机视角', '主机角度监控管理', '/iCloud/view/viewAngle/host.html', '2', 'v17', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464164697746', '1464164232062', '容器视角', '容器角度监控管理', '/iCloud/view/viewAngle/container.html', '2', 'v19', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1464164774136', '1464164232062', '服务栈视角', '服务栈角度监控管理', '/iCloud/view/viewAngle/serviceStack.html', '2', 'v13', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1466749619970', 'e', '二级用户管理', '普通租户签发', '/iCloud/view/secUserManage.html', '2', '', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1466997384252', 'c', '程序仓库', '程序包发布', '/iCloud/view/appPackageManage.html', '2', 'c05', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1467507288825', '', 'woyuchengying', '', '/icloud', '1', '', 'list-group-item', '', '', '1', '');
INSERT INTO `sys_menu` VALUES ('1467873200623', 'f', '配置版本', '应用配置版本', '/iCloud/view/cfgAppPublicVersion.html', '2', 'c02', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468146363380', '', '监控告警', '监控告警', '#', '1', 'c', 'fa-tachometer', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468146364989', '', '日志管理', '日志管理', '#', '1', 'd', 'fa-list-alt', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468216027930', 'f', '应用迁移', '应用迁移', '/iCloud/view/migration/migration.html', '2', 'c123', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468222951497', '1468146363380', '告警维护', '告警维护', '/iCloud/view/alarm/alarm.html', '2', 'C999', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223031505', '1468146363380', '监控日志', '', '/iCloud/view/monAlarm/monAlarm.html', '2', '', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223061508', '1461062896045', '集群管理', '集群管理子菜单', '/iCloud/view/cluster/clusterList.html', '2', '1', 'menu', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223071509', '', '任务管理', '任务管理', '#', '1', 't', 'fa-tasks', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223071510', 'c', '短时任务', '短时任务', '/iCloud/view/task/shortTask2.html', '2', 'c01', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223121514', 'c', '应用配置', '应用管理租户视角配置菜单', '/iCloud/view/user/cfgAppPublic.html', '2', 'd08', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223441546', 'c', '弹性配置', '弹性配置新', '/iCloud/view/copyscaleRule.html', '2', 'd01', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223601564', '', '服务集成', '服务集成包括mysql   kafka   redis', '#', '1', 'g', 'fa-tasks', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223601565', 'c', '服务集成', '服务集成子菜单', '/iCloud/view/clusterservice/index.html', '2', 'c02', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223691595', 'c', '网络管理', '用于管理网络', '/iCloud/view/NKVM/Network.html', '2', 'e99', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468223701572', 'c', '有状态应用', '用于网络存储管理', '/iCloud/view/NKVM/applist.html', '2', 'b88', 'menu-text', '', '', '1', '');
INSERT INTO `sys_menu` VALUES ('1468224061608', 'c', '策略管理', '策略管理', '/iCloud/view/appwarning/warninglist.html', '2', 'g08', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('1468224101612', '1468146364989', '日志查询', '日志查询功能', '/iCloud/view/appLog/appLog.html', '2', 'd08', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('41', 'f', '平台恢复', '平台常用恢复功能', '/iCloud/view/command.html', '2', 'f04', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('61', 'f', '大屏幕监控', '大屏幕监控', '/iCloud/view/dashboardBig2.html', '2', 'f04', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('82', 'g', '应用创建', '应用发布和再发布', '/iCloud/view/publish.html', '2', 'g03', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('c', '', '应用管理', '应用管理', '#', '1', 'a', 'fa-tasks', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('c01', 'c', '应用列表', '应用列表', '/iCloud/view/services.html', '2', 'c01', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('c02', 'c', '服务模板', '服务模板', '/iCloud/view/serviceDirectory.html', '2', 'c02', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('c03', 'c', '容器模板', '容器模板', '/iCloud/view/containerResource.html', '2', 'c03', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('c04', 'c', '服务扩缩容', '扩容缩容', '/iCloud/view/servicesScale.html', '2', 'c04', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('c05', 'c', '服务重启', '服务启停', '/iCloud/view/servicesRestart.html', '2', 'c05', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('c06', 'c', '应用配置', '应用发布配置', '/iCloud/view/cfgAppPublic.html', '2', 'f06', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('c07', 'c', '弹性配置旧', '弹性扩缩策略配置', '/iCloud/view/scaleRule.html', '2', 'f07', 'menu-text', '', '', '1', '');
INSERT INTO `sys_menu` VALUES ('d', '', '性能管理', '性能管理', '#', '1', 'b', 'fa-hdd-o', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('d01', 'd', '容器性能', '容器性能', '/iCloud/view/containerPerformance.html', '2', 'd01', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('d02', 'd', '路由性能', '路由性能', '/iCloud/view/haproxyPerformance.html', '2', 'd02', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('d03', '1468146363380', '监控管理', '监控', '/iCloud/view/frameForMonitor.html', '2', 'd03', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('d04', '1468146363380', '告警管理', '告警管理', '/iCloud/view/frameForIcinga.html', '2', 'd04', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('d05', '1468146364989', '统一日志', '统一日志', '/iCloud/view/frameForGraylog.html', '2', 'd05', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('d06', '1468146364989', '平台日志', '平台日志', '/iCloud/view/platformLogV4.html', '2', 'd06', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('d07', 'd', '应用日志', '应用日志', '/iCloud/view/downloadLog.html', '2', 'd07', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('d08', 'd', 'HAProxy性能', 'HAProxy性能', '/iCloud/view/haproxyPerformance2.html', '2', 'd08', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('d09', 'd', '弹性扩缩日志', '弹性扩缩日志', '/iCloud/view/scaleLog.html', '2', 'd09', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('e', '', '用户管理', '用户管理', '#', '1', 's', 'fa-user', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('e01', 'e', '用户列表', '用户列表', '/iCloud/view/userManage.html', '2', 'e01', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('e02', 'e', '角色管理', '角色管理', '/iCloud/view/roleManage.html', '2', 'e02', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('e03', 'f', '功能模块', '功能模块管理', '/iCloud/view/menuManage.html', '2', 'e03', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('f', '', '平台配置', '平台配置', '#', '1', 'z', 'fa-gears', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('f02', 'f', 'Marathon配置', 'Marathon配置', '/iCloud/view/restfulApi.html', '2', 'f02', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('f04', 'f', 'Slave节点扩缩', 'Slave节点扩缩', '/iCloud/view/slaveNodeManage.html', '2', 'f04', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('f05', 'f', '基础数据', '基础数据维护', '/iCloud/view/baseData.html', '2', 'f05', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('f08', 'f', '模型对象', '模型对象配置', '/iCloud/view/settings/model.html', '2', 'f08', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('f09', 'f', '服务发现配置', '服务发现配置', '/iCloud/view/settings/service.html', '2', 'f09', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('f10', 'f', '管理接口', '管理接口配置', '/iCloud/view/settings/interface.html', '2', 'f10', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('f11', 'f', '应用显示', '应用显示配置', '/iCloud/view/appDisplayNum.html', '2', 'f11', 'menu-text', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('g', null, '持续集成', '持续集成', '#', '1', 'cg', 'list-group-item active', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('g01', 'g', '集成', 'Jenkins', '/iCloud/view/jenkins2.html', '2', 'g01', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('g02', 'g', '测试', 'Jmeter', '/iCloud/view/jmeter.html', '2', 'g02', 'menu-text', null, null, '0', null);
INSERT INTO `sys_menu` VALUES ('s', '', '统计报表', '', '#', '1', 'e', 'fa-bar-chart-o', '', '', '0', '');
INSERT INTO `sys_menu` VALUES ('s01', 's', '资源统计报表', '', '/iCloud/view/report/appReport.html', '2', 's01', 'menu-text', '', '', '0', '');

-- ----------------------------
-- Table structure for sys_mo
-- ----------------------------
DROP TABLE IF EXISTS `sys_mo`;
CREATE TABLE `sys_mo` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `obj` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_mo
-- ----------------------------
INSERT INTO `sys_mo` VALUES ('1', 'icloudAjax/restartService.dox', '服务重启');
INSERT INTO `sys_mo` VALUES ('2', 'icloudAjax/serviceZoom.dox', '服务扩缩容');
INSERT INTO `sys_mo` VALUES ('3', 'icloudAjax/deleteService.dox', '服务删除');
INSERT INTO `sys_mo` VALUES ('4', 'dataCenterViewAjax/dataCenterApplicationSwitch.dox', '数据中心切换');
INSERT INTO `sys_mo` VALUES ('5', 'dataCenterViewAjax/serverRestart.dox', '服务器重启');
INSERT INTO `sys_mo` VALUES ('6', 'service/doRollback.dox', '应用发布或回退');
INSERT INTO `sys_mo` VALUES ('7', 'service/doDeleteVersion.dox', '应用版本删除');
INSERT INTO `sys_mo` VALUES ('8', 'icloudAjax/updateConfToMarathon.dox', '更新容器规格');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '超级管理员', '0');
INSERT INTO `sys_role` VALUES ('1468229352145', '测试租户', '测试', '1');
INSERT INTO `sys_role` VALUES ('1468229462148', '集群高级用户', 'test', '1');
INSERT INTO `sys_role` VALUES ('2', '普通管理员', '普通管理员', '0');
INSERT INTO `sys_role` VALUES ('3', '应用租户', '应用租户', '0');
INSERT INTO `sys_role` VALUES ('4', '集群管理员', '集群管理员', '0');
INSERT INTO `sys_role` VALUES ('5', '集群租户', '集群租户', '0');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1461062896045');
INSERT INTO `sys_role_menu` VALUES ('1', '1464146417844');
INSERT INTO `sys_role_menu` VALUES ('1', '1464163313088');
INSERT INTO `sys_role_menu` VALUES ('1', '1466997384252');
INSERT INTO `sys_role_menu` VALUES ('1', '1467873200623');
INSERT INTO `sys_role_menu` VALUES ('1', '1468146363380');
INSERT INTO `sys_role_menu` VALUES ('1', '1468146364989');
INSERT INTO `sys_role_menu` VALUES ('1', '1468216027930');
INSERT INTO `sys_role_menu` VALUES ('1', '1468222951497');
INSERT INTO `sys_role_menu` VALUES ('1', '1468223031505');
INSERT INTO `sys_role_menu` VALUES ('1', '1468223061508');
INSERT INTO `sys_role_menu` VALUES ('1', '1468223071510');
INSERT INTO `sys_role_menu` VALUES ('1', '1468223441546');
INSERT INTO `sys_role_menu` VALUES ('1', 'c');
INSERT INTO `sys_role_menu` VALUES ('1', 'c06');
INSERT INTO `sys_role_menu` VALUES ('1', 'd');
INSERT INTO `sys_role_menu` VALUES ('1', 'd01');
INSERT INTO `sys_role_menu` VALUES ('1', 'd02');
INSERT INTO `sys_role_menu` VALUES ('1', 'd03');
INSERT INTO `sys_role_menu` VALUES ('1', 'd04');
INSERT INTO `sys_role_menu` VALUES ('1', 'd05');
INSERT INTO `sys_role_menu` VALUES ('1', 'd06');
INSERT INTO `sys_role_menu` VALUES ('1', 'e');
INSERT INTO `sys_role_menu` VALUES ('1', 'e01');
INSERT INTO `sys_role_menu` VALUES ('1', 'e02');
INSERT INTO `sys_role_menu` VALUES ('1', 'e03');
INSERT INTO `sys_role_menu` VALUES ('1', 'f');
INSERT INTO `sys_role_menu` VALUES ('1', 'f05');
INSERT INTO `sys_role_menu` VALUES ('1', 'f08');
INSERT INTO `sys_role_menu` VALUES ('1', 'f10');
INSERT INTO `sys_role_menu` VALUES ('1', 'f11');
INSERT INTO `sys_role_menu` VALUES ('1', 's');
INSERT INTO `sys_role_menu` VALUES ('1', 's01');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', '1464146417844');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'c');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'c01');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'c04');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'c05');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'd');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'd01');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'd02');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'd06');
INSERT INTO `sys_role_menu` VALUES ('1466648219208', 'd07');
INSERT INTO `sys_role_menu` VALUES ('2', '1466749619970');
INSERT INTO `sys_role_menu` VALUES ('2', '1468146363380');
INSERT INTO `sys_role_menu` VALUES ('2', '1468146364989');
INSERT INTO `sys_role_menu` VALUES ('2', 'd');
INSERT INTO `sys_role_menu` VALUES ('2', 'd01');
INSERT INTO `sys_role_menu` VALUES ('2', 'd02');
INSERT INTO `sys_role_menu` VALUES ('2', 'd03');
INSERT INTO `sys_role_menu` VALUES ('2', 'd04');
INSERT INTO `sys_role_menu` VALUES ('2', 'd05');
INSERT INTO `sys_role_menu` VALUES ('2', 'd06');
INSERT INTO `sys_role_menu` VALUES ('2', 'e');
INSERT INTO `sys_role_menu` VALUES ('3', '1464146417844');
INSERT INTO `sys_role_menu` VALUES ('3', '1466997384252');
INSERT INTO `sys_role_menu` VALUES ('3', '1468146364989');
INSERT INTO `sys_role_menu` VALUES ('3', 'c');
INSERT INTO `sys_role_menu` VALUES ('3', 'd');
INSERT INTO `sys_role_menu` VALUES ('3', 'd01');
INSERT INTO `sys_role_menu` VALUES ('3', 'd02');
INSERT INTO `sys_role_menu` VALUES ('3', 'd05');
INSERT INTO `sys_role_menu` VALUES ('3', 'd06');
INSERT INTO `sys_role_menu` VALUES ('3', 's');
INSERT INTO `sys_role_menu` VALUES ('3', 's01');
INSERT INTO `sys_role_menu` VALUES ('4', '1461062896045');
INSERT INTO `sys_role_menu` VALUES ('4', '1464146417844');
INSERT INTO `sys_role_menu` VALUES ('4', '1466749619970');
INSERT INTO `sys_role_menu` VALUES ('4', '1466997384252');
INSERT INTO `sys_role_menu` VALUES ('4', '1468223061508');
INSERT INTO `sys_role_menu` VALUES ('4', '1468223701572');
INSERT INTO `sys_role_menu` VALUES ('4', 'c');
INSERT INTO `sys_role_menu` VALUES ('4', 'c06');
INSERT INTO `sys_role_menu` VALUES ('4', 'e');
INSERT INTO `sys_role_menu` VALUES ('5', '1464146417844');
INSERT INTO `sys_role_menu` VALUES ('5', '1466997384252');
INSERT INTO `sys_role_menu` VALUES ('5', '1468223701572');
INSERT INTO `sys_role_menu` VALUES ('5', 'c');
INSERT INTO `sys_role_menu` VALUES ('5', 'c06');

-- ----------------------------
-- Table structure for sys_status_monitor
-- ----------------------------
DROP TABLE IF EXISTS `sys_status_monitor`;
CREATE TABLE `sys_status_monitor` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1',
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `icon_style` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_status_monitor
-- ----------------------------
INSERT INTO `sys_status_monitor` VALUES ('1', 'Mesos(master)', '1', 'fa fa-cogs', 'color:#999', null);
INSERT INTO `sys_status_monitor` VALUES ('2', 'Marathon', '1', 'fa fa-tasks', 'color:#999', null);
INSERT INTO `sys_status_monitor` VALUES ('3', 'Zookeeper', '1', 'fa fa-sitemap', 'color:#999', null);
INSERT INTO `sys_status_monitor` VALUES ('4', 'HAProxy', '1', 'fa fa-random', 'color:#999', null);
INSERT INTO `sys_status_monitor` VALUES ('5', 'Mesos(slave)', '1', 'fa fa-cog', 'color:#999', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `explain` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mobile_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `home_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `user_level` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '用户等级',
  `locked` varchar(32) DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('admin', 'owblQC7zD1TxjtFbuh0zCw==', '云管理员', '云管理员', '18818888888', 't@11.cc', '0', '', 'admin/', '', '0');

-- ----------------------------
-- Table structure for sys_user_focus
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_focus`;
CREATE TABLE `sys_user_focus` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `focus_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `focus_obj` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_focus
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_mo
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_mo`;
CREATE TABLE `sys_user_mo` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mo_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `auth` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '777',
  UNIQUE KEY `idx_sys_user_mo` (`username`,`mo_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_mo
-- ----------------------------
INSERT INTO `sys_user_mo` VALUES ('admin', '1', '777');
INSERT INTO `sys_user_mo` VALUES ('admin', '2', '777');
INSERT INTO `sys_user_mo` VALUES ('admin', '3', '777');
INSERT INTO `sys_user_mo` VALUES ('admin', '4', '777');
INSERT INTO `sys_user_mo` VALUES ('admin', '5', '777');
INSERT INTO `sys_user_mo` VALUES ('admin', '6', '777');
INSERT INTO `sys_user_mo` VALUES ('admin', '7', '777');
INSERT INTO `sys_user_mo` VALUES ('admin', '8', '777');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('admin', '1');

-- ----------------------------
-- Table structure for sys_user_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_template`;
CREATE TABLE `sys_user_template` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `template_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_template
-- ----------------------------

-- ----------------------------
-- Table structure for template_container
-- ----------------------------
DROP TABLE IF EXISTS `template_container`;
CREATE TABLE `template_container` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'DOCKER',
  `image_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `network_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'BRIDGE',
  `is_private` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'false',
  `force_pull_image` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'false',
  `name` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cpus` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0.5',
  `memory` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '2500',
  `disk_space` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '3000',
  `instances` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `network_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '自定义网络名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template_container
-- ----------------------------

-- ----------------------------
-- Table structure for template_container_more
-- ----------------------------
DROP TABLE IF EXISTS `template_container_more`;
CREATE TABLE `template_container_more` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `p_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `p_value` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `po_container_port` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `po_host_port` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `po_service_port` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `po_protocol` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `v_container_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `v_host_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `v_mode` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template_container_more
-- ----------------------------

-- ----------------------------
-- Table structure for template_fork_more
-- ----------------------------
DROP TABLE IF EXISTS `template_fork_more`;
CREATE TABLE `template_fork_more` (
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template_fork_more
-- ----------------------------

-- ----------------------------
-- Table structure for template_service
-- ----------------------------
DROP TABLE IF EXISTS `template_service`;
CREATE TABLE `template_service` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cpus` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `memory` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk_space` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instances` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `command` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `executor` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ports` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uris` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `constraints` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `version` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `backoff_factor` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1.15',
  `backoff` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '1',
  `max_launch_delay` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '3600',
  `health_checks` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `environment_variables` varchar(100) DEFAULT NULL,
  `name` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image_url` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `upgrade_strategy` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_app_dir` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of template_service
-- ----------------------------

-- ----------------------------
-- Table structure for type_info
-- ----------------------------
DROP TABLE IF EXISTS `type_info`;
CREATE TABLE `type_info` (
  `id` int(11) NOT NULL,
  `type_sort` varchar(20) DEFAULT NULL,
  `type_name` varchar(20) DEFAULT NULL,
  `type_desc` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_info
-- ----------------------------
INSERT INTO `type_info` VALUES ('0', 'image', 'weblogic', 'weblogic.png');
INSERT INTO `type_info` VALUES ('1', 'image', 'tomcat', 'tomcat.png');
INSERT INTO `type_info` VALUES ('2', 'image', 'java', 'java.png');
INSERT INTO `type_info` VALUES ('3', 'environment', 'produce', '');
INSERT INTO `type_info` VALUES ('4', 'environment', 'test', null);
INSERT INTO `type_info` VALUES ('5', 'environment', 'pre-release', null);

-- ----------------------------
-- Table structure for user_resource
-- ----------------------------
DROP TABLE IF EXISTS `user_resource`;
CREATE TABLE `user_resource` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cpu` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mem` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cpu_used` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mem_used` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk_used` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container` varchar(32) DEFAULT NULL,
  `container_used` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_resource
-- ----------------------------

-- ----------------------------
-- Table structure for user_service_instance
-- ----------------------------
DROP TABLE IF EXISTS `user_service_instance`;
CREATE TABLE `user_service_instance` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `container_id` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `container_port` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `host_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `host_port` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` datetime DEFAULT NULL,
  `more` varchar(3200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_service_instance` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_service_instance
-- ----------------------------

-- ----------------------------
-- Table structure for user_service_level
-- ----------------------------
DROP TABLE IF EXISTS `user_service_level`;
CREATE TABLE `user_service_level` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `level_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_service_level
-- ----------------------------

-- ----------------------------
-- Table structure for user_service_list
-- ----------------------------
DROP TABLE IF EXISTS `user_service_list`;
CREATE TABLE `user_service_list` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `port` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `uname` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `passd` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `more` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `cpu` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mem` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update_time` datetime DEFAULT NULL,
  `marathon_id` varchar(320) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `marathon_config` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `instances` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_service_list_1` (`marathon_id`),
  KEY `idx_user_service_list` (`username`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_service_list
-- ----------------------------

-- ----------------------------
-- Table structure for volume
-- ----------------------------
DROP TABLE IF EXISTS `volume`;
CREATE TABLE `volume` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL COMMENT '存储卷名字',
  `file_format` varchar(128) NOT NULL COMMENT 'ext4/ext3/xfs',
  `size` double DEFAULT NULL COMMENT 'M',
  `username` varchar(128) NOT NULL COMMENT '创建用户名',
  `stat` int(11) DEFAULT '0' COMMENT '０　未使用　　１使用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of volume
-- ----------------------------

-- ----------------------------
-- Table structure for volume_app
-- ----------------------------
DROP TABLE IF EXISTS `volume_app`;
CREATE TABLE `volume_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(125) DEFAULT NULL COMMENT '应用名称',
  `app_id` varchar(125) DEFAULT NULL COMMENT '应用id',
  `cpu` int(11) DEFAULT NULL COMMENT 'cpu',
  `mem` int(11) DEFAULT NULL COMMENT 'mem',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `username` varchar(125) DEFAULT NULL,
  `stat` int(11) DEFAULT '0' COMMENT '0 运行',
  `volume_id` int(11) DEFAULT NULL COMMENT '存储卷对应的id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of volume_app
-- ----------------------------

-- ----------------------------
-- Table structure for volume_snap
-- ----------------------------
DROP TABLE IF EXISTS `volume_snap`;
CREATE TABLE `volume_snap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `volume_id` int(11) DEFAULT NULL,
  `snap_name` varchar(256) DEFAULT NULL COMMENT '快照名',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `volume_id` (`volume_id`),
  CONSTRAINT `volume_id` FOREIGN KEY (`volume_id`) REFERENCES `volume` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of volume_snap
-- ----------------------------

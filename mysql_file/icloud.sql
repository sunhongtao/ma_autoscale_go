/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.22
Source Server Version : 50710
Source Host           : 192.168.2.22:3366
Source Database       : icloud

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-11-09 19:14:23
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
-- Table structure for alarm_users
-- ----------------------------
DROP TABLE IF EXISTS `alarm_users`;
CREATE TABLE `alarm_users` (
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phonenumber` bigint(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `publish_target` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '发布目标，管理接口对象',
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cfg_app_public` (`env`,`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for cmp
-- ----------------------------
DROP TABLE IF EXISTS `cmp`;
CREATE TABLE `cmp` (
  `check_time` datetime NOT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `st` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmp_haproxy_frw
-- ----------------------------
DROP TABLE IF EXISTS `cmp_haproxy_frw`;
CREATE TABLE `cmp_haproxy_frw` (
  `check_time` datetime NOT NULL,
  `frw_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `st` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmp_haproxy_frw_dtl
-- ----------------------------
DROP TABLE IF EXISTS `cmp_haproxy_frw_dtl`;
CREATE TABLE `cmp_haproxy_frw_dtl` (
  `frw_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `check_time` datetime NOT NULL,
  `haproxy_host` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `haproxy_port` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cmp_inst_state
-- ----------------------------
DROP TABLE IF EXISTS `cmp_inst_state`;
CREATE TABLE `cmp_inst_state` (
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `check_time` datetime DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for dcos_app_mapi
-- ----------------------------
DROP TABLE IF EXISTS `dcos_app_mapi`;
CREATE TABLE `dcos_app_mapi` (
  `app_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DCOS_API_MANAGE.ID',
  PRIMARY KEY (`app_id`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for dcos_bapi_mapi
-- ----------------------------
DROP TABLE IF EXISTS `dcos_bapi_mapi`;
CREATE TABLE `dcos_bapi_mapi` (
  `bid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DCOS_API_MANAGE.ID',
  PRIMARY KEY (`bid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dcos_cluster
-- ----------------------------
DROP TABLE IF EXISTS `dcos_cluster`;
CREATE TABLE `dcos_cluster` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `run_status` varchar(10) NOT NULL DEFAULT '0',
  `host_num` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `resp_id` varchar(255) DEFAULT NULL COMMENT '依赖的资源池id',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `step` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for dcos_host
-- ----------------------------
DROP TABLE IF EXISTS `dcos_host`;
CREATE TABLE `dcos_host` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '暂时无用',
  `label` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '暂时无用',
  `ip_addr` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cpus` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mem` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `disk` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `remark` varchar(4000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  `resp_id` varchar(255) DEFAULT NULL COMMENT '如果是资源池相关主机，该字段指向dcos_res_pool的id',
  `cls_id` varchar(255) DEFAULT NULL COMMENT '如果是集群相关主机，改字段指向dcos_cluster的id',
  PRIMARY KEY (`id`,`ip_addr`),
  UNIQUE KEY `idx_dcos_host_1` (`ip_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for dcos_mapi_cluster
-- ----------------------------
DROP TABLE IF EXISTS `dcos_mapi_cluster`;
CREATE TABLE `dcos_mapi_cluster` (
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'DCOS_API_MANAGE.ID',
  `gid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`mid`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for dcos_mon_phones_app_rela
-- ----------------------------
DROP TABLE IF EXISTS `dcos_mon_phones_app_rela`;
CREATE TABLE `dcos_mon_phones_app_rela` (
  `contact_name` varchar(20) NOT NULL,
  `app_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for dcos_user_cluster
-- ----------------------------
DROP TABLE IF EXISTS `dcos_user_cluster`;
CREATE TABLE `dcos_user_cluster` (
  `username` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `gid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=224985 DEFAULT CHARSET=utf8;

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
-- Table structure for scale_log
-- ----------------------------
DROP TABLE IF EXISTS `scale_log`;
CREATE TABLE `scale_log` (
  `app_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scale_time` varchar(14) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `scale_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `old_num` decimal(22,0) DEFAULT NULL,
  `new_num` decimal(22,0) DEFAULT NULL,
  `alt_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `alt_value` decimal(22,0) DEFAULT NULL,
  `alt_time` varchar(14) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`app_id`,`scale_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for scale_rule
-- ----------------------------
DROP TABLE IF EXISTS `scale_rule`;
CREATE TABLE `scale_rule` (
  `rule_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rule_num` decimal(22,0) DEFAULT NULL,
  `rep_time` decimal(22,0) DEFAULT NULL,
  `scale_out` decimal(22,0) DEFAULT NULL,
  `scale_in` decimal(22,0) DEFAULT NULL,
  `scale_init` decimal(22,0) DEFAULT NULL,
  `scale_max` decimal(22,0) DEFAULT NULL,
  `scale_inc` decimal(22,0) DEFAULT NULL,
  `obl_value` decimal(22,0) DEFAULT NULL,
  `threshold` decimal(22,0) DEFAULT NULL,
  PRIMARY KEY (`rule_type`,`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for security_verify
-- ----------------------------
DROP TABLE IF EXISTS `security_verify`;
CREATE TABLE `security_verify` (
  `security_code_id` int(5) DEFAULT NULL,
  `security_verify_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `security_verify_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for service_level_list
-- ----------------------------
DROP TABLE IF EXISTS `service_level_list`;
CREATE TABLE `service_level_list` (
  `level_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`level_id`,`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for slave_node_type
-- ----------------------------
DROP TABLE IF EXISTS `slave_node_type`;
CREATE TABLE `slave_node_type` (
  `type_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type_value` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sys_role_menu_copy
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu_copy`;
CREATE TABLE `sys_role_menu_copy` (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `menu_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for template_fork_more
-- ----------------------------
DROP TABLE IF EXISTS `template_fork_more`;
CREATE TABLE `template_fork_more` (
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `n` varchar(255) DEFAULT NULL,
  `bn` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for user_service_level
-- ----------------------------
DROP TABLE IF EXISTS `user_service_level`;
CREATE TABLE `user_service_level` (
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `level_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`,`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

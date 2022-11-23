/*
 Navicat Premium Data Transfer

 Source Server         : Java_Project
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : db_lbj_forum

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 22/11/2022 23:05:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for forum_info
-- ----------------------------
DROP TABLE IF EXISTS `forum_info`;
CREATE TABLE `forum_info`  (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of forum_info
-- ----------------------------
INSERT INTO `forum_info` VALUES (4, 'tset', 'adk----zs', '2022-09-12 19:35:16', 20201001);
INSERT INTO `forum_info` VALUES (9, 'Java', 'main\r\nsout', '2022-09-12 21:15:03', 20201002);
INSERT INTO `forum_info` VALUES (11, 'cpp', 'cpp', '2022-09-12 21:17:56', 20201004);
INSERT INTO `forum_info` VALUES (12, '程序员第一行代码', '你好，世界！', '2022-10-04 17:05:34', 20201001);
INSERT INTO `forum_info` VALUES (14, '全流程调度', '全流程调度工具有哪些', '2022-10-04 18:59:39', 20201002);
INSERT INTO `forum_info` VALUES (15, '国庆假期', '放假时间10.1~10.7\r\n即将结束假期！！！', '2022-10-07 15:23:22', 1001);
INSERT INTO `forum_info` VALUES (16, '列举大数据常用组件及框架', 'Hadoop HDFS MR YARN', '2022-10-15 22:14:02', 20201001);
INSERT INTO `forum_info` VALUES (17, 'fa', 'ad', '2022-10-16 15:21:26', 20201001);
INSERT INTO `forum_info` VALUES (18, '数据报表', 'BI工具，神策数据！', '2022-10-19 22:10:35', 20201002);
INSERT INTO `forum_info` VALUES (20, '分页查询', '分页查询功能的优点有什么？', '2022-10-20 16:42:06', 20201001);
INSERT INTO `forum_info` VALUES (21, 'JSP中 taglib 的使用', '文章来源：https://blog.csdn.net/weixin_42634260/article/details/89931226\r\nWEB/INF的lib下，除了导入jstl.jar包，还要导入standard.jar包。另外，解压standard.jar包，把.tld文件放在WEB/INF下。', '2022-10-20 23:11:34', 20201001);
INSERT INTO `forum_info` VALUES (22, '座右铭', '每人说一下你的座右铭？', '2022-10-22 20:33:08', 20201001);
INSERT INTO `forum_info` VALUES (23, '2022年11月发帖', '2022年11月发帖', '2022-11-17 15:37:45', 20201001);
INSERT INTO `forum_info` VALUES (24, '2022年11月发帖2', '2022年11月发帖2', '2022-11-17 15:37:59', 20201001);
INSERT INTO `forum_info` VALUES (25, '2022.11', '2022.11', '2022-11-17 15:40:48', 1001);

-- ----------------------------
-- Table structure for reply_info
-- ----------------------------
DROP TABLE IF EXISTS `reply_info`;
CREATE TABLE `reply_info`  (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reply_time` datetime(0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply_info
-- ----------------------------
INSERT INTO `reply_info` VALUES (5, 'cpp by lisi', '2022-10-04 17:27:13', 20201002, 11);
INSERT INTO `reply_info` VALUES (6, 'java by zhangsan', '2022-10-04 17:28:56', 20201001, 9);
INSERT INTO `reply_info` VALUES (7, 'reply java  by lisi', '2022-10-04 17:31:02', 20201002, 9);
INSERT INTO `reply_info` VALUES (9, 'azkaban oozie  airflow', '2022-10-04 19:34:38', 20201002, 14);
INSERT INTO `reply_info` VALUES (10, 'print(\'Hello World!\')', '2022-10-04 19:35:50', 20201002, 12);
INSERT INTO `reply_info` VALUES (11, 'class Main {\r\n', '2022-10-05 19:52:18', 20201005, 9);
INSERT INTO `reply_info` VALUES (12, '收到！', '2022-10-19 23:57:33', 20201001, 15);
INSERT INTO `reply_info` VALUES (13, '测试？？？？', '2022-10-22 18:48:53', 20201002, 4);
INSERT INTO `reply_info` VALUES (14, '收到！', '2022-10-22 18:49:15', 20201002, 15);
INSERT INTO `reply_info` VALUES (15, '随意发表帖子！', '2022-10-22 18:49:36', 20201002, 17);
INSERT INTO `reply_info` VALUES (17, '1，提升性能，减小内存的压力（减低宽带使用，提升访问速度）。一次查20个，比一次查20000个性能确定更好；另外若是数据量很大，一次性将内容都查询出来，查询出来的结果是放在内存里面的，内存没有这么大', '2022-10-22 18:52:04', 20201002, 20);
INSERT INTO `reply_info` VALUES (18, '分页功能的实现使用taglib标签，真的是烦人！', '2022-10-22 18:52:48', 20201002, 21);
INSERT INTO `reply_info` VALUES (19, '2，根据用户的须要，提供适当的数据。如新闻，通常人可能只看最近前20条；若是咱们将后面的也都查询出来了，就是浪费\r\n', '2022-10-22 18:53:28', 20201004, 20);
INSERT INTO `reply_info` VALUES (20, '3，展示层面的考虑：若是一次展示太多的数据，不论是排版，仍是美观上都很差\r\n4，查询效率快，由于只显示每页的条数，而不是把全部的数据加载出来，另外页面好看，好比几十万的数据，你不分页会把页面撑爆 ', '2022-10-22 18:53:39', 20201004, 20);
INSERT INTO `reply_info` VALUES (21, 'Test', '2022-10-22 18:53:51', 20201004, 4);
INSERT INTO `reply_info` VALUES (22, 'jsp中使用Java变量<%=%>', '2022-10-22 18:54:23', 20201004, 9);
INSERT INTO `reply_info` VALUES (23, ' 收到！', '2022-10-22 18:54:54', 20201004, 15);
INSERT INTO `reply_info` VALUES (24, 'Spark Flink ', '2022-10-22 18:55:12', 20201004, 16);
INSERT INTO `reply_info` VALUES (25, 'printf(\"Hello World!\");', '2022-10-22 18:55:55', 20201004, 12);
INSERT INTO `reply_info` VALUES (26, 'Talk is cheap, show me the code!', '2022-10-24 23:06:52', 1001, 22);
INSERT INTO `reply_info` VALUES (27, '废话少说，码上来！', '2022-10-24 23:07:36', 20201002, 22);
INSERT INTO `reply_info` VALUES (28, 'Superset与Kylin！', '2022-11-10 21:26:11', 20201001, 18);

-- ----------------------------
-- Table structure for study_info
-- ----------------------------
DROP TABLE IF EXISTS `study_info`;
CREATE TABLE `study_info`  (
  `sid` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of study_info
-- ----------------------------
INSERT INTO `study_info` VALUES (5, 'JavaWeb', 'JavaWeb测试！JavaWeb测试！JavaWeb测试！JavaWeb测试！JavaWeb测试！JavaWeb测试！JavaWeb测试！JavaWeb测试！JavaWeb测试！JavaWeb测试！JavaWeb测试！', '/MyForum/images/cover/002.png', '2022-10-16 17:11:30.685', 20201001);
INSERT INTO `study_info` VALUES (6, '2023年考研倒计时', '2023全国硕士研究生初试时间：2022年12月24日至25日(考试时间超过3小时的考试科目，安排在12月26日)。 预报名：9月24日-10月5日 网上报名：10月5日-25日 打准考证：12月18日-27日 考研初试：12月24日-26日', '/MyForum/images/cover/001.jpg', '2022-10-16 17:25:23.386', 20201001);
INSERT INTO `study_info` VALUES (7, 'BigData', '大数据岗位：数据分析、数据开发、数据挖掘.....', '/MyForum/images/cover/007.jpg', '2022-10-16 23:22:23.475', 20201001);
INSERT INTO `study_info` VALUES (9, '数据库知识', '数据库分为哪几种？', '/MyForum/images/cover/005.jpg', '2022-10-22 18:45:39.267', 20201002);
INSERT INTO `study_info` VALUES (10, '在请求目标中找到无效字符。有效字符在RFC 7230和RFC 3986中定义 的问题 ', '文章来源：https://www.cnblogs.com/lzj523/p/14283076.html', '/MyForum/images/cover/001.jpg', '2022-10-23 12:55:54.491', 20201001);
INSERT INTO `study_info` VALUES (13, '删除帖子功能的测试用例', 'xxxacacaccc', '/MyForum/images/cover/006.jpg', '2022-10-23 20:03:53.961', 20201001);
INSERT INTO `study_info` VALUES (15, 'alert弹框，写在重定向页面不会弹出', '文章来源：https://blog.csdn.net/axiebuzhen/article/details/103476910\r\n原因：因为重定向是在服务器端执行的动作，而Alert()是客户端的动作，所以即使alert()写在重定向语句之前其实也是没有效果的。', '/MyForum/images/cover/011.jpg', '2022-10-23 21:10:19.11', 20201001);
INSERT INTO `study_info` VALUES (16, '1024', '今天是1024程序猿节！祝你今日bug多多。。。。。。。。', '/MyForum/images/cover/004.jpg', '2022-10-24 23:08:48.005', 1001);
INSERT INTO `study_info` VALUES (17, 'window location href is not a function错误解决', '文章来源于：https://blog.csdn.net/soulwyb/article/details/89305373\r\n错误js写法：\r\nwindow.location.href(\"www.baidu.com\");\r\n正确js写法：\r\nwindow.location.href = \"www.baidu.com\";\r\n\r\n\r\n', '/MyForum/images/cover/010.jpg', '2022-10-24 23:44:14.881', 1001);
INSERT INTO `study_info` VALUES (18, 'Fosu学习专区', 'Talk is cheap, show me the code!', '/MyForum/images/cover/003.jpg', '2022-10-25 17:17:23.033', 20201003);
INSERT INTO `study_info` VALUES (19, 'HBase', 'java.lang.NoSuchMethodError: org.apache.hadoop.hbase.HTableDescriptor.addFamily', '/MyForum/images/cover/001.jpg', '2022-10-25 17:17:50.977', 20201003);
INSERT INTO `study_info` VALUES (20, 'Neo4j', 'Troubleshooting Connection Issues in Neo4j Browser and Cypher Shell', '/MyForum/images/cover/010.jpg', '2022-10-25 17:20:49.006', 20201004);
INSERT INTO `study_info` VALUES (21, '2022年11月', '2022年11月第一条学习专帖', '/MyForum/images/cover/011.jpg', '2022-11-12 16:23:47.673', 20201001);

-- ----------------------------
-- Table structure for study_reply_info
-- ----------------------------
DROP TABLE IF EXISTS `study_reply_info`;
CREATE TABLE `study_reply_info`  (
  `reply_id` int(10) NOT NULL AUTO_INCREMENT,
  `reply_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reply_time` datetime(0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of study_reply_info
-- ----------------------------
INSERT INTO `study_reply_info` VALUES (1, 'Web前端开发三剑客就是HTML、CSS、JavaScript', '2022-10-18 17:58:18', 20201002, 5);
INSERT INTO `study_reply_info` VALUES (2, '2023一起加油！', '2022-10-22 18:41:20', 20201002, 6);
INSERT INTO `study_reply_info` VALUES (3, '数据分析注重于SQL和Python的使用以及统计学方面的知识。', '2022-10-22 18:42:08', 20201002, 7);
INSERT INTO `study_reply_info` VALUES (4, '数据开发：大数据常用框架和组件的学习', '2022-10-22 18:57:42', 20201005, 7);
INSERT INTO `study_reply_info` VALUES (5, 'Web难搞', '2022-10-22 18:58:03', 20201005, 5);
INSERT INTO `study_reply_info` VALUES (6, '关系型数据库、键值数据库、文档型数据库、图形数据库。。。', '2022-10-22 18:59:02', 20201005, 9);
INSERT INTO `study_reply_info` VALUES (7, '放弃Web吧', '2022-10-22 22:42:36', 1001, 5);
INSERT INTO `study_reply_info` VALUES (8, 'NoSQL中列式存储的著名数据库为HBase', '2022-10-22 22:43:27', 1001, 9);
INSERT INTO `study_reply_info` VALUES (9, 'url写错了，多了个}', '2022-10-23 21:58:24', 20201002, 10);
INSERT INTO `study_reply_info` VALUES (10, '此操作是为了实现帖子发表的标题判空功能', '2022-10-23 21:59:03', 20201002, 15);
INSERT INTO `study_reply_info` VALUES (11, '删除帖子功能的测试用例', '2022-10-23 22:00:03', 20201002, 13);
INSERT INTO `study_reply_info` VALUES (12, '听我说，谢谢你，因为有你，温暖了四季。。。。。。。。。', '2022-10-24 23:09:57', 20201002, 16);
INSERT INTO `study_reply_info` VALUES (13, '666', '2022-10-24 23:44:50', 20201001, 17);
INSERT INTO `study_reply_info` VALUES (14, ' 听我说，谢谢你，因为有你，温暖了四季。。。。。。。。。', '2022-10-24 23:45:01', 20201001, 16);
INSERT INTO `study_reply_info` VALUES (15, '水个帖子', '2022-10-25 16:02:57', 20201005, 5);
INSERT INTO `study_reply_info` VALUES (18, '参考：https://stackoom.com/search?q=java.lang.NoSuchMethodError%3A+org.apache.hadoop.hbase.HTableDescriptor.addFamily&tag=&l=cn', '2022-10-25 17:21:14', 20201004, 19);
INSERT INTO `study_reply_info` VALUES (19, 'System.out.println(\"Hadoop, Hive, HBase, Kafka, Spark, Flink\");', '2022-10-25 17:22:03', 20201004, 18);
INSERT INTO `study_reply_info` VALUES (20, '2022年11月第一条学习专帖', '2022-11-17 16:07:25', 20201001, 21);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(15) NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_sex` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_face` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_from` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isAdmin` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1001, 'Admin', '21232f297a57a5a743894a0e4a801fc3', '女', 'images/userface/10.jpg', '123456789', 'fosuadmin@163.com', '佛山', 1);
INSERT INTO `user_info` VALUES (20201001, 'ZhangSan', 'e10adc3949ba59abbe56e057f20f883e', '男', 'images/userface/01.jpg', '12345678910', 'zhangsan@163.com', '北京', 0);
INSERT INTO `user_info` VALUES (20201002, 'LiSi', 'e10adc3949ba59abbe56e057f20f883e', '女', 'images/userface/06.jpg', '12345678911', 'LiSi@126.com', '深圳', 0);
INSERT INTO `user_info` VALUES (20201003, '孙七', 'e10adc3949ba59abbe56e057f20f883e', '男', 'images/userface/03.jpg', '12345678914', 'sunqi@qq.com', '苏州', NULL);
INSERT INTO `user_info` VALUES (20201004, 'ZhaoLiu', 'e10adc3949ba59abbe56e057f20f883e', '男', 'images/userface/07.jpg', '12345678913', 'ZhaoLiu@gmail.com', '厦门', 0);
INSERT INTO `user_info` VALUES (20201005, 'WangWu', 'e10adc3949ba59abbe56e057f20f883e', '女', 'images/userface/04.jpg', '12345678912', 'wangwu@outlook.com', '广州', 0);

SET FOREIGN_KEY_CHECKS = 1;

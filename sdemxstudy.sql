/*
 Navicat Premium Data Transfer

 Source Server         : LDT
 Source Server Type    : MariaDB
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : sdemxstudy

 Target Server Type    : MariaDB
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 23/01/2021 10:20:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for branch
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch`  (
  `branchID` int(11) NOT NULL AUTO_INCREMENT,
  `branchName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`branchID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of branch
-- ----------------------------
INSERT INTO `branch` VALUES (1, 'IT & Software');
INSERT INTO `branch` VALUES (2, 'Finance & Accounting');
INSERT INTO `branch` VALUES (3, 'Design');
INSERT INTO `branch` VALUES (4, 'Marketing');
INSERT INTO `branch` VALUES (5, 'Development');
INSERT INTO `branch` VALUES (6, 'Photography & Video');
INSERT INTO `branch` VALUES (7, 'Business');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catID` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `branchID` int(11) NOT NULL COMMENT 'khóa ngoại liên kết với table branches',
  PRIMARY KEY (`catID`) USING BTREE,
  INDEX `FK_cat_bran`(`branchID`) USING BTREE,
  CONSTRAINT `FK_cat_bran` FOREIGN KEY (`branchID`) REFERENCES `branch` (`branchID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Hardware', 1);
INSERT INTO `category` VALUES (2, 'Network Security', 1);
INSERT INTO `category` VALUES (3, 'Economics', 2);
INSERT INTO `category` VALUES (4, 'Finance', 2);
INSERT INTO `category` VALUES (5, 'Accounting & Bookeeping', 2);
INSERT INTO `category` VALUES (6, 'Game Design', 3);
INSERT INTO `category` VALUES (7, 'Web Design', 3);
INSERT INTO `category` VALUES (8, 'Design Tools', 3);
INSERT INTO `category` VALUES (9, '3D & Animation', 3);
INSERT INTO `category` VALUES (10, 'Advertising', 4);
INSERT INTO `category` VALUES (11, 'Social Media Marketing', 4);
INSERT INTO `category` VALUES (12, 'Video & Mobile Marketing', 4);
INSERT INTO `category` VALUES (13, 'Web Development', 5);
INSERT INTO `category` VALUES (14, 'Mobile Development', 5);
INSERT INTO `category` VALUES (15, 'Game Development', 5);
INSERT INTO `category` VALUES (16, 'Data Science', 5);
INSERT INTO `category` VALUES (17, 'Photography', 6);
INSERT INTO `category` VALUES (18, 'Photography Tools', 6);
INSERT INTO `category` VALUES (19, 'Video Design', 6);
INSERT INTO `category` VALUES (20, 'Sales', 7);
INSERT INTO `category` VALUES (21, 'Management', 7);

-- ----------------------------
-- Table structure for chapter
-- ----------------------------
DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter`  (
  `chapID` int(11) NOT NULL,
  `chapName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `courID` int(11) NOT NULL,
  `videoUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`chapID`) USING BTREE,
  INDEX `FK_chapter_course`(`courID`) USING BTREE,
  CONSTRAINT `FK_chapter_course` FOREIGN KEY (`courID`) REFERENCES `course` (`courID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `courID` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `catID` int(11) NOT NULL COMMENT 'Categori ID',
  `teacherID` int(11) NOT NULL COMMENT 'User ID create this course',
  `tiniDes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `prices` int(255) NOT NULL,
  `sale` decimal(10, 2) NOT NULL DEFAULT 1,
  `fullDes` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dateUpload` date NULL DEFAULT NULL,
  `lastUpdate` date NULL DEFAULT NULL,
  `views` int(255) NULL DEFAULT 0,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `premium` bit(1) NOT NULL DEFAULT b'1' COMMENT 'account premium',
  `language` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`courID`) USING BTREE,
  INDEX `FK_course_category`(`catID`) USING BTREE,
  INDEX `FK_course_teacher`(`teacherID`) USING BTREE,
  CONSTRAINT `FK_course_category` FOREIGN KEY (`catID`) REFERENCES `category` (`catID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_course_teacher` FOREIGN KEY (`teacherID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Introducing ID Hardware 1', 1, 2, 'this is tinyDes', 1500000, 1.00, 'this is full Des', '2021-01-16', '2021-01-16', 645716, b'1', b'0', 'English');
INSERT INTO `course` VALUES (2, 'PLC Programming From Scratch (PLC I)', 1, 2, 'This course will give a person with no prior experience the basic tools necessary to create a PLC program from scratch.', 1000000, 0.90, '<div><p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\r\n    <p>This course has been designed by two professional Data Scientists so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\r\n    <p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\r\n    <p>This course is&nbsp;fun and exciting, but at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\r\n    <ul><li><p>Part 1 - Data Preprocessing</p> </li> <li><p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p></li></ul><p>Moreover, the course is packed with practical exercises that are based on real-life&nbsp;examples. So not only will you learn the theory, but you will also get some hands-on practice building your own models.</p><p>And as a bonus, this course includes both&nbsp;Python and R&nbsp;code templates which you can download and use on your own projects.</p></div>', '2021-01-16', '2021-01-16', 544887, b'1', b'0', 'English');
INSERT INTO `course` VALUES (3, 'Practical PLC Programming (PLC II)', 1, 2, 'This course will give an intermediate-level student the experience necessary to originate complex, logical solutions.', 1000000, 1.00, '<div><p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\r\n    <p>This course has been designed by two professional Data Scientists so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\r\n    <p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\r\n    <p>This course is&nbsp;fun and exciting, but at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\r\n    <ul><li><p>Part 1 - Data Preprocessing</p> </li> <li><p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p></li></ul><p>Moreover, the course is packed with practical exercises that are based on real-life&nbsp;examples. So not only will you learn the theory, but you will also get some hands-on practice building your own models.</p><p>And as a bonus, this course includes both&nbsp;Python and R&nbsp;code templates which you can download and use on your own projects.</p></div>', '2021-01-16', '2021-01-16', 76794, b'1', b'0', 'English');
INSERT INTO `course` VALUES (4, 'Introducing ID Hardware 2 ', 1, 2, NULL, 1500000, 1.00, '<div><p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\r\n    <p>This course has been designed by two professional Data Scientists so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\r\n    <p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\r\n    <p>This course is&nbsp;fun and exciting, but at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\r\n    <ul><li><p>Part 1 - Data Preprocessing</p> </li> <li><p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p></li></ul><p>Moreover, the course is packed with practical exercises that are based on real-life&nbsp;examples. So not only will you learn the theory, but you will also get some hands-on practice building your own models.</p><p>And as a bonus, this course includes both&nbsp;Python and R&nbsp;code templates which you can download and use on your own projects.</p></div>', '2021-01-16', '2021-01-16', 597076, b'1', b'0', 'English');
INSERT INTO `course` VALUES (5, 'Learn Ethical Hacking From Scratch', 2, 2, 'Become an ethical hacker that can hack computer systems like black hat hackers and secure them like security experts.', 2000000, 1.00, '<div><p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\r\n    <p>This course has been designed by two professional Data Scientists so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\r\n    <p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\r\n    <p>This course is&nbsp;fun and exciting, but at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\r\n    <ul><li><p>Part 1 - Data Preprocessing</p> </li> <li><p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p></li></ul><p>Moreover, the course is packed with practical exercises that are based on real-life&nbsp;examples. So not only will you learn the theory, but you will also get some hands-on practice building your own models.</p><p>And as a bonus, this course includes both&nbsp;Python and R&nbsp;code templates which you can download and use on your own projects.</p></div>', '2021-01-17', '2021-01-17', 596873, b'1', b'0', 'English');
INSERT INTO `course` VALUES (6, 'Network Security A-Z : Computer Networking + Cybersecurity', 2, 2, 'Become a PRO in Cyber Security, Computer Networking, Web Application Penetration Testing, Ethical Hacking and Bug Bounty', 2250000, 1.00, '<div><p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\r\n    <p>This course has been designed by two professional Data Scientists so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\r\n    <p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\r\n    <p>This course is&nbsp;fun and exciting, but at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\r\n    <ul><li><p>Part 1 - Data Preprocessing</p> </li> <li><p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p></li></ul><p>Moreover, the course is packed with practical exercises that are based on real-life&nbsp;examples. So not only will you learn the theory, but you will also get some hands-on practice building your own models.</p><p>And as a bonus, this course includes both&nbsp;Python and R&nbsp;code templates which you can download and use on your own projects.</p></div>', '2021-01-17', '2021-01-17', 172521, b'1', b'0', 'English');
INSERT INTO `course` VALUES (7, 'The Complete Cyber Security Course : Hackers Exposed!', 2, 2, 'Volume 1 : Become a Cyber Security Specialist, Learn How to Stop Hackers, Prevent Hacking, Learn IT Security & INFOSEC', 1850000, 1.00, '<div><p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\r\n    <p>This course has been designed by two professional Data Scientists so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\r\n    <p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\r\n    <p>This course is&nbsp;fun and exciting, but at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\r\n    <ul><li><p>Part 1 - Data Preprocessing</p> </li> <li><p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p></li></ul><p>Moreover, the course is packed with practical exercises that are based on real-life&nbsp;examples. So not only will you learn the theory, but you will also get some hands-on practice building your own models.</p><p>And as a bonus, this course includes both&nbsp;Python and R&nbsp;code templates which you can download and use on your own projects.</p></div>', '2021-01-17', '2021-01-17', 158244, b'1', b'0', 'English');
INSERT INTO `course` VALUES (8, 'The Complete Cyber Security Course : Network Security!', 2, 2, 'Volume 2 : Network Security, WiFi Security, WiFi Hackers, Firewalls, Wireshark, Secure Networking. + Password Managers\r\n', 1850000, 1.00, '<div><p>Interested in the field of Machine Learning?&nbsp;Then this course is for you!</p>\r\n    <p>This course has been designed by two professional Data Scientists so that we can share our knowledge and help you learn complex theory,&nbsp;algorithms, and coding libraries in a simple way.</p>\r\n    <p>We will walk you step-by-step into the World of Machine Learning. With every tutorial, you will develop new skills and improve your understanding of this challenging yet lucrative sub-field of Data Science.</p>\r\n    <p>This course is&nbsp;fun and exciting, but at the same time, we dive deep into Machine Learning. It is structured the following way:</p>\r\n    <ul><li><p>Part 1 - Data Preprocessing</p> </li> <li><p>Part 2 - Regression: Simple Linear Regression, Multiple Linear Regression,&nbsp;Polynomial&nbsp;Regression,&nbsp;SVR, Decision Tree Regression,&nbsp;Random Forest Regression</p></li></ul><p>Moreover, the course is packed with practical exercises that are based on real-life&nbsp;examples. So not only will you learn the theory, but you will also get some hands-on practice building your own models.</p><p>And as a bonus, this course includes both&nbsp;Python and R&nbsp;code templates which you can download and use on your own projects.</p></div>', '2021-01-17', '2021-01-17', 955699, b'1', b'0', 'English');
INSERT INTO `course` VALUES (9, 'Understanding Macroeconomics for University and Business', 3, 2, 'Explaining the economics of fiscal policy, money creation, and monetary policy', 800000, 0.90, NULL, '2021-01-17', '2021-01-17', 850292, b'1', b'0', 'English');
INSERT INTO `course` VALUES (10, 'The Circular Economy', 3, 2, 'What and Where Are the Opportunities for Entrepreneurs?', 1200000, 1.00, NULL, '2021-01-17', '2021-01-17', 223419, b'1', b'0', 'English');
INSERT INTO `course` VALUES (11, 'The Complete Investment Banking Course 2021', 4, 2, 'The #1 Course to Land a Job in Investment Banking. IPOs, Bonds, M&A, Trading, LBOs, Valuation: Everything is included!', 1050000, 1.00, NULL, '2021-01-17', '2021-01-17', 75391, b'1', b'0', 'English');
INSERT INTO `course` VALUES (12, 'Bookkeeping Basics #1: Understand the Fundamentals', 5, 2, 'Learn bookkeeping terms and concepts to make owners, employees & students more confident and successful!', 900000, 1.00, NULL, '2021-01-17', '2021-01-17', 113, b'1', b'0', 'English');
INSERT INTO `course` VALUES (13, 'Accounting: From Beginner to Advanced!', 5, 2, 'Learn accounting like never before. Learn easy and fast. Easy to understand Accounting. #1 accounting course online.', 2100000, 0.95, NULL, '2021-01-19', '2021-01-17', 22096, b'1', b'0', 'English');
INSERT INTO `course` VALUES (14, 'Pixel art for Video games', 6, 2, 'The essential course for creating stunning pixel art graphics for video-games or stylish illustrations and designs', 650000, 1.00, NULL, '2021-01-17', '2021-01-17', 1654, b'1', b'0', 'English');
INSERT INTO `course` VALUES (15, 'Blender 2.8 Game Character Creation', 6, 2, 'Learn to Create Game Characters with Blender 2.8 and Unity', 500000, 0.85, '', '2021-01-17', '2021-01-17', 22054, b'1', b'0', 'English');
INSERT INTO `course` VALUES (16, 'Master Web Design in Photoshop', 7, 2, 'Learn how to create stunning website designs in Photoshop; No coding included!', 1900000, 1.00, NULL, '2021-01-17', '2021-01-17', 99630, b'1', b'0', 'English');
INSERT INTO `course` VALUES (17, 'Instagram Ads Masterclass', 10, 2, 'Use all the power of Instagram Ads to grow your sales and brand exponentially and reach new Instagram followers.', 1500000, 1.00, NULL, '2021-01-17', '2021-01-17', 2503, b'1', b'0', 'English');
INSERT INTO `course` VALUES (18, 'Facebook Ads for Beginners', 11, 2, 'Learn to Create Powerful Facebook Ads to Increase Your Sales and Revenue Promoting Your Business All Over the World!', 1500000, 1.00, NULL, '2021-01-17', '2021-01-17', 12, b'1', b'0', 'English');
INSERT INTO `course` VALUES (19, 'The Complete Android N Developer Course', 14, 2, 'Learn Android App Development with Android 7 Nougat by building real apps including Uber, Whatsapp and Instagram!', 1500000, 1.00, NULL, '2021-01-17', '2021-01-17', 88546, b'1', b'0', 'English');
INSERT INTO `course` VALUES (20, 'Complete C# Unity Game Developer 2D', 15, 2, 'Learn Unity in C# & Code Your First Seven 2D Video Games for Web, Mac & PC. The Tutorials Cover Tilemap (35 hours)', 1350000, 1.00, NULL, '2021-01-17', '2021-01-17', 1682, b'1', b'0', 'English');
INSERT INTO `course` VALUES (21, 'Complete C# Unity Game Developer 3D', 15, 2, 'Design & Develop Video Games. Learn C# in Unity Engine. Code Your first 3D Unity games for web, Mac & PC.', 1400000, 1.00, NULL, '2021-01-17', '2021-01-17', 125499, b'1', b'0', 'English');
INSERT INTO `course` VALUES (22, 'Modern Deep Learning in Python', 16, 2, 'Build with modern libraries like Tensorflow, Theano, Keras, PyTorch, CNTK, MXNet. Train faster with GPU on AWS.', 1700000, 1.00, NULL, '2021-01-17', '2021-01-17', 12549, b'1', b'0', 'English');
INSERT INTO `course` VALUES (23, 'Affinity Photo: Solid Foundations', 17, 2, 'The best selling beginners guide to Affinity Photo - complete with a 50 page PDF to aid your study!', 1000000, 1.00, NULL, '2021-01-17', '2021-01-17', 35145, b'1', b'0', 'English');
INSERT INTO `course` VALUES (24, 'Composition in Photography from A to Z', 17, 2, 'Master the composition of your photos, learn how to see the composition around, learn how to analyze your photography', 1200000, 1.00, NULL, '2021-01-17', '2021-01-17', 1236, b'1', b'0', 'English');
INSERT INTO `course` VALUES (25, 'Professional Retouching Course in Photoshop', 18, 2, 'Photoshop Non-destructive Retouching Techniques. Learn Portrait, Beauty and Outdoor Retouching in Photoshop.', 1350000, 1.00, NULL, '2021-01-17', '2021-01-17', 11212, b'1', b'0', 'English');
INSERT INTO `course` VALUES (26, 'Mastering Adobe Photoshop Elements 2020', 18, 2, 'This course has all the tools to enable you to create truly great-looking images from your original shots', 590000, 1.00, NULL, '2021-01-17', '2021-01-17', 896431, b'1', b'0', 'English');
INSERT INTO `course` VALUES (27, 'Adobe Lightroom Classic - Beginner Level', 18, 2, 'Learn all the basics, from importing and organizing to developing and exporting of images in Adobe Lightroom Classic.', 790000, 1.00, NULL, '2021-01-17', '2021-01-17', 115, b'1', b'0', 'English');
INSERT INTO `course` VALUES (28, 'Learn to Sell Anything', 20, 2, 'Learn sales basics, techniques, and strategies that will give you the skills to sell anything.', 820000, 1.00, NULL, '2021-01-17', '2021-01-17', 93, b'1', b'0', 'English');
INSERT INTO `course` VALUES (29, 'CRUSH IT !!! – Sales Strategies', 20, 2, 'Discover a step by step sales process you can drop into your business to re-connect with lost prospects. Close Sales Now', 1300000, 1.00, NULL, '2021-01-17', '2021-01-17', 56963, b'1', b'0', 'English');
INSERT INTO `course` VALUES (30, 'Smart Marketing with Price Psychology', 20, 2, 'Improve online marketing success with fundamental psychological pricing research for your business and marketing', 1300000, 1.00, NULL, '2021-01-17', '2021-01-17', 595135, b'1', b'0', 'English');
INSERT INTO `course` VALUES (31, 'Leadership: Practical Leadership Skills', 21, 2, 'Master leadership skills and leadership techniques with this highly practical advice and training', 990000, 1.00, NULL, '2021-01-17', '2021-01-17', 963553, b'1', b'0', 'English');
INSERT INTO `course` VALUES (32, 'Product Management 101', 21, 2, 'Learn to become a more strategic product manager - and have a greater impact on your company and your products.', 690000, 1.00, NULL, '2021-01-17', '2021-01-17', 1254, b'1', b'0', 'English');
INSERT INTO `course` VALUES (33, 'QMS Auditor / Lead Auditor Course', 21, 2, 'Plan and Confidently Conduct Quality Management System Audits - Auditing Explained in Plain and Simple Language.', 1690000, 1.00, NULL, '2021-01-17', '2021-01-17', 9964, b'1', b'0', 'English');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `feedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `courID` int(11) NOT NULL,
  `fullfeedback` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` float(5, 1) NOT NULL,
  `dateFeedback` date NULL DEFAULT NULL,
  PRIMARY KEY (`feedbackID`) USING BTREE,
  INDEX `FK_feedback_course`(`courID`) USING BTREE,
  INDEX `FK_feedback_user`(`userID`) USING BTREE,
  CONSTRAINT `FK_feedback_course` FOREIGN KEY (`courID`) REFERENCES `course` (`courID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_feedback_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES (1, 3, 1, 'Good', 4.5, '2021-01-22');
INSERT INTO `feedback` VALUES (2, 2, 1, 'Not Bad', 4.0, '2021-01-22');
INSERT INTO `feedback` VALUES (3, 3, 2, 'BAD', 3.0, '2021-01-22');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userID` int(11) NOT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dob` date NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule` int(11) NOT NULL COMMENT '1- admin; 2- teacher; 3-student',
  `premium` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (0, 'sdsd', 'dsd', 'sdsd', 'dsd', '2021-01-18', NULL, 3, 0);
INSERT INTO `user` VALUES (1, 'admin', 'newpassword', 'Administrator', NULL, NULL, NULL, 1, 0);
INSERT INTO `user` VALUES (2, 'ldthang', 'ksldajlksjdilkjalsfd', 'Le Duc Thang', 'ldthang2201@gmail.com', '2021-01-16', NULL, 2, 0);
INSERT INTO `user` VALUES (3, 'tnthanh', 'trannhatthanh', 'Tran Nhat Thanh', 'thanh@gmail.com', '2021-01-17', NULL, 3, 0);
INSERT INTO `user` VALUES (4, 'hhelomoinguoi', 'leducthangsad', 'Le Duc Thang', 'ldthang@email', '2000-01-01', NULL, 3, 0);
INSERT INTO `user` VALUES (5, 'testusername', 'leducthangsad', 'Le Duc Thang', 'ldthang@email', '2000-01-01', NULL, 3, 0);
INSERT INTO `user` VALUES (6, 'teacher1', 'leducthangsad', 'teacher no 1', 'ldthang@email', '2000-01-01', NULL, 2, 0);
INSERT INTO `user` VALUES (7, 'ldthang', '$2a$12$8MS4tRdTqMWGo07dM7ubUuiaiuLufcyzalQdBM8c5KYScQ9mw1See', 'Le Duc Thang', 'ldthang2201@gmail.com', '2021-01-07', NULL, 3, 0);
INSERT INTO `user` VALUES (8, 'ldt', '$2a$12$4rU9iUgJh2fCnD7YFE.pLO/HQvQO7LSECNZxOiHFUdksyYOBrQRcC', 'ldt', 'ldtsfd', '2021-01-07', NULL, 3, 0);
INSERT INTO `user` VALUES (134, 'ldthang7410', '$2a$12$SibwPFLq.h3hjLbtASCFJ.kxwIk0G8f5Gs9m23y0AHgGyZ37Wq/7u', 'Le Duc Thang', '18110201@student.hcmute.edu.vn', '2021-01-07', NULL, 3, 0);

-- ----------------------------
-- Table structure for watchlist
-- ----------------------------
DROP TABLE IF EXISTS `watchlist`;
CREATE TABLE `watchlist`  (
  `userID` int(11) NOT NULL,
  `courID` int(11) NOT NULL,
  `dateRegister` date NOT NULL,
  PRIMARY KEY (`userID`, `courID`) USING BTREE,
  INDEX `FK_watchlist_course`(`courID`) USING BTREE,
  CONSTRAINT `FK_watchlist_course` FOREIGN KEY (`courID`) REFERENCES `course` (`courID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_watchlist_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of watchlist
-- ----------------------------
INSERT INTO `watchlist` VALUES (2, 1, '2021-01-18');
INSERT INTO `watchlist` VALUES (3, 1, '2021-01-18');
INSERT INTO `watchlist` VALUES (4, 1, '2021-01-20');
INSERT INTO `watchlist` VALUES (4, 2, '2021-01-20');
INSERT INTO `watchlist` VALUES (4, 3, '2021-01-20');
INSERT INTO `watchlist` VALUES (4, 12, '2021-01-20');
INSERT INTO `watchlist` VALUES (4, 31, '2021-01-06');
INSERT INTO `watchlist` VALUES (134, 2, '2021-01-23');
INSERT INTO `watchlist` VALUES (134, 5, '2021-01-23');
INSERT INTO `watchlist` VALUES (134, 8, '2021-01-23');
INSERT INTO `watchlist` VALUES (134, 10, '2021-01-23');
INSERT INTO `watchlist` VALUES (134, 12, '2021-01-23');

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist`  (
  `userID` int(11) NOT NULL,
  `courID` int(11) NOT NULL,
  `dateLike` date NULL DEFAULT NULL,
  PRIMARY KEY (`userID`, `courID`) USING BTREE,
  INDEX `FK_wishlist_course`(`courID`) USING BTREE,
  CONSTRAINT `FK_wishlist_course` FOREIGN KEY (`courID`) REFERENCES `course` (`courID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_wishlist_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
INSERT INTO `wishlist` VALUES (4, 2, '2021-01-23');
INSERT INTO `wishlist` VALUES (8, 15, '2021-01-23');
INSERT INTO `wishlist` VALUES (134, 1, '2021-01-23');
INSERT INTO `wishlist` VALUES (134, 2, '2021-01-23');
INSERT INTO `wishlist` VALUES (134, 5, '2021-01-23');
INSERT INTO `wishlist` VALUES (134, 9, '2021-01-23');
INSERT INTO `wishlist` VALUES (134, 25, '2021-01-23');
INSERT INTO `wishlist` VALUES (134, 30, '2021-01-23');

-- ----------------------------
-- View structure for top4categoriesmostsubc
-- ----------------------------
DROP VIEW IF EXISTS `top4categoriesmostsubc`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `top4categoriesmostsubc` AS select branch.branchID, branch.branchName, count(dateRegister) as numRegister
from branch,category,course LEFT JOIN watchlist on course.courID=watchlist.courID
where branch.branchID=category.branchID and course.catID = category.catID and (DATEDIFF(NOW(),dateRegister)<=7)
group By  branch.branchID, branch.branchName
ORDER BY numRegister DESC LIMIT 4 ;

-- ----------------------------
-- View structure for vw_top10mostviewed
-- ----------------------------
DROP VIEW IF EXISTS `vw_top10mostviewed`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_top10mostviewed` AS select course.courID, title, branch.branchID, teacherID, prices, sale, dateUpload, views, premium, avg(rate) as rate, count(rate) as numRate
from branch, category, course LEFT JOIN feedback on course.courID=feedback.courID
where branch.branchID=category.branchID and category.catID=course.catID
GROUP BY course.courID, title, branch.branchID, teacherID, prices, sale, dateUpload, views, premium
ORDER BY views DESC LIMIT 10 ;

-- ----------------------------
-- View structure for vw_top10newestcourse
-- ----------------------------
DROP VIEW IF EXISTS `vw_top10newestcourse`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vw_top10newestcourse` AS select course.courID, title, branch.branchID, teacherID, prices, sale, dateUpload, views, premium, avg(rate) as rate, count(rate) as numRate
from branch, category, course LEFT JOIN feedback on course.courID=feedback.courID
where branch.branchID=category.branchID and category.catID=course.catID and (DATEDIFF(NOW(),dateUpload)<=7)
GROUP BY course.courID, title, branch.branchID, teacherID, prices, sale, dateUpload, views, premium
ORDER BY dateUpload DESC LIMIT 10 ;

-- ----------------------------
-- Procedure structure for add_removeWishList
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_removeWishList`;
delimiter ;;
CREATE PROCEDURE `add_removeWishList`(IN uID int(11),coID int(11))
begin
	IF (EXISTS (select * from wishlist where userID=uID and courID=coID)) THEN
	Delete from wishlist where userID=uID and courID=coID;
ELSE
	INSERT into wishlist values(uID,coID,now());
END IF;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for add_WatchList
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_WatchList`;
delimiter ;;
CREATE PROCEDURE `add_WatchList`(IN uID int(11),coID int(11))
begin
	IF (EXISTS (select * from watchlist where userID=uID and courID=coID)) THEN
	UPDATE course set views=views+1 where courID=coID;
ELSE
	INSERT into watchlist values(uID,coID,now());
	UPDATE course set views=views+1 where courID=coID;
END IF;
end
;;
delimiter ;

-- ----------------------------
-- Function structure for CountNoCourseByBranchID
-- ----------------------------
DROP FUNCTION IF EXISTS `CountNoCourseByBranchID`;
delimiter ;;
CREATE FUNCTION `CountNoCourseByBranchID`(`id` int(10))
 RETURNS int(11)
BEGIN
	RETURN (select count(*)
					from course, category
					where course.catID=category.catID and category.branchID=id);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for CountNoCourseByCatID
-- ----------------------------
DROP FUNCTION IF EXISTS `CountNoCourseByCatID`;
delimiter ;;
CREATE FUNCTION `CountNoCourseByCatID`(`id` int)
 RETURNS int(10)
BEGIN
	RETURN (select count(*)
					from course, category
					where course.catID=category.catID and course.catID=id);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for f_CalcDateUpload
-- ----------------------------
DROP FUNCTION IF EXISTS `f_CalcDateUpload`;
delimiter ;;
CREATE FUNCTION `f_CalcDateUpload`(`id` int)
 RETURNS int(10)
BEGIN
	RETURN (select DATEDIFF(now(),dateUpload) FROM course where courID = id);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for f_calcRateByCourID
-- ----------------------------
DROP FUNCTION IF EXISTS `f_calcRateByCourID`;
delimiter ;;
CREATE FUNCTION `f_calcRateByCourID`(`id` int)
 RETURNS int(10)
BEGIN
	RETURN (select avg(rate)
					from course LEFT JOIN feedback on course.courID=feedback.courID
					where course.courID=id);
END
;;
delimiter ;

-- ----------------------------
-- Function structure for f_checkWishList
-- ----------------------------
DROP FUNCTION IF EXISTS `f_checkWishList`;
delimiter ;;
CREATE FUNCTION `f_checkWishList`(`uID` int,`coID` int)
 RETURNS bit(1)
BEGIN
	IF (EXISTS (select * from wishlist where userID=uID and courID=coID)) THEN
	return 1;
ELSE
	return 0;
END IF;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for f_countNumberRegisterByCourID
-- ----------------------------
DROP FUNCTION IF EXISTS `f_countNumberRegisterByCourID`;
delimiter ;;
CREATE FUNCTION `f_countNumberRegisterByCourID`(`id` int)
 RETURNS int(10)
BEGIN
	RETURN (select count(dateRegister) from watchlist where courID = id);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_addNewCourse
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_addNewCourse`;
delimiter ;;
CREATE PROCEDURE `sp_addNewCourse`(IN courtitle VARCHAR(30), categoryID int(10), teachID int(10), courPrice int(10), courLanguage varchar(15))
begin
	DECLARE courseID int(10);
	SET courseID = 0;
	while (exists (select * from course where courID=courseID)) do set 
		courseID=courseID+1 ;
	end while;
	start TRANSACTION;
	if(EXISTS (select * from course where title = courtitle and teacherID=teachID)) then
	    select 'Course is already exists';
      rollback;
	else
	    insert into course(courID,title,catID,teacherID,prices,dateUpload,lastUpdate,`language`) values (courseID,courtitle,categoryID,teachID,courPrice,NOW(),NOW(),courLanguage);
			select 'Add new Course successful'
			commit;
	end if;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_AddNewStudentUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_AddNewStudentUser`;
delimiter ;;
CREATE PROCEDURE `sp_AddNewStudentUser`(IN uName varchar(20),pass varchar(255),fName varchar(50),uEmail varchar(255),doBirth date)
begin
DECLARE uID int(10);
	SET uID = 0;
	while (exists (select * from user where userID=uID)) do set 
		uID=uID+1 ;
	end while;
	start TRANSACTION;
	if(EXISTS (select * from user where userName = uName)) then
	    select 'Username is already exists' as Error;
      rollback;
	else
	    INSERT into `user` values(uID,uName,pass,fName,uEmail,doBirth,null,3,0);
			select 'Add new user successful' as Infomation;
			commit;
	end if;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_AddNewTeacherUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_AddNewTeacherUser`;
delimiter ;;
CREATE PROCEDURE `sp_AddNewTeacherUser`(IN uName varchar(20),pass varchar(255),fName varchar(50),uEmail varchar(255),doBirth date)
begin
DECLARE uID int(10);
	SET uID = 0;
	while (exists (select * from user where userID=uID)) do set 
		uID=uID+1 ;
	end while;
	start TRANSACTION;
	if(EXISTS (select * from user where userName = uName)) then
	    select 'username is already exists' as Error;
      rollback;
	else
	    INSERT into `user` values(uID,uName,pass,fName,uEmail,doBirth,null,2,0);
			select 'Add new user successful' as Infomation;
			commit;
	end if;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ChangePassword
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ChangePassword`;
delimiter ;;
CREATE PROCEDURE `sp_ChangePassword`(IN uName varchar(30),newPass varchar(255))
begin
update `user`
set `password` = newPass
where userName=uName;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_getAllCategoryRelatedCatID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getAllCategoryRelatedCatID`;
delimiter ;;
CREATE PROCEDURE `sp_getAllCategoryRelatedCatID`(IN id int(11))
begin
	select *
	from category
	where branchID=(select branchID
									from category
									where catID = id);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_getAllFeedbackByCourID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getAllFeedbackByCourID`;
delimiter ;;
CREATE PROCEDURE `sp_getAllFeedbackByCourID`(IN id int(11))
begin
	select *
	from feedback
	where courID=id;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_getMyWatchListByUserID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getMyWatchListByUserID`;
delimiter ;;
CREATE PROCEDURE `sp_getMyWatchListByUserID`(IN uID int(11))
BEGIN 
	select course.courID, title,catID,teacherID,dateUpload,lastUpdate,premium
	from course, watchlist
	where watchlist.userID=uID and course.courID=watchlist.courID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_getMyWishListByUserID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getMyWishListByUserID`;
delimiter ;;
CREATE PROCEDURE `sp_getMyWishListByUserID`(IN uID int(11))
BEGIN 
	select course.courID, title,catID,teacherID,dateUpload,lastUpdate,premium
	from course, wishlist
	where wishlist.userID=uID and course.courID=wishlist.courID;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_getTop5CourseByCourID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getTop5CourseByCourID`;
delimiter ;;
CREATE PROCEDURE `sp_getTop5CourseByCourID`(IN coID INT(11), caID INT(11))
BEGIN
	select course.courID, title,prices,sale, lastUpdate,views, count(dateRegister) as numRegister
	from course LEFT JOIN watchlist on course.courID=watchlist.courID
	where course.catID=caID and course.courID<>coID
	GROUP BY course.courID, title,prices,sale, lastUpdate
	ORDER BY numRegister DESC LIMIT 5;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ViewAllCategoryByBranchID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ViewAllCategoryByBranchID`;
delimiter ;;
CREATE PROCEDURE `sp_ViewAllCategoryByBranchID`(IN id int(11))
begin
	select * 
	from category 
	where branchID=id;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ViewAllCourseByBranchID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ViewAllCourseByBranchID`;
delimiter ;;
CREATE PROCEDURE `sp_ViewAllCourseByBranchID`(IN id int(11), lm int(11), ofs int(11))
begin
	select course.courID, title, course.catID, branch.branchID, teacherID, tiniDes,prices,sale,dateUpload,views,premium,avg(rate) as rate, count(rate) as numRate
	from branch, category, course LEFT JOIN feedback on course.courID=feedback.courID
	where branch.branchID=category.branchID and category.catID=course.catID and branch.branchID= id 
	group by course.courID, title, branch.branchID, course.catID, teacherID, tiniDes,prices,sale,dateUpload,views,premium limit lm OFFSET ofs;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ViewAllCourseByCatID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ViewAllCourseByCatID`;
delimiter ;;
CREATE PROCEDURE `sp_ViewAllCourseByCatID`(IN id int(11), lm int(11), ofs int (11))
begin
	select course.courID, title, course.catID, branch.branchID, teacherID, tiniDes,prices,sale,dateUpload,views,premium,avg(rate) as rate, count(rate) as numRate
	from branch, category, course LEFT JOIN feedback on course.courID=feedback.courID
	where branch.branchID=category.branchID and category.catID=course.catID and course.catID = id
	group by course.courID, title, branch.branchID, course.catID, teacherID, tiniDes,prices,sale,dateUpload,views,premium limit lm OFFSET ofs;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_ViewDetailCourseByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_ViewDetailCourseByID`;
delimiter ;;
CREATE PROCEDURE `sp_ViewDetailCourseByID`(IN id INT(11))
BEGIN
  SELECT course.courID, title, course.catID, branch.branchID, teacherID, tiniDes, prices,sale,fullDes,dateUpload,lastUpdate,views,`status`,premium,`language`, avg(rate) as rate, count(rate) as numRate,(select count(*) from watchlist where courID=id) as NumRegister
	FROM branch, category, course LEFT JOIN feedback on course.courID=feedback.courID 
	WHERE branch.branchID=category.branchID and category.catID=course.catID and course.courID=id
	GROUP BY  course.courID, title, course.catID, branch.branchID, teacherID, tiniDes, prices,sale,fullDes,dateUpload,lastUpdate,views,`status`,premium,`language`;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table course
-- ----------------------------
DROP TRIGGER IF EXISTS `tg_UpdateWatchList_WishList`;
delimiter ;;
CREATE TRIGGER `tg_UpdateWatchList_WishList` BEFORE DELETE ON `course` FOR EACH ROW begin
	declare courseID int;
	set courseID = old.courID;
	delete from watchlist where courID = courseID;
	delete from wishlist where courID = courseID;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

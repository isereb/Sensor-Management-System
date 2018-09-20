
CREATE TABLE `user` (
	`id` int NOT NULL AUTO_INCREMENT,
	`username` varchar(32) NOT NULL,
	`email` varchar(32) NOT NULL,
	`password` char(64) NOT NULL,
	`name` varchar(64) NOT NULL,
	`phone` int(14) NOT NULL,
	`last_login` timestamp NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sensor` (
	`id` int NOT NULL AUTO_INCREMENT,
	`owner` int NOT NULL,
	`password` char(64) NOT NULL,
	`address` varchar(64) NOT NULL,
	`max` double NOT NULL,
	`min` double NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	`is_deleted` tinyint NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
);

CREATE TABLE `monitoring` (
	`id` int NOT NULL AUTO_INCREMENT,
	`sensor` int NOT NULL,
	`value` double NOT NULL,
	`created_at` timestamp NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `sensoraccess` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user` int NOT NULL,
	`sensor` int NOT NULL,
	`given_at` timestamp NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `group` (
	`id` int NOT NULL AUTO_INCREMENT,
	`name` varchar(64) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `access` (
	`id` int NOT NULL AUTO_INCREMENT,
	`group` int NOT NULL,
	`user` int NOT NULL,
	`given_at` timestamp NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `sensor` ADD CONSTRAINT `sensor_fk0` FOREIGN KEY (`owner`) REFERENCES `user`(`id`);

ALTER TABLE `monitoring` ADD CONSTRAINT `monitoring_fk0` FOREIGN KEY (`sensor`) REFERENCES `sensor`(`id`);

ALTER TABLE `sensoraccess` ADD CONSTRAINT `sensoraccess_fk0` FOREIGN KEY (`user`) REFERENCES `user`(`id`);

ALTER TABLE `sensoraccess` ADD CONSTRAINT `sensoraccess_fk1` FOREIGN KEY (`sensor`) REFERENCES `sensor`(`id`);

ALTER TABLE `access` ADD CONSTRAINT `access_fk0` FOREIGN KEY (`group`) REFERENCES `group`(`id`);

ALTER TABLE `access` ADD CONSTRAINT `access_fk1` FOREIGN KEY (`user`) REFERENCES `user`(`id`);


/*
-- Query: select * from user
LIMIT 0, 1000

-- Date: 2018-08-14 14:12
*/
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (1,'JoshK','unique@email.com','myUniquePassword','Firstname Lastname',123123,'2018-08-14 12:38:09','2018-08-03 13:59:06','2018-08-03 13:59:06');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (2,'almasrkh','almasrkh@email.com','pass','Khaled Amasri',535646884,'2018-08-14 12:53:40','2018-08-03 14:00:20','2018-08-14 12:53:40');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (3,'sereb','Ilya-serb@email.com','ilya','Ilya Serebryannikov',754454545,'2018-08-14 12:46:28','2018-08-03 14:00:35','2018-08-03 14:00:35');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (4,'BarryT','sample@www.com','1234','Barry',787878788,'2018-08-14 12:38:09','2018-08-04 19:49:11','2018-08-04 19:49:11');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (5,'TmaC','s222@www.com','1111','Tyler',647546555,'2018-08-14 12:38:09','2018-08-04 20:04:38','2018-08-04 20:04:38');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (6,'HankJJ','damp@ds.com','2222','Frank',647546555,'2018-08-14 12:38:09','2018-08-07 15:24:42','2018-08-07 15:24:42');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (7,'BirdYY','ssamso@w2.ca','1232','Ivan',555885567,'2018-08-14 12:38:09','2018-08-07 15:25:02','2018-08-07 15:25:02');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (8,'Dude123','ssamso@w3.ca','3333','Danny',321348838,'2018-08-14 12:38:09','2018-08-07 15:25:48','2018-08-07 15:25:48');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (9,'Guy','4Strret@games.ca','4444','Sally',338384836,'2018-08-14 12:38:09','2018-08-07 15:26:59','2018-08-07 15:26:59');
INSERT INTO `user` (`id`,`username`,`email`,`password`,`name`,`phone`,`last_login`,`created_at`,`updated_at`) VALUES (10,'DJ Khaled','d@dad.com','5555','Johnny',348348348,'2018-08-14 12:38:09','2018-08-07 15:28:20','2018-08-07 15:28:20');

/*
-- Query: select * from sensor
LIMIT 0, 1000

-- Date: 2018-08-14 14:12
*/
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (1,2,'anotherPassword','44 Address, Brampton, ON',50,20,'2018-08-03 14:03:31','2018-08-03 14:03:31',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (2,2,'anotherPassword2','46 Address, Brampton, ON',50,20,'2018-08-14 11:29:39','2018-08-03 14:03:34',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (4,3,'pass','35 street, Brampton, ON',50,20,'2018-08-14 11:25:52','2018-08-04 18:59:16',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (5,3,'pass','37 street, Brampton, ON',50,20,'2018-08-14 11:25:52','2018-08-04 19:02:57',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (6,3,'pass','39 street, Brampton, ON',50,20,'2018-08-14 11:25:52','2018-08-04 19:09:12',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (7,2,'p','16 Fifteen St',10,2,'2018-08-14 11:25:52','2018-08-04 19:19:51',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (8,2,'pp','15 Fifteen St',11,3,'2018-08-04 19:21:04','2018-08-04 19:21:04',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (9,3,'p','33 Road',10,2,'2018-08-14 11:29:39','2018-08-04 19:32:17',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (10,3,'p','32 Place',9,4,'2018-08-14 11:25:52','2018-08-04 19:32:57',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (11,2,'p','44',4,4,'2018-08-07 14:06:51','2018-08-07 14:06:51',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (12,2,'3','15',3,3,'2018-08-07 15:25:16','2018-08-07 15:25:16',0);
INSERT INTO `sensor` (`id`,`owner`,`password`,`address`,`max`,`min`,`created_at`,`updated_at`,`is_deleted`) VALUES (13,2,'ffff','55 Three St',2,3,'2018-08-14 11:10:46','2018-08-14 11:10:46',0);

/*
-- Query: select * from monitoring
LIMIT 0, 1000

-- Date: 2018-08-14 14:13
*/
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (1,1,30,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (2,1,29,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (3,1,29,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (4,1,28,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (5,1,28,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (6,1,27,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (7,1,27,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (8,1,26,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (9,1,26,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (10,1,25,'2018-08-14 11:30:36');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (11,2,20,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (12,2,21,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (13,2,23,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (14,2,24,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (15,2,26,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (16,2,27,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (17,2,29,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (18,2,30,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (19,2,32,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (20,2,33,'2018-08-14 11:30:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (21,7,10,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (22,7,12,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (23,7,14,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (24,7,16,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (25,7,18,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (26,7,21,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (27,7,23,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (28,7,25,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (29,7,27,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (30,7,29,'2018-08-14 11:31:29');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (31,8,10,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (32,8,8,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (33,8,6,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (34,8,4,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (35,8,2,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (36,8,1,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (37,8,-1,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (38,8,-3,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (39,8,-5,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (40,8,-7,'2018-08-14 11:31:41');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (41,5,10,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (42,5,8,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (43,5,6,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (44,5,4,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (45,5,2,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (46,5,1,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (47,5,-1,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (48,5,-3,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (49,5,-5,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (50,5,-7,'2018-08-14 11:32:08');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (51,4,10,'2018-08-14 11:32:22');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (52,4,12,'2018-08-14 11:32:22');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (53,4,14,'2018-08-14 11:32:23');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (54,4,16,'2018-08-14 11:32:23');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (55,4,18,'2018-08-14 11:32:23');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (56,4,21,'2018-08-14 11:32:23');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (57,4,23,'2018-08-14 11:32:23');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (58,4,25,'2018-08-14 11:32:23');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (59,4,27,'2018-08-14 11:32:23');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (60,4,29,'2018-08-14 11:32:23');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (61,6,20,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (62,6,23,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (63,6,26,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (64,6,29,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (65,6,32,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (66,6,36,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (67,6,39,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (68,6,42,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (69,6,45,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (70,6,48,'2018-08-14 11:32:35');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (71,11,20,'2018-08-14 11:32:42');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (72,11,23,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (73,11,26,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (74,11,29,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (75,11,32,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (76,11,36,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (77,11,39,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (78,11,42,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (79,11,45,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (80,11,48,'2018-08-14 11:32:43');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (81,12,20,'2018-08-14 11:32:49');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (82,12,17,'2018-08-14 11:32:49');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (83,12,14,'2018-08-14 11:32:49');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (84,12,11,'2018-08-14 11:32:49');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (85,12,8,'2018-08-14 11:32:49');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (86,12,6,'2018-08-14 11:32:49');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (87,12,3,'2018-08-14 11:32:49');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (88,12,0,'2018-08-14 11:32:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (89,12,-3,'2018-08-14 11:32:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (90,12,-6,'2018-08-14 11:32:50');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (91,9,25,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (92,9,22,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (93,9,19,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (94,9,16,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (95,9,13,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (96,9,11,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (97,9,8,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (98,9,5,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (99,9,2,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (100,9,-1,'2018-08-14 11:33:38');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (101,13,25,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (102,13,22,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (103,13,19,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (104,13,16,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (105,13,13,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (106,13,11,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (107,13,8,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (108,13,5,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (109,13,2,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (110,13,-1,'2018-08-14 11:33:54');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (111,10,26,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (112,10,29,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (113,10,32,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (114,10,35,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (115,10,38,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (116,10,42,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (117,10,45,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (118,10,48,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (119,10,51,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (120,10,54,'2018-08-14 11:34:05');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (121,10,26,'2018-08-14 11:34:09');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (122,10,29,'2018-08-14 11:34:09');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (123,10,32,'2018-08-14 11:34:09');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (124,10,35,'2018-08-14 11:34:09');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (125,10,38,'2018-08-14 11:34:09');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (126,10,42,'2018-08-14 11:34:09');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (127,10,45,'2018-08-14 11:34:10');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (128,10,48,'2018-08-14 11:34:10');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (129,10,51,'2018-08-14 11:34:10');
INSERT INTO `monitoring` (`id`,`sensor`,`value`,`created_at`) VALUES (130,10,54,'2018-08-14 11:34:10');



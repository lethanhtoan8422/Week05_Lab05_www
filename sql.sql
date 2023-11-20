-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.1.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for week05
CREATE DATABASE IF NOT EXISTS `week05` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `week05`;

-- Dumping structure for table week05.address
CREATE TABLE IF NOT EXISTS `address` (
  `add_id` bigint(20) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` smallint(6) DEFAULT NULL CHECK (`country` between 0 and 271),
  `number` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table week05.address: ~10 rows (approximately)
INSERT INTO `address` (`add_id`, `city`, `country`, `number`, `street`, `zipcode`) VALUES
	(1, 'New York', 1, '123', 'Main Street', '10001'),
	(2, 'Los Angeles', 1, '456', 'Broadway', '90001'),
	(3, 'London', 2, '789', 'Oxford Street', 'SW1A 1AA'),
	(4, 'Paris', 3, '456', 'Champs-Élysées', '75008'),
	(5, 'Tokyo', 4, '789', 'Ginza', '100-0001'),
	(6, 'Sydney', 5, '123', 'George Street', '2000'),
	(7, 'Berlin', 6, '456', 'Friedrichstraße', '10117'),
	(8, 'Rome', 7, '789', 'Via del Corso', '00186'),
	(9, 'Moscow', 8, '123', 'Tverskaya Street', '125009'),
	(10, 'Beijing', 9, '456', 'Wangfujing Street', '100006');

-- Dumping structure for table week05.candidate
CREATE TABLE IF NOT EXISTS `candidate` (
  `can_id` bigint(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`can_id`),
  UNIQUE KEY `UK_m8qhlm4wu215gr34dhxp0dour` (`address`),
  CONSTRAINT `FKa8gnyyhbb2qnhp94grci1n0o9` FOREIGN KEY (`address`) REFERENCES `address` (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table week05.candidate: ~10 rows (approximately)
INSERT INTO `candidate` (`can_id`, `dob`, `email`, `full_name`, `phone`, `address`) VALUES
	(1, '1990-05-15', 'john.smith@example.com', 'John Smith', '123456789', 1),
	(2, '1985-09-20', 'emma.johnson@example.com', 'Emma Johnson', '987654321', 2),
	(3, '1992-11-10', 'michael.brown@example.com', 'Michael Brown', '555555555', 3),
	(4, '1994-07-03', 'sophia.davis@example.com', 'Sophia Davis', '111111111', 4),
	(5, '1988-12-28', 'william.wilson@example.com', 'William Wilson', '999999999', 5),
	(6, '1991-03-17', 'olivia.thompson@example.com', 'Olivia Thompson', '777777777', 6),
	(7, '1987-08-08', 'james.lee@example.com', 'James Lee', '222222222', 7),
	(8, '1993-01-25', 'ava.martinez@example.com', 'Ava Martinez', '888888888', 8),
	(9, '1996-04-12', 'alexander.taylor@example.com', 'Alexander Taylor', '333333333', 9),
	(10, '1995-06-30', 'mia.anderson@example.com', 'Mia Anderson', '444444444', 10);

-- Dumping structure for table week05.candidate_skill
CREATE TABLE IF NOT EXISTS `candidate_skill` (
  `more_infos` varchar(255) DEFAULT NULL,
  `skill_level` tinyint(4) DEFAULT NULL CHECK (`skill_level` between 0 and 4),
  `skill_id` bigint(20) NOT NULL,
  `can_id` bigint(20) NOT NULL,
  PRIMARY KEY (`can_id`,`skill_id`),
  KEY `FKb7cxhiqhcah7c20a2cdlvr1f8` (`skill_id`),
  CONSTRAINT `FKb0m5tm3fi0upa3b3kjx3vrlxs` FOREIGN KEY (`can_id`) REFERENCES `candidate` (`can_id`),
  CONSTRAINT `FKb7cxhiqhcah7c20a2cdlvr1f8` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table week05.candidate_skill: ~11 rows (approximately)
INSERT INTO `candidate_skill` (`more_infos`, `skill_level`, `skill_id`, `can_id`) VALUES
	('Additional info 1', 3, 1, 1),
	('more info', 3, 6, 1),
	('Additional info 2', 2, 1, 2),
	('Additional info 3', 4, 2, 3),
	('Additional info 4', 1, 2, 4),
	('Additional info 5', 3, 3, 5),
	('Additional info 6', 2, 3, 6),
	('Additional info 7', 4, 4, 7),
	('Additional info 8', 1, 4, 8),
	('Additional info 9', 3, 5, 9),
	('Additional info 10', 2, 5, 10);

-- Dumping structure for table week05.company
CREATE TABLE IF NOT EXISTS `company` (
  `com_id` bigint(20) NOT NULL,
  `about` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comp_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `web_url` varchar(255) DEFAULT NULL,
  `address` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  UNIQUE KEY `UK_rvp2hunsq4sgmpxe3a7i1ym3m` (`address`),
  CONSTRAINT `FKd5occp4cjwihejbxdbpvkp5tv` FOREIGN KEY (`address`) REFERENCES `address` (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table week05.company: ~10 rows (approximately)
INSERT INTO `company` (`com_id`, `about`, `email`, `comp_name`, `phone`, `web_url`, `address`) VALUES
	(1, 'A technology company specializing in software development.', 'info@company1.com', 'Company 1', '123456789', 'www.company1.com', 1),
	(2, 'An e-commerce company selling a wide range of products.', 'info@company2.com', 'Company 2', '987654321', 'www.company2.com', 2),
	(3, 'A multinational conglomerate with diverse business interests.', 'info@company3.com', 'Company 3', '555555555', 'www.company3.com', 3),
	(4, 'A fashion brand known for its trendy clothing and accessories.', 'info@company4.com', 'Company 4', '111111111', 'www.company4.com', 4),
	(5, 'A leading automotive manufacturer producing innovative vehicles.', 'info@company5.com', 'Company 5', '999999999', 'www.company5.com', 5),
	(6, 'A financial services company providing banking and investment solutions.', 'info@company6.com', 'Company 6', '777777777', 'www.company6.com', 6),
	(7, 'A telecommunications company offering mobile and internet services.', 'info@company7.com', 'Company 7', '222222222', 'www.company7.com', 7),
	(8, 'An entertainment company known for its movies and television shows.', 'info@company8.com', 'Company 8', '888888888', 'www.company8.com', 8),
	(9, 'A leading energy company involved in oil and gas exploration.', 'info@company9.com', 'Company 9', '333333333', 'www.company9.com', 9),
	(10, 'A food and beverage company operating a chain of restaurants.', 'info@company10.com', 'Company 10', '444444444', 'www.company10.com', 10);

-- Dumping structure for table week05.experience
CREATE TABLE IF NOT EXISTS `experience` (
  `exp_id` bigint(20) NOT NULL,
  `company` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `work_desc` varchar(255) DEFAULT NULL,
  `can_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`exp_id`),
  KEY `FK8d5oqe0wxh52v352i04qnuady` (`can_id`),
  CONSTRAINT `FK8d5oqe0wxh52v352i04qnuady` FOREIGN KEY (`can_id`) REFERENCES `candidate` (`can_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table week05.experience: ~10 rows (approximately)
INSERT INTO `experience` (`exp_id`, `company`, `from_date`, `role`, `to_date`, `work_desc`, `can_id`) VALUES
	(1, 'Company A', '2022-01-01', 'Role A', '2022-03-31', 'Work description A', 1),
	(2, 'Company B', '2022-04-01', 'Role B', '2022-06-30', 'Work description B', 2),
	(3, 'Company C', '2022-07-01', 'Role C', '2022-09-30', 'Work description C', 3),
	(4, 'Company D', '2022-10-01', 'Role D', '2022-12-31', 'Work description D', 4),
	(5, 'Company E', '2023-01-01', 'Role E', '2023-03-31', 'Work description E', 5),
	(6, 'Company F', '2023-04-01', 'Role F', '2023-06-30', 'Work description F', 6),
	(7, 'Company G', '2023-07-01', 'Role G', '2023-09-30', 'Work description G', 7),
	(8, 'Company H', '2023-10-01', 'Role H', '2023-12-31', 'Work description H', 8),
	(9, 'Company I', '2024-01-01', 'Role I', '2024-03-31', 'Work description I', 9),
	(10, 'Company J', '2024-04-01', 'Role J', '2024-06-30', 'Work description J', 10);

-- Dumping structure for table week05.job
CREATE TABLE IF NOT EXISTS `job` (
  `job_id` bigint(20) NOT NULL,
  `job_desc` varchar(255) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `company` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  KEY `FKbaqlvluu78phmo9ld89um7wnm` (`company`),
  CONSTRAINT `FKbaqlvluu78phmo9ld89um7wnm` FOREIGN KEY (`company`) REFERENCES `company` (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table week05.job: ~10 rows (approximately)
INSERT INTO `job` (`job_id`, `job_desc`, `job_name`, `company`) VALUES
	(1, 'Software Engineer position', 'Software Engineer', 1),
	(2, 'Marketing Manager position', 'Marketing Manager', 2),
	(3, 'Business Analyst position', 'Business Analyst', 3),
	(4, 'Fashion Designer position', 'Fashion Designer', 4),
	(5, 'Mechanical Engineer position', 'Mechanical Engineer', 5),
	(6, 'Financial Analyst position', 'Financial Analyst', 6),
	(7, 'Telecommunications Engineer position', 'Telecommunications Engineer', 7),
	(8, 'Film Director position', 'Film Director', 8),
	(9, 'Petroleum Engineer position', 'Petroleum Engineer', 9),
	(10, 'Restaurant Manager position', 'Restaurant Manager', 10);

-- Dumping structure for table week05.job_skill
CREATE TABLE IF NOT EXISTS `job_skill` (
  `more_infos` varchar(255) DEFAULT NULL,
  `skill_level` tinyint(4) DEFAULT NULL CHECK (`skill_level` between 0 and 4),
  `job_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL,
  PRIMARY KEY (`job_id`,`skill_id`),
  KEY `FKj33qbbf3vk1lvhqpcosnh54u1` (`skill_id`),
  CONSTRAINT `FK9ix4wg520ii2gu2felxdhdup6` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `FKj33qbbf3vk1lvhqpcosnh54u1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table week05.job_skill: ~20 rows (approximately)
INSERT INTO `job_skill` (`more_infos`, `skill_level`, `job_id`, `skill_id`) VALUES
	('Additional info 1', 3, 1, 1),
	('Additional info 2', 2, 1, 2),
	('Additional info 3', 4, 2, 3),
	('Additional info 4', 1, 2, 4),
	('Additional info 5', 3, 3, 5),
	('Additional info 6', 2, 3, 6),
	('Additional info 7', 4, 4, 7),
	('Additional info 8', 1, 4, 8),
	('Additional info 9', 3, 5, 9),
	('Additional info 10', 2, 5, 10),
	('Additional info 11', 3, 6, 1),
	('Additional info 12', 2, 6, 2),
	('Additional info 13', 4, 7, 3),
	('Additional info 14', 1, 7, 4),
	('Additional info 15', 3, 8, 5),
	('Additional info 16', 2, 8, 6),
	('Additional info 17', 4, 9, 7),
	('Additional info 18', 1, 9, 8),
	('Additional info 19', 3, 10, 9),
	('Additional info 20', 2, 10, 10);

-- Dumping structure for table week05.skill
CREATE TABLE IF NOT EXISTS `skill` (
  `skill_id` bigint(20) NOT NULL,
  `skill_desc` varchar(255) DEFAULT NULL,
  `skill_name` varchar(255) DEFAULT NULL,
  `skill_type` tinyint(4) DEFAULT NULL CHECK (`skill_type` between 0 and 2),
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table week05.skill: ~10 rows (approximately)
INSERT INTO `skill` (`skill_id`, `skill_desc`, `skill_name`, `skill_type`) VALUES
	(1, 'Java programming language', 'Java', 1),
	(2, 'Python programming language', 'Python', 1),
	(3, 'JavaScript programming language', 'JavaScript', 1),
	(4, 'HTML markup language', 'HTML', 2),
	(5, 'CSS styling language', 'CSS', 2),
	(6, 'SQL database query language', 'SQL', 2),
	(7, 'Data analysis and interpretation', 'Data Analysis', 0),
	(8, 'Project management skills', 'Project Management', 0),
	(9, 'Effective communication skills', 'Communication', 0),
	(10, 'Problem-solving abilities', 'Problem Solving', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

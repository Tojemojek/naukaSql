
DROP TABLE IF EXISTS `employees`;
DROP TABLE IF EXISTS `department`;
DROP TABLE IF EXISTS `salary_grade`;

CREATE TABLE `department` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(20) COLLATE utf8_polish_ci DEFAULT NULL,
  `dep_location` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(15) COLLATE utf8_polish_ci DEFAULT NULL,
  `job_name` varchar(10) COLLATE utf8_polish_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `commission` decimal(7,2) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_dep_id` (`dep_id`),
  CONSTRAINT `fk_dep_id` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

CREATE TABLE `salary_grade` (
  `grade` int(11) DEFAULT NULL,
  `min_sal` int(11) DEFAULT NULL,
  `max_sal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

INSERT INTO `department` VALUES (1001,'FINANCE','SYDNEY'),(2001,'AUDIT','MELBOURNE'),(3001,'MARKETING','PERTH'),(4001,'PRODUCTION','BRISBANE');
INSERT INTO `employees` VALUES (63679,'SANDRINE','CLERK',69062,'1990-12-18',900.00,NULL,2001),(64989,'ADELYN','SALESMAN',66928,'1991-02-20',1700.00,400.00,3001),(65271,'WADE','SALESMAN',66928,'1991-02-22',1350.00,600.00,3001),(65646,'JONAS','MANAGER',68319,'1991-04-02',2957.00,NULL,2001),(66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350.00,1500.00,3001),(66928,'BLAZE','MANAGER',68319,'1991-05-01',2750.00,NULL,3001),(67832,'CLARE','MANAGER',68319,'1991-06-09',2550.00,NULL,1001),(67858,'SCARLET','ANALYST',65646,'1997-04-19',3100.00,NULL,2001),(68319,'KAYLING','PRESIDENT',NULL,'1991-11-18',6000.00,NULL,1001),(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600.00,0.00,3001),(68736,'ADNRES','CLERK',67858,'1997-05-23',1200.00,NULL,2001),(69000,'JULIUS','CLERK',66928,'1991-12-03',1050.00,NULL,3001),(69062,'FRANK','ANALYST',65646,'1991-12-03',3100.00,NULL,2001),(69324,'MARKER','CLERK',67832,'1992-01-23',1400.00,NULL,1001);
INSERT INTO `salary_grade` VALUES (1,800,1300),(2,1301,1500),(3,1501,2100),(4,2101,3100),(5,3101,9999);

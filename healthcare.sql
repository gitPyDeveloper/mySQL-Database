show databases;
create database healthcare;
use healthcare;


--
-- Database: `healthcare_schema`
--

-- --------------------------------------------------------

--
-- Table structure for table `accidents`
--

CREATE TABLE IF NOT EXISTS `accidents` (
  `aid` int(11) DEFAULT NULL,
  `car_acc` int(11) DEFAULT NULL,
  `motorcycle_acc` int(11) DEFAULT NULL,
  `ped_acc` int(11) DEFAULT NULL,
  KEY `aid` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accidents`
--

INSERT INTO `accidents` (`aid`, `car_acc`, `motorcycle_acc`, `ped_acc`) VALUES
(1, 1, 1, 0),
(4, 0, 1, 0),
(7, 0, 0, 1),
(2, 0, 1, 0),
(5, 0, 0, 0),
(8, 0, 1, 1),
(3, 0, 0, 0),
(6, 0, 1, 0),
(9, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `citizens`
--

CREATE TABLE IF NOT EXISTS `citizens` (
  `ssn` int(9) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `marital_status` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ethniciy` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `citizens`
--

INSERT INTO `citizens` (`ssn`, `c_name`, `marital_status`, `gender`, `dob`, `ethniciy`) VALUES
(100000001, 'cit1', 'married', 'female', '1987-03-03', 'Asian'),
(100000002, 'cit2', 'single', 'male', '1966-09-12', 'Latino'),
(100000003, 'cit3', 'single', 'female', '1991-08-03', 'Native American'),
(100000004, 'cit4', 'married', 'male', '1990-12-03', 'Asian'),
(100000005, 'cit5', 'married', 'male', '1985-04-11', 'Native American'),
(100000006, 'cit6', 'single', 'male', '1984-11-11', 'Native American'),
(100000007, 'cit7', 'married', 'female', '1970-12-12', 'Hispanic'),
(100000008, 'cit8', 'single', 'male', '1980-12-02', 'Native American'),
(100000009, 'cit9', 'single', 'female', '1990-12-09', 'Native American'),
(100000010, 'cit10', 'married', 'male', '1987-01-01', 'Latino'),
(100000011, 'cit11', 'married', 'female', '1988-02-02', 'Asian'),
(100000012, 'cit12', 'married', 'male', '1978-04-04', 'Asian'),
(100000013, 'cit13', 'single', 'male', '1992-05-05', 'Hispanic'),
(100000014, 'cit14', 'single', 'female', '1993-08-08', 'Asian'),
(100000015, 'cit15', 'married', 'female', '1984-09-09', 'Native American');

-- --------------------------------------------------------

--
-- Table structure for table `cus_dis_rel`
--

CREATE TABLE IF NOT EXISTS `cus_dis_rel` (
  `ssn` int(9) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `d_type` varchar(30) NOT NULL DEFAULT '',
  `diag_year` date DEFAULT NULL,
  PRIMARY KEY (`ssn`,`sid`,`d_type`),
  KEY `d_type` (`d_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cus_dis_rel`
--

INSERT INTO `cus_dis_rel` (`ssn`, `sid`, `d_type`, `diag_year`) VALUES
(100000002, 1, 'Diabetes', '2014-00-00'),
(100000002, 2, 'Hypertension', '2011-00-00'),
(100000004, 2, 'COPD', '2003-00-00'),
(100000005, 2, 'Diabetes', '2006-00-00'),
(100000005, 3, 'Hypertension', '2004-00-00'),
(100000005, 3, 'Myocardial Infraction', '2009-00-00'),
(100000006, 6, 'COPD', '2012-00-00'),
(100000009, 9, 'Diabetes', '1999-00-00'),
(100000013, 10, 'COPD', '2000-00-00'),
(100000015, 10, 'COPD', '2001-00-00'),
(100000015, 24, 'Myocardial Infraction', '2003-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `cus_hab_rel`
--

CREATE TABLE IF NOT EXISTS `cus_hab_rel` (
  `ssn` int(9) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `h_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`ssn`,`sid`,`h_type`),
  KEY `h_type` (`h_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cus_hab_rel`
--

INSERT INTO `cus_hab_rel` (`ssn`, `sid`, `h_type`) VALUES
(100000001, 1, 'alcohol'),
(100000002, 2, 'alcohol'),
(100000004, 2, 'alcohol'),
(100000006, 6, 'alcohol'),
(100000003, 1, 'smoking'),
(100000004, 2, 'smoking'),
(100000005, 2, 'smoking'),
(100000007, 5, 'smoking');

-- --------------------------------------------------------

--
-- Table structure for table `cus_occ_rel`
--

CREATE TABLE IF NOT EXISTS `cus_occ_rel` (
  `ssn` int(9) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `o_type` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`ssn`,`sid`,`o_type`),
  KEY `o_type` (`o_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cus_occ_rel`
--

INSERT INTO `cus_occ_rel` (`ssn`, `sid`, `o_type`) VALUES
(100000002, 2, 'farmer'),
(100000003, 1, 'farmer'),
(100000004, 2, 'farmer'),
(100000008, 5, 'farmer'),
(100000010, 6, 'farmer'),
(100000013, 10, 'farmer'),
(100000015, 24, 'farmer'),
(100000002, 2, 'industrial labor worker'),
(100000004, 3, 'industrial labor worker'),
(100000005, 2, 'industrial labor worker'),
(100000006, 6, 'industrial labor worker'),
(100000009, 9, 'industrial labor worker'),
(100000010, 6, 'industrial labor worker'),
(100000012, 12, 'industrial labor worker'),
(100000001, 1, 'office employee'),
(100000004, 2, 'office employee'),
(100000006, 6, 'office employee'),
(100000007, 5, 'office employee'),
(100000008, 5, 'office employee'),
(100000009, 9, 'office employee'),
(100000011, 12, 'office employee'),
(100000013, 10, 'office employee'),
(100000014, 10, 'office employee');

-- --------------------------------------------------------

--
-- Table structure for table `cus_sur_rel`
--

CREATE TABLE IF NOT EXISTS `cus_sur_rel` (
  `ssn` int(9) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ssn`,`sid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cus_sur_rel`
--

INSERT INTO `cus_sur_rel` (`ssn`, `sid`) VALUES
(100000001, 1),
(100000002, 1),
(100000003, 1),
(100000004, 1),
(100000005, 1),
(100000001, 2),
(100000002, 2),
(100000003, 2),
(100000004, 2),
(100000005, 2),
(100000001, 3),
(100000002, 3),
(100000003, 3),
(100000004, 3),
(100000005, 3),
(100000001, 4),
(100000002, 4),
(100000003, 4),
(100000004, 4),
(100000005, 4),
(100000006, 5),
(100000007, 5),
(100000008, 5),
(100000009, 5),
(100000010, 5),
(100000006, 6),
(100000007, 6),
(100000008, 6),
(100000009, 6),
(100000010, 6),
(100000006, 7),
(100000007, 7),
(100000008, 7),
(100000009, 7),
(100000010, 7),
(100000006, 8),
(100000007, 8),
(100000008, 8),
(100000009, 8),
(100000010, 8),
(100000006, 9),
(100000007, 9),
(100000008, 9),
(100000009, 9),
(100000010, 9),
(100000011, 10),
(100000012, 10),
(100000013, 10),
(100000014, 10),
(100000015, 10),
(100000011, 11),
(100000012, 11),
(100000013, 11),
(100000014, 11),
(100000015, 11),
(100000011, 12),
(100000012, 12),
(100000013, 12),
(100000014, 12),
(100000015, 12),
(100000001, 13),
(100000002, 13),
(100000003, 14),
(100000004, 14),
(100000002, 15),
(100000005, 15),
(100000003, 16),
(100000006, 17),
(100000007, 17),
(100000009, 18),
(100000010, 18),
(100000006, 19),
(100000008, 20),
(100000007, 21),
(100000011, 22),
(100000012, 22),
(100000013, 23),
(100000014, 24),
(100000015, 24),
(100000001, 25),
(100000002, 25),
(100000003, 26),
(100000004, 27),
(100000005, 28),
(100000006, 29),
(100000007, 30),
(100000008, 31),
(100000009, 32),
(100000010, 33),
(100000011, 34),
(100000012, 34),
(100000013, 35),
(100000014, 35),
(100000015, 36);

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE IF NOT EXISTS `diseases` (
  `d_type` varchar(30) NOT NULL,
  PRIMARY KEY (`d_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`d_type`) VALUES
('COPD'),
('Diabetes'),
('Hypertension'),
('Myocardial Infraction');

-- --------------------------------------------------------

--
-- Table structure for table `env_parameters`
--

CREATE TABLE IF NOT EXISTS `env_parameters` (
  `sid` int(11) DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  `CO_conc` float DEFAULT NULL,
  `pollen_conc` float DEFAULT NULL,
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`aid`),
  KEY `zip` (`zip`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `env_parameters`
--

INSERT INTO `env_parameters` (`sid`, `zip`, `CO_conc`, `pollen_conc`, `aid`) VALUES
(1, 76011, 12, 3.4, 1),
(5, 76012, 3.2, 1.4, 2),
(10, 76013, 6.1, 5.5, 3),
(13, 76011, 3.9, 3, 4),
(17, 76012, 3, 1, 5),
(22, 76013, 5.7, 5, 6),
(25, 76011, 4, 3.2, 7),
(29, 76012, 3.2, 1.5, 8),
(34, 76013, 5, 5.2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE IF NOT EXISTS `food` (
  `ssn` int(9) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `fruit` int(11) NOT NULL DEFAULT '0',
  `fast_food` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ssn`,`sid`,`fruit`,`fast_food`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`ssn`, `sid`, `fruit`, `fast_food`) VALUES
(100000001, 1, 7, 0),
(100000002, 2, 4, 4),
(100000003, 1, 1, 9),
(100000004, 2, 4, 8),
(100000005, 2, 4, 9),
(100000006, 6, 0, 10),
(100000007, 5, 7, 2),
(100000008, 5, 5, 5),
(100000009, 9, 3, 7),
(100000010, 6, 2, 2),
(100000011, 12, 5, 5),
(100000012, 12, 8, 0),
(100000013, 10, 0, 7),
(100000014, 10, 2, 5),
(100000015, 24, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `habbits`
--

CREATE TABLE IF NOT EXISTS `habbits` (
  `h_type` varchar(20) NOT NULL,
  PRIMARY KEY (`h_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `habbits`
--

INSERT INTO `habbits` (`h_type`) VALUES
('alcohol'),
('smoking'),
('tobacco');

-- --------------------------------------------------------

--
-- Table structure for table `healthcare_infra`
--

CREATE TABLE IF NOT EXISTS `healthcare_infra` (
  `hc_name` varchar(20) NOT NULL,
  `hc_type` varchar(30) DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  PRIMARY KEY (`hc_name`),
  KEY `zip` (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `healthcare_infra`
--

INSERT INTO `healthcare_infra` (`hc_name`, `hc_type`, `zip`) VALUES
('TA_hosp', 'Hospital', 76011),
('TA_rehab', 'Rehabilitiation center', 76011),
('TB_hosp', 'Hospital', 76012),
('TB_rehab', 'Hospital', 76012),
('TC_hosp', 'Hospital', 76013),
('TC_rehab', 'rehabilitation center', 76013);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `zip` int(5) NOT NULL,
  `l_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`zip`, `l_name`) VALUES
(76011, 'Town A'),
(76012, 'Town B'),
(76013, 'Town C');

-- --------------------------------------------------------

--
-- Table structure for table `occupations`
--

CREATE TABLE IF NOT EXISTS `occupations` (
  `o_type` varchar(30) NOT NULL,
  PRIMARY KEY (`o_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `occupations`
--

INSERT INTO `occupations` (`o_type`) VALUES
('farmer'),
('industrial labor worker'),
('office employee');

-- --------------------------------------------------------

--
-- Table structure for table `officials`
--

CREATE TABLE IF NOT EXISTS `officials` (
  `username` varchar(20) NOT NULL,
  `passwrd` varchar(32) NOT NULL,
  `department` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `officials`
--

INSERT INTO `officials` (`username`, `passwrd`, `department`) VALUES
('user1', 'pwd1', 'Citizen Survey'),
('user2', 'pwd2', 'CO Monitoring'),
('user3', 'pwd3', 'Pollen Monitoring'),
('user4', 'pwd4', 'Accident Monitoring'),
('user5', 'pwd5', 'Health Care Infra'),
('user6', 'pwd6', 'Query Management');

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE IF NOT EXISTS `surveys` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `zip` int(5) DEFAULT NULL,
  `s_date` date DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `zip` (`zip`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`sid`, `zip`, `s_date`) VALUES
(1, 76011, '2014-01-01'),
(2, 76011, '2014-04-01'),
(3, 76011, '2014-08-01'),
(4, 76011, '2014-12-01'),
(5, 76012, '2014-01-01'),
(6, 76012, '2014-03-01'),
(7, 76012, '2014-05-01'),
(8, 76012, '2014-07-01'),
(9, 76012, '2014-08-01'),
(10, 76013, '2014-04-01'),
(11, 76013, '2014-08-01'),
(12, 76013, '2014-12-01'),
(13, 76011, '2013-01-01'),
(14, 76011, '2013-04-01'),
(15, 76011, '2013-08-01'),
(16, 76011, '2013-12-01'),
(17, 76012, '2013-01-01'),
(18, 76012, '2013-03-01'),
(19, 76012, '2013-05-01'),
(20, 76012, '2013-07-01'),
(21, 76012, '2013-09-01'),
(22, 76013, '2013-04-01'),
(23, 76013, '2013-08-01'),
(24, 76013, '2013-12-01'),
(25, 76011, '2012-01-01'),
(26, 76011, '2012-04-01'),
(27, 76011, '2012-08-01'),
(28, 76011, '2012-12-01'),
(29, 76012, '2012-01-01'),
(30, 76012, '2012-03-01'),
(31, 76012, '2012-05-01'),
(32, 76012, '2012-07-01'),
(33, 76012, '2013-09-01'),
(34, 76013, '2012-04-01'),
(35, 76013, '2012-08-01'),
(36, 76013, '2012-12-01');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accidents`
--
ALTER TABLE `accidents`
  ADD CONSTRAINT `accidents_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `env_parameters` (`aid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cus_dis_rel`
--
ALTER TABLE `cus_dis_rel`
  ADD CONSTRAINT `cus_dis_rel_ibfk_1` FOREIGN KEY (`ssn`, `sid`) REFERENCES `cus_sur_rel` (`ssn`, `sid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cus_dis_rel_ibfk_2` FOREIGN KEY (`d_type`) REFERENCES `diseases` (`d_type`) ON UPDATE CASCADE;

--
-- Constraints for table `cus_hab_rel`
--
ALTER TABLE `cus_hab_rel`
  ADD CONSTRAINT `cus_hab_rel_ibfk_1` FOREIGN KEY (`ssn`, `sid`) REFERENCES `cus_sur_rel` (`ssn`, `sid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cus_hab_rel_ibfk_2` FOREIGN KEY (`h_type`) REFERENCES `habbits` (`h_type`) ON UPDATE CASCADE;

--
-- Constraints for table `cus_occ_rel`
--
ALTER TABLE `cus_occ_rel`
  ADD CONSTRAINT `cus_occ_rel_ibfk_1` FOREIGN KEY (`ssn`, `sid`) REFERENCES `cus_sur_rel` (`ssn`, `sid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cus_occ_rel_ibfk_2` FOREIGN KEY (`o_type`) REFERENCES `occupations` (`o_type`) ON UPDATE CASCADE;

--
-- Constraints for table `cus_sur_rel`
--
ALTER TABLE `cus_sur_rel`
  ADD CONSTRAINT `cus_sur_rel_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `citizens` (`ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `cus_sur_rel_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `surveys` (`sid`) ON UPDATE CASCADE;

--
-- Constraints for table `env_parameters`
--
ALTER TABLE `env_parameters`
  ADD CONSTRAINT `env_parameters_ibfk_1` FOREIGN KEY (`zip`) REFERENCES `locations` (`zip`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `env_parameters_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `surveys` (`sid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`ssn`, `sid`) REFERENCES `cus_sur_rel` (`ssn`, `sid`) ON UPDATE CASCADE;

--
-- Constraints for table `healthcare_infra`
--
ALTER TABLE `healthcare_infra`
  ADD CONSTRAINT `healthcare_infra_ibfk_1` FOREIGN KEY (`zip`) REFERENCES `locations` (`zip`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `surveys`
--
ALTER TABLE `surveys`
  ADD CONSTRAINT `surveys_ibfk_1` FOREIGN KEY (`zip`) REFERENCES `locations` (`zip`) ON DELETE SET NULL ON UPDATE CASCADE;

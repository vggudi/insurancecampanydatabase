-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2018 at 03:48 PM
-- Server version: 5.5.34
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `insurance`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident`
--

CREATE TABLE IF NOT EXISTS `accident` (
  `report_number` int(11) NOT NULL DEFAULT '0',
  `accd_date` date DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`report_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accident`
--

INSERT INTO `accident` (`report_number`, `accd_date`, `location`) VALUES
(1, '2018-11-25', 'bijapur');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `regno` varchar(10) NOT NULL DEFAULT '',
  `model` varchar(10) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`regno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`regno`, `model`, `year`) VALUES
('ka28ab0590', 'ns', 2017),
('ka28ed0590', 'pulsar', 2017);

-- --------------------------------------------------------

--
-- Table structure for table `owns`
--

CREATE TABLE IF NOT EXISTS `owns` (
  `driver_id` varchar(10) NOT NULL DEFAULT '',
  `regno` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`driver_id`,`regno`),
  KEY `regno` (`regno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owns`
--

INSERT INTO `owns` (`driver_id`, `regno`) VALUES
('1', 'ka28ed0590');

-- --------------------------------------------------------

--
-- Table structure for table `participated`
--

CREATE TABLE IF NOT EXISTS `participated` (
  `driver_id` varchar(10) NOT NULL DEFAULT '',
  `regno` varchar(10) NOT NULL DEFAULT '',
  `report_number` int(11) NOT NULL DEFAULT '0',
  `damage_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`driver_id`,`regno`,`report_number`),
  KEY `regno` (`regno`),
  KEY `report_number` (`report_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `driver_id` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(10) DEFAULT NULL,
  `address` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`driver_id`, `name`, `address`) VALUES
('1', 'gf', 'gre'),
('2', 'vg', 'belagavi'),
('3', 'ss', 'bidar'),
('4', 'sj', 'bijapur');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `owns`
--
ALTER TABLE `owns`
  ADD CONSTRAINT `owns_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `person` (`driver_id`),
  ADD CONSTRAINT `owns_ibfk_2` FOREIGN KEY (`regno`) REFERENCES `car` (`regno`);

--
-- Constraints for table `participated`
--
ALTER TABLE `participated`
  ADD CONSTRAINT `participated_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `person` (`driver_id`),
  ADD CONSTRAINT `participated_ibfk_2` FOREIGN KEY (`regno`) REFERENCES `car` (`regno`),
  ADD CONSTRAINT `participated_ibfk_3` FOREIGN KEY (`report_number`) REFERENCES `accident` (`report_number`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

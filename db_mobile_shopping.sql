-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2017 at 10:13 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_mobile_shopping`
--
CREATE DATABASE IF NOT EXISTS `db_mobile_shopping` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_mobile_shopping`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categories`
--

CREATE TABLE IF NOT EXISTS `tbl_categories` (
  `Pk_int_categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `Vchr_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Pk_int_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE IF NOT EXISTS `tbl_feedback` (
  `Pk_int_feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_int_product_id` int(11) DEFAULT NULL,
  `Vchr_details` varchar(20) DEFAULT NULL,
  `Date_date` date DEFAULT NULL,
  PRIMARY KEY (`Pk_int_feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE IF NOT EXISTS `tbl_order` (
  `pk_int_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_int_product_id` int(11) DEFAULT NULL,
  `Vchr_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pk_int_order_id`),
  KEY `fk_int_product_id` (`fk_int_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE IF NOT EXISTS `tbl_product` (
  `Pk_int_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `Vchr_product_name` varchar(20) DEFAULT NULL,
  `Vchr_img_path` varchar(20) DEFAULT NULL,
  `Vchr_colour` varchar(20) DEFAULT NULL,
  `Vchr_camera` varchar(20) DEFAULT NULL,
  `Vchr_sim` varchar(20) DEFAULT NULL,
  `Vchr_wifi` varchar(20) DEFAULT NULL,
  `Vchr_memory_card` varchar(20) DEFAULT NULL,
  `Vchr_os` varchar(20) DEFAULT NULL,
  `Int_Price` float DEFAULT NULL,
  `Fk_int_product_id` int(11) DEFAULT NULL,
  `Fk_int_product_stock` int(11) DEFAULT NULL,
  `Fk_int_categories_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pk_int_product_id`),
  KEY `Fk_int_product_id` (`Fk_int_product_id`),
  KEY `Fk_int_product_stock` (`Fk_int_product_stock`),
  KEY `Fk_int_categories_id` (`Fk_int_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_date`
--

CREATE TABLE IF NOT EXISTS `tbl_product_date` (
  `Pk_int_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_date` date DEFAULT NULL,
  PRIMARY KEY (`Pk_int_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_stock`
--

CREATE TABLE IF NOT EXISTS `tbl_product_stock` (
  `Pk_int_product_stock` int(11) NOT NULL AUTO_INCREMENT,
  `Date_date` date DEFAULT NULL,
  PRIMARY KEY (`Pk_int_product_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE IF NOT EXISTS `tbl_registration` (
  `Pk_int_registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `Vchr_first_name` varchar(20) DEFAULT NULL,
  `Vchr_last_name` varchar(20) DEFAULT NULL,
  `Vchr_password` varchar(11) DEFAULT NULL,
  `Int_mobile_number` int(10) DEFAULT NULL,
  `Vchr_gender` varchar(11) DEFAULT NULL,
  `Vchr_age` int(3) DEFAULT NULL,
  `text_address` text,
  `int_status` int(11) DEFAULT NULL,
  `Vchr_power` varchar(5) DEFAULT NULL,
  `Fk_int_registration_date_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Pk_int_registration_id`),
  KEY `Fk_int_registration_date_id` (`Fk_int_registration_date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration_date`
--

CREATE TABLE IF NOT EXISTS `tbl_registration_date` (
  `Pk_int_registration_date_id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_date` date DEFAULT NULL,
  PRIMARY KEY (`Pk_int_registration_date_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`fk_int_product_id`) REFERENCES `tbl_product` (`Pk_int_product_id`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`Fk_int_product_id`) REFERENCES `tbl_product_date` (`Pk_int_product_id`),
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`Fk_int_product_stock`) REFERENCES `tbl_product_stock` (`Pk_int_product_stock`),
  ADD CONSTRAINT `tbl_product_ibfk_3` FOREIGN KEY (`Fk_int_categories_id`) REFERENCES `tbl_categories` (`Pk_int_categories_id`);

--
-- Constraints for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD CONSTRAINT `tbl_registration_ibfk_1` FOREIGN KEY (`Fk_int_registration_date_id`) REFERENCES `tbl_registration_date` (`Pk_int_registration_date_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

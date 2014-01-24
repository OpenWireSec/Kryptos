-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 24, 2014 at 12:54 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ctf`
--
CREATE DATABASE IF NOT EXISTS `ctf` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ctf`;

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE IF NOT EXISTS `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challengeName` varchar(100) DEFAULT NULL,
  `project` varchar(250) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `permissions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `permissions`) VALUES
(1, 'Standard', ''),
(2, 'Administrator', '{"admin":1,\r\n"edit":1}');

-- --------------------------------------------------------

--
-- Table structure for table `hostnotes`
--

CREATE TABLE IF NOT EXISTS `hostnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(15) DEFAULT NULL,
  `notes` text,
  `project` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hosts`
--

CREATE TABLE IF NOT EXISTS `hosts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(15) DEFAULT NULL,
  `port` int(10) DEFAULT NULL,
  `protocol` varchar(3) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `reason` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `version` varchar(50) DEFAULT NULL,
  `project` varchar(100) DEFAULT NULL,
  `startedby` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `nessus`
--

CREATE TABLE IF NOT EXISTS `nessus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `port` int(6) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `risk_factor` varchar(255) DEFAULT NULL,
  `severity` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `exploit_available` varchar(255) DEFAULT NULL,
  `cve` varchar(255) DEFAULT NULL,
  `bid` varchar(255) DEFAULT NULL,
  `xref` varchar(255) DEFAULT NULL,
  `host` varchar(20) DEFAULT NULL,
  `fqdn` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `netbios` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `portnotes`
--

CREATE TABLE IF NOT EXISTS `portnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(15) DEFAULT NULL,
  `notes` text,
  `project` varchar(255) DEFAULT NULL,
  `port` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `projectnotes`
--

CREATE TABLE IF NOT EXISTS `projectnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectname` varchar(100) DEFAULT NULL,
  `notes` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `screenshots`
--

CREATE TABLE IF NOT EXISTS `screenshots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(15) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `group` int(11) DEFAULT NULL,
  `isLoggedIn` int(1) NOT NULL DEFAULT '0',
  `idleTime` int(30) DEFAULT '0',
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `salt`, `group`, `isLoggedIn`, `idleTime`, `location`) VALUES
(53, 'root', '59e5aea3f253393c2c7a2a5767ca01a3be59758601953982e036c3a523a99209', 'TxWmn%c@r6%cQv#8aipRT2fcojA1E360', 1, 1, 1390336618, 'Dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `users_session`
--

CREATE TABLE IF NOT EXISTS `users_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `hash` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

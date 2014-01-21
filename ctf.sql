-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 21, 2014 at 08:29 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1616 ;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `host`, `port`, `protocol`, `state`, `reason`, `name`, `product`, `version`, `project`, `startedby`) VALUES
(1156, '10.194.0.1', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1157, '10.194.0.1', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1158, '10.194.0.1', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1159, '10.194.0.2', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1160, '10.194.0.2', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1161, '10.194.0.2', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1162, '10.194.0.2', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1163, '10.194.0.3', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '', 'CTF365', 'logic'),
(1164, '10.194.0.3', 80, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '', 'CTF365', 'logic'),
(1165, '10.194.0.3', 443, 'tcp', 'closed', 'reset', 'https', '', '', 'CTF365', 'logic'),
(1166, '10.194.0.3', 465, 'tcp', 'closed', 'reset', 'smtps', '', '', 'CTF365', 'logic'),
(1167, '10.194.0.3', 990, 'tcp', 'closed', 'reset', 'ftps', '', '', 'CTF365', 'logic'),
(1168, '10.194.0.3', 995, 'tcp', 'closed', 'reset', 'pop3s', '', '', 'CTF365', 'logic'),
(1169, '10.194.0.3', 8080, 'tcp', 'open', 'syn-ack', 'http', 'ZNC IRC bouncer http config', '0.097 or later', 'CTF365', 'logic'),
(1170, '10.194.0.4', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1171, '10.194.0.4', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1172, '10.194.0.4', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1173, '10.194.0.4', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1174, '10.194.0.5', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1175, '10.194.0.5', 80, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '', 'CTF365', 'logic'),
(1176, '10.194.0.5', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1177, '10.194.0.5', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1178, '10.194.0.5', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1179, '10.194.0.5', 8080, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1180, '10.194.0.7', 22, 'tcp', 'open', 'syn-ack', 'ssh', '', '', 'CTF365', 'logic'),
(1181, '10.194.0.7', 143, 'tcp', 'open', 'syn-ack', 'imap', '', '', 'CTF365', 'logic'),
(1182, '10.194.0.7', 443, 'tcp', 'closed', 'reset', 'https', '', '', 'CTF365', 'logic'),
(1183, '10.194.0.7', 8080, 'tcp', 'open', 'syn-ack', 'http-proxy', '', '', 'CTF365', 'logic'),
(1184, '10.194.0.8', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1185, '10.194.0.8', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1186, '10.194.0.8', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1187, '10.194.0.8', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1188, '10.194.0.8', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1189, '10.194.0.8', 3306, 'tcp', 'open', 'syn-ack', 'mysql', 'MySQL', '', 'CTF365', 'logic'),
(1190, '10.194.0.9', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1191, '10.194.0.9', 80, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '1.2.1', 'CTF365', 'logic'),
(1192, '10.194.0.9', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1193, '10.194.0.9', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1194, '10.194.0.9', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1195, '10.194.0.9', 8090, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1196, '10.194.0.10', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1197, '10.194.0.10', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1198, '10.194.0.10', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1199, '10.194.0.10', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1200, '10.194.0.11', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.3.5', 'CTF365', 'logic'),
(1201, '10.194.0.11', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1202, '10.194.0.11', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1203, '10.194.0.11', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1204, '10.194.0.12', 1, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1205, '10.194.0.12', 7, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1206, '10.194.0.12', 9, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1207, '10.194.0.12', 22, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1208, '10.194.0.12', 70, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1209, '10.194.0.12', 79, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1210, '10.194.0.12', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1211, '10.194.0.12', 109, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1212, '10.194.0.12', 110, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1213, '10.194.0.12', 111, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1214, '10.194.0.12', 119, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1215, '10.194.0.12', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1216, '10.194.0.12', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1217, '10.194.0.12', 143, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1218, '10.194.0.12', 443, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1219, '10.194.0.12', 512, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1220, '10.194.0.12', 513, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1221, '10.194.0.12', 514, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1222, '10.194.0.12', 515, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1223, '10.194.0.12', 1080, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1224, '10.194.0.12', 1524, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1225, '10.194.0.12', 2000, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1226, '10.194.0.12', 2001, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1227, '10.194.0.12', 4000, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1228, '10.194.0.12', 4001, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1229, '10.194.0.12', 6000, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1230, '10.194.0.12', 6001, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1231, '10.194.0.12', 6123, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.0.8 or later', 'CTF365', 'logic'),
(1232, '10.194.0.12', 6667, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1233, '10.194.0.12', 12345, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1234, '10.194.0.12', 31337, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1235, '10.194.0.12', 32771, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1236, '10.194.0.12', 32772, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1237, '10.194.0.12', 32773, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1238, '10.194.0.12', 32774, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1239, '10.194.0.13', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1240, '10.194.0.13', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1241, '10.194.0.14', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1242, '10.194.0.14', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1243, '10.194.0.14', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1244, '10.194.0.14', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1245, '10.194.0.14', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1246, '10.194.0.15', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1247, '10.194.0.15', 80, 'tcp', 'open', 'syn-ack', 'http', 'lighttpd', '1.4.31', 'CTF365', 'logic'),
(1248, '10.194.0.15', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1249, '10.194.0.15', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1250, '10.194.0.15', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1251, '10.194.0.16', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'Pure-FTPd', '', 'CTF365', 'logic'),
(1252, '10.194.0.16', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1253, '10.194.0.16', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1254, '10.194.0.16', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1255, '10.194.0.16', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1256, '10.194.0.16', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1257, '10.194.0.17', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1258, '10.194.0.17', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1259, '10.194.0.17', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1260, '10.194.0.17', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1261, '10.194.0.18', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1262, '10.194.0.18', 80, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '', 'CTF365', 'logic'),
(1263, '10.194.0.20', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'Pure-FTPd', '', 'CTF365', 'logic'),
(1264, '10.194.0.20', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1265, '10.194.0.20', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1266, '10.194.0.20', 53, 'tcp', 'open', 'syn-ack', 'domain', '', '', 'CTF365', 'logic'),
(1267, '10.194.0.20', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1268, '10.194.0.20', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Dovecot pop3d', '', 'CTF365', 'logic'),
(1269, '10.194.0.20', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1270, '10.194.0.20', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1271, '10.194.0.20', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1272, '10.194.0.20', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1273, '10.194.0.20', 443, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1274, '10.194.0.20', 993, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1275, '10.194.0.20', 995, 'tcp', 'open', 'syn-ack', 'pop3', 'Dovecot pop3d', '', 'CTF365', 'logic'),
(1276, '10.194.0.21', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'ProFTPD', '1.3.4a', 'CTF365', 'logic'),
(1277, '10.194.0.21', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1278, '10.194.0.21', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1279, '10.194.0.21', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1280, '10.194.0.21', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Courier pop3d', '', 'CTF365', 'logic'),
(1281, '10.194.0.21', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1282, '10.194.0.21', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1283, '10.194.0.21', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1284, '10.194.0.21', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Courier Imapd', '', 'CTF365', 'logic'),
(1285, '10.194.0.22', 20, 'tcp', 'closed', 'reset', 'ftp-data', '', '', 'CTF365', 'logic'),
(1286, '10.194.0.22', 21, 'tcp', 'closed', 'reset', 'ftp', '', '', 'CTF365', 'logic'),
(1287, '10.194.0.22', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1288, '10.194.0.22', 25, 'tcp', 'closed', 'reset', 'smtp', '', '', 'CTF365', 'logic'),
(1289, '10.194.0.22', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1290, '10.194.0.22', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1291, '10.194.0.23', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1292, '10.194.0.23', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1293, '10.194.0.23', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1294, '10.194.0.23', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1295, '10.194.0.24', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '', 'CTF365', 'logic'),
(1296, '10.194.0.24', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1297, '10.194.0.24', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1298, '10.194.0.24', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Courier pop3d', '', 'CTF365', 'logic'),
(1299, '10.194.0.24', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1300, '10.194.0.24', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1301, '10.194.0.24', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1302, '10.194.0.24', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Courier Imapd', '', 'CTF365', 'logic'),
(1303, '10.194.0.25', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1304, '10.194.0.25', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1305, '10.194.0.25', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1306, '10.194.0.25', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1307, '10.194.0.25', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1308, '10.194.0.26', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1309, '10.194.0.26', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1310, '10.194.0.26', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1311, '10.194.0.26', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1312, '10.194.0.26', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1313, '10.194.0.27', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1314, '10.194.0.27', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1315, '10.194.0.27', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1316, '10.194.0.28', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1317, '10.194.0.28', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1318, '10.194.0.28', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1319, '10.194.0.28', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1320, '10.194.0.29', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.0.8 or later', 'CTF365', 'logic'),
(1321, '10.194.0.29', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1322, '10.194.0.29', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1323, '10.194.0.29', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1324, '10.194.0.29', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1325, '10.194.0.29', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1326, '10.194.0.29', 8080, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1327, '10.194.0.31', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1328, '10.194.0.31', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1329, '10.194.0.31', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1330, '10.194.0.31', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Dovecot pop3d', '', 'CTF365', 'logic'),
(1331, '10.194.0.31', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1332, '10.194.0.31', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1333, '10.194.0.31', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1334, '10.194.0.31', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1335, '10.194.0.31', 443, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1336, '10.194.0.31', 993, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1337, '10.194.0.31', 995, 'tcp', 'open', 'syn-ack', 'pop3', 'Dovecot pop3d', '', 'CTF365', 'logic'),
(1338, '10.194.0.31', 3306, 'tcp', 'open', 'syn-ack', 'mysql', 'MySQL', '', 'CTF365', 'logic'),
(1339, '10.194.0.31', 8649, 'tcp', 'open', 'syn-ack', 'ganglia', 'Ganglia XML Grid monitor', '', 'CTF365', 'logic'),
(1340, '10.194.0.31', 8651, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1341, '10.194.0.31', 8652, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1342, '10.194.0.32', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1343, '10.194.0.32', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1344, '10.194.0.32', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1345, '10.194.0.32', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1346, '10.194.0.32', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1347, '10.194.0.33', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1348, '10.194.0.33', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1349, '10.194.0.33', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1350, '10.194.0.33', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1351, '10.194.0.34', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.0.8 or later', 'CTF365', 'logic'),
(1352, '10.194.0.34', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1353, '10.194.0.34', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1354, '10.194.0.34', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1355, '10.194.0.34', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1356, '10.194.0.34', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1357, '10.194.0.34', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1358, '10.194.0.36', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'ProFTPD', '1.3.4a', 'CTF365', 'logic'),
(1359, '10.194.0.36', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1360, '10.194.0.36', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1361, '10.194.0.36', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1362, '10.194.0.36', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1363, '10.194.0.36', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1364, '10.194.0.37', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1365, '10.194.0.37', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1366, '10.194.0.37', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1367, '10.194.0.37', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1368, '10.194.0.38', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1369, '10.194.0.38', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1370, '10.194.0.38', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1371, '10.194.0.38', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1372, '10.194.0.39', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1373, '10.194.0.39', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1374, '10.194.0.39', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1375, '10.194.0.39', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1376, '10.194.0.40', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1377, '10.194.0.40', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1378, '10.194.0.40', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1379, '10.194.0.40', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1380, '10.194.0.41', 20, 'tcp', 'closed', 'reset', 'ftp-data', '', '', 'CTF365', 'logic'),
(1381, '10.194.0.41', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.0.8 or later', 'CTF365', 'logic'),
(1382, '10.194.0.41', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1383, '10.194.0.41', 25, 'tcp', 'open', 'syn-ack', 'smtp', '', '', 'CTF365', 'logic'),
(1384, '10.194.0.41', 53, 'tcp', 'open', 'syn-ack', 'domain', '', '', 'CTF365', 'logic'),
(1385, '10.194.0.41', 80, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '1.4.4', 'CTF365', 'logic'),
(1386, '10.194.0.41', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Courier pop3d', '', 'CTF365', 'logic'),
(1387, '10.194.0.41', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Courier Imapd', '', 'CTF365', 'logic'),
(1388, '10.194.0.41', 443, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '1.4.4', 'CTF365', 'logic'),
(1389, '10.194.0.41', 666, 'tcp', 'closed', 'reset', 'doom', '', '', 'CTF365', 'logic'),
(1390, '10.194.0.41', 873, 'tcp', 'open', 'syn-ack', 'rsync', '', '', 'CTF365', 'logic'),
(1391, '10.194.0.41', 993, 'tcp', 'open', 'syn-ack', 'imap', 'Courier Imapd', '', 'CTF365', 'logic'),
(1392, '10.194.0.41', 995, 'tcp', 'open', 'syn-ack', 'pop3', 'Courier pop3d', '', 'CTF365', 'logic'),
(1393, '10.194.0.41', 3333, 'tcp', 'closed', 'reset', 'dec-notes', '', '', 'CTF365', 'logic'),
(1394, '10.194.0.41', 4444, 'tcp', 'closed', 'reset', 'krb524', '', '', 'CTF365', 'logic'),
(1395, '10.194.0.41', 6666, 'tcp', 'closed', 'reset', 'irc', '', '', 'CTF365', 'logic'),
(1396, '10.194.0.41', 7777, 'tcp', 'closed', 'reset', 'cbt', '', '', 'CTF365', 'logic'),
(1397, '10.194.0.41', 8080, 'tcp', 'closed', 'reset', 'http-proxy', '', '', 'CTF365', 'logic'),
(1398, '10.194.0.41', 8200, 'tcp', 'open', 'syn-ack', 'upnp', 'MiniDLNA', '1.0.24', 'CTF365', 'logic'),
(1399, '10.194.0.42', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1400, '10.194.0.42', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1401, '10.194.0.42', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1402, '10.194.0.42', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1403, '10.194.0.43', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '', 'CTF365', 'logic'),
(1404, '10.194.0.43', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1405, '10.194.0.43', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1406, '10.194.0.43', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1407, '10.194.0.43', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1408, '10.194.0.43', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1409, '10.194.0.44', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.0.8 or later', 'CTF365', 'logic'),
(1410, '10.194.0.44', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1411, '10.194.0.44', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1412, '10.194.0.44', 80, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '', 'CTF365', 'logic'),
(1413, '10.194.0.44', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1414, '10.194.0.44', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1415, '10.194.0.44', 5000, 'tcp', 'open', 'syn-ack', 'upnp', '', '', 'CTF365', 'logic'),
(1416, '10.194.0.45', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1417, '10.194.0.45', 80, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '1.2.1', 'CTF365', 'logic'),
(1418, '10.194.0.45', 443, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '1.2.1', 'CTF365', 'logic'),
(1419, '10.194.0.46', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.3.5', 'CTF365', 'logic'),
(1420, '10.194.0.46', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1421, '10.194.0.46', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1422, '10.194.0.46', 443, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1423, '10.194.0.47', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1424, '10.194.0.47', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1425, '10.194.0.47', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1426, '10.194.0.47', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1427, '10.194.0.48', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1428, '10.194.0.48', 53, 'tcp', 'open', 'syn-ack', 'domain', '', '', 'CTF365', 'logic'),
(1429, '10.194.0.48', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1430, '10.194.0.48', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1431, '10.194.0.48', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1432, '10.194.0.48', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1433, '10.194.0.49', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1434, '10.194.0.49', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1435, '10.194.0.49', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1436, '10.194.0.49', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1437, '10.194.0.50', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1438, '10.194.0.50', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1439, '10.194.0.50', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1440, '10.194.0.51', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1441, '10.194.0.51', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1442, '10.194.0.51', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1443, '10.194.0.51', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1444, '10.194.0.52', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1445, '10.194.0.52', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1446, '10.194.0.52', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1447, '10.194.0.52', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1448, '10.194.0.52', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1449, '10.194.0.52', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1450, '10.194.0.53', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1451, '10.194.0.53', 80, 'tcp', 'open', 'syn-ack', 'http', 'nginx', '1.2.1', 'CTF365', 'logic'),
(1452, '10.194.0.53', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1453, '10.194.0.53', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1454, '10.194.0.53', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1455, '10.194.0.53', 8080, 'tcp', 'open', 'syn-ack', 'http', 'Jetty', '6.1.22', 'CTF365', 'logic'),
(1456, '10.194.0.53', 8099, 'tcp', 'open', 'syn-ack', 'unknown', '', '', 'CTF365', 'logic'),
(1457, '10.194.0.54', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1458, '10.194.0.54', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1459, '10.194.0.54', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1460, '10.194.0.54', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1461, '10.194.0.54', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1462, '10.194.0.55', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1463, '10.194.0.55', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1464, '10.194.0.55', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1465, '10.194.0.55', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1466, '10.194.0.56', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'Pure-FTPd', '', 'CTF365', 'logic'),
(1467, '10.194.0.56', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1468, '10.194.0.56', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1469, '10.194.0.56', 53, 'tcp', 'open', 'syn-ack', 'domain', 'ISC BIND', 'Lulz', 'CTF365', 'logic'),
(1470, '10.194.0.56', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1471, '10.194.0.56', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Dovecot pop3d', '', 'CTF365', 'logic'),
(1472, '10.194.0.56', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1473, '10.194.0.56', 443, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1474, '10.194.0.56', 465, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1475, '10.194.0.56', 587, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1476, '10.194.0.56', 993, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1477, '10.194.0.56', 995, 'tcp', 'open', 'syn-ack', 'pop3', 'Dovecot pop3d', '', 'CTF365', 'logic'),
(1478, '10.194.0.56', 3306, 'tcp', 'open', 'syn-ack', 'mysql', 'MySQL', '', 'CTF365', 'logic'),
(1479, '10.194.0.56', 8080, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1480, '10.194.0.57', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.3.5', 'CTF365', 'logic'),
(1481, '10.194.0.57', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1482, '10.194.0.57', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1483, '10.194.0.57', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1484, '10.194.0.57', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1485, '10.194.0.57', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1486, '10.194.0.57', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1487, '10.194.0.59', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1488, '10.194.0.59', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1489, '10.194.0.59', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1490, '10.194.0.59', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1491, '10.194.0.60', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1492, '10.194.0.60', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1493, '10.194.0.60', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1494, '10.194.0.60', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1495, '10.194.0.60', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1496, '10.194.0.61', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1497, '10.194.0.61', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1498, '10.194.0.61', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1499, '10.194.0.61', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1500, '10.194.0.62', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1501, '10.194.0.62', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1502, '10.194.0.62', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1503, '10.194.0.62', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1504, '10.194.0.63', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1505, '10.194.0.63', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1506, '10.194.0.63', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1507, '10.194.0.63', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1508, '10.194.0.64', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1509, '10.194.0.64', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1510, '10.194.0.64', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1511, '10.194.0.64', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1512, '10.194.0.65', 1, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1513, '10.194.0.65', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1514, '10.194.0.65', 79, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1515, '10.194.0.65', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1516, '10.194.0.65', 119, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1517, '10.194.0.65', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1518, '10.194.0.65', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1519, '10.194.0.65', 143, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1520, '10.194.0.65', 211, 'tcp', 'open', 'syn-ack', 'ftp', 'ProFTPD', '', 'CTF365', 'logic'),
(1521, '10.194.0.65', 1080, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1522, '10.194.0.65', 1524, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1523, '10.194.0.65', 2000, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1524, '10.194.0.65', 3306, 'tcp', 'open', 'syn-ack', 'mysql', 'MySQL', '', 'CTF365', 'logic'),
(1525, '10.194.0.65', 5432, 'tcp', 'open', 'syn-ack', 'postgresql', 'PostgreSQL DB', '9.1.5 - 9.1.9', 'CTF365', 'logic'),
(1526, '10.194.0.65', 6667, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1527, '10.194.0.65', 8080, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1528, '10.194.0.65', 12345, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1529, '10.194.0.65', 31337, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1530, '10.194.0.65', 32771, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1531, '10.194.0.65', 32772, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1532, '10.194.0.65', 32773, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1533, '10.194.0.65', 32774, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1534, '10.194.0.66', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'OpenBSD ftpd', '6.4', 'CTF365', 'logic'),
(1535, '10.194.0.66', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1536, '10.194.0.66', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1537, '10.194.0.66', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1538, '10.194.0.66', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1539, '10.194.0.66', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1540, '10.194.0.66', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1541, '10.194.0.66', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1542, '10.194.0.66', 993, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1543, '10.194.0.66', 2049, 'tcp', 'open', 'syn-ack', 'nfs', '', '2-4', 'CTF365', 'logic'),
(1544, '10.194.0.66', 8000, 'tcp', 'open', 'syn-ack', 'http', 'WSGIServer', '0.1', 'CTF365', 'logic'),
(1545, '10.194.0.67', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1546, '10.194.0.67', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1547, '10.194.0.67', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1548, '10.194.0.67', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1549, '10.194.0.67', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1550, '10.194.0.67', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1551, '10.194.0.67', 587, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1552, '10.194.0.69', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1553, '10.194.0.69', 80, 'tcp', 'open', 'syn-ack', 'http', '', '', 'CTF365', 'logic'),
(1554, '10.194.0.69', 443, 'tcp', 'closed', 'reset', 'https', '', '', 'CTF365', 'logic'),
(1555, '10.194.0.70', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.0.8 or later', 'CTF365', 'logic'),
(1556, '10.194.0.70', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1557, '10.194.0.70', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1558, '10.194.0.70', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1559, '10.194.0.70', 143, 'tcp', 'open', 'syn-ack', 'tcpwrapped', '', '', 'CTF365', 'logic'),
(1560, '10.194.0.70', 443, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1561, '10.194.0.70', 993, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1562, '10.194.0.71', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1563, '10.194.0.71', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1564, '10.194.0.71', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Openwall popa3d', '', 'CTF365', 'logic'),
(1565, '10.194.0.71', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1566, '10.194.0.71', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1567, '10.194.0.71', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1568, '10.194.0.74', 20, 'tcp', 'closed', 'reset', 'ftp-data', '', '', 'CTF365', 'logic'),
(1569, '10.194.0.74', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'ProFTPD', '1.3.4a', 'CTF365', 'logic'),
(1570, '10.194.0.74', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1571, '10.194.0.74', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1572, '10.194.0.74', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Courier pop3d', '', 'CTF365', 'logic'),
(1573, '10.194.0.74', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Courier Imapd', '', 'CTF365', 'logic'),
(1574, '10.194.0.74', 443, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1575, '10.194.0.74', 993, 'tcp', 'open', 'syn-ack', 'imap', 'Courier Imapd', '', 'CTF365', 'logic'),
(1576, '10.194.0.74', 995, 'tcp', 'open', 'syn-ack', 'pop3', 'Courier pop3d', '', 'CTF365', 'logic'),
(1577, '10.194.0.75', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1578, '10.194.0.75', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1579, '10.194.0.75', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1580, '10.194.0.75', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1581, '10.194.0.77', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1582, '10.194.0.77', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1583, '10.194.0.77', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1584, '10.194.0.77', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1585, '10.194.0.78', 20, 'tcp', 'closed', 'reset', 'ftp-data', '', '', 'CTF365', 'logic'),
(1586, '10.194.0.78', 21, 'tcp', 'open', 'syn-ack', 'ftp', 'vsftpd', '2.3.5', 'CTF365', 'logic'),
(1587, '10.194.0.78', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1588, '10.194.0.78', 25, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1589, '10.194.0.78', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1590, '10.194.0.78', 110, 'tcp', 'open', 'syn-ack', 'pop3', 'Dovecot pop3d', '', 'CTF365', 'logic'),
(1591, '10.194.0.78', 143, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1592, '10.194.0.78', 443, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '', 'CTF365', 'logic'),
(1593, '10.194.0.78', 587, 'tcp', 'open', 'syn-ack', 'smtp', 'Postfix smtpd', '', 'CTF365', 'logic'),
(1594, '10.194.0.78', 993, 'tcp', 'open', 'syn-ack', 'imap', 'Dovecot imapd', '', 'CTF365', 'logic'),
(1595, '10.194.0.78', 995, 'tcp', 'open', 'syn-ack', 'pop3', 'Dovecot pop3d', '', 'CTF365', 'logic'),
(1596, '10.194.0.80', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1597, '10.194.0.80', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1598, '10.194.0.80', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1599, '10.194.0.80', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1600, '10.194.0.81', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1601, '10.194.0.81', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1602, '10.194.0.81', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1603, '10.194.0.81', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1604, '10.194.0.82', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1605, '10.194.0.82', 80, 'tcp', 'open', 'syn-ack', 'http', 'Apache httpd', '2.2.22', 'CTF365', 'logic'),
(1606, '10.194.0.82', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1607, '10.194.0.82', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1608, '10.194.0.82', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1609, '10.194.0.84', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1610, '10.194.0.84', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1611, '10.194.0.84', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic'),
(1612, '10.194.0.85', 22, 'tcp', 'open', 'syn-ack', 'ssh', 'OpenSSH', '6.0p1 Debian 4', 'CTF365', 'logic'),
(1613, '10.194.0.85', 111, 'tcp', 'open', 'syn-ack', 'rpcbind', '', '2-4', 'CTF365', 'logic'),
(1614, '10.194.0.85', 135, 'tcp', 'filtered', 'no-response', 'msrpc', '', '', 'CTF365', 'logic'),
(1615, '10.194.0.85', 139, 'tcp', 'filtered', 'no-response', 'netbios-ssn', '', '', 'CTF365', 'logic');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `screenshots`
--

INSERT INTO `screenshots` (`id`, `host`, `project`, `url`) VALUES
(10, '10.194.0.1', 'CTF365', '0k_melodyx_logo_by_inttact-d4ou0a0.png'),
(11, '10.194.0.1', 'CTF365', '0k_melodyx_logo_by_inttact-d4ou0a0.png'),
(12, '10.194.0.1', 'CTF365', '0New Image.JPG');

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
(1, 'root', '59e5aea3f253393c2c7a2a5767ca01a3be59758601953982e036c3a523a99209', 'TxWmn%c@r6%cQv#8aipRT2fcojA1E360', 1, 1, 1390336128, 'Dashboard');

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

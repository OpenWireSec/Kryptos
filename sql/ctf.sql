-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 27, 2014 at 02:41 AM
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
-- Table structure for table `challengenotes`
--

CREATE TABLE IF NOT EXISTS `challengenotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(255) DEFAULT NULL,
  `notes` text,
  `project` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE IF NOT EXISTS `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challengeName` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `type` text,
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
  `service` varchar(255) DEFAULT NULL,
  `risk_factor` varchar(255) DEFAULT NULL,
  `severity` varchar(255) DEFAULT NULL,
  `synopsis` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `cve` varchar(255) DEFAULT NULL,
  `bid` varchar(255) DEFAULT NULL,
  `xref` varchar(255) DEFAULT NULL,
  `fqdn` varchar(255) DEFAULT NULL,
  `netbios` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `scannedFrom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62565 ;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `host`, `port`, `protocol`, `state`, `reason`, `name`, `product`, `version`, `project`, `startedby`, `service`, `risk_factor`, `severity`, `synopsis`, `description`, `family`, `cve`, `bid`, `xref`, `fqdn`, `netbios`, `os`, `scannedFrom`) VALUES
(10107, '10.10.170.233', 63342, 'tcp', NULL, NULL, 'HTTP Server Type and Version', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'A web server is running on the remote host.', 'This plugin attempts to determine the type and the version of the remote web server.', 'Web Servers', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(10150, '10.10.170.233', 137, 'udp', NULL, NULL, 'Windows NetBIOS / SMB Remote Host Information Disclosure', NULL, NULL, 'CTF365', 'root', 'netbios-ns', 'None', '0', 'It is possible to obtain the network name of the remote host.', 'The remote host listens on UDP port 137 or TCP port 445 and replies to NetBIOS nbtscan or SMB requests. \n\nNote that this plugin gathers information to be used in other plugins but does not itself generate a report.', 'Windows', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(10287, '10.10.170.233', 0, 'udp', NULL, NULL, 'Traceroute Information', NULL, NULL, 'CTF365', 'root', 'general', 'None', '0', 'It was possible to obtain traceroute information.', 'Makes a traceroute to the remote host.', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(10736, '10.10.170.233', 49152, 'tcp', NULL, NULL, 'DCE Services Enumeration', NULL, NULL, 'CTF365', 'root', 'dce-rpc', 'None', '0', 'A DCE/RPC service is running on the remote host.', 'By sending a Lookup request to the portmapper (TCP 135 or epmapper PIPE) it was possible to enumerate the Distributed Computing Environment (DCE) services running on the remote port.\nUsing this information it is possible to connect and bind to each servic', 'Windows', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(10785, '10.10.170.233', 445, 'tcp', NULL, NULL, 'Microsoft Windows SMB NativeLanManager Remote System Information Disclosure', NULL, NULL, 'CTF365', 'root', 'cifs', 'None', '0', 'It is possible to obtain information about the remote operating system.', 'It is possible to get the remote operating system name and version (Windows and/or Samba) by sending an authentication request to port 139 or 445.', 'Windows', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(10863, '10.10.170.233', 443, 'tcp', NULL, NULL, 'SSL Certificate Information', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'This plugin displays the SSL certificate.', 'This plugin connects to every SSL-related port and attempts to extract and dump the X.509 certificate.', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(10919, '10.10.170.233', 0, 'tcp', NULL, NULL, 'Open Port Re-check', NULL, NULL, 'CTF365', 'root', 'general', 'None', '0', 'Previously open ports are now closed.', 'One of several ports that were previously open are now closed or unresponsive. \n\nThere are numerous possible causes for this failure :\n- The scan may have caused a service to freeze or stop running. \n- An administrator may have stopped a particular servic', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(11011, '10.10.170.233', 139, 'tcp', NULL, NULL, 'Microsoft Windows SMB Service Detection', NULL, NULL, 'CTF365', 'root', 'smb', 'None', '0', 'A file / print sharing service is listening on the remote host.', 'The remote service understands the CIFS (Common Internet File System) or Server Message Block (SMB) protocol, used to provide shared access to files, printers, etc between nodes on a network.', 'Windows', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(11032, '10.10.170.233', 443, 'tcp', NULL, NULL, 'Web Server Directory Enumeration', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'It is possible to enumerate directories on the web server.', 'This plugin attempts to determine the presence of various common directories on the remote web server.  By sending a request for a directory, the web server response code indicates if it is a valid directory or not.', 'Web Servers', NULL, NULL, 'OWASP:OWASP-CM-006', 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(11219, '10.10.170.233', 49153, 'tcp', NULL, NULL, 'Nessus SYN scanner', NULL, NULL, 'CTF365', 'root', 'dce-rpc', 'None', '0', 'It is possible to determine which TCP ports are open.', 'This plugin is a SYN ''half-open'' port scanner.\nIt shall be reasonably quick even against a firewalled target.\n\nNote that SYN scanners are less intrusive than TCP (full connect) scanners against broken services, but they might kill lame misconfigured firew', 'Port scanners', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(11936, '10.10.170.233', 0, 'tcp', NULL, NULL, 'OS Identification', NULL, NULL, 'CTF365', 'root', 'general', 'None', '0', 'It is possible to guess the remote operating system.', 'Using a combination of remote probes (TCP/IP, SMB, HTTP, NTP, SNMP, etc...), it is possible to guess the name of the remote operating system in use. It is also sometimes possible to guess the version of the operating system.', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(12053, '10.10.170.233', 0, 'tcp', NULL, NULL, 'Host Fully Qualified Domain Name (FQDN) Resolution', NULL, NULL, 'CTF365', 'root', 'general', 'None', '0', 'It was possible to resolve the name of the remote host.', 'Nessus was able to resolve the FQDN of the remote host.', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(19506, '10.10.170.233', 0, 'tcp', NULL, NULL, 'Nessus Scan Information', NULL, NULL, 'CTF365', 'root', 'general', 'None', '0', 'Information about the Nessus scan.', 'This script displays, for each tested host, information about the scan itself :\n\n - The version of the plugin set\n - The type of plugin feed (HomeFeed or ProfessionalFeed)\n - The version of the Nessus Engine\n - The port scanner(s) used\n - The port range s', 'Settings', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(20301, '10.10.170.233', 912, 'tcp', NULL, NULL, 'VMware ESX/GSX Server detection', NULL, NULL, 'CTF365', 'root', 'vmware_auth', 'None', '0', 'The remote host appears to be running VMware Server, ESX Server, or GSX Server.', 'According to its banner, the remote host appears to be running a VMware server authentication daemon, which likely indicates the remote host is running VMware Server, ESX Server, or GSX Server.', 'Service detection', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(21643, '10.10.170.233', 443, 'tcp', NULL, NULL, 'SSL Cipher Suites Supported', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'The remote service encrypts communications using SSL.', 'This script detects which SSL ciphers are supported by the remote service for encrypting communications.', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(22964, '10.10.170.233', 63342, 'tcp', NULL, NULL, 'Service Detection', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'The remote service could be identified.', 'It was possible to identify the remote service by its banner or by looking at the error message it sends when it receives an HTTP request.', 'Service detection', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(35716, '10.10.170.233', 0, 'tcp', NULL, NULL, 'Ethernet Card Manufacturer Detection', NULL, NULL, 'CTF365', 'root', 'general', 'None', '0', 'The manufacturer can be deduced from the Ethernet OUI.', 'Each ethernet MAC address starts with a 24-bit ''Organizationally Unique Identifier''.\nThese OUI are registered by IEEE.', 'Misc.', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(45410, '10.10.170.233', 443, 'tcp', NULL, NULL, 'SSL Certificate commonName Mismatch', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'The SSL certificate commonName does not match the host name.', 'This service presents an SSL certificate for which the ''commonName'' (CN) does not match the host name on which the service listens.', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(45590, '10.10.170.233', 0, 'tcp', NULL, NULL, 'Common Platform Enumeration (CPE)', NULL, NULL, 'CTF365', 'root', 'general', 'None', '0', 'It is possible to enumerate CPE names that matched on the remote system.', 'By using information obtained from a Nessus scan, this plugin reports CPE (Common Platform Enumeration) matches for various hardware and software products found on a host. \n\nNote that if an official CPE is not available for the product, this plugin comput', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(50845, '10.10.170.233', 443, 'tcp', NULL, NULL, 'OpenSSL Detection', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'The remote service appears to use OpenSSL to encrypt traffic.', 'Based on its behavior, it seems that the remote service is using the OpenSSL library to encrypt traffic. \n\nNote that this plugin can only detect OpenSSL implementations that have enabled support for TLS extensions (RFC 4366).', 'Service detection', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(51192, '10.10.170.233', 443, 'tcp', NULL, NULL, 'SSL Certificate Cannot Be Trusted', NULL, NULL, 'CTF365', 'root', 'www', 'Medium', '2', 'The SSL certificate for this service cannot be trusted.', 'The server''s X.509 certificate does not have a signature from a known public certificate authority.  This situation can occur in three different ways, each of which results in a break in the chain below which certificates cannot be trusted. \n\nFirst, the t', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(53491, '10.10.170.233', 443, 'tcp', NULL, NULL, 'SSL / TLS Renegotiation DoS', NULL, NULL, 'CTF365', 'root', 'www', 'Medium', '2', 'The remote service allows repeated renegotiation of TLS / SSL connections.', 'The remote service encrypts traffic using TLS / SSL and permits clients to renegotiate connections.  The computational requirements for renegotiating a connection are asymmetrical between the client and the server, with the server performing several times', 'General', 'CVE-2011-1473', '48626', 'OSVDB:73894', 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(54615, '10.10.170.233', 0, 'tcp', NULL, NULL, 'Device Type', NULL, NULL, 'CTF365', 'root', 'general', 'None', '0', 'It is possible to guess the remote device type.', 'Based on the remote operating system, it is possible to determine what the remote system type is (eg: a printer, router, general-purpose computer, etc).', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(56984, '10.10.170.233', 443, 'tcp', NULL, NULL, 'SSL / TLS Versions Supported', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'The remote service encrypts communications.', 'This script detects which SSL and TLS versions are supported by the remote service for encrypting communications.', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(57582, '10.10.170.233', 443, 'tcp', NULL, NULL, 'SSL Self-Signed Certificate', NULL, NULL, 'CTF365', 'root', 'www', 'Medium', '2', 'The SSL certificate chain for this service ends in an unrecognized self-signed certificate.', 'The X.509 certificate chain for this service is not signed by a recognized certificate authority.  If the remote host is a public host in production, this nullifies the use of SSL as anyone could establish a man-in-the-middle attack against the remote hos', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(57608, '10.10.170.233', 445, 'tcp', NULL, NULL, 'SMB Signing Disabled', NULL, NULL, 'CTF365', 'root', 'cifs', 'Medium', '2', 'Signing is disabled on the remote SMB server.', 'Signing is disabled on the remote SMB server.  This can allow man-in-the-middle attacks against the SMB server.', 'Misc.', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(62563, '10.10.170.233', 443, 'tcp', NULL, NULL, 'SSL Compression Methods Supported', NULL, NULL, 'CTF365', 'root', 'www', 'None', '0', 'The remote service supports one or more compression methods for SSL connections.', 'This script detects which compression methods are supported by the remote service for SSL connections.', 'General', NULL, NULL, NULL, 'logic.open.shmooconlabs.net', 'LOGIC', 'CISCO PIX 7.0', 'Nessus'),
(62564, '192.168.1.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CTF365', 'root', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `challenge` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE IF NOT EXISTS `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `source` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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
(53, 'root', '59e5aea3f253393c2c7a2a5767ca01a3be59758601953982e036c3a523a99209', 'TxWmn%c@r6%cQv#8aipRT2fcojA1E360', 1, 1, 1390790424, 'Challenge Information');

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

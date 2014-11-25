-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 25, 2014 at 02:17 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `progex`
--

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE IF NOT EXISTS `email_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `SMTPurl` varchar(200) NOT NULL,
  `IMAPurl` varchar(200) NOT NULL,
  `SMTPport` int(50) NOT NULL,
  `IMAPport` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`id`, `name`, `SMTPurl`, `IMAPurl`, `SMTPport`, `IMAPport`) VALUES
(1, 'google', 'smtp.gmail.com', 'imap.gmail.com', 465, 993),
(2, 'yahoo', 'smtp.mail.yahoo.com', 'imap.mail.yahoo.com', 465, 993);

-- --------------------------------------------------------

--
-- Table structure for table `exercises`
--

CREATE TABLE IF NOT EXISTS `exercises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exCode` varchar(30) NOT NULL,
  `path` varchar(200) NOT NULL,
  `category` varchar(50) NOT NULL,
  `timeUploaded` varchar(20) NOT NULL,
  `assignee` varchar(20) NOT NULL,
  `timeCompleted` varchar(20) NOT NULL,
  `solutionPath` varchar(50) NOT NULL,
  `format` text NOT NULL,
  `size` varchar(200) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `assigned` tinyint(1) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exCode` (`exCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `exCode`, `path`, `category`, `timeUploaded`, `assignee`, `timeCompleted`, `solutionPath`, `format`, `size`, `completed`, `assigned`, `paid`) VALUES
(7, 'UVJXODSTNF5316e05889e1e', 'exercises/bootstrap.css', '', '1394008152', 'WENJ3G1AED', '1395317212', '../exercises_solutions/UVJXODSTNF5316e05889e1e/', 'text/css', '28538', 1, 1, 0),
(8, '82VY9NXWLC531efc8273330', 'exercises/bootstrap.css', '', '1394539650', 'WENJ3G1AED', '1395317418', '../exercises_solutions/82VY9NXWLC531efc8273330/', 'text/css', '28538', 1, 1, 0),
(9, 'NHVDGRJ46L53258d0c50820', 'exercises/uhurugoogle.png', '', '1394969868', 'WENJ3G1AED', '1395317568', '../exercises_solutions/NHVDGRJ46L53258d0c50820/', 'image/png', '183076', 1, 1, 0),
(10, '6U3BZ5RYJ95328739b48f6b', 'exercises/ad_2.jpeg', '', '1395159963', 'WENJ3G1AED', '1395318585', '../exercises_solutions/6U3BZ5RYJ95328739b48f6b/', 'image/jpeg', '19775', 1, 1, 0),
(11, '602TJ6WL5853287a63924f9', 'exercises/ad_2.jpeg', '', '1395161699', 'WENJ3G1AED', '1395318651', '../exercises_solutions/602TJ6WL5853287a63924f9/', 'image/jpeg', '2824256', 1, 1, 0),
(12, 'CPO8F4GF6A53287a7abc830', 'exercises/digital-marketing-la', '', '1395161722', 'WENJ3G1AED', '1395319098', '../exercises_solutions/CPO8F4GF6A53287a7abc830/', 'image/jpeg', '2824256', 1, 1, 0),
(13, 'T2NVGIMMH253287afe167b3', 'exercises/digital-marketing-la', '', '1395161854', 'WENJ3G1AED', '1397581782', '../exercises_solutions/T2NVGIMMH253287afe167b3/', 'image/jpeg', '2824256', 1, 1, 0),
(14, 'A7ZF7AH85P5342bdba95aae', 'exercises/THINKING AXES.docx', '', '1396882874', 'WENJ3G1AED', '1398846002', '../exercises_solutions/A7ZF7AH85P5342bdba95aae/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '12029', 1, 1, 0),
(15, 'WEG86I4KHI534d6799b74ad', 'exercises/Patikana_Transactions_List.pdf', '', '1397581721', 'WENJ3G1AED', '1416662383', '../exercises_solutions/WEG86I4KHI534d6799b74ad/', 'application/pdf', '1972', 1, 1, 0),
(17, 'Z1T2JIN5WM53725255a3aac', 'exercises/MITINDO.docx', '', '1400001109', 'WENJ3G1AED', '1416664221', '../exercises_solutions/Z1T2JIN5WM53725255a3aac/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '80555', 1, 1, 0),
(18, 'DSQAMSU10R542f96e6b6016', 'exercises/wp226.pdf', '', '1412404966', 'WENJ3G1AED', '', '', 'application/pdf', '752896', 0, 1, 0),
(19, '0GP0AX47WD5453968fa721c', 'exercises/digital-marketing-landscape-infographic_52dff3d97b635.jpg', '', '1414764175', 'WENJ3G1AED', '1416662702', '../exercises_solutions/0GP0AX47WD5453968fa721c/', 'image/jpeg', '2824256', 1, 1, 0),
(20, '4BG6VO0XFY545525a80bfb5', 'exercises/ENTEL_LIMITED_CLASSES.vpp', '', '1414866344', 'WENJ3G1AED', '', '', 'application/octet-stream', '287744', 0, 1, 0),
(21, 'YV1E1XXOZA546d57d62d03e', 'exercises/archbishop-desmond-tutu-talked-abou-sri-lanka.jpg', '', '1416452054', 'WENJ3G1AED', '', '', 'image/jpeg', '15322', 0, 1, 0),
(22, '0E9C9DW587547024427dcaf', 'exercises/Home Page.png', '', '1416635458', 'WENJ3G1AED', '1416640014', '../exercises_solutions/0E9C9DW587547024427dcaf/', 'image/png', '55819', 1, 1, 0),
(23, 'O5RKFS3DMX5470439598a0b', 'exercises/README', '', '1416643477', 'WENJ3G1AED', '1416662358', '../exercises_solutions/O5RKFS3DMX5470439598a0b/', 'application/octet-stream', '0', 1, 1, 0),
(24, 'X9CSJWR8GN5470440fd2371', 'exercises/uploadproject.php', '', '1416643599', 'WENJ3G1AED', '', '', 'application/octet-stream', '8158', 0, 1, 0),
(25, '4FBCCBIMXF547045d078496', 'exercises/main.css', '', '1416644048', 'WENJ3G1AED', '', '', 'text/css', '1685', 0, 1, 0),
(26, 'NSPE67NRE15470461c861b7', 'exercises/main.css', '', '1416644124', 'WENJ3G1AED', '1416651315', '../exercises_solutions/NSPE67NRE15470461c861b7/', 'text/css', '1685', 1, 1, 0),
(27, 'YUQKY9U4NT54704643db029', 'exercises/jquery1.9.js', '', '1416644163', 'WENJ3G1AED', '1416662643', '../exercises_solutions/YUQKY9U4NT54704643db029/', 'application/javascript', '268381', 1, 1, 0),
(28, 'MCTKLH7YIH547048386e7a5', 'exercises/pure.css', 'Engineering', '1416644664', 'WENJ3G1AED', '', '', 'text/css', '698', 0, 1, 0),
(29, 'GQY1JJH1K554705c4020761', 'exercises/modernizr.js', 'Technology', '1416649792', 'WENJ3G1AED', '', '', 'application/javascript', '18728', 0, 1, 0),
(30, '3Y0IF1ALZC54708d074ae0f', 'exercises/jquery1.9.js', 'Technology', '1416662279', 'WENJ3G1AED', '', '', 'application/javascript', '268381', 0, 1, 0),
(31, 'T5A0SD78YS5470942c93cb5', 'exercises/pure.css', 'Business', '1416664108', '', '', '', 'text/css', '698', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `programmers`
--

CREATE TABLE IF NOT EXISTS `programmers` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `exCode` varchar(100) NOT NULL,
  `firstName` varchar(150) NOT NULL,
  `secondName` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `location` varchar(100) NOT NULL,
  `phonenumber` varchar(50) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeStamp` int(50) NOT NULL,
  `languages` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `programmers`
--

INSERT INTO `programmers` (`id`, `exCode`, `firstName`, `secondName`, `email`, `username`, `password`, `location`, `phonenumber`, `dateCreated`, `timeStamp`, `languages`, `active`) VALUES
(6, 'WENJ3G1AED', 'Ian', 'Kanyari Mukunya', 'carolcjholic@gmail.com', 'ianmukunya', 'carolwanja', 'Kerugoya', '0720121341', '2014-03-16 11:25:17', 1394969117, 'PHP,JAVASCRIPT,JQUERY,CSS', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exCode` varchar(30) NOT NULL,
  `firstName` varchar(200) NOT NULL,
  `otherNames` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `acss` varchar(100) NOT NULL,
  `location` varchar(60) NOT NULL,
  `phonenumber` varchar(10) NOT NULL,
  `userType` int(10) NOT NULL,
  `createdStamp` varchar(30) NOT NULL,
  `dateCreatedStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exCode` (`exCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `exCode`, `firstName`, `otherNames`, `email`, `acss`, `location`, `phonenumber`, `userType`, `createdStamp`, `dateCreatedStamp`) VALUES
(7, 'UVJXODSTNF5316e05889e1e', '', '', 'user@user.com', 'ee11cbb19052e40b07aac0ca060c23ee', 'South C', '0711824120', 5, '1394008152', '2014-03-05 08:29:12'),
(8, '82VY9NXWLC531efc8273330', '', '', 'nelson@gmail.com', 'a4e360681676c770121e891f8c407572', 'Juja', '3998230', 5, '1394539650', '2014-03-11 12:07:30'),
(9, 'NHVDGRJ46L53258d0c50820', '', '', 'new@user.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'School', '123456789', 5, '1394969868', '2014-03-16 11:37:48'),
(10, '6U3BZ5RYJ95328739b48f6b', '', '', 'two@two.com', '5dac1b5914537a1bcd5ac55b181e8512', 'Jujaa', '98763718', 5, '1395159963', '2014-03-18 16:26:03'),
(11, '602TJ6WL5853287a63924f9', '', '', 'three@three.com', '35d6d33467aae9a2e3dccb4b6b027878', 'Jujaa', '98763718', 5, '1395161699', '2014-03-18 16:54:59'),
(12, 'CPO8F4GF6A53287a7abc830', '', '', 'four@four.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Jujaa', '98763718', 5, '1395161722', '2014-03-18 16:55:22'),
(13, 'T2NVGIMMH253287afe167b3', '', '', 'five@five.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Jujaa', '98763718', 5, '1395161854', '2014-03-18 16:57:34'),
(14, 'A7ZF7AH85P5342bdba95aae', '', '', 'junkiestuff21@gmail.', 'd3c50ee5a00925b825101eea6fa23333', 'South C', '0937812', 5, '1396882874', '2014-04-07 15:01:14'),
(15, 'WEG86I4KHI534d6799b74ad', '', '', 'Monderiee@gmail.com', '3fc0a7acf087f549ac2b266baf94b8b1', 'Jujaa', '0923123', 5, '1397581721', '2014-04-15 17:08:41'),
(17, 'Z1T2JIN5WM53725255a3aac', '', '', 'ianmukunya@gmail.com', 'd3c50ee5a00925b825101eea6fa23333', 'South C', '0720121341', 5, '1400001109', '2014-05-13 17:11:49'),
(18, 'DSQAMSU10R542f96e6b6016', '', '', 'iankanyari@yahoo.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Juja', '0720121341', 5, '1412404966', '2014-10-04 06:42:47'),
(19, '0GP0AX47WD5453968fa721c', '', '', 'monderiee@gmail.com', '541909a4c151ca514c3c4b87c8af4466', 'Kenya', '2547029662', 5, '1414764175', '2014-10-31 14:02:55'),
(20, '4BG6VO0XFY545525a80bfb5', '', '', 'monderiee@gmail.com', '289830366c08e44ba096678d8f3b8598', 'Kenya', '2547029662', 5, '1414866344', '2014-11-01 18:25:44'),
(21, 'YV1E1XXOZA546d57d62d03e', '', '', 'email@domain.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Location', '12345678', 5, '1416452054', '2014-11-20 02:54:14'),
(22, '0E9C9DW587547024427dcaf', '', '', 'writers@paper.com', '5dac1b5914537a1bcd5ac55b181e8512', 'South C', '123456789', 5, '1416635458', '2014-11-22 05:50:58'),
(23, 'O5RKFS3DMX5470439598a0b', '', '', 'email@domain.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Juja', '123456789', 5, '1416643477', '2014-11-22 08:04:37'),
(24, 'X9CSJWR8GN5470440fd2371', '', '', 'email@domain.com', '319f4d26e3c536b5dd871bb2c52e3178', 'mWEA', '1234566778', 5, '1416643599', '2014-11-22 08:06:39'),
(25, '4FBCCBIMXF547045d078496', '', '', 'mail@send.com', '5dac1b5914537a1bcd5ac55b181e8512', 'Juaba', '123456789', 5, '1416644048', '2014-11-22 08:14:08'),
(26, 'NSPE67NRE15470461c861b7', '', '', 'mail@send.com', '1a1dc91c907325c69271ddf0c944bc72', 'Juaba', '123456789', 5, '1416644124', '2014-11-22 08:15:24'),
(27, 'YUQKY9U4NT54704643db029', '', '', 'moses@nderi.com', '52bd43d37ed62eb4c226e31841bc03dc', 'Juja,Kenya', '123456789q', 5, '1416644163', '2014-11-22 08:16:03'),
(28, 'ZPN4ANISMY5470481ad0b4f', '', '', 'jackie@mail.com', '81a57538bea3f6e953f6a459eb767357', 'Juja,Kenya', '12345678', 5, '1416644634', '2014-11-22 08:23:54'),
(29, 'MCTKLH7YIH547048386e7a5', '', '', 'jackie@mail.com', '81a57538bea3f6e953f6a459eb767357', 'Juja,Kenya', '12345678', 5, '1416644664', '2014-11-22 08:24:24'),
(30, 'GQY1JJH1K554705c4020761', '', '', 'mod@mail.com', '5f4dcc3b5aa765d61d8327deb882cf99', 'Juja,Kenya', '12345678', 5, '1416649792', '2014-11-22 09:49:52'),
(31, '3Y0IF1ALZC54708d074ae0f', '', '', 'monderiee@gmail.com', 'c3981fa8d26e95d911fe8eaeb6570f2f', 'Kenya', '+254702966', 5, '1416662279', '2014-11-22 13:17:59'),
(32, 'T5A0SD78YS5470942c93cb5', '', '', 'monderiee@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'JUJA,Kenya', '+254702966', 5, '1416664108', '2014-11-22 13:48:28');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

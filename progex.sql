-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 30, 2014 at 08:24 AM
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
  `timeUploaded` varchar(20) NOT NULL,
  `assignee` varchar(20) NOT NULL,
  `timeCompleted` varchar(20) NOT NULL,
  `solutionPath` varchar(50) NOT NULL,
  `format` text NOT NULL,
  `size` varchar(200) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `assigned` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exCode` (`exCode`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `exercises`
--

INSERT INTO `exercises` (`id`, `exCode`, `path`, `timeUploaded`, `assignee`, `timeCompleted`, `solutionPath`, `format`, `size`, `completed`, `assigned`) VALUES
(7, 'UVJXODSTNF5316e05889e1e', 'exercises/bootstrap.css', '1394008152', 'WENJ3G1AED', '1395317212', '../exercises_solutions/UVJXODSTNF5316e05889e1e/', 'text/css', '28538', 1, 1),
(8, '82VY9NXWLC531efc8273330', 'exercises/bootstrap.css', '1394539650', 'WENJ3G1AED', '1395317418', '../exercises_solutions/82VY9NXWLC531efc8273330/', 'text/css', '28538', 1, 1),
(9, 'NHVDGRJ46L53258d0c50820', 'exercises/uhurugoogle.png', '1394969868', 'WENJ3G1AED', '1395317568', '../exercises_solutions/NHVDGRJ46L53258d0c50820/', 'image/png', '183076', 1, 1),
(10, '6U3BZ5RYJ95328739b48f6b', 'exercises/ad_2.jpeg', '1395159963', 'WENJ3G1AED', '1395318585', '../exercises_solutions/6U3BZ5RYJ95328739b48f6b/', 'image/jpeg', '19775', 1, 1),
(11, '602TJ6WL5853287a63924f9', 'exercises/ad_2.jpeg', '1395161699', 'WENJ3G1AED', '1395318651', '../exercises_solutions/602TJ6WL5853287a63924f9/', 'image/jpeg', '2824256', 1, 1),
(12, 'CPO8F4GF6A53287a7abc830', 'exercises/digital-marketing-la', '1395161722', 'WENJ3G1AED', '1395319098', '../exercises_solutions/CPO8F4GF6A53287a7abc830/', 'image/jpeg', '2824256', 1, 1),
(13, 'T2NVGIMMH253287afe167b3', 'exercises/digital-marketing-la', '1395161854', 'WENJ3G1AED', '1397581782', '../exercises_solutions/T2NVGIMMH253287afe167b3/', 'image/jpeg', '2824256', 1, 1),
(14, 'A7ZF7AH85P5342bdba95aae', 'exercises/THINKING AXES.docx', '1396882874', 'WENJ3G1AED', '1398846002', '../exercises_solutions/A7ZF7AH85P5342bdba95aae/', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '12029', 1, 1),
(15, 'WEG86I4KHI534d6799b74ad', 'exercises/Patikana_Transactions_List.pdf', '1397581721', 'WENJ3G1AED', '', '', 'application/pdf', '1972', 0, 1);

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
(6, 'WENJ3G1AED', 'Ian', 'Kanyari Mukunya', 'ianmukunya@gmail.com', 'ianmukunya', 't4tN3qA', 'Kerugoya', '0720121341', '2014-03-16 11:25:17', 1394969117, 'PHP,JAVASCRIPT,JQUERY,CSS', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

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
(15, 'WEG86I4KHI534d6799b74ad', '', '', 'Monderiee@gmail.com', '3fc0a7acf087f549ac2b266baf94b8b1', 'Jujaa', '0923123', 5, '1397581721', '2014-04-15 17:08:41');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

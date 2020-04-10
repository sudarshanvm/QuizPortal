-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 10, 2020 at 02:52 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quizportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminid` char(5) NOT NULL,
  `password` varchar(25) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminid`, `password`, `name`) VALUES
('admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `eid` text NOT NULL,
  `score` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `timestamp` bigint(50) NOT NULL,
  `status` varchar(40) NOT NULL,
  `score_updated` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `username`, `eid`, `score`, `correct`, `wrong`, `date`, `timestamp`, `status`, `score_updated`) VALUES
(1, 'SUDARSHAN', '5802790f793b1', 10, 4, 6, '2020-04-06 11:08:48', 1200, 'finished', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `ID` varchar(10) NOT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`ID`, `password`) VALUES
('1RV17IS048', '1234jpmc'),
('1RV17IS049', '05012000'),
('1RV17IS051', '@doggytail'),
('1RV17IS052', 'sushma@microsoft'),
('1RV17IS054', 'utkarsh018'),
('1RV18IS408', 'poojapooja'),
('1RV18IS409', 'upsroom321'),
('1RV18IS411', 'suraksha123');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(100) NOT NULL,
  `qid` varchar(50) NOT NULL,
  `option` varchar(5000) NOT NULL,
  `optionid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `qid`, `option`, `optionid`) VALUES
(1, '58027e82e62e3', 'Yes', '58027e82f2412'),
(2, '58027e82e62e3', 'No', '58027e82f2427'),
(3, '58027e82e62e3', 'Don\'t want to', '58027e82f2433'),
(4, '58027e82e62e3', 'Why should I', '58027e82f243d'),
(5, '58027e833dd54', 'sonudoo', '58027e8347505'),
(6, '58027e833dd54', 'sunnygkp10', '58027e8347514'),
(7, '58027e833dd54', 'markzuckerberg', '58027e834751b'),
(8, '58027e833dd54', 'me', '58027e8347521'),
(9, '58027e8371483', 'sonudoo', '58027e838f19a'),
(10, '58027e8371483', 'sunnygkp10', '58027e838f1b0'),
(11, '58027e8371483', 'me', '58027e838f1ba'),
(12, '58027e8371483', 'markzuckerberg', '58027e838f1c4');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(100) NOT NULL,
  `eid` text NOT NULL,
  `qid` text NOT NULL,
  `qns` text NOT NULL,
  `choice` int(10) NOT NULL,
  `sn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `eid`, `qid`, `qns`, `choice`, `sn`) VALUES
(1, '5802790f793b1', '58027e82e62e3', 'Have you read the README file?', 4, 1),
(2, '5802790f793b1', '58027e833dd54', 'Who is the Original creator of this quizzing site?', 4, 2),
(3, '5802790f793b1', '58027e8371483', 'Who improved the original version of this quizzing site?', 4, 3),
(4, 'e12345678uyt', 'e12345678uyt1', '2+2?', 4, 2),
(5, 'e12345678uyt', 'e12345678uyt2', '4-4?', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(100) NOT NULL,
  `eid` text NOT NULL,
  `coursetitle` varchar(100) NOT NULL,
  `coursecode` varchar(128) NOT NULL,
  `sem` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `eid`, `coursetitle`, `coursecode`, `sem`, `correct`, `wrong`, `total`, `time`, `date`, `status`) VALUES
(1, '5802790f793b1', ' 	Sample Quiz', 'admin', 6, 4, 1, 3, 3, '2020-04-05 20:40:55', 'enabled'),
(2, 'e12345678uyt', 'sample 2', 'SAMPLE002', 6, 4, 2, 20, 10, '2020-04-10 08:08:53', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `examid_r` int(3) NOT NULL,
  `usn_r` char(10) NOT NULL,
  `sem` int(1) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `coursename` varchar(30) DEFAULT NULL,
  `coursecode` varchar(10) DEFAULT NULL,
  `subject` varchar(45) GENERATED ALWAYS AS (concat_ws(' ',`coursecode`,`coursename`,`sem`)) VIRTUAL,
  `Score` int(255) NOT NULL,
  `Rank` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`examid_r`, `usn_r`, `sem`, `name`, `coursename`, `coursecode`, `Score`, `Rank`) VALUES
(1, '1RV17IS048', 6, 'sonal s  r', 'Basics of Project', '16ISQP1', 5, 1),
(1, '1RV17IS049', 6, 'sudarshan', 'Basics of Project', '16ISQP1', 3, 3),
(1, '1RV17IS051', 6, 'surya s', 'Basics of Project', '16ISQP1', 4, 2),
(1, '1RV17IS052', 6, 'sushma g', 'Basics of Project', '16ISQP1', 5, 1),
(1, '1RV17IS054', 6, 'utkarsh singh', 'Basics of Project', '16ISQP1', 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(128) NOT NULL,
  `usn` char(10) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `emailid` varchar(30) DEFAULT NULL,
  `branch` varchar(128) NOT NULL,
  `sem` int(1) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `usn`, `name`, `emailid`, `branch`, `sem`, `password`) VALUES
(1, '1RV17IS048', 'SONAL S R', 'sonalsr.is17@rvce.edu.in', 'ISE', 6, '1234jpmc'),
(2, '1RV17IS049', 'SUDARSHAN', 'sudarshan.is17@rvce.edu.in', 'ISE\r\n', 6, '05012000'),
(3, '1RV17IS050', 'SUMUKHA K R', 'sumukhakr.is17@rvce.edu.in', 'ISE', 6, 'ambiguousIdentity'),
(4, '1RV17IS051', 'SURYA S', 'suryas.is17@rvce.edu.in', 'ISE', 6, '@doggytail'),
(5, '1RV17IS052', 'SUSHMA G', 'sushmag.is17@rvce.edu.in', 'ISE\r\n', 6, 'sushma@microsoft'),
(6, '1RV17IS054', 'UTKARSH SINGH', 'utkarshsingh.is17@rvce.edu.in', 'ISE\r\n', 6, 'utkarsh018'),
(7, '1RV18IS408', 'POOJA', 'poojasp.is18@rvce.edu.in', 'ISE', 6, 'poojapooja'),
(8, '1RV18IS409', 'PRANAV SHASTRI', 'pranavshastri.is18@rvce.edu.in', 'ISE', 6, 'upsroom321'),
(9, '1RV18IS411', 'SURAKSHA S', 'surakshass.is18@rvce.edu.in', 'ISE', 6, 'suraksha123');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherid` char(5) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `coursecode` varchar(10) NOT NULL,
  `coursename` varchar(20) DEFAULT NULL,
  `sem` int(1) DEFAULT NULL,
  `subject` varchar(15) GENERATED ALWAYS AS (concat_ws(' ',`coursecode`,`coursename`,`sem`)) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherid`, `name`, `coursecode`, `coursename`, `sem`) VALUES
('rvis1', 'Dr. Padmashree T', '16IS64', 'DBMS', 6),
('rvis2', 'Prof. Rashmi R', '16IS62', 'WP', 6),
('rvis3', 'Prof. Kavitha S N', '16IS66', 'IS', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_answer`
--

CREATE TABLE `user_answer` (
  `id` int(100) NOT NULL,
  `qid` varchar(50) NOT NULL,
  `ans` varchar(50) NOT NULL,
  `correctans` varchar(50) NOT NULL,
  `eid` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_answer`
--

INSERT INTO `user_answer` (`id`, `qid`, `ans`, `correctans`, `eid`, `username`) VALUES
(1, 'e12345678uyt1', '1', '4', 'e12345678uyt', '1RV17IS049'),
(2, 'e12345678uyt2', '1', '1', 'e12345678uyt', '1RV17IS049');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`examid_r`,`usn_r`),
  ADD KEY `fk_u_Result` (`usn_r`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`usn`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherid`,`coursecode`);

--
-- Indexes for table `user_answer`
--
ALTER TABLE `user_answer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(128) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user_answer`
--
ALTER TABLE `user_answer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

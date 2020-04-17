-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2020 at 02:25 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `id` int(100) NOT NULL,
  `qid` text NOT NULL,
  `ansid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `qid`, `ansid`) VALUES
(13, '5e91b34947e80', '5e91b3497b49c'),
(14, '5e91b349dc36e', '5e91b349e4ee4'),
(15, '5e91b34a35727', '5e91b34a44266');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `eid` text NOT NULL,
  `score` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `timestamp` bigint(50) NOT NULL,
  `status` varchar(40) NOT NULL,
  `score_updated` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `username`, `eid`, `score`, `level`, `correct`, `wrong`, `date`, `timestamp`, `status`, `score_updated`) VALUES
(8, '1RV17IS054', '5e91b2383722a', 6, 3, 3, 0, '2020-04-11 12:24:13', 1586607795, 'finished', 'true');

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
(49, '5e91b34947e80', 'Sudarshan and Utkarsh', '5e91b3497b49c'),
(50, '5e91b34947e80', 'Ram and Shyaam', '5e91b3497b4a7'),
(51, '5e91b34947e80', 'Sita and Gita', '5e91b3497b4a9'),
(52, '5e91b34947e80', 'John and Richard', '5e91b3497b4aa'),
(53, '5e91b349dc36e', 'Dr. B.M Sagar', '5e91b349e4ed5'),
(54, '5e91b349dc36e', 'R.M.S', '5e91b349e4edf'),
(55, '5e91b349dc36e', 'Rekha B.S', '5e91b349e4ee2'),
(56, '5e91b349dc36e', 'Dr. Padmashree T', '5e91b349e4ee4'),
(57, '5e91b34a35727', 'COVID-19', '5e91b34a44266'),
(58, '5e91b34a35727', 'SWINE FLU', '5e91b34a44270'),
(59, '5e91b34a35727', 'TSUNAMI', '5e91b34a44272'),
(60, '5e91b34a35727', 'TYPHOON', '5e91b34a44274');

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
(13, '5e91b2383722a', '5e91b34947e80', 'Who are the creators of this Quiz Portal ', 4, 1),
(14, '5e91b2383722a', '5e91b349dc36e', 'Which faculty handles DBMS course for the batch of 2021?', 4, 2),
(15, '5e91b2383722a', '5e91b34a35727', 'What pandemic crisis happened during 6th Semester for 2021 batch?', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(100) NOT NULL,
  `eid` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `code` varchar(255) NOT NULL,
  `correct` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `eid`, `title`, `code`, `correct`, `wrong`, `total`, `time`, `date`, `status`) VALUES
(7, '5e91b2383722a', 'Sample Quiz', '16AA00', 2, 1, 3, 3, '2020-04-11 12:08:45', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `gender` varchar(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `branch`, `gender`, `username`, `password`) VALUES
(8, 'SONAL S R', 'sonalsr.is17@rvce.edu.in', 'ISE', 'F', '1RV17IS048', '1234jpmc'),
(9, 'SUDARSHAN', 'sudarshan.is17@rvce.edu.in', 'ISE', 'M', '1RV17IS049', '05012000'),
(10, 'SUMUKHA K R', 'sumukhakr.is17@rvce.edu.in', 'ISE', 'M', '1RV17IS050', 'ambiguousIdentity'),
(11, 'SURYA S', 'suryas.is17@rvce.edu.in', 'ISE', 'M', '1RV17IS051', '@doggytail'),
(12, 'SUSHMA G', 'sushmag.is17@rvce.edu.in', 'ISE', 'F', '1RV17IS052', 'sushma@microsoft'),
(13, 'UTKARSH SINGH', 'utkarshsingh.is17@rvce.edu.in', 'ISE', 'M', '1RV17IS054', 'utkarsh018'),
(14, 'POOJA', 'poojasp.is18@rvce.edu.in', 'ISE', 'F', '1RV18IS408', 'poojapooja'),
(15, 'PRANAV SHASTRI', 'pranavshastri.is18@rvce.edu.in', 'ISE', 'M', '1RV18IS409', 'upsroom321'),
(16, 'SURAKSHA S', 'surakshass.is18@rvce.edu.in', 'ISE', 'F', '1RV18IS411', 'suraksha123');

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
(18, '5e91b34947e80', '5e91b3497b49c', '5e91b3497b49c', '5e91b2383722a', '1RV17IS054'),
(19, '5e91b349dc36e', '5e91b349e4ee4', '5e91b349e4ee4', '5e91b2383722a', '1RV17IS054'),
(20, '5e91b34a35727', '5e91b34a44266', '5e91b34a44266', '5e91b2383722a', '1RV17IS054');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `user_answer`
--
ALTER TABLE `user_answer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_answer`
--
ALTER TABLE `user_answer`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

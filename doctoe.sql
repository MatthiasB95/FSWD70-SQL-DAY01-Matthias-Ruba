-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2019 at 03:39 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctoe`
--

-- --------------------------------------------------------

--
-- Table structure for table `case_history`
--

CREATE TABLE `case_history` (
  `ALLERGIES` varchar(100) NOT NULL,
  `OPERATIONS` varchar(100) NOT NULL,
  `PREVIOS_ILLNESSES` varchar(100) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `SPECIALITY` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `intervantions`
--

CREATE TABLE `intervantions` (
  `ID` int(11) NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `PRESCRIPTION` varchar(100) NOT NULL,
  `OBSERVED_SYMPTOM` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `ID` int(11) NOT NULL,
  `SSN` varchar(50) NOT NULL,
  `AGE` int(11) NOT NULL,
  `DATE_OF_ADMISSION` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `intervantions_ID` int(11) NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `DOCTORNAME` varchar(20) NOT NULL,
  `MED` varchar(100) NOT NULL,
  `PSTIENTNAME` varchar(20) NOT NULL,
  `PRICE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `previos_illnesses`
--

CREATE TABLE `previos_illnesses` (
  `NAME` varchar(100) NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `MED` varchar(100) NOT NULL,
  `case_history_ID` int(11) DEFAULT NULL,
  `PREVIOS_ILLNESSES_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `FLOOR` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `doctor_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `intervantions`
--
ALTER TABLE `intervantions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD KEY `intervantions_ID` (`intervantions_ID`);

--
-- Indexes for table `previos_illnesses`
--
ALTER TABLE `previos_illnesses`
  ADD PRIMARY KEY (`PREVIOS_ILLNESSES_ID`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `doctor_ID` (`doctor_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `prescription_ibfk_1` FOREIGN KEY (`intervantions_ID`) REFERENCES `intervantions` (`ID`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`doctor_ID`) REFERENCES `doctor` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

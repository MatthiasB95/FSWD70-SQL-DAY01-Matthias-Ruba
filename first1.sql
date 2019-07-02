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
-- Database: `first1`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresse`
--

CREATE TABLE `addresse` (
  `STREETNAME` varchar(50) NOT NULL,
  `STREET_NR` int(11) NOT NULL,
  `ZIPCODE` int(11) NOT NULL,
  `CUSTOMER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `STATUS` tinyint(1) DEFAULT NULL,
  `BIRTHPLACE` varchar(10) NOT NULL,
  `BIRTHDATE` datetime DEFAULT NULL,
  `WORKS` int(11) NOT NULL,
  `AWARDS` varchar(20) NOT NULL,
  `book_BOOK_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `BOOK_ID` int(11) NOT NULL,
  `TITLE` char(10) NOT NULL,
  `AUTHOR` varchar(10) NOT NULL,
  `PUBLISH_DATE` datetime DEFAULT NULL,
  `PRICE` int(11) NOT NULL,
  `PUBLISHER` varchar(20) DEFAULT NULL,
  `GENRE` varchar(10) NOT NULL,
  `LANGUAGE` varchar(10) NOT NULL,
  `DESCRIPTIONS` varchar(100) NOT NULL,
  `CHAPTERS` int(11) NOT NULL,
  `WORDCOUNT` int(11) NOT NULL,
  `COVER` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `book_store`
--

CREATE TABLE `book_store` (
  `STORE_ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `ADDRESSE` char(1) DEFAULT NULL,
  `OPENING_TIME` int(11) DEFAULT NULL,
  `EMPLOEES` varchar(100) NOT NULL,
  `PAYMENT_METHOD` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `ADDRESS` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `emploees`
--

CREATE TABLE `emploees` (
  `EMPLOEE_ID` int(11) NOT NULL,
  `book_store_STORE_ID` int(11) DEFAULT NULL,
  `NAME` varchar(20) NOT NULL,
  `AMOUNT` int(11) NOT NULL,
  `SALARY` int(11) NOT NULL,
  `IBAN` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `NAME` varchar(20) NOT NULL,
  `ADDRESS` char(1) DEFAULT NULL,
  `PHONE` int(11) NOT NULL,
  `book_BOOK_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresse`
--
ALTER TABLE `addresse`
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `book_BOOK_ID` (`book_BOOK_ID`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BOOK_ID`);

--
-- Indexes for table `book_store`
--
ALTER TABLE `book_store`
  ADD PRIMARY KEY (`STORE_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `emploees`
--
ALTER TABLE `emploees`
  ADD PRIMARY KEY (`EMPLOEE_ID`),
  ADD KEY `book_store_STORE_ID` (`book_store_STORE_ID`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD KEY `book_BOOK_ID` (`book_BOOK_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresse`
--
ALTER TABLE `addresse`
  ADD CONSTRAINT `addresse_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`);

--
-- Constraints for table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`book_BOOK_ID`) REFERENCES `book` (`BOOK_ID`);

--
-- Constraints for table `emploees`
--
ALTER TABLE `emploees`
  ADD CONSTRAINT `emploees_ibfk_1` FOREIGN KEY (`book_store_STORE_ID`) REFERENCES `book_store` (`STORE_ID`);

--
-- Constraints for table `publisher`
--
ALTER TABLE `publisher`
  ADD CONSTRAINT `publisher_ibfk_1` FOREIGN KEY (`book_BOOK_ID`) REFERENCES `book` (`BOOK_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

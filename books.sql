-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Jul 2019 um 14:44
-- Server-Version: 10.3.16-MariaDB
-- PHP-Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `books`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `active_books`
--

CREATE TABLE `active_books` (
  `active_date` datetime DEFAULT NULL,
  `active_books_NR` int(11) NOT NULL,
  `books_ISBN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `authorID` int(11) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `books`
--

CREATE TABLE `books` (
  `ISBN` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `author_authorID` int(11) DEFAULT NULL,
  `publisher_publisherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `finished_books`
--

CREATE TABLE `finished_books` (
  `finished_books_NR` int(11) NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `active_books_active_books_NR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publisher`
--

CREATE TABLE `publisher` (
  `publisherID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `ADDRESS` char(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `active_books`
--
ALTER TABLE `active_books`
  ADD PRIMARY KEY (`active_books_NR`),
  ADD KEY `books_ISBN` (`books_ISBN`);

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`authorID`);

--
-- Indizes für die Tabelle `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `author_ID` (`author_authorID`),
  ADD KEY `publisher_ID` (`publisher_publisherID`);

--
-- Indizes für die Tabelle `finished_books`
--
ALTER TABLE `finished_books`
  ADD PRIMARY KEY (`finished_books_NR`),
  ADD KEY `active_books_active_books_NR` (`active_books_active_books_NR`);

--
-- Indizes für die Tabelle `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisherID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `active_books`
--
ALTER TABLE `active_books`
  ADD CONSTRAINT `active_books_ibfk_1` FOREIGN KEY (`books_ISBN`) REFERENCES `books` (`ISBN`);

--
-- Constraints der Tabelle `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_authorID`) REFERENCES `author` (`authorID`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`publisher_publisherID`) REFERENCES `publisher` (`publisherID`);

--
-- Constraints der Tabelle `finished_books`
--
ALTER TABLE `finished_books`
  ADD CONSTRAINT `finished_books_ibfk_1` FOREIGN KEY (`active_books_active_books_NR`) REFERENCES `active_books` (`active_books_NR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

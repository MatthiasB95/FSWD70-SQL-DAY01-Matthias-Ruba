-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Jul 2019 um 14:43
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
-- Datenbank: `airport`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airport`
--

CREATE TABLE `airport` (
  `airportID` int(11) NOT NULL,
  `airportName` varchar(3) NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `flightID` int(11) DEFAULT NULL,
  `planes_registrationNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flights`
--

CREATE TABLE `flights` (
  `flightID` int(11) NOT NULL,
  `origin` varchar(30) NOT NULL,
  `destionation` varchar(30) NOT NULL,
  `planes_registrationNumber` int(11) DEFAULT NULL,
  `registrationNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `planes`
--

CREATE TABLE `planes` (
  `registrationNumber` int(11) NOT NULL,
  `assignment` varchar(150) NOT NULL,
  `manufacturer` varchar(30) NOT NULL,
  `model` varchar(25) NOT NULL,
  `capacity` int(11) NOT NULL,
  `flightRange` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`airportID`),
  ADD KEY `flightID` (`flightID`),
  ADD KEY `planes_registrationNumber` (`planes_registrationNumber`);

--
-- Indizes für die Tabelle `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flightID`),
  ADD KEY `planes_registrationNumber` (`planes_registrationNumber`);

--
-- Indizes für die Tabelle `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`registrationNumber`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`flightID`) REFERENCES `flights` (`flightID`),
  ADD CONSTRAINT `airport_ibfk_2` FOREIGN KEY (`planes_registrationNumber`) REFERENCES `planes` (`registrationNumber`);

--
-- Constraints der Tabelle `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`planes_registrationNumber`) REFERENCES `planes` (`registrationNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

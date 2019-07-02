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
-- Datenbank: `buses`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buses`
--

CREATE TABLE `buses` (
  `busID` int(11) NOT NULL,
  `model` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `plate` varchar(20) NOT NULL,
  `driver` varchar(20) NOT NULL,
  `routeCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cities`
--

CREATE TABLE `cities` (
  `postcode` int(11) NOT NULL,
  `cityName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `routes`
--

CREATE TABLE `routes` (
  `routeCode` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  `start` varchar(20) DEFAULT NULL,
  `end` varchar(20) DEFAULT NULL,
  `orderNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stops`
--

CREATE TABLE `stops` (
  `orderNumber` int(11) NOT NULL,
  `address` varchar(20) NOT NULL,
  `telephoneNumber` int(11) NOT NULL,
  `postcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`busID`),
  ADD KEY `routeCode` (`routeCode`);

--
-- Indizes für die Tabelle `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`postcode`);

--
-- Indizes für die Tabelle `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`routeCode`),
  ADD KEY `orderNumber` (`orderNumber`);

--
-- Indizes für die Tabelle `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `postcode` (`postcode`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`routeCode`) REFERENCES `routes` (`routeCode`);

--
-- Constraints der Tabelle `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`orderNumber`) REFERENCES `stops` (`orderNumber`);

--
-- Constraints der Tabelle `stops`
--
ALTER TABLE `stops`
  ADD CONSTRAINT `stops_ibfk_1` FOREIGN KEY (`postcode`) REFERENCES `cities` (`postcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

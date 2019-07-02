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
-- Datenbank: `auction`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bids`
--

CREATE TABLE `bids` (
  `bidID` int(11) NOT NULL,
  `bidAmount` float NOT NULL,
  `bidDate` datetime NOT NULL,
  `bidTime` time NOT NULL,
  `customer_userID` int(11) DEFAULT NULL,
  `sets_catalogNR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `userID` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `userPassword` varchar(15) NOT NULL,
  `realName` varchar(20) NOT NULL,
  `userMail` varchar(20) DEFAULT NULL,
  `userAddress` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `productNR` int(11) NOT NULL,
  `productName` varchar(30) NOT NULL,
  `prodcutDescription` varchar(100) NOT NULL,
  `productImage` varchar(80) NOT NULL,
  `sets_catalogNR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sets`
--

CREATE TABLE `sets` (
  `catalogNR` int(11) NOT NULL,
  `startPrice` int(11) NOT NULL,
  `highestBid` int(11) NOT NULL,
  `remainingTime` time NOT NULL,
  `customer_userID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `transactions`
--

CREATE TABLE `transactions` (
  `transID` int(11) NOT NULL,
  `transDate` datetime DEFAULT NULL,
  `endPrice` float NOT NULL,
  `customer_userID` int(11) DEFAULT NULL,
  `sets_catalogNR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bidID`),
  ADD KEY `customer_userID` (`customer_userID`),
  ADD KEY `sets_catalogNR` (`sets_catalogNR`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`userID`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productNR`),
  ADD KEY `sets_catalogNR` (`sets_catalogNR`);

--
-- Indizes für die Tabelle `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`catalogNR`),
  ADD KEY `customer_userID` (`customer_userID`);

--
-- Indizes für die Tabelle `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transID`),
  ADD KEY `customer_userID` (`customer_userID`),
  ADD KEY `sets_catalogNR` (`sets_catalogNR`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_ibfk_1` FOREIGN KEY (`customer_userID`) REFERENCES `customer` (`userID`),
  ADD CONSTRAINT `bids_ibfk_2` FOREIGN KEY (`sets_catalogNR`) REFERENCES `sets` (`catalogNR`);

--
-- Constraints der Tabelle `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`sets_catalogNR`) REFERENCES `sets` (`catalogNR`);

--
-- Constraints der Tabelle `sets`
--
ALTER TABLE `sets`
  ADD CONSTRAINT `sets_ibfk_1` FOREIGN KEY (`customer_userID`) REFERENCES `customer` (`userID`);

--
-- Constraints der Tabelle `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customer_userID`) REFERENCES `customer` (`userID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`sets_catalogNR`) REFERENCES `sets` (`catalogNR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

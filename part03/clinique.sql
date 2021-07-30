-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Creato il: Lug 30, 2021 alle 08:04
-- Versione del server: 5.7.31
-- Versione PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinique`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `animal`
--

DROP TABLE IF EXISTS `animal`;
CREATE TABLE IF NOT EXISTS `animal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `deathDate` datetime DEFAULT NULL,
  `idOwner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idowner` (`idOwner`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `animal`
--

INSERT INTO `animal` (`id`, `name`, `birthDate`, `deathDate`, `idOwner`) VALUES
(1, 'monchien', '2021-07-22 09:57:10', '2021-07-28 09:57:10', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `carried`
--

DROP TABLE IF EXISTS `carried`;
CREATE TABLE IF NOT EXISTS `carried` (
  `idkeep` int(11) DEFAULT NULL,
  `idveterinarian` int(11) DEFAULT NULL,
  KEY `fk_idkeep` (`idkeep`),
  KEY `fk_idveterinarian_carried` (`idveterinarian`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `carried`
--

INSERT INTO `carried` (`idkeep`, `idveterinarian`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `cat`
--

DROP TABLE IF EXISTS `cat`;
CREATE TABLE IF NOT EXISTS `cat` (
  `idanimal` int(11) DEFAULT NULL,
  `idrace` int(11) DEFAULT NULL,
  KEY `fk_idcatrace` (`idrace`),
  KEY `fk_idcatanimal` (`idanimal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `dog`
--

DROP TABLE IF EXISTS `dog`;
CREATE TABLE IF NOT EXISTS `dog` (
  `idanimal` int(11) NOT NULL,
  `size` varchar(45) DEFAULT NULL,
  `weight` varchar(45) DEFAULT NULL,
  `idrace` int(11) DEFAULT NULL,
  KEY `fk_iddograce` (`idrace`),
  KEY `fk_iddoganimal` (`idanimal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `dog`
--

INSERT INTO `dog` (`idanimal`, `size`, `weight`, `idrace`) VALUES
(1, '3 m', '45kg', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `dossier`
--

DROP TABLE IF EXISTS `dossier`;
CREATE TABLE IF NOT EXISTS `dossier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `antecedents` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `dossier`
--

INSERT INTO `dossier` (`id`, `antecedents`) VALUES
(1, 'maladie');

-- --------------------------------------------------------

--
-- Struttura della tabella `hours`
--

DROP TABLE IF EXISTS `hours`;
CREATE TABLE IF NOT EXISTS `hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day` date DEFAULT NULL,
  `starthour` time DEFAULT NULL,
  `endhour` time DEFAULT NULL,
  `idveterinarian` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idveterinarian` (`idveterinarian`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `hours`
--

INSERT INTO `hours` (`id`, `day`, `starthour`, `endhour`, `idveterinarian`) VALUES
(1, '2021-07-29', '09:59:16', '10:59:16', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `keep`
--

DROP TABLE IF EXISTS `keep`;
CREATE TABLE IF NOT EXISTS `keep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `start_hour` time DEFAULT NULL,
  `end_hour` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `keep`
--

INSERT INTO `keep` (`id`, `date`, `start_hour`, `end_hour`) VALUES
(1, '2021-07-30', '10:00:04', '12:00:04');

-- --------------------------------------------------------

--
-- Struttura della tabella `medicine`
--

DROP TABLE IF EXISTS `medicine`;
CREATE TABLE IF NOT EXISTS `medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `dosage` varchar(45) DEFAULT NULL,
  `indications` varchar(45) DEFAULT NULL,
  `secondaryeffects` varchar(45) DEFAULT NULL,
  `laboratory` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `dosage`, `indications`, `secondaryeffects`, `laboratory`) VALUES
(1, 'testmedicine', '20mg', 'pasutiliser', 'death', 'mylaboratory');

-- --------------------------------------------------------

--
-- Struttura della tabella `owner`
--

DROP TABLE IF EXISTS `owner`;
CREATE TABLE IF NOT EXISTS `owner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `postal code` int(11) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `mobilephone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `owner`
--

INSERT INTO `owner` (`id`, `name`, `surname`, `street`, `postal code`, `city`, `phone`, `mobilephone`) VALUES
(1, 'anis', 'boua', '1 rue de ', 75000, 'paris', 101010101, 202020202);

-- --------------------------------------------------------

--
-- Struttura della tabella `prescribe`
--

DROP TABLE IF EXISTS `prescribe`;
CREATE TABLE IF NOT EXISTS `prescribe` (
  `idvisit` int(11) DEFAULT NULL,
  `idmedicine` int(11) DEFAULT NULL,
  `dosage` varchar(45) DEFAULT NULL,
  KEY `fk_idmedicine` (`idmedicine`),
  KEY `fk_idvisit` (`idvisit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `prescribe`
--

INSERT INTO `prescribe` (`idvisit`, `idmedicine`, `dosage`) VALUES
(1, 1, '20mg');

-- --------------------------------------------------------

--
-- Struttura della tabella `race_cats`
--

DROP TABLE IF EXISTS `race_cats`;
CREATE TABLE IF NOT EXISTS `race_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struttura della tabella `race_dogs`
--

DROP TABLE IF EXISTS `race_dogs`;
CREATE TABLE IF NOT EXISTS `race_dogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `race_dogs`
--

INSERT INTO `race_dogs` (`id`, `name`) VALUES
(1, 'bulldog');

-- --------------------------------------------------------

--
-- Struttura della tabella `veterinarian`
--

DROP TABLE IF EXISTS `veterinarian`;
CREATE TABLE IF NOT EXISTS `veterinarian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `mobilephone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `veterinarian`
--

INSERT INTO `veterinarian` (`id`, `name`, `surname`, `phone`, `mobilephone`) VALUES
(1, 'dr.nadia', 'boua', 101010101, 202020202);

-- --------------------------------------------------------

--
-- Struttura della tabella `visit`
--

DROP TABLE IF EXISTS `visit`;
CREATE TABLE IF NOT EXISTS `visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitdate` datetime DEFAULT NULL,
  `visithour` datetime DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  `iddossier` int(11) DEFAULT NULL,
  `idanimal` int(11) DEFAULT NULL,
  `idveterinarian` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_iddossier` (`iddossier`),
  KEY `fk_idveterinarian_visit` (`idveterinarian`),
  KEY `fk_idanimal_visit` (`idanimal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `visit`
--

INSERT INTO `visit` (`id`, `visitdate`, `visithour`, `reason`, `iddossier`, `idanimal`, `idveterinarian`) VALUES
(1, '2021-07-29 10:03:11', '2021-07-29 10:03:11', 'intossication', 1, 1, 1);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `fk_idowner` FOREIGN KEY (`idOwner`) REFERENCES `owner` (`id`);

--
-- Limiti per la tabella `carried`
--
ALTER TABLE `carried`
  ADD CONSTRAINT `fk_idkeep` FOREIGN KEY (`idkeep`) REFERENCES `keep` (`id`),
  ADD CONSTRAINT `fk_idveterinarian_carried` FOREIGN KEY (`idveterinarian`) REFERENCES `veterinarian` (`id`);

--
-- Limiti per la tabella `cat`
--
ALTER TABLE `cat`
  ADD CONSTRAINT `fk_idcatanimal` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_idcatrace` FOREIGN KEY (`idrace`) REFERENCES `race_cats` (`id`);

--
-- Limiti per la tabella `dog`
--
ALTER TABLE `dog`
  ADD CONSTRAINT `fk_iddoganimal` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_iddograce` FOREIGN KEY (`idrace`) REFERENCES `race_dogs` (`id`);

--
-- Limiti per la tabella `hours`
--
ALTER TABLE `hours`
  ADD CONSTRAINT `fk_idveterinarian` FOREIGN KEY (`idveterinarian`) REFERENCES `veterinarian` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `prescribe`
--
ALTER TABLE `prescribe`
  ADD CONSTRAINT `fk_idmedicine` FOREIGN KEY (`idmedicine`) REFERENCES `medicine` (`id`),
  ADD CONSTRAINT `fk_idvisit` FOREIGN KEY (`idvisit`) REFERENCES `visit` (`id`);

--
-- Limiti per la tabella `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `fk_idanimal_visit` FOREIGN KEY (`idanimal`) REFERENCES `animal` (`id`),
  ADD CONSTRAINT `fk_iddossier` FOREIGN KEY (`iddossier`) REFERENCES `dossier` (`id`),
  ADD CONSTRAINT `fk_idveterinarian_visit` FOREIGN KEY (`idveterinarian`) REFERENCES `veterinarian` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

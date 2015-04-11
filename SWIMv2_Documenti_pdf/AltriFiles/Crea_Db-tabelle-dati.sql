CREATE DATABASE  IF NOT EXISTS `swimdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `swimdb`;
-- MySQL dump 10.13  Distrib 5.5.24, for osx10.5 (i386)
--
-- Host: localhost    Database: swimdb
-- ------------------------------------------------------
-- Server version	5.5.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Abilita`
--

DROP TABLE IF EXISTS `Abilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Abilita` (
  `Nome` varchar(100) NOT NULL,
  `Descrizione` longtext,
  PRIMARY KEY (`Nome`),
  UNIQUE KEY `Nome` (`Nome`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Abilita`
--

LOCK TABLES `Abilita` WRITE;
/*!40000 ALTER TABLE `Abilita` DISABLE KEYS */;
INSERT INTO `Abilita` VALUES ('Architetto',NULL),('Avvocato',NULL),('Cuoco',NULL),('Falegname',NULL),('Idraulico',NULL),('Programamtore Android','Programmatore per dispositivi android di qualunque versione'),('Programmatore Java SE','Programmatore in Java Standard Edition');
/*!40000 ALTER TABLE `Abilita` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Utente`
--

DROP TABLE IF EXISTS `Utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Utente` (
  `Email` varchar(100) NOT NULL,
  `Cognome` varchar(100) NOT NULL,
  `FotoProfilo` longblob,
  `Nome` varchar(100) NOT NULL,
  `Password` varchar(64) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utente`
--

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Utente` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Amicizia`
--

DROP TABLE IF EXISTS `Amicizia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Amicizia` (
  `DataAccettazione` datetime DEFAULT NULL,
  `Diretta` bit(1) NOT NULL,
  `NotificaAlRichiedente` bit(1) NOT NULL,
  `EmailUtente2` varchar(100) NOT NULL,
  `EmailUtente1` varchar(100) NOT NULL,
  PRIMARY KEY (`EmailUtente1`,`EmailUtente2`),
  KEY `FK9F05216FB8BFC563` (`EmailUtente1`),
  KEY `FK9F05216FB8BFC564` (`EmailUtente2`),
  CONSTRAINT `FK9F05216FB8BFC563` FOREIGN KEY (`EmailUtente1`) REFERENCES `Utente` (`Email`),
  CONSTRAINT `FK9F05216FB8BFC564` FOREIGN KEY (`EmailUtente2`) REFERENCES `Utente` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amicizia`
--

LOCK TABLES `Amicizia` WRITE;
/*!40000 ALTER TABLE `Amicizia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Amicizia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Amministratore`
--

DROP TABLE IF EXISTS `Amministratore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Amministratore` (
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Amministratore`
--

LOCK TABLES `Amministratore` WRITE;
/*!40000 ALTER TABLE `Amministratore` DISABLE KEYS */;
INSERT INTO `Amministratore` VALUES ('admin@swim.it','a2242ead55c94c3deb7cf2340bfef9d5bcaca22dfe66e646745ee4371c633fc8');
/*!40000 ALTER TABLE `Amministratore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Collaborazione`
--

DROP TABLE IF EXISTS `Collaborazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Collaborazione` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CommentoFeedback` varchar(250) DEFAULT NULL,
  `DataStipula` datetime DEFAULT NULL,
  `DataTermine` datetime DEFAULT NULL,
  `Descrizione` longtext,
  `Nome` varchar(255) NOT NULL,
  `NotificaAlRichiedente` bit(1) NOT NULL,
  `PunteggioFeedback` int(11) DEFAULT NULL,
  `EmailRicevente` varchar(100) NOT NULL,
  `EmailRichiedente` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK2EE6A7E675891F51` (`EmailRichiedente`),
  KEY `FK2EE6A7E69DBF7A22` (`EmailRicevente`),
  CONSTRAINT `FK2EE6A7E675891F51` FOREIGN KEY (`EmailRichiedente`) REFERENCES `Utente` (`Email`),
  CONSTRAINT `FK2EE6A7E69DBF7A22` FOREIGN KEY (`EmailRicevente`) REFERENCES `Utente` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Collaborazione`
--

LOCK TABLES `Collaborazione` WRITE;
/*!40000 ALTER TABLE `Collaborazione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Collaborazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Possiede`
--

DROP TABLE IF EXISTS `Possiede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Possiede` (
  `NomeAbilita` varchar(100) NOT NULL,
  `EmailUtente` varchar(100) NOT NULL,
  PRIMARY KEY (`NomeAbilita`,`EmailUtente`),
  KEY `FK30F4D7DCC89A37BC` (`EmailUtente`),
  KEY `FK30F4D7DC2B6FC97D` (`NomeAbilita`),
  CONSTRAINT `FK30F4D7DC2B6FC97D` FOREIGN KEY (`NomeAbilita`) REFERENCES `Abilita` (`Nome`),
  CONSTRAINT `FK30F4D7DCC89A37BC` FOREIGN KEY (`EmailUtente`) REFERENCES `Utente` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Possiede`
--

LOCK TABLES `Possiede` WRITE;
/*!40000 ALTER TABLE `Possiede` DISABLE KEYS */;
/*!40000 ALTER TABLE `Possiede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PropostaAbilita`
--

DROP TABLE IF EXISTS `PropostaAbilita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PropostaAbilita` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AbilitaProposta` varchar(100) NOT NULL,
  `DataAccettazione` datetime DEFAULT NULL,
  `Motivazione` longtext,
  `EmailUtente` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK6503151EC89A37BC` (`EmailUtente`),
  CONSTRAINT `FK6503151EC89A37BC` FOREIGN KEY (`EmailUtente`) REFERENCES `Utente` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PropostaAbilita`
--

LOCK TABLES `PropostaAbilita` WRITE;
/*!40000 ALTER TABLE `PropostaAbilita` DISABLE KEYS */;
/*!40000 ALTER TABLE `PropostaAbilita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'swimdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-20  0:13:29

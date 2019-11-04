-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 01 Avril 2018 à 15:02
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `Id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `author`
--

INSERT INTO `author` (`Id`, `FirstName`, `LastName`) VALUES
(1, 'John', 'Doe'),
(2, 'Sylvie', 'Merlot'),
(3, 'Bernard', 'Lhermite'),
(4, 'Françoise', 'Serpent'),
(5, 'Jean', 'Dumoulin'),
(6, 'Sidonie', 'Desprès'),
(7, 'Fabien', 'Cripon');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `Id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`Id`, `Name`) VALUES
(4, 'Cinéma'),
(3, 'Cuisine'),
(2, 'Jeux-Vidéos'),
(5, 'Littérature'),
(6, 'Sport'),
(1, 'Voyages');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `Id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `NickName` varchar(30) DEFAULT NULL,
  `Contents` text NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  `Post_Id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `CreationTimestamp` (`CreationTimestamp`),
  KEY `Post_Id` (`Post_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `comment`
--

INSERT INTO `comment` (`Id`, `NickName`, `Contents`, `CreationTimestamp`, `Post_Id`) VALUES
(1, 'Laure', 'On en a rien à faire de ses histoires à Jean. Il nous casse les bonbons !! ', '2018-02-21 20:42:42', 5);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(100) NOT NULL,
  `Lastname` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Messages` text NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Lastname` (`Lastname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `contact`
--

INSERT INTO `contact` (`Id`, `Firstname`, `Lastname`, `Email`, `Messages`, `CreationTimestamp`) VALUES
(1, 'Laure', 'Lebon', 'lebon.laure@hotmail.fr', 'Je vous adore', '2018-02-21 20:22:53'),
(3, 'Sylvie', 'Gaigniot', 'sylvie.gaigniot@hotmail.fr', 'J''adore toute l''équipe', '2018-02-21 20:34:10'),
(4, 'Marie-Claire', 'Chabot', 'mcc.chabot@hotmail.fr', 'Pourriez-vous m''indiquer un pays magnifique', '2018-02-21 20:35:58'),
(5, 'Johanna', 'Perla', 'johanna.perla@hotmail.fr', 'J''attends de vos nouvelles', '2018-02-22 07:21:57'),
(6, 'lebon', 'laure', 'lebon.laure@hotmail.fr', '<p>salut</p>', '2018-03-31 16:48:57');

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `Id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) NOT NULL,
  `Contents` text NOT NULL,
  `CreationTimestamp` datetime NOT NULL,
  `Author_Id` tinyint(3) unsigned DEFAULT NULL,
  `Category_Id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Title` (`Title`),
  KEY `CreationTimestamp` (`CreationTimestamp`),
  KEY `Author_Id` (`Author_Id`),
  KEY `Category_Id` (`Category_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `post`
--

INSERT INTO `post` (`Id`, `Title`, `Contents`, `CreationTimestamp`, `Author_Id`, `Category_Id`) VALUES
(1, 'Italie', 'J''ai eu la chance de pouvoir visiter 2 belles villes : Rome et Venise. ', '2018-02-20 19:54:36', 6, 1),
(4, 'Flan de courgette', 'Etape 1\r\nFaire cuire les courgettes sans enlever la peau.\r\nEtape 2\r\nBattre les six oeufs en omelette.\r\nEtape 3\r\nMixer les courgettes cuites. Mélanger les courgettes, les oeufs et la crème fraîche.\r\nEtape 4\r\nMettre dans des ramequins, après les avoir enduis de beurre (environ 12 ramequins).\r\nEtape 5\r\nFaire cuire au four 45 minutes\r\n', '2018-02-20 20:12:51', 6, 4),
(5, 'Sans réseaux sociaux', 'Ma grande chance c’est que je suis une fille de parole, si je dis quelque chose je le fais et si je n’y arrive pas j’ai l’honnêteté de le dire.\r\n\r\nAlors cette semaine je n’ai pas touché une seule fois a mes réseaux, du dimanche soir 21h au dimanche suivant au matin.\r\nJe ne l’ai pas fait car j’avais dit que je ne le ferai pas, et surtout parce que j’étais persuadé que cela me ferait le plus grand bien et soyons honnête ce n’était pas difficile.\r\nA l’heure ou certains postent 3fois par jour pour augmenter leur visibilité, j’ai fait le choix de ne rien oublier pendant une semaine, de ne répondre à aucun message, aucun commentaire et ne me laissée happer par aucun potin du web.', '2018-02-20 20:19:02', 5, 6);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `Comment_ibfk_1` FOREIGN KEY (`Post_Id`) REFERENCES `post` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `Post_ibfk_1` FOREIGN KEY (`Author_Id`) REFERENCES `author` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Post_ibfk_2` FOREIGN KEY (`Category_Id`) REFERENCES `category` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 05 Novembre 2015 à 00:48
-- Version du serveur :  5.6.20-log
-- Version de PHP :  5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `itil`
--

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

CREATE TABLE IF NOT EXISTS `document` (
`id` int(11) NOT NULL,
  `titre` varchar(20) COLLATE latin1_bin NOT NULL,
  `path` varchar(20) COLLATE latin1_bin NOT NULL,
  `format` varchar(10) COLLATE latin1_bin NOT NULL,
  `keyword` varchar(50) COLLATE latin1_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(20) COLLATE latin1_bin NOT NULL,
  `password` varchar(20) COLLATE latin1_bin NOT NULL,
  `role` varchar(20) COLLATE latin1_bin NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=6 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'samnang', 'suon', 'admin'),
(2, 'kismony', 'ladouceur', 'admin'),
(3, 'nicolas', 'blier', 'admin'),
(4, 'jerome', 'beaulieu', 'admin'),
(5, 'daniel', 'gailloux', 'user');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `document`
--
ALTER TABLE `document`
 ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `document`
--
ALTER TABLE `document`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

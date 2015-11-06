-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Ven 06 Novembre 2015 à 16:43
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
  `titre` varchar(100) COLLATE latin1_bin NOT NULL,
  `auteur` varchar(100) COLLATE latin1_bin NOT NULL DEFAULT 'CollegeDeRosemont',
  `dateDeCreation` date NOT NULL,
  `typeDeDocument` varchar(100) COLLATE latin1_bin NOT NULL DEFAULT 'procedure',
  `path` varchar(20) COLLATE latin1_bin NOT NULL DEFAULT './document/',
  `format` varchar(10) COLLATE latin1_bin NOT NULL DEFAULT '.pdf',
  `keyword` varchar(50) COLLATE latin1_bin NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=12 ;

--
-- Contenu de la table `document`
--

INSERT INTO `document` (`id`, `titre`, `auteur`, `dateDeCreation`, `typeDeDocument`, `path`, `format`, `keyword`) VALUES
(1, 'C Sharp Programming', 'CollegeDeRosemont', '2013-04-30', 'ouvrage de référence', './document/', '.pdf', 'c#, programming'),
(2, 'Java EE 7 Development', 'CollegeDeRosemont', '2015-01-01', 'ouvrage de référence', './document/', '.pdf', 'java, programming'),
(3, 'Markdown', 'CollegeDeRosemont', '2015-11-05', 'procedure', './document/', '.md', 'markdown, programming'),
(4, 'Configuration, Installation et Administration de mysql sous Linux', 'Anonyme', '2013-08-21', 'fichier de configuration', './document/', '.pdf', 'mysql'),
(5, 'CentOS 6 Linux Server Cookbook', 'Jonathan Hobson', '2013-01-01', 'ouvrage de référence', './document/', '.pdf', 'centos 6, linux, serveur'),
(6, 'vmware-tools-installation-configuration', 'VmWare', '2012-09-03', 'fichier de configuration', './document/', '.pdf', 'vmware tools, machine virtuelle, virtualisation'),
(7, 'Annual_Report_2014_SLF_en', 'SunLife', '2014-12-25', 'rapport annuel', './document/', '.pdf', 'sunlife'),
(8, 'hpq-annual-report-2014', 'HP', '2014-12-25', 'rapport annuel', './document/', '.pdf', 'hp'),
(9, 'nokia_uk_ar14', 'Nokia', '2014-12-25', 'rapport annuel', './document/', '.pdf', 'nokia'),
(10, 'stm_rapport_financer_2013', 'STM', '2013-07-15', 'rapport financier', './document/', '.pdf', 'stm'),
(11, 'ville_montreal_2014_rapport_financier_annuel_fr', 'ville de Montréal', '2014-03-14', 'rapport financier', './document/', '.pdf', 'ville de montréal');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(20) COLLATE latin1_bin NOT NULL,
  `password` varchar(20) COLLATE latin1_bin NOT NULL,
  `role` varchar(20) COLLATE latin1_bin NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=8 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'samnang', 'suon', 'admin'),
(2, 'kismony', 'ladouceur', 'admin'),
(3, 'nicolas', 'blier', 'admin'),
(4, 'jerome', 'beaulieu', 'admin'),
(5, 'daniel', 'gailloux', 'pdg'),
(6, 'usager', 'crosemont', 'user'),
(7, 'comptable', 'comptable', 'comptable');

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

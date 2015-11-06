-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 06, 2015 at 12:07 PM
-- Server version: 5.6.20-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `itil`
--

-- --------------------------------------------------------

--
-- Table structure for table `document`
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `titre`, `auteur`, `dateDeCreation`, `typeDeDocument`, `path`, `format`, `keyword`) VALUES
(1, 'C Sharp Programming', 'CollegeDeRosemont', '2013-04-30', 'ouvrage de référence', './document/', '.pdf', 'c#, programming'),
(2, 'Java EE 7 Development', 'CollegeDeRosemont', '2015-01-01', 'ouvrage de référence', './document/', '.pdf', 'java, programming'),
(3, 'Markdown', 'CollegeDeRosemont', '2015-11-05', 'procedure', './document/', '.md', 'markdown, programming'),
(4, 'Configuration, Installation et Administration de mysql sous Linux', 'Anonyme', '2013-08-21', 'fichier de configuration', './document/', '.pdf', 'mysql'),
(5, 'CentOS 6 Linux Server Cookbook', 'Jonathan Hobson', '2013-01-01', 'ouvrage de référence', './document/', '.pdf', 'centos 6, linux, serveur'),
(6, 'vmware-tools-installation-configuration', 'VmWare', '2012-09-03', 'fichier de configuration', './document/', '.pdf', 'vmware tools, machine virtuelle, virtualisation');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(20) COLLATE latin1_bin NOT NULL,
  `password` varchar(20) COLLATE latin1_bin NOT NULL,
  `role` varchar(20) COLLATE latin1_bin NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_bin AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(1, 'samnang', 'suon', 'admin'),
(2, 'kismony', 'ladouceur', 'admin'),
(3, 'nicolas', 'blier', 'admin'),
(4, 'jerome', 'beaulieu', 'admin'),
(5, 'daniel', 'gailloux', 'user'),
(6, 'usager', 'crosemont', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `document`
--
ALTER TABLE `document`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

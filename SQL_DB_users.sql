-- SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- MySql Server version: 10.2.30-MariaDB-log

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myapp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL COMMENT 'primary key',
  `username` varchar(100) NOT NULL COMMENT 'username (NOTE: 'name' is a mySql reserved word.)',
  `email` varchar(255) NOT NULL COMMENT 'email',
  `passwd` varchar(15) NOT NULL COMMENT 'passwd'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='Stores Users';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `passwd`) VALUES
(3, 'name222', 'email222', 'pwd111'),
(5, 'user66', 'email66', 'pwd'),
(6, 'u33', 'e33', 'p33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_IDX` (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

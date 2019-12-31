-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2019 at 07:28 AM
-- Server version: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pennywise`
--

-- --------------------------------------------------------

--
-- Table structure for table `goal_details`
--

DROP TABLE IF EXISTS `goal_details`;
CREATE TABLE `goal_details` (
  `goal_id` smallint(6) NOT NULL,
  `goal_name` varchar(20) COLLATE utf16_unicode_ci NOT NULL,
  `savings_target` mediumint(9) NOT NULL,
  `goal_start_date` date NOT NULL,
  `goal_completion_date` date NOT NULL,
  `goal_achieved_date` date DEFAULT NULL,
  `current_savings` mediumint(9) NOT NULL,
  `is_completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `goal_details`
--

INSERT INTO `goal_details` (`goal_id`, `goal_name`, `savings_target`, `goal_start_date`, `goal_completion_date`, `goal_achieved_date`, `current_savings`, `is_completed`) VALUES
(1, 'holiday', 10000, '2019-09-17', '2020-09-30', NULL, 0, 0),
(2, 'house', 10000, '2019-09-17', '2020-09-25', NULL, 0, 0),
(3, 'burger', 10000, '2019-09-17', '2020-09-25', NULL, 0, 0),
(4, 'home', 30000, '2019-09-18', '2020-09-28', NULL, 0, 0),
(5, 'comp', 10000, '2019-09-18', '2020-09-28', NULL, 0, 0),
(6, 'car', 20000, '2019-09-19', '2020-10-18', NULL, 100, 0),
(7, 'Gifts', 500, '2019-12-23', '2020-04-30', NULL, 50, 0),
(8, 'Anniversary', 1000, '2019-12-23', '2020-12-31', NULL, 1000, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
CREATE TABLE `transaction_history` (
  `goal_id` smallint(6) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_amount` mediumint(9) NOT NULL,
  `transaction_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `transaction_history`
--

INSERT INTO `transaction_history` (`goal_id`, `transaction_date`, `transaction_amount`, `transaction_id`) VALUES
(1, '2019-09-17', 0, 1),
(1, '2019-09-17', 1000, 2),
(1, '2019-09-17', -1000, 3),
(2, '2019-09-17', 0, 4),
(3, '2019-09-17', 0, 5),
(4, '2019-09-18', 0, 6),
(5, '2019-09-18', 0, 7),
(6, '2019-09-19', 100, 8),
(4, '2019-09-20', 70, 9),
(4, '2019-09-20', -10, 10),
(4, '2019-09-20', 1000, 11),
(7, '2019-12-23', 50, 12),
(8, '2019-12-23', 1000, 13),
(7, '2019-12-23', 100, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goal_details`
--
ALTER TABLE `goal_details`
  ADD PRIMARY KEY (`goal_id`);

--
-- Indexes for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `goal_id` (`goal_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `goal_details`
--
ALTER TABLE `goal_details`
  MODIFY `goal_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `transaction_history`
--
ALTER TABLE `transaction_history`
  MODIFY `transaction_id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction_history`
--
ALTER TABLE `transaction_history`
  ADD CONSTRAINT `transaction_history_ibfk_1` FOREIGN KEY (`goal_id`) REFERENCES `goal_details` (`goal_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 11:43 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `garbage`
--

-- --------------------------------------------------------

--
-- Table structure for table `compost_tb`
--

CREATE TABLE `compost_tb` (
  `compost_id` int(11) NOT NULL,
  `c_name` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `available_quantity` varchar(100) NOT NULL,
  `rate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compost_tb`
--

INSERT INTO `compost_tb` (`compost_id`, `c_name`, `quantity`, `available_quantity`, `rate`) VALUES
(3, 'Bio-organic Manure', '1kg', '1kg', '300'),
(4, 'Premium Compost', '1kg', '1kg', '500'),
(5, 'Prelite', '1kg', '1kg', '100'),
(6, 'Black Gold', '750gm', '750gm', '600'),
(7, 'Black Gold Premium', '500gm', '500gm', '500'),
(8, 'Premium Compost', '250gm', '250gm', '300');

-- --------------------------------------------------------

--
-- Table structure for table `driver_tb`
--

CREATE TABLE `driver_tb` (
  `driver_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `d_name` varchar(50) NOT NULL,
  `d_email` varchar(100) NOT NULL,
  `d_address` varchar(200) NOT NULL,
  `vehicle_no` varchar(20) NOT NULL,
  `d_mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_tb`
--

INSERT INTO `driver_tb` (`driver_id`, `login_id`, `d_name`, `d_email`, `d_address`, `vehicle_no`, `d_mobile`) VALUES
(2, 4, 'vishnuV', 'vishnu@gamil.com', '', 'KL11-6039', '4152369870');

-- --------------------------------------------------------

--
-- Table structure for table `garbage_tb`
--

CREATE TABLE `garbage_tb` (
  `garbage_id` int(11) NOT NULL,
  `g_name` varchar(100) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `g_place` varchar(100) NOT NULL,
  `g_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `garbage_tb`
--

INSERT INTO `garbage_tb` (`garbage_id`, `g_name`, `latitude`, `longitude`, `g_place`, `g_status`) VALUES
(1, 'bin1', '14.672881', '8.298015', 'Termit Kaoboul', '10'),
(4, 'bin-2', '11.2537', '75.7764', 'Mananchira', NULL),
(5, 'Bin-3', '11.2797', '75.7844', 'Eranjhipalam', NULL),
(6, 'Bin4', '11.2857', '75.8115', 'Malaparamba', NULL),
(7, 'Bin-5', '11.2537', '75.7764', 'Calicut Beach', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_tb`
--

CREATE TABLE `login_tb` (
  `login_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_tb`
--

INSERT INTO `login_tb` (`login_id`, `email`, `password`, `type`) VALUES
(1, 'admin', '123', 0),
(2, 'dfsfd', 'sdfsfd', 1),
(4, 'vishnu', '123', 1),
(6, '', '', 0),
(7, 'qqqq', '111', 4),
(8, 'qqqq', '111', 0),
(9, 'qqqq', '111', 0),
(10, 'qqqq', '111', 0),
(11, 'qqqq', '111', 0),
(12, 'qqqq', '111', 0),
(13, 'qqqq', '111', 0),
(14, 'qqqq', '111', 0),
(15, 'qqqq', '111', 0),
(16, 'qqqq', '111', 0),
(17, 'qqqq', '111', 0),
(18, 'qqqq', '111', 0),
(19, 'qqqq', '111', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_tb`
--

CREATE TABLE `user_tb` (
  `reg_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_tb`
--

INSERT INTO `user_tb` (`reg_id`, `login_id`, `name`, `mobile`) VALUES
(2, 6, '', ''),
(3, 19, '111', '1111');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `compost_tb`
--
ALTER TABLE `compost_tb`
  ADD PRIMARY KEY (`compost_id`);

--
-- Indexes for table `driver_tb`
--
ALTER TABLE `driver_tb`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `garbage_tb`
--
ALTER TABLE `garbage_tb`
  ADD PRIMARY KEY (`garbage_id`);

--
-- Indexes for table `login_tb`
--
ALTER TABLE `login_tb`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `user_tb`
--
ALTER TABLE `user_tb`
  ADD PRIMARY KEY (`reg_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `compost_tb`
--
ALTER TABLE `compost_tb`
  MODIFY `compost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `driver_tb`
--
ALTER TABLE `driver_tb`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `garbage_tb`
--
ALTER TABLE `garbage_tb`
  MODIFY `garbage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `login_tb`
--
ALTER TABLE `login_tb`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_tb`
--
ALTER TABLE `user_tb`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

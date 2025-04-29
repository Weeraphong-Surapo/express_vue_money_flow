-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2025 at 05:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moneyflow`
--

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `amount` decimal(65,30) NOT NULL,
  `category` enum('INCOME','EXPENSE','SAVINGS','INVESTMENT') NOT NULL,
  `title` varchar(191) NOT NULL,
  `user_id` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `amount`, `category`, `title`, `user_id`, `createdAt`, `updatedAt`) VALUES
(6, 18000.000000000000000000000000000000, 'INCOME', 'เงินเดือน', 1, '2025-04-28 16:57:16.066', '2025-04-28 16:57:16.066'),
(7, 18000.000000000000000000000000000000, 'INCOME', 'เงินเดือน', 3, '2025-04-29 04:15:07.635', '2025-04-29 04:15:07.635'),
(8, 7000.000000000000000000000000000000, 'INCOME', 'เงินเดือนทหาร', 3, '2025-04-29 04:49:50.571', '2025-04-29 04:49:50.571'),
(9, 2000.000000000000000000000000000000, 'SAVINGS', 'ออมผ่อนรถ', 3, '2025-04-29 04:50:29.459', '2025-04-29 04:50:29.459'),
(10, 8000.000000000000000000000000000000, 'INVESTMENT', 'ซื้อ iphone 12 ', 3, '2025-04-29 04:51:01.789', '2025-04-29 13:19:23.926'),
(14, 18000.000000000000000000000000000000, 'INCOME', 'เงินเดือน', 4, '2025-04-29 07:30:31.596', '2025-04-29 07:30:31.596'),
(15, 2800.000000000000000000000000000000, 'EXPENSE', 'ค่าห้อง', 4, '2025-04-29 07:30:47.449', '2025-04-29 07:30:47.449'),
(16, 5000.000000000000000000000000000000, 'INVESTMENT', 'ออมทอง', 4, '2025-04-29 07:31:04.504', '2025-04-29 07:31:04.504'),
(17, 3000.000000000000000000000000000000, 'SAVINGS', 'เก็บเงินซื้อรถ', 4, '2025-04-29 07:31:22.559', '2025-04-29 07:31:22.559');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `username` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `role` enum('USER','ADMIN') NOT NULL DEFAULT 'USER',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `image`, `role`, `createdAt`, `updatedAt`) VALUES
(1, 'test123', 'test123', '$2b$10$PAGF.dBUL/g1X4gyFB9vUu6A1g4ElxEfWrFPG0x1DchhNU79qHPbG', NULL, 'USER', '2025-04-28 16:12:16.089', '2025-04-28 16:12:16.089'),
(2, 'test123', '123456', '$2b$10$v/PmalVTXg6ABEmEx3FeVOVHBpN2wvuq2KSvQkuKGjaDTfuZjdwJ.', NULL, 'USER', '2025-04-29 03:40:10.506', '2025-04-29 03:40:10.506'),
(3, '1234567', '1234567', '$2b$10$zexys8tw23qgj4qEjNUVeu0X0IBmLPctmX96XgXeQEHwVymJH.GnG', NULL, 'USER', '2025-04-29 03:41:01.175', '2025-04-29 03:41:01.175'),
(4, 'testtesttest', 'testtest', '$2b$10$FQZySdwokQtuJYUsB4h0I.M3EQmrt0SJzjsxi8xXrAIaewSFmwNl2', NULL, 'USER', '2025-04-29 07:30:11.713', '2025-04-29 07:30:11.713');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_fkey` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_key` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

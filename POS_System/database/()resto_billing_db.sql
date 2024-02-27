-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 22, 2023 at 11:24 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resto_billing_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(4, 'Unli Wings', 'Unlimited wings'),
(5, 'Ala Carte', 'Not Unlimited Wings'),
(6, 'Extra', 'Extra for Ala Carte'),
(7, 'Drinks', 'Beverages');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ref_no` varchar(50) NOT NULL,
  `total_amount` float NOT NULL,
  `amount_tendered` float NOT NULL,
  `order_number` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_no`, `total_amount`, `amount_tendered`, `order_number`, `date_created`) VALUES
(1, '989742510629', 170, 300, 1, '2020-11-02 15:29:46'),
(2, '590267910401', 115, 0, 0, '2020-11-02 16:06:07'),
(3, '084976005388', 315, 500, 23, '2023-09-22 03:03:24'),
(4, '485296752571', 0, 0, 0, '2023-09-22 03:03:34'),
(5, '292418495002', 700, 1000, 6, '2023-09-22 03:03:44'),
(6, '516659140044', 685, 900, 7, '2023-09-22 04:17:22'),
(7, '286996717857', 509, 600, 1, '2023-09-22 05:13:39'),
(8, '615639708104', 1406, 2000, 2, '2023-09-22 05:14:35'),
(9, '113442933043', 459, 500, 3, '2023-09-22 05:15:15'),
(10, '845975381601', 468, 500, 4, '2023-09-22 05:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`, `amount`) VALUES
(1, 1, 4, 1, 70, 70),
(2, 1, 3, 1, 100, 100),
(3, 2, 3, 1, 100, 100),
(4, 2, 2, 1, 15, 15),
(5, 3, 4, 1, 70, 70),
(6, 3, 2, 3, 15, 45),
(7, 3, 3, 2, 100, 200),
(8, 5, 3, 2, 100, 200),
(9, 5, 1, 1, 500, 500),
(10, 6, 4, 1, 70, 70),
(11, 6, 3, 1, 100, 100),
(12, 6, 2, 1, 15, 15),
(13, 6, 1, 1, 500, 500),
(14, 7, 9, 1, 399, 399),
(15, 7, 19, 1, 50, 50),
(16, 7, 15, 1, 30, 30),
(17, 7, 13, 1, 30, 30),
(18, 8, 5, 4, 329, 1316),
(19, 8, 18, 1, 60, 60),
(20, 8, 12, 1, 30, 30),
(21, 9, 8, 1, 389, 389),
(22, 9, 21, 1, 70, 70),
(23, 10, 10, 1, 219, 219),
(24, 10, 11, 1, 169, 169),
(25, 10, 19, 1, 50, 50),
(26, 10, 13, 1, 30, 30);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Unavailable,1=Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `status`) VALUES
(5, 4, 'Chicken Wings & Rice', 'Chicken Wings & Rice', 329, 1),
(6, 4, 'Wings Only', 'Wings Only', 349, 1),
(7, 4, 'Wings, Rice & Drinks', 'Wings, Rice & Drinks', 369, 1),
(8, 4, 'Wings & Drinks', 'Wings & Drinks', 389, 1),
(9, 5, '12pcs Wings 2Rice', '12pcs Wings 2Rice', 399, 1),
(10, 5, '6pcs Wings 1Rice', '6pcs Wings 1Rice', 219, 1),
(11, 5, '4pcs Wings 1Rice', '4pcs Wings 1Rice', 169, 1),
(12, 6, 'Additional Sauce', 'Additional Sauce/Flavor', 30, 1),
(13, 6, 'Creamy Cheese Dip', 'Creamy Cheese Dip', 30, 1),
(14, 6, 'Garlic Mayo Dip', 'Garlic Mayo Dip', 30, 1),
(15, 6, 'Rice', 'Extra Rice', 30, 1),
(16, 7, 'Bottomless Juice', 'Bottomless Juice', 65, 1),
(17, 7, '1 Glass Juice', '1 Glass Juice', 55, 1),
(18, 7, 'Soda (In Can)', 'Softdrinks', 60, 1),
(19, 7, 'Pineapple Juice', 'Pineapple Juice', 50, 1),
(20, 7, 'Soda (1.5L)', 'Big Size Softdrinks', 120, 1),
(21, 7, 'San Miguel Light', 'San Miguel Light ', 70, 1),
(22, 7, 'San Miguel Pale Pilsen', 'San Miguel Pale Pilsen', 65, 1),
(23, 7, 'Tsing Tao Beer', 'Tsing Tao Beer(Chinese Beer)', 160, 1),
(24, 7, 'Korean Soju', 'Korean Soju', 160, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'POS System', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(3, 'staff', 'staff', 'de9bf5643eabf80f4a56fda3bbb84483', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

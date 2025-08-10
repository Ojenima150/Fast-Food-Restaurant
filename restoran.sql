-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2025 at 02:35 PM
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
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `adminname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `adminname`, `email`, `password`, `created_at`) VALUES
(1, 'admin.first@gmail.com', 'admin.first@gmail.com', '$2y$10$.Jgvi34XxGBoncW42W2JCulFF/FzVUbqT2vmaCJbjD.nxJh3l.XSa', '2025-08-06 10:34:36'),
(11, 'ojenima', 'ojenimapass@gmail.com', '$2y$10$f8zR.zoo5YAP/uhjW2ENIOIVbcdtYCyoPcGS.mxk0KLtRMUPCN2AO', '2025-08-07 08:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `date_booking` varchar(200) NOT NULL,
  `num_people` int(10) NOT NULL,
  `special_request` text NOT NULL,
  `status` varchar(200) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `email`, `date_booking`, `num_people`, `special_request`, `status`, `user_id`, `created_at`) VALUES
(3, 'rapheal', 'ojeni50@yahoo.com', '09/05/2025 8:12 AM', 2, 'okay i am coming', 'Confirmed', 35, '2025-08-05 23:20:06'),
(4, 'rapheal', 'admin.first@gmail.com', '08/08/2025 7:03 AM', 1, 'cjhdcdjmcwklvkrlfvkr', 'Confirmed', 36, '2025-08-07 14:04:05'),
(5, 'sample foodsp', 'admin.first@gmail.com', '08/09/2025 2:21 AM', 1, 'goo', 'Pending', 36, '2025-08-08 09:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `price` varchar(10) NOT NULL,
  `image` varchar(200) NOT NULL,
  `user_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `item_id`, `name`, `price`, `image`, `user_id`, `created_at`) VALUES
(22, 1, 'chicken wings ', '10', 'menu-1', 33, '2025-08-04 15:09:55'),
(23, 1, 'chicken wings ', '10', 'menu-1', 34, '2025-08-04 23:35:06'),
(24, 1, 'chicken wings ', '10', 'menu-1', 35, '2025-08-05 21:29:51'),
(26, 8, 'sample foodsp', '120', 'about-4.jpg', 1, '2025-08-08 09:06:10'),
(27, 8, 'sample foodsp', '120', 'about-4.jpg', 36, '2025-08-08 09:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `foods`
--

CREATE TABLE `foods` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(20) NOT NULL,
  `meal_id` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foods`
--

INSERT INTO `foods` (`id`, `name`, `image`, `description`, `price`, `meal_id`, `created_at`) VALUES
(8, 'sample foodsp', 'about-4.jpg', 'hjkdcv,dlcf,e;lcf,e', '120', 1, '2025-08-07 14:22:51'),
(9, 'srollobi', 'menu-6.jpg', 'ggjjklloouy', '230', 1, '2025-08-07 14:29:45'),
(10, 'pizza', 'menu-1.jpg', 'hell very good ', '10', 1, '2025-08-08 09:14:12'),
(11, 'wings', 'menu-2.jpg\r\n', 'good food', '120', 2, '2025-08-08 09:14:38'),
(12, 'sea food', 'menu-3.jpg', 'come and eat the best ', '230', 2, '2025-08-08 09:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `Town` varchar(200) NOT NULL,
  `Country` varchar(200) NOT NULL,
  `Zipcode` int(20) NOT NULL,
  `Phone_number` int(50) NOT NULL,
  `Address` text NOT NULL,
  `total_price` varchar(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'Pending',
  `created_id` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `Town`, `Country`, `Zipcode`, `Phone_number`, `Address`, `total_price`, `user_id`, `status`, `created_id`) VALUES
(8, 'Rapheal man', 'manRaph@gmail.com', 'orgu', 'USA Oakland  ', 2235, 2147483647, 'oghara town', '30', 33, 'Confirmed', '2025-08-04 12:46:22'),
(12, 'rapheal', 'admin.first@gmail.com', 'delta', 'USA', 2235, 2147483647, 'jjfkv,ltpltpltkmjt', '10', 36, 'Confirmed', '2025-08-07 14:03:08'),
(13, 'rapheal', 'admin.first@gmail.com', 'delta state', 'USA', 22356, 2147483647, 'jvbefyjilo[-9p0ugjhffddfewfdwedc', '120', 1, 'Pending', '2025-08-08 09:06:42'),
(14, 'sample foodsp', 'admin.first@gmail.com', 'delta', 'USA', 456, 2147483647, 'oghara', '120', 36, 'Pending', '2025-08-08 09:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) NOT NULL,
  `review` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `review`, `username`, `created_at`) VALUES
(1, 'hello how are you doing today', 'Ojenima Rapheal', '2025-08-05 22:43:46'),
(2, 'hello man love food na', 'Ojenima Rapheal', '2025-08-05 22:46:17'),
(3, 'when you are coming please take a cap alongside', 'Ojenima kssly ', '2025-08-05 22:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(35, 'Ojenima Rapheal', 'ojeni50@gmail.com', '$2y$10$.Jgvi34XxGBoncW42W2JCulFF/FzVUbqT2vmaCJbjD.nxJh3l.XSa', '2025-08-05 12:12:51'),
(36, 'ojenima friday', 'ojenimapass@gmail.com', '$2y$10$FP.9t5exradAQpMEBhOOpOZj7H.SIQpM6QsTCY/0htXqJPriCK8uC', '2025-08-07 08:07:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

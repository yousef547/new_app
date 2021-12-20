-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2021 at 12:49 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `freightage`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_name`, `created_at`, `updated_at`) VALUES
(1, 'giza', NULL, NULL),
(2, 'cairo', NULL, NULL),
(3, 'alex', NULL, NULL),
(4, 'aswan', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_19_201410_create_roles_table', 1),
(6, '2021_12_19_201520_create_cities_table', 1),
(7, '2021_12_19_201552_create_shipments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_title`, `role_description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', NULL, NULL),
(2, 'user', 'user', NULL, NULL),
(3, 'dreiver', 'driver', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `from_city` bigint(20) UNSIGNED NOT NULL,
  `to_city` bigint(20) UNSIGNED NOT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_prod` int(11) NOT NULL,
  `price_Shipping` int(11) NOT NULL,
  `status` enum('accept','not accept') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_date` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`id`, `created_at`, `updated_at`, `userId`, `from_city`, `to_city`, `photo`, `price_prod`, `price_Shipping`, `status`, `received_date`) VALUES
(1, '2021-12-19 21:25:08', '2021-12-19 21:25:08', 11, 1, 2, 'shipping/TDriHtwqbyLwwOVlElMjjvH8NW5F408XUY40ckxt.png', 250, 30, NULL, '2021-12-19 23:25:08'),
(2, NULL, NULL, 11, 4, 2, 'shipping/TDriHtwqbyLwwOVlElMjjvH8NW5F408XUY40ckxt.png', 300, 20, NULL, '1.416036498690037'),
(3, NULL, NULL, 7, 2, 1, 'shipping/TDriHtwqbyLwwOVlElMjjvH8NW5F408XUY40ckxt.png', 500, 50, NULL, '2021-12-19 23:25:08'),
(4, NULL, NULL, 10, 1, 3, 'shipping/TDriHtwqbyLwwOVlElMjjvH8NW5F408XUY40ckxt.png', 350, 20, NULL, '1.416036498690037'),
(5, NULL, NULL, 7, 2, 3, 'shipping/TDriHtwqbyLwwOVlElMjjvH8NW5F408XUY40ckxt.png', 500, 10, NULL, '2021-12-19 23:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roleid` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rolename` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `roleid`, `name`, `rolename`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 2, 'yousef mohamed', 'user', 'youaefmahmed481@gmail.com', NULL, '$2y$10$JiPlz.yLOiyR6EPPaXqaZ.9q5baMW7X5ZGOKBIb4I2ymZOqZbAVpq', NULL, NULL, NULL),
(2, 2, 'yousef mohamed', 'user', 'youaefmahmed4251@gmail.com', NULL, '$2y$10$Jayh.h44pQmQAjFH/a3B9uy.HsLEbXb9oLsGTc7ANYZPOicJYmtFy', NULL, NULL, NULL),
(3, 2, 'yousef mohamed', 'user', 'youaefmahmed51@gmail.com', NULL, '$2y$10$hAE5z/bYm7DrpgJpC.0Qde9woIlG6zCoNF5sU7Qt3Wbx157q8xpBq', NULL, NULL, NULL),
(4, 2, 'yousef mohamed', 'user', 'youaekkfmahmed51@gmail.com', NULL, '$2y$10$6awnwHo8zvnwKAGMPqhqk.wVPD18XuQzH67bfzGc2ILvdzjPTPJF6', NULL, NULL, NULL),
(5, NULL, 'yousef mohamed', NULL, 'youaekkfddmahmed51@gmail.com', NULL, '$2y$10$vG4.5X2Nv5qz5vKwW/Pauu5jmFFHEwbmeXFkPnbyDB6UkT3.onvOO', NULL, '2021-12-19 20:04:33', '2021-12-19 20:04:33'),
(6, NULL, 'yousef mohamed', NULL, 'youaekkfddmahmkdlced51@gmail.com', NULL, '$2y$10$XAEp1yen44T5Mfrr9O.Xk.wkz2WrqEpMlPeci.WIEKbObAo4PP8xy', NULL, '2021-12-19 20:05:11', '2021-12-19 20:05:11'),
(7, 1, 'yousef mohamed', 'admin', 'youaekdlced51@gmail.com', NULL, '$2y$10$BTPne0qN5/xD9rVBMPzJeeNTqKUHocknwUXu8C1ePJgakb1W.Ccc.', NULL, '2021-12-19 20:06:12', '2021-12-19 20:06:12'),
(8, 2, 'yousef mohamed', 'user', 'youaekdlced5115@gmail.com', NULL, '$2y$10$gDkMeW41Y5eFlzBB1gFvTuDgjWAoirtXuoDNDBysrON0itosnP/uy', NULL, '2021-12-19 20:16:29', '2021-12-19 20:16:29'),
(9, 1, 'yousef mohamed', 'admin', 'ahmedd152@gmail.com', NULL, '$2y$10$oquO5NuT2e6WEbAsp4teKOXt5yJx99dZkcr5qHNi066tKzEh/crnG', NULL, '2021-12-19 20:32:30', '2021-12-19 20:32:30'),
(10, 1, 'yousef mohamed', 'driver', 'ahmedsdsdsdd152@gmail.com', NULL, '$2y$10$eMGnQ7Ks.K2Do7B73zeYeuwcAsGQJWsSlYPA7QTidzUE9uDdazOVC', NULL, '2021-12-19 20:34:53', '2021-12-19 20:34:53'),
(11, 2, 'yousef mohamed', 'user', 'ahmed152@gmail.com', NULL, '$2y$10$SppvAoFGE2QUY365dPsReObQRmCqig2C8miBVQoI.lRlfUsYTlYq2', NULL, '2021-12-19 20:37:08', '2021-12-19 20:37:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`),
  ADD KEY `from_city` (`from_city`),
  ADD KEY `to_city` (`to_city`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `role_id` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `shipments_ibfk_2` FOREIGN KEY (`from_city`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `shipments_ibfk_3` FOREIGN KEY (`to_city`) REFERENCES `cities` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 19, 2024 at 01:52 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `business_plan`
--

-- --------------------------------------------------------

--
-- Table structure for table `branchs`
--

DROP TABLE IF EXISTS `branchs`;
CREATE TABLE IF NOT EXISTS `branchs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `branchs`
--

INSERT INTO `branchs` (`id`, `name`, `del`, `created_at`, `updated_at`) VALUES
(1, 'ສຳນັກງານໃຫຍ່', 1, '2024-08-22 01:39:09', '2024-08-22 01:39:09'),
(2, 'ອຸດົມໄຊ', 1, '2024-08-22 01:39:31', '2024-08-22 01:39:31'),
(3, 'ຊຽງຂວາງ', 1, '2024-08-22 01:39:38', '2024-08-22 01:39:38'),
(4, 'ຫຼວງພະບາງ', 1, '2024-08-22 01:39:49', '2024-08-22 01:39:49'),
(5, 'ສະຫວັນນະເຂດ', 1, '2024-08-22 01:39:55', '2024-08-22 01:39:55'),
(6, 'ຈຳປາສັກ', 1, '2024-08-22 01:40:03', '2024-08-22 01:40:03'),
(7, 'ອັດຕະປື', 1, '2024-08-22 01:40:08', '2024-08-22 01:40:08'),
(8, 'ຫົວພັນ', 1, '2024-08-22 01:40:16', '2024-08-22 01:40:16'),
(9, 'ຫຼວງນໍ້າທາ', 1, '2024-08-22 01:40:24', '2024-08-22 01:40:24'),
(10, 'ຜົ້ງສາລີ', 1, '2024-08-22 01:40:32', '2024-08-22 01:40:32'),
(11, 'ໄຊສົມບູນ', 1, '2024-08-22 01:40:44', '2024-08-22 01:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1724654644;', 1724654644),
('5c785c036466adea360111aa28563bfd556b5fba', 'i:1;', 1724654644);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `branch_id`, `name`, `phone`, `del`, `created_at`, `updated_at`) VALUES
(1, 2, 'ສຳນັກງານໃຫຍ່2', NULL, 0, '2024-07-17 20:45:29', '2024-07-17 21:02:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb3_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_list_expan`
--

DROP TABLE IF EXISTS `main_list_expan`;
CREATE TABLE IF NOT EXISTS `main_list_expan` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `main_list_expan`
--

INSERT INTO `main_list_expan` (`id`, `name`, `del`, `created_at`, `updated_at`) VALUES
(1, 'ສຳນັກງານໃຫຍ່132', 0, '2024-08-05 01:29:01', '2024-08-05 01:38:25'),
(2, 'ສຳນັກງານໃຫຍ່', 1, '2024-08-06 20:43:03', '2024-08-06 20:43:03');

-- --------------------------------------------------------

--
-- Table structure for table `main_list_income`
--

DROP TABLE IF EXISTS `main_list_income`;
CREATE TABLE IF NOT EXISTS `main_list_income` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `main_list_income`
--

INSERT INTO `main_list_income` (`id`, `name`, `del`, `created_at`, `updated_at`) VALUES
(1, 'ສຳນັກງານໃຫຍ່132', 0, '2024-08-05 00:45:05', '2024-08-05 00:57:44'),
(2, 'test00', 0, '2024-08-22 21:45:45', '2024-08-29 01:36:49'),
(3, 'ລາຍຮັບໃນທຸລະກິດທະນາຄານ', 1, '2024-08-22 21:46:13', '2024-08-29 20:55:12'),
(4, 'teste', 0, '2024-08-22 21:50:03', '2024-08-22 21:53:52'),
(5, 'teste123', 0, '2024-08-22 21:50:11', '2024-08-22 21:53:11'),
(6, 'ລາຍຮັບສຳຮອງອື່ນໆ', 1, '2024-08-27 20:23:42', '2024-08-29 20:56:14'),
(7, 'ລາຍຮັບບັງເອີນ(ລາຍຮັບພິເສດ)', 1, '2024-08-27 20:24:30', '2024-08-29 20:56:47'),
(8, 'test568', 0, '2024-08-27 20:32:25', '2024-08-29 20:56:51'),
(9, 'test123456879', 0, '2024-08-27 20:32:55', '2024-08-29 20:56:53'),
(10, 'test00000000', 0, '2024-08-27 20:34:17', '2024-08-29 01:36:43'),
(11, '000111000', 0, '2024-08-29 01:41:40', '2024-08-29 01:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '0001_01_01_000000_create_users_table', 11),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(15, '2024_07_16_065113_role_table', 7),
(5, '2024_07_16_065516_create_departments_table', 2),
(6, '2024_07_16_065617_create_branchs_table', 2),
(7, '2024_07_16_065805_create_sectors_table', 2),
(9, '2024_07_17_024434_create_personal_access_tokens_table', 4),
(10, '2024_07_17_071635_create_personal_access_tokens_table', 5),
(18, '2024_07_18_074551_create_main_list_expan_table', 9),
(12, '2024_07_18_074530_create_sub_list_income_table', 6),
(13, '2024_07_18_074546_create_sub_list_expan_table', 6),
(17, '2024_07_18_074524_create_main_list_income_table', 9),
(16, '2024_08_05_022636_create_year_table', 8),
(20, '2024_08_26_031959_create_unit_table', 10),
(22, '2024_09_02_061942_create_report_income_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'API TOKEN', '54b7448c81aed5d6c041a2a5a08f98037175eda1808cc175d2cc005a762154d2', '[\"*\"]', NULL, NULL, '2024-08-02 00:57:35', '2024-08-02 00:57:35'),
(2, 'App\\Models\\User', 1, 'API TOKEN', 'fcda67a468eedb4a4493478049cc864c86ae73b2bf53a3b1c94c8704fc9b084e', '[\"*\"]', NULL, NULL, '2024-08-02 00:59:47', '2024-08-02 00:59:47'),
(3, 'App\\Models\\User', 2, 'API TOKEN', '74feb017819eb8c8e08e7e9f3e389e2b58244bac59383fb2f56b572f41a57321', '[\"*\"]', NULL, NULL, '2024-08-02 01:10:05', '2024-08-02 01:10:05'),
(4, 'App\\Models\\User', 3, 'API TOKEN', 'f2faa5189ddb1900d3fb0d79f7d7be0063000b60bd63096ac479fd5c36822b71', '[\"*\"]', NULL, NULL, '2024-08-02 01:12:46', '2024-08-02 01:12:46'),
(5, 'App\\Models\\User', 4, 'API TOKEN', '5ad60346209e58c80ac9b71d0d87d9531b393a8c4f29052a951cbfac1aafa6eb', '[\"*\"]', NULL, NULL, '2024-08-02 01:13:19', '2024-08-02 01:13:19'),
(6, 'App\\Models\\User', 1, 'API TOKEN', '915350209b687ea0f841fca81eac9120a5ac6ecd66e293d596bae259c81dcc49', '[\"*\"]', NULL, NULL, '2024-08-02 01:18:24', '2024-08-02 01:18:24'),
(7, 'App\\Models\\User', 2, 'API TOKEN', '2674d172bc223bd28fe09b2e45a4a2dc9ab73bf5a54290154dcd30b96a570a69', '[\"*\"]', NULL, NULL, '2024-08-02 01:18:51', '2024-08-02 01:18:51'),
(8, 'App\\Models\\User', 1, 'API TOKEN', '482b5bed2f0256a752b0537f7e19091827d4e410504bbd223cb2c8634050726a', '[\"*\"]', NULL, NULL, '2024-08-19 01:01:11', '2024-08-19 01:01:11'),
(9, 'App\\Models\\User', 3, 'API TOKEN', '3adef3b8351f910193bb6b071421d8a196c9545e56f6f9dc425ecb281e21ca73', '[\"*\"]', NULL, NULL, '2024-08-19 19:20:03', '2024-08-19 19:20:03'),
(10, 'App\\Models\\User', 4, 'API TOKEN', '47b7245d8d30baa858e4ca78a49c1d8413e49a7758067021ea11e7a1db6efaad', '[\"*\"]', NULL, NULL, '2024-08-19 19:26:20', '2024-08-19 19:26:20'),
(11, 'App\\Models\\User', 5, 'API TOKEN', '919ff785a5fc21c8399e4b5307d91fb5c31b6864095c67ce298925723f197f11', '[\"*\"]', NULL, NULL, '2024-08-19 19:27:56', '2024-08-19 19:27:56'),
(12, 'App\\Models\\User', 6, 'API TOKEN', '81b66bbd4df65e9324e062a102c20bab85ea9f59a2420408ae37fbb2e44ad43b', '[\"*\"]', NULL, NULL, '2024-08-19 19:29:52', '2024-08-19 19:29:52'),
(13, 'App\\Models\\User', 7, 'API TOKEN', 'abbbc0aba4e60b4694717622d4f48adc522dcf87e4d8d90e75fe8396be3d0cb8', '[\"*\"]', NULL, NULL, '2024-08-19 19:30:12', '2024-08-19 19:30:12'),
(14, 'App\\Models\\User', 1, 'API TOKEN', 'd937176b9d0e4eeae45005d301d613152e52f5f4c088a3447815d6f0ecdfb1b1', '[\"*\"]', NULL, NULL, '2024-08-19 19:33:06', '2024-08-19 19:33:06'),
(15, 'App\\Models\\User', 1, 'API TOKEN', 'a86aad24934af04868194056bff2ae1dfcc3583e02d87a3605490568758c8d00', '[\"*\"]', NULL, NULL, '2024-08-19 19:33:57', '2024-08-19 19:33:57'),
(16, 'App\\Models\\User', 1, 'API TOKEN', '7f752d65708234e99330133196d71eca75d0bffc25104bb6f6fc826654cef976', '[\"*\"]', NULL, NULL, '2024-08-19 19:35:17', '2024-08-19 19:35:17'),
(17, 'App\\Models\\User', 2, 'API TOKEN', '882e49d5718bc959742784b90e7cd29b74d9712e65912cdd0b5e13954ff64965', '[\"*\"]', NULL, NULL, '2024-08-19 20:30:11', '2024-08-19 20:30:11'),
(18, 'App\\Models\\User', 3, 'API TOKEN', '3626f2a54903d16fe32236b986360778f650546e2596c39d3b7b9eb6956f5700', '[\"*\"]', NULL, NULL, '2024-08-21 01:41:25', '2024-08-21 01:41:25'),
(19, 'App\\Models\\User', 4, 'API TOKEN', 'a81f92d0870fa1cdf07e67d7c45ca55fd36db6cd64f8844365857052d41dc757', '[\"*\"]', NULL, NULL, '2024-08-21 01:42:50', '2024-08-21 01:42:50'),
(20, 'App\\Models\\User', 1, 'API TOKEN', '3f169a36410534163bb13d497104109b458ee89139b2ec4c6faf4d8162417ce1', '[\"*\"]', NULL, NULL, '2024-08-26 00:42:11', '2024-08-26 00:42:11'),
(21, 'App\\Models\\User', 2, 'API TOKEN', '72169603ffc498e1ecf5472350e32075aff57029e8ac53b0b91abe14da3b18d0', '[\"*\"]', NULL, NULL, '2024-08-26 00:42:34', '2024-08-26 00:42:34'),
(22, 'App\\Models\\User', 3, 'API TOKEN', 'b5ce604cebd2eb8abe616250b9889087608a59ce50b1deea306a882d12e91ea1', '[\"*\"]', NULL, NULL, '2024-08-26 01:35:14', '2024-08-26 01:35:14'),
(23, 'App\\Models\\User', 4, 'API TOKEN', 'b39e366480f1b9127e53abf029e3fd8c7a230d192f3bfe84996d18710e7753d8', '[\"*\"]', NULL, NULL, '2024-08-26 01:36:09', '2024-08-26 01:36:09'),
(24, 'App\\Models\\User', 5, 'API TOKEN', '9a5a82e7d26738f1685e0fb4c6f897d6a0816432a80518a687d7ca0c7c3e8ae4', '[\"*\"]', NULL, NULL, '2024-08-26 01:37:52', '2024-08-26 01:37:52'),
(25, 'App\\Models\\User', 6, 'API TOKEN', 'b2aa138d48f25360a6192d74cf7f1b24b786629a32a95a9de6c8aa674b06f7c0', '[\"*\"]', NULL, NULL, '2024-08-26 18:54:57', '2024-08-26 18:54:57');

-- --------------------------------------------------------

--
-- Table structure for table `report_income`
--

DROP TABLE IF EXISTS `report_income`;
CREATE TABLE IF NOT EXISTS `report_income` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `plan_old` decimal(15,2) NOT NULL DEFAULT '0.00',
  `practice_old` decimal(15,2) NOT NULL DEFAULT '0.00',
  `plan_new` decimal(15,2) NOT NULL DEFAULT '0.00',
  `practice_new` decimal(15,2) NOT NULL DEFAULT '0.00',
  `main_id` int NOT NULL,
  `sub_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `del` int NOT NULL DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `del`, `created_at`, `updated_at`) VALUES
(1, 'SuperAdmin', 1, '2024-08-20 00:58:50', '2024-08-20 00:58:50'),
(2, 'Admin', 1, '2024-08-20 01:14:35', '2024-08-20 01:14:35'),
(3, 'Staff', 1, '2024-08-20 01:14:44', '2024-08-29 19:12:19'),
(10, 'Branch_admin', 1, '2024-08-29 19:12:14', '2024-08-29 19:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
CREATE TABLE IF NOT EXISTS `sectors` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `branch_id` int NOT NULL,
  `department_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sectors`
--

INSERT INTO `sectors` (`id`, `branch_id`, `department_id`, `name`, `del`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'staffsss', 0, '2024-07-18 00:36:22', '2024-07-18 00:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb3_unicode_ci,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('wPRj65AR6UG0lDnMgYrami8bcnbYiopBQ0OQ2MvH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGt0anN5ZGVwR25mUTYzQzhmNlBlNGp6TWFKSmlxd2VqVUh5UFp6eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4MC9pbmNvbWVfaW5mbyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1726649975);

-- --------------------------------------------------------

--
-- Table structure for table `sub_list_expan`
--

DROP TABLE IF EXISTS `sub_list_expan`;
CREATE TABLE IF NOT EXISTS `sub_list_expan` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `main_id` int NOT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_list_income`
--

DROP TABLE IF EXISTS `sub_list_income`;
CREATE TABLE IF NOT EXISTS `sub_list_income` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `main_id` int NOT NULL,
  `pair_id` int DEFAULT '0',
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sub_list_income`
--

INSERT INTO `sub_list_income` (`id`, `name`, `main_id`, `pair_id`, `del`, `created_at`, `updated_at`) VALUES
(1, 'ລາຍຮັບດອກເບ້ຍ ແລະ ທີ່ຖືວ່າຄືດອກເບ້ຍ', 3, 0, 1, '2024-08-06 20:59:06', '2024-08-29 20:57:42'),
(2, 'ລາຍຮັບໃນການຊື້ຂາຍຄຳແລະວັດຖຸມີຄ່າອື່ນໆ', 3, 0, 1, '2024-08-29 20:18:33', '2024-08-29 20:58:18'),
(3, 'ລາຍຮັບຈາກສິນເຊື່ອເຊົ່າຊື້ ແລະ ໃຫ້ເຊົ່າໂດຍມີທາງເລືອກຊື້', 3, 0, 1, '2024-08-29 20:20:39', '2024-08-29 20:59:07'),
(4, 'ລາຍຮັບຈາກການໃຫ້ເຊົ່າທຳມະດາ', 3, 0, 1, '2024-08-29 20:29:49', '2024-08-29 21:00:37'),
(5, 'ລາຍຮັບຈາກການປະກອບທຶນ ແລະ ຜູ້ຊື້ຮຸ້ນ', 3, 0, 1, '2024-08-29 21:00:52', '2024-08-29 21:00:52'),
(6, 'ລາຍຮັບຄ່າທໍານຽມ ແລະ ຄ່າບໍລິການທາງດ້ານການເງິນ', 3, 0, 1, '2024-08-29 21:01:03', '2024-08-29 21:01:03'),
(7, 'ລາຍຮັບຈາກການຊື້ຂາຍຫລັກຊັບເພື່ອຄ້າ', 3, 0, 1, '2024-08-29 21:01:12', '2024-08-29 21:01:12'),
(8, 'ລາຍຮັບຈາກການຊື້ຂາຍຫລັກຊັບເພື່ອຂາຍ', 3, 0, 1, '2024-08-29 21:01:23', '2024-08-29 21:01:23'),
(9, 'ລາຍຮັບຈາກການແລກປ່ຽນເງິນຕາຕ່າງປະເທດ', 3, 0, 1, '2024-08-29 21:01:34', '2024-08-29 21:01:34'),
(10, 'ກໍາໄລຫລືຂາດທຶນສຸດທິໃນການຊື້ຂາຍເຄື່ອງມືອະນຸພັນ', 3, 0, 1, '2024-08-29 21:01:46', '2024-08-29 21:01:46'),
(11, 'ລາຍຮັບອື່ນໆໃນທຸລະກິດ', 6, 0, 1, '2024-08-29 21:01:57', '2024-08-29 21:01:57'),
(12, 'ລາຍຮັບເກັບຄືນຄ່າເຊື່ອມມູນຄ່າໜີ້ຕ້ອງຮັບ ແລະ ໜີ້ເກັບຄືນໄດ້', 6, 0, 1, '2024-08-29 21:02:08', '2024-08-29 21:02:08'),
(13, 'ເກັບຄືນຄ່າເຊື່ອມ ແລະ ຈາກການຂາຍຫລືສະສາງ ຊ.ສ.ບ ການເງິນ', 6, 0, 1, '2024-08-29 21:02:19', '2024-08-29 21:02:19'),
(14, 'ລາຍຮັບບັງເອີນ(ພິເສດ)', 7, 0, 1, '2024-08-29 21:02:30', '2024-08-29 21:02:30');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
CREATE TABLE IF NOT EXISTS `unit` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `branch_id` int NOT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id`, `name`, `branch_id`, `del`, `created_at`, `updated_at`) VALUES
(1, 'test123', 1, 1, '2024-08-26 00:31:46', '2024-08-26 01:00:49'),
(2, 'ສັງທອງ', 1, 1, '2024-08-26 00:33:04', '2024-08-26 00:33:04'),
(3, '1', 1, 1, '2024-08-26 00:34:51', '2024-08-26 00:34:51'),
(4, '5', 1, 1, '2024-08-26 00:38:42', '2024-08-26 00:38:42'),
(5, '2', 1, 1, '2024-08-26 00:39:08', '2024-08-26 00:39:08'),
(6, '3', 1, 1, '2024-08-26 00:39:40', '2024-08-26 00:39:40'),
(7, 'ເມືອງເຟືອງ', 1, 1, '2024-08-26 00:48:42', '2024-08-26 00:48:42'),
(8, '4', 2, 1, '2024-08-26 19:20:23', '2024-08-26 19:20:23'),
(9, '1', 3, 1, '2024-08-26 19:22:19', '2024-08-26 19:22:19'),
(10, '1', 2, 1, '2024-08-26 19:22:41', '2024-08-26 19:22:41'),
(11, '10', 1, 1, '2024-08-26 19:24:49', '2024-08-26 19:24:49'),
(12, '1', 11, 1, '2024-08-26 19:48:59', '2024-08-26 19:48:59'),
(13, '1', 6, 1, '2024-08-26 21:46:01', '2024-08-26 21:46:01'),
(14, 'asdadadasds', 1, 1, '2024-09-15 20:15:58', '2024-09-15 20:15:58');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  `role_id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '6',
  `image` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `code`, `name`, `phone`, `email`, `password`, `address`, `branch_id`, `unit_id`, `emp_id`, `role_id`, `image`, `remember_token`, `del`, `created_at`, `updated_at`) VALUES
(1, NULL, 'deth', '123456789', 'deth@gmail.com', '$2y$12$0t5nc5UmxsilVl4JfeIWkuGd10js610vEX8hK2qGuXxmaAtul5ZqG', NULL, 1, 1, NULL, '1', '1', NULL, 1, '2024-08-26 00:42:11', '2024-08-26 00:42:11'),
(2, NULL, 'deth1', '1234561', '1234561', '$2y$12$Zp6fSF56yQrdGkUH0NzE6uZ8nurx9j2baEKjzlLWFNzrl8HFmLOQi', NULL, 1, 1, NULL, '1', '1', NULL, 1, '2024-08-26 00:42:34', '2024-08-26 00:42:34'),
(5, NULL, 'deth123456000000000', '45645465464', '45645465464', '$2y$12$1bO2SHMomUJrMR2n3FTQx.sEpZ7n7POAwNX29283MyHDrYZGlqQvS', NULL, 1, 1, NULL, '1', '1', NULL, 1, '2024-08-26 01:37:52', '2024-08-26 01:37:52'),
(6, NULL, 'deth1234560000', '2313132132132', '2313132132132', '$2y$12$Q3UUDpRVz1b7hMVgNjC2MeYOqNkW868TxmEoe2N0LxOPL4N4wblQq', NULL, 1, 2, NULL, '1', '1', NULL, 1, '2024-08-26 18:54:57', '2024-08-26 18:54:57');

-- --------------------------------------------------------

--
-- Table structure for table `year`
--

DROP TABLE IF EXISTS `year`;
CREATE TABLE IF NOT EXISTS `year` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `del` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `year`
--

INSERT INTO `year` (`id`, `name`, `del`, `created_at`, `updated_at`) VALUES
(1, '2017', 1, '2024-08-04 19:40:43', '2024-08-04 19:51:20'),
(2, '2018', 1, '2024-08-05 00:41:08', '2024-08-05 00:41:08'),
(3, '2019', 1, '2024-08-19 00:38:43', '2024-08-19 00:38:43'),
(4, '2020', 1, '2024-08-19 00:38:49', '2024-08-19 00:38:49'),
(5, '2021', 1, '2024-08-19 00:38:53', '2024-08-19 00:38:53'),
(6, '2022', 1, '2024-08-19 00:38:57', '2024-08-19 00:38:57'),
(7, '2023', 1, '2024-08-19 00:39:03', '2024-08-19 00:39:03'),
(8, '2024', 1, '2024-08-19 00:39:08', '2024-08-19 00:39:08');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for tamlara_db
CREATE DATABASE IF NOT EXISTS `tamlara_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `tamlara_db`;

-- Dumping structure for table tamlara_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tamlara_db.migrations: ~3 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2021_10_21_182044_create_password_resets_table', 1),
	(2, '2021_10_21_182146_create_product_table', 1),
	(3, '2021_10_21_182222_create_users_table', 1);

-- Dumping structure for table tamlara_db.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(4) DEFAULT NULL,
  `is_used` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tamlara_db.password_resets: ~0 rows (approximately)

-- Dumping structure for table tamlara_db.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `qnt` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tamlara_db.product: ~0 rows (approximately)
INSERT INTO `product` (`id`, `name`, `category`, `price`, `qnt`, `created_at`, `updated_at`) VALUES
	(1, 'Canai', '100', '20000', 'Makanan', NULL, NULL);

-- Dumping structure for table tamlara_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `last_login_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `location` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `confirmation_code` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table tamlara_db.users: ~0 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `password`, `last_login_at`, `location`, `gender`, `confirmation_code`, `last_login_ip`, `confirmed`, `status`, `active`, `created_at`, `updated_at`) VALUES
	(1, 'tamrot', 'tama@jawir.co', '$2y$10$AkkRGabH4oAquhEhcHEhdOPlAvEK/f5OpiPdgPCYxGWW6At2AWuei', '2024-07-17 23:50:06', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-07-17 18:20:06', '2024-07-17 18:20:06'),
	(2, 'tamrot nwq', 'tama@jawir.com', '$2y$10$nFsZKelHM6bIxfYuTi4OU.VEjn0x5Fvh/YvGfshXgCyvWRzZZoNtC', '2024-07-17 23:52:15', NULL, NULL, NULL, '127.0.0.1', NULL, NULL, NULL, '2024-07-17 18:22:15', '2024-07-17 18:22:15');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.7.2-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for nashville
CREATE DATABASE IF NOT EXISTS `nashville` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_uca1400_ai_ci */;
USE `nashville`;

-- Dumping structure for table nashville.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.cache: ~0 rows (approximately)
DELETE FROM `cache`;

-- Dumping structure for table nashville.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.cache_locks: ~0 rows (approximately)
DELETE FROM `cache_locks`;

-- Dumping structure for table nashville.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table nashville.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.jobs: ~0 rows (approximately)
DELETE FROM `jobs`;

-- Dumping structure for table nashville.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.job_batches: ~0 rows (approximately)
DELETE FROM `job_batches`;

-- Dumping structure for table nashville.keys
CREATE TABLE IF NOT EXISTS `keys` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `family` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`family`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.keys: ~12 rows (approximately)
DELETE FROM `keys`;
INSERT INTO `keys` (`id`, `key`, `family`) VALUES
	(1, 'C', '{"family": ["C", "Dm", "Em", "F", "G", "Am", "G/B", "Bb"]}'),
	(2, 'C#', '{"family": ["C#", "D#m", "Fm", "F#", "G#", "Bbm", "G#/C", "B"]}'),
	(3, 'D', '{"family": ["D", "Em", "F#m", "G", "A", "Bm", "A/C#", "C"]}'),
	(4, 'D#', '{"family": ["D#", "Fm", "Gm", "G#", "A#", "Cm", "A#/D", "C#"]}'),
	(5, 'E', '{"family": ["E", "F#m", "G#m", "A", "B", "C#m", "B/D#", "D"]}'),
	(6, 'F', '{"family": ["F", "Gm", "Am", "Bb", "C", "Dm", "C/E", "D#"]}'),
	(7, 'F#', '{"family": ["F#", "G#m", "Bbm", "B", "C#", "D#m", "C#/F", "E"]}'),
	(8, 'G', '{"family": ["G", "Am", "Bm", "C", "D", "Em", "D/F#", "F"]}'),
	(9, 'G#', '{"family": ["G#", "Bbm", "Cm", "C#", "D#", "Fm", "D#/G", "F#"]}'),
	(10, 'A', '{"family": ["A", "Bm", "C#m", "D", "E", "F#m", "E/G#", "G"]}'),
	(11, 'Bb', '{"family": ["Bb", "Cm", "Dm", "Eb", "F", "Gm", "F/A", "G#"]}'),
	(12, 'B', '{"family": ["B", "C#m", "D#m", "E", "F#", "G#m", "F#/Bb", "A"]}');

-- Dumping structure for table nashville.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.migrations: ~8 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_04_09_063229_create_songs_table', 1),
	(5, '2025_04_09_080341_create_personal_access_tokens_table', 2),
	(6, '2025_04_11_074132_create_setlist_tables', 3),
	(7, '2025_04_11_074132_create_setlist_table', 4),
	(8, '2025_04_11_074132_create_setlists_table', 5);

-- Dumping structure for table nashville.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table nashville.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table nashville.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.sessions: ~8 rows (approximately)
DELETE FROM `sessions`;
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('B3UUcTKqpaoCe9eci5PRUpahy0ROVIujW0xFWPeg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWUwNFp0MGxCM2tyQXJ1THFhY3FpNUhpRERIRHIyZEpjTzJxNWRISCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9nZXRfc29uZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744185842),
	('ChRTWoH65bILRmo7yMM8emgKdmIYtmvzror8LcTw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDFCOUhtMUI5OU4zWXoyWVpJWGF3eGs1bW5nWmw5SzVKQnlUQTdzQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9nZXRfc29uZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744185434),
	('dIYww3XvX05OVBJuNU8TDF6gJGCMFoOu2UvDZZJ1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVpvd1J4Z280SjNnOXRQZURrY2drZElUakhUUEpPd1ZVSWd3YWhXNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9nZXRfc29uZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744185469),
	('kOXBTo1pQoJHCvTVkI7dOrhKppOSEgdIok5rz9WW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXpEcXZPd1ZBR0lFM1I4V05sQUV3ejFTTEFBcTZtOXk3YmVWRktVOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9nZXRfc29uZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744185842),
	('lsXXvT7JD2A0ewxuyFDkQAVizDB3k5s1Kr2jNFfv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG5VSXoxM0RJOUd6UGxjd2x0MzFSanRvRjFZeDBITDJxT3Q1VjNaWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9nZXRfc29uZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744185469),
	('pnjoSykOKH3SvJNvQcuAAHkYlgW7SVqBlkK8UXy6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEhkNExDemoxbnRKaHBhODI1aGtzQ1lnOG9VazN0cWdKUE0xT1h4RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9nZXRfc29uZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744185780),
	('TIaxLWYZQ0fZFOLC3BfV20cRhhjpzg4CydcxAK0h', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3JmdmY0VTh2TVYxZ1RuVzFvZk5Nb1J3cmhyeEZUeUM0aFZwUUZZWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9nZXRfc29uZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744185780),
	('XgDfVlFh6F6TD4VViP9XC5wMLCQ9vaTZCGeZ9UZS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUYwbzVrNEFNb0lYRWZYMW96OFVWWkVzbUx1VHg4VWhIaGtzMUJEeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9nZXRfc29uZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1744185434);

-- Dumping structure for table nashville.setlists
CREATE TABLE IF NOT EXISTS `setlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `songleader` varchar(255) NOT NULL,
  `songlist` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`songlist`)),
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.setlists: ~2 rows (approximately)
DELETE FROM `setlists`;
INSERT INTO `setlists` (`id`, `songleader`, `songlist`, `date`) VALUES
	(1, 'Lee Tomas - 04/13/2025', '{"lineup": [5, 7, 4, 6]}', '2025-04-13'),
	(2, 'Kevin Yu - 03/30/2025', '{"lineup": [1, 1, 1, 1]}', '2025-03-30');

-- Dumping structure for table nashville.songs
CREATE TABLE IF NOT EXISTS `songs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `key` int(11) NOT NULL,
  `sequence` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`sequence`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.songs: ~7 rows (approximately)
DELETE FROM `songs`;
INSERT INTO `songs` (`id`, `title`, `artist`, `key`, `sequence`, `created_at`, `updated_at`) VALUES
	(1, 'How Great Is Our God', 'Chris Tomlin', 11, '{\r\n	"verse1": {\r\n      "chord1": [1],\r\n      "line1": "The splendor of the King",\r\n      "chord2": [6],\r\n      "line2": "Clothe in majesty",\r\n      "chord3": [4],\r\n      "line3": "Let all the earth rejoice",\r\n      "chord4": [5],\r\n      "line4": "Let all the earth rejoice",\r\n      "chord5": [1],\r\n      "line5": "He wraps Himself in light",\r\n      "chord6": [6],\r\n      "line6": "And darkness tries to hide",\r\n      "chord7": [4],\r\n      "line7": "And trembles at His Voice",\r\n      "chord8": [5],\r\n      "line8": "And trembles at His Voice"\r\n    },\r\n    "verse2": {\r\n	 	"chord1": [1],\r\n      "line1": "Age to age He stands",\r\n      "chord2": [6],\r\n      "line2": "And time is in His Hands",\r\n      "chord3": [4],\r\n      "line3": "Beginning and the end",\r\n      "chord4": [5],\r\n      "line4": "Beginning and the end",\r\n      "chord5": [1],\r\n      "line5": "The Godhead three in one",\r\n      "chord6": [6],\r\n      "line6": "Father, Spirit, Son",\r\n      "chord7": [4],\r\n      "line7": "The Lion and the Lamb",\r\n      "chord8": [5],\r\n      "line8": "The Lion and the Lamb"\r\n	 },\r\n    "chorus": {\r\n    	"chord1": [1],\r\n      "line1": "How great is our God",\r\n      "chord2": [7, 6],\r\n      "line2": "Sing with me how great is our God",\r\n      "chord3": [4],\r\n      "line3": "And all will see how great",\r\n      "chord4": [5],\r\n      "line4": "How great is our God"\r\n	 },\r\n	 "bridge": {\r\n      "chord1": [1],\r\n      "line1": "Name above all names",\r\n      "chord2": [7, 6],\r\n      "line2": "Worthy of all praise",\r\n      "chord3": [4],\r\n      "line3": "And my heart will sing how great",\r\n      "chord4": [5, 1],\r\n      "line4": "How Great is our God"\r\n    }\r\n}', NULL, NULL),
	(2, 'One Way', 'Hillsong Worship', 12, '{\r\n	"verse1": {\r\n      "chord1": [1],\r\n      "line1": "Lay my life down at Your Feet",\r\n      "chord2": [6],\r\n      "line2": "\'Cause You\'re the only One I see",\r\n      "chord3": [5, 4],\r\n      "line3": "I turn to You and You are always there",\r\n      "chord4": [1],\r\n      "line4": "In trouble times its You I seek",\r\n      "chord5": [6],\r\n      "line5": "I put You first, that\'s all I need",\r\n      "chord6": [5, 4],\r\n      "line6": "I humble all I am all to You"\r\n    },\r\n    "verse2": {\r\n	 	"chord1": [1],\r\n      "line1": "You are always, always there",\r\n      "chord2": [6],\r\n      "line2": "Everyhow and everywhere",\r\n      "chord3": [5, 4],\r\n      "line3": "Your Grace abounds so deeply within me",\r\n      "chord4": [1],\r\n      "line4": "You will never ever change",\r\n      "chord5": [6],\r\n      "line5": "Yesterday today the same",\r\n      "chord6": [5, 4],\r\n      "line6": "Forever \'til forever meets no end"\r\n	 },\r\n    "chorus": {\r\n    	"chord1": [1, 5],\r\n      "line1": "One Way, Jesus",\r\n      "chord2": [6, 4],\r\n      "line2": "You\'re the only one that I could live for",\r\n      "chord3": [1, 5],\r\n      "line3": "One way, Jesus",\r\n      "chord4": [8],\r\n      "line4": "You\'re the only one that I could live for"\r\n	 },\r\n	 "bridge": {\r\n      "chord1": [1, 5],\r\n      "line1": "You are the way, the truth and the life",\r\n      "chord2": [6, 4, 6],\r\n      "line2": "We live by faith and not by sight for You",\r\n      "chord3": [5, 4],\r\n      "line3": "We\'re living all for You",\r\n      "chord4": [5, 1]\r\n    }\r\n}', NULL, NULL),
	(3, 'Joy (What the World Calls Foolish)', 'Gateway Worship', 1, '{\r\n	"verse1": {\r\n      "chord1": [5],\r\n      "line1": "Why would I not sing of Your praises",\r\n      "chord2": [4, 1],\r\n      "line2": "Even when troubles come",\r\n      "chord3": [5],\r\n      "line3": "Why would I not worship forever",\r\n      "chord4": [4, 1],\r\n      "line4": "\'Cause I\'ve seen the good You\'ve done"\r\n    },\r\n    "verse2": {\r\n	 	"chord1": [5],\r\n      "line1": "I\'m letting go, I\'m wild in Your presence",\r\n      "chord2": [4, 1],\r\n      "line2": "Dance till the sun comes up",\r\n      "chord3": [5],\r\n      "line3": "You make me strong whenever I praise You",\r\n      "chord4": [4, 1],\r\n      "line4": "Jesus, You fill my cup"\r\n	 },\r\n	 "prechorus": {\r\n	 	"chord1": [2, 6],\r\n	 	"line1": "And I\'m not ashamed, I\'m a sinner saved",\r\n	 	"chord2": [1, 5],\r\n	 	"line2": "No, I\'m not afraid anymore",\r\n	 	"chord3": [2, 6],\r\n	 	"line3": "What the world calls foolish, You call freedom",\r\n	 	"chord4": [1, 5],\r\n	 	"line4": "No, I won\'t hold back anymore"\r\n	 },\r\n    "chorus": {\r\n    	"chord1": [1],\r\n      "line1": "I\'ve got joy in the morning, joy in the evening",\r\n      "chord2": [5],\r\n      "line2": "You keep me dancing in every season",\r\n      "chord3": [2, 6],\r\n      "line3": "Whatever comes tomorrow",\r\n      "chord4": [4],\r\n      "line4": "I\'ve got joy",\r\n      "chord5": [1],\r\n      "line5": "I\'ve got joy in the sunshine, joy in the rain",\r\n      "chord6": [5],\r\n      "line6": "You keep me dancing again and again",\r\n      "chord7": [2, 6],\r\n      "line7": "Whatever comes tomorrow",\r\n      "chord8": [4],\r\n      "line8": "I\'ve got joy"\r\n	 },\r\n	 "bridge": {\r\n      "chord1": [1],\r\n      "line1": "I\'ve got joy, joy, joy down IN my heart",\r\n      "chord2": [8],\r\n      "line2": "I\'ve got joy, joy, joy down IN my heart",\r\n      "chord3": [6],\r\n      "line3": "I\'ve got joy, joy, joy down IN my heart",\r\n      "chord3": [4],\r\n      "line3": "Hallelujah"\r\n    }\r\n}', NULL, NULL),
	(4, 'See A Victory', 'Elevation Worship', 11, '{\r\n	"intro": {\r\n		"chord1": [6, 4, 1],\r\n                "chord2": [6, 4, 1]\r\n	},\r\n	"verse1": {\r\n      "chord1": [6, 4, 1],\r\n      "line1": "The weapon may be formed, but it won\'t prosper",\r\n      "chord2": [6, 4, 1],\r\n      "line2": "When the darkness falls, it won\'t prevail",\r\n      "chord3": [6, 4, 1],\r\n      "line3": "\'Cause the God I serve knows only how to triumph",\r\n      "chord4": [6, 4, 1],\r\n      "line4": "My God will never fail",\r\n      "chord5": [6, 4, 1],\r\n      "line5": "Oh, my God will never fail"\r\n    },\r\n    "verse2": {\r\n      "chord1": [6, 4, 1],\r\n      "line1": "There\'s power in the mighty Name of Jesus",\r\n      "chord2": [6, 4, 1],\r\n      "line2": "Every war He wages He will win",\r\n      "chord3": [6, 4, 1],\r\n      "line3": "I\'m not backing down from any giants",\r\n      "chord4": [6, 4, 1],\r\n      "line4": "\'Cause I know how this story ends",\r\n      "chord5": [6, 4, 1],\r\n      "line5": "Yes, I know how this story ends"\r\n	 },\r\n    "chorus": {\r\n	 	"chord1": [6],\r\n      "line1": "I\'m gonna see a victory",\r\n      "chord2": [4],\r\n      "line2": "I\'m gonna see a victory",\r\n      "chord3": [1, 5],\r\n      "line3": "For the battle belongs to You, Lord"\r\n	 },\r\n	 "interlude": {\r\n	 	"chord1": [4, 6, 5, 3]\r\n	 },\r\n	 "bridge": {\r\n      "chord1": [4, 6, 5],\r\n      "line1": "You take what the enemy meant for evil",\r\n      "chord2": [3, 1],\r\n      "line2": "And You turn it for good",\r\n      "chord3": [6, 5],\r\n      "line3": "You turn it for good"\r\n    }\r\n}', NULL, NULL),
	(5, 'Hosanna', 'Paul Baloche', 8, '{\r\n	"intro": {\r\n		"chord1": [1]\r\n	},\r\n	"verse1": {\r\n      "chord1": [1, 4],\r\n      "line1": "Praise is rising, eyes are turning to You",\r\n      "chord2": [1],\r\n      "line2": "We turn to You",\r\n      "chord3": [1, 4],\r\n      "line3": "Hope is stirring, hearts are yearning for You",\r\n      "chord4": [1],\r\n      "line4": "We long for You"\r\n    },\r\n    "verse2": {\r\n      "chord1": [1, 4],\r\n      "line1": "Hear the sound of hearts returning to You",\r\n      "chord2": [1],\r\n      "line2": "We turn to You",\r\n      "chord3": [1, 4],\r\n      "line3": "In Your Kingdom broken lives are made new",\r\n      "chord4": [1],\r\n      "line4": "You make us new"\r\n	 },\r\n	 "prechorus": {\r\n	 	"chord1": [5],\r\n      "line1": "When we see You",\r\n      "chord2": [4, 1],\r\n      "line2": "We find strength to face the day",\r\n      "chord3": [5],\r\n      "line3": "In Your Presence",\r\n      "chord4": [4, 1, 5],\r\n      "line4": "All our fears are washed away, washed away"\r\n	 },\r\n    "chorus": {\r\n	 	"chord1": [1],\r\n      "line1": "Hosanna",\r\n      "chord2": [6, 4],\r\n      "line2": "Hosanna",\r\n      "chord3": [1, 5],\r\n      "line3": "You are the God who saves us",\r\n      "chord4": [6, 4],\r\n      "line4": "Worthy of all our praises",\r\n      "chord5": [1],\r\n      "line5": "Hosanna",\r\n      "chord6": [6, 4],\r\n      "line6": "Hosanna",\r\n      "chord7": [1, 5],\r\n      "line7": "Come have Your way among us",\r\n      "chord8": [6, 4],\r\n      "line8": "We welcome You here, Lord Jesus"\r\n	 },\r\n	 "interlude": {\r\n	 	"chord1": [1, 5, 6, 4]\r\n	 }\r\n}', NULL, NULL),
	(6, 'You are God Alone', 'Phillips, Craig, and Dean', 1, '{\r\n	"intro": {\r\n		"chord1": [1]\r\n	},\r\n	"verse1": {\r\n      "chord1": [1, 4],\r\n      "line1": "You are not a God created by human hands",\r\n      "chord2": [1, 4],\r\n      "line2": "You are not a God dependent on any mortal man",\r\n      "chord3": [1, 5, 6, 4],\r\n      "line3": "You are not a God in need of anything we can give",\r\n      "chord4": [1, 5, 4],\r\n      "line4": "By Your plan, that\'s just the way it is"\r\n    },\r\n    "verse2": {\r\n      "chord1": [1, 4],\r\n      "line1": "You\'re the only God whose power none can contend",\r\n      "chord2": [1, 4],\r\n      "line2": "You\'re the only God whose name and praise will never end",\r\n      "chord3": [1, 5, 6, 4],\r\n      "line3": "You\'re the only God who\'s worthy of everything we can give",\r\n      "chord4": [1, 5, 4],\r\n      "line4": "You are God, that\'s just the way it is"\r\n	 },\r\n    "chorus": {\r\n	 	"chord1": [1],\r\n      "line1": "You are Gode alone",\r\n      "chord2": [5],\r\n      "line2": "From before time began",\r\n      "chord3": [6],\r\n      "line3": "You are on Your throne",\r\n      "chord4": [4],\r\n      "line4": "You are God alone",\r\n      "chord5": [1],\r\n      "line5": "And right now",\r\n      "chord6": [5],\r\n      "line6": "In the good times and bad",\r\n      "chord7": [6],\r\n      "line7": "You are on Your throne",\r\n      "chord8": [4],\r\n      "line8": "You are God alone"\r\n	 },\r\n	 "bridge": {\r\n	 	"chord1": [1],\r\n	 	"line1": "Unchangeable",\r\n	 	"chord2": [5],\r\n	 	"line2": "Unshakable",\r\n	 	"chord3": [6],\r\n	 	"line3": "Unstoppable",\r\n	 	"chord4": [4],\r\n	 	"line4": "That\'s what You are"\r\n	 }\r\n}', NULL, NULL),
	(7, 'God is Here', 'Darlene Zschech', 3, '{\r\n	"intro": {\r\n		"chord1": [1]\r\n	},\r\n	"verse1": {\r\n      "chord1": [1],\r\n      "line1": "Open our eyes, Lord",\r\n      "chord2": [4, 1],\r\n      "line2": "We want to see You",\r\n      "chord3": [5],\r\n      "line3": "Open our hearts, Lord",\r\n      "chord4": [4, 2],\r\n      "line4": "We want to know You",\r\n      "chord5": [1],\r\n      "line5": "Open our ears, Lord",\r\n      "chord6": [4, 1],\r\n      "line6": "We need to hear You",\r\n      "chord7": [5],\r\n      "line7": "Jesus be revealed",\r\n      "chord8": [4],\r\n      "line8": "Jesus be revealed"\r\n    },\r\n    "verse2": {\r\n      "chord1": [1],\r\n      "line1": "Open the gates, Lord",\r\n      "chord2": [4, 1],\r\n      "line2": "Reveal Your Glory",\r\n      "chord3": [5],\r\n      "line3": "Open the nations",\r\n      "chord4": [4, 2],\r\n      "line4": "Establish Your Kingdom",\r\n      "chord5": [1],\r\n      "line5": "Open the heavens",\r\n      "chord6": [4, 1],\r\n      "line6": "Pour out Your Spirit",\r\n      "chord7": [5],\r\n      "line7": "Jesus be revealed",\r\n      "chord8": [4],\r\n      "line8": "Jesus be revealed"\r\n	 },\r\n    "chorus": {\r\n	 	"chord1": [1],\r\n      "line1": "God is here",\r\n      "chord2": [5],\r\n      "line2": "God is here",\r\n      "chord3": [6, 4],\r\n      "line3": "God is here, He is able",\r\n      "chord4": [1],\r\n      "line4": "We draw near",\r\n      "chord5": [4, 6, 5],\r\n      "line5": "To see Jesus face to face",\r\n      "chord6": [1],\r\n      "line6": "God is here",\r\n      "chord7": [5],\r\n      "line7": "God is here",\r\n      "chord8": [6, 1],\r\n      "line8": "God is here, He is faithful",\r\n      "chord9": [3],\r\n      "line9": "We draw near",\r\n      "chord10": [6],\r\n      "line10": "To see Jesus",\r\n      "chord11": [4, 1],\r\n      "line11": "Oh, Jesus be revealed"\r\n	 },\r\n	 "interlude": {\r\n	 	"chord1": [4, 6, 2, 5]\r\n	 },\r\n	 "bridge": {\r\n	 	"chord1": [4],\r\n	 	"line1": "Holy",\r\n	 	"chord2": [6],\r\n	 	"line2": "We cry Holy",\r\n	 	"chord3": [2, 5],\r\n	 	"line3": "Hallelujah, God is here"\r\n	 }\r\n}', NULL, NULL);

-- Dumping structure for table nashville.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table nashville.users: ~0 rows (approximately)
DELETE FROM `users`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2025 at 01:41 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multivendor`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(255) NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `shop_id`, `created_at`, `updated_at`) VALUES
(1, 'consequuntur dolores', 'consequuntur-dolores', NULL, '2024-11-04 00:35:41', '2024-11-04 00:35:41'),
(2, 'doloremque explicabo', 'doloremque-explicabo', NULL, '2024-11-04 00:35:41', '2024-11-04 00:35:41'),
(3, 'praesentium ad', 'praesentium-ad', NULL, '2024-11-04 00:35:41', '2024-11-04 00:35:41'),
(4, 'voluptates aperiam', 'voluptates-aperiam', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(5, 'pariatur quae', 'pariatur-quae', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(6, 'distinctio aut', 'distinctio-aut', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(7, 'culpa dolor', 'culpa-dolor', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(8, 'unde temporibus', 'unde-temporibus', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(9, 'in dolorem', 'in-dolorem', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(10, 'sapiente qui', 'sapiente-qui', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(11, 'nemo itaque', 'nemo-itaque', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(12, 'qui assumenda', 'qui-assumenda', NULL, '2024-11-04 00:35:42', '2024-11-04 00:35:42'),
(13, 'ullam tempore', 'ullam-tempore', NULL, '2024-11-04 01:09:40', '2024-11-04 01:09:40'),
(14, 'quaerat velit', 'quaerat-velit', NULL, '2024-11-04 01:09:40', '2024-11-04 01:09:40'),
(15, 'beatae odio', 'beatae-odio', NULL, '2024-11-04 01:09:40', '2024-11-04 01:09:40'),
(16, 'ad optio', 'ad-optio', NULL, '2024-11-04 01:09:40', '2024-11-04 01:09:40'),
(17, 'laboriosam quo', 'laboriosam-quo', NULL, '2024-11-04 01:09:40', '2024-11-04 01:09:40'),
(18, 'at sit', 'at-sit', NULL, '2024-11-04 01:09:40', '2024-11-04 01:09:40'),
(19, 'aut aliquam', 'aut-aliquam', NULL, '2024-11-04 01:09:40', '2024-11-04 01:09:40'),
(20, 'eius repudiandae', 'eius-repudiandae', NULL, '2024-11-04 01:09:41', '2024-11-04 01:09:41'),
(21, 'illo dolor', 'illo-dolor', NULL, '2024-11-04 01:09:41', '2024-11-04 01:09:41'),
(22, 'sed vero', 'sed-vero', NULL, '2024-11-04 01:09:41', '2024-11-04 01:09:41'),
(23, 'eum vero', 'eum-vero', NULL, '2024-11-04 01:09:41', '2024-11-04 01:09:41'),
(24, 'molestiae sed', 'molestiae-sed', NULL, '2024-11-04 01:09:41', '2024-11-04 01:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `commisions`
--

CREATE TABLE `commisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commisions`
--

INSERT INTO `commisions` (`id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'approved', '2024-11-04 02:29:08', '2024-11-04 02:29:08');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `comment`, `created_at`, `updated_at`) VALUES
(1, 'Abdirizak Mohamoud Nour', 'tigey55@gmail.com', '01777660120', 'ryy7rksy', '2024-11-17 03:46:36', '2024-11-17 03:46:36'),
(2, 'Abdirizak Mohamoud Nour', 'tigey55@gmail.com', '01777660120', 'ryy7rksy', '2024-11-17 03:46:39', '2024-11-17 03:46:39'),
(3, 'Abdirizak Mohamoud Nour', 'tigey55@gmail.com', '01777660120', 'ryy7rksy', '2024-11-17 03:46:40', '2024-11-17 03:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('fixed','percent') NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expiry_date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `cart_value`, `shop_id`, `expiry_date`, `created_at`, `updated_at`) VALUES
(1, 'off5%', 'percent', 5.00, 234.00, 24, '2024-11-25', '2024-11-18 03:48:49', '2024-11-18 03:48:49');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, '1,2,3,4,5', 8, NULL, '2024-11-04 01:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_sliders`
--

INSERT INTO `home_sliders` (`id`, `title`, `subtitle`, `price`, `link`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '', '', '60', 'http://127.0.0.1:8000/product/nesciunt-quisquam-numquam-eligendi', '1730705327.jpg', 1, '2024-11-04 01:28:47', '2024-11-04 01:30:25'),
(2, '', '', '60', 'http://127.0.0.1:8000/product/nesciunt-quisquam-numquam-eligendi', '1730705466.jpg', 1, '2024-11-04 01:31:06', '2024-11-04 01:31:26'),
(3, ' huhul', 'huhl', '55', 'http://127.0.0.1:8000/product/et-ut-beatae-voluptatibus#', '1731837058.jpg', 0, '2024-11-17 03:50:58', '2024-11-17 03:50:58'),
(4, 'saliid', 'saliido', '400', 'http://127.0.0.1:8000/product/hic-enim-iste-fuga', '1731923777.jpg', 1, '2024-11-18 03:56:17', '2024-11-18 03:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_03_11_051004_create_sessions_table', 1),
(7, '2022_03_15_053842_create_commisions_table', 1),
(8, '2022_03_15_053844_create_shop_sellers_table', 1),
(9, '2022_03_16_015734_create_categories_table', 1),
(10, '2022_03_16_015901_create_products_table', 1),
(11, '2022_04_03_085851_create_home_sliders_table', 1),
(12, '2022_04_04_065417_create_home_categories_table', 1),
(13, '2022_04_05_081130_create_sales_table', 1),
(14, '2022_04_11_083922_create_coupons_table', 1),
(15, '2022_04_14_081343_create_orders_table', 1),
(16, '2022_04_14_081344_add_delivered_canceled_date_to_orders_table', 1),
(17, '2022_04_14_081420_create_order_items_table', 1),
(18, '2022_04_14_081440_create_shippings_table', 1),
(19, '2022_04_14_081455_create_transactions_table', 1),
(20, '2022_04_17_193624_create_reveiws_table', 1),
(21, '2022_04_19_091317_create_contacts_table', 1),
(22, '2022_04_19_150259_create_settings_table', 1),
(23, '2022_04_21_131930_create_shoppingcart_table', 1),
(24, '2022_04_21_155007_create_subcategories_table', 1),
(25, '2022_04_24_084511_create_profiles_table', 1),
(26, '2022_04_25_140138_create_product_attributes_table', 1),
(27, '2022_04_26_064410_create_attribute_values_table', 1),
(28, '2022_04_27_093110_add_options_to_order_items_table', 1),
(29, '2022_04_28_091126_add_subcategory_id_to_products_table', 1),
(30, '2022_09_03_053926_create_sub_orders_table', 1),
(31, '2022_09_03_054655_create_sub_order_items_table', 1),
(32, '2022_09_07_050226_add_product_status_to_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `status` enum('ordered','delivered','canceled') NOT NULL DEFAULT 'ordered',
  `is_shipping_different` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivered_date` date DEFAULT NULL,
  `cancaled_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `subtotal`, `discount`, `tax`, `total`, `firstname`, `lastname`, `mobile`, `email`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `status`, `is_shipping_different`, `created_at`, `updated_at`, `delivered_date`, `cancaled_date`) VALUES
(14, 7, 451.00, 0.00, 94.71, 545.71, 'omarbiin', 'nour', '01777660120', 'admin1@gmail.com', 'israac laamiga', 'fdaadfdii', 'DHAKA', 'DHAKA', 'Bangladesh', '1206', 'ordered', 0, '2025-01-04 12:33:19', '2025-01-04 12:33:19', NULL, NULL),
(15, 7, 142.00, 0.00, 29.82, 171.82, 'omarbiin', 'jio', '01777660120', 'admin1@gmail.com', 'israac laamiga', 'fdaadfdii', 'DHAKA', 'DHAKA', 'Bangladesh', '1206', 'delivered', 0, '2025-01-04 12:35:29', '2025-01-04 12:41:17', '2025-01-05', NULL),
(16, 7, 142.00, 0.00, 29.82, 171.82, 'omarbiin', 'jio', '01777660120', 'admin1@gmail.com', 'israac laamiga', 'fdaadfdii', 'DHAKA', 'DHAKA', 'Bangladesh', '1206', 'ordered', 0, '2025-01-04 12:35:42', '2025-01-04 12:35:42', NULL, NULL),
(17, 7, 142.00, 0.00, 29.82, 171.82, 'omarbiin', 'jio', '01777660120', 'admin1@gmail.com', 'israac laamiga', 'fdaadfdii', 'DHAKA', 'DHAKA', 'Bangladesh', '1206', 'ordered', 0, '2025-01-04 12:36:24', '2025-01-04 12:36:24', NULL, NULL),
(18, 7, 142.00, 0.00, 29.82, 171.82, 'omarbiin', 'jio', '01777660120', 'admin1@gmail.com', 'israac laamiga', 'fdaadfdii', 'DHAKA', 'DHAKA', 'Bangladesh', '1206', 'ordered', 0, '2025-01-04 12:36:44', '2025-01-04 12:36:44', NULL, NULL),
(19, 7, 142.00, 0.00, 29.82, 171.82, 'omarbiin', 'jio', '01777660120', 'admin1@gmail.com', 'israac laamiga', 'fdaadfdii', 'DHAKA', 'DHAKA', 'Bangladesh', '1206', 'delivered', 0, '2025-01-04 12:39:24', '2025-01-17 00:35:00', '2025-01-17', NULL),
(20, 7, 142.00, 0.00, 29.82, 171.82, 'omarbiin', 'jio', '01777660120', 'admin1@gmail.com', 'israac laamiga', 'fdaadfdii', 'DHAKA', 'DHAKA', 'Bangladesh', '1206', 'delivered', 0, '2025-01-04 12:39:41', '2025-01-17 00:34:54', '2025-01-17', NULL),
(21, 9, 282.00, 0.00, 59.22, 341.22, 'cali', 'nour', '01777660120', 'cali@gmail.com', 'israac laamiga', 'fdaadfdii', 'DHAKA', 'DHAKA', 'Bangladesh', '1206', 'delivered', 0, '2025-01-04 12:45:36', '2025-01-17 00:36:31', '2025-01-17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `shop_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `options` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `shop_id`, `price`, `quantity`, `created_at`, `updated_at`, `options`) VALUES
(22, 43, 14, 6, 429.00, 1, '2025-01-04 12:33:20', '2025-01-04 12:33:20', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(23, 45, 14, 6, 22.00, 1, '2025-01-04 12:33:20', '2025-01-04 12:33:20', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(24, 35, 15, 6, 142.00, 1, '2025-01-04 12:35:29', '2025-01-04 12:35:29', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(25, 35, 16, 6, 142.00, 1, '2025-01-04 12:35:42', '2025-01-04 12:35:42', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(26, 35, 17, 6, 142.00, 1, '2025-01-04 12:36:24', '2025-01-04 12:36:24', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(27, 35, 18, 6, 142.00, 1, '2025-01-04 12:36:44', '2025-01-04 12:36:44', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(28, 35, 19, 6, 142.00, 1, '2025-01-04 12:39:24', '2025-01-04 12:39:24', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(29, 35, 20, 6, 142.00, 1, '2025-01-04 12:39:41', '2025-01-04 12:39:41', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(30, 45, 21, 6, 22.00, 1, '2025-01-04 12:45:36', '2025-01-04 12:45:36', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}'),
(31, 36, 21, 6, 260.00, 1, '2025-01-04 12:45:36', '2025-01-04 12:45:36', 'O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) NOT NULL,
  `stock_status` enum('instock','outofstock') NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `status`, `featured`, `quantity`, `image`, `images`, `category_id`, `shop_id`, `created_at`, `updated_at`, `subcategory_id`) VALUES
(1, 'sed harum ut autem', 'sed-harum-ut-autem', 'Aut esse quaerat facere et quo aut. Laudantium hic ut occaecati perferendis voluptas facere. Voluptatem quo amet aut dignissimos.', 'Molestias tempore quidem ut nihil et sint. Cupiditate cupiditate quis cupiditate nobis ratione vel eaque.', 315.00, NULL, '113', 'instock', 'approved', 0, 120, 'digital_20.jpg', NULL, 3, 6, '2024-11-04 00:35:42', '2024-11-19 01:44:22', NULL),
(2, 'hic enim iste fuga', 'hic-enim-iste-fuga', 'Ut inventore sunt et rem sint est veniam quas. Possimus ratione aut aut ullam est ipsa. Eius pariatur sed atque quaerat non libero. Ut dignissimos deserunt nisi quis.', 'Illo quos voluptates incidunt eum. Id quis quisquam omnis excepturi sint molestias. Et eos at aliquam nihil quae enim cum.', 399.00, NULL, '258', 'instock', 'approved', 0, 140, 'digital_6.jpg', NULL, 2, 6, '2024-11-04 00:35:43', '2024-11-18 03:49:36', NULL),
(3, 'ad dolor accusamus sed', 'ad-dolor-accusamus-sed', 'Et asperiores molestias perferendis provident cumque sit occaecati. Earum eos voluptatibus eligendi sed autem. Quia et impedit eum maiores ea labore.', 'Corporis recusandae nihil saepe et nostrum. Nobis fuga aperiam assumenda debitis provident dolores omnis. Quo praesentium ex quisquam quo.', 82.00, NULL, '300', 'instock', 'approved', 0, 133, 'digital_19.jpg', NULL, 2, 6, '2024-11-04 00:35:43', '2024-11-17 03:52:06', NULL),
(35, 'similique optio adipisci vitae', 'similique-optio-adipisci', 'Vero quod at non vel laborum qui quos voluptate. Qui sint sint qui laboriosam. Deserunt provident ut atque recus', 'Sapiente voluptas est corporis. Et commodi quo suscipit qui necessitatibus consequuntur.', 142.00, 138.00, '134', 'instock', 'approved', 0, 134, 'digital_13.jpg', NULL, 3, 6, '2024-11-04 01:09:41', '2024-11-09 04:19:17', NULL),
(36, 'inventore ut ratione commodi', 'inventore-ut-ratione-commodi', 'Porro necessitatibus maiores totam alias rerum a error. Repudiandae necessitatibus omnis labore omnis velit repudiandae nemo totam.', 'Enim labore dolorum blanditiis sed similique alias. Commodi minus corporis possimus explicabo ipsum at. Quisquam expedita perspiciatis enim enim nesciunt dolor ipsa dolor.', 260.00, 255.00, '443', 'instock', 'approved', 0, 138, 'digital_15.jpg', NULL, 3, 6, '2024-11-04 01:09:41', '2024-11-04 01:26:25', NULL),
(37, 'ad qui nam aliquid', 'ad-qui-nam-aliquid', 'Aut vitae qui culpa placeat. Atque mollitia suscipit et adipisci tempore. Illum expedita dicta qui modi voluptates omnis.', 'Error ut officiis sit saepe laudantium et. Vel nihil sunt et deserunt atque molestias quis. Accusamus sed est dolorum. Laborum ut aut vel et consequuntur explicabo.', 486.00, 480.00, '461', 'instock', 'approved', 0, 198, 'digital_3.jpg', NULL, 2, 6, '2024-11-04 01:09:41', '2024-11-04 01:26:10', NULL),
(42, 'omnis esse nemo hic', 'omnis-esse-nemo-hic', 'Incidunt assumenda aut cum praesentium sit omnis fuga. Cupiditate aut qui sequi modi. Dolor est quibusdam praesentium voluptas.', 'Et eligendi sequi culpa error. Consequatur cum rerum sit vitae atque totam. Sed distinctio laborum eveniet consectetur voluptatem velit.', 81.00, 75.00, '348', 'instock', 'approved', 0, 113, 'digital_22.jpg', NULL, 1, 6, '2024-11-04 01:09:42', '2024-11-04 01:24:49', NULL),
(43, 'et ut beatae voluptatibus', 'et-ut-beatae-voluptatibus', 'Sit possimus pariatur cum laudantium animi. Nihil eos magnam molestias error. Eos numquam cupiditate facere omnis ut adipisci. Alias perferendis rem iste ipsa.', 'Ipsum incidunt est magni ut aperiam. Neque error dignissimos perferendis incidunt. Ut deserunt id ipsa odio dolorem nulla fugit. Voluptas architecto vero est magnam animi facilis.', 429.00, 400.00, '309', 'instock', 'approved', 0, 108, 'digital_14.jpg', NULL, 3, 6, '2024-11-04 01:09:42', '2024-11-04 01:24:33', NULL),
(45, 'lol', 'lol', 'dgsgf', 'dsd', 22.00, 22.00, '2232424', 'instock', 'approved', 1, 22, '1731923532.jpg', NULL, 1, 6, '2024-11-18 03:52:12', '2024-11-19 01:44:06', NULL),
(46, 'lol', 'lol2', 'dgsgf', 'dsd', 22.00, 22.00, '2232424', 'instock', 'approved', 1, 22, '1731923601.jpg', ',17319236010.jpg,17319236011.jpg', 1, 6, '2024-11-18 03:53:21', '2024-11-19 01:44:04', NULL),
(48, 'pop', 'pop', 'poposol', 'poposol', 1212.00, 1110.00, '1345', 'instock', 'approved', 1, 9, '1736854943.jpg', ',17368549430.jpg', 17, NULL, '2025-01-14 05:42:23', '2025-01-14 05:53:07', NULL),
(49, 'iphone', 'iphone', 'iphone 15 pro max ', 'one of the best ', 1200.00, 1000.00, '12166', 'instock', 'approved', 1, 3, '1736855023.jpg', ',17368550230.jpg', 12, 6, '2025-01-14 05:43:43', '2025-01-14 05:52:59', NULL),
(50, 'mobile', 'mobile', 'iphone', 'iphone mobile', 800.00, 700.00, '2232', 'instock', 'approved', 0, 22, '1736856360.jpg', NULL, 15, 24, '2025-01-14 06:06:00', '2025-01-14 06:07:56', NULL),
(51, 'ipad air5', 'ipad-air5', 'ipad air 5', 'ipad air 5 10 inch widee ', 550.00, 500.00, '23344', 'instock', 'approved', 1, 1, '1736859301.jpg', NULL, 15, 6, '2025-01-14 06:55:01', '2025-01-14 06:56:36', NULL),
(52, 'ipad air5', 'ipad-air55', 'ipad air 5', 'ipad air 5 10 inch widee ', 550.00, 500.00, '23344', 'instock', 'rejected', 1, 1, '1736859325.jpg', NULL, 1, 6, '2025-01-14 06:55:25', '2025-01-14 06:56:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `name`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 'kawo', '2024-11-10 06:00:56', '2024-11-10 06:00:56', NULL),
(2, 'saaacado', '2024-11-18 00:49:50', '2024-11-18 00:49:50', NULL),
(3, 'saaacado', '2024-11-18 00:49:53', '2024-11-18 00:49:53', NULL),
(4, 'saxarla', '2024-11-18 00:58:28', '2024-11-18 00:58:28', 6),
(5, 'size', '2024-11-18 03:54:37', '2024-11-18 03:54:37', 24),
(6, 'color', '2024-11-18 03:54:46', '2024-11-18 03:54:46', 24),
(7, 'green', '2025-01-14 05:24:01', '2025-01-14 05:24:01', 6);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `line1` varchar(255) DEFAULT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `image`, `mobile`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-04 01:11:00', '2024-11-04 01:11:00'),
(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-04 02:11:34', '2024-11-04 02:11:34'),
(6, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-10 05:55:08', '2024-11-10 05:55:08'),
(7, 7, '1731836673.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-17 03:43:54', '2024-11-17 03:44:33'),
(8, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-18 00:43:13', '2024-11-18 00:43:13'),
(9, 9, '1737116695.jpg', '01777660120', 'israac laamiga', 'fdaadfdii', 'DHAKA', NULL, 'Bangladesh', '1206', '2024-11-18 03:34:23', '2025-01-17 06:24:55'),
(10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-11-18 03:40:31', '2024-11-18 03:40:31');

-- --------------------------------------------------------

--
-- Table structure for table `reveiws`
--

CREATE TABLE `reveiws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `sale_date`, `status`, `created_at`, `updated_at`) VALUES
(1, '2025-04-30 13:23:11', 1, '2024-11-04 07:23:11', '2024-11-18 04:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JDx7Bz5xmYGsbhi2UsvhjtsaK86hY4nLrkIJkdK2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjhSaGhZT3dPT3Rka3h2bGVGR1EyQ1JPSmhCM2ZkdXBmZ3pYbmxnOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1737117672),
('jwOeeOx1m0R5HEWfuNuWre9blH7JfKp36pZQDCph', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiVG9UMmZKaHdrdEVFVVBRY2R5ZTF2UnV6cTV1enBZNlVEMGJRejFUNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aXNobGlzdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czo4OiJ1c2VydHlwZSI7czo2OiJ2ZW5kb3IiO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkd3ZCYWMvL0t6MUpuNGpDTXUuY3VMT2VEQm1NZDBHV2JiajU2cThzb1FOUUpVMzBoczFVOEMiO3M6NDoiY2FydCI7YToyOntzOjQ6ImNhcnQiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fXM6ODoid2lzaGxpc3QiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoyOntzOjg6IgAqAGl0ZW1zIjthOjA6e31zOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7fX19', 1737116761);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `phone2` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `facebokk` varchar(255) NOT NULL,
  `pinterest` varchar(255) NOT NULL,
  `instgram` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('admin@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-04 01:18:47', NULL),
('admin@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-04 01:18:47', NULL),
('admin1@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"bd33e4e24a9444d831df8285f4c15e30\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"bd33e4e24a9444d831df8285f4c15e30\";s:2:\"id\";s:2:\"35\";s:3:\"qty\";i:1;s:4:\"name\";s:30:\"similique optio adipisci vitae\";s:5:\"price\";d:142;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2025-01-17 04:27:02', NULL),
('admin1@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2025-01-17 04:27:02', NULL),
('adminn@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-10 05:55:11', NULL),
('adminn@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-10 05:55:11', NULL),
('cali@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:2:{s:32:\"136831a2175dd50e0ae7b5c9571a2cc7\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"136831a2175dd50e0ae7b5c9571a2cc7\";s:2:\"id\";s:2:\"45\";s:3:\"qty\";i:1;s:4:\"name\";s:3:\"lol\";s:5:\"price\";d:22;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}s:32:\"e983534e9a49dd8b65a80ad8b3c452fc\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"e983534e9a49dd8b65a80ad8b3c452fc\";s:2:\"id\";s:2:\"36\";s:3:\"qty\";i:1;s:4:\"name\";s:28:\"inventore ut ratione commodi\";s:5:\"price\";d:260;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2025-01-04 12:45:19', NULL),
('cali@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2025-01-04 12:45:19', NULL),
('muse@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"13ab6e098dcbd5b9cc23aaa806952b02\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"13ab6e098dcbd5b9cc23aaa806952b02\";s:2:\"id\";s:2:\"39\";s:3:\"qty\";i:1;s:4:\"name\";s:20:\"libero nihil quia ea\";s:5:\"price\";d:70;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-18 04:01:42', NULL),
('muse@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-18 04:01:42', NULL),
('tigay55@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"6b770d0098eb5bc7f6e0a74e3314d4d0\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"6b770d0098eb5bc7f6e0a74e3314d4d0\";s:2:\"id\";s:2:\"38\";s:3:\"qty\";i:1;s:4:\"name\";s:33:\"necessitatibus occaecati illum id\";s:5:\"price\";d:225;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-10 06:05:12', NULL),
('tigay55@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"1ca30d70ab09187def0f79120f1607ee\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"1ca30d70ab09187def0f79120f1607ee\";s:2:\"id\";s:2:\"43\";s:3:\"qty\";i:1;s:4:\"name\";s:25:\"et ut beatae voluptatibus\";s:5:\"price\";d:429;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-10 06:05:12', NULL),
('user@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"6b770d0098eb5bc7f6e0a74e3314d4d0\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"6b770d0098eb5bc7f6e0a74e3314d4d0\";s:2:\"id\";s:2:\"38\";s:3:\"qty\";i:1;s:4:\"name\";s:33:\"necessitatibus occaecati illum id\";s:5:\"price\";d:225;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-18 00:54:41', NULL),
('user@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-18 00:54:41', NULL),
('vendor@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2025-01-17 06:26:01', NULL),
('vendor@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2025-01-17 06:26:01', NULL),
('vendor1@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"6b770d0098eb5bc7f6e0a74e3314d4d0\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"6b770d0098eb5bc7f6e0a74e3314d4d0\";s:2:\"id\";s:2:\"38\";s:3:\"qty\";i:1;s:4:\"name\";s:33:\"necessitatibus occaecati illum id\";s:5:\"price\";d:225;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-18 00:52:44', NULL),
('vendor1@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2024-11-18 00:52:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shop_sellers`
--

CREATE TABLE `shop_sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shop_sellers`
--

INSERT INTO `shop_sellers` (`id`, `name`, `description`, `is_active`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 'Nur\'s Shop', 'Cloths Shop', 1, 3, '2024-11-04 02:28:59', '2024-11-04 02:30:29'),
(24, 'kik', 'kio', 1, 10, '2024-11-18 03:41:03', '2024-11-18 03:45:02');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_orders`
--

CREATE TABLE `sub_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') NOT NULL DEFAULT 'pending',
  `grand_total` varchar(255) NOT NULL,
  `item_count` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_order_items`
--

CREATE TABLE `sub_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `mode` enum('cod','card','paypal') NOT NULL,
  `status` enum('pending','approved','declined','refunded') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 4, 'card', 'approved', '2024-11-04 02:58:39', '2024-11-04 02:58:39'),
(3, 2, 1, 'card', 'approved', '2024-11-04 03:31:26', '2024-11-04 03:31:26'),
(4, 3, 2, 'cod', 'pending', '2024-11-18 03:20:54', '2024-11-18 03:20:54'),
(5, 3, 3, 'cod', 'pending', '2024-11-18 03:27:48', '2024-11-18 03:27:48'),
(6, 3, 4, 'card', 'approved', '2024-11-18 03:29:26', '2024-11-18 03:29:26'),
(7, 7, 5, 'cod', 'pending', '2024-11-27 00:13:03', '2024-11-27 00:13:03'),
(8, 9, 6, 'cod', 'pending', '2024-11-27 00:14:42', '2024-11-27 00:14:42'),
(9, 9, 9, 'card', 'approved', '2024-11-27 00:18:16', '2024-11-27 00:18:16'),
(10, 3, 10, 'cod', 'pending', '2024-12-22 05:54:02', '2024-12-22 05:54:02'),
(11, 9, 11, 'cod', 'pending', '2025-01-04 12:16:39', '2025-01-04 12:16:39'),
(12, 9, 12, 'cod', 'pending', '2025-01-04 12:17:21', '2025-01-04 12:17:21'),
(13, 7, 13, 'cod', 'pending', '2025-01-04 12:25:29', '2025-01-04 12:25:29'),
(14, 7, 14, 'cod', 'pending', '2025-01-04 12:33:20', '2025-01-04 12:33:20'),
(15, 7, 20, 'cod', 'pending', '2025-01-04 12:39:41', '2025-01-04 12:39:41'),
(16, 9, 21, 'cod', 'pending', '2025-01-04 12:45:36', '2025-01-04 12:45:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT 'USR' COMMENT 'USR for users and ADM for Admins',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `usertype`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$wvBac//Kz1Jn4jCMu.cuLOeDBmMd0GWbbj56q8soQNQJU30hs1U8C', NULL, NULL, NULL, NULL, NULL, 'ADM', '2024-11-04 01:11:00', '2024-11-04 01:11:00'),
(3, 'Vendor', 'vendor@gmail.com', NULL, '$2y$10$wvBac//Kz1Jn4jCMu.cuLOeDBmMd0GWbbj56q8soQNQJU30hs1U8C', NULL, NULL, NULL, NULL, NULL, 'vendor', '2024-11-04 02:11:33', '2024-11-04 02:30:44'),
(6, 'moha', 'adminn@gmail.com', NULL, '$2y$10$Qk47G/OAJKnClqBJhW/htu5G6CwODLJFC4ZcTsAEF0Ssm8k2T1gWq', NULL, NULL, NULL, NULL, NULL, 'ADM', '2024-11-10 05:55:08', '2024-11-10 05:55:08'),
(7, 'omarbiin', 'admin1@gmail.com', NULL, '$2y$10$bm2h.dKZ/URdmaRHl/ich.mDxDHSx6pxZnYiG7ZsloQjVQVRjXN46', NULL, NULL, NULL, NULL, NULL, 'ADM', '2024-11-17 03:43:54', '2024-11-17 03:43:54'),
(8, 'abdirizak', 'vendor1@gmail.com', NULL, '$2y$10$wvBac//Kz1Jn4jCMu.cuLOeDBmMd0GWbbj56q8soQNQJU30hs1U8C', NULL, NULL, NULL, NULL, NULL, 'USR', '2024-11-18 00:43:13', '2024-11-18 00:43:13'),
(9, 'abdirizak mohamoud nour ', 'cali@gmail.com', NULL, '$2y$10$XoNZlSSJ0GWlmJ1msRO3E.mL/RFVhBaHtzckk4nxY1.XHaG3mjer6', NULL, NULL, NULL, NULL, NULL, 'USR', '2024-11-18 03:34:22', '2025-01-17 06:24:55'),
(10, 'muse', 'muse@gmail.com', NULL, '$2y$10$cntpR9ZSPQLQzXCEPhnk1uQc82/K2.U4BaKWXa7jMiyavPxTm59P.', NULL, NULL, NULL, NULL, NULL, 'vendor', '2024-11-18 03:40:31', '2024-11-18 03:45:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_values_product_attribute_id_foreign` (`product_attribute_id`),
  ADD KEY `attribute_values_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `commisions`
--
ALTER TABLE `commisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commisions_user_id_foreign` (`user_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sliders`
--
ALTER TABLE `home_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_shop_id_foreign` (`shop_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_shop_id_foreign` (`shop_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `reveiws`
--
ALTER TABLE `reveiws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reveiws_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shippings_order_id_foreign` (`order_id`);

--
-- Indexes for table `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- Indexes for table `shop_sellers`
--
ALTER TABLE `shop_sellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_sellers_user_id_foreign` (`user_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `sub_orders`
--
ALTER TABLE `sub_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_orders_order_id_foreign` (`order_id`),
  ADD KEY `sub_orders_seller_id_foreign` (`seller_id`);

--
-- Indexes for table `sub_order_items`
--
ALTER TABLE `sub_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_order_items_sub_order_id_foreign` (`sub_order_id`),
  ADD KEY `sub_order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `commisions`
--
ALTER TABLE `commisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_sliders`
--
ALTER TABLE `home_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reveiws`
--
ALTER TABLE `reveiws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_sellers`
--
ALTER TABLE `shop_sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_orders`
--
ALTER TABLE `sub_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_order_items`
--
ALTER TABLE `sub_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_product_attribute_id_foreign` FOREIGN KEY (`product_attribute_id`) REFERENCES `product_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shop_sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `commisions`
--
ALTER TABLE `commisions`
  ADD CONSTRAINT `commisions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shop_sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shop_sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shop_sellers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shop_sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reveiws`
--
ALTER TABLE `reveiws`
  ADD CONSTRAINT `reveiws_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`);

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shop_sellers`
--
ALTER TABLE `shop_sellers`
  ADD CONSTRAINT `shop_sellers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_orders`
--
ALTER TABLE `sub_orders`
  ADD CONSTRAINT `sub_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_orders_seller_id_foreign` FOREIGN KEY (`seller_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `sub_order_items`
--
ALTER TABLE `sub_order_items`
  ADD CONSTRAINT `sub_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_order_items_sub_order_id_foreign` FOREIGN KEY (`sub_order_id`) REFERENCES `sub_orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

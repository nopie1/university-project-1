-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2022 at 10:49 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_attribute_id` bigint(20) UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'eos dolore', 'eos-dolore', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(2, 'porro est', 'porro-est', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(3, 'ut veniam', 'ut-veniam', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(4, 'dicta sit', 'dicta-sit', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(5, 'enim qui', 'enim-qui', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(6, 'minima non', 'minima-non', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(7, 'temporibus illo', 'temporibus-illo', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(8, 'et nostrum', 'et-nostrum', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(9, 'saepe placeat', 'saepe-placeat', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(10, 'tempora quia', 'tempora-quia', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(11, 'doloremque sunt', 'doloremque-sunt', '2022-07-25 03:09:04', '2022-07-25 03:09:04'),
(12, 'doloribus ad', 'doloribus-ad', '2022-07-25 03:09:04', '2022-07-25 03:09:04');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `cart_value` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expiry_date` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sel_categories` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_of_products` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `sel_categories`, `no_of_products`, `created_at`, `updated_at`) VALUES
(1, 'eos dolore,porro est,ut veniam', 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `home_sliders`
--

CREATE TABLE `home_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_03_11_051004_create_sessions_table', 1),
(7, '2022_03_16_015734_create_categories_table', 1),
(8, '2022_03_16_015901_create_products_table', 1),
(9, '2022_04_03_085851_create_home_sliders_table', 1),
(10, '2022_04_04_065417_create_home_categories_table', 1),
(11, '2022_04_05_081130_create_sales_table', 1),
(12, '2022_04_11_083922_create_coupons_table', 1),
(13, '2022_04_13_165955_add_expiry_date_to_coupons_table', 1),
(14, '2022_04_14_081343_create_orders_table', 1),
(15, '2022_04_14_081420_create_order_items_table', 1),
(16, '2022_04_14_081440_create_shippings_table', 1),
(17, '2022_04_14_081455_create_transactions_table', 1),
(18, '2022_04_17_110950_add_delivered_canceled_date_to_orders_table', 1),
(19, '2022_04_17_193624_create_reveiws_table', 1),
(20, '2022_04_17_194451_add_rstatus_to_order_items_table', 1),
(21, '2022_04_19_091317_create_contacts_table', 1),
(22, '2022_04_19_150259_create_settings_table', 1),
(23, '2022_04_21_131930_create_shoppingcart_table', 1),
(24, '2022_04_21_155007_create_subcategories_table', 1),
(25, '2022_04_24_084511_create_profiles_table', 1),
(26, '2022_04_25_140138_create_product_attributes_table', 1),
(27, '2022_04_26_064410_create_attribute_values_table', 1),
(28, '2022_04_27_093110_add_options_to_order_items_table', 1),
(29, '2022_04_28_091126_add_subcategory_id_to_products_table', 1);

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
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('ordered','delivered','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ordered',
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
(1, 1, '270.00', '0.00', '56.70', '326.70', 'admin', 'MohamedNour', '01730931984', 'admin@gmail.com', 'Rampura , Banasree B-block 3-Road', 'Rampura , Banasree B-block 3-Road 3-House 6-float', 'Dhaka', 'Rampura, Banasree', 'Bangladesh', '1219', 'ordered', 0, '2022-07-25 05:20:36', '2022-07-25 05:20:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `rstatus` tinyint(1) NOT NULL DEFAULT 0,
  `options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `SKU` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_status` enum('instock','outofstock') COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 10,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `short_description`, `description`, `regular_price`, `sale_price`, `SKU`, `stock_status`, `featured`, `quantity`, `image`, `images`, `category_id`, `created_at`, `updated_at`, `subcategory_id`) VALUES
(1, 'dolor sint expedita dignissimos', 'dolor-sint-expedita-dignissimos', 'Asperiores ea aut consequatur unde voluptas molestiae asperiores. Et quibusdam et mollitia omnis est. Minus quia et veritatis sit voluptas.', 'Quaerat modi quos aperiam et vitae quam quibusdam. Aut dolor sit cupiditate quia accusamus. Est laboriosam illo placeat vel quidem ad distinctio.', '135.00', NULL, '447', 'instock', 0, 10, 'digital_16.jpg', NULL, 4, '2022-07-25 03:09:04', '2022-07-25 03:09:04', NULL),
(2, 'sunt error aspernatur aut', 'sunt-error-aspernatur-aut', 'Blanditiis placeat debitis laborum ut quos odio. Omnis sit beatae eaque nihil. Aspernatur cum adipisci necessitatibus consequatur impedit dolorem architecto doloremque.', 'Doloremque consequuntur aut quia veritatis velit excepturi. Et reiciendis et voluptatem aliquid qui. Expedita aliquid quibusdam sit et deleniti repellat.', '137.00', NULL, '489', 'instock', 0, 181, 'digital_12.jpg', NULL, 1, '2022-07-25 03:09:04', '2022-07-25 03:09:04', NULL),
(3, 'laborum est eaque ut', 'laborum-est-eaque-ut', 'Quia corrupti ad non nostrum. Et quo quod eligendi eaque. Et recusandae ut veniam veniam vero. Vel corporis amet voluptas impedit minus sint non.', 'Nihil id labore qui ullam libero et. Eaque eaque est ut sit est facilis dolore. Quaerat est iusto aut non aut quas. Velit consectetur repudiandae dolores fugiat.', '278.00', NULL, '401', 'instock', 0, 182, 'digital_7.jpg', NULL, 2, '2022-07-25 03:09:04', '2022-07-25 03:09:04', NULL),
(4, 'consequuntur harum nulla totam', 'consequuntur-harum-nulla-totam', 'Et et et exercitationem voluptatem quam eos voluptas. Est iusto tempora asperiores iste hic deserunt. Nesciunt et voluptatem vitae facere. Est eveniet ut qui eveniet.', 'Dolorem voluptatem ut blanditiis quas ex soluta. Amet sapiente saepe nisi qui est enim. Ex fugit aliquam eum aut cumque nobis voluptatem. Facere corporis porro suscipit impedit repudiandae.', '248.00', NULL, '380', 'instock', 0, 116, 'digital_18.jpg', NULL, 5, '2022-07-25 03:09:04', '2022-07-25 03:09:04', NULL),
(5, 'nam nesciunt qui sed', 'nam-nesciunt-qui-sed', 'Aliquid in quia impedit dolorem molestiae doloribus. Enim minima qui culpa quasi eos iste. Et aut quia error maiores. Alias ipsa delectus earum delectus eos.', 'Debitis occaecati iure voluptate cum consequatur soluta. Sunt asperiores accusantium suscipit possimus. Doloremque neque alias molestiae consequatur.', '123.00', NULL, '312', 'instock', 0, 161, 'digital_14.jpg', NULL, 5, '2022-07-25 03:09:04', '2022-07-25 03:09:04', NULL),
(6, 'ut magnam dolor rem', 'ut-magnam-dolor-rem', 'Iure facere qui consequatur porro omnis. Et qui vitae illo adipisci. Rem eos voluptate modi in accusantium. Quasi totam aliquid repudiandae voluptatem nisi.', 'Rerum ea voluptatibus delectus nemo. Iusto odio maxime officia velit. Distinctio qui dolor fuga assumenda officia repellat.', '317.00', NULL, '194', 'instock', 0, 166, 'digital_19.jpg', NULL, 5, '2022-07-25 03:09:04', '2022-07-25 03:09:04', NULL),
(7, 'repellat voluptas perferendis debitis', 'repellat-voluptas-perferendis-debitis', 'Eum incidunt totam earum ducimus est non qui. Similique ipsum sit quia non qui. Eos eum suscipit nihil quis perspiciatis commodi.', 'Repellendus iure facilis aliquam quia culpa asperiores consequatur. Ut id error quasi ea. Ipsa nihil amet laboriosam ipsam. Adipisci dolor dignissimos expedita.', '12.00', NULL, '411', 'instock', 0, 184, 'digital_6.jpg', NULL, 1, '2022-07-25 03:09:04', '2022-07-25 03:09:04', NULL),
(8, 'consequatur eius et qui', 'consequatur-eius-et-qui', 'Id odio autem repellat magnam magnam repellendus non. Sit dignissimos corrupti sunt neque. Tenetur dolores voluptatem rerum dolor qui.', 'In modi provident tenetur qui. Numquam ut accusantium dolores ea. Labore laudantium velit alias minima voluptas est.', '143.00', NULL, '437', 'instock', 0, 167, 'digital_3.jpg', NULL, 3, '2022-07-25 03:09:04', '2022-07-25 03:09:04', NULL),
(9, 'occaecati dignissimos similique autem', 'occaecati-dignissimos-similique-autem', 'Itaque doloribus voluptatem totam sed. Corporis quos est aut. Et velit ut quas dolore. Quo ipsam eligendi odit laudantium perferendis hic et velit.', 'Ullam voluptatum eaque omnis et nesciunt vel. Temporibus officiis non temporibus doloremque fuga dolores. Soluta quo quam ab in voluptate deserunt.', '399.00', NULL, '198', 'instock', 0, 134, 'digital_2.jpg', NULL, 1, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(10, 'quis est quisquam deleniti', 'quis-est-quisquam-deleniti', 'Et distinctio dolorem itaque at ab. Ea velit unde consequuntur nihil sapiente dolor. Esse dicta vitae velit quisquam sunt ut qui. Dolor distinctio ullam qui unde aliquid dolor voluptatibus.', 'Facilis culpa sed est eius voluptatibus suscipit molestias. Totam cupiditate id est placeat. Nihil porro at minus quas maxime quasi quis voluptas.', '231.00', NULL, '246', 'instock', 0, 191, 'digital_4.jpg', NULL, 4, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(11, 'sit ipsam quam ad', 'sit-ipsam-quam-ad', 'Consequatur explicabo voluptatibus saepe facere. Repellat aut reprehenderit optio nisi est minima culpa aperiam.', 'Qui at eos tempora et qui. Nesciunt iste beatae aperiam sequi. Laborum quae et dolorem quam quod officia. Et excepturi asperiores praesentium animi fuga sint quisquam. Magni eius est eum blanditiis.', '317.00', NULL, '350', 'instock', 0, 185, 'digital_1.jpg', NULL, 4, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(12, 'consectetur ea inventore similique', 'consectetur-ea-inventore-similique', 'Aut animi iste est minima a omnis sapiente. Id atque itaque consequuntur sequi. Vel optio necessitatibus culpa provident a. Vero numquam maxime inventore maxime dignissimos recusandae.', 'Qui quis quam amet vel eveniet laudantium voluptatem. Et deserunt soluta consequatur dolores. Quia omnis rerum temporibus rem.', '439.00', NULL, '398', 'instock', 0, 150, 'digital_5.jpg', NULL, 3, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(13, 'iure recusandae qui placeat', 'iure-recusandae-qui-placeat', 'Sint suscipit eum qui consequatur. Laborum odio a labore debitis officia. Saepe quod perferendis rem numquam alias perspiciatis voluptas.', 'Vel sunt distinctio sit ipsam. Explicabo sapiente ut perspiciatis voluptas architecto. Ducimus eius et eius officia.', '232.00', NULL, '388', 'instock', 0, 172, 'digital_9.jpg', NULL, 2, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(14, 'cupiditate dolores hic sunt', 'cupiditate-dolores-hic-sunt', 'Tenetur labore quidem cum pariatur suscipit nam autem. Ipsam commodi ut animi amet alias doloremque.', 'Corporis saepe voluptate tempora dolor omnis. Vel reprehenderit rerum saepe.', '326.00', NULL, '308', 'instock', 0, 135, 'digital_10.jpg', NULL, 2, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(15, 'magnam veniam animi eveniet', 'magnam-veniam-animi-eveniet', 'Ut quisquam ipsam officiis temporibus. Ut quis accusantium quia perspiciatis illum. Dolores aliquam est ut et nostrum quia.', 'Eveniet temporibus ullam quae cupiditate sed provident. Dolores facilis et ut eligendi sed.', '427.00', NULL, '490', 'instock', 0, 12, 'digital_17.jpg', NULL, 4, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(16, 'eaque a eum vero', 'eaque-a-eum-vero', 'Ut ad eveniet modi delectus amet. Voluptates dolor eum ipsam magni. Nihil autem omnis repudiandae nesciunt. Ratione quo rerum odio sapiente ea quas voluptatem excepturi.', 'Vel quod non est voluptatum ut ducimus. Hic nobis et omnis sit corporis incidunt. Soluta impedit placeat quia similique.', '492.00', NULL, '106', 'instock', 0, 167, 'digital_13.jpg', NULL, 1, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(17, 'occaecati nulla aut consequatur', 'occaecati-nulla-aut-consequatur', 'Fugiat rem a fugiat natus placeat. Occaecati unde provident possimus quisquam. Sed in sequi libero culpa facere. Nisi repudiandae debitis in fugiat in tenetur.', 'Pariatur consectetur vel dolor voluptas. Id quas est amet non laborum reprehenderit voluptatem. Dolor sit est at eius ad et fugiat. Ea ipsam officiis voluptas eaque alias et.', '231.00', NULL, '181', 'instock', 0, 157, 'digital_20.jpg', NULL, 1, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(18, 'provident quia dolorem quo', 'provident-quia-dolorem-quo', 'Sit ea aperiam alias sit aut magnam omnis nulla. Culpa sed autem vero est temporibus. Dignissimos cupiditate saepe et.', 'Qui quo pariatur quos et commodi laudantium. Minima tempore laboriosam consequatur ipsa quo. Cupiditate recusandae dicta blanditiis voluptatibus natus sit voluptatem id.', '342.00', NULL, '374', 'instock', 0, 136, 'digital_8.jpg', NULL, 2, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(19, 'dolor veniam in reiciendis', 'dolor-veniam-in-reiciendis', 'Dolorem cupiditate nisi non qui qui. Ut non a ut nesciunt in qui.', 'Nihil dignissimos aspernatur mollitia nobis est. Debitis modi iste at dicta molestiae assumenda voluptatibus. Natus corporis deserunt dolor quidem.', '93.00', NULL, '385', 'instock', 0, 168, 'digital_22.jpg', NULL, 5, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(20, 'temporibus qui vel eum', 'temporibus-qui-vel-eum', 'In laboriosam ratione illo voluptas. Et occaecati nostrum qui. Nihil sed et praesentium est. Dolorem ullam et eveniet delectus non aliquid dignissimos.', 'Quia rerum dolorum sed aliquam aut molestiae aspernatur. Sequi et similique omnis est qui. Autem iusto veniam id nesciunt quibusdam consequatur. Fugiat sed ratione dolor ut impedit repellendus.', '164.00', NULL, '214', 'instock', 0, 153, 'digital_15.jpg', NULL, 4, '2022-07-25 03:09:05', '2022-07-25 03:09:05', NULL),
(21, 'quo suscipit maiores adipisci', 'quo-suscipit-maiores-adipisci', 'Dolorem repellat minima nisi ut odit perferendis quia quibusdam. Atque nihil cum neque aut atque rerum voluptas. Sit mollitia est voluptatem vel.', 'Inventore inventore beatae sunt asperiores quidem et. Sint a ut nihil. Molestiae ratione accusantium aut voluptatem sed et fuga.', '43.00', '40.00', '359', 'instock', 0, 5, 'digital_21.jpg', NULL, 5, '2022-07-25 03:09:05', '2022-07-25 03:42:22', NULL),
(22, 'non est rerum dolores', 'non-est-rerum-dolores', 'Eos eum magnam maiores qui. Neque nulla id beatae adipisci velit consectetur perferendis ducimus.', 'Dignissimos labore soluta perspiciatis ut. Totam perspiciatis ut molestiae amet aspernatur eos molestiae. Magnam ducimus beatae aut.', '258.00', '250.00', '144', 'instock', 0, 166, 'digital_11.jpg', NULL, 3, '2022-07-25 03:09:05', '2022-07-25 03:21:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `image`, `mobile`, `line1`, `line2`, `city`, `province`, `country`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-25 03:11:58', '2022-07-25 03:11:58'),
(2, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-25 03:17:40', '2022-07-25 03:17:40');

-- --------------------------------------------------------

--
-- Table structure for table `reveiws`
--

CREATE TABLE `reveiws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
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
(1, '2022-09-25 00:00:00', 1, NULL, '2022-07-25 03:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('EOeSvogyTsljcPrVeP8FsJxuTALpFHIVWqRCWq6P', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiU2szRmViOGc1Y09RUGVHR2kzQ1BiSjE4NnBLMHpDbVA0b1V4YzFYUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYXJ0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo0OiJjYXJ0IjthOjI6e3M6NDoiY2FydCI7TzoyOToiSWxsdW1pbmF0ZVxTdXBwb3J0XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MDp7fXM6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDt9czoxMjoic2F2ZUZvckxhdGVyIjtPOjI5OiJJbGx1bWluYXRlXFN1cHBvcnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YTowOnt9czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO319fQ==', 1659516438);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebokk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinterest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instgram` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `youtube` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `created_at`, `updated_at`) VALUES
('admin@gmail.com', 'cart', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":9:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";i:1;s:4:\"name\";s:31:\"dolor sint expedita dignissimos\";s:5:\"price\";d:135;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";s:18:\"App\\Models\\Product\";s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0taxRate\";i:21;s:41:\"\0Gloudemans\\Shoppingcart\\CartItem\0isSaved\";b:0;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-07-25 06:46:57', NULL),
('admin@gmail.com', 'wishlist', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', '2022-07-25 06:46:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
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
  `mode` enum('cod','card','paypal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','approved','declined','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'cod', 'pending', '2022-07-25 05:20:36', '2022-07-25 05:20:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usertype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USR' COMMENT 'USR for users and ADM for Admins',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `usertype`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$10$OVQrb5TGC9quHBDuoZhREOZdG7dBNIHjIwUutA.qqJc.LoTY7VYWe', NULL, NULL, NULL, NULL, NULL, 'ADM', '2022-07-25 03:11:58', '2022-07-25 03:11:58'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$Z/oNx/WLFx2muPp6trYdKuek/6.dzd51BMs2uoPTA6D8VovVzbGLa', NULL, NULL, NULL, NULL, NULL, 'USR', '2022-07-25 03:17:40', '2022-07-25 03:17:40');

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
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

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
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

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
  ADD KEY `order_items_order_id_foreign` (`order_id`);

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
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

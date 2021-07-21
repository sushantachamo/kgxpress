-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2021 at 05:21 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techntxw_kgxstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `unique_identifier` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `activated` int(1) NOT NULL DEFAULT 1,
  `image` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_default` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `country`, `city`, `postal_code`, `phone`, `set_default`, `created_at`, `updated_at`) VALUES
(1, 11, 'PCPS College, Nepal Kandevta Sthan, Kupondole', 'Nepal', 'Kathmandu', '46600', '+9779841209394', 0, '2020-11-30 22:22:53', '2020-11-30 22:22:53'),
(2, 9, 'new road', 'Nepal', 'kathmandu', '977', '7410852', 0, '2020-12-01 17:39:06', '2020-12-01 17:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_format` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `name`, `logo`, `currency_id`, `currency_format`, `facebook`, `twitter`, `instagram`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, 'Active eCommerce', 'uploads/logo/matggar.png', 1, 'symbol', 'https://facebook.com', 'https://twitter.com', 'https://instagram.com', 'https://youtube.com', 'https://google.com', '2019-08-04 16:39:15', '2019-08-04 16:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2020-02-24 05:55:07', '2020-02-24 05:55:07'),
(2, 'Fabric', '2020-02-24 05:55:13', '2020-02-24 05:55:13');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 1,
  `published` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `url`, `position`, `published`, `created_at`, `updated_at`) VALUES
(4, 'uploads/banners/qQJCXfGxvr3I30cS5DWh4Yi6TxDyaFpsyr6Bw27k.png', '#', 1, 1, '2019-03-12 05:58:23', '2021-01-12 17:12:59'),
(5, 'uploads/banners/ltvT7p2kE2Mxcl7EPOth6xpS7zpMR3Rj49rvzsbV.png', '#', 1, 1, '2019-03-12 05:58:41', '2021-01-12 17:05:26'),
(6, 'uploads/banners/2I6mcQcalEaoKX8lDyWPmTaWKy1Jd5u3C50kuQWo.webp', '#', 2, 1, '2019-03-12 05:58:52', '2021-01-01 05:33:44'),
(7, 'uploads/banners/yXhk74J5azXLKbhOHWOXMRZtcfU7ie3DD1Pt6J7I.webp', '#', 2, 1, '2019-05-26 05:16:38', '2021-01-01 05:33:58'),
(8, 'uploads/banners/qlzMNruVolAcoA8ZrizH0LQAe6I3oZyoFsRftWoK.webp', '#', 2, 1, '2019-06-11 05:00:06', '2021-01-01 05:34:12'),
(9, 'uploads/banners/FFBRMAJ482QZpgQ9i20Tlv1FKorEP8Qkf1llLrw0.webp', '#', 1, 1, '2019-06-11 05:00:15', '2021-01-01 05:35:39'),
(10, 'uploads/banners/l7eiTAyV6LT2M5guVSzfqhODJlebIjgmYlSEvO2J.webp', '#', 1, 1, '2019-06-11 05:00:24', '2021-01-12 17:26:42'),
(11, 'uploads/banners/5JYnul6Ol0XDbFrOQfDgQy3gYOC3wKBpv68E1VWc.webp', '#', 1, 1, '2021-01-12 17:26:58', '2021-01-16 16:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `top` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `top`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 'Streax', 'uploads/brands/RmLk8Iv0tFVDMAeeGL6JLYatraSSzwMovwFblPyV.png', 1, 'Streax', 'Streax', 'Streax – a brand closely associated with style & glamour, was launched in the year 2004. At a time when hair coloring was just an activity to hide greys, the brand was launched to invoke the style & passion among modern Indian woman and inspired women to find their true self through different shades of hair color.', '2019-03-12 06:05:56', '2020-11-29 21:24:21'),
(2, 'Huggies', 'uploads/brands/NdDoPQZzudC6u10sUZGNEjSTjzpxAXNg6JPyso4j.png', 1, 'Huggies', 'Huggies', 'Huggies® Pull-Ups® is designed specifically for easier potty training, with unique learning features. They feel wet layer and wetness indicator help your Big Kid to learn that dry is best. The look and feel are similar to real underwear, helping kids to progress from nappies and nappy pants with confidence and consistency.', '2019-03-12 06:06:13', '2020-11-30 16:17:08'),
(3, 'Gaia', 'uploads/brands/9TncPoXw2RImoe6cqb6951OYahRxkC9qRIdHlPez.jpeg', 1, 'Gaia-Pg2ZT', 'Gaia', 'gaia logo.', '2020-11-30 20:30:31', '2021-01-16 16:21:39'),
(4, 'Mac coffee', 'uploads/brands/rtnDNULu7WFGRqHwhL7S7pLiGwm4VNDmUYOHolUU.jpeg', 0, 'Mac-coffee-g1ve3', 'Mac coffee', 'this is mac coffee and it is good.', '2020-11-30 21:25:40', '2020-11-30 21:25:40'),
(5, 'Nacho Chips', 'uploads/brands/pVzMvItSmEN5BJj9iawJdKZqqh8fVCxcJLVRl0VB.jpeg', 0, 'Nacho-Chips-Mc9EV', 'Nacho Chips', 'Nacho Chips.', '2020-11-30 21:41:40', '2020-11-30 21:41:40'),
(6, 'Coolberg', 'uploads/brands/M7zBLKeTZvsioam3ltnCA6TgYFqnVyWFYyywpbAY.jpeg', 1, 'Coolberg-xB5fz', 'Coolberg', 'Coolberg', '2020-12-01 15:56:34', '2021-01-16 16:54:24'),
(7, 'Tastee', 'uploads/brands/beD6n5pCvqxmfni8d5i4RqgbST7KXEZ0o8Lr6W5U.jpeg', 0, 'Tastee-89TKY', 'Tastee', 'Tastee.', '2020-12-01 16:24:23', '2020-12-01 16:24:23'),
(8, 'Bhanbhori', 'uploads/brands/J2hsR04cOWMzcXDWEYTgNzOuqg5iMKR4zYS0CBOd.jpeg', 0, 'Bhanbhori-jU78g', 'Bhanbhori', 'Bhanbhori.', '2020-12-01 16:43:20', '2020-12-01 16:43:20'),
(9, 'Ultrex', 'uploads/brands/NB1kpZqFn7nyGBluip4D37pwH4Em1ZVaIDNFudF3.jpeg', 0, 'Ultrex-8hqji', 'Ultrex', 'Ultrex.', '2020-12-01 17:06:07', '2020-12-01 17:06:07'),
(10, 'Coast Milk', 'uploads/brands/gLrmcIqjx8XbECi9U0T2yUoF4W4gnibeUsT5iONA.jpeg', 0, 'Coast-Milk-MmM12', 'Coast Milk', 'Coast Milk.', '2020-12-01 17:16:36', '2020-12-01 17:16:36'),
(11, 'Divella', 'uploads/brands/DbMlbSehmt27QsWnEj25f0fkyL7tMNyHyUKF1XWS.jpeg', 0, 'Divella-e3BaI', 'Divella', 'Divella.', '2020-12-01 17:54:43', '2020-12-01 17:54:43'),
(12, 'Elvan', 'uploads/brands/Z0hsqNZnCawhNuwie2xCvXkrDDa3YinxH9rVXkKJ.jpeg', 0, 'Elvan-eouBW', 'Elvan', 'Elvan.', '2020-12-01 18:38:48', '2020-12-01 18:38:48'),
(13, 'Maxell', 'uploads/brands/QfuQnZMILLPBZNmkqbmvAri97zbwvH5Et6BQRLgL.jpeg', 0, 'Maxell-6Dg59', 'Maxell', 'Maxell.', '2020-12-01 19:01:53', '2020-12-01 19:01:53'),
(14, 'Skinella', 'uploads/brands/fCFgBqlbUFqwM16tzoNNF8dZNSi7RARAnlXenSel.jpeg', 0, 'Skinella-VR9w2', 'Skinella', 'Skinella.', '2020-12-01 19:51:37', '2020-12-01 19:51:37'),
(15, 'Jordon', 'uploads/brands/nIRrl0nPbq4r8WwRMgAsdVwMwZhPkSqzvinPlXcV.jpeg', 0, 'Jordon-tulu0', 'Jordon', 'Jordon.', '2020-12-01 20:45:36', '2020-12-01 20:45:36'),
(16, 'Bajaj', 'uploads/brands/pmkwigMOmBL21kpcCMsQeYoQQHjgjqexkckLcjR6.jpeg', 0, 'Bajaj-drkcU', 'Bajaj', 'Bajaj.', '2020-12-02 16:22:22', '2020-12-02 16:22:22'),
(17, 'Julie\'s', 'uploads/brands/YWA1Z9CzVyGMgyjif1yVFJaaS7YxwvKLTf02mWNz.jpeg', 0, 'Julies-0jucC', 'Julie\'s', 'Julie\'s.', '2020-12-02 17:19:00', '2020-12-02 17:19:00'),
(18, 'Joiner', 'uploads/brands/OsqmcRyjvBe4mC2yq8UeBNocMYYDMMs5dSUc59dv.jpeg', 0, 'Joiner-lJNrO', 'Joiner', 'Joiner.', '2020-12-02 18:02:23', '2020-12-02 18:02:23'),
(19, 'Kent-boringer', 'uploads/brands/DV40byiHndjjG6Rol6GzHOS89McF78GQK4LCw4SY.jpeg', 0, 'Kent-boringer-70sg0', 'Kent-boringer', 'Kent-boringer.', '2020-12-02 18:47:43', '2020-12-02 18:47:43'),
(20, 'BMC', 'uploads/brands/vEYh3kmZH02GTWLVaqBHhQSmGH7LYDfSWPtGtZIb.jpeg', 0, 'BMC-e2wvg', 'BMC', 'BMC.', '2020-12-02 20:07:43', '2020-12-02 20:07:43'),
(21, 'Confectionary', 'uploads/brands/xdqp0XZQjJScNVTgXBVPL25kU4uvJCmsB6Bkrs1p.jpeg', 0, 'Confectionary-3xGWk', 'Confectionary', NULL, '2020-12-02 21:05:00', '2021-01-16 16:54:24'),
(22, 'Adity Peanuts', 'uploads/brands/qQJQnMo2rCCJqdLMxkdguFm5li6wg2lFlGMKB2Ol.jpeg', 0, 'Adity-Peanuts-S01Lp', 'Adity Peanuts', NULL, '2020-12-02 21:20:43', '2020-12-02 21:20:43'),
(23, 'Bizce', 'uploads/brands/YT3Ic03hmwQRx5F5jLuJXM2zXBZo3EwG5bSKqAgh.jpeg', 0, 'Bizce-ybcvV', 'Bizce', NULL, '2020-12-02 21:40:44', '2020-12-02 21:40:44'),
(24, 'Manicurex', 'uploads/brands/u0SC5TrltqdWC9xAF0SKq3itSQarH1rfs9kYXkvY.jpeg', 0, 'Manicurex-tOo1l', 'Manicurex', 'Manicurex', '2020-12-02 21:46:36', '2020-12-02 21:46:36');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'home_default_currency', '28', '2018-10-16 01:35:52', '2020-11-23 20:08:02'),
(2, 'system_default_currency', '28', '2018-10-16 01:36:58', '2020-11-23 20:08:02'),
(3, 'currency_format', '1', '2018-10-17 03:01:59', '2018-10-17 03:01:59'),
(4, 'symbol_format', '1', '2018-10-17 03:01:59', '2019-01-20 02:10:55'),
(5, 'no_of_decimals', '3', '2018-10-17 03:01:59', '2020-03-04 00:57:16'),
(6, 'product_activation', '1', '2018-10-28 01:38:37', '2019-02-04 01:11:41'),
(7, 'vendor_system_activation', '1', '2018-10-28 07:44:16', '2019-02-04 01:11:38'),
(8, 'show_vendors', '1', '2018-10-28 07:44:47', '2019-02-04 01:11:13'),
(9, 'paypal_payment', '0', '2018-10-28 07:45:16', '2019-01-31 05:09:10'),
(10, 'stripe_payment', '0', '2018-10-28 07:45:47', '2018-11-14 01:51:51'),
(11, 'cash_payment', '1', '2018-10-28 07:46:05', '2019-01-24 03:40:18'),
(12, 'payumoney_payment', '0', '2018-10-28 07:46:27', '2019-03-05 05:41:36'),
(13, 'best_selling', '1', '2018-12-24 08:13:44', '2019-02-14 05:29:13'),
(14, 'paypal_sandbox', '0', '2019-01-16 12:44:18', '2019-01-16 12:44:18'),
(15, 'sslcommerz_sandbox', '1', '2019-01-16 12:44:18', '2019-03-14 00:07:26'),
(16, 'sslcommerz_payment', '0', '2019-01-24 09:39:07', '2019-01-29 06:13:46'),
(17, 'vendor_commission', '20', '2019-01-31 06:18:04', '2019-04-13 06:49:26'),
(18, 'verification_form', '[{\"type\":\"text\",\"label\":\"Your name\"},{\"type\":\"text\",\"label\":\"Shop name\"},{\"type\":\"text\",\"label\":\"Email\"},{\"type\":\"text\",\"label\":\"License No\"},{\"type\":\"text\",\"label\":\"Full Address\"},{\"type\":\"text\",\"label\":\"Phone Number\"},{\"type\":\"file\",\"label\":\"Tax Papers\"}]', '2019-02-03 11:36:58', '2019-02-16 06:14:42'),
(19, 'google_analytics', '0', '2019-02-06 12:22:35', '2019-02-06 12:22:35'),
(20, 'facebook_login', '0', '2019-02-07 12:51:59', '2019-02-08 19:41:15'),
(21, 'google_login', '0', '2019-02-07 12:52:10', '2019-02-08 19:41:14'),
(22, 'twitter_login', '0', '2019-02-07 12:52:20', '2019-02-08 02:32:56'),
(23, 'payumoney_payment', '1', '2019-03-05 11:38:17', '2019-03-05 11:38:17'),
(24, 'payumoney_sandbox', '1', '2019-03-05 11:38:17', '2019-03-05 05:39:18'),
(36, 'facebook_chat', '0', '2019-04-15 11:45:04', '2019-04-15 11:45:04'),
(37, 'email_verification', '0', '2019-04-30 07:30:07', '2019-04-30 07:30:07'),
(38, 'wallet_system', '0', '2019-05-19 08:05:44', '2019-05-19 02:11:57'),
(39, 'coupon_system', '0', '2019-06-11 09:46:18', '2019-06-11 09:46:18'),
(40, 'current_version', '3.3', '2019-06-11 09:46:18', '2019-06-11 09:46:18'),
(41, 'instamojo_payment', '0', '2019-07-06 09:58:03', '2019-07-06 09:58:03'),
(42, 'instamojo_sandbox', '1', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(43, 'razorpay', '0', '2019-07-06 09:58:43', '2019-07-06 09:58:43'),
(44, 'paystack', '0', '2019-07-21 13:00:38', '2019-07-21 13:00:38'),
(45, 'pickup_point', '0', '2019-10-17 11:50:39', '2019-10-17 11:50:39'),
(46, 'maintenance_mode', '0', '2019-10-17 11:51:04', '2019-10-17 11:51:04'),
(47, 'voguepay', '0', '2019-10-17 11:51:24', '2019-10-17 11:51:24'),
(48, 'voguepay_sandbox', '0', '2019-10-17 11:51:38', '2019-10-17 11:51:38'),
(50, 'category_wise_commission', '0', '2020-01-21 07:22:47', '2020-01-21 07:22:47'),
(51, 'conversation_system', '1', '2020-01-21 07:23:21', '2020-01-21 07:23:21'),
(52, 'guest_checkout_active', '1', '2020-01-22 07:36:38', '2020-01-22 07:36:38'),
(53, 'facebook_pixel', '0', '2020-01-22 11:43:58', '2020-01-22 11:43:58'),
(55, 'classified_product', '0', '2020-05-13 13:01:05', '2020-05-13 13:01:05'),
(56, 'pos_activation_for_seller', '1', '2020-06-11 09:45:02', '2020-06-11 09:45:02'),
(57, 'shipping_type', 'product_wise_shipping', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(58, 'flat_rate_shipping_cost', '0', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(59, 'shipping_cost_admin', '0', '2020-07-01 13:49:56', '2020-07-01 13:49:56'),
(60, 'payhere_sandbox', '0', '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(61, 'payhere', '0', '2020-07-30 18:23:53', '2020-07-30 18:23:53'),
(62, 'google_recaptcha', '0', '2020-08-17 07:13:37', '2020-08-17 07:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `variation` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `commision_rate` double(8,2) NOT NULL DEFAULT 0.00,
  `banner` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `featured` int(1) NOT NULL DEFAULT 0,
  `top` int(1) NOT NULL DEFAULT 0,
  `digital` int(1) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `commision_rate`, `banner`, `icon`, `featured`, `top`, `digital`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(10, 'Appliances', 0.00, 'uploads/categories/banner/0vZ680fVm3HKrN7GW9OcujnXgYp8HmZODnWSH7gq.svg', 'uploads/categories/icon/RkkIjnJ0IIRoNGQHDntRCdLyfzwBB565aJd3kgak.svg', 1, 1, 0, 'Appliances', 'Appliances', 'this is Appliances', '2021-01-16 16:23:50', '2021-01-16 16:23:50'),
(21, 'Electronics', 0.00, 'uploads/categories/banner/OxvmlMWrBh8dZEwyozviwJAryOUkwW6ZM9bQrMTB.svg', 'uploads/categories/icon/BhN3WSuzuGEkvIUu6w01Nro0tNVKPZWj2PK7Z4Ni.svg', 1, 1, 0, 'Electronics-K3Yaz', 'Electronics', 'this is Electronics', '2021-01-16 16:43:17', '2021-01-16 16:43:17'),
(22, 'Fashion', 0.00, 'uploads/categories/banner/U94V0rPPtJx2IMEpiw1wHtlWyDuAMAVLygeN8au8.svg', 'uploads/categories/icon/d6M487tGDkEhyL0FJpu6OcgvVug7t27kYirkbWNB.svg', 1, 1, 0, 'Fashion-f4HJU', 'Fashion', 'this is Fashion items', '2021-01-16 16:43:17', '2021-01-16 16:43:17'),
(23, 'Fresh Items', 0.00, 'uploads/categories/banner/ute0pKUnjPfnkAejGoJSxFKNGeGbG6DwTn0pZXxj.svg', 'uploads/categories/icon/QuZH6AImERMHxIDu55zD9D9B6iNUC8blkD2u3HhF.svg', 1, 1, 0, 'Fresh-Items-caX4y', 'Fresh Items', 'This is Fresh Items', '2021-01-16 16:43:17', '2021-01-16 16:43:17'),
(24, 'Home Appliances', 0.00, 'uploads/categories/banner/Eq1h41k4LEvlCSOTgbMAWlwpJ5Sg1baz1n6kDgIM.svg', 'uploads/categories/icon/ylsywrErDhSydR9rZAyZEobzIblPIy7BnxvFhzUq.svg', 1, 0, 0, 'Home-Appliances-KKCdo', 'Home Appliances', 'This is Home Appliances', '2021-01-01 08:16:37', '2021-01-01 08:16:37'),
(25, 'Mobiles', 0.00, 'uploads/categories/banner/W7W4LnevkFouHs1vLuywN913ASWDa7J8Gzm77fur.svg', 'uploads/categories/icon/BQmwxVCzBWZrcGg41Ts1xwEqLlWjbpKcdotPGUHU.svg', 1, 0, 0, 'Mobiles-7xNe5', 'This is Mobiles', 'This is Mobiles', '2021-01-01 08:16:35', '2021-01-01 08:16:35'),
(26, 'Pantry', 0.00, 'uploads/categories/banner/fotbpLVfNSJeTPECEoP6FHUjpnVJU2R3DmekzmEx.svg', 'uploads/categories/icon/8jRRCeaJn24UEUSChmXf2032RqrbYMfML3i3odtG.svg', 1, 0, 0, 'Pantry-knoOB', 'Pantry', 'This is Pantry', '2021-01-01 08:16:33', '2021-01-01 08:16:33');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `title` varchar(1000) COLLATE utf32_unicode_ci DEFAULT NULL,
  `sender_viewed` int(1) NOT NULL DEFAULT 1,
  `receiver_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'AF', 'Afghanistan', 1, NULL, NULL),
(2, 'AL', 'Albania', 1, NULL, NULL),
(3, 'DZ', 'Algeria', 1, NULL, NULL),
(4, 'DS', 'American Samoa', 1, NULL, NULL),
(5, 'AD', 'Andorra', 1, NULL, NULL),
(6, 'AO', 'Angola', 1, NULL, NULL),
(7, 'AI', 'Anguilla', 1, NULL, NULL),
(8, 'AQ', 'Antarctica', 1, NULL, NULL),
(9, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(10, 'AR', 'Argentina', 1, NULL, NULL),
(11, 'AM', 'Armenia', 1, NULL, NULL),
(12, 'AW', 'Aruba', 1, NULL, NULL),
(13, 'AU', 'Australia', 1, NULL, NULL),
(14, 'AT', 'Austria', 1, NULL, NULL),
(15, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(16, 'BS', 'Bahamas', 1, NULL, NULL),
(17, 'BH', 'Bahrain', 1, NULL, NULL),
(18, 'BD', 'Bangladesh', 1, NULL, NULL),
(19, 'BB', 'Barbados', 1, NULL, NULL),
(20, 'BY', 'Belarus', 1, NULL, NULL),
(21, 'BE', 'Belgium', 1, NULL, NULL),
(22, 'BZ', 'Belize', 1, NULL, NULL),
(23, 'BJ', 'Benin', 1, NULL, NULL),
(24, 'BM', 'Bermuda', 1, NULL, NULL),
(25, 'BT', 'Bhutan', 1, NULL, NULL),
(26, 'BO', 'Bolivia', 1, NULL, NULL),
(27, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(28, 'BW', 'Botswana', 1, NULL, NULL),
(29, 'BV', 'Bouvet Island', 1, NULL, NULL),
(30, 'BR', 'Brazil', 1, NULL, NULL),
(31, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(32, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(33, 'BG', 'Bulgaria', 1, NULL, NULL),
(34, 'BF', 'Burkina Faso', 1, NULL, NULL),
(35, 'BI', 'Burundi', 1, NULL, NULL),
(36, 'KH', 'Cambodia', 1, NULL, NULL),
(37, 'CM', 'Cameroon', 1, NULL, NULL),
(38, 'CA', 'Canada', 1, NULL, NULL),
(39, 'CV', 'Cape Verde', 1, NULL, NULL),
(40, 'KY', 'Cayman Islands', 1, NULL, NULL),
(41, 'CF', 'Central African Republic', 1, NULL, NULL),
(42, 'TD', 'Chad', 1, NULL, NULL),
(43, 'CL', 'Chile', 1, NULL, NULL),
(44, 'CN', 'China', 1, NULL, NULL),
(45, 'CX', 'Christmas Island', 1, NULL, NULL),
(46, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(47, 'CO', 'Colombia', 1, NULL, NULL),
(48, 'KM', 'Comoros', 1, NULL, NULL),
(49, 'CG', 'Congo', 1, NULL, NULL),
(50, 'CK', 'Cook Islands', 1, NULL, NULL),
(51, 'CR', 'Costa Rica', 1, NULL, NULL),
(52, 'HR', 'Croatia (Hrvatska)', 1, NULL, NULL),
(53, 'CU', 'Cuba', 1, NULL, NULL),
(54, 'CY', 'Cyprus', 1, NULL, NULL),
(55, 'CZ', 'Czech Republic', 1, NULL, NULL),
(56, 'DK', 'Denmark', 1, NULL, NULL),
(57, 'DJ', 'Djibouti', 1, NULL, NULL),
(58, 'DM', 'Dominica', 1, NULL, NULL),
(59, 'DO', 'Dominican Republic', 1, NULL, NULL),
(60, 'TP', 'East Timor', 1, NULL, NULL),
(61, 'EC', 'Ecuador', 1, NULL, NULL),
(62, 'EG', 'Egypt', 1, NULL, NULL),
(63, 'SV', 'El Salvador', 1, NULL, NULL),
(64, 'GQ', 'Equatorial Guinea', 1, NULL, NULL),
(65, 'ER', 'Eritrea', 1, NULL, NULL),
(66, 'EE', 'Estonia', 1, NULL, NULL),
(67, 'ET', 'Ethiopia', 1, NULL, NULL),
(68, 'FK', 'Falkland Islands (Malvinas)', 1, NULL, NULL),
(69, 'FO', 'Faroe Islands', 1, NULL, NULL),
(70, 'FJ', 'Fiji', 1, NULL, NULL),
(71, 'FI', 'Finland', 1, NULL, NULL),
(72, 'FR', 'France', 1, NULL, NULL),
(73, 'FX', 'France, Metropolitan', 1, NULL, NULL),
(74, 'GF', 'French Guiana', 1, NULL, NULL),
(75, 'PF', 'French Polynesia', 1, NULL, NULL),
(76, 'TF', 'French Southern Territories', 1, NULL, NULL),
(77, 'GA', 'Gabon', 1, NULL, NULL),
(78, 'GM', 'Gambia', 1, NULL, NULL),
(79, 'GE', 'Georgia', 1, NULL, NULL),
(80, 'DE', 'Germany', 1, NULL, NULL),
(81, 'GH', 'Ghana', 1, NULL, NULL),
(82, 'GI', 'Gibraltar', 1, NULL, NULL),
(83, 'GK', 'Guernsey', 1, NULL, NULL),
(84, 'GR', 'Greece', 1, NULL, NULL),
(85, 'GL', 'Greenland', 1, NULL, NULL),
(86, 'GD', 'Grenada', 1, NULL, NULL),
(87, 'GP', 'Guadeloupe', 1, NULL, NULL),
(88, 'GU', 'Guam', 1, NULL, NULL),
(89, 'GT', 'Guatemala', 1, NULL, NULL),
(90, 'GN', 'Guinea', 1, NULL, NULL),
(91, 'GW', 'Guinea-Bissau', 1, NULL, NULL),
(92, 'GY', 'Guyana', 1, NULL, NULL),
(93, 'HT', 'Haiti', 1, NULL, NULL),
(94, 'HM', 'Heard and Mc Donald Islands', 1, NULL, NULL),
(95, 'HN', 'Honduras', 1, NULL, NULL),
(96, 'HK', 'Hong Kong', 1, NULL, NULL),
(97, 'HU', 'Hungary', 1, NULL, NULL),
(98, 'IS', 'Iceland', 1, NULL, NULL),
(99, 'IN', 'India', 1, NULL, NULL),
(100, 'IM', 'Isle of Man', 1, NULL, NULL),
(101, 'ID', 'Indonesia', 1, NULL, NULL),
(102, 'IR', 'Iran (Islamic Republic of)', 1, NULL, NULL),
(103, 'IQ', 'Iraq', 1, NULL, NULL),
(104, 'IE', 'Ireland', 1, NULL, NULL),
(105, 'IL', 'Israel', 1, NULL, NULL),
(106, 'IT', 'Italy', 1, NULL, NULL),
(107, 'CI', 'Ivory Coast', 1, NULL, NULL),
(108, 'JE', 'Jersey', 1, NULL, NULL),
(109, 'JM', 'Jamaica', 1, NULL, NULL),
(110, 'JP', 'Japan', 1, NULL, NULL),
(111, 'JO', 'Jordan', 1, NULL, NULL),
(112, 'KZ', 'Kazakhstan', 1, NULL, NULL),
(113, 'KE', 'Kenya', 1, NULL, NULL),
(114, 'KI', 'Kiribati', 1, NULL, NULL),
(115, 'KP', 'Korea, Democratic People\'s Republic of', 1, NULL, NULL),
(116, 'KR', 'Korea, Republic of', 1, NULL, NULL),
(117, 'XK', 'Kosovo', 1, NULL, NULL),
(118, 'KW', 'Kuwait', 1, NULL, NULL),
(119, 'KG', 'Kyrgyzstan', 1, NULL, NULL),
(120, 'LA', 'Lao People\'s Democratic Republic', 1, NULL, NULL),
(121, 'LV', 'Latvia', 1, NULL, NULL),
(122, 'LB', 'Lebanon', 1, NULL, NULL),
(123, 'LS', 'Lesotho', 1, NULL, NULL),
(124, 'LR', 'Liberia', 1, NULL, NULL),
(125, 'LY', 'Libyan Arab Jamahiriya', 1, NULL, NULL),
(126, 'LI', 'Liechtenstein', 1, NULL, NULL),
(127, 'LT', 'Lithuania', 1, NULL, NULL),
(128, 'LU', 'Luxembourg', 1, NULL, NULL),
(129, 'MO', 'Macau', 1, NULL, NULL),
(130, 'MK', 'Macedonia', 1, NULL, NULL),
(131, 'MG', 'Madagascar', 1, NULL, NULL),
(132, 'MW', 'Malawi', 1, NULL, NULL),
(133, 'MY', 'Malaysia', 1, NULL, NULL),
(134, 'MV', 'Maldives', 1, NULL, NULL),
(135, 'ML', 'Mali', 1, NULL, NULL),
(136, 'MT', 'Malta', 1, NULL, NULL),
(137, 'MH', 'Marshall Islands', 1, NULL, NULL),
(138, 'MQ', 'Martinique', 1, NULL, NULL),
(139, 'MR', 'Mauritania', 1, NULL, NULL),
(140, 'MU', 'Mauritius', 1, NULL, NULL),
(141, 'TY', 'Mayotte', 1, NULL, NULL),
(142, 'MX', 'Mexico', 1, NULL, NULL),
(143, 'FM', 'Micronesia, Federated States of', 1, NULL, NULL),
(144, 'MD', 'Moldova, Republic of', 1, NULL, NULL),
(145, 'MC', 'Monaco', 1, NULL, NULL),
(146, 'MN', 'Mongolia', 1, NULL, NULL),
(147, 'ME', 'Montenegro', 1, NULL, NULL),
(148, 'MS', 'Montserrat', 1, NULL, NULL),
(149, 'MA', 'Morocco', 1, NULL, NULL),
(150, 'MZ', 'Mozambique', 1, NULL, NULL),
(151, 'MM', 'Myanmar', 1, NULL, NULL),
(152, 'NA', 'Namibia', 1, NULL, NULL),
(153, 'NR', 'Nauru', 1, NULL, NULL),
(154, 'NP', 'Nepal', 1, NULL, NULL),
(155, 'NL', 'Netherlands', 1, NULL, NULL),
(156, 'AN', 'Netherlands Antilles', 1, NULL, NULL),
(157, 'NC', 'New Caledonia', 1, NULL, NULL),
(158, 'NZ', 'New Zealand', 1, NULL, NULL),
(159, 'NI', 'Nicaragua', 1, NULL, NULL),
(160, 'NE', 'Niger', 1, NULL, NULL),
(161, 'NG', 'Nigeria', 1, NULL, NULL),
(162, 'NU', 'Niue', 1, NULL, NULL),
(163, 'NF', 'Norfolk Island', 1, NULL, NULL),
(164, 'MP', 'Northern Mariana Islands', 1, NULL, NULL),
(165, 'NO', 'Norway', 1, NULL, NULL),
(166, 'OM', 'Oman', 1, NULL, NULL),
(167, 'PK', 'Pakistan', 1, NULL, NULL),
(168, 'PW', 'Palau', 1, NULL, NULL),
(169, 'PS', 'Palestine', 1, NULL, NULL),
(170, 'PA', 'Panama', 1, NULL, NULL),
(171, 'PG', 'Papua New Guinea', 1, NULL, NULL),
(172, 'PY', 'Paraguay', 1, NULL, NULL),
(173, 'PE', 'Peru', 1, NULL, NULL),
(174, 'PH', 'Philippines', 1, NULL, NULL),
(175, 'PN', 'Pitcairn', 1, NULL, NULL),
(176, 'PL', 'Poland', 1, NULL, NULL),
(177, 'PT', 'Portugal', 1, NULL, NULL),
(178, 'PR', 'Puerto Rico', 1, NULL, NULL),
(179, 'QA', 'Qatar', 1, NULL, NULL),
(180, 'RE', 'Reunion', 1, NULL, NULL),
(181, 'RO', 'Romania', 1, NULL, NULL),
(182, 'RU', 'Russian Federation', 1, NULL, NULL),
(183, 'RW', 'Rwanda', 1, NULL, NULL),
(184, 'KN', 'Saint Kitts and Nevis', 1, NULL, NULL),
(185, 'LC', 'Saint Lucia', 1, NULL, NULL),
(186, 'VC', 'Saint Vincent and the Grenadines', 1, NULL, NULL),
(187, 'WS', 'Samoa', 1, NULL, NULL),
(188, 'SM', 'San Marino', 1, NULL, NULL),
(189, 'ST', 'Sao Tome and Principe', 1, NULL, NULL),
(190, 'SA', 'Saudi Arabia', 1, NULL, NULL),
(191, 'SN', 'Senegal', 1, NULL, NULL),
(192, 'RS', 'Serbia', 1, NULL, NULL),
(193, 'SC', 'Seychelles', 1, NULL, NULL),
(194, 'SL', 'Sierra Leone', 1, NULL, NULL),
(195, 'SG', 'Singapore', 1, NULL, NULL),
(196, 'SK', 'Slovakia', 1, NULL, NULL),
(197, 'SI', 'Slovenia', 1, NULL, NULL),
(198, 'SB', 'Solomon Islands', 1, NULL, NULL),
(199, 'SO', 'Somalia', 1, NULL, NULL),
(200, 'ZA', 'South Africa', 1, NULL, NULL),
(201, 'GS', 'South Georgia South Sandwich Islands', 1, NULL, NULL),
(202, 'SS', 'South Sudan', 1, NULL, NULL),
(203, 'ES', 'Spain', 1, NULL, NULL),
(204, 'LK', 'Sri Lanka', 1, NULL, NULL),
(205, 'SH', 'St. Helena', 1, NULL, NULL),
(206, 'PM', 'St. Pierre and Miquelon', 1, NULL, NULL),
(207, 'SD', 'Sudan', 1, NULL, NULL),
(208, 'SR', 'Suriname', 1, NULL, NULL),
(209, 'SJ', 'Svalbard and Jan Mayen Islands', 1, NULL, NULL),
(210, 'SZ', 'Swaziland', 1, NULL, NULL),
(211, 'SE', 'Sweden', 1, NULL, NULL),
(212, 'CH', 'Switzerland', 1, NULL, NULL),
(213, 'SY', 'Syrian Arab Republic', 1, NULL, NULL),
(214, 'TW', 'Taiwan', 1, NULL, NULL),
(215, 'TJ', 'Tajikistan', 1, NULL, NULL),
(216, 'TZ', 'Tanzania, United Republic of', 1, NULL, NULL),
(217, 'TH', 'Thailand', 1, NULL, NULL),
(218, 'TG', 'Togo', 1, NULL, NULL),
(219, 'TK', 'Tokelau', 1, NULL, NULL),
(220, 'TO', 'Tonga', 1, NULL, NULL),
(221, 'TT', 'Trinidad and Tobago', 1, NULL, NULL),
(222, 'TN', 'Tunisia', 1, NULL, NULL),
(223, 'TR', 'Turkey', 1, NULL, NULL),
(224, 'TM', 'Turkmenistan', 1, NULL, NULL),
(225, 'TC', 'Turks and Caicos Islands', 1, NULL, NULL),
(226, 'TV', 'Tuvalu', 1, NULL, NULL),
(227, 'UG', 'Uganda', 1, NULL, NULL),
(228, 'UA', 'Ukraine', 1, NULL, NULL),
(229, 'AE', 'United Arab Emirates', 1, NULL, NULL),
(230, 'GB', 'United Kingdom', 1, NULL, NULL),
(231, 'US', 'United States', 1, NULL, NULL),
(232, 'UM', 'United States minor outlying islands', 1, NULL, NULL),
(233, 'UY', 'Uruguay', 1, NULL, NULL),
(234, 'UZ', 'Uzbekistan', 1, NULL, NULL),
(235, 'VU', 'Vanuatu', 1, NULL, NULL),
(236, 'VA', 'Vatican City State', 1, NULL, NULL),
(237, 'VE', 'Venezuela', 1, NULL, NULL),
(238, 'VN', 'Vietnam', 1, NULL, NULL),
(239, 'VG', 'Virgin Islands (British)', 1, NULL, NULL),
(240, 'VI', 'Virgin Islands (U.S.)', 1, NULL, NULL),
(241, 'WF', 'Wallis and Futuna Islands', 1, NULL, NULL),
(242, 'EH', 'Western Sahara', 1, NULL, NULL),
(243, 'YE', 'Yemen', 1, NULL, NULL),
(244, 'ZR', 'Zaire', 1, NULL, NULL),
(245, 'ZM', 'Zambia', 1, NULL, NULL),
(246, 'ZW', 'Zimbabwe', 1, NULL, NULL),
(247, 'AF', 'Afghanistan', 1, NULL, NULL),
(248, 'AL', 'Albania', 1, NULL, NULL),
(249, 'DZ', 'Algeria', 1, NULL, NULL),
(250, 'DS', 'American Samoa', 1, NULL, NULL),
(251, 'AD', 'Andorra', 1, NULL, NULL),
(252, 'AO', 'Angola', 1, NULL, NULL),
(253, 'AI', 'Anguilla', 1, NULL, NULL),
(254, 'AQ', 'Antarctica', 1, NULL, NULL),
(255, 'AG', 'Antigua and Barbuda', 1, NULL, NULL),
(256, 'AR', 'Argentina', 1, NULL, NULL),
(257, 'AM', 'Armenia', 1, NULL, NULL),
(258, 'AW', 'Aruba', 1, NULL, NULL),
(259, 'AU', 'Australia', 1, NULL, NULL),
(260, 'AT', 'Austria', 1, NULL, NULL),
(261, 'AZ', 'Azerbaijan', 1, NULL, NULL),
(262, 'BS', 'Bahamas', 1, NULL, NULL),
(263, 'BH', 'Bahrain', 1, NULL, NULL),
(264, 'BD', 'Bangladesh', 1, NULL, NULL),
(265, 'BB', 'Barbados', 1, NULL, NULL),
(266, 'BY', 'Belarus', 1, NULL, NULL),
(267, 'BE', 'Belgium', 1, NULL, NULL),
(268, 'BZ', 'Belize', 1, NULL, NULL),
(269, 'BJ', 'Benin', 1, NULL, NULL),
(270, 'BM', 'Bermuda', 1, NULL, NULL),
(271, 'BT', 'Bhutan', 1, NULL, NULL),
(272, 'BO', 'Bolivia', 1, NULL, NULL),
(273, 'BA', 'Bosnia and Herzegovina', 1, NULL, NULL),
(274, 'BW', 'Botswana', 1, NULL, NULL),
(275, 'BV', 'Bouvet Island', 1, NULL, NULL),
(276, 'BR', 'Brazil', 1, NULL, NULL),
(277, 'IO', 'British Indian Ocean Territory', 1, NULL, NULL),
(278, 'BN', 'Brunei Darussalam', 1, NULL, NULL),
(279, 'BG', 'Bulgaria', 1, NULL, NULL),
(280, 'BF', 'Burkina Faso', 1, NULL, NULL),
(281, 'BI', 'Burundi', 1, NULL, NULL),
(282, 'KH', 'Cambodia', 1, NULL, NULL),
(283, 'CM', 'Cameroon', 1, NULL, NULL),
(284, 'CA', 'Canada', 1, NULL, NULL),
(285, 'CV', 'Cape Verde', 1, NULL, NULL),
(286, 'KY', 'Cayman Islands', 1, NULL, NULL),
(287, 'CF', 'Central African Republic', 1, NULL, NULL),
(288, 'TD', 'Chad', 1, NULL, NULL),
(289, 'CL', 'Chile', 1, NULL, NULL),
(290, 'CN', 'China', 1, NULL, NULL),
(291, 'CX', 'Christmas Island', 1, NULL, NULL),
(292, 'CC', 'Cocos (Keeling) Islands', 1, NULL, NULL),
(293, 'CO', 'Colombia', 1, NULL, NULL),
(294, 'KM', 'Comoros', 1, NULL, NULL),
(295, 'CG', 'Congo', 1, NULL, NULL),
(296, 'CK', 'Cook Islands', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount` double(8,2) NOT NULL,
  `discount_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` int(15) NOT NULL,
  `end_date` int(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double(10,5) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `exchange_rate`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'U.S. Dollar', '$', 1.00000, 0, 'USD', '2018-10-09 11:35:08', '2020-11-23 20:22:19'),
(2, 'Australian Dollar', '$', 1.28000, 0, 'AUD', '2018-10-09 11:35:08', '2020-12-02 15:56:41'),
(5, 'Brazilian Real', 'R$', 3.25000, 0, 'BRL', '2018-10-09 11:35:08', '2020-11-23 20:22:15'),
(6, 'Canadian Dollar', '$', 1.27000, 0, 'CAD', '2018-10-09 11:35:08', '2020-11-23 20:22:14'),
(7, 'Czech Koruna', 'Kč', 20.65000, 0, 'CZK', '2018-10-09 11:35:08', '2020-11-23 20:22:12'),
(8, 'Danish Krone', 'kr', 6.05000, 0, 'DKK', '2018-10-09 11:35:08', '2020-11-23 20:22:11'),
(9, 'Euro', '€', 0.85000, 0, 'EUR', '2018-10-09 11:35:08', '2020-11-23 20:22:10'),
(10, 'Hong Kong Dollar', '$', 7.83000, 0, 'HKD', '2018-10-09 11:35:08', '2020-11-23 20:22:09'),
(11, 'Hungarian Forint', 'Ft', 255.24000, 0, 'HUF', '2018-10-09 11:35:08', '2020-11-23 20:22:07'),
(12, 'Israeli New Sheqel', '₪', 3.48000, 0, 'ILS', '2018-10-09 11:35:08', '2020-11-23 20:22:06'),
(13, 'Japanese Yen', '¥', 107.12000, 0, 'JPY', '2018-10-09 11:35:08', '2020-11-23 20:21:59'),
(14, 'Malaysian Ringgit', 'RM', 3.91000, 0, 'MYR', '2018-10-09 11:35:08', '2020-11-23 20:22:00'),
(15, 'Mexican Peso', '$', 18.72000, 0, 'MXN', '2018-10-09 11:35:08', '2020-11-23 20:21:57'),
(16, 'Norwegian Krone', 'kr', 7.83000, 0, 'NOK', '2018-10-09 11:35:08', '2020-11-23 20:21:56'),
(17, 'New Zealand Dollar', '$', 1.38000, 0, 'NZD', '2018-10-09 11:35:08', '2020-11-23 20:21:53'),
(18, 'Philippine Peso', '₱', 52.26000, 0, 'PHP', '2018-10-09 11:35:08', '2020-11-23 20:21:53'),
(19, 'Polish Zloty', 'zł', 3.39000, 0, 'PLN', '2018-10-09 11:35:08', '2020-11-23 20:21:51'),
(20, 'Pound Sterling', '£', 0.72000, 0, 'GBP', '2018-10-09 11:35:08', '2020-11-23 20:21:51'),
(21, 'Russian Ruble', 'руб', 55.93000, 0, 'RUB', '2018-10-09 11:35:08', '2020-11-23 20:21:50'),
(22, 'Singapore Dollar', '$', 1.32000, 0, 'SGD', '2018-10-09 11:35:08', '2020-11-23 20:21:47'),
(23, 'Swedish Krona', 'kr', 8.19000, 0, 'SEK', '2018-10-09 11:35:08', '2020-11-23 20:21:43'),
(24, 'Swiss Franc', 'CHF', 0.94000, 0, 'CHF', '2018-10-09 11:35:08', '2020-11-23 20:21:42'),
(26, 'Thai Baht', '฿', 31.39000, 0, 'THB', '2018-10-09 11:35:08', '2020-11-23 20:21:41'),
(27, 'Taka', '৳', 84.00000, 0, 'BDT', '2018-10-09 11:35:08', '2020-11-23 20:21:39'),
(28, 'Nepali Rupee', 'Rs', 68.45000, 0, 'Rupee', '2019-07-07 10:33:46', '2020-11-23 20:23:14'),
(29, 'Rs', 'Rs', 1.00000, 0, 'Rs', '2020-11-23 20:21:05', '2020-11-23 20:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 8, '2019-08-01 10:35:09', '2019-08-01 10:35:09'),
(5, 11, '2020-11-30 22:21:24', '2020-11-30 22:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `customer_packages`
--

CREATE TABLE `customer_packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` double(28,2) DEFAULT NULL,
  `product_upload` int(11) DEFAULT NULL,
  `logo` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_package_payments`
--

CREATE TABLE `customer_package_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_package_id` int(11) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approval` int(1) NOT NULL,
  `offline_payment` int(1) NOT NULL COMMENT '1=offline payment\r\n2=online paymnet',
  `reciept` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_products`
--

CREATE TABLE `customer_products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 0,
  `added_by` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conditon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(28,2) DEFAULT 0.00,
  `meta_title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_date` int(20) DEFAULT NULL,
  `end_date` int(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `featured` int(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Flash Deal Demo', 1606760100, 1606846500, 1, 1, '#000000', 'dark', 'uploads/offers/banner/6KU8zcxt7nn7xPLG9tANzbZYEjW1SZw0aCjmwZQe.png', 'flash-deal-demo-38rhd', '2020-12-02 01:45:54', '2020-12-02 01:47:58');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` int(11) NOT NULL,
  `flash_deal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discount` double(8,2) DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `flash_deal_products`
--

INSERT INTO `flash_deal_products` (`id`, `flash_deal_id`, `product_id`, `discount`, `discount_type`, `created_at`, `updated_at`) VALUES
(6, 1, 5, 0.00, 'amount', '2020-12-02 01:47:58', '2020-12-02 01:47:58'),
(7, 1, 19, 0.00, 'amount', '2020-12-02 01:47:58', '2020-12-02 01:47:58'),
(8, 1, 21, 0.00, 'amount', '2020-12-02 01:47:58', '2020-12-02 01:47:58'),
(9, 1, 74, 0.00, 'amount', '2020-12-02 01:47:58', '2020-12-02 01:47:58'),
(10, 1, 81, 0.00, 'amount', '2020-12-02 01:47:58', '2020-12-02 01:47:58');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `frontend_color` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_background` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_login_sidebar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_plus` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `frontend_color`, `logo`, `footer_logo`, `admin_logo`, `admin_login_background`, `admin_login_sidebar`, `favicon`, `site_name`, `address`, `description`, `phone`, `email`, `facebook`, `instagram`, `twitter`, `youtube`, `google_plus`, `created_at`, `updated_at`) VALUES
(1, '3', 'uploads/logo/YRxmKzNUc2hrnWSfGQFoOgaglnjGr3zh91s4Y7AG.png', 'uploads/logo/2jVvrX609iZSzHLug85EOdt3UZMwXZfJUEBgbk8p.jpeg', 'uploads/admin_logo/rRk9sj9sXEmonB2VPHVhJgXuZIjKlKwWouaV9fmN.jpeg', 'uploads/admin_login_background/imCi3AaJTrlD6wZACQYrlpJLhzWNnZHWW0f4gyWr.png', 'uploads/admin_login_sidebar/uQqckNLRZIn27Lq1lBAmKoOQrxqIdIkttlFFmzzH.png', 'uploads/favicon/k7HevBFgzqZw1PPD1cEmSVgDMiKAZvLTxxsZJT2M.jpeg', 'KGXpress', 'Kathmandu', 'KGXpress', '9812345678', 'Admin@gmail.com', 'https://www.facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.youtube.com', 'https://www.googleplus.com', '2020-11-30 09:06:45', '2020-11-30 19:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `home_categories`
--

CREATE TABLE `home_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subsubcategories` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_categories`
--

INSERT INTO `home_categories` (`id`, `category_id`, `subsubcategories`, `status`, `created_at`, `updated_at`) VALUES
(7, 10, 'null', 1, '2020-12-01 20:47:01', '2020-12-01 20:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rtl` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 0, '2019-01-20 12:13:20', '2019-01-20 12:13:20'),
(3, 'Bangla', 'bd', 0, '2019-02-17 06:35:37', '2019-02-18 06:49:51'),
(4, 'Arabic', 'sa', 1, '2019-04-28 18:34:12', '2019-04-28 18:34:12');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text COLLATE utf32_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('125ce8289850f80d9fea100325bf892fbd0deba1f87dbfc2ab81fb43d57377ec24ed65f7dc560e46', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-30 04:51:13', '2019-07-30 04:51:13', '2020-07-30 10:51:13'),
('293d2bb534220c070c4e90d25b5509965d23d3ddbc05b1e29fb4899ae09420ff112dbccab1c6f504', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:00:04', '2019-08-04 06:00:04', '2020-08-04 12:00:04'),
('5363e91c7892acdd6417aa9c7d4987d83568e229befbd75be64282dbe8a88147c6c705e06c1fb2bf', 1, 1, 'Personal Access Token', '[]', 0, '2019-07-13 06:44:28', '2019-07-13 06:44:28', '2020-07-13 12:44:28'),
('681b4a4099fac5e12517307b4027b54df94cbaf0cbf6b4bf496534c94f0ccd8a79dd6af9742d076b', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:23:06', '2019-08-04 07:23:06', '2020-08-04 13:23:06'),
('6d229e3559e568df086c706a1056f760abc1370abe74033c773490581a042442154afa1260c4b6f0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:32:12', '2019-08-04 07:32:12', '2020-08-04 13:32:12'),
('6efc0f1fc3843027ea1ea7cd35acf9c74282f0271c31d45a164e7b27025a315d31022efe7bb94aaa', 1, 1, 'Personal Access Token', '[]', 0, '2019-08-08 02:35:26', '2019-08-08 02:35:26', '2020-08-08 08:35:26'),
('7745b763da15a06eaded371330072361b0524c41651cf48bf76fc1b521a475ece78703646e06d3b0', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:29:44', '2019-08-04 07:29:44', '2020-08-04 13:29:44'),
('815b625e239934be293cd34479b0f766bbc1da7cc10d464a2944ddce3a0142e943ae48be018ccbd0', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-22 02:07:47', '2019-07-22 02:07:47', '2020-07-22 08:07:47'),
('8921a4c96a6d674ac002e216f98855c69de2568003f9b4136f6e66f4cb9545442fb3e37e91a27cad', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:05:05', '2019-08-04 06:05:05', '2020-08-04 12:05:05'),
('8d8b85720304e2f161a66564cec0ecd50d70e611cc0efbf04e409330086e6009f72a39ce2191f33a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 06:44:35', '2019-08-04 06:44:35', '2020-08-04 12:44:35'),
('bcaaebdead4c0ef15f3ea6d196fd80749d309e6db8603b235e818cb626a5cea034ff2a55b66e3e1a', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:14:32', '2019-08-04 07:14:32', '2020-08-04 13:14:32'),
('c25417a5c728073ca8ba57058ded43d496a9d2619b434d2a004dd490a64478c08bc3e06ffc1be65d', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 01:45:31', '2019-07-30 01:45:31', '2020-07-30 07:45:31'),
('c7423d85b2b5bdc5027cb283be57fa22f5943cae43f60b0ed27e6dd198e46f25e3501b3081ed0777', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-05 05:02:59', '2019-08-05 05:02:59', '2020-08-05 11:02:59'),
('e76f19dbd5c2c4060719fb1006ac56116fd86f7838b4bf74e2c0a0ac9696e724df1e517dbdb357f4', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-15 02:53:40', '2019-07-15 02:53:40', '2020-07-15 08:53:40'),
('ed7c269dd6f9a97750a982f62e0de54749be6950e323cdfef892a1ec93f8ddbacf9fe26e6a42180e', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-13 06:36:45', '2019-07-13 06:36:45', '2020-07-13 12:36:45'),
('f6d1475bc17a27e389000d3df4da5c5004ce7610158b0dd414226700c0f6db48914637b4c76e1948', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:22:01', '2019-08-04 07:22:01', '2020-08-04 13:22:01'),
('f85e4e444fc954430170c41779a4238f84cd6fed905f682795cd4d7b6a291ec5204a10ac0480eb30', 1, 1, 'Personal Access Token', '[]', 1, '2019-07-30 06:38:49', '2019-07-30 06:38:49', '2020-07-30 12:38:49'),
('f8bf983a42c543b99128296e4bc7c2d17a52b5b9ef69670c629b93a653c6a4af27be452e0c331f79', 1, 1, 'Personal Access Token', '[]', 1, '2019-08-04 07:28:55', '2019-08-04 07:28:55', '2020-08-04 13:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'eR2y7WUuem28ugHKppFpmss7jPyOHZsMkQwBo1Jj', 'http://localhost', 1, 0, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34'),
(2, NULL, 'Laravel Password Grant Client', 'WLW2Ol0GozbaXEnx1NtXoweYPuKEbjWdviaUgw77', 'http://localhost', 0, 1, 0, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-07-13 06:17:34', '2019-07-13 06:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_id` int(11) DEFAULT NULL,
  `shipping_address` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'unpaid',
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `grand_total` double(8,2) DEFAULT NULL,
  `coupon_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `code` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` int(20) NOT NULL,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `delivery_viewed` int(1) NOT NULL DEFAULT 1,
  `payment_status_viewed` int(1) DEFAULT 1,
  `commission_calculated` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `guest_id`, `shipping_address`, `payment_type`, `payment_status`, `payment_details`, `grand_total`, `coupon_discount`, `code`, `date`, `viewed`, `delivery_viewed`, `payment_status_viewed`, `commission_calculated`, `created_at`, `updated_at`) VALUES
(1, 11, NULL, '{\"name\":\"Deepak Kumar Karna\",\"email\":\"karna.deepak@gmail.com\",\"address\":\"PCPS College, Nepal Kandevta Sthan, Kupondole\",\"country\":\"Nepal\",\"city\":\"Kathmandu\",\"postal_code\":\"46600\",\"phone\":\"+9779841209394\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 912.00, 0.00, '20201130-17232537', 1606736305, 1, 0, 0, 0, '2020-11-30 22:23:25', '2020-12-01 17:40:17'),
(2, 9, NULL, '{\"name\":\"kgxpress\",\"email\":\"admin@kgxpress.com\",\"address\":\"new road\",\"country\":\"Nepal\",\"city\":\"kathmandu\",\"postal_code\":\"977\",\"phone\":\"7410852\",\"checkout_type\":\"logged\"}', 'cash_on_delivery', 'unpaid', NULL, 3355.00, 0.00, '20201201-12393912', 1606805679, 1, 0, 0, 0, '2020-12-01 17:39:39', '2020-12-01 17:40:36');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `variation` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `tax` double(8,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `delivery_status` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pending',
  `shipping_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pickup_point_id` int(11) DEFAULT NULL,
  `product_referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `seller_id`, `product_id`, `variation`, `price`, `tax`, `shipping_cost`, `quantity`, `payment_status`, `delivery_status`, `shipping_type`, `pickup_point_id`, `product_referral_code`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 10, '', 912.00, 0.00, 0.00, 6, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-11-30 22:23:25', '2020-11-30 22:23:25'),
(2, 2, 9, 55, '', 3355.00, 0.00, 0.00, 1, 'unpaid', 'pending', 'home_delivery', NULL, NULL, '2020-12-01 17:39:39', '2020-12-01 17:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txn_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pickup_points`
--

CREATE TABLE `pickup_points` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `pick_up_status` int(1) DEFAULT NULL,
  `cash_on_pickup_status` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `policies`
--

CREATE TABLE `policies` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `policies`
--

INSERT INTO `policies` (`id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 'support_policy', NULL, '2019-10-29 12:54:45', '2019-01-22 05:13:15'),
(2, 'return_policy', NULL, '2019-10-29 12:54:47', '2019-01-24 05:40:11'),
(4, 'seller_policy', NULL, '2019-10-29 12:54:49', '2019-02-04 17:50:15'),
(5, 'terms', NULL, '2019-10-29 12:54:51', '2019-10-28 18:00:00'),
(6, 'privacy_policy', NULL, '2019-10-29 12:54:54', '2019-10-28 18:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `added_by` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_provider` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video_link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) NOT NULL,
  `purchase_price` double(8,2) NOT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[]',
  `choice_options` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `colors` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `unit` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `discount` double(8,2) DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax` double(8,2) DEFAULT NULL,
  `tax_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_type` varchar(20) CHARACTER SET latin1 DEFAULT 'flat_rate',
  `shipping_cost` double(8,2) DEFAULT 0.00,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pdf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `added_by`, `user_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `brand_id`, `photos`, `thumbnail_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `featured`, `current_stock`, `unit`, `min_qty`, `discount`, `discount_type`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `rating`, `barcode`, `digital`, `file_name`, `file_path`, `created_at`, `updated_at`) VALUES
(15, 'Streax Cream Hair Color 7.3 Golden Blonde, 20 gm', 'admin', 9, 10, 13, NULL, 1, '[\"uploads\\/products\\/photos\\/JA20QCjjNRks02L7SUFw1TmwsfzXYngCAPa7iYrl.jpeg\"]', 'uploads/products/thumbnail/dMK98ocnLZKTiNTEjSBWcGXi8t2YnoRBAc6wq066.jpeg', 'youtube', NULL, 'streax,health,beauty,hair', NULL, 96.00, 96.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 15, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Streax Cream Hair Color 7.3 Golden Blonde, 20 gm', NULL, 'uploads/products/thumbnail/dMK98ocnLZKTiNTEjSBWcGXi8t2YnoRBAc6wq066.jpeg', NULL, 'Streax-Cream-Hair-Color-73-Golden-Blonde-20-gm-hxL5V', 0.00, NULL, 0, NULL, NULL, '2020-11-30 21:08:05', '2020-11-30 21:08:05'),
(16, 'Super Vasmol Kesh Kala, 50 ml', 'admin', 9, 10, 13, NULL, 1, '[\"uploads\\/products\\/photos\\/YF0c6mta5QitSWgJM5lHxqzzTmr2d5yJQFOfzhOh.jpeg\"]', 'uploads/products/thumbnail/U7MHAx0xrhsKCruu7OXJrulABAWzg3OTYixIZ2o7.jpeg', 'youtube', NULL, 'hair,super,vasmol,streax', NULL, 55.00, 55.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 14, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Super Vasmol Kesh Kala, 50 ml', NULL, 'uploads/products/thumbnail/U7MHAx0xrhsKCruu7OXJrulABAWzg3OTYixIZ2o7.jpeg', NULL, 'Super-Vasmol-Kesh-Kala-50-ml-4ON6a', 0.00, NULL, 0, NULL, NULL, '2020-11-30 21:10:43', '2020-11-30 21:10:43'),
(17, 'Streax Insta Shampoo Hair Color  3.16 Burgundy, 15ml', 'admin', 9, 10, 13, NULL, 1, '[\"uploads\\/products\\/photos\\/oaWTYBIxZy0WcZpmVbdK9GU0wKUtM5Vnl21d6fzN.jpeg\"]', 'uploads/products/thumbnail/QqqWVi6AkNYGxMPv5zga1wDKTSxPIsrbPqgX7fXa.jpeg', 'youtube', NULL, 'streax,health,hair', NULL, 32.00, 32.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 28, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Streax Insta Shampoo Hair Color  3.16 Burgundy, 15ml', NULL, 'uploads/products/thumbnail/QqqWVi6AkNYGxMPv5zga1wDKTSxPIsrbPqgX7fXa.jpeg', NULL, 'Streax-Insta-Shampoo-Hair-Color--316-Burgundy-15ml-mH589', 0.00, NULL, 0, NULL, NULL, '2020-11-30 21:13:28', '2020-11-30 21:13:28'),
(18, 'Streax Hair Serum Colour Lock, 100 gm', 'admin', 9, 10, 13, NULL, 1, '[\"uploads\\/products\\/photos\\/B3VNtCgYIpPpavoJPrKAlhnRL1K3ONapPgcJkxvK.jpeg\"]', 'uploads/products/thumbnail/Ar3owPurMfg7Up65AalUF7qdTZdGJBtzuxzZvIIV.jpeg', 'youtube', NULL, 'streax,hair,health', NULL, 440.00, 440.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 35, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Streax Hair Serum Colour Lock, 100 gm', NULL, 'uploads/products/thumbnail/Ar3owPurMfg7Up65AalUF7qdTZdGJBtzuxzZvIIV.jpeg', NULL, 'Streax-Hair-Serum-Colour-Lock-100-gm-XLGWu', 0.00, NULL, 0, NULL, NULL, '2020-11-30 21:17:32', '2020-11-30 21:17:32'),
(19, 'Streax Cream Hair Color 5.66 Cinnamon Red, 20 gm', 'admin', 9, 10, 13, NULL, 1, '[\"uploads\\/products\\/photos\\/hBuipyPk9pUqzbqAnGvwhXDTUfCCkUwpa5CaiK5b.jpeg\"]', 'uploads/products/thumbnail/on3s6BKtB7EfK6vQ7f1GaswqGe687zXuf4hQjbXi.jpeg', 'youtube', NULL, 'streax,hair color,health', NULL, 96.00, 96.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 14, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Streax Cream Hair Color 5.66 Cinnamon Red, 20 gm', NULL, 'uploads/products/thumbnail/on3s6BKtB7EfK6vQ7f1GaswqGe687zXuf4hQjbXi.jpeg', NULL, 'Streax-Cream-Hair-Color-566-Cinnamon-Red-20-gm-ckHgO', 0.00, NULL, 0, NULL, NULL, '2020-11-30 21:21:03', '2020-11-30 21:21:03'),
(51, 'Ultrex Ultra Thin Panty Liners 30\'s', 'admin', 9, 10, 19, 19, 9, '[\"uploads\\/products\\/photos\\/RKzYOqxkhfcD0dYuI0DtRqqCXzb7N7D4R5Mhscjj.jpeg\"]', 'uploads/products/thumbnail/r2y3tFTgd1QYImigTYZvMUpSQWBStbDg6CxaM8jT.jpeg', 'youtube', NULL, 'ultrex,health,feminine care', NULL, 211.00, 211.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 18, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Ultrex Ultra Thin Panty Liners 30\'s', NULL, 'uploads/products/thumbnail/r2y3tFTgd1QYImigTYZvMUpSQWBStbDg6CxaM8jT.jpeg', NULL, 'Ultrex-Ultra-Thin-Panty-Liners-30s-01nqU', 0.00, NULL, 0, NULL, NULL, '2020-12-01 17:09:20', '2020-12-01 17:09:20'),
(52, 'Ultrex Super Tampons 16\'s 107 gm Pink', 'admin', 9, 10, 19, 19, 9, '[\"uploads\\/products\\/photos\\/6bvCwJedRzxg3zBEmH0lWbWQJ6ZiyGhoHoQqxfTy.jpeg\"]', 'uploads/products/thumbnail/488FAJlZYBX5FZOruq0zwx6Nrt4xqTlGOiR7FKG5.jpeg', 'youtube', NULL, 'ultrex,health', NULL, 315.00, 315.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 8, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Ultrex Super Tampons 16\'s 107 gm Pink', NULL, 'uploads/products/thumbnail/488FAJlZYBX5FZOruq0zwx6Nrt4xqTlGOiR7FKG5.jpeg', NULL, 'Ultrex-Super-Tampons-16s-107-gm-Pink-m0yG9', 0.00, NULL, 0, NULL, NULL, '2020-12-01 17:13:29', '2020-12-01 17:13:29'),
(53, 'Ultrex Super Tampons 16\'s 82 gm Purple', 'admin', 9, 10, 19, 19, 9, '[\"uploads\\/products\\/photos\\/FJo2nNhnCMps5ddm2eKKNGupBRMBjNMdKCj3yEce.jpeg\"]', 'uploads/products/thumbnail/QjL1CO0W1KKqIZnFNOKjiFHDMds4fUVznTQ9Q7mH.jpeg', 'youtube', NULL, 'ultrex,health,feminine care', NULL, 275.00, 275.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 17, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Ultrex Super Tampons 16\'s 82 gm Purple', NULL, 'uploads/products/thumbnail/QjL1CO0W1KKqIZnFNOKjiFHDMds4fUVznTQ9Q7mH.jpeg', NULL, 'Ultrex-Super-Tampons-16s-82-gm-Purple-7RkXY', 0.00, NULL, 0, NULL, NULL, '2020-12-01 17:15:15', '2020-12-01 17:15:15'),
(75, 'Skinella Carambola & Shea Butter Hand Cream, 50 gm', 'admin', 9, 10, 24, 21, 14, '[\"uploads\\/products\\/photos\\/ZD2vpPSho9vCYpZXGe3SKOQuP7ep6O0UusUqMYoy.jpeg\"]', 'uploads/products/thumbnail/rTy3WrQDBAF8IQxbzGfHXl1T5jBWFMSN3BeneJnf.jpeg', 'youtube', NULL, 'cream,skinella', NULL, 272.00, 272.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 36, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Skinella Carambola & Shea Butter Hand Cream, 50 gm', NULL, 'uploads/products/thumbnail/rTy3WrQDBAF8IQxbzGfHXl1T5jBWFMSN3BeneJnf.jpeg', NULL, 'Skinella-Carambola--Shea-Butter-Hand-Cream-50-gm-W9cop', 0.00, NULL, 0, NULL, NULL, '2020-12-01 19:55:43', '2021-01-12 16:41:33'),
(76, 'Skinella Dragon Fruit Face Mask, 50 gm', 'admin', 9, 10, 24, 21, 14, '[\"uploads\\/products\\/photos\\/Nnr5vqM258j6osnVuNdnl4WoQkJs4tvgplKPWan1.jpeg\"]', 'uploads/products/thumbnail/9foD0hDw5e7pF8Xzk7JBG5u26oebY1G9bzEU6aPq.jpeg', 'youtube', NULL, 'skinella,skin care,face mask', NULL, 344.00, 344.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 73, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Skinella Dragon Fruit Face Mask, 50 gm', NULL, 'uploads/products/thumbnail/9foD0hDw5e7pF8Xzk7JBG5u26oebY1G9bzEU6aPq.jpeg', NULL, 'Skinella-Dragon-Fruit-Face-Mask-50-gm-6Mn83', 0.00, NULL, 0, NULL, NULL, '2020-12-01 19:59:19', '2020-12-01 19:59:19'),
(77, 'Skinella Kiwi Face Scrub, 100 gm', 'admin', 9, 10, 24, 21, 14, '[\"uploads\\/products\\/photos\\/7BNHY1EnH1pfXd4Z6ptyYg3uhGEM7mEp37ZCX7XR.jpeg\"]', 'uploads/products/thumbnail/NlKrIBNIrgtpsWTQx3tc5g1AWcRszg0YbBKMikVd.jpeg', 'youtube', NULL, 'health,skin care,skinella', NULL, 360.00, 360.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 67, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Skinella Kiwi Face Scrub, 100 gm', NULL, 'uploads/products/thumbnail/NlKrIBNIrgtpsWTQx3tc5g1AWcRszg0YbBKMikVd.jpeg', NULL, 'Skinella-Kiwi-Face-Scrub-100-gm-SfRZR', 0.00, NULL, 0, NULL, NULL, '2020-12-01 20:01:13', '2020-12-01 20:01:13'),
(78, 'Skinella Strawberry Lip balm, 3.6 gm', 'admin', 9, 10, 24, 22, 14, '[\"uploads\\/products\\/photos\\/m3wBRFngVyRzAGT7y5Mr8viExwPYqlT8gwG6VQdU.jpeg\"]', 'uploads/products/thumbnail/ab0koORmr5H0AVVG68NMcDLl8rEanOa80A9IzyNA.jpeg', 'youtube', NULL, 'skin care,lip care,skinella,health', NULL, 176.00, 176.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 87, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Skinella Strawberry Lip balm, 3.6 gm', NULL, 'uploads/products/thumbnail/ab0koORmr5H0AVVG68NMcDLl8rEanOa80A9IzyNA.jpeg', NULL, 'Skinella-Strawberry-Lip-balm-36-gm-HapfE', 0.00, NULL, 0, NULL, NULL, '2020-12-01 20:14:20', '2020-12-01 20:14:20'),
(79, 'Skinella Peach Lip balm, 3.6 gm', 'admin', 9, 10, 24, 22, 14, '[\"uploads\\/products\\/photos\\/nc23EkqmE6oNrK8Xh4XbbrtuN7VnybeKwRmxVUr2.jpeg\"]', 'uploads/products/thumbnail/OCTOPB3HhYh1qH80eeCnb8skkpPggoQ8hzdCbeDc.jpeg', 'youtube', NULL, 'lip care,health,skinella,beauty', NULL, 176.00, 176.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 47, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Skinella Peach Lip balm, 3.6 gm', NULL, 'uploads/products/thumbnail/OCTOPB3HhYh1qH80eeCnb8skkpPggoQ8hzdCbeDc.jpeg', NULL, 'Skinella-Peach-Lip-balm-36-gm-2J56I', 0.00, NULL, 0, NULL, NULL, '2020-12-01 20:17:28', '2020-12-01 20:17:28'),
(80, 'Skinella Mandarin Lip balm, 3.6 gm', 'admin', 9, 10, 24, 22, 14, '[\"uploads\\/products\\/photos\\/Ng95wtwzejxnKvgV0SI6jl0ozT5aS5a6Zmh1zZs9.jpeg\"]', 'uploads/products/thumbnail/65qoBXYwwdzplaA4FTRuhDcX7V5zjmOZCJyJEivT.jpeg', 'youtube', NULL, 'health,skin care,skinella,balm', NULL, 176.00, 176.00, 0, '[]', '[]', '[]', NULL, 1, 1, 0, 79, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Skinella Mandarin Lip balm, 3.6 gm', NULL, 'uploads/products/thumbnail/65qoBXYwwdzplaA4FTRuhDcX7V5zjmOZCJyJEivT.jpeg', NULL, 'Skinella-Mandarin-Lip-balm-36-gm-mAAHv', 0.00, NULL, 0, NULL, NULL, '2020-12-01 20:19:19', '2020-12-01 20:52:13'),
(81, 'Skinella Coffee Lip balm, 3.6 gm', 'admin', 9, 10, 24, 22, 14, '[\"uploads\\/products\\/photos\\/MCvzB8aBff2Fqwy83UDW6FNNHizfAD4JipgE96Y0.jpeg\"]', 'uploads/products/thumbnail/1nrC87PjsIJli8SOCpWlvKnnJBF7tjKY9GawBGjy.jpeg', 'youtube', NULL, 'health,lip care,skin care', NULL, 176.00, 176.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 235, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Skinella Coffee Lip balm, 3.6 gm', NULL, 'uploads/products/thumbnail/1nrC87PjsIJli8SOCpWlvKnnJBF7tjKY9GawBGjy.jpeg', NULL, 'Skinella-Coffee-Lip-balm-36-gm-IBaLd', 0.00, NULL, 0, NULL, NULL, '2020-12-01 20:32:23', '2021-01-12 16:41:30'),
(82, 'Jordan Toothbrush Individual Clean (Soft)', 'admin', 9, 10, 25, NULL, 15, '[\"uploads\\/products\\/photos\\/jPpDmm7egQFrksZV2YM3VWLQ1sJTSLzYEpnxIlu2.jpeg\"]', 'uploads/products/thumbnail/OpML0APAgfrL8YjeCRaVUnwgZtNBv2aIFndarg0X.jpeg', 'youtube', NULL, 'dental,jordan,toothbrush', NULL, 158.00, 158.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 47, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Jordan Toothbrush Individual Clean (Soft)', NULL, 'uploads/products/thumbnail/OpML0APAgfrL8YjeCRaVUnwgZtNBv2aIFndarg0X.jpeg', NULL, 'Jordan-Toothbrush-Individual-Clean-Soft-nrg8c', 0.00, NULL, 0, NULL, NULL, '2020-12-01 20:50:54', '2020-12-01 20:50:54'),
(83, 'Jordan Toothbrush Target White (Medium)', 'admin', 9, 10, 25, NULL, 15, '[\"uploads\\/products\\/photos\\/R33wMqTtTYd781AD3lIjkJ3TqvQDjYvVmItEwLTe.jpeg\"]', 'uploads/products/thumbnail/xuo9kIVoWudVuD10xcVYMx9Jq3ERYeErvKm2ojBH.jpeg', 'youtube', NULL, 'jordan,toothbrush,health', NULL, 110.00, 110.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 246, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Jordan Toothbrush Target White (Medium)', NULL, 'uploads/products/thumbnail/xuo9kIVoWudVuD10xcVYMx9Jq3ERYeErvKm2ojBH.jpeg', NULL, 'Jordan-Toothbrush-Target-White-Medium-si22h', 0.00, NULL, 0, NULL, NULL, '2020-12-01 20:52:24', '2020-12-01 20:52:24'),
(84, 'Jordan Kids Tooth Brush Amigo, 6-12yrs', 'admin', 9, 10, 25, NULL, 15, '[\"uploads\\/products\\/photos\\/gtD8dzri2OAbUKLMg8hBkhB3ahdbKgiZGMVSSE7X.jpeg\"]', 'uploads/products/thumbnail/ERPtwdahW63URWpTWLBJSXgpxBv3eNZTxCTY0rDP.jpeg', 'youtube', NULL, 'jordan,dental,health', NULL, 79.00, 79.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 15, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Jordan Kids Tooth Brush Amigo, 6-12yrs', NULL, 'uploads/products/thumbnail/ERPtwdahW63URWpTWLBJSXgpxBv3eNZTxCTY0rDP.jpeg', NULL, 'Jordan-Kids-Tooth-Brush-Amigo-6-12yrs-qMmIv', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:07:54', '2021-01-03 06:14:57'),
(85, 'Jordan Clinic Tongue Cleaner', 'admin', 9, 10, 25, NULL, 15, '[\"uploads\\/products\\/photos\\/woGLrTWrECtM655Lh6Cb7tBEuhYLtg4cfxYZweYC.jpeg\"]', 'uploads/products/thumbnail/noYvEBKA5qQhxFPtqAW8XMttoUdGRtWY2EM2nsyZ.jpeg', 'youtube', NULL, 'jordan,dental', NULL, 115.00, 115.00, 0, '[]', '[]', '[]', NULL, 1, 1, 0, 74, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Jordan Clinic Tongue Cleaner', NULL, 'uploads/products/thumbnail/noYvEBKA5qQhxFPtqAW8XMttoUdGRtWY2EM2nsyZ.jpeg', NULL, 'Jordan-Clinic-Tongue-Cleaner-XIoV6', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:10:02', '2021-01-01 08:05:41'),
(86, 'Jordan Toothbrush Individual Ultrasoft', 'admin', 9, 10, 25, NULL, 15, '[\"uploads\\/products\\/photos\\/vVbeoIfOecFz5pZPeaZmHajs7pNyWUCRezJ4rJcZ.jpeg\"]', 'uploads/products/thumbnail/cCt7htfGQVEZSfA4yLfNLqsCIHgOkXJdOjNUAkCZ.jpeg', 'youtube', NULL, 'jordan,health,dental', NULL, 158.00, 158.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 80, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Jordan Toothbrush Individual Ultrasoft', NULL, 'uploads/products/thumbnail/cCt7htfGQVEZSfA4yLfNLqsCIHgOkXJdOjNUAkCZ.jpeg', NULL, 'Jordan-Toothbrush-Individual-Ultrasoft-nMAIE', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:11:23', '2020-12-02 16:11:23'),
(87, 'Bajaj Almond Soap 125 gm', 'admin', 9, 10, 26, 23, 16, '[\"uploads\\/products\\/photos\\/LedcKMKjwvcaJKEynRNAH1fVdgrToHPUOqLxIQFR.jpeg\"]', 'uploads/products/thumbnail/d4B5B4gtHhiDEzNFjSPWlHflG3s61tfl94P2A6LM.jpeg', 'youtube', NULL, 'bajaj,soap', NULL, 73.63, 73.63, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 7, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Soap 125 gm', NULL, 'uploads/products/thumbnail/d4B5B4gtHhiDEzNFjSPWlHflG3s61tfl94P2A6LM.jpeg', NULL, 'Bajaj-Almond-Soap-125-gm-8S3WB', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:26:31', '2020-12-02 16:26:31'),
(88, 'Bajaj Almond Soap 75 gm', 'admin', 9, 10, 26, 23, 16, '[\"uploads\\/products\\/photos\\/onxrFh0rp5wUvZo0CVz2BZEiZFe3MK5CGH6o1Em0.jpeg\"]', 'uploads/products/thumbnail/QwVwZWvMZtUUiFV8yMk8MOQakY52R4Iynpd04vt0.jpeg', 'youtube', NULL, 'bajaj,soap', NULL, 51.20, 51.20, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 0, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Soap 75 gm', NULL, 'uploads/products/thumbnail/QwVwZWvMZtUUiFV8yMk8MOQakY52R4Iynpd04vt0.jpeg', NULL, 'Bajaj-Almond-Soap-75-gm-4haHp', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:27:35', '2021-01-12 16:41:07'),
(89, 'Bajaj Brahmi Amla oil 200 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/GQbsFSc8HINo5YXH8iXz3Betq5gfjenwkBehL2xs.jpeg\"]', 'uploads/products/thumbnail/RxFftqlF0YNPvy3FVgjGyEaf3SUQklbLXT5f9srf.jpeg', 'youtube', NULL, 'bajaj,hair oil', NULL, 144.00, 144.00, 0, '[]', '[]', '[]', NULL, 1, 1, 0, 85, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Brahmi Amla oil 200 ml', NULL, 'uploads/products/thumbnail/RxFftqlF0YNPvy3FVgjGyEaf3SUQklbLXT5f9srf.jpeg', NULL, 'Bajaj-Brahmi-Amla-oil-200-ml-A7H0N', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:38:25', '2021-01-03 06:14:50'),
(90, 'Bajaj Brahmi Amla oil 100 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/lHUxYgz7QYLjdk0xNNWZkiBTaaxYtePkKz3h1UIW.jpeg\"]', 'uploads/products/thumbnail/LzjrOjyHF6kbcXZfXxRwvuZoujZLbxLtc4GSqHsX.jpeg', 'youtube', NULL, 'bajaj,hair oil,beauty', NULL, 72.00, 72.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 147, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Brahmi Amla oil 100 ml', NULL, 'uploads/products/thumbnail/LzjrOjyHF6kbcXZfXxRwvuZoujZLbxLtc4GSqHsX.jpeg', NULL, 'Bajaj-Brahmi-Amla-oil-100-ml-toy75', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:39:52', '2021-01-12 16:41:08'),
(91, 'Bajaj Almond Hair Oil Cool 190 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/RhudjJ2XKAV1K2RrbN8sKJXm5UkzDa63bbztT77t.jpeg\"]', 'uploads/products/thumbnail/ghu9aMNgbzfniy9gBUVmGTEuBIKUQdzWL3J8tRFl.jpeg', 'youtube', NULL, 'bajaj,hair oil', NULL, 216.00, 216.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 74, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Hair Oil Cool 190 ml', NULL, 'uploads/products/thumbnail/ghu9aMNgbzfniy9gBUVmGTEuBIKUQdzWL3J8tRFl.jpeg', NULL, 'Bajaj-Almond-Hair-Oil-Cool-190-ml-o0q7L', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:42:35', '2020-12-02 16:44:09'),
(92, 'Bajaj Almond Hair Oil Cool 95 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/MiUEeRX9SsXrEKog5Ifpq8iJ0ibc1aOmqK1ZVgOA.jpeg\"]', 'uploads/products/thumbnail/Daf2j3B9THwp3GPyr0Iz3O7rzhXUdMQUPubVyfqo.jpeg', 'youtube', NULL, 'bajaj,hair oil', NULL, 120.00, 120.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 17, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Hair Oil Cool 95 ml', NULL, 'uploads/products/thumbnail/Daf2j3B9THwp3GPyr0Iz3O7rzhXUdMQUPubVyfqo.jpeg', NULL, 'Bajaj-Almond-Hair-Oil-Cool-95-ml-s9oRy', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:43:50', '2021-01-12 16:41:13'),
(93, 'Bajaj Almond Hair Oil Cool 45 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/lfhIzTVeGO6xCQkfa6UVq8E5QD2wNx59OqXv2PhD.jpeg\"]', 'uploads/products/thumbnail/IxO297AcFaIL52oYTq7K4xYesHkd80ae2bWqJN1Q.jpeg', 'youtube', NULL, 'bajaj,hair oil', NULL, 60.80, 60.80, 0, '[]', '[]', '[]', NULL, 1, 1, 0, 14, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Hair Oil Cool 45 ml', NULL, 'uploads/products/thumbnail/IxO297AcFaIL52oYTq7K4xYesHkd80ae2bWqJN1Q.jpeg', NULL, 'Bajaj-Almond-Hair-Oil-Cool-45-ml-Q5KnR', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:46:13', '2021-01-01 10:40:17'),
(94, 'Bajaj Almond Drop 500 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/9Yi9Mdk1nLCibctzEGV8MYlZZiv1FPmWWzZC48RS.jpeg\"]', 'uploads/products/thumbnail/UgZVmCLqLXoOLu9XIpcvIL1EQAVrrxOLNbBndsfF.jpeg', 'youtube', NULL, 'bajaj,hair drop', NULL, 448.00, 448.00, 0, '[]', '[]', '[]', NULL, 0, 1, 0, 87, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Drop 500 ml', NULL, 'uploads/products/thumbnail/UgZVmCLqLXoOLu9XIpcvIL1EQAVrrxOLNbBndsfF.jpeg', NULL, 'Bajaj-Almond-Drop-500-ml-2rZDM', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:48:21', '2021-01-12 16:41:12'),
(95, 'Bajaj Almond Drop 300 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/NbXJMljmPLd5nfSclloQsSZxtZMR8k1eoEpQiXAg.jpeg\"]', 'uploads/products/thumbnail/su9eYUXvHY7cUMvLXhW2iHXeabGVed75ZVbel7zV.jpeg', 'youtube', NULL, 'bajaj,almond,drop', NULL, 280.00, 280.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 124, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Drop 300 ml', NULL, 'uploads/products/thumbnail/su9eYUXvHY7cUMvLXhW2iHXeabGVed75ZVbel7zV.jpeg', NULL, 'Bajaj-Almond-Drop-300-ml-AeXqu', 0.00, NULL, 0, NULL, NULL, '2020-12-02 16:50:48', '2021-01-01 08:13:11'),
(96, 'Bajaj Almond Drop 200 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/CfkJGewDS63G3fPchDcBxr4wOiT7AxAV0dze6xAB.jpeg\"]', 'uploads/products/thumbnail/MdZlI66yYrdq5gJxa2CHm7B8EUx6YCIwTYUAfEkq.jpeg', 'youtube', NULL, 'bajaj,almond,hair oil', NULL, 208.00, 208.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 41, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Drop 200 ml', NULL, 'uploads/products/thumbnail/MdZlI66yYrdq5gJxa2CHm7B8EUx6YCIwTYUAfEkq.jpeg', NULL, 'Bajaj-Almond-Drop-200-ml-DmUhS', 0.00, NULL, 0, NULL, NULL, '2020-12-02 17:07:46', '2021-01-01 10:01:46'),
(97, 'Bajaj Almond Drop 100 ml', 'admin', 9, 10, 13, 24, 16, '[\"uploads\\/products\\/photos\\/XD36Xsetle3iFK8TVfZJoHpDprBcsZx0qZBU139T.jpeg\"]', 'uploads/products/thumbnail/hg0dWCis37Erh3xmuGyRei7oNimKffnCLy2cEZN6.jpeg', 'youtube', NULL, 'bajaj,almond', NULL, 105.00, 105.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 45, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Bajaj Almond Drop 100 ml', NULL, 'uploads/products/thumbnail/hg0dWCis37Erh3xmuGyRei7oNimKffnCLy2cEZN6.jpeg', NULL, 'Bajaj-Almond-Drop-100-ml-aJ88p', 0.00, NULL, 0, NULL, NULL, '2020-12-02 17:11:42', '2021-01-12 16:28:54'),
(138, 'Manicurex Nail Polish Remover with Sponge, 75 ml', 'admin', 9, 10, 19, NULL, 24, '[\"uploads\\/products\\/photos\\/1aSe1EU5TFDa8YU1kZZmHhpBYEv68hVohuXtLUQl.jpeg\"]', 'uploads/products/thumbnail/RFQv6sNFPedq8NIRZPLplxqkKmVn0RWA4JwVTW4b.jpeg', 'youtube', NULL, 'health & beauty,personal care & hygiene,nail care', NULL, 75.00, 75.00, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 60, 'Pc.', 1, 0.00, 'amount', 0.00, 'amount', 'flat_rate', 0.00, 0, 'Manicurex Nail Polish Remover with Sponge, 75 ml', NULL, 'uploads/products/thumbnail/RFQv6sNFPedq8NIRZPLplxqkKmVn0RWA4JwVTW4b.jpeg', NULL, 'Manicurex-Nail-Polish-Remover-with-Sponge-75-ml-kjQpX', 0.00, NULL, 0, NULL, NULL, '2020-12-02 21:49:19', '2021-01-12 16:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `created_at`, `updated_at`) VALUES
(1, 4, 'LightGrey-S-Cotton', 'NM-LightGrey-S-Cotton', 100.00, 10, '2020-11-30 17:37:07', '2020-11-30 17:37:07'),
(2, 4, 'LightGrey-L-Cotton', 'NM-LightGrey-L-Cotton', 100.00, 10, '2020-11-30 17:37:07', '2020-11-30 17:37:07'),
(3, 4, 'LightGrey-XL-Cotton', 'NM-LightGrey-XL-Cotton', 100.00, 10, '2020-11-30 17:37:07', '2020-11-30 17:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `comment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '[\"1\",\"2\",\"4\"]', '2018-10-10 04:39:47', '2018-10-10 04:51:37'),
(2, 'Accountant', '[\"2\",\"3\"]', '2018-10-10 04:52:09', '2018-10-10 04:52:09');

-- --------------------------------------------------------

--
-- Table structure for table `searches`
--

CREATE TABLE `searches` (
  `id` int(11) NOT NULL,
  `query` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searches`
--

INSERT INTO `searches` (`id`, `query`, `count`, `created_at`, `updated_at`) VALUES
(2, 'dcs', 4, '2020-03-08 00:29:09', '2020-12-01 16:36:28'),
(3, 'das', 5, '2020-03-08 00:29:15', '2020-12-01 16:36:28'),
(4, 'clothes', 4, '2020-11-26 13:56:31', '2020-12-01 16:36:28'),
(5, 'huggies', 6, '2020-11-29 21:41:31', '2020-12-01 16:36:29'),
(6, 'nappies', 2, '2020-11-30 20:22:53', '2020-11-30 20:36:28'),
(7, 'DK2918MCUC2S77', 5, '2020-12-01 02:49:05', '2020-12-01 16:36:28'),
(8, 'xxl', 1, '2020-12-01 13:07:05', '2020-12-01 13:07:05'),
(9, 'biscuits', 5, '2020-12-02 17:41:08', '2020-12-02 17:50:39'),
(10, 'fruit juice', 1, '2020-12-02 18:28:48', '2020-12-02 18:28:48'),
(11, 'juice', 2, '2020-12-02 18:29:25', '2020-12-02 19:01:56'),
(12, 'biscuit', 1, '2020-12-02 20:08:44', '2020-12-02 20:08:44'),
(13, 'momo masala', 1, '2020-12-02 20:21:02', '2020-12-02 20:21:02'),
(14, 'chicken masala', 2, '2020-12-02 20:21:13', '2020-12-02 20:23:13'),
(15, 'garam masala', 1, '2020-12-02 20:35:42', '2020-12-02 20:35:42'),
(16, 'curry powder', 1, '2020-12-02 20:54:55', '2020-12-02 20:54:55'),
(17, 'pani puri', 1, '2020-12-02 20:59:53', '2020-12-02 20:59:53'),
(18, 'choco dates', 1, '2020-12-02 21:11:34', '2020-12-02 21:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `verification_status` int(1) NOT NULL DEFAULT 0,
  `verification_info` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `cash_on_delivery_status` int(1) NOT NULL DEFAULT 0,
  `admin_to_pay` double(8,2) NOT NULL DEFAULT 0.00,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_routing_no` int(50) DEFAULT NULL,
  `bank_payment_status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `user_id`, `verification_status`, `verification_info`, `cash_on_delivery_status`, `admin_to_pay`, `bank_name`, `bank_acc_name`, `bank_acc_no`, `bank_routing_no`, `bank_payment_status`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '[{\"type\":\"text\",\"label\":\"Name\",\"value\":\"Mr. Seller\"},{\"type\":\"select\",\"label\":\"Marital Status\",\"value\":\"Married\"},{\"type\":\"multi_select\",\"label\":\"Company\",\"value\":\"[\\\"Company\\\"]\"},{\"type\":\"select\",\"label\":\"Gender\",\"value\":\"Male\"},{\"type\":\"file\",\"label\":\"Image\",\"value\":\"uploads\\/verification_form\\/CRWqFifcbKqibNzllBhEyUSkV6m1viknGXMEhtiW.png\"}]', 1, 78.40, NULL, NULL, NULL, NULL, 0, '2018-10-07 04:42:57', '2020-01-26 04:21:11');

-- --------------------------------------------------------

--
-- Table structure for table `seller_withdraw_requests`
--

CREATE TABLE `seller_withdraw_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `viewed` int(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` int(11) NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revisit` int(11) NOT NULL,
  `sitemap_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `keyword`, `author`, `revisit`, `sitemap_link`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ecommerce nepal,nepali ecommerce,best ecommerce site in nepal', 'Techrida', 11, 'https://www.activeitzone.com', 'KGXpress is such a platform to build a border less marketplace both for physical and digital goods.', '2020-11-23 17:01:05', '2020-11-23 21:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sliders` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `pick_up_point_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `user_id`, `name`, `logo`, `sliders`, `address`, `facebook`, `google`, `twitter`, `youtube`, `slug`, `meta_title`, `meta_description`, `pick_up_point_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 3, 'KGX', 'uploads/shop/logo/TjeV11JxK3ySpwB1Z5aSE7SzirNoWYwlr3bAYLvb.png', '[\"uploads\\/shop\\/sliders\\/lToeKDeUyWcxy1HRs2yH37oBLyIwEwyPkqdyXBRO.jpeg\",\"uploads\\/shop\\/sliders\\/asDBJ3Bro1ijNaNnx3Hpnp6uq3n66ndyLczOJ0F6.jpeg\",\"uploads\\/shop\\/sliders\\/ltwUfHND4QP1K7bPFbuOC4i8v6zL9KHJKzex4zaX.jpeg\"]', 'House : Demo, Road : Demo, Section : Demo', 'www.facebook.com', 'www.google.com', 'www.twitter.com', 'www.youtube.com', 'KGX-1', 'Demo Seller Shop Title', 'Demo description', '[]', 0.00, '2018-11-27 10:23:13', '2021-01-16 16:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT 1,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `photo`, `published`, `link`, `created_at`, `updated_at`) VALUES
(13, 'uploads/sliders/hOuxqs9okQTngEhMtzAKzUH89AJdvVrbODB17Mn8.jpg', 1, 'https://www.kgxpress.com', '2020-12-31 07:02:01', '2020-12-31 07:02:01'),
(14, 'uploads/sliders/qS0AjPEWa68L4RBql096r6KcoQDiU8lhkwxHtlDv.jpg', 1, 'https://www.kgxpress.com', '2020-12-31 07:05:57', '2020-12-31 07:05:57'),
(15, 'uploads/sliders/jgs3KIQdNRa5q97m3bHGUk8PWDD3UV76C8z8DFdU.jpg', 1, 'https://www.kgxpress.com', '2020-12-31 07:06:05', '2020-12-31 07:06:05'),
(16, 'uploads/sliders/qZeIdGyZ5ZVBXNMpl6gf2GimYwwP3F0tO6xWo4JE.jpg', 1, 'https://www.kgxpress.com', '2020-12-31 07:06:13', '2020-12-31 07:06:13');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `category_id`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(13, 'Hair Care', 10, 'Hair-Care-FKnpC', 'Hair Care', 'this is health care products.', '2020-11-30 21:05:05', '2020-11-30 21:05:05'),
(19, 'Personal Care & Hygiene', 10, 'Personal-Care--Hygiene-aPNOr', 'Personal Care & Hygiene', 'Personal Care & Hygiene.', '2020-12-01 17:07:03', '2020-12-01 17:07:03'),
(24, 'Skin Care', 10, 'Skin-Care-r3Pyz', 'Skin Care', 'Skin Care.', '2020-12-01 19:52:59', '2020-12-01 19:52:59'),
(25, 'Dental (health)', 10, 'Dental-health-K7M6D', 'Dental (health)', 'Dental (health).', '2020-12-01 20:49:38', '2020-12-01 20:49:38'),
(26, 'Shower, Bath & Soap', 10, 'Shower-Bath--Soap-CwRqa', 'Shower, Bath & Soap', 'Shower, Bath & Soap.', '2020-12-02 16:24:15', '2020-12-02 16:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `sub_category_id`, `name`, `slug`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(19, 19, 'Feminine Care', 'Feminine-Care-qSM2h', 'Feminine Care', 'Feminine Care.', '2020-12-01 17:07:57', '2020-12-01 17:07:57'),
(21, 24, 'Face Mask & Skin care wipes', 'Face-Mask--Skin-care-wipes-eYsu6', 'Face Mask & Skin care wipes', 'Face Mask & Skin care wipes.', '2020-12-01 19:53:40', '2020-12-01 19:53:40'),
(22, 24, 'Lip Care', 'Lip-Care-MJBkV', 'Lip Care', 'Lip Care.', '2020-12-01 20:12:43', '2020-12-01 20:12:43'),
(23, 26, 'Soap & Hand wash', 'Soap--Hand-wash-0C9Lv', 'Soap & Hand wash', 'Soap & Hand wash.', '2020-12-02 16:25:13', '2020-12-02 16:25:13'),
(24, 13, 'Hair Oil', 'Hair-Oil-vhMc6', 'Hair Oil', 'Hair Oil.', '2020-12-02 16:35:58', '2020-12-02 16:35:58');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `code` int(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `viewed` int(1) NOT NULL DEFAULT 0,
  `client_viewed` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `referred_by` int(11) DEFAULT NULL,
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'customer',
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_email_verificiation_code` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_original` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `banned` tinyint(4) NOT NULL DEFAULT 0,
  `referral_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_package_id` int(11) DEFAULT NULL,
  `remaining_uploads` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `referred_by`, `provider_id`, `user_type`, `name`, `email`, `email_verified_at`, `verification_code`, `new_email_verificiation_code`, `password`, `remember_token`, `avatar`, `avatar_original`, `address`, `country`, `city`, `postal_code`, `phone`, `balance`, `banned`, `referral_code`, `customer_package_id`, `remaining_uploads`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, 'seller', 'Mr. Seller', 'seller@example.com', '2018-12-11 18:00:00', NULL, NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', 'MFa8WtQi2hsMwM6X8vlaY8vvQvhzVQoxkAZhcbwidKBMEnNJeH78oXNdlgYP', 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', 'uploads/ucQhvfz4EQXNeTbN8Eif0Cpq5LnOwvg8t7qKNKVs.jpeg', 'Demo address', 'US', 'Demo city', '1234', NULL, 0.00, 0, '3dLUoHsR1l', NULL, NULL, '2018-10-07 04:42:57', '2020-03-05 01:33:22'),
(8, NULL, NULL, 'customer', 'Mr. Customer', 'customer@example.com', '2018-12-11 18:00:00', NULL, NULL, '$2y$10$eUKRlkmm2TAug75cfGQ4i.WoUbcJ2uVPqUlVkox.cv4CCyGEIMQEm', '9ndcz5o7xgnuxctJIbvUQcP41QKmgnWCc7JDSnWdHOvipOP2AijpamCNafEe', 'https://lh3.googleusercontent.com/-7OnRtLyua5Q/AAAAAAAAAAI/AAAAAAAADRk/VqWKMl4f8CI/photo.jpg?sz=50', 'uploads/ucQhvfz4EQXNeTbN8Eif0Cpq5LnOwvg8t7qKNKVs.jpeg', 'Demo address', 'US', 'Demo city', '1234', NULL, 0.00, 0, '8zJTyXTlTT', NULL, NULL, '2018-10-07 04:42:57', '2020-03-03 04:26:11'),
(9, NULL, NULL, 'admin', 'kgxpress', 'admin@kgxpress.com', '2020-11-23 20:11:02', NULL, NULL, '$2y$10$dO8jJGvJu/eEKyvR/7Q5eeD7MS0Y1e.BPLwZT5Nq4l0pN9O/Vx3FC', 'hjJ8wFZNLxS8Q1N4LiHSiDb3CC2PYhdFjDW5U9C0Oq7JbueQGK7cu5t8CvNJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2020-11-23 20:08:02', '2020-11-30 19:18:18'),
(11, NULL, NULL, 'customer', 'Deepak Kumar Karna', 'karna.deepak@gmail.com', '2020-11-30 22:11:24', NULL, NULL, '$2y$10$0Vowh5PN9EPWf/YpaGpvjuBU3SxovhLqg9ULiN6iXGeD4jvds9HBK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 0, NULL, NULL, 0, '2020-11-30 22:21:23', '2020-11-30 22:21:24');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_details` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_packages`
--
ALTER TABLE `customer_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_products`
--
ALTER TABLE `customer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_categories`
--
ALTER TABLE `home_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pickup_points`
--
ALTER TABLE `pickup_points`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searches`
--
ALTER TABLE `searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sub_category_id` (`sub_category_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_packages`
--
ALTER TABLE `customer_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_package_payments`
--
ALTER TABLE `customer_package_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_products`
--
ALTER TABLE `customer_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_categories`
--
ALTER TABLE `home_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pickup_points`
--
ALTER TABLE `pickup_points`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `searches`
--
ALTER TABLE `searches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seller_withdraw_requests`
--
ALTER TABLE `seller_withdraw_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

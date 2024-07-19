-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2024 at 08:35 AM
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
-- Database: `onlinestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us_generals`
--

CREATE TABLE `about_us_generals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gallery_area_title` varchar(255) DEFAULT NULL,
  `gallery_area_subtitle` text DEFAULT NULL,
  `gallery_third_image` varchar(255) DEFAULT NULL,
  `gallery_second_image` varchar(255) DEFAULT NULL,
  `gallery_first_image` varchar(255) DEFAULT NULL,
  `our_history_title` varchar(255) DEFAULT NULL,
  `our_history_subtitle` text DEFAULT NULL,
  `upgrade_skill_logo` varchar(255) DEFAULT NULL,
  `upgrade_skill_title` varchar(255) DEFAULT NULL,
  `upgrade_skill_subtitle` text DEFAULT NULL,
  `upgrade_skill_button_name` varchar(255) DEFAULT NULL,
  `team_member_logo` varchar(255) DEFAULT NULL,
  `team_member_title` varchar(255) DEFAULT NULL,
  `team_member_subtitle` text DEFAULT NULL,
  `instructor_support_title` varchar(255) DEFAULT NULL,
  `instructor_support_subtitle` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `about_us_generals`
--

INSERT INTO `about_us_generals` (`id`, `gallery_area_title`, `gallery_area_subtitle`, `gallery_third_image`, `gallery_second_image`, `gallery_first_image`, `our_history_title`, `our_history_subtitle`, `upgrade_skill_logo`, `upgrade_skill_title`, `upgrade_skill_subtitle`, `upgrade_skill_button_name`, `team_member_logo`, `team_member_title`, `team_member_subtitle`, `instructor_support_title`, `instructor_support_subtitle`, `created_at`, `updated_at`) VALUES
(1, 'Mere Tranquil Existence, That I Neglect My Talents Should', 'Possession Of My Entire Soul, Like These Sweet Mornings Of Spring Which I Enjoy With My Whole Heart. I Am Alone, And Charm Of Existence In This Spot, Which Was Created For The Bliss Of Souls Like Mine. I Am So Happy, My Dear Friend, So Absorbed In The Exquisite Sense Of Mere Tranquil', 'uploads_demo/gallery/3.jpg', 'uploads_demo/gallery/2.jpg', 'uploads_demo/gallery/1.jpg', 'Our History', 'Possession Of My Entire Soul, Like These Sweet Mornings Of Spring Which I Enjoy With My Whole Heart. I Am Alone, And Charm Of Existence In This Spot Which', 'uploads_demo/about_us_general/upgrade.jpg', 'Upgrade Your Skills Today For Upgrading Your Life A.', 'Noticed by me when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence stalks, and grow familiar with the countless', 'Find Your Course', 'uploads_demo/about_us_general/team-members-heading-img.png', 'Our Passionate Team Members', 'CHOOSE FROM 5,000 ONLINE VIDEO COURSES WITH NEW ADDITIONS', 'Quality Course, Instructor And Support', 'CHOOSE FROM 5,000 ONLINE VIDEO COURSES WITH NEW ADDITIONS', NULL, '2024-06-09 01:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `att_type` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `att_type`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Kg', NULL, '2022-08-02 03:44:19', '2022-08-02 03:44:42'),
(2, NULL, 'Box', NULL, '2022-08-02 03:44:51', '2022-08-02 03:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balances`
--

INSERT INTO `balances` (`id`, `user_id`, `amount`, `created_at`, `updated_at`) VALUES
(22, 18, 55.00, '2024-01-31 17:48:53', '2024-01-31 17:48:53'),
(24, 3, 11.00, '2024-03-15 03:29:02', '2024-03-22 03:29:32'),
(25, 18, 350.00, '2024-03-22 03:14:58', '2024-03-22 03:14:58'),
(26, 9, 52.00, '2024-03-22 18:58:09', '2024-03-22 19:00:47');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_number` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL,
  `account_number` varchar(191) DEFAULT NULL,
  `ifsc_code` varchar(191) DEFAULT NULL,
  `qrcode_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`id`, `user_id`, `bank_name`, `account_number`, `ifsc_code`, `qrcode_path`, `created_at`, `updated_at`) VALUES
(7, NULL, NULL, NULL, NULL, 'Commons_QR_code.png', '2024-04-13 23:44:41', '2024-04-13 23:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(4, '1', '1711624950.jpg', '2024-03-06 20:56:22', '2024-03-28 05:52:30'),
(5, '2', '1711624967.jpg', '2024-03-28 05:52:47', '2024-03-28 05:52:47'),
(6, '3', '1711624985.jpg', '2024-03-28 05:53:05', '2024-03-28 05:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `billing_details`
--

CREATE TABLE `billing_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `postal_code` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `details` mediumtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=published, 0=unpublished',
  `blog_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `og_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `uuid`, `user_id`, `title`, `slug`, `details`, `image`, `status`, `blog_category_id`, `meta_title`, `meta_description`, `meta_keywords`, `og_image`, `created_at`, `updated_at`) VALUES
(1, '40a5dc67-3cd9-4139-8edb-1ba47bd798db', 1, 'Testing 60 Common C# Interview Questions in 2022: Ace Your Next Interview', '60-common-c-interview-questions-in-2022-ace-your-next-interview', '<p>Getting hired as a programmer can be a challenge. There’s a lot of talent out there, and there’s a lot of competition. Many employers are wary of “paper programmers”; people who have no programming experience but just a degree. Because of this, they often ask in-depth programming questions during their interview. These questions can be hard to answer if you haven’t properly prepared. In this article, I’ll help you prepare to ace your next interview with these questions related to the C# programming language. At the same time, you might want to practice with some C# projects. These 50 essential C# questions and answers will help you understand the technical concepts of the language. You’ll walk into a meeting with the hiring manager with confidence. As a developer myself, I use these concepts daily.</p>', 'uploads/blog/1711709069-oqQXafmPDA.jpg', 1, 12, NULL, NULL, NULL, 'uploads/meta/1711709069-5EKGToi5lF.jpg', '2022-12-04 17:05:33', '2024-03-29 05:14:29'),
(3, '78eb086d-192e-4f77-9b3e-25cf9e4d50be', 1, 'Java vs. Python: Which Is the Best Programming Language for You?', 'java-vs-python-which-is-the-best-programming-language-for-you', '<p>Java and Python are both excellent choices for a beginning programmer. You really can’t go wrong by choosing either one. Here are some things these languages have in common. Both are popular and in high demand.Both are open source and don’t require a paid license to use for developers. In the case of Java, if you use the official Oracle Java version, there may be a fee for commercial use payable by your customer/employer when deploying your Java application. However, there are free runtime versions available from multiple vendors as well. You can get started coding in either language today as long as you have an internet connection to download the installation files and a computer that runs Windows, OS X, or Linux.The two languages do have their differences, and developers sometimes prefer one or the other for various reasons. Below is a discussion of those reasons, with hopefully enough information to help you decide which language is the one for you.</p>', 'uploads/blog/1711709013-z0mdZeCBRK.jpg', 1, 12, NULL, NULL, NULL, 'uploads/meta/1711709013-uYHvCC1cxu.jpg', '2022-12-04 17:05:33', '2024-03-29 05:13:33'),
(4, 'ba833949-5b33-4fab-b72b-dcd78e2dd340', 1, 'Learn Coding in Scratch with a Cool Game Idea', 'learn-coding-in-scratch-with-a-cool-game-idea', '<p>Aasif A few years ago, the creation of programs and applications was aimed at only a few people with specialized knowledge. Lately, though, programming for beginners has been possible, thanks to software that has been developed, such as Scratch. In this article, you will see how to create your own game in an easy and fun way. Why start Scratch Coding? The rate at which jobs in the IT sector are growing is almost twice as high as in other industries, and this is only an indication of work in future new technologies. Researchers estimate that “the digital economy is worth $11.5 trillion globally, equivalent to 15.5 percent of global GDP and has grown two and a half times faster than global GDP over the past 15 years.” In a few years, programming knowledge will be fully integrated into educational programs for every age. Using coding concepts, it’s possible to design projects that utilize very similar guidelines and rubrics for a digital project, thereby giving students the opportunity to learn about their topic and sharpen their coding skills at the same time. Future human resources, generations Y and Z, will have at their core the digital skills needed to program.</p>', 'uploads/blog/1711692885-mvFFicBkIs.jpg', 1, 7, NULL, NULL, NULL, 'uploads/meta/1711692895-MZ5eIIR2Kj.png', '2022-12-04 17:05:33', '2024-03-29 00:44:55'),
(7, 'bd20a854-531e-45dd-8678-499858f03395', 1, 'Money markets rates finding the best accounts', 'Money markets rates finding the best accounts-158574', '<p>There are many variations of passages of Lorem Ipsum available, but majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum. There are many variations of passages of Lorem Ipsum available, but majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum. Suspendisse ultricies vestibulum vehicula. Proin laoreet porttitor lacus. Duis auctor vel ex eu elementum. Fusce eu volutpat felis. Proin sed eros tincidunt, sagittis sapien eu, porta diam. Aenean finibus scelerisque nulla non facilisis. Fusce vel orci sed quam gravida condimentum. Aliquam condimentum, massa vel mollis volutpat, erat sem pharetra quam, ac mattis arcu elit non massa. Nam mollis nunc velit, vel varius arcu fringilla tristique. Cras elit nunc, sagittis eu bibendum eu, ultrices placerat sem. Praesent vitae metus dolor. Nulla a erat et orci mattis auctor.</p><p>Mauris non dignissim purus, ac commodo diam. Donec sit amet lacinia nulla. Aliquam quis purus in justo pulvinar tempor. Aliquam tellus nulla, sollicitudin at euismod nec, feugiat at nisi. Quisque vitae odio nec lacus interdum tempus. Phasellus a rhoncus erat. Vivamus vel eros vitae est aliquet pellentesque vitae et nunc. Sed vitae leo vitae nisl pellentesque semper.</p>', 'uploads/blog/1711695657-H0yT0zqTjT.jpg', 0, 7, NULL, NULL, NULL, 'uploads/meta/1711695657-DbOjCe27qr.jpg', '2024-03-29 01:30:29', '2024-03-29 01:30:57'),
(10, '784b3cdc-39de-4b18-8fb1-9d680acfbc90', 1, 'xdfsfsd', 'dfgdffgsd', '<p>fgdfghfhfhrtf</p>', 'uploads/blog/1711696615-cCGANHla2m.jpg', 0, 7, NULL, NULL, NULL, 'uploads/meta/1711696577-la9yMVQbmc.jpg', '2024-03-29 01:46:17', '2024-03-29 01:46:55'),
(11, 'cce6855f-3f66-4dfb-affc-a6570ca0d2b2', 1, 'dfcfghfghtfgh', 'vghfghfd', '<p>bhfg</p>', 'uploads/blog/1711696930-RsHnNy6X4i.jpg', 0, 4, NULL, NULL, NULL, 'uploads/meta/1711696930-rsGnjENMkx.jpg', '2024-03-29 01:52:10', '2024-03-29 01:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1=active, 0=deactivated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `uuid`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, '28828707-9415-4068-adef-12641516486a', 'Development', 'development', 1, '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(2, 'ebe375f1-0a4a-4b3a-bf56-028824c9507f', 'IT & Software', 'it-software', 1, '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(3, '61efe125-6f32-4c7a-b6fe-061a3df3dbd2', 'Data Science', 'data-science', 1, '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(4, '890e77d8-0b8a-4073-9e91-c24d675e1d39', 'Soft Skills', 'soft-skills', 1, '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(5, '911dcac5-1200-4fc4-94f2-2caea6251453', 'Business', 'business', 1, '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(6, 'ad757f0e-a7db-4a60-8efb-0858880690c8', 'Marketing', 'marketing', 1, '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(7, 'e0637550-8560-4e2d-b4c4-fddc8b7bf1a6', 'Design', 'design', 1, '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(12, '22023df6-327e-4475-8802-d0ff8c893bde', 'Crowdffunding', 'Crowdffunding', 1, '2024-03-29 04:48:46', '2024-03-29 04:48:46'),
(13, '693a0f43-353e-4186-a9eb-ce1bb9c7b7ef', 'Innovation', 'Innovation', 1, '2024-03-29 05:15:22', '2024-03-29 05:15:22');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '1=active, 2=deactivate',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `blog_id`, `user_id`, `name`, `email`, `comment`, `status`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'arsh', 'arstech2a@gmail.com', 'Test', 1, NULL, '2024-03-30 02:29:52', '2024-03-30 02:29:52'),
(2, 3, 4, 'alex', 'alex@gmail.com', 'testing python', 1, NULL, '2024-03-30 05:33:01', '2024-03-30 05:33:01'),
(3, 1, 4, 'alex', 'alex@gmail.com', 'replying test arsh', 1, 1, '2024-03-30 05:33:48', '2024-03-30 05:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `blog_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(9, 4, 2, '2024-03-29 00:44:55', '2024-03-29 00:44:55'),
(10, 4, 3, '2024-03-29 00:44:55', '2024-03-29 00:44:55'),
(12, 7, 3, '2024-03-29 01:30:57', '2024-03-29 01:30:57'),
(17, 10, 3, '2024-03-29 01:46:55', '2024-03-29 01:46:55'),
(18, 11, 2, '2024-03-29 01:52:10', '2024-03-29 01:52:10'),
(19, 3, 4, '2024-03-29 05:13:33', '2024-03-29 05:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `is_featured` int(11) DEFAULT NULL,
  `is_publish` int(11) DEFAULT NULL,
  `lan` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `thumbnail`, `is_featured`, `is_publish`, `lan`, `created_at`, `updated_at`) VALUES
(4, 'Rockbros', '09092022091519-400x400-brand-2.png', 1, 1, 'en', '2022-07-30 03:06:07', '2024-06-27 03:11:23'),
(8, 'Shimano', NULL, NULL, NULL, NULL, '2024-06-27 04:19:42', '2024-07-17 01:57:30'),
(9, 'Chaoyang', NULL, NULL, NULL, NULL, '2024-07-17 01:57:57', '2024-07-17 01:57:57'),
(10, 'Troy Lee', NULL, NULL, NULL, NULL, '2024-07-17 01:58:17', '2024-07-17 01:58:17'),
(11, 'KMC', NULL, NULL, NULL, NULL, '2024-07-17 01:58:34', '2024-07-17 01:58:34'),
(12, 'Zoom', NULL, NULL, NULL, NULL, '2024-07-17 01:59:21', '2024-07-17 01:59:21'),
(13, 'Wanda', NULL, NULL, NULL, NULL, '2024-07-17 01:59:38', '2024-07-17 01:59:38'),
(14, 'Dura más', NULL, NULL, NULL, NULL, '2024-07-17 01:59:55', '2024-07-17 01:59:55'),
(15, 'Deckas', NULL, NULL, NULL, NULL, '2024-07-17 02:00:17', '2024-07-17 02:00:17'),
(16, 'Ipro', NULL, NULL, NULL, NULL, '2024-07-17 02:01:11', '2024-07-17 02:01:11'),
(17, 'Aria', NULL, NULL, NULL, NULL, '2024-07-17 02:01:54', '2024-07-17 02:01:54'),
(18, 'Taiwan', NULL, NULL, NULL, NULL, '2024-07-17 02:02:14', '2024-07-17 02:02:14'),
(19, 'Pacific', NULL, NULL, NULL, NULL, '2024-07-17 02:02:38', '2024-07-17 02:02:38'),
(20, 'Trupper', NULL, NULL, NULL, NULL, '2024-07-17 02:02:59', '2024-07-17 02:02:59'),
(21, 'Uyustools', NULL, NULL, NULL, NULL, '2024-07-17 02:03:14', '2024-07-17 02:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `campaign_owner_commission` decimal(8,2) DEFAULT NULL,
  `goal` decimal(16,2) DEFAULT NULL,
  `min_amount` decimal(16,2) DEFAULT NULL,
  `max_amount` decimal(16,2) DEFAULT NULL,
  `recommended_amount` decimal(16,2) DEFAULT NULL,
  `total_funded` decimal(16,2) DEFAULT NULL,
  `total_payments` int(11) DEFAULT NULL,
  `amount_prefilled` varchar(255) DEFAULT NULL,
  `end_method` varchar(20) DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `feature_image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0,
  `country_id` mediumint(9) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_funded` tinyint(4) DEFAULT NULL,
  `is_staff_picks` tinyint(4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_funded_last_upated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `category_id`, `title`, `slug`, `short_description`, `description`, `campaign_owner_commission`, `goal`, `min_amount`, `max_amount`, `recommended_amount`, `total_funded`, `total_payments`, `amount_prefilled`, `end_method`, `views`, `image`, `og_image`, `video`, `feature_image`, `status`, `country_id`, `address`, `is_funded`, `is_staff_picks`, `start_date`, `end_date`, `total_funded_last_upated_at`, `created_at`, `updated_at`) VALUES
(18, 1, 9, 'AudioPhile – First Smart Wireless Headphones', 'audiophile-first-smart-wireless-headphones', 'Mauris non dignissim purus, ac commodo diam. Donec sit amet lacinia nulla.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent vulputate sed mauris vitae pellentesque. Nunc ut ullamcorper libero. Aenean fringilla mauris quis risus laoreet interdum. Quisque imperdiet orci in metus aliquam egestas. Fusce elit libero, imperdiet nec orci quis, convallis hendrerit nisl. Cras auctor nec purus at placerat. Nsectetur cing mauris quis risus laoreet elit. Suspe ndisse dolor sit amet suscipit sagittis leo. Entum estibulum metus aliquam egestas dignissim posuere. If you are going to use a auctor nec purus passage.</p>', NULL, 3600.00, NULL, NULL, NULL, 0.00, 0, NULL, 'goal_achieve', NULL, 'uploads/Projects/1712133331-v3SntSAo4G.jpg', 'uploads/meta/1711969317-VtUA8tyZ9n.jpg', NULL, '', 1, 3, 'ShenZhen', 0, NULL, '2024-04-04', '2024-06-07', '2024-04-14 00:09:07', '2024-04-01 05:31:57', '2024-04-16 22:26:36'),
(29, 1, 15, 'Non qui dolor et et iste veniam.', 'non-qui-dolor-et-et-iste-veniam-1', 'Non amet dolor commodi nemo voluptas veritatis aperiam. Earum porro ad explicabo laboriosam nulla architecto eaque at. Voluptatem ipsam qui placeat est.', '<p>Voluptate quia quibusdam dolor dolore. Temporibus facilis quia sed iure necessitatibus soluta. Voluptatem pariatur esse quia et. Voluptatem quo cum est ea.</p>', NULL, 4511.28, NULL, NULL, 87.06, 501.15, 211544059, '27433198', 'goal_achieve', 7396, 'uploads/Projects/1712133375-VtLfwjsLDX.jpg', 'uploads/meta/1712065434-nqNcnZB2BU.jpg', NULL, 'https://via.placeholder.com/640x480.png/00dd00?text=molestiae', 0, 1, '118 Gottlieb Turnpike Suite 500New Deonteville, NY 45839', 0, 0, '2008-05-14', '2024-04-24', '2004-09-28 09:38:13', '2024-04-02 07:18:55', '2024-04-12 01:21:22'),
(30, 1, 6, 'Aut distinctio molestiae accusamus sint reprehenderit aut et.', 'aut-distinctio-molestiae-accusamus-sint-reprehenderit-aut-et-1', 'Magnam exercitationem sunt ut odit. Hic veritatis magni qui.', '<p>Dolorum architecto in non aliquid omnis reiciendis quae. Accusamus non nam consectetur laborum culpa dignissimos.</p>', NULL, 5348.50, NULL, NULL, 35.22, 471.95, 91652508, '650', 'end_date', 3089, 'uploads/Projects/1712133411-jp1OBYXhvg.jpg', 'uploads/meta/1712066037-7OswKZKvlc.jpg', NULL, 'https://via.placeholder.com/640x480.png/00ff88?text=ad', 1, 2, '14596 Tate GardensSouth Ethelyn, FL 70648-6204', 0, 0, '2019-02-21', '2024-04-30', '2024-01-01 01:59:33', '2024-04-02 07:18:55', '2024-04-13 21:47:17'),
(31, 28, 15, 'Dolor asperiores suscipit magni numquam.', 'dolor-asperiores-suscipit-magni-numquam-1', 'Officia repellat eum est quod eum nobis. Deserunt perferendis ut maiores cupiditate officia exercitationem. Labore est nesciunt eos quos aperiam ratione.', '<p>Accusantium iusto quis modi aut ut. Sed id unde praesentium. Beatae molestias dicta pariatur eum. Nihil voluptatum nisi id et aut quo. Est iusto velit praesentium pariatur maiores dolor.</p>', NULL, 8549.32, NULL, NULL, 43.69, 4719.36, 2949203, '2406', 'goal_achieve', 14809561, 'uploads/Projects/1712066183-qzmE2mOJVn.jpg', 'uploads/meta/1712066183-H316sGeour.jpg', NULL, 'https://via.placeholder.com/640x480.png/0077cc?text=reprehenderit', 1, NULL, '204 Christiansen CrescentLake Allison, MT 70434-8739', 0, 0, '1975-02-05', '2024-05-05', '2009-06-23 04:05:43', '2024-04-02 07:18:55', '2024-04-13 21:48:21'),
(32, 1, 3, 'Iste qui deleniti quidem velit dolor sint.', 'iste-qui-deleniti-quidem-velit-dolor-sint-1', 'Veritatis perspiciatis qui voluptatem et aut voluptatem. Voluptatum nesciunt et modi. Quaerat deleniti sit reprehenderit qui nemo.', '<p>Omnis sit iure magnam laborum. Occaecati pariatur illo recusandae dolore corrupti. Qui veniam error eos a minima. Ut illum labore dolor quae velit. Quis dolor quis minima voluptates nihil.</p>', NULL, 1964.13, NULL, NULL, 77.86, 451.39, 3067026, '81598111', NULL, 7772, 'uploads/Projects/1712066128-skgCH5GYWr.jpg', 'uploads/meta/1712066128-PatM3tYXIm.jpg', NULL, 'https://via.placeholder.com/640x480.png/00eedd?text=quia', 0, 1, '359 Georgette ViaductWest Lacyport, AR 55365-3615', 0, 1, '2002-05-18', NULL, '2016-06-06 07:41:38', '2024-04-02 07:18:55', '2024-04-13 21:49:28'),
(42, 3, 14, 'Unogesic MR 250mg/50mg/325mg Tablet wow', 'unogesic-mr-250mg50mg325mg-tablet-wow-1', 'MARKETER\r\nCurewell Drugs and Pharmaceuticals Pvt Ltd\r\nSALT COMPOSITION\r\nChlorzoxazone (250mg) + Diclofenac (50mg) + Paracetamol (325mg)\r\nSTORAGE\r\nStore below 30°C', '<p>Unogesic MR 250mg/50mg/325mg Tablet is a combination medicine used in the treatment of pain due to muscle spasms. It improves the movement of muscles and provides relief from pain and discomfort associated with muscle spasms. Unogesic MR 250mg/50mg/325mg Tablet should be taken with food. This will prevent you from getting an upset stomach. You should take it regularly as advised by your doctor. Do not take more or use it for a longer duration than recommended by your doctor. Using this medicine can cause some common side effects such as nausea, vomiting, heartburn, stomach pain, diarrhea, loss of appetite, and dryness in the mouth. If any of these side effects bother you or do not go away with time, you should let your doctor know. Your doctor may help with ways to reduce or prevent these side effects. The medicine may not be suitable for everybody. Before taking it, let your doctor know if you have any problems with your heart, kidneys, or liver. To make sure it is safe for you, let your doctor also know all the other medicines you are taking. Pregnant and breastfeeding mothers should first consult their doctors before using the medicine. USES OF UNOGESIC MR TABLET Treatment of Pain due to muscle spasm BENEFITS OF UNOGESIC MR TABLET In Treatment of Pain due to muscle spasm Unogesic MR 250mg/50mg/325mg Tablet is a combination medicine that is used to relieve pain, inflammation, and swelling in conditions that affect muscles. Also, it effectively relieves muscle stiffness or spasm, thereby improving muscle movement. It works by blocking chemical messengers in the brain that tell us we have pain. Take it as it is prescribed to get the most benefit. Do not take more or longer than needed as that can be dangerous. In general, you should take the lowest dose that works, for the shortest possible time. This will help you to go about your daily activities more easily and have a better, more active, quality of life.</p>', NULL, 5000.00, NULL, NULL, 375.00, NULL, NULL, '1000', 'goal_achieve', NULL, 'uploads/Projects/1712465958-VfWv9yeUEp.jpg', 'uploads/meta/1712465958-QQawXoZ4ri.jpg', NULL, '', 0, 4, 'Indore, Madhaya Pradesh, India', 0, NULL, '2024-04-10', '2024-04-17', NULL, '2024-04-06 23:29:18', '2024-04-13 21:49:50');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `color`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(43, 33, 82, 'blanco', 40.00, 10, '2024-07-16 21:54:47', '2024-07-16 21:55:23'),
(44, 33, 83, 'naranja', 40.00, 10, '2024-07-16 21:54:59', '2024-07-16 21:55:34');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_feature` varchar(10) NOT NULL DEFAULT 'no' COMMENT 'yes, no',
  `slug` varchar(255) NOT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `og_image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=active, 0=inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `uuid`, `name`, `image`, `is_feature`, `slug`, `meta_title`, `meta_description`, `meta_keywords`, `og_image`, `status`, `created_at`, `updated_at`) VALUES
(7, '90cd37ac-b804-4095-a471-3651ec40718a', 'Bicicleta', 'uploads/category/1720419591-OiolP0oVX7.svg', 'no', 'Bicicleta', 'Bicicleta', 'Bicicleta', 'Bicicleta', 'uploads/meta/1720419591-rFBebR3bND.svg', 1, '2022-12-04 17:05:33', '2024-07-08 06:19:51'),
(9, 'a1d1c370-5ce4-4bbc-9b27-5e8645282259', 'Motocicleta', 'uploads/category/1720753152-aVZCoC6QrF.png', 'no', 'Motocicleta', NULL, NULL, NULL, 'uploads/meta/1720753152-eGKVPr8FL3.png', 1, '2022-12-04 17:05:33', '2024-07-12 02:59:12'),
(14, '86008391-2012-4caa-8a23-671590e5ce89', 'Shimano', 'uploads/category/1720753178-uBy8xNIuYv.png', 'no', 'Shimano', NULL, NULL, NULL, 'uploads/meta/1720753178-6DpInDWdgL.png', 1, '2024-03-31 01:43:56', '2024-07-12 02:59:38'),
(15, 'd5a337f2-8f46-47ea-ab54-bb651bcafc2c', 'Linea de carga', 'uploads/category/1720753204-jnK9HK3G44.png', 'no', 'Linea-de-carga', NULL, NULL, NULL, 'uploads/meta/1720753204-D3aASkGblP.png', 1, '2024-03-31 02:06:32', '2024-07-12 03:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `campaign_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_seen` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `sender_id`, `receiver_id`, `campaign_id`, `message`, `is_seen`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 25, 0, 'THIS IS TESTING FROM FULL STACK DEV', 0, '2024-04-08 06:53:24', '2024-04-08 06:53:24', NULL),
(2, 3, 25, 0, 'ret', 0, '2024-04-08 06:55:25', '2024-04-08 06:55:25', NULL),
(3, 3, 25, 0, 'f', 0, '2024-04-08 06:57:24', '2024-04-08 06:57:24', NULL),
(4, 3, 25, 0, 'sd', 0, '2024-04-08 07:02:12', '2024-04-08 07:02:12', NULL),
(5, 3, 25, 0, 'funcking', 0, '2024-04-08 07:02:24', '2024-04-08 07:02:24', NULL),
(6, 3, 25, 0, 'testing 555', 0, '2024-04-08 07:17:49', '2024-04-08 07:17:49', NULL),
(7, 3, 25, 0, 'testing 555', 0, '2024-04-08 07:19:14', '2024-04-08 07:19:14', NULL),
(8, 25, 26, 0, 'hi park', 0, '2024-04-08 09:04:07', '2024-04-08 09:04:07', NULL),
(9, 25, 4, 0, 'how are you alex', 0, '2024-04-08 09:07:35', '2024-04-08 09:07:35', NULL),
(10, 3, 25, 0, 'hey', 0, '2024-04-08 09:08:46', '2024-04-08 09:08:46', NULL),
(11, 3, 25, 0, 'wow', 0, '2024-04-08 09:16:21', '2024-04-08 09:16:21', NULL),
(12, 25, 3, 0, 'sd', 0, '2024-04-08 09:17:32', '2024-04-08 09:17:32', NULL),
(13, 25, 3, 0, 'THIS IS TESTING FROM FULL STACK DEV', 0, '2024-04-08 09:17:55', '2024-04-08 09:17:55', NULL),
(14, 3, 25, 0, 'fgdxgfgdf shitttttttttttttttttttttttt', 0, '2024-04-08 09:18:38', '2024-04-08 09:18:38', NULL),
(15, 25, 3, 0, 'cfgdfg', 0, '2024-04-08 09:21:48', '2024-04-08 09:21:48', NULL),
(16, 3, 25, 0, 'eneough', 0, '2024-04-08 09:24:08', '2024-04-08 09:24:08', NULL),
(17, 25, 3, 0, 'aisa', 0, '2024-04-08 09:24:58', '2024-04-08 09:24:58', NULL),
(18, 3, 25, 0, 'image', 0, '2024-04-08 09:25:28', '2024-04-08 09:25:28', NULL),
(19, 3, 1, 0, 'Hey You', 0, '2024-04-08 12:06:11', '2024-04-08 12:06:11', NULL),
(20, 1, 3, 0, 'what', 0, '2024-04-08 12:06:39', '2024-04-08 12:06:39', NULL),
(21, 3, 1, 0, 'you get my idea', 0, '2024-04-08 12:07:46', '2024-04-08 12:07:46', NULL),
(22, 1, 3, 0, 'now looks good', 0, '2024-04-08 12:59:16', '2024-04-08 12:59:16', NULL),
(23, 3, 1, 0, 'yeah', 0, '2024-04-08 12:59:32', '2024-04-08 12:59:32', NULL),
(24, 1, 3, 0, 'df', 0, '2024-04-08 23:06:18', '2024-04-08 23:06:18', NULL),
(25, 1, 3, 0, 'pusher', 0, '2024-04-08 23:16:08', '2024-04-08 23:16:08', NULL),
(26, 3, 1, 0, 'ok', 0, '2024-04-08 23:17:02', '2024-04-08 23:17:02', NULL),
(27, 1, 3, 0, 'dsf', 0, '2024-04-08 23:17:29', '2024-04-08 23:17:29', NULL),
(28, 1, 3, 0, 'cvbc', 0, '2024-04-08 23:19:30', '2024-04-08 23:19:30', NULL),
(29, 3, 1, 0, 'p', 0, '2024-04-08 23:51:31', '2024-04-08 23:51:31', NULL),
(30, 4, 3, 0, 'hi arsh g', 0, '2024-04-08 23:56:22', '2024-04-08 23:56:22', NULL),
(31, 3, 4, 0, 'yes', 0, '2024-04-08 23:56:39', '2024-04-08 23:56:39', NULL),
(32, 3, 4, 0, 'index', 0, '2024-04-09 00:00:42', '2024-04-09 00:00:42', NULL),
(33, 3, 4, 0, 'dfsd', 0, '2024-04-09 00:01:12', '2024-04-09 00:01:12', NULL),
(34, 4, 3, 0, 'dsfsfgfhgh', 0, '2024-04-09 00:01:21', '2024-04-09 00:01:21', NULL),
(35, 4, 3, 0, 'cha', 0, '2024-04-09 00:04:46', '2024-04-09 00:04:46', NULL),
(36, 3, 4, 0, 'okk', 0, '2024-04-09 00:05:27', '2024-04-09 00:05:27', NULL),
(37, 3, 4, 0, 'n', 0, '2024-04-09 00:06:58', '2024-04-09 00:06:58', NULL),
(38, 4, 3, 0, 'what', 0, '2024-04-09 00:07:18', '2024-04-09 00:07:18', NULL),
(39, 4, 3, 0, 'vcc', 0, '2024-04-09 00:09:39', '2024-04-09 00:09:39', NULL),
(40, 3, 4, 0, 'dfgxcvnjhkjhk', 0, '2024-04-09 00:10:00', '2024-04-09 00:10:00', NULL),
(41, 3, 4, 0, 'difficult', 0, '2024-04-09 00:21:07', '2024-04-09 00:21:07', NULL),
(42, 4, 3, 0, 'where', 0, '2024-04-09 00:22:48', '2024-04-09 00:22:48', NULL),
(43, 4, 3, 0, 'df', 0, '2024-04-09 00:32:55', '2024-04-09 00:32:55', NULL),
(44, 3, 4, 0, 'rtyt', 0, '2024-04-09 00:33:14', '2024-04-09 00:33:14', NULL),
(45, 4, 3, 0, 'chat event', 0, '2024-04-09 00:45:07', '2024-04-09 00:45:07', NULL),
(46, 3, 4, 0, 'k', 0, '2024-04-09 00:45:41', '2024-04-09 00:45:41', NULL),
(47, 4, 3, 0, 'pppppp', 0, '2024-04-09 00:57:55', '2024-04-09 00:57:55', NULL),
(48, 4, 3, 0, 'fuck you', 0, '2024-04-09 01:05:15', '2024-04-09 01:05:15', NULL),
(49, 3, 4, 0, 'bitvh', 0, '2024-04-09 01:05:46', '2024-04-09 01:05:46', NULL),
(50, 3, 4, 0, 'testing', 0, '2024-04-09 01:17:36', '2024-04-09 01:17:36', NULL),
(51, 4, 3, 0, 'mfgfdg', 0, '2024-04-09 01:22:27', '2024-04-09 01:22:27', NULL),
(52, 3, 4, 0, 'fdgd', 0, '2024-04-09 01:23:03', '2024-04-09 01:23:03', NULL),
(53, 4, 3, 0, 'testing 5', 0, '2024-04-09 01:23:32', '2024-04-09 01:23:32', NULL),
(54, 3, 4, 0, 'wow it\'s working fine now', 0, '2024-04-09 01:23:51', '2024-04-09 01:23:51', NULL),
(55, 4, 3, 0, 'congrate', 0, '2024-04-09 01:24:29', '2024-04-09 01:24:29', NULL),
(56, 3, 4, 0, 'really', 0, '2024-04-09 01:24:46', '2024-04-09 01:24:46', NULL),
(57, 4, 3, 0, 'something wrog', 0, '2024-04-09 01:26:11', '2024-04-09 01:26:11', NULL),
(58, 3, 4, 0, 'no', 0, '2024-04-09 01:26:48', '2024-04-09 01:26:48', NULL),
(59, 4, 3, 0, 'dfg', 0, '2024-04-09 01:27:17', '2024-04-09 01:27:17', NULL),
(60, 3, 4, 0, 'dsf', 0, '2024-04-09 01:32:31', '2024-04-09 01:32:31', NULL),
(61, 4, 3, 0, 'ghdfghdf', 0, '2024-04-09 01:32:41', '2024-04-09 01:32:41', NULL),
(62, 3, 4, 0, 'hgj', 0, '2024-04-09 01:32:51', '2024-04-09 01:32:51', NULL),
(63, 3, 4, 0, 'jhkhk', 0, '2024-04-09 01:33:02', '2024-04-09 01:33:02', NULL),
(64, 4, 3, 0, 'ds', 0, '2024-04-09 01:37:44', '2024-04-09 01:37:44', NULL),
(65, 3, 4, 0, 'fgh', 0, '2024-04-09 01:37:57', '2024-04-09 01:37:57', NULL),
(66, 4, 3, 0, 'ghh', 0, '2024-04-09 01:38:04', '2024-04-09 01:38:04', NULL),
(67, 3, 4, 0, 'gfh', 0, '2024-04-09 01:38:08', '2024-04-09 01:38:08', NULL),
(68, 3, 4, 0, 'ghj', 0, '2024-04-09 01:38:36', '2024-04-09 01:38:36', NULL),
(69, 3, 4, 0, 'hjgjg', 0, '2024-04-09 01:40:14', '2024-04-09 01:40:14', NULL),
(70, 4, 3, 0, 'dfgdg', 0, '2024-04-09 01:45:02', '2024-04-09 01:45:02', NULL),
(71, 3, 4, 0, 'h', 0, '2024-04-09 01:52:31', '2024-04-09 01:52:31', NULL),
(72, 4, 3, 0, 'sd', 0, '2024-04-09 01:52:39', '2024-04-09 01:52:39', NULL),
(73, 3, 4, 0, 'final', 0, '2024-04-09 02:01:01', '2024-04-09 02:01:01', NULL),
(74, 4, 3, 0, 'testing', 0, '2024-04-09 02:01:10', '2024-04-09 02:01:10', NULL),
(75, 4, 3, 0, 'notify', 0, '2024-04-09 02:31:55', '2024-04-09 02:31:55', NULL),
(76, 4, 3, 0, 'dfsdfsfsdfds', 0, '2024-04-09 02:41:27', '2024-04-09 02:41:27', NULL),
(77, 3, 4, 0, 'what', 0, '2024-04-09 02:41:51', '2024-04-09 02:41:51', NULL),
(78, 4, 3, 0, 'nnnnnnn', 0, '2024-04-09 02:43:52', '2024-04-09 02:43:52', NULL),
(79, 4, 3, 0, 'adm', 0, '2024-04-09 02:50:39', '2024-04-09 02:50:39', NULL),
(80, 3, 4, 0, 'THIS IS TESTING FROM FULL STACK DEV', 0, '2024-04-09 03:40:08', '2024-04-09 03:40:08', NULL),
(81, 4, 3, 0, 'done', 0, '2024-04-09 03:40:19', '2024-04-09 03:40:19', NULL),
(82, 3, 4, 0, 'check', 0, '2024-04-09 03:45:25', '2024-04-09 03:45:25', NULL),
(83, 4, 3, 0, 'fgdf', 0, '2024-04-09 03:45:56', '2024-04-09 03:45:56', NULL),
(84, 4, 3, 0, 'fdgfhgfhfh', 0, '2024-04-09 03:45:59', '2024-04-09 03:45:59', NULL),
(85, 4, 3, 0, 'ertete', 0, '2024-04-09 03:46:02', '2024-04-09 03:46:02', NULL),
(86, 4, 3, 0, 'iouo', 0, '2024-04-09 03:59:09', '2024-04-09 03:59:09', NULL),
(87, 4, 3, 0, 'bbhhgjghj', 0, '2024-04-09 03:59:14', '2024-04-09 03:59:14', NULL),
(88, 3, 4, 0, 'fghfdgfd', 0, '2024-04-09 04:00:24', '2024-04-09 04:00:24', NULL),
(89, 3, 4, 0, 'vbnvn', 0, '2024-04-09 04:00:29', '2024-04-09 04:00:29', NULL),
(90, 4, 3, 0, 'vbvzzx', 0, '2024-04-09 04:01:05', '2024-04-09 04:01:05', NULL),
(91, 4, 3, 0, 'weqeqe', 0, '2024-04-09 04:01:10', '2024-04-09 04:01:10', NULL),
(92, 4, 3, 0, 'kj;j;jljkl', 0, '2024-04-09 04:01:15', '2024-04-09 04:01:15', NULL),
(93, 3, 4, 0, 'hey whats up', 0, '2024-04-09 07:38:06', '2024-04-09 07:38:06', NULL),
(94, 4, 3, 0, 'just testing chatting feature', 0, '2024-04-09 07:38:26', '2024-04-09 07:38:26', NULL),
(95, 3, 4, 0, 'yeah it\'s working', 0, '2024-04-09 07:38:50', '2024-04-09 07:38:50', NULL),
(96, 4, 3, 0, 'i know but you need to improve chatting system more', 0, '2024-04-09 07:39:27', '2024-04-09 07:39:27', NULL),
(97, 3, 4, 0, 'yeah i will', 0, '2024-04-09 07:39:50', '2024-04-09 07:39:50', NULL),
(98, 4, 3, 0, 'eneough for now', 0, '2024-04-09 07:40:13', '2024-04-09 07:40:13', NULL),
(99, 3, 4, 0, 'ok', 0, '2024-04-09 07:40:21', '2024-04-09 07:40:21', NULL),
(100, 3, 4, 0, 'hi', 0, '2024-04-09 08:02:14', '2024-04-09 08:02:14', NULL),
(101, 4, 3, 0, 'hi', 0, '2024-04-09 08:02:30', '2024-04-09 08:02:30', NULL),
(102, 4, 3, 0, 'mfgfdg', 0, '2024-04-09 08:02:56', '2024-04-09 08:02:56', NULL),
(103, 3, 4, 0, 'rrr', 0, '2024-04-09 08:10:21', '2024-04-09 08:10:21', NULL),
(104, 4, 3, 0, '3333', 0, '2024-04-09 08:10:34', '2024-04-09 08:10:34', NULL),
(105, 3, 4, 0, 'sd', 0, '2024-04-09 08:10:55', '2024-04-09 08:10:55', NULL),
(106, 3, 4, 0, 'sdfa', 0, '2024-04-09 08:11:04', '2024-04-09 08:11:04', NULL),
(107, 4, 3, 0, 'sdd', 0, '2024-04-09 08:11:18', '2024-04-09 08:11:18', NULL),
(108, 3, 4, 0, 'sdf', 0, '2024-04-09 08:11:29', '2024-04-09 08:11:29', NULL),
(109, 4, 3, 0, 'sd', 0, '2024-04-09 08:12:00', '2024-04-09 08:12:00', NULL),
(110, 3, 4, 0, 'dfghf', 0, '2024-04-09 08:12:43', '2024-04-09 08:12:43', NULL),
(111, 4, 3, 0, '[[[', 0, '2024-04-09 08:12:57', '2024-04-09 08:12:57', NULL),
(112, 3, 4, 0, ']]]', 0, '2024-04-09 08:13:14', '2024-04-09 08:13:14', NULL),
(113, 3, 4, 0, 'n', 0, '2024-04-17 01:54:38', '2024-04-17 01:54:38', NULL),
(114, 4, 3, 0, 'd', 0, '2024-04-17 01:55:10', '2024-04-17 01:55:10', NULL),
(115, 4, 3, 0, 'it is working', 0, '2024-04-17 02:00:33', '2024-04-17 02:00:33', NULL),
(116, 3, 4, 0, 'yeah', 0, '2024-04-17 02:01:08', '2024-04-17 02:01:08', NULL),
(117, 4, 3, 0, 'confuse', 0, '2024-04-17 02:03:13', '2024-04-17 02:03:13', NULL),
(118, 3, 4, 0, 'tell me confesiion you have', 0, '2024-04-17 02:04:11', '2024-04-17 02:04:11', NULL),
(119, 3, 1, 0, 'hi', 0, '2024-04-17 02:53:58', '2024-04-17 02:53:58', NULL),
(120, 28, 28, 0, 'fuck you', 0, '2024-04-17 02:58:24', '2024-04-17 02:58:24', NULL),
(121, 4, 28, 0, 'j', 0, '2024-04-17 03:00:31', '2024-04-17 03:00:31', NULL),
(122, 28, 28, 0, 'y', 0, '2024-04-17 03:01:04', '2024-04-17 03:01:04', NULL),
(123, 28, 4, 0, 'THIS IS TESTING FROM FULL STACK DEV', 0, '2024-04-17 03:02:49', '2024-04-17 03:02:49', NULL),
(124, 4, 28, 0, 'sd', 0, '2024-04-17 03:04:51', '2024-04-17 03:04:51', NULL),
(125, 28, 4, 0, 'f', 0, '2024-04-17 03:05:06', '2024-04-17 03:05:06', NULL),
(126, 4, 28, 0, 'FROM', 0, '2024-04-17 03:10:10', '2024-04-17 03:10:10', NULL),
(127, 4, 1, 0, 'd', 0, '2024-04-17 03:13:08', '2024-04-17 03:13:08', NULL),
(128, 1, 4, 0, 'what happen', 0, '2024-04-17 03:14:12', '2024-04-17 03:14:12', NULL),
(129, 29, 4, 0, 'chatting with mail notification', 0, '2024-04-17 03:22:53', '2024-04-17 03:22:53', NULL),
(130, 29, 4, 0, 'chatting with mail notification', 0, '2024-04-17 03:22:57', '2024-04-17 03:22:57', NULL),
(131, 4, 29, 0, 'yeah', 0, '2024-04-17 03:24:34', '2024-04-17 03:24:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `incoming_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `outgoing_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `view` tinyint(4) DEFAULT 2 COMMENT '1=seen,2=not seen',
  `created_user_type` tinyint(4) DEFAULT NULL COMMENT '1=student,2=instructor',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `state_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dhanmondi', NULL, NULL),
(2, 1, 'Bannai', NULL, NULL),
(4, 2, 'Zero Point', NULL, NULL),
(5, 3, 'Tomchombridge', NULL, NULL),
(6, 3, 'Cantonment', NULL, NULL),
(7, 4, 'Acton', NULL, NULL),
(8, 4, 'Alamo', NULL, NULL),
(9, 5, 'Albin', NULL, NULL),
(10, 6, 'Bartow', NULL, NULL),
(11, 7, 'Oban', NULL, NULL),
(12, 8, 'Holywood', NULL, NULL),
(13, 9, 'Ely', NULL, NULL),
(14, 1, 'Tejgaon', '2024-06-07 06:12:00', '2024-06-07 06:14:19');

-- --------------------------------------------------------

--
-- Table structure for table `client_logos`
--

CREATE TABLE `client_logos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_logos`
--

INSERT INTO `client_logos` (`id`, `name`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Ovita', 'uploads/client_logo/1717911112ZuNbnoRDHn.jpg', '2022-12-04 17:05:33', '2024-06-09 00:01:52'),
(2, 'Vigon', 'uploads/client_logo/1717911112raPxvjv9WV.jpg', '2022-12-04 17:05:33', '2024-06-09 00:01:52'),
(3, 'Betribe', 'uploads_demo/client-logo/3.png', '2022-12-04 17:05:33', '2024-06-09 00:01:52'),
(4, 'Parsit', 'uploads_demo/client-logo/4.png', '2022-12-04 17:05:33', '2024-06-09 00:01:52'),
(6, 'sp', 'uploads/client_logo/1717911112-J06X6bqrjB.png', '2024-06-09 00:01:52', '2024-06-09 00:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'rojo', '2024-07-19 06:11:19', '2024-07-19 06:11:19'),
(2, 'verde', '2024-07-19 06:12:15', '2024-07-19 06:12:15'),
(3, 'azul', '2024-07-19 06:12:46', '2024-07-19 06:12:46'),
(4, 'negro', '2024-07-19 06:13:05', '2024-07-19 06:13:05'),
(5, 'blanco', '2024-07-19 06:13:20', '2024-07-19 06:13:20'),
(6, 'amarillo', '2024-07-19 06:13:34', '2024-07-19 06:13:34'),
(7, 'morado', '2024-07-19 06:13:51', '2024-07-19 06:13:51'),
(8, 'naranja', '2024-07-19 06:14:04', '2024-07-19 06:14:04'),
(9, 'rosa', '2024-07-19 06:14:19', '2024-07-19 06:14:19'),
(10, 'marrón', '2024-07-19 06:14:33', '2024-07-19 06:14:33'),
(11, 'gris', '2024-07-19 06:14:48', '2024-07-19 06:14:48'),
(12, 'asdad dfgdgdg', '2024-07-19 06:16:44', '2024-07-19 06:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_us_issue_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `short_name` varchar(10) NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `flag` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `phonecode` varchar(255) NOT NULL,
  `continent` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `short_name`, `country_name`, `flag`, `slug`, `phonecode`, `continent`, `created_at`, `updated_at`) VALUES
(1, 'BD', 'Bangladesh', '', 'bangladesh', '+88', 'Asia', NULL, NULL),
(2, 'USA', 'United States', '', 'united-states', '+1', 'North America', NULL, NULL),
(3, 'UK', 'United Kingdom', '', 'united-kingdom', '+44', 'Europe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_code` varchar(255) NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `currency_placement` varchar(255) NOT NULL DEFAULT 'before' COMMENT 'before, after',
  `current_currency` varchar(255) NOT NULL DEFAULT 'no' COMMENT 'on, off',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_code`, `symbol`, `currency_placement`, `current_currency`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'before', 'on', NULL, '2024-06-07 01:19:30'),
(2, 'BDT', '৳', 'before', 'off', NULL, '2024-06-07 01:19:30'),
(3, 'INR', '₹', 'before', 'off', NULL, '2024-06-07 01:19:30'),
(4, 'GBP', '£', 'after', 'off', NULL, '2024-06-07 01:19:30'),
(5, 'MXN', '$', 'before', 'off', NULL, '2024-06-07 01:19:30'),
(6, 'SAR', 'SR', 'before', 'off', NULL, '2024-06-07 01:19:30'),
(7, 'TRY', '₺', 'after', 'off', NULL, '2024-06-07 01:19:30'),
(8, 'ARS', '$', 'before', 'off', NULL, '2024-06-07 01:19:30'),
(9, 'EUR', '€', 'before', 'off', NULL, '2024-06-07 01:19:30'),
(11, 'BS', 'BS', 'before', 'no', '2024-06-07 04:12:21', '2024-06-07 04:12:21'),
(12, 'Dinars', 'Dinar', 'after', 'no', '2024-06-07 04:20:07', '2024-06-07 05:04:11'),
(18, 'sdad', 'sdad', 'before', 'no', '2024-06-07 05:05:26', '2024-06-07 05:05:26'),
(19, 'cgbfdgg', 'fgdgd', 'before', 'no', '2024-06-07 05:07:56', '2024-06-07 05:07:56');

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
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(255) NOT NULL DEFAULT 'UTC',
  `default_language` varchar(255) NOT NULL DEFAULT 'en',
  `styling` varchar(255) NOT NULL DEFAULT 'light',
  `address` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `site_favicon` varchar(255) DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` text DEFAULT NULL,
  `site_header_code` text DEFAULT NULL,
  `site_footer_code` text DEFAULT NULL,
  `site_copyright` text DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `footer_fb_link` varchar(500) DEFAULT NULL,
  `footer_twitter_link` varchar(500) DEFAULT NULL,
  `footer_instagram_link` varchar(500) DEFAULT NULL,
  `footer_google_play_link` varchar(500) DEFAULT NULL,
  `footer_apple_store_link` varchar(500) DEFAULT NULL,
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(255) DEFAULT NULL,
  `smtp_email` varchar(255) DEFAULT NULL,
  `smtp_password` varchar(255) DEFAULT NULL,
  `smtp_encryption` varchar(255) DEFAULT NULL,
  `google_login` varchar(255) DEFAULT NULL,
  `facebook_login` varchar(255) DEFAULT NULL,
  `google_client_id` varchar(255) DEFAULT NULL,
  `google_client_secret` varchar(255) DEFAULT NULL,
  `google_redirect` text DEFAULT NULL,
  `facebook_app_id` varchar(255) DEFAULT NULL,
  `facebook_client_secret` varchar(255) DEFAULT NULL,
  `facebook_redirect` text DEFAULT NULL,
  `linkedin_login` varchar(225) DEFAULT NULL,
  `linkedin_client_id` varchar(225) DEFAULT NULL,
  `linkedin_app_id` varchar(225) DEFAULT NULL,
  `Instagram_login` varchar(225) DEFAULT NULL,
  `Instagram_client_id` varchar(225) DEFAULT NULL,
  `instagram_app_id` varchar(225) DEFAULT NULL,
  `git_login` varchar(225) DEFAULT NULL,
  `git_client_id` varchar(225) DEFAULT NULL,
  `git_app_id` varchar(225) DEFAULT NULL,
  `twitter_login` varchar(225) DEFAULT NULL,
  `twitter_client_id` varchar(225) DEFAULT NULL,
  `twitter_app_id` varchar(225) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `time_zone`, `default_language`, `styling`, `address`, `site_name`, `site_email`, `site_logo`, `site_favicon`, `site_description`, `site_keywords`, `site_header_code`, `site_footer_code`, `site_copyright`, `currency_code`, `footer_fb_link`, `footer_twitter_link`, `footer_instagram_link`, `footer_google_play_link`, `footer_apple_store_link`, `smtp_host`, `smtp_port`, `smtp_email`, `smtp_password`, `smtp_encryption`, `google_login`, `facebook_login`, `google_client_id`, `google_client_secret`, `google_redirect`, `facebook_app_id`, `facebook_client_secret`, `facebook_redirect`, `linkedin_login`, `linkedin_client_id`, `linkedin_app_id`, `Instagram_login`, `Instagram_client_id`, `instagram_app_id`, `git_login`, `git_client_id`, `git_app_id`, `twitter_login`, `twitter_client_id`, `twitter_app_id`, `created_at`, `updated_at`) VALUES
(1, 'America/aracas', 'English', '5619876543210', '722 NY ,US', 'BIKEBROS', 'BIKEBROS@gmail.com', 'logos bikebros.png', 'WhatsApp_Image_2024-06-19_at_20.37.04-removebg-preview.png', '<p>BIKEBROS</p>', '<p>BIKEBROS</p>', '', '', '© Copyright by BIKEBROS 2024', 'Afghan Afghani', 'https://www.facebook.com/', 'https://twitter.com/?lang=en', 'https://www.instagram.com/', '', '', 'smtp.gmail.com', '465', 'ars3sssssss@gmail.com', 'aexvmzqihfdqmnno', 'TLS', 'yes', NULL, '8', '9876543210', 'http://127.0.0.1:8000/auth/git/callback', NULL, NULL, 'http://127.0.0.1:8000/auth/twitter/callback', 'yes', '6546544654', '512sd213sad1232df13sd2f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-11 22:20:41');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(255) NOT NULL,
  `iso_code` varchar(255) NOT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=active,2=inactive',
  `default_language` varchar(255) DEFAULT NULL COMMENT 'on,off',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `iso_code`, `flag`, `rtl`, `status`, `default_language`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'uploads/flag/1712285391-i4ttmDdVZy.jpg', 0, 1, NULL, '2024-04-03 08:07:55', '2024-04-04 21:19:51'),
(2, 'Spanish', 'esp', 'uploads/flag/1712151497-QzC6JiBxzU.png', 0, 1, NULL, '2024-04-03 08:08:17', '2024-04-03 08:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 18, '2024-05-01 10:01:49', '2024-05-01 10:01:49'),
(2, 18, '2024-05-01 10:01:50', '2024-05-01 10:01:50'),
(3, 18, '2024-05-01 10:01:57', '2024-05-01 10:01:57'),
(4, 18, '2024-05-01 10:01:58', '2024-05-01 10:01:58'),
(5, 30, '2024-05-01 10:03:42', '2024-05-01 10:03:42'),
(6, 18, '2024-05-01 10:04:27', '2024-05-01 10:04:27'),
(7, 31, '2024-05-01 10:04:36', '2024-05-01 10:04:36'),
(8, 30, '2024-05-01 10:12:31', '2024-05-01 10:12:31'),
(9, 30, '2024-05-01 10:12:31', '2024-05-01 10:12:31'),
(10, 18, '2024-05-01 10:12:48', '2024-05-01 10:12:48'),
(11, 18, '2024-05-01 10:12:48', '2024-05-01 10:12:48'),
(12, 31, '2024-05-01 10:13:17', '2024-05-01 10:13:17'),
(13, 31, '2024-05-01 10:13:17', '2024-05-01 10:13:17'),
(14, 31, '2024-05-01 10:13:26', '2024-05-01 10:13:26'),
(15, 31, '2024-05-01 10:13:26', '2024-05-01 10:13:26'),
(16, 30, '2024-05-01 10:15:47', '2024-05-01 10:15:47'),
(17, 30, '2024-05-01 10:15:47', '2024-05-01 10:15:47'),
(18, 30, '2024-05-01 10:15:56', '2024-05-01 10:15:56'),
(19, 30, '2024-05-01 10:15:57', '2024-05-01 10:15:57'),
(20, 30, '2024-05-01 10:17:25', '2024-05-01 10:17:25'),
(21, 30, '2024-05-01 10:17:26', '2024-05-01 10:17:26'),
(22, 18, '2024-05-01 10:17:34', '2024-05-01 10:17:34'),
(23, 18, '2024-05-01 10:17:34', '2024-05-01 10:17:34'),
(24, 31, '2024-05-01 10:17:37', '2024-05-01 10:17:37'),
(25, 31, '2024-05-01 10:17:38', '2024-05-01 10:17:38'),
(26, 30, '2024-05-01 10:17:54', '2024-05-01 10:17:54'),
(27, 30, '2024-05-01 10:17:54', '2024-05-01 10:17:54'),
(28, 31, '2024-05-01 10:34:11', '2024-05-01 10:34:11'),
(29, 31, '2024-05-01 10:34:11', '2024-05-01 10:34:11'),
(30, 30, '2024-05-01 10:34:29', '2024-05-01 10:34:29'),
(31, 30, '2024-05-01 10:34:29', '2024-05-01 10:34:29'),
(32, 30, '2024-05-01 10:34:30', '2024-05-01 10:34:30'),
(33, 18, '2024-05-01 10:38:13', '2024-05-01 10:38:13'),
(34, 31, '2024-05-01 10:40:45', '2024-05-01 10:40:45'),
(35, 31, '2024-05-01 10:40:45', '2024-05-01 10:40:45'),
(36, 31, '2024-05-01 10:40:45', '2024-05-01 10:40:45'),
(37, 31, '2024-05-01 10:40:46', '2024-05-01 10:40:46'),
(38, 31, '2024-05-01 10:42:49', '2024-05-01 10:42:49'),
(39, 18, '2024-05-01 10:43:05', '2024-05-01 10:43:05'),
(40, 31, '2024-05-01 10:43:15', '2024-05-01 10:43:15'),
(41, 18, '2024-05-01 10:44:11', '2024-05-01 10:44:11'),
(42, 18, '2024-05-01 10:45:41', '2024-05-01 10:45:41'),
(43, 31, '2024-05-01 10:45:56', '2024-05-01 10:45:56'),
(44, 31, '2024-05-01 10:46:24', '2024-05-01 10:46:24'),
(45, 31, '2024-05-01 10:51:26', '2024-05-01 10:51:26'),
(46, 18, '2024-05-01 10:52:05', '2024-05-01 10:52:05'),
(47, 31, '2024-05-01 11:00:05', '2024-05-01 11:00:05'),
(48, 31, '2024-05-01 11:00:05', '2024-05-01 11:00:05'),
(49, 30, '2024-05-01 11:01:06', '2024-05-01 11:01:06'),
(50, 30, '2024-05-01 11:13:42', '2024-05-01 11:13:42');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

CREATE TABLE `mail_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alias` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `shortcodes` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mail_templates`
--

INSERT INTO `mail_templates` (`id`, `alias`, `name`, `subject`, `body`, `shortcodes`, `status`) VALUES
(10, 'password_reset', 'Restablecer Contraseña', 'Notificación de Restablecimiento de Contraseña', '<p><strong>Reset Password Notification</strong></p><p><img src=\"../../../logo-removebg-preview.png\" alt=\"\"></p><h2><strong>Hello!</strong></h2><p>You are receiving this email because we received a password reset request for your account, please click on the link below to reset your password.</p><p><a href=\"{{link}}\">{{link}}</a></p><p>This password reset link will expire in <strong>15</strong> minutes. If you did not request a password reset, no further action is required.</p><p><strong>Best Regards</strong></p><p><strong>BIKEBROS Team</strong></p><p>&nbsp;<a href=\"https://www.instagram.com/skyforecasting/\"><img src=\"https://skyforecasting.net/help-center/media/images/ofBRYlvT1cu30VS_1700260141.png\"></a> <a href=\"https://twitter.com/skyforecasting\"><img src=\"https://skyforecasting.net/help-center/media/images/lSr0pUYldGRD46h_1700260215.png\"></a> <img src=\"https://skyforecasting.net/help-center/media/images/pk8iEq2c7f3mICO_1700260869.png\"> <img src=\"https://skyforecasting.net/help-center/media/images/krFVCzRVOornVih_1700260896.png\"></p><p>You received this email because you subscribed to our list.<br>&nbsp;<a href=\"https://skyforecasting.net/unsubscribepage/unsubscribe.html\">Unsubscribe</a> from future emails or update email preferences.<br>© 2024 BIKEBROS. All Rights Reserved.</p><p>&nbsp;</p><p><br>&nbsp;</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p>&nbsp;</p>', '{\n\"link\":\"Password reset link\",\n\"expiry_time\":\"Link expiry time\",\n\"website_name\":\"Your website name\"\n}', 1),
(11, 'email_verification', 'Verificación de Correo Electrónico', 'Verificar Dirección de Correo Electrónico', '<p><strong>Verify Email Address</strong></p><p><img src=\"../../../logo-removebg-preview.png\" alt=\"\"></p><h2>Hello!</h2><p>Please click on the link below to verify your email address.</p><p><a href=\"{{link}}\">{{link}}</a></p><p>If you did not create an account, no further action is required.</p><p><br><strong>Best Regards</strong></p><p><strong>BIKEBROS&nbsp;Team</strong></p><p>&nbsp;<a href=\"https://www.instagram.com/skyforecasting/\"><img src=\"https://skyforecasting.net/help-center/media/images/ofBRYlvT1cu30VS_1700260141.png\"></a> <a href=\"https://twitter.com/skyforecasting\"><img src=\"https://skyforecasting.net/help-center/media/images/lSr0pUYldGRD46h_1700260215.png\"></a> <a href=\"https://www.facebook.com/profile.php?id=61553152322786\"><img src=\"https://skyforecasting.net/help-center/media/images/pk8iEq2c7f3mICO_1700260869.png\"></a> <a href=\"https://www.youtube.com/channel/UCscdHPJ4f79CAmiO2f9gJoA\"><img src=\"https://skyforecasting.net/help-center/media/images/krFVCzRVOornVih_1700260896.png\"></a></p><p>You received this email because you subscribed to our list.<br>&nbsp;<a href=\"https://skyforecasting.net/unsubscribepage/unsubscribe.html\">Unsubscribe</a> from future emails or update email preferences.<br>© 2024 BIKEBROS. All Rights Reserved.</p>', '{\"link\":\"Email verification link\",\"website_name\":\"Your website name\"}', 1),
(18, 'welcome', 'Bienvenida', 'Bienvenido a BIKEBROS', '<h2><strong>Bienvenido a BikeBros</strong></h2><p><strong><img src=\"../../../logo-removebg-preview.png\" alt=\"\"></strong></p><p>Hola {{name}},&nbsp;</p><p>Welcome to &nbsp;<strong>ACELERA</strong>! We’re so excited to have you on board.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Start Exploring</p><p>If you have any questions along the way, don’t hesitate to reach out to our customer success team. We’re always here to help.</p><p><br><strong>Best Regards</strong></p><p><strong>ACELERA&nbsp; Team</strong></p><p>&nbsp;<a href=\"https://www.instagram.com/skyforecasting/\"><img src=\"https://skyforecasting.net/help-center/media/images/ofBRYlvT1cu30VS_1700260141.png\"></a> <a href=\"https://twitter.com/skyforecasting\"><img src=\"https://skyforecasting.net/help-center/media/images/lSr0pUYldGRD46h_1700260215.png\"></a> <a href=\"https://www.facebook.com/profile.php?id=61553152322786\"><img src=\"https://skyforecasting.net/help-center/media/images/pk8iEq2c7f3mICO_1700260869.png\"></a> <a href=\"https://www.youtube.com/channel/UCscdHPJ4f79CAmiO2f9gJoA\"><img src=\"https://skyforecasting.net/help-center/media/images/krFVCzRVOornVih_1700260896.png\"></a></p><p>You received this email because you subscribed to our list.<br>&nbsp;<a href=\"https://skyforecasting.net/unsubscribepage/unsubscribe.html\">Unsubscribe</a> from future emails or update email preferences.<br>© 2024 &nbsp;ACELERA. All Rights Reserved.</p>', '{\"name\":\"name\",\"website_name\":\"Your website name\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `media_options`
--

CREATE TABLE `media_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `alt_title` text DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `large_image` text DEFAULT NULL,
  `option_value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_options`
--

INSERT INTO `media_options` (`id`, `title`, `alt_title`, `thumbnail`, `large_image`, `option_value`, `created_at`, `updated_at`) VALUES
(247, 'photo', 'photo', '06082021041147-photo.png', '06082021041147-photo.png', '21950', '2021-08-05 16:41:47', '2021-08-05 16:41:47'),
(331, 'payment', 'payment', '16112021165416-200x200-payment.png', '16112021165416-payment.png', '8212', '2021-11-16 05:24:16', '2021-11-16 05:24:16'),
(441, 'favicon', 'favicon', '24062022060012-favicon.ico', '24062022060012-favicon.ico', '5430', '2022-06-23 18:30:12', '2022-06-23 18:30:12'),
(442, 'logo', 'logo', '24062022060027-200x200-logo.png', '24062022060027-logo.png', '16775', '2022-06-23 18:30:27', '2022-06-23 18:30:27'),
(443, 'h1-layer1', 'h1-layer1', '01072022095731-200x200-h1-layer1.png', '01072022095731-h1-layer1.png', '1040462', '2022-06-30 22:27:31', '2022-06-30 22:27:31'),
(444, 'h1-layer5', 'h1-layer5', '01072022095735-200x200-h1-layer5.png', '01072022095735-h1-layer5.png', '366096', '2022-06-30 22:27:35', '2022-06-30 22:27:35'),
(445, 'h1-layer2', 'h1-layer2', '01072022095745-200x200-h1-layer2.png', '01072022095745-h1-layer2.png', '33634', '2022-06-30 22:27:45', '2022-06-30 22:27:45'),
(446, 'h1-layer3', 'h1-layer3', '01072022095750-200x200-h1-layer3.png', '01072022095750-h1-layer3.png', '50012', '2022-06-30 22:27:50', '2022-06-30 22:27:50'),
(447, 'h1-layer4', 'h1-layer4', '01072022095752-200x200-h1-layer4.png', '01072022095752-h1-layer4.png', '49803', '2022-06-30 22:27:52', '2022-06-30 22:27:52'),
(448, 'h1-layer6', 'h1-layer6', '01072022095755-200x200-h1-layer6.png', '01072022095755-h1-layer6.png', '36640', '2022-06-30 22:27:55', '2022-06-30 22:27:55'),
(449, 'h1-layer7', 'h1-layer7', '01072022095757-200x200-h1-layer7.png', '01072022095757-h1-layer7.png', '46145', '2022-06-30 22:27:57', '2022-06-30 22:27:57'),
(450, 'h1-layer8', 'h1-layer8', '01072022095801-200x200-h1-layer8.png', '01072022095801-h1-layer8.png', '35519', '2022-06-30 22:28:01', '2022-06-30 22:28:01'),
(452, 'vegetables', 'vegetables', '01072022115801-600x600-vegetables.png', '01072022115801-vegetables.png', '184224', '2022-07-01 00:28:01', '2022-07-01 00:28:01'),
(453, 'fruit', 'fruit', '01072022120122-600x600-fruit.png', '01072022120122-fruit.png', '177132', '2022-07-01 00:31:22', '2022-07-01 00:31:22'),
(454, 'nutt-and-seeds', 'nutt-and-seeds', '01072022120255-600x600-nutt-and-seeds.png', '01072022120255-nutt-and-seeds.png', '191746', '2022-07-01 00:32:55', '2022-07-01 00:32:55'),
(455, 'bread-and-bakery', 'bread-and-bakery', '01072022120359-600x600-bread-and-bakery.png', '01072022120359-bread-and-bakery.png', '274261', '2022-07-01 00:33:59', '2022-07-01 00:33:59'),
(456, 'juice', 'juice', '01072022120554-600x600-juice.png', '01072022120554-juice.png', '125565', '2022-07-01 00:35:54', '2022-07-01 00:35:54'),
(457, 'fast-food', 'fast-food', '01072022120657-600x600-fast-food.png', '01072022120657-fast-food.png', '245879', '2022-07-01 00:36:57', '2022-07-01 00:36:57'),
(458, 'milk-and-dairy', 'milk-and-dairy', '01072022120745-600x600-milk-and-dairy.png', '01072022120745-milk-and-dairy.png', '166360', '2022-07-01 00:37:45', '2022-07-01 00:37:45'),
(459, 'fresh-meat', 'fresh-meat', '01072022120831-600x600-fresh-meat.png', '01072022120831-fresh-meat.png', '150740', '2022-07-01 00:38:31', '2022-07-01 00:38:31'),
(460, 'fresh-seafood', 'fresh-seafood', '01072022120911-600x600-fresh-seafood.png', '01072022120911-fresh-seafood.png', '158387', '2022-07-01 00:39:11', '2022-07-01 00:39:11'),
(461, 'dry-food', 'dry-food', '01072022121020-600x600-dry-food.png', '01072022121020-dry-food.png', '172173', '2022-07-01 00:40:20', '2022-07-01 00:40:20'),
(462, 'coffee-and-tea', 'coffee-and-tea', '01072022121100-600x600-coffee-and-tea.png', '01072022121100-coffee-and-tea.png', '157391', '2022-07-01 00:41:00', '2022-07-01 00:41:00'),
(463, 'offer-1', 'offer-1', '17072022160150-200x200-offer-1.png', '17072022160150-offer-1.png', '60795', '2022-07-17 04:31:50', '2022-07-17 04:31:50'),
(464, 'offer-2', 'offer-2', '17072022161053-200x200-offer-2.png', '17072022161053-offer-2.png', '52478', '2022-07-17 04:40:53', '2022-07-17 04:40:53'),
(465, 'offer-3', 'offer-3', '17072022161130-200x200-offer-3.png', '17072022161130-offer-3.png', '61968', '2022-07-17 04:41:30', '2022-07-17 04:41:30'),
(466, 'h1_video_bg', 'h1_video_bg', '17072022175837-200x200-h1_video_bg.jpg', '17072022175837-h1_video_bg.jpg', '340793', '2022-07-17 06:28:38', '2022-07-17 06:28:38'),
(467, 'footer-top', 'footer-top', '22072022102835-200x200-footer-top.jpg', '22072022102835-footer-top.jpg', '90298', '2022-07-21 22:58:35', '2022-07-21 22:58:35'),
(490, '12', '12', '31072022063509-200x200-12.jpg', '31072022063509-12.jpg', '41008', '2022-07-30 19:05:09', '2022-07-30 19:05:09'),
(491, '14', '14', '31072022063515-200x200-14.jpg', '31072022063515-14.jpg', '63049', '2022-07-30 19:05:16', '2022-07-30 19:05:16'),
(494, '3', '3', '31072022063546-200x200-3.jpg', '31072022063546-3.jpg', '46379', '2022-07-30 19:05:46', '2022-07-30 19:05:46'),
(496, '5', '5', '31072022063557-200x200-5.jpg', '31072022063557-5.jpg', '46928', '2022-07-30 19:05:57', '2022-07-30 19:05:57'),
(499, '30', '30', '31072022063653-200x200-30.jpg', '31072022063653-30.jpg', '55133', '2022-07-30 19:06:53', '2022-07-30 19:06:53'),
(500, '29', '29', '31072022063710-200x200-29.jpg', '31072022063710-29.jpg', '61829', '2022-07-30 19:07:10', '2022-07-30 19:07:10'),
(503, '10', '10', '31072022063732-200x200-10.jpg', '31072022063732-10.jpg', '35410', '2022-07-30 19:07:32', '2022-07-30 19:07:32'),
(505, '5', '5', '31072022063751-200x200-5.jpg', '31072022063751-5.jpg', '35048', '2022-07-30 19:07:51', '2022-07-30 19:07:51'),
(507, '2', '2', '31072022063809-200x200-2.jpg', '31072022063809-2.jpg', '63377', '2022-07-30 19:08:09', '2022-07-30 19:08:09'),
(510, '11', '11', '31072022063840-200x200-11.jpg', '31072022063840-11.jpg', '86598', '2022-07-30 19:08:40', '2022-07-30 19:08:40'),
(511, '8', '8', '31072022063845-200x200-8.jpg', '31072022063845-8.jpg', '61285', '2022-07-30 19:08:45', '2022-07-30 19:08:45'),
(512, '2', '2', '31072022063900-200x200-2.jpg', '31072022063900-2.jpg', '75753', '2022-07-30 19:09:00', '2022-07-30 19:09:00'),
(516, '9', '9', '31072022063932-200x200-9.jpg', '31072022063932-9.jpg', '68512', '2022-07-30 19:09:32', '2022-07-30 19:09:32'),
(517, '5', '5', '31072022063945-200x200-5.jpg', '31072022063945-5.jpg', '62257', '2022-07-30 19:09:45', '2022-07-30 19:09:45'),
(520, '1', '1', '31072022064011-200x200-1.jpg', '31072022064011-1.jpg', '57186', '2022-07-30 19:10:11', '2022-07-30 19:10:11'),
(521, '4', '4', '31072022064016-200x200-4.jpg', '31072022064016-4.jpg', '46090', '2022-07-30 19:10:16', '2022-07-30 19:10:16'),
(522, '10', '10', '31072022064024-200x200-10.jpg', '31072022064024-10.jpg', '49349', '2022-07-30 19:10:24', '2022-07-30 19:10:24'),
(526, '27', '27', '31072022064110-200x200-27.jpg', '31072022064110-27.jpg', '62831', '2022-07-30 19:11:10', '2022-07-30 19:11:10'),
(528, '10', '10', '31072022064129-200x200-10.jpg', '31072022064129-10.jpg', '75878', '2022-07-30 19:11:29', '2022-07-30 19:11:29'),
(529, '8', '8', '31072022064141-200x200-8.jpg', '31072022064141-8.jpg', '72609', '2022-07-30 19:11:41', '2022-07-30 19:11:41'),
(531, '11', '11', '31072022064207-200x200-11.jpg', '31072022064207-11.jpg', '73004', '2022-07-30 19:12:07', '2022-07-30 19:12:07'),
(532, '5', '5', '31072022064214-200x200-5.jpg', '31072022064214-5.jpg', '77496', '2022-07-30 19:12:14', '2022-07-30 19:12:14'),
(533, '3', '3', '31072022064218-200x200-3.jpg', '31072022064218-3.jpg', '60534', '2022-07-30 19:12:18', '2022-07-30 19:12:18'),
(536, '7', '7', '01082022172357-400x400-7.jpg', '01082022172357-7.jpg', '56749', '2022-08-01 05:53:57', '2022-08-01 05:53:57'),
(537, '18', '18', '01082022172527-400x400-18.jpg', '01082022172527-18.jpg', '55772', '2022-08-01 05:55:27', '2022-08-01 05:55:27'),
(538, '1', '1', '01082022172600-400x400-1.jpg', '01082022172600-1.jpg', '54636', '2022-08-01 05:56:00', '2022-08-01 05:56:00'),
(539, '24', '24', '01082022172650-400x400-24.jpg', '01082022172650-24.jpg', '62342', '2022-08-01 05:56:51', '2022-08-01 05:56:51'),
(540, '7', '7', '01082022172712-400x400-7.jpg', '01082022172712-7.jpg', '66843', '2022-08-01 05:57:12', '2022-08-01 05:57:12'),
(541, '3', '3', '01082022172737-400x400-3.jpg', '01082022172737-3.jpg', '75007', '2022-08-01 05:57:37', '2022-08-01 05:57:37'),
(542, '3', '3', '01082022172802-400x400-3.jpg', '01082022172802-3.jpg', '43906', '2022-08-01 05:58:03', '2022-08-01 05:58:03'),
(543, '11', '11', '01082022172825-400x400-11.jpg', '01082022172825-11.jpg', '58720', '2022-08-01 05:58:25', '2022-08-01 05:58:25'),
(544, '9', '9', '01082022172846-400x400-9.jpg', '01082022172846-9.jpg', '65534', '2022-08-01 05:58:46', '2022-08-01 05:58:46'),
(545, '1', '1', '01082022172932-400x400-1.jpg', '01082022172932-1.jpg', '59010', '2022-08-01 05:59:32', '2022-08-01 05:59:32'),
(546, '8', '8', '01082022172956-400x400-8.jpg', '01082022172956-8.jpg', '70583', '2022-08-01 05:59:56', '2022-08-01 05:59:56'),
(547, '17', '17', '01082022173019-400x400-17.jpg', '01082022173019-17.jpg', '59888', '2022-08-01 06:00:19', '2022-08-01 06:00:19'),
(548, '9', '9', '01082022173052-400x400-9.jpg', '01082022173052-9.jpg', '69396', '2022-08-01 06:00:52', '2022-08-01 06:00:52'),
(549, '4', '4', '01082022173115-400x400-4.jpg', '01082022173115-4.jpg', '65766', '2022-08-01 06:01:15', '2022-08-01 06:01:15'),
(550, '1', '1', '01082022173141-400x400-1.jpg', '01082022173141-1.jpg', '65230', '2022-08-01 06:01:41', '2022-08-01 06:01:41'),
(551, '4', '4', '01082022173225-400x400-4.jpg', '01082022173225-4.jpg', '33162', '2022-08-01 06:02:25', '2022-08-01 06:02:25'),
(552, '1', '1', '01082022173248-400x400-1.jpg', '01082022173248-1.jpg', '51039', '2022-08-01 06:02:48', '2022-08-01 06:02:48'),
(553, '14', '14', '01082022173741-400x400-14.jpg', '01082022173741-14.jpg', '43219', '2022-08-01 06:07:41', '2022-08-01 06:07:41'),
(555, '4', '4', '01082022174052-400x400-4.jpg', '01082022174052-4.jpg', '61634', '2022-08-01 06:10:52', '2022-08-01 06:10:52'),
(556, '18', '18', '02082022143408-400x400-18.jpg', '02082022143408-18.jpg', '44654', '2022-08-02 03:04:08', '2022-08-02 03:04:08'),
(557, '8', '8', '02082022143457-400x400-8.jpg', '02082022143457-8.jpg', '46149', '2022-08-02 03:04:57', '2022-08-02 03:04:57'),
(558, '5', '5', '02082022143530-400x400-5.jpg', '02082022143530-5.jpg', '51760', '2022-08-02 03:05:30', '2022-08-02 03:05:30'),
(560, '1', '1', '02082022143652-400x400-1.jpg', '02082022143652-1.jpg', '57333', '2022-08-02 03:06:52', '2022-08-02 03:06:52'),
(561, '6', '6', '02082022143742-400x400-6.jpg', '02082022143742-6.jpg', '39486', '2022-08-02 03:07:42', '2022-08-02 03:07:42'),
(562, '4', '4', '02082022143827-400x400-4.jpg', '02082022143827-4.jpg', '42217', '2022-08-02 03:08:27', '2022-08-02 03:08:27'),
(563, '2', '2', '02082022143908-400x400-2.jpg', '02082022143908-2.jpg', '41853', '2022-08-02 03:09:08', '2022-08-02 03:09:08'),
(564, '9', '9', '02082022143955-400x400-9.jpg', '02082022143955-9.jpg', '31239', '2022-08-02 03:09:55', '2022-08-02 03:09:55'),
(565, '4', '4', '02082022144027-400x400-4.jpg', '02082022144027-4.jpg', '35467', '2022-08-02 03:10:27', '2022-08-02 03:10:27'),
(566, '5', '5', '02082022144140-400x400-5.jpg', '02082022144140-5.jpg', '41636', '2022-08-02 03:11:40', '2022-08-02 03:11:40'),
(567, '6', '6', '02082022144221-400x400-6.jpg', '02082022144221-6.jpg', '32997', '2022-08-02 03:12:21', '2022-08-02 03:12:21'),
(568, '4', '4', '02082022144310-400x400-4.jpg', '02082022144310-4.jpg', '38297', '2022-08-02 03:13:10', '2022-08-02 03:13:10'),
(569, '3', '3', '02082022144346-400x400-3.jpg', '02082022144346-3.jpg', '40960', '2022-08-02 03:13:46', '2022-08-02 03:13:46'),
(572, '26', '26', '05082022165653-400x400-26.jpg', '05082022165653-26.jpg', '59629', '2022-08-05 05:26:53', '2022-08-05 05:26:53'),
(578, '1-garlic', '1-garlic', '18082022123324-600x600-1-garlic.jpg', '18082022123324-1-garlic.jpg', '69229', '2022-08-18 01:03:24', '2022-08-18 01:03:24'),
(579, '2-garlic', '2-garlic', '18082022123333-600x600-2-garlic.jpg', '18082022123333-2-garlic.jpg', '71703', '2022-08-18 01:03:33', '2022-08-18 01:03:33'),
(580, '3-garlic', '3-garlic', '18082022123337-600x600-3-garlic.jpg', '18082022123337-3-garlic.jpg', '69346', '2022-08-18 01:03:37', '2022-08-18 01:03:37'),
(581, '4-garlic', '4-garlic', '18082022123536-600x600-4-garlic.jpg', '18082022123536-4-garlic.jpg', '69533', '2022-08-18 01:05:36', '2022-08-18 01:05:36'),
(582, '5-garlic', '5-garlic', '18082022123541-600x600-5-garlic.jpg', '18082022123541-5-garlic.jpg', '61794', '2022-08-18 01:05:41', '2022-08-18 01:05:41'),
(583, '6-garlic', '6-garlic', '18082022123544-600x600-6-garlic.jpg', '18082022123544-6-garlic.jpg', '71937', '2022-08-18 01:05:44', '2022-08-18 01:05:44'),
(584, '1-red-pepper', '1-red-pepper', '18082022135056-600x600-1-red-pepper.jpg', '18082022135056-1-red-pepper.jpg', '67020', '2022-08-18 02:20:56', '2022-08-18 02:20:56'),
(585, '2-red-pepper', '2-red-pepper', '18082022135100-600x600-2-red-pepper.jpg', '18082022135100-2-red-pepper.jpg', '70681', '2022-08-18 02:21:00', '2022-08-18 02:21:00'),
(586, '3-red-pepper', '3-red-pepper', '18082022135103-600x600-3-red-pepper.jpg', '18082022135103-3-red-pepper.jpg', '83263', '2022-08-18 02:21:03', '2022-08-18 02:21:03'),
(587, '4-red-pepper', '4-red-pepper', '18082022135106-600x600-4-red-pepper.jpg', '18082022135106-4-red-pepper.jpg', '97895', '2022-08-18 02:21:06', '2022-08-18 02:21:06'),
(588, '5-red-pepper', '5-red-pepper', '18082022135110-600x600-5-red-pepper.jpg', '18082022135110-5-red-pepper.jpg', '85304', '2022-08-18 02:21:10', '2022-08-18 02:21:10'),
(589, '6-red-pepper', '6-red-pepper', '18082022135113-600x600-6-red-pepper.jpg', '18082022135113-6-red-pepper.jpg', '86126', '2022-08-18 02:21:13', '2022-08-18 02:21:13'),
(590, 'home1-bg-slider', 'home1-bg-slider', '18082022135936-400x400-home1-bg-slider.jpg', '18082022135936-home1-bg-slider.jpg', '46631', '2022-08-18 02:29:36', '2022-08-18 02:29:36'),
(591, 'home1-bg-offer', 'home1-bg-offer', '18082022140338-400x400-home1-bg-offer.jpg', '18082022140338-home1-bg-offer.jpg', '39542', '2022-08-18 02:33:38', '2022-08-18 02:33:38'),
(592, 'footer_bg', 'footer_bg', '18082022140802-400x400-footer_bg.jpg', '18082022140802-footer_bg.jpg', '39542', '2022-08-18 02:38:02', '2022-08-18 02:38:02'),
(593, '1-potato', '1-potato', '18082022140944-600x600-1-potato.jpg', '18082022140944-1-potato.jpg', '64023', '2022-08-18 02:39:44', '2022-08-18 02:39:44'),
(594, '2-potato', '2-potato', '18082022140948-600x600-2-potato.jpg', '18082022140948-2-potato.jpg', '79022', '2022-08-18 02:39:48', '2022-08-18 02:39:48'),
(595, '3-potato', '3-potato', '18082022140954-600x600-3-potato.jpg', '18082022140954-3-potato.jpg', '78839', '2022-08-18 02:39:54', '2022-08-18 02:39:54'),
(596, '4-potato', '4-potato', '18082022140957-600x600-4-potato.jpg', '18082022140957-4-potato.jpg', '78735', '2022-08-18 02:39:57', '2022-08-18 02:39:57'),
(597, '5-potato', '5-potato', '18082022141000-600x600-5-potato.jpg', '18082022141000-5-potato.jpg', '69201', '2022-08-18 02:40:00', '2022-08-18 02:40:00'),
(598, '6-potato', '6-potato', '18082022141004-600x600-6-potato.jpg', '18082022141004-6-potato.jpg', '97305', '2022-08-18 02:40:04', '2022-08-18 02:40:04'),
(599, '7-potato', '7-potato', '18082022141007-600x600-7-potato.jpg', '18082022141007-7-potato.jpg', '99215', '2022-08-18 02:40:08', '2022-08-18 02:40:08'),
(600, '1-lotus-seeds', '1-lotus-seeds', '18082022150003-600x600-1-lotus-seeds.jpg', '18082022150003-1-lotus-seeds.jpg', '76427', '2022-08-18 03:30:03', '2022-08-18 03:30:03'),
(601, '2-lotus-seeds', '2-lotus-seeds', '18082022150007-600x600-2-lotus-seeds.jpg', '18082022150007-2-lotus-seeds.jpg', '62658', '2022-08-18 03:30:07', '2022-08-18 03:30:07'),
(602, '3-lotus-seeds', '3-lotus-seeds', '18082022150010-600x600-3-lotus-seeds.jpg', '18082022150010-3-lotus-seeds.jpg', '72466', '2022-08-18 03:30:10', '2022-08-18 03:30:10'),
(603, '4-lotus-seeds', '4-lotus-seeds', '18082022150026-600x600-4-lotus-seeds.jpg', '18082022150026-4-lotus-seeds.jpg', '57106', '2022-08-18 03:30:26', '2022-08-18 03:30:26'),
(604, '5-lotus-seeds', '5-lotus-seeds', '18082022150029-600x600-5-lotus-seeds.jpg', '18082022150029-5-lotus-seeds.jpg', '83364', '2022-08-18 03:30:29', '2022-08-18 03:30:29'),
(605, '6-lotus-seeds', '6-lotus-seeds', '18082022150032-600x600-6-lotus-seeds.jpg', '18082022150032-6-lotus-seeds.jpg', '86399', '2022-08-18 03:30:32', '2022-08-18 03:30:32'),
(606, '7-lotus-seeds', '7-lotus-seeds', '18082022150036-600x600-7-lotus-seeds.jpg', '18082022150036-7-lotus-seeds.jpg', '75138', '2022-08-18 03:30:36', '2022-08-18 03:30:36'),
(607, '1-pistachio', '1-pistachio', '18082022151446-600x600-1-pistachio.jpg', '18082022151446-1-pistachio.jpg', '77898', '2022-08-18 03:44:46', '2022-08-18 03:44:46'),
(608, '2-pistachio', '2-pistachio', '18082022151450-600x600-2-pistachio.jpg', '18082022151450-2-pistachio.jpg', '111159', '2022-08-18 03:44:50', '2022-08-18 03:44:50'),
(609, '3-pistachio', '3-pistachio', '18082022151452-600x600-3-pistachio.jpg', '18082022151452-3-pistachio.jpg', '79510', '2022-08-18 03:44:53', '2022-08-18 03:44:53'),
(610, '4-pistachio', '4-pistachio', '18082022151457-600x600-4-pistachio.jpg', '18082022151457-4-pistachio.jpg', '74206', '2022-08-18 03:44:57', '2022-08-18 03:44:57'),
(611, '5-pistachio', '5-pistachio', '18082022151500-600x600-5-pistachio.jpg', '18082022151500-5-pistachio.jpg', '77471', '2022-08-18 03:45:00', '2022-08-18 03:45:00'),
(612, '6-pistachio', '6-pistachio', '18082022151502-600x600-6-pistachio.jpg', '18082022151502-6-pistachio.jpg', '92185', '2022-08-18 03:45:02', '2022-08-18 03:45:02'),
(613, '7-pistachio', '7-pistachio', '18082022151504-600x600-7-pistachio.jpg', '18082022151504-7-pistachio.jpg', '70181', '2022-08-18 03:45:04', '2022-08-18 03:45:04'),
(614, '1-walnuts', '1-walnuts', '18082022153802-600x600-1-walnuts.jpg', '18082022153802-1-walnuts.jpg', '98086', '2022-08-18 04:08:02', '2022-08-18 04:08:02'),
(615, '2-walnuts', '2-walnuts', '18082022153806-600x600-2-walnuts.jpg', '18082022153806-2-walnuts.jpg', '83638', '2022-08-18 04:08:06', '2022-08-18 04:08:06'),
(616, '3-walnuts', '3-walnuts', '18082022153808-600x600-3-walnuts.jpg', '18082022153808-3-walnuts.jpg', '83992', '2022-08-18 04:08:08', '2022-08-18 04:08:08'),
(617, '4-walnuts', '4-walnuts', '18082022153810-600x600-4-walnuts.jpg', '18082022153810-4-walnuts.jpg', '104663', '2022-08-18 04:08:10', '2022-08-18 04:08:10'),
(618, '5-walnuts', '5-walnuts', '18082022153812-600x600-5-walnuts.jpg', '18082022153812-5-walnuts.jpg', '67250', '2022-08-18 04:08:12', '2022-08-18 04:08:12'),
(619, '1-milk-splash', '1-milk-splash', '18082022155122-600x600-1-milk-splash.jpg', '18082022155122-1-milk-splash.jpg', '51650', '2022-08-18 04:21:22', '2022-08-18 04:21:22'),
(620, '2-milk-splash', '2-milk-splash', '18082022155126-600x600-2-milk-splash.jpg', '18082022155126-2-milk-splash.jpg', '54281', '2022-08-18 04:21:26', '2022-08-18 04:21:26'),
(621, '3-milk-splash', '3-milk-splash', '18082022155129-600x600-3-milk-splash.jpg', '18082022155129-3-milk-splash.jpg', '54653', '2022-08-18 04:21:29', '2022-08-18 04:21:29'),
(623, '5-milk-splash', '5-milk-splash', '18082022155136-600x600-5-milk-splash.jpg', '18082022155136-5-milk-splash.jpg', '53022', '2022-08-18 04:21:36', '2022-08-18 04:21:36'),
(624, '4-milk-splash', '4-milk-splash', '18082022155447-600x600-4-milk-splash.jpg', '18082022155447-4-milk-splash.jpg', '53873', '2022-08-18 04:24:47', '2022-08-18 04:24:47'),
(625, '1-cheese', '1-cheese', '18082022171458-600x600-1-cheese.jpg', '18082022171458-1-cheese.jpg', '62012', '2022-08-18 05:44:58', '2022-08-18 05:44:58'),
(626, '2-cheese', '2-cheese', '18082022171502-600x600-2-cheese.jpg', '18082022171502-2-cheese.jpg', '63404', '2022-08-18 05:45:02', '2022-08-18 05:45:02'),
(627, '3-cheese', '3-cheese', '18082022171507-600x600-3-cheese.jpg', '18082022171507-3-cheese.jpg', '95590', '2022-08-18 05:45:07', '2022-08-18 05:45:07'),
(628, '4-cheese', '4-cheese', '18082022171511-600x600-4-cheese.jpg', '18082022171511-4-cheese.jpg', '76437', '2022-08-18 05:45:11', '2022-08-18 05:45:11'),
(629, '5-cheese', '5-cheese', '18082022171514-600x600-5-cheese.jpg', '18082022171514-5-cheese.jpg', '71338', '2022-08-18 05:45:14', '2022-08-18 05:45:14'),
(631, '6-cheese', '6-cheese', '18082022171602-600x600-6-cheese.jpg', '18082022171602-6-cheese.jpg', '86087', '2022-08-18 05:46:02', '2022-08-18 05:46:02'),
(632, '7-cheese', '7-cheese', '18082022171605-600x600-7-cheese.jpg', '18082022171605-7-cheese.jpg', '84398', '2022-08-18 05:46:05', '2022-08-18 05:46:05'),
(633, '1-dairy-products', '1-dairy-products', '18082022174441-600x600-1-dairy-products.jpg', '18082022174441-1-dairy-products.jpg', '69181', '2022-08-18 06:14:41', '2022-08-18 06:14:41'),
(634, '2-dairy-products', '2-dairy-products', '18082022174445-600x600-2-dairy-products.jpg', '18082022174445-2-dairy-products.jpg', '77043', '2022-08-18 06:14:45', '2022-08-18 06:14:45'),
(635, '3-dairy-products', '3-dairy-products', '18082022174448-600x600-3-dairy-products.jpg', '18082022174448-3-dairy-products.jpg', '85353', '2022-08-18 06:14:48', '2022-08-18 06:14:48'),
(636, '4-dairy-products', '4-dairy-products', '18082022174452-600x600-4-dairy-products.jpg', '18082022174452-4-dairy-products.jpg', '68236', '2022-08-18 06:14:52', '2022-08-18 06:14:52'),
(637, '5-dairy-products', '5-dairy-products', '18082022174457-600x600-5-dairy-products.jpg', '18082022174457-5-dairy-products.jpg', '97186', '2022-08-18 06:14:57', '2022-08-18 06:14:57'),
(638, '6-dairy-products', '6-dairy-products', '18082022174502-600x600-6-dairy-products.jpg', '18082022174502-6-dairy-products.jpg', '68351', '2022-08-18 06:15:02', '2022-08-18 06:15:02'),
(639, '6-fruit-juice', '6-fruit-juice', '18082022175722-600x600-6-fruit-juice.jpg', '18082022175722-6-fruit-juice.jpg', '76520', '2022-08-18 06:27:22', '2022-08-18 06:27:22'),
(640, '5-fruit-juice', '5-fruit-juice', '18082022175726-600x600-5-fruit-juice.jpg', '18082022175726-5-fruit-juice.jpg', '84859', '2022-08-18 06:27:26', '2022-08-18 06:27:26'),
(641, '4-fruit-juice', '4-fruit-juice', '18082022175730-600x600-4-fruit-juice.jpg', '18082022175730-4-fruit-juice.jpg', '71046', '2022-08-18 06:27:30', '2022-08-18 06:27:30'),
(642, '3-fruit-juice', '3-fruit-juice', '18082022175734-600x600-3-fruit-juice.jpg', '18082022175734-3-fruit-juice.jpg', '76620', '2022-08-18 06:27:34', '2022-08-18 06:27:34'),
(643, '2-fruit-juice', '2-fruit-juice', '18082022175917-600x600-2-fruit-juice.jpg', '18082022175917-2-fruit-juice.jpg', '76224', '2022-08-18 06:29:17', '2022-08-18 06:29:17'),
(644, '2-pomegranate-juice', '2-pomegranate-juice', '18082022180759-600x600-2-pomegranate-juice.jpg', '18082022180759-2-pomegranate-juice.jpg', '91928', '2022-08-18 06:37:59', '2022-08-18 06:37:59'),
(645, '1-pomegranate-juice', '1-pomegranate-juice', '18082022180809-600x600-1-pomegranate-juice.jpg', '18082022180809-1-pomegranate-juice.jpg', '78788', '2022-08-18 06:38:09', '2022-08-18 06:38:09'),
(646, '4-pomegranate-juice', '4-pomegranate-juice', '18082022180824-600x600-4-pomegranate-juice.jpg', '18082022180824-4-pomegranate-juice.jpg', '93754', '2022-08-18 06:38:24', '2022-08-18 06:38:24'),
(647, '3-pomegranate-juice', '3-pomegranate-juice', '18082022180829-600x600-3-pomegranate-juice.jpg', '18082022180829-3-pomegranate-juice.jpg', '84217', '2022-08-18 06:38:29', '2022-08-18 06:38:29'),
(648, '1-cocktail-soft-drink', '1-cocktail-soft-drink', '19082022031029-600x600-1-cocktail-soft-drink.jpg', '19082022031029-1-cocktail-soft-drink.jpg', '65934', '2022-08-18 15:40:29', '2022-08-18 15:40:29'),
(649, '2-cocktail-soft-drink', '2-cocktail-soft-drink', '19082022031032-600x600-2-cocktail-soft-drink.jpg', '19082022031032-2-cocktail-soft-drink.jpg', '68499', '2022-08-18 15:40:32', '2022-08-18 15:40:32'),
(650, '3-cocktail-soft-drink', '3-cocktail-soft-drink', '19082022031036-600x600-3-cocktail-soft-drink.jpg', '19082022031036-3-cocktail-soft-drink.jpg', '96044', '2022-08-18 15:40:36', '2022-08-18 15:40:36'),
(651, '4-cocktail-soft-drink', '4-cocktail-soft-drink', '19082022031039-600x600-4-cocktail-soft-drink.jpg', '19082022031039-4-cocktail-soft-drink.jpg', '69707', '2022-08-18 15:40:39', '2022-08-18 15:40:39'),
(652, '1-snow-crab', '1-snow-crab', '19082022032359-600x600-1-snow-crab.jpg', '19082022032359-1-snow-crab.jpg', '119920', '2022-08-18 15:53:59', '2022-08-18 15:53:59'),
(653, '2-snow-crab', '2-snow-crab', '19082022032402-600x600-2-snow-crab.jpg', '19082022032402-2-snow-crab.jpg', '107453', '2022-08-18 15:54:02', '2022-08-18 15:54:02'),
(654, '3-snow-crab', '3-snow-crab', '19082022032405-600x600-3-snow-crab.jpg', '19082022032405-3-snow-crab.jpg', '87903', '2022-08-18 15:54:05', '2022-08-18 15:54:05'),
(655, '4-snow-crab', '4-snow-crab', '19082022032408-600x600-4-snow-crab.jpg', '19082022032408-4-snow-crab.jpg', '76649', '2022-08-18 15:54:08', '2022-08-18 15:54:08'),
(656, '1-crayfish', '1-crayfish', '19082022035247-600x600-1-crayfish.jpg', '19082022035247-1-crayfish.jpg', '92013', '2022-08-18 16:22:47', '2022-08-18 16:22:47'),
(657, '2-crayfish', '2-crayfish', '19082022035252-600x600-2-crayfish.jpg', '19082022035252-2-crayfish.jpg', '78224', '2022-08-18 16:22:52', '2022-08-18 16:22:52'),
(658, '3-crayfish', '3-crayfish', '19082022035255-600x600-3-crayfish.jpg', '19082022035255-3-crayfish.jpg', '85027', '2022-08-18 16:22:55', '2022-08-18 16:22:55'),
(659, '4-crayfish', '4-crayfish', '19082022035258-600x600-4-crayfish.jpg', '19082022035258-4-crayfish.jpg', '80280', '2022-08-18 16:22:58', '2022-08-18 16:22:58'),
(660, '1-squid', '1-squid', '19082022040651-600x600-1-squid.jpg', '19082022040651-1-squid.jpg', '68159', '2022-08-18 16:36:51', '2022-08-18 16:36:51'),
(661, '2-squid', '2-squid', '19082022040654-600x600-2-squid.jpg', '19082022040654-2-squid.jpg', '63012', '2022-08-18 16:36:54', '2022-08-18 16:36:54'),
(662, '3-squid', '3-squid', '19082022040657-600x600-3-squid.jpg', '19082022040657-3-squid.jpg', '68586', '2022-08-18 16:36:57', '2022-08-18 16:36:57'),
(663, '4-squid', '4-squid', '19082022040700-600x600-4-squid.jpg', '19082022040700-4-squid.jpg', '91243', '2022-08-18 16:37:00', '2022-08-18 16:37:00'),
(664, '1-chicken', '1-chicken', '19082022041622-400x400-1-chicken.jpg', '19082022041622-1-chicken.jpg', '68397', '2022-08-18 16:46:22', '2022-08-18 16:46:22'),
(665, '2-chicken', '2-chicken', '19082022041625-400x400-2-chicken.jpg', '19082022041625-2-chicken.jpg', '69711', '2022-08-18 16:46:25', '2022-08-18 16:46:25'),
(666, '3-chicken', '3-chicken', '19082022041628-400x400-3-chicken.jpg', '19082022041628-3-chicken.jpg', '70607', '2022-08-18 16:46:28', '2022-08-18 16:46:28'),
(667, '4-chicken', '4-chicken', '19082022041949-600x600-4-chicken.jpg', '19082022041949-4-chicken.jpg', '79294', '2022-08-18 16:49:49', '2022-08-18 16:49:49'),
(668, '1-rack-of-lamb', '1-rack-of-lamb', '19082022042756-600x600-1-rack-of-lamb.jpg', '19082022042756-1-rack-of-lamb.jpg', '87603', '2022-08-18 16:57:56', '2022-08-18 16:57:56'),
(669, '2-rack-of-lamb', '2-rack-of-lamb', '19082022042800-600x600-2-rack-of-lamb.jpg', '19082022042800-2-rack-of-lamb.jpg', '69080', '2022-08-18 16:58:00', '2022-08-18 16:58:00'),
(670, '3-rack-of-lamb', '3-rack-of-lamb', '19082022042803-600x600-3-rack-of-lamb.jpg', '19082022042803-3-rack-of-lamb.jpg', '96447', '2022-08-18 16:58:03', '2022-08-18 16:58:03'),
(671, '4-rack-of-lamb', '4-rack-of-lamb', '19082022042805-600x600-4-rack-of-lamb.jpg', '19082022042805-4-rack-of-lamb.jpg', '71427', '2022-08-18 16:58:06', '2022-08-18 16:58:06'),
(672, '2-chicken', '2-chicken', '19082022043756-600x600-2-chicken.jpg', '19082022043756-2-chicken.jpg', '80055', '2022-08-18 17:07:57', '2022-08-18 17:07:57'),
(673, '4-chicken', '4-chicken', '19082022043759-600x600-4-chicken.jpg', '19082022043759-4-chicken.jpg', '91099', '2022-08-18 17:07:59', '2022-08-18 17:07:59'),
(674, '1-raw-chicken-legs', '1-raw-chicken-legs', '19082022043919-600x600-1-raw-chicken-legs.jpg', '19082022043919-1-raw-chicken-legs.jpg', '75564', '2022-08-18 17:09:19', '2022-08-18 17:09:19'),
(675, '3-raw-chicken-legs', '3-raw-chicken-legs', '19082022043922-600x600-3-raw-chicken-legs.jpg', '19082022043922-3-raw-chicken-legs.jpg', '124101', '2022-08-18 17:09:23', '2022-08-18 17:09:23'),
(676, '1-blackberry', '1-blackberry', '19082022044622-400x400-1-blackberry.jpg', '19082022044622-1-blackberry.jpg', '84951', '2022-08-18 17:16:22', '2022-08-18 17:16:22'),
(677, '2-blackberry', '2-blackberry', '19082022044625-400x400-2-blackberry.jpg', '19082022044625-2-blackberry.jpg', '80751', '2022-08-18 17:16:25', '2022-08-18 17:16:25'),
(678, '3-blackberry', '3-blackberry', '19082022044628-400x400-3-blackberry.jpg', '19082022044628-3-blackberry.jpg', '89988', '2022-08-18 17:16:28', '2022-08-18 17:16:28'),
(679, '1-passion', '1-passion', '19082022050242-600x600-1-passion.jpg', '19082022050242-1-passion.jpg', '108207', '2022-08-18 17:32:42', '2022-08-18 17:32:42'),
(680, '2-passion', '2-passion', '19082022050245-600x600-2-passion.jpg', '19082022050245-2-passion.jpg', '105597', '2022-08-18 17:32:46', '2022-08-18 17:32:46'),
(681, '3-passion', '3-passion', '19082022050248-600x600-3-passion.jpg', '19082022050248-3-passion.jpg', '92662', '2022-08-18 17:32:48', '2022-08-18 17:32:48'),
(682, '4-passion', '4-passion', '19082022050251-600x600-4-passion.jpg', '19082022050251-4-passion.jpg', '87726', '2022-08-18 17:32:51', '2022-08-18 17:32:51'),
(683, '1-peach', '1-peach', '19082022051624-600x600-1-peach.jpg', '19082022051624-1-peach.jpg', '92705', '2022-08-18 17:46:24', '2022-08-18 17:46:24'),
(684, '2-peach', '2-peach', '19082022051627-600x600-2-peach.jpg', '19082022051627-2-peach.jpg', '84713', '2022-08-18 17:46:27', '2022-08-18 17:46:27'),
(685, '3-peach', '3-peach', '19082022051631-600x600-3-peach.jpg', '19082022051631-3-peach.jpg', '83777', '2022-08-18 17:46:31', '2022-08-18 17:46:31'),
(686, '4-peach', '4-peach', '19082022051634-600x600-4-peach.jpg', '19082022051634-4-peach.jpg', '90291', '2022-08-18 17:46:34', '2022-08-18 17:46:34'),
(687, '1-pizza', '1-pizza', '19082022052814-600x600-1-pizza.jpg', '19082022052814-1-pizza.jpg', '93117', '2022-08-18 17:58:14', '2022-08-18 17:58:14'),
(688, '2-pizza', '2-pizza', '19082022052817-600x600-2-pizza.jpg', '19082022052817-2-pizza.jpg', '104220', '2022-08-18 17:58:17', '2022-08-18 17:58:17'),
(689, '3-pizza', '3-pizza', '19082022052820-600x600-3-pizza.jpg', '19082022052820-3-pizza.jpg', '100579', '2022-08-18 17:58:20', '2022-08-18 17:58:20'),
(690, '4-pizza', '4-pizza', '19082022052823-600x600-4-pizza.jpg', '19082022052823-4-pizza.jpg', '89992', '2022-08-18 17:58:23', '2022-08-18 17:58:23'),
(691, '1-chicken-wings', '1-chicken-wings', '19082022054547-600x600-1-chicken-wings.jpg', '19082022054547-1-chicken-wings.jpg', '100222', '2022-08-18 18:15:47', '2022-08-18 18:15:47'),
(692, '2-chicken-wings', '2-chicken-wings', '19082022054551-600x600-2-chicken-wings.jpg', '19082022054551-2-chicken-wings.jpg', '77458', '2022-08-18 18:15:51', '2022-08-18 18:15:51'),
(693, '3-chicken-wings', '3-chicken-wings', '19082022054554-600x600-3-chicken-wings.jpg', '19082022054554-3-chicken-wings.jpg', '83574', '2022-08-18 18:15:54', '2022-08-18 18:15:54'),
(694, '4-chicken-wings', '4-chicken-wings', '19082022054557-600x600-4-chicken-wings.jpg', '19082022054557-4-chicken-wings.jpg', '82045', '2022-08-18 18:15:57', '2022-08-18 18:15:57'),
(697, '1-sandwich', '1-sandwich', '19082022093540-600x600-1-sandwich.jpg', '19082022093540-1-sandwich.jpg', '121445', '2022-08-18 22:05:40', '2022-08-18 22:05:40'),
(698, '2-sandwich', '2-sandwich', '19082022093545-600x600-2-sandwich.jpg', '19082022093545-2-sandwich.jpg', '112183', '2022-08-18 22:05:45', '2022-08-18 22:05:45'),
(699, '3-sandwich', '3-sandwich', '19082022093548-600x600-3-sandwich.jpg', '19082022093548-3-sandwich.jpg', '92642', '2022-08-18 22:05:49', '2022-08-18 22:05:49'),
(700, '4-sandwich', '4-sandwich', '19082022093552-600x600-4-sandwich.jpg', '19082022093552-4-sandwich.jpg', '97780', '2022-08-18 22:05:52', '2022-08-18 22:05:52'),
(701, '5-sandwich', '5-sandwich', '19082022093555-600x600-5-sandwich.jpg', '19082022093555-5-sandwich.jpg', '74895', '2022-08-18 22:05:55', '2022-08-18 22:05:55'),
(702, '1-mixed-dry-fruits', '1-mixed-dry-fruits', '19082022094844-400x400-1-mixed-dry-fruits.jpg', '19082022094844-1-mixed-dry-fruits.jpg', '100759', '2022-08-18 22:18:45', '2022-08-18 22:18:45'),
(703, '2-mixed-dry-fruits', '2-mixed-dry-fruits', '19082022094855-400x400-2-mixed-dry-fruits.jpg', '19082022094855-2-mixed-dry-fruits.jpg', '76614', '2022-08-18 22:18:55', '2022-08-18 22:18:55'),
(704, '3-mixed-dry-fruits', '3-mixed-dry-fruits', '19082022094858-400x400-3-mixed-dry-fruits.jpg', '19082022094858-3-mixed-dry-fruits.jpg', '81772', '2022-08-18 22:18:58', '2022-08-18 22:18:58'),
(705, '4-mixed-dry-fruits', '4-mixed-dry-fruits', '19082022094902-400x400-4-mixed-dry-fruits.jpg', '19082022094902-4-mixed-dry-fruits.jpg', '75634', '2022-08-18 22:19:02', '2022-08-18 22:19:02'),
(706, '1-cashews', '1-cashews', '19082022100202-400x400-1-cashews.jpg', '19082022100202-1-cashews.jpg', '72320', '2022-08-18 22:32:02', '2022-08-18 22:32:02'),
(707, '2-cashews', '2-cashews', '19082022100205-400x400-2-cashews.jpg', '19082022100205-2-cashews.jpg', '78948', '2022-08-18 22:32:05', '2022-08-18 22:32:05'),
(708, '3-cashews', '3-cashews', '19082022100208-400x400-3-cashews.jpg', '19082022100208-3-cashews.jpg', '70591', '2022-08-18 22:32:08', '2022-08-18 22:32:08'),
(709, '1-almond-badam', '1-almond-badam', '19082022100759-400x400-1-almond-badam.jpg', '19082022100759-1-almond-badam.jpg', '76824', '2022-08-18 22:37:59', '2022-08-18 22:37:59'),
(710, '2-almond-badam', '2-almond-badam', '19082022100801-400x400-2-almond-badam.jpg', '19082022100801-2-almond-badam.jpg', '73805', '2022-08-18 22:38:01', '2022-08-18 22:38:01'),
(711, '3-almond-badam', '3-almond-badam', '19082022100804-400x400-3-almond-badam.jpg', '19082022100804-3-almond-badam.jpg', '90721', '2022-08-18 22:38:04', '2022-08-18 22:38:04'),
(712, '1-herbal-tea', '1-herbal-tea', '19082022101914-600x600-1-herbal-tea.jpg', '19082022101914-1-herbal-tea.jpg', '64659', '2022-08-18 22:49:15', '2022-08-18 22:49:15'),
(713, '2-herbal-tea', '2-herbal-tea', '19082022101918-600x600-2-herbal-tea.jpg', '19082022101918-2-herbal-tea.jpg', '65182', '2022-08-18 22:49:18', '2022-08-18 22:49:18'),
(714, '3-herbal-tea', '3-herbal-tea', '19082022101920-600x600-3-herbal-tea.jpg', '19082022101920-3-herbal-tea.jpg', '62257', '2022-08-18 22:49:20', '2022-08-18 22:49:20'),
(715, '1-coffee-latte', '1-coffee-latte', '19082022102541-600x600-1-coffee-latte.jpg', '19082022102541-1-coffee-latte.jpg', '71705', '2022-08-18 22:55:41', '2022-08-18 22:55:41'),
(716, '2-coffee-latte', '2-coffee-latte', '19082022102545-600x600-2-coffee-latte.jpg', '19082022102545-2-coffee-latte.jpg', '64828', '2022-08-18 22:55:45', '2022-08-18 22:55:45'),
(717, '1-green-tea', '1-green-tea', '19082022103010-400x400-1-green-tea.jpg', '19082022103010-1-green-tea.jpg', '81500', '2022-08-18 23:00:10', '2022-08-18 23:00:10'),
(718, '2-green-tea', '2-green-tea', '19082022103014-400x400-2-green-tea.jpg', '19082022103014-2-green-tea.jpg', '80422', '2022-08-18 23:00:14', '2022-08-18 23:00:14'),
(719, '3-green-tea', '3-green-tea', '19082022103017-400x400-3-green-tea.jpg', '19082022103017-3-green-tea.jpg', '67458', '2022-08-18 23:00:17', '2022-08-18 23:00:17'),
(720, '2-pastry', '2-pastry', '19082022103844-400x400-2-pastry.jpg', '19082022103844-2-pastry.jpg', '76709', '2022-08-18 23:08:44', '2022-08-18 23:08:44'),
(721, '1-pastry', '1-pastry', '19082022103847-400x400-1-pastry.jpg', '19082022103847-1-pastry.jpg', '63752', '2022-08-18 23:08:47', '2022-08-18 23:08:47'),
(722, '3-pastry', '3-pastry', '19082022103850-400x400-3-pastry.jpg', '19082022103850-3-pastry.jpg', '96196', '2022-08-18 23:08:50', '2022-08-18 23:08:50'),
(723, '1-w-bread', '1-w-bread', '19082022104438-600x600-1-w-bread.jpg', '19082022104438-1-w-bread.jpg', '82945', '2022-08-18 23:14:38', '2022-08-18 23:14:38'),
(724, '2-w-bread', '2-w-bread', '19082022104442-600x600-2-w-bread.jpg', '19082022104442-2-w-bread.jpg', '79438', '2022-08-18 23:14:42', '2022-08-18 23:14:42'),
(725, '3-w-bread', '3-w-bread', '19082022104445-600x600-3-w-bread.jpg', '19082022104445-3-w-bread.jpg', '93877', '2022-08-18 23:14:45', '2022-08-18 23:14:45'),
(726, '1-hand-painted-bread', '1-hand-painted-bread', '19082022104904-600x600-1-hand-painted-bread.jpg', '19082022104904-1-hand-painted-bread.jpg', '79208', '2022-08-18 23:19:04', '2022-08-18 23:19:04'),
(727, '2-hand-painted-bread', '2-hand-painted-bread', '19082022104907-600x600-2-hand-painted-bread.jpg', '19082022104907-2-hand-painted-bread.jpg', '72555', '2022-08-18 23:19:07', '2022-08-18 23:19:07'),
(728, '3-hand-painted-bread', '3-hand-painted-bread', '19082022104911-600x600-3-hand-painted-bread.jpg', '19082022104911-3-hand-painted-bread.jpg', '94362', '2022-08-18 23:19:11', '2022-08-18 23:19:11'),
(737, 'slider-1', 'slider-1', '19082022181217-400x400-slider-1.jpg', '19082022181217-slider-1.jpg', '87168', '2022-08-19 06:42:18', '2022-08-19 06:42:18'),
(739, 'slider-2', 'slider-2', '19082022181336-400x400-slider-2.jpg', '19082022181336-slider-2.jpg', '102493', '2022-08-19 06:43:36', '2022-08-19 06:43:36'),
(743, 'slider_h2_1', 'slider_h2_1', '20082022150916-400x400-slider_h2_1.jpg', '20082022150916-slider_h2_1.jpg', '137276', '2022-08-20 03:39:16', '2022-08-20 03:39:16'),
(744, 'slider_h2_2', 'slider_h2_2', '20082022151519-400x400-slider_h2_2.jpg', '20082022151519-slider_h2_2.jpg', '119365', '2022-08-20 03:45:19', '2022-08-20 03:45:19'),
(753, 'banner_5', 'banner_5', '22082022150919-400x400-banner_5.jpg', '22082022150919-banner_5.jpg', '22454', '2022-08-22 03:39:19', '2022-08-22 03:39:19'),
(754, 'banner_4', 'banner_4', '22082022151023-400x400-banner_4.jpg', '22082022151023-banner_4.jpg', '20568', '2022-08-22 03:40:23', '2022-08-22 03:40:23'),
(755, 'banner-3', 'banner-3', '22082022151100-400x400-banner-3.jpg', '22082022151100-banner-3.jpg', '24255', '2022-08-22 03:41:00', '2022-08-22 03:41:00'),
(756, 'banner-2', 'banner-2', '22082022151301-400x400-banner-2.jpg', '22082022151301-banner-2.jpg', '28504', '2022-08-22 03:43:01', '2022-08-22 03:43:01'),
(757, 'banner_1', 'banner_1', '22082022151335-400x400-banner_1.jpg', '22082022151335-banner_1.jpg', '89410', '2022-08-22 03:43:35', '2022-08-22 03:43:35'),
(758, 'deals_offer', 'deals_offer', '02092022061039-400x400-deals_offer.png', '02092022061039-deals_offer.png', '407063', '2022-09-01 18:40:39', '2022-09-01 18:40:39'),
(759, 'brand-1', 'brand-1', '09092022091517-400x400-brand-1.png', '09092022091517-brand-1.png', '15694', '2022-09-08 21:45:17', '2022-09-08 21:45:17'),
(760, 'brand-2', 'brand-2', '09092022091519-400x400-brand-2.png', '09092022091519-brand-2.png', '57554', '2022-09-08 21:45:20', '2022-09-08 21:45:20'),
(761, 'brand-3', 'brand-3', '09092022091522-400x400-brand-3.png', '09092022091522-brand-3.png', '17331', '2022-09-08 21:45:22', '2022-09-08 21:45:22'),
(762, 'brand-4', 'brand-4', '09092022091524-400x400-brand-4.png', '09092022091524-brand-4.png', '44480', '2022-09-08 21:45:24', '2022-09-08 21:45:24'),
(763, 'brand-5', 'brand-5', '09092022091526-400x400-brand-5.png', '09092022091526-brand-5.png', '14029', '2022-09-08 21:45:26', '2022-09-08 21:45:26'),
(764, 'brand-6', 'brand-6', '09092022091528-400x400-brand-6.png', '09092022091528-brand-6.png', '20563', '2022-09-08 21:45:28', '2022-09-08 21:45:28'),
(765, 'brand-7', 'brand-7', '09092022091535-400x400-brand-7.png', '09092022091535-brand-7.png', '12292', '2022-09-08 21:45:35', '2022-09-08 21:45:35'),
(770, 'blog_12', 'blog_12', '19102022165845-800x800-blog_12.jpg', '19102022165845-blog_12.jpg', '310824', '2022-10-19 05:28:45', '2022-10-19 05:28:45'),
(771, 'blog_11', 'blog_11', '19102022165907-800x800-blog_11.jpg', '19102022165907-blog_11.jpg', '577105', '2022-10-19 05:29:07', '2022-10-19 05:29:07'),
(772, 'blog_10', 'blog_10', '19102022170549-800x800-blog_10.jpg', '19102022170549-blog_10.jpg', '606860', '2022-10-19 05:35:49', '2022-10-19 05:35:49'),
(773, 'blog_9', 'blog_9', '19102022173946-800x800-blog_9.jpg', '19102022173946-blog_9.jpg', '363638', '2022-10-19 06:09:46', '2022-10-19 06:09:46'),
(774, 'blog_8', 'blog_8', '19102022174215-800x800-blog_8.jpg', '19102022174215-blog_8.jpg', '757841', '2022-10-19 06:12:15', '2022-10-19 06:12:15'),
(775, 'blog_7', 'blog_7', '20102022160647-800x800-blog_7.jpg', '20102022160647-blog_7.jpg', '512132', '2022-10-20 04:36:47', '2022-10-20 04:36:47'),
(776, 'blog_6', 'blog_6', '20102022160908-800x800-blog_6.jpg', '20102022160908-blog_6.jpg', '736939', '2022-10-20 04:39:08', '2022-10-20 04:39:08'),
(777, 'blog_5', 'blog_5', '20102022161346-800x800-blog_5.jpg', '20102022161346-blog_5.jpg', '692822', '2022-10-20 04:43:46', '2022-10-20 04:43:46'),
(778, 'blog_4', 'blog_4', '21102022130649-800x800-blog_4.jpg', '21102022130649-blog_4.jpg', '516776', '2022-10-21 01:36:50', '2022-10-21 01:36:50'),
(779, 'blog_3', 'blog_3', '21102022130816-800x800-blog_3.jpg', '21102022130816-blog_3.jpg', '581185', '2022-10-21 01:38:16', '2022-10-21 01:38:16'),
(780, 'blog_2', 'blog_2', '21102022130938-800x800-blog_2.jpg', '21102022130938-blog_2.jpg', '702738', '2022-10-21 01:39:38', '2022-10-21 01:39:38'),
(781, 'blog_1', 'blog_1', '21102022131056-800x800-blog_1.jpg', '21102022131056-blog_1.jpg', '432895', '2022-10-21 01:40:57', '2022-10-21 01:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `message_action`
--

CREATE TABLE `message_action` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_hard_delete` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_action`
--

INSERT INTO `message_action` (`id`, `conversation_id`, `deleted_by`, `created_at`, `updated_at`, `is_hard_delete`) VALUES
(0, 17, 9, NULL, NULL, 0),
(0, 18, 9, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `metas`
--

CREATE TABLE `metas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` mediumtext DEFAULT NULL,
  `meta_keyword` mediumtext DEFAULT NULL,
  `og_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `metas`
--

INSERT INTO `metas` (`id`, `uuid`, `slug`, `page_name`, `meta_title`, `meta_description`, `meta_keyword`, `og_image`, `created_at`, `updated_at`) VALUES
(1, '4bcd0b6f-5692-4966-8a4e-8884d72edaa4', 'home', 'Home', 'Home', 'LMSZai Learning management system', 'Lmszai, Lms, Learning, Course', NULL, NULL, '2023-07-18 07:44:59'),
(2, '3c3ef58d-d459-441b-9b90-370f840b2da1', 'course', 'Course List', 'Courses', 'LMSZai Course List', 'Lmszai, Lms, Learning, Course', NULL, NULL, '2023-07-18 07:44:59'),
(5, '62892323-3220-408d-81ea-8875dc1065f4', 'blog', 'Blog List', 'Blog', 'LMSZAI Blog', 'blog, course', NULL, NULL, '2023-07-18 07:44:59'),
(7, '4869c7e6-9635-4203-850a-09a41f4954cc', 'about_us', 'About Us', 'About Us', 'About Us', 'about us', NULL, NULL, '2024-06-07 05:23:20'),
(8, 'b7b70870-0248-4781-a9a3-a76cffefb534', 'contact_us', 'Contact Us', 'Contact Us', 'LMSZAI contact us', 'lmszai, contact us', NULL, NULL, '2023-07-18 07:44:59'),
(9, '07d0a702-7a57-428f-8003-c172679ecbd2', 'support_faq', 'Support Page', 'Support', 'LMSZAI support ticket', 'lmszai, support, ticket', NULL, NULL, '2023-07-18 07:44:59'),
(10, 'f00f9d36-6b9c-47ee-8649-8f50a2f9fe7a', 'privacy_policy', 'Privacy Policy', 'Privacy Policy', 'LMSZAI Privacy Policy', 'lmszai, privacy, policy', NULL, NULL, '2023-07-18 07:44:59'),
(11, 'f74400a5-415f-4604-849e-a03e4896ff99', 'cookie_policy', 'Cookie Policy', 'Cookie Policy', 'LMSZAI Cookie Policy', 'lmszai, cookie, policy', NULL, NULL, '2023-07-18 07:44:59'),
(12, '2e0f0a6e-c573-475c-8913-95e241504c1a', 'faq', 'FAQ', 'FAQ', 'LMSZAI FAQ', 'lmszai, faq', NULL, NULL, '2023-07-18 07:44:59'),
(13, '2e0f0a6e-c573-479c-8913-95e241504c1a', 'terms_and_condition', 'Terms & Conditions', 'Terms & Conditions', 'LMSZAI Terms & Conditions Policy', 'Terms,Conditions', NULL, NULL, '2023-07-18 07:44:59'),
(14, '2e0f0a6e-c573-479c-8913-95e24150000a', 'refund_policy', 'Refund Policy', 'Refund Policy', 'LMSZAI Refund Policy', 'Refund Policies', NULL, NULL, '2023-07-18 07:44:59'),
(51, 'd538d469-265f-44fc-95b9-dc57d10f8c81', 'default', 'Default', 'Demo Title', 'Demo Description', 'Demo Keywords', '', NULL, NULL),
(52, 'a241f1cb-3711-4609-90b2-976cb1ab53f7', 'auth', 'Auth Page', 'Auth Page', 'Auth Page Meta Description', 'Auth Page Meta Keywords', '', NULL, NULL),
(53, '26092a11-6aea-44ce-8880-41b47c692324', 'bundle', 'Bundle List', 'Bundle List', 'Bundle List Page Meta Description', 'Bundle List Page Meta Keywords', '', NULL, NULL),
(54, '42c68cfa-028f-4ffd-b4a0-b8da50978854', 'consultation', 'Consultation List', 'Consultation List', 'Consultation List Page Meta Description', 'Consultation List Page Meta Keywords', '', NULL, NULL),
(55, '857e3c5c-8430-4c5d-b009-e8f7e33dceb0', 'instructor', 'Instructor List', 'Instructor List', 'Instructor List Page Meta Description', 'Instructor List Page Meta Keywords', '', NULL, NULL),
(56, '2f9557c3-c10e-4b47-bf1c-040b6f0182e3', 'saas', 'Saas List', 'Saas List', 'Saas List Page Meta Description', 'Saas List Page Meta Keywords', '', NULL, NULL),
(57, 'b945d05c-d72b-4d1e-838d-f552c769d28f', 'subscription', 'Subscription List', 'Subscription List', 'Subscription List Page Meta Description', 'Subscription List Page Meta Keywords', '', NULL, NULL),
(58, 'a26d5ab1-1fd5-4eeb-9b32-04469f751cbf', 'verify_certificate', 'Verify certificate List', 'Verify certificate List', 'Verify certificate List Page Meta Description', 'Verify certificate List Page Meta Keywords', '', NULL, NULL),
(59, 'e5089c78-bca2-4d57-9cd4-2f3792d09810', 'forum', 'Forum', 'Forum', 'Forum Page Meta Description', 'Forum Page Meta Keywords', '', NULL, NULL);

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
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_17_112209_add_socialite_fields_to_users_table', 2),
(6, '2023_12_24_999999_add_active_status_to_users', 3),
(7, '2023_12_24_999999_add_avatar_to_users', 3),
(8, '2023_12_24_999999_add_dark_mode_to_users', 3),
(9, '2023_12_24_999999_add_messenger_color_to_users', 3),
(10, '2023_12_24_999999_create_chatify_favorites_table', 3),
(11, '2023_12_24_999999_create_chatify_messages_table', 3),
(12, '2023_12_25_053745_create_orders_table', 4),
(13, '2023_12_25_104906_create_tasks_table', 5),
(14, '2023_12_25_133036_create_purchases_table', 6),
(15, '2023_12_27_043258_create_balances_table', 7),
(16, '2023_12_27_044127_add_balance_to_users_table', 8),
(17, '2023_12_27_080751_create_payments_table', 9),
(18, '2016_06_01_000001_create_oauth_auth_codes_table', 10),
(19, '2016_06_01_000002_create_oauth_access_tokens_table', 10),
(20, '2016_06_01_000003_create_oauth_refresh_tokens_table', 10),
(21, '2016_06_01_000004_create_oauth_clients_table', 10),
(22, '2016_06_01_000005_create_oauth_personal_access_clients_table', 10),
(23, '2024_01_10_085202_create_posting_ads_table', 11),
(24, '2024_01_10_121310_create_images_table', 12),
(25, '2024_01_17_071550_create_banners_table', 13),
(26, '2024_01_17_085258_create_ads_table', 14),
(27, '2024_01_17_104036_create_calendars_table', 15),
(28, '2024_01_17_140951_create_credit_reload_promotions_table', 16),
(29, '2024_01_16_172130_create_attentions_table', 17),
(30, '2024_06_09_091155_create_permissions_table', 18),
(31, '2024_06_24_084835_create_product_variations_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `text` varchar(255) NOT NULL,
  `target_url` varchar(255) DEFAULT NULL,
  `is_seen` varchar(255) NOT NULL DEFAULT 'no' COMMENT 'yes, no',
  `user_type` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1=admin, 2=instructor, 3=student',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `uuid`, `sender_id`, `user_id`, `text`, `target_url`, `is_seen`, `user_type`, `created_at`, `updated_at`) VALUES
(1, '99dfced7-5d8a-4d8d-9702-c2378ab1eb5a', 3, 3, 'check', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 03:45:25', '2024-04-09 03:45:46'),
(2, 'f4bee097-3288-40e8-8adf-abd1e5a58657', 4, 4, 'fgdf', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 03:45:56', '2024-04-09 03:47:53'),
(3, '937b1b02-1a2e-40dd-9749-eebf93991939', 4, 4, 'fdgfhgfhfh', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 03:45:59', '2024-04-09 03:56:45'),
(4, 'b3365cc5-49d4-46b1-81b9-786fc06a50cc', 4, 4, 'ertete', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 03:46:02', '2024-04-09 04:00:46'),
(5, '8a3f415c-a530-48c3-a06a-54a56fcacc34', 3, 4, 'iouo', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 03:59:09', '2024-04-09 04:00:46'),
(6, '4d9ac21b-ee2e-4ba3-8835-a8cb86b7275b', 3, 4, 'bbhhgjghj', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 03:59:14', '2024-04-09 04:00:46'),
(7, 'dd6b19c7-b11d-4d03-af23-502e24a7604d', 3, 4, 'fghfdgfd', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 04:00:24', '2024-04-09 04:00:46'),
(8, 'cd593c0f-9d01-48e0-82d5-3cb1a27725ff', 3, 4, 'vbnvn', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 04:00:29', '2024-04-09 04:00:46'),
(9, '4d61e14c-9b78-4ace-8949-4a4ce3684c7b', 4, 3, 'vbvzzx', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 04:01:05', '2024-04-09 04:01:46'),
(10, '30b19b51-2e1b-4d6c-a3f1-830d659bc488', 4, 3, 'weqeqe', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 04:01:10', '2024-04-09 04:01:46'),
(11, '65894d7b-2ddd-4b9c-8285-ae7e172678af', 4, 3, 'kj;j;jljkl', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 04:01:15', '2024-04-09 04:01:46'),
(12, '77a7e377-cd47-41f7-9a04-2edc47bee3ca', 3, 4, 'hey whats up', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 07:38:07', '2024-04-09 08:01:15'),
(13, '37c7b788-0626-44e6-afed-fa936c7e8b89', 4, 3, 'just testing chatting feature', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 07:38:26', '2024-04-09 08:17:27'),
(14, 'ed7c8ce2-5558-44c2-b441-b78570255717', 3, 4, 'yeah it\'s working', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 07:38:50', '2024-04-09 08:01:15'),
(15, '90e1027e-027f-4ce4-aba0-43e38b600a1b', 4, 3, 'i know but you need to improve chatting system more', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 07:39:27', '2024-04-09 08:17:27'),
(16, 'd9d70bea-11ac-43d0-b9da-405547dbda42', 3, 4, 'yeah i will', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 07:39:50', '2024-04-09 08:01:15'),
(17, '7df5d469-67cd-4d79-84a5-1ad247eb0ae9', 4, 3, 'eneough for now', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 07:40:13', '2024-04-09 08:17:27'),
(18, 'ba98d56e-4fe0-4234-83f2-112924797743', 3, 4, 'ok', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 07:40:21', '2024-04-09 08:01:15'),
(19, 'a3916bd7-36bf-48f9-bd96-ec7f7cc05e5a', 3, 4, 'hi', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:02:14', '2024-04-09 08:17:58'),
(20, '0531f7f3-1202-477c-af2e-0dddc28146ca', 4, 3, 'hi', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:02:30', '2024-04-09 08:17:27'),
(21, '0af3600a-6b67-4faf-ae4a-f18a330b982f', 4, 3, 'mfgfdg', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:02:56', '2024-04-09 08:17:27'),
(22, '87fc9dd4-99c8-4813-aba7-0fac9e2d01e8', 3, 4, 'rrr', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:10:21', '2024-04-09 08:17:58'),
(23, 'd00fec13-3040-4170-aa96-e7c1173635a9', 4, 3, '3333', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:10:34', '2024-04-09 08:17:27'),
(24, 'c915a605-74f6-48b8-8062-d1a24004de91', 3, 4, 'sd', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:10:55', '2024-04-09 08:17:58'),
(25, 'cbeb3eaf-8cac-49c5-a7cf-3826d29db7cc', 3, 4, 'sdfa', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:11:04', '2024-04-09 08:17:58'),
(26, 'f47f0935-36d2-4e1e-b764-a6dba7a86ae2', 4, 3, 'sdd', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:11:18', '2024-04-09 08:17:27'),
(27, '33b7666c-6741-442b-9963-56d9a922128e', 3, 4, 'sdf', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:11:29', '2024-04-09 08:17:58'),
(28, '15329116-be2b-4377-afbe-483c10261e6d', 4, 3, 'sd', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:12:00', '2024-04-09 08:17:27'),
(29, '9ad2815e-6e71-4853-91ea-0c70bcf0d0ca', 3, 4, 'dfghf', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:12:43', '2024-04-09 08:17:58'),
(30, '77159643-7d5d-43d4-867d-6da78f7e32f7', 4, 3, '[[[', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:12:57', '2024-04-09 08:17:27'),
(31, 'be0ea40d-2fe9-4d38-9175-ca774b9a4b69', 3, 4, ']]]', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-09 08:13:14', '2024-04-09 08:17:58'),
(32, '16117097-583a-4823-a3d1-5cea773cbbdb', 1, 1, 'Project status is unknown.', 'http://127.0.0.1:8000/project-details/non-qui-dolor-et-et-iste-veniam-1', 'yes', 2, '2024-04-12 01:21:22', '2024-04-17 00:22:03'),
(33, '720ad673-f95a-4147-a2bb-ace8e5be806d', 1, 1, 'Project has been approved.', 'http://127.0.0.1:8000/project-details/unogesic-mr-250mg50mg325mg-tablet-wow', 'yes', 2, '2024-04-12 01:29:28', '2024-04-17 00:22:03'),
(34, '1fbba4c0-e899-497a-bf64-bf9a0e901dc3', 28, 28, 'A new user has registered on the platform.', 'http://127.0.0.1:8000/admin/users', 'yes', 1, '2024-04-12 05:25:38', '2024-06-21 23:24:55'),
(35, '4f3f8f95-9fda-4cbc-a40f-cadbd39efb79', 29, 29, 'A new user has registered on the platform.', 'http://127.0.0.1:8000/admin/users', 'yes', 1, '2024-04-12 05:28:38', '2024-06-21 23:24:51'),
(36, '1b2972b6-a34f-45e3-8043-e39be6969d17', 1, 1, 'Project has been approved.', 'http://127.0.0.1:8000/project-details/audiophile-first-smart-wireless-headphones-1', 'yes', 2, '2024-04-13 21:45:02', '2024-04-17 00:22:03'),
(37, '68c8c01e-0bb9-460c-8692-53bce08fe6e8', 1, 1, 'Project has been approved.', 'http://127.0.0.1:8000/project-details/audiophile-first-smart-wireless-headphones', 'yes', 2, '2024-04-13 21:45:29', '2024-04-17 00:22:03'),
(38, 'f2a4898a-f63c-4cc4-9804-319d6b6ce29a', 1, 1, 'Project has been approved.', 'http://127.0.0.1:8000/project-details/aut-distinctio-molestiae-accusamus-sint-reprehenderit-aut-et-1', 'yes', 2, '2024-04-13 21:47:17', '2024-04-17 00:22:03'),
(39, '0e701640-9d00-47e7-acff-678a0a5dd442', 1, 1, 'Project has been approved.', 'http://127.0.0.1:8000/project-details/dolor-asperiores-suscipit-magni-numquam-1', 'yes', 2, '2024-04-13 21:48:21', '2024-04-17 00:22:03'),
(40, '945fd99f-fd1f-45bb-a305-df95ae620418', 1, 1, 'Project status is unknown.', 'http://127.0.0.1:8000/project-details/iste-qui-deleniti-quidem-velit-dolor-sint-1', 'yes', 2, '2024-04-13 21:49:28', '2024-04-17 00:22:03'),
(41, '03006259-cd24-4ec9-8cba-cd1f0fd3fb3b', 1, 1, 'Project status is unknown.', 'http://127.0.0.1:8000/project-details/unogesic-mr-250mg50mg325mg-tablet-wow-1', 'yes', 2, '2024-04-13 21:49:50', '2024-04-17 00:22:03'),
(42, '08440c65-d55a-491d-b3be-10131ae5497e', 1, 1, 'Project has been approved.', 'http://127.0.0.1:8000/project-details/audiophile-first-smart-wireless-headphones-1', 'yes', 2, '2024-04-16 22:24:19', '2024-04-17 00:22:03'),
(43, '3ab5fb2e-604e-4144-8812-39d87359de80', 1, 1, 'Project has been approved.', 'http://127.0.0.1:8000/project-details/audiophile-first-smart-wireless-headphones', 'yes', 2, '2024-04-16 22:26:36', '2024-04-17 00:22:03'),
(44, 'aeb22589-6655-4cfb-9018-dd5457e19b1f', 29, 29, 'You have a new backer on your Campaign', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-17 01:08:33', '2024-04-17 01:09:03'),
(45, 'f2edce77-d505-49d1-8762-783f91ff4f3f', 29, 28, 'You have a new backer on your Campaign', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-17 01:15:38', '2024-04-17 02:59:18'),
(46, '676bfbf3-c38a-4dbb-bc30-14fab37d6644', 3, 4, 'n', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-17 01:54:38', '2024-04-17 02:00:13'),
(47, '7bc9a622-9000-4a66-b238-010fa74704cc', 4, 3, 'd', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 01:55:10', '2024-04-17 01:55:10'),
(48, '174fa506-97eb-4e68-a940-46517b90a42f', 4, 3, 'it is working', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 02:00:33', '2024-04-17 02:00:33'),
(49, 'd741da7c-1860-4d58-b913-7d0868b72fe0', 3, 4, 'yeah', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-17 02:01:08', '2024-04-17 02:01:46'),
(50, '243ec4bb-b9cc-4756-95af-82e545b86f6b', 4, 3, 'confuse', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-17 02:03:13', '2024-04-17 02:03:42'),
(51, 'b7a58765-16fa-4474-8c4c-248f1f7f4aff', 3, 4, 'tell me confesiion you have', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-17 02:04:11', '2024-04-17 02:04:30'),
(52, '1f3b8273-e14f-4fbb-b94f-ed5285f92495', 3, 1, 'hi', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 02:53:58', '2024-04-17 02:53:58'),
(53, 'aa098a34-fc81-4eb6-9645-22d18f463341', 28, 28, 'fuck you', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 02:58:24', '2024-04-17 02:58:24'),
(54, '4d8a8dfd-adfe-405d-8a45-9b732c6f4e71', 4, 28, 'j', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-17 03:00:31', '2024-04-17 03:02:39'),
(55, '28b97665-73e3-4d01-bae9-b30da199d9ec', 28, 28, 'y', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:01:04', '2024-04-17 03:01:04'),
(56, '2a491c80-b5c4-4882-a9e9-f179c0abc69e', 28, 4, 'THIS IS TESTING FROM FULL STACK DEV', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:02:49', '2024-04-17 03:02:49'),
(57, '1687b1eb-4be4-4d1d-b348-d720185a51a5', 4, 28, 'sd', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:04:51', '2024-04-17 03:04:51'),
(58, 'd4c37aa2-9c81-4fa4-8e5e-249921514041', 28, 4, 'f', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:05:06', '2024-04-17 03:05:06'),
(59, '1514c365-cdb4-41f6-92bc-0b1131570cd8', 4, 28, 'FROM', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:10:10', '2024-04-17 03:10:10'),
(60, '02a746b3-3ddf-412f-ab46-fc837b34a431', 4, 1, 'd', 'http://127.0.0.1:8000/chat', 'yes', 2, '2024-04-17 03:13:08', '2024-04-17 03:13:59'),
(61, '6c9d61ba-604c-4161-ad90-9ed6ef310fbe', 1, 4, 'what happen', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:14:12', '2024-04-17 03:14:12'),
(62, 'f3a98909-2263-4557-9473-7eb49f40dbf6', 29, 4, 'chatting with mail notification', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:22:56', '2024-04-17 03:22:56'),
(63, '05378e7a-79ea-4538-aa8b-4a50be59ad5a', 29, 4, 'chatting with mail notification', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:22:59', '2024-04-17 03:22:59'),
(64, '564bf604-08b1-4d30-aa9a-0da9388cc1e9', 4, 29, 'yeah', 'http://127.0.0.1:8000/chat', 'no', 2, '2024-04-17 03:24:36', '2024-04-17 03:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `full_name`, `address`, `city`, `country`, `postal_code`, `total_amount`, `created_at`, `updated_at`) VALUES
(23, 44, 'Ivan', 'La Paz', 'La Paz', 'La Paz', NULL, 6912.00, '2024-07-15 04:42:02', '2024-07-15 04:42:02'),
(28, 34, 'Aasif Ahmed', 'Indore', 'Indore', 'Indore', NULL, 576.00, '2024-07-15 06:20:38', '2024-07-15 06:20:38'),
(29, 34, 'Aasif Ahmed', 'Indore', 'Indore', 'Indore', NULL, 34.00, '2024-07-15 09:04:17', '2024-07-15 09:04:17'),
(30, 44, 'Ivan', 'La Paz', 'La Paz', 'La Paz', NULL, 686.00, '2024-07-15 14:07:54', '2024-07-15 14:07:54'),
(31, 33, 'Juan', 'dfgfdghdf', 'ythgfh', 'ythgfh', NULL, 240.00, '2024-07-16 15:23:20', '2024-07-16 15:23:20'),
(32, 40, 'Maribel Prueba', 'Plaza Scout', 'La Paz', 'La Paz', NULL, 1533.00, '2024-07-16 21:59:10', '2024-07-16 21:59:10'),
(33, 40, 'Maribel Prueba', 'Plaza Scout', 'La Paz', 'La Paz', NULL, 1533.00, '2024-07-16 21:59:19', '2024-07-16 21:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `color`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(39, 23, 82, 'blanco', 18, 98.00, '2024-07-15 04:42:02', '2024-07-15 04:42:02'),
(40, 23, 78, 'blanco', 7, 70.00, '2024-07-15 04:42:02', '2024-07-15 04:42:02'),
(41, 23, 79, 'amarillo', 18, 70.00, '2024-07-15 04:42:02', '2024-07-15 04:42:02'),
(42, 23, 82, 'blanco', 21, 98.00, '2024-07-15 04:42:02', '2024-07-15 04:42:02'),
(43, 23, 83, 'naranja', 12, 98.00, '2024-07-15 04:42:02', '2024-07-15 04:42:02'),
(44, 23, 80, '', 1, 164.00, '2024-07-15 04:42:02', '2024-07-15 04:42:02'),
(45, 24, 80, '', 4, 144.00, '2024-07-15 06:15:44', '2024-07-15 06:15:44'),
(46, 25, 80, '', 4, 144.00, '2024-07-15 06:16:07', '2024-07-15 06:16:07'),
(47, 26, 80, '', 4, 144.00, '2024-07-15 06:18:22', '2024-07-15 06:18:22'),
(48, 27, 80, '', 4, 144.00, '2024-07-15 06:19:27', '2024-07-15 06:19:27'),
(49, 28, 80, '', 4, 144.00, '2024-07-15 06:20:38', '2024-07-15 06:20:38'),
(50, 29, 85, 'verde', 1, 34.00, '2024-07-15 09:04:17', '2024-07-15 09:04:17'),
(51, 30, 83, 'naranja', 7, 98.00, '2024-07-15 14:07:54', '2024-07-15 14:07:54'),
(52, 31, 83, 'naranja', 5, 40.00, '2024-07-16 15:23:20', '2024-07-16 15:23:20'),
(53, 31, 83, 'naranja', 1, 40.00, '2024-07-16 15:23:20', '2024-07-16 15:23:20'),
(54, 32, 83, 'naranja', 2, 98.00, '2024-07-16 21:59:10', '2024-07-16 21:59:10'),
(55, 32, 83, 'naranja', 1, 98.00, '2024-07-16 21:59:10', '2024-07-16 21:59:10'),
(56, 32, 82, 'blanco', 6, 98.00, '2024-07-16 21:59:10', '2024-07-16 21:59:10'),
(57, 32, 82, 'blanco', 1, 98.00, '2024-07-16 21:59:10', '2024-07-16 21:59:10'),
(58, 32, 82, 'blanco', 1, 98.00, '2024-07-16 21:59:10', '2024-07-16 21:59:10'),
(59, 32, 85, 'verde', 7, 65.00, '2024-07-16 21:59:10', '2024-07-16 21:59:10'),
(60, 33, 83, 'naranja', 2, 98.00, '2024-07-16 21:59:19', '2024-07-16 21:59:19'),
(61, 33, 83, 'naranja', 1, 98.00, '2024-07-16 21:59:19', '2024-07-16 21:59:19'),
(62, 33, 82, 'blanco', 6, 98.00, '2024-07-16 21:59:19', '2024-07-16 21:59:19'),
(63, 33, 82, 'blanco', 1, 98.00, '2024-07-16 21:59:19', '2024-07-16 21:59:19'),
(64, 33, 82, 'blanco', 1, 98.00, '2024-07-16 21:59:19', '2024-07-16 21:59:19'),
(65, 33, 85, 'verde', 7, 65.00, '2024-07-16 21:59:19', '2024-07-16 21:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `our_histories`
--

CREATE TABLE `our_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `our_histories`
--

INSERT INTO `our_histories` (`id`, `year`, `title`, `subtitle`, `created_at`, `updated_at`) VALUES
(1, '1998', 'Mere tranquil existence', 'Possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart am alone', NULL, '2024-06-09 01:05:11'),
(2, '1998', 'Incapable of drawing', 'Exquisite sense of mere tranquil existence that I neglect my talents add should be incapable of drawing', NULL, '2024-06-09 01:05:11'),
(3, '1998', 'Foliage access trees', 'Serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my', NULL, '2024-06-09 01:05:11'),
(4, '1998', 'Among grass', 'Should be incapable of drawing a single stroke at the present moment; and yet I feel that I never', NULL, '2024-06-09 01:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page_title` varchar(500) NOT NULL,
  `page_slug` varchar(500) NOT NULL,
  `page_content` text NOT NULL,
  `page_order` int(3) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_title`, `page_slug`, `page_content`, `page_order`, `status`) VALUES
(1, 'About', 'about', '<h2>About US</h2>', 1, 1),
(2, 'Términos y condiciones', 'terms-of-use', '<p><strong>Use of this site is provided by Demos subject to the following Terms and Conditions:</strong><br />1. Your use constitutes acceptance of these Terms and Conditions as at the date of your first use of the site.<br />2. Demos reserves the rights to change these Terms and Conditions at any time by posting changes online. Your continued use of this site after changes are posted constitutes your acceptance of this agreement as modified.<br />3. You agree to use this site only for lawful purposes, and in a manner which does not infringe the rights, or restrict, or inhibit the use and enjoyment of the site by any third party.<br />4. This site and the information, names, images, pictures, logos regarding or relating to Demos are provided &ldquo;as is&rdquo; without any representation or endorsement made and without warranty of any kind whether express or implied. In no event will Demos be liable for any damages including, without limitation, indirect or consequential damages, or any damages whatsoever arising from the use or in connection with such use or loss of use of the site, whether in contract or in negligence.<br />5. Demos does not warrant that the functions contained in the material contained in this site will be uninterrupted or error free, that defects will be corrected, or that this site or the server that makes it available are free of viruses or bugs or represents the full functionality, accuracy and reliability of the materials.<br />6. Copyright restrictions: please refer to our Creative Commons license terms governing the use of material on this site.<br />7. Demos takes no responsibility for the content of external Internet Sites.<br />8. Any communication or material that you transmit to, or post on, any public area of the site including any data, questions, comments, suggestions, or the like, is, and will be treated as, non-confidential and non-proprietary information.<br />9. If there is any conflict between these Terms and Conditions and rules and/or specific terms of use appearing on this site relating to specific material then the latter shall prevail.<br />10. These terms and conditions shall be governed and construed in accordance with the laws of England and Wales. Any disputes shall be subject to the exclusive jurisdiction of the Courts of England and Wales.<br />11. If these Terms and Conditions are not accepted in full, the use of this site must be terminated immediately.</p>', 2, 1),
(3, 'política de privacidad', 'privacy-policy', '<p class=\\\"MsoNormal\\\" style=\\\"text-align: center;\\\" align=\\\"center\\\"><strong style=\\\"mso-bidi-font-weight: normal;\\\"><span lang=\\\"es\\\">Pol&iacute;tica de Privacidad de SocialCitas</span></strong></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;</span>&Uacute;ltima actualizaci&oacute;n: 29/ 01 /2024</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">Bienvenido/a a SocialCitas, un servicio de anuncios clasificados dise&ntilde;ado para conectar a anunciantes y usuarios interesados. Por favor, toma un momento para revisar nuestra pol&iacute;tica de privacidad y entender c&oacute;mo gestionamos la informaci&oacute;n.</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><strong style=\\\"mso-bidi-font-weight: normal;\\\"><span lang=\\\"es\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;</span>1. Informaci&oacute;n Recopilada: </span></strong></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">Recopilamos informaci&oacute;n que los usuarios proporcionan voluntariamente, como detalles de contacto, preferencias y detalles de anuncios. Esta informaci&oacute;n se utiliza para mejorar la experiencia de los usuarios y facilitar la conexi&oacute;n entre anunciantes y clientes potenciales.</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><strong style=\\\"mso-bidi-font-weight: normal;\\\"><span lang=\\\"es\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;</span>2. Uso de la Informaci&oacute;n: </span></strong></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">La informaci&oacute;n recopilada se utiliza para optimizar la calidad de nuestros servicios y facilitar transacciones entre anunciantes y usuarios. No compartimos informaci&oacute;n personal con terceros sin el consentimiento expreso del usuario, excepto cuando sea requerido por la ley.</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><strong style=\\\"mso-bidi-font-weight: normal;\\\"><span lang=\\\"es\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;</span>3. Funci&oacute;n de Intermediario: </span></strong></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">SocialCitas act&uacute;a como intermediario entre anunciantes y usuarios. No asumimos responsabilidad por las acciones, resultados o consecuencias que puedan surgir de las interacciones entre usuarios, incluyendo las citas de encuentros.</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><strong style=\\\"mso-bidi-font-weight: normal;\\\"><span lang=\\\"es\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;</span>4. Responsabilidad del Usuario: </span></strong></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">Todos los usuarios aceptan que cualquier encuentro agendado a trav&eacute;s de nuestro servicio es de su entera responsabilidad. SocialCitas no se hace responsable de lo que ocurra durante estas citas.</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><strong style=\\\"mso-bidi-font-weight: normal;\\\"><span lang=\\\"es\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;</span>5. Seguridad de la Informaci&oacute;n: </span></strong></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">Implementamos medidas de seguridad para proteger la informaci&oacute;n recopilada. A pesar de nuestros esfuerzos, no podemos garantizar la seguridad completa. Los usuarios deben tomar precauciones adicionales al compartir informaci&oacute;n sensible.</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><strong style=\\\"mso-bidi-font-weight: normal;\\\"><span lang=\\\"es\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;</span>6. Cambios en la Pol&iacute;tica: </span></strong></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">Nos reservamos el derecho de actualizar esta pol&iacute;tica en cualquier momento. Cambios significativos se comunicar&aacute;n a los usuarios a trav&eacute;s de la plataforma.</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><strong style=\\\"mso-bidi-font-weight: normal;\\\"><span lang=\\\"es\\\"><span style=\\\"mso-spacerun: yes;\\\">&nbsp;</span>7. Contacto: </span></strong></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">Para consultas sobre la pol&iacute;tica de privacidad, por favor cont&aacute;ctanos en </span><span lang=\\\"es\\\" style=\\\"font-size: 10.5pt; line-height: 115%; font-family: Roboto; mso-fareast-font-family: Roboto; mso-bidi-font-family: Roboto; color: #1f1f1f; background: #E9EEF6;\\\">socialcitas127@gmail.com</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">&nbsp;</span></p>\r\n<p class=\\\"MsoNormal\\\"><span lang=\\\"es\\\">Gracias por confiar en SocialCitas. Estamos comprometidos a proteger tu privacidad y proporcionar un servicio seguro y confiable.</span></p>', 3, 1),
(4, 'FAQ', 'faq', '<p>Coming Soon</p>', 4, 1),
(5, 'Contact', 'contact', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\\\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing.</p>', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(7, 'aasifdev5@gmail.com', 'SqagKMZrLr3AzqXLTgryebgXHEX06FQOlUkETb6j', '2023-12-22 08:16:59'),
(8, 'asifarslaan@gmail.com', 'iP3fibOTbjdQz7R1THL7qA16eGpZmInWuzj763sB', '2023-12-18 07:17:16'),
(12, 'flaquit0_mgas_1785@hotmail.com', 'iCy8u3uOntyHsfiir5XtVSYjgWa0UVYr92Y1fOOP', '2024-02-04 00:43:29'),
(13, 'juanartunduaga@gmail.com', 'QtBJ7A3FQD1YpFad2d5K2zb2OSRleCnwjlulaolx', '2024-02-05 18:05:09'),
(14, 'mansilla2244edu@gmail.com', 'QsNSbaePXl8k2pcNMrBm0kajhPt94gYcSrcj4f1r', '2024-02-08 05:26:53'),
(15, 'yasminlopes472@gmail.com', 'lMMe0pXNJ1UTapkQGPnQZuCUX3e6UCQjDo2fFijW', '2024-03-07 15:46:44');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `product_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`product_details`)),
  `user_id` int(11) DEFAULT NULL,
  `reward_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `payment_receipt` text DEFAULT NULL,
  `accepted` tinyint(1) DEFAULT NULL,
  `status` enum('initial','pending','success','failed','declined','dispute') DEFAULT 'initial',
  `payer_email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `name`, `email`, `product_details`, `user_id`, `reward_id`, `amount`, `payment_receipt`, `accepted`, `status`, `payer_email`, `created_at`, `updated_at`) VALUES
(36, 23, 'Ivan', NULL, '[{\"product_id\":\"82\",\"quantity\":\"18\",\"price\":\"98.00\"},{\"product_id\":\"78\",\"quantity\":\"7\",\"price\":\"70.00\"},{\"product_id\":\"79\",\"quantity\":\"18\",\"price\":\"70.00\"},{\"product_id\":\"82\",\"quantity\":\"21\",\"price\":\"98.00\"},{\"product_id\":\"83\",\"quantity\":\"12\",\"price\":\"98.00\"},{\"product_id\":\"80\",\"quantity\":\"1\",\"price\":\"164.00\"}]', 44, NULL, 6912.00, NULL, 0, 'initial', 'jago1410@gmail.com', '2024-07-15 04:42:02', '2024-07-15 04:42:02'),
(41, 28, 'Aasif Ahmed', NULL, '[{\"product_id\":\"80\",\"quantity\":\"4\",\"price\":\"144.00\"}]', 34, NULL, 576.00, NULL, 0, 'initial', 'arstech2a@gmail.com', '2024-07-15 06:20:38', '2024-07-15 06:20:38'),
(42, 29, 'Aasif Ahmed', NULL, '[{\"product_id\":\"85\",\"quantity\":\"1\",\"price\":\"34.00\"}]', 34, NULL, 34.00, NULL, 0, 'initial', 'arstech2a@gmail.com', '2024-07-15 09:04:17', '2024-07-15 09:04:17'),
(43, 30, 'Ivan', NULL, '[{\"product_id\":\"83\",\"quantity\":\"7\",\"price\":\"98.00\"}]', 44, NULL, 686.00, NULL, 0, 'initial', 'jago1410@gmail.com', '2024-07-15 14:07:54', '2024-07-15 14:07:54'),
(44, 31, 'Juan', NULL, '[{\"product_id\":\"83\",\"quantity\":\"5\",\"price\":\"40.00\"},{\"product_id\":\"83\",\"quantity\":\"1\",\"price\":\"40.00\"}]', 33, NULL, 240.00, NULL, 0, 'initial', 'adminer@gmail.com', '2024-07-16 15:23:20', '2024-07-16 15:23:20'),
(45, 32, 'Maribel Prueba', NULL, '[{\"product_id\":\"83\",\"quantity\":\"2\",\"price\":\"98.00\"},{\"product_id\":\"83\",\"quantity\":\"1\",\"price\":\"98.00\"},{\"product_id\":\"82\",\"quantity\":\"6\",\"price\":\"98.00\"},{\"product_id\":\"82\",\"quantity\":\"1\",\"price\":\"98.00\"},{\"product_id\":\"82\",\"quantity\":\"1\",\"price\":\"98.00\"},{\"product_id\":\"85\",\"quantity\":\"7\",\"price\":\"65.00\"}]', 40, NULL, 1533.00, NULL, 0, 'initial', 'ml.urquizo@gmail.com', '2024-07-16 21:59:10', '2024-07-16 21:59:10'),
(46, 33, 'Maribel Prueba', NULL, '[{\"product_id\":\"83\",\"quantity\":\"2\",\"price\":\"98.00\"},{\"product_id\":\"83\",\"quantity\":\"1\",\"price\":\"98.00\"},{\"product_id\":\"82\",\"quantity\":\"6\",\"price\":\"98.00\"},{\"product_id\":\"82\",\"quantity\":\"1\",\"price\":\"98.00\"},{\"product_id\":\"82\",\"quantity\":\"1\",\"price\":\"98.00\"},{\"product_id\":\"85\",\"quantity\":\"7\",\"price\":\"65.00\"}]', 40, NULL, 1533.00, NULL, 0, 'initial', 'ml.urquizo@gmail.com', '2024-07-16 21:59:19', '2024-07-16 21:59:19');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway`
--

CREATE TABLE `payment_gateway` (
  `id` int(11) NOT NULL,
  `gateway_name` varchar(255) NOT NULL,
  `gateway_info` text DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_gateway`
--

INSERT INTO `payment_gateway` (`id`, `gateway_name`, `gateway_info`, `status`) VALUES
(1, 'Paypal', '{\"mode\":\"sandbox\",\"paypal_client_id\":\"4655fghfgrtyrty7fghfy\",\"paypal_secret\":\"65dsf54s54fgjhhdw3qrtvb\",\"braintree_merchant_id\":null,\"braintree_public_key\":null,\"braintree_private_key\":null,\"braintree_merchant_account_id\":null}', 1),
(2, 'Stripe', '{\"stripe_secret_key\":\"4554sdf5f4564f5\",\"stripe_publishable_key\":\"hjtrytew54sd5e4e54\"}', 1),
(3, 'Razorpay', '{\"razorpay_key\":\"ghj67ghjt67u67jh567\",\"razorpay_secret\":\"tryrtyfgyhryrtert54654\"}', 0),
(4, 'Paystack', '{\"paystack_secret_key\":\"98764325\",\"paystack_public_key\":\"ew4rwr34234456fd4ger4354\"}', 1),
(5, 'Instamojo', '{\"mode\":\"sandbox\",\"instamojo_client_id\":\"455445\",\"instamojo_client_secret\":\"56511223\"}', 1),
(6, 'PayUMoney', '{\"mode\":\"sandbox\",\"payu_merchant_id\":null,\"payu_key\":null,\"payu_salt\":null}', 0),
(7, 'Mollie', '{\"mollie_api_key\":\"dffgs56dfgert34tdds\"}', 1),
(8, 'Flutterwave', '{\"flutterwave_public_key\":\"tg4hfh44\",\"flutterwave_secret_key\":\"89fg7d89g7das8dsa788sdf8\",\"flutterwave_encryption_key\":\"fd54g4f54545g\"}', 1),
(9, 'Paytm', '{\"mode\":\"live\",\"paytm_merchant_id\":\"tysdf465sdf54\",\"paytm_merchant_key\":\"gfhsdfsf\"}', 1),
(10, 'Cashfree', '{\"mode\":\"sandbox\",\"cashfree_appid\":null,\"cashfree_secret_key\":null}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Application', NULL, '2024-06-09 04:00:39', '2024-06-09 04:37:12'),
(2, 'Global Settings', 1, '2024-06-09 04:01:36', '2024-06-09 04:01:36'),
(3, 'Location Settings', 1, '2024-06-09 04:02:16', '2024-06-09 04:02:16'),
(4, 'Support Tickets', 1, '2024-06-09 04:03:16', '2024-06-09 04:03:16'),
(5, 'Blog', NULL, '2024-06-09 04:03:44', '2024-06-09 04:03:44'),
(6, 'Add Blog', 5, '2024-06-09 04:04:09', '2024-06-09 04:04:09'),
(7, 'Blog Comments', 5, '2024-06-09 04:04:59', '2024-06-09 04:04:59'),
(8, 'Pages', NULL, '2024-06-09 04:05:45', '2024-06-09 04:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `childcategory` int(11) DEFAULT NULL,
  `f_thumbnail` text DEFAULT NULL,
  `short_desc` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price1` varchar(255) DEFAULT NULL,
  `price2` varchar(255) DEFAULT NULL,
  `price3` varchar(255) DEFAULT NULL,
  `price4` varchar(255) DEFAULT NULL,
  `price5` varchar(255) DEFAULT NULL,
  `extra_desc` text DEFAULT NULL,
  `cost_price` double(12,3) DEFAULT NULL,
  `sale_price` double(12,3) DEFAULT NULL,
  `old_price` double(12,3) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_discount` int(11) DEFAULT NULL,
  `is_stock` int(11) DEFAULT NULL,
  `stock_status_id` int(11) DEFAULT NULL,
  `stock_qty` int(11) DEFAULT NULL,
  `u_stock_qty` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `variation_color` text DEFAULT NULL,
  `variation_size` text DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `is_publish` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `og_title` text DEFAULT NULL,
  `og_image` text DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `og_keywords` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `sku`, `category`, `subcategory_id`, `childcategory`, `f_thumbnail`, `short_desc`, `description`, `price1`, `price2`, `price3`, `price4`, `price5`, `extra_desc`, `cost_price`, `sale_price`, `old_price`, `start_date`, `end_date`, `is_discount`, `is_stock`, `stock_status_id`, `stock_qty`, `u_stock_qty`, `brand_id`, `price`, `store_id`, `variation_color`, `variation_size`, `tax_id`, `is_publish`, `user_id`, `og_title`, `og_image`, `og_description`, `og_keywords`, `created_at`, `updated_at`) VALUES
(76, 'testing', 'testing', 'sku001', '7', 1, 41, '10161.png', '<p>testing</p>', '<p>testing</p>', '10', '20', '30', '50', '70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 10, NULL, 4, NULL, NULL, 'negro,blanco,amarillo', 'Mediano', NULL, 1, NULL, 'testing', NULL, 'testing', 'testing', '2024-07-08 04:05:17', '2024-07-16 10:24:28'),
(77, 'testing', 'testing-BLACK', 'sku001-MEDIUM-BLACK', '7', 1, 41, 'sp216bl.png', 'testing', 'testing', '10', '20', '30', '50', '70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, -3, NULL, 4, NULL, NULL, 'negro,blanco,amarillo', 'Mediano', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-07-08 04:15:04', '2024-07-15 04:23:24'),
(78, 'testing', 'testing-WHITE', 'sku001-MEDIUM-WHITE', '7', 1, 41, '14110006002.png', '<p>testing</p>', '<p>testing</p>', '10', '20', '30', '50', '70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 4, NULL, NULL, 'negro,blanco,amarillo', 'Mediano', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-07-08 04:15:04', '2024-07-16 10:40:52'),
(79, 'testing', 'testing-YELLOW', 'sku001-MEDIUM-YELLOW', '7', 2, NULL, '10164.png', 'testing', 'testing', '10', '20', '30', '50', '70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, -14, NULL, 4, NULL, NULL, 'negro,blanco,amarillo', 'Mediano', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-07-08 04:15:04', '2024-07-15 04:42:02'),
(80, 'Lentes De Ciclismo Polarizados', 'Lentes-De-Ciclismo-Polarizados', 'sku002', '7', 2, 31, 'Lente sp216bk.png', '<p style=\"margin: 0cm 0cm 19.2pt; font-size: 12pt; font-family: \'Times New Roman\', serif;\"><span style=\"font-size: 11.5pt; font-family: Arial, sans-serif; color: #7a7a7a;\">Detalles del producto:</span></p>\r\n<p style=\"margin: 0cm 0cm 19.2pt; font-size: 12pt; font-family: \'Times New Roman\', serif;\"><span style=\"font-size: 11.5pt; font-family: Arial, sans-serif; color: #7a7a7a;\">Modelo: polarizadas<br>Peso: aprox. 29g<br>Material: Lente de PC + marco TR</span></p>', '<p style=\"margin: 0cm 0cm 19.2pt; font-size: 12pt; font-family: \'Times New Roman\', serif;\"><span style=\"font-size: 11.5pt; font-family: Arial, sans-serif; color: #7a7a7a;\">Modelo: polarizadas<br>Peso: aprox. 29g<br>Material: Lente de PC + marco TR</span></p>\r\n<p style=\"margin: 0cm 0cm 19.2pt; font-size: 12pt; font-family: \'Times New Roman\', serif;\"><span style=\"font-size: 11.5pt; font-family: Arial, sans-serif; color: #7a7a7a;\">Caracter&iacute;stica:</span></p>\r\n<ol style=\"margin-top: 0cm; margin-bottom: 19.2pt;\">\r\n<li style=\"margin: 0cm 0cm 19.2pt 0px; font-size: 12pt; font-family: \'Times New Roman\', serif;\"><span style=\"font-size: 11.5pt; font-family: Arial, sans-serif; color: #7a7a7a;\">Lente polarizada, filtra el resplandor<br>2. Protecci&oacute;n UV 400<br>3. Almohadillas nasales ajustables<br>4. Marco integrado para Miop&iacute;a<br>5. Ultraligero, suave y c&oacute;modo</span></li>\r\n</ol>', '194', '114', '94', '144', '164', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, -2, NULL, 4, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'glass', NULL, 'glass', 'glass', '2024-07-08 05:31:04', '2024-07-16 09:55:27'),
(81, 'testing 3', 'testing-3', 'sku003', '7', 2, NULL, '14110006003.png', 'testing 3', 'testing 3', '20', '40', '60', '88', '98', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 12, NULL, 4, NULL, NULL, 'blanco,naranja', 'Grande', NULL, 1, NULL, 'testing 3', NULL, 'testing 3', 'testing 3', '2024-07-08 07:02:46', '2024-07-10 08:46:55'),
(82, 'testing 3', 'testing-3-WHITE', 'sku003-LARGE-WHITE', '7', 2, NULL, '14130001002.png', 'testing 3', 'testing 3', '20', '40', '60', '88', '98', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, -63, NULL, 4, NULL, NULL, 'blanco,naranja', 'Grande', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-07-08 07:05:12', '2024-07-16 21:59:19'),
(83, 'testing 3', 'testing-3-ORANGE', 'sku003-LARGE-ORANGE', '7', 2, NULL, '14110006005.png', 'testing 3', 'testing 3', '20', '40', '60', '88', '98', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, -32, NULL, 4, NULL, NULL, 'blanco,naranja', 'Grande', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-07-08 07:05:12', '2024-07-16 21:59:19'),
(86, 'Lentes De Ciclismo SP216 Fotocromáticos Rockbros', 'Lentes-De-Ciclismo-SP216-Fotocromáticos-Rockbros', 'SP216BK', '7', 2, 31, 'Lente sp216bk.png', '<p><span data-sheets-root=\"1\">Uso: Unisex<br>Peso: aproximadamente 30g (sin embalaje)<br>Color: negro/azul<br>Material: PC + TR<br>Tama&ntilde;o: aproximadamente 13,5*12,5*5,5 cm</span></p>', '<p><span data-sheets-root=\"1\">1. Marco completo, vista panor&aacute;mica<br>2. Cambio de Color inteligente<br>3 UV400 protecci&oacute;n<br>4. PROTECCI&Oacute;N suave para las orejas<br>5. Almohadilla nasal ajustable<br>6. Ultraligero</span></p>', '200', '120', '90', '140', '160', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 16, NULL, 4, NULL, NULL, 'azul,negro', 'Mediano', NULL, 1, NULL, 'SP216BK', 'Lente sp216bk.png', '<p>Lentes De Ciclismo SP216 Fotocrom&aacute;ticos Rockbros</p>', 'Lentes De Ciclismo SP216 Fotocromáticos Rockbros', '2024-07-16 22:35:00', '2024-07-16 22:41:26'),
(87, 'Lentes De Ciclismo SP216 Fotocromáticos Rockbros', 'Lentes-De-Ciclismo-SP216-Fotocromáticos-Rockbros-AZUL', 'SP216BK-MEDIANO-AZUL', '7', 2, 31, 'Lente sp216bk.png', '<p><span data-sheets-root=\"1\">Uso: Unisex<br>Peso: aproximadamente 30g (sin embalaje)<br>Color: negro/azul<br>Material: PC + TR<br>Tama&ntilde;o: aproximadamente 13,5*12,5*5,5 cm</span></p>', '<p><span data-sheets-root=\"1\">1. Marco completo, vista panor&aacute;mica<br>2. Cambio de Color inteligente<br>3 UV400 protecci&oacute;n<br>4. PROTECCI&Oacute;N suave para las orejas<br>5. Almohadilla nasal ajustable<br>6. Ultraligero</span></p>', '200', '120', '90', '140', '160', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 16, NULL, 4, NULL, NULL, 'azul,negro', 'Mediano', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-07-16 22:40:20', '2024-07-16 22:40:20'),
(88, 'Lentes De Ciclismo SP216 Fotocromáticos Rockbros', 'Lentes-De-Ciclismo-SP216-Fotocromáticos-Rockbros-NEGRO', 'SP216BK-MEDIANO-NEGRO', '7', 2, 31, 'Lente sp216bk.png', '<p><span data-sheets-root=\"1\">Uso: Unisex<br>Peso: aproximadamente 30g (sin embalaje)<br>Color: negro/azul<br>Material: PC + TR<br>Tama&ntilde;o: aproximadamente 13,5*12,5*5,5 cm</span></p>', '<p><span data-sheets-root=\"1\">1. Marco completo, vista panor&aacute;mica<br>2. Cambio de Color inteligente<br>3 UV400 protecci&oacute;n<br>4. PROTECCI&Oacute;N suave para las orejas<br>5. Almohadilla nasal ajustable<br>6. Ultraligero</span></p>', '200', '120', '90', '140', '160', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 16, NULL, 4, NULL, NULL, 'azul,negro', 'Mediano', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2024-07-16 22:40:46', '2024-07-16 22:40:46'),
(89, 'ttttt', 'rrrr', NULL, '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, 'negro', 'Grande', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-07-17 00:56:26', '2024-07-17 00:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `rating` varchar(191) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `sku` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `product_id`, `size`, `color`, `sku`, `created_at`, `updated_at`) VALUES
(68, 76, 'medium', 'negro', 'sku001-MEDIUM-BLACK', '2024-07-08 04:15:04', '2024-07-08 04:15:04'),
(69, 76, 'medium', 'blanco', 'sku001-MEDIUM-WHITE', '2024-07-08 04:15:04', '2024-07-08 04:15:04'),
(70, 76, 'medium', 'amarillo', 'sku001-MEDIUM-YELLOW', '2024-07-08 04:15:04', '2024-07-08 04:15:04'),
(71, 81, 'large', 'blanco', 'sku003-LARGE-WHITE', '2024-07-08 07:05:12', '2024-07-08 07:05:12'),
(72, 81, 'large', 'naranja', 'sku003-LARGE-ORANGE', '2024-07-08 07:05:12', '2024-07-08 07:05:12'),
(77, 86, 'Mediano', 'azul', 'SP216BK-MEDIANO-AZUL', '2024-07-16 22:40:46', '2024-07-16 22:40:46'),
(78, 86, 'Mediano', 'negro', 'SP216BK-MEDIANO-NEGRO', '2024-07-16 22:40:46', '2024-07-16 22:40:46'),
(79, 89, 'Grande', 'negro', '-GRANDE-NEGRO', '2024-07-17 00:57:10', '2024-07-17 00:57:10');

-- --------------------------------------------------------

--
-- Table structure for table `pro_categories`
--

CREATE TABLE `pro_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `slug` varchar(191) NOT NULL,
  `thumbnail` text DEFAULT NULL,
  `subheader_image` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `layout` varchar(100) DEFAULT NULL,
  `lan` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_subheader` int(11) DEFAULT NULL,
  `is_publish` int(11) DEFAULT NULL,
  `og_title` text DEFAULT NULL,
  `og_image` text DEFAULT NULL,
  `og_description` text DEFAULT NULL,
  `og_keywords` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pro_categories`
--

INSERT INTO `pro_categories` (`id`, `name`, `slug`, `thumbnail`, `subheader_image`, `description`, `layout`, `lan`, `parent_id`, `is_subheader`, `is_publish`, `og_title`, `og_image`, `og_description`, `og_keywords`, `created_at`, `updated_at`) VALUES
(1, 'Vegetables', 'vegetables', '01072022115801-600x600-vegetables.png', NULL, '', NULL, 'en', NULL, 0, 1, 'Vegetables', '01072022115801-600x600-vegetables.png', 'Vegetables', 'Vegetables', '2022-07-01 00:28:35', '2022-07-01 00:28:35'),
(2, 'Fresh Fruit', 'fresh-fruit', '01072022120122-600x600-fruit.png', '01072022120122-600x600-fruit.png', '', NULL, 'en', NULL, 0, 1, 'Fresh Fruit', '01072022120122-600x600-fruit.png', 'Fresh Fruit', 'Fresh Fruit', '2022-07-01 00:32:00', '2022-07-01 00:32:00'),
(3, 'Nutt and Seeds', 'nutt-and-seeds', '01072022120255-600x600-nutt-and-seeds.png', '01072022120255-600x600-nutt-and-seeds.png', '', NULL, 'en', NULL, 0, 1, 'Nutt and Seeds', '01072022120255-600x600-nutt-and-seeds.png', 'Nutt and Seeds', 'Nutt and Seeds', '2022-07-01 00:33:12', '2022-07-01 00:35:30'),
(4, 'Bread and Bakery', 'bread-and-bakery', '01072022120359-600x600-bread-and-bakery.png', '01072022120359-600x600-bread-and-bakery.png', '', NULL, 'en', NULL, 0, 1, 'Bread and Bakery', '01072022120359-600x600-bread-and-bakery.png', 'Bread and Bakery', 'Bread and Bakery', '2022-07-01 00:34:14', '2022-07-01 00:35:10'),
(5, 'Juice', 'juice', '01072022120554-600x600-juice.png', '01072022120554-600x600-juice.png', '', NULL, 'en', NULL, 0, 1, 'Juice', '01072022120554-600x600-juice.png', 'Juice', 'Juice', '2022-07-01 00:36:15', '2022-07-01 00:36:15'),
(6, 'Fast food', 'fast-food', '01072022120657-600x600-fast-food.png', '01072022120657-600x600-fast-food.png', '', NULL, 'en', NULL, 0, 1, 'Fast food', '01072022120657-600x600-fast-food.png', 'Fast food', 'Fast food', '2022-07-01 00:37:10', '2022-07-01 00:37:10'),
(7, 'Milk and Dairy', 'milk-and-dairy', '01072022120745-600x600-milk-and-dairy.png', '01072022120745-600x600-milk-and-dairy.png', '', NULL, 'en', NULL, 0, 1, 'Milk and Dairy', '01072022120745-600x600-milk-and-dairy.png', 'Milk and Dairy', 'Milk and Dairy', '2022-07-01 00:38:03', '2022-07-01 00:38:03'),
(8, 'Fresh Meat', 'fresh-meat', '01072022120831-600x600-fresh-meat.png', '01072022120831-600x600-fresh-meat.png', '', NULL, 'en', NULL, 0, 1, 'Fresh Meat', '01072022120831-600x600-fresh-meat.png', 'Fresh Meat', 'Fresh Meat', '2022-07-01 00:38:45', '2022-07-01 00:38:45'),
(9, 'Fresh Seafood', 'fresh-seafood', '01072022120911-600x600-fresh-seafood.png', '01072022120911-600x600-fresh-seafood.png', '', NULL, 'en', NULL, 0, 1, 'Fresh Seafood', '01072022120911-600x600-fresh-seafood.png', 'Fresh Seafood', 'Fresh Seafood', '2022-07-01 00:39:30', '2022-07-01 00:39:30'),
(10, 'Dry Food', 'dry-food', '01072022121020-600x600-dry-food.png', '01072022121020-600x600-dry-food.png', '', NULL, 'en', NULL, 0, 1, 'Dry Food', '01072022121020-600x600-dry-food.png', 'Dry Food', 'Dry Food', '2022-07-01 00:40:35', '2022-07-01 00:40:35'),
(11, 'Coffee and Tea', 'coffee-and-tea', '01072022121100-600x600-coffee-and-tea.png', '01072022121100-600x600-coffee-and-tea.png', '', NULL, 'en', NULL, 0, 1, 'Coffee and Tea', '01072022121100-600x600-coffee-and-tea.png', 'Coffee and Tea', 'Coffee and Tea', '2022-07-01 00:41:13', '2022-12-09 02:10:39');

-- --------------------------------------------------------

--
-- Table structure for table `pro_images`
--

CREATE TABLE `pro_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `thumbnail` text DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `desc` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pro_images`
--

INSERT INTO `pro_images` (`id`, `product_id`, `thumbnail`, `color`, `desc`, `created_at`, `updated_at`) VALUES
(2, 76, 'product_images/sp216bl.png', 'black', NULL, '2024-07-08 04:15:04', '2024-07-08 04:15:04'),
(3, 76, 'product_images/14110006002.png', 'white', NULL, '2024-07-08 04:15:04', '2024-07-08 04:15:04'),
(4, 76, 'product_images/10164.png', 'yellow', NULL, '2024-07-08 04:15:04', '2024-07-08 04:15:04'),
(7, 81, 'product_images/14130001002.png', 'white', NULL, '2024-07-08 07:05:12', '2024-07-08 07:05:12'),
(8, 81, 'product_images/14110006005.png', 'orange', NULL, '2024-07-08 07:05:12', '2024-07-08 07:05:12'),
(10, 86, 'product_images/Lente sp216bk.png', 'm', NULL, '2024-07-16 22:39:27', '2024-07-16 22:39:27'),
(11, 86, 'product_images/Lente sp216bk.png', 'azul', NULL, '2024-07-16 22:40:20', '2024-07-16 22:40:20'),
(12, 86, 'product_images/Lente sp216bk.png', 'negro', NULL, '2024-07-16 22:40:46', '2024-07-16 22:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `related_products`
--

CREATE TABLE `related_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `related_item_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(2, 'Admin', 'web', '2024-04-05 06:43:40', '2024-04-05 06:43:40'),
(3, 'Backer', 'web', '2024-04-05 06:45:26', '2024-04-05 06:45:26'),
(4, 'Alex', 'web', '2024-06-09 07:53:25', '2024-06-09 07:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(5, 1),
(6, 1),
(8, 1),
(11, 1),
(12, 1),
(14, 1),
(15, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(20, 3),
(21, 1),
(21, 2),
(22, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 2),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(33, 2),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(43, 1),
(44, 1),
(47, 3),
(48, 1),
(50, 1);

-- --------------------------------------------------------

--
-- Table structure for table `screen_times`
--

CREATE TABLE `screen_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `url` varchar(191) NOT NULL,
  `time_spent` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `screen_times`
--

INSERT INTO `screen_times` (`id`, `user_id`, `product_id`, `url`, `time_spent`, `created_at`, `updated_at`) VALUES
(1, 33, 33, 'https://bikebros.net/product-details/Gafas-Deportivas-Ciclismo-Uv400', 33005, '2024-07-04 07:01:56', '2024-07-04 07:01:56'),
(2, 33, 33, 'https://bikebros.net/product-details/Gafas-Deportivas-Ciclismo-Uv400', 5383594, '2024-07-04 08:31:43', '2024-07-04 08:31:43'),
(3, 33, 41, 'https://bikebros.net/product-details/asd', 27540, '2024-07-04 08:33:47', '2024-07-04 08:33:47'),
(4, 33, 41, 'https://bikebros.net/product-details/asd', 46326, '2024-07-04 08:34:06', '2024-07-04 08:34:06'),
(5, 33, 41, 'https://bikebros.net/product-details/asd', 9492, '2024-07-04 08:34:18', '2024-07-04 08:34:18'),
(6, 33, 41, 'https://bikebros.net/product-details/asd', 2177, '2024-07-04 08:34:39', '2024-07-04 08:34:39'),
(7, 33, 41, 'https://bikebros.net/product-details/asd', 11245, '2024-07-04 08:34:53', '2024-07-04 08:34:53'),
(8, 32, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 24826, '2024-07-04 08:37:08', '2024-07-04 08:37:08'),
(9, 32, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 171056, '2024-07-04 08:40:02', '2024-07-04 08:40:02'),
(10, 33, 47, 'https://bikebros.net/product-details/Product-99', 15632, '2024-07-04 10:22:38', '2024-07-04 10:22:38'),
(11, 33, 47, 'https://bikebros.net/product-details/Product-99', 7013, '2024-07-04 10:22:47', '2024-07-04 10:22:47'),
(12, 32, 47, 'https://bikebros.net/product-details/Product-99', 8074, '2024-07-05 11:24:36', '2024-07-05 11:24:36'),
(13, 32, 47, 'https://bikebros.net/product-details/Product-99', 3312, '2024-07-05 11:25:31', '2024-07-05 11:25:31'),
(14, 32, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 3661, '2024-07-05 12:01:39', '2024-07-05 12:01:39'),
(15, 32, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 12193, '2024-07-05 12:01:53', '2024-07-05 12:01:53'),
(16, 32, 47, 'https://bikebros.net/product-details/Product-99', 9970, '2024-07-05 13:45:12', '2024-07-05 13:45:12'),
(17, 32, 47, 'https://bikebros.net/product-details/Product-99', 8207, '2024-07-05 13:45:23', '2024-07-05 13:45:23'),
(18, 32, 47, 'https://bikebros.net/product-details/Product-99', 9276, '2024-07-05 13:51:45', '2024-07-05 13:51:45'),
(19, 32, 47, 'https://bikebros.net/product-details/Product-99', 3726, '2024-07-05 13:51:51', '2024-07-05 13:51:51'),
(20, 39, 43, 'https://bikebros.net/product-details/asd-BLACK', 4649, '2024-07-05 18:13:37', '2024-07-05 18:13:37'),
(21, 39, 43, 'https://bikebros.net/product-details/asd-BLACK', 3496, '2024-07-05 18:13:41', '2024-07-05 18:13:41'),
(22, 39, 43, 'https://bikebros.net/product-details/asd-BLACK', 3518, '2024-07-05 18:13:46', '2024-07-05 18:13:46'),
(23, 39, 43, 'https://bikebros.net/product-details/asd-BLACK', 38301, '2024-07-05 18:14:25', '2024-07-05 18:14:25'),
(24, 39, 43, 'https://bikebros.net/product-details/asd-BLACK', 5317, '2024-07-05 18:14:31', '2024-07-05 18:14:31'),
(25, 39, 43, 'https://bikebros.net/product-details/asd-BLACK', 36010, '2024-07-05 18:15:08', '2024-07-05 18:15:08'),
(26, 39, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 3127, '2024-07-05 18:15:19', '2024-07-05 18:15:19'),
(27, 39, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 4043, '2024-07-05 18:15:24', '2024-07-05 18:15:24'),
(28, 39, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 2960, '2024-07-05 18:15:28', '2024-07-05 18:15:28'),
(29, 39, 33, 'https://bikebros.net/product-details/Gafas-Deportivas-Ciclismo-Uv400', 8501, '2024-07-05 18:20:48', '2024-07-05 18:20:48'),
(30, 39, 33, 'https://bikebros.net/product-details/Gafas-Deportivas-Ciclismo-Uv400', 3577, '2024-07-05 18:20:53', '2024-07-05 18:20:53'),
(31, 39, 33, 'https://bikebros.net/product-details/Gafas-Deportivas-Ciclismo-Uv400', 3783, '2024-07-05 18:20:57', '2024-07-05 18:20:57'),
(32, 33, 33, 'https://bikebros.net/product-details/Gafas-Deportivas-Ciclismo-Uv400', 2783622, '2024-07-05 20:14:39', '2024-07-05 20:14:39'),
(33, 32, 48, 'https://bikebros.net/product-details/Product-99-RED', 2233, '2024-07-06 07:07:13', '2024-07-06 07:07:13'),
(34, 32, 48, 'https://bikebros.net/product-details/Product-99-RED', 2004, '2024-07-06 07:08:58', '2024-07-06 07:08:58'),
(35, 32, 48, 'https://bikebros.net/product-details/Product-99-RED', 3557, '2024-07-06 07:21:04', '2024-07-06 07:21:04'),
(36, 32, 45, 'https://bikebros.net/product-details/Product-95', 13309, '2024-07-06 08:47:51', '2024-07-06 08:47:51'),
(37, 33, 33, 'https://bikebros.net/product-details/Gafas-Deportivas-Ciclismo-Uv400', 12508, '2024-07-07 06:33:14', '2024-07-07 06:33:14'),
(38, 33, 33, 'https://bikebros.net/product-details/Gafas-Deportivas-Ciclismo-Uv400', 4665, '2024-07-07 06:33:19', '2024-07-07 06:33:19'),
(39, 33, 47, 'https://bikebros.net/product-details/Product-99', 4335, '2024-07-07 06:52:13', '2024-07-07 06:52:13'),
(40, 33, 47, 'https://bikebros.net/product-details/Product-99', 5412, '2024-07-07 06:52:19', '2024-07-07 06:52:19'),
(41, 33, 45, 'https://bikebros.net/product-details/Product-95', 9019, '2024-07-07 06:54:46', '2024-07-07 06:54:46'),
(42, 33, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 5337, '2024-07-07 06:54:51', '2024-07-07 06:54:51'),
(43, 33, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 4870, '2024-07-07 06:54:57', '2024-07-07 06:54:57'),
(44, 33, 45, 'https://bikebros.net/product-details/Product-95', 24842, '2024-07-07 06:58:00', '2024-07-07 06:58:00'),
(45, 33, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 7225, '2024-07-07 06:58:07', '2024-07-07 06:58:07'),
(46, 33, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 7533, '2024-07-07 06:58:15', '2024-07-07 06:58:15'),
(47, 33, 45, 'https://bikebros.net/product-details/Product-95', 25147, '2024-07-07 07:05:46', '2024-07-07 07:05:46'),
(48, 33, 45, 'https://bikebros.net/product-details/Product-95', 3942, '2024-07-07 07:05:50', '2024-07-07 07:05:50'),
(49, 33, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 600112, '2024-07-07 07:25:44', '2024-07-07 07:25:44'),
(50, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo', 32751, '2024-07-07 07:26:24', '2024-07-07 07:26:24'),
(51, 33, 45, 'https://bikebros.net/product-details/Product-95', 4717, '2024-07-07 07:35:15', '2024-07-07 07:35:15'),
(52, 33, 45, 'https://bikebros.net/product-details/Product-95', 4877, '2024-07-07 07:35:21', '2024-07-07 07:35:21'),
(53, 33, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 4518, '2024-07-07 07:35:25', '2024-07-07 07:35:25'),
(54, 33, 46, 'https://bikebros.net/product-details/Product-95-BLACK', 3871, '2024-07-07 07:35:30', '2024-07-07 07:35:30'),
(55, 33, 44, 'https://bikebros.net/product-details/asd-YELLOW', 88238, '2024-07-07 07:48:02', '2024-07-07 07:48:02'),
(56, 32, 10, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10161-Fotocrom%C3%A1ticos-Rockbros', 14602, '2024-07-07 07:56:30', '2024-07-07 07:56:30'),
(57, 33, 49, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros', 3782, '2024-07-07 08:09:51', '2024-07-07 08:09:51'),
(58, 33, 51, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLACK', 9879, '2024-07-07 08:10:01', '2024-07-07 08:10:01'),
(59, 33, 51, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLACK', 5891, '2024-07-07 08:10:12', '2024-07-07 08:10:12'),
(60, 33, 49, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros', 4579, '2024-07-07 08:10:37', '2024-07-07 08:10:37'),
(61, 33, 50, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 4463, '2024-07-07 08:10:42', '2024-07-07 08:10:42'),
(62, 33, 50, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 3238, '2024-07-07 08:10:46', '2024-07-07 08:10:46'),
(63, 33, 47, 'https://bikebros.net/product-details/Product-99', 19862, '2024-07-07 08:13:47', '2024-07-07 08:13:47'),
(64, 33, 48, 'https://bikebros.net/product-details/Product-99-RED', 227678, '2024-07-07 08:17:46', '2024-07-07 08:17:46'),
(65, 33, 41, 'https://bikebros.net/product-details/asd', 11430, '2024-07-07 08:18:07', '2024-07-07 08:18:07'),
(66, 33, 41, 'https://bikebros.net/product-details/asd', 1710, '2024-07-07 08:18:10', '2024-07-07 08:18:10'),
(67, 33, 41, 'https://bikebros.net/product-details/asd', 133349, '2024-07-07 08:33:28', '2024-07-07 08:33:28'),
(68, 33, 41, 'https://bikebros.net/product-details/asd', 10173, '2024-07-07 08:39:54', '2024-07-07 08:39:54'),
(69, 33, 41, 'https://bikebros.net/product-details/asd', 2421, '2024-07-07 08:39:58', '2024-07-07 08:39:58'),
(70, 33, 43, 'https://bikebros.net/product-details/asd-BLACK', 5166, '2024-07-07 09:01:34', '2024-07-07 09:01:34'),
(71, 33, 44, 'https://bikebros.net/product-details/asd-YELLOW', 2597, '2024-07-07 09:04:48', '2024-07-07 09:04:48'),
(72, 33, 47, 'https://bikebros.net/product-details/Product-99', 4629, '2024-07-07 09:07:40', '2024-07-07 09:07:40'),
(73, 33, 48, 'https://bikebros.net/product-details/Product-99-RED', 8763, '2024-07-07 09:07:50', '2024-07-07 09:07:50'),
(74, 33, 41, 'https://bikebros.net/product-details/asd', 3261, '2024-07-07 09:08:12', '2024-07-07 09:08:12'),
(75, 33, 43, 'https://bikebros.net/product-details/asd-BLACK', 2331308, '2024-07-07 09:47:06', '2024-07-07 09:47:06'),
(76, 33, 41, 'https://bikebros.net/product-details/asd', 17502, '2024-07-07 10:29:54', '2024-07-07 10:29:54'),
(77, 33, 43, 'https://bikebros.net/product-details/asd-BLACK', 3511055, '2024-07-07 11:28:26', '2024-07-07 11:28:26'),
(78, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados-PINK', 5887, '2024-07-07 11:34:03', '2024-07-07 11:34:03'),
(79, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados-WHITE', 57567, '2024-07-07 11:35:02', '2024-07-07 11:35:02'),
(80, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados-PINK', 1083, '2024-07-07 11:35:05', '2024-07-07 11:35:05'),
(81, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados-WHITE', 2513, '2024-07-07 11:35:09', '2024-07-07 11:35:09'),
(82, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 100519, '2024-07-07 11:39:35', '2024-07-07 11:39:35'),
(83, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 2428, '2024-07-07 11:40:32', '2024-07-07 11:40:32'),
(84, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados-WHITE', 1457, '2024-07-07 11:40:35', '2024-07-07 11:40:35'),
(85, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados-PINK', 2918, '2024-07-07 11:40:39', '2024-07-07 11:40:39'),
(86, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-ORANGE', 6057, '2024-07-07 11:43:49', '2024-07-07 11:43:49'),
(87, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-BLACK', 1810, '2024-07-07 11:43:53', '2024-07-07 11:43:53'),
(88, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-ORANGE', 426403, '2024-07-07 11:51:01', '2024-07-07 11:51:01'),
(89, 33, 27, 'https://bikebros.net/product-details/GAFAS-DE-SOL-FOTOCR%C3%93MICAS-BROWN', 17624, '2024-07-07 11:51:36', '2024-07-07 11:51:36'),
(90, 33, 27, 'https://bikebros.net/product-details/GAFAS-DE-SOL-FOTOCR%C3%93MICAS-WHITE', 3107, '2024-07-07 11:57:27', '2024-07-07 11:57:27'),
(91, 33, 57, 'https://bikebros.net/product-details/GAFAS-DE-SOL-FOTOCR%C3%93MICAS-WHITE', 65808, '2024-07-07 12:00:02', '2024-07-07 12:00:02'),
(92, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 9593, '2024-07-07 12:01:51', '2024-07-07 12:01:51'),
(93, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados-PINK', 1576, '2024-07-07 12:01:54', '2024-07-07 12:01:54'),
(94, 33, 28, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados-WHITE', 3370, '2024-07-07 12:01:59', '2024-07-07 12:01:59'),
(95, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-ORANGE', 3908, '2024-07-07 12:10:57', '2024-07-07 12:10:57'),
(96, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo', 5793, '2024-07-07 12:11:11', '2024-07-07 12:11:11'),
(97, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-BLACK', 1743, '2024-07-07 12:11:14', '2024-07-07 12:11:14'),
(98, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-ORANGE', 2316, '2024-07-07 12:11:18', '2024-07-07 12:11:18'),
(99, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-BLACK', 232211, '2024-07-07 12:15:13', '2024-07-07 12:15:13'),
(100, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 4064, '2024-07-07 12:15:27', '2024-07-07 12:15:27'),
(101, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 7462, '2024-07-07 12:18:46', '2024-07-07 12:18:46'),
(102, 33, 59, 'https://bikebros.net/product-details/testing', 243169, '2024-07-07 12:22:58', '2024-07-07 12:22:58'),
(103, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 1179, '2024-07-07 12:23:00', '2024-07-07 12:23:00'),
(104, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 1126, '2024-07-07 12:23:03', '2024-07-07 12:23:03'),
(105, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 3519, '2024-07-07 12:23:33', '2024-07-07 12:23:33'),
(106, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 3538, '2024-07-07 12:24:04', '2024-07-07 12:24:04'),
(107, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 1055, '2024-07-07 12:24:07', '2024-07-07 12:24:07'),
(108, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 1465, '2024-07-07 12:24:10', '2024-07-07 12:24:10'),
(109, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 1467, '2024-07-07 12:24:13', '2024-07-07 12:24:13'),
(110, 33, 59, 'https://bikebros.net/product-details/testing', 4583, '2024-07-07 12:26:45', '2024-07-07 12:26:45'),
(111, 33, 59, 'https://bikebros.net/product-details/testing', 1383, '2024-07-07 12:26:48', '2024-07-07 12:26:48'),
(112, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 1947, '2024-07-07 12:26:52', '2024-07-07 12:26:52'),
(113, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 1515, '2024-07-07 12:26:55', '2024-07-07 12:26:55'),
(114, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 20993, '2024-07-07 12:27:17', '2024-07-07 12:27:17'),
(115, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-ORANGE', 3087, '2024-07-07 12:27:31', '2024-07-07 12:27:31'),
(116, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-BLACK', 1930, '2024-07-07 12:27:35', '2024-07-07 12:27:35'),
(117, 33, 32, 'https://bikebros.net/product-details/Lentes-De-Ciclismo', 118881, '2024-07-07 12:29:35', '2024-07-07 12:29:35'),
(118, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 4050, '2024-07-07 12:30:06', '2024-07-07 12:30:06'),
(119, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 2237, '2024-07-07 12:30:09', '2024-07-07 12:30:09'),
(120, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 1577, '2024-07-07 12:30:13', '2024-07-07 12:30:13'),
(121, 33, 59, 'https://bikebros.net/product-details/testing', 3979, '2024-07-07 12:30:25', '2024-07-07 12:30:25'),
(122, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 2141, '2024-07-07 12:30:29', '2024-07-07 12:30:29'),
(123, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 1327, '2024-07-07 12:30:32', '2024-07-07 12:30:32'),
(124, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 3482, '2024-07-07 12:30:37', '2024-07-07 12:30:37'),
(125, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 3781, '2024-07-07 12:30:43', '2024-07-07 12:30:43'),
(126, 33, 59, 'https://bikebros.net/product-details/testing', 4383, '2024-07-07 12:31:14', '2024-07-07 12:31:14'),
(127, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 1824, '2024-07-07 12:31:17', '2024-07-07 12:31:17'),
(128, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 2173, '2024-07-07 12:31:22', '2024-07-07 12:31:22'),
(129, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 1169, '2024-07-07 12:31:25', '2024-07-07 12:31:25'),
(130, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 2714, '2024-07-07 12:31:30', '2024-07-07 12:31:30'),
(131, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 10003, '2024-07-07 12:35:07', '2024-07-07 12:35:07'),
(132, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 5931, '2024-07-07 12:35:15', '2024-07-07 12:35:15'),
(133, 33, 59, 'https://bikebros.net/product-details/testing', 33723, '2024-07-07 12:40:39', '2024-07-07 12:40:39'),
(134, 33, 59, 'https://bikebros.net/product-details/testing', 6365, '2024-07-07 12:40:47', '2024-07-07 12:40:47'),
(135, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 7028, '2024-07-07 12:56:57', '2024-07-07 12:56:57'),
(136, 33, 59, 'https://bikebros.net/product-details/testing-PINK', 3826, '2024-07-07 12:58:01', '2024-07-07 12:58:01'),
(137, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 1953, '2024-07-07 12:58:05', '2024-07-07 12:58:05'),
(138, 33, 59, 'https://bikebros.net/product-details/testing', 1353, '2024-07-07 12:58:08', '2024-07-07 12:58:08'),
(139, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 2664, '2024-07-07 12:58:12', '2024-07-07 12:58:12'),
(140, 33, 59, 'https://bikebros.net/product-details/testing-GRAY', 6336, '2024-07-07 12:58:20', '2024-07-07 12:58:20'),
(141, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 2201, '2024-07-07 12:58:24', '2024-07-07 12:58:24'),
(142, 33, 59, 'https://bikebros.net/product-details/testing-PURPLE', 1680, '2024-07-07 12:58:28', '2024-07-07 12:58:28'),
(143, 33, 59, 'https://bikebros.net/product-details/testing', 3767, '2024-07-07 12:58:33', '2024-07-07 12:58:33'),
(144, 33, 59, 'https://bikebros.net/product-details/testing', 4207, '2024-07-07 12:58:40', '2024-07-07 12:58:40'),
(145, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 3066, '2024-07-07 15:29:08', '2024-07-07 15:29:08'),
(146, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLACK', 7711, '2024-07-07 15:29:16', '2024-07-07 15:29:16'),
(147, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 3625, '2024-07-07 15:29:20', '2024-07-07 15:29:20'),
(148, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 4714, '2024-07-07 15:29:25', '2024-07-07 15:29:25'),
(149, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLACK', 64939, '2024-07-07 15:30:30', '2024-07-07 15:30:30'),
(150, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLACK', 3116, '2024-07-07 15:30:34', '2024-07-07 15:30:34'),
(151, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 4420, '2024-07-07 15:30:39', '2024-07-07 15:30:39'),
(152, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 4217, '2024-07-07 15:36:56', '2024-07-07 15:36:56'),
(153, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 420096, '2024-07-07 15:37:39', '2024-07-07 15:37:39'),
(154, 33, 63, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros', 80007, '2024-07-07 15:38:25', '2024-07-07 15:38:25'),
(155, 33, 66, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 5308, '2024-07-07 15:44:19', '2024-07-07 15:44:19'),
(156, 33, 66, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 3138, '2024-07-07 15:44:22', '2024-07-07 15:44:22'),
(157, 33, 66, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLACK', 6838, '2024-07-07 15:44:29', '2024-07-07 15:44:29'),
(158, 33, 66, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-BLUE', 8758, '2024-07-07 15:44:38', '2024-07-07 15:44:38'),
(159, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros', 4998, '2024-07-07 16:08:16', '2024-07-07 16:08:16'),
(160, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros', 3649, '2024-07-07 16:08:21', '2024-07-07 16:08:21'),
(161, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-WHITE', 4080, '2024-07-07 16:08:25', '2024-07-07 16:08:25'),
(162, 33, 71, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-YELLOW', 57474, '2024-07-07 16:09:36', '2024-07-07 16:09:36'),
(163, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros', 24512, '2024-07-07 16:10:33', '2024-07-07 16:10:33'),
(164, 32, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-BLUE', 4156, '2024-07-07 16:10:46', '2024-07-07 16:10:46'),
(165, 32, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-WHITE', 1470, '2024-07-07 16:10:49', '2024-07-07 16:10:49'),
(166, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-BLUE', 7794, '2024-07-07 16:13:44', '2024-07-07 16:13:44'),
(167, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-WHITE', 3159, '2024-07-07 16:13:48', '2024-07-07 16:13:48'),
(168, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros', 3641, '2024-07-07 16:13:52', '2024-07-07 16:13:52'),
(169, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros', 4605, '2024-07-07 16:14:02', '2024-07-07 16:14:02'),
(170, 33, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-WHITE', 4249, '2024-07-07 16:14:10', '2024-07-07 16:14:10'),
(171, 32, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros', 266755, '2024-07-07 16:15:18', '2024-07-07 16:15:18'),
(172, 33, 71, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-YELLOW', 82855, '2024-07-07 16:15:39', '2024-07-07 16:15:39'),
(173, 33, 73, 'https://bikebros.net/product-details/new-product', 4105, '2024-07-07 16:21:36', '2024-07-07 16:21:36'),
(174, 33, 73, 'https://bikebros.net/product-details/new-product', 5814, '2024-07-07 16:21:42', '2024-07-07 16:21:42'),
(175, 32, 69, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-10164-Polarizados-Rockbros-WHITE', 367942, '2024-07-07 16:21:44', '2024-07-07 16:21:44'),
(176, 33, 73, 'https://bikebros.net/product-details/new-product-BLACK', 3302, '2024-07-07 16:21:46', '2024-07-07 16:21:46'),
(177, 33, 73, 'https://bikebros.net/product-details/new-product-BLUE', 3388, '2024-07-07 16:21:50', '2024-07-07 16:21:50'),
(178, 32, 73, 'https://bikebros.net/product-details/new-product-BLACK', 3215, '2024-07-07 16:22:11', '2024-07-07 16:22:11'),
(179, 32, 73, 'https://bikebros.net/product-details/new-product-BLACK', 1437, '2024-07-07 16:22:14', '2024-07-07 16:22:14'),
(180, 33, 73, 'https://bikebros.net/product-details/new-product', 24761, '2024-07-07 16:22:15', '2024-07-07 16:22:15'),
(181, 33, 73, 'https://bikebros.net/product-details/new-product', 20268, '2024-07-07 16:22:55', '2024-07-07 16:22:55'),
(182, 33, 73, 'https://bikebros.net/product-details/new-product-BLUE', 5682, '2024-07-07 16:23:11', '2024-07-07 16:23:11'),
(183, 33, 76, 'https://bikebros.net/product-details/testing', 12316, '2024-07-08 04:15:57', '2024-07-08 04:15:57'),
(184, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 8056, '2024-07-08 04:16:11', '2024-07-08 04:16:11'),
(185, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 1061, '2024-07-08 04:16:13', '2024-07-08 04:16:13'),
(186, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 1510, '2024-07-08 04:16:16', '2024-07-08 04:16:16'),
(187, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 54752, '2024-07-08 04:17:13', '2024-07-08 04:17:13'),
(188, 33, 76, 'https://bikebros.net/product-details/testing', 13128, '2024-07-08 04:25:57', '2024-07-08 04:25:57'),
(189, 33, 76, 'https://bikebros.net/product-details/testing', 3309, '2024-07-08 04:33:22', '2024-07-08 04:33:22'),
(190, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 1770, '2024-07-08 04:33:25', '2024-07-08 04:33:25'),
(191, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 1694, '2024-07-08 04:33:28', '2024-07-08 04:33:28'),
(192, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 35267, '2024-07-08 04:34:05', '2024-07-08 04:34:05'),
(193, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 8418, '2024-07-08 04:34:23', '2024-07-08 04:34:23'),
(194, 33, 76, 'https://bikebros.net/product-details/testing', 1079967, '2024-07-08 04:52:32', '2024-07-08 04:52:32'),
(195, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 6649, '2024-07-08 04:55:00', '2024-07-08 04:55:00'),
(196, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 5587, '2024-07-08 04:55:06', '2024-07-08 04:55:06'),
(197, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 3598, '2024-07-08 04:55:10', '2024-07-08 04:55:10'),
(198, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 4323, '2024-07-08 04:55:43', '2024-07-08 04:55:43'),
(199, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 3694, '2024-07-08 04:55:47', '2024-07-08 04:55:47'),
(200, 33, 76, 'https://bikebros.net/product-details/testing', 4596, '2024-07-08 04:56:00', '2024-07-08 04:56:00'),
(201, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 4134, '2024-07-08 04:56:04', '2024-07-08 04:56:04'),
(202, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 3877, '2024-07-08 04:56:09', '2024-07-08 04:56:09'),
(203, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 4597, '2024-07-08 04:56:14', '2024-07-08 04:56:14'),
(204, 33, 76, 'https://bikebros.net/product-details/testing', 14313, '2024-07-08 04:56:35', '2024-07-08 04:56:35'),
(205, 33, 76, 'https://bikebros.net/product-details/testing', 2655, '2024-07-08 05:24:15', '2024-07-08 05:24:15'),
(206, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 1950, '2024-07-08 05:24:18', '2024-07-08 05:24:18'),
(207, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 1942, '2024-07-08 05:24:22', '2024-07-08 05:24:22'),
(208, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 4985, '2024-07-08 05:24:28', '2024-07-08 05:24:28'),
(209, 33, 80, 'https://bikebros.net/product-details/glass', 14498, '2024-07-08 05:33:53', '2024-07-08 05:33:53'),
(210, 33, 76, 'https://bikebros.net/product-details/testing', 308251, '2024-07-08 05:39:30', '2024-07-08 05:39:30'),
(211, 33, 80, 'https://bikebros.net/product-details/glass', 5343, '2024-07-08 05:42:23', '2024-07-08 05:42:23'),
(212, 33, 76, 'https://bikebros.net/product-details/testing', 12408, '2024-07-08 05:42:40', '2024-07-08 05:42:40'),
(213, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 3596, '2024-07-08 05:42:45', '2024-07-08 05:42:45'),
(214, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 4142, '2024-07-08 05:42:51', '2024-07-08 05:42:51'),
(215, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 3646, '2024-07-08 05:46:48', '2024-07-08 05:46:48'),
(216, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 1347, '2024-07-08 05:46:50', '2024-07-08 05:46:50'),
(217, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 11365, '2024-07-08 05:47:03', '2024-07-08 05:47:03'),
(218, 33, 76, 'https://bikebros.net/product-details/testing', 2452, '2024-07-08 05:47:13', '2024-07-08 05:47:13'),
(219, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 2756, '2024-07-08 05:47:17', '2024-07-08 05:47:17'),
(220, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 1390, '2024-07-08 05:47:20', '2024-07-08 05:47:20'),
(221, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 662897, '2024-07-08 05:58:25', '2024-07-08 05:58:25'),
(222, 33, 80, 'https://bikebros.net/product-details/glass', 6248, '2024-07-08 05:58:40', '2024-07-08 05:58:40'),
(223, 33, 76, 'https://bikebros.net/product-details/testing', 14339, '2024-07-08 06:07:40', '2024-07-08 06:07:40'),
(224, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 18787, '2024-07-08 06:13:23', '2024-07-08 06:13:23'),
(225, 33, 80, 'https://bikebros.net/product-details/glass', 2853, '2024-07-08 06:33:37', '2024-07-08 06:33:37'),
(226, 33, 76, 'https://bikebros.net/product-details/testing', 4213, '2024-07-08 06:33:48', '2024-07-08 06:33:48'),
(227, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 2301, '2024-07-08 06:33:51', '2024-07-08 06:33:51'),
(228, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 1131, '2024-07-08 06:33:54', '2024-07-08 06:33:54'),
(229, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 2173, '2024-07-08 06:33:58', '2024-07-08 06:33:58'),
(230, 33, 76, 'https://bikebros.net/product-details/testing', 4811, '2024-07-08 06:35:19', '2024-07-08 06:35:19'),
(231, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 246769, '2024-07-08 06:39:28', '2024-07-08 06:39:28'),
(232, 33, 76, 'https://bikebros.net/product-details/testing', 9536, '2024-07-08 06:50:02', '2024-07-08 06:50:02'),
(233, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 649120, '2024-07-08 07:00:54', '2024-07-08 07:00:54'),
(234, 33, 80, 'https://bikebros.net/product-details/glass', 3016, '2024-07-08 07:01:22', '2024-07-08 07:01:22'),
(235, 33, 76, 'https://bikebros.net/product-details/testing', 3488, '2024-07-08 07:01:32', '2024-07-08 07:01:32'),
(236, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 1929, '2024-07-08 07:01:35', '2024-07-08 07:01:35'),
(237, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 1691, '2024-07-08 07:01:38', '2024-07-08 07:01:38'),
(238, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 5488, '2024-07-08 07:01:45', '2024-07-08 07:01:45'),
(239, 33, 81, 'https://bikebros.net/product-details/testing-3', 6208, '2024-07-08 07:06:09', '2024-07-08 07:06:09'),
(240, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 2359, '2024-07-08 07:06:12', '2024-07-08 07:06:12'),
(241, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 10620, '2024-07-08 07:06:25', '2024-07-08 07:06:25'),
(242, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3049, '2024-07-08 07:06:30', '2024-07-08 07:06:30'),
(243, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3023, '2024-07-08 07:06:35', '2024-07-08 07:06:35'),
(244, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3990, '2024-07-08 07:06:42', '2024-07-08 07:06:42'),
(245, 33, 76, 'https://bikebros.net/product-details/testing', 3203, '2024-07-08 07:06:54', '2024-07-08 07:06:54'),
(246, 33, 76, 'https://bikebros.net/product-details/testing', 3575, '2024-07-08 07:07:00', '2024-07-08 07:07:00'),
(247, 33, 80, 'https://bikebros.net/product-details/glass', 6420, '2024-07-08 07:07:13', '2024-07-08 07:07:13'),
(248, 33, 76, 'https://bikebros.net/product-details/testing', 16540, '2024-07-08 07:15:37', '2024-07-08 07:15:37'),
(249, 33, 76, 'https://bikebros.net/product-details/testing', 55676, '2024-07-08 07:32:06', '2024-07-08 07:32:06'),
(250, 33, 76, 'https://bikebros.net/product-details/testing', 12418, '2024-07-08 07:32:54', '2024-07-08 07:32:54'),
(251, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 174975, '2024-07-08 07:35:50', '2024-07-08 07:35:50'),
(252, 33, 81, 'https://bikebros.net/product-details/testing-3', 3866, '2024-07-08 07:58:09', '2024-07-08 07:58:09'),
(253, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3890, '2024-07-08 07:58:13', '2024-07-08 07:58:13'),
(254, 33, 80, 'https://bikebros.net/product-details/glass', 10180, '2024-07-08 07:58:45', '2024-07-08 07:58:45'),
(255, 33, 76, 'https://bikebros.net/product-details/testing', 17605, '2024-07-08 07:59:10', '2024-07-08 07:59:10'),
(256, 33, 76, 'https://bikebros.net/product-details/testing', 419884, '2024-07-08 08:06:16', '2024-07-08 08:06:16'),
(257, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 6957, '2024-07-08 08:06:24', '2024-07-08 08:06:24'),
(258, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 18104, '2024-07-08 08:08:03', '2024-07-08 08:08:03'),
(259, 33, 80, 'https://bikebros.net/product-details/glass', 2152, '2024-07-08 08:08:56', '2024-07-08 08:08:56'),
(260, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 3235, '2024-07-08 08:09:13', '2024-07-08 08:09:13'),
(261, 33, 80, 'https://bikebros.net/product-details/glass', 23445, '2024-07-08 08:09:26', '2024-07-08 08:09:26'),
(262, 33, 76, 'https://bikebros.net/product-details/testing', 3034, '2024-07-08 08:19:23', '2024-07-08 08:19:23'),
(263, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 4289, '2024-07-08 08:19:28', '2024-07-08 08:19:28'),
(264, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 2243, '2024-07-08 08:19:33', '2024-07-08 08:19:33'),
(265, 33, 81, 'https://bikebros.net/product-details/testing-3', 4421, '2024-07-08 08:21:10', '2024-07-08 08:21:10'),
(266, 33, 81, 'https://bikebros.net/product-details/testing-3', 3165, '2024-07-08 08:21:18', '2024-07-08 08:21:18'),
(267, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3100, '2024-07-08 08:21:21', '2024-07-08 08:21:21'),
(268, 33, 76, 'https://bikebros.net/product-details/testing', 6531, '2024-07-08 08:34:55', '2024-07-08 08:34:55'),
(269, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 4834, '2024-07-08 08:35:02', '2024-07-08 08:35:02'),
(270, 33, 76, 'https://bikebros.net/product-details/testing', 16148, '2024-07-08 08:35:58', '2024-07-08 08:35:58'),
(271, 33, 80, 'https://bikebros.net/product-details/glass', 2859, '2024-07-08 08:36:26', '2024-07-08 08:36:26'),
(272, 33, 81, 'https://bikebros.net/product-details/testing-3', 8067, '2024-07-08 08:48:17', '2024-07-08 08:48:17'),
(273, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 4725, '2024-07-08 08:48:23', '2024-07-08 08:48:23'),
(274, 33, 76, 'https://bikebros.net/product-details/testing', 7802, '2024-07-08 08:50:44', '2024-07-08 08:50:44'),
(275, 33, 76, 'https://bikebros.net/product-details/testing', 6864, '2024-07-08 09:16:26', '2024-07-08 09:16:26'),
(276, 33, 76, 'https://bikebros.net/product-details/testing', 28129, '2024-07-08 09:24:24', '2024-07-08 09:24:24'),
(277, 33, 80, 'https://bikebros.net/product-details/glass', 13030, '2024-07-08 10:57:18', '2024-07-08 10:57:18'),
(278, 33, 76, 'https://bikebros.net/product-details/testing', 8505, '2024-07-08 10:57:35', '2024-07-08 10:57:35'),
(279, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 7015, '2024-07-08 10:57:44', '2024-07-08 10:57:44'),
(280, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 309626, '2024-07-08 11:02:55', '2024-07-08 11:02:55'),
(281, 33, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 42717, '2024-07-08 11:12:21', '2024-07-08 11:12:21'),
(282, 40, 76, 'https://bikebros.net/product-details/testing', 3690, '2024-07-08 12:05:32', '2024-07-08 12:05:32'),
(283, 40, 76, 'https://bikebros.net/product-details/testing-BLACK', 7735, '2024-07-08 12:05:40', '2024-07-08 12:05:40'),
(284, 40, 76, 'https://bikebros.net/product-details/testing-YELLOW', 70918, '2024-07-08 12:07:49', '2024-07-08 12:07:49'),
(285, 40, 76, 'https://bikebros.net/product-details/testing-BLACK', 2710, '2024-07-08 12:07:53', '2024-07-08 12:07:53'),
(286, 40, 76, 'https://bikebros.net/product-details/testing-BLACK', 4854, '2024-07-08 12:07:58', '2024-07-08 12:07:58'),
(287, 40, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 6940, '2024-07-08 12:10:42', '2024-07-08 12:10:42'),
(288, 40, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 1682, '2024-07-08 12:10:44', '2024-07-08 12:10:44'),
(289, 33, 76, 'https://bikebros.net/product-details/testing', 3052, '2024-07-08 16:57:29', '2024-07-08 16:57:29'),
(290, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 3560, '2024-07-08 16:57:33', '2024-07-08 16:57:33'),
(291, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 3276, '2024-07-08 16:57:36', '2024-07-08 16:57:36'),
(292, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 37881, '2024-07-08 16:58:25', '2024-07-08 16:58:25'),
(293, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 2500, '2024-07-08 16:58:31', '2024-07-08 16:58:31'),
(294, 33, 76, 'https://bikebros.net/product-details/testing', 93294, '2024-07-08 17:01:53', '2024-07-08 17:01:53'),
(295, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 2998, '2024-07-08 17:01:57', '2024-07-08 17:01:57'),
(296, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 15178, '2024-07-08 17:02:12', '2024-07-08 17:02:12'),
(297, 33, 76, 'https://bikebros.net/product-details/testing', 3110, '2024-07-08 17:05:33', '2024-07-08 17:05:33'),
(298, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 2879, '2024-07-08 17:05:36', '2024-07-08 17:05:36'),
(299, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 2737, '2024-07-08 17:05:39', '2024-07-08 17:05:39'),
(300, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 3711, '2024-07-08 17:05:43', '2024-07-08 17:05:43'),
(301, 33, 81, 'https://bikebros.net/product-details/testing-3', 3784, '2024-07-08 17:05:51', '2024-07-08 17:05:51'),
(302, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3016, '2024-07-08 17:05:55', '2024-07-08 17:05:55'),
(303, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 4538, '2024-07-08 17:06:00', '2024-07-08 17:06:00'),
(304, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 9095, '2024-07-08 17:06:04', '2024-07-08 17:06:04'),
(305, 33, 81, 'https://bikebros.net/product-details/testing-3', 20463, '2024-07-08 17:06:54', '2024-07-08 17:06:54'),
(306, 40, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 32290, '2024-07-08 17:46:38', '2024-07-08 17:46:38'),
(307, 33, 76, 'https://bikebros.net/product-details/testing', 8573, '2024-07-09 01:36:26', '2024-07-09 01:36:26'),
(308, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 3866, '2024-07-09 01:36:30', '2024-07-09 01:36:30'),
(309, 33, 76, 'https://bikebros.net/product-details/testing', 617530, '2024-07-09 05:52:02', '2024-07-09 05:52:02'),
(310, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 8887, '2024-07-09 06:08:36', '2024-07-09 06:08:36'),
(311, 33, 76, 'https://bikebros.net/product-details/testing', 12104, '2024-07-09 06:36:09', '2024-07-09 06:36:09'),
(312, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 6366, '2024-07-09 06:41:36', '2024-07-09 06:41:36'),
(313, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 4424, '2024-07-09 06:41:42', '2024-07-09 06:41:42'),
(314, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 1480, '2024-07-09 06:41:45', '2024-07-09 06:41:45'),
(315, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 2191, '2024-07-09 06:41:49', '2024-07-09 06:41:49'),
(316, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 5211, '2024-07-09 06:41:56', '2024-07-09 06:41:56'),
(317, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 6399, '2024-07-09 06:42:04', '2024-07-09 06:42:04'),
(318, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 24575, '2024-07-09 06:45:15', '2024-07-09 06:45:15'),
(319, 33, 76, 'https://bikebros.net/product-details/testing', 9292, '2024-07-09 06:50:34', '2024-07-09 06:50:34'),
(320, 33, 76, 'https://bikebros.net/product-details/testing', 4974, '2024-07-09 06:58:03', '2024-07-09 06:58:03'),
(321, 33, 76, 'https://bikebros.net/product-details/testing', 20280, '2024-07-09 06:59:34', '2024-07-09 06:59:34'),
(322, 33, 76, 'https://bikebros.net/product-details/testing', 8568, '2024-07-09 07:45:59', '2024-07-09 07:45:59'),
(323, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 13354, '2024-07-09 08:03:38', '2024-07-09 08:03:38'),
(324, 33, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 6779, '2024-07-09 08:05:43', '2024-07-09 08:05:43'),
(325, 33, 81, 'https://bikebros.net/product-details/testing-3', 8425, '2024-07-09 08:06:01', '2024-07-09 08:06:01'),
(326, 33, 81, 'https://bikebros.net/product-details/testing-3', 4916, '2024-07-09 08:12:00', '2024-07-09 08:12:00'),
(327, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 6160, '2024-07-09 08:12:08', '2024-07-09 08:12:08'),
(328, 33, 76, 'https://bikebros.net/product-details/testing', 8115, '2024-07-09 08:12:24', '2024-07-09 08:12:24'),
(329, 33, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 4012, '2024-07-09 08:12:34', '2024-07-09 08:12:34'),
(330, 33, 81, 'https://bikebros.net/product-details/testing-3', 8216, '2024-07-09 08:17:59', '2024-07-09 08:17:59'),
(331, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 6188, '2024-07-09 08:18:06', '2024-07-09 08:18:06'),
(332, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 4578, '2024-07-09 08:18:12', '2024-07-09 08:18:12'),
(333, 33, 76, 'https://bikebros.net/product-details/testing', 10342, '2024-07-09 08:18:43', '2024-07-09 08:18:43'),
(334, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 5558, '2024-07-09 08:18:50', '2024-07-09 08:18:50'),
(335, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 4990, '2024-07-09 08:18:56', '2024-07-09 08:18:56'),
(336, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 957843, '2024-07-09 08:34:57', '2024-07-09 08:34:57'),
(337, 33, 81, 'https://bikebros.net/product-details/testing-3', 9612, '2024-07-09 20:46:27', '2024-07-09 20:46:27'),
(338, 33, 81, 'https://bikebros.net/product-details/testing-3', 5433, '2024-07-10 04:44:40', '2024-07-10 04:44:40'),
(339, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 4490, '2024-07-10 04:44:46', '2024-07-10 04:44:46'),
(340, 33, 76, 'https://bikebros.net/product-details/testing', 6181292, '2024-07-10 06:28:19', '2024-07-10 06:28:19'),
(341, 33, 81, 'https://bikebros.net/product-details/testing-3', 8039, '2024-07-10 06:28:40', '2024-07-10 06:28:40'),
(342, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 7425, '2024-07-10 06:28:49', '2024-07-10 06:28:49'),
(343, 33, 81, 'https://bikebros.net/product-details/testing-3', 5934, '2024-07-10 07:39:04', '2024-07-10 07:39:04'),
(344, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 4336, '2024-07-10 07:39:08', '2024-07-10 07:39:08'),
(345, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3553, '2024-07-10 07:39:12', '2024-07-10 07:39:12'),
(346, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3287, '2024-07-10 07:39:16', '2024-07-10 07:39:16'),
(347, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 4608, '2024-07-10 07:39:21', '2024-07-10 07:39:21'),
(348, 33, 76, 'https://bikebros.net/product-details/testing', 8249, '2024-07-10 07:39:42', '2024-07-10 07:39:42'),
(349, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 4960, '2024-07-10 07:39:47', '2024-07-10 07:39:47'),
(350, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 4102, '2024-07-10 07:39:52', '2024-07-10 07:39:52'),
(351, 44, 81, 'https://bikebros.net/product-details/testing-3', 5473, '2024-07-10 08:00:05', '2024-07-10 08:00:05'),
(352, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 8251, '2024-07-10 08:00:14', '2024-07-10 08:00:14'),
(353, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3197, '2024-07-10 08:00:17', '2024-07-10 08:00:17'),
(354, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 6120, '2024-07-10 08:00:24', '2024-07-10 08:00:24'),
(355, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 17705, '2024-07-10 08:00:43', '2024-07-10 08:00:43'),
(356, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 3655, '2024-07-10 08:00:53', '2024-07-10 08:00:53'),
(357, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 5570, '2024-07-10 08:00:59', '2024-07-10 08:00:59'),
(358, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 3894, '2024-07-10 08:01:03', '2024-07-10 08:01:03'),
(359, 44, 81, 'https://bikebros.net/product-details/testing-3', 6789, '2024-07-10 08:10:48', '2024-07-10 08:10:48'),
(360, 44, 81, 'https://bikebros.net/product-details/testing-3', 3535, '2024-07-10 08:10:52', '2024-07-10 08:10:52'),
(361, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3441, '2024-07-10 08:10:56', '2024-07-10 08:10:56'),
(362, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3241, '2024-07-10 08:10:59', '2024-07-10 08:10:59'),
(363, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 5615, '2024-07-10 08:11:05', '2024-07-10 08:11:05'),
(364, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 4161, '2024-07-10 08:11:10', '2024-07-10 08:11:10'),
(365, 44, 81, 'https://bikebros.net/product-details/testing-3', 6809, '2024-07-10 08:21:10', '2024-07-10 08:21:10'),
(366, 44, 81, 'https://bikebros.net/product-details/testing-3', 3330, '2024-07-10 08:21:14', '2024-07-10 08:21:14'),
(367, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 4806, '2024-07-10 08:21:19', '2024-07-10 08:21:19'),
(368, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3167, '2024-07-10 08:21:23', '2024-07-10 08:21:23'),
(369, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 5166, '2024-07-10 08:21:28', '2024-07-10 08:21:28'),
(370, 44, 81, 'https://bikebros.net/product-details/testing-3', 45471, '2024-07-10 08:27:04', '2024-07-10 08:27:04'),
(371, 44, 81, 'https://bikebros.net/product-details/testing-3', 6650, '2024-07-10 08:28:30', '2024-07-10 08:28:30'),
(372, 44, 81, 'https://bikebros.net/product-details/testing-3', 25499, '2024-07-10 08:28:57', '2024-07-10 08:28:57'),
(373, 44, 81, 'https://bikebros.net/product-details/testing-3', 100804, '2024-07-10 08:33:12', '2024-07-10 08:33:12'),
(374, 44, 81, 'https://bikebros.net/product-details/testing-3', 4493, '2024-07-10 08:41:50', '2024-07-10 08:41:50'),
(375, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 31631, '2024-07-10 08:42:22', '2024-07-10 08:42:22'),
(376, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 22566, '2024-07-10 08:42:45', '2024-07-10 08:42:45'),
(377, 44, 81, 'https://bikebros.net/product-details/testing-3', 24270, '2024-07-10 08:43:18', '2024-07-10 08:43:18'),
(378, 44, 76, 'https://bikebros.net/product-details/testing', 11892, '2024-07-10 08:43:43', '2024-07-10 08:43:43'),
(379, 44, 76, 'https://bikebros.net/product-details/testing-BLACK', 20729, '2024-07-10 08:44:04', '2024-07-10 08:44:04'),
(380, 44, 76, 'https://bikebros.net/product-details/testing-WHITE', 5284, '2024-07-10 08:44:10', '2024-07-10 08:44:10'),
(381, 44, 76, 'https://bikebros.net/product-details/testing-YELLOW', 5332, '2024-07-10 08:44:16', '2024-07-10 08:44:16'),
(382, 44, 76, 'https://bikebros.net/product-details/testing', 24111, '2024-07-10 08:44:49', '2024-07-10 08:44:49'),
(383, 44, 76, 'https://bikebros.net/product-details/testing-BLACK', 6359, '2024-07-10 08:44:56', '2024-07-10 08:44:56'),
(384, 44, 76, 'https://bikebros.net/product-details/testing-BLACK', 12422, '2024-07-10 08:45:09', '2024-07-10 08:45:09'),
(385, 44, 76, 'https://bikebros.net/product-details/testing-BLACK', 4367, '2024-07-10 08:45:14', '2024-07-10 08:45:14'),
(386, 44, 76, 'https://bikebros.net/product-details/testing-BLACK', 5785, '2024-07-10 08:45:20', '2024-07-10 08:45:20'),
(387, 44, 76, 'https://bikebros.net/product-details/testing', 6752, '2024-07-10 08:45:40', '2024-07-10 08:45:40'),
(388, 33, 81, 'https://bikebros.net/product-details/testing-3', 52943, '2024-07-10 09:45:19', '2024-07-10 09:45:19'),
(389, 33, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 7003, '2024-07-10 09:47:38', '2024-07-10 09:47:38'),
(390, 33, 81, 'https://bikebros.net/product-details/testing-3', 15993, '2024-07-10 09:48:02', '2024-07-10 09:48:02'),
(391, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 6207, '2024-07-10 09:48:10', '2024-07-10 09:48:10'),
(392, 33, 81, 'https://bikebros.net/product-details/testing-3', 10393, '2024-07-10 10:05:08', '2024-07-10 10:05:08'),
(393, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2642, '2024-07-10 10:05:12', '2024-07-10 10:05:12'),
(394, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 2340, '2024-07-10 10:05:16', '2024-07-10 10:05:16'),
(395, 33, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 3422, '2024-07-10 10:05:34', '2024-07-10 10:05:34'),
(396, 33, 81, 'https://bikebros.net/product-details/testing-3', 11163, '2024-07-10 10:07:48', '2024-07-10 10:07:48'),
(397, 33, 76, 'https://bikebros.net/product-details/testing', 2655, '2024-07-10 10:08:00', '2024-07-10 10:08:00'),
(398, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 1633, '2024-07-10 10:08:03', '2024-07-10 10:08:03'),
(399, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 6533, '2024-07-10 10:08:11', '2024-07-10 10:08:11'),
(400, 33, 81, 'https://bikebros.net/product-details/testing-3', 24494, '2024-07-10 11:41:00', '2024-07-10 11:41:00'),
(401, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 3967, '2024-07-10 11:41:05', '2024-07-10 11:41:05'),
(402, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 24383, '2024-07-10 11:41:31', '2024-07-10 11:41:31'),
(403, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 4896, '2024-07-10 11:41:38', '2024-07-10 11:41:38'),
(404, 33, 81, 'https://bikebros.net/product-details/testing-3', 21326, '2024-07-10 11:52:02', '2024-07-10 11:52:02'),
(405, 33, 81, 'https://bikebros.net/product-details/testing-3', 10270, '2024-07-10 11:52:15', '2024-07-10 11:52:15');
INSERT INTO `screen_times` (`id`, `user_id`, `product_id`, `url`, `time_spent`, `created_at`, `updated_at`) VALUES
(406, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3596, '2024-07-10 11:52:20', '2024-07-10 11:52:20'),
(407, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2688, '2024-07-10 11:52:25', '2024-07-10 11:52:25'),
(408, 33, 81, 'https://bikebros.net/product-details/testing-3', 16725, '2024-07-10 11:53:50', '2024-07-10 11:53:50'),
(409, 33, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 19427, '2024-07-10 11:55:34', '2024-07-10 11:55:34'),
(410, 33, 81, 'https://bikebros.net/product-details/testing-3', 5096, '2024-07-10 12:05:36', '2024-07-10 12:05:36'),
(411, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2599, '2024-07-10 12:05:40', '2024-07-10 12:05:40'),
(412, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 1884, '2024-07-10 12:05:44', '2024-07-10 12:05:44'),
(413, 33, 76, 'https://bikebros.net/product-details/testing', 8710, '2024-07-10 12:06:02', '2024-07-10 12:06:02'),
(414, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 16145, '2024-07-10 12:06:20', '2024-07-10 12:06:20'),
(415, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 1757, '2024-07-10 12:06:23', '2024-07-10 12:06:23'),
(416, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 15767, '2024-07-10 12:06:40', '2024-07-10 12:06:40'),
(417, 33, 81, 'https://bikebros.net/product-details/testing-3', 5347, '2024-07-10 12:09:06', '2024-07-10 12:09:06'),
(418, 33, 76, 'https://bikebros.net/product-details/testing', 13109, '2024-07-10 12:09:29', '2024-07-10 12:09:29'),
(419, 33, 81, 'https://bikebros.net/product-details/testing-3', 4028, '2024-07-10 12:14:00', '2024-07-10 12:14:00'),
(420, 33, 81, 'https://bikebros.net/product-details/testing-3', 2818, '2024-07-10 12:14:49', '2024-07-10 12:14:49'),
(421, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 1266, '2024-07-10 12:14:51', '2024-07-10 12:14:51'),
(422, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2266, '2024-07-10 12:14:55', '2024-07-10 12:14:55'),
(423, 33, 76, 'https://bikebros.net/product-details/testing', 6383, '2024-07-10 12:15:09', '2024-07-10 12:15:09'),
(424, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 2176, '2024-07-10 12:15:13', '2024-07-10 12:15:13'),
(425, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 69323, '2024-07-10 12:16:24', '2024-07-10 12:16:24'),
(426, 33, 76, 'https://bikebros.net/product-details/testing', 115178, '2024-07-10 12:18:26', '2024-07-10 12:18:26'),
(427, 33, 81, 'https://bikebros.net/product-details/testing-3', 3187, '2024-07-10 12:22:17', '2024-07-10 12:22:17'),
(428, 33, 76, 'https://bikebros.net/product-details/testing', 5894, '2024-07-10 12:28:00', '2024-07-10 12:28:00'),
(429, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 13053, '2024-07-10 12:28:14', '2024-07-10 12:28:14'),
(430, 33, 81, 'https://bikebros.net/product-details/testing-3', 1913, '2024-07-10 12:33:14', '2024-07-10 12:33:14'),
(431, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 18350, '2024-07-10 12:39:05', '2024-07-10 12:39:05'),
(432, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 2253, '2024-07-10 12:39:09', '2024-07-10 12:39:09'),
(433, 33, 81, 'https://bikebros.net/product-details/testing-3', 2149, '2024-07-10 12:40:03', '2024-07-10 12:40:03'),
(434, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2809, '2024-07-10 12:40:14', '2024-07-10 12:40:14'),
(435, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 52771, '2024-07-10 12:41:08', '2024-07-10 12:41:08'),
(436, 33, 81, 'https://bikebros.net/product-details/testing-3', 3696, '2024-07-10 12:41:38', '2024-07-10 12:41:38'),
(437, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 5239, '2024-07-10 12:41:45', '2024-07-10 12:41:45'),
(438, 33, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 3657, '2024-07-10 12:41:54', '2024-07-10 12:41:54'),
(439, 33, 76, 'https://bikebros.net/product-details/testing', 7565, '2024-07-10 12:42:11', '2024-07-10 12:42:11'),
(440, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 3416, '2024-07-10 12:42:15', '2024-07-10 12:42:15'),
(441, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 3156, '2024-07-10 12:42:20', '2024-07-10 12:42:20'),
(442, 44, 76, 'https://bikebros.net/product-details/testing', 11327, '2024-07-10 14:24:31', '2024-07-10 14:24:31'),
(443, 44, 76, 'https://bikebros.net/product-details/testing-WHITE', 5563, '2024-07-10 14:24:37', '2024-07-10 14:24:37'),
(444, 44, 76, 'https://bikebros.net/product-details/testing-BLACK', 6097, '2024-07-10 14:24:43', '2024-07-10 14:24:43'),
(445, 44, 76, 'https://bikebros.net/product-details/testing', 7096, '2024-07-10 14:24:56', '2024-07-10 14:24:56'),
(446, 44, 76, 'https://bikebros.net/product-details/testing', 80275, '2024-07-10 14:26:58', '2024-07-10 14:26:58'),
(447, 44, 76, 'https://bikebros.net/product-details/testing-WHITE', 41092, '2024-07-10 14:27:39', '2024-07-10 14:27:39'),
(448, 44, 76, 'https://bikebros.net/product-details/testing-WHITE', 7471, '2024-07-10 14:27:47', '2024-07-10 14:27:47'),
(449, 44, 76, 'https://bikebros.net/product-details/testing-WHITE', 3860, '2024-07-10 14:27:52', '2024-07-10 14:27:52'),
(450, 44, 76, 'https://bikebros.net/product-details/testing-YELLOW', 7197, '2024-07-10 14:28:00', '2024-07-10 14:28:00'),
(451, 44, 76, 'https://bikebros.net/product-details/testing-YELLOW', 5481, '2024-07-10 14:28:06', '2024-07-10 14:28:06'),
(452, 40, 81, 'https://bikebros.net/product-details/testing-3', 3467, '2024-07-10 17:40:45', '2024-07-10 17:40:45'),
(453, 40, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2176, '2024-07-10 17:40:47', '2024-07-10 17:40:47'),
(454, 40, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 1098, '2024-07-10 17:40:49', '2024-07-10 17:40:49'),
(455, 40, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2056, '2024-07-10 17:40:51', '2024-07-10 17:40:51'),
(456, 40, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 1007, '2024-07-10 17:40:52', '2024-07-10 17:40:52'),
(457, 40, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2424, '2024-07-10 17:40:55', '2024-07-10 17:40:55'),
(458, 40, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2109, '2024-07-10 17:40:57', '2024-07-10 17:40:57'),
(459, 44, 81, 'https://bikebros.net/product-details/testing-3', 5939, '2024-07-11 01:12:29', '2024-07-11 01:12:29'),
(460, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 4405, '2024-07-11 01:12:34', '2024-07-11 01:12:34'),
(461, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 5295, '2024-07-11 01:12:40', '2024-07-11 01:12:40'),
(462, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 59532, '2024-07-11 01:13:41', '2024-07-11 01:13:41'),
(463, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 5787, '2024-07-11 01:13:48', '2024-07-11 01:13:48'),
(464, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3746, '2024-07-11 01:13:52', '2024-07-11 01:13:52'),
(465, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 6961, '2024-07-11 05:02:05', '2024-07-11 05:02:05'),
(466, 33, 76, 'https://bikebros.net/product-details/testing', 5851, '2024-07-11 05:08:10', '2024-07-11 05:08:10'),
(467, 33, 76, 'https://bikebros.net/product-details/testing', 49884, '2024-07-11 05:08:55', '2024-07-11 05:08:55'),
(468, 33, 76, 'https://bikebros.net/product-details/testing', 2762, '2024-07-11 05:09:04', '2024-07-11 05:09:04'),
(469, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 3702, '2024-07-11 05:09:09', '2024-07-11 05:09:09'),
(470, 33, 76, 'https://bikebros.net/product-details/testing-WHITE', 2414, '2024-07-11 05:09:17', '2024-07-11 05:09:17'),
(471, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 2000, '2024-07-11 05:09:20', '2024-07-11 05:09:20'),
(472, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 2751, '2024-07-11 05:15:59', '2024-07-11 05:15:59'),
(473, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 22551, '2024-07-11 05:16:24', '2024-07-11 05:16:24'),
(474, 33, 76, 'https://bikebros.net/product-details/testing-YELLOW', 26845, '2024-07-11 05:16:53', '2024-07-11 05:16:53'),
(475, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 3582, '2024-07-11 05:16:58', '2024-07-11 05:16:58'),
(476, 33, 76, 'https://bikebros.net/product-details/testing-BLACK', 5717, '2024-07-11 05:58:46', '2024-07-11 05:58:46'),
(477, 34, 81, 'https://bikebros.net/product-details/testing-3', 19766, '2024-07-11 06:28:50', '2024-07-11 06:28:50'),
(478, 34, 81, 'https://bikebros.net/product-details/testing-3', 2447, '2024-07-11 06:28:55', '2024-07-11 06:28:55'),
(479, 34, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 5342, '2024-07-11 06:29:02', '2024-07-11 06:29:02'),
(480, 34, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 7373, '2024-07-11 06:29:11', '2024-07-11 06:29:11'),
(481, 34, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2663, '2024-07-11 06:29:17', '2024-07-11 06:29:17'),
(482, 34, 76, 'https://bikebros.net/product-details/testing', 14266, '2024-07-11 06:34:39', '2024-07-11 06:34:39'),
(483, 34, 76, 'https://bikebros.net/product-details/testing-BLACK', 12807, '2024-07-11 06:34:53', '2024-07-11 06:34:53'),
(484, 34, 76, 'https://bikebros.net/product-details/testing', 25076, '2024-07-11 06:43:52', '2024-07-11 06:43:52'),
(485, 34, 76, 'https://bikebros.net/product-details/testing', 2666, '2024-07-11 06:43:58', '2024-07-11 06:43:58'),
(486, 34, 76, 'https://bikebros.net/product-details/testing', 13639, '2024-07-11 06:46:06', '2024-07-11 06:46:06'),
(487, 34, 76, 'https://bikebros.net/product-details/testing', 6350, '2024-07-11 06:53:45', '2024-07-11 06:53:45'),
(488, 34, 76, 'https://bikebros.net/product-details/testing-WHITE', 1335, '2024-07-11 06:53:48', '2024-07-11 06:53:48'),
(489, 34, 76, 'https://bikebros.net/product-details/testing-WHITE', 1782, '2024-07-11 06:53:52', '2024-07-11 06:53:52'),
(490, 34, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 5581, '2024-07-11 06:59:47', '2024-07-11 06:59:47'),
(491, 34, 76, 'https://bikebros.net/product-details/testing', 16445, '2024-07-11 07:00:09', '2024-07-11 07:00:09'),
(492, 34, 76, 'https://bikebros.net/product-details/testing', 2212, '2024-07-11 07:00:14', '2024-07-11 07:00:14'),
(493, 34, 81, 'https://bikebros.net/product-details/testing-3', 1962, '2024-07-11 07:00:31', '2024-07-11 07:00:31'),
(494, 34, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 4426, '2024-07-11 07:00:37', '2024-07-11 07:00:37'),
(495, 34, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3582, '2024-07-11 07:00:43', '2024-07-11 07:00:43'),
(496, 33, 81, 'https://bikebros.net/product-details/testing-3', 2604, '2024-07-11 15:42:52', '2024-07-11 15:42:52'),
(497, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 4395, '2024-07-11 15:42:57', '2024-07-11 15:42:57'),
(498, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 34101, '2024-07-11 15:43:32', '2024-07-11 15:43:32'),
(499, 33, 81, 'https://bikebros.net/product-details/testing-3', 3205, '2024-07-11 15:43:49', '2024-07-11 15:43:49'),
(500, 44, 81, 'https://bikebros.net/product-details/testing-3', 4562, '2024-07-11 20:30:40', '2024-07-11 20:30:40'),
(501, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3896, '2024-07-11 20:30:45', '2024-07-11 20:30:45'),
(502, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2817, '2024-07-11 20:30:48', '2024-07-11 20:30:48'),
(503, 44, 76, 'https://bikebros.net/product-details/testing', 8160, '2024-07-11 20:31:32', '2024-07-11 20:31:32'),
(504, 44, 76, 'https://bikebros.net/product-details/testing', 2804, '2024-07-11 20:31:35', '2024-07-11 20:31:35'),
(505, 44, 76, 'https://bikebros.net/product-details/testing-YELLOW', 4978, '2024-07-11 20:31:40', '2024-07-11 20:31:40'),
(506, 44, 76, 'https://bikebros.net/product-details/testing-YELLOW', 3151, '2024-07-11 20:31:44', '2024-07-11 20:31:44'),
(507, 33, 76, 'https://bikebros.net/product-details/testing', 12334, '2024-07-13 15:04:53', '2024-07-13 15:04:53'),
(508, 33, 81, 'https://bikebros.net/product-details/testing-3', 2930, '2024-07-13 17:09:48', '2024-07-13 17:09:48'),
(509, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 5304, '2024-07-13 17:09:54', '2024-07-13 17:09:54'),
(510, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 5348, '2024-07-13 17:10:01', '2024-07-13 17:10:01'),
(511, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 9066, '2024-07-13 17:10:10', '2024-07-13 17:10:10'),
(512, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 4820, '2024-07-13 17:10:17', '2024-07-13 17:10:17'),
(513, 33, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 2498, '2024-07-13 17:10:20', '2024-07-13 17:10:20'),
(514, 40, 81, 'https://bikebros.net/product-details/testing-3', 3142, '2024-07-13 23:10:40', '2024-07-13 23:10:40'),
(515, 40, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2017, '2024-07-13 23:10:42', '2024-07-13 23:10:42'),
(516, 40, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 743, '2024-07-13 23:10:43', '2024-07-13 23:10:43'),
(517, 40, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 1191, '2024-07-13 23:10:45', '2024-07-13 23:10:45'),
(518, 40, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 1598, '2024-07-13 23:10:46', '2024-07-13 23:10:46'),
(519, 40, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 2194, '2024-07-13 23:15:09', '2024-07-13 23:15:09'),
(520, 40, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 2906, '2024-07-13 23:15:17', '2024-07-13 23:15:17'),
(521, 40, 81, 'https://bikebros.net/product-details/testing-3', 1960, '2024-07-13 23:15:28', '2024-07-13 23:15:28'),
(522, 40, 81, 'https://bikebros.net/product-details/testing-3', 2645, '2024-07-13 23:15:30', '2024-07-13 23:15:30'),
(523, 40, 81, 'https://bikebros.net/product-details/testing-3', 1892, '2024-07-13 23:17:36', '2024-07-13 23:17:36'),
(524, 40, 81, 'https://bikebros.net/product-details/testing-3', 1817, '2024-07-13 23:17:38', '2024-07-13 23:17:38'),
(525, 44, 81, 'https://bikebros.net/product-details/testing-3', 4205, '2024-07-13 23:41:10', '2024-07-13 23:41:10'),
(526, 44, 81, 'https://bikebros.net/product-details/testing-3', 5115, '2024-07-13 23:41:16', '2024-07-13 23:41:16'),
(527, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 9486, '2024-07-13 23:42:36', '2024-07-13 23:42:36'),
(528, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 10648, '2024-07-13 23:42:51', '2024-07-13 23:42:51'),
(529, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 9165, '2024-07-13 23:43:05', '2024-07-13 23:43:05'),
(530, 44, 76, 'https://bikebros.net/product-details/testing', 4425, '2024-07-13 23:43:18', '2024-07-13 23:43:18'),
(531, 44, 76, 'https://bikebros.net/product-details/testing-WHITE', 7307, '2024-07-13 23:43:26', '2024-07-13 23:43:26'),
(532, 44, 76, 'https://bikebros.net/product-details/testing-WHITE', 3563, '2024-07-13 23:43:31', '2024-07-13 23:43:31'),
(533, 44, 76, 'https://bikebros.net/product-details/testing-YELLOW', 6103, '2024-07-13 23:43:37', '2024-07-13 23:43:37'),
(534, 44, 76, 'https://bikebros.net/product-details/testing-YELLOW', 4391, '2024-07-13 23:43:42', '2024-07-13 23:43:42'),
(535, 44, 81, 'https://bikebros.net/product-details/testing-3', 4675, '2024-07-13 23:50:46', '2024-07-13 23:50:46'),
(536, 34, 81, 'https://bikebros.net/product-details/testing-3', 13695, '2024-07-14 03:28:02', '2024-07-14 03:28:02'),
(537, 34, 76, 'https://bikebros.net/product-details/testing', 19566, '2024-07-14 05:17:52', '2024-07-14 05:17:52'),
(538, 34, 81, 'https://bikebros.net/product-details/testing-3', 3908, '2024-07-14 05:43:00', '2024-07-14 05:43:00'),
(539, 34, 81, 'https://bikebros.net/product-details/testing-3', 3302, '2024-07-14 06:46:43', '2024-07-14 06:46:43'),
(540, 34, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2769, '2024-07-14 06:46:47', '2024-07-14 06:46:47'),
(541, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 5285, '2024-07-14 07:02:40', '2024-07-14 07:02:40'),
(542, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 5851, '2024-07-14 07:02:54', '2024-07-14 07:02:54'),
(543, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 4700, '2024-07-14 07:03:57', '2024-07-14 07:03:57'),
(544, 34, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 2030, '2024-07-14 07:08:01', '2024-07-14 07:08:01'),
(545, 34, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 3247, '2024-07-14 07:09:59', '2024-07-14 07:09:59'),
(546, 34, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 2728, '2024-07-14 07:10:10', '2024-07-14 07:10:10'),
(547, 44, 84, 'https://bikebros.net/product-details/PRUEBA', 4577, '2024-07-14 07:14:07', '2024-07-14 07:14:07'),
(548, 44, 84, 'https://bikebros.net/product-details/PRUEBA-VERDE', 7489, '2024-07-14 07:14:15', '2024-07-14 07:14:15'),
(549, 44, 81, 'https://bikebros.net/product-details/testing-3', 11765, '2024-07-14 07:18:55', '2024-07-14 07:18:55'),
(550, 44, 81, 'https://bikebros.net/product-details/testing-3', 4064, '2024-07-14 07:19:00', '2024-07-14 07:19:00'),
(551, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 8490, '2024-07-14 07:19:09', '2024-07-14 07:19:09'),
(552, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 7194, '2024-07-14 07:19:17', '2024-07-14 07:19:17'),
(553, 44, 81, 'https://bikebros.net/product-details/testing-3', 4375, '2024-07-14 07:20:41', '2024-07-14 07:20:41'),
(554, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 17066, '2024-07-14 07:20:58', '2024-07-14 07:20:58'),
(555, 44, 81, 'https://bikebros.net/product-details/testing-3', 3499, '2024-07-14 08:09:59', '2024-07-14 08:09:59'),
(556, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3647, '2024-07-14 08:10:04', '2024-07-14 08:10:04'),
(557, 44, 81, 'https://bikebros.net/product-details/testing-3-WHITE', 6904, '2024-07-14 08:10:11', '2024-07-14 08:10:11'),
(558, 34, 81, 'https://bikebros.net/product-details/testing-3', 13057, '2024-07-15 03:22:00', '2024-07-15 03:22:00'),
(559, 34, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 2366, '2024-07-15 04:06:02', '2024-07-15 04:06:02'),
(560, 34, 81, 'https://bikebros.net/product-details/testing-3', 4330, '2024-07-15 04:22:20', '2024-07-15 04:22:20'),
(561, 34, 81, 'https://bikebros.net/product-details/testing-3', 2752, '2024-07-15 04:22:26', '2024-07-15 04:22:26'),
(562, 34, 76, 'https://bikebros.net/product-details/testing', 8698, '2024-07-15 04:22:43', '2024-07-15 04:22:43'),
(563, 34, 76, 'https://bikebros.net/product-details/testing', 2477, '2024-07-15 04:22:48', '2024-07-15 04:22:48'),
(564, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 4180, '2024-07-15 04:41:30', '2024-07-15 04:41:30'),
(565, 44, 80, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-Polarizados', 4891, '2024-07-15 04:41:35', '2024-07-15 04:41:35'),
(566, 34, 84, 'https://bikebros.net/product-details/PRUEBA', 1835, '2024-07-15 09:04:12', '2024-07-15 09:04:12'),
(567, 44, 81, 'https://bikebros.net/product-details/testing-3', 5614, '2024-07-15 14:07:40', '2024-07-15 14:07:40'),
(568, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 6034, '2024-07-15 14:07:46', '2024-07-15 14:07:46'),
(569, 44, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3608, '2024-07-15 14:07:51', '2024-07-15 14:07:51'),
(570, 33, 81, 'https://bikebros.net/product-details/testing-3', 3091, '2024-07-16 15:23:02', '2024-07-16 15:23:02'),
(571, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 4789, '2024-07-16 15:23:08', '2024-07-16 15:23:08'),
(572, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 2967, '2024-07-16 15:23:14', '2024-07-16 15:23:14'),
(573, 33, 81, 'https://bikebros.net/product-details/testing-3', 11425, '2024-07-16 21:54:47', '2024-07-16 21:54:47'),
(574, 33, 81, 'https://bikebros.net/product-details/testing-3', 4506, '2024-07-16 21:54:53', '2024-07-16 21:54:53'),
(575, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 5164, '2024-07-16 21:54:59', '2024-07-16 21:54:59'),
(576, 33, 81, 'https://bikebros.net/product-details/testing-3-ORANGE', 3727, '2024-07-16 21:55:05', '2024-07-16 21:55:05'),
(577, 33, 76, 'https://bikebros.net/product-details/testing', 10880, '2024-07-16 21:56:34', '2024-07-16 21:56:34'),
(578, 40, 81, 'https://bikebros.net/product-details/testing-3', 2204, '2024-07-16 21:57:41', '2024-07-16 21:57:41'),
(579, 40, 84, 'https://bikebros.net/product-details/PRUEBA', 1714, '2024-07-16 21:58:27', '2024-07-16 21:58:27'),
(580, 40, 84, 'https://bikebros.net/product-details/PRUEBA', 2093, '2024-07-16 21:58:30', '2024-07-16 21:58:30'),
(581, 44, 76, 'https://bikebros.net/product-details/testing', 11771, '2024-07-16 22:45:43', '2024-07-16 22:45:43'),
(582, 44, 86, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros', 10889, '2024-07-16 22:46:02', '2024-07-16 22:46:02'),
(583, 44, 86, 'https://bikebros.net/product-details/Lentes-De-Ciclismo-SP216-Fotocrom%C3%A1ticos-Rockbros-NEGRO', 14220, '2024-07-16 22:46:17', '2024-07-16 22:46:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option_key` varchar(255) NOT NULL,
  `option_value` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `option_key`, `option_value`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'Hificliq', '2022-12-04 17:05:33', '2024-06-07 01:14:59'),
(2, 'app_email', 'Hificliq@gmail.com', '2022-12-04 17:05:33', '2024-06-07 01:14:59'),
(3, 'app_contact_number', 'Hificliq', '2022-12-04 17:05:33', '2024-06-07 01:14:59'),
(4, 'app_location', 'Hificliq', '2022-12-04 17:05:33', '2024-06-07 01:14:59'),
(5, 'app_date_format', 'm/d/Y', '2022-12-04 17:05:33', '2024-06-07 00:15:44'),
(6, 'app_timezone', 'Asia/Dhaka', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(7, 'allow_preloader', '0', '2022-12-04 17:05:33', '2024-06-06 23:23:32'),
(8, 'app_preloader', 'uploads/setting/1717742970-jyzsykgBV3.png', '2022-12-04 17:05:33', '2024-06-07 01:19:30'),
(9, 'app_logo', 'uploads/setting/1717742970-HjdnDNi1ux.png', '2022-12-04 17:05:33', '2024-06-07 01:19:30'),
(10, 'app_fav_icon', 'uploads/setting/1709795797-Ip3rdM3rFE.png', '2022-12-04 17:05:33', '2024-03-07 01:46:37'),
(11, 'app_copyright', 'Hificliq', '2022-12-04 17:05:33', '2024-06-07 01:14:59'),
(12, 'app_developed', 'Hificliq', '2022-12-04 17:05:33', '2024-06-07 01:14:59'),
(13, 'og_title', 'LMSZAI - Learning Management System', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(14, 'og_description', 'Learning Management System', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(15, 'zoom_status', '1', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(16, 'bbb_status', '1', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(17, 'jitsi_status', '1', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(18, 'jitsi_server_base_url', 'https://meet.jit.si/', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(19, 'registration_email_verification', '0', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(20, 'footer_quote', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(21, 'paystack_currency', 'AFA', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(22, 'paystack_conversion_rate', '1', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(23, 'paystack_status', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(24, 'PAYSTACK_PUBLIC_KEY', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(25, 'PAYSTACK_SECRET_KEY', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(26, 'paypal_currency', 'AFA', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(27, 'paypal_conversion_rate', '1', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(28, 'paypal_status', '1', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(29, 'PAYPAL_MODE', 'sandbox', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(30, 'PAYPAL_CLIENT_ID', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(31, 'PAYPAL_SECRET', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(32, 'stripe_currency', 'AFA', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(33, 'stripe_conversion_rate', '1', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(34, 'stripe_status', '1', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(35, 'STRIPE_MODE', 'sandbox', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(36, 'STRIPE_SECRET_KEY', '', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(37, 'STRIPE_PUBLIC_KEY', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(38, 'razorpay_currency', 'AFA', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(39, 'razorpay_conversion_rate', '1', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(40, 'razorpay_status', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(41, 'RAZORPAY_KEY', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(42, 'RAZORPAY_SECRET', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(43, 'mollie_currency', 'AFA', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(44, 'mollie_conversion_rate', '1', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(45, 'mollie_status', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(46, 'MOLLIE_KEY', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(47, 'im_currency', 'AFA', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(48, 'im_conversion_rate', '1', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(49, 'im_status', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(50, 'IM_API_KEY', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(51, 'IM_AUTH_TOKEN', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(52, 'IM_URL', 'https://test.instamojo.com/api/1.1/payment-requests/', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(53, 'sslcommerz_currency', 'AFA', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(54, 'sslcommerz_conversion_rate', '1', '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(55, 'sslcommerz_status', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(56, 'sslcommerz_mode', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(57, 'SSLCZ_STORE_ID', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(58, 'SSLCZ_STORE_PASSWD', NULL, '2022-12-04 17:05:33', '2024-06-07 06:34:59'),
(59, 'MAIL_DRIVER', 'smtp', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(60, 'MAIL_HOST', 'smtp.hostinger.com', '2022-12-04 17:05:33', '2024-06-07 06:29:46'),
(61, 'MAIL_PORT', '465', '2022-12-04 17:05:33', '2024-06-07 06:29:46'),
(62, 'MAIL_USERNAME', 'info@acelera.biz', '2022-12-04 17:05:33', '2024-06-07 06:29:46'),
(63, 'MAIL_PASSWORD', 'Acelera@3sss', '2022-12-04 17:05:33', '2024-06-07 06:29:46'),
(64, 'MAIL_ENCRYPTION', 'tls', '2022-12-04 17:05:33', '2024-06-07 06:29:46'),
(65, 'MAIL_FROM_ADDRESS', 'info@acelera.biz', '2022-12-04 17:05:33', '2024-06-07 06:29:46'),
(66, 'MAIL_FROM_NAME', 'ACELERA', '2022-12-04 17:05:33', '2024-06-07 06:29:46'),
(67, 'MAIL_MAILER', 'SMTP', '2022-12-04 17:05:33', '2024-06-07 06:29:46'),
(68, 'update', 'Update', '2022-12-04 17:05:33', '2024-03-07 06:41:34'),
(69, 'sign_up_left_text', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(70, 'sign_up_left_image', 'uploads_demo/home/hero-img.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(71, 'forgot_title', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(72, 'forgot_subtitle', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(73, 'forgot_btn_name', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(74, 'facebook_url', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(75, 'twitter_url', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(76, 'linkedin_url', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(77, 'pinterest_url', NULL, '2022-12-04 17:05:33', '2024-06-07 01:01:03'),
(78, 'app_instructor_footer_title', 'Join One Of The World’s Largest Learning Marketplaces.', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(79, 'app_instructor_footer_subtitle', 'Donald valley teems with vapour around me, and the meridian sun strikes the upper surface of the impenetrable foliage of my tree', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(80, 'get_in_touch_title', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(81, 'send_us_msg_title', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(82, 'contact_us_location', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(83, 'contact_us_email_one', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(84, 'contact_us_email_two', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(85, 'contact_us_phone_one', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(86, 'contact_us_phone_two', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(87, 'contact_us_map_link', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(88, 'contact_us_description', NULL, '2022-12-04 17:05:33', '2024-06-07 08:01:53'),
(89, 'faq_title', 'Frequently Ask Questions.', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(90, 'faq_subtitle', 'CHOOSE FROM 5,000 ONLINE VIDEO COURSES WITH NEW ADDITIONS', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(91, 'faq_image_title', 'Still no luck?', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(92, 'faq_image', 'uploads_demo/setting\\faq-img.jpg', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(93, 'faq_tab_first_title', 'Item Support', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(94, 'faq_tab_first_subtitle', 'Ranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that was a greater artist than now. When, while the lovely valley with vapour around me, and the meridian', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(95, 'faq_tab_sec_title', 'Licensing', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(96, 'faq_tab_sec_subtitle', 'Ranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that was a greater artist than now. When, while the lovely valley with vapour around me, and the meridian', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(97, 'faq_tab_third_title', 'Your Account', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(98, 'faq_tab_third_subtitle', 'Ranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that was a greater artist than now. When, while the lovely valley with vapour around me, and the meridian', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(99, 'faq_tab_four_title', 'Tax & Complications', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(100, 'faq_tab_four_subtitle', 'Ranquil existence, that I neglect my talents. I should be incapable of drawing a single stroke at the present moment; and yet I feel that was a greater artist than now. When, while the lovely valley with vapour around me, and the meridian', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(101, 'home_special_feature_first_logo', 'uploads_demo/setting\\feature-icon1.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(102, 'home_special_feature_first_title', 'Learn From Experts', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(103, 'home_special_feature_first_subtitle', 'Mornings of spring which I enjoy with my whole heart about the gen', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(104, 'home_special_feature_second_logo', 'uploads_demo/setting/feature-icon2.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(105, 'home_special_feature_second_title', 'Earn a Certificate', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(106, 'home_special_feature_second_subtitle', 'Mornings of spring which I enjoy with my whole heart about the gen', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(107, 'home_special_feature_third_logo', 'uploads_demo/setting\\feature-icon3.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(108, 'home_special_feature_third_title', '5000+ Courses', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(109, 'home_special_feature_third_subtitle', 'Serenity has taken possession of my entire soul, like these sweet spring', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(110, 'course_logo', 'uploads_demo/setting/courses-heading-img.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(111, 'course_title', 'A Broad Selection Of Courses', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(112, 'course_subtitle', 'CHOOSE FROM 5,000 ONLINE VIDEO COURSES WITH NEW ADDITIONS', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(113, 'bundle_course_logo', 'uploads_demo/setting/bundle-courses-heading-img.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(114, 'bundle_course_title', 'Latest Bundle Courses', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(115, 'bundle_course_subtitle', 'CHOOSE FROM 5,000 ONLINE VIDEO COURSES WITH NEW ADDITIONS', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(116, 'top_category_logo', 'uploads_demo/setting/categories-heading-img.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(117, 'top_category_title', 'Our Top Categories', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(118, 'top_category_subtitle', 'CHOOSE FROM 5,000 ONLINE VIDEO COURSES WITH NEW ADDITIONS', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(119, 'top_instructor_logo', 'uploads_demo/setting\\top-instructor-heading-img.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(120, 'top_instructor_title', 'Top Rated Courses From Our Top Instructor.', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(121, 'top_instructor_subtitle', 'CHOOSE FROM 5,000 ONLINE VIDEO COURSES WITH NEW ADDITIONS', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(122, 'become_instructor_video', 'uploads_demo/setting/test.mp4', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(123, 'become_instructor_video_preview_image', 'uploads_demo/setting/video-poster.jpg', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(124, 'become_instructor_video_logo', 'uploads_demo/setting/top-instructor-heading-img.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(125, 'become_instructor_video_title', 'We Only Accept Professional Courses Form Professional Instructors', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(126, 'become_instructor_video_subtitle', 'Noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(127, 'customer_say_logo', 'uploads_demo/setting/customers-say-heading-img.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(128, 'customer_say_title', 'What Our Valuable Customers Say.', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(129, 'customer_say_first_name', 'DANIEL JHON', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(130, 'customer_say_first_position', 'UI/UX DESIGNER', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(131, 'customer_say_first_comment_title', 'Great instructor, great course', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(132, 'customer_say_first_comment_description', 'Wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(133, 'customer_say_first_comment_rating_star', '5', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(134, 'customer_say_second_name', 'NORTH', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(135, 'customer_say_second_position', 'DEVELOPER', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(136, 'customer_say_second_comment_title', 'Awesome course & good response', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(137, 'customer_say_second_comment_description', 'Noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(138, 'customer_say_second_comment_rating_star', '4.5', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(139, 'customer_say_third_name', 'HIBRUPATH', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(140, 'customer_say_third_position', 'MARKETER', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(141, 'customer_say_third_comment_title', 'Fantastic course', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(142, 'customer_say_third_comment_description', 'Noticed by me: when I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(143, 'customer_say_third_comment_rating_star', '5', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(144, 'achievement_first_logo', 'uploads_demo/setting\\1.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(145, 'achievement_first_title', 'Successfully trained', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(146, 'achievement_first_subtitle', '2000+ students', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(147, 'achievement_second_logo', 'uploads_demo/setting\\2.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(148, 'achievement_second_title', 'Video courses', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(149, 'achievement_second_subtitle', '2000+ students', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(150, 'achievement_third_logo', 'uploads_demo/setting\\3.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(151, 'achievement_third_title', 'Expert instructor', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(152, 'achievement_third_subtitle', '2000+ students', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(153, 'achievement_four_logo', 'uploads_demo/setting\\4.png', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(154, 'achievement_four_title', 'Proudly Received', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(155, 'achievement_four_title', 'Proudly Received', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(156, 'achievement_four_subtitle', '2000+ students', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(157, 'support_faq_title', 'tresting', '2022-12-04 17:05:33', '2024-06-07 07:19:14'),
(158, 'support_faq_subtitle', 'tresting', '2022-12-04 17:05:33', '2024-06-07 07:19:14'),
(159, 'ticket_title', 'tresting', '2022-12-04 17:05:33', '2024-06-07 07:19:14'),
(160, 'ticket_subtitle', 'tresting', '2022-12-04 17:05:33', '2024-06-07 07:19:14'),
(161, 'cookie_button_name', 'Allow cookies', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(162, 'cookie_msg', 'Your experience on this site will be improved by allowing cookies', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(163, 'COOKIE_CONSENT_STATUS', '1', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(164, 'platform_charge', '5', '2022-12-04 17:05:33', '2024-06-06 23:23:32'),
(165, 'sell_commission', '3', '2022-12-04 17:05:33', '2024-06-06 23:23:32'),
(166, 'app_version', '21', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(167, 'current_version', '6.1', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(262, 'currency_id', '1', '2024-03-07 01:46:36', '2024-03-07 01:46:36'),
(263, 'FORCE_HTTPS', 'false', '2024-03-07 01:46:36', '2024-03-07 01:46:36'),
(264, 'language_id', NULL, '2024-03-07 01:46:36', '2024-06-06 23:51:53'),
(265, 'TIMEZONE', 'UTC', '2024-03-07 01:46:36', '2024-03-07 01:46:36'),
(266, 'pwa_enable', '0', '2024-03-07 01:46:36', '2024-03-07 01:46:36'),
(267, 'instagram_url', NULL, '2024-03-07 01:46:36', '2024-06-07 01:01:03'),
(268, 'tiktok_url', NULL, '2024-03-07 01:46:36', '2024-06-07 01:01:03'),
(269, 'app_black_logo', 'uploads/setting/1709795797-IxH4v3cwdf.png', '2024-03-07 01:46:37', '2024-03-07 01:46:37'),
(270, 'app_pwa_icon', NULL, '2024-03-07 01:46:37', '2024-03-07 01:46:37'),
(271, 'theme', '1', '2024-03-07 06:41:34', '2024-03-07 06:43:45'),
(272, 'mercado_currency', 'AFA', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(273, 'mercado_conversion_rate', '1', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(274, 'mercado_status', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(275, 'MERCADO_PAGO_CLIENT_ID', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(276, 'MERCADO_PAGO_CLIENT_SECRET', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(277, 'flutterwave_currency', 'AFA', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(278, 'flutterwave_conversion_rate', '1', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(279, 'flutterwave_status', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(280, 'FLW_PUBLIC_KEY', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(281, 'FLW_SECRET_KEY', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(282, 'FLW_SECRET_HASH', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(283, 'coinbase_currency', 'AFA', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(284, 'coinbase_conversion_rate', '1', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(285, 'coinbase_status', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(286, 'coinbase_mode', 'sandbox', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(287, 'coinbase_key', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(288, 'zitopay_currency', 'AFA', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(289, 'zitopay_conversion_rate', '1', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(290, 'zitopay_status', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(291, 'zitopay_username', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(292, 'iyzipay_currency', 'AFA', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(293, 'iyzipay_conversion_rate', '1', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(294, 'iyzipay_status', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(295, 'iyzipay_mode', 'sandbox', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(296, 'iyzipay_key', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(297, 'iyzipay_secret', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(298, 'bitpay_currency', 'AFA', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(299, 'bitpay_conversion_rate', '1', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(300, 'bitpay_status', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(301, 'bitpay_mode', 'testnet', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(302, 'bitpay_key', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(303, 'braintree_currency', 'AFA', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(304, 'braintree_conversion_rate', '1', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(305, 'braintree_status', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(306, 'braintree_test_mode', '0', '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(307, 'braintree_merchant_id', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(308, 'braintree_public_key', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59'),
(309, 'braintree_private_key', NULL, '2024-06-07 06:34:59', '2024-06-07 06:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dhaka', NULL, NULL),
(2, 1, 'Khulna', NULL, NULL),
(3, 1, 'Comilla', NULL, NULL),
(4, 2, 'California', NULL, NULL),
(5, 2, 'Texas', NULL, NULL),
(6, 2, 'Florida', NULL, NULL),
(7, 3, 'Argyll', NULL, NULL),
(8, 3, 'Belfast', NULL, NULL),
(9, 3, 'Cambridge', NULL, NULL),
(11, 1, 'Khulna', '2024-06-07 05:59:39', '2024-06-07 06:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `og_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `uuid`, `parent_category_id`, `category_id`, `name`, `slug`, `meta_title`, `meta_description`, `meta_keywords`, `og_image`, `created_at`, `updated_at`) VALUES
(1, 'f9ec5844-335b-4b4e-b47e-cdfcec086803', 7, 0, 'Llanta', 'Llanta', 'Llanta', 'Llanta', 'Llanta', 'uploads/meta/1721181135-1ocai5Zwwr.svg', '2024-06-25 01:50:30', '2024-07-17 01:52:15'),
(2, 'f76206e5-8d59-4cd7-bb29-1e3e022fda6a', 7, 0, 'Accesorios', 'Accesorios', 'Accesorios', 'Accesorios', 'Accesorios', 'uploads/meta/1721181017-wDnXZ9y8Fm.svg', '2024-06-25 01:51:19', '2024-07-17 01:50:17'),
(3, 'e0fb190e-2bad-4b44-8a2b-fffb564baeef', 7, 0, 'Partes', 'Partes', 'Partes', 'Partes', 'Partes', 'uploads/meta/1721181231-txeymEvZLe.svg', '2024-06-25 01:51:39', '2024-07-17 01:53:51'),
(4, 'ecb485c6-5c94-4a35-af58-0e0e8ce78995', 7, 0, 'Bicicletas Enteras', 'Bicicletas-Enteras', 'Bicicletas Enteras', 'Bicicletas Enteras', 'Bicicletas Enteras', 'uploads/meta/1721181343-sfTU6xX6yp.svg', '2024-06-25 01:51:58', '2024-07-17 01:55:43'),
(5, '8e926200-b8ab-4064-bab9-9aa7719a61bf', 7, 4, 'GT', 'GT', 'GT', 'GT', 'GT', NULL, '2024-06-28 01:33:13', '2024-06-28 01:33:13'),
(6, 'cb1f26c7-e929-4f96-8650-47c123b4681a', 7, 4, 'Viking X', 'Viking-X', 'Viking X', 'Viking X', 'Viking X', NULL, '2024-06-28 11:41:13', '2024-06-28 11:41:13'),
(7, '5dda2d9c-5c5f-4985-b2fc-8f2fcddba2e6', 7, 4, 'Gary Fisher', 'Gary-Fisher', 'Gary Fisher', 'Gary Fisher', 'Gary Fisher', NULL, '2024-06-28 11:41:42', '2024-06-28 11:41:42'),
(8, '68becc36-18ea-4f9e-a51f-b04fee0dec11', 7, 3, 'Cuadro', 'Cuadro', 'Cuadro', 'Cuadro', 'Cuadro', NULL, '2024-06-28 11:45:08', '2024-06-28 11:45:08'),
(9, '1827d80f-f609-40a9-8ee7-4755eb2eb357', 7, 3, 'Horquilla', 'Horquilla', 'Horquilla', 'Horquilla', 'Horquilla', NULL, '2024-06-28 11:45:37', '2024-06-28 11:45:37'),
(10, '38aa6413-082d-4452-97b5-243ec1af1731', 7, 3, 'Mazo', 'Mazo', 'Mazo', 'Mazo', 'Mazo', NULL, '2024-06-28 11:46:09', '2024-06-28 11:46:09'),
(11, '78066c4c-31f5-4b43-9382-aab95cf50cb1', 7, 3, 'Tija', 'Tija', 'Tija', 'Tija', 'Tija', NULL, '2024-06-28 11:47:10', '2024-06-28 11:47:10'),
(12, 'c0fc3bee-e191-4535-b259-ad1a341f33a3', 7, 3, 'Estrella', 'Estrella', 'Estrella', 'Estrella', 'Estrella', NULL, '2024-06-28 11:47:40', '2024-06-28 11:47:40'),
(13, '86adcd54-0c7a-4734-8258-8d16cd07b07d', 7, 3, 'Chicharra', 'Chicharra', 'Chicharra', 'Chicharra', 'Chicharra', NULL, '2024-06-28 11:48:12', '2024-06-28 11:48:12'),
(14, '88ab1f29-f894-48d6-a37a-477deb344c1f', 7, 3, 'Freno', 'Freno', 'Freno', 'Freno', 'Freno', NULL, '2024-06-28 11:48:42', '2024-06-28 11:48:42'),
(15, '0d80346a-8cc4-4814-9f4e-eca0d69db320', 7, 3, 'Caja Trasera', 'Caja-Trasera', 'Caja Trasera', 'Caja Trasera', 'Caja Trasera', NULL, '2024-06-28 11:49:15', '2024-06-28 11:49:15'),
(16, '8387d893-7f7b-4bac-938e-6a92373015b5', 7, 3, 'Caja de cambio', 'Caja-de-cambio', 'Caja de cambio', 'Caja de cambio', 'Caja de cambio', NULL, '2024-06-28 11:49:52', '2024-06-28 11:49:52'),
(17, '579d09e2-e175-434b-b789-dbcfe24732bb', 7, 3, 'Descarrilador', 'Descarrilador', 'Descarrilador', 'Descarrilador', 'Descarrilador', NULL, '2024-06-28 11:50:19', '2024-06-28 11:50:19'),
(18, '4bfde5b6-55ef-45ec-8dd1-59d0117a33d0', 7, 3, 'Cubeta Central', 'Cubeta-Central', 'Cubeta Central', 'Cubeta Central', 'Cubeta Central', NULL, '2024-06-28 11:50:45', '2024-06-28 11:50:45'),
(19, '09ba0d55-56f9-4210-885f-c0071933c7af', 7, 3, 'Cubeta de Horquilla', 'Cubeta-de-Horquilla', 'Cubeta de Horquilla', 'Cubeta de Horquilla', 'Cubeta de Horquilla', NULL, '2024-06-28 11:51:37', '2024-06-28 11:51:37'),
(20, 'a59da9c1-e412-4292-b6d0-469852f017ce', 7, 3, 'Manubrio', 'Manubrio', 'Manubrio', 'Manubrio', 'Manubrio', NULL, '2024-06-28 11:51:58', '2024-06-28 11:51:58'),
(21, 'e6ee250a-38cb-4412-acbf-babe0026d7b4', 7, 3, 'Plato', 'Plato', 'Plato', 'Plato', 'Plato', NULL, '2024-06-28 11:52:41', '2024-06-28 11:52:41'),
(22, '8c491a53-1049-46a8-a43f-ebd3d95e1807', 7, 3, 'Disco de freno', 'Disco-de-freno', 'Disco de freno', 'Disco de freno', 'Disco de freno', NULL, '2024-06-28 11:53:06', '2024-06-28 11:53:06'),
(23, 'a06b3d2f-166b-4706-9e69-d2fd3a72165d', 7, 3, 'Pastilla', 'Pastilla', 'Pastilla', 'Pastilla', 'Pastilla', NULL, '2024-06-28 11:53:57', '2024-06-28 11:53:57'),
(24, '22a48fd5-9dae-4a43-8da2-b13091c461c8', 7, 3, 'Cadena', 'Cadena', 'Cadena', 'Cadena', 'Cadena', NULL, '2024-06-28 11:54:25', '2024-06-28 11:54:25'),
(25, '025e6b75-bc80-4680-980c-c4a0c1333a22', 7, 3, 'Sillin', 'Sillin', 'Sillin', 'Sillin', 'Sillin', NULL, '2024-06-28 11:54:50', '2024-06-28 11:54:50'),
(26, '680bf08b-9d94-4488-b94f-716f6d84e2ce', 7, 3, 'Radio', 'Radio', 'Radio', 'Radio', 'Radio', NULL, '2024-06-28 11:55:13', '2024-06-28 11:55:13'),
(27, '1c809053-44e8-4a7d-b062-11c8e1945f9d', 7, 3, 'Steam', 'Steam', 'Steam', 'Steam', 'Steam', NULL, '2024-06-28 11:55:52', '2024-06-28 11:55:52'),
(28, 'ced8a4c9-227e-4130-8586-cb0691350221', 7, 3, 'Amortiguador', 'Amortiguador', 'Amortiguador', 'Amortiguador', 'Amortiguador', NULL, '2024-06-28 11:56:15', '2024-06-28 11:56:15'),
(29, 'b21a0d23-e4b8-4c26-9aaa-79b79a72de05', 7, 3, 'Palanca', 'Palanca', 'Palanca', 'Palanca', 'Palanca', NULL, '2024-06-28 11:56:38', '2024-06-28 11:56:38'),
(30, '9e38871b-3612-42c9-9239-2e6870676612', 7, 3, 'Pedal', 'Pedal', 'Pedal', 'Pedal', 'Pedal', NULL, '2024-06-28 11:57:11', '2024-06-28 11:57:11'),
(31, '73dd2e04-303b-40af-813f-a5f359691795', 7, 2, 'Lentes', 'Lentes', 'Lentes', 'Lentes', 'Lentes', NULL, '2024-06-28 11:57:40', '2024-06-28 11:57:40'),
(32, 'c3df8cb1-6c37-4cb7-b515-f2f024993841', 7, 2, 'Luz', 'Luz', 'Luz', 'Luz', 'Luz', NULL, '2024-06-28 11:58:12', '2024-06-28 11:58:12'),
(33, 'd009b69f-719c-4ebb-8523-176161aabc8f', 7, 2, 'Bocina', 'Bocina', 'Bocina', 'Bocina', 'Bocina', NULL, '2024-06-28 11:58:45', '2024-06-28 11:58:45'),
(34, 'c4690a59-2b42-436a-a9f4-8724780ed104', 7, 2, 'Inflador', 'Inflador', 'Inflador', 'Inflador', 'Inflador', NULL, '2024-06-28 11:59:27', '2024-06-28 11:59:27'),
(35, '6665560b-8a99-42b9-8107-628eb7e323bb', 7, 2, 'Bolsas', 'Bolsas', 'Bolsas', 'Bolsas', 'Bolsas', NULL, '2024-06-28 11:59:59', '2024-06-28 11:59:59'),
(36, '679e2925-a507-4be3-ab3c-a43988601750', 7, 2, 'Portabotellon', 'Portabotellon', 'Portabotellon', 'Portabotellon', 'Portabotellon', NULL, '2024-06-28 12:00:31', '2024-06-28 12:00:31'),
(37, '63431cc8-0827-488e-9461-e1c995b7de98', 7, 2, 'Botellon', 'Botellon', 'Botellon', 'Botellon', 'Botellon', NULL, '2024-06-28 12:01:00', '2024-06-28 12:01:00'),
(38, '94bee6d8-2d15-462b-9a52-1f19f7661cd2', 7, 2, 'Ciclocomputador', 'Ciclocomputador', 'Ciclocomputador', 'Ciclocomputador', 'Ciclocomputador', NULL, '2024-06-28 12:01:33', '2024-06-28 12:01:33'),
(39, '3016d480-7a29-43a2-af64-6b7ed5bf3228', 7, 2, 'Grip', 'Grip', 'Grip', 'Grip', 'Grip', NULL, '2024-06-28 12:02:01', '2024-06-28 12:02:01'),
(40, '5c3650c2-e548-42b4-bb5d-6a32438573f9', 7, 2, 'Cinta protectora', 'Cinta-protectora', 'Cinta protectora', 'Cinta protectora', 'Cinta protectora', NULL, '2024-06-28 12:02:33', '2024-06-28 12:02:33'),
(41, '511612c2-23c0-4fd0-9457-7c6a42ac644c', 7, 1, 'Llanta', 'Llanta', 'Llanta', 'Llanta', 'Llanta', '', '2024-06-28 12:03:21', '2024-07-17 00:48:17'),
(42, '92e50482-28a5-4375-bbcc-4ce0b2d0abbe', 7, 1, 'Camara', 'Camara', 'Camara', 'Camara', 'Camara', NULL, '2024-06-28 12:03:50', '2024-06-28 12:03:50'),
(43, 'a9aa8d82-193a-4d77-8fa5-5ce1e2988845', 14, 3, 'Deore', 'Deore', 'Deore1', 'Deore2', 'Shimano Deore', 'uploads/meta/1719595475-SmOd8ptFuK.jpg', '2024-06-28 17:24:35', '2024-06-28 17:24:35'),
(44, 'ecf4cc39-3639-49c4-99bd-9994668c41f9', 9, 3, 'freno mt200', 'freno-mt200', 'freno mt200', 'mt200', 'mt200', 'uploads/meta/1719596399-6qvFp0pEZU.jpg', '2024-06-28 17:39:59', '2024-06-28 17:50:38'),
(45, '9ef52d5b-d258-4303-8793-83d2ad0fa642', 14, 3, 'Frenos', 'Frenos', 'Frenos', 'Frenos', 'Frenos', 'uploads/meta/1719620619-7KqYRZyIro.jpg', '2024-06-29 00:23:39', '2024-06-29 00:23:39'),
(46, '0ef37769-49fd-4d79-8eed-c1d7dce6ef4d', 14, 1, 'xzx', 'xzx', 'xzx', 'xzx', 'xzx', 'uploads/meta/1719635852-F9ZkeCNFlK.png', '2024-06-29 04:37:32', '2024-07-14 07:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_questions`
--

CREATE TABLE `support_ticket_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_questions`
--

INSERT INTO `support_ticket_questions` (`id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 'Where can I see the status of my refund?', 'In the Refund Status column you can see the date your refund request was submitted or when it was processed.', '2022-12-04 17:05:33', '2024-06-09 01:10:31'),
(2, 'When will I receive my refund?', 'Refund requests are submitted immediately to your payment processor or financial institution after Udemy has received and processed your request. It may take  5 to 10 business days or longer to post the funds in your account, depending on your financial institution or location.', '2022-12-04 17:05:33', '2024-06-09 01:10:31'),
(3, 'Why was my refund request denied?', 'All eligible courses purchased on Udemy can be refunded within 30 days, provided the request meets the guidelines in our refund policy.', '2022-12-04 17:05:33', '2024-06-09 01:10:31'),
(4, 'What is a “credit refund”?', 'In cases where a transaction is not eligible for a refund to your original payment method, the refund will be granted using LMSZAI Credit', '2022-12-04 17:05:33', '2024-06-09 01:10:31'),
(5, 'Where can I see the status of my refund?', 'In the Refund Status column you can see the date your refund request was submitted or when it was processed.', '2022-12-04 17:05:33', '2024-06-09 01:10:31'),
(6, 'When will I receive my refund?', 'Refund requests are submitted immediately to your payment processor or financial institution after Udemy has received and processed your request. It may take  5 to 10 business days or longer to post the funds in your account, depending on your financial institution or location.', '2022-12-04 17:05:33', '2024-06-09 01:10:31'),
(7, 'Why was my refund request denied?', 'All eligible courses purchased on Udemy can be refunded within 30 days, provided the request meets the guidelines in our refund policy.', '2022-12-04 17:05:33', '2024-06-09 01:10:31'),
(8, 'What is a “credit refund”?', 'In cases where a transaction is not eligible for a refund to your original payment method, the refund will be granted using LMSZAI Credit', '2022-12-04 17:05:33', '2024-06-09 01:10:31');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `uuid`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'd45fd1e7-a1e0-4d3f-954d-bd56dc95e48f', 'Design', 'design', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(2, '90bfec22-452f-42f4-b9aa-03c053aecc24', 'Development', 'development', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(3, 'b375ca10-66e9-43c1-8593-a6bdcc8ab3d9', 'IT', 'it', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(4, 'eecd9f5d-f023-4fe2-afcb-23b9ccc558b9', 'Programming', 'programming', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(5, '8f9fbd32-7878-443a-a531-faf1c4428b31', 'Travel', 'travel', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(6, '235b8c44-a340-4929-a48c-6238314d6af4', 'Music', 'music', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(7, '36ec1ef2-5bca-4d06-9446-a5d8ab6abdab', 'Digital marketing', 'digital-marketing', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(8, 'd8dc6caa-b578-49f6-aaca-e25783afe34b', 'Science', 'science', '2022-12-04 17:05:33', '2022-12-04 17:05:33'),
(9, '346c01be-ab53-406f-acc4-73c5fddc0b6f', 'Math', 'math', '2022-12-04 17:05:33', '2022-12-04 17:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `percentage` double(12,3) NOT NULL,
  `is_publish` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `title`, `percentage`, `is_publish`, `created_at`, `updated_at`) VALUES
(38, 'VAT', 59.000, 1, '2021-09-14 05:49:52', '2024-06-25 00:48:28'),
(41, 'GST', 15.000, NULL, '2024-06-25 01:28:31', '2024-06-25 01:28:31'),
(42, 'GST', 35.000, NULL, '2024-06-25 01:30:09', '2024-06-25 01:30:09');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `image`, `name`, `designation`, `created_at`, `updated_at`) VALUES
(1, 'uploads_demo/team_member/1.jpg', 'Arnold keens', 'CREATIVE DIRECTOR', '2022-12-04 17:05:33', '2024-06-09 00:49:20'),
(2, 'uploads_demo/team_member/2.jpg', 'James Bond', 'Designer', '2022-12-04 17:05:33', '2024-06-09 00:49:20'),
(3, 'uploads_demo/team_member/3.jpg', 'Ketty Perry', 'Customer Support', '2022-12-04 17:05:33', '2024-06-09 00:49:20'),
(4, 'uploads_demo/team_member/4.jpg', 'Scarlett', 'CREATIVE DIRECTOR', '2022-12-04 17:05:33', '2024-06-09 00:49:20');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `ticket_number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` tinyint(4) DEFAULT 1 COMMENT '1=Open, 2=Closed',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `related_service_id` bigint(20) UNSIGNED DEFAULT NULL,
  `priority_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_departments`
--

CREATE TABLE `ticket_departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sender_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reply_admin_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_priorities`
--

CREATE TABLE `ticket_priorities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_priorities`
--

INSERT INTO `ticket_priorities` (`id`, `uuid`, `name`, `created_at`, `updated_at`) VALUES
(1, '69cbc017-10dd-4d8e-823b-ce097a2dc092', 'Important', '2024-06-07 07:38:48', '2024-06-07 07:38:48'),
(2, '3531867a-fcda-4185-bf5d-8fda554cc86e', 'Important', '2024-06-07 07:39:04', '2024-06-07 07:39:04');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_related_services`
--

CREATE TABLE `ticket_related_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_logs`
--

CREATE TABLE `time_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_logs`
--

INSERT INTO `time_logs` (`id`, `user_id`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 33, '2024-07-06 09:31:31', '2024-07-06 15:34:14', '2024-07-06 09:31:31', '2024-07-06 09:31:31'),
(2, 32, '2024-07-06 10:12:13', '2024-07-06 10:25:27', '2024-07-06 10:12:13', '2024-07-06 10:25:27'),
(3, 33, '2024-07-07 06:23:22', '2024-07-07 06:24:19', '2024-07-07 06:23:22', '2024-07-07 06:24:19'),
(4, 33, '2024-07-07 06:27:24', '2024-07-07 06:34:39', '2024-07-07 06:27:24', '2024-07-07 06:34:39'),
(5, 33, '2024-07-07 06:38:22', NULL, '2024-07-07 06:38:22', '2024-07-07 06:38:22'),
(6, 33, '2024-07-07 06:51:57', '2024-07-07 07:26:31', '2024-07-07 06:51:57', '2024-07-07 07:26:31'),
(7, 32, '2024-07-07 07:29:05', '2024-07-07 08:09:37', '2024-07-07 07:29:05', '2024-07-07 08:09:37'),
(8, 33, '2024-07-07 07:33:45', '2024-07-07 07:36:02', '2024-07-07 07:33:45', '2024-07-07 07:36:02'),
(9, 33, '2024-07-07 07:44:58', '2024-07-07 07:48:09', '2024-07-07 07:44:58', '2024-07-07 07:48:09'),
(10, 33, '2024-07-07 08:09:27', NULL, '2024-07-07 08:09:27', '2024-07-07 08:09:27'),
(11, 33, '2024-07-07 08:09:52', NULL, '2024-07-07 08:09:52', '2024-07-07 08:09:52'),
(12, 33, '2024-07-07 09:07:12', '2024-07-07 13:09:21', '2024-07-07 09:07:12', '2024-07-07 13:09:21'),
(13, 33, '2024-07-07 15:13:00', '2024-07-07 15:14:29', '2024-07-07 15:13:00', '2024-07-07 15:14:29'),
(14, 33, '2024-07-07 15:28:51', NULL, '2024-07-07 15:28:51', '2024-07-07 15:28:51'),
(15, 33, '2024-07-07 16:06:19', NULL, '2024-07-07 16:06:19', '2024-07-07 16:06:19'),
(16, 32, '2024-07-07 16:10:12', NULL, '2024-07-07 16:10:12', '2024-07-07 16:10:12'),
(17, 33, '2024-07-08 03:56:27', NULL, '2024-07-08 03:56:27', '2024-07-08 03:56:27'),
(18, 33, '2024-07-08 04:53:15', '2024-07-08 04:56:45', '2024-07-08 04:53:15', '2024-07-08 04:56:45'),
(19, 33, '2024-07-08 05:01:39', NULL, '2024-07-08 05:01:39', '2024-07-08 05:01:39'),
(20, 33, '2024-07-08 07:57:51', NULL, '2024-07-08 07:57:51', '2024-07-08 07:57:51'),
(21, 40, '2024-07-08 12:02:51', NULL, '2024-07-08 12:02:51', '2024-07-08 12:02:51'),
(22, 33, '2024-07-08 16:56:36', NULL, '2024-07-08 16:56:36', '2024-07-08 16:56:36'),
(23, 40, '2024-07-08 17:44:31', '2024-07-08 17:52:04', '2024-07-08 17:44:31', '2024-07-08 17:52:04'),
(24, 33, '2024-07-09 01:35:56', NULL, '2024-07-09 01:35:56', '2024-07-09 01:35:56'),
(25, 33, '2024-07-09 05:41:21', NULL, '2024-07-09 05:41:21', '2024-07-09 05:41:21'),
(26, 33, '2024-07-09 15:19:51', NULL, '2024-07-09 15:19:51', '2024-07-09 15:19:51'),
(27, 33, '2024-07-09 20:42:28', NULL, '2024-07-09 20:42:28', '2024-07-09 20:42:28'),
(28, 33, '2024-07-10 04:03:30', NULL, '2024-07-10 04:03:30', '2024-07-10 04:03:30'),
(29, 33, '2024-07-10 07:38:50', '2024-07-10 07:41:54', '2024-07-10 07:38:50', '2024-07-10 07:41:54'),
(30, 44, '2024-07-10 07:59:46', NULL, '2024-07-10 07:59:46', '2024-07-10 07:59:46'),
(31, 33, '2024-07-10 09:24:30', NULL, '2024-07-10 09:24:30', '2024-07-10 09:24:30'),
(32, 40, '2024-07-10 13:28:14', NULL, '2024-07-10 13:28:14', '2024-07-10 13:28:14'),
(33, 44, '2024-07-10 14:24:03', NULL, '2024-07-10 14:24:03', '2024-07-10 14:24:03'),
(34, 40, '2024-07-10 15:02:07', NULL, '2024-07-10 15:02:07', '2024-07-10 15:02:07'),
(35, 40, '2024-07-10 17:39:35', NULL, '2024-07-10 17:39:35', '2024-07-10 17:39:35'),
(36, 44, '2024-07-11 00:37:43', NULL, '2024-07-11 00:37:43', '2024-07-11 00:37:43'),
(37, 33, '2024-07-11 05:01:07', '2024-07-11 06:13:18', '2024-07-11 05:01:07', '2024-07-11 06:13:18'),
(38, 34, '2024-07-11 06:15:36', NULL, '2024-07-11 06:15:36', '2024-07-11 06:15:36'),
(39, 33, '2024-07-11 15:42:40', NULL, '2024-07-11 15:42:40', '2024-07-11 15:42:40'),
(40, 44, '2024-07-11 20:30:30', NULL, '2024-07-11 20:30:30', '2024-07-11 20:30:30'),
(41, 33, '2024-07-11 22:21:11', NULL, '2024-07-11 22:21:11', '2024-07-11 22:21:11'),
(42, 44, '2024-07-12 02:13:40', NULL, '2024-07-12 02:13:40', '2024-07-12 02:13:40'),
(43, 33, '2024-07-12 03:00:42', '2024-07-12 03:01:19', '2024-07-12 03:00:42', '2024-07-12 03:01:19'),
(44, 34, '2024-07-12 03:02:38', NULL, '2024-07-12 03:02:38', '2024-07-12 03:02:38'),
(45, 33, '2024-07-13 01:42:37', NULL, '2024-07-13 01:42:37', '2024-07-13 01:42:37'),
(46, 34, '2024-07-13 11:28:22', '2024-07-13 13:03:05', '2024-07-13 11:28:22', '2024-07-13 13:03:05'),
(47, 33, '2024-07-13 13:03:17', NULL, '2024-07-13 13:03:17', '2024-07-13 13:03:17'),
(48, 33, '2024-07-13 17:09:18', NULL, '2024-07-13 17:09:18', '2024-07-13 17:09:18'),
(49, 40, '2024-07-13 23:09:49', NULL, '2024-07-13 23:09:49', '2024-07-13 23:09:49'),
(50, 44, '2024-07-13 23:29:10', NULL, '2024-07-13 23:29:10', '2024-07-13 23:29:10'),
(51, 34, '2024-07-14 03:27:22', NULL, '2024-07-14 03:27:22', '2024-07-14 03:27:22'),
(52, 44, '2024-07-14 07:02:27', NULL, '2024-07-14 07:02:27', '2024-07-14 07:02:27'),
(53, 34, '2024-07-15 03:05:01', '2024-07-15 04:58:58', '2024-07-15 03:05:01', '2024-07-15 04:58:58'),
(54, 40, '2024-07-15 04:24:48', NULL, '2024-07-15 04:24:48', '2024-07-15 04:24:48'),
(55, 44, '2024-07-15 04:41:12', NULL, '2024-07-15 04:41:12', '2024-07-15 04:41:12'),
(56, 34, '2024-07-15 06:15:22', NULL, '2024-07-15 06:15:22', '2024-07-15 06:15:22'),
(57, 34, '2024-07-15 09:03:49', NULL, '2024-07-15 09:03:49', '2024-07-15 09:03:49'),
(58, 44, '2024-07-15 13:23:17', '2024-07-15 14:09:44', '2024-07-15 13:23:17', '2024-07-15 14:09:44'),
(59, 34, '2024-07-16 09:09:53', NULL, '2024-07-16 09:09:53', '2024-07-16 09:09:53'),
(60, 33, '2024-07-16 15:22:44', NULL, '2024-07-16 15:22:44', '2024-07-16 15:22:44'),
(61, 33, '2024-07-16 15:22:44', NULL, '2024-07-16 15:22:44', '2024-07-16 15:22:44'),
(62, 33, '2024-07-16 21:54:22', '2024-07-16 22:33:22', '2024-07-16 21:54:22', '2024-07-16 22:33:22'),
(63, 40, '2024-07-16 21:56:53', NULL, '2024-07-16 21:56:53', '2024-07-16 21:56:53'),
(64, 44, '2024-07-16 22:42:31', NULL, '2024-07-16 22:42:31', '2024-07-16 22:42:31'),
(65, 34, '2024-07-17 00:11:30', NULL, '2024-07-17 00:11:30', '2024-07-17 00:11:30'),
(66, 40, '2024-07-17 00:58:25', NULL, '2024-07-17 00:58:25', '2024-07-17 00:58:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT 2,
  `permissions` varchar(255) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `custom_password` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(191) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `categories` varchar(255) DEFAULT NULL,
  `alter_mobile_number` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `store` varchar(255) DEFAULT NULL,
  `last_seen` timestamp NULL DEFAULT NULL,
  `is_online` tinyint(4) DEFAULT 0,
  `is_active` tinyint(4) DEFAULT 1,
  `status` int(11) DEFAULT 1,
  `about` text DEFAULT NULL,
  `photo_url` varchar(191) DEFAULT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `is_system` tinyint(4) DEFAULT 0,
  `is_subscribed` tinyint(1) DEFAULT NULL,
  `privacy` int(11) NOT NULL DEFAULT 1,
  `gender` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `language` varchar(191) NOT NULL DEFAULT '''en''',
  `is_super_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `account_type`, `price`, `role`, `permissions`, `name`, `email`, `email_verified_at`, `password`, `custom_password`, `mobile_number`, `city`, `categories`, `alter_mobile_number`, `location`, `department`, `store`, `last_seen`, `is_online`, `is_active`, `status`, `about`, `photo_url`, `profile_photo`, `remember_token`, `ip_address`, `balance`, `is_system`, `is_subscribed`, `privacy`, `gender`, `created_by`, `deleted_at`, `language`, `is_super_admin`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, 1, NULL, 'SUPER ADMINISTRADOR', 'brosbikebros@gmail.com', '2023-03-23 07:45:02', '$2y$10$JwWeMW9Bor7BOTT32MwwFOOKvFV8kqqk99PbHQtezyrl1Ky3KCp.2', NULL, '8878326802', 'bolivia', NULL, NULL, NULL, NULL, NULL, '2024-07-17 00:49:48', 1, 1, 1, NULL, NULL, '149071.png', NULL, NULL, NULL, 1, 0, 1, 1, NULL, NULL, 'es', 1, '2023-03-23 07:45:02', '2024-07-17 00:49:48'),
(33, NULL, 'price2', 2, NULL, 'Juan', 'adminer@gmail.com', '2023-03-23 07:45:02', 'citas.social12323', NULL, '4353535353', 'ythgfh', '7,9,14', '45677890', 'dfgfdghdf', 'Oruro', 'xiu', '2024-07-16 21:54:22', 1, 1, 1, NULL, NULL, 'Screenshot (18).png', NULL, '189.28.76.199', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-27 05:18:44', '2024-07-16 21:54:22'),
(34, NULL, 'price4', 2, NULL, 'Aasif Ahmed', 'arstech2a@gmail.com', '2023-03-23 07:45:02', 'Berlin@3sss', NULL, NULL, 'Indore', '7,9,14,15', '987643210', 'Indore', 'medical', 'arsmedicap', '2024-07-17 00:11:30', 1, 1, 1, NULL, NULL, NULL, NULL, '2409:40c4:16f:29ec:9964:56de:485b:29c0', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-27 05:47:33', '2024-07-17 00:11:30'),
(35, NULL, 'price5', 2, NULL, 'Aasif Ahmed', 'sdafsfsdafsdafsdf@cfgdf.cvo', NULL, 'sdafsdfsdfsdfdsfsdaf', NULL, NULL, 'Indore', 'motorcycle', 'sadfsdfsdfdsafdsf', 'sdffsadfsdfa', 'sdafdsafsaf', 'sdfssdf', NULL, 0, 1, 1, NULL, NULL, NULL, NULL, '2409:40c4:16f:29ec:9964:56de:485b:29c0', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-27 05:54:00', '2024-06-27 05:54:00'),
(36, NULL, 'price2', 2, NULL, 'sdfsfs', 'ccfgdfgdgd@sdfs', NULL, 'dfgfdgdfgfdgfgfdg', NULL, NULL, 'fdggfdgdgd', 'loadline', 'dfgdgdgg', 'gdgdgfdgfdgfd', 'dfdsfsfs', 'dsfsfsfsdfd', NULL, 0, 1, 1, NULL, NULL, NULL, NULL, '2409:40c4:16f:29ec:9964:56de:485b:29c0', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-27 07:35:58', '2024-06-27 07:35:58'),
(38, NULL, 'price5', 2, NULL, 'sdf', 'dsfdssdf@dfsfftgdr', '2024-06-27 15:36:10', 'dfgdgdfgdgdgd', NULL, NULL, 'sdfsfsfd', 'motorcycle', 'dfgdgdfgdfgfdgf', 'sdfsffsff', 'sdsf', 'sdfsfsd', NULL, 0, 1, 1, NULL, NULL, '', NULL, '2409:40c4:16f:29ec:9964:56de:485b:29c0', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-27 15:36:10', '2024-06-27 15:36:10'),
(39, NULL, 'price1', 2, NULL, 'Usuario Prueba', 'userprueba@gmail.com', '2024-06-28 16:55:29', 'user.prueba123', NULL, '4353535353sda', 'La PAz', '7,14', '54567865', 'La Paz', 'LA PAz', 'Tienda1', '2024-07-05 18:20:15', 1, 1, 1, NULL, NULL, '', NULL, '2409:40c4:11cc:430f:3512:e55f:2aa4:26b0', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-28 16:55:29', '2024-07-05 18:20:15'),
(40, NULL, 'price5', 2, NULL, 'Maribel Prueba', 'ml.urquizo@gmail.com', '2024-06-28 17:11:50', 'Mari12345', NULL, '888999', 'La Paz', '7,9,14,15', '7889999', 'Plaza Scout', 'La Paz', 'Bk', '2024-07-17 00:58:25', 1, 1, 1, NULL, NULL, '', NULL, '190.129.166.100', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-28 17:11:50', '2024-07-17 00:58:25'),
(41, NULL, 'price1', 2, NULL, 'Ivan prueba precio 1 BICICLETA', '1iayalaq1@gmail.com', '2024-06-28 23:20:52', '9207111', NULL, '7655', 'LA PAZ', '7,14', '2841594', 'RIO SECEO #100, FRENTE AL HOSPITAL DEL NORTE', 'EL ALTO', 'BIKECENTER', '2024-07-03 03:32:00', 1, 1, 1, NULL, NULL, '', NULL, '189.28.92.132', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-28 23:20:52', '2024-07-03 03:32:00'),
(42, NULL, 'price4', 2, NULL, 'dsfdsfdsfsdfsdfsd', 'ddsfsdf@sfsdfsdfsefsdfs', '2024-06-29 05:09:22', 'fsdfsdfdsdfgfdgdfgfdgd', NULL, '9589642080', 'fsdfsddsfdsfsddsfsdfsdsdsd', '7,9', 'sdfsdfererwesererwe', 'sdsdfsddssdsdfdxdffg', 'vxcfvsdfsdfsdfsdfsdfsdfsd', 'fsfdsfsdfsdfsdfsddsfdfsdd', '2024-06-30 04:56:44', 1, 1, 1, NULL, NULL, '', NULL, '2409:40c4:11cc:430f:3512:e55f:2aa4:26b0', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-29 05:09:22', '2024-06-30 04:56:44'),
(43, NULL, 'price4', 2, NULL, 'das', 'brosbikebros23@gmail.com', '2024-06-29 11:28:15', 'bike.bros12323', NULL, NULL, 'dsfdsf', '9,14,15', '43534567', 'iewwui', 'ssfs', 'das', '2024-06-30 05:21:40', 1, 1, 1, NULL, NULL, '', NULL, '2800:cd0:4252:de00:917e:5d66:f6b:79f7', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-06-29 11:28:15', '2024-06-30 05:21:40'),
(44, NULL, 'price5', 2, NULL, 'Ivan', 'jago1410@gmail.com', '2024-07-10 07:57:15', 'bike.bros123', NULL, NULL, 'La Paz', '7,9,14,15', '78999098', 'La Paz', 'La Paz', 'Nose', '2024-07-16 22:42:31', 1, 1, 1, NULL, NULL, '', NULL, '189.28.76.199', NULL, 0, NULL, 1, NULL, NULL, NULL, '\'en\'', 0, '2024-07-10 07:57:15', '2024-07-16 22:42:31');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_stock` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `price`, `is_stock`, `created_at`, `updated_at`) VALUES
(6, 33, 76, 20.00, 1, '2024-07-10 07:39:27', '2024-07-10 07:39:27'),
(7, 44, 81, 98.00, 1, '2024-07-10 08:31:24', '2024-07-10 08:31:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us_generals`
--
ALTER TABLE `about_us_generals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_details`
--
ALTER TABLE `billing_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_uuid_unique` (`uuid`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_uuid_unique` (`uuid`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_uuid_unique` (`uuid`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_logos`
--
ALTER TABLE `client_logos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_language_unique` (`language`),
  ADD UNIQUE KEY `languages_iso_code_unique` (`iso_code`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail_templates`
--
ALTER TABLE `mail_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_options`
--
ALTER TABLE `media_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `metas_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `notifications_uuid_unique` (`uuid`);

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
-- Indexes for table `our_histories`
--
ALTER TABLE `our_histories`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variations_sku_unique` (`sku`),
  ADD KEY `product_variations_product_id_foreign` (`product_id`);

--
-- Indexes for table `pro_categories`
--
ALTER TABLE `pro_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pro_categories_slug_unique` (`slug`);

--
-- Indexes for table `pro_images`
--
ALTER TABLE `pro_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `related_products`
--
ALTER TABLE `related_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `screen_times`
--
ALTER TABLE `screen_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategories_uuid_unique` (`uuid`);

--
-- Indexes for table `support_ticket_questions`
--
ALTER TABLE `support_ticket_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_uuid_unique` (`uuid`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tickets_uuid_unique` (`uuid`);

--
-- Indexes for table `ticket_departments`
--
ALTER TABLE `ticket_departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_departments_uuid_unique` (`uuid`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_priorities`
--
ALTER TABLE `ticket_priorities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_priorities_uuid_unique` (`uuid`);

--
-- Indexes for table `ticket_related_services`
--
ALTER TABLE `ticket_related_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_related_services_uuid_unique` (`uuid`);

--
-- Indexes for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_name_index` (`name`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_phone_index` (`mobile_number`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us_generals`
--
ALTER TABLE `about_us_generals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `balances`
--
ALTER TABLE `balances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `billing_details`
--
ALTER TABLE `billing_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `client_logos`
--
ALTER TABLE `client_logos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `mail_templates`
--
ALTER TABLE `mail_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `media_options`
--
ALTER TABLE `media_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=783;

--
-- AUTO_INCREMENT for table `metas`
--
ALTER TABLE `metas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `our_histories`
--
ALTER TABLE `our_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `payment_gateway`
--
ALTER TABLE `payment_gateway`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `pro_categories`
--
ALTER TABLE `pro_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `pro_images`
--
ALTER TABLE `pro_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `related_products`
--
ALTER TABLE `related_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `screen_times`
--
ALTER TABLE `screen_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=584;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `support_ticket_questions`
--
ALTER TABLE `support_ticket_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_departments`
--
ALTER TABLE `ticket_departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_priorities`
--
ALTER TABLE `ticket_priorities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ticket_related_services`
--
ALTER TABLE `ticket_related_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `time_logs`
--
ALTER TABLE `time_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

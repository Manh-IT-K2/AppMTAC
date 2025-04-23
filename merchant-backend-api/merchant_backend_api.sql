-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th4 23, 2025 lúc 11:02 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `merchant_backend_api`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `img_schedule_collection`
--

CREATE TABLE `img_schedule_collection` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `schedule_collection_id` int(14) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `img_schedule_collection`
--

INSERT INTO `img_schedule_collection` (`id`, `image_url`, `schedule_collection_id`, `created_at`, `updated_at`) VALUES
(2, 'https://moitruongachau.com/vnt_upload/field/12_2021/quan_ao_cu_rac_cong_kenh.png', 6, NULL, NULL),
(3, 'https://moitruongachau.com/vnt_upload/field/09_2021/tai_che_recycle_1.png', 7, NULL, NULL),
(7, 'https://moitruongachau.com/vnt_upload/field/09_2021/xu_ly_nuoc_5.png', 10, NULL, NULL),
(8, 'https://moitruongachau.com/vnt_upload/field/09_2021/xu_ly_nuoc_4.png', 6, NULL, NULL),
(9, 'https://moitruongachau.com/vnt_upload/field/09_2021/xu_ly_nuoc_2.png', 6, NULL, NULL),
(10, 'https://moitruongachau.com/vnt_upload/field/09_2021/xu_ly_nuoc_1.png', 7, NULL, NULL),
(12, 'https://moitruongachau.com/vnt_upload/field/09_2021/xu_ly_chat_thai_4.png', 10, NULL, NULL),
(13, 'https://moitruongachau.com/vnt_upload/field/10_2021/tieu_huy_hang_hoa_11.png', 10, NULL, NULL),
(14, 'https://moitruongachau.com/vnt_upload/field/09_2021/xu_ly_chat_thai_2.png', 10, NULL, NULL),
(15, 'https://moitruongachau.com/vnt_upload/field/09_2021/xu_ly_chat_thai_3.png', 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `merchandises`
--

CREATE TABLE `merchandises` (
  `id` int(11) NOT NULL,
  `schedule_collection_id` int(11) NOT NULL,
  `name_goods` varchar(255) NOT NULL,
  `id_goods` varchar(255) NOT NULL,
  `total_weight` varchar(255) NOT NULL,
  `warehouse` varchar(255) NOT NULL,
  `processing_owner` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `merchandises`
--

INSERT INTO `merchandises` (`id`, `schedule_collection_id`, `name_goods`, `id_goods`, `total_weight`, `warehouse`, `processing_owner`, `created_at`, `updated_at`) VALUES
(987655, 3, 'Chất hấp thụ, vật liệu lọc (bao gồm cả vật liệu lọc đầu chưa nếu tại các mã khác), giẻ lau, vải bảo vệ thải bị nhiễm chất thành phần nguy hại', '1602 01 10', '10', 'Kho A0', 'Công Ty TNHH MTV Môi Trường Đô Thị Thành Phố Hồ Chí Minh', NULL, NULL),
(987656, 3, 'Dầu động cơ hộp số và bôi trơn tổng hợp thải', '1702 03 30', '30', 'Kho A3', 'Công Ty TNHH MTV Môi Trường Đô Thị Thành Phố Hồ Chí Minh', NULL, NULL),
(987657, 3, 'Pin và ắc quy thải loại', '1804 05 20', '50.5', 'Kho A1', 'Công Ty Xử Lý Chất Thải ABC', NULL, NULL),
(987658, 4, 'Bóng đèn huỳnh quang hỏng', '2001 11 30', '12.3', 'Kho B2', 'Công Ty Tái Chế Điện Tử XYZ', NULL, NULL),
(987659, 4, 'Giấy vụn và bìa carton', '1501 02 15', '200.0', 'Kho C3', 'Công Ty Giấy Tái Sinh', NULL, NULL),
(987660, 4, 'Nhựa phế liệu các loại', '1703 07 25', '75.8', 'Kho D4', 'Công Ty Nhựa Tái Chế', NULL, NULL),
(987661, 5, 'Kim loại vụn (sắt, thép, nhôm)', '1605 10 40', '350.2', 'Kho E5', 'Công Ty Kim Loại Phế Liệu', NULL, NULL),
(987662, 5, 'Lốp xe và cao su phế thải', '1909 12 50', '80.0', 'Kho F6', 'Công Ty Cao Su Tái Chế', NULL, NULL),
(987663, 6, 'Rác thải điện tử (linh kiện máy tính, điện thoại)', '2002 14 60', '25.7', 'Kho G7', 'Công Ty Điện Tử Xanh', NULL, NULL),
(987664, 6, 'Vải vụn và sợi thải loại', '1510 08 35', '45.9', 'Kho H8', 'Công Ty Dệt May Tái Chế', NULL, NULL),
(987665, 6, 'Chất hấp thụ', '1602 01 10', '10', 'Kho F', 'Công Ty TNHH MTV Môi Trường Đô Thị Thành Phố Hồ Chí Minh', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_15_074447_create_personal_access_tokens_table', 1),
(5, '2025_04_18_155537_create_oauth_auth_codes_table', 2),
(6, '2025_04_18_155538_create_oauth_access_tokens_table', 2),
(7, '2025_04_18_155539_create_oauth_refresh_tokens_table', 2),
(8, '2025_04_18_155540_create_oauth_clients_table', 2),
(9, '2025_04_18_155541_create_oauth_personal_access_clients_table', 2),
(10, '2025_04_18_155921_create_schedule_collection_table', 3),
(11, '2025_04_18_160046_create_img_schedule_collection_table', 4),
(12, '2025_04_23_080416_create_merchandises_table', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('056e107b1a8c3cf63b8a24b67619e29801a01a67af2c5481deaee0db04a06718bbc10557c51ca671', 4, 3, NULL, '[]', 1, '2025-04-22 00:19:04', '2025-04-22 01:41:29', '2025-04-22 08:19:04'),
('08748ca63c62d5064762afafe2b81f77d26007a2566d4d8acb085b73c8b19715def4117c73c788ee', 4, 3, NULL, '[]', 1, '2025-04-22 19:00:05', '2025-04-22 21:18:51', '2025-04-23 03:00:05'),
('0a50320bf4b452687a53e3cc312bd7e3ae9f68a8aa5a95b877ab284f2f0af4c08fa6a6a6ca538b4e', 3, 3, NULL, '[]', 0, '2025-04-20 08:18:32', '2025-04-20 08:18:32', '2025-04-20 16:18:32'),
('0d3dcbd1edf9308dd0fcfb4ee12984ebf700f4b596ec73309b8e0dcacc6aed6dd2cc695600b13411', 4, 3, NULL, '[]', 0, '2025-04-23 00:42:42', '2025-04-23 00:42:42', '2025-04-23 08:42:42'),
('0f174cbc32e35fdec66aa7d8b838bf7ca7dd1e1d1b048ebfced1ba73b62d1dae2541c9cf3ac41234', 4, 3, NULL, '[]', 0, '2025-04-20 19:54:28', '2025-04-20 19:54:28', '2025-04-21 03:54:28'),
('159f75062e79ba2024304a4382237c9a43b7501191801141c1424acc80621bfba3dc01c8d6d3a7ca', 4, 3, NULL, '[]', 0, '2025-04-20 07:58:56', '2025-04-20 07:58:56', '2025-04-20 15:58:56'),
('1c4d55e6b8cb0f1a10e686c6e08c216a2f7ea800592fd756121b8584574bc61917c98567a44511f3', 4, 3, NULL, '[]', 0, '2025-04-20 20:08:10', '2025-04-20 20:08:10', '2025-04-21 04:08:10'),
('2593df57b237b2a963ff3014192505653688f0a47ccd5c3540fa5342d9ac781daa4fe92db945ff4f', 4, 3, NULL, '[]', 1, '2025-04-20 19:53:35', '2025-04-20 19:54:28', '2025-04-21 03:53:35'),
('2c2d76ec7dda2808ec67a755a959aa71d018156d2ed1fb32d0701bbd262fccb1d3bcd4b3e03a741d', 1, 3, NULL, '[]', 1, '2025-04-21 01:42:20', '2025-04-21 01:47:49', '2025-04-21 09:42:20'),
('3d76f32eb727aa41baaf859cb9a50b3695deea44effacf8e2499b1c90e59dd614388b913e2646400', 4, 3, NULL, '[]', 0, '2025-04-20 17:56:03', '2025-04-20 17:56:03', '2025-04-21 01:56:03'),
('409fafec4300fc804874f956f416fe709b10dc13ea2dd87871f8ba19496242129e841fb6fddbd9cb', 4, 3, NULL, '[]', 0, '2025-04-20 08:01:44', '2025-04-20 08:01:44', '2025-04-20 16:01:44'),
('419c161cf7ef96d92b040c07f230f449ce7f73d9fba5440ee0e60689c3ef96916e4daac66b27d113', 4, 3, NULL, '[]', 1, '2025-04-21 18:08:19', '2025-04-21 18:08:24', '2025-04-22 02:08:19'),
('41c5b30e2d55b420c0f4d0ac272a15a4363d7819d003ba43a45a5688d7fc7668351954e7f3de648a', 3, 3, NULL, '[]', 0, '2025-04-20 08:36:37', '2025-04-20 08:36:37', '2025-04-20 16:36:37'),
('48701845a1e7063f480207936e1fda4640c40a6275351cc4073314eddefb6f9f3cf857888561beb1', 4, 3, NULL, '[]', 1, '2025-04-20 20:03:32', '2025-04-20 20:03:47', '2025-04-21 04:03:32'),
('5905534adf6d03e2896d312e32cd7d1f2df3fa1337263b4927aaf055609c6fea015fe1e4c1127d4e', 4, 3, NULL, '[]', 1, '2025-04-22 17:42:11', '2025-04-22 19:00:05', '2025-04-23 01:42:11'),
('6557e0e34c9269ce5898547caa58c290186140077ce53487d1b65d5bf3663485d9f8b66febcd9570', 4, 3, NULL, '[]', 0, '2025-04-20 18:05:06', '2025-04-20 18:05:06', '2025-04-21 02:05:06'),
('6ed19b863626b7caaaf53bacabf3512f2bdc3208809c0e31835176890e988bf7f49452f2f43effbb', 4, 3, NULL, '[]', 0, '2025-04-20 08:18:08', '2025-04-20 08:18:08', '2025-04-20 16:18:08'),
('7409a1d2a47e7b72fa1ef0fa4be1bd43a80a9fd71a6ab57ee027c9e051512fc3ba76bdda47b711aa', 4, 3, NULL, '[]', 0, '2025-04-20 17:58:42', '2025-04-20 17:58:42', '2025-04-21 01:58:42'),
('7a04d7639201ee566385faba81abf83d9903baed7014341ac65c7676a529c809c0f607950bbb0357', 4, 3, NULL, '[]', 0, '2025-04-22 20:45:49', '2025-04-22 20:45:49', '2025-04-23 04:45:49'),
('7a23c07592a09f2afde0931d3a5f05affcf100b070dbca3f7bd25f73a74c6c4218b5904999096237', 4, 3, NULL, '[]', 0, '2025-04-20 08:18:12', '2025-04-20 08:18:12', '2025-04-20 16:18:12'),
('7df63c408e89429c6be4ef8167d09cb0cc85e8028cb4fb49f60c7d02441fa9a969e14b4f686b3206', 4, 3, NULL, '[]', 1, '2025-04-22 23:49:38', '2025-04-23 00:51:02', '2025-04-23 07:49:38'),
('808db8f27a3fc7272935fd38bfc9415117bef1ffade852dffb5ee28c99febebe60bfb162e46682be', 4, 3, NULL, '[]', 0, '2025-04-23 01:26:57', '2025-04-23 01:26:57', '2025-04-23 09:26:57'),
('83995b07202b7c947aecd4f0e5330ca9aad6fa91e682d0d67e5dc114db395c00730f5f0cf0920892', 4, 3, NULL, '[]', 1, '2025-04-21 19:57:44', '2025-04-21 20:12:35', '2025-04-22 03:57:44'),
('84c0bc97f07f9bdc75d5ed571cb81ca764a5c30170867b905772ed3b43c5cae9c2fb19abca61e7cb', 4, 3, NULL, '[]', 0, '2025-04-20 08:06:06', '2025-04-20 08:06:06', '2025-04-20 16:06:06'),
('8e989025a5aa4f3b272897a38cec6d128739be85de40b5d9b63daffe8a734faccda81b6e40dfc1a1', 4, 3, NULL, '[]', 0, '2025-04-20 18:21:10', '2025-04-20 18:21:10', '2025-04-21 02:21:10'),
('8eee4ec50121f8f5c3a5d260b1b4d576a3f8c436845f99d7665c8086846198f0e87d78253a8ec94c', 4, 3, NULL, '[]', 0, '2025-04-20 17:56:40', '2025-04-20 17:56:40', '2025-04-21 01:56:40'),
('92a8c05433f1b3bac9e6c69eecb4118a00d84e83347de0310dc5fa51406f0a297ab60202af3cb2a5', 4, 3, NULL, '[]', 0, '2025-04-22 23:50:40', '2025-04-22 23:50:40', '2025-04-23 07:50:40'),
('95a4234f939198fbe61568b99ac18e2c996367d02d400191dff8a7b9efc9ef6c3850772f587c68bb', 4, 3, NULL, '[]', 0, '2025-04-20 08:04:17', '2025-04-20 08:04:17', '2025-04-20 16:04:17'),
('9cf33538e0e9ec6f954a210bed7d6d0a3396d09b44b917a60235cc8ff23c838529a06dfcfa757e5d', 4, 3, NULL, '[]', 0, '2025-04-20 18:19:23', '2025-04-20 18:19:23', '2025-04-21 02:19:23'),
('ad905d2882d0e52c737d3d9e9bc2d509a397db1f78bc6bfef36a8c6f2c0e59f024b032e0620b9dff', 4, 3, NULL, '[]', 0, '2025-04-22 19:35:41', '2025-04-22 19:35:41', '2025-04-23 03:35:41'),
('b020f045df6861adbc1fb06e8a2326ce7f31ec9d14a41fab0f83d8507bf5a0c767d555838fdd9b07', 4, 3, NULL, '[]', 0, '2025-04-20 20:03:47', '2025-04-20 20:03:47', '2025-04-21 04:03:47'),
('b2478a822d64ac407124375d167f31434c6f16d89660ed55535d29d7bbb98f35ad773322a11e575d', 4, 3, NULL, '[]', 1, '2025-04-21 18:09:10', '2025-04-21 18:09:13', '2025-04-22 02:09:10'),
('bb4d808e9cc77ae3c9a4dbd244c98d842dcfc9e0a047648292b3b848c56834729cf0437c0b0bb62d', 2, 1, 'Personal Access Token', '[]', 0, '2025-04-19 02:24:43', '2025-04-19 02:24:43', '2026-04-19 09:24:43'),
('c38bc323c9f323d113b253b163f0d6437360526702927388c2a6f6aeed08f0ebbbbfa7f59b484135', 4, 3, NULL, '[]', 0, '2025-04-20 18:01:38', '2025-04-20 18:01:38', '2025-04-21 02:01:38'),
('ca750064d374ece8c292f22e06d30096670b54ea197638c899901a2a3619b6983871285b373f463d', 4, 3, NULL, '[]', 1, '2025-04-20 20:07:59', '2025-04-20 20:08:10', '2025-04-21 04:07:59'),
('ca7acc72d68fbcf7a55486bba623123cfbf710535bd6b1e7f0f195d25d74bb553d86c9ee0adcf80a', 4, 3, NULL, '[]', 0, '2025-04-20 08:01:48', '2025-04-20 08:01:48', '2025-04-20 16:01:48'),
('d32103f47d8ad805bf36d44712c1ebfe52702b98f9dd237436f59ba1b1ea7eca1f973d09998060a2', 4, 3, NULL, '[]', 0, '2025-04-21 23:23:24', '2025-04-21 23:23:24', '2025-04-22 07:23:24'),
('d5f8d52cc25615a1f623463df512ba363b02c5832f1a2f8ff54b446ae570e7485d4d3ca61cf58fd1', 4, 3, NULL, '[]', 0, '2025-04-20 08:04:15', '2025-04-20 08:04:15', '2025-04-20 16:04:15'),
('d940dc98a3b891037530df4475903ce3e77df79429e69a1ee8a03b83be3227c91e73844cb4b42f6f', 4, 3, NULL, '[]', 1, '2025-04-21 23:06:07', '2025-04-22 00:19:04', '2025-04-22 07:06:07'),
('e0500cd7d7e65141b46091d3de2506f9f1b89cd33bc54a322601e22fdb33e899d7920a2136730916', 3, 1, 'Personal Access Token', '[]', 0, '2025-04-19 03:19:49', '2025-04-19 03:19:49', '2026-04-19 10:19:49'),
('e37c093559f77877b325e642a055cc436df07a6787646283818493dcf6c19e9c458e34e0c244fc60', 3, 3, NULL, '[]', 0, '2025-04-20 08:37:31', '2025-04-20 08:37:31', '2025-04-20 16:37:31'),
('e43c2e4768eca87175fd4ee81ba2ed23092e2381367db7b176ce40d7ec6b833e50e7057b1ca85eac', 1, 1, 'Personal Access Token', '[]', 0, '2025-04-18 08:57:04', '2025-04-18 08:57:04', '2026-04-18 15:57:04'),
('e46cf9df1af558a0dc8d71a468ea4b6087a3b623e74e4eab03c29a0374e7d78b074632413e82c0e7', 4, 3, NULL, '[]', 1, '2025-04-22 01:41:29', '2025-04-22 17:42:11', '2025-04-22 09:41:29'),
('e74d2d51775869828a43d48936f7ac0c4ab8534b3d9a377dcb50156bc962c2d5d2608c810e46fee5', 4, 3, NULL, '[]', 1, '2025-04-21 18:06:22', '2025-04-21 18:06:43', '2025-04-22 02:06:22'),
('ed316db81debbe5b90fdc470298853808efc0f6e8d5a06c52ddc833b8e393d9bb39f0b0f01524d3b', 13, 3, NULL, '[]', 1, '2025-04-21 21:25:41', '2025-04-21 21:26:34', '2025-04-22 05:25:41'),
('ee9e525dd5c120191e32693194673a2a8ab4e158374cf59f23ab68763f483edae670444286c9b437', 4, 3, NULL, '[]', 1, '2025-04-21 17:51:21', '2025-04-21 17:52:33', '2025-04-22 01:51:21'),
('f29c881a6848e0fddfc7cbf454208a9e9c8090a44d5540e9b333e92d12356f26725202d73248252e', 4, 3, NULL, '[]', 0, '2025-04-23 00:51:02', '2025-04-23 00:51:02', '2025-04-23 08:51:02'),
('fa2369f7a10d5ac2b97a5a34694b1abe1bd369e6cc756dc097205ba393c207b850e5aaea18ed5626', 4, 3, NULL, '[]', 1, '2025-04-22 21:18:51', '2025-04-22 23:49:38', '2025-04-23 05:18:51'),
('fc968fc5ffe488d14fc6948f16be92f582bda88d1700dc704212c9fc64fe74767c46b43f7b185179', 4, 3, NULL, '[]', 1, '2025-04-21 17:50:38', '2025-04-21 18:04:26', '2025-04-22 01:50:38'),
('ff1c4a073e9c1d81e8e974057ac7ea911f7f5f0134d2e850171a5af3d6a6b9f2b73aa0e1ae5aa71d', 4, 3, NULL, '[]', 1, '2025-04-20 20:37:02', '2025-04-21 17:50:38', '2025-04-21 04:37:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'gyPuidTkIHphVGvi3BeJoW63Ae1suBA1iEziD01q', NULL, 'http://localhost', 1, 0, 0, '2025-04-18 08:55:43', '2025-04-18 08:55:43'),
(2, NULL, 'Laravel Password Grant Client', 'p3v5HYnOCnCOh0GO8KIqtBEXXEJ5lUlyFV1PTmV1', 'users', 'http://localhost', 0, 1, 0, '2025-04-18 08:55:43', '2025-04-18 08:55:43'),
(3, NULL, 'Laravel Password Grant Client', '$2y$10$IJE1Lr/9Ct8Ol4H57ox.a.xVuRFoxvWnv8u0HtrTDLNpNsJ4N6OPC', 'users', 'http://localhost', 0, 1, 0, '2025-04-20 07:20:36', '2025-04-20 07:20:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-04-18 08:55:43', '2025-04-18 08:55:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('01da997982d18d5fd987a4f1e41d20b42d21ec2de07ea3132a766bd0d23a8fe10030829dcbd7a19a', 'b020f045df6861adbc1fb06e8a2326ce7f31ec9d14a41fab0f83d8507bf5a0c767d555838fdd9b07', 0, '2025-05-21 03:03:47'),
('041e5cad19eba6b3d2fd31b958440dbcfea826f53234e3d497d7def4a9fcdd9b1a50bd7e2fd10351', 'fa2369f7a10d5ac2b97a5a34694b1abe1bd369e6cc756dc097205ba393c207b850e5aaea18ed5626', 1, '2025-05-23 04:18:51'),
('120998927857abc43dfff26a174a5d660420f88475dd2db237eee3aefc6509fc1c1374e643f7dc22', '83995b07202b7c947aecd4f0e5330ca9aad6fa91e682d0d67e5dc114db395c00730f5f0cf0920892', 0, '2025-05-22 02:57:44'),
('12577a7518dcd0106da5961b9ec1cb775fc1763d5b26da3f1552c4c19e814cf83c1edd95066e965d', 'e74d2d51775869828a43d48936f7ac0c4ab8534b3d9a377dcb50156bc962c2d5d2608c810e46fee5', 0, '2025-05-22 01:06:22'),
('18cc4fced4167560c9eb4d6ed7445a2d47142aacad333617b1ac82105fd2efb6c7c6fb2b4fb56ce7', '84c0bc97f07f9bdc75d5ed571cb81ca764a5c30170867b905772ed3b43c5cae9c2fb19abca61e7cb', 0, '2025-05-20 15:06:06'),
('28973b8ef3f936dbb7f24f725393dc12c1fb3f48dfe51a3b28135c1e63bd152babbee5361a3ff808', 'c38bc323c9f323d113b253b163f0d6437360526702927388c2a6f6aeed08f0ebbbbfa7f59b484135', 0, '2025-05-21 01:01:38'),
('3a9afcf18ca81e01db95b8866c64701279a62b13d4bd19100ea508302481aec46f8f2b30f28732df', 'ca750064d374ece8c292f22e06d30096670b54ea197638c899901a2a3619b6983871285b373f463d', 1, '2025-05-21 03:07:59'),
('41c52ca8e7580b0bd59ad05c77776a18d455f4755939ebb784419a2170be2e68689d8be42b2cf9fd', '08748ca63c62d5064762afafe2b81f77d26007a2566d4d8acb085b73c8b19715def4117c73c788ee', 1, '2025-05-23 02:00:05'),
('4741b3344db14877349234501d93c6f6b4db4d80d27636f8406e64125d04d42bfff33b7b465cef59', '9cf33538e0e9ec6f954a210bed7d6d0a3396d09b44b917a60235cc8ff23c838529a06dfcfa757e5d', 0, '2025-05-21 01:19:23'),
('497efbf3f7921ad87daac6f1f522df52a91178c7d1ac8cf16d8e373d8b88e07ccbd1a1375fef5fec', '41c5b30e2d55b420c0f4d0ac272a15a4363d7819d003ba43a45a5688d7fc7668351954e7f3de648a', 0, '2025-05-20 15:36:37'),
('51506bedf4830d730637f157fc05cf6ad5bd8c81fbaad7456a6edb4e43931c58202cd59af3d9462c', '95a4234f939198fbe61568b99ac18e2c996367d02d400191dff8a7b9efc9ef6c3850772f587c68bb', 0, '2025-05-20 15:04:17'),
('61651205caf7d735fe9486f2708cf11bbd9f46f3e27ab38af88da4ccd90923fa21331bc4255b8333', '2c2d76ec7dda2808ec67a755a959aa71d018156d2ed1fb32d0701bbd262fccb1d3bcd4b3e03a741d', 0, '2025-05-21 08:42:20'),
('629e6c120e6c3f2e0219101a1de3745d6cd3c43641d72d3be7b4f64e46ef17f600f0f5432e413761', '159f75062e79ba2024304a4382237c9a43b7501191801141c1424acc80621bfba3dc01c8d6d3a7ca', 0, '2025-05-20 14:58:56'),
('630a0d2f44af3a70ea711f763100ddb53f521ced90fe651d6ac9b8226a62d94d37455cd6cf365ef7', '7df63c408e89429c6be4ef8167d09cb0cc85e8028cb4fb49f60c7d02441fa9a969e14b4f686b3206', 1, '2025-05-23 06:49:38'),
('6b807d5539a1ee8b32f03f78f114652243fb74706b59c2e05548602a6550dbfbf3912b0e81f721ee', 'e37c093559f77877b325e642a055cc436df07a6787646283818493dcf6c19e9c458e34e0c244fc60', 0, '2025-05-20 15:37:31'),
('7275a7da99c812df2136d5e39cb465ba1437ca1dadcd178178770b058756b21cbecb6bb0ca86a86a', 'f29c881a6848e0fddfc7cbf454208a9e9c8090a44d5540e9b333e92d12356f26725202d73248252e', 0, '2025-05-23 07:51:02'),
('7642e0e4d2f8258c924048f7076c9af85d55484b40d3293a91c72da4ba41e2114379363792553573', '8e989025a5aa4f3b272897a38cec6d128739be85de40b5d9b63daffe8a734faccda81b6e40dfc1a1', 0, '2025-05-21 01:21:10'),
('7b227486756b470e5be5b6e117730744722d131a5af6f543a4a3f8b73c5c1676650fff7d2c87244b', '0d3dcbd1edf9308dd0fcfb4ee12984ebf700f4b596ec73309b8e0dcacc6aed6dd2cc695600b13411', 0, '2025-05-23 07:42:42'),
('7d6a548a1d4e209dd99c1023b5973621cab63f12661181b9c1e722e752cf44a0eeb9ef173ec9977d', 'd32103f47d8ad805bf36d44712c1ebfe52702b98f9dd237436f59ba1b1ea7eca1f973d09998060a2', 0, '2025-05-22 06:23:24'),
('7e83520f03686c862556cfeb930a2cbc718a1a48f3023a74a7b56bc7aa250eee361221ceb0427c6b', '1c4d55e6b8cb0f1a10e686c6e08c216a2f7ea800592fd756121b8584574bc61917c98567a44511f3', 0, '2025-05-21 03:08:10'),
('8008fcf912ad76f963d9fdead374f122e47ec2020fd137f1ba7bbfecf2cd08b25f5fcbb7449d9865', '6557e0e34c9269ce5898547caa58c290186140077ce53487d1b65d5bf3663485d9f8b66febcd9570', 0, '2025-05-21 01:05:06'),
('843dc0bcdbcec40e244f4f0819e1e05ab77783aae0f78a7af8e574ab9815b3d7ad57b079ab68643f', 'ed316db81debbe5b90fdc470298853808efc0f6e8d5a06c52ddc833b8e393d9bb39f0b0f01524d3b', 0, '2025-05-22 04:25:41'),
('8a27ead90fef2f70606361d6dde02f6bc336b360b935a7c63122d2fb4d116071fd30c47b4562ff87', '056e107b1a8c3cf63b8a24b67619e29801a01a67af2c5481deaee0db04a06718bbc10557c51ca671', 1, '2025-05-22 07:19:04'),
('905f8ae99c9cdf95cd77489cd9beb27e08e8cd4e8f9a81ea67b4e09c675aff18ef94d205ccc19f6b', '8eee4ec50121f8f5c3a5d260b1b4d576a3f8c436845f99d7665c8086846198f0e87d78253a8ec94c', 0, '2025-05-21 00:56:40'),
('9697adf5d763ca9b88b22b7f820bfc331f49e98979e07dccfd18eb46b3cec4c58d49352ecd12daf3', '409fafec4300fc804874f956f416fe709b10dc13ea2dd87871f8ba19496242129e841fb6fddbd9cb', 0, '2025-05-20 15:01:44'),
('9a82a423d0b4ee3d56b4b95731533ea70830a843dfac869a159ec66576b134c932ffcb87c579c26e', 'd5f8d52cc25615a1f623463df512ba363b02c5832f1a2f8ff54b446ae570e7485d4d3ca61cf58fd1', 0, '2025-05-20 15:04:15'),
('9bad0bea81771d66497f1423fa11ef48075399a702c400d87af5cd6f84dbd650c2f564f28227f9ef', 'b2478a822d64ac407124375d167f31434c6f16d89660ed55535d29d7bbb98f35ad773322a11e575d', 0, '2025-05-22 01:09:10'),
('9c3b0b01b0d7919cb8cf8c996a88aebd29f3b1f8c38d462cccdb7a2ad698d3d51e563de5c574820b', '0a50320bf4b452687a53e3cc312bd7e3ae9f68a8aa5a95b877ab284f2f0af4c08fa6a6a6ca538b4e', 0, '2025-05-20 15:18:32'),
('9dca04e928e0a92fdd68a3715fe4b80093bfb12be6852ec2fbe2800bf7bafad26cb2ef05966f0055', '7a04d7639201ee566385faba81abf83d9903baed7014341ac65c7676a529c809c0f607950bbb0357', 0, '2025-05-23 03:45:49'),
('ab1f7725441d14dc1c6090781f75ce15a9bc5d8bdd1d102bbca74e61c5210f166927fe5d8fc99c9f', 'ff1c4a073e9c1d81e8e974057ac7ea911f7f5f0134d2e850171a5af3d6a6b9f2b73aa0e1ae5aa71d', 1, '2025-05-21 03:37:02'),
('aca1473bffabd19e357f666356e8a70fd8c0f4a0325bfe2edb9bb9940846a6092f2454e46cf94b4a', 'fc968fc5ffe488d14fc6948f16be92f582bda88d1700dc704212c9fc64fe74767c46b43f7b185179', 0, '2025-05-22 00:50:38'),
('af137e49db918f30f9d1c03a1cf4e1f1ca9ae4492bceb895bd40b33cd0e5b31c108a065c7f5fbbbc', '7409a1d2a47e7b72fa1ef0fa4be1bd43a80a9fd71a6ab57ee027c9e051512fc3ba76bdda47b711aa', 0, '2025-05-21 00:58:42'),
('b780d008e9daf9a7166949696dedf064bf256e13829401188589473f1a494ffe32e588a1d3605d28', 'ca7acc72d68fbcf7a55486bba623123cfbf710535bd6b1e7f0f195d25d74bb553d86c9ee0adcf80a', 0, '2025-05-20 15:01:48'),
('bfb9d06b4ee68ac83f34abcb9718b5f001e90fcaff97356cb78203726dd3667707c28efd39d532e7', '48701845a1e7063f480207936e1fda4640c40a6275351cc4073314eddefb6f9f3cf857888561beb1', 1, '2025-05-21 03:03:32'),
('c1497e9116beacc3fcfff68d031be4d04ec429e6382fa4d4477b6cde1f1fcd1032cc9f10be558fd1', 'e46cf9df1af558a0dc8d71a468ea4b6087a3b623e74e4eab03c29a0374e7d78b074632413e82c0e7', 1, '2025-05-22 08:41:29'),
('c91845bb06900a06d7a085b65e3aceb558b5a622eef3f74e5b7314cfecf61b459c205b7ef155af7e', 'ad905d2882d0e52c737d3d9e9bc2d509a397db1f78bc6bfef36a8c6f2c0e59f024b032e0620b9dff', 0, '2025-05-23 02:35:41'),
('cb9cbf4a5d033909e9fc35591f5013bb88f8633a589dd0919fc97c8875d5c12675a29da64331da60', '7a23c07592a09f2afde0931d3a5f05affcf100b070dbca3f7bd25f73a74c6c4218b5904999096237', 0, '2025-05-20 15:18:12'),
('d911b606d7d46d6316759b388b699e7f1eac48cabd8e5cb5999f8b85a4c71835eff6ebf5bfb30e06', '419c161cf7ef96d92b040c07f230f449ce7f73d9fba5440ee0e60689c3ef96916e4daac66b27d113', 0, '2025-05-22 01:08:19'),
('dcabaddc7b0858e6fbab548181d0dd0bdb997054b9050c197d5f2c7d6b936772452919e001defec1', '6ed19b863626b7caaaf53bacabf3512f2bdc3208809c0e31835176890e988bf7f49452f2f43effbb', 0, '2025-05-20 15:18:08'),
('de9d02492b7d752c3fceba7f3cc86a8458f6253d0547ebda84bc0ac292b2d1782eb2851af0313033', '5905534adf6d03e2896d312e32cd7d1f2df3fa1337263b4927aaf055609c6fea015fe1e4c1127d4e', 1, '2025-05-23 00:42:11'),
('e2b10c4b8b485847ae441a164f3390abce4dd41457798a91aa35c2072af478e003aacc7c27f88b28', '2593df57b237b2a963ff3014192505653688f0a47ccd5c3540fa5342d9ac781daa4fe92db945ff4f', 1, '2025-05-21 02:53:35'),
('e747413760898271a042a80981109e17a6dc5beb8ac90c733487e53cbd89302e14d631cd4e4badf6', '808db8f27a3fc7272935fd38bfc9415117bef1ffade852dffb5ee28c99febebe60bfb162e46682be', 0, '2025-05-23 08:26:57'),
('e747c587b01fac14ee2e15bf7656d632e6067fe1aa38baacc1297cb46813ef125f0b48912b633354', '3d76f32eb727aa41baaf859cb9a50b3695deea44effacf8e2499b1c90e59dd614388b913e2646400', 0, '2025-05-21 00:56:03'),
('ed248bf0557275b3847dd603ed2430db54e0fe867786bba5d4a0cfa1c52312cf0dcae195ada8672d', '0f174cbc32e35fdec66aa7d8b838bf7ca7dd1e1d1b048ebfced1ba73b62d1dae2541c9cf3ac41234', 0, '2025-05-21 02:54:28'),
('ee937f98155c2fc4c1cf0a4d374c016d45fcf291530ab0f175c1647710220566f23aacb431a96676', '92a8c05433f1b3bac9e6c69eecb4118a00d84e83347de0310dc5fa51406f0a297ab60202af3cb2a5', 0, '2025-05-23 06:50:40'),
('eee9997320effc2586f08b11a7c85affd56bf07f90a323eeecd6901f4874529faba8c4c022517907', 'd940dc98a3b891037530df4475903ce3e77df79429e69a1ee8a03b83be3227c91e73844cb4b42f6f', 1, '2025-05-22 06:06:07'),
('fdd9c65ec6c3993cc5fae74ca35ac51d544cc2aa7a3c8798ed9aab925b748e943715aacaa4107f0a', 'ee9e525dd5c120191e32693194673a2a8ab4e158374cf59f23ab68763f483edae670444286c9b437', 0, '2025-05-22 00:51:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedule_collection`
--

CREATE TABLE `schedule_collection` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `collection_id` varchar(255) NOT NULL,
  `name_business` varchar(255) NOT NULL,
  `address_collection` varchar(255) NOT NULL,
  `type_waste` varchar(255) NOT NULL,
  `area_transit` varchar(255) NOT NULL,
  `number_plate` varchar(255) NOT NULL,
  `number_worker` int(11) NOT NULL,
  `time_collection` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `day_collection` datetime DEFAULT NULL,
  `day_send_collection` varchar(255) NOT NULL,
  `debt_status` varchar(255) NOT NULL,
  `cost_transit` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `schedule_collection`
--

INSERT INTO `schedule_collection` (`id`, `status`, `collection_id`, `name_business`, `address_collection`, `type_waste`, `area_transit`, `number_plate`, `number_worker`, `time_collection`, `contact_person`, `day_collection`, `day_send_collection`, `debt_status`, `cost_transit`, `created_at`, `updated_at`) VALUES
(3, 1, 'CTG-75415', 'Công ty Giày Rieker Việt Nam', 'Tỉnh Quảng Nam, Phường Điện Nam Bắc, Thị xã Điện Bàn, Lô số 1, KCN Điện Nam - Điện Ngọc', 'Chất thải sinh hoạt', 'Điện Ngọc (Quảng Nam) => Mỹ Tho (Tiền Giang)', '50H-04282', 2, 'Chưa thu gom', 'Nguyễn Thị Thuỷ', NULL, '2023-10-18', 'Đã thanh toán', '3,200,000 VND', NULL, NULL),
(4, 0, 'CTG-75171', 'Công ty TNHH Cobi Cif', 'Tỉnh Long An, Xã Long Hậu, Huyện Cần Giuộc, Lô DV-4, Đường Trung Tâm, KCN Long Hậu mở rộng', 'Chất thải sinh hoạt', 'Cần Giuộc (Long An) => Bình Tân (TP.HCM)', '54Y-6663', 3, 'Chưa thu gom', 'Giàu', NULL, '2023-10-19', 'Chưa thanh toán', '2,100,000 VND', NULL, NULL),
(5, 1, 'CTG-75158', 'Công Ty TNHH Freetrend Industrial A (Việt Nam)', 'Thành phốt Hồ Chí Minh, Phường Bình Chiểu, Thành Phố Thủ Đức, KCN trong KCX Linh Trung II', 'Chất thải sinh hoạt', 'Bình Tân (TP.HCM) => Thủ Đức (TP.HCM)', '51D-57412', 1, 'Chưa thu gom', 'Kim Tuyến', NULL, '2023-10-20', 'Đã thanh toán', '1,500,000 VND', NULL, NULL),
(6, 1, 'CTG-75165', 'Công Ty TNHH MTV Clio Vina', 'Tỉnh Long An, Xã Long Hậu, Huyện Cần Giuộc, Lô H-06B, Đường số 1, KCN Long Hậu, Ấp 3', 'Chất thải sinh hoạt', 'Cần Giuộc (Long An) => Bình Tân (TP.HCM)', '50H-11676', 4, '11:15 AM', 'Mỹ Phụng', '2025-04-23 00:00:00', '2023-10-21', 'Đã thanh toán', '2,800,000 VND', NULL, NULL),
(7, 0, 'CTG-75169', 'Công Ty TNHH GapaChi', 'Thành Phố Hồ Chí Minh, Phường Tân Chánh Hiệp, Quận 12, Số 28/1 Đường Tân Chánh Hiệp 10', 'Chất thải sinh hoạt', 'Thủ Đức (TP.HCM) => Quận 12 (TP.HCM)', '50H-11676', 2, '12:00', 'Yến', '2025-04-23 09:31:12', '2023-10-22', 'Chưa thanh toán', '1,900,000 VND', NULL, NULL),
(9, 0, 'CTG-75173', 'Công Ty Cổ Phần Đầu Tư Xây Dựng Và Thương Mại Đại Phúc', 'Tỉnh Đồng Nai, Huyện Trảng Bom, Ấp 3, Xã Sông Trầu, Lô A3-1, KCN Sông Trầu', 'Chất thải xây dựng', 'Trảng Bom (Đồng Nai) => Thủ Đức (TP.HCM)', '60A-54321', 5, 'Chưa thu gom', 'Lê Văn Tài', NULL, '2023-10-24', 'Chưa thanh toán', '4,200,000 VND', NULL, NULL),
(10, 1, 'CTG-75174', 'Công Ty TNHH Pouchen Việt Nam', 'Tỉnh Đồng Nai, Thành phố Biên Hoà, Phường Long Bình, Lô A1, KCN Biên Hoà 1', 'Chất thải sinh hoạt', 'Biên Hoà (Đồng Nai) => Bình Tân (TP.HCM)', '51D-98765', 4, '10:45 AM', 'Nguyễn Thị Mai', '2025-04-23 09:31:26', '2023-10-25', 'Đã thanh toán', '2,700,000 VND', NULL, NULL),
(11, 1, 'CTG-75161', 'TNHH Jones Lang Lasalle (Việt Nam)', 'KCNC Phường Tân Phú, TP. Thủ Đức TP. Hồ Chí Minh', 'Chất thải sinh hoạt', 'TP.HCM (TP.HCM) => Thủ Đức (TP.HCM)', '50H-10869', 4, '11:20 AM', 'Chị Hồng', '2025-04-23 09:31:40', '2023-10-16', 'Đã thanh toán', '2,500,000 VND', NULL, NULL),
(12, 0, 'CTG-75352', 'Công ty TNHH Active Creation', 'Huyện Thủ Thừa, Công Ty TNHH Active Creation - Lô B5, Đường số 5, KCN Long Hậu - Hoà Bình', 'Chất thải sinh hoạt', 'Thủ Thừa (Long An) => Bình Tân (TP.HCM)', '50H-04282', 3, 'Chưa thu gom', 'Nguyên', NULL, '2023-10-17', 'Chưa thanh toán', '1,800,000 VND', NULL, NULL),
(13, 1, 'CTG-75415', 'Công ty Giày Rieker Việt Nam', 'Tỉnh Quảng Nam, Phường Điện Nam Bắc, Thị xã Điện Bàn, Lô số 1, KCN Điện Nam - Điện Ngọc', 'Chất thải sinh hoạt', 'Điện Ngọc (Quảng Nam) => Mỹ Tho (Tiền Giang)', '50H-04282', 2, 'Chưa thu gom', 'Nguyễn Thị Thuỷ', NULL, '2023-10-18', 'Đã thanh toán', '3,200,000 VND', NULL, NULL),
(14, 0, 'CTG-75171', 'Công ty TNHH Cobi Cif', 'Tỉnh Long An, Xã Long Hậu, Huyện Cần Giuộc, Lô DV-4, Đường Trung Tâm, KCN Long Hậu mở rộng', 'Chất thải sinh hoạt', 'Cần Giuộc (Long An) => Bình Tân (TP.HCM)', '54Y-6663', 3, 'Chưa thu gom', 'Giàu', NULL, '2023-10-19', 'Chưa thanh toán', '2,100,000 VND', NULL, NULL),
(15, 1, 'CTG-75158', 'Công Ty TNHH Freetrend Industrial A (Việt Nam)', 'Thành phốt Hồ Chí Minh, Phường Bình Chiểu, Thành Phố Thủ Đức, KCN trong KCX Linh Trung II', 'Chất thải sinh hoạt', 'Bình Tân (TP.HCM) => Thủ Đức (TP.HCM)', '51D-57412', 1, 'Chưa thu gom', 'Kim Tuyến', NULL, '2023-10-20', 'Đã thanh toán', '1,500,000 VND', NULL, NULL),
(16, 1, 'CTG-75165', 'Công Ty TNHH MTV Clio Vina', 'Tỉnh Long An, Xã Long Hậu, Huyện Cần Giuộc, Lô H-06B, Đường số 1, KCN Long Hậu, Ấp 3', 'Chất thải sinh hoạt', 'Cần Giuộc (Long An) => Bình Tân (TP.HCM)', '50H-11676', 4, '11:15 AM', 'Mỹ Phụng', '2025-04-11 09:33:01', '2023-10-21', 'Đã thanh toán', '2,800,000 VND', NULL, NULL),
(17, 0, 'CTG-75169', 'Công Ty TNHH GapaChi', 'Thành Phố Hồ Chí Minh, Phường Tân Chánh Hiệp, Quận 12, Số 28/1 Đường Tân Chánh Hiệp 10', 'Chất thải sinh hoạt', 'Thủ Đức (TP.HCM) => Quận 12 (TP.HCM)', '50H-11676', 2, '12:00', 'Yến', '2025-04-20 09:33:31', '2023-10-22', 'Chưa thanh toán', '1,900,000 VND', NULL, NULL),
(18, 1, 'CTG-75172', 'Công Ty TNHH Sản Xuất Thương Mại Dịch Vụ Hưng Thịnh', 'Tỉnh Bình Dương, Thành phố Thuận An, Phường Bình Chuẩn, Số 19, Đường N7, KCN VSIP II', 'Chất thải công nghiệp', 'Thuận An (Bình Dương) => Bình Tân (TP.HCM)', '51D-12345', 3, '09:30 AM', 'Trần Văn Nam', '2025-04-14 09:32:44', '2023-10-23', 'Đã thanh toán', '3,500,000 VND', NULL, NULL),
(19, 0, 'CTG-75173', 'Công Ty Cổ Phần Đầu Tư Xây Dựng Và Thương Mại Đại Phúc', 'Tỉnh Đồng Nai, Huyện Trảng Bom, Ấp 3, Xã Sông Trầu, Lô A3-1, KCN Sông Trầu', 'Chất thải xây dựng', 'Trảng Bom (Đồng Nai) => Thủ Đức (TP.HCM)', '60A-54321', 5, 'Chưa thu gom', 'Lê Văn Tài', NULL, '2023-10-24', 'Chưa thanh toán', '4,200,000 VND', NULL, NULL),
(20, 1, 'CTG-75174', 'Công Ty TNHH Pouchen Việt Nam', 'Tỉnh Đồng Nai, Thành phố Biên Hoà, Phường Long Bình, Lô A1, KCN Biên Hoà 1', 'Chất thải sinh hoạt', 'Biên Hoà (Đồng Nai) => Bình Tân (TP.HCM)', '51D-98765', 4, '10:45 AM', 'Nguyễn Thị Mai', '2025-04-24 09:32:31', '2023-10-25', 'Đã thanh toán', '2,700,000 VND', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('01HlFPLjZoJHs1ZDA0w07S9JVmueplxAWXIrkLiX', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzNhRDkwUEU2bUw0UHhBalptenZwYlo1WHhTOU4yOHgxTmlwakVPdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745308295),
('0NjqNPXmoU8RmcMeqdDY4Q5gsG4qXN5m4ips7zur', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUtrZkxxQ0ZQRmVoZUhFbkQzdmFCSFl5U1VMUTBBQlFpRHJsclRZOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745370027),
('1frzlI5ffY0VDmswfrzzKvfKNor6pKpmbBwN1o3S', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidk5DZ1VsMmc0TkJiR0MzeHltM2Z2bXpHREh3V2JuaUg2R2xzdjhHayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745307427),
('3uRrrR5kNsglVbiIlkwQLpjPe9iqXOHfaSzYoKOD', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEJmaHhiWjRSVTZQcXNSc2xhQ1JydlNmb203UHdWNGsyMU9jUmY5OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745394661),
('5POOPhftD6FtUjIxEfUTQuWUGu04qWxc9vH7wQLB', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWNBalBVYUZiVDk3dHNweGlaRTl3ZnZTaHpPRGpZeW1YZDA0SXRpbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745311713),
('5PUvUdTJaqEwtyJ9khirbpxcViyiZPC2XG2ykzdC', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDdtdFNQUUdnYmU5VGlKWjJkMVZ4SVk5RVVhNzhLNEFHQjVlcVBrZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745307840),
('6VOCLyvr2GSeCKFNutVMvobuUAcaThN8DkuY3o1b', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2ZjYVprdldPTFFPYTBlZFpLVzdaUGdmVmo0ZEhzd1NjdjZKY0JFRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306343),
('74JMMQ3d3fSa4ze6w4MZxpjwQr9Zqy5tDZPLTRKW', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjU2N3BUeWJ3ZXZPMjY1SDFMOEpqU3BYSlNNeUtDdFcwWTZ1VVpPZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745393749),
('7z1ohr4aWwVdcf6sjIpdpFhuvG8uDFc6ep3s4NcL', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUxudDM3ekVMOGlOcmZkd2NYNWREVmZ1WXVFOFJmajd5bHpEY2t4SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309062),
('A51FMJ2HiTcVy6GGD69AeucgwZebUH9hN2oNUUEQ', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1pqWk13cm9NWkE5QU05MWVCeHV4Qk5JOTJsYmE5SUF1MUNhenBVaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306462),
('AKdA5cH0E5d5j3YgSpUKcS1L9xjIuwh9Amdyx6d9', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0hPYjJnZHVHU1R6NzhlMWhQSEpJZDFBQjVSQjVFeDgyYVNxQVBwdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309239),
('ALdh2HXIljgsMTz9YtAOFh5iZCtfMTeLMZ2PnZ1T', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm5YVFlvS2FqZWJlZE9UUVUxSXZTZXJMZ1p2dGdyZ0o0cm9GajdvMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745312965),
('BJXEnVCQqmsE54QA1KNW1I3lnXU9b5TQlMzhblVU', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjFWbTBZZThwdHFadmhON2lUaE41QkVsV3VndmNGNFcyTDZqWkU2eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745313414),
('DjtfIJhIX8J37iWnX5FeUFTeoChHo18trEayeINe', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3hmejhGWFg2RHd6dFVRazlvU2xVbEFBcW1ySEFra1o2cTFTYk1USSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745394287),
('dkTj2tKagbR7qODPcbmuhh1heo9FyYQkLlZ30rIC', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGN5Q3FoTk1uZmlJNjlpeElZdnd5YmIwZURIN0lnUzhqT1kxeUF2eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745392207),
('EajFMkjYTNB6znf31wsZ9k78DUZsySVCx0WEMkWl', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNk9TZDdEUk1uYTFQUWRjT3RtR1FCdmxSMzE0SFloeWN2eVo4ckt3VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745394128),
('FnOs85QqGLWMhhmzbkSqdlCJJXJE6yQTESuVHdPb', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFFaY0hGY05JTjJrWnB3MlVGa0RvTHVPSUdqSGtKR0dMM2RKUXF6cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745391831),
('Fx6zN9ve80dY9HCNExCgOiIPXRzxIOoFsw80IEVQ', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWZha0dOWGJvamhrSnFnV0ZjbkMzdTNuc0UwMndaVlVVUTFkcklGcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745308804),
('FzYS7sLSLkHZ32EQcmq878eQ4Ppt1p6vyCiqy5QG', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRExTN2R6ZzRYYmVzSjZqamZ3OHF2dW1SOHRhNmIwTmRJdUdlR0tPUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745394575),
('g5Utqslq9omwiADrqYE95JtgnHuDZZI4I9Ib0N0K', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFRTMVZIWndaZjFXaXVOMHc4MDNBRWtXZ0dRaVFRbm82bXpMaE5BUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745382236),
('gH6kFUmMovNRYs6HiHcCfrTBXoqPHeKLYZ5KUKY1', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVdMakpDa0I0aXJsUkRwbmloU3YxdGVuVVFYMlJmSkxteUJBdzcxMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745392130),
('gwQVWbmdeaRA7hcaykejTPUUTibDgrhWJuxdhe0m', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVZkM3ZxUDRTT3RqWURkdUFDdk5oUnZFTzB3ZE9aUG5tdGNKWWt5ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745308786),
('HJQBE4gk2SBOVy0E1lT0CAkscSUu6I99MyxrevZl', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGxab3VSRzBya0VQN3d0Q0dXa0F3cGJKVmxib3V1OHFrbzQ1YXRndyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745311714),
('hNRT1Co4E0QZskb9ljCmDVJahOEO7mFpRK4y6aVA', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHNvTm5UdzA5UHRRSGxaeFg1ejVUWms2cGdiU3hjN1N4alJETkhhTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306900),
('hohsWTsK0dpRmrL7EgXAj46TnVAzoJ96zBenMayu', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1c5S2NpOHhpMXZpRWlseFZmb2tydGpFaHE2NkxBcTdCNEU0UGdRbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745393853),
('hPAGep50SKs44Z9k3SSM8McyynQ5aMI0a4dLkZAQ', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEc5WXRqY2tLR0d5Y3BRMk1PVXVZSGJkSjA1TWU0VGt2NEdhbjExTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309002),
('hvHt6zMNagYBJfGvBLVTclynYwScJcZFjuorMCZ7', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkhzcUhBbU1SdlUwVXV3NXhQVXBOamZCTzJwb1dlZm9tM3l3MDlYVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309441),
('hW61X1FzdafDvfbC3InfoxUOLv2QsjeVlVlK6qLo', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2hiZVczMXFsM0l1UUs1SVVMRkV0VWpNejM2MEJxbXAxNkx4akxzeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745390977),
('jPgMjACcLjrso5e1tQWb1BtpXTIOcG8WcO7Geg7X', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXhZQVphV243YjFzVEJlVlFIc1R1YW1kOTF3VXdMcjZncGtsU2FBbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745370646),
('JtnjEgl7LoJe6Au4JdGlWtPOZQEbCeQuvg1kAXV9', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzRqVGgya2VFRU5Nc3hUZHJKb1U1QXYza0hnUDI3UGVVajJEVFM0QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745393990),
('jvgXIdzQMugYwvubOuVQoQVBdicSWE5OOVntoysK', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHpGc0taWjJhc1VSbnN3eEZ5eXk1UnA3RzlMeG1FaTk4WlN6b2o3MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309064),
('jYWBAjXKRSSG7Hsvh0WodoTKlIP3XVbo8B5RBl4z', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjI2WmdMd3V3Rkl0ejZreXRua2FKT0lOVnJCcHBxVzFHSWFVQlNXMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745391225),
('KeoyTfzpXHySGeFK795HqGT0PIihGJ2DiUoUMY0X', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEYzSU1JT3FTaERSdHJ6TWV5OEF1M3VSbGlzazBQMjZVcjltdUI5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745308043),
('KznWGf04FApSQyp5KG9y0Rb1WWs5lANqAhkhuwGw', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDdLR29xOG9Eb0Z3V2poWlhyVzByeFJKS3RJUm1jZkJtTUxtVHFtaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745307489),
('lEonN4Z0EyqSmI17hgs4MzkR0TbtWCSrWK16njxb', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjhBM3F6Q3o4NlBXa1BscWZyakVadmhaNUpodmd2dURtVzROR3NYaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745371119),
('M2tTCajDk7j6KlegJlp3crPfav0gEVPEjmtCvcKR', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1JZZjBBRmJlQnZ0dVpObzV5bk1uTGtHV3E2YUxBMThwcHBnSXZ4ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745311798),
('McFm1e70hWbXif6YsSsujhpkzQDEzaYOZLEIWWRg', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemtPRnRhb3RKWVVvUHFzWjduTWpNSGtTWHF3MzVxdm5oS0JNaWxNbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745368931),
('mQxxFoI1D3fXNtnvlxHkjnWN92FqsKTHAQocKF3L', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmcxbkxwZkdWdlpyNHEwUnJ1U2lwWm9HakNWOFk5dW13VG05Z2VkbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745311796),
('NtFZ8Hx83qncApNjuQamanJ1DHoHhZZbA22CGE31', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2N1Wmc0SVM4WXppd2l5U3c4ZjJ2cTZiWkd2Q1hXdFg3aUF1WmRUMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745312967),
('o6JyIuU3O3c1zXldCSbqqDxYbh34Pd99MXnLz5fY', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHdISk1FR3gwWVNTelhkQVpPc2JqM2lTWDRpUUR4QlRWOWU0V2VlaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306384),
('OccOMruRl3K05yl1EvARhG3dxtcfXhROjyCoY4OD', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVpnOTBtMTdZaEU5NlBUdHExMDk0Q1RETWRqYk93SzZub0p4ZlU5eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309313),
('OZ4JClOPb54WRhUew1QeIbllMnz0sTzFrlZXDcU0', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGwzQ0pYNzR1VFJTOUc2cVlEU2YyOXRSajJYeEdKVkVxOHJBdnk4dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745370038),
('pnPHR4jw8djGtqTYgLzwMB8VsQpGm2puY2UKBqmT', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGNHM3RLdU9jSzRKNXQ1RGtaWURuZFRlc01RWVRQNkFZdWJYaGljSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745393857),
('q6KQrzJPxCFYfL9GoLUQPoTdoQPhv247OiebROJ0', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlRDVkNLaVRyR3loTHV3Y290NW82QjQ2YlRaU1JIVG9vTG50NlhtcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306414),
('QRQWqcszez6dvDGDmU46EZStuVQL6GLn9lB9lKaA', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDhMMVA0WkkwTjVTdGlnNkMzTlNHVUx1SHcxMEllWkJxM01EZFlRViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745313309),
('QRX9nl94g5h4xBMX35CxuvKumCCfmHmI3KdC4NQb', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWVCVVpBTHFMa1BLWTBBWUo1NHdSYWp6dENMRXo2Z2F6SU1WRVlzYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306724),
('RC8FYn6j1LJaCaHWB1iCSu2UthvfuV3WJAXqgSuJ', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkxUaTlxc05LNkprcmVkZE5VMjJ1bVlyMUxlcUNrVXJYNlZaQnpkVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745382665),
('TAizIryYRvRQ4LPZZcc40gViO90GRLJmMWdstGo7', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEJwQjYyTFRvRHFTMGpOZURSd0ttNzVoSXhkazFGQ09haTM3NUV1UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745313321),
('tgylHbeoo3YxbOdt3OiIrgE5l76sDzKP1xdE2lIc', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGtOYkRadWtqTzRGaVRvbXVmbW1XbExKcXg2clpCa2NudVlUTEsxVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745311986),
('TlX2r31Zfx6Z3TQhxrFJWisNOyY8DgxNpxnruSF3', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUdKZTRMbVQ2OVBXMnNmaUdHYms0V0Q1czFJYzROeGF2SjE3d01FdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745369943),
('twnzgrUOKiPurCCCdxGfrGboEzdaGHr9q7Cn8QHB', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmxhZVd5cDVRQ2VLTFZpWE5kMUVkSk5PYWtRRlV2N3VIaUcza3A5WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745312830),
('UeUi5EXGYEtdsJtqPo9CsI5LUkAK74xJ7sHYbfAs', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDV2alhnSFpQRUd5WHVEZWR5YmRhZlhLd3MzWWE5WE1RWlZHRzU2MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745313415),
('Uwhb294S9YhREmYZELmTCUa9WjDq33ZD8hliSuJG', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGg5S3Y1bVVNMkswT3k5YkRha0tlRUhudk55bkNMRDJuRXdVS2NLOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745312685),
('vCZYeShvcrNG5FswiZi4HToPE2WjJzTbVS46nQUW', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1lhWW9ad0FQU0NwMGFzSnNxU0pzeEVtTjFuTzlCUElua1VJVjJFaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745373604),
('vdL6hmAst9hXb1cI2tRHG2mSGi8UBwqh7NyXDJv3', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWI0ZktHU1hGY29uNm9RSFVZbEJxc3BIempKdVJ2VTNVTFpvZUVzZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745381931),
('vRoOurZxkFLuSVL5g916XS2CoxHEdFVVZbOsPCfA', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHhYVmlnWElxUVpwMXVQNFRlRG1jbkxlT1J3NHp5ZEZ5Z3QzNHV2TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745382375),
('vW4jT7HywDpPALit58qWT6W8ruW3FilzAuVjTnGj', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEN3RzZ0Y0xXdXhWWndDTGZzbDE3cnRQRjFETjJ1RkJ1Z0RiMUc4SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306457),
('WSNUk3PPXftby98Ja8yfF2qAWLexL9jP6x572jmh', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVVBYVFkR20weVlpVUVVTFBnRlhyZTF5UDFjUXd0bUVyWGxpM25laiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745311572),
('XeQBZuX3tIb0PGoyxFbnrsVayY1Q8e95jFz6Dr7n', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3dNUjRsVzlaaFhtbG5rVjJVdGpwZFg0TUx6UDlGOXNsellvOU1OOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745370124),
('xKGHkFs6jAJfCgylY3ve5kqfXQqtU94mX7kdX0af', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGxVVDVzNmlvV1lLV2o5UmhYU2dLUEtTV1VFQ0lwT1UxMDRrUVN6NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745307429),
('XrxBrSyWD67kRxPU8z5o4mLKrPCW3hIMdmyevxoS', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWl3WXdqWEk5WHVBSnBYS1M2MmlrQTFXTkVmellSZkNiTHhJN3JrTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309737),
('xTVe1ptC9pvdPqN6HRJmBpA83Rxle1voR0xBZ1lP', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1RtRnBBUnd2NWVXd2tyQ2FNQm5KMXk0T2c3dVpTdUZDbzdmMFZQdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309471),
('yErQdBN5zBwCHoDeyuYF1vHIxh114pLRfYMTuiKE', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDdzVHEzMjlTZzVncEh5Y2lRMThmMlpmM1QxcDRhTVdoNVZ4QzZQYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309001),
('yh1cgzulv6yo11WHLSVfoH4VoIVbilerAABrT0x7', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWRYcmJZVlpMcE9QOXhoNTQxNWVqWVUwNjNvMFB5MlRBOXo3c25nSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745392538),
('Z25hRq6cHHcqkld1ZPL74tukJ7kCz5scl42P8O2Q', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3Jab2FRZVhqUEJrTEM5QXFhYWtFRmI3U1RVeEg3cTBrTHkwMG13MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745311288),
('Z3ySxs5aIjyOe92tBlKmEk8OpQNit64lXoRTgA9i', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1hwSmI5dmo5aGhadWlkSHdaa0U5Y0k3ZE9sQ2JjVTg2dEdtM1FLSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306750),
('zrAWWPA80iUBiJur0IkeCGFGnMjkda2RhcvChqdG', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUpaMlloNGluVUszRHoxcHdud1NDZ1FJQTRXQmU0YmtleEZKVGpzUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745309214),
('zvJVvg10x9jLkcfyVQFDo86AAxxLyBJ09XQEJAqM', NULL, '127.0.0.1', 'Dart/3.5 (dart:io)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZERIaXljRXh1b2tHZXdzblRaaU5HWHNOcjRNZGY4eDZ5V0xJeXo0USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745306905);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status_schedule_collection`
--

CREATE TABLE `status_schedule_collection` (
  `id` int(11) NOT NULL,
  `scheduled` int(11) NOT NULL,
  `not_scheduled` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Quan Manh', 'nooi@quan.com', NULL, '$2y$12$vmTcScM9m5k7wxaANFedCujfbKVu33LkO2c2w6c5MqKqo/hguklD.', NULL, '2025-04-18 08:57:04', '2025-04-18 08:57:04'),
(2, 'Quan Manh', 'noi@quan.com', NULL, '$2y$12$rGTp4M6Bzr5K1cGUUpg6wOLBcckUkv7uOVOxuqawF9q0iul9yrl1e', NULL, '2025-04-19 02:24:43', '2025-04-19 02:24:43'),
(3, 'quan vanw', 'manh@gmail.com', NULL, '$2y$12$cdPHHB0huzqlzNJECQlBAurg5KfukThJWoxy/r17ZGMDxK.0mc6dK', NULL, '2025-04-19 03:19:49', '2025-04-19 03:19:49'),
(4, 'Quan Manh', 'quanmanh901@gmail.com', NULL, '$2y$12$aj4JRXcp3zto1I0Hw1VN6O74kIbH.vlCcpxo1Ule0K8tmWQc1Si16', NULL, '2025-04-20 07:27:28', '2025-04-20 07:27:28'),
(5, 'QManh', 'manini@gmail.com', NULL, '$2y$12$pnH9edvJvZkLO3xjM5OknOG1CDh0Vja/A.cxuGUCuFqRvDjxv.iaG', NULL, '2025-04-21 20:45:24', '2025-04-21 20:45:24'),
(6, 'hehe', 'q@gmail.com', NULL, '$2y$12$zXN9W4t.B.hcGDSdFCd2O.ZLDTgZ0FgaWO9zvcSr/oSIeKFoWQMfe', NULL, '2025-04-21 20:50:44', '2025-04-21 20:50:44'),
(7, 'hi', 'qiii@gmail.com', NULL, '$2y$12$DAGG3yYn.5ul/ukANI4fyOul3ICcKtWMxp/YzNnDk466Fbg88Wyom', NULL, '2025-04-21 20:52:34', '2025-04-21 20:52:34'),
(8, 'ooo', 'oo@gmail.com', NULL, '$2y$12$x6QuUvmhedDO98loFV/IuOD1/0HslODl.eZLjO1S0yimuhk.kjDou', NULL, '2025-04-21 20:56:23', '2025-04-21 20:56:23'),
(9, 'quanmanhh', '2@gmail.com', NULL, '$2y$12$v6Zjj.fzpIVMSwzopGwCBOttXIAbAKb1AC1rBC1Gb46Fpkp9PGx4S', NULL, '2025-04-21 21:00:28', '2025-04-21 21:00:28'),
(10, 'yyy', 'qm@gmail.com', NULL, '$2y$12$E1wJJCO6Gmx0cDGSC.luUuQnxw5IVghdB9XgEuccgsiMvoP7a8tyO', NULL, '2025-04-21 21:02:31', '2025-04-21 21:02:31'),
(11, 'uuuu', 'u@gmail.com', NULL, '$2y$12$m4vqS2FDqleXQgQEKaTksuflAGdLNcn/1XaNlcRT/3poJLxgckYx2', NULL, '2025-04-21 21:16:23', '2025-04-21 21:16:23'),
(12, 'bvbv', 'bv@gmail.com', NULL, '$2y$12$67SWT4ccBHG1sIDRJdJJnOGdDkw.0P9fT70DVhm.cj/BdvvKK6L9i', NULL, '2025-04-21 21:20:23', '2025-04-21 21:20:23'),
(13, 'okj', 'okj@gmail.com', NULL, '$2y$12$gLJPx/rQEgz0Ilo226fO9Omiz9qjZ5ET/seAbMj.XdUg/PnaOvfq6', NULL, '2025-04-21 21:25:14', '2025-04-21 21:25:14');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `img_schedule_collection`
--
ALTER TABLE `img_schedule_collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_collection_id` (`schedule_collection_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `merchandises`
--
ALTER TABLE `merchandises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_collection_id` (`schedule_collection_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `schedule_collection`
--
ALTER TABLE `schedule_collection`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `status_schedule_collection`
--
ALTER TABLE `status_schedule_collection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `not_scheduled` (`not_scheduled`),
  ADD KEY `scheduled` (`scheduled`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `img_schedule_collection`
--
ALTER TABLE `img_schedule_collection`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `merchandises`
--
ALTER TABLE `merchandises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=987666;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `schedule_collection`
--
ALTER TABLE `schedule_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `status_schedule_collection`
--
ALTER TABLE `status_schedule_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `img_schedule_collection`
--
ALTER TABLE `img_schedule_collection`
  ADD CONSTRAINT `img_schedule_collection_ibfk_1` FOREIGN KEY (`schedule_collection_id`) REFERENCES `schedule_collection` (`id`);

--
-- Các ràng buộc cho bảng `merchandises`
--
ALTER TABLE `merchandises`
  ADD CONSTRAINT `merchandises_ibfk_1` FOREIGN KEY (`schedule_collection_id`) REFERENCES `schedule_collection` (`id`);

--
-- Các ràng buộc cho bảng `status_schedule_collection`
--
ALTER TABLE `status_schedule_collection`
  ADD CONSTRAINT `status_schedule_collection_ibfk_1` FOREIGN KEY (`not_scheduled`) REFERENCES `schedule_collection` (`id`),
  ADD CONSTRAINT `status_schedule_collection_ibfk_2` FOREIGN KEY (`scheduled`) REFERENCES `schedule_collection` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

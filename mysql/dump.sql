-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 02 2021 г., 18:29
-- Версия сервера: 5.7.15
-- Версия PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `olegkey_testdb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `communications`
--

CREATE TABLE `communications` (
                                  `id` bigint(20) UNSIGNED NOT NULL,
                                  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
                                  `validator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                                  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                                  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `communications`
--

INSERT INTO `communications` (`id`, `name`, `type`, `validator`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Телефон', 'tel', 'min:11', '2021-02-02 14:37:13', '2021-02-02 14:37:13', NULL),
(2, 'Е-мейл', 'email', 'email', '2021-02-02 14:37:13', '2021-02-02 14:37:13', NULL),
(3, 'Ссылка', 'url', 'min:3', '2021-02-02 14:37:13', '2021-02-02 17:45:00', NULL),
(4, 'Комментарий', 'text', NULL, '2021-02-02 14:37:14', '2021-02-02 14:37:14', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
                            `id` bigint(20) UNSIGNED NOT NULL,
                            `order` int(10) UNSIGNED NOT NULL,
                            `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                            `com_type_id` bigint(20) UNSIGNED DEFAULT NULL,
                            `user_id` bigint(20) UNSIGNED DEFAULT NULL,
                            `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                            `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `order`, `value`, `com_type_id`, `user_id`, `created_at`, `updated_at`) VALUES
(4, 1, 'wrong@mail.ru', 2, 2, '2021-02-02 14:37:19', '2021-02-02 14:37:19'),
(5, 2, 'https://www.wrong.link/', 3, 2, '2021-02-02 14:37:19', '2021-02-02 14:37:19'),
(9, 1, '+79072717788', 1, 1, '2021-02-02 14:49:02', '2021-02-02 18:28:44'),
(10, 2, 'correct@mail.ru', 2, 1, '2021-02-02 14:49:02', '2021-02-02 18:28:53'),
(11, 3, 'Звонить с 10 до 18', 4, 1, '2021-02-02 14:49:02', '2021-02-02 14:49:02'),
(12, 4, 'www.mail.ru', 3, 1, '2021-02-02 14:49:02', '2021-02-02 14:49:02');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
                               `id` bigint(20) UNSIGNED NOT NULL,
                               `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                               `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
                               `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
                               `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                              `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2021_01_31_124616_create_orders_table', 2),
(16, '2021_02_01_191010_create_communications_table', 3),
(17, '2021_02_01_191615_create_contacts_table', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
                                       `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                       `user_id` bigint(20) UNSIGNED DEFAULT NULL,
                                       `client_id` bigint(20) UNSIGNED NOT NULL,
                                       `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                       `scopes` text COLLATE utf8mb4_unicode_ci,
                                       `revoked` tinyint(1) NOT NULL,
                                       `created_at` timestamp NULL DEFAULT NULL,
                                       `updated_at` timestamp NULL DEFAULT NULL,
                                       `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0110c4ad03964064b57d60ce9006d146aff360eefe844977ccbd04cf008f97ef9a372066adc076fa', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:27:21', '2021-02-01 22:27:21', '2021-02-03 01:27:21'),
('0148616a2c2f53179a88a5c2cb25024b1d3920429a4cc0ab2f98ad58efecde2b8f713a749c92e71f', 1, 1, 'Laravel', '[]', 0, '2021-01-30 20:28:57', '2021-01-30 20:28:57', '2021-01-31 23:28:57'),
('03f622e63d9e2125aab136a3502982da732e000d7080326e3464186cfc16930f36e02b3ec731dc8b', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:21:20', '2021-02-02 13:21:20', '2021-02-03 16:21:20'),
('06f6552d9bb0d52df73530b35bc9faf5b45ac0d2eb9e1ec551b88a88992562e75cf265e7ae96e1d4', 1, 1, 'Laravel', '[]', 0, '2021-01-31 09:26:52', '2021-01-31 09:26:52', '2021-02-01 12:26:52'),
('0758ecb8c4cbb9d522b298da20163ec1f5687b524955402de9724aa1b38418396933bf75e5b5d9fc', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:03:02', '2021-01-31 18:03:02', '2021-02-01 21:03:02'),
('0ae0278c2f36d4dadc42ba0b4f4f4129cc7cef1b38635c40fe5c4b79fd510cdc804e00abe3ce1cf6', 1, 1, 'Laravel', '[]', 0, '2021-02-01 12:41:12', '2021-02-01 12:41:12', '2021-02-02 15:41:13'),
('0bb2514ada10bc18665783710712b8df54c177d2aace43ad0c7c41de889e79acbf145ecfab0e83ed', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:42:42', '2021-01-30 21:42:42', '2021-02-01 00:42:42'),
('0e07338998fbd70e761d6079e438116913b3bac3d6507732b3a8f5f924cf36c247f7c25ceb051787', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:41:50', '2021-02-02 14:41:50', '2021-02-03 17:41:51'),
('102d3ad7e94823130c814a5412435b9c05e981b6b8b77e5086fb4a9ba4b7e188262482155b07ef06', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:32:24', '2021-02-02 13:32:24', '2021-02-03 16:32:24'),
('170308bb45ce121a2c76a62dc53ba389d75e835d5241cefcba7986ebbe667193a9b3bab748818325', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:21:24', '2021-02-02 11:21:24', '2021-02-03 14:21:24'),
('1874cebbd1a7c09f80c6d71243b2b320359f16220a8ef10aa1ca5650d3666444b6ed6f48d152a8b6', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:30:16', '2021-02-02 14:30:16', '2021-02-03 17:30:17'),
('19246f6f51da4254347069a1cc27a51e926e715427a825c8daa29569d0241d64a9fba41497a3c7d6', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:14:52', '2021-02-01 22:14:52', '2021-02-03 01:14:52'),
('197e7df0f867079bd8a5a0eb31b3ad7d5d3edf73ad6a7be2ee2876827eab5395e6a0c2da7cda4522', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:04:29', '2021-02-02 10:04:29', '2021-02-03 13:04:29'),
('1a70f8daeacd5fa8a91e1e5c46a92b92b5246685127e8a428414ef411657a46336e5d1a413ffa0b3', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:39:39', '2021-02-02 14:39:39', '2021-02-03 17:39:39'),
('1cde50135aadd5a6673510dd48d63bc25dab6ec63ebc8525cba4a7e5b305cf4c3924c65ecb6dff53', 1, 1, 'Laravel', '[]', 0, '2021-02-01 20:50:59', '2021-02-01 20:50:59', '2021-02-02 23:50:59'),
('1ea09a82c0ddca9a1837306b48b7bb04a9d60e2a0304f026b3b5987b808b64601e669c2e623b8b05', 1, 1, 'Laravel', '[]', 0, '2021-01-31 09:39:57', '2021-01-31 09:39:57', '2021-02-01 12:39:57'),
('1ee9dd7f029372c2e31f631a0b8cab6d721ac882649684b3a5c25aa7a24c704c193225d8b3bc17be', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:18:06', '2021-02-02 14:18:06', '2021-02-03 17:18:06'),
('20192c3681cc21415bcfed1978070a9beb70a33ea04462493098870566eae7c171faaa1309a0fb32', 1, 1, 'Laravel', '[]', 0, '2021-02-02 15:17:14', '2021-02-02 15:17:14', '2021-02-03 18:17:14'),
('218236680aa97649a8c4b83c5d6efccc9469771971aa7dc7da3486b9ad7e762bcdbb0f67f71802f8', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:41:11', '2021-02-02 14:41:11', '2021-02-03 17:41:11'),
('226229a068a8fd58882b2776ed066628c52b457899c71d6cb8bb560d0475ec1940b9aabc98cd6bc4', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:58:12', '2021-02-02 09:58:12', '2021-02-03 12:58:12'),
('23494674f6fbc7acd38c7754ea21d91ca8bad538e70a334b85cb1c31f7a8a5ee1203113a67143af4', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:36:41', '2021-02-01 22:36:41', '2021-02-03 01:36:41'),
('245bab7b67bbba648c4707e3065459a68083213103e61f4feb43858cbdb62c3e975f172030b782f5', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:49:12', '2021-02-02 14:49:12', '2021-02-03 17:49:12'),
('284256a06b0d5904ba56550d4416a99955f8158afde670ad22b5bb130cdc745cf23e756cc414800d', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:46:04', '2021-02-02 10:46:04', '2021-02-03 13:46:05'),
('2857152dc81a06852441dc3e9c13bf191fcde0ffdc2d5fd465b8d4d7941e4c5fe4eccd6fbbce7db7', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:30:52', '2021-02-02 10:30:52', '2021-02-03 13:30:52'),
('2aaefccb842f15ef42501d0d556445849b1e947f7806474d1d35fad019e112ad991863bd9e4aa9a3', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:50:51', '2021-01-30 21:50:51', '2021-02-01 00:50:52'),
('2d5f7c0b7fe02b19ede4dea9a03366c13242ea420096de0c284598c0026a366e6d2f18a4ccd19306', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:13:59', '2021-02-01 22:13:59', '2021-02-03 01:13:59'),
('2fc3268b98ace8f04d1548e35b6866bbb40ed9a531a25bbb5d2060a73bbe2e891a0d9396e92c0b8a', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:04:26', '2021-01-31 18:04:26', '2021-02-01 21:04:27'),
('33e1802a83e53c09efeaf3e29e5d7af5d3276c2222e93b4791bdd726bdafaa683fe2c2407c2154a3', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:43:05', '2021-02-02 13:43:05', '2021-02-03 16:43:06'),
('356e5de1b5df27425679fd8c14a6d03c1ba7e22da914098b0428826306def7ea49c9bd9f70e812cf', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:48:47', '2021-02-02 11:48:47', '2021-02-03 14:48:48'),
('3bc44def399cd5d886aaf7dd6d0544d101454ba587e965c8f3ef2efb3fed95a7ad8e3ab709ca6327', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:58:49', '2021-02-02 10:58:49', '2021-02-03 13:58:49'),
('3d7e824e4b5e3c9e4dd921a5ed23379487aff3a737dc1adc7fae327f09f0e57191af0f1584a9e23b', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:19:26', '2021-02-02 14:19:26', '2021-02-03 17:19:26'),
('3edf4d12e55563ac8387bf677a59bce41c94dde73b127049459e2d199fdd3f56d31a0fb8d4d63170', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:40:24', '2021-02-02 14:40:24', '2021-02-03 17:40:24'),
('42b1c910b5ee3cb88e7e7b08250cb13ea47ac2239a7eb72534338afa77dec1942f657ac33f8e4c53', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:22:42', '2021-02-02 13:22:42', '2021-02-03 16:22:42'),
('43a186e554b18e117f072d01e9e2ad77775cdbb26988cb78ee8fbb9e021952f786d1708cfa23b21f', 1, 1, 'Laravel', '[]', 0, '2021-02-02 15:26:11', '2021-02-02 15:26:11', '2021-02-03 18:26:11'),
('44fbf9d0567cf694cb76ed79c2b2770a0eec9ff73fa5c009f610ebcc72ba2ec318cde7ce46a6c62e', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:32:35', '2021-02-02 11:32:35', '2021-02-03 14:32:36'),
('45720d801e8e13ec252fb39738a6c3ebc9a342f91c861d3d081f5cf927e890d27464e8f1e01dbf49', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:26:50', '2021-02-02 10:26:50', '2021-02-03 13:26:50'),
('4628aa62a6b7a2894767b8c4ac3008f4084f52afe420a077cc8e57addf46905c8a2b7b0199d82b1f', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:12:07', '2021-02-02 14:12:07', '2021-02-03 17:12:08'),
('4632169f0d17fcd7dbaa2ee67ccf82df8d6d6a51751e6b1367c64ee5bc81f6bf4fe3c77f2064392b', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:53:46', '2021-01-30 21:53:46', '2021-02-01 00:53:46'),
('4a7b8e89a241f30f5082c54648242aecc3b469c315ce2e889496af538792ad5669d025c95d79e95c', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:32:27', '2021-02-02 10:32:27', '2021-02-03 13:32:27'),
('4d8ae82eec9de71b8b28c1d448452645849fc6d1648592e408f0a04bc88f2df2fd6756165bf288b6', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:25:47', '2021-02-01 22:25:47', '2021-02-03 01:25:47'),
('4d9b159b9a41e9405b3cb7b2c17af743a83a90c4df247930c276ca7c639d91ae9ce2aed7107cdfe8', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:18:57', '2021-02-01 22:18:57', '2021-02-03 01:18:57'),
('50699e86062fc537945100d3d3e2e537225ef0d19cf6cc70f63426693b82c8c3d5927aecf7ac2507', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:29:19', '2021-02-02 13:29:19', '2021-02-03 16:29:19'),
('52eaedec74d16a91c97f4a5633e3f7697365f3ba8ef77acb824440531624222748a31bbd40349960', 1, 1, 'Laravel', '[]', 0, '2021-02-01 12:40:37', '2021-02-01 12:40:37', '2021-02-02 15:40:37'),
('56603ef10a4c3da738bedd514b40e5a9cec3db26fdb5fcad2b15632427ebfb82631b585846d3d3ad', 1, 1, 'Laravel', '[]', 0, '2021-01-30 19:44:08', '2021-01-30 19:44:08', '2021-01-31 22:44:08'),
('570e6e88c2fed3dd27361f47781b7e2c7d7bdd157dbcef78fe8cb2957068aa099d2c3486d6493a0a', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:36:18', '2021-01-30 21:36:18', '2021-02-01 00:36:18'),
('5804bd65caed4a1886ccabfc0bd137fbc68738204bab8a46476cd84cbcb9d7567a82823800471dea', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:53:08', '2021-02-02 13:53:08', '2021-02-03 16:53:09'),
('584c92d0af4e76b5600598718176e41c1b38354d47d154db5b661e2caa82ff35367612d93dee67e1', 1, 1, 'Laravel', '[]', 0, '2021-01-31 09:36:03', '2021-01-31 09:36:03', '2021-02-01 12:36:03'),
('5a5a284a7bbb6c5b92e688e0549c18fbd399633a95ace578935d4696e8bcc5b898d4b83db6f25385', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:11:43', '2021-02-01 22:11:43', '2021-02-03 01:11:44'),
('5b519f174210e577ac26a2487043518cb7b20074b192f5aae07b03a95cc0f1c462727abc2c972e45', 1, 1, 'Laravel', '[]', 0, '2021-01-31 08:31:07', '2021-01-31 08:31:07', '2021-02-01 11:31:07'),
('613faf41d7958e9cc302f84e531e9458aeb74f407f9f200205ac9b88f6a901eb7b5aed36a61e84e1', 1, 1, 'Laravel', '[]', 0, '2021-01-31 23:38:23', '2021-01-31 23:38:23', '2021-02-02 02:38:23'),
('64daa170f00751abaacc560eded5df93e75ec50d18a1b7a985a8f32784314262309d4e94a7990522', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:16:28', '2021-02-02 14:16:28', '2021-02-03 17:16:28'),
('68c1b51cf9188c74ea0f62a30d403769441ac5af8a6515f5d3f4a1007adc86b0e9f765ff1556307b', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:43:05', '2021-01-30 21:43:05', '2021-02-01 00:43:05'),
('6bffe020c5ae8baafc191b31e3892cd1d36ecf04f95693110893c2cbf3ff0c318dc24ca69fd886fa', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:27:56', '2021-02-02 11:27:56', '2021-02-03 14:27:56'),
('6e65fc00a66824aa5bc594483b1846fc2263124178380b8d5da633877a7a2c18ff3ae8f0408eff47', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:18:48', '2021-02-01 22:18:48', '2021-02-03 01:18:48'),
('6ede38da64b9be8323856b875b5bc3c45509f1a6e2845ed48bb9b6c4afaaf5d9f0d89e4242a23610', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:57:46', '2021-02-02 09:57:46', '2021-02-03 12:57:46'),
('7207a5eba648fd882e573e1a856265799675c0cdc4d955322959383b3e8dcd9b5d7f94e2d6991dbe', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:09:10', '2021-02-01 22:09:10', '2021-02-03 01:09:10'),
('73806df2d7d7618669baf12c441f96a9de6067a309d7f607a6fd4e0932aa1cbee88181280157a384', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:34:01', '2021-02-02 09:34:01', '2021-02-03 12:34:01'),
('7dfba7d8e1e6a64d1f322b5d8532244b87b365a3a297c4377de44b51b84dc45297b0583f6f9a6a31', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:14:25', '2021-02-02 09:14:25', '2021-02-03 12:14:26'),
('7f48de3bba61a2450706fd1f1977d8e6f2afb8634c813031a4d0fac8161e6bb5dd0628227c8042c8', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:37:31', '2021-02-02 14:37:31', '2021-02-03 17:37:31'),
('7f6cb850e42c3bf21294ceffb802b6c751e0eef345d23aa2b8fd190a8b42c632cdc794ff9266b78d', 1, 1, 'Laravel', '[]', 0, '2021-02-02 15:15:12', '2021-02-02 15:15:12', '2021-02-03 18:15:12'),
('8304debe36f0d1dcbbff733948fc2f6cd7c995b64a36feb389ec69a8f963169194bf4b311fcdb04b', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:34:11', '2021-02-02 13:34:11', '2021-02-03 16:34:11'),
('8328f9cc443aebda8a05990671787562dbb4b22ed847aae752cf895b1e1ad7f70741f4185762dc22', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:02:20', '2021-02-02 10:02:20', '2021-02-03 13:02:20'),
('83f7680ee246aa49e234b129c79309b9f68e3fb2c52bd17116dd9e68cfa2dca191c0c76faee08976', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:44:51', '2021-02-02 13:44:51', '2021-02-03 16:44:52'),
('84d52194cdfc5a26f4b24c7ce7e428338900f1b3f7d6f6b64d38a97e16d8482616c155b92d5baf12', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:53:37', '2021-02-02 13:53:37', '2021-02-03 16:53:38'),
('872d037e14f2b4d3475aa9c254d52347c2fe9126ce3312999743db139eff5e83c217669e32e68deb', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:22:34', '2021-02-02 14:22:34', '2021-02-03 17:22:34'),
('8ab8991a0f4636c9b7600eb267aa4b9ebcd8655ceecd0a2ff3aa18c386becde5df549ab65925a09a', 1, 1, 'Laravel', '[]', 0, '2021-01-30 20:15:11', '2021-01-30 20:15:11', '2021-01-31 23:15:11'),
('8c38af7ca16789bac0270ab8f6e477307d9b63c8adabda1f33cc64f5f6569d777d70ddcb92c9fb52', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:11:58', '2021-02-01 22:11:58', '2021-02-03 01:11:59'),
('8cb99aaa290589026a6615076d27ff3163d848008c6c6e130bb14d8eb80e34ec36b0a89c757f1b22', 1, 1, 'Laravel', '[]', 0, '2021-01-31 23:28:20', '2021-01-31 23:28:20', '2021-02-02 02:28:20'),
('8e4ca4e24df2cba87e2a5adfa20f017621ec14ca3d28bd15001b5aeea944e1ec1df7bcb59c4d7d96', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:20:46', '2021-02-02 09:20:46', '2021-02-03 12:20:46'),
('8e6980c8c8195fd3049504926299e1c9e046dae1bd144525fd4caaf287c0c6265fc75ad2db50c572', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:37:16', '2021-02-02 10:37:16', '2021-02-03 13:37:17'),
('90d5962577dba117465fd65fc2499356082ce474cf7c01aa73d166c5b8b229f1cb4a275093093660', 1, 1, 'Laravel', '[]', 0, '2021-02-01 12:45:36', '2021-02-01 12:45:36', '2021-02-02 15:45:36'),
('92cacfa3d4c6415097c6f29af2da4a0a811ddcc51e278f773ab41be89eb4e9bdeb27d3f60df18cfa', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:03:18', '2021-02-02 11:03:18', '2021-02-03 14:03:18'),
('9461a28c26265810b519a0cafb25ceeab87e5b550685f6137eceb2be21762cc9715e9944e8f8f1e7', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:23:12', '2021-02-02 09:23:12', '2021-02-03 12:23:12'),
('9466b9d93dc2aa49634520d01cd6f875fa4b9afa8350e8c5d73f619e18806ed09919d204492f7c65', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:09:25', '2021-01-31 18:09:25', '2021-02-01 21:09:25'),
('9587b4e9f168ad2109233448bd9bdeab4056eb4f4e2f47e826cb4d8b8d3734a133ab4ba5453da322', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:23:09', '2021-02-02 14:23:09', '2021-02-03 17:23:09'),
('95b060a1c99acb8caf87d63effb1e230e22db38aa64b4c969c8992d149db2ac4cdeb7e1d4d41ebce', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:50:06', '2021-02-02 13:50:06', '2021-02-03 16:50:06'),
('9a73050910d3b34937a8bfc041bef6a68265e6c99f221e9daec00d54321471b3d3d63d2065a4a2b2', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:56:06', '2021-02-02 11:56:06', '2021-02-03 14:56:06'),
('9b91f402b01e37a3613bb1f7308055d744f4769efc843f5fa1bb8a95e5b0f1cc91fe5c4c751da56d', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:54:14', '2021-02-02 11:54:14', '2021-02-03 14:54:14'),
('9bc616bd233a10d36cf8601900ef4f49c211d8255ecd304e9c308e8c82e7b066500cb30b7cb4558a', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:56:35', '2021-02-02 10:56:35', '2021-02-03 13:56:36'),
('9bda469803cc8862c48559ea0d715f55c42df925525fc1955e9e1a6a60f4fee6ef83350578109e74', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:44:06', '2021-02-02 14:44:06', '2021-02-03 17:44:06'),
('9cacfeee389291a8e7b1b83e5b4a0115184a86eab803531252fa776fa7f40c80ac9fa31dc7ca3436', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:18:39', '2021-02-02 14:18:39', '2021-02-03 17:18:39'),
('9d5b4e2df0a6c6b36619b4c189e095b6bb4db5376f49af0e8751075a617133ff0419c7b3f7368988', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:59:38', '2021-02-02 11:59:38', '2021-02-03 14:59:39'),
('a05d9054de93b7c4bbfabb13246e3d545c2f58deb5e9f36bf1366f0dd1718ccd8347d74b31478f7c', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:28:00', '2021-02-02 13:28:00', '2021-02-03 16:28:00'),
('a0fe0288bf478713063ae2f0a5a149027ad47af99f66f1c16539f2b2fdb63ca2f0089545a4e5b5b0', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:26:06', '2021-02-02 14:26:06', '2021-02-03 17:26:06'),
('a3d1e8c72d2df1bd83daff22aa09e135bfc7f2a396d48c90db233a5b2c046eebc89514877838c453', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:08:47', '2021-01-31 18:08:47', '2021-02-01 21:08:47'),
('a92ea47a1edb72f018e61952559c46791863ea1e580313c0b88742571821ffd67d7b0b40ba52262f', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:41:49', '2021-02-02 09:41:49', '2021-02-03 12:41:49'),
('ac5e358d35ac7bacd8649562b4de35e2aeae34e7da89357de9b65ae08c05a84ffcbd6a17632c0fc2', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:09:23', '2021-02-01 22:09:23', '2021-02-03 01:09:23'),
('accb51ac505bde1719353f44f440600400d3c4e21d802f9e7e43049b337e932969ee6f7cb7fdebff', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:16:59', '2021-02-02 14:16:59', '2021-02-03 17:17:00'),
('ad41400c6c9656ea17e28bd6225756fe6b6c6377cd36b60bb651ba284b92053b81721fa9861de9ea', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:12:11', '2021-01-31 18:12:11', '2021-02-01 21:12:11'),
('b108c19d7fe0bd91310d436f08601ab512b82eb586f487c30312ede4c5a6f11ae01e405b471e14e3', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:48:42', '2021-02-02 14:48:42', '2021-02-03 17:48:43'),
('b2210f09521bf4ea50f05c258a8f6c93fefd71e98653620f5d84b6ff01ee7ac06f36fa1227a44146', 1, 1, 'Laravel', '[]', 0, '2021-02-02 15:24:59', '2021-02-02 15:24:59', '2021-02-03 18:24:59'),
('b7758cd35346abdbfa265cfcf642678d105235b0e98e447a6539217ba4fcc865a1adf4ed84eb5789', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:17:09', '2021-02-02 13:17:09', '2021-02-03 16:17:09'),
('ba1a0f723bb7fc916bfb6aa68906782b63aad60876360cd9376eb9d1c4c2036c26e216e616621ab2', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:58:27', '2021-02-02 09:58:27', '2021-02-03 12:58:27'),
('bae4b9b07061b1f33749b9c04053026ef47c70d05d47085a7ec0e733666edda2d2e337ad726fbc67', 1, 1, 'Laravel', '[]', 0, '2021-01-30 20:31:02', '2021-01-30 20:31:02', '2021-01-31 23:31:03'),
('bb2f5fc1e31064ee569c616a4c5dcc5369d9c44a46459884eb9c8a1d12cf41df99deea8e32284d4e', 1, 1, 'Laravel', '[]', 0, '2021-02-02 12:15:20', '2021-02-02 12:15:20', '2021-02-03 15:15:20'),
('bf16e0c30b7e78e22dc547a426419dab9445ae7b837d721c0f827178fea00824f2703980db9e0196', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:42:37', '2021-02-02 13:42:37', '2021-02-03 16:42:37'),
('c57f7a2637326a293810cc33466f486ca49c4819bd956d8509dde9e7eb72b53ece7bebddd4a8263e', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:51:04', '2021-02-02 13:51:04', '2021-02-03 16:51:04'),
('cbb44737b1b350b39b4599a583a6364df918108ccfba2dece569ee0bb662ea32434155e98dbb5156', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:01:33', '2021-02-02 10:01:33', '2021-02-03 13:01:33'),
('d1650f8a18c3358b43e755b14e90e73091121928a504f0bcf30ba3e297e55f432d6064bc1dba3be8', 1, 1, 'Laravel', '[]', 0, '2021-02-02 15:24:10', '2021-02-02 15:24:10', '2021-02-03 18:24:10'),
('d26cc10f09d1e8ade3254ad2d003d3963e216ff1fbe3259d763091572a64a250498e3b62292438d4', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:22:41', '2021-02-02 11:22:41', '2021-02-03 14:22:41'),
('d2cfaa7d9dfa8854c1703558279f9d61c521a5e2b08df8c4e0b8ee1db121e2dcaf6acdffe14d703a', 1, 1, 'Laravel', '[]', 0, '2021-02-02 15:08:41', '2021-02-02 15:08:41', '2021-02-03 18:08:41'),
('d952c6416d85ca2dcbe2d6619ed81cea857032af377e497edaad1cfeb7ab111c602a59d94880ab3c', 1, 1, 'Laravel', '[]', 0, '2021-02-02 13:20:28', '2021-02-02 13:20:28', '2021-02-03 16:20:28'),
('dc167c021d7a5b99fcfcd61861ae71248b17d9178d4ef3b845590618e16fec09c48d4e09c5ae6113', 1, 1, 'Laravel', '[]', 0, '2021-01-30 15:32:16', '2021-01-30 15:32:16', '2021-01-31 18:32:16'),
('dfed3c01568c8d960ef4047578e71e5cb99ba991794dc35453eb86cd73a87decbb6912d9e663f870', 1, 1, 'Laravel', '[]', 0, '2021-02-01 22:19:15', '2021-02-01 22:19:15', '2021-02-03 01:19:15'),
('e1d24cd27f6bb10f6f0bdaacb63171e5b35fa2758a04ff78052faa504d2516592d018f8824f0f3b4', 1, 1, 'Laravel', '[]', 0, '2021-01-31 23:37:06', '2021-01-31 23:37:06', '2021-02-02 02:37:06'),
('e212c48fc9282bfe314509c15ad98899cc87b1e5402860bd835f4706b4136727231fd02288e5bfb3', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:27:32', '2021-02-02 14:27:32', '2021-02-03 17:27:32'),
('e34b93782e811e6c4c374fd80aa1c9e1a0b6a818ddb8248ef8be369e5618d5bb49e19eff57f8323a', 1, 1, 'Laravel', '[]', 0, '2021-02-02 15:03:58', '2021-02-02 15:03:58', '2021-02-03 18:03:58'),
('e4d9656728c00c09abf299a6f9b5f3fb1ddb51dc6eb8ce3f58fb2258b557340011a5152663177407', 1, 1, 'Laravel', '[]', 0, '2021-02-02 14:45:11', '2021-02-02 14:45:11', '2021-02-03 17:45:11'),
('e5bea2918f7ba4ca9b0c23e6a00595f8a12aa63d238b5b4c1d7e9e1e005a058b7de01eeab5ee9945', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:17:07', '2021-02-02 11:17:07', '2021-02-03 14:17:07'),
('e8584a1d3bc7e083e70b4d3758b3c3c101b3d3f71841c6c3dd4ead1581225e5679695055833b54a1', 1, 1, 'Laravel', '[]', 0, '2021-02-01 12:39:21', '2021-02-01 12:39:21', '2021-02-02 15:39:21'),
('f58bb9e08b68b0b2bdf8def4e204e320a226c73df4379a325b0aa92409ffb5b9d5d9a7bb46fddf56', 1, 1, 'Laravel', '[]', 0, '2021-02-02 09:26:28', '2021-02-02 09:26:28', '2021-02-03 12:26:28'),
('f6634fd4e2fd1d55214f87177b1d843747b3410d584a8e88d911a95e5765d3bea6322f618e3f87ca', 1, 1, 'Laravel', '[]', 0, '2021-02-02 10:00:06', '2021-02-02 10:00:06', '2021-02-03 13:00:06'),
('fad3aca91a4f5ae92fc83b840579f1ece67c7b003b16c801e14e0138c3711c2c07ce2d95840c05af', 1, 1, 'Laravel', '[]', 0, '2021-01-30 19:35:16', '2021-01-30 19:35:16', '2021-01-31 22:35:16'),
('fbc4d292e52976b003759ddcba111c0610d5657191f1c7081086bcdc4d510b775fe35a33ed0befbe', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:26:57', '2021-02-02 11:26:57', '2021-02-03 14:26:57'),
('fcd13e39e59097efb6ffe8f7c65f0e45f986522f436a3de9448743bbbbab76b7002d546715ba5b77', 1, 1, 'Laravel', '[]', 0, '2021-02-02 11:49:47', '2021-02-02 11:49:47', '2021-02-03 14:49:47'),
('fde44f375e835f0e42dfb8a79f7f4cac86baf5f1cb3c7df96c9a9aea71fc01718368e126060e9f15', 1, 1, 'Laravel', '[]', 0, '2021-01-30 20:29:33', '2021-01-30 20:29:33', '2021-01-31 23:29:33');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
                                    `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                    `user_id` bigint(20) UNSIGNED NOT NULL,
                                    `client_id` bigint(20) UNSIGNED NOT NULL,
                                    `scopes` text COLLATE utf8mb4_unicode_ci,
                                    `revoked` tinyint(1) NOT NULL,
                                    `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_clients`
--

CREATE TABLE `oauth_clients` (
                                 `id` bigint(20) UNSIGNED NOT NULL,
                                 `user_id` bigint(20) UNSIGNED DEFAULT NULL,
                                 `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                 `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
                                 `personal_access_client` tinyint(1) NOT NULL,
                                 `password_client` tinyint(1) NOT NULL,
                                 `revoked` tinyint(1) NOT NULL,
                                 `created_at` timestamp NULL DEFAULT NULL,
                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'L6RL6dmpgU5srMf4BMdBtvaX0NR4CHlevUCZyCCT', NULL, 'http://localhost', 1, 0, 0, '2021-01-30 12:19:55', '2021-01-30 12:19:55'),
(2, NULL, 'Laravel Password Grant Client', '9aXv4xdVqJgsvHJKSVf5eRVAHmbcjEwpGEgQ92Ek', 'users', 'http://localhost', 0, 1, 0, '2021-01-30 12:19:55', '2021-01-30 12:19:55');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
                                                 `id` bigint(20) UNSIGNED NOT NULL,
                                                 `client_id` bigint(20) UNSIGNED NOT NULL,
                                                 `created_at` timestamp NULL DEFAULT NULL,
                                                 `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-01-30 12:19:55', '2021-01-30 12:19:55');

-- --------------------------------------------------------

--
-- Структура таблицы `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
                                        `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                                        `revoked` tinyint(1) NOT NULL,
                                        `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
                          `id` bigint(20) UNSIGNED NOT NULL,
                          `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NEW',
                          `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                          `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `name`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Sapiente eaque non et non expedita.', 'NEW', '2019-06-30 00:03:27', '2019-11-23 08:19:56', NULL),
(2, 'Dolorem molestiae eum est minima aut.', 'CAN', '2019-01-02 17:31:15', '2019-07-22 08:59:30', NULL),
(3, 'Et itaque corrupti sed id.', 'NEW', '2019-01-11 09:52:13', '2020-06-22 19:26:02', NULL),
(4, 'Qui sed ut facilis temporibus numquam.', 'PRO', '2020-08-11 15:40:22', '2021-01-22 20:21:41', NULL),
(5, 'Libero sit accusamus rerum eum accusantium.', 'NEW', '2019-02-03 19:05:42', '2020-01-02 21:20:50', NULL),
(6, 'Recusandae error ea voluptates aspernatur.', 'PRO', '2019-04-28 17:53:21', '2020-01-20 19:39:53', NULL),
(7, 'Quaerat nam sapiente eveniet et commodi.', 'CAN', '2019-12-25 13:04:27', '2021-02-01 11:20:28', NULL),
(8, 'Ut exercitationem voluptas aut id incidunt.', 'CAN', '2020-01-19 13:50:37', '2020-05-04 14:15:00', NULL),
(9, 'In ea amet voluptatem minus expedita rerum ab mollitia.', 'NEW', '2018-12-18 20:26:31', '2020-11-27 16:31:35', NULL),
(10, 'In vitae hic atque nostrum perferendis.', 'CAN', '2019-05-05 04:17:33', '2020-04-17 05:40:24', NULL),
(11, 'Facere et impedit molestiae voluptatem omnis eligendi eos facere.', 'DON', '2019-07-13 08:45:17', '2021-01-27 20:26:19', NULL),
(12, 'Enim ea amet aliquid et ad est culpa.', 'PRO', '2019-12-04 21:46:44', '2019-12-24 03:00:43', NULL),
(13, 'Commodi qui distinctio culpa voluptas minus facilis modi.', 'PRO', '2019-04-25 03:10:37', '2020-03-22 10:26:18', NULL),
(14, 'Officiis officiis magni magni et.', 'PRO', '2019-10-02 05:42:38', '2020-11-28 10:20:29', NULL),
(15, 'Doloribus est aliquam in quo vitae dolorem.', 'PRO', '2020-10-24 08:40:53', '2020-11-22 09:29:46', NULL),
(16, 'Deserunt qui omnis repudiandae recusandae labore.', 'DON', '2019-04-01 10:34:40', '2020-02-04 02:15:13', NULL),
(17, 'Nesciunt debitis possimus voluptatem fugiat sapiente quod sunt.', 'CAN', '2020-11-19 06:22:48', '2020-12-02 19:04:52', NULL),
(18, 'Unde voluptas minus sunt quae.', 'CAN', '2020-05-31 13:31:40', '2020-10-21 23:44:06', NULL),
(19, 'Sed neque est consequuntur iste.', 'NEW', '2021-01-04 12:15:18', '2021-01-19 01:31:45', NULL),
(20, 'Sed odit corrupti rerum quod.', 'PRO', '2020-12-04 03:26:22', '2020-12-06 14:38:41', NULL),
(21, 'Nobis officiis voluptatum alias asperiores officia repellendus nesciunt.', 'DON', '2019-07-11 15:41:36', '2021-01-13 19:26:04', NULL),
(22, 'Officiis nulla delectus laborum earum.', 'PRO', '2018-12-22 02:09:24', '2019-10-31 14:39:58', NULL),
(23, 'Odit qui ut ex alias ut.', 'CAN', '2019-05-05 12:48:00', '2019-07-07 06:35:05', NULL),
(24, 'Repellat voluptas est tempore voluptatem.', 'NEW', '2019-08-29 21:30:59', '2019-11-17 00:30:22', NULL),
(25, 'Aliquam blanditiis quod sed.', 'DON', '2019-10-22 17:34:41', '2020-08-10 23:50:48', NULL),
(26, 'Dolores culpa nobis labore et voluptatum.', 'CAN', '2019-09-08 01:00:39', '2020-06-15 12:25:44', NULL),
(27, 'Voluptates in illo ex.', 'DON', '2019-12-22 04:47:39', '2020-04-12 07:31:39', NULL),
(28, 'Soluta eius omnis ut beatae est quia earum.', 'PRO', '2020-01-14 20:35:34', '2020-09-12 17:13:45', NULL),
(29, 'Distinctio aspernatur et dolor nulla error.', 'DON', '2019-10-06 17:47:41', '2020-02-14 00:35:10', NULL),
(30, 'Nam sed sunt qui ad sint.', 'DON', '2019-07-20 11:35:15', '2020-03-15 11:06:11', NULL),
(31, 'Qui qui quo esse voluptatem error veritatis qui repellendus.', 'PRO', '2019-06-10 16:08:00', '2020-12-28 00:30:58', NULL),
(32, 'Ut sed voluptates enim hic sint.', 'DON', '2020-11-17 13:44:49', '2021-01-22 03:43:56', NULL),
(33, 'Atque ipsam minus sit occaecati.', 'NEW', '2020-10-30 09:17:46', '2020-12-17 05:38:54', NULL),
(34, 'Ut non aut accusamus ad est doloremque.', 'DON', '2019-09-29 09:08:15', '2020-07-25 09:40:21', NULL),
(35, 'Assumenda ut eos tempore quis.', 'CAN', '2020-10-02 09:06:44', '2020-10-14 02:15:29', NULL),
(36, 'Maiores non adipisci quae nam et debitis.', 'NEW', '2020-05-27 12:32:30', '2020-06-22 14:36:39', NULL),
(37, 'Suscipit ab laborum esse blanditiis maxime.', 'DON', '2020-04-20 20:59:42', '2021-01-05 20:00:40', NULL),
(38, 'Id ex rerum unde et.', 'CAN', '2019-11-17 19:28:58', '2020-07-08 21:11:17', NULL),
(39, 'Nulla libero sed voluptas eum aut sapiente.', 'CAN', '2019-12-14 06:48:45', '2020-11-09 14:15:59', NULL),
(40, 'Modi qui natus eum facilis.', 'PRO', '2020-12-26 08:11:32', '2021-01-27 00:57:38', NULL),
(41, 'Pariatur eum dolorum suscipit cupiditate.', 'CAN', '2019-12-17 08:19:03', '2020-11-14 15:29:25', NULL),
(42, 'Fugit et commodi qui dolores dicta et.', 'PRO', '2019-11-14 12:05:01', '2020-07-28 07:51:49', NULL),
(43, 'Et rerum iste et rerum.', 'CAN', '2019-06-07 11:40:49', '2020-11-05 07:24:39', NULL),
(44, 'Saepe consequuntur rem praesentium.', 'DON', '2019-09-17 18:20:01', '2021-01-30 03:49:47', NULL),
(45, 'Consequatur ea et et quos nihil aliquam qui vel.', 'DON', '2019-10-15 06:19:52', '2019-11-24 13:34:25', NULL),
(46, 'Deserunt id vitae voluptas quia iure consectetur odit rerum.', 'CAN', '2020-08-26 07:11:24', '2021-01-04 07:38:00', NULL),
(47, 'Ea doloremque voluptate quia maxime necessitatibus consequatur molestiae.', 'CAN', '2020-07-04 11:57:57', '2020-11-16 16:40:18', NULL),
(48, 'Quae autem id consequatur.', 'PRO', '2019-01-16 13:39:45', '2019-03-07 15:16:11', NULL),
(49, 'Est corporis dolores facere iusto dolorum.', 'CAN', '2019-01-06 09:26:01', '2019-08-09 01:21:52', NULL),
(50, 'Rerum in recusandae nulla autem quod sint.', 'CAN', '2018-12-25 09:08:50', '2019-12-22 11:11:06', NULL),
(51, 'Error et quia facere accusamus impedit laudantium.', 'DON', '2019-01-20 08:08:26', '2019-03-23 00:59:59', NULL),
(52, 'Ea commodi vel voluptate eos nihil et.', 'PRO', '2020-10-30 02:30:55', '2020-11-06 09:55:31', NULL),
(53, 'Eius non error ratione aut repellat laborum quia.', 'CAN', '2020-05-23 15:49:07', '2020-05-31 06:31:30', NULL),
(54, 'Officia dicta id vel consequatur sed rerum tenetur nostrum.', 'DON', '2019-08-13 11:56:32', '2020-11-22 15:44:00', NULL),
(55, 'Optio incidunt assumenda rerum est voluptas.', 'NEW', '2020-06-02 08:55:30', '2020-11-12 21:27:55', NULL),
(56, 'Et sint aspernatur repellat.', 'DON', '2019-11-22 14:56:01', '2020-11-28 18:02:27', NULL),
(57, 'Nemo et quibusdam provident magnam.', 'NEW', '2019-01-03 10:12:20', '2019-08-06 08:25:17', NULL),
(58, 'Assumenda consectetur iste aliquid quibusdam aut.', 'CAN', '2020-05-21 09:08:54', '2020-09-10 16:33:53', NULL),
(59, 'A vitae et non necessitatibus architecto.', 'CAN', '2019-08-11 23:29:44', '2020-02-02 03:35:40', NULL),
(60, 'Ut ullam est nemo occaecati.', 'NEW', '2020-06-22 15:46:51', '2020-11-26 12:33:30', NULL),
(61, 'Consequatur quidem at modi quo sint.', 'DON', '2020-05-27 12:28:17', '2020-08-18 13:02:01', NULL),
(62, 'Et nobis quo fugit nihil nemo ducimus.', 'DON', '2020-07-18 02:14:34', '2020-11-25 15:00:55', NULL),
(63, 'Placeat sunt quidem expedita rem.', 'DON', '2019-03-24 03:27:29', '2020-06-21 21:27:54', NULL),
(64, 'Nulla in necessitatibus sunt culpa.', 'PRO', '2020-11-06 16:59:31', '2020-11-09 13:25:57', NULL),
(65, 'Quidem unde et molestiae voluptatibus animi sed culpa ut.', 'PRO', '2020-09-22 16:35:19', '2020-12-30 15:06:41', NULL),
(66, 'Expedita in itaque quibusdam natus delectus ipsam.', 'CAN', '2019-04-06 10:16:21', '2020-09-11 17:06:15', NULL),
(67, 'Qui quo eos qui nemo perspiciatis aliquam.', 'DON', '2020-01-04 13:48:12', '2020-05-31 06:27:06', NULL),
(68, 'Consequatur sed omnis omnis molestias et excepturi.', 'PRO', '2019-09-06 13:37:29', '2019-12-10 02:42:48', NULL),
(69, 'Quod quo et inventore eveniet pariatur qui enim est.', 'PRO', '2020-01-05 23:22:15', '2020-02-09 10:23:27', NULL),
(70, 'Sunt voluptatem cum amet.', 'CAN', '2020-01-21 06:49:31', '2020-01-28 11:08:38', NULL),
(71, 'Nulla molestias est nisi aut.', 'CAN', '2019-04-24 13:22:00', '2020-11-26 19:46:33', NULL),
(72, 'Porro et quibusdam molestias sed sint aut vel.', 'NEW', '2019-10-18 21:27:06', '2020-08-31 08:31:33', NULL),
(73, 'Doloribus qui placeat sunt vel odio consequatur quo.', 'PRO', '2021-01-15 19:19:04', '2021-01-27 09:14:45', NULL),
(74, 'Aut quam assumenda magni voluptatem non doloribus ea voluptas.', 'CAN', '2020-06-19 06:43:07', '2020-07-25 19:48:06', NULL),
(75, 'Quia voluptatem nulla quia possimus et.', 'DON', '2019-09-28 09:04:55', '2020-01-20 09:41:44', NULL),
(76, 'Exercitationem consectetur laudantium consectetur aut ex libero laboriosam provident.', 'CAN', '2019-03-07 01:22:20', '2020-08-10 07:19:37', NULL),
(77, 'Itaque velit tempora doloribus sint sint.', 'NEW', '2019-05-19 15:43:11', '2020-10-17 09:46:41', NULL),
(78, 'Officia laborum voluptate sit eveniet quas maiores molestiae.', 'NEW', '2020-06-16 11:23:00', '2020-10-06 20:56:18', NULL),
(79, 'Saepe asperiores et provident.', 'CAN', '2018-12-21 04:25:16', '2020-03-10 18:34:07', NULL),
(80, 'Voluptatem voluptatem et quas reiciendis expedita reprehenderit hic.', 'CAN', '2019-11-07 19:27:14', '2020-02-26 07:19:18', NULL),
(81, 'Ut ex voluptatem error asperiores quibusdam pariatur culpa.', 'PRO', '2021-01-29 10:58:26', '2021-01-31 06:20:31', NULL),
(82, 'Sed eaque eum quis voluptas qui.', 'DON', '2018-12-25 06:53:23', '2020-12-25 02:41:01', NULL),
(83, 'Fugit aperiam consequatur quia repellat adipisci eos.', 'NEW', '2019-12-09 01:30:36', '2020-03-20 19:20:38', NULL),
(84, 'Itaque sit perferendis expedita atque modi.', 'DON', '2020-06-25 11:46:35', '2020-11-26 04:25:41', NULL),
(85, 'Quia accusantium voluptatem aliquid provident et.', 'DON', '2019-08-19 18:11:36', '2020-08-03 08:54:50', NULL),
(86, 'Consequatur placeat nostrum aliquid impedit et qui magnam expedita.', 'CAN', '2019-06-18 02:52:49', '2021-01-01 05:18:38', NULL),
(87, 'Vel dolorem voluptate qui et.', 'CAN', '2019-11-02 11:07:52', '2020-09-17 02:58:29', NULL),
(88, 'Voluptas tempora molestiae velit.', 'NEW', '2020-11-09 15:21:49', '2020-12-07 05:32:15', NULL),
(89, 'Quia eum veritatis autem quas perferendis ipsam repellendus.', 'CAN', '2019-01-24 14:11:57', '2019-04-15 09:06:51', NULL),
(90, 'Veritatis non occaecati iusto saepe ducimus voluptas vel.', 'DON', '2020-07-11 18:55:25', '2020-11-17 13:46:26', NULL),
(91, 'Consequatur eius voluptate magni.', 'NEW', '2020-11-05 19:22:17', '2020-11-29 11:17:26', NULL),
(92, 'Repellendus labore aperiam ipsa velit et.', 'NEW', '2020-10-30 23:26:04', '2020-11-25 17:14:39', NULL),
(93, 'Adipisci nihil nobis dolorum quia in rerum sunt consequatur.', 'DON', '2020-04-17 01:58:09', '2020-06-08 07:02:59', NULL),
(94, 'Est dignissimos cumque odit iste ad deleniti distinctio.', 'PRO', '2020-10-24 16:54:25', '2020-12-02 18:42:34', NULL),
(95, 'Esse sed voluptas soluta nisi quo rem.', 'NEW', '2019-09-04 21:04:28', '2019-10-29 08:01:50', NULL),
(96, 'Consequatur facere eum consequuntur.', 'CAN', '2020-03-12 20:57:18', '2020-07-29 07:25:44', NULL),
(97, 'Ipsam unde exercitationem illo occaecati.', 'DON', '2020-04-16 19:55:20', '2020-11-21 12:04:47', NULL),
(98, 'Nihil recusandae nisi qui ipsum voluptatem iusto.', 'PRO', '2019-03-20 07:38:23', '2019-11-04 14:55:56', NULL),
(99, 'Voluptas qui suscipit fugiat reprehenderit sit.', 'CAN', '2019-04-02 14:27:48', '2020-06-19 01:30:38', NULL),
(100, 'Recusandae doloribus et ad repudiandae sed necessitatibus ratione ut.', 'NEW', '2019-09-24 06:08:40', '2021-01-05 00:18:08', NULL),
(101, 'Hic ea totam atque atque quo.', 'DON', '2020-08-15 20:33:24', '2020-10-16 01:34:31', NULL),
(102, 'Ut libero earum repellendus aliquam.', 'PRO', '2020-10-24 00:14:04', '2020-12-23 04:19:15', NULL),
(103, 'Voluptates atque odit rerum in quis.', 'PRO', '2020-07-20 04:02:41', '2021-01-21 02:29:53', NULL),
(104, 'Id architecto velit cum voluptate.', 'NEW', '2020-09-17 09:47:12', '2021-01-21 03:23:04', NULL),
(105, 'Ut est eligendi maxime eaque amet.', 'PRO', '2020-11-03 05:03:12', '2021-01-19 12:12:21', NULL),
(106, 'Nam consectetur iure voluptate corporis voluptates dolor temporibus consequuntur.', 'PRO', '2019-07-05 16:15:45', '2019-07-23 19:02:16', NULL),
(107, 'Architecto fugit adipisci qui culpa perferendis autem molestias ipsum.', 'NEW', '2019-06-11 23:33:25', '2020-07-25 05:43:39', NULL),
(108, 'Doloribus aut repudiandae asperiores et dolores delectus.', 'CAN', '2020-04-17 11:40:50', '2020-10-27 03:28:10', NULL),
(109, 'Quibusdam excepturi totam sint rerum voluptate.', 'PRO', '2020-07-01 15:50:29', '2020-10-30 12:20:29', NULL),
(110, 'Voluptatem in perferendis dolores et ut qui cumque.', 'NEW', '2020-05-07 11:24:04', '2021-01-16 08:00:25', NULL),
(111, 'Suscipit saepe non maxime itaque dignissimos.', 'NEW', '2020-12-27 20:24:14', '2021-01-23 17:59:03', NULL),
(112, 'Fuga officia ducimus totam ea qui.', 'DON', '2019-10-06 15:16:09', '2019-10-27 05:15:47', NULL),
(113, 'Atque facere occaecati aspernatur ipsum iste aut.', 'CAN', '2019-03-19 02:48:05', '2020-06-12 06:44:24', NULL),
(114, 'Est in ipsa blanditiis.', 'CAN', '2019-09-09 03:54:25', '2020-02-16 16:56:04', NULL),
(115, 'Quia quod consectetur nostrum vel in vel.', 'PRO', '2020-04-16 00:50:30', '2021-01-02 02:35:18', NULL),
(116, 'Consequuntur eos et quos et delectus voluptas necessitatibus.', 'CAN', '2020-10-18 13:00:37', '2021-01-09 20:41:32', NULL),
(117, 'Et sunt laborum aut nihil.', 'NEW', '2019-02-13 21:39:46', '2019-07-19 20:03:40', NULL),
(118, 'Error vel molestiae voluptatum.', 'PRO', '2020-04-22 00:51:14', '2020-06-13 09:13:35', NULL),
(119, 'Laboriosam iusto quidem voluptatem.', 'NEW', '2021-01-12 12:22:24', '2021-01-18 11:55:12', NULL),
(120, 'Omnis voluptatibus officiis nesciunt ut consequatur adipisci temporibus.', 'DON', '2020-09-29 11:49:51', '2020-11-19 03:06:10', NULL),
(121, 'Modi omnis saepe nostrum.', 'DON', '2019-06-22 15:05:47', '2020-09-01 19:42:22', NULL),
(122, 'Labore cupiditate eveniet sit maiores quo iusto culpa.', 'DON', '2019-12-21 07:44:00', '2020-02-14 20:22:54', NULL),
(123, 'Eveniet voluptatem blanditiis autem est vel numquam magnam laboriosam.', 'NEW', '2019-01-05 17:06:31', '2021-02-01 12:47:01', NULL),
(124, 'Non est fugit molestiae quas qui alias natus dolore.', 'CAN', '2020-09-07 22:11:28', '2021-01-02 08:45:08', NULL),
(125, 'Totam exercitationem labore eaque.', 'CAN', '2019-03-05 20:24:08', '2020-01-09 12:33:49', NULL),
(126, 'Laudantium iusto voluptas totam ea.', 'DON', '2019-04-15 18:54:17', '2019-09-15 00:48:57', NULL),
(127, 'Nam consectetur cum sit saepe quia voluptatibus omnis reiciendis.', 'NEW', '2019-08-14 11:30:55', '2020-02-11 06:03:14', NULL),
(128, 'Quo necessitatibus voluptas rerum qui sed voluptatem eaque et.', 'NEW', '2019-10-20 21:10:08', '2020-12-22 07:50:23', NULL),
(129, 'Aut omnis in atque qui natus enim.', 'DON', '2020-01-27 05:00:06', '2020-03-09 21:09:23', NULL),
(130, 'Suscipit maxime non eaque quas eos assumenda.', 'DON', '2020-05-19 23:37:31', '2020-12-24 03:45:40', NULL),
(131, 'Voluptas debitis voluptate cupiditate ut hic voluptatibus.', 'PRO', '2019-02-02 23:40:49', '2020-01-01 18:52:36', NULL),
(132, 'Culpa autem est beatae ea.', 'DON', '2019-05-14 18:38:00', '2020-05-17 13:51:51', NULL),
(133, 'Minima eos corrupti nam.', 'NEW', '2019-03-28 23:37:07', '2019-05-17 11:55:29', NULL),
(134, 'Reiciendis sed nulla blanditiis deleniti fuga cumque.', 'CAN', '2019-12-05 09:23:26', '2020-01-09 15:49:00', NULL),
(135, 'Sed veniam vitae minima.', 'PRO', '2020-01-07 13:14:30', '2020-09-29 11:44:16', NULL),
(136, 'Excepturi est sapiente praesentium et veritatis omnis minima.', 'NEW', '2020-11-11 05:35:59', '2021-02-01 12:47:02', NULL),
(137, 'Explicabo rerum ut asperiores quaerat earum tempore.', 'NEW', '2020-09-22 14:53:39', '2021-02-01 12:47:02', NULL),
(138, 'Dolor autem suscipit totam dicta ut.', 'DON', '2019-03-26 09:35:40', '2019-07-05 07:21:48', NULL),
(139, 'Omnis doloribus quis nemo molestias itaque ut aut est.', 'NEW', '2018-11-29 03:40:05', '2019-08-03 18:17:57', NULL),
(140, 'Est sit quod maiores et a distinctio.', 'DON', '2019-01-24 07:10:57', '2020-11-15 00:39:02', NULL),
(141, 'Tempora id nemo unde voluptas quis velit.', 'DON', '2019-07-04 05:13:49', '2020-05-15 05:56:50', NULL),
(142, 'Esse sint et veritatis velit cupiditate quia doloribus deleniti.', 'PRO', '2019-08-26 21:24:24', '2020-02-18 16:57:40', NULL),
(143, 'Aut ut in fugit ducimus aut quia maxime.', 'PRO', '2019-01-26 18:48:29', '2020-04-22 13:26:19', NULL),
(144, 'Eligendi quis dolor quaerat placeat.', 'DON', '2019-09-05 09:09:19', '2020-08-06 09:28:11', NULL),
(145, 'Odit et dolores ut enim.', 'PRO', '2019-04-05 13:28:30', '2020-08-09 19:52:01', NULL),
(146, 'Voluptatem necessitatibus voluptatum veniam.', 'DON', '2021-01-08 01:59:47', '2021-01-15 00:13:25', NULL),
(147, 'Eligendi aut ut placeat nobis quibusdam.', 'NEW', '2019-09-05 19:03:37', '2021-02-01 12:47:01', NULL),
(148, 'Sunt exercitationem qui iusto illum iste repellendus accusantium possimus.', 'CAN', '2019-09-30 07:58:21', '2019-12-28 18:39:10', NULL),
(149, 'Quis et modi iusto delectus.', 'NEW', '2020-08-21 01:15:49', '2020-10-10 13:33:06', NULL),
(150, 'Aut quasi et velit odio consectetur.', 'DON', '2021-01-06 17:07:45', '2021-01-31 03:43:28', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
                                   `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
                         `id` bigint(20) UNSIGNED NOT NULL,
                         `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email_verified_at` timestamp NULL DEFAULT NULL,
                         `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test@test.ru', NULL, '$2y$10$Ukqjt3feoTomPdUFK1leM.QeSIPBMvShkmQqNlW2HkXXgqjuDK01K', NULL, '2021-01-30 15:32:04', '2021-01-30 15:32:04'),
(2, 'Wrong User', 'wrong@wrong.ru', NULL, '$2y$10$Ukqjt3feoTomPdUFK1leM.QeSIPBMvShkmQqNlW2HkXXgqjuDK01K', NULL, '2021-02-01 21:00:00', '2021-02-01 21:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `communications`
--
ALTER TABLE `communications`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
    ADD PRIMARY KEY (`id`),
    ADD KEY `contacts_com_type_id_index` (`com_type_id`),
    ADD KEY `contacts_user_id_index` (`user_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
    ADD PRIMARY KEY (`id`),
    ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
    ADD PRIMARY KEY (`id`),
    ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
    ADD PRIMARY KEY (`id`),
    ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Индексы таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
    ADD PRIMARY KEY (`id`),
    ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
    ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
    ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `communications`
--
ALTER TABLE `communications`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT для таблицы `oauth_clients`
--
ALTER TABLE `oauth_clients`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `contacts`
--
ALTER TABLE `contacts`
    ADD CONSTRAINT `contacts_com_type_id_foreign` FOREIGN KEY (`com_type_id`) REFERENCES `communications` (`id`) ON DELETE SET NULL,
    ADD CONSTRAINT `contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

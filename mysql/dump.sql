-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 01 2021 г., 02:13
-- Версия сервера: 5.7.15
-- Версия PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- База данных: `olegkey_testdb`
--

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
(10, '2021_01_31_124616_create_orders_table', 2);

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
('0148616a2c2f53179a88a5c2cb25024b1d3920429a4cc0ab2f98ad58efecde2b8f713a749c92e71f', 1, 1, 'Laravel', '[]', 0, '2021-01-30 20:28:57', '2021-01-30 20:28:57', '2021-01-31 23:28:57'),
('06f6552d9bb0d52df73530b35bc9faf5b45ac0d2eb9e1ec551b88a88992562e75cf265e7ae96e1d4', 1, 1, 'Laravel', '[]', 0, '2021-01-31 09:26:52', '2021-01-31 09:26:52', '2021-02-01 12:26:52'),
('0758ecb8c4cbb9d522b298da20163ec1f5687b524955402de9724aa1b38418396933bf75e5b5d9fc', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:03:02', '2021-01-31 18:03:02', '2021-02-01 21:03:02'),
('0bb2514ada10bc18665783710712b8df54c177d2aace43ad0c7c41de889e79acbf145ecfab0e83ed', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:42:42', '2021-01-30 21:42:42', '2021-02-01 00:42:42'),
('1ea09a82c0ddca9a1837306b48b7bb04a9d60e2a0304f026b3b5987b808b64601e669c2e623b8b05', 1, 1, 'Laravel', '[]', 0, '2021-01-31 09:39:57', '2021-01-31 09:39:57', '2021-02-01 12:39:57'),
('2aaefccb842f15ef42501d0d556445849b1e947f7806474d1d35fad019e112ad991863bd9e4aa9a3', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:50:51', '2021-01-30 21:50:51', '2021-02-01 00:50:52'),
('2fc3268b98ace8f04d1548e35b6866bbb40ed9a531a25bbb5d2060a73bbe2e891a0d9396e92c0b8a', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:04:26', '2021-01-31 18:04:26', '2021-02-01 21:04:27'),
('4632169f0d17fcd7dbaa2ee67ccf82df8d6d6a51751e6b1367c64ee5bc81f6bf4fe3c77f2064392b', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:53:46', '2021-01-30 21:53:46', '2021-02-01 00:53:46'),
('56603ef10a4c3da738bedd514b40e5a9cec3db26fdb5fcad2b15632427ebfb82631b585846d3d3ad', 1, 1, 'Laravel', '[]', 0, '2021-01-30 19:44:08', '2021-01-30 19:44:08', '2021-01-31 22:44:08'),
('570e6e88c2fed3dd27361f47781b7e2c7d7bdd157dbcef78fe8cb2957068aa099d2c3486d6493a0a', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:36:18', '2021-01-30 21:36:18', '2021-02-01 00:36:18'),
('584c92d0af4e76b5600598718176e41c1b38354d47d154db5b661e2caa82ff35367612d93dee67e1', 1, 1, 'Laravel', '[]', 0, '2021-01-31 09:36:03', '2021-01-31 09:36:03', '2021-02-01 12:36:03'),
('5b519f174210e577ac26a2487043518cb7b20074b192f5aae07b03a95cc0f1c462727abc2c972e45', 1, 1, 'Laravel', '[]', 0, '2021-01-31 08:31:07', '2021-01-31 08:31:07', '2021-02-01 11:31:07'),
('68c1b51cf9188c74ea0f62a30d403769441ac5af8a6515f5d3f4a1007adc86b0e9f765ff1556307b', 1, 1, 'Laravel', '[]', 0, '2021-01-30 21:43:05', '2021-01-30 21:43:05', '2021-02-01 00:43:05'),
('8ab8991a0f4636c9b7600eb267aa4b9ebcd8655ceecd0a2ff3aa18c386becde5df549ab65925a09a', 1, 1, 'Laravel', '[]', 0, '2021-01-30 20:15:11', '2021-01-30 20:15:11', '2021-01-31 23:15:11'),
('9466b9d93dc2aa49634520d01cd6f875fa4b9afa8350e8c5d73f619e18806ed09919d204492f7c65', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:09:25', '2021-01-31 18:09:25', '2021-02-01 21:09:25'),
('a3d1e8c72d2df1bd83daff22aa09e135bfc7f2a396d48c90db233a5b2c046eebc89514877838c453', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:08:47', '2021-01-31 18:08:47', '2021-02-01 21:08:47'),
('ad41400c6c9656ea17e28bd6225756fe6b6c6377cd36b60bb651ba284b92053b81721fa9861de9ea', 1, 1, 'Laravel', '[]', 0, '2021-01-31 18:12:11', '2021-01-31 18:12:11', '2021-02-01 21:12:11'),
('bae4b9b07061b1f33749b9c04053026ef47c70d05d47085a7ec0e733666edda2d2e337ad726fbc67', 1, 1, 'Laravel', '[]', 0, '2021-01-30 20:31:02', '2021-01-30 20:31:02', '2021-01-31 23:31:03'),
('dc167c021d7a5b99fcfcd61861ae71248b17d9178d4ef3b845590618e16fec09c48d4e09c5ae6113', 1, 1, 'Laravel', '[]', 0, '2021-01-30 15:32:16', '2021-01-30 15:32:16', '2021-01-31 18:32:16'),
('fad3aca91a4f5ae92fc83b840579f1ece67c7b003b16c801e14e0138c3711c2c07ce2d95840c05af', 1, 1, 'Laravel', '[]', 0, '2021-01-30 19:35:16', '2021-01-30 19:35:16', '2021-01-31 22:35:16'),
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
(123, 'Eveniet voluptatem blanditiis autem est vel numquam magnam laboriosam.', 'CAN', '2019-01-05 17:06:31', '2019-05-06 14:40:48', NULL),
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
(136, 'Excepturi est sapiente praesentium et veritatis omnis minima.', 'CAN', '2020-11-11 05:35:59', '2020-11-19 16:47:52', NULL),
(137, 'Explicabo rerum ut asperiores quaerat earum tempore.', 'CAN', '2020-09-22 14:53:39', '2020-10-07 17:29:56', NULL),
(138, 'Dolor autem suscipit totam dicta ut.', 'DON', '2019-03-26 09:35:40', '2019-07-05 07:21:48', NULL),
(139, 'Omnis doloribus quis nemo molestias itaque ut aut est.', 'NEW', '2018-11-29 03:40:05', '2019-08-03 18:17:57', NULL),
(140, 'Est sit quod maiores et a distinctio.', 'DON', '2019-01-24 07:10:57', '2020-11-15 00:39:02', NULL),
(141, 'Tempora id nemo unde voluptas quis velit.', 'DON', '2019-07-04 05:13:49', '2020-05-15 05:56:50', NULL),
(142, 'Esse sint et veritatis velit cupiditate quia doloribus deleniti.', 'PRO', '2019-08-26 21:24:24', '2020-02-18 16:57:40', NULL),
(143, 'Aut ut in fugit ducimus aut quia maxime.', 'PRO', '2019-01-26 18:48:29', '2020-04-22 13:26:19', NULL),
(144, 'Eligendi quis dolor quaerat placeat.', 'DON', '2019-09-05 09:09:19', '2020-08-06 09:28:11', NULL),
(145, 'Odit et dolores ut enim.', 'PRO', '2019-04-05 13:28:30', '2020-08-09 19:52:01', NULL),
(146, 'Voluptatem necessitatibus voluptatum veniam.', 'DON', '2021-01-08 01:59:47', '2021-01-15 00:13:25', NULL),
(147, 'Eligendi aut ut placeat nobis quibusdam.', 'CAN', '2019-09-05 19:03:37', '2019-12-14 23:21:01', NULL),
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
(1, 'Test', 'test@test.ru', NULL, '$2y$10$Ukqjt3feoTomPdUFK1leM.QeSIPBMvShkmQqNlW2HkXXgqjuDK01K', NULL, '2021-01-30 15:32:04', '2021-01-30 15:32:04');

--
-- Индексы сохранённых таблиц
--

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
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

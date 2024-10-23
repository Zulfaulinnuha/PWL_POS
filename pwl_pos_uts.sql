-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 23 Okt 2024 pada 03.44
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pwl_pos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_11_023910_create_m_level_table', 1),
(6, '2024_09_11_024942_create_m_kategori_table', 2),
(7, '2024_09_11_025612_create_m_supplier_table', 3),
(8, '2024_09_11_030438_create_m_user_table', 4),
(9, '2024_09_11_032006_create_m_barang_table', 5),
(10, '2024_09_11_034235_create_m_barang_table', 6),
(11, '2024_09_11_034954_create_t_penjualan_table', 7),
(12, '2024_09_11_035826_create_t_stok_table', 8),
(14, '2024_09_11_040319_create_t_penjualan_detail_table', 9),
(15, '2024_10_21_163756_create_t_stok_table', 10),
(16, '2024_10_22_143836_add_avatar_to_m_user_table', 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_barang`
--

CREATE TABLE `m_barang` (
  `barang_id` bigint UNSIGNED NOT NULL,
  `kategori_id` bigint UNSIGNED NOT NULL,
  `barang_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barang_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_beli` int NOT NULL,
  `harga_jual` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_barang`
--

INSERT INTO `m_barang` (`barang_id`, `kategori_id`, `barang_kode`, `barang_nama`, `harga_beli`, `harga_jual`, `created_at`, `updated_at`) VALUES
(1, 1, 'BRG001', 'Sandal', 500000, 600000, NULL, NULL),
(2, 1, 'BRG002', 'Smartphone', 2000000, 4000000, NULL, NULL),
(3, 2, 'BRG003', 'Kaos', 65000, 100000, NULL, NULL),
(4, 2, 'BRG004', 'Kulot', 100000, 200000, NULL, NULL),
(5, 3, 'BRG005', 'Bolpoint', 2000, 5000, NULL, NULL),
(6, 3, 'BRG006', 'Kotak Pensil', 5000, 10000, NULL, NULL),
(7, 4, 'BRG007', 'Dimsum', 1000, 2000, NULL, NULL),
(8, 4, 'BRG008', 'Aqua 5Lt', 5000, 10000, NULL, NULL),
(9, 5, 'BRG009', 'Floridina', 3000, 5000, NULL, NULL),
(10, 5, 'BRG010', 'Ultramilk', 5000, 8000, NULL, NULL),
(11, 1, 'BRG1', 'Barang 1', 10000, 15000, NULL, NULL),
(12, 1, 'BRG2', 'Barang 2', 20000, 25000, NULL, NULL),
(13, 1, 'BRG3', 'Barang 3', 30000, 35000, NULL, NULL),
(14, 2, 'BRG4', 'Barang 4', 40000, 45000, NULL, NULL),
(15, 2, 'BRG5', 'Barang 5', 50000, 55000, NULL, NULL),
(84, 1, 'NMP-004', 'Sari Roti', 12000, 15000, '2024-10-18 07:39:47', NULL),
(85, 2, 'ZUA-004', 'Mie Indomie', 5000, 6000, '2024-10-18 07:39:47', NULL),
(86, 3, 'FRH-004', 'Baju Koko', 65000, 70000, '2024-10-18 07:39:47', NULL),
(87, 4, 'XYZ-004', 'Sabun Wardah', 16000, 18000, '2024-10-18 07:39:47', NULL),
(88, 5, 'RHM-004', 'Bubur Instan', 7000, 8000, '2024-10-18 07:39:47', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kategori`
--

CREATE TABLE `m_kategori` (
  `kategori_id` bigint UNSIGNED NOT NULL,
  `kategori_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_kategori`
--

INSERT INTO `m_kategori` (`kategori_id`, `kategori_kode`, `kategori_nama`, `created_at`, `updated_at`) VALUES
(1, 'KATB01', 'Elektronik', NULL, NULL),
(2, 'KAT002', 'Pakaian', NULL, NULL),
(3, 'KAT003', 'Alat Tulis', NULL, NULL),
(4, 'KAT004', 'Makanan', NULL, NULL),
(5, 'KAT005', 'Minuman', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_level`
--

CREATE TABLE `m_level` (
  `level_id` bigint UNSIGNED NOT NULL,
  `level_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_level`
--

INSERT INTO `m_level` (`level_id`, `level_kode`, `level_nama`, `created_at`, `updated_at`) VALUES
(1, 'ADM', 'Administrator', NULL, '2024-10-21 12:07:33'),
(2, 'MNG', 'Manager', NULL, NULL),
(3, 'STF', 'Staff/Kasir', NULL, NULL),
(7, 'ZUA', 'Resepsionis', '2024-10-04 06:23:51', '2024-10-04 06:23:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_supplier`
--

CREATE TABLE `m_supplier` (
  `supplier_id` bigint UNSIGNED NOT NULL,
  `supplier_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_supplier`
--

INSERT INTO `m_supplier` (`supplier_id`, `supplier_kode`, `supplier_nama`, `supplier_alamat`, `created_at`, `updated_at`) VALUES
(1, '001', 'Supplier 1', 'Jl. Widuri No.14', '2024-09-12 23:20:06', '2024-10-22 05:35:33'),
(2, '002', 'Supplier 2', 'Jl. Pacar No.18', '2024-09-12 23:20:06', '2024-10-22 05:35:45'),
(3, '003', 'Supplier 3', 'Jl. Kembang No.29', '2024-09-12 23:20:06', '2024-10-22 05:35:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`user_id`, `level_id`, `username`, `nama`, `password`, `avatar`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Administrator zulfa', '$2y$12$oicHaGL7PBSqd5QkY5SljeGZbssOmeSyRE14l4KChefi/hDnHhKRW', 'wyn22EjyVB0ydZxgdq4F84yEe9SNEECVFn7xQZQf.jpg', NULL, '2024-10-22 08:34:24'),
(2, 2, 'manager', 'Manager', '$2y$12$iqVowunQXl0PktNFnrMU6Oh6Iio7bVlxlZvc0OV4ucXzKwGoHEGnG', NULL, NULL, '2024-10-09 04:38:59'),
(3, 3, 'staff', 'Staff/Kasir', '$2y$12$KxY0mQrgTKRcRjRP4Gf0L.AQaF.IC4gpCnngGXMrmLDJYR8uJM7S.', NULL, NULL, '2024-10-09 04:39:27'),
(4, 3, 'customer-1', 'Pelanggan Pertama', '$2y$12$z2eobHbqjCmVdY754P5BXOaB9UrAiJOumeJ3oHvVeFObdVIbZliCy', NULL, NULL, '2024-09-13 04:21:43'),
(9, 2, 'manager_dua', 'Manager 2', '$2y$12$u02LZDoD8DckIkjoJtq4POZZSpNnaO9zCKBjpNemIfASdm5pAsxEm', NULL, NULL, NULL),
(15, 2, 'manager22', 'Manager Dua Dua', '$2y$12$whcqFexK3/Ooz11i2s7dw.y7K4vHcdaPJYMtF/ynXHrrtlbMcbrFi', NULL, '2024-09-17 20:19:20', '2024-09-17 20:19:20'),
(16, 2, 'manager33', 'Manager Tiga Tiga', '$2y$12$OHLF2k.1a.c4hLpN0DiHwu8B0QkCn/ipPs3N1OR.fZwktg30X6mfO', NULL, '2024-09-17 20:26:16', '2024-09-17 20:26:16'),
(17, 2, 'manager56', 'Manager55', '$2y$12$EAEjlS7y40vofSm.zqesvOOq9v8QDxAig4ItrFR0/GRwDP0tJD4fO', NULL, '2024-09-17 20:33:02', '2024-09-17 20:33:02'),
(22, 2, 'zulfa', 'zulfa ulinnuha', '$2y$12$iFGQLio7u57pHjulkrLGU.vz8V6tFT804JJyvOvcAZc8GKUbdC382', NULL, '2024-10-08 19:49:57', '2024-10-08 19:53:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_penjualan`
--

CREATE TABLE `t_penjualan` (
  `penjualan_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `pembeli` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjualan_kode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `penjualan_tanggal` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `t_penjualan`
--

INSERT INTO `t_penjualan` (`penjualan_id`, `user_id`, `pembeli`, `penjualan_kode`, `penjualan_tanggal`, `created_at`, `updated_at`) VALUES
(1, 1, 'Zulfaa', 'PJ12345', '2024-09-13 00:00:00', NULL, '2024-10-22 07:10:52'),
(2, 1, 'Arzy', 'PJ12346', '2024-09-13 08:28:16', NULL, NULL),
(3, 3, 'Ulin', 'PJ12347', '2024-10-23 00:00:00', NULL, '2024-10-21 03:46:03'),
(4, 2, 'Azaawo', 'PJ12348', '2024-09-18 00:00:00', NULL, '2024-10-22 07:28:51'),
(5, 3, 'Iqbal Arzy', 'PJ12349', '2024-09-19 00:00:00', NULL, '2024-10-22 06:58:03'),
(6, 1, 'Rahmat', 'PJ12350', '2024-09-13 08:28:16', NULL, NULL),
(7, 1, 'Sari', 'PJ12351', '2024-09-13 08:28:16', NULL, NULL),
(8, 1, 'Bungaa', 'PJ12352', '2024-09-13 00:00:00', NULL, '2024-10-22 07:11:34'),
(9, 1, 'Marniiww', 'PJ12353', '2024-09-13 00:00:00', NULL, '2024-10-22 07:32:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_penjualan_detail`
--

CREATE TABLE `t_penjualan_detail` (
  `detail_id` bigint UNSIGNED NOT NULL,
  `penjualan_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `harga` int NOT NULL,
  `jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `t_penjualan_detail`
--

INSERT INTO `t_penjualan_detail` (`detail_id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 15000, 3, '2024-10-21 21:40:07', '2024-10-22 07:10:52'),
(2, 2, 2, 20000, 5, '2024-10-21 21:40:08', '2024-10-21 21:40:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_stok`
--

CREATE TABLE `t_stok` (
  `stok_id` bigint UNSIGNED NOT NULL,
  `supplier_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `stok_tanggal` datetime NOT NULL,
  `stok_jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `t_stok`
--

INSERT INTO `t_stok` (`stok_id`, `supplier_id`, `barang_id`, `user_id`, `stok_tanggal`, `stok_jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 22, '2024-09-13 00:00:00', 110, '2024-10-21 03:00:00', '2024-10-21 11:25:12'),
(2, 2, 2, 2, '2024-09-13 09:00:00', 130, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(3, 3, 3, 3, '2024-09-13 09:00:00', 145, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(4, 1, 1, 1, '2024-09-13 08:21:20', 20, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(5, 2, 2, 1, '2024-09-13 08:21:20', 25, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(6, 3, 3, 1, '2024-09-13 08:21:20', 30, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(7, 1, 4, 1, '2024-09-13 08:21:20', 15, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(8, 2, 5, 1, '2024-09-13 08:21:20', 18, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(10, 1, 7, 1, '2024-09-13 08:21:20', 10, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(11, 2, 8, 1, '2024-09-13 08:21:20', 35, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(12, 3, 9, 1, '2024-09-13 08:21:20', 28, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(13, 1, 10, 1, '2024-09-13 08:21:20', 22, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(14, 2, 11, 1, '2024-09-13 08:21:20', 32, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(15, 3, 12, 1, '2024-09-13 08:21:20', 27, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(16, 1, 13, 1, '2024-09-13 08:21:20', 15, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(17, 2, 14, 1, '2024-09-13 08:21:20', 50, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(18, 3, 15, 1, '2024-09-13 08:21:20', 45, '2024-10-21 03:00:00', '2024-10-21 03:00:00'),
(19, 2, 2, 4, '2024-10-22 00:00:00', 25, '2024-10-21 11:27:44', '2024-10-21 11:27:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`barang_id`),
  ADD UNIQUE KEY `m_barang_barang_kode_unique` (`barang_kode`),
  ADD KEY `m_barang_kategori_id_index` (`kategori_id`);

--
-- Indeks untuk tabel `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`kategori_id`),
  ADD UNIQUE KEY `m_kategori_kategori_kode_unique` (`kategori_kode`);

--
-- Indeks untuk tabel `m_level`
--
ALTER TABLE `m_level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `m_level_level_kode_unique` (`level_kode`);

--
-- Indeks untuk tabel `m_supplier`
--
ALTER TABLE `m_supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `m_supplier_supplier_kode_unique` (`supplier_kode`);

--
-- Indeks untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `m_user_username_unique` (`username`),
  ADD KEY `m_user_level_id_index` (`level_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD PRIMARY KEY (`penjualan_id`),
  ADD UNIQUE KEY `t_penjualan_pembeli_unique` (`pembeli`),
  ADD KEY `t_penjualan_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `t_penjualan_detail_penjualan_id_index` (`penjualan_id`),
  ADD KEY `t_penjualan_detail_barang_id_index` (`barang_id`);

--
-- Indeks untuk tabel `t_stok`
--
ALTER TABLE `t_stok`
  ADD PRIMARY KEY (`stok_id`),
  ADD KEY `t_stok_supplier_id_index` (`supplier_id`),
  ADD KEY `t_stok_barang_id_index` (`barang_id`),
  ADD KEY `t_stok_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `barang_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT untuk tabel `m_kategori`
--
ALTER TABLE `m_kategori`
  MODIFY `kategori_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `m_level`
--
ALTER TABLE `m_level`
  MODIFY `level_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `m_supplier`
--
ALTER TABLE `m_supplier`
  MODIFY `supplier_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_penjualan`
--
ALTER TABLE `t_penjualan`
  MODIFY `penjualan_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  MODIFY `detail_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `t_stok`
--
ALTER TABLE `t_stok`
  MODIFY `stok_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `m_barang`
--
ALTER TABLE `m_barang`
  ADD CONSTRAINT `m_barang_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `m_kategori` (`kategori_id`);

--
-- Ketidakleluasaan untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `m_user_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `m_level` (`level_id`);

--
-- Ketidakleluasaan untuk tabel `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD CONSTRAINT `t_penjualan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  ADD CONSTRAINT `t_penjualan_detail_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barang` (`barang_id`),
  ADD CONSTRAINT `t_penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `t_penjualan` (`penjualan_id`);

--
-- Ketidakleluasaan untuk tabel `t_stok`
--
ALTER TABLE `t_stok`
  ADD CONSTRAINT `t_stok_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barang` (`barang_id`),
  ADD CONSTRAINT `t_stok_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `m_supplier` (`supplier_id`),
  ADD CONSTRAINT `t_stok_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

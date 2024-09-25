-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 25, 2024 at 02:03 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

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
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
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
(13, '2024_09_11_040319_create_t_penjualan_detail_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `m_barang`
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
-- Dumping data for table `m_barang`
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
(15, 2, 'BRG5', 'Barang 5', 50000, 55000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori`
--

CREATE TABLE `m_kategori` (
  `kategori_id` bigint UNSIGNED NOT NULL,
  `kategori_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_kategori`
--

INSERT INTO `m_kategori` (`kategori_id`, `kategori_kode`, `kategori_nama`, `created_at`, `updated_at`) VALUES
(1, 'KATB01', 'Elektronik', NULL, NULL),
(2, 'KAT002', 'Pakaian', NULL, NULL),
(3, 'KAT003', 'Alat Tulis', NULL, NULL),
(4, 'KAT004', 'Makanan', NULL, NULL),
(5, 'KAT005', 'Minuman', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_level`
--

CREATE TABLE `m_level` (
  `level_id` bigint UNSIGNED NOT NULL,
  `level_kode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_level`
--

INSERT INTO `m_level` (`level_id`, `level_kode`, `level_nama`, `created_at`, `updated_at`) VALUES
(1, 'ADM', 'Administrator', NULL, NULL),
(2, 'MNG', 'Manager', NULL, NULL),
(3, 'STF', 'Staff/Kasir', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_supplier`
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
-- Dumping data for table `m_supplier`
--

INSERT INTO `m_supplier` (`supplier_id`, `supplier_kode`, `supplier_nama`, `supplier_alamat`, `created_at`, `updated_at`) VALUES
(1, '1', 'Supplier 1', 'Jl. Widuri No.14', '2024-09-12 23:20:06', '2024-09-12 23:20:06'),
(2, '2', 'Supplier 2', 'Jl. Pacar No.18', '2024-09-12 23:20:06', '2024-09-12 23:20:06'),
(3, '3', 'Supplier 3', 'Jl. Kembang No.29', '2024-09-12 23:20:06', '2024-09-12 23:20:06');

-- --------------------------------------------------------

--
-- Table structure for table `m_user`
--

CREATE TABLE `m_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `level_id` bigint UNSIGNED NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_user`
--

INSERT INTO `m_user` (`user_id`, `level_id`, `username`, `nama`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Administrator jaringan', '$2y$12$QLDnjLwaoIjdvh4nv6/pIOhraDpEHguDSRHYfg8mwgBK8GH5t7tN.', NULL, '2024-09-18 02:43:43'),
(2, 2, 'manager', 'Manager', '$2y$12$eCg50qUirDTqKcFHQZt3HumFUcpbZMkIBt60fBTBUnQmy/OH0V/IK', NULL, NULL),
(3, 3, 'staff', 'Staff/Kasir', '$2y$12$OGJpnC2QLYZkJBH8Gvx3ROStBSptvmHrq7F2CTt2E7H86qy6NVSEa', NULL, NULL),
(4, 3, 'customer-1', 'Pelanggan Pertama', '$2y$12$z2eobHbqjCmVdY754P5BXOaB9UrAiJOumeJ3oHvVeFObdVIbZliCy', NULL, '2024-09-13 04:21:43'),
(9, 2, 'manager_dua', 'Manager 2', '$2y$12$u02LZDoD8DckIkjoJtq4POZZSpNnaO9zCKBjpNemIfASdm5pAsxEm', NULL, NULL),
(15, 2, 'manager22', 'Manager Dua Dua', '$2y$12$whcqFexK3/Ooz11i2s7dw.y7K4vHcdaPJYMtF/ynXHrrtlbMcbrFi', '2024-09-17 20:19:20', '2024-09-17 20:19:20'),
(16, 2, 'manager33', 'Manager Tiga Tiga', '$2y$12$OHLF2k.1a.c4hLpN0DiHwu8B0QkCn/ipPs3N1OR.fZwktg30X6mfO', '2024-09-17 20:26:16', '2024-09-17 20:26:16'),
(17, 2, 'manager56', 'Manager55', '$2y$12$EAEjlS7y40vofSm.zqesvOOq9v8QDxAig4ItrFR0/GRwDP0tJD4fO', '2024-09-17 20:33:02', '2024-09-17 20:33:02'),
(18, 2, 'manager12', 'Manager11', '$2y$12$5jtqCuaEkmj9BszasZ7JjuX01QwWNTasWLbwxdN5r91f26.i6eWam', '2024-09-17 20:37:29', '2024-09-17 20:37:29');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `t_penjualan`
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
-- Dumping data for table `t_penjualan`
--

INSERT INTO `t_penjualan` (`penjualan_id`, `user_id`, `pembeli`, `penjualan_kode`, `penjualan_tanggal`, `created_at`, `updated_at`) VALUES
(1, 1, 'Zulfa', 'PJ12345', '2024-09-13 08:28:16', NULL, NULL),
(2, 1, 'Arzy', 'PJ12346', '2024-09-13 08:28:16', NULL, NULL),
(3, 1, 'Ulin', 'PJ12347', '2024-09-13 08:28:16', NULL, NULL),
(4, 1, 'Nuha', 'PJ12348', '2024-09-13 08:28:16', NULL, NULL),
(5, 1, 'Iqbal', 'PJ12349', '2024-09-13 08:28:16', NULL, NULL),
(6, 1, 'Rahmat', 'PJ12350', '2024-09-13 08:28:16', NULL, NULL),
(7, 1, 'Sari', 'PJ12351', '2024-09-13 08:28:16', NULL, NULL),
(8, 1, 'Bunga', 'PJ12352', '2024-09-13 08:28:16', NULL, NULL),
(9, 1, 'Marni', 'PJ12353', '2024-09-13 08:28:16', NULL, NULL),
(10, 1, 'Fia', 'PJ12354', '2024-09-13 08:28:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_penjualan_detail`
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
-- Dumping data for table `t_penjualan_detail`
--

INSERT INTO `t_penjualan_detail` (`detail_id`, `penjualan_id`, `barang_id`, `harga`, `jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 13000, 2, NULL, NULL),
(2, 1, 2, 26000, 1, NULL, NULL),
(3, 1, 3, 38000, 3, NULL, NULL),
(4, 2, 4, 44000, 1, NULL, NULL),
(5, 2, 5, 57000, 2, NULL, NULL),
(6, 3, 6, 60000, 1, NULL, NULL),
(7, 3, 7, 75000, 1, NULL, NULL),
(8, 3, 8, 89000, 2, NULL, NULL),
(9, 4, 9, 93000, 3, NULL, NULL),
(10, 4, 10, 100000, 1, NULL, NULL),
(11, 5, 11, 117000, 2, NULL, NULL),
(12, 5, 12, 134000, 1, NULL, NULL),
(13, 5, 13, 130000, 2, NULL, NULL),
(14, 6, 14, 144000, 1, NULL, NULL),
(15, 6, 15, 150000, 3, NULL, NULL),
(16, 7, 1, 15400, 1, NULL, NULL),
(17, 7, 2, 25500, 2, NULL, NULL),
(18, 7, 3, 35700, 1, NULL, NULL),
(19, 8, 4, 45400, 3, NULL, NULL),
(20, 8, 5, 55000, 2, NULL, NULL),
(21, 8, 6, 65000, 1, NULL, NULL),
(22, 9, 7, 75000, 1, NULL, NULL),
(23, 9, 8, 85000, 2, NULL, NULL),
(24, 9, 9, 95000, 3, NULL, NULL),
(25, 10, 10, 105000, 1, NULL, NULL),
(26, 10, 11, 115000, 2, NULL, NULL),
(27, 10, 12, 125000, 1, NULL, NULL),
(28, 10, 13, 135000, 1, NULL, NULL),
(29, 10, 14, 145000, 2, NULL, NULL),
(30, 10, 15, 155000, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_stok`
--

CREATE TABLE `t_stok` (
  `stok_id` bigint UNSIGNED NOT NULL,
  `barang_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `stok_tanggal` datetime NOT NULL,
  `stok_jumlah` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `t_stok`
--

INSERT INTO `t_stok` (`stok_id`, `barang_id`, `user_id`, `stok_tanggal`, `stok_jumlah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-09-13 09:00:00', 110, '2024-09-13 00:10:44', '2024-09-13 00:10:44'),
(2, 2, 2, '2024-09-13 09:00:00', 130, '2024-09-13 00:10:44', '2024-09-13 00:10:44'),
(3, 3, 3, '2024-09-13 09:00:00', 145, '2024-09-13 00:10:44', '2024-09-13 00:10:44'),
(34, 1, 1, '2024-09-13 08:21:20', 20, NULL, NULL),
(35, 2, 1, '2024-09-13 08:21:20', 25, NULL, NULL),
(36, 3, 1, '2024-09-13 08:21:20', 30, NULL, NULL),
(37, 4, 1, '2024-09-13 08:21:20', 15, NULL, NULL),
(38, 5, 1, '2024-09-13 08:21:20', 18, NULL, NULL),
(39, 6, 1, '2024-09-13 08:21:20', 40, NULL, NULL),
(40, 7, 1, '2024-09-13 08:21:20', 10, NULL, NULL),
(41, 8, 1, '2024-09-13 08:21:20', 35, NULL, NULL),
(42, 9, 1, '2024-09-13 08:21:20', 28, NULL, NULL),
(43, 10, 1, '2024-09-13 08:21:20', 22, NULL, NULL),
(44, 11, 1, '2024-09-13 08:21:20', 32, NULL, NULL),
(45, 12, 1, '2024-09-13 08:21:20', 27, NULL, NULL),
(46, 13, 1, '2024-09-13 08:21:20', 15, NULL, NULL),
(47, 14, 1, '2024-09-13 08:21:20', 50, NULL, NULL),
(48, 15, 1, '2024-09-13 08:21:20', 45, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD PRIMARY KEY (`barang_id`),
  ADD UNIQUE KEY `m_barang_barang_kode_unique` (`barang_kode`),
  ADD KEY `m_barang_kategori_id_index` (`kategori_id`);

--
-- Indexes for table `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`kategori_id`),
  ADD UNIQUE KEY `m_kategori_kategori_kode_unique` (`kategori_kode`);

--
-- Indexes for table `m_level`
--
ALTER TABLE `m_level`
  ADD PRIMARY KEY (`level_id`),
  ADD UNIQUE KEY `m_level_level_kode_unique` (`level_kode`);

--
-- Indexes for table `m_supplier`
--
ALTER TABLE `m_supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD UNIQUE KEY `m_supplier_supplier_kode_unique` (`supplier_kode`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `m_user_username_unique` (`username`),
  ADD KEY `m_user_level_id_index` (`level_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD PRIMARY KEY (`penjualan_id`),
  ADD UNIQUE KEY `t_penjualan_pembeli_unique` (`pembeli`),
  ADD KEY `t_penjualan_user_id_index` (`user_id`);

--
-- Indexes for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `t_penjualan_detail_penjualan_id_index` (`penjualan_id`),
  ADD KEY `t_penjualan_detail_barang_id_index` (`barang_id`);

--
-- Indexes for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD PRIMARY KEY (`stok_id`),
  ADD KEY `t_stok_barang_id_index` (`barang_id`),
  ADD KEY `t_stok_user_id_index` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `m_barang`
--
ALTER TABLE `m_barang`
  MODIFY `barang_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `m_kategori`
--
ALTER TABLE `m_kategori`
  MODIFY `kategori_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_level`
--
ALTER TABLE `m_level`
  MODIFY `level_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_supplier`
--
ALTER TABLE `m_supplier`
  MODIFY `supplier_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_user`
--
ALTER TABLE `m_user`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  MODIFY `penjualan_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  MODIFY `detail_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `t_stok`
--
ALTER TABLE `t_stok`
  MODIFY `stok_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `m_barang`
--
ALTER TABLE `m_barang`
  ADD CONSTRAINT `m_barang_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `m_kategori` (`kategori_id`);

--
-- Constraints for table `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `m_user_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `m_level` (`level_id`);

--
-- Constraints for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD CONSTRAINT `t_penjualan_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);

--
-- Constraints for table `t_penjualan_detail`
--
ALTER TABLE `t_penjualan_detail`
  ADD CONSTRAINT `t_penjualan_detail_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barang` (`barang_id`),
  ADD CONSTRAINT `t_penjualan_detail_penjualan_id_foreign` FOREIGN KEY (`penjualan_id`) REFERENCES `t_penjualan` (`penjualan_id`);

--
-- Constraints for table `t_stok`
--
ALTER TABLE `t_stok`
  ADD CONSTRAINT `t_stok_barang_id_foreign` FOREIGN KEY (`barang_id`) REFERENCES `m_barang` (`barang_id`),
  ADD CONSTRAINT `t_stok_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `m_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jun 2023 pada 07.47
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id_akun`, `username`, `email`, `password`) VALUES
(0, 'sulthan', 'sulthanfa86@gmail.com', '123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun_bank`
--

CREATE TABLE `akun_bank` (
  `id_akun_bank` int(11) NOT NULL,
  `nama_akun_bank` varchar(50) NOT NULL,
  `amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `akun_bank`
--

INSERT INTO `akun_bank` (`id_akun_bank`, `nama_akun_bank`, `amount`) VALUES
(1, 'BCA', 395500),
(2, 'BNI', 827000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL,
  `nama_bank` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `particulars` varchar(50) NOT NULL,
  `vch_no` varchar(50) NOT NULL,
  `vch_type` varchar(50) NOT NULL,
  `debit` varchar(20) NOT NULL,
  `credit` varchar(20) NOT NULL,
  `balance` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bank`
--

INSERT INTO `bank` (`id_bank`, `nama_bank`, `tanggal`, `particulars`, `vch_no`, `vch_type`, `debit`, `credit`, `balance`) VALUES
(2, 'BCA', '2023-06-13', 'sales', 'FS113', 'sales', '90000', '-', 270000),
(3, 'BNI', '2023-05-19', 'sales', 'FS144', 'sales', '73000', '-', 373000),
(4, 'BNI', '2023-06-13', 'Ads', 'FI443', 'income', '500000', '-', 873000),
(5, 'BNI', '2023-06-13', 'Oprasional', 'FE001', 'expense', '-', '23000', 850000),
(6, 'BNI', '2023-06-13', 'purchase', 'FP811', 'purchase', '-', '23000', 827000),
(7, 'BCA', '2023-06-13', 'sales', 'FS191', 'sales', '50500', '-', 320500),
(8, 'BNI', '2023-06-13', 'sales ', 'FS199 ', 'sales ', '75000 ', '- ', 395500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `expense`
--

CREATE TABLE `expense` (
  `expense_id` int(11) NOT NULL,
  `kode_expense` varchar(10) DEFAULT NULL,
  `expense_akun` varchar(100) DEFAULT NULL,
  `expense_date` date DEFAULT NULL,
  `nama_bank` varchar(20) NOT NULL,
  `total_expense` int(11) DEFAULT NULL,
  `narasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `expense`
--

INSERT INTO `expense` (`expense_id`, `kode_expense`, `expense_akun`, `expense_date`, `nama_bank`, `total_expense`, `narasi`) VALUES
(1, 'FE001', 'Oprasional', '2023-06-13', 'BNI', 23000, 'Test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `income`
--

CREATE TABLE `income` (
  `income_id` int(11) NOT NULL,
  `kode_income` varchar(50) DEFAULT NULL,
  `income_akun` varchar(100) DEFAULT NULL,
  `payment_income` varchar(100) DEFAULT NULL,
  `income_date` date DEFAULT NULL,
  `amount_income` int(11) DEFAULT NULL,
  `total_income` int(11) DEFAULT NULL,
  `narasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `income`
--

INSERT INTO `income` (`income_id`, `kode_income`, `income_akun`, `payment_income`, `income_date`, `amount_income`, `total_income`, `narasi`) VALUES
(1, 'FI443', 'Ads', 'BNI', '2023-06-13', 0, 500000, 'Ads');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `barang_id` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `tenggat` date NOT NULL,
  `cogs` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inventory`
--

INSERT INTO `inventory` (`barang_id`, `nama_barang`, `stock`, `tenggat`, `cogs`) VALUES
(1, 'BAJU', 8, '2023-06-13', 9000),
(2, 'CELANA', 66, '2023-06-02', 8000),
(3, 'Topi', 17, '2023-06-13', 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(11) NOT NULL,
  `kode_purchase` varchar(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `narasi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `kode_purchase`, `purchase_date`, `nama_barang`, `stock`, `amount`, `narasi`) VALUES
(1, 'FN091', '2023-06-13', 'CELANA', 40, 20000, 'test'),
(2, 'FP811', '2023-06-13', 'BAJU', 21, 23000, 'Test');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sales`
--

CREATE TABLE `sales` (
  `id_sales` int(11) NOT NULL,
  `kode_sales` varchar(50) NOT NULL,
  `sales_date` date NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `stock` int(20) NOT NULL,
  `ongkir` int(50) NOT NULL,
  `total_sales` int(50) NOT NULL,
  `narasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sales`
--

INSERT INTO `sales` (`id_sales`, `kode_sales`, `sales_date`, `nama_barang`, `stock`, `ongkir`, `total_sales`, `narasi`) VALUES
(1, 'FS113', '2023-06-13', 'BAJU', 12, 13000, 90000, 'test'),
(2, 'FS144', '2023-05-19', 'BAJU', 21, 13000, 73000, 'ads'),
(3, 'FS191', '2023-06-13', 'CELANA', 14, 9000, 50500, 'Test'),
(4, 'FS199', '2023-08-13', 'Topi', 17, 9000, 75000, 'Coba');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`);

--
-- Indeks untuk tabel `akun_bank`
--
ALTER TABLE `akun_bank`
  ADD PRIMARY KEY (`id_akun_bank`);

--
-- Indeks untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indeks untuk tabel `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indeks untuk tabel `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`income_id`);

--
-- Indeks untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indeks untuk tabel `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indeks untuk tabel `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id_sales`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akun_bank`
--
ALTER TABLE `akun_bank`
  MODIFY `id_akun_bank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `expense`
--
ALTER TABLE `expense`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `income`
--
ALTER TABLE `income`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `inventory`
--
ALTER TABLE `inventory`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `sales`
--
ALTER TABLE `sales`
  MODIFY `id_sales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 07:53 AM
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
-- Database: `birojasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_karyawan`
--

CREATE TABLE `data_karyawan` (
  `username` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `pass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_karyawan`
--

INSERT INTO `data_karyawan` (`username`, `nama`, `pass`) VALUES
('fufufafa', 'gibran', 'paripari');

-- --------------------------------------------------------

--
-- Table structure for table `data_user`
--

CREATE TABLE `data_user` (
  `username` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `data_user`
--

INSERT INTO `data_user` (`username`, `pass`) VALUES
('elfarizidan', '123');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `nama_layanan` varchar(100) NOT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  `harga` double NOT NULL,
  `st` tinyint(1) DEFAULT 0,
  `telp` varchar(20) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_kendaraan` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `username`, `nama_layanan`, `deskripsi`, `harga`, `st`, `telp`, `nama`, `alamat`, `nomor_kendaraan`) VALUES
(1, 'elfarizidan', 'Buat STNK', 'Tidak ada deskripsi', 350000, 1, '120310', 'zidan', 'fjajfjafjaj', 'B 1234 bc'),
(2, 'elfarizidan', 'Buat SIM', 'SIM A', 700000, 0, '123', 'zidan', 'fja141 ', '1525'),
(3, 'elfarizidan', 'Buat STNK', 'Tidak ada deskripsi', 350000, 0, '123', 'f', 'jkdwfnsk', 'b412'),
(7, 'elfarizidan', 'Buat SIM', 'SIM C', 600000, 0, '31491049', 'siapa hap', 'fj fadfiajifo', 'b 941 hjg');

-- --------------------------------------------------------

--
-- Stand-in structure for view `show_invoice`
-- (See below for the actual view)
--
CREATE TABLE `show_invoice` (
);

-- --------------------------------------------------------

--
-- Structure for view `show_invoice`
--
DROP TABLE IF EXISTS `show_invoice`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `show_invoice`  AS SELECT `invoice`.`id` AS `id_invoice`, `invoice`.`nama_customer` AS `nama_customer`, `data_karyawan`.`nama` AS `nama_karyawan`, `invoice`.`nama_layanan` AS `nama_layanan`, `invoice`.`deskripsi` AS `deskripsi`, `invoice`.`harga` AS `harga` FROM (`invoice` join `data_karyawan` on(`invoice`.`id_karyawan` = `data_karyawan`.`id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_karyawan`
--
ALTER TABLE `data_karyawan`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `data_user`
--
ALTER TABLE `data_user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`username`) REFERENCES `data_user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

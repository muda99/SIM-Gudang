-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 04:27 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_gudang`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` varchar(225) NOT NULL,
  `nama_barang` varchar(225) NOT NULL,
  `kode_barang` varchar(225) NOT NULL,
  `status_barang` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `nama_barang`, `kode_barang`, `status_barang`) VALUES
('782139', 'karbu bmw', '111', 'y'),
('89748', 'karbu suprax', '123', 'y'),
('BRG_662e42cff1971', 'win', 'win', ''),
('BRG_662e43613cb16', 'nx', 'nx', ''),
('BRG_662e437fc8215', 'aero', '1234', ''),
('BRG_662e49e2e9df5', 'kulkas', '12345', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_keluar`
--

CREATE TABLE `tb_barang_keluar` (
  `id` int(10) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang_keluar`
--

INSERT INTO `tb_barang_keluar` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `lokasi`, `kode_barang`, `nama_barang`, `satuan`, `jumlah`) VALUES
(1, 'WG-201713067948', '8/11/2017', '11/11/2017', 'NTB', '8888166995215', 'Ciki Walens', 'Dus', '50'),
(2, 'WG-201713067948', '8/11/2017', '11/12/2017', 'NTB', '8888166995215', 'Ciki Walens', 'Dus', '6'),
(3, 'WG-201713549728', '4/11/2017', '11/11/2017', 'Banten', '1923081008002', 'Buku Hiragana', 'Pack', '3'),
(4, 'WG-201774896520', '9/11/2017', '12/11/2017', 'Yogyakarta', '60201311121008264', 'Battery ZTE', 'Dus', '3'),
(5, 'WG-201727134650', '05/12/2017', '20/12/2017', 'Jakarta', '29312390203', 'Susu', 'Dus', '17'),
(6, 'WG-201810974628', '15/01/2018', '16/01/2018', 'Lampung', '1923081008002', 'Buku Nihongo', 'Dus', '50'),
(7, 'WG-201781267543', '7/11/2017', '17/01/2018', 'Yogyakarta', '97897952889', 'Buku Framework Codeigniter', 'Dus', '1'),
(8, 'WG-201832570869', '15/01/2018', '17/01/2018', 'Bali', '1923081008002', 'test', 'Dus', '10'),
(9, 'WG-201893850472', '15/01/2018', '18/01/2018', 'Bali', '1923081008002', 'lumpur nartugo', 'Pcs', '11'),
(10, 'WG-201781267543', '7/11/2017', '15/01/2018', 'Yogyakarta', '97897952889', 'Buku Framework Codeigniter', 'Dus', '1'),
(11, 'WG-201727134650', '05/12/2017', '15/01/2018', 'Jakarta', '29312390203', 'Susu', 'Dus', '3'),
(12, 'WG-201774896520', '9/11/2017', '15/01/2018', 'Yogyakarta', '60201311121008264', 'Battery ZTE', 'Dus', '3'),
(13, 'WG-201727134650', '05/12/2017', '16/01/2018', 'Jakarta', '29312390203', 'Susu', 'Dus', '1'),
(14, 'WG-201727134650', '05/12/2017', '17/01/2018', 'Jakarta', '29312390203', 'Susu', 'Dus', '1'),
(15, 'WG-201885472106', '18/01/2018', '19/01/2018', 'Riau', '8996001600146', 'Teh Pucuk', 'Dus', '50'),
(16, 'WG-201871602934', '18/01/2018', '16/03/2018', 'Papua', '312212331222', 'Kopi Hitam', 'Dus', '10');

--
-- Triggers `tb_barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `TG_BARANG_KELUAR` AFTER INSERT ON `tb_barang_keluar` FOR EACH ROW BEGIN
 UPDATE tb_barang_masuk SET jumlah=jumlah-NEW.jumlah
 WHERE kode_barang=NEW.kode_barang;
 DELETE FROM tb_barang_masuk WHERE jumlah = 0;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_masuk`
--

CREATE TABLE `tb_barang_masuk` (
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang_masuk`
--

INSERT INTO `tb_barang_masuk` (`id_transaksi`, `tanggal`, `lokasi`, `kode_barang`, `nama_barang`, `satuan`, `jumlah`) VALUES
('WG-202405194876', '22/04/2024', 'Surakarta', 'UT-202475134086', '782139', 'Dus', '23'),
('WG-202405374296', '31/12/1899', 'Surakarta', 'win', 'win', 'Pcs', '45'),
('WG-202447815260', '18/12/1899', 'Surakarta', '12345', 'kulkas', 'Pcs', '34'),
('WG-202482760315', '29/04/2024', 'Surakarta', '12345', 'kulkas', 'Pcs', '3');

-- --------------------------------------------------------

--
-- Table structure for table `tb_satuan`
--

CREATE TABLE `tb_satuan` (
  `id_satuan` int(11) NOT NULL,
  `kode_satuan` varchar(100) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_satuan`
--

INSERT INTO `tb_satuan` (`id_satuan`, `kode_satuan`, `nama_satuan`) VALUES
(1, 'Dus', 'Dus'),
(2, 'Pcs', 'Pcs'),
(5, 'Pack', 'Pack');

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id_supplier` varchar(225) NOT NULL,
  `supplier_nama` varchar(225) NOT NULL,
  `supplier_kontak` varchar(225) NOT NULL,
  `supplier_alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id_supplier`, `supplier_nama`, `supplier_kontak`, `supplier_alamat`) VALUES
('87987', 'CV Karbu Sejahtera', '09897889798', 'Solo'),
('879uu87', 'Sabar Motor', '0989788998', 'Solo');

-- --------------------------------------------------------

--
-- Table structure for table `tb_unit`
--

CREATE TABLE `tb_unit` (
  `id_unit` varchar(225) NOT NULL,
  `nama_unit` varchar(225) NOT NULL,
  `jumlah_unit` int(225) NOT NULL,
  `unit_tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_unit`
--

INSERT INTO `tb_unit` (`id_unit`, `nama_unit`, `jumlah_unit`, `unit_tgl`) VALUES
('111', 'BMW', 1, '2024-03-12'),
('123', 'Suprax', 2, '2024-03-12');

-- --------------------------------------------------------

--
-- Table structure for table `tb_upload_gambar_user`
--

CREATE TABLE `tb_upload_gambar_user` (
  `id` int(11) NOT NULL,
  `username_user` varchar(100) NOT NULL,
  `nama_file` varchar(220) NOT NULL,
  `ukuran_file` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_upload_gambar_user`
--

INSERT INTO `tb_upload_gambar_user` (`id`, `username_user`, `nama_file`, `ukuran_file`) VALUES
(1, 'zahidin', 'nopic5.png', '6.33'),
(2, 'test', 'nopic4.png', '6.33'),
(3, 'coba', 'logo_unsada1.jpg', '16.69'),
(4, 'admin', 'nopic2.png', '6.33');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `last_login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `last_login`) VALUES
(11, 'zahidin', 'riskididin@ymail.com', '$2y$10$WZYOZcN05JHriS09.C6o7evdWIJ3Obj7vNHzuLunFIAZCDJtG6W1C', 1, '17-03-2018 11:47'),
(12, 'husni', 'husni@gmail.com', '$2y$10$MXbWRsLw6S6xpyQu2/ZiEeB7oTCLrfEPpDcXWaszFVoYj.Yv51wG.', 0, '17-03-2018 11:19'),
(16, 'test', 'test@gmail.com', '$2y$10$CTjzvmT5B.dxojKZOxsjTeMc4E7.Gwl9slAgX.0lozwGrKSMxzWdO', 1, '16-03-2018 4:46'),
(17, 'coba', 'coba@gmail.com', '$2y$10$WRMyjAi8nnkr3J3QvzvyHuEoqay5dYd5NgMJKxsxtXKCp8.JCxZm.', 1, '15-01-2018 15:41'),
(20, 'admin', 'admin@gmail.com', '$2y$10$3HNkMOtwX8X88Xb3DIveYuhXScTnJ9m16/rPDF1/VTa/VTisxVZ4i', 1, '28-04-2024 16:05'),
(22, 'pengguna', 'masmudapradana@gmail.com', '$2y$10$7Y4amLFDUBkjF3NekwYioOPDKtKdvIFv6AQKprDYkoUk13vYUGwvu', 0, '28-04-2024 16:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang_masuk`
--
ALTER TABLE `tb_barang_masuk`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD PRIMARY KEY (`id_unit`);

--
-- Indexes for table `tb_upload_gambar_user`
--
ALTER TABLE `tb_upload_gambar_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_upload_gambar_user`
--
ALTER TABLE `tb_upload_gambar_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

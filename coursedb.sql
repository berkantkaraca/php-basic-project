-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2024 at 02:20 PM
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
-- Database: `coursedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategoriler`
--

CREATE TABLE `kategoriler` (
  `id` int(11) NOT NULL,
  `kategori_adi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategoriler`
--

INSERT INTO `kategoriler` (`id`, `kategori_adi`) VALUES
(1, 'PROGRAMLAMA');

-- --------------------------------------------------------

--
-- Table structure for table `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `user_type` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `username`, `email`, `password`, `date_added`, `user_type`) VALUES
(1, 'berkant', 'berkant@gmail.com', '$2y$10$8Zjqgfw3lhovJxvnd9Ok1ORpE53RG.9zIr/9w1PQAxbx6KLjMkABS', '2024-08-05 11:51:01', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `kurslar`
--

CREATE TABLE `kurslar` (
  `id` int(11) NOT NULL,
  `baslik` varchar(100) NOT NULL,
  `altBaslik` varchar(200) DEFAULT NULL,
  `aciklama` text DEFAULT NULL,
  `resim` varchar(50) DEFAULT NULL,
  `yorumSayisi` int(11) NOT NULL,
  `begeniSayisi` int(11) NOT NULL,
  `onay` tinyint(1) NOT NULL,
  `yayinTarihi` datetime NOT NULL DEFAULT current_timestamp(),
  `anasayfa` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kurslar`
--

INSERT INTO `kurslar` (`id`, `baslik`, `altBaslik`, `aciklama`, `resim`, `yorumSayisi`, `begeniSayisi`, `onay`, `yayinTarihi`, `anasayfa`) VALUES
(1, 'Angular Kursu', 'ileri seviye angular dersleri', NULL, '1.jpg', 10, 10, 1, '2024-08-04 10:24:25', 0),
(2, 'Angular Kursu', 'ileri seviye angular dersleri', NULL, '1.jpg', 10, 10, 1, '2024-08-04 10:24:25', 0),
(3, 'Angular Kursu', 'ileri seviye angular dersleri', NULL, '1.jpg', 10, 10, 1, '2024-08-04 10:24:25', 0),
(4, 'Angular Kursu', 'ileri seviye angular dersleri', NULL, '1.jpg', 10, 10, 1, '2024-08-04 10:24:25', 0),
(5, 'Yeni', 'Alt başlık', '&lt;p&gt;merhaba&lt;strong&gt;&amp;nbsp;sa&lt;/strong&gt;&lt;/p&gt;', '2.jpg', 0, 0, 1, '2024-08-05 09:49:32', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kurs_kategori`
--

CREATE TABLE `kurs_kategori` (
  `kurs_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kurs_kategori`
--

INSERT INTO `kurs_kategori` (`kurs_id`, `kategori_id`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `kurslar`
--
ALTER TABLE `kurslar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kurs_kategori`
--
ALTER TABLE `kurs_kategori`
  ADD PRIMARY KEY (`kurs_id`,`kategori_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kurslar`
--
ALTER TABLE `kurslar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kurs_kategori`
--
ALTER TABLE `kurs_kategori`
  ADD CONSTRAINT `kurs_kategori_ibfk_1` FOREIGN KEY (`kurs_id`) REFERENCES `kurslar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kurs_kategori_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

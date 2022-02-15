-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2021 at 05:58 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistemakademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kodejurusan` varchar(10) NOT NULL,
  `namajurusan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kodejurusan`, `namajurusan`) VALUES
('JAB', 'Administrasi Bisnis'),
('JIF', 'Teknik Informatika'),
('JKA', 'Komputerisasi Akuntansi'),
('JMI', 'Manajemen Informatika'),
('JSI', 'Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kodekelas` varchar(7) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kodekelas`, `nama_kelas`) VALUES
('1AB-01', '1AB-01'),
('1IF-01', '1IF-01'),
('1KA-01', '1KA-01'),
('1MI-01', '1MI-01'),
('1SI-01', '1SI-01');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nrp` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `alamat` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nrp`, `nama`, `phone`, `alamat`) VALUES
('123', 'Jovi', '081313162548', 'Bandung'),
('456', 'Julian', '081313162548', 'Bandung'),
('666', 'Drevilia', '081313162548', 'Bandung'),
('789', 'Stein', '081313162548', 'Bandung'),
('999', 'Hendri', '081313162548', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `idmapel` varchar(7) NOT NULL,
  `namamapel` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`idmapel`, `namamapel`) VALUES
('DB', 'Database'),
('GE', 'General English'),
('HR', 'Human Relation'),
('MPB', 'Manajemen Proses Bisnis'),
('PBO', 'Pemrograman Berorientasi Objek');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `kodenilai` varchar(10) NOT NULL,
  `idmapel` varchar(7) NOT NULL,
  `nrp` varchar(12) NOT NULL,
  `kodejurusan` varchar(10) NOT NULL,
  `kodekelas` varchar(7) NOT NULL,
  `nilaiuh` double NOT NULL,
  `nilaiuts` double NOT NULL,
  `nilaiuas` double NOT NULL,
  `nilaisiswa` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kodenilai`, `idmapel`, `nrp`, `kodejurusan`, `kodekelas`, `nilaiuh`, `nilaiuts`, `nilaiuas`, `nilaisiswa`) VALUES
('01', 'DB', '123', 'JMI', '1MI-01', 90, 90, 60, 80),
('02', 'GE', '123', 'JMI', '1MI-01', 80, 85, 90, 85),
('03', 'PBO', '123', 'JMI', '1MI-01', 100, 100, 100, 100),
('04', 'PBO', '456', 'JKA', '1KA-01', 100, 100, 100, 100),
('05', 'DB', '789', 'JAB', '1AB-01', 70, 60, 50, 60);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `password` text NOT NULL,
  `level` enum('mahasiswa','petugas','dosen','kaprodi') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `level`) VALUES
('000', '000', 'mahasiswa'),
('123', '123', 'mahasiswa'),
('1234', '1234', 'mahasiswa'),
('456', '456', 'mahasiswa'),
('666', '666', 'mahasiswa'),
('789', '789', 'mahasiswa'),
('999', '999', 'mahasiswa'),
('dosen', 'dosen', 'dosen'),
('kaprodi', 'kaprodi', 'kaprodi'),
('petugas', 'petugas', 'petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kodejurusan`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kodekelas`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nrp`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`idmapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`kodenilai`),
  ADD KEY `idmapel` (`idmapel`),
  ADD KEY `nis` (`nrp`,`kodejurusan`,`kodekelas`),
  ADD KEY `kodekelas` (`kodekelas`),
  ADD KEY `kodejurusan` (`kodejurusan`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`idmapel`) REFERENCES `mapel` (`idmapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`nrp`) REFERENCES `mahasiswa` (`nrp`),
  ADD CONSTRAINT `nilai_ibfk_3` FOREIGN KEY (`kodekelas`) REFERENCES `kelas` (`kodekelas`),
  ADD CONSTRAINT `nilai_ibfk_4` FOREIGN KEY (`kodejurusan`) REFERENCES `jurusan` (`kodejurusan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

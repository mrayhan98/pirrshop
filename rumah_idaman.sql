-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2018 at 06:01 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumah_idaman`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrasi`
--

CREATE TABLE `administrasi` (
  `idAdmin` int(11) NOT NULL,
  `namaAdmin` varchar(50) NOT NULL,
  `noTelp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kontraktor`
--

CREATE TABLE `kontraktor` (
  `idKontraktor` int(11) NOT NULL,
  `namaKontraktor` varchar(50) NOT NULL,
  `noTelp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE `laporan` (
  `idLaporan` int(11) NOT NULL,
  `idKontraktor` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `memesan`
--

CREATE TABLE `memesan` (
  `idPemesan` int(11) NOT NULL,
  `noKTP` varchar(16) NOT NULL,
  `noSHM` varchar(20) NOT NULL,
  `idAdmin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `noKTP` varchar(16) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `namaPembeli` varchar(30) NOT NULL,
  `noTelp` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rumah`
--

CREATE TABLE `rumah` (
  `noSHM` varchar(20) NOT NULL,
  `idKontraktor` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `harga` int(11) NOT NULL,
  `alamatRumah` varchar(50) NOT NULL,
  `luas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrasi`
--
ALTER TABLE `administrasi`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indexes for table `kontraktor`
--
ALTER TABLE `kontraktor`
  ADD PRIMARY KEY (`idKontraktor`);

--
-- Indexes for table `laporan`
--
ALTER TABLE `laporan`
  ADD PRIMARY KEY (`idLaporan`),
  ADD KEY `idKontraktor` (`idKontraktor`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- Indexes for table `memesan`
--
ALTER TABLE `memesan`
  ADD PRIMARY KEY (`idPemesan`),
  ADD KEY `noKTP` (`noKTP`),
  ADD KEY `noSHM` (`noSHM`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`noKTP`);

--
-- Indexes for table `rumah`
--
ALTER TABLE `rumah`
  ADD PRIMARY KEY (`noSHM`),
  ADD KEY `idKontraktor` (`idKontraktor`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`idKontraktor`) REFERENCES `kontraktor` (`idKontraktor`),
  ADD CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `administrasi` (`idAdmin`);

--
-- Constraints for table `memesan`
--
ALTER TABLE `memesan`
  ADD CONSTRAINT `memesan_ibfk_1` FOREIGN KEY (`noKTP`) REFERENCES `pembeli` (`noKTP`),
  ADD CONSTRAINT `memesan_ibfk_2` FOREIGN KEY (`noSHM`) REFERENCES `rumah` (`noSHM`),
  ADD CONSTRAINT `memesan_ibfk_3` FOREIGN KEY (`idAdmin`) REFERENCES `administrasi` (`idAdmin`);

--
-- Constraints for table `rumah`
--
ALTER TABLE `rumah`
  ADD CONSTRAINT `rumah_ibfk_1` FOREIGN KEY (`idKontraktor`) REFERENCES `kontraktor` (`idKontraktor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

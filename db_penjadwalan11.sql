-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2023 at 06:20 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjadwalan11`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `absen_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `absen_status` enum('Checkin','Checkout') NOT NULL,
  `absen_waktu` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `barang_id` int(11) NOT NULL,
  `ruang_id` int(11) NOT NULL,
  `barang_nup` varchar(100) DEFAULT NULL,
  `barang_nama` varchar(100) NOT NULL,
  `barang_merek` varchar(100) NOT NULL,
  `barang_kondisi` enum('Baik','Sedang','Buruk') NOT NULL DEFAULT 'Baik',
  `barang_keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `dosen_id` int(11) NOT NULL,
  `prodi_id` int(11) NOT NULL,
  `dosen_nip` varchar(25) NOT NULL,
  `dosen_nama` varchar(150) NOT NULL,
  `dosen_jabfung` varchar(50) NOT NULL,
  `dosen_jabatan` varchar(100) NOT NULL,
  `dosen_golongan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`dosen_id`, `prodi_id`, `dosen_nip`, `dosen_nama`, `dosen_jabfung`, `dosen_jabatan`, `dosen_golongan`) VALUES
(19, 184, '01', 'Ahmad', '', '', ''),
(20, 183, '02', 'Ichsan', '', '', ''),
(21, 184, '03', 'Siti Wulandari', '', '', ''),
(22, 186, '04', 'Ahmad Yulianto', '', '', ''),
(23, 187, '05', 'Dewi Susanti', '', '', ''),
(24, 188, '06', 'Budi Prasetyo', '', '', ''),
(25, 182, '07', 'Azizah Hamid', '', '', ''),
(26, 186, '08', 'Lina Handayani', '', '', ''),
(27, 184, '09', 'John Smith', '', '', ''),
(28, 183, '010', 'Emily Johnson', '', '', ''),
(29, 182, '011', 'Dini Saputri', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `dosen_jadwal`
--

CREATE TABLE `dosen_jadwal` (
  `dj_id` int(11) NOT NULL,
  `jadwal_id` int(11) DEFAULT NULL,
  `dosen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dosen_jadwal`
--

INSERT INTO `dosen_jadwal` (`dj_id`, `jadwal_id`, `dosen_id`) VALUES
(98, 165, 23),
(99, 166, 19),
(101, 168, 25),
(103, 170, 20),
(104, 171, 19),
(106, 172, 20),
(108, 174, 20),
(111, 176, 20),
(112, 177, 19),
(113, 177, 20),
(114, 178, 19),
(115, 179, 19),
(116, 180, 19),
(117, 181, 19),
(118, 181, 20),
(121, 182, 19),
(122, 182, 20),
(123, 183, 19),
(124, 183, 20),
(125, 184, 24),
(127, 185, 25),
(128, 186, 24),
(130, 187, 25),
(132, 189, 25),
(133, 188, 24),
(134, 190, 25),
(136, 191, 24),
(137, 192, 24),
(138, 193, 24),
(141, 194, 25),
(142, 195, 25),
(143, 196, 21),
(144, 196, 22),
(145, 197, 22),
(147, 199, 21),
(150, 200, 22),
(152, 201, 23),
(155, 202, 22),
(156, 203, 22),
(157, 198, 22),
(158, 167, 24);

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `fakultas_id` int(11) NOT NULL,
  `fakultas_nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`fakultas_id`, `fakultas_nama`) VALUES
(12, 'SMAN 1 Madang');

-- --------------------------------------------------------

--
-- Table structure for table `gedung`
--

CREATE TABLE `gedung` (
  `gedung_id` int(11) NOT NULL,
  `gedung_nama` varchar(100) NOT NULL,
  `gedung_lokasi` enum('madang1') DEFAULT NULL,
  `gedung_keterangan` text NOT NULL,
  `gedung_denah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gedung`
--

INSERT INTO `gedung` (`gedung_id`, `gedung_nama`, `gedung_lokasi`, `gedung_keterangan`, `gedung_denah`) VALUES
(25, 'Gedung L01', 'madang1', 'Gedung Laboratorium', '');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `jadwal_id` int(11) NOT NULL,
  `ta_id` int(11) DEFAULT NULL,
  `mk_id` int(11) NOT NULL,
  `ruang_id` int(11) NOT NULL,
  `dosen_id` int(11) DEFAULT NULL,
  `jadwal_kelas` varchar(50) NOT NULL,
  `jadwal_hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') DEFAULT NULL,
  `jadwal_jam_masuk` time NOT NULL,
  `jadwal_jam_keluar` time NOT NULL,
  `jadwal_sks` int(11) NOT NULL,
  `jadwal_semester` int(11) NOT NULL,
  `jadwal_status` enum('Terisi','Terpakai') NOT NULL DEFAULT 'Terisi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`jadwal_id`, `ta_id`, `mk_id`, `ruang_id`, `dosen_id`, `jadwal_kelas`, `jadwal_hari`, `jadwal_jam_masuk`, `jadwal_jam_keluar`, `jadwal_sks`, `jadwal_semester`, `jadwal_status`) VALUES
(165, 6, 86, 89, NULL, 'IPA 3', 'Senin', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(166, 6, 71, 89, NULL, 'IPA 4', 'Senin', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(167, 6, 101, 89, NULL, 'IPA 2', 'Senin', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(168, 6, 101, 89, NULL, 'IPA 1', 'Kamis', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(170, 6, 115, 63, NULL, 'IPA 1', 'Senin', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(171, 6, 116, 63, NULL, 'IPA 1', 'Senin', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(172, 6, 116, 63, NULL, 'IPA 2', 'Selasa', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(174, 6, 115, 63, NULL, 'IPA 3', 'Selasa', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(176, 6, 116, 63, NULL, 'IPA 3', 'Rabu', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(177, 6, 115, 63, NULL, 'IPA 2', 'Rabu', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(178, 6, 117, 63, NULL, 'IPA 2', 'Senin', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(179, 6, 117, 63, NULL, 'IPA 1', 'Selasa', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(180, 6, 117, 63, NULL, 'IPA 3', 'Rabu', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(181, 6, 117, 63, NULL, 'IPA 4', 'Kamis', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(182, 6, 116, 63, NULL, 'IPA 4', 'Kamis', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(183, 6, 115, 63, NULL, 'IPA 4', 'Kamis', '14:00:00', '17:00:00', 2, 0, 'Terisi'),
(184, 6, 70, 90, NULL, 'IPA 3', 'Senin', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(185, 6, 100, 90, NULL, 'IPA 4', 'Senin', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(186, 6, 85, 90, NULL, 'IPA 2', 'Senin', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(187, 6, 70, 90, NULL, 'IPA 2', 'Selasa', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(188, 6, 85, 90, NULL, 'IPA 1', 'Rabu', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(189, 6, 85, 90, NULL, 'IPA 4', 'Selasa', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(190, 6, 100, 90, NULL, 'IPA 2', 'Selasa', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(191, 6, 100, 90, NULL, 'IPA 1', 'Rabu', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(192, 6, 70, 90, NULL, 'IPA 4', 'Rabu', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(193, 6, 70, 90, NULL, 'IPA 1', 'Kamis', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(194, 6, 85, 90, NULL, 'IPA 3', 'Kamis', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(195, 6, 100, 90, NULL, 'IPA 3', 'Kamis', '14:00:00', '18:00:00', 2, 1, 'Terisi'),
(196, 6, 71, 89, NULL, 'IPA 1', 'Selasa', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(197, 6, 86, 89, NULL, 'IPA 2', 'Selasa', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(198, 6, 101, 89, NULL, 'IPA 4', 'Selasa', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(199, 6, 71, 89, NULL, 'IPA 2', 'Rabu', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(200, 6, 86, 89, NULL, 'IPA 4', 'Rabu', '11:00:00', '14:00:00', 2, 1, 'Terisi'),
(201, 6, 101, 89, NULL, 'IPA 3', 'Rabu', '14:00:00', '17:00:00', 2, 1, 'Terisi'),
(202, 6, 71, 89, NULL, 'IPA 3', 'Kamis', '08:00:00', '11:00:00', 2, 1, 'Terisi'),
(203, 6, 86, 89, NULL, 'IPA 2', 'Kamis', '11:00:00', '14:00:00', 2, 1, 'Terisi');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `jurusan_id` int(11) NOT NULL,
  `fakultas_id` int(11) NOT NULL,
  `jurusan_nama` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`jurusan_id`, `fakultas_id`, `jurusan_nama`) VALUES
(3, 12, 'IPA'),
(4, 12, 'IPS');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `mk_id` int(11) NOT NULL,
  `ta_id` int(11) DEFAULT NULL,
  `prodi_id` int(11) NOT NULL,
  `mk_kode` varchar(20) NOT NULL,
  `mk_nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`mk_id`, `ta_id`, `prodi_id`, `mk_kode`, `mk_nama`) VALUES
(70, 6, 182, 'IPA001', 'Fisika X'),
(71, 6, 182, 'IPA002', 'Kimia X'),
(72, 6, 182, 'IPA003', 'Biologi X'),
(73, 6, 186, 'IPS001', 'Geografi'),
(74, 6, 186, 'IPS002', 'Ekonomi'),
(75, 6, 186, 'IPS003', 'Sejarah X'),
(76, 6, 183, 'IPA014', 'Matematika Peminatan XI'),
(77, 6, 183, 'IPA015', 'Bahasa Inggris'),
(78, 6, 182, 'IPA006', 'Pendidikan Kewarganegaraan'),
(79, 6, 182, 'IPA008', 'Matematika Umum X'),
(80, 6, 187, 'IPS014', 'Sosiologi'),
(81, 6, 187, 'IPS015', 'Bahasa Inggris'),
(82, 6, 187, 'IPS016', 'Pendidikan Kewarganegaraan'),
(83, 6, 187, 'IPS017', 'Bahasa Indonesia'),
(84, 6, 187, 'IPS018', 'Matematika Umum XI'),
(85, 6, 183, 'IPA011', 'Fisika XI'),
(86, 6, 183, 'IPA012', 'Kimia XI'),
(87, 6, 183, 'IPA013', 'Biologi XI'),
(88, 6, 187, 'IPS011', 'Geografi'),
(89, 6, 187, 'IPS012', 'Ekonomi'),
(90, 6, 187, 'IPS013', 'Sejarah'),
(91, 6, 182, 'IPA004', 'Matematika Peminatan X'),
(92, 6, 182, 'IPA005', 'Bahasa Inggris'),
(93, 6, 183, 'IPA016', 'Pendidikan Kewarganegaraan'),
(94, 6, 183, 'IPA018', 'Matematika Umum XI'),
(95, 6, 186, 'IPS004', 'Sosiologi'),
(96, 6, 186, 'IPS005', 'Bahasa Inggris'),
(97, 6, 186, 'IPS006', 'Pendidikan Kewarganegaraan'),
(98, 6, 186, 'IPS007', 'Bahasa Indonesia'),
(99, 6, 186, 'IPS008', 'Matematika Umum X'),
(100, 6, 184, 'IPA101', 'Fisika XII'),
(101, 6, 184, 'IPA102', 'Kimia XII'),
(102, 6, 184, 'IPA103', 'Biologi XII'),
(103, 6, 184, 'IPA104', 'Matematika Peminatan XII'),
(104, 6, 184, 'IPA105', 'Bahasa Inggris'),
(105, 6, 184, 'IPA106', 'Pendidikan Kewarganegaraan'),
(106, 6, 184, 'IPA108', 'Matematika Umum XII'),
(107, 6, 188, 'IPS101', 'Geografi'),
(108, 6, 188, 'IPS102', 'Ekonomi'),
(109, 6, 188, 'IPS103', 'Sejarah'),
(110, 6, 188, 'IPS104', 'Sosiologi'),
(111, 6, 188, 'IPS105', 'Bahasa Inggris'),
(112, 6, 188, 'IPS106', 'Pendidikan Kewarganegaraan'),
(113, 6, 188, 'IPS107', 'Bahasa Indonesia'),
(114, 6, 188, 'IPS108', 'Matematika Umum XII'),
(115, 6, 184, 'TIK101', 'TIK XII'),
(116, 6, 183, 'TIK010', 'TIK XI'),
(117, 6, 182, 'TIK001', 'TIK X');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `prodi_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `prodi_nama` varchar(100) NOT NULL,
  `prodi_warna` varchar(25) DEFAULT '#000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`prodi_id`, `jurusan_id`, `prodi_nama`, `prodi_warna`) VALUES
(182, 3, 'X IPA', '#000000'),
(183, 3, 'XI IPA', '#ff0000'),
(184, 3, 'XII IPA', '#03a300'),
(186, 4, 'X IPS', '#0011ff'),
(187, 4, 'XI IPS', '#006eff'),
(188, 4, 'XII IPS', '#00d5ff');

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `ruang_id` int(11) NOT NULL,
  `gedung_id` int(11) NOT NULL,
  `ruang_kode` varchar(50) NOT NULL,
  `ruang_lantai` int(11) NOT NULL,
  `ruang_status` enum('Baik','Rusak','N/A') NOT NULL DEFAULT 'N/A',
  `ruang_jenis` enum('Kelas','Kantor','Ruang Rapat','Ruang Sidang','Lab') DEFAULT NULL,
  `ruang_latitude` float NOT NULL,
  `ruang_longitude` float NOT NULL,
  `ruang_keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`ruang_id`, `gedung_id`, `ruang_kode`, `ruang_lantai`, `ruang_status`, `ruang_jenis`, `ruang_latitude`, `ruang_longitude`, `ruang_keterangan`) VALUES
(63, 25, 'Lab Komputer', 1, 'Baik', 'Lab', 0, 0, '-'),
(89, 25, 'Lab Kimia', 1, 'Baik', 'Lab', 0, 0, '-'),
(90, 25, 'Lab Fisika', 1, 'Baik', 'Lab', 0, 0, 'Laboratorium Fisika');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `ta_id` int(11) NOT NULL,
  `ta_nama` varchar(100) NOT NULL,
  `ta_status` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`ta_id`, `ta_nama`, `ta_status`) VALUES
(3, '2022 GENAP', 'Tidak Aktif'),
(5, '2022 GANJIL', 'Tidak Aktif'),
(6, '2023 GANJIL', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `prodi_id` int(11) DEFAULT NULL,
  `dosen_id` int(11) DEFAULT NULL,
  `user_nama` varchar(150) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_role` enum('Superadmin','Pimpinan','Dosen','Prodi') NOT NULL,
  `last_login` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `prodi_id`, `dosen_id`, `user_nama`, `user_username`, `user_password`, `user_role`, `last_login`) VALUES
(21, NULL, NULL, 'Didi Jaya Santri', 'dj_santri', '202cb962ac59075b964b07152d234b70', 'Pimpinan', '2023-10-21 14:33:21'),
(26, 184, 19, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'Superadmin', '2023-10-30 10:27:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`absen_id`),
  ADD KEY `jadwal_id` (`jadwal_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`barang_id`),
  ADD KEY `ruang_id` (`ruang_id`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`dosen_id`),
  ADD KEY `prodi_id` (`prodi_id`) USING BTREE;

--
-- Indexes for table `dosen_jadwal`
--
ALTER TABLE `dosen_jadwal`
  ADD PRIMARY KEY (`dj_id`),
  ADD KEY `jadwal_id` (`jadwal_id`),
  ADD KEY `dosen_id` (`dosen_id`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`fakultas_id`);

--
-- Indexes for table `gedung`
--
ALTER TABLE `gedung`
  ADD PRIMARY KEY (`gedung_id`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`jadwal_id`),
  ADD KEY `mk_id` (`mk_id`),
  ADD KEY `ruang_id` (`ruang_id`),
  ADD KEY `ta_id` (`ta_id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`jurusan_id`),
  ADD KEY `fakultas_id` (`fakultas_id`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`mk_id`),
  ADD KEY `prodi_id` (`prodi_id`),
  ADD KEY `ta_id` (`ta_id`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`prodi_id`),
  ADD KEY `jurusan_id` (`jurusan_id`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`ruang_id`),
  ADD KEY `gedung_id` (`gedung_id`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`ta_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `dosen_id` (`dosen_id`),
  ADD KEY `prodi_id` (`prodi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `absen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `dosen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `dosen_jadwal`
--
ALTER TABLE `dosen_jadwal`
  MODIFY `dj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `fakultas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gedung`
--
ALTER TABLE `gedung`
  MODIFY `gedung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `jadwal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `jurusan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `mk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `prodi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `ruang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `ta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`jadwal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `absen_ibfk_2` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`ruang_id`) REFERENCES `ruang` (`ruang_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dosen_jadwal`
--
ALTER TABLE `dosen_jadwal`
  ADD CONSTRAINT `dosen_jadwal_ibfk_1` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`jadwal_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dosen_jadwal_ibfk_2` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`mk_id`) REFERENCES `mata_kuliah` (`mk_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_4` FOREIGN KEY (`ruang_id`) REFERENCES `ruang` (`ruang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_5` FOREIGN KEY (`ta_id`) REFERENCES `tahun_ajaran` (`ta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`fakultas_id`) REFERENCES `fakultas` (`fakultas_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mata_kuliah_ibfk_2` FOREIGN KEY (`ta_id`) REFERENCES `tahun_ajaran` (`ta_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prodi`
--
ALTER TABLE `prodi`
  ADD CONSTRAINT `prodi_ibfk_1` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ruang`
--
ALTER TABLE `ruang`
  ADD CONSTRAINT `ruang_ibfk_1` FOREIGN KEY (`gedung_id`) REFERENCES `gedung` (`gedung_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`dosen_id`) REFERENCES `dosen` (`dosen_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`prodi_id`) REFERENCES `prodi` (`prodi_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

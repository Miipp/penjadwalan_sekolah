-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2022 at 10:31 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `unsri_penjadwalan`
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

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`barang_id`, `ruang_id`, `barang_nup`, `barang_nama`, `barang_merek`, `barang_kondisi`, `barang_keterangan`) VALUES
(3, 44, NULL, 'Meja Praktikum', 'Lion', 'Baik', 'NUP, Jumlah 7'),
(4, 44, NULL, 'Kursi Praktikum', 'Inola', 'Baik', 'NUP Jumlah 40'),
(5, 44, NULL, 'Meja Dosen', 'Obitrend', 'Baik', 'NUP, Jumlah 1'),
(6, 45, NULL, 'Meja Kerja', 'Obitrend', 'Baik', 'NUP, Jumlah 01'),
(7, 45, NULL, 'Kursi Kerja Dosen', 'Subaru', 'Baik', 'NUP, Jumlah 01'),
(8, 45, NULL, 'Printer', 'Epson L360', 'Baik', 'NUP, Jumlah, Tipe'),
(9, 45, NULL, 'Dispenser', 'Miyako', 'Baik', '');

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
(4, 89, '001', 'Hardini Novianti, M.T.', '-', '-', '-'),
(5, 88, '002', 'Dinna Yunika, S.SI, M.T', '-', '-', '-'),
(6, 88, '003', 'Ahmad Rifai, MT', '-', '-', '-'),
(7, 88, '004', 'Sarifah Putri Raflesia, S.SI, M.T.', '-', '-', '-'),
(8, 88, '005', 'Mira Afrina, S.E., M.Sc', '-', '-', '-'),
(9, 88, '006', 'Dinda Lestarini, MT', '-', '-', '-'),
(10, 88, '007', 'M. Hidayat, SE., M.Si., Ak.', '-', '-', '-'),
(11, 88, '008', 'Muhammad Ichsan Siregar, SE.,M.S.Ak', '-', '-', '-'),
(12, 88, '009', 'Patmawati, SE., M.Si., Ak., CA', '-', '-', '-'),
(13, 88, '010', 'Dedy Kurniawan', '-', '-', '-'),
(14, 88, '011', 'Dr. Reza Firsandaya Malik, MT', '-', '-', '-'),
(15, 88, '012', 'Zaqqi Yamani', '-', '-', '-'),
(16, 88, '013', 'Rossi Passarella', '-', '-', '-'),
(17, 88, '014', 'Sutarno', '-', '-', '-'),
(18, 88, '196809191993031003', 'Didi Jaya Santri', 'Lektor', 'Kepala Laboratorium Pendidikan Biologi', 'III');

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
(39, 117, 5),
(40, 118, 5),
(41, 119, 5),
(42, 120, 5),
(43, 121, 6),
(44, 122, 6),
(45, 123, 5),
(46, 124, 5),
(47, 125, 5),
(48, 126, 6),
(49, 127, 5);

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
(1, 'FE'),
(2, 'FH'),
(3, 'FT'),
(4, 'FK'),
(5, 'FP'),
(6, 'FKIP'),
(7, 'FISIP'),
(8, 'FMIPA'),
(9, 'FIK'),
(10, 'FKM'),
(11, 'PPS'),
(12, 'REKTORAT');

-- --------------------------------------------------------

--
-- Table structure for table `gedung`
--

CREATE TABLE `gedung` (
  `gedung_id` int(11) NOT NULL,
  `gedung_nama` varchar(100) NOT NULL,
  `gedung_lokasi` enum('Palembang','Ogan','Indralaya','Jakabaring','KM 5') DEFAULT NULL,
  `gedung_keterangan` text NOT NULL,
  `gedung_denah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gedung`
--

INSERT INTO `gedung` (`gedung_id`, `gedung_nama`, `gedung_lokasi`, `gedung_keterangan`, `gedung_denah`) VALUES
(7, 'Gedung Dekanat', 'Indralaya', '', ''),
(8, 'Gedung Kuliah A', 'Indralaya', '', ''),
(9, 'Gedung Kuliah B', 'Indralaya', '', ''),
(10, 'Gedung Kuliah C', 'Indralaya', '', ''),
(11, 'Gedung Kuliah D', 'Indralaya', '', ''),
(12, 'Ruang Baca', 'Indralaya', '', ''),
(13, 'Gedung Laboratorium Pendidikan MIPA', 'Indralaya', '', ''),
(14, 'Gedung Laboratorium Pendidikan IPS', 'Indralaya', '', ''),
(15, 'Gedung Laboratorium Kebun Botani', 'Indralaya', '', ''),
(16, 'Gedung Laboratorium Pendidikan Teknik Mesin', 'Indralaya', '', ''),
(17, 'Gedung Musholah FKIP', 'Indralaya', '', ''),
(18, 'Gedung Serba Guna', 'Indralaya', '', ''),
(19, 'Gedung BEM / HMPS', 'Indralaya', '', ''),
(20, 'Gedung Kuliah A Ogan', 'Ogan', '', ''),
(21, 'Gedung Kuliah B Ogan', 'Ogan', '', ''),
(22, 'Gedung Laboratorium Pengajaran', 'Indralaya', '', ''),
(23, 'Gedung Laboratorium Pendidikan', 'Ogan', '', '');

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
(117, 3, 66, 42, NULL, '3', 'Selasa', '08:00:00', '09:00:00', 5, 4, 'Terisi'),
(118, 3, 66, 42, NULL, '1', 'Senin', '12:00:00', '16:00:00', 3, 2, 'Terisi'),
(119, 3, 67, 43, NULL, '1', 'Selasa', '08:00:00', '09:00:00', 3, 2, 'Terisi'),
(120, 3, 68, 43, NULL, '1', 'Senin', '11:00:00', '12:00:00', 3, 2, 'Terisi'),
(121, 3, 67, 43, NULL, '1', 'Senin', '14:00:00', '15:00:00', 3, 2, 'Terisi'),
(122, 3, 67, 43, NULL, '1', 'Senin', '15:00:00', '16:00:00', 3, 2, 'Terisi'),
(123, 3, 68, 44, NULL, '1', 'Senin', '11:00:00', '12:00:00', 3, 2, 'Terisi'),
(124, 3, 67, 44, NULL, '1', 'Senin', '16:00:00', '17:00:00', 3, 2, 'Terisi'),
(125, 3, 67, 44, NULL, '1', 'Senin', '13:00:00', '14:00:00', 3, 2, 'Terisi'),
(126, 3, 68, 45, NULL, '1', 'Senin', '14:00:00', '15:00:00', 3, 2, 'Terisi'),
(127, 3, 68, 45, NULL, '1', 'Senin', '15:00:00', '16:00:00', 3, 2, 'Terisi');

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
(1, 6, 'Jurusan 1'),
(2, 6, 'jurusan 2');

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
(66, 3, 88, 'MK001', 'MATEMATIKA'),
(67, 3, 89, '01', '89 PRODI MK LAYA'),
(68, 3, 89, '02', '89 PRODI MK LAYAS 2');

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
(88, 1, 'PENDIDIKAN GURU PENDIDIKAN ANAK USIA DINI (INDRALAYA)', '#32b828'),
(89, 1, 'PENDIDIKAN MATEMATIKA (INDRALAYA) ', '#ea7434'),
(90, 1, 'PENDIDIKAN BIOLOGI (INDRALAYA) ', '#000'),
(91, 1, 'PENDIDIKAN KIMIA (INDRALAYA) ', '#000'),
(92, 1, 'PENDIDIKAN FISIKA (INDRALAYA) ', '#000'),
(93, 1, 'PENDIDIKAN TEKNIK MESIN (INDRALAYA) ', '#000'),
(95, 1, 'PENDIDIKAN PANCASILA DAN KEWARGANEGARAAN (INDRALAYA) ', '#000'),
(96, 1, 'PENDIDIKAN SEJARAH (INDRALAYA) ', '#000'),
(97, 1, 'BIMBINGAN DAN KONSELING (INDRALAYA) ', '#000'),
(98, 1, 'PENDIDIKAN EKONOMI (INDRALAYA) ', '#000'),
(99, 1, 'PENDIDIKAN BAHASA INDONESIA (INDRALAYA) ', '#000'),
(100, 1, 'PENDIDIKAN BAHASA INGGRIS (INDRALAYA) ', '#000'),
(101, 1, 'PENDIDIKAN GURU SEKOLAH DASAR (INDRALAYA) ', '#000'),
(102, 1, 'PENDIDIKAN MATEMATIKA (PALEMBANG) (S1)', '#000'),
(103, 1, 'PENDIDIKAN BIOLOGI (PALEMBANG) ', '#000'),
(104, 1, 'PENDIDIKAN KIMIA (PALEMBANG) ', '#000'),
(105, 1, 'PENDIDIKAN FISIKA (PALEMBANG) ', '#000'),
(106, 1, 'PENDIDIKAN TEKNIK MESIN (PALEMBANG) ', '#000'),
(107, 1, 'PENDIDIKAN BAHASA INDONESIA (PALEMBANG) ', '#000'),
(108, 1, 'PENDIDIKAN BAHASA INGGRIS (PALEMBANG) ', '#000'),
(109, 1, 'PENDIDIKAN SEJARAH (PALEMBANG) ', '#000'),
(110, 1, 'PENDIDIKAN PANCASILA DAN KEWARGANEGARAAN (PALEMBANG) ', '#000'),
(111, 1, 'PENDIDIKAN EKONOMI (PALEMBANG) ', '#000'),
(112, 1, 'PENDIDIKAN JASMANI DAN KESEHATAN (PALEMBANG) ', '#000'),
(113, 1, 'PENDIDIKAN GURU SEKOLAH DASAR (PALEMBANG) ', '#000'),
(114, 1, 'BIMBINGAN DAN KONSELING (PALEMBANG) ', '#000'),
(116, 1, 'PENDIDIKAN MASYARAKAT (INDRALAYA) ', '#000'),
(159, 1, 'MAGISTER PENDIDIKAN MATEMATIKA (S2)', '#000'),
(160, 1, 'MAGISTER PENDIDIKAN FISIKA (S2)', '#000'),
(161, 1, 'MAGISTER PENDIDIKAN OLAHRAGA (S2)', '#000'),
(162, 1, 'MAGISTER PENDIDIKAN BAHASA (S2)', '#000'),
(163, 1, 'MAGISTER TEKNOLOGI PENDIDIKAN (S2)', '#000'),
(164, 1, 'DOKTOR PENDIDIKAN MATEMATIKA (S3)', '#000'),
(166, 1, 'PENDIDIKAN LUAR SEKOLAH (INDRALAYA)', '#000'),
(171, 2, 'PENDIDIKAN PROFESI GURU', '#15c62a');

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
  `ruang_keterangan` text NOT NULL,
  `ruang_qrcode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`ruang_id`, `gedung_id`, `ruang_kode`, `ruang_lantai`, `ruang_status`, `ruang_jenis`, `ruang_latitude`, `ruang_longitude`, `ruang_keterangan`, `ruang_qrcode`) VALUES
(42, 7, 'Aka1', 1, 'Baik', 'Kantor', -3.21996, 104.649, '', '427Aka11.png'),
(43, 11, 'D201', 2, 'Baik', 'Kelas', 0, 0, '', '4311D2012.png'),
(44, 15, 'Bot01', 1, 'Baik', 'Lab', -3.22153, 104.65, '', '4415Bot011.png'),
(45, 15, 'Dos01', 1, 'Baik', 'Kantor', 0, 0, '', '4515Dos011.png'),
(46, 15, 'Dos02', 1, 'Baik', 'Kantor', 0, 0, '', '4615Dos021.png');

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
(3, '2022 GENAP', 'Aktif'),
(5, '2023 GANJIL', 'Tidak Aktif');

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
(1, NULL, NULL, 'Aditya DHarmawan Saputra', 'adityads', '202cb962ac59075b964b07152d234b70', 'Superadmin', '2022-03-25 00:57:17'),
(20, NULL, 6, 'Ahmad Rifai', 'rifai', '202cb962ac59075b964b07152d234b70', 'Dosen', '2021-10-24 21:27:36'),
(21, NULL, NULL, 'Didi Jaya Santri', 'dj_santri', '202cb962ac59075b964b07152d234b70', 'Superadmin', '2022-02-24 14:20:15'),
(22, 90, NULL, 'asd', 'asd', '202cb962ac59075b964b07152d234b70', 'Prodi', '2022-03-25 01:24:44'),
(23, 88, NULL, 'test prodi 1', 'prodi1', '202cb962ac59075b964b07152d234b70', 'Prodi', '2022-03-27 14:08:04'),
(24, 89, NULL, 'prodi2', 'prodi2', '202cb962ac59075b964b07152d234b70', 'Prodi', '2022-03-27 14:13:50'),
(25, 171, NULL, 'asdddd', 'asddd', '202cb962ac59075b964b07152d234b70', 'Prodi', '2022-03-27 14:09:36');

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
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `dosen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `dosen_jadwal`
--
ALTER TABLE `dosen_jadwal`
  MODIFY `dj_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `fakultas`
--
ALTER TABLE `fakultas`
  MODIFY `fakultas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `gedung`
--
ALTER TABLE `gedung`
  MODIFY `gedung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `jadwal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `jurusan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `mk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `prodi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT for table `ruang`
--
ALTER TABLE `ruang`
  MODIFY `ruang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `ta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

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

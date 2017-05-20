-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 10.1.22-MariaDB - mariadb.org binary distribution
-- OS Server:                    Win32
-- HeidiSQL Versi:               9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- membuang struktur untuk table elearning.jenis_ujian
DROP TABLE IF EXISTS `jenis_ujian`;
CREATE TABLE IF NOT EXISTS `jenis_ujian` (
  `ujian_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jenis_ujian` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ujian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.jenis_ujian: ~0 rows (lebih kurang)
DELETE FROM `jenis_ujian`;
/*!40000 ALTER TABLE `jenis_ujian` DISABLE KEYS */;
/*!40000 ALTER TABLE `jenis_ujian` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_admin
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE IF NOT EXISTS `tb_admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` text NOT NULL,
  `pass` varchar(40) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_admin: ~0 rows (lebih kurang)
DELETE FROM `tb_admin`;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `alamat`, `no_telp`, `email`, `username`, `password`, `pass`) VALUES
	(1, 'Admin', 'test', '234234', 'test@test.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_berita
DROP TABLE IF EXISTS `tb_berita`;
CREATE TABLE IF NOT EXISTS `tb_berita` (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `judul` text NOT NULL,
  `isi` longtext NOT NULL,
  `tgl_posting` date NOT NULL,
  `penerbit` varchar(10) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL,
  PRIMARY KEY (`id_berita`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_berita: ~0 rows (lebih kurang)
DELETE FROM `tb_berita`;
/*!40000 ALTER TABLE `tb_berita` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_berita` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_data_sekolah
DROP TABLE IF EXISTS `tb_data_sekolah`;
CREATE TABLE IF NOT EXISTS `tb_data_sekolah` (
  `nama_sekolah` varchar(50) DEFAULT NULL,
  `alamat_sekolah` text,
  `logo_sekolah` varchar(200) DEFAULT NULL,
  `deskrpisi_sekolah` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_data_sekolah: ~0 rows (lebih kurang)
DELETE FROM `tb_data_sekolah`;
/*!40000 ALTER TABLE `tb_data_sekolah` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_data_sekolah` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_file_materi
DROP TABLE IF EXISTS `tb_file_materi`;
CREATE TABLE IF NOT EXISTS `tb_file_materi` (
  `id_materi` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) NOT NULL,
  `id_kelas` int(4) NOT NULL,
  `id_mapel` int(4) NOT NULL,
  `nama_file` varchar(250) NOT NULL,
  `tgl_posting` date NOT NULL,
  `pembuat` varchar(10) NOT NULL,
  `hits` int(4) NOT NULL,
  PRIMARY KEY (`id_materi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_file_materi: ~0 rows (lebih kurang)
DELETE FROM `tb_file_materi`;
/*!40000 ALTER TABLE `tb_file_materi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_file_materi` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_jawaban
DROP TABLE IF EXISTS `tb_jawaban`;
CREATE TABLE IF NOT EXISTS `tb_jawaban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tq` int(4) NOT NULL,
  `id_soal` int(4) NOT NULL,
  `id_siswa` int(4) NOT NULL,
  `jawaban` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_jawaban: ~0 rows (lebih kurang)
DELETE FROM `tb_jawaban`;
/*!40000 ALTER TABLE `tb_jawaban` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_jawaban` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_jawaban_pilgan_temp
DROP TABLE IF EXISTS `tb_jawaban_pilgan_temp`;
CREATE TABLE IF NOT EXISTS `tb_jawaban_pilgan_temp` (
  `id_peserta` int(11) DEFAULT NULL,
  `id_tq` int(11) DEFAULT NULL,
  `id_soal` int(11) DEFAULT NULL COMMENT 'id_pilgan/id_essay',
  `jawaban` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_jawaban_pilgan_temp: ~0 rows (lebih kurang)
DELETE FROM `tb_jawaban_pilgan_temp`;
/*!40000 ALTER TABLE `tb_jawaban_pilgan_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_jawaban_pilgan_temp` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_kelas
DROP TABLE IF EXISTS `tb_kelas`;
CREATE TABLE IF NOT EXISTS `tb_kelas` (
  `id_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(50) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `wali_kelas` int(5) NOT NULL,
  `ketua_kelas` int(5) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_kelas: ~2 rows (lebih kurang)
DELETE FROM `tb_kelas`;
/*!40000 ALTER TABLE `tb_kelas` DISABLE KEYS */;
INSERT INTO `tb_kelas` (`id_kelas`, `nama_kelas`, `ruang`, `wali_kelas`, `ketua_kelas`) VALUES
	(16, '10 IPA 1', 'IPA', 1, 0),
	(17, '10 IPA 2', 'IPA', 2, 0),
	(18, '10 IPA 3', 'IPA', 0, 0),
	(19, '10 IPS 1', 'IPS', 0, 0),
	(20, '10 IPS 2', 'IPS', 0, 0),
	(21, '10 IPS 3', 'IPS', 0, 0),
	(22, '11 IPA 1', 'IPA', 0, 0),
	(23, '11 IPA 2', 'IPA', 0, 0),
	(24, '11 IPA 3', 'IPA', 0, 0),
	(25, '11 IPS 1', 'IPS', 0, 0),
	(26, '11 IPS 2', 'IPS', 0, 0),
	(27, '11 IPS 3', 'IPS', 0, 0);
/*!40000 ALTER TABLE `tb_kelas` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_kelas_ajar
DROP TABLE IF EXISTS `tb_kelas_ajar`;
CREATE TABLE IF NOT EXISTS `tb_kelas_ajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kelas` int(5) NOT NULL,
  `id_pengajar` int(5) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_kelas_ajar: ~2 rows (lebih kurang)
DELETE FROM `tb_kelas_ajar`;
/*!40000 ALTER TABLE `tb_kelas_ajar` DISABLE KEYS */;
INSERT INTO `tb_kelas_ajar` (`id`, `id_kelas`, `id_pengajar`, `keterangan`) VALUES
	(1, 17, 2, ''),
	(2, 16, 1, '');
/*!40000 ALTER TABLE `tb_kelas_ajar` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_mapel
DROP TABLE IF EXISTS `tb_mapel`;
CREATE TABLE IF NOT EXISTS `tb_mapel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_mapel` varchar(10) NOT NULL,
  `mapel` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_mapel: ~3 rows (lebih kurang)
DELETE FROM `tb_mapel`;
/*!40000 ALTER TABLE `tb_mapel` DISABLE KEYS */;
INSERT INTO `tb_mapel` (`id`, `kode_mapel`, `mapel`) VALUES
	(8, 'A1', 'Bahasa indo'),
	(9, 'A2', 'Test pelajaran 2'),
	(10, 'A3', 'Test pelajaran 3');
/*!40000 ALTER TABLE `tb_mapel` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_mapel_ajar
DROP TABLE IF EXISTS `tb_mapel_ajar`;
CREATE TABLE IF NOT EXISTS `tb_mapel_ajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mapel` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_pengajar` int(5) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_mapel_ajar: ~0 rows (lebih kurang)
DELETE FROM `tb_mapel_ajar`;
/*!40000 ALTER TABLE `tb_mapel_ajar` DISABLE KEYS */;
INSERT INTO `tb_mapel_ajar` (`id`, `id_mapel`, `id_kelas`, `id_pengajar`, `keterangan`) VALUES
	(1, 8, 17, 2, '');
/*!40000 ALTER TABLE `tb_mapel_ajar` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_nilai_essay
DROP TABLE IF EXISTS `tb_nilai_essay`;
CREATE TABLE IF NOT EXISTS `tb_nilai_essay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tq` int(5) NOT NULL,
  `id_siswa` int(5) NOT NULL,
  `nilai` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_nilai_essay: ~0 rows (lebih kurang)
DELETE FROM `tb_nilai_essay`;
/*!40000 ALTER TABLE `tb_nilai_essay` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_nilai_essay` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_nilai_pilgan
DROP TABLE IF EXISTS `tb_nilai_pilgan`;
CREATE TABLE IF NOT EXISTS `tb_nilai_pilgan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tq` int(4) NOT NULL,
  `id_siswa` int(4) NOT NULL,
  `benar` int(4) NOT NULL,
  `salah` int(4) NOT NULL,
  `tidak_dikerjakan` int(4) NOT NULL,
  `presentase` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_nilai_pilgan: ~0 rows (lebih kurang)
DELETE FROM `tb_nilai_pilgan`;
/*!40000 ALTER TABLE `tb_nilai_pilgan` DISABLE KEYS */;
INSERT INTO `tb_nilai_pilgan` (`id`, `id_tq`, `id_siswa`, `benar`, `salah`, `tidak_dikerjakan`, `presentase`) VALUES
	(1, 50, 1, 1, 2, 0, 33);
/*!40000 ALTER TABLE `tb_nilai_pilgan` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_pengajar
DROP TABLE IF EXISTS `tb_pengajar`;
CREATE TABLE IF NOT EXISTS `tb_pengajar` (
  `id_pengajar` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `web` varchar(60) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL,
  PRIMARY KEY (`id_pengajar`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_pengajar: ~2 rows (lebih kurang)
DELETE FROM `tb_pengajar`;
/*!40000 ALTER TABLE `tb_pengajar` DISABLE KEYS */;
INSERT INTO `tb_pengajar` (`id_pengajar`, `nip`, `nama_lengkap`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_telp`, `email`, `alamat`, `jabatan`, `foto`, `web`, `username`, `password`, `pass`, `status`) VALUES
	(1, '3223434', 'test guru 2', 'jaarta', '2017-05-11', 'L', 'Islam', '34534535', '', 'trertret', 'guru mtk', 'anonim.png', '', 'guru2', '77e69c137812518e359196bb2f5e9bb9', 'guru', 'aktif'),
	(2, '3223434', 'test guru', 'jaarta', '2017-05-11', 'L', 'Islam', '34534535', '', 'trertret', 'guru mtk', 'anonim.png', '', 'guru', '77e69c137812518e359196bb2f5e9bb9', 'guru', 'aktif'),
	(3, '32424234', 'test guru 3', 'Jakarta', '2017-05-09', 'L', 'Islam', '23424234', 'test@mail.com', 'test', 'guru ktk', '144df99978922f308180f580ce26ffe9.png', '', 'guru3', '77e69c137812518e359196bb2f5e9bb9', 'guru', 'aktif');
/*!40000 ALTER TABLE `tb_pengajar` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_siswa
DROP TABLE IF EXISTS `tb_siswa`;
CREATE TABLE IF NOT EXISTS `tb_siswa` (
  `id_siswa` int(11) NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `thn_masuk` int(5) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` text NOT NULL,
  `pass` text NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_siswa: ~4 rows (lebih kurang)
DELETE FROM `tb_siswa`;
/*!40000 ALTER TABLE `tb_siswa` DISABLE KEYS */;
INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_lengkap`, `tgl_lahir`, `jenis_kelamin`, `agama`, `nama_ayah`, `nama_ibu`, `no_telp`, `email`, `alamat`, `id_kelas`, `thn_masuk`, `foto`, `username`, `password`, `pass`, `status`, `tempat_lahir`) VALUES
	(1, '23424', 'test siswa', '2017-05-10', 'L', 'Islam', 'test ayah', 'testi', '34535', 'radan_stromer@yahoo.co.id', 'test alsmst', '17', 2010, '59284e90612523e23a905e8367c40f14.JPG', 'siswa', 'bcd724d15cde8c47650fda962968f102', 'siswa', 'aktif', 'jakarta'),
	(2, '23424', 'test siswa 2', '2017-05-10', 'L', 'Islam', 'test ayah', 'testi', '34535', 'radan_stromer@yahoo.co.id', 'test alsmst', '16', 2010, '59284e90612523e23a905e8367c40f14.JPG', 'siswa2', 'bcd724d15cde8c47650fda962968f102', 'siswa', 'aktif', 'jakarta'),
	(3, '12345323', 'Siswa 3', '2017-05-27', 'L', 'Islam', 'test ayah', 'test ibu', '234234', 'radan_stromer@yahoo.co.id', 'test', '16', 2016, '4c4282b2050e8ef7725b263b647cf982.png', 'siswa3', 'bcd724d15cde8c47650fda962968f102', 'siswa', 'aktif', 'Jakarta'),
	(4, '3434343434', 'siswa 4', '2017-05-10', 'L', 'Islam', 'test ayah', 'test ibu', '234234', 'radan_stromer@yahoo.co.id', 'tesdfsf', '17', 2002, 'anonim.png', 'siswa4', 'bcd724d15cde8c47650fda962968f102', 'siswa', 'aktif', 'Jakarta'),
	(5, '123456', 'Maulana Misbahus Sihabudin', '2006-05-03', 'L', 'Islam', 'M amin', 'Karla Damayanti', '081381000123', 'maulanamisbahus@gmail.com', 'Jl. Tanah Merdeka rt.10/12 Jakarta', '16', 2016, 'anonim.png', 'Maulana', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif', 'Jakarta'),
	(6, '933625141', 'annisa febrianti', '2001-02-16', 'P', 'Islam', 'sunardi', 'eri kurniati', '081211537950', 'annisa.azka18@gmail.com', 'Jln.cempaka VIII', '16', 2016, '6bbc93ab5ea31a6711f6cb9ab439a861.jpg', 'annisafebri16', '6ae3713d548ce13d4107246bcf0a7b68', 'annisaazka1618', 'aktif', 'jakarta'),
	(7, '4753', 'Dyah Andini', '2015-02-06', 'P', 'Islam', 'Suranto', 'Darmini', '0895352325435', 'andinidyah1601@gmail.com', 'Jl cempaka sari 1', '16', 2016, 'c55b0b0414580b52afecf6fee8c11f3c.jpg', 'Andinidyah1616', '036d99fceb24ba68c5167c393c3ef17c', 'andinidyah', 'aktif', ' Klaten');
/*!40000 ALTER TABLE `tb_siswa` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_soal_essay
DROP TABLE IF EXISTS `tb_soal_essay`;
CREATE TABLE IF NOT EXISTS `tb_soal_essay` (
  `id_essay` int(11) NOT NULL AUTO_INCREMENT,
  `id_tq` int(5) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_buat` date NOT NULL,
  PRIMARY KEY (`id_essay`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_soal_essay: ~0 rows (lebih kurang)
DELETE FROM `tb_soal_essay`;
/*!40000 ALTER TABLE `tb_soal_essay` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_soal_essay` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_soal_pilgan
DROP TABLE IF EXISTS `tb_soal_pilgan`;
CREATE TABLE IF NOT EXISTS `tb_soal_pilgan` (
  `id_pilgan` int(11) NOT NULL AUTO_INCREMENT,
  `id_tq` int(5) NOT NULL,
  `id_pengajar` int(5) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `video` varchar(100) NOT NULL,
  `audio` varchar(100) NOT NULL,
  `pil_a` text NOT NULL,
  `gbr_a` text NOT NULL,
  `pil_b` text NOT NULL,
  `gbr_b` text NOT NULL,
  `pil_c` text NOT NULL,
  `gbr_c` text NOT NULL,
  `pil_d` text NOT NULL,
  `gbr_d` text NOT NULL,
  `pil_e` text NOT NULL,
  `gbr_e` text NOT NULL,
  `kunci` enum('A','B','C','D','E') NOT NULL,
  `tgl_buat` date NOT NULL,
  `level_group` int(11) NOT NULL COMMENT 'untuk pengelompokan soal berdasarkan level urutan',
  PRIMARY KEY (`id_pilgan`)
) ENGINE=InnoDB AUTO_INCREMENT=7823 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_soal_pilgan: ~5 rows (lebih kurang)
DELETE FROM `tb_soal_pilgan`;
/*!40000 ALTER TABLE `tb_soal_pilgan` DISABLE KEYS */;
INSERT INTO `tb_soal_pilgan` (`id_pilgan`, `id_tq`, `id_pengajar`, `pertanyaan`, `gambar`, `video`, `audio`, `pil_a`, `gbr_a`, `pil_b`, `gbr_b`, `pil_c`, `gbr_c`, `pil_d`, `gbr_d`, `pil_e`, `gbr_e`, `kunci`, `tgl_buat`, `level_group`) VALUES
	(7818, 50, 0, 'Taruh pertanyaan soal disini', '60a818560358988e999cfa90151cd8bd1.jpeg', '', '', 'Jawaban A', 'ee30cc13a10150ba5739853783e474a87.png', 'Jawaban B', '', 'Jawaban C', '', 'Jawaban D', '', 'Jawaban E', '', 'A', '2017-05-18', 1),
	(7819, 50, 0, 'Contoh soal no 2 dengan jawaban bergambar', '', '', '', '', '818ef0611746f6c2d7cc05efc2a8c8292.jpeg', '', '0b1f9476c9242dced2332ee0e964ca3c3.jpeg', '', '4cfebf0cd768c77ae7b83795175be79e4.jpeg', '', '55694fae6ae5ed7db6e69e2d81493e355.jpeg', '', 'ce3607e1a0bab1d914535c369e5e6ad86.jpeg', 'C', '2017-05-18', 2),
	(7820, 50, 0, 'Contoh soal no 2 dengan soal dan jawaban bergambar', '6de9284e193c29bd0104f8bcbf9114a58.jpeg', '', '', '', '4289a8a2bc331250aef8c94158b578209.jpeg', '', '98a94bbf5a0e61707ac4eeb13ac2ef6c10.jpeg', '', '1ea8a4531504b0a28c36c21fa0b577a411.jpeg', '', 'd98aa40ea433188b45090f62e360094812.jpeg', '', '6e01ba536586ed8deff4931a4f1367d913.jpeg', 'E', '2017-05-18', 3),
	(7821, 51, 0, '<p>test</p>', 'cowok-cuek.jpg', '', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', 'B', '2017-05-20', 1),
	(7822, 51, 0, '<p>test soal 2</p>', 'f312c0dda5c81e259baf577b9260173d.jpg', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '', 'cf9c3c37c15c97cc24ba6859fc3ec0f0.jpg', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', 'D', '2017-05-20', 2);
/*!40000 ALTER TABLE `tb_soal_pilgan` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_topik_quiz
DROP TABLE IF EXISTS `tb_topik_quiz`;
CREATE TABLE IF NOT EXISTS `tb_topik_quiz` (
  `id_tq` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_mapel` int(5) NOT NULL,
  `tgl_buat` date NOT NULL,
  `pembuat` varchar(10) NOT NULL,
  `waktu_soal` int(8) NOT NULL,
  `info` varchar(250) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL,
  PRIMARY KEY (`id_tq`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_topik_quiz: ~2 rows (lebih kurang)
DELETE FROM `tb_topik_quiz`;
/*!40000 ALTER TABLE `tb_topik_quiz` DISABLE KEYS */;
INSERT INTO `tb_topik_quiz` (`id_tq`, `judul`, `id_kelas`, `id_mapel`, `tgl_buat`, `pembuat`, `waktu_soal`, `info`, `status`) VALUES
	(50, 'ulangan ttest', 17, 8, '2017-05-18', 'admin', 3600, '', 'aktif'),
	(51, 'test ujian guru 2', 16, 9, '2017-05-19', '1', 3600, '', 'aktif');
/*!40000 ALTER TABLE `tb_topik_quiz` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

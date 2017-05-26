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

-- Membuang data untuk tabel elearning.tb_admin: ~1 rows (lebih kurang)
DELETE FROM `tb_admin`;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `alamat`, `no_telp`, `email`, `username`, `password`, `pass`) VALUES
	(1, 'Admin', 'test', '234234', 'test@test.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_berita
CREATE TABLE IF NOT EXISTS `tb_berita` (
  `id_berita` int(11) NOT NULL AUTO_INCREMENT,
  `judul` text NOT NULL,
  `isi` longtext NOT NULL,
  `tgl_posting` date NOT NULL,
  `penerbit` varchar(10) NOT NULL,
  `status` enum('aktif','tidak aktif') NOT NULL,
  PRIMARY KEY (`id_berita`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_berita: ~1 rows (lebih kurang)
DELETE FROM `tb_berita`;
/*!40000 ALTER TABLE `tb_berita` DISABLE KEYS */;
INSERT INTO `tb_berita` (`id_berita`, `judul`, `isi`, `tgl_posting`, `penerbit`, `status`) VALUES
	(1, 'JADWAL UJIAN CBT PAT 2017', 'MATEMATIKA  SENIN 22 MEI 2017', '2017-05-20', 'admin', 'aktif');
/*!40000 ALTER TABLE `tb_berita` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_data_sekolah
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
CREATE TABLE IF NOT EXISTS `tb_kelas` (
  `id_kelas` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(50) NOT NULL,
  `ruang` varchar(20) NOT NULL,
  `wali_kelas` int(5) NOT NULL,
  `ketua_kelas` int(5) NOT NULL,
  PRIMARY KEY (`id_kelas`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_kelas: ~12 rows (lebih kurang)
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
CREATE TABLE IF NOT EXISTS `tb_mapel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_mapel` varchar(10) NOT NULL,
  `mapel` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_mapel: ~27 rows (lebih kurang)
DELETE FROM `tb_mapel`;
/*!40000 ALTER TABLE `tb_mapel` DISABLE KEYS */;
INSERT INTO `tb_mapel` (`id`, `kode_mapel`, `mapel`) VALUES
	(11, 'PAI', 'Pendidikan Agama Islam'),
	(12, 'PAK', 'Pendidikan Agama Kristen'),
	(13, 'PPKN', 'Pendidikan Pancasila dan KewargaNegaraan'),
	(14, 'BIND', 'Bahasa Indonesia'),
	(15, 'BING', 'Bahasa Inggris'),
	(16, 'MTKW', 'Matematika Wajib'),
	(17, 'SIND', 'Sejarah Indonesia'),
	(18, 'SENI', 'Seni Budaya'),
	(19, 'PJOK', 'Pendidikan Jasmani Olahraga dan Kesehatan'),
	(20, 'PKWU', 'Pendidikan Keterampilan dan Wira Usaha'),
	(21, 'GEO', 'Geografi'),
	(22, 'SEJ-P', 'Sejarah Peminatan'),
	(23, 'SOS', 'Sosiologi'),
	(24, 'EKO', 'Ekonomi'),
	(25, 'FIS', 'Fisika'),
	(26, 'KIM', 'Kimia'),
	(27, 'BIO', 'Biologi'),
	(28, 'KIM LM', 'Kimia Lintas Minat'),
	(29, 'BIO-LM', 'Biologi Lintas Minat'),
	(31, 'FIS-LM', 'Fisika Lintas Minat'),
	(32, 'JER-LM', 'Bahasa Jerman Lintas Minat'),
	(33, 'ING-LM', 'Bahasa Inggris Lintas Minat'),
	(34, 'MTK-P', 'Matematika Peminatan'),
	(35, 'SOS-LM', 'Sosiologi Lintas Minat'),
	(36, 'GEO-LM', 'Geografi Lintas Minat'),
	(37, 'EKO-LM', 'Ekonomi Lintas Minat'),
	(38, 'Simulasi', 'Soal Simulasi');
/*!40000 ALTER TABLE `tb_mapel` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_mapel_ajar
CREATE TABLE IF NOT EXISTS `tb_mapel_ajar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mapel` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_pengajar` int(5) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_mapel_ajar: ~1 rows (lebih kurang)
DELETE FROM `tb_mapel_ajar`;
/*!40000 ALTER TABLE `tb_mapel_ajar` DISABLE KEYS */;
INSERT INTO `tb_mapel_ajar` (`id`, `id_mapel`, `id_kelas`, `id_pengajar`, `keterangan`) VALUES
	(1, 8, 17, 2, '');
/*!40000 ALTER TABLE `tb_mapel_ajar` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_nilai_essay
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
CREATE TABLE IF NOT EXISTS `tb_nilai_pilgan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tq` int(4) NOT NULL,
  `id_siswa` int(4) NOT NULL,
  `benar` int(4) NOT NULL,
  `salah` int(4) NOT NULL,
  `tidak_dikerjakan` int(4) NOT NULL,
  `presentase` int(6) NOT NULL,
  `uraian` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_nilai_pilgan: ~1 rows (lebih kurang)
DELETE FROM `tb_nilai_pilgan`;
/*!40000 ALTER TABLE `tb_nilai_pilgan` DISABLE KEYS */;
INSERT INTO `tb_nilai_pilgan` (`id`, `id_tq`, `id_siswa`, `benar`, `salah`, `tidak_dikerjakan`, `presentase`, `uraian`) VALUES
	(14, 50, 4, 2, 1, 0, 67, '[{"id":"7818","j":"A"},{"id":"7819","j":"C"},{"id":"7820","j":"E"}]'),
	(19, 54, 287, 0, 2, 0, 0, '[{"id":"7830","j":"A"},{"id":"7831","j":"E"}]');
/*!40000 ALTER TABLE `tb_nilai_pilgan` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_pengajar
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_pengajar: ~39 rows (lebih kurang)
DELETE FROM `tb_pengajar`;
/*!40000 ALTER TABLE `tb_pengajar` DISABLE KEYS */;
INSERT INTO `tb_pengajar` (`id_pengajar`, `nip`, `nama_lengkap`, `tempat_lahir`, `tgl_lahir`, `jenis_kelamin`, `agama`, `no_telp`, `email`, `alamat`, `jabatan`, `foto`, `web`, `username`, `password`, `pass`, `status`) VALUES
	(4, '196105111987031006', 'Drs. Emanuel Hari Wahyana, MM', '-', '2017-05-08', 'L', 'Kristen', '-', 'tes@tes.com', 'jl.', 'Kepala Sekolah', 'anonim.png', 'http://sman41jakarta.sch.id', '196105111987031006', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(5, '195705071979032005', 'Dra. Hj. Yenny Bakhrainy', 'jakarta', '2017-05-09', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru Bahas Inggris', 'anonim.png', 'http://sman41jakarta.sch.id', '195705071979032005', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(6, '196006051987031006', 'Drs. Lotes Sitorus', 'medan', '2017-05-01', 'L', 'Kristen', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196006051987031006', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(7, '196007051986031013', 'Drs. H. Suradi', 'Jawa tengah', '2017-05-02', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196007051986031013', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(8, '196011111987032002', 'Dra. Rospita Panggabean', 'medan', '2017-05-01', 'P', 'Kristen', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196011111987032002', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(9, '196110011984122001', 'Nutan Ningsih. MPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196110011984122001', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(10, '196112131984121001', 'Mahmudi, SPd', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196112131984121001', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(11, '196611181991031007', 'Drs. Ali Masykur', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196611181991031007', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(12, '196305111988032004', 'Wina Nirmala, MPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196305111988032004', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(13, '196309031994012001', 'Dra. linda Sabrita, MPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196309031994012001', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(14, '196802141998032003', 'Dra. hj. Endah Setyawati, MPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196802141998032003', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(15, '196106082007012002', 'Dra. Siwi Marwati', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196106082007012002', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(16, '197109052007012004', 'Nurasiah Jamil, MPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '197109052007012004', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(17, '196808292008011006', 'Achmad Subekti, MPd', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196808292008011006', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(18, '197012102008012026', 'Ida Endang Nuriningsih, MPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '197012102008012026', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(19, '196303042008012007', 'DRa. Novalinda, MPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196303042008012007', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(20, '197604032008012012', 'Mutmainah, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '197604032008012012', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(21, '197410212008012011', 'Soleha, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '197410212008012011', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(22, '197104092008012014', 'Priliana Istiwijaya, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '197104092008012014', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(23, '197905122014122003', 'Dini Nurhayati, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '197905122014122003', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(24, '196506032016052001', 'Dra. Yuniarti', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196506032016052001', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(25, '196708042016112001', 'Dra. Titin Eko Wardani', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '196708042016112001', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(26, '99100001', 'Wahyu Nurhayati, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'wahyuni_noor_41@yahoo.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100001', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(27, '99100002', 'M. Jarkasih, MPar', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100002', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(28, '99100003', 'M. Dicky Apriansyah SPdI', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100003', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(29, '99100004', 'Trinovi Astuti, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100004', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(30, '99100005', 'Ratna Nurliyaningsih, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100005', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(31, '99100006', 'Imtikhanah, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100006', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(32, '99100007', 'M. Rosyadi, SPd', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100007', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(33, '99100008', 'Husnul Khotimah, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100008', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(34, '99100009', 'Erni Kurniawati, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100009', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(35, '99100010', 'Tiah Ayu Astuti, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100010', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(36, '99100011', 'Syelvi Diana, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100011', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(37, '99100012', 'Karjan Sijabat, STh', 'Jakarta', '2017-05-01', 'L', 'Kristen', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100012', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(38, '99100013', 'Ilham, SPd', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100013', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(39, '99100014', 'Rahmawati, SPd', 'Jakarta', '2017-05-01', 'P', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100014', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(40, '99100015', 'Les Wahyu Setiaji, SPd', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100015', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(41, '99100016', 'Agus Syahbani, MPd', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100016', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif'),
	(42, '99100017', 'Salam Hidayat, SPd', 'Jakarta', '2017-05-01', 'L', 'Islam', '-', 'tes@tes.com', 'jl.', 'Guru', 'anonim.png', 'http://sman41jakarta.sch.id', '99100017', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif');
/*!40000 ALTER TABLE `tb_pengajar` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_siswa
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
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_siswa: ~280 rows (lebih kurang)
DELETE FROM `tb_siswa`;
/*!40000 ALTER TABLE `tb_siswa` DISABLE KEYS */;
INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_lengkap`, `tgl_lahir`, `jenis_kelamin`, `agama`, `nama_ayah`, `nama_ibu`, `no_telp`, `email`, `alamat`, `id_kelas`, `thn_masuk`, `foto`, `username`, `password`, `pass`, `status`, `tempat_lahir`) VALUES
	(5, '123456', 'Maulana Misbahus Sihabudin', '2006-05-03', 'L', 'Islam', 'M amin', 'Karla Damayanti', '081381000123', 'maulanamisbahus@gmail.com', 'Jl. Tanah Merdeka rt.10/12 Jakarta', '16', 2016, 'anonim.png', 'Maulana', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif', 'Jakarta'),
	(8, '13123213', 'coba test jangan hapus', '2017-05-12', 'L', 'Islam', 'coba test jangan hapus', 'coba test jangan hapus', '324234', 'radan_stromer@yahoo.co.id', 'coba test jangan hapus', '17', 2020, '5b0d92f1e9a63f6924af76634eba9ad5.png', 'test_siswa_jangan_hapus', 'bcd724d15cde8c47650fda962968f102', 'siswa', 'aktif', 'coba test jangan hapus'),
	(9, '13123213', 'coba test jangan hapus 2', '2017-05-12', 'L', 'Islam', 'coba test jangan hapus', 'coba test jangan hapus', '324234', 'radan_stromer@yahoo.co.id', 'coba test jangan hapus', '17', 2020, '5b0d92f1e9a63f6924af76634eba9ad5.png', 'test_siswa_jangan_hapus_2', 'bcd724d15cde8c47650fda962968f102', 'siswa', 'aktif', 'coba test jangan hapus'),
	(11, '10423', 'Ahmad Yudi Yusgiantoro', '2001-03-19', 'L', 'Islam', 'Alm.Syaibi', 'Siti Suminah', '081298572650', 'ahmadyudi050@gmail.com', 'Jln.serdang baru 1 gang 6b no 3c  rt 12/04', '21', 2016, 'anonim.png', 'ahmadyudi', 'cff50880615a1ea1da1a0f21f29aaa3c', 'kakai282299', 'aktif', 'Pati,Jawa Tengah'),
	(12, '10459', 'CIKA APRILIA', '2001-04-02', 'P', 'Islam', 'ALM. MISNO', 'UPI', '089507486986', 'chikaaprilia485@gmail.com', 'JL.ANCOL SELATAN RT02/RW01. NO.22A', '21', 2016, 'anonim.png', 'Cikaaprilia', 'ab496b880b20df4c4f0c2675f1e4b1f9', 'cika01023', 'aktif', 'JAKARTA '),
	(13, '10627', 'YUNI CHRISTIN', '2001-06-08', 'P', 'Kristen', 'DEDE YACUB', 'SAODAH', '083806096375', 'yuni.christin.25@gmail.com', 'JL. PADEMANGAN TIMUR VII RT. 017/001 NO.10', '17', 2016, 'anonim.png', 'yunichristin', 'a66378430cab2598858453db4d91c80e', 'yunichristin08', 'aktif', 'JAKARTA'),
	(14, '10624', 'WIWIT HENDRAYANI MUTIARA', '2001-06-06', 'P', 'Islam', 'MUDIYONO', 'ROCHAMI', '082111171171', 'angelina.wiwit@yahoo.com', 'Jl. Sungai Tirem rt 10/rw 08 no.200 Tj. Priok, Jakarta Utara', '21', 2016, 'anonim.png', 'WIWIT HENDRAYANI', '1539c0d1ab3d96e2395f09c2c1338ca0', 'warakas26', 'aktif', 'JAKARTA'),
	(15, '10643', 'MICHELLE ROSA THERESIA', '2000-12-09', 'P', 'Kristen', 'VICTOR MARTIN SIAGIAN', 'YOSEPHY LUCIANI SILITONGA', '081380009514', 'miselsiagian18@gmail.com', 'Jl KRAMAT PULO DALAM II \r\nJAKARTA PUSAT', '21', 2016, 'anonim.png', 'MICHELLE ROSA THERESIA', 'b239f36b24a8f90ca185e0daffa7586d', 'cantik129', 'aktif', 'JAKARTA'),
	(16, '10454', 'BILAL SUBHI JUNAIDI', '2001-07-01', 'L', 'Islam', 'JUNAIDI', 'SITI SULAIKAH', '082111699772', 'subhibilal37@gmail.com', 'jln.BENTENGAN VIII R/06', '21', 2016, 'anonim.png', 'bilalsubhi', 'e51af79741d70e35a1abfc5ccbeb600e', 'genos123', 'aktif', 'JAKARTA'),
	(17, '10545', 'MUHAMMAD ALMER RIZKIADHIM', '2001-01-05', 'L', 'Islam', 'AGUS SUWASANA', 'HAYU LUSIANAWATI', '082122541757', 'almer.rizkiadhim@gmail.com', 'JL. BENTENG MAS VII RT 14/06 NO. 10, SUNTER JAYA, TANJUNG PRIOK, JAKARTA UTARA.', '21', 2016, 'anonim.png', 'MhmmdAlmer', '228f5118531a378939f47d190487f765', 'almer01052001', 'aktif', 'JAKARTA'),
	(18, '10616', 'TUTUR AFDOL MARIFA', '2001-04-28', 'L', 'Islam', 'MARTIAL', 'WARININGSIH', '081298842925', 'mhz9080@gmail.com', 'Jl. Cemara, Sunter Agung\r\nJakarta Utara', '17', 2016, 'anonim.png', 'tutur9080', 'f8b54b5f173a4c993cc65837029a30d4', '081298842925', 'aktif', 'JAKARTA'),
	(19, '10482', 'FAHMI', '2001-07-07', 'L', 'Islam', 'M.NUR', 'ARIYAH', '085884812689', 'fahmialamsyah39@gmail.com', 'Jln.Cempaka Putih Utarq', '17', 2017, 'a357994bc854a40ae7f0073fb1fdfa4c.jpg', 'FAHMI ALAMSYAH', '9d0062a3ea3c924d2651d40ba880c846', 'kelompok02', 'aktif', 'ALAMSYAH'),
	(20, '10593', 'SITI HARDIYANTI INATYA NANDJALINA SANGADJI PUTRI', '2002-05-14', 'P', 'Islam', 'BUDIMAN SANGADJI', 'MASAYU EDEN FATARUBA', '088210926281', 'natya14502@gmail.com', 'Jln. Letjend Soeprapto No.25 RT.05/RW.03 Kel. Cempaka Baru Kec. Kemayoran Jakarta Pusat,DKI Jakarta', '17', 2016, 'anonim.png', 'natyasangadji', '22f3219debdcb74f85fb4b2636b3e914', 'natya145', 'aktif', 'TERNATE'),
	(21, '10533', 'Mohammad Dhimas Arifullah', '2001-08-06', 'L', 'Islam', 'Raden Imam Muhammad Arifullah', 'Titi Sukarti', '08999093607', 'dhimas41arifullah@gmail.com', 'Jl.Kp Sukasari ', '18', 2017, 'anonim.png', 'DhimasArifullah', '695580791b7d01e6896b43f3c51115ed', 'dhimas41ok', 'aktif', 'Jakarta'),
	(22, '10548', 'MUHAMMAD RIVALDO', '2001-09-21', 'L', 'Islam', 'SUMARSONO', 'ROSMALIA', '08983374589', 'Muhammadrivaldo39@gmail.com', 'Jl. Serdang Raya Rt.004/04, serdang, kemayoran, Jakarta Pusat, DKI JAKARTA', '18', 2016, 'anonim.png', 'Mrivaldo21', '68dc67704b7db84349c5e881907ee72d', 'nyesekguenye03', 'aktif', 'JAKARTA'),
	(23, '10590', 'RISNA MEILIANY', '2001-05-17', 'P', 'Islam', 'HARIMAN DANIEL', 'TRI SARI SULISTIO RINI', '089643437786', 'risnameliani@yahoo.co.id', 'JL. SUNTER JAYA 2A', '17', 2016, 'anonim.png', 'risna.meiliany', '5f2e4c603b8d087933e4b93f205e886f', 'nanacantik', 'aktif', 'JAKARTA'),
	(24, '10508', 'ITA FEBRIYANTI', '2001-02-27', 'P', 'Islam', 'Mulyadi', 'Nurwati', '0895363480114', 'itafebriyanti819@gmail.com', 'Jln tongkol no 2 ', '18', 2016, 'anonim.png', 'Ita febriyanti', 'bb5babd07c9c2548823d78b106827147', '081319546360', 'aktif', 'Jakarta'),
	(25, '10512', 'JUAN PARTOGI SEBASTIAN', '2001-07-04', 'L', 'Kristen', 'ALM. BENYAMIN NOMENSEN. L. TOBING', 'DINAR LASTARI ELFRIDA', '085810861129', 'juanpartogi04@gmail.com', 'JL. PAPANGGO 2D NO. 74 RT/RW : 013/003', '18', 2016, 'anonim.png', 'Juan Partogi Sebastian', 'b13d7a1f89e9d57a55cee60c4d949739', 'juantobing', 'aktif', 'JAKARTA'),
	(26, '10573', 'PUTRI RAMADHANTI', '2000-03-20', 'P', 'Islam', 'ASEP SUHARMAN', 'SRI MARYATI', '083806502395', 'Putriramadhanti63@gmail.com', 'Jalan Angkasa dalam I Rt004/Rw002 no.15 Kemayoran Jakarta Pusat', '21', 2016, 'anonim.png', 'PUTRI RAMADHANTI', 'd5cdab2eb0565abeaec661b1c8c7c6e7', 'ramadhanti03', 'aktif', 'JAKARTA'),
	(27, '10613', 'TIARA WAHYUNI', '2001-03-12', 'P', 'Islam', 'SIYO', 'NGATIYEM', '087889651448', 'tiarawahyuni36@gmail.com', 'JL. SUNTER JAYA RT 04 RW 01 NO 32 . JAKARTA UTARA', '18', 2016, 'anonim.png', 'TIARA WAHYUNI ', '1daddd2da52d4b8d6087011b5566ab02', 'TAMARATIARA', 'aktif', 'JAKARTA'),
	(28, '10511', 'JOVANCA STEFANNY', '2001-09-30', 'P', 'Kristen', 'ROMMY R.L MAPANDIY', 'KHIM HA', '0896-2587-9986', 'jovancastefanny30@gmail.com', 'P.U.P SEKTOR V BLOK F2 NO. 36 BEKASI, JAWA BARAT ', '21', 2016, 'anonim.png', 'jovancastefanny', '3660170c41150e58284b526d51a31152', 'vivianmapandiy', 'aktif', 'JAKARTA'),
	(29, '10537', 'MUHAMAD RAFLI', '2001-11-18', 'L', 'Islam', 'HASAN', 'ROCHIMA', '089628613745', 'rafli6551@gmail.com', 'JL.KALIBARU TIMUR  IV RT/RW 011/07 ,KEL.BUNGUR ,KEC.SENEN,JAKARTA PUSAT ', '21', 2016, 'anonim.png', 'scewrafli', '7c36435dc3c6bc5d09c1037a386f5481', 'Ronaldo77', 'aktif', 'JAKARTA'),
	(30, '10539', 'MUHAMAD RIO ARAFAT', '2001-07-27', 'L', 'Islam', 'ABDUL ROJAK', 'UJU HADIJAH', '085714877827', 'uchihaarafat116@gmail.com', 'SUNTER MUARA, RT18 RW05, JAKARTA UTARA ', '21', 2016, 'anonim.png', 'arafatz18', 'fc7e8e87f87aafe46f8fc802c60509e0', 'arafat18', 'aktif', 'JAKARTA UTARA'),
	(31, '10550', 'MUHAMMAD RIZQY KARUNIA PUTRA', '2000-10-17', 'L', 'Islam', 'WAHYU SETIO WIBOWO', 'MELLY FAJRIA', '085921307474', 'm.rizqykaruniaputra@gmail.com', 'TAMAN NYIUR 7 BLOK O NO.21 SUNTER AGUNG TJ.PRIOK JAKARTA UTARA 14350', '18', 2016, 'anonim.png', 'kapemotovlog', '112a7af6ae4cb678a811f2ee2bdb4618', 'rizqy_21', 'aktif', 'JAKARTA'),
	(32, '10474', 'EKA PRATIWI', '2000-10-11', 'P', 'Islam', 'SURIPTOMO (WALI)', 'SUGIYANTI (WALI)', '083871789633', 'pratiwieka930@gmail.com', 'JL BUDI MULIA GANG E rt 001/010 NO:10', '17', 2016, 'anonim.png', 'EKAPRATIWI11', 'fcc460c203d840d04d91f9bb55b7520f', 'indah123', 'aktif', 'JAKARTA'),
	(33, '10544', 'MUHAMMAD ALDI', '2001-03-24', 'L', 'Islam', 'ALM. ENDANG KOMAR', 'MULYAWATI', '085773586073', 'muhaldi2403@gmail.com', 'JL.CEMPAKA WANGI 3 RT10/RW09 NO.53 KEL.HARAPAN MULYA KEC.KEMAYORAN JAKARTA PUSAT', '21', 2016, 'anonim.png', 'alskyyy24', '01f875272a601e199a21c9d894f84cf8', 'muhaldi2403', 'aktif', 'JAKARTA'),
	(34, '10617', 'UJFA THEREPUTRI DAMAIYANTI', '2001-03-22', 'P', 'Islam', 'UJANG RUSNADI', 'FATRIA PRABAWASARI', '089512048724', 'ujfatere@gmail.com', 'Jl. Rumah susun apron blok 2a/no 302,kel. kebon kosong/kec. Kemayoran', '17', 2016, 'anonim.png', 'Tereptrr', 'd8a650aba14c3c2f18c315ac40bc1518', 'shakila02', 'aktif', 'JAKARTA'),
	(35, '10558', 'NANDA AGUSTIN ADHILA PUTRI', '2001-08-23', 'P', 'Islam', 'H MUHAMMAD THAMRIN BADJURI', 'HJ RUGAYAH', '085814549412', 'nanda23agustin@gmail.com', 'Jl. BHAKTI 2 NO.04 RT.04 RW.01 JAKARTA UTARA', '17', 2016, 'anonim.png', 'NANDAAGUSTIN', 'af0596fffeb0f1fb8e196d891dc48567', 'nandaagustin', 'aktif', 'JAKARTA'),
	(36, '10584', 'REVANELLYRIZKYPUTRAWIDIANSYAH', '2002-02-15', 'L', 'Islam', 'BUDI WIDIANTORO', 'NUR FARIDA RACHMAN', '081216663666', 'revanellyrpw@gmail.com', 'Cempakasari 5 no. 13 rt. 01 rw. 09 kel. Harapan mulia kec. Kemayoran Jakarta pusat D.K.I.JAKARTA', '18', 2016, 'anonim.png', 'REVANELLYRIZKYPUTRAWIDIANSYAH', '435423a609926a32dcf7268ee5062866', 'Semutan98', 'aktif', 'SURABAYA'),
	(37, '10472', 'DUTA AL KAUTSAR', '2001-03-11', 'L', 'Islam', 'MOHAMMAD IMRON TARMUDZI', 'INDAH DAMAYANTI', '', 'dutaalkautsar011@gmail.com', 'Jalan bentengan 3 rt 04 rw 05 kelurahan sunter jaya kecamatan tanjung priok kota jakarta utara provinsi DKI JAKARTA', '18', 2016, 'anonim.png', 'dutahu011', 'eac382484744586a277821c85dd7fac0', 'dutahu1st', 'aktif', 'JAKARTA'),
	(38, '10505', 'INTAN PERMATA SARI', '2001-01-31', 'P', 'Islam', 'MUHAMAD IBRAHIM ', 'MAHUNA', '087876024566', 'intanprmtsr31@gmail.com', 'JL.SUNTER KEMAYORAN NO:55', '21', 2016, 'anonim.png', 'Intan Permata Sari', '1bbd04992a799e006cfaa214cc320ebc', 'tigasatu11', 'aktif', 'JAKARTA'),
	(39, '10441', 'ARADANIA FITRI RAMADHAYANTI', '2001-12-07', 'P', 'Islam', 'DEDEN FITRIADI', 'SUNYI PRIASTAMI', '083898627235', 'ara.daniafitri@gmail.com', 'JL. CEMPAKA BARU TENGAH NO.28 KELURAHAN CEMPAKA BARU KECAMATAN KEMAYORAN', '17', 2016, 'anonim.png', 'Aradaniaa.a', 'db919f933b36b20c83a25e372b1715ff', '07desember', 'aktif', 'DEPOK'),
	(40, '10555', 'MUTIA APRILIANTI', '2001-04-04', 'P', 'Islam', 'MUHAMAD', 'JUNIANTI', '087886265342', 'mutia4401@gmail.com', 'Jl. Telaga Murni 2 Rt. 021/01 No.16 Kel.Sunter Jaya Kec.Tanjung Priok ', '17', 2016, 'anonim.png', 'mutia_aprilianti', '4e9de4deb67a8edf83767c670359342c', 'tiapandyanaxsmpn228', 'aktif', 'JAKARTA'),
	(41, '10592', 'RIZKI RAWI RAZAK', '2001-10-22', 'L', 'Islam', 'SUPRIYADI', 'NARIYEM', '081380322963', 'rizkirawi@gmail.com', 'JL.BHAKTI 4, RT.04/01 NO.48 KELURAHAN SUNTER JAYA. KECAMATAN TANJUNG PRIOK JAKARTA UTARA', '21', 2016, 'anonim.png', 'rizkiraw22', 'f42d6a00a08a11dce10c8b4863d7572a', '221001', 'aktif', 'JAKARTA'),
	(42, '10502', 'HUSNU LIAA', '0000-00-00', '', '', '', '', '', '', '', '', 0, 'anonim.png', '', 'd41d8cd98f00b204e9800998ecf8427e', '', 'aktif', ''),
	(43, '10477', 'EVAN GHAZALI', '2001-01-11', 'L', 'Islam', 'ALM. AHMAD RIFA\'I', 'RETNI PAMUJI', '08999937647', 'evanghazali86@gmail.com', 'JL. SUNTER JAYA II A RT 10 RW 02 NO. 20', '21', 2016, 'anonim.png', 'evan.ghazali', 'ce8ba3ceeb430b0ddae5f4100dce675a', 'evan110101', 'aktif', 'JAKARTA'),
	(44, '10528', 'MEGARETA NUR PROBO SUSENO', '2001-11-27', 'P', 'Islam', 'SUWONDO SENO', 'LASMINI SETIOWATI', '088210591641', 'Megareta.nps@gmail.com', 'JL.KAMPUNG IRIAN NO.34 RT 008/006', '17', 2016, 'anonim.png', 'Megaretaa.a', '10cd4dd655906126e0618c72187b7ea1', '27november', 'aktif', 'JAKARTA '),
	(45, '10483', 'FAHRY SANNU PANTHERA', '2001-02-03', 'L', 'Islam', 'Hasanudin', 'Suharti', '083874408852', 'twinbrother.hs@gmail.com', 'Jl.Perumahan Puri Harapan blok d 16 rt 4 rw 21 no 11 kel.setia asih kec.Tarumajaya Bekasi utara', '18', 2016, 'anonim.png', 'fahrysannup', 'fce08079921834a88ba24106966cdfe8', 'benga152', 'aktif', 'Jakarta'),
	(46, '10488', 'FARIKHA HIDAYATUR ROHMA', '2001-03-25', 'P', 'Islam', 'WIJIANTO', 'KASMIATUN', '08158091883', 'farikahidayatur@gmail.com', 'Jl industri XV rt 01 rw 01', '17', 2016, 'anonim.png', 'FARIKHA HIDAYATUR R', 'c686f58b1a50347d2f859a82a98deb11', '02193145308', 'aktif', 'LAMONGAN'),
	(47, '10620', 'VIVI SAVITRI', '2001-01-22', 'P', 'Islam', 'SATRIA', 'YENI ERTI', '085817227457', 'vivisavitri2201@gmail.com', 'JL. PADEMANGAN TIMUR VIII RT.008 RW.010 NO.54 JAKARTA UTARA', '17', 2016, 'anonim.png', 'Vivisavitri', '6998fe05b094a4a0c8742bc12b647fc1', 'terserahgua', 'aktif', 'JAKARTA'),
	(48, '10469', 'Dio Dwi Suryana', '2001-02-26', 'L', 'Islam', 'Dedi Supriyadi', 'Teti Royati', '089643423626', 'dio26suryana@gmail.com', 'Jl.Teratai IV Rt: 05 Rw:03 Kel:sunter agung Kec:Tj.priok\r\n', '18', 2016, 'anonim.png', 'diodwi_sryn', 'cc6063dd756659a4d938804954fb4555', 'diodwi26', 'aktif', 'Jakarta'),
	(49, '10492', 'FEBRINA KARIN RACHMAWATI', '2001-02-26', 'P', 'Islam', 'AKHMAD ASKABUL', 'RIANTI FITRI ASTUTI', '085714752900', 'cacafebrina483@gmail.com', 'Jl.ANCOL SELATAN NO:51 RT:011 RW:002 SUNTER AGUNG', '16', 2016, '756bbadd03c751bff43e5898372088aa.jpg', 'FEBRINA KARIN RACHMAWATI', 'afa487a2de3f4072ed4615724450dcc0', 'AKUSENANG', 'aktif', 'JAKARTA '),
	(50, '10481', 'FADYAH NUR RAHMAWATI', '2001-02-21', 'P', 'Islam', 'MUHAMAD JAMIN', 'SITI ROMLAH', '08987772100', 'fadyahnurrahmawati@gmail.com', 'JALAN AGUNG UTARA 17 BLOK A 15 NO 15 RT. 02 RW. 09 KELURAHAN SUNTER AGUNG KECAMATAN TANJUNG PRIOK JAKARTA UTARA', '21', 2016, 'anonim.png', 'fadyahnurrahmawati', '3803d55ca48701b06291a1f77ab7538c', 'unguputih', 'aktif', 'JAKARTA'),
	(51, '10614', 'TRIANA KRISANDINI', '2001-03-21', 'P', 'Islam', 'TANURI', 'KANI', '087887620181', 'alyanatriana40@gmail.com', 'JL. UTAN PANJANG 3 RT 01 RW 07 NO 3 ', '17', 2016, 'anonim.png', 'trianakrisandini', 'df0076609ce38fb70bf7276b91f3ac35', '21032001', 'aktif', 'JAKARTA'),
	(52, '10589', 'RINA APRILIANI', '2001-04-06', 'P', 'Islam', 'PRIHATINTO', 'RENI NILAWATI', '085714314031 ', 'rapriliani723@gamil.com', 'JL BENTENG V/59 RT 006/05 SUNTER JAYA', '21', 2016, 'anonim.png', 'Rina apriliani', 'ff87962e9a719f27184d7965294ffbc5', 'sman41jakarta', 'aktif', 'JAKARTA'),
	(53, '10543', 'MUHAMMAD ADIL MUBARAK', '2001-07-24', 'L', 'Islam', 'MAULANA IMANUDDIN', 'YULI ANDRAYANI', '085892602246', 'MAdilM228@gmail.com', 'JL.KB SEJAHTERA ', '20', 2016, 'anonim.png', 'MAdilM', '5cf0d2e71308efacc96828df05a17446', 'adilgembel', 'aktif', 'JAKARTA'),
	(54, '10468', 'DINDA ELSA RAMADANI', '2000-12-13', 'P', 'Islam', 'BASAR P RALA', 'RUSDAWATI', '088212811624', '', 'JL.TELAGA RAYA RT.17 RW.01 NO.8 ', '17', 2017, 'anonim.png', 'dindaermd', 'f16d80ec33a077bde7f269be16e35b35', 'dindaermd13', 'aktif', 'JAKARTA'),
	(55, '10524', 'LUTHFI TRI ANDINI', '2000-07-29', 'P', 'Islam', 'HERMAN', 'SITI RATNA', '087781244235', 'luthfiandini29@gmail.com', 'JL.WARAKAS 1 GG 19 NO.26A RT.012 RW.014 KEL.WARAKAS JAKARTA UTARA', '17', 2016, 'anonim.png', 'Luthfi tri andini', 'b1ad145462ad4f011745e15e13f85fe1', 'sugaswag', 'aktif', 'JAKARTA'),
	(56, '10439', 'ANNISA FEBRIANTI', '2001-02-16', 'P', 'Islam', 'SUNARDI', 'ERI KURNIATI', '081211537950', 'annisa.azka18@gmail.com', 'Jln. SA. Cempaka VIII Rt 03 Rw 03', '16', 2016, 'a7e463e85c47487d0c175f5b85191d40.jpg', 'annisafebrianti16', '254d7ab960277991b238828086c50a8a', 'annisafebrianti1618', 'aktif', 'JAKARTA'),
	(57, '10443', 'Arcin Millennium Oktoga', '2000-10-03', 'L', 'Islam', 'Armanto', 'Liong Thiuk Tjin', '', 'yogyog377@gmail.com', 'jl.muara bahari rt 20 rw 01 no 25', '16', 2016, 'anonim.png', 'yogyog377', '6b36aa0307265b0e07284cbc1d5d71de', 'terserahluu123', 'aktif', 'Jakarta'),
	(58, '10602', 'SHAFIRA OKTAVIA ANGGRAENI', '2001-10-23', 'P', 'Islam', 'PUDJI RAHARDJO', 'SUSY WIDYANINGSIH', '083898550575', 'shafiraoktavia21@gmail.com', 'JL.JATI 9 SUNGAI BAMBU RT009/RW009 NO34 TANJUNG PRIOK JAKARTA UTARA', '17', 2016, 'anonim.png', 'shafiraoktavia', '47bd99f6bfda9165a008eca3446b3e66', 'shafiraoktavia23', 'aktif', 'JAKARTA'),
	(59, '10436', 'ANISYAH MONICA', '2001-04-09', 'P', 'Islam', 'AHMAD SYARIF', 'NINA ROSDIANA', '083895974515', 'anisyahmonica941@gmail.com', 'JL. PAM 3 SUMUR BATU RT011 RW08 NO 10', '20', 2016, 'anonim.png', 'anisyahmonica941@gmail.com', 'a846cec78dcafe9190b8f0f8c198d3f5', '090401ans', 'aktif', 'JAKARTA'),
	(60, '10516', 'KHOIRUN NISA', '2001-01-05', 'P', 'Islam', 'SUKIRMAN', 'SRI ODJAH', '087883877712', 'kruichaa@gmail.com', 'JL. WARAKAS 6 GANG 11 NO.127 RT 11 RW 10 KEL. WARAKAS KEC. TJ. PRIOK JAKARTA UTARA', '20', 2016, 'anonim.png', 'KHOIRUN NISA', '815787d69ac1265c809c171eacf87512', '05januari01', 'aktif', 'JAKARTA'),
	(61, '10499', 'HASRI INDAH SARI', '2001-03-09', 'P', 'Islam', 'NURHASIM', 'SRIYANI', '085882209718', 'Indahsari9399@yahoo.com', 'Jl. BUDI MULIA RT008 RW011 NO 41, PADEMANGAN BARAT, JAKARTA UTARA', '17', 2016, 'anonim.png', 'HasrIndahMrqz', '0c59b3e8a8b94c09184a2d1bdc4d1a50', '172931', 'aktif', 'JAKARTA'),
	(62, '10510', 'JODI RACHMADI', '2000-11-29', 'L', 'Islam', 'SURADI', 'SUCIATI', '0857-1705-5762', 'Jodi.rachmadi1221@gmail.com', 'JL. ANCOL SELATAN RW.02 RT.009 NO.31B\r\nKEC.TG PRIOK  KEL.SUNTER AGUNG', '20', 2016, 'anonim.png', 'Jodi29', 'bd43664f90f11ed473b5666830d21fa3', 'jodirachmadi', 'aktif', 'JAKARTA'),
	(63, '10601', 'SELSA DANYA FITRIA ', '2017-12-19', 'P', 'Islam', 'MUNADJAT', 'VIN SILVIANI', '083879705681', 'selsadannya19@gmail.com', 'JLN. WARAKAS 1 GG 23 RT01/07 TG. PRIOK, JAKARTA UTARA', '20', 2016, 'anonim.png', 'SELSA DANYA FITRIA', '39a713478f84a6de35dfde65be970585', '191201', 'aktif', 'JAKARTA '),
	(64, '10632', 'ZULKIFLI EKA MAULANA', '2001-03-16', 'L', 'Islam', 'ZIKKI ABDUL ROJAK', 'SITI YULAEHA', '087878465535', 'Joulekifli16@gmail.com', 'JLN.KRIDA RAYA NO.10 RT 09 RW01', '17', 2016, 'anonim.png', 'Zul_alan_esteh', 'a4d28a00bdd8df28b025b50ab9f8cf63', 'bloods16', 'aktif', 'CIREBON'),
	(65, '10420', 'ADELLA ELSA PUTRI', '2001-10-09', 'P', 'Islam', 'SAYADI', 'LENI NAMIN', '089607269091', 'adellaep41@gmail.com', 'JL.F5 SERDANG RAYA NO.40 RT.04 RW.09 CEMPAKA BARU,KEMAYORAN,JAKARTA PUSAT,DKI JAKARTA', '17', 2016, 'anonim.png', 'Adellaelsptr', '82682943a05de360abb183236c632bd6', 'putri123', 'aktif', 'JAKARTA'),
	(66, '10495', 'HABIL ARIF RACHMAN', '2001-05-04', 'L', 'Islam', 'LUKMAN ARIFIN', 'IDA SORAYA', '085780014255', 'habilarif1@gmail.com', 'JL.SUNTER JAYA II A', '19', 2016, 'anonim.png', 'habilarifrachman', 'd8d8a907c153cb869df51cae024c2499', 'r75658305', 'aktif', 'JAKARTA'),
	(67, '10547', 'MUHAMMAD RAKHMAT AGHISNA', '2000-12-29', 'L', 'Islam', 'AZIZ DAWAIR', 'LUDIYAH', '081316869414', 'rakhmat2664@gmail.com', 'JALAN BHAKTI IV RT 015 RW 02 NO 8B TANJUNG PRIOK JAKARTA UTARA', '20', 2016, 'anonim.png', 'rakhmat', 'c2a1b25a830156ff3e56694ba7254da8', '266472885asd', 'aktif', 'KEBUMEN'),
	(68, '10421', 'Ahmad Labib Husain', '2001-10-20', 'L', 'Islam', 'Priyo Imam Santoso', 'Leginah', '0895327364358', 'labibmundur123@gmail.com', 'Jl. Harapan mulia 4 no. 4 rt006 rw05 kelurahan:harapan mulia kecamatan:kemayoran kota: Jakarta Pusat', '18', 2016, 'anonim.png', 'crowzero3241', 'c4df7f7b89776d2737218a535a5cc421', 'bibzinc123', 'aktif', 'Jakarta'),
	(69, '10442', 'ARANDA TRI SANDYADENTA', '2002-01-31', 'L', 'Islam', 'HARTONO', 'KARMINTEN NINGTYAS', '085719001864', 'aranda_denta31@yahoo.com', 'JALAN KAMPUNG IRIAN GANG 26,SERDANG,JAKARTA PUSAT,RT 16/RW 06,KELURAHAN KEMAYORAN', '18', 2016, 'anonim.png', 'ARANDA TRI SANDYADENTA', '273cfe0dafedb8a032e7a0186079d448', '31012002', 'aktif', 'JAKARTA'),
	(70, '10432', 'ANDINI NOVELLA SARI ', '2000-11-11', 'P', 'Islam', 'ACEP', 'IDA ROYANI', '08161126771', 'idaroyani19332@gmail.com', 'JLN. SUNTER MUARA RT. 017 RW. 05 NO. 68 JAKARTA UTARA', '20', 2016, 'anonim.png', 'ANDINI NOVELLA SARI', 'd28153ae894216a94df469319295b78f', 'novelcantik', 'aktif', 'JAKARTA'),
	(71, '10465', 'DHITA PUTRI DAMAYANTI', '2001-05-15', 'P', 'Islam', 'EKO M AMIN', 'TITI SUGIARTI', '089618536815', 'putridhita040@gmail.com', 'JL PANCA III RT 13 RW 01 NO 30 KECAMATAN KEMAYORAN.KELURAHAN SERDANG JAKARTA PUSAT', '20', 2016, 'anonim.png', 'DHITA PUTRI DAMAYANTI', '772593097bc14efd57ac1f99afd93b86', 'DHITAPUTRI', 'aktif', 'SURABAYA 15 MEI 2001'),
	(72, '10438', 'ANNISA AYU PERMANA', '2001-07-03', 'P', 'Islam', 'NANA SULARSANA PERMANA', 'ELIN SETIANI', '08988384332', 'annisaayupermana@gmail.com', 'Jl. BENTENGAN VI RT.007 RW.005 KELURAHAN SUNTER JAYA, JAKARTA UTARA', '17', 2016, 'anonim.png', 'ANNISA.AP', '804ac68652c8534cdfd028759e57b1ad', 'kyungsoo', 'aktif', 'TANGERANG'),
	(73, '10596', 'SALMAN ALFARIZQI', '2001-10-26', 'L', 'Islam', 'YUSMANTO', 'TURYANI', '083872227016', 'slmnalfrzq@gmail.com', 'Jl. SUNTER JAYA 2 A RT02 RW02 NO 32 KELURAHAN SUNTER JAYA KECAMATAN TANJUNG PRIUK JAKARTA UTARA', '21', 2016, 'anonim.png', 'slmnalfrzqi', '05078bc60c444465f46426a1c361bf1a', 'mansalman26', 'aktif', 'JAKARTA'),
	(74, '10507', 'IRA ROSIDA YUNIARTI', '2001-06-21', 'P', 'Islam', 'ACH. SUGIYARTO', 'NYI OMAH', '081280303193', 'irarosida21@gmail.com', 'JL. GANGGENG 4 NO : 23 RT/RW: 07/01', '18', 2016, 'anonim.png', 'Irarosida21', '54c16293e8baa570b6dc0922dab541db', 'irarosiday21', 'aktif', 'JAKARTA'),
	(75, '10526', 'MARWAH DIAN HUSAERI', '2017-11-27', 'P', 'Islam', 'MUHIDIN', 'SRI SUBANDINI', '081932834413', '', 'JL AGUNG BARAT 18 BLOK B 16 NO 3 SUNTER PODOMORO', '21', 2016, 'anonim.png', 'MarwahDian27', '1a8855c5fb6ea99b77cb46d1eda9d0cc', 'reyhan.fath', 'aktif', 'BEKASI'),
	(76, '10450', 'AZIZAH TRIHAPSARI', '2001-01-04', 'P', 'Islam', 'MUHAMMAD SALEH', 'SUMARNI', '081383219116', 'azizahtrihapsari8@gmail.com', 'Jl.utan panjang III rt 013/006', '16', 2016, 'anonim.png', 'azizah12', 'c15473b208ee2a2e3e46099e4899efc1', 'azizah12', 'aktif', 'MAKASSAR'),
	(77, '10448', 'AYU NOVARIANTI', '2000-11-06', 'P', 'Islam', 'NUR SOLEH', 'ATIK SETIYANI', '087738361949', 'ayunova2017@gmail.com', 'JL ANCOL SELATAN RT03/02 NO.61', '16', 2016, '4c0490c9a51b8f19207f85aa1927940a.jpg', 'ayunrianti', '39f9d06632e30bec71c65d545f62d8a9', 'ayunova123', 'aktif', 'JAKARTA'),
	(78, '10455', 'Bima', '2000-10-13', 'L', 'Islam', 'Romdoni', 'Hariyanti', '085891411398', 'bima99016@gmail.com', 'Jl.PLK 2. No 56 rt 09/01 kec.makasar/makasar Jakarta Timur', '16', 2016, '816930426eaceb86ca352d93f3de3e81.jpg', 'Bima', '642979c9b6f2c9f26ad0b019dcb912b8', 'thegunners', 'aktif', 'Jakarta'),
	(79, '10532', 'MITHA ROHANA', '2001-06-04', 'P', 'Islam', 'MARSONO', 'SUMARNI', '08971607119', 'mitharohana22@gmail.com', 'JL.BERLIAN 3 NO.9 RT 11/ RW 04 \r\nKEL. SUMUR BATU \r\nKEC. KEMAYORAN \r\nJAKARTA PUSAT', '20', 2016, 'anonim.png', 'MITHA ROHANA', '6dc53b08ca2958536c6bc09590bcc5de', 'MITHAROHANA040601', 'aktif', 'JAKARTA'),
	(80, '10562', 'NIKEN SALSABILLAH ', '2001-06-26', 'P', 'Islam', 'PONIMAN', 'SUNARMI', '087877441598', 'nikensalsabillah@yahoo.co.id', 'JALAN SERDANG BARU 04 RT 12 RW 04 NO 11', '18', 2016, 'anonim.png', 'NIKEN SALSABILLAH ', '1036e2df52fa2e15fce3b51af5807db2', '26juni2001', 'aktif', 'JAKARTA'),
	(81, '10458', 'BTARI PRABANINGRUM', '2001-06-21', 'P', 'Islam', 'RADEN ARGO PRABOWO', 'UMIYATI', '085781598287', 'bprabaningrum@gmail.com', 'Cempaka putih utara no. 6 rt 07 rw 02', '16', 2016, 'anonim.png', 'btari21', '270300392ae04f4a03f7264033640250', 'macil123', 'aktif', 'JAKARTA'),
	(82, '10641', 'HAIKAL MUBAROK', '2001-11-12', 'L', 'Islam', 'RAHMAT HIDAYAT', 'ERAWATI', '', 'haikalmubarok@gmail.com', 'JLN. SERDANG RT .02 RW. 04 NO. 20 KEC. KEMAYORAN KEL. SERDANG', '16', 2017, 'anonim.png', 'Haikal32', 'e413a9fe89473cdcbbdd92ae85391fa1', '010203ical', 'aktif', 'JAKARTA'),
	(83, '10447', 'AUZAN RAFIF YUHART', '2000-11-29', 'L', 'Islam', 'HARYANTO', 'AYU VETRI', '081311323123', 'auzanyuhart9@gmail.com', 'JL SERDANG BARU IV GANG VII RT 14 RW 04 NO 3D', '19', 2016, 'anonim.png', 'auzanyuhart', '0eed498a1bf8968754735112d1420b9e', 'yuhart1401', 'aktif', 'JAKARTA'),
	(84, '10502', 'HUSNU LISA\'ADAH', '0000-00-00', 'P', 'Islam', 'SUGENG SANTOSO', 'SUTIYEM', '083897038509', 'alishusnu41@gmail.com', 'JLN.KEBON KOSONG 18 RT.008/RW.003 NO.03', '19', 2016, 'anonim.png', 'husnulisaadah', 'fb5a8165231ef1d0e39c0adfeaffb4b1', 'muslimah17', 'aktif', 'JAKARTA'),
	(85, '10461', 'CLAURIZSANTI ASTRI PRATIWI', '2002-05-05', 'P', 'Islam', 'NURKHOLIL', 'SULASTRI', '085880408042', 'claurizsanti@gmail.com', 'JL. BHAKTI 3 RT 15 RW 02 NO 45 SUNTER JAYA JAKARTA UTARA', '18', 2016, 'anonim.png', 'CLAURIZSANTI ASTRI PRATIWI', '7dfdef74eaa8a3f90811dbf3cdfe5004', '05052002', 'aktif', 'JAKARTA '),
	(86, '10437', 'ANJAR RAEHANANDA SALSABILA', '2000-11-01', 'P', 'Islam', 'IMAM SANTOSA', 'EMI JUMIATI', '085774804963', 'anjarrae@gmail.com', 'JL. PANCA 8 RT 14/01 NO 20 SERDANG, KEMAYORAN, JAKARTA PUSAT', '20', 2016, 'anonim.png', 'Anjarhnds', 'd1adbb25b8defb12f1cc890e150e56b1', 'anjarrae01', 'aktif', 'JAKARTA'),
	(87, '10591', 'RIZA OKTARINA FADILLAH', '2000-10-05', 'P', 'Islam', 'SUHERMAN', 'EISSTTY', '087786161362', 'rizaoktarina699@gmail', 'JL.SERDANG BARU XII NO.11 RT:16 RW:05', '17', 2016, 'anonim.png', 'rizaoktarina', '5c449c2e3af1df1a2015c7c7dd50f110', 'oktarinariza051020', 'aktif', 'JAKARTA'),
	(88, '10464', 'DESWINDAH FITRI NATALIA', '2001-12-17', 'P', 'Kristen', 'SIHAR MARUDUT PASARIBU', 'SITI MAWARNI SIMAMORA', '082298119845', 'deswindanatal@gmail.com', 'Jl. Kampung bugis rt01/03', '18', 2016, 'anonim.png', 'Deswinda_natalia', '76e95a522cb8f6175c8d656fce58ac85', 'pasaribu123', 'aktif', 'JAKARTA'),
	(89, '10580', 'RAMDHONI SHIDIQ ISMAIL', '2000-12-13', 'L', 'Islam', 'WIRYO PUSPITO', 'WARTINI', '-', 'ramdhons21@gmail.com', 'JL. SIAGA 3 RT016/03 NO.11 KEL. CEMPAKA BARU KEC. KEMAYORAN', '17', 2016, 'anonim.png', 'ramdhoni13', 'cdea2653619a66282ab7d02087e8a5d9', 'keepsmile019', 'aktif', 'JAKARTA'),
	(90, '10504', 'ILHAM NUR DHIAN', '2001-05-15', 'L', 'Islam', 'BASAR ROSADI', 'TATI ROMIYATI', '089692629245', 'ilhamrun123@yahoo.com', 'Jl.pam III no.5 rt11/08 kec.kemayoran, kel.cempaka baru', '19', 2016, 'anonim.png', 'Ilhamrun123', '0ca43ef322ad140983e79133857edca0', 'iam123iam', 'aktif', 'JAKARTA'),
	(91, '10530', 'MIFTA IREZA NUR APRIANT', '2001-04-20', 'P', 'Islam', 'TRI SULISTYO', 'REFI SANTI', '085776404483', 'miftaireza20@gmail.com', 'JALAN TELAGA INDAH I SUNTER JAYA, RT 02 RW 01 NO 25 ', '20', 2016, 'anonim.png', 'MIFTA IREZA NUR APRIANT', 'd7cf0453fdd651e454b699439e4aedfa', 'IREZ2020', 'aktif', 'JAKARTA'),
	(92, '10565', 'NUR FITRIYANI', '2001-01-08', 'P', 'Islam', 'ANDI', 'NENEH HASANAH', '089632513790', 'nurfitriyani297@gmail.com', 'KP.NIPAH GANG KELAPA RT.011 RW 002 NO.23', '20', 2016, 'anonim.png', 'Nur Fitriyani', '48bee54814ccfbb9687cd436e6b40837', 'Nurfitri02', 'aktif', 'JAKARTA'),
	(93, '10642', 'HERSA SAPUTRA', '2001-06-16', 'L', 'Islam', 'FERIADI', 'SITI KHOTIAH', '08990364603', 'hersa34@gmail.com', 'JALAN SUNTER MUARA RT09 RW05 NO29A', '16', 2016, 'anonim.png', 'Sason', '3ce8cf1ba7a94c6b436622ee4508da16', 'anakmuara09', 'aktif', 'JAKARTA'),
	(94, '10571', 'PUTRI EKA KALISSA', '2001-06-02', 'P', 'Islam', 'USKANDI', 'SULISTIYOWATI', '0895325040248', 'putrikaliss02@gmail.com', 'Jln panca 6 rt 13 rw 01 no 20', '17', 2016, 'anonim.png', 'PUTRI EKA K', '9c50183986f1749cd3f140f5f49f9eaa', 'putri02062001', 'aktif', 'JAKARTA'),
	(95, '10652', 'Muhammad Kaisar Stevan Priadi', '2001-09-14', 'L', 'Islam', 'Asep Supriadi', 'Selvi Susanti', '081298647498', 'AncolCity14@gmail.com', 'Jl.Budi Mulia Rt 11 RW 12', '19', 2017, 'anonim.png', 'Ancolcity14', 'ff4b15f8d301b19d24a16a20c8c11820', 'Tawakal41', 'aktif', 'Jakarta'),
	(96, '10609', 'SYAHDANIA SURYA RAHMADAYANTY', '2001-12-19', 'P', 'Islam', 'EDIS SURYANA ', 'MASITOH', '087878415918', 'dania678@gmail.com', 'JL. UTAN PANJANG 3 RT.07 RW.03 NO. 24', '17', 2016, 'anonim.png', 'SYAHDANIA', '9136ceb887add322d111eebe960b87e3', 'syahdania123', 'aktif', 'JAKARTA'),
	(97, '10467', 'DIFRITA FASYA ZAHIRAH', '2001-05-28', 'P', 'Islam', 'JEFFRY MARINDO', 'WIDIYUNARTI', '085892641489', 'difritaf28@gmail.com', 'JL HARAPAN JAYA NO 13 RT 7 RW 4 KEL CEMPAKA BARU KEC KEMAYORAN JAKARTA PUSAT', '17', 2016, 'anonim.png', 'Difritazahira', 'e9582e8b40812010637f0728bc10f759', 'cantik28', 'aktif', 'JAKARTA'),
	(98, '10418', 'AHMAD SYAIPUL BAHRI', '2001-05-30', 'L', 'Islam', 'AHMAD SYAPUDIN', 'I KETUT PAMIASTINI', '082299972616', 'ahmadbahri2001@gmail.com', 'PAPANGGO 2C RT.008 RW.03', '16', 2016, 'anonim.png', 'ahmadbahri3005', '61997836eadba90aef32fb35d8236f6d', 'ahmadbahri3005', 'aktif', 'DUNIA'),
	(99, '10491', 'FAWQI DWICAHYO FIRDAUS', '2000-10-25', 'L', 'Islam', 'MUJIONO', 'ISTINI', '085694111452', 'fawqijokam@gmail.com', 'JL.KEDONDONG2 RT10/RWO6', '16', 2016, 'anonim.png', 'FAWQI DWICAHYO FIRDAUS', '12fa1389f4eb76c247dcacdeca366083', 'fawqi354', 'aktif', 'JAKARTA'),
	(100, '10640', 'DINA AMANDA', '2000-09-28', 'P', 'Islam', 'JUHARA RITONGA', 'SYARIFAH HANNUM', '083806077784', 'Dinaamanda722@gmali.com', 'JALAN KEPU BARAT', '21', 2016, 'anonim.png', 'Dina Amanda', '286cc861e37f87ad003d911291b18574', 'ritonga28', 'aktif', 'PURBA NAULI'),
	(101, '10521', 'KURNIA BANOWATI AZALIA AMANDA', '2001-07-30', 'P', 'Islam', 'SUBARKAH', 'ISAH PRIYATINI', '08128682204', 'kurniabanowati3@gmail.com', 'JL. MUTIARA SUMUR BATU NO.41', '21', 2016, 'anonim.png', 'Kurnia Banowati Azalia Amanda', '77aa6a91b0b6e1bedb42dac95aa29fbe', 'kurniabanowati', 'aktif', 'JAKARTA'),
	(102, '10645', 'NANDA HESTIANA DELIANI', '2001-06-24', 'P', 'Islam', 'MASIRIN', 'ENIYA LISNAWATI', '085882655337', 'Nandahestiana24@gmail.com', 'Jl.SUNTER JAYA 2A RT 03,RW02 NO.35 JAKARTA UTARA', '21', 2016, 'anonim.png', 'Nanda hestiana', '1f931da6433403f12a68325b17de106c', 'Nanda123', 'aktif', 'JAKARTA'),
	(103, '10444', 'ARDHI SAPUTRA', '2017-07-07', 'L', 'Islam', 'MUHAMMAD RAMDHANI', 'HERNY WAHYU NINGSIH', '085810858712', 'Woles.barcelona@yahoo.com', 'JALAN MUARA BAHARI RT 022/01', '20', 2016, 'anonim.png', 'ARDHI SAPUTRA', '91a0b698e982d2140d01c464ddcd308f', 'bahari123', 'aktif', 'JAKARTA'),
	(104, '10501', 'HUSNIA FAIZZAH FIKRIAH', '2001-06-06', 'P', 'Islam', 'SUBONO', 'DWI KURNIATI', '085777415041', 'husniafaizzah06@gmail.com', 'JL. KAMPUNG IRIAN RT 018 RW 06 NO 30', '21', 2016, 'anonim.png', 'Husnia Faizzah', 'c8504a53325d594e61ba0cd21ad907b4', 'husnia6601', 'aktif', 'JAKARTA'),
	(105, '10429', 'Anas Akbar Ghozali', '2000-12-05', 'L', 'Islam', 'AMAR MA\'RUF', 'MARYATI', '087817526365', 'anasakbarghozali@gmail.com', 'Jl.Sunter Jaya', '19', 2016, 'anonim.png', 'Anasakbarg', 'd4bbeebb9847729c7da7fb6751aa56c9', '01mertapada', 'aktif', 'Bumiayu'),
	(106, '10606', 'SONYA GITA PERMATASARI', '2000-05-14', 'P', 'Islam', 'TRI SAKSONO', 'LINDA FITRIANA', '089504036318', 'sonyagitapermatasari@gmail.com', 'JL.SUMURBATU RT02/06 NO.24 ', '19', 2017, 'anonim.png', 'Sonyagita', '1c700fd84bc5958ae58d63773efb2186', '02142887283', 'aktif', 'JAKARTA'),
	(107, '10557', 'NADIA HIJRIYAH', '2001-03-26', 'P', 'Islam', 'UNU IMAN NUGROHO', 'ERIS RISNAWATI', '0857714314108', 'nhijriyah26@gmail.com', 'Jl. Gg taruna 1 no 6 ', '21', 2016, 'anonim.png', 'ndiahjryh', 'b18d8e6405b74dec637c1ed8364d164d', '26maret2001', 'aktif', 'JAKARTA'),
	(108, '10654', 'SARRA SAFIRA', '2001-09-11', 'P', 'Islam', 'KAMALUDIN', 'ROSNIAWATI', '087885551390', 'sarra.safira09@gmail.com', 'JL. KALIBARU TIMUR 5 GG 7 NO. 26 RW07/005 KEL. BUNGUR KEC. SENEN ', '19', 2017, 'anonim.png', 'sarrasafira', '5e3ec29a4fbce42994e1fc2cef156aad', 'sarra5975', 'aktif', 'DKI JAKARTA '),
	(109, '10475', 'ELVIRA VARADILLA OKTAVIANI', '2001-10-19', 'P', 'Islam', 'SAMSUDIN', 'NENENG MARYATI', '081219156325', 'varadillae@gmail.com', 'JL. ANCOL SELATAN RT 01 RW 03 NO 72. KELURAHAN: SUNTER AGUNG. KECAMATAN: TANJUNG PRIOK', '19', 2016, 'anonim.png', 'elvira varadilla', 'a0b9b2518313bcf77c7443b0fcde9682', 'vira261926', 'aktif', 'JAKARTA'),
	(110, '10453', 'BAGAS HADI NUGROHO', '2001-03-08', 'L', 'Islam', 'HARYADI JOKO LAKSONO', 'DIAH FAJAR PERTIWI', '089637005931', 'bagashadinugroho2@gmail.com', 'JL. SUNTER JAYA IV A NO 32 RT 004/ RW 003 TANJUNG PRIOK JAKARTA UTARA', '19', 2016, 'anonim.png', 'bagashadinugroho', '4caa12c5c5aae3a4868f14aff4ed5bb4', 'ladigaga999', 'aktif', 'JAKARTA'),
	(111, '10509', 'JASON', '2002-04-22', 'L', 'Katholik', 'JEFRI ROSMAN', 'EVA LIANA', '08984701888', 'jasonliu220441@gmail.com', 'JALAN ANCOL SELATAN RT11 RW01 NO12 ', '19', 2016, 'anonim.png', 'jason', '73881f192582b7f6f63cc64644406a1d', '93585155', 'aktif', 'Jakarta Utara'),
	(112, '10536', 'MUHAMAD JULHAM FADLI', '2001-02-05', 'L', 'Islam', 'NANANG', 'MARWATI', '081317398035', 'fadli.coy145@gmail.com', 'Jl.  Budi mulia rt 03 rw 010 No. 98 pademangan barat', '17', 2016, 'anonim.png', 'fadli.coy145', '260c8f80afd2053b8c86e91496e41cf8', 'a99522765', 'aktif', 'JAKARTA'),
	(113, '10561', 'NAUFAL FAUZI', '2001-10-05', 'L', 'Islam', 'USMAN', 'SANEM', '089693322109', 'novajago72@gmail.com', 'Jl agung tengah 7 blok 6 no 1', '16', 2016, 'anonim.png', 'nfallfzi', '390a405f3921ba894e73e78fc7352431', 'sayangdiaa', 'aktif', 'JAKARTA'),
	(114, '10582', 'RENDY KURNIADI', '2001-01-11', 'L', 'Islam', 'TARISNO', 'WINDARTI', '087786532809', 'rndykurniadi45@gmail.com', 'JL.WARAKAS V GG.13 NO.92 RT.10 RW.12', '17', 2016, 'anonim.png', 'rndykurniadi', '09686011805df9960ca448ca7d7215f2', 'kurniadi41', 'aktif', 'JAKARTA'),
	(115, '10486', 'FANNY AMELIA PUTRI', '2001-11-12', 'P', 'Islam', 'SUTRISNO', 'PUJI LESTARI', '081280363810', 'fannyamelia01@gmail.com', 'JL. KEMAYORAN BARAT 13 RT13/RW06 NO.16 KEMAYORAN JAKARTA PUSAT', '17', 2016, 'anonim.png', 'fannyamelia', '4e1d0a738b34e998797ee9baf5d0ad78', 'fannyamelia123', 'aktif', 'GROBOGAN'),
	(116, '10570', 'PUTRI ANJANI', '0000-00-00', 'P', 'Islam', 'AMRIZAL', 'SURYANI', '089504263771', 'putanjani8@gmail.com', 'JL.KEBON KOSONG 14', '19', 2016, 'anonim.png', 'putri anjani', '9c4355c5ad0e137af31c7e329f40fed1', 'puput22', 'aktif', 'JAKARTA'),
	(117, '10519', 'KINTAN SEPTIANI', '2001-09-17', 'P', 'Islam', 'KAMBALI', 'SRI HARYANI', '089601692497', 'kintanseptiani@gmail.com', 'JL.LAPANGAN PORS RT.15/04 KEC.KEMAYORAN', '16', 2016, 'anonim.png', 's.kintan', 'a53149be551fb6530701eac181454358', 'kintan228', 'aktif', 'PEMALANG'),
	(118, '10457', 'BOMA WIKAN REKSO PRASOJO', '2001-08-01', 'L', 'Islam', 'SUWITO', 'SUMINI', '085774874839', 'bomawikan45@gmail.com', 'Jln warakas 4 gang 22 rt 04 rw007 papanggo, tanjung priok, jakarta utara', '20', 2016, 'anonim.png', 'BOMA WIKAN', '23ed997a7235b4638ed935fbbc61e957', 'jakartatimur', 'aktif', 'JAKARTA'),
	(119, '10749', 'FADILAH HURIYAH FARADITA', '2001-05-27', 'P', 'Islam', 'BAHSUKI', 'SITI KOMARIYAH ', '085816811173', 'Fadilahfaradita@gmail.com', 'JL PAPANGGO 1B NO 39 RT008/01', '18', 2016, 'anonim.png', 'FADILAHHURIYAH', '1e3ceeb829d223632cb25f8faf148c77', '2705dilah', 'aktif', 'JAKARTA '),
	(120, '10435', 'ANISA WAHYUNI ARDILA', '2001-02-17', 'P', 'Islam', 'SUNGKONO', 'MAY APRIDA', '081212408617', 'anisawahyuniardila19@gmail.com', 'Jl. WARAKAS 6 GG 16 NO 89A RT 03 RW 05 ', '16', 2016, 'anonim.png', 'anisaniar_', 'ab5bf7fdbd3e8ebb9dc6967ca7eb5747', '17022001', 'aktif', 'JAKARTA'),
	(121, '10542', 'MUHAMMAD ABBY HARTADI', '2001-11-02', 'L', 'Islam', 'Raden Benny Triawan', 'Mardalena', '085694680808', 'abbyhartadi@gmail.com', 'Jalan Cempaka Putih Utara RT. 07 RW. 02        NO. 11', '18', 2016, 'anonim.png', 'papa363', '0fc8b82bdb4b2c7b981a864e1d30c5b6', 'paralon363', 'aktif', 'Jakarta'),
	(122, '10600', 'SATYA PUTRA TAMA', '2001-03-13', 'L', 'Islam', 'BUDI SUPRIYANYO', 'SRI BUDIARTI', '089509663981', 'satyaptr13.spt@gmail.com', 'JL. CEMPAKA INDAH RT002/07 NO.8 KELURAHAN HARAPAN MULYA KECAMATAN KEMAYORAN JAKARTA PUSAT', '21', 2016, 'anonim.png', 'satya69', 'f2c0dda3c292301c881b1fbfd2b4971e', 'anakbejad', 'aktif', 'JAKARTA'),
	(123, '10568', 'PANDIKA APDWIJAYA', '2000-11-10', 'L', 'Islam', 'BENI WIJAYA', 'ESTU SUDARMANI', '081191199278', 'papdwijaya@gmail.com', 'JL SUNTER MUARA RT012/05 NO18', '18', 2016, 'anonim.png', 'Pandika12', '4b1d4feb625059cf86c85e44451c429f', 'sunter12', 'aktif', 'JAKARTA'),
	(124, '10535', 'MUCHTAR ALMANAWAF', '2001-02-17', 'L', 'Islam', 'IMRON', 'SITI MARFUATUN', '08811353812', 'muchtardivision88@gmail.com', 'Jl agung perkasa 10 blok k2 no 10', '18', 2016, 'anonim.png', 'muchtareclat', '8073d90f1269f03877b4d1b77b992fa8', 'muchtarshadowcoervus', 'aktif', 'JAKARTA'),
	(125, '10604', 'SITI FARIKHA', '2001-05-23', 'P', 'Islam', 'Tumijo', 'Ndoniyah ', '087887575557', 'farikha230501@gmail.com', 'Jl Kedongdonk Rt 13 Rw 06 No 53, kelurahan : Sunter Jaya, Kecamatan : Tanjung Priok', '18', 2016, 'anonim.png', 'sitifarikha23', '1e4b74bab2c12b0fb6fa5e08b2b3048c', 'sitifarikha', 'aktif', 'Kebumen'),
	(126, '10431', 'ANDHIKA BHANU NANDANA', '2000-09-28', 'L', 'Islam', 'TOTO HARYONO', 'HERIYANI', '081382143357', 'andhika.nandana@gmail.com', 'JLN.SWASEMBADA TIMUR XIV NO.33 RT 04 RW 05 JAKARTA UTARA', '20', 2016, 'anonim.png', 'Andhika28', 'f0f347a182e4234a8705f3b8d06675e3', '280900', 'aktif', 'JAKARTA'),
	(127, '10470', 'DODI KURNIAWAN', '2001-07-19', 'L', 'Islam', 'TRIYO SUTOPO', 'SUPRAPTI', '081291788501', 'dodikurniawan2001@gmail.com', 'JL.WARAKAS 9 GG.13 NO.47 RT.009 RW.011 JAKARTA UTARA.', '20', 2016, 'anonim.png', 'DODI KURNIAWAN', 'de30859ddb27ae630adf82ce8f13cd86', '190701', 'aktif', 'JAKARTA'),
	(128, '10631', 'ZULFANIDA MUSYAFFA', '2001-05-28', 'P', 'Islam', 'SUYADI', 'PUJIATI ', '082113881715', 'ZNIDA81@YMAIL.com', 'JL.BUDI MULYA RT 002/ RW 010 NOMOR 47 PADEMANGAN BARAT,JAKARTA UTARA', '18', 2016, 'anonim.png', 'ZULFANIDA MUSYAFFA', '7eeef5663d1aaf746bd723c6d56b70c9', 'ZULFA28', 'aktif', 'JAKARTA'),
	(129, '10610', 'TAMJID', '2001-04-17', 'L', 'Islam', 'MARDJANAP', 'IRAH', '089615193318', 'tamjidsenior@gmail.com', 'JL.AGUNG BARAT 6 BLOK B 15 NO.6 RT.11 RW.10 KEL.SUNTER AGUNG KEC.TANJUNG PRIOK', '18', 2016, 'anonim.png', 'tamjid17', 'e1c3304c440d9c6d93377e164e059638', 'tamjid17', 'aktif', 'JAKARTA'),
	(130, '10619', 'VEREN NATASYA', '2001-09-06', 'P', 'Islam', 'SURADI', 'HADIAH', '08158962230', 'verennatasya001@gmail.com', 'JL ANCOL SELATAN NO 31B RT09 RW 002 SUNTER AGUNG', '21', 2016, 'anonim.png', 'VEREN NATASYA', '8464a5ff0835fa930732f96d9e25a68c', '06september', 'aktif', 'KLATEN'),
	(131, '10466', 'DIAZ DWI LIANTO', '2001-04-13', 'L', 'Islam', 'PRIYANTO', 'AMELIA', '088213547059', 'yourediazdwi@gmail.com', 'JL.KEMAYORAN GEMPOL RT.06/06 NO.14', '19', 2017, 'anonim.png', 'diaz', 'cbf313d2116bd24901939550c6650e7f', '1sampe100', 'aktif', 'JAKARTA'),
	(132, '10541', 'MUHAMAD SYAFEI', '2000-11-04', 'L', 'Islam', 'Sutrisno', 'Resih', '085880755628', 'msyafei411@gmail.com', 'Jl. Swasembada Timur 25', '18', 2017, 'anonim.png', 'MuhamadSyafei', 'c05db6d1fcf01635d4c9d436bca9c6ea', '02154612003c', 'aktif', 'JAKARTA'),
	(133, '10484', 'FAIZA DWI SEPTIANI', '2001-09-19', 'P', 'Islam', 'FACHRIZAL', 'SRI MURYATI', '08971592001', 'faiza.dwiseptiani@gmail.com', 'JL.H.UNG RT 008/RW04 NO.228C KEL.UTAN PANJANG KEC.KEMAYORAN JAKARTA PUSAT 10650', '18', 2016, 'anonim.png', 'FAIZA DWI SEPTIANI', 'd8cc7d7195454fa70a6aae1a18cd35e4', 'faizadwi1909', 'aktif', 'JAKARTA '),
	(134, '10618', 'USAMAH UMAR AZIZ SHOLAHUDDIN', '2001-07-04', 'L', 'Islam', 'GATOT PURNOMOSIDI', 'YUNI NURMASANTI', '085289529730', 'usamahumar21@gmail.com', 'jl. lap. pors 6 no.8', '17', 2016, 'anonim.png', 'usamahumar', '8dd36cec58925318123537810918143c', 'kakanet04', 'aktif', 'JAKARTA'),
	(135, '10626', 'YUNDI PURNAWIRAWAN', '2000-06-04', 'L', 'Islam', 'SUGIARTO ', 'NGATINI', '081315467086', 'purn123yundi@gmail.com', 'JLN. ANCOL SELATAN RT.17/RW.03 KEL. SUNTER AGUNG KEC. TANJUNG PRIOK JAKARTA UTARA', '17', 2016, 'anonim.png', 'yundiprnwrwn', '36694a9a8f0b03bb20fcb8644a7962ae', 'yundi0406', 'aktif', 'SRAGEN'),
	(136, '10595', 'SAFITRI', '2000-11-06', 'P', 'Islam', 'SLAMET ROMADHAN', 'UMI HARTATI', '089631556608', 'sftrintan@gmail.com', 'Jln.Kmp.Bahari Gg 2 A 3', '18', 2016, 'anonim.png', 'Safitri', '69506b30694abfc7fe7a43b197188180', 'safitri', 'aktif', 'JAKARTA'),
	(137, '10646', 'PUTRI DEVI', '1999-10-16', 'P', 'Islam', 'SAHID ', 'SALMAH', '0895339220019', 'PUTRIDEVI0489@GMAIL.COM', 'JL.BOING 5B/414', '18', 2016, 'anonim.png', 'PUTRIDEVI', 'a29db3f95e0b8422922e1d54b71b0d7f', 'ibubapaksaya', 'aktif', 'BIMA'),
	(138, '10538', 'MUHAMAD RIFKI', '2001-04-25', 'L', 'Islam', 'AHMAD ZAKI', 'NOMI YARTI', '081298497650', 'irmuhamadrifki@gmail.com', 'Jln.gg cempaka baru timur rt04 rw05 no5a kelurahan cempaka baru kecamatan kemayoran kabupaten jakarta pusat', '21', 2016, 'anonim.png', 'Rifki22', '1c67b1c9615f7539341168ba3fe1a748', 'bisaaja', 'aktif', 'PEKAN BARU'),
	(139, '10518', 'KINANTY AJENG SULISTIAWATI', '2001-06-19', 'P', 'Islam', 'SULISTIYONO', 'NATY', '083892322929', 'kinantyajeng1@gmail.com', 'Jalan Dadap Rt03 Rw06 No.24c Sunter Agung Tanjung Priok Jakarta Utara', '21', 2016, 'anonim.png', 'KINANTY AJENG', '43c376e0abfc24c6cc4afc35f629a83a', 'jalandadap', 'aktif', 'JAKARTA'),
	(140, '10440', 'ANNISYA PUTRI DINANTY', '2001-11-01', 'P', 'Islam', 'BUDI IMAWANTO DARMINTO', 'RIYATI', '081930060493', 'annisyaputridinanti@gmail.com', 'Jl. Waraksa V gg 2 NO. 153 rt005 rw 008 kelurahan warakas kecamatan tanjung priok,jakarta utara, indonesia\r\n', '18', 2016, 'anonim.png', 'Imqueen', '944ef05f49dbadbbc3d768a5a4f4365b', '01112001', 'aktif', 'DKI JAKARTA'),
	(141, '10434', 'ANISA SYAFIRA', '2001-04-29', 'P', 'Islam', 'SOPIAN SURBAKTI', 'SANTI SUKARNI', '081311436972', 'anisasyafira29@gmail.com', 'GG HEMAT SUMUR BATU RT07/RW06', '21', 2016, 'anonim.png', 'ANISA SYAFIRA', '2f37c79af942516c5085b54d1f49a592', '290401', 'aktif', 'JAKARTA'),
	(142, '10564', 'NOVRI NOER ASYSYIFA', '2000-11-29', 'P', 'Islam', 'AGUS PRIANTO', 'JANUARI SULISTIARINI', '0895331477298', 'novrinourasysyifa@gmail.com', 'JL. LANCAR II NO. 28 RT/RW:007/008', '19', 2017, 'anonim.png', 'novri12', '8f01991bfc02f44b26bab35aa2f1b49f', 'sehun04', 'aktif', 'JAKARTA'),
	(143, '10639', 'Cornelia Juwita', '2001-09-08', 'P', 'Kristen', 'Reinot Mangandar', 'Rosmaida Manurung', '081298929235', 'cornelia08sianturi@gmail.com', 'Kemayoran jakarta pusat jalan bendungan jago ', '18', 2016, 'anonim.png', 'CorneliaSianturi08', '12d262b778b76715feb8896357288747', 'sianturi08', 'aktif', 'Jakarta'),
	(144, '10514', 'KARTIKA ROSALINA', '2001-04-16', 'P', 'Islam', 'IRWAN SUHADI', 'SUPARLIYAH', '081574120434', 'tikarosalina62@gmail.com', 'JL. E3 RAYA NO.4 RT 008 RW 009 CEMPAKA BARU', '17', 2016, 'anonim.png', 'Kartikarosalina', '4965a6069686d8c995b2daab2c7e0814', 'tikhar16', 'aktif', 'JAKARTA'),
	(145, '10611', 'TANGGUH BIAS MUFRODI', '1999-11-16', 'L', 'Islam', 'SULAIMAN', 'DIAN KRESNANINGSIH', '089672650976', 'tangguhbias1106@gmail.com', 'JL.SUNGAI BAMBU VI A RT 04 RW 04 KEL. SUNGAI BAMBU KEC TANJUNG PRIOK JAKARTA UTARA', '21', 2016, 'b908ec9775ab51f3b09064a3e364e5e3.jpg', 'tangguhbias', '3a5b43fa4e163c552c323368a8aef6ae', 'aradania77', 'aktif', 'JAKARTA'),
	(146, '10463', 'DELLA AYU SUSANTI', '2001-05-01', 'P', 'Islam', 'SUNARTO', 'ENDANG PURWANTI', '089619157288', 'shabrinaraefa@gmail.com', 'JALAN ANCOL SELATAN RT 014 RW 03 KELURAHAN SUNTER AGUNG KECAMATAN TANJUNG PRIOK', '19', 2017, 'anonim.png', 'della ayus', '5bc10bc460d13fb18609faa9b2d0f2f8', 'della01', 'aktif', 'JAKARTA'),
	(147, '10476', 'ENDAH OKTINAWANGSARI', '2001-10-11', 'P', 'Islam', 'NGATINO', 'DWI PURBANINGSIH', '083804947245', 'oktiendah@gmail.com', 'JL. SERDANG BARU I RT 02 RW 05 NO. 07', '19', 2017, 'anonim.png', 'endah oktinawangsari', '06aa71de738198646882d0c96cc77fce', 'endahokt', 'aktif', 'JAKARTA'),
	(148, '10424', 'ALFAREZA YUDISTIRA', '2001-09-12', 'L', 'Islam', 'ACHMAD FURQON', 'JUMINI', '089692988977', 'aifarezayudistira86@gmail.com', 'Jl. Warakas 2 gg 6', '21', 2016, 'anonim.png', 'Alfareza12', '38556842ddf7f57d9c68691d6c2ef3c0', 'alfareza12', 'aktif', 'JAKARTA'),
	(149, '10563', 'NITA JULYANI', '2000-07-07', 'P', 'Islam', 'NANI SARDANI', 'INAH WARINAH', '087883540270', 'nitajulyani@gmail.com', 'JL. ANCOL SELATAN RT 04/ RW 02 NO 17 SUNTER AGUNG', '19', 2016, 'anonim.png', 'nitajulyani', '0f05f49601fec8993621c0aca1da4285', 'julyaninita0707', 'aktif', 'JAKARTA'),
	(150, '10531', 'MITHA PUSPITA', '2001-08-27', 'P', 'Islam', 'AGUS SUPRIYADI', 'SUMIATI', '087865147774', 'mithapuspitawp@yahoo.com', 'Jln. Budi Mulia  Rt.008  Rw.012 No.32', '16', 2016, 'anonim.png', 'mithapspt27', 'd829c6e3fcafd405c5033650ad803f43', 'mitha270801', 'aktif', 'JAKARTA'),
	(151, '10625/0016998855', 'YOGA APRILLION', '2001-04-04', 'L', 'Islam', 'SUBAGYO', 'SRI PURWANTI', '085692863697', 'yogaaprillion25@gmail.com', 'Jalan kemayoran gempol no.20A Rt.10/08 Kec.Kemayoran Jakarta Pusat', '21', 2016, 'anonim.png', 'yogaaprillion_', 'a0c39b03402d6a3fe699cbee725d9f98', 'broaz123', 'aktif', 'JAKARTA'),
	(152, '10490', 'FATHIN MUFLIH', '2000-08-28', 'L', 'Islam', 'IMRON CHOLID', 'NURUL HUDA', '081298262653', 'fathinmuflih354@gmail.com', 'Komplek DKI sunter jaya 2 Blok.B 9 No.25 Rt11/12', '19', 2016, 'anonim.png', 'Fathinganteng', '81da45916c75d08e00f81fe9349f19b3', 'duata123', 'aktif', 'JAKARTA'),
	(153, '10576', 'RAFFYALI NURALIP', '2001-01-10', 'L', 'Islam', 'RASA', 'MUSLIMA', '089621892796', 'raffyalinuralip@gmail.com', 'KOMPLEK DKI KEBERSIHAN RT016/RW007 NO.03 SUNTER JAYA KECAMATAN TANJUNG PRIOK', '21', 2016, 'anonim.png', 'raffyalinuralip', 'e4e18a2952be69c1dbb2d177aab50d41', 'nuralip', 'aktif', 'JAKARTA'),
	(154, '10506', 'IQBAL NUR AZHARI', '1999-10-28', 'L', 'Islam', 'TULUS NUR BASUKI', 'SARI KUSTIYORINI', '083876573431', 'iqbalazhari757@gmail.com', 'JL.TARUNA RAYA RT 011/03 KEL.SERDANG', '20', 2016, 'anonim.png', 'Iqbal28', 'c708ca9e78cc77c808ab6f4b02338239', 'suparti', 'aktif', 'JAKARTA'),
	(155, '10551', 'MUHAMMAD ROBBY MULKI', '0000-00-00', 'L', 'Islam', 'BASUKI UTOMO', 'JUBAEDAH', '083890740917', 'robbymulki97@gmail.com', 'JL.HAJIUNG DALAM', '19', 2016, 'anonim.png', 'muhammad robby mulki', '6443929351d2cd1d12461d7348b89255', 'robby12', 'aktif', 'JAKARTA'),
	(156, '10494', 'Gusti wahyu kesuma', '2001-09-21', 'P', 'Islam', 'Sukartono', 'Sri rahayu', '08129907325', 'gustiwahyu39@gmail.com', 'Jalan bentengan x rt 013 rw 001 nomor 23 jakarta utara kelurahan sunter jaya', '21', 2016, 'anonim.png', 'Gusti wahyu kesuma', 'e7e4c1cab8c9ba50b6a9cc3d9346f061', 'gustiuut', 'aktif', 'Jakarta'),
	(157, '10549', 'MUHAMMAD RIZKI AKBAR', '2001-01-15', 'L', 'Islam', 'AKHYAR AKIB', 'SUNARTI', '', 'abaynix82@gmail.com', 'Jalan kp irian gang 29 RT18 RW06 No 4D', '18', 2016, 'anonim.png', 'Akbar41', '31f1dbf1d8b2e8b83eac59804107880e', 'akbarganteng', 'aktif', 'JAKARTA'),
	(158, '10607', 'SUCI RAHMADINI', '2001-12-04', 'P', 'Islam', 'CASMA', 'SITI AISYAH', '0895349403273', 'sucirahmadini04@gmail.com', 'JL. KEBON BAWANG II NO. 29 RT/RW 010/007', '19', 2017, 'anonim.png', 'suci rahmadini', 'd2c8c9bf7107529427229dd832a92dfd', 'sucirahmadini04', 'aktif', 'JAKRTA'),
	(159, '10493', 'FIOLA ARIBAH SUKMAWATI', '2001-02-24', 'P', 'Islam', 'FRANGKY', 'SURYAWATI', '088809001113', 'fiola.aribah2402@gmail.com', 'JL.  SUMUR BATU GG.  MULIA NO.  5 RT 018 RW 07', '18', 2016, 'anonim.png', 'FIOLAARIBAH24', '15a46450f8aed8d710cb11a0a1bef196', 'sukmawati', 'aktif', 'JAKARTA'),
	(160, '10622', 'WILSON ANTONIUS', '2001-07-28', 'L', 'Katholik', 'GREGORIUS CHORDY PAREIRA', 'TERESA HIU SIU ENG', '08129146333', 'wilsonantonius28@gmail.com', 'JALAN AGUNG UTARA 6D RT1 RW8 NO 3', '19', 2017, 'anonim.png', 'wilson', '5a60668bacacd99584dcc0ab99893e7f', 'antonius', 'aktif', 'Jakarta Utara'),
	(161, '10471', 'Domas Andini Dyah Pangestuti', '2001-03-02', 'P', 'Islam', 'Suranto', 'Darmini', '0895352325435', 'andinidyah1601@gmail.com', 'Jl.cempaka sari 1 rt03 rw08 ', '16', 2016, 'anonim.png', 'Domasandini_dyah', '75ad0b72e67f5e4255b9e8e78b3c949f', '13456789', 'aktif', 'Sukoharjo'),
	(162, '10560', 'NAUFAL ADIFTA ILHAM', '2001-02-05', 'L', 'Islam', 'DWI ABDIARTO', 'HENNY SOEPERBAWATI', '085882855650', 'mongkeyuuu12@gmail.com', 'JL.UTAN PANJANG 3 NO 3 RT 08 RW 06 KEMAYORAN JAKARTA PUSAT', '16', 2016, 'anonim.png', 'diftailham', 'b93e16ba16e03dfc551a4a01592460bd', 'payungteduh', 'aktif', 'JAKARTA'),
	(163, '10478', 'FACHRUL RAJAB ALVIANSYAH', '2000-10-25', 'L', 'Islam', 'CECEP GHOZALI', 'WAHYU TRI OKTAVIYANTI', '0895321470980', 'fachrulrajab351@gmail.com', 'GG.CEMPAKA BARU TIMUR IX NO5 RT08/05 ', '19', 2017, 'anonim.png', 'Fachrul', '221b58493982acdf55fde8928832cd04', '08561183010', 'aktif', 'Jakarta '),
	(164, '10221', 'Desnita Tasya Ramadhani', '2000-12-05', 'P', 'Islam', 'Happy Rijadi', 'Anna regina', '083736719267', 'desnitasya@gmail.com', 'Jl taruna raya ', '26', 2016, 'anonim.png', 'desnitatr', 'fa597bc9c683540660ae4272ae08672d', 'desnitatr5', 'aktif', 'Jakarta'),
	(165, '02062000', 'Rachman Nurhakim', '2000-06-02', 'L', 'Islam', 'M. Nurcholis', 'Daimah', '0895332202259', 'rahmanurhakim@gmail.com', 'Bentengan 2', '26', 2016, 'anonim.png', 'Rahmannurhakim', 'be3feb0f593759ad4cca8e0a9af54c69', 'sasali521', 'aktif', 'Jakarta'),
	(166, '10496', 'HADI WIBOWO', '2000-06-04', 'L', 'Islam', 'EKO PUSPITO', 'SANTI SANWANI', '085883258523', 'hadywibowo8@gmail.com', 'Jl.ancol selatan II Rt.03 Rw. 07 No.57\r\nKel.Sunter agung \r\nKec.Tanjung priok\r\nKab.Jakarta utara\r\nProv.DKI Jakarta', '18', 2016, 'anonim.png', 'scharllote', '279a6f4d4c2438b1ac2816e184d1957c', 'mechanocide', 'aktif', 'JAKARTA'),
	(167, '10466', 'DIAZ DWI LIANTO', '2001-04-13', 'L', 'Islam', 'PRIYANTO', 'AMELIA', '088213547059', 'yourediazdwi@gmail.com', 'JL.KEMAYORAN GEMPOL RT.06/06 NO.14', '19', 2017, 'anonim.png', 'diazdwil19', '054d79c906544900d7746fe177572688', 'yaudaiya', 'aktif', 'JAKARTA'),
	(168, '10587', 'RIF\'ATUL HASANAH', '2001-02-11', 'P', 'Islam', 'DEDI JUNAEDI', 'JEMAH HERAWATI', '083891200834', 'rifahasanah1102@gmail.com', 'JL. BENTENGAN VI GG. SKY VI RT 007 RW 05 SUNTER JAYA JAKARTA UTARA', '19', 2017, 'anonim.png', 'rifa', '0690cb2c3fc4d85879e6f05d4ec9302e', '11feb01', 'aktif', 'JAKARTA'),
	(169, '10484', 'FAIZA DWI SEPTIANI', '2001-09-19', 'P', 'Islam', 'FACHRIZAL', 'SRI MURYATI', '08971592001', 'faiza.dwiseptiani@gmail.com', 'JL. H. UNG RT 008/RW 04 KEL.  UTAN PANJANG KEC. KEMAYORAN JAKARTA PUSAT 10650', '18', 2016, 'anonim.png', 'FAIZADWI27', 'd8cc7d7195454fa70a6aae1a18cd35e4', 'faizadwi1909', 'aktif', 'JAKARTA '),
	(170, '10322', 'Bayu Puji Hartoyo', '2001-03-12', 'L', 'Islam', 'Sumardi', 'Siti Chodijah', '', 'bayutoyo12@gmail.com', 'Jalan Serdang raya Rt.02/04 No.23', '16', 2016, 'anonim.png', 'toyo', '439a5bf2439cf34f27d26364be1c62de', 'bayupujihartoyo', 'aktif', 'Jakarta'),
	(171, '10554', 'MUKHAMMAD KHANAFI', '2001-04-07', 'L', 'Islam', 'RASMANI', 'WAROH', '083877672800', 'muhammadkhanafi07@gmail.com', 'JL.ANCOL SELATAN RT03/RW01 NO.8C KELURAHAN SUNTER AGUNG KECAMATAN TANGJUNG PRIOK KOTA JAKARTA UTARA ', '17', 2016, 'anonim.png', 'MUKHAMMADKHANAFI', '264c794e5eeb5d9d3b20bbeab4675f48', 'khanafi007', 'aktif', 'BREBES'),
	(172, '10520', 'KUKUH HARIYO RAMADHAN', '2001-11-20', 'L', 'Islam', 'BAMBANG SUCAHYO', 'SARINAH', '089607209682', 'kukuhbastian@yahoo.com', 'JL. SERDANG BARU 1 RT.001/RW.05', '17', 2016, 'anonim.png', 'KUKUH HARIYO RAMADHAN', 'cd8f7e0fd65d9bb79204d060db3d46b7', 'kukuhhr20', 'aktif', 'JAKARTA'),
	(173, '10446', 'ASTA PRATIWI', '2001-04-29', 'P', 'Islam', 'UMAR FISOL', 'MOHAMAD YULIATUN', '', 'astaprtw@gmail.com', 'JALAN SUNTER JAYA IV A NO 21 RT 11 RW 02', '16', 2016, 'anonim.png', 'astapratiwi', '84e794069425a0be16751b73bd8cfee4', 'astapratiwi', 'aktif', 'CILACAP'),
	(174, '102179992448678', 'dede supriatna', '1999-08-11', 'L', 'Islam', 'samsudin', 'anah suryana', '082111874278', 'dedesp74@gmail.com', 'Jl kp bahari 2 a 12 no 239', '26', 2015, 'anonim.png', 'dedesp11', '5df1bf9278e5fd1b897eb41e6f6e220b', 'dede123', 'aktif', 'jakarta'),
	(175, '10242', 'Dysa Fitria Darmawan', '2000-01-05', 'P', 'Islam', 'Eman Sulaeman', 'Ihat Solihat', '087778276015', 'adeedarrach20@gmail.com', 'Jl. Gunung Sahari XI dalam ', '26', 2015, 'anonim.png', 'dysafitria', '8b79817634ede18f5ef6dd659d2cf9e5', 'Qwerty20', 'aktif', 'Cianjur'),
	(176, '10623', 'WITI CAHYANI', '1999-05-01', 'P', 'Islam', 'SAGIMUN', 'KUSNIDAH', '089691940223', 'nahnuharis@yahoo.com', 'JL. SUNTER AGUNG', '20', 2016, 'anonim.png', 'Witi Cahyani', '720d96a84040f7b4fd6f75ce042878ca', '01mei05', 'aktif', 'Brebes'),
	(177, '10629', 'ZAHRA HERMALIA ANJANI', '2001-06-06', 'P', 'Islam', 'SUMARI', 'DEWI HERLINA', '089675379545', 'zahrahermaliaa@gmail.com', 'JL. SUNTER GEDUNG RUBUH', '19', 2016, 'anonim.png', 'zahrahermalia', '3e078cfbd48489f7be9a5f6975308b61', 'ara060601', 'aktif', 'JAKARTA'),
	(178, '10463', 'DELLA AYU SUSANTI', '2001-05-01', 'P', 'Islam', 'SUNARTO', 'ENDANG PURWANTI', '089619157288', 'shabrinaraefa@gmail.com', 'JALAN ANCOL SELATAN RT 14 RW 03 KELURAHAN SUNTER AGUNG KECAMATAN TANJUNG PRIOK', '19', 2017, 'anonim.png', 'dellaayus', 'da10df03798a6f4bde14867ef2882a8f', 'della05', 'aktif', 'JAKARTA'),
	(179, '260800', 'Al Faridzi Setyawan', '2000-08-26', 'L', 'Islam', 'Al Mustofa', 'Heny', '085779962245', 'ajiara2604@gmail.com', 'Kampung Sukasari Harapan Mulia Kemayoran Jakarta Pusat', '26', 2015, '7a0e369f89c42bc2a4773bcaff88f387.jpg', 'Aji', 'e8a265d393fed8c21eae91d94f30682c', '5926042081260459', 'aktif', 'JAKARTA'),
	(180, '10556', 'NABILA SAM SAM', '2001-04-24', 'P', 'Islam', 'SIRRY AL ARIES', 'SYAMSIAH', '087786167430', 'nabilasams84@gmail.com', 'Jl. Dakota V RT/RW : 006/06', '20', 2016, 'anonim.png', 'NABILA SAM SAM', 'fd54b215fac04483655e37b894f5d04e', '087786167430', 'aktif', 'Bekasi'),
	(181, '10214', 'Claraduta', '2000-06-25', 'P', 'Islam', 'Azis Siswono', 'Zahara', '082311341987', 'claraduta2506@gmail.com', 'Jalan Cempaka Putih Utara 4 rt 06 rw 01 no 13', '26', 2015, 'anonim.png', 'claraduta', 'fa2b0ec6ba67038aa5bf0e00686ad00a', 'bismillahstan', 'aktif', 'Jakarta'),
	(182, '10567', 'NURUL ROCHMAHWATI', '2001-03-02', 'P', 'Islam', 'JAENAL', 'SISWATI', '085881514038', 'nurulrochmahwati23@gmail.com', 'Jl. MELATI RT 08 RW 03 NO: 23', '21', 2016, 'anonim.png', 'nurul rochmahwati', 'adc45303931ab8f2d52b19a874bae0b3', 'nurul23', 'aktif', 'JAKARTA'),
	(183, '10612', 'THERESIA AVILLA OLIVIA OKTAVIANI', '2001-10-09', 'P', 'Katholik', 'ALOYSIUS HERU', 'VALERIA KRISTIN', '085722275686', 'avillaoliviaa@gmail.com', 'JL.CIPINANG BESAR SELATAN NO 20', '20', 2016, 'anonim.png', 'THERESIA AVILLA OLIVIA OKTAVIANI', '4d13cff1290b20e94759e7234ee325e2', 'oktober09', 'aktif', 'JAKARTA'),
	(184, '28112000', 'Erfans Djie Pangestu', '2000-11-28', 'L', 'Islam', 'Mukhsin tomy', 'Ikah atikah', '081287857073', 'Erfansjieputra@gmail.com', 'Jl. Bentengan 9', '26', 2015, 'anonim.png', 'erfans', 'b2be0be5b219e67e01a844af722111e2', 'majalengka', 'aktif', 'Majalengka'),
	(185, '10575', 'PUTU DIAH AYU KARTIKA WATI', '2001-02-22', 'P', 'Islam', 'I GEDE WIDIASA', 'RIRIN RAHMAWATI', '0895367688261', 'putudiahayu9a@gmail.com', 'JALAN ANCOL SELATAN RT 15 RW 03 NO. 2', '20', 2016, 'anonim.png', 'Putu Diah', '4c413c8827585cb45e478691cab49df9', 'putudiah22', 'aktif', 'SANGSIT'),
	(186, '10449', 'AYU WIDIANINGGAR', '2001-07-16', 'P', 'Islam', 'ARIO', 'LIA', '089685640059', 'ninggarayuwidia16@gmail.com', 'JL. ANCOL SELATAN RT/RW 10/01', '19', 2017, 'anonim.png', 'ayu widianinggar', 'a732e3c295035ea43acd8473f5099080', 'ayuwidia16', 'aktif', 'JAKARTA'),
	(187, '10503', 'IKON TERRA SUJENNAR', '2001-05-04', 'P', 'Katholik', 'Y.  EDY PURWANTO. S. Pd M.Pd', 'TITIK JUMIATI. S.P.d', '085872081552', 'mariaterra989@gmail.com', 'JL.  ANCOL SELATAN 2 RT. 007/07 NO. 99 SUNTER AGUNG JAKARTA UTARA', '20', 2016, 'anonim.png', 'IKON TERRA SUJENNAR', 'daacd33c6ef0318654e73c5de2e39d25', '65832112princess', 'aktif', 'JAKARTA'),
	(188, '1058@', 'RAYHAN ILHAMSYAH', '2001-05-01', 'L', 'Islam', 'SURIP', 'WASLINA', '089621172333', 'ilhamsyahrayhan5@gmail.com', 'JL.CEMPAKA BARU BARAT NO 9 KELURAHAN CEMPAKA BARU KECAMATAN KEMAYORAN JAKARTA PUSAT', '20', 2016, 'anonim.png', 'RAYHAN ILHAMSYAH', '368cb297f691068b7ee0839e0913dcd2', 'rahma12345', 'aktif', 'JAKARTA'),
	(189, '10517', 'KHUSNUL KHOTIMAH', '2001-04-06', 'P', 'Islam', 'SAKINO', 'BADRIYAH', '081311348949', 'khusnulkhotimah111@gmail.com', 'JL. POHON BERINGIN RT 11 RW 03 NO. 53', '20', 2016, 'anonim.png', 'KHUSNUL', '54eb2a3a371675e5aeddcf902e35fb21', 'khusnul', 'aktif', 'JAKARTA'),
	(190, '10586', 'RICHA AMALIA', '2001-09-17', 'P', 'Islam', 'JARYO YOYO SETIAWAN', 'JULIKHATUN', '089529356179', 'richaamalia2001@gmail.com', 'JL.PADEMANGAN 2 GANG 19 NO.42B', '16', 2016, '4b60f6b0d4ff51dc3246bdf769e5b153.jpg', 'Richaamalia17', '83ddd574b8e5b4fe7418913d617cf07e', 'Richaamalia17172121', 'aktif', 'BATANG'),
	(191, '10579', 'RAMADHANI PUTRA KABERI', '2000-12-01', 'L', 'Islam', 'MUHAMMA ROHKIMAN', 'ASNANI BURO BANGUN', '081277468211', 'thedefloxs21@gmail.com', 'Kp.BAHARI 2 A 3 NO 54', '20', 2016, 'anonim.png', 'Ramadhaniputrakaberi', '05bdc508170e297c46077fc46222330b', 'thedefloxs2121', 'aktif', 'TANAH KARO '),
	(192, '10559', 'NATASHA CHAIRANI ', '2000-11-20', 'P', 'Islam', 'DRS. NOFIALIS', 'ZURRAHMI', '085813601061', 'natashachairani5@gmail.com', 'JALAN PADEMANGAN 4 GANG 25 NO: 30 RT:04 RW:01', '20', 2016, 'anonim.png', 'NATASHA CHAIRANI', '1efebb8d46504eeb30471bf0ab2444e5', 'natashac20', 'aktif', 'JAKARTA '),
	(193, '10452', 'AZ\'ZAHRA PUTRI MAYLANI ', '2001-05-12', 'P', 'Islam', 'MUHAMMAD TAUHID', 'SULASIH', '085892514167', 'azzahra1221@gmail.com', 'JALAN CEMPAKA SARI 3 RT 11 RW 08 NO 13', '20', 2016, 'anonim.png', 'AZZAHRA PUTRI MAYLANI ', '4861203cc046c37f0e3f70465b58490b', 'zahra1251', 'aktif', 'BATANG, JAWA TENGAH'),
	(194, '10463', 'DELLA AYU SUSANTI', '2001-05-01', 'P', 'Islam', 'SUNARTO', 'ENDANG PURWANTI', '089619157288', 'shabrinaraefa@gmail.com', 'JL ANCOL SELATAN RT 14 RW 03 NO 24', '19', 2016, 'anonim.png', 'dellaayu', '16ef28ea711f27346e1cc37fe32cdecb', 'della2001', 'aktif', 'JAKARTA'),
	(195, '10553', 'MUJI RANA KIRANA', '2001-10-02', 'P', 'Islam', 'JOEIS SAPUTRA', 'MURNI', '0895328367149', 'mujirana77@gmail.com', 'JL.JATI 3 NO.53B RT 05/05 SUNGAI BAMBU, TANJUNG PRIOK, JAKARTA UTARA', '20', 2016, 'anonim.png', 'MUJI RANA KIRANA', 'a6b2412fdb4c1d87003f7feab644d145', 'mujirana', 'aktif', 'PEMALANG'),
	(196, '10480', 'FADYA NAFTHA DEYANA', '2001-07-23', 'P', 'Islam', 'FRANKONI', 'DINAH', '088214049085', 'fadyanafdey23@gmail.com', 'JL. RAWA BINANGUN IV RT: 006 RW : 09', '19', 2016, 'anonim.png', 'fadyanafdey23', 'a2f7cb0bfaea353b9db79620f2834d57', 'fadya230701', 'aktif', 'JAKARTA'),
	(197, '10534', 'MOURA MARIA WENEHENUBUN', '2000-12-13', 'P', 'Katholik', 'MATHEUS WENEHEN', 'FRANSISKA ROYANAH', '08970589326', 'mouramariawenehen@gmail.com', 'JL.ANCOL SELATAN 2 RT007/RW007 NO 63', '19', 2016, 'anonim.png', 'mouramaria ', '775a34dbdccc56d958faf3d73a704f4b', 'moura', 'aktif', 'JAKARTA'),
	(198, '10564', 'NOVRI NOER ASYSYIFA', '2000-11-29', 'P', 'Islam', 'AGUS PRIANTO', 'JANUARI SULISTIARINI', '0895331477298', 'novrinourasysyifa@gmail.com', 'JL.LANCAR II NO.28 RT/RW:008/007', '19', 2017, 'anonim.png', 'novrinoura', '5b45468fadfbbc55ad713325bb9ef867', 'sehun1994', 'aktif', 'JAKARTA'),
	(199, '10569', 'PERMADI PRAMUMITA', '2002-02-06', 'L', 'Islam', 'TATANG WARSONO', 'TUMI', '089685386038', 'per45madi@gmail.com', 'JL.SWASEMBADA BARAT X NO.7\r\nRT/RW : 07/013\r\nKEL : KEBON BAWANG', '19', 2016, 'anonim.png', 'per45madi', '96a0dead881b8e2368157ccb08f76d74', 'saya123', 'aktif', 'JAKARTA'),
	(200, '10497', 'HANIFAH BUISAINAH MAKARIM', '2001-02-04', 'P', 'Islam', 'DANI AHMAD', 'DUSMIYATI', '083893120107', 'busainah55@gmail.com', 'JALAN BENTENGAN RT 004 RW 005 NO. 46', '19', 2017, 'anonim.png', 'hanifah', '6e7cc8ce2678fe8870d780f09f9433ac', 'daniahmad', 'aktif', 'JAKARTA'),
	(201, '10615', 'TRIANA RAHAYU', '2001-03-30', 'P', 'Islam', 'KAWIT RAHMATSYAH', 'SITI MUJAKIYAH', '087781072358', 'trianarahayu464@gmail.com', 'SUNTER MUARA RT 09 RW 05 NO16, SUNTER AGUNG, TANJUNG PRIOK, JAKARTA UTARA', '20', 2016, 'anonim.png', 'TRIANA RAHAYU', 'adb0cfb2f608547000640289d8e3ff83', 'TRIANA30', 'aktif', 'JAKARTA'),
	(202, '10419', 'ADELIA MAUDINA AMANDA', '2001-07-11', 'P', 'Islam', 'SURIP', 'WAGIATI', '085781116510', 'adeliamaudina1@gmail.com', 'JL.H. MAWAR RT 09 RW 07 NO.15', '19', 2016, 'anonim.png', 'adeliamaudina', 'cd0d2e66cdf8f34e543a8a882364b9dc', 'adelia01', 'aktif', 'JAKARTA'),
	(203, '10456', 'BOBBY ROBSON', '2001-08-02', 'L', 'Islam', 'RAHARSO', 'SUNARTI', '081382342748', 'bobbyrobson30@gmail.com', 'Kp. Bahari Gg.5 A5 No. 25 Rt. 009 Rw. 001 Kel. Tg. Priok Kec. Tg. Priok kota Jakarta Utara', '18', 2016, 'anonim.png', 'Bobbyrbsn', 'd85fe0d65e7c3c6f0b30ed0a3ebcda87', 'bully020801', 'aktif', 'JAKARTA'),
	(204, '10238', 'Dwi Anggraini Hanafiah', '2000-05-03', 'P', 'Islam', 'Udin', 'Kayah', '081213915898', 'dwianggraini215@gmail.com', 'Jalan kampung rawa sawah RT: 07 RW:02 nomor:16 Kelurahan: Johar Baru Kecamatan: Johar Baru', '26', 2015, 'anonim.png', 'dwianggraini', 'babb9834d96c27f00b718469e0fba0bf', 'dwi12345', 'aktif', 'Jakarta'),
	(205, '10257', 'Fellen Pangki Nugroho', '2000-01-18', 'P', 'Islam', 'Panggih', 'Endang Sri Reeki', '', 'fellennugroho@gmail.com', 'Jl. Gading raya 1 No. 9 Rt. 006/014, Kel. Pisangan Timur, Kec. Pulogadung Jakarta Timur', '26', 2015, 'anonim.png', 'fellennugroho', 'bd71efc8d438753605bac9436bb9290b', 'fellen01', 'aktif', 'Jakarta'),
	(206, '102540001917405', 'Fadhillah Ali Hamonangan Sihombing', '2001-02-24', 'L', 'Islam', 'Fajaruddin sihombing', 'Rodiah pulungan', '08128786642', 'fakhriali784@gmail.com', 'Jl. Biduri bulan no. 36 d rt 15 rw 03 sumur batu kemayoran jakpus', '26', 2015, 'anonim.png', 'Fadhillahali', 'ded617f38705cf667d716421b9d0aff6', 'dewisrie46', 'aktif', 'Jakarta'),
	(207, '10621', 'WIDI ANDANU', '2001-03-11', 'L', 'Islam', 'SANUSI', 'SUSY SUHARTI', '088210375503', 'widi.andanu33@gmail.com', 'Jl. Rawasari timur 1 dalam rt/11 rw/02 no.23', '16', 2016, 'anonim.png', 'Kambinggg', '2766d85d2a2b747768f60074f7555eeb', 'andanu11', 'aktif', 'JAKARTA'),
	(208, '10578', 'RAHMA NANDA AGUSTIEN', '2000-10-28', 'P', 'Islam', 'AGUS', 'SUPARTI', '0895331652174', 'rnandagustien@gmail.com', 'JL. ANCOL SELATAN RT.016/003', '16', 2016, 'anonim.png', 'rnandagustien', 'bceaf89c7af79bcaccf59df13a88d863', 'arimakousei', 'aktif', 'JAKARTA'),
	(209, '10293', 'Leonardo De Reva', '2000-04-13', 'L', 'Islam', 'Edy Nova', 'Ruswiyanti', '0895327155458', 'leonardodereva13@gmail.com', 'Jl. Cempaka Baru Tengah 1A ', '26', 2015, 'anonim.png', 'leonardodereva13', 'fb9fa93a0001fe72c07f758436b84b05', '02125812369a', 'aktif', 'Jakarta'),
	(210, '10585', 'RIANA PUSPITASARI', '2000-10-16', 'P', 'Islam', 'DASUCKI', 'ROCHANAH', '087877755157', 'rianapuspitasari16@gmail.com', 'JALAN GEMBIRA TERUSAN NO 194 RT 011 RW 07 JAKARTA UTARA', '16', 2016, 'anonim.png', 'rianaps16', '3a8a0a2c53fbf5dda1f4f634ca63ff16', '16102000', 'aktif', 'PEMALANG'),
	(211, '10359', 'Salsabila Mutiara Puspa', '2000-08-07', 'P', 'Islam', 'Ribut Maryono ', 'Gayatri', '085880390873', 'salsabilamutiarapuspa@gmail.com', 'Jl. Sunter Jaya VIIA rt.09 rw.09 no.21', '26', 2015, 'anonim.png', 'Salsabila Mutiara Puspa', 'efaed974e261d8b073e3c3d932fb341b', 'fellycious', 'aktif', 'Jakarta'),
	(212, '10337', 'Nur Ismi Novyanti', '1999-11-06', 'P', 'Islam', 'Sarmin C. Saputra', 'Sri Atun', '085881780864', 'Novyantiismi006@gmail.com', 'Jl. Ancol Selatan', '26', 2015, 'anonim.png', 'nur ismi novyanti', 'a13497e27d09e5d8ee980fa5ade3ac71', 'novyantiismi', 'aktif', 'Jakarta'),
	(213, '10577', 'RAHMA AFFIFAH', '2001-04-12', 'P', 'Islam', 'SARTI', 'SATIMAN', '083890750986', 'rahmaaffifah12@gmail.com', 'JL. KEDONDONG RAYA RT 13/ RW 06 SUNTER JAYA, TANJUNG PRIUK, JAKARTA UTARA', '16', 2016, 'anonim.png', 'rahmaaffifah', '2ddbf96e67b1c7d400979c9670d63421', 'rahma123', 'aktif', 'KEBUMEN'),
	(214, '10599', 'SASKIA DWI PUSPA LARAS WATI', '2001-03-06', 'P', 'Islam', 'SLAMET RIBUDI', 'SUPRI SETIAWATI', '08818848622', 'saskiadwipuspalaraswati@gmail.com', 'Jl. Asrama polisi kemayoran, jakarta pusat Rt/Rw 06/09', '16', 2016, 'anonim.png', 'Saskiadpl', 'f4d17b4c7347b925f22a0be4e9a5c775', 'sasÄ·Ã¬aÄpÄº', 'aktif', 'Jakarta'),
	(215, '10485', 'FAIZZATI NADHIRAH', '2001-06-09', 'P', 'Islam', 'AMIN SYAMSUDIN', 'AMI AHTUL AISYAH', '085892225864', 'faizzati0906@gmail.com', 'Jl.MUTIARA RT 09/03 NO 38 KEMAYORAN JAKARTA PUSAT', '19', 2017, 'anonim.png', 'Faizzati', '4bef4ef6bf9e90ecd1ccb098e75ddcca', 'azkaandsulis', 'aktif', 'JAKARTA'),
	(216, '10339', 'Pingkan Ajeng Andini', '2000-06-07', 'P', 'Islam', 'Suandi', 'Arry Kusminah', '083806412496', 'pingkanajengandini@gmail.com', 'Jl. Sunter Muara Rt.009 Rw.05 No.05', '26', 2015, 'anonim.png', 'pinkanandini', 'f75d659449c46d58a11a6572d964eb71', 'ajengandini69', 'aktif', 'Jakarta'),
	(217, '10244', 'Ega lusiyana', '2000-02-04', 'P', 'Islam', 'Paimin', 'Painem', '0857881102770', 'syanalusiayana@gmail.com', 'Jl. Agung barat 21 no 17 b 17\r\nSunter Agung ', '26', 2015, 'anonim.png', 'egalusiyana', '92b656e881be295dd34e0a556be23544', 'seungri11', 'aktif', 'Jakarta'),
	(218, '10343', 'RACHMAN NURHAKIM', '2000-06-02', 'L', 'Islam', 'M. Nurcholis', 'Daimah', '0895332202259', 'rahmanurhakim@gmail.com', 'Jalan.bentengan 2', '26', 2015, 'anonim.png', 'Rachmannurhakim', 'be3feb0f593759ad4cca8e0a9af54c69', 'sasali521', 'aktif', 'Jakarta'),
	(219, '10655', 'TEZARD AL-MAFAZAN M', '2001-02-20', 'L', 'Islam', 'MULYANTO', 'INDRAWANTI', '081515680223', 'tezardmulia9c@gmail.com', 'Jl.Ancol Selatan Rt.11 Rw.02 no.21 kel.Sunter Agung Kec.Tanjung Priok', '18', 2017, 'anonim.png', 'Tezard41', '4684f2762f7c4f5862a05decf2e60d35', 'Tezard41', 'aktif', 'JAKARTA'),
	(220, '10513', 'KARINA HANUN', '2001-10-10', 'P', 'Islam', 'TATA HARTAJAYA', 'TATI TRISNAWATI', '087782625151', 'hanunkarina@gmail.com', 'JALAN CEMPAKA PUTIH UTARA IV RT.05 RW.01 JAKARTA PUSAT', '19', 2016, 'anonim.png', 'karina hanun', '411f5a1cea3981c1a3101b75801b5b5d', 'karina10', 'aktif', 'JAKARTA'),
	(221, '10597', 'SANTIKA NURKHOLIPAH', '2000-10-21', 'P', 'Islam', 'ILHAM', 'SAIMAH', '089507653916', 'santikanurkholipah21@gmail.com', 'JL. ANCOL SELATAN', '16', 2016, 'anonim.png', 'santikanrkh', '710ed444e71e3a6f1203b594258c4026', '21102000', 'aktif', 'KENDAL'),
	(222, '10406', 'Aldan Ramadhan ', '2000-01-06', 'L', 'Islam', 'Azis Suryanto', 'Evi aryani', '083827375617', 'aldnrmdhn41@gmail.com', 'Jl.kemayoran gempol Rt 15 Rw 04', '26', 2016, '0283865e7c55c4ad4659241e94d5387c.jpg', 'Aldan Ramadhan', 'e353435a4076eb145d2cc0821a843ebd', 'kepokan?', 'aktif', 'Garut'),
	(223, '10644', 'MUHAMAD RASYID ADITYA', '2001-03-26', 'L', 'Islam', 'TULUS EKO WINARSO', 'RETNO RIYANTI', '083876815206', 'muhamadrasyid.aditya@yahoo.com', 'Jln H. Mawar Gang 3 Rt 006/007 No 29 SUNTER JAYA JAKARTA UTARA', '16', 2017, 'anonim.png', 'zenior05', 'f21ce3dc0d5b7281afc1af4f7ae66f4c', 'Rasyidaditya', 'aktif', 'JAKARTA'),
	(224, '10251', 'Erfans Djie Pangestu', '2000-11-28', 'L', 'Islam', 'Mukhsin tomy', 'Ikah atikah', '081287857073', 'Erfansjieputra@gmail.com', 'Jl. Bentengan 9', '26', 2015, 'anonim.png', 'erfansdjie', 'b2be0be5b219e67e01a844af722111e2', 'majalengka', 'aktif', 'Majalengka'),
	(225, '10330', 'Nida Dzatinnuraini H', '2000-06-22', 'P', 'Islam', 'Muhammad Haikal', 'Sutji Hartati', '083876865924', 'nidadzatinnuraini@gmail.com', 'Jl. E4 RT.08/09 No.32\r\nKelurahan : Cempaka Baru \r\nKecamatan: Kemayoran ', '26', 2015, 'anonim.png', 'Nida Dzatin ', '6c00c38b921887123d96cb43385e1fd0', '22juni2000', 'aktif', 'Jakarta '),
	(226, '10241', 'Dwiki Agung Priambodo', '2000-08-18', 'L', 'Islam', 'Narto Sudibyo', 'Sri Budiningsih', '085814485680', 'dwikiaggwp@gmail.com', 'Jl. Taruna V rt 18 rw 6 no 24', '26', 2015, 'anonim.png', 'dwikiagungp', '77e99474b9edbfa9befedcde5003890d', 'fackingday', 'aktif', 'Jakarta'),
	(227, '10446', 'MUHAMMAD FACHRI FAHREZY', '2001-09-24', 'L', 'Islam', 'INDRA GUNAWAN', 'YULIANTI', '081380529241', 'fachry2409@gmail.com', 'JL. DELTA SERDANG NO:26 RT:02 RW:07\r\n', '16', 2016, 'anonim.png', 'MUHAMMAD  F FAHREZY', '8b17dda0f93c47796c09654ac0f91ee0', 'KARBONMONOKSIDA', 'aktif', 'JAKARTA '),
	(228, '10374', 'Tasya Senny Marcella', '2000-12-22', 'P', 'Islam', 'Alm. Suseno', 'Neny Hernawati', '082299502226', 'tasyasennymarcella@gmail.com', 'Jln. Utan panjang 2 rt 4 rw 10 no.8', '26', 2015, 'anonim.png', 'Tasyasm22', '9dbf3a1e505b35fc147be66d8b5a905e', '22des2000', 'aktif', 'Jakarta'),
	(229, '10409', 'Edo Frans', '2000-09-10', 'L', 'Islam', 'Sudartono', 'Sulistin', '021953647860', 'edofrans89@gmail.com', 'Jl. Ancol selatan ', '26', 2016, 'anonim.png', 'Edofranssaerang', '9f17c5e5a2045a2d20e5fde3721cbcb7', 'katasandi123', 'aktif', 'Jakarta'),
	(230, '10425', 'ALIYA DWI SAFIRA', '2001-09-17', 'P', 'Islam', 'ZAINAL ABIDIN', 'MARYATUN', '', 'aliyahdwi17@gmail.com', 'Asrama Polisi Kemayoran Jakarta Pusat RT04/09 No.21', '16', 2016, 'anonim.png', 'aliyasafiraa', '20c60d779059b7e80168403a0f126e67', '17sptmbr', 'aktif', 'JAKARTA'),
	(231, '10628', 'YUNIA WATI', '2000-06-23', 'P', 'Islam', 'SUHERMAN', 'WATIRAH SUKAESIH', '0895328153757', 'yunia661@gmail.com', 'JL. SERDANG BARU IX RT.10/005 NO.26 KEMAYORAN JAKARTA PUSAT\r\nKODE POS: 10650', '16', 2016, 'anonim.png', 'yuniawatii23', '6abbef053de16506cd11f22227ebb84b', 'cintadamai', 'aktif', 'JAKARTA'),
	(232, '10372', 'tasya kamila', '2000-12-18', 'P', 'Islam', 'suprapto', 'eko sulistyowati', '081585894965', 'tasyakf18@gmail.com', 'JL. Taruna 9 rt.004 rw.01 kel. Serdang kec. Kemayoran, Jakarta Pusat', '23', 2015, 'anonim.png', 'tasya kamila', '7e256347268b692ed47de5cf6f655384', 'tasya1812', 'aktif', 'jakarta'),
	(233, '10321', 'Muhammad Rizky Saputra', '2000-05-30', 'L', 'Islam', 'Ahmad Surip', 'Caskiah', '083876869039', 'rzkysptr15@gmail.com', 'Jl. Tembaga Dalam 3 RT.08 RW.04 NO.35', '26', 2015, 'anonim.png', 'rzkysaputra', '04e6cbe0d6d1c752248c808e3f231b58', 'arcici00', 'aktif', 'Jakarta'),
	(234, '10527', 'MARZUKI YUDI SETIAWAN', '2002-02-07', 'L', 'Islam', 'SUTADI', 'YULISAFIATI', '085894632070', 'marzukiyudi0@gmail.com', 'JALAN KAMPUNG IRIAN GANG 05 RT001 RW 006', '20', 2016, 'anonim.png', 'MARZUKI YUDI', 'b7062249a8785ce8fd87560b8805686b', 'yudinax59', 'aktif', 'JAKARTA'),
	(235, '10608', 'Sundari Kusuma Adjie', '2001-07-25', 'P', 'Islam', 'Slamet Sunaji', 'Sri Kusdiyati', '083872500801', 'sundari250701@gmail.com', 'Jl. Pademangan Timur VII Rt06/010 No 12', '16', 2016, 'anonim.png', 'Sundarikusumaa', 'a5ff3a6fd30e8b3fe9f2ea50ca801aca', 'sundari250701', 'aktif', 'Jakarta'),
	(236, '10271', 'Hilda Alisia', '2000-03-24', 'P', 'Islam', 'ALIYADI', 'DARIS NAELI', '081317292659', 'hildaalisia16@gmail.com', 'Jl.Haji Ung', '25', 2015, 'anonim.png', 'Hildaaal', 'a4856c43561b80fc0a35ca5589b0bcfe', 'hildaaal', 'aktif', 'Jakarta'),
	(237, '10379', 'Vera Renita', '2000-09-01', 'P', 'Islam', 'Sumarsono', 'Paryati', '089502945877', 'verarenita91@gmail.com', 'Jalan bentengan I, gg delegasi III rt 02 rw 05', '25', 2015, 'anonim.png', 'Vera Renita', '257d99c3e7805d473df4f7d222c713c1', 'kelompok07', 'aktif', 'Ngawi'),
	(238, '10320', 'Muhammad Rifqi Eldyansyah', '2000-07-15', 'L', 'Islam', 'Eldi', 'Mutmainah', '085894891697', 'eldyansyah67@gmail.com', 'Jl. Sukamulya 3 no 53 rt04/rw06 jakarta pusat', '26', 2015, 'anonim.png', 'Rifqi_78', '846db1cc75a322fafc36c5ef740b1bf0', '081932706343', 'aktif', 'Jakarta'),
	(239, '10412', 'Hendras duwi handoyo', '2000-02-18', 'L', 'Islam', 'Syamsuri', 'Raniti', '08974675338', 'oyohendras@gmail.com', 'Asrama arhanud', '26', 2016, 'anonim.png', 'Hendrasduwi', 'fa821be92cbda78d72a38665a85faec8', 'handoyo', 'aktif', 'Cirebon'),
	(240, '10294', 'Lina Resmawati', '1999-11-21', 'P', 'Islam', 'Waluyo', 'Siti Aminah', '081280602533', 'linaresmawati55@gmail.com', 'Jl. H. Mawar Rt 006/Rw 07, no:46. Kec:Tanjung Priuk, Kel: Sunter Jaya.', '25', 2015, 'anonim.png', 'Lina Resmawati', 'bf751e2ccabc041b8945bf3de74a1387', 'kebonkosong', 'aktif', 'Cilacap'),
	(241, '10292', 'Kolidah', '2000-02-06', 'P', 'Islam', 'Karjan', 'Solekah', '085215206889', 'kirandrakholidah@gmail.com', 'Jl.suntermuara rt.009 rw.005 no.002', '25', 2015, 'anonim.png', 'Kolidah ', '257d99c3e7805d473df4f7d222c713c1', 'kelompok07', 'aktif', 'Jakarta'),
	(242, '10352', 'Rismaida', '2000-03-17', 'P', 'Islam', 'Daud', 'Rachmayani', '085924626307', 'aconggggg17@gmail.com', 'Jalan H.ung rt 11 rw 04 kelurahan utan panjang kecamatan kemayoran jakarta pusat', '26', 2015, 'anonim.png', 'Aconggggg', 'd1d8724e2a1bab942cafbe1da3a460e2', 'qwerty17', 'aktif', 'Jakarta'),
	(243, '10332', 'Nita Dwi indriana astuti', '1999-12-02', 'P', 'Islam', 'Muhammad idris', 'Hasna', '085717295989', 'indriananita@gmail.com', 'Utan panjang 3 rt03 rw06 no13 ', '26', 2015, 'anonim.png', 'Nitadwi', '48a36ef823f239e381ff6d273c432e60', 'indriananita02', 'aktif', 'Jakarta'),
	(244, '10291', 'khodijatil kubroo hasanah', '1999-10-09', 'P', 'Islam', 'steppanus', 'elis listiani', '087888275655', 'atil.kubro@gmail.com', 'Jl. Sunter muara rt03 rw05 no32', '25', 2015, 'anonim.png', 'khodijatil kubroo hasanah', '257d99c3e7805d473df4f7d222c713c1', 'kelompok07', 'aktif', 'jakarta'),
	(245, '10389', 'ZARAH ANISA FIRUZIA', '2000-03-20', 'P', 'Islam', 'ABDUL ROCHMAN', 'ARNITA', '082112480829', 'zarahanisafiruzia@gmail.com', 'JL. KEBON BAWANG XV NO.15 RT.016 RW.002.KEL. KEBON BAWANG KEC. TANJUNG PRIOK JAKARTA UTARA', '25', 2015, 'anonim.png', 'Zarah Firuzia', '0573551297546dbf40774e2d293acdf8', '20000320Z_', 'aktif', 'JAKARTA'),
	(246, '10209', 'Aulia Nella Handiani', '2001-01-10', 'P', 'Islam', 'Cahyat Supriatna', 'Ida Wahyuni', '089607614795', 'aulianella20@gmail.com', 'Jl.H.ung RT 09 RW 04 No.250\r\nKelurahan utan panjang\r\nKecamatan Kemayoran\r\nJakarta pusat', '25', 2015, 'ef924deb16b1b68295691d658a4e89f1.jpg', 'aulia.anh', 'b14da376351152274d12eda7f0e2cf7f', 'aulia10', 'aktif', 'Jakarta'),
	(247, '10650', 'Febri Onika', '2001-02-24', 'P', 'Kristen', 'Alden Samosir', 'Lince Nainggolan', '089630588536', 'febrionika25@gmail.com', 'Jl. Sky IV rt.013 rw.05 no.49 kelurahan baru sunter jaya Jakarta Utara', '26', 2017, 'anonim.png', 'Febrionika', 'f6b8679282fdf760aaad476fad0ddf12', 'samosir', 'aktif', 'Jakarta'),
	(248, '10588', 'RIFQI FAKHRIATDY RAMADHAN', '2001-12-05', 'L', 'Islam', 'EDY SANTOSO', 'MARYATU', '081218021835', 'rifkiramadhan0305@gmail.com', 'JL.E2 RAYA GG NN NO 37 RT 10 RW 10 CEMPAKA BARU 7 KEMAYORAN JAKARTA PUSAT', '16', 2016, 'a9dc47b50615ffd6c1afa0c82992e19b.png', 'ikiimbiry05', 'a1ed5e2b5b15d11ffaea61d3cd0e3f84', 'ikikece27', 'aktif', 'JAKARTA'),
	(249, '10367', 'Sri kurniawati', '2000-11-13', 'P', 'Islam', 'Nurkhadik', 'Markhamah', '085774862074', 'sritablo13@gmail.com', 'Jl.sunter jaya 7A Rt09 Rw09 No 39', '25', 2015, 'anonim.png', 'Srikurniawati', 'b6b094b2a5a0c8abde0cd561c8c52600', '13112000', 'aktif', 'Jakarta'),
	(250, '10287', 'Karlina Melia Sari ', '2000-06-06', 'P', 'Islam', 'idris yanto ', 'kasini yuni ', '0895325984824', 'sari.karlinamelia06@gmail.com', 'Jl.bendungan jago rt.16 rw.02', '26', 2015, 'anonim.png', 'Karlina_', '000f284086e9dfc9bf8080acf4f45539', '060600lina', 'aktif', 'Jakarta '),
	(251, '10263', 'Friska Steviana', '2000-02-27', 'P', 'Islam', 'Sugiman', 'Tugi yati', '085880726830', 'friskaast@gmail.com', 'Jl.Utan Panjang 3 ,rt 15/05. Kemayoran Jakarta Pusat', '25', 2015, '4140215c6c8cbf4077c04096bb0a2515.jpg', 'Friska Steviana', '5e7961b3fc91faa3b280fad9040f4217', 'febuari', 'aktif', 'Sukoharjo'),
	(252, '10379', 'Verrel Bramasta Erlangga', '2000-07-19', 'L', 'Islam', 'Andi Kesuma', 'Yuyun Sriwahyuni', '081213608964', 'Verrelbramasta10@gmail.com', 'Jl. taruna 2 Rt 07/ Rw 03 No. 17,Kemayoran , Jakarta Pusat', '25', 2015, '083b5d263f2efb1d710f6a93d89bc4a3.jpg', 'VerrelBramasta', '38d937d14aeaf973117ba32a51a09d97', 'erlangga', 'aktif', 'Jakarta'),
	(253, '10329', 'Nanda anggit marsuky', '2000-08-09', 'L', 'Islam', 'Sumarno', 'Suky', '02198753064', 'anggitmarsukyy@gmail.com', 'Jl.cempaka putih utara 5', '26', 2015, 'anonim.png', 'yamateh007', '73189bb4d55fdd23c893f67721cdfb89', 'sapalo123', 'aktif', 'Jakarta'),
	(254, '10264', 'Gaby Adelia Tanti Utomo', '2000-04-18', 'P', 'Kristen', 'Ngadi Utomo', 'Kristanti', '081289301750', 'gabyadelia18@gmail.com', 'Jl. Bendungan Jago 016/002 no.7 , Serdang, Kemayoran, Jakarta Pusat', '25', 2015, '10ed0cb40ffe2478c403ae21bf894e44.jpg', 'Gaby', '28734c2b0ee86b04c5de3904e5049934', 'kelompok7', 'aktif', 'Jakarta'),
	(255, '10262', 'Firdha Zakiah', '2000-07-30', 'P', 'Islam', 'Paishal MJ', 'Rita Kurniasih', '082244643844', 'firdha.dha07@gmail.com', 'Jl.Sumur Batu Utara RT.16 RW.002 No.4 Kec: Kemayoran Kel: Sumur Batu DKI Jakarta, Jakarta Pusat 10640', '25', 2015, 'anonim.png', 'firdhazakiah', 'adee17e8ff3e771648c83b549d7a77ab', 'kutilfirdha1', 'aktif', 'Jakarta'),
	(256, '10370', 'Syafa Putri Hidayati', '2000-08-03', 'P', 'Islam', 'Syarif Hidayat', 'Nuryati', '089518454143', 'Syafaputri711@gmail.com', 'Jl gotong royong rt 07 rw 02 no 20', '25', 2015, 'anonim.png', 'Syafa Putri Hidayati', 'e8301aff9ece174546cb72c832cfa433', 'Syafaputri3', 'aktif', 'Jakarta'),
	(257, '10298', 'Mayang Angelica Puspita Ning Wibowo ', '2000-07-08', 'P', 'Katholik', 'Nugroho agung wibowo', 'Agustina lenawati', '081290543705', 'maykitty123@gmail.com', 'Jalan berlian raya no 26 RT 15 RW 02 Kemayoran sumur batu Jakarta pusat ', '25', 2015, 'anonim.png', 'Mayangangelica', 'b447c364c30fb9627fdb61527d125b53', 'mayang123', 'aktif', 'Jakarta'),
	(258, '10316', 'Muhammad Oktavian Artha Rezal', '2000-10-06', 'L', 'Islam', 'Kusdarizal', 'Suprihartini', '081288333688', 'oooookta@gmail.com', 'Jln.Cempakawangi 2 rt.06 rw.09. No. 40 Kel.Harapan Mulya kec.Kemayoran Jakarta Pusat', '25', 2015, 'fe9f50e9a37fd9b586327e4211d685ef.jpg', 'Muhammad Oktavian Artha Rezal', 'a54e29d64bbb7c92d5781bfeea9dc188', 'movar2000', 'aktif', 'Jakarta'),
	(259, '10572', 'PUTRI RAHAYU WULANDARI', '2001-06-06', 'P', 'Islam', 'EKO WIDO RAHAYU', 'MARTINA RAHAYU', '087788441799', 'putrirw0606@gmail.com', 'JL. SUMUR BATU RAYA RT.02/008', '16', 2016, 'anonim.png', 'putrirahayuw', '3d0050cb3af3bf63afff2f2d19be77a6', 'martinarahayu', 'aktif', 'JAKARTA'),
	(260, '10290', 'Khanza chairunnisa luthfi', '2000-12-06', 'P', 'Islam', 'Watino kusno SE', 'Dyah yulianti SH MH', '02165836300', 'khanza_c_luthfi@yahoo.com', 'Jl agung utara 5C blokA 22 no 16', '25', 2016, 'anonim.png', 'Khanzacluthfi', '5527931dcc6e9a699e13eb46dd3af52f', 'selena khanza luthfi', 'aktif', 'Jakarta'),
	(261, '10221', 'desita dwi suciyani', '2000-12-20', 'P', 'Islam', 'Poniman', 'Siti romelah', '082311570117', 'desitadwis20@gmail.com', 'Jln.  Bentengan gang sky 7', '26', 2015, 'anonim.png', 'desitadwis', 'b80fe36cb8457e70a4b911d3b1759a9e', 'didede20', 'aktif', 'Jakarta'),
	(262, '10263', 'Friska Steviana', '2000-02-27', 'P', 'Islam', 'Sugiman', 'Tugi yati', '085880726830', 'friskaast@gmail.com', 'Jl.Utan Panjang 3 rt15/05 kemayoran jakarta pusat', '25', 2015, 'anonim.png', 'FriskaStev', '5e7961b3fc91faa3b280fad9040f4217', 'febuari', 'aktif', 'Sukoharjo'),
	(263, '10379', 'Verrel Bramasta Erlangga', '2000-07-19', 'L', 'Islam', 'Andi Kesuma', 'Yuyun Sriwahyuni', '081213608964', 'Verrelbramasta10@gmail.com', 'Jl. Taruna 2 Rt 07/ Rw 03 No. 17 , Kemayoran,  Jakarta Pusat', '25', 2015, '083b5d263f2efb1d710f6a93d89bc4a3.jpg', 'Erlangga19', '38d937d14aeaf973117ba32a51a09d97', 'erlangga', 'aktif', 'Jakarta'),
	(264, '10415', 'Ratna Nurul khotimah ', '2000-12-13', 'P', 'Islam', 'Sudarno', 'Tutik dwiastuti', '082213046908', 'baey.jjk@gmail.com', 'Jl.gembira II no 11c ', '25', 2015, 'anonim.png', 'Ratna Nurul ', '972f02c74ce0ec3f2d1c1a1cef64904b', 'ratnanurul', 'aktif', 'Sleman '),
	(265, '10203', 'Araditi Cecielya Putri', '2000-06-20', 'P', 'Islam', 'Eddi Purwanto', 'Kartini', '0895324960894', 'araditicecielyaa@gmail.com', 'Jl. Serdang baru 1 rt 12 rw 04 no 5', '26', 2015, 'anonim.png', 'araditicecielyaa', '96457fa50d3a5aeb8f294e6b6fcfb5d1', 'jakarta2000', 'aktif', 'Jakarta'),
	(266, '10284', 'Joan Artica', '2000-10-07', 'P', 'Kristen', 'Kong Lip Sun', 'Ratna Dewi', '089660383727', 'joanartica1234@gmail.com', 'Jln.telaga murni gang E2 rt 24 rw 01 no 26', '26', 2015, 'anonim.png', 'joanartica', 'a5803dfbc3f1dd22b2f685a80891b2cb', 'joan0710', 'aktif', 'Jakarta'),
	(267, '10405', 'ainun ni\'mah', '1999-11-12', 'P', 'Islam', 'Rasidi', 'Masni', '08971622731', 'abizun80@gmail.com', 'Jl.bentengan Rt 005/ Rw 005 sunter Jaya tg.priok Jakarta Utara no.51', '26', 2015, 'anonim.png', 'ainun nimah', '99d5a9ff0fd99fee55603b7d17fbfa2d', 'ainun12345', 'aktif', 'pekalongan'),
	(268, '10358', 'Salsa Nabila Hardafi', '2001-01-04', 'P', 'Islam', 'H. Firman', 'Miske Niharda', '08121940402', 'hardafinabilasalsa@yahoo.com', 'Jalan Cempaka Baru IX no 06 RT 12 RW 09 Jakarta Pusat  Kec: Kemayoran Kel : Cempaka Baru Kode Pos : 1064 08121940402 ', '25', 2015, '3470a89121cfe0c80ffd928e74f01846.jpg', 'Salsa NH', 'd5581e575ef78eb4280c8386c7965faa', 'Hardafi04', 'aktif', 'Jakarta'),
	(269, '10347', 'Rati ', '1999-11-16', 'P', 'Islam', 'Alm.anwar sanusi', 'Situ mariah', '08891655447', 'ratihmdsr16@gmail.com', 'Jln.kebon kosong XII', '25', 2015, 'anonim.png', 'Ratih', 'f2e338ea372444381ccbdb68768466b6', 'rizkikurniawan', 'aktif', 'Jakarta'),
	(270, '10252', 'Fachtu Robbi Almalik', '1999-11-25', 'L', 'Islam', 'Bahrudin', 'Sanipah', '083871091409', 'Ribenzol@gmail.com', 'Jl. Sunter muara 4, rt 03/05 no. 18. Sunter agung,  Tg. Priok,  jakpus', '25', 2015, 'anonim.png', 'ObbiMalik', '810131df3f20f4618f12714cfd366933', 'Starwars2', 'aktif', 'Jakarta'),
	(271, '10120', 'Dicky Andika Nugraha', '2000-05-02', 'L', 'Islam', 'Dhoni Wendra Bangsawan', 'Priyanti Lestari', '081287047178', 'Andikanugraha60000@yahoo.com', 'Jln. kwitang timur no. 22 Rt.005 Rw.010 Kelurahan Bungur Kecamatan Senen Jakarta Pusat', '25', 2015, 'anonim.png', 'Andikanugraha60', '593d6d0292be6891c9b19821415e6c33', 'kencana2000', 'aktif', 'Jakarta'),
	(272, '10305', 'Mohamat Luqmanul Khakim', '2000-04-09', 'L', 'Islam', 'Arief s', 'Sri Rukminiwati', '087786257518', 'luqmanulxxxv@gmail.com', 'Jl. Sukamulia 4 No. 138 rt 10/06, Harapan Mulia, kemayoran, Jakarta pusat', '25', 2015, 'anonim.png', 'Luqmanulkhakim', 'ecb506067a790e127b7328e474e364d0', '09042000', 'aktif', 'Klaten'),
	(273, '10198', 'Anggun Cahyati', '1999-11-16', 'P', 'Islam', 'Kasman kurniawan', 'Santi', '085945824148', 'anggunanesta16@gmail.com', 'Jalan haji ung rt 008', '25', 2015, 'anonim.png', 'Anggun cahyati', '8b353bbcaed2d8b7c75e7420f64fb5a1', '123anggun', 'aktif', 'Jakarta'),
	(274, '10365', 'Siti yohanah', '2000-05-03', 'P', 'Islam', 'Ahmad Jasuli', 'Timuah', '08973838456', 'sitiyohanaa00@gmail.com', 'Jl.h ung rt.14/04 no.399 Utan Panjang, Kemayoran, Jakarta pusat, DKI Jakarta.', '25', 2015, '5fd1517ba1359b81acdf24440d38a535.jpg', 'Yohana', '2bfbedfb29b7a0a1df2ca8b50e1034fc', 'yohaa000', 'aktif', 'Jakarta'),
	(275, '10371', 'syifaus sakinah', '1999-07-19', 'P', 'Islam', 'saman', 'afrikhah', '089696555840', 'syifaussakinah.ss@gmail.com', 'Jln.Warakas gang 13', '26', 2015, 'anonim.png', 'syifaussakinah', '0fb807392b440e06ee8766d5de3cdc55', 'swifty1999', 'aktif', 'Jakarta'),
	(276, '10272', 'Hilda Alisia', '2000-03-24', 'P', 'Islam', 'Aliyadi', 'Daris Naeli', '081317292659', 'hildaalisia16@gmail.com', 'Jl.Haji Ung', '25', 2015, 'anonim.png', 'Hilda88', '95798647ce6fa972ec965ee7d4be4582', 'hilda88', 'aktif', 'Jakarta'),
	(277, '10367', 'Srikurniawati', '2000-11-13', 'P', 'Islam', 'Nurkhadik', 'Markhamah', '085774862074', 'sritablo13@gmail.com', 'Jl Sunter jaya 7A Rt09 Rw09 No 39', '25', 2015, 'anonim.png', 'Srikurnia', 'b6b094b2a5a0c8abde0cd561c8c52600', '13112000', 'aktif', 'Jakarta'),
	(278, '10253', 'Fadhilah Faza Firdaus', '2000-04-20', 'L', 'Islam', 'Isimaruni', 'Harkopianti S.H', '089630503454', 'fadhilahfazafirdaus@gmail.com', 'Jl. Dakota raya 1C 504\r\nKemayoran \r\nJakarta Pusat', '25', 2015, 'd3c09afb9a9c2b9ae826c79364db6d90.jpg', 'ffazaf', '67eab48a000ea1cb235262c562536e8b', 'faza12345678', 'aktif', 'Balikpapan'),
	(279, '10411', 'Gustiana Putri Maharani', '2000-08-04', 'P', 'Islam', 'Sumarno', 'Endang Sri Wahyuni', '081373269700', 'gustianaputrimaharani@yahoo.com', 'JL. Bentengan XII Rt. 10 RW. 01 no. 23. Sunter Jaya, Tanjung Priok', '26', 2015, 'anonim.png', 'gustianaputri', '929c4aecf74d21f1cf5627b2adf576d3', 'gustianapm04', 'aktif', 'Jakarta '),
	(280, '10313', 'Muhammad Ferdiansyah', '2000-03-21', 'L', 'Islam', 'Haryanto', 'Siti Munifah', '089667655073', 'muhammadferdi235@gmail.com', 'Jl.cempaka II rt 09 rw 03 no.22', '25', 2015, 'anonim.png', 'Ferdians21', 'c7c5925dc26fa3cd770dc22603275290', '21032000', 'aktif', 'Jakarta'),
	(281, '10197', 'Andhira Lintang Maharani', '2000-09-12', 'P', 'Islam', 'Yudhi Supriandi', 'Rachmawati', '081388618450', 'andhiralintangm@gmail.com', 'Jl. Cempaka baru VII rt10/10 No. 13 kemayoran, jakpus', '25', 2015, 'anonim.png', 'Andhiralintang', '6c4164b01e627693c759f05e508a8654', 'mandhiralintng', 'aktif', 'Jakarta'),
	(282, '10291', 'khodijatil Kubroo Hasanah', '1999-10-09', 'P', 'Islam', 'Steppanus', 'Elis Listiani', '087888275655', 'atil.kubro@gmail.com', 'Jl. Sunter Muara RT.03 RW.05', '25', 2015, 'anonim.png', 'khodijatilkubroo', '3e61a463290f4afd34e7247920609578', 'khodi123', 'aktif', 'JAKARTA'),
	(283, '10309', 'MuhamadRachmanWardana', '0000-00-00', 'L', 'Islam', 'Wakidi', 'Sopriyah', '0895351327433', 'rachmanodd@gmail.com', 'Jl.Ancol Selatan No 31 RT.014 RW.03 ', '25', 2015, '115ba7d74464c163d395c856beefe9d7.jpg', 'rachman0403', '5e646f9dd0467bb3a3125c0c1640fafd', 'kerenta12', 'aktif', 'Jakarta'),
	(284, '10245', 'EGA RIFQI ARDANA', '2000-01-18', 'L', 'Islam', 'HERI SUSANTO', 'PAWIT SUYATMI', '082115151590', 'egarifqi18@gmail.com', 'Jln. Sunter bentengan 3 rt02/05 no.73', '25', 2015, 'd9fcdeb6e355549f07212c8fa2845bfa.jpg', 'egaaasoy', '233d7d554048e5da23e742c66970d212', '6508429l', 'aktif', 'JAKARTA'),
	(285, '10280', 'Intan Azzahra', '2000-05-27', 'P', 'Islam', 'Rudi Hence', 'Endang Puji Nitasari', '085813939177', 'intanazzahra27@gmail.com', 'Jl.untan panjang III no.12 rt.9/07 kemayoran, jakarta pusat', '25', 2015, '6a3bf9b6d315564f98852904d0eba9f4.jpg', 'Inaz_27', '1aef0a62ed84bb165989ab32f0ba56c2', 'barbie', 'aktif', 'Jakarta'),
	(286, '10211', 'Bagus Setiawan Muharom', '2001-03-26', 'L', 'Islam', 'Slamet', 'Wasriah', '081322596215', 'godlucifer79@gmail.com', 'Jl kemayoran gempol Rt 08/ Rw 05', '25', 2015, 'anonim.png', 'Bagus SM', '15a1db7c1f8f829c76617a01727c10ea', 'berapa59', 'aktif', 'Tegal'),
	(288, '10291', 'khodijatil kubroo hasanah', '1999-10-09', 'P', 'Islam', 'steppanus', 'Elis Listiani', '087888275655', 'atil.kubro@gmail.com', 'Jl.sunteruara 4 rt3 rw 5 no 32', '25', 2015, 'anonim.png', 'Atilajah', '3e61a463290f4afd34e7247920609578', 'khodi123', 'aktif', 'JAKARTA'),
	(289, '10260', 'Fernanda Affandi Habbibullah', '2000-09-14', 'L', 'Islam', 'Marjuki', 'Sri Wahyuni', '081318736900', 'praabuuu16@gmail.com', 'Jl.  Kemayoran Gempol RT 008/005 No.  16, Kelurahan Kebon Kosong,  Kecamatan Kemayoran, Jakarta Pusat,  10630, DKI Jakarta. ', '25', 2015, 'anonim.png', 'praabuuu16', '0e2357ec0fecfaf5397e36e9c0b7e9de', 'Isyadina23', 'aktif', 'Sukoharjo'),
	(290, '10386', 'Yuda Afriansyah', '2000-04-21', 'L', 'Islam', 'Inen sutriana', 'Sugi', '089653114753', 'yudaafriansyah7@gmail.com', 'Jl.Swadaya no 35 Rt/Rw 03/06 kel.kebon kosong kec.kemayoran Jakarta pusat', '25', 2015, 'anonim.png', 'Yuda Afriansyah', '1e96d34c5e13a9246df2f191d609f1d5', 'arsenal1886', 'aktif', 'Jakarta'),
	(291, '10336', 'Novy', '2000-07-23', 'P', 'Islam', 'Caim', 'Ropiah', '089653819394', 'Novyaeshter@gmai.com', 'Jl.remaja 2 rt005 rw 08 kelurahan cempaka baru, kecamatan Kemayoran', '25', 2015, 'anonim.png', 'Novy', 'bc94a0899e350a6df009df9e90e04c4a', 'aesther', 'aktif', 'Cirebon');
/*!40000 ALTER TABLE `tb_siswa` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_soal_essay
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
) ENGINE=InnoDB AUTO_INCREMENT=7834 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_soal_pilgan: ~10 rows (lebih kurang)
DELETE FROM `tb_soal_pilgan`;
/*!40000 ALTER TABLE `tb_soal_pilgan` DISABLE KEYS */;
INSERT INTO `tb_soal_pilgan` (`id_pilgan`, `id_tq`, `id_pengajar`, `pertanyaan`, `gambar`, `video`, `audio`, `pil_a`, `gbr_a`, `pil_b`, `gbr_b`, `pil_c`, `gbr_c`, `pil_d`, `gbr_d`, `pil_e`, `gbr_e`, `kunci`, `tgl_buat`, `level_group`) VALUES
	(7818, 50, 0, 'Taruh pertanyaan soal disini', '60a818560358988e999cfa90151cd8bd1.jpeg', '', '', 'Jawaban A', 'ee30cc13a10150ba5739853783e474a87.png', 'Jawaban B', '', 'Jawaban C', '', 'Jawaban D', '', 'Jawaban E', '', 'A', '2017-05-18', 1),
	(7819, 50, 0, 'Contoh soal no 2 dengan jawaban bergambar', '', '', '', '', '818ef0611746f6c2d7cc05efc2a8c8292.jpeg', '', '0b1f9476c9242dced2332ee0e964ca3c3.jpeg', '', '4cfebf0cd768c77ae7b83795175be79e4.jpeg', '', '55694fae6ae5ed7db6e69e2d81493e355.jpeg', '', 'ce3607e1a0bab1d914535c369e5e6ad86.jpeg', 'C', '2017-05-18', 2),
	(7820, 50, 0, 'Contoh soal no 2 dengan soal dan jawaban bergambar', '6de9284e193c29bd0104f8bcbf9114a58.jpeg', '', '', '', '4289a8a2bc331250aef8c94158b578209.jpeg', '', '98a94bbf5a0e61707ac4eeb13ac2ef6c10.jpeg', '', '1ea8a4531504b0a28c36c21fa0b577a411.jpeg', '', 'd98aa40ea433188b45090f62e360094812.jpeg', '', '6e01ba536586ed8deff4931a4f1367d913.jpeg', 'E', '2017-05-18', 3),
	(7821, 51, 0, '<p>test</p>', 'cowok-cuek.jpg', '', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', 'B', '2017-05-20', 1),
	(7822, 51, 0, '<p>test soal 2</p>', 'f312c0dda5c81e259baf577b9260173d.jpg', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '', 'cf9c3c37c15c97cc24ba6859fc3ec0f0.jpg', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', 'D', '2017-05-20', 2),
	(7829, 50, 0, '<p>test soal tanpa gambar</p>', '', '', '', '<p>test</p>', '', '<p>test</p>', '', '<p>test</p>', '', '<p>test</p>', '', '<p>test</p>', '', 'D', '2017-05-22', 4),
	(7830, 54, 0, '<p>1 + 1 = ....</p>', '', '', '', '<p>1</p>', '', '<p>2</p>', '', '<p>3</p>', '', '<p>4</p>', '', '<p>5</p>', '', 'B', '2017-05-22', 1),
	(7831, 54, 0, '<p>Perangkat IT yang Berbentuk layar di sebut....</p>', '', '', '', '<p>monitor</p>', '', '<p>cpu</p>', '', '<p>keyboard</p>', '', '<p>mouse</p>', '', '<p>lcd</p>', '', 'A', '2017-05-22', 2),
	(7832, 55, 0, '<p>1 + 1 = ....</p>', '', '', '', '<p>1</p>', '', '<p>2</p>', '', '<p>3</p>', '', '<p>4</p>', '', '<p>5</p>', '', 'B', '2017-05-22', 1),
	(7833, 55, 0, '<p>IT yang digunakan untuk melihat sebagai layar adalah...</p>', '', '', '', '<p>Monitor</p>', '', '<p>CPU</p>', '', '<p>Keyboard</p>', '', '<p>LCD</p>', '', '<p>Leptop</p>', '', 'A', '2017-05-22', 2);
/*!40000 ALTER TABLE `tb_soal_pilgan` ENABLE KEYS */;

-- membuang struktur untuk table elearning.tb_topik_quiz
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_topik_quiz: ~8 rows (lebih kurang)
DELETE FROM `tb_topik_quiz`;
/*!40000 ALTER TABLE `tb_topik_quiz` DISABLE KEYS */;
INSERT INTO `tb_topik_quiz` (`id_tq`, `judul`, `id_kelas`, `id_mapel`, `tgl_buat`, `pembuat`, `waktu_soal`, `info`, `status`) VALUES
	(50, 'ulangan ttest', 17, 8, '2017-05-18', 'admin', 3600, '', 'aktif'),
	(51, 'test ujian guru 2', 16, 9, '2017-05-19', '1', 3600, '', 'aktif'),
	(54, 'Simulasi', 16, 38, '2017-05-22', 'admin', 7200, '', 'aktif'),
	(55, 'simulasi', 17, 38, '2017-05-22', 'admin', 7200, '', 'aktif'),
	(56, 'Simulasi', 18, 38, '2017-05-22', 'admin', 7200, '', 'aktif'),
	(57, 'simulasi', 19, 38, '2017-05-22', 'admin', 7200, '', 'aktif'),
	(58, 'simulasi', 20, 38, '2017-05-22', 'admin', 7200, '', 'aktif'),
	(59, 'simulasi', 21, 38, '2017-05-22', 'admin', 7200, '', 'aktif');
/*!40000 ALTER TABLE `tb_topik_quiz` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

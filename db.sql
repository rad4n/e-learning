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

-- Membuang data untuk tabel elearning.tb_admin: ~0 rows (lebih kurang)
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_mapel: ~3 rows (lebih kurang)
DELETE FROM `tb_mapel`;
/*!40000 ALTER TABLE `tb_mapel` DISABLE KEYS */;
INSERT INTO `tb_mapel` (`id`, `kode_mapel`, `mapel`) VALUES
	(8, 'A1', 'Bahasa indo'),
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
	(37, 'EKO-LM', 'Ekonomi Lintas Minat');
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

-- Membuang data untuk tabel elearning.tb_mapel_ajar: ~0 rows (lebih kurang)
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_nilai_pilgan: ~1 rows (lebih kurang)
DELETE FROM `tb_nilai_pilgan`;
/*!40000 ALTER TABLE `tb_nilai_pilgan` DISABLE KEYS */;
INSERT INTO `tb_nilai_pilgan` (`id`, `id_tq`, `id_siswa`, `benar`, `salah`, `tidak_dikerjakan`, `presentase`, `uraian`) VALUES
	(14, 50, 4, 2, 1, 0, 67, '[{"id":"7818","j":"A"},{"id":"7819","j":"C"},{"id":"7820","j":"E"}]'),
	(16, 52, 5, 1, 2, 0, 33, '[{"id":"7823","j":"A"},{"id":"7824","j":"C"},{"id":"7825","j":"E"}]'),
	(17, 50, 8, 2, 1, 0, 67, '[{"id":"7818","j":"A"},{"id":"7819","j":"B"},{"id":"7820","j":"E"}]');
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

-- Membuang data untuk tabel elearning.tb_pengajar: ~4 rows (lebih kurang)
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_siswa: ~7 rows (lebih kurang)
DELETE FROM `tb_siswa`;
/*!40000 ALTER TABLE `tb_siswa` DISABLE KEYS */;
INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_lengkap`, `tgl_lahir`, `jenis_kelamin`, `agama`, `nama_ayah`, `nama_ibu`, `no_telp`, `email`, `alamat`, `id_kelas`, `thn_masuk`, `foto`, `username`, `password`, `pass`, `status`, `tempat_lahir`) VALUES
	(5, '123456', 'Maulana Misbahus Sihabudin', '2006-05-03', 'L', 'Islam', 'M amin', 'Karla Damayanti', '081381000123', 'maulanamisbahus@gmail.com', 'Jl. Tanah Merdeka rt.10/12 Jakarta', '16', 2016, 'anonim.png', 'Maulana', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'aktif', 'Jakarta'),
	(8, '13123213', 'coba test jangan hapus', '2017-05-12', 'L', 'Islam', 'coba test jangan hapus', 'coba test jangan hapus', '324234', 'radan_stromer@yahoo.co.id', 'coba test jangan hapus', '17', 2020, '5b0d92f1e9a63f6924af76634eba9ad5.png', 'test_siswa_jangan_hapus', 'bcd724d15cde8c47650fda962968f102', 'siswa', 'aktif', 'coba test jangan hapus');
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
) ENGINE=InnoDB AUTO_INCREMENT=7829 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_soal_pilgan: ~5 rows (lebih kurang)
DELETE FROM `tb_soal_pilgan`;
/*!40000 ALTER TABLE `tb_soal_pilgan` DISABLE KEYS */;
INSERT INTO `tb_soal_pilgan` (`id_pilgan`, `id_tq`, `id_pengajar`, `pertanyaan`, `gambar`, `video`, `audio`, `pil_a`, `gbr_a`, `pil_b`, `gbr_b`, `pil_c`, `gbr_c`, `pil_d`, `gbr_d`, `pil_e`, `gbr_e`, `kunci`, `tgl_buat`, `level_group`) VALUES
	(7818, 50, 0, 'Taruh pertanyaan soal disini', '60a818560358988e999cfa90151cd8bd1.jpeg', '', '', 'Jawaban A', 'ee30cc13a10150ba5739853783e474a87.png', 'Jawaban B', '', 'Jawaban C', '', 'Jawaban D', '', 'Jawaban E', '', 'A', '2017-05-18', 1),
	(7819, 50, 0, 'Contoh soal no 2 dengan jawaban bergambar', '', '', '', '', '818ef0611746f6c2d7cc05efc2a8c8292.jpeg', '', '0b1f9476c9242dced2332ee0e964ca3c3.jpeg', '', '4cfebf0cd768c77ae7b83795175be79e4.jpeg', '', '55694fae6ae5ed7db6e69e2d81493e355.jpeg', '', 'ce3607e1a0bab1d914535c369e5e6ad86.jpeg', 'C', '2017-05-18', 2),
	(7820, 50, 0, 'Contoh soal no 2 dengan soal dan jawaban bergambar', '6de9284e193c29bd0104f8bcbf9114a58.jpeg', '', '', '', '4289a8a2bc331250aef8c94158b578209.jpeg', '', '98a94bbf5a0e61707ac4eeb13ac2ef6c10.jpeg', '', '1ea8a4531504b0a28c36c21fa0b577a411.jpeg', '', 'd98aa40ea433188b45090f62e360094812.jpeg', '', '6e01ba536586ed8deff4931a4f1367d913.jpeg', 'E', '2017-05-18', 3),
	(7821, 51, 0, '<p>test</p>', 'cowok-cuek.jpg', '', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', '<p>yg jawab</p>', '', 'B', '2017-05-20', 1),
	(7822, 51, 0, '<p>test soal 2</p>', 'f312c0dda5c81e259baf577b9260173d.jpg', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '', 'cf9c3c37c15c97cc24ba6859fc3ec0f0.jpg', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', '<p>test b</p>', '10a7cdd970fe135cf4f7bb55c0e3b59f.', 'D', '2017-05-20', 2),
	(7823, 52, 0, 'Taruh pertanyaan soal disini', 'e405043981568129a8352e534b3ce40e1.jpeg', '', '', 'Jawaban A', '8c89cbaad52861d7a17a2d2bdb31b1787.png', 'Jawaban B', '', 'Jawaban C', '', 'Jawaban D', '', 'Jawaban E', '', 'A', '2017-05-20', 1),
	(7824, 52, 0, 'Contoh soal no 2 dengan jawaban bergambar', '', '', '', '', 'ea2bd9782684f0045fad756aecbd8ef82.jpeg', '', 'be2ecd92175aa3ff522fb76c77325c2c3.jpeg', '', '553c09a49abaec14520b4fee7f26a0d74.jpeg', '', '3a046507bc4f3e2fdcc1a8fa624ff0925.jpeg', '', 'b4a618e858e7ecd18ebacafff0e4937e6.jpeg', 'C', '2017-05-20', 2),
	(7825, 52, 0, 'Contoh soal no 2 dengan soal dan jawaban bergambar', '9d0922879f16c0f4b35d9c6e67ad57098.jpeg', '', '', '', '735355c1757c0afafedc0646bc166e5b9.jpeg', '', 'fae81c6dd0b2e7998502f8d3a13b019f10.jpeg', '', 'b42dd633892bcdb51a5b398b95cc8bbf11.jpeg', '', '11c3d62f964e4bb4b74bfb6166d444de12.jpeg', '', '552da958719c39fbe3be3f8f80da587713.jpeg', 'E', '2017-05-20', 3),
	(7826, 53, 0, 'Taruh pertanyaan soal disini', '521c7a7d5a9ec981bfc7816eef3e37b41.jpeg', '', '', 'Jawaban A', '2cf4f7cdec310d5d04c09a23426053547.png', 'Jawaban B', '', 'Jawaban C', '', 'Jawaban D', '', 'Jawaban E', '', 'A', '2017-05-20', 1),
	(7827, 53, 0, 'Contoh soal no 2 dengan jawaban bergambar', '', '', '', '', 'f081d552c85a7a627d163c374ddc607c2.jpeg', '', '9db5986bd2d663be3b9773dfa165b8003.jpeg', '', '0d7293bf82c67d8e6e9997db93e3d0304.jpeg', '', '78a0f2910df904bccc8c3de26455c54c5.jpeg', '', 'da8309374f6fe1064f429d0ba340708c6.jpeg', 'C', '2017-05-20', 2),
	(7828, 53, 0, 'Contoh soal no 2 dengan soal dan jawaban bergambar', '069128ad4bdc8b292f2b1564b60780928.jpeg', '', '', '', '436d4cba7add9a82feb12a176e149ce09.jpeg', '', 'cffb5f612f8678a78d33259cb89274a510.jpeg', '', '97acfce060b4fe26831386cca88a8fef11.jpeg', '', '0e05aae16c205ac0a076475378e9cb0212.jpeg', '', '62cdbb4f25751d71b00da1f321965db313.jpeg', 'E', '2017-05-20', 3);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel elearning.tb_topik_quiz: ~2 rows (lebih kurang)
DELETE FROM `tb_topik_quiz`;
/*!40000 ALTER TABLE `tb_topik_quiz` DISABLE KEYS */;
INSERT INTO `tb_topik_quiz` (`id_tq`, `judul`, `id_kelas`, `id_mapel`, `tgl_buat`, `pembuat`, `waktu_soal`, `info`, `status`) VALUES
	(50, 'ulangan ttest', 17, 8, '2017-05-18', 'admin', 3600, '', 'aktif'),
	(51, 'test ujian guru 2', 16, 9, '2017-05-19', '1', 3600, '', 'aktif'),
	(52, 'Penilaian Akhir Tahun', 16, 20, '2017-05-20', 'admin', 3600, 'Soal akan tertutup otomatis pada pukul... dan tidak bisa di akses kembali', 'aktif'),
	(53, 'PAT', 17, 20, '2017-05-20', '26', 3600, '', 'aktif');
/*!40000 ALTER TABLE `tb_topik_quiz` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 16 Haz 2020, 12:50:46
-- Sunucu sürümü: 10.4.6-MariaDB
-- PHP Sürümü: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `emlakci`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `emlak_durum`
--

CREATE TABLE `emlak_durum` (
  `id` int(11) NOT NULL,
  `emlak_durum_ad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `emlak_durum`
--

INSERT INTO `emlak_durum` (`id`, `emlak_durum_ad`) VALUES
(1, 'SATILIK'),
(2, 'KIRALIK'),
(3, 'GUNLUK KIRALIK');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `emlak_tipi`
--

CREATE TABLE `emlak_tipi` (
  `id` int(11) NOT NULL,
  `emlak_tipi_ad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `emlak_tipi`
--

INSERT INTO `emlak_tipi` (`id`, `emlak_tipi_ad`) VALUES
(1, 'KONUT'),
(2, 'IS YERI'),
(3, 'ARSA'),
(4, 'DEVREMULK'),
(5, 'TURISTIK ISLETME');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ev`
--

CREATE TABLE `ev` (
  `ev_no` int(11) NOT NULL,
  `bina_yapim_tarihi` date NOT NULL DEFAULT current_timestamp(),
  `fiyat` int(11) NOT NULL,
  `bina_ozellik` varchar(100) NOT NULL,
  `metre_kare` int(5) NOT NULL,
  `bina_kat` int(10) NOT NULL,
  `ili` int(11) DEFAULT NULL,
  `ilcesi` int(11) DEFAULT NULL,
  `mahallesi` int(11) DEFAULT NULL,
  `cinsi_no` int(11) NOT NULL,
  `emlak_tipi_no` int(11) DEFAULT NULL,
  `konut_tipi_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `ev`
--

INSERT INTO `ev` (`ev_no`, `bina_yapim_tarihi`, `fiyat`, `bina_ozellik`, `metre_kare`, `bina_kat`, `ili`, `ilcesi`, `mahallesi`, `cinsi_no`, `emlak_tipi_no`, `konut_tipi_no`) VALUES
(1, '2000-06-16', 350000, 'NULNULLNULLNULNULNULULNLUNLNUL', 120, 5, 1, 1, 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `il`
--

CREATE TABLE `il` (
  `il_no` int(11) NOT NULL,
  `il_ad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `il`
--

INSERT INTO `il` (`il_no`, `il_ad`) VALUES
(1, 'Adana'),
(2, 'Adiyaman'),
(3, 'Afyonkarahisar'),
(4, 'Agri'),
(5, 'Amasya'),
(6, 'Ankara');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilce`
--

CREATE TABLE `ilce` (
  `ilce_no` int(11) NOT NULL,
  `ilce_ad` varchar(50) NOT NULL,
  `il_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `ilce`
--

INSERT INTO `ilce` (`ilce_no`, `ilce_ad`, `il_no`) VALUES
(1, 'Aladag', 1),
(2, 'Ceyhan', 1),
(3, 'Çukurova', 1),
(4, 'Feke', 1),
(5, 'Kahta', 2),
(6, 'Besni', 2),
(7, 'Gölbasi', 2),
(8, 'Gerger', 2),
(9, 'Basmakci', 3),
(10, 'Bayat', 3),
(11, 'Bolvadin', 3),
(12, 'Cay', 3),
(13, 'Diyadin', 4),
(14, 'Dogubayazit', 4),
(15, 'Patnos', 4),
(16, 'Tutak', 4),
(17, 'Göynücek', 5),
(18, 'Hamamözü', 5),
(19, 'Merzifon', 5),
(20, 'Suluova', 5),
(21, 'Akyurt', 6),
(22, 'Altindag', 6),
(23, 'Ayas', 6),
(24, 'Keciören', 6);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `konut_tipi`
--

CREATE TABLE `konut_tipi` (
  `id` int(11) NOT NULL,
  `konut_tip_ad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `konut_tipi`
--

INSERT INTO `konut_tipi` (`id`, `konut_tip_ad`) VALUES
(1, 'MUSTAKIL EV'),
(2, 'APARTMAN'),
(3, 'CIFTCILIK EVI'),
(4, 'DAG EVI'),
(5, 'BINA'),
(6, 'KOSK'),
(7, 'KOY EVI'),
(8, 'YALI'),
(9, 'RESIDENCE'),
(10, 'VILLA'),
(11, 'YAZLIK');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mahalle`
--

CREATE TABLE `mahalle` (
  `mahalle_no` int(11) NOT NULL,
  `mahalle_ad` varchar(50) NOT NULL,
  `ilce_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `mahalle`
--

INSERT INTO `mahalle` (`mahalle_no`, `mahalle_ad`, `ilce_no`) VALUES
(1, 'AKOREN MAHALLESI', 1),
(2, 'ADAPINAR MAHALLESI', 2),
(3, 'BELEDIYE EVLERI MAHALLESI', 3),
(4, 'BEYAZEVLER MAHALLESI', 3),
(5, 'MELODI MAHALLESI', 4),
(6, 'CICEK MAHALLESI', 4),
(7, 'GOKYUZU MAHALLESI', 5),
(8, 'SELALE MAHALLESI', 5),
(9, 'KILIT EVLER MAHALLESI', 6),
(10, 'SINGER EVLER MAHALLESI', 6),
(11, 'ADNAN MAHALLESI', 7),
(12, 'KUS MAHALLESI', 7),
(13, 'KURTULUS MAHALLESI', 8),
(14, 'SAVAS CADDESI', 8),
(15, 'YAZICI MAHALLESI', 9),
(16, 'KEMAL MAHALLESI', 9),
(17, 'CEYDA MAHALLESI', 10),
(18, 'SEVDA MAHALLESI', 10),
(19, 'ALILER MAHALLESI', 11),
(20, 'SEVEN MAHALLESI', 12),
(21, 'KITAP MAHALLESI', 13),
(22, 'FADIL MAHALLESI', 14),
(23, 'ISMAIL MAHALLESI', 15),
(24, 'HERA MAHALLESI', 16),
(25, 'USLULAR MAHALLESI', 17),
(26, 'SERAMIK MAHALLESI', 18),
(27, 'KAGITCILAR MAHALLESI', 19),
(28, 'SU MAHALLESI', 20),
(29, 'KURT MAHALLESI', 21),
(30, 'ASLANLAR MAHALLESI', 22),
(31, 'KAPICILAR MAHALLESI', 23),
(32, 'INAN MAHALLESI', 24);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `emlak_durum`
--
ALTER TABLE `emlak_durum`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `emlak_tipi`
--
ALTER TABLE `emlak_tipi`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ev`
--
ALTER TABLE `ev`
  ADD PRIMARY KEY (`ev_no`),
  ADD KEY `ili` (`ili`),
  ADD KEY `ilcesi` (`ilcesi`),
  ADD KEY `mahallesi` (`mahallesi`),
  ADD KEY `cinsi_no` (`cinsi_no`),
  ADD KEY `emlak_tipi_no` (`emlak_tipi_no`),
  ADD KEY `konut_tipi_no` (`konut_tipi_no`);

--
-- Tablo için indeksler `il`
--
ALTER TABLE `il`
  ADD PRIMARY KEY (`il_no`);

--
-- Tablo için indeksler `ilce`
--
ALTER TABLE `ilce`
  ADD PRIMARY KEY (`ilce_no`),
  ADD KEY `il_no` (`il_no`);

--
-- Tablo için indeksler `konut_tipi`
--
ALTER TABLE `konut_tipi`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `mahalle`
--
ALTER TABLE `mahalle`
  ADD PRIMARY KEY (`mahalle_no`),
  ADD KEY `ilce_no` (`ilce_no`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `emlak_durum`
--
ALTER TABLE `emlak_durum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `emlak_tipi`
--
ALTER TABLE `emlak_tipi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `ev`
--
ALTER TABLE `ev`
  MODIFY `ev_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `il`
--
ALTER TABLE `il`
  MODIFY `il_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `ilce`
--
ALTER TABLE `ilce`
  MODIFY `ilce_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Tablo için AUTO_INCREMENT değeri `konut_tipi`
--
ALTER TABLE `konut_tipi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `mahalle`
--
ALTER TABLE `mahalle`
  MODIFY `mahalle_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `ev`
--
ALTER TABLE `ev`
  ADD CONSTRAINT `ev_ibfk_1` FOREIGN KEY (`ili`) REFERENCES `il` (`il_no`),
  ADD CONSTRAINT `ev_ibfk_2` FOREIGN KEY (`ilcesi`) REFERENCES `ilce` (`ilce_no`),
  ADD CONSTRAINT `ev_ibfk_3` FOREIGN KEY (`mahallesi`) REFERENCES `mahalle` (`mahalle_no`),
  ADD CONSTRAINT `ev_ibfk_4` FOREIGN KEY (`cinsi_no`) REFERENCES `emlak_durum` (`id`),
  ADD CONSTRAINT `ev_ibfk_5` FOREIGN KEY (`emlak_tipi_no`) REFERENCES `emlak_tipi` (`id`),
  ADD CONSTRAINT `ev_ibfk_6` FOREIGN KEY (`konut_tipi_no`) REFERENCES `konut_tipi` (`id`);

--
-- Tablo kısıtlamaları `ilce`
--
ALTER TABLE `ilce`
  ADD CONSTRAINT `ilce_ibfk_1` FOREIGN KEY (`il_no`) REFERENCES `il` (`il_no`);

--
-- Tablo kısıtlamaları `mahalle`
--
ALTER TABLE `mahalle`
  ADD CONSTRAINT `mahalle_ibfk_1` FOREIGN KEY (`ilce_no`) REFERENCES `ilce` (`ilce_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

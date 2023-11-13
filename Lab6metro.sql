SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `line_id` int(10) unsigned NOT NULL,
  `line_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line_color` char(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `lines` (`line_id`, `line_name`, `line_color`) VALUES
(1, 'Синя лінія', '#0000FF'),
(2, 'Червона лінія', '#FF0000');

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `station_id` int(10) unsigned NOT NULL,
  `station_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`station_id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `fk_line` FOREIGN KEY (`line_id`) REFERENCES `lines` (`line_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `stations` (`station_id`, `station_name`, `line_id`) VALUES
(1, 'Młociny', 1),
(2, 'Wawrzyszew', 1),
(3, 'Stare Bielany', 1),
(4, 'Słodowiec', 1),
(5, 'Marymont', 1),
(6, 'Plac Wilsona', 1),
(7, 'Dworzec Gdański', 1),
(8, 'Muranów', 1),
(9, 'Ratusz Arsenał', 1),
(10, 'Świętokrzyska', 1),
(11, 'Centrum', 1),
(12, 'Plac Konstytucji', 1),
(13, 'Politechnika', 1),
(14, 'Pole Mokotowskie', 1),
(15, 'Raclawicka', 1),
(16, 'Wierzbno', 1),
(17, 'Wilanowska', 1),
(18, 'Służew', 1),
(19, 'Ursynów', 1),
(20, 'Stokłosy', 1),
(21, 'Imielin', 1),
(22, 'Natolin', 1),
(23, 'Kabaty', 1),
(24, 'Karolin', 1),
(25, 'Ksawerów', 1),
(26, 'Nowe Bemowo', 1),
(27, 'Lazurowa', 1),
(28, 'Ursus Niedźwiadek', 1),
(29, 'Ursus', 1),
(30, 'Księcia Janusza', 1),
(31, 'Młynów', 2),
(32, 'Płocka', 2),
(33, 'Rondo Daszyńskiego', 2),
(34, 'Rondo ONZ', 2),
(35, 'Świętokrzyska', 2),
(36, 'Nowy Świat – Uniwersytet', 2),
(37, 'Centrum Nauki Kopernik', 2),
(38, 'Stadion Narodowy', 2),
(39, 'Dworzec Wileński', 2),
(40, 'Szwedzka', 2),
(41, 'Targówek Mieszkaniowy', 2),
(42, 'Trocka', 2),
(43, 'Zacisze', 2),
(44, 'Kondratowicza', 2),
(45, 'Bródno', 2);
DROP TABLE IF EXISTS `connections`;
CREATE TABLE `connections` (
  `connection_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station1_id` int(10) unsigned NOT NULL,
  `station2_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `station1_id` (`station1_id`),
  KEY `station2_id` (`station2_id`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`station1_id`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`station2_id`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `connections` (`station1_id`, `station2_id`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(15, 16),
(16, 17),
(17, 18),
(18, 19),
(19, 20),
(20, 21),
(21, 22),
(22, 23),
(23, 24),
(24, 25),
(25, 26),
(26, 27),
(27, 28),
(28, 29),
(29, 30),
(31, 32),
(32, 33),
(33, 34),
(34, 35),
(35, 36),
(36, 37),
(37, 38),
(38, 39),
(39, 40),
(40, 41),
(41, 42),
(42, 43),
(43, 44),
(44, 45),
(10, 35)
;
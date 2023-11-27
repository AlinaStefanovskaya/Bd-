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
  `station_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`station_id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `fk_line` FOREIGN KEY (`line_id`) REFERENCES `lines` (`line_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `stations` (`station_id`, `station_name`, `line_id`, `station_order`) VALUES
(1, 'Młociny', 1,1),
(2, 'Wawrzyszew', 1,2),
(3, 'Stare Bielany', 1,3),
(4, 'Słodowiec', 1,4),
(5, 'Marymont', 1,5),
(6, 'Plac Wilsona', 1,6),
(7, 'Dworzec Gdański', 1,7),
(8, 'Muranów', 1,8),
(9, 'Ratusz Arsenał', 1,9),
(10, 'Świętokrzyska', 1,10),
(11, 'Centrum', 1,11),
(12, 'Plac Konstytucji', 1,12),
(13, 'Politechnika', 1,13),
(14, 'Pole Mokotowskie', 1,14),
(15, 'Raclawicka', 1,15),
(16, 'Wierzbno', 1,16),
(17, 'Wilanowska', 1,17),
(18, 'Służew', 1,18),
(19, 'Ursynów', 1,19),
(20, 'Stokłosy', 1,20),
(21, 'Imielin', 1,21),
(22, 'Natolin', 1,22),
(23, 'Kabaty', 1,23),
(24, 'Karolin', 1,24),
(25, 'Ksawerów', 1,25),
(26, 'Nowe Bemowo', 1,26),
(27, 'Lazurowa', 1,27),
(28, 'Ursus Niedźwiadek', 1,28),
(29, 'Ursus', 1,29),
(30, 'Księcia Janusza', 1,30),
(31, 'Młynów', 2,1),
(32, 'Płocka', 2,2),
(33, 'Rondo Daszyńskiego', 2,3),
(34, 'Rondo ONZ', 2,4),
(35, 'Świętokrzyska', 2,5),
(36, 'Nowy Świat – Uniwersytet', 2,6),
(37, 'Centrum Nauki Kopernik', 2,7),
(38, 'Stadion Narodowy', 2,8),
(39, 'Dworzec Wileński', 2,9),
(40, 'Szwedzka', 2,10),
(41, 'Targówek Mieszkaniowy', 2,11),
(42, 'Trocka', 2,12),
(43, 'Zacisze', 2,13),
(44, 'Kondratowicza', 2,14),
(45, 'Bródno', 2,15);

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
(10, 35);

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE `transfers` (
  `transfer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_from_id` int(10) unsigned NOT NULL,
  `station_to_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`transfer_id`),
  KEY `station_from_id` (`station_from_id`),
  KEY `station_to_id` (`station_to_id`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`station_from_id`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`station_to_id`) REFERENCES `stations` (`station_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `transfers` (`station_from_id`, `station_to_id`) VALUES
(10, 35),
(35, 10);
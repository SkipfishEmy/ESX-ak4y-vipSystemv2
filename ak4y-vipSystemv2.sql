-- Tabelle für Spieler mit Coins
CREATE TABLE IF NOT EXISTS `ak4y_vipsystemv2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '0',
  `coinAmount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Tabelle für die einlösbaren Codes
CREATE TABLE IF NOT EXISTS `ak4y_vipsystemv2_codes` (
  `code` varchar(255) NOT NULL,
  `coinAmount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

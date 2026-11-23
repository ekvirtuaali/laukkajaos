SET NAMES utf8mb4;
SET foreign_key_checks=0;
CREATE TABLE IF NOT EXISTS `horses` (
  `id` INT NOT NULL PRIMARY KEY, `nimi` VARCHAR(255), `kuollut_pvm` VARCHAR(32), `rotu` VARCHAR(100), `sukupuoli` VARCHAR(20),
  `ika_vuotta` INT, `syntyma_cas` INT, `sakakorkeus_cm` DECIMAL(5,1), `vari` VARCHAR(100), `tila` VARCHAR(50), `laji` VARCHAR(50),
  `sukuluokitus` VARCHAR(100), `matka_pohja` VARCHAR(100), `omistaja` VARCHAR(100), `talli` VARCHAR(255), `talli_url` VARCHAR(500),
  `kasvattaja` VARCHAR(255), `kasvattaja_talli` VARCHAR(255), `aiemmat_omistajat` TEXT, `isa_id` INT, `isa_nimi` VARCHAR(255),
  `ema_id` INT, `ema_nimi` VARCHAR(255), `isalinja_nimi` VARCHAR(255), `isalinja_polvia` INT, `emalinja_nimi` VARCHAR(255),
  `emalinja_polvia` INT, `jalkelaiset_teksti` TEXT, `updated_at` VARCHAR(40),
  KEY `isa` (`isa_id`), KEY `ema` (`ema_id`), KEY `nimi` (`nimi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `competitions` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY, `horse_id` INT NOT NULL, `laji` VARCHAR(30), `ika` VARCHAR(20), `pvm` VARCHAR(20),
  `rata` VARCHAR(255), `kutsu_id` INT, `kutsu_url` VARCHAR(500), `kilpailun_nimi` VARCHAR(255), `ehdot` VARCHAR(255),
  `sijoitus` VARCHAR(20), `palkintosumma` INT,
  KEY `horse` (`horse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `statistics` (
  `horse_id` INT NOT NULL, `laji` VARCHAR(30) NOT NULL, `taso` VARCHAR(30), `startit` INT, `sij1` INT, `sij2` INT, `sij3` INT, `sij4` INT,
  `voittosumma` INT, `voitto_pct` INT, `sijoitus_pct` INT, PRIMARY KEY (`horse_id`,`laji`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `stables` (
  `slug` VARCHAR(191) NOT NULL PRIMARY KEY, `nimi` VARCHAR(255), `kotisivu` VARCHAR(500), `omistaja` VARCHAR(100),
  `kasvattajanimet` TEXT, `updated_at` VARCHAR(40)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `listat` (
  `horse_id` INT NOT NULL, `lista` VARCHAR(30) NOT NULL, `havaittu` VARCHAR(40), PRIMARY KEY (`horse_id`,`lista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

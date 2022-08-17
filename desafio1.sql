-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA IF NOT EXISTS SpotifyClone;
USE SpotifyClone;
-- -----------------------------------------------------
-- Table SpotifyClone.plano
-- -----------------------------------------------------

CREATE TABLE plano(
	`plano_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`type` VARCHAR(50) NOT NULL,
	`price` DECIMAL(8,2) NOT NULL
) engine=InnoDB;

INSERT INTO SpotifyClone.plano (`type`, `price`)
  VALUES
    ('Gratuito', 0.00),
    ('Familiar', 7.99),
    ('Universitário', 5.99),
    ('Pessoal', 6.99);

-- -----------------------------------------------------
-- Table SpotifyClone.user
-- -----------------------------------------------------

CREATE TABLE user(
    `user_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `age` DECIMAL(2) NOT NULL, 
    `plano_id` INT NOT NULL,
    `signature_date` DATE NOT NULL, 
    FOREIGN KEY (`plano_id`) REFERENCES plano(`plano_id`)
) engine=InnoDB;

INSERT INTO SpotifyClone.user (`first_name`, `last_name`, `age`, `plano_id`, `signature_date`)
  VALUES
    ('Barbara', 'Liskov', 82, 1, '2019-10-20'),
    ('Robert', 'Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada', 'Lovelace', 37, 2, '2017-12-30'),
    ('Martin', 'Fowler', 46, 2, '2017-01-17'),
    ('Sandi', 'Metz', 58, 2, '2018-04-29'),
    ('Paulo', 'Freire', 19, 3, '2018-02-14'),
    ('Bell', 'Hooks', 26, 3, '2018-01-05'),
    ('Christopher', 'Alexander', 85, 4, '2019-06-05'),
    ('Judith', 'Butler', 45, 4, '2020-05-13'),
    ('Jorge', 'Amado', 58, 4, '2017-02-17');

-- -----------------------------------------------------
-- Table SpotifyClone.artist
-- -----------------------------------------------------

CREATE TABLE artist(
	`artist_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL
) engine=InnoDB;

INSERT INTO SpotifyClone.artist(`name`) 
	VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');


-- -----------------------------------------------------
-- Table SpotifyClone.album
-- -----------------------------------------------------


CREATE TABLE album(
    `album_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `release_year` int(11) NOT NULL,
    `artist_id` INT NOT NULL,
    FOREIGN KEY (`artist_id`) REFERENCES artist(`artist_id`)
) engine=InnoDB;

INSERT INTO SpotifyClone.album(`name`, `release_year`, `artist_id`)
	VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);
    

-- -----------------------------------------------------
-- Table SpotifyClone.album
-- -----------------------------------------------------

CREATE TABLE music(
    `music_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `lenght` INT(11) NOT NULL,
    `album_id` INT NOT NULL,
    FOREIGN KEY (`album_id`) REFERENCES album(`album_id`)
) engine=InnoDB;

INSERT INTO SpotifyClone.music(`name`, `lenght`, `album_id`)
	VALUES
    ('BREAK MY SOUL', 279, 1),
    ('VIRGO’S GROOVE', 369, 1),
    ('ALIEN SUPERSTAR', 116, 1),
    ('Don’t Stop Me Now', 203, 2),
    ('Under Pressure', 152, 3),
    ('Como Nossos Pais', 105, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
	('Samba em Paris', 267, 6),
	('The Bard’s Song', 244, 7),
	('Feeling Good', 100, 8);



-- -----------------------------------------------------
-- Table SpotifyClone.following_artists
-- -----------------------------------------------------

CREATE TABLE `following_artists`(
    `user_id` INT NOT NULL,
    `artist_id` INT NOT NULL,
    PRIMARY KEY (`user_id`, `artist_id`),
    FOREIGN KEY (`user_id`) REFERENCES user(`user_id`),
    FOREIGN KEY (`artist_id`) REFERENCES artist(`artist_id`)
) engine=InnoDB;

INSERT INTO SpotifyClone.following_artists(`user_id`, `artist_id`)
	VALUES 
     (1, 1),
     (1, 2),
     (1, 3),
     (2, 1),
     (2, 3),
     (3, 2),
     (4, 4),
     (5, 5),
     (5, 6),
     (6, 1),
     (6, 6),
     (7, 6),
     (9, 3),
     (10, 2);
    

-- -----------------------------------------------------
-- Table SpotifyClone.reproduction_history
-- -----------------------------------------------------
CREATE TABLE `reproduction_history`(
    `user_id` INT NOT NULL,
    `music_id` INT NOT NULL,
    `reproduction_date` DATETIME NOT NULL,
    PRIMARY KEY (`user_id`, `music_id`),
	FOREIGN KEY (`user_id`) REFERENCES user(`user_id`),
    FOREIGN KEY (`music_id`) REFERENCES music(`music_id`)
) engine=InnoDB;

INSERT INTO SpotifyClone.reproduction_history(`user_id`, `music_id`, `reproduction_date`)
	VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
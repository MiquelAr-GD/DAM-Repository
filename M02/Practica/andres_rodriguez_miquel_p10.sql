CREATE DATABASE discografia;
CREATE TABLE albums(
nom				VARCHAR(50) PRIMARY KEY,
data_publicacio DATE NOT NULL,
genere			VARCHAR(15) NOT NULL DEFAULT('pop'),
format			ENUM('casset', 'vinil', 'cd', 'laserdisc', 'mp3') NOT NULL DEFAULT('cd'),
favorit			ENUM('si','no') DEFAULT('no')
)Engine = InnoDB; 
CREATE TABLE cançons(
nom				VARCHAR(50),
album			VARCHAR(50),
durada			TIME NOT NULL,
favorita		ENUM('si','no') DEFAULT('no'),
CHECK (durada >= 1),
PRIMARY KEY (nom, album)
)Engine=InnoDB;

INSERT INTO albums VALUES ('The Eminem Show', '2002-05-26', 'rap', 'cd', 'si');
INSERT INTO albums VALUES ('Slipknot', '1999-06-29', 'Nu metal', 'vinil', 'no');
INSERT INTO albums VALUES ('Back in Black', '1980-07-25', 'Hard rock', 'cd', 'si');

INSERT INTO cançons VALUES ('Hell Bells', '00:05:13','si');
INSERT INTO cançons VALUES ('Shoot to Thrill', '00:05:20','si');
INSERT INTO cançons VALUES ('Back in Black', '00:04:16','si');

INSERT INTO cançons VALUES ('Eyeless', '00:03:56','si');
INSERT INTO cançons VALUES ('Wait and Bleed', '00:02:27','si');
INSERT INTO cançons VALUES ('Liberate', '00:03:06','si');

INSERT INTO cançons VALUES ('The Kiss', '00:01:15','si');
INSERT INTO cançons VALUES ('Without Me', '00:04:50','si');
INSERT INTO cançons VALUES ('Superman', '00:05:50','si');

CREATE TABLE grups(
nom				VARCHAR(50) PRIMARY KEY,
nombre_membres	int NOT NULL,
pais			VARCHAR(50),
acy_creacio		int NOT NULL,
faborit			ENUM('si','no') DEFAULT('no')
)Engine= InnoDB;

INSERT INTO grups VALUES ('Eminem', '1', 'EEUU', '2002', 'si');
INSERT INTO grups VALUES ('Slipknot', '8', 'EEUU', '1995', 'no');
INSERT INTO grups VALUES ('AC/DC', '5', 'EEUU', '1973', 'no');

ALTER TABLE cançons
ADD CONSTRAINT  fk_cançons_albums FOREIGN KEY (album) REFERENCES ALBUMS(nom);

ALTER TABLE albums
ADD grup VARCHAR(50);

ALTER TABLE albums
ADD  CONSTRAINT  fk_albums_grups FOREIGN KEY (grup) REFERENCES GRUPS(nom);

ALTER TABLE albums
ADD CHECK (data_publicacio >= '1900-00-00' AND data_publicacio <= '2020-00-00');

ALTER TABLE grups
MODIFY pais VARCHAR(50) NOT NULL;

SELECT UPPER(pro.nom)
FROM client ci, comanda com, conte con, producte pro, postre pos
WHERE ci.telefon = com.telefon_client 
	AND com.numero = con.comanda
	AND con.producte = pro.codi
    AND pro.codi = pos.codi
	AND ci.adreca LIKE '%Carrer de Dalt%';

SELECT CONCAT(COUNT(p.nom), 'comanda/es')
FROM empleat em, comanda com, conte con, producte p
WHERE em.codi = com.empleat
	AND com.numero = con.comanda
    AND con.producte = p.codi
    AND p.preu < 15
    AND em.cognoms <> 'Casas';
    
SELECT *
FROM empleat em, comanda com, conte con, producte pro, postre pos, beguda be
WHERE em.codi = com.empleat
	AND com.numero = con.comanda
	AND con.producte = pro.codi
    AND pro.codi = pos.codi
    AND pro.codi = be.codi
	AND em.codi = 1;
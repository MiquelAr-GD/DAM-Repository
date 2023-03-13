CREATE DATABASE examenUf2;
USE examenUf2;
-- Exercici1
CREATE TABLE autors(
dni				VARCHAR(9)	PRIMARY KEY,
nom_complet		VARCHAR(25)	NOT NULL,
naixement		DATE,
nacionalitat	VARCHAR(15)	DEFAULT ('Espanyola')
)Engine=InnoDB;
-- Exercici 2
INSERT INTO autors VALUES ('12345678Y', 'Perez Pons, Antonio', '1981-12-03', 'Espanyola');
INSERT INTO autors VALUES ('23456789T', 'Pavon Puertas, Cristina', '1965-10-16', 'Chilena');
INSERT INTO autors VALUES ('34567890R', 'Marquez Santos, Felipe', '1983-11-17', 'Andorrana');
-- Exercici 3
-- Creo la clau primaria a de forma temporal ja que la clau primaria real la creo mes endevant
CREATE TABLE editorials(
nom			VARCHAR(50)		NOT NULL,
adreça		VARCHAR(40)		NOT NULL,
poblacio	VARCHAR(15)		DEFAULT('Barelona'),
creacio		DATE			NOT NULL,
a			INT				PRIMARY KEY
)Engine=InnoDB;

-- Exercici 4
ALTER TABLE editorials
ADD codi 	INT	AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE editorials
DROP a;

-- Exercici 5
INSERT INTO editorials (nom, adreça, poblacio, creacio) VALUES('Ieditorial Elearning S.L.','Calle Abeto, 4','Atarfe','1992-03-12');
INSERT INTO editorials (nom, adreça, poblacio, creacio) VALUES('RA-MA S.A.','Calle del Jarama, 3','Paracuellos','1968-12-07');
INSERT INTO editorials (nom, adreça, poblacio, creacio) VALUES('Anaya S.A.','Calle juan ignacio luca de tena, 15','Madrid','1956-04-19');

-- Exercici 6
ALTER TABLE autors
ADD editorial INT AUTO_INCREMENT, 
ADD FOREIGN KEY (editorial) REFERENCES EDITORIALS(codi);

-- Exercici 8
ALTER TABLE editorials
ADD CONSTRAINT ck_editorials_creacio CHECK (creacio >= 1950-01-01);

-- Exercici 9
USE pizzeria;

SELECT AVG(be.capacitat) AS 'Mitjana de capacitat'
FROM empleat em, comanda co, conte con, producte po, beguda be
WHERE em.codi = co.empleat
	AND co.numero = con.comanda
    AND con.producte = po.codi
    AND po.codi = be.codi
    AND em.cognoms LIKE '%asa%'
    AND con.quantitat < 3
    AND co.telefon_client LIKE '6%';
    
-- Exercici 10
SELECT DISTINCT concat(UPPER(em.nom),' ', UPPER(em.cognoms))
FROM empleat em, comanda co, conte con, producte po, pizza pi, forma f, ingredient i
WHERE em.codi = co.empleat
	AND co.numero = con.comanda
    AND con.producte = po.codi
    AND po.codi = pi.codi
    AND pi.codi = f.pizza
    AND f.ingredient = i.codi
    AND i.nom LIKE '%tomàquet%'
    AND po.preu BETWEEN 17 AND 21;
    
-- Exercici 11   
SELECT SUM(con.quantitat) AS 'Suma de productes venuts'
FROM client ci, comanda co, conte con
WHERE ci.telefon = co.telefon_client
		AND co.numero = con.comanda	
        AND ci.nom LIKE '%Ribas'
        AND co.domicili_local LIKE 'L'
        AND (weekday(co.data_hora) = 0 OR  weekday(co.data_hora) = 2);
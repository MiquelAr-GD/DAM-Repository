CREATE DATABASE practica3;

USE practica3;

CREATE TABLE alumne

(codi INT PRIMARY KEY AUTO_INCREMENT,

nom VARCHAR(20) NOT NULL,

cognom VARCHAR(20) NOT NULL,

data_naixement DATE,

edat INT

);

INSERT INTO alumne VALUES (NULL,'Guillem','Homet','1992/12/20',NULL);

INSERT INTO alumne VALUES (NULL,'Marta','Ros','1993/01/21',NULL);

INSERT INTO alumne VALUES (NULL,'Miquel','Rodríguez','1990/10/11',NULL);

CREATE TABLE professor

(codi INT PRIMARY KEY AUTO_INCREMENT,

nom VARCHAR(20) NOT NULL,

cognom VARCHAR(20) NOT NULL,

data_naixement DATE,

edat INT

);

INSERT INTO professor VALUES (NULL,'Núria','Ribas','1985/10/06',NULL);

INSERT INTO professor VALUES (NULL,'Carles','Pujol','1978/06/14',NULL);
/*------------------------------------------------------------------------------------*/

DROP PROCEDURE IF EXISTS cerca;
DELIMITER //
CREATE PROCEDURE cerca(IN valor VARCHAR(20))
BEGIN
    SELECT alumne.cognom 
    FROM alumne 
    WHERE alumne.cognom LIKE valor;
END //
DELIMITER ;

CALL cerca('R%');


DROP PROCEDURE IF EXISTS cerca2;
DELIMITER //
CREATE PROCEDURE cerca2(IN valor VARCHAR(20), IN valor2 VARCHAR(20))
BEGIN
    IF(valor IS NULL AND valor2 IS NULL)THEN
		SELECT 'No has introduit cap parametre';
    ELSEIF (valor IS NOT NULL AND valor2 IS NOT NULL) THEN
		SELECT professor.nom, professor.cognom
		FROM professor
        WHERE valor LIKE professor.nom
				AND valor2 LIKE professor.cognom;
	ELSEIF (valor2 IS NOT NULL) THEN
		SELECT professor.cognom
        FROM professor
        WHERE valor2 LIKE professor.cognom;
	ELSE SELECT professor.nom FROM professor WHERE valor LIKE professor.nom;
    END IF;
END //
DELIMITER ;

CALL cerca2(NULL,'Ribas');

DROP PROCEDURE IF EXISTS actualitza;
DELIMITER //
CREATE PROCEDURE actualitza(IN valor INT)
BEGIN
        UPDATE professor SET codi = codi + valor;
END //
DELIMITER ;

CALL actualitza(20);

DROP PROCEDURE IF EXISTS inserir;
DELIMITER //
CREATE PROCEDURE inserir(IN nom VARCHAR(20), IN cognom VARCHAR(20), IN dataneix date, IN aOp VARCHAR(20))
BEGIN
        IF(aOp LIKE 'professor') THEN
        INSERT INTO professor VALUES (NULL, nom, cognom, dataneix, NULL);
        ELSE INSERT INTO alumne VALUES (NULL, nom, cognom, dataneix, NULL);
        END IF;
END //
DELIMITER ;

CALL inserir('Xavier','Vilà','1975/02/03','professor');

DROP PROCEDURE IF EXISTS data_naixement;
DELIMITER //
CREATE PROCEDURE data_naixement(IN codi int(11), IN dataneix date)
BEGIN
        UPDATE alumne SET data_naixement = dataneix WHERE alumne.codi = codi;
END //
DELIMITER ;

CALL data_naixement(21,'1995/03/19'); 


DROP PROCEDURE IF EXISTS edat;
DELIMITER //
CREATE PROCEDURE edat(IN pOa VARCHAR(20), IN codii INT)
BEGIN
       IF(pOa LIKE 'professor') THEN
        SELECT YEAR(curdate()) - YEAR(professor.data_naixement)
        FROM professor
        WHERE professor.codi = codii;
        ELSE 
        SELECT YEAR(curdate()) - YEAR(alumne.data_naixement)
        FROM alumne
        WHERE alumne.codi = codii;
        END IF;
END //
DELIMITER ;

CALL edat('professor',21);
/*Exercici DCL_24:

Crea un procediment per elimini els registres de la taula alumnes que tenen el codi entre els dos que l'indicarem (inclosos).

Exemple d'execució: CALL elimina(20,22);*/
DROP PROCEDURE IF EXISTS elimina;
DELIMITER //
CREATE PROCEDURE elimina(IN codi1 INT, IN codi2 INT)
BEGIN
       DELETE FROM alumne WHERE alumne.codi BETWEEN codi1 AND codi2;
END //
DELIMITER ;

CALL elimina(20,22);
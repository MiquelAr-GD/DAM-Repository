DROP DATABASE IF EXISTS centre;
CREATE DATABASE IF NOT EXISTS centre;

CREATE TABLE families (
	codi VARCHAR(3) PRIMARY KEY,
	nom VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

INSERT INTO families VALUES ("ADM", "Administracio i gestio"),
							("INF", " Informàtica i comunicació"),
							("COM", "Comerç i màrqueting"),
							("HOT", "Hoteleria i turisme");
                            
CREATE TABLE cicle_formatiu (
	codi VARCHAR(4) PRIMARY KEY,
	titol VARCHAR(50),
    grau ENUM('GM','GS'),
    familia VARCHAR(3),
    CONSTRAINT c_f FOREIGN KEY (familia) REFERENCES families(codi)
) ENGINE=InnoDB;
ALTER TABLE cicle_formatiu
MODIFY grau ENUM('GM','GS')NOT NULL;
INSERT INTO cicle_formatiu VALUES ('SMIX','Sistemes microinformàtics i xarxes','GM','INF'),
								  ('ASIX','Administració de sistemes informàtics en la xarxa','GS','INF'),
                                  ('DAM','Desenvolupament d\'aplicacions multiplataforma','GS','INF'),
								  ('DAW','Desenvolupament d\'aplicacions web','GS','INF');
CREATE TABLE modul (
	numero TINYINT,
    titol VARCHAR(75) NOT NULL UNIQUE,
    cicle VARCHAR(4),
    PRIMARY KEY (numero, cicle),
    CONSTRAINT m_c FOREIGN KEY (cicle) REFERENCES cicle_formatiu(codi)
) ENGINE=InnoDB;


INSERT INTO modul VALUES	(1,'Muntatge i manteniment d\'equips', 'SMIX'),
							(2,'Sistemes operatius monolloc', 'SMIX'),
                            (1,'Implantació de sistemes operatius', 'ASIX'),
                            (2,'Gestió de bases de dades', 'ASIX'),
                            (3,'Programació bàsica', 'ASIX');

CREATE TABLE unitat_formatives	 (
	numero TINYINT,
    titol VARCHAR(75) NOT NULL UNIQUE,
    cicle VARCHAR(4),
    modul TINYINT,
    PRIMARY KEY (numero, cicle, modul),
    CONSTRAINT uf_c FOREIGN KEY (cicle) REFERENCES cicle_formatiu(codi),
    CONSTRAINT uf_m FOREIGN KEY (modul) REFERENCES modul(numero)
) ENGINE=InnoDB;

INSERT INTO unitat_formatives VALUES	(1,'Electricitat a l’ordinador', 'SMIX',1),
										(2,'Components d’un equip microinformàtic', 'SMIX',1),
										(3,'Muntatge d’un equip microinformàtic', 'SMIX',1),
										(1,'Introducció als sistemes operatius', 'SMIX',2),
										(2,'Sistemes operatius propietaris', 'SMIX',2),
										(1,'Instal·lació, configuració i explotació del sistema informàtic', 'ASIX',1),
										(2,'Gestió de la informació i de recursos en una xarxa', 'ASIX',1),
										(1,'Introducció a les bases de dades', 'ASIX',2),
										(2,'Llenguatges SQL: DML i DDL', 'ASIX',2),
										(1,'Programació estructurada', 'ASIX',3);

ALTER TABLE modul 
ADD hores SMALLINT;

ALTER TABLE unitat_formatives 
ADD hores SMALLINT;

UPDATE modul SET hores = 192 WHERE numero=1 AND cicle='SMIX';
UPDATE modul SET hores = 132 WHERE numero=2 AND cicle='SMIX';
UPDATE modul SET hores = 231 WHERE numero=1 AND cicle='ASIX';
UPDATE modul SET hores = 165 WHERE numero=2 AND cicle='ASIX';
UPDATE modul SET hores = 165 WHERE numero=3 AND cicle='ASIX';

UPDATE unitat_formatives SET hores = 25 WHERE numero=1 AND cicle='SMIX' AND modul = 1;
UPDATE unitat_formatives SET hores = 28 WHERE numero=2 AND cicle='SMIX' AND modul = 1;
UPDATE unitat_formatives SET hores = 28 WHERE numero=3 AND cicle='SMIX' AND modul = 1;
UPDATE unitat_formatives SET hores = 33 WHERE numero=1 AND cicle='SMIX' AND modul = 2;
UPDATE unitat_formatives SET hores = 33 WHERE numero=2 AND cicle='SMIX' AND modul = 2;
UPDATE unitat_formatives SET hores = 60 WHERE numero=1 AND cicle='ASIX' AND modul = 1;
UPDATE unitat_formatives SET hores = 80 WHERE numero=2 AND cicle='ASIX' AND modul = 1;
UPDATE unitat_formatives SET hores = 33 WHERE numero=1 AND cicle='ASIX' AND modul = 2;
UPDATE unitat_formatives SET hores = 66 WHERE numero=2 AND cicle='ASIX' AND modul = 2;
UPDATE unitat_formatives SET hores = 85 WHERE numero=1 AND cicle='ASIX' AND modul = 3;



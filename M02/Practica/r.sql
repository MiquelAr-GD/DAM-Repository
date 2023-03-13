CREATE DATABASE EMPRESA;
CREATE TABLE empleat(
   codi            SMALLINT(4),
   nom             VARCHAR(15),
   cognoms         VARCHAR(30),
   treball         VARCHAR(10),
   codi_carrec 	   SMALLINT(4),
   data_contracte  DATE,
   salari 		   MEDIUMINT(7),
   comissio		   MEDIUMINT(7),
   departament	   TINYINT(2),
   PRIMARY KEY (codi)
)engine = InnoDB;
DROP TABLE DEPARTAMENT;
ALTER TABLE empleat
MODIFY salari decimal(7,2) NOT NULL;
DESC departament;
CREATE TABLE DEPARTAMENT (
numero_dep		TINYINT(2)	PRIMARY KEY,
nom_dep			VARCHAR(9),
localitzacio	VARCHAR(10)
)ENGINE = InnoDB;
CREATE TABLE empleat2(
   codi            SMALLINT(4)	PRIMARY KEY,
   nom             VARCHAR(15),
   cognoms         VARCHAR(30),
   treball         VARCHAR(10),
   codi_carrec 	   SMALLINT(4),
   data_contracte  DATE,
   salari 		   MEDIUMINT(7),
   comissio		   MEDIUMINT(7),
   departament	   TINYINT(2),
   CONSTRAINT fk_departament FOREIGN KEY (departament) REFERENCES DEPARTAMENT(numero_dep)
)engine = InnoDB;

ALTER TABLE EMPLEAT2
ADD CONSTRAINT unic_sal_comm UNIQUE (salari, comissio);
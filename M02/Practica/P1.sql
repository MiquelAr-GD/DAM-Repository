CREATE DATABASE permis;
USE permis;
CREATE TABLE usuari 
(codi INT PRIMARY KEY,
nom VARCHAR(25) NOT NULL
) ENGINE=InnoDB;
CREATE TABLE contrasenya
(codi INT PRIMARY KEY,
contrasenya VARCHAR(15),
FOREIGN KEY (codi) REFERENCES usuari(codi)
) ENGINE = InnoDB;
/*1*/
CREATE USER 'anna.abad' IDENTIFIED BY 'anna';
/*2*/
SELECT PASSWORD('bernat');
CREATE USER 'bernat.bonet'@'localhost' IDENTIFIED BY PASSWORD'*AE66A16DB72C9E4EF1A742C4FC651C0FE70B88FF';
/*3*/
CREATE USER 'carla.cruz' IDENTIFIED BY 'carla';
GRANT USAGE ON permis.* TO 'david.dosta' IDENTIFIED BY 'david';
CREATE USER 'eric.esteve' IDENTIFIED BY 'eric';
/*4*/
GRANT ALL PRIVILEGES ON *.* TO 'anna.abad' WITH GRANT OPTION;
/*5*/
/*Ir a Anna*/
/*6*/

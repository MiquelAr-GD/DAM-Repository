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
durada			TIME NOT NULL,
favorita		ENUM('si','no') DEFAULT('no')
)Engine=InnoDB;
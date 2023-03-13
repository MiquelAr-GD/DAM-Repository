DROP DATABASE IF EXISTS examen_proc;
CREATE	DATABASE IF NOT EXISTS examen_proc;
USE examen_proc;

CREATE TABLE vehicles(
	matricula		VARCHAR(7)	PRIMARY KEY,
    marca 			VARCHAR(15) NOT NULL,
    model			VARCHAR(15) NOT NULL,
    num_bastidor	VARCHAR(5),
    data_fabricacio	DATE NOT NULL
)ENGINE=InnoDB;

CREATE TABLE clients(
	dni 			VARCHAR(9) PRIMARY KEY,
    nom				VARCHAR(20) NOT NULL,
    cognoms			VARCHAR(40) NOT NULL,
    telefon			VARCHAR(9) NOT NULL,
    data_naixement	DATE
)ENGINE=InnoDB;

CREATE TABLE transaccions(
	id 				INT AUTO_INCREMENT PRIMARY KEY,
    vehicle			VARCHAR(7) NOT NULL,
    client			VARCHAR(9) NOT NULL,
    tipus			ENUM('C','V') NOT NULL,
    data_transaccio	DATE NOT NULL,
    FOREIGN KEY (vehicle) REFERENCES vehicles(matricula),
    FOREIGN KEY (client) REFERENCES clients(dni)
)ENGINE=InnoDB;

INSERT INTO vehicles VALUES 
	('1234AAA', 'Renault', 'Clio', 'A1234', '2012/01/18'),
    ('2345EEE', 'Ford', 'Focus', 'B2234', '2010/06/11'),
    ('3456III', 'Seat', 'Ibiza', 'C3234', '2018/03/28');

INSERT INTO clients VALUES 
	('12345678A', 'Ana', 'Leon', '612345678', '1995/06/14'),
    ('22345678B', 'Pepe', 'Lopez', '622345678', '1980/01/12'),
    ('32345678C', 'Maria', 'Ibiza', '632345678', '2000/04/02'),
    ('42345678D', 'Juan', 'Torres', '642345678', '1997/09/30'),
    ('52345678E', 'David', 'Gonzalez', '652345678', '1991/12/18');

INSERT INTO transaccions VALUES 
	(NULL, '1234AAA', '12345678A', 'C', '2021/04/12'),
    (NULL, '2345EEE', '22345678B', 'C', '2021/04/13'),
    (NULL, '1234AAA', '32345678C', 'V', '2021/04/14'),
    (NULL, '3456III', '42345678D', 'C', '2021/04/15'),
    (NULL, '3456III', '12345678A', 'V', '2021/04/16');
    
    /* EX1------------------------------------------------------------------*/
		CREATE USER 'enric.espi'@'%' IDENTIFIED BY PASSWORD (SELECT PASSWORD('123'));
        CREATE USER 'laura.leon'@'%' IDENTIFIED BY PASSWORD (SELECT PASSWORD('321'));
        
        GRANT ALL PRIVILEGES ON professors.examen TO 'enric.espi';
        GRANT ALL PRIVILEGES ON professors.examen TO 'laura.leon' WITH GRANT OPTION;
        
        
        
		GRANT SELECT (pregunta, resposta), ALTER  
        ON professors.examen
        TO miquel, manel;
     /*------------------------------------------------------------------*/
      /*------------------------------------------------------------------*/
    
    DROP PROCEDURE exercici3b;
DELIMITER //
CREATE PROCEDURE exercici3b(IN par_DNI VARCHAR(9), IN par_nom VARCHAR(20), IN par_cognom VARCHAR(40), IN par_telefon VARCHAR(9), IN par_Data DATE, OUT par_acccio VARCHAR(50))
BEGIN
	DECLARE final INT DEFAULT 0;
	DECLARE var_dni VARCHAR(9);
    DECLARE var_telefon VARCHAR(9);
    DECLARE var_contador INT DEFAULT 10;
     DECLARE miCursor CURSOR FOR 
		SELECT dni, telefon FROM clients;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET final=1;
    
    DECLARE CONTINUE HANDLER FOR 1146 CREATE TABLE clients(
						dni 			VARCHAR(9) PRIMARY KEY,
						nom				VARCHAR(20) NOT NULL,
						cognoms			VARCHAR(40) NOT NULL,
						telefon			VARCHAR(9) NOT NULL,
						data_naixement	DATE
					)ENGINE=InnoDB;
                    
    OPEN miCursor;
    BUCLE: LOOP
		FETCH miCursor INTO var_dni, var_telefon;
        IF final=1 THEN
            LEAVE BUCLE;
        END IF;
        IF par_telefon != var_telefon THEN
			IF par_DNI = var_dni  THEN
				UPDATE clients SET nom = par_nom WHERE var_dni = par_DNI;
                UPDATE clients SET cognoms = par_cognom WHERE var_dni = par_DNI;
                UPDATE clients SET telefon = par_telefon WHERE var_dni = par_DNI;
                UPDATE clients SET data_naixament = par_Data WHERE var_dni = par_DNI;
                SET par_acccio = 'S\'ha actualitzat l\'usuari ';
                SET var_contador = var_contador - 1;
			END IF;
		ELSE
			SET par_acccio = 'El telefon ja existeix';
            SET var_contador = var_contador - 1;
		END IF;
    END LOOP;
		IF var_contador = 10 THEN
			INSERT INTO clients VALUES (par_dni, par_nom, par_cognom, par_telefon, par_Data);
			SET par_acccio = 'S\'ha insertat l\'usuari ';
        END IF;
    
    CLOSE miCursor;
END //
DELIMITER ;

CALL exercici3b('12345678A','Anna','Leones','612345678','1995/06/14',@acccio);
CALL exercici3b('62345678A','Lucia','Serventa','612345677','1995/06/14',@acccio);

SELECT @acccio;



/*--------------------------------------------------------------------------------*/
	DROP PROCEDURE exercici4b;
DELIMITER //
CREATE PROCEDURE exercici4b(IN par_data1 DATE, IN par_Data2 DATE, OUT par_acccio VARCHAR(50))
BEGIN
	DECLARE final INT DEFAULT 0;
    DECLARE var_contador INT DEFAULT 0;
    DECLARE var_matricula VARCHAR(7);
    DECLARE var_marca VARCHAR(15);
    DECLARE var_model VARCHAR(15);
    DECLARE var_num VARCHAR(5);
    DECLARE var_data DATE;
     DECLARE miCursor CURSOR FOR 
		SELECT vehicles.matricula, vehicles.marca, vehicles.model, vehicles.num_bastidor, vehicles.data_fabricacio FROM transaccions, vehicles
			WHERE transaccions.tipus = 'C'
				AND transaccions.data_transaccio BETWEEN par_data1 AND par_Data2;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET final=1;
    DECLARE CONTINUE HANDLER FOR 1146 CREATE TABLE e4b_resultat(
						matricula		VARCHAR(7)	PRIMARY KEY,
						marca 			VARCHAR(15) NOT NULL,
						model			VARCHAR(15) NOT NULL,
						num_bastidor	VARCHAR(5),
						data_fabricacio	DATE NOT NULL
					)ENGINE=InnoDB;
	DROP TABLE IF EXISTS e4b_resultat;
    OPEN miCursor;
    BUCLE: LOOP
		FETCH miCursor INTO var_matricula, var_marca, var_model, var_num, var_data;
        IF final=1 THEN
            LEAVE BUCLE;
        END IF;
		INSERT INTO e4b_resultat VALUES (var_matricula, var_marca, var_model, var_num, var_data);
        SET var_contador = var_contador + 1;
       END LOOP;
       SET var_contador = var_contador - 1;
		SET par_acccio = CONCAT(var_contador);
    CLOSE miCursor;
END //
DELIMITER ;

CALL exercici4b('2021/01/12','2021/04/14',@total);

SELECT @total;

SELECT * FROM e4b_resultat;

/*-------------------------------------*/
DROP PROCEDURE exercici2b;
DELIMITER //
CREATE PROCEDURE exercici2b(IN par_lletra enum('D','T'), IN par_usuari VARCHAR(50), IN par_taula VARCHAR(50))
BEGIN
 DECLARE EXIT HANDLER FOR 1146 (SELECT 'La taula no existeix');
	IF par_lletra LIKE 'D' THEN
		GRANT DROP, SELECT, UPDATE ON pizzeria.par_taula TO par_usuari;
    ELSE 
		GRANT ALL PRIVILEGES ON pizzeria.par_taula TO par_usuari WITH GRANT OPTION;
    END IF;
END //
DELIMITER ;

CALL exercici2b('D','usuari','taula');

SELECT @total;

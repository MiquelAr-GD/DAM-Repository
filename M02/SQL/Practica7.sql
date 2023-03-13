/*Exercici 38*/
DROP PROCEDURE dcl_38;
DELIMITER //
CREATE PROCEDURE dcl_38(IN par_data DATE,OUT par_error VARCHAR(100))
BEGIN
	DECLARE var_num INT;
    DECLARE var_participants INT;
    DECLARE var_guanyador INT;
    DECLARE EXIT HANDLER FOR 1062  SET par_error = 'El sorteig ja s\'ha realitzat.';
    SELECT  num_sorteig, participants INTO var_num, var_participants FROM sorteig WHERE data LIKE par_datai;
    IF(var_num IS NOT NULL) THEN
		SET var_guanyador = (SELECT FLOOR(RAND()*(var_participants)+1));
		INSERT INTO premis VALUES (var_num, var_guanyador, NULL);
        SET par_error = 'Sorteig realitzat correctament';
    ELSE
        SET par_error = 'No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END//
DELIMITER ;
CALL dcl_38('2020/03/03',@error);
SELECT @error;

/*---------------------------------------------------------------*/
/*Exercici 39*/
DROP PROCEDURE dcl_39;
DELIMITER //
CREATE PROCEDURE dcl_39(IN par_data DATE, IN par_premi VARCHAR(25), OUT par_error VARCHAR(50))
BEGIN
    DECLARE var_sorteig INT; 
    DECLARE var_nombre_premis INT; 
    DECLARE var_premi VARCHAR(25); 
    SELECT num_sorteig INTO var_sorteig FROM sorteig WHERE data=par_data;
	SELECT  COUNT(*), premi INTO var_nombre_premis, var_premi 
            FROM premis 
            WHERE num_sorteig=var_sorteig ;
    IF (var_nombre_premis <> 0) THEN
		IF (var_premi IS NULL) THEN
			UPDATE premis SET premi=par_premi WHERE num_sorteig=var_sorteig;
		ELSE
			SET par_error='El guanyador ja té premi assignat';
        END IF;
    ELSE
        SET par_error='No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END//
DELIMITER ;
CALL dcl_39('2021-04-12','Pernil',@error);
SELECT @error;
/*-------------------------------------------------------------------------*/
/*Exercici 40*/
DROP PROCEDURE dcl_40;
DELIMITER // 
CREATE PROCEDURE dcl_40(IN par_data DATE,OUT par_error VARCHAR(50))
BEGIN
	DECLARE var_participants INT;
    DECLARE var_num INT; 
    DECLARE var_sorteig INT; 
    DECLARE var_premiat INT;
    SELECT participants, num_sorteig INTO var_participants, var_num
		FROM sorteig 
		WHERE data LIKE par_data;
	SELECT COUNT(*),  FLOOR(var_participants*RAND()+1) INTO var_sorteig, var_premiat
		FROM premis
		WHERE num_sorteig LIKE var_num;
    IF (var_sorteig > 0) THEN
		UPDATE premis SET num_premiat = var_premiat WHERE num_sorteig = var_num;
        SET par_error := 'Sorteig realitzat novament de manera correcta';
    ELSE
		SET par_error := 'No s\'ha realitzat cap sorteig en aquesta data';
    END IF;
END// 
DELIMITER ;
CALL dcl_40('2021-04-12',@error);
/*---------------------------------------------------------------------------------*/
/*Exercici DCL_42:*/

DROP PROCEDURE dcl42;
DELIMITER // 
CREATE PROCEDURE dcl42(IN par_data1 DATE, IN par_data2 DATE, OUT par_error VARCHAR(50))
BEGIN
	DECLARE var_data DATE;
    DECLARE var_num_sorteig INT;
    DECLARE var_participants INT;
    DECLARE var_premiat INT;
    DECLARE var_contador INT DEFAULT 0;
    DECLARE var_premi VARCHAR(20);
    DECLARE final INT DEFAULT 0;
    DECLARE miCursor CURSOR FOR SELECT sorteig.data, sorteig.num_sorteig, sorteig.participants, premis.num_sorteig, premis.premi
										FROM sorteig, premis
                                        WHERE sorteig.data BETWEEN par_data1 and par_data2
											AND sorteig.num_sorteig = premis.num_sorteig;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET final=1;
    
    OPEN miCursor; 
    
	bucle: LOOP
        FETCH miCursor INTO var_data, var_num_sorteig, var_participants, var_premiat, var_premi;
        IF final=1 THEN
            LEAVE bucle;
        END IF;
        
        IF(var_data IS NOT NULL) THEN
			IF((var_num_sorteig = var_premiat) and (var_premi IS NOT NULL))THEN
				SET par_error := 'No s\'ha realitzat cap sorteig';
			ELSE
                UPDATE premis SET num_premiat = FLOOR(var_participants*RAND()+1) WHERE num_sorteig = var_num_sorteig;
                SET var_contador = var_contador + 1;
            END IF; 
        END IF;
    END LOOP;
    
		IF(var_contador <> 0)THEN
			SET par_error := concat('S\'han realitzat ',var_contador, ' sortejos');	
		ELSE
			SET par_error := 'No s\'ha realitzat cap sorteig';
        END IF;
    CLOSE miCursor; 
END// 
DELIMITER ;
CALL dcl42('2020/03/02','2020/03/06',@error);
SELECT @error;
/*------------------------------------------------------------------------------------------------------------------------------*/
/*Exercici DCL_43:

Crea un procediment anomenat dcl43 que donades dues dates i un premi, 
assigni el premi a tots els sortejos, entre les dues dates, si ja tenen un guanyador. 
En cas de no existir cap sorteig viable heu de retornar el error 'No hi ha cap sorteig amb guanyadors', 
en cas contrari heu de retronar el següent missatge 'S'han assignat X premis' on X és el nombre de premis assignats. 
Heu d'utilitzar cursors èxplicits en aquest procediment.

Exemple d'execució: */

DROP PROCEDURE dcl43;
DELIMITER // 
CREATE PROCEDURE dcl43(IN par_data1 DATE, IN par_data2 DATE, IN par_premi VARCHAR(20), OUT par_error VARCHAR(50))
BEGIN
	DECLARE var_data DATE;
    DECLARE var_num_sorteig INT;
    DECLARE var_participants INT;
    DECLARE var_premiat INT;
    DECLARE var_contador INT DEFAULT 0;
    DECLARE var_premia VARCHAR(50);
    DECLARE final INT DEFAULT 0;
    DECLARE miCursor CURSOR FOR SELECT sorteig.data, sorteig.num_sorteig, sorteig.participants, premis.num_sorteig, premis.num_premiat
										FROM sorteig, premis
                                        WHERE sorteig.data BETWEEN par_data1 and par_data2
											AND sorteig.num_sorteig = premis.num_sorteig;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET final=1;
    
    OPEN miCursor; 
    
	bucle: LOOP
        FETCH miCursor INTO var_data, var_num_sorteig, var_participants, var_premiat, var_premia;
        IF final=1 THEN
            LEAVE bucle;
        END IF;
        
        IF(var_data IS NOT NULL) THEN
			IF((var_num_sorteig = var_premiat) and (var_premia IS NOT NULL))THEN
				SET par_error := 'No hi ha cap sorteig amb guanyadors';
			ELSE
                UPDATE premis SET premi = par_premi WHERE num_sorteig = var_num_sorteig;
                SET var_contador = var_contador + 1;
            END IF; 
        END IF;
    END LOOP;
    
		IF(var_contador <> 0)THEN
			SET par_error := concat('S\'han realitzat ',var_contador, ' sortejos');	
		ELSE
			SET par_error := 'No s\'ha realitzat cap sorteig';
        END IF;
    CLOSE miCursor; 
END// 
DELIMITER ;
CALL dcl43('2021/04/10','2021/04/20','pernil',@error);
SELECT @error;
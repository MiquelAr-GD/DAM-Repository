/*Volem crear una base de dades anomenada agenda que gestionarà una agenda. La taula diari tindrà la següent estructura:

- El camp codi del tipus INT, que serà autonumèric i la clau.

- El camp data del tipus DATE.

- El camp hora del tipus HORA.

- El camp event del tipus VARCHAR(40).

Crea la base de dades agenda.

Exercici DCL_25:

Crea un procediment anomenat taula faci el següent:

- Si passem el paràmetre 'T', crei l'estructura de la taula diari.

- Si passem el paràmetre 'E', elimini la taula diari si existeix.

Exemple d'execució: CALL taula('T');

Exercici DCL_26:

Crea un procediment anomenat inser que faci insercions a la taula anterior.

Exemple d'execució: CALL inser('2011/05/25','12:00','Reunió de direcció');
Exercici DCL_27:

Crea un procediment anomenat elim que elimini tots els registres entre dues dates. Si deixem la primera data en blanc esborrarà tots els registres anteriors a la segona data, i si deixem la segona data en blanc esborrarà tots els registres posteriors a la primera data. Sempre les dates que indiquem estan incloses.

Exemple d'execució: CALL elim(NULL,'2011/04/25');*/

DROP PROCEDURE IF EXISTS elim;
DELIMITER //
CREATE PROCEDURE elim(IN par_data_ini DATE, IN par_data_fi DATE)
BEGIN
	IF (par_data_ini IS NOT NULL AND par_data_fi IS NOT NULL) THEN
		DELETE FROM diari WHERE diari.data_cita BETWEEN par_data_ini AND par_data_fi;
    ELSEIF(par_data_ini IS NOT NULL) THEN
		DELETE FROM diari WHERE diari.data_cita >= par_data_ini ;
    ELSEIF(par_data_fi IS NOT NULL) THEN
		DELETE FROM diari WHERE diari.data_cita <= par_data_fi;
    ELSE
		SELECT 'Introdueix un parametre';
    END IF;
END //
DELIMITER ;
CALL elim('2011/04/25','2015/04/25');
CALL elim('2011/04/25', NULL);
CALL elim(NULL,'2015/04/25');
CALL elim(NULL, NULL);
/*Exercici DCL_28:

Crea un procediment anomenat posposar que, donada una data, endarrereixi l'esdeveniment un mes.

Exemple d'execució: CALL postposar('2011/05/25');*/

DROP PROCEDURE IF EXISTS postposar;
DELIMITER //
CREATE PROCEDURE postposar(IN par_data_ini DATE)
BEGIN
	UPDATE diari SET diari.data_cita = DATE_ADD(par_data_ini, INTERVAL 1 MONTH) WHERE diari.data_cita = par_data_ini;
END //
DELIMITER ;
CALL postposar('2011/05/25');
/*Exercici DCL_29:

Crea un procediment anomenat dietari que donada una data i una opció ens apareguin tots els esdeveniment de:

- si l'opció és A els esdeveniments del mateix dia de la data.

- si l'opció és B els esdeveniments de la setmana a que pertany la data.

- si l'opció és C els esdeveniments del mes a que pertany la data.

Exemple d'execució: CALL dietari('2011/05/25','A');*/



/*Exercici DCL_30:

Crea un procediment anomenat inser_rep que faci insercions a la taula diari, de manera que inserirà un esdeveniment repetit cada cert temps. 
Els paràmetres que li donarem seran els següents:

Data d'inici de les insercions

Data final de les insercions

Hora de l'esdeveniment

Esdeveniment

Freqüència: D (diària), S (setmanal) i M (mensual)

Exemple d'execució:

Si volem inserir un esdeveniment que es repetirà mensualment farem:

CALL inser_rep('2011/05/25','2012/05/25','12:00','Reunió de direcció','M');*/

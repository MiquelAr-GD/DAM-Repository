/*Exercici A*/
SELECT producte.nom, conte.quantitat, comanda.numero
FROM comanda JOIN conte ON comanda.numero = conte.comanda
	JOIN producte ON producte.codi = conte.producte
    JOIN beguda ON beguda.codi = producte.codi
WHERE comanda.domicili_local = 'D'
    AND conte.quantitat > 2
    AND TIME(comanda.data_hora) > '21:00'
GROUP BY comanda.numero
ORDER BY conte.quantitat DESC, comanda.numero DESC;


/*Exercici B*/
SELECT empleat.cognoms, empleat.nom ,COUNT(client.nom) TotalClients
FROM pizza JOIN producte ON  producte.codi = pizza.codi 
    JOIN conte ON conte.producte = producte.codi
    JOIN comanda ON comanda.numero = conte.comanda
    JOIN client ON client.telefon = comanda.telefon_client
    JOIN empleat ON empleat.codi = comanda.empleat
WHERE empleat.nom BETWEEN 'J%' AND 'M%' 
    AND DAYOFWEEK(comanda.data_hora) = 2
    AND (client.poblacio LIKE "Terrassasa" OR client.poblacio LIKE "Matadepera")
GROUP BY empleat.codi
ORDER BY empleat.cognoms, empleat.nom;
    
/*Exercici C*/
SELECT CONCAT(COUNT(comanda.telefon_client), " clients atesos a ", comanda.domicili_local," ", DATE(comanda.data_hora) ) "Exercici C"
FROM beguda JOIN producte ON beguda.codi = producte.codi
	JOIN conte ON conte.producte = producte.codi
    JOIN comanda ON comanda.numero = conte.comanda
    JOIN client ON client.telefon = comanda.telefon_client
WHERE beguda.beguda_alcoholica = 'N'
GROUP BY DAY(comanda.data_hora), comanda.domicili_local
ORDER BY COUNT(comanda.telefon_client) ;


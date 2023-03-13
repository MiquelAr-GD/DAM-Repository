SELECT client.nom NOM_CLIENT, ingredient.nom NOM_INGREDIENT, conte.quantitat VEGADES_DEMANAT
FROM client JOIN comanda ON client.telefon = comanda.telefon_client
	JOIN conte ON comanda.numero = conte.comanda
	JOIN producte ON  conte.producte = producte.codi
	JOIN pizza ON producte.codi = pizza.codi 
    JOIN forma ON pizza.codi = forma.pizza
    JOIN ingredient ON forma.ingredient = ingredient.codi
WHERE conte.quantitat BETWEEN 2 AND 5
    AND client.nom IN (SELECT client.nom 
						FROM client
						WHERE LEFT(client.nom, 1) != 'A'
							AND LEFT(client.nom, 1) != 'E'
							AND LEFT(client.nom, 1) != 'I'
							AND LEFT(client.nom, 1) != 'O'
							AND LEFT(client.nom, 1) != 'U')
	GROUP BY ingredient.codi
    ORDER BY client.nom, ingredient.nom;
    
    
SELECT empleat.cognoms, empleat.nom, COUNT(DISTINCT producte.nom) Pizzes_diferents_venudes
FROM empleat, comanda, conte, producte, pizza, client
WHERE empleat.codi = comanda.empleat
	AND comanda.numero = conte.comanda
	AND conte.producte = producte.codi
    AND producte.codi = pizza.codi
    AND client.telefon = comanda.telefon_client
    AND empleat.codi IN (SELECT DISTINCT empleat.codi
							FROM empleat, comanda, conte, producte, postre
							WHERE empleat.codi = comanda.empleat
								AND comanda.numero = conte.comanda
								AND conte.producte = producte.codi
								AND producte.codi = postre.codi
								AND producte.nom LIKE "%Gelat%")
	AND LAST_DAY(comanda.data_hora) != 29
    AND client.nom IN (SELECT client.nom 
						FROM client
						WHERE RIGHT(client.nom, 1) = 'A'
							OR RIGHT(client.nom, 1) = 'E'
							OR RIGHT(client.nom, 1) = 'I'
							OR RIGHT(client.nom, 1) = 'O'
							OR RIGHT(client.nom, 1) = 'U')
	GROUP BY empleat.nom
    HAVING Pizzes_diferents_venudes > 3
    ORDER BY  Pizzes_diferents_venudes DESC, empleat.cognoms ASC, empleat.nom ASC;
    
    
    SELECT UPPER(client.nom) NomClient
    FROM client, comanda, empleat
    WHERE client.telefon = comanda.telefon_client
		AND comanda.empleat = empleat.codi
        AND empleat.codi NOT IN (SELECT empleat.codi
							FROM client, comanda, empleat
							WHERE client.telefon = comanda.telefon_client
							AND comanda.empleat = empleat.codi
                            AND client.poblacio = "Matadepera")
	ORDER BY client.nom;

                            
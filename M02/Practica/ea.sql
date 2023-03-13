/*b) Mostra l'import total de cadascuna de les comandes.*/

SELECT  comanda.numero NumCom, SUM(producte.preu)
FROM comanda, conte, producte
WHERE comanda.numero = conte.comanda AND conte.producte = producte.codi
GROUP BY comanda.numero 
ORDER BY NumCom;
/*b) Mostra quants ingredients té cada pizza.*/

SELECT producte.nom NomPizza, COUNT(forma.ingredient)
FROM producte, pizza, forma
WHERE producte.codi = pizza.codi AND pizza.codi = forma.pizza
GROUP BY NomPizza
ORDER BY NomPizza;

/*Mostra quantes pizzes barbacoa que ha demanat cada client.*/

SELECT client.nom NomClient, COUNT(*) Barbacoes_Demanades
FROM comanda, conte, producte, client
WHERE comanda.numero = conte.comanda AND conte.producte = producte.codi AND client.telefon = comanda.telefon_client AND producte.nom LIKE "%barbacoa%"
GROUP BY client.nom
ORDER BY NomClient;

/*Mostra quants productes hi ha a cada comanda.*/

SELECT comanda.numero Comandes, SUM(conte.quantitat) Productes
FROM comanda, conte, producte
WHERE comanda.numero = conte.comanda AND conte.producte = producte.codi
GROUP BY Comandes
ORDER BY Comandes;

/*a) Dels clients que han demanat la pizza al local, mostra quants productes diferents han demanat.*/
SELECT COUNT(DISTINCT conte.producte) 
FROM comanda, conte
WHERE comanda.numero = conte.comanda 
    AND comanda.telefon_client IN (SELECT DISTINCT comanda.telefon_client
										FROM comanda, conte, producte, pizza
										WHERE comanda.numero = conte.comanda AND conte.producte = producte.codi AND producte.codi = pizza.codi AND comanda.domicili_local = "L");

/*b) Dels clients que han demanat la pizza al local, mostra quants productes diferents ha demanat cada client.*/

SELECT client.nom NomClient, COUNT(DISTINCT producte.codi) ProductesDiferents
FROM comanda, conte, producte, client
WHERE comanda.numero = conte.comanda AND conte.producte = producte.codi AND client.telefon = comanda.telefon_client 
																			AND comanda.telefon_client IN (SELECT DISTINCT comanda.telefon_client
																			FROM comanda, conte, producte, pizza
																			WHERE comanda.numero = conte.comanda AND conte.producte = producte.codi AND producte.codi = pizza.codi AND comanda.domicili_local = "D")
GROUP BY client.nom
ORDER BY client.nom;

/*Mostra l'import que hem facturat de cada beguda.*/
SELECT conte.comanda, producte.nom, SUM(producte.preu * conte.quantitat) 
FROM beguda, producte, conte
WHERE producte.codi = beguda.codi AND producte.codi = conte.producte
GROUP BY conte.comanda, beguda.codi 
ORDER BY conte.comanda, producte.nom;

/*Mostra els clients que han facturat més de 50€.*/
SELECT client.nom, SUM(producte.preu * conte.quantitat) Facturació
FROM producte, conte, comanda, client
WHERE producte.codi = conte.producte AND conte.comanda = comanda.numero AND comanda.telefon_client = client.telefon
GROUP BY client.telefon
HAVING Facturació > 50
ORDER BY Facturació DESC;

SELECT ingredient.nom Nombre, COUNT(*) UsoTotal
FROM ingredient, forma
WHERE ingredient.codi = forma.ingredient
GROUP BY ingredient.codi
ORDER BY ingredient.nom;

SELECT  ingredient.nom Nombre, SUM(conte.quantitat) UsoTotal
FROM ingredient, forma, conte, producte, pizza
WHERE ingredient.codi = forma.ingredient AND forma.pizza = pizza.codi AND pizza.codi = producte.codi AND producte.codi = conte.producte
GROUP BY ingredient.codi
ORDER BY ingredient.nom;

SELECT client.nom, COUNT(*) Comandes, 'Comandes' AS Que
FROM client, comanda
WHERE client.telefon = comanda.telefon_client
GROUP BY client.telefon
UNION
SELECT client.nom, SUM(conte.quantitat), 'Pizzas'
FROM client, comanda, conte, producte, pizza
WHERE client.telefon = comanda.telefon_client
		AND comanda.numero = conte.comanda
        AND conte.producte = producte.codi
        AND producte.codi = pizza.codi
GROUP BY client.telefon;
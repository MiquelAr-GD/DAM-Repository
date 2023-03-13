<?php

echo "<h3>ESTRUCTURA FOR</h3>"; //Títol secció

/*L'estructura for està formada per tres arguments: inicialització d'una 
 *variable, condició que s'ha de complir per a que es realitzin les accions
 *de dins l'estructura for i sumatori o decrement de la variable inicialitzada
 *per poder executar les accions de dins de l'estructura for.
 *Dels arguments només és obligatori el segon però si no utilitzem un dels 
 *altres dos han de estar presents en l'script com fem amb el while. */

//Inicialitzem la variable (argument 1: $comptador=1)

for ($comptador=1; $comptador<=10; $comptador++) { //Mentres es compleixi la condició (argument 2: $comptador<=12)
	echo $comptador." per 2 es ".($comptador * 2)."<br/>";
	//augmentem la variable en 1 (argument 3: $comptador++)
} 

//sortim de l'estructura for quan la condició ja no es compleix i ..

echo "<p>Final de l'script amb comptador = $comptador.</p>"; //... es realitza aquestà acció

?>

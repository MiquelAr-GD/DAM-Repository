<?php

echo "<h3>ESTRUCTURA IF ELSE IF</h3>"; //Títol secció

//Declaració variables
$estat = "feliç";

//Estructura if else if
if ($estat == "trist") { //Si es compleix la condició aleshores...

	echo "El meu estat d'ànim no és bo, estic $estat.<br/>"; //... es realitza aquestà acció

} elseif($estat == "feliç") { //Si es compleix la condició aleshores...
	
	echo "El meu estat d'ànim és bo, estic $estat.<br/>"; //... es realitza aquestà acció
	
} else { //Si no es compleix cap de les condicions anteriors aleshores...

	echo "No estic ni trist ni feliç.<br/>"; //... es realitza aquestà acció
}

//quan sortim de l'estructura if else if

echo "Final de l'script.<br/>"; //... es realitza aquestà acció
?>

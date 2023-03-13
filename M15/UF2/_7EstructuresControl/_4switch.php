<?php

echo "<h3>ESTRUCTURA SWITCH 1</h3>"; //Títol secció

//Declaració variables
$estat = "trist";

//Estructura switch

switch ($estat) { //varaible a avaluar
	case "trist": //Si el valor d'estat és trist....

		echo "El meu estat d'ànim no és bo, estic $estat.<br/>"; //... es realitza aquestà acció
	
		break; //sortim de l'estructura switch
		
	case "feliç": //Si el valor d'estat és feliç....

		echo "El meu estat d'ànim és bo, estic $estat.<br/>"; //... es realitza aquestà acció
	
		break; //sortim de l'estructura switch

	default: //Si el valor d'estat no és cap dels anteriors...

		echo "No estic ni trist ni feliç.<br/>"; //... es realitza aquestà acció
	
		break; //sortim de l'estructura switch
}

//quan sortim de l'estructura switch

echo "Final de l'script.<br/>"; //... es realitza aquestà acció

?>

<?php

echo "<h3>ESTRUCTURA SWITCH 2</h3>"; //Títol secció

/*Comprovarem si un nombre entre 1 i 8 és parell o imparell.*/

$nombre = 1; //Nombre a avaluar

switch ($nombre) { 

	 //Nombres imparells
	case 1:
	case 3:
	case 5:
	case 7:
	case 9:

		echo "$nombre és imparell.<br/>";
	
		break;
	
	//Nombres parells
	case 2:
	case 4:
	case 6:
	case 8: 

		echo "$nombre és parell.<br/>";
	
		break;
	
	//No és un nombre o bé és un nombre mès petit que 1 o bé és un nombre més gran que 8
	default: 

		echo "No és un nombre entre 1 i 8.<br/>";
	
		break;
}

?>

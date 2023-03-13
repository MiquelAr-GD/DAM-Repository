<?php

echo "<h3>INCRUSTACIÓ DE CODI HTML 1</h3>"; //Títol secció

//Sistema per mostrar preus d'un producte en una pantalla si aquesta està activa

$pantallaPreus = true; //pantalla activa.

if ($pantallaPreus) { //Si pantalla activa....

	//Dibuixem taula html per mostrar el preu d'un producte
	echo "<table border=\"1\">\n"; //Obrim taula
	echo "<tr><td colspan=\"3\">"; //Obrim fila i cel.la
	echo "Pomes";//Contingut cel.la
	echo "</td></tr>";//tanquem fila i cel.la
	//Obrim i tanquem fila i cel.les amb contingut
	echo "<tr><td>£14.00</td><td>\$69.00</td><td>€71.00</td></tr>\n";
	echo "</table>";//tanquem taula
}
?>

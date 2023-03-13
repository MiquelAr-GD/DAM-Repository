<?php

echo "<h3>INCRUSTACIÓ DE CODI HTML 2</h3>"; //Títol secció

//Sistema per mostrar preus d'un producte en una pantalla si aquesta està activa

$pantallaPreus = true; //pantalla activa.

if ($pantallaPreus) { //Si pantalla activa....
?>
	<!--Dibuixem taula html per mostrar el preu d'un producte-->
	<table border=\"1\">
		<tr>
			<td colspan="3">Pomes</td>
		</tr>
		<tr>
			<td>£14.00</td>
			<td>$69.00</td>
			<td>€71.00</td>
		</tr>
	</table>
	
<?php
//Tanquem condició
}
?>

<?php

echo "<h3>ESTRUCTURES ITERATIVES ANIUADES</h3>"; //Títol secció

//Creació d'una taula HTML de 12 x 12 de manera dinàmica

echo "<table style=\"border: 1px solid #000;\">"; //Obrim taul amb estil

//Construim les files
for ($fila=1; $fila<=12; $fila++) { 
	
	echo "<tr>"; //Obrim fila
	
	//Construim les cel.les de la fil.la oberta
	for ($cella=1; $cella<=12; $cella++) {
		
		//Obrim cel.la amb estil
		echo "<td style=\"border: 1px solid #000; width: 25px; text-align:center;\">";
		
		//Mostrem contingut de la cel.la
		echo ($fila * $cella);
		
		//Tanquem cel.la
		echo "</td>";
		
	}
	
	echo "</tr>"; //Tanquem fila
}

echo "</table>"; //Tanquem taula

?>

<?php

echo "<h3>ESTRUCTURA DO...WHILE</h3>"; //Títol secció

//Declaració variables
$nombre = 1;

//Estructura do...while

do{ //realitzem...

	echo "El nombre és: ".$nombre."<br/>"; //... aquestà acció...
	
	$nombre++;//...augmentem en 1 el comptador...
	
}while (($nombre > 200) && ($nombre < 400)); //...mentres és compleixi aquesta condició

/*En aquest cas sempre es realitzaran les accions de dins de l'estructura
 *com a mínim un cop (la primera) ja que la condició s'avalua un cop executades
 *les accions de dins l'estructura*/

//sortim de l'estructura while quan la condició ja no es compleix i ..

echo "<p>Final de l'script amb nombre = $nombre.</p>"; //... es realitza aquestà acció

?>

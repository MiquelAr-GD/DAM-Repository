<?php

echo "<h3>ESTRUCTURA CONTINUE</h3>"; //Títol secció

//Script que divideix 4000 deu cops

$comptador = -4; //inicialitzem comptador

for (; $comptador <= 10; $comptador++) {
	
	if ($comptador == 0) { //Si el divisor és 0...
		continue; //Ignorem aquest valor i continuem amb el següent valor
		
	} else { //Si el divisor no és 0...
	
		//Fem la divisió
		$resultat = 4000/$comptador;
		//Mostrem resultat
		echo  "4000 dividit per ".$comptador." is... $resultat<br/>";
		
	}
}

//Un cop fora de l'estructura fem

echo "<p>Final de l'script amb comptador = $comptador</p>"; //realitzem l'acció

?>

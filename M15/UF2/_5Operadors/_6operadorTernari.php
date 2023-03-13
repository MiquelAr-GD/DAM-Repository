<html>
<head>
	<title>Operador ternari</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php

		/* Operador ternari: si és compleix la condició (($estat == "trist") ?)
		* l'opció vàlida serà la primera ("Estic $estat."), sinó la segona 
		* ("Em sento bé!!!.")*/

		//Declaració variable
		$estat = "trist";

		//Realitzem l'operació. El resultat s'assigna a la variable $operacio.
		$operacio = ($estat == "trist") ?  "Estic $estat." : "Em sento bé!!!.";

		//Mostrem resultat
		echo $operacio;
	?>
</body>

</html>

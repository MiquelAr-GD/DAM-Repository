<html>
<head>
	<title>Variables en PHP</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php	
		/*Els tipus de dades més significatives en PHP són: enter, float, 
		 *booleà, string, matriu, objecte, recurs i null*/
		 
		/*La funció is_tipusDada(dada) comprova si la dada és del tipusDada
		 *indicat en la funció is. Si ho és retorna 1, sinò 0.*/
		 
		 //número enter
		 $valor=3;
		 $resultat=is_integer($valor); //És 1
		 echo "$valor és un enter? $resultat";
		
		//número float. La separació de la part decimal és mitjançant un punt
		 $valor=1.13;
		 $resultat=is_float($valor); //És 1
		 echo "<br>$valor és un float? $resultat";
		 
		 $valor=1.234e4; //12340
		 $resultat=is_float($valor); //És 1
		 echo "<br>$valor és un float? $resultat";
		 
		 $valor=4e-2; //0.04
		 $resultat=is_float($valor); //És 1
		 echo "<br>$valor és un float? $resultat";
	
		//valor boleà. Pot ser false (fals) o true (verdader)
		 $valor=false;
		 $resultat=is_bool($valor); //És 1
		 echo "<br>$valor és un booleà? $resultat";
		
		//Cadena de caràcters. 
		 $valor="cadena de caràcters";
		 $resultat=is_string($valor); //És 1
		 echo "<br>\"$valor\" és una cadena de caràcters? $resultat";
		 
		 $valor='cadena de caràcters';
		 $resultat=is_string($valor); //És 1
		 echo "<br>'$valor' és una cadena de caràcters? $resultat";
		 
		//Null. Valor null
		 $valor=null;
		 $resultat=is_null($valor); //És 1
		 echo "<br>$valor és null? $resultat";
		 
		/*Recurs. Recurs extern al document com pot ser un fitxer o una
		 *connexió a una base de dades. Ja ho veurem.*/
		 
		/*Objecte. Objecte php. Ja ho veurem*/
		
		/*La funció gettype($variable) ens retorna de quin tipus és la 
		 *variable passada com a parametre*/
		 
		 //número enter
		 $valor=3;
		 $resultat=gettype($valor);
		 echo "<br>$valor és un $resultat";
		
		//número float. La separació de la part decimal és mitjançant un punt
		 $valor=1.13;
		 $resultat=gettype($valor);
		 echo "<br>$valor és un $resultat";
		 
		 $valor=1.234e4; //12340
		 $resultat=gettype($valor);
		 echo "<br>$valor és un $resultat";
		 
		 $valor=4e-2; //0.04
		 $resultat=gettype($valor);
		 echo "<br>$valor és un $resultat";
	
		//valor boleà. Pot ser false (fals) o true (verdader)
		 $valor=false;
		 $resultat=gettype($valor);
		 echo "<br>$valor és un $resultat";
		
		//Cadena de caràcters. 
		 $valor="cadena de caràcters";
		 $resultat=gettype($valor);
		 echo "<br>$valor és un $resultat";
		 
		//Null. Valor null
		 $valor=null;
		 $resultat=gettype($valor);
		 echo "<br>$valor és un $resultat";
	?>	
	
</body>

</html>

<?php	
	/*substr_replace("cadena", "substitut", inici, [longitud]). 
	 *Substitueix una subcadena de "cadena" delimitada pels paràmetres inici
	 *i opcionalmente longitud amb la cadena "substitut".
	 *El paràmetre inici és un nombre enter. Si és positiu, el remplaçament 
	 *s'iniciarà en la posició de la cadena que coincideixi amb aquest número.
	 *Si és negatiu, el remplaçament s'iniciarà en la posició de la cadena 
	 *que coincideixi amb aquest número començant pel final de la cadena.
	 *Si no indiquem longitud es realitzarà la substitució fins arribar al
	 *final de la cadena, si s'indica longitud i és positiva es realitzarà
	 *la substitució tantes posicions com indiqui longitud. Si és negatiu
	 *la substitució es realitzarà durant tota la cadena menys en la 
	 *quantitat de caràcters finals de la cadena que coincideixi amb longitud.*/
	 
	 $cadena = "Sóc una cadena";
	 $substitut = "frase";
	 $resultat = substr_replace($cadena, $substitut, 9);
	 echo "<p>$resultat.<br/>"; //Sóc una frase.
	 $resultat = substr_replace($cadena, $substitut, 9, 5); 
	 echo "$resultat.<br/>"; //Sóc una frasea
	 $resultat = substr_replace($cadena, $substitut, 9, -3);
	 echo "$resultat.<br/>"; //Sóc una fraseena.
	 $resultat = substr_replace($cadena, $substitut, -9);
	 echo "$resultat.<br/>"; //Sóc ufrase.
	 $resultat = substr_replace($cadena, $substitut, -9, -3);
	 echo "$resultat.<br/>"; //Sóc ufraseena.
	 
	 /*str_replace("agulla", "substitut", "paller", [nombre substitucions]).
	  *Retorna el paller (cadena) amb les agulles (ocurrències d'una mateixa subcadena)
	  *remplaçades per "substitut".*/
	  
	  $agulla = "a";
	  $substitut = "i";
	  $resultat = str_replace($agulla,$substitut,$cadena);
	  echo "$resultat.<br/>";  //Sóc uni cideni.
	  
	  /*strtoupper("cadena"). Converteix les minúscules de la cadena en majúscules.*/
	  
	  $resultat = strtoupper($cadena);
	  echo "$resultat.<br/>";  //SóC UNA CADENA.
	  
	  /*strtolower("cadena"). Converteix les majúscules de la cadena en minúscules.*/
	  
	  $resultat = strtolower($cadena);
	  echo "$resultat.<br/>";  //sóc una cadena.
	     
      echo"<p/>";
?>	

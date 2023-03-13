<?php	
	/*Podem accedir als caràcters d'una cadena mitjançant un index. 
	 *Primer caràcter correspondrà a l'index 0. Els index augmentaran 
	 *de manera consecutiva d'esquerra a dreta fins arribar a l'últim 
	 *caràcter.*/
		
	 $frase = "Sóc una frase";
	 echo "<p>El primer caràcter és $frase[0]<br/>"; //Mostrarà el cràcter "S"
	 echo "El cinqué caràcter és $frase[5]<br/>"; //Mostrarà el cràcter "u"
	
	/*La funció strlen("cadena") ens retorna la longitud d'una cadena, 
	 *és a dir, la quantitat de caràcters que té la cadena tenint en 
	 *compte que també contabilitza el final de línia com un caràcter
	 *i què els caràcters amb tílde (accents, ñ, etc.., els compte com a dos.*/
	 
	 $longitud = strlen($frase); //Longitud $frase
	 echo "La longitud de la frase és $longitud<br/>";
	 $ultimCaracter = $frase[$longitud-1]; //Mostrarà el caràcter "e"
	 echo "L'últim caràcter és $ultimCaracter<br/>";
?>	

<?php	
	/*trim("cadena", [llista de caràcter a eliminar]). Retorna la cadena 
	 *sense els espais en blanc de l'inici i final de la cadena.
	 *Per defecte eliminra tots els caràcters que inserten un espai en
	 *en blanc de la cadena:
	 *" " (ASCII 32), espai simple.
	 *"\t" (ASCII 9), tabulació.
	 *"\n" (ASCII 10), salt de línia.
	 *"\r" (ASCII 13), retorn de carro.
	 *"\0" (ASCII 0 ), NUL.
	 *"\x0B" (ASCII 11), tabulació vertical.
	 *Si no es volen eliminar tots, s'especificarà mitjançant el segon
	 *paràmetre aquells que es volen eliminar.*/
	 
	 $cadena = " Sóc una cadena ";
	 $cadenaNeta = trim($cadena);
	 echo "<p>$cadenaNeta.<br/>";
	 
	 /*ltrim("cadena", [llista de caràcter a eliminar]). Retorna la cadena 
	  *sense els caràcters en blanc de l'inici. Si no es volen eliminar 
	  *tots els tipus de caràcters d'espai en blanc, s'especificarà 
	  *mitjançant el segon paràmetre aquells que es volen eliminar.*/
	  
	 $cadena = " Sóc una cadena ";
	 $cadenaNeta = ltrim($cadena);
	 echo "$cadenaNeta.<br/>";
     
     /*strip_tags("cadena", [llista d'etiquetes a eliminar]). Retorna la cadena 
	  *sense les etiquetes html. Si no es volen eliminar totes les etiquetes
	  *HTML, s'especificarà mitjançant el segon paràmetre aquelles que no
	  *es volen eliminar.*/
	  
	 $cadena = "<p><b>Sóc una cadena</b></p>";
	 $cadenaNeta = strip_tags($cadena,"<b></b>");
	 echo "$cadenaNeta.<br/>";     
     echo"<p/>";
?>	

<?php	
	/*strstr("cadena", "subcadena"). Retorna la subcadena cercada si la 
	 *troba, sinó retorna fals. És case sensitive.*/
	 
	 $cadena = "Sóc una cadena";
	 $subCadena = strstr($cadena, "una cadena");
	 if($subCadena){ //Subcadena trobada
	    echo "<p>\"$subCadena\" trobada.<br/>";
	 }else{ //Subcadena no trobada
	    echo "<p>El resultat és $subCadena.<br/>";
	 }
	 
	 /*strpos("cadena", "subcadena", [index por on començar la cerca]). 
	  *Retorna la posició del primer caràcter de la subcadena cercada. 
	  *Si no troba la subcadena retorna fals. És case sensitive.*/
	 
	  $posicio = strpos($cadena, "una cadena");
	  if($posicio){ //Subcadena trobada
	     echo "El primer caràcter de \"$subCadena\" ocupa la posició $posicio.<br/>";
	  }else{ //Subcadena no trobada
	     echo "No s'ha trobat la subcadena.<br/>";
	  }
	 
	  //Cerquem la subcadena a partir de la posició 6
	  $posicio = strpos($cadena, "una cadena", 6);
	  if($posicio){ //Subcadena trobada
	     echo "El primer caràcter de \"$subCadena\" ocupa la posició $posicio.<br/>";
	  }else{ //Subcadena no trobada
	     echo "No s'ha trobat la subcadena.<br/>";
	  }
	 
	 /*substr("cadena", index per on començar la cerca, [nombre de caràcters a mostrar]).
	  *Retorna la cadena de caràcters que es troba desde la posició passada 
	  *com a paràmetre fins el final de la cadena o bé tants caràcters com
	  *el número passat com a paràmetre.
	  *Si el paràmetre de posició és negatiu ens mostrar la subcadena formada
	  *per tants caràcters com el paràmetre però del final de la cadena.
	  *Si passem el nombre de caràcters a mostrar en negatiu, ens mostrarà
	  *la subcadena desde el paràmetre posició fins al final de la cadena 
	  *menys la quantitat de caràcters equivalent al tercerparàmetre.
	  *Si no troba la posició retorna fals.*/
	 
	  echo substr($cadena,3)."<br/>"; //Retornarà "c una cadena"
	  echo substr($cadena,3,4)."<br/>"; //Retornarà "c un"
	  echo substr($cadena,-3)."<br/>"; //Retornarà "ena"
	  echo substr($cadena,3,-2)."<br/>"; //Retornarà "c una cade"
	  echo substr($cadena,-3,-2)."<br/>"; //Retornarà "e"
	
	 /*strtok("cadena", "delimitador o delimitadors"). 
	  *Retorna la subcadena fins que troba un dels delimitadors passats com
	  *a paràmetres. Si no troba el delimitador passat com a paràmetre 
	  *retorna fals. Només és necessari passar-li la cadena en la primera
	  *crida al mètode, ja que realitza un seguiment de la cadena a partir
	  *del lloc en que es troba en la cadena actual.*/
	  $delimitador=" ";
	  $resultat = strtok($cadena, $delimitador);
	  echo $resultat."<br/>"; //Retorna Sóc
	  
	  //Mostrem totes les subcadenes sense els espais en blanc
	  $resultat = strtok($cadena, $delimitador);
	  while (is_string($resultat)) { //Mentres quedi cadena
	     if ($resultat) { //Trobem delimitador
		    echo $resultat."<br/>"; //Mostrem resultat
	     }
	     $resultat = strtok($delimitador); //Llegim següent subcadena
      }
      echo"<p/>";
?>	

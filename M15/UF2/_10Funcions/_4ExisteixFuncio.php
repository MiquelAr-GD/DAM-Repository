<?php

    /*Comprovar si una funció existeix.*/
    
    //Funció que ens permet crear un element html i afegir-li alguna 
    //propietat al seu contingut mitjançant una funció passada com a paràmetre.
    
    function crearElementHTML($etiqueta, $contingut, $func = ""){
		if ((function_exists($func))) { //Existeix funció
		
			$contingut = $func($contingut); //Passem $contingut com a paràmetre de la funció passada com a paràmetre.
			return "<".$etiqueta.">".$contingut."</".$etiqueta."><br/>"; //Creem element
			
		}else{ //sinó....
			return "<strong>".$contingut."</strong><br/>";
		}
	}

	//Funció que subralla un text
	function subrallat($text){
		return "<span style=\"text-decoration: underline;\">".$text."</span>";
	}

	//No hi ha funció, per tant <strong>"text en paràgraf"</strong><br/>
	echo crearElementHTML("p", "text en paràgraf"); 
	
	//<p><span style=\"text-decoration: underline;\">text en paràgraf</span></p>
	echo crearElementHTML("p", "text en paràgraf", "subrallat"); 
	
	//No existeix la funció pepito, per tant <strong>"text en paràgraf"</strong><br/>
	echo crearElementHTML("p", "text en paràgraf", "pepito"); 

?>

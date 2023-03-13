<?php

    /*Pas de més d'un paràmetre.*/
    
    //Funció que ens permet canviar la grandaria de la font d'un text passat
    //com a paràmetre.
    function grandariaFont($text, $grandaria){ //Dos paràmetres: text i grandària font
    	echo "<span style=\"font-size:$grandaria\">".$text."</span>";
	}
	grandariaFont("Capçalera<br/>","24pt");
	grandariaFont("Text normal<br/>","16pt");
	grandariaFont("Text petit<br/>","12pt");
	grandariaFont("Text molt petit<br/>","10pt");
	
	echo "<hr/>";
	
	/*Pas de paràmetres opcionals.*/
    
    //Funció que ens permet canviar la grandaria de la font d'un text passat
    //com a paràmetre o bé deixar la grandaria per defecte segons el valor
    //de la grandària passada com a paràmetre.
    function grandariaFont1($text, $grandaria="10pt"){ //Dos paràmetres: text i grandària font=10 per defecte
    	echo "<span style=\"font-size:$grandaria\">".$text."</span>";
	}
	grandariaFont1("Capçalera<br/>","24pt");
	grandariaFont1("Text normal<br/>");
	grandariaFont1("Text petit<br/>");
	grandariaFont1("Text molt petit<br/>");
	
	echo "<hr/>";
	
	/*Pas de paràmetres per referència.*/
    
    //Funció que suma 5 a un número passat com a paràmetre
    function afegirCinc($num){
		$num += 5;
	}
	$elMeuNumero = 10;
	afegirCinc($elMeuNumero); //Suma 5 a elMeuNumero però no retorna res
	echo $elMeuNumero; //Mostra 10
	
	echo "<hr/>";
	
	//Solucio 1
	function afegirCinc1($num){
		$num += 5;
		return $num;
	}
	$resultat=afegirCinc1($elMeuNumero); //Suma 5 a elMeuNumero i retorna el resultat
	echo $resultat; //Mostra 15
    
    echo "<hr/>";
    
    //Solucio 2: pàs de paràmetre per referència a una funció
    function afegirCinc2(&$num){
		$num += 5;
	}
	$elMeuNumero = 10;
	afegirCinc2($elMeuNumero); //Suma 5 a elMeuNumero. El paràmetre fa referència a la funció
	echo $elMeuNumero; //Mostra 15
	
	echo "<hr/>";
?>

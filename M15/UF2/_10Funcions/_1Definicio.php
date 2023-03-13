<?php

    //Creació d'una funció sense paràmetres
    function socFuncio(){
		echo "<h3>Sóc una funció.</h3>";
    }
    
    //Crida a la funció
    socFuncio(); //Imprimira per pantalla Sóc una funció
    
    echo"<hr/>";
    
    //Creació d'una funció amb paràmetres
    function saltsDeLinia($txt){
		echo $txt."<br/>";
	}
	
	//Crida a la funció. En aquest cas la cridem més d'un cop
	saltsDeLinia("Això és una línia.");
	saltsDeLinia("Això és una nova lína.");
	saltsDeLinia("Aquesta és l'última línia.");
	
	echo"<hr/>";
	
	//Creació d'una funció amb retorn
	function sumar($primerOperand, $segonOperand){
		$suma = $primerOperand + $segonOperand;
		return $suma;
	}
	
	//Crida a la funció. En aquest cas la funció no mostra res per pantalla
	$resultat=sumar(3,5);
	
	//Mostrem resultat
	echo $resultat;
	//També ho podem mostrar com a echo sumar(3,5);
	
	echo"<hr/>";

?>

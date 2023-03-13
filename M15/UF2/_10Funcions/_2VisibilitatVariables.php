<?php

    /*Les variables declarades dins d'una funció són només per a l'ambit 
     *de la funció. Fora de la funció no es poden utilitzar com si fossin 
     *les mateixes variables.*/
    function test(){
		$variableTest = "Això és una variable test";
	}
	
	//Intentem mostrar el resultat de la variable. No es mostra res perquè
	//no està declarada fora de l'àmbit de la funció.
	echo "El contingut de la variable de test és ".$variableTest."<br/>";
    
    echo"<hr/>";
    
    /*De la mateixa manera una variable declarada fora d'una funció és només 
     *per a l'ambit extern a la funció. Dins de la funció no es pot utilitzar
     *com si fos la mateixa variable.*/
    $nom = "Cesca";
        
    //Intentem utilitzar la variable dins de la funció. No mostra res perquè
	//està declarada fora de l'àmbit de la funció.
	function mostraNom(){
		echo "El meu nom és ".$nom;
	}
	mostraNom(); //No mostra res
	
	echo"<hr/>";
	
	/*Per utilitzar una variable dins d'una funció declarada fora del seu
	 *àmbit, el que fem és declararla com a global dins de la funció. D'aquesta
	 *manera la funció recordarà el valor que té la variable fora d'ella.*/
	$cognom= "Tomás";
       
    //Intentem utilitzar la variable dins de la funció. Mostra el seu valor
    //perquè l'hem declarat com a global dins la mateixa funció.
	function mostraCognom(){
		global $cognom; //Declarem com a global
		echo "El meu cognom és ".$cognom;
	}
	mostraCognom(); //Mostrem Tomás.
	
	echo"<hr/>";
	
	/*Les variables declarades com estàtiques només existeixen dins l'àmbit
	 *de la funció on les declarem, però no perden el seu valor quan l'execució
	 *del programa abandona l'àmbit de la funció.*/
	
	//Funció que ens ha de permetre crear un llistat númerat
	//$numeracio=0;
	function crearLlistatNumerat($txt){
		//global $numeracio;
		//static $numeracio=0;
		$numeracio=0; //Inicialitzem
		$numeracio++; //Augmentem numeració
		echo "<h3>".$numeracio." ". $txt."</h3>"; //Mostrem punt de la llista
	}
	
	//Cridem funcio per crear llista de dos punts
	crearLlistatNumerat("Primer punt.");
	crearLlistatNumerat("Segon punt.");

?>

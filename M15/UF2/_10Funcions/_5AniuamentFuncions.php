<?php

    /*Les funcions poden cridar a altres funcions*/
    
    //Funció que ens mostra per pantalla l'increment en una unitat d'un número
    //passat com a paràmetre.
    function uno($a){ 
		$a+=1; 
		echo "$a<br>"; //Mostra increment d'1
	} 

	//Funció que ens mostra per pantalla l'increment en una unitat i en dos d'un número
    //passat com a paràmetre. Mitjançant aquesta segona funció accedim a 
    //la primera.
	function dos($c){ 
		$c+=1; 
		echo "$c<br>"; //Mostra increment d'1.
		uno($c); 	//Mostra increment de 2
	} 


$var=0; 
dos($var);

?>

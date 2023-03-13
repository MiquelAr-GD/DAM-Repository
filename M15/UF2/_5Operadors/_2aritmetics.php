<html>
<head>
	<title>Operadors aritmètics</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php	
		$valor1=1.2;
		$valor2=2.3;
		$caracter="B";
			
		/*Increment afegeix 1 al valor númeric d'una variable i li assigna el nou valor.
		 *També valid pel decrement*/
		$valor=$valor1;
		echo "++\$valor1 val ".(++$valor1)." i \$valor val $valor<br/>"; //Mostra 2.2 i $valor conté 1.2
		
		
		/*Increment de caràcters transforma el caràcter original assignat 
		 * a una variable en el seu succesor i li assigna el nou valor. 
		 * No es poden decrementar*/
		$valor=$caracter; 
		echo "++\$caracter val ".(++$caracter)." i \$valor val $valor<br/>"; //Mostra C i $valor conté B
		
		//Inicialitzem variables
		
		$valor1=1;
		$valor2=2;
		
		//Suma
		echo "1+2= ".($valor1+$valor2)."<br/>";
		
		//Resta
		echo "1-2= ".($valor1-$valor2)."<br/>";
		
		//Producte
		echo "1*2= ".($valor1*$valor2)."<br/>";
		
		//Divisió
		echo "1/2= ".($valor1/$valor2)."<br/>";
		
		//Mòdul
		echo "La resta de dividir 2 per 1 és ".($valor2%$valor1);
		
	?>	
	
</body>

</html>

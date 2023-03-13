<html>
<head>
	<title>Operadors d'assignació</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php	
	
		$valor1=1.2;
		$valor2=2.3;
		$cadena1="Cadena";
		$cadena2=" és una cadena";
		
		/*Tots coneixem l'operador d'assignació per assignar un valor a
		 * una variable, és a dir, $variable = valor. Aquests es poden 
		 * combinar amb certes operacions per simplificar-nos les expresions*/
		 
		 //Assignació + suma
		$valor1+=$valor2; //Mateix que $valor1=$valor1+$valor2
		echo "Si \$valor1+=\$valor2, \$valor1 val $valor1 <br/>"; //Mostra 3.5
		
		
		//Assignació + resta
		$valor1-=$valor2; //Mateix que $valor1=$valor1-$valor2
		echo "Si \$valor1-=\$valor2, \$valor1 val $valor1 <br/>"; //Mostra 1.2
		
		//Assignació + producte
		$valor1*=$valor2; //Mateix que $valor1=$valor1*valor2
		echo "Si \$valor1*=\$valor2, \$valor1 val $valor1 <br/>"; //Mostra 2.76
		
		//Assignació + divisió
		$valor1/=$valor2; //Mateix que $valor1=$valor1/$valor2
		echo "Si \$valor1/=\$valor2, \$valor1 val $valor1 <br/>"; //Mostra 1.2
		
		//Inicialitzem variables
		$valor1=1;
		$valor2=2;
		
		//Assignació + mòdul
		$valor2%=$valor1; //Mateix que $valor1=$valor2%$valor1
		echo "Si \$valor2%=\$valor1, \$valor2 val $valor2 <br/>"; //Mostra 1.2
		
		//Assignació + concatenació
		$cadena1.=$cadena2; //Mateix que $cadena1=$cadena1.$cadena2
		echo "Si \$cadena1.=\$cadena2, \$cadena1 val $cadena1 <br/>"; //Mostra concatenació entre les dues cadenes
		
	?>	
	
</body>

</html>

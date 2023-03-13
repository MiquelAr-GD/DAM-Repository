<html>
<head>
	<title>Variables en PHP</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php	
		/*La funció settype(valor,"tipus_de_dada") modifica el tipus de valor d'una variable*/
		 
		$valor=8.23; //Valor float a modificar
		
		//modificació a string
		settype($valor,"string");
		echo "$valor és un string <br/>"; //Mostra 8.23
		
		//modificació a enter
		settype($valor,"integer");
		echo "$valor és un enter <br/>"; //Mostra 8
		 
		//modificació a float
		settype($valor,"float");
		echo "$valor és un float <br/>"; //Mostra 8
		 
		//modificació a booleà
		settype($valor,"boolean");
		echo "$valor és un booleà <br/>"; //Mostra 1
	
		//mostrem el valor final de la variable $valor
		echo "<p>\$valor = $valor <p/><br/>"; //Mostra 1
		
		/*La conversió de tipus (tipus_dada) valor permet convertir el 
		 * tipus d'un valor d'una variable, mantenint sempre el valor 
		 * oiginal d'aquesta*/
		 
		 $valor=8.23; //Tornem a donar el valor inicial a la variable
		 
		 //conversió a string
		 echo (string)$valor;  //Mostra 8.23
		 echo " és un string<br/>";
		 
		 //conversió a enter
		 echo (int)$valor;  //també pot ser (integer). Mostra 8
		 echo " és un enter<br/>";
		 
		 //conversió a float
		 echo (float)$valor;
		 echo " és un float<br/>";  //Mostra 8.23
		 
		 //conversió a boleà
		 echo (bool)$valor;  //també pot ser (boolean). Mostra 1
		 echo " és un boleà<br/>";
		 
		 //mostrem el valor final de la variable $valor
		 echo "<p>\$valor = $valor <p/>"; //Mostra 8.23
	?>	
	
</body>

</html>

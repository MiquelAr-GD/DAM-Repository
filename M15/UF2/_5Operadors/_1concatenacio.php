<html>
<head>
	<title>Operador de concatenació</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php	
		/*L'operador concatenació en php és el punt . */
		 
		$cadena="Cadena";
		$aixo_es_una="Això és una ";
		
		//concatenació dos cadenes
		echo "Això és una cadena"." i això és una altra<br/>";
		
		//concatenació d'una variable i una cadena
		echo $cadena." concatenada<br/>";
		 
		//concatenació de cadenes i números de qualsevol tipus
		echo "Això és ".(1)."a cadena<br/>"; //Retorna una cadena
		 
		//concatenació de dues variables
		echo $aixo_es_una.$cadena;
	?>	
	
</body>

</html>

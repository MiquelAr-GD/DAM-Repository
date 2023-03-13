<html>
<head>
	<title>Constants</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
<?php
	/*Les constants és defineixen mitjançant la funció define 
	 *Passem com a paràmetres nom de la constant i valor
	 * Una vegada que la constant està definida, no pot ser canviada o
	 * redifinida en cap moment.
	 * Solament es pot definir com a constants valors escalars (boolean, integer, float i string)
	 * Per convenció el nom de les constants sempre ha d'anar amb majúscula
	 */
		define("PI", 3.141592);
		echo "El valor de la constant PI és ".PI;
?>
</body>

</html>

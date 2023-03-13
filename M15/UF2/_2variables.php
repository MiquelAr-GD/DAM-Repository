<?php

		/*Les variables han de començar amb el símbol $ seguit d'una lletra 
		 *o el símbol _ després poden contenir lletres, números i el simbol _ .
		 *$1234 no és un nom de variable correcte.
		 *Són case sensitive.*
		 *Quan es declaren, no s'ha d'indicar el tipus de valor que li 
		 *assignarem a la variable.*/
		 
		 /*Hem d'utilitzar l'escapament per mostrar el simbol $ sinó
		 *s'interpreta com una variable i si existeix es mostra el seu contingut*/

	$inicial="Això és el contingut de la variable \$inicial";
	
?>
<html>
<head>
	<title>Variables en PHP</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php	
	
		/*Una variable php definida en un document html es pot utilitzar en
		 *qualsevol altre fragment de codi php integrat en el document html. */
		
		//Impresió del contingut de la variable inicial.
		echo $inicial;
		
		$_unaAltreVariable=2;
	
		echo "<br/>El contingut de \$_unaAltreVariable és $_unaAltreVariable";
	
		$_1234_abc="contingut";
	
		echo "<br/>El contingut de \$_1234_abc és $_1234_abc<br/>";
		
	?>	
	
</body>

</html>

<html>
<head>
	<title>Operadors lògics</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php	
		$a=true;
		$b=false;
		
		
		//Conjunció: and o &&. Retorna verdader si els dos operands són verdaders,
		//sinó sempre retorna fals.
		echo "\$a and \$b és ".($a and $b)."<br/>"; //fals
		echo "\$a && \$b és ".($a && $b)."<br/>";  //fals
		
		//Disjunció: or o ||. Retorna fals si els dos operands són falsos,
		//sinó sempre retorna verdader.
		echo "\$a or \$b és ".($a or $b)."<br/>"; //verdader
		echo "\$a || \$b és ".($a || $b)."<br/>"; //verdader

		//Disjunció exclusiva: xor. Retorna verdader quan un operand és fals 
		//i l'altre verdader, sinó sempre retorna fals.
		echo "\$a xor \$b és ".($a xor $b)."<br/>"; //verdader

		//Negació: !. Retorna verdader quan l'operand és fals i fals quan
		//l'operand és verdader.
		echo "!\$a és ".(!$a)."<br/>"; //fals
		echo "!\$b és ".(!$b)."<br/>"; //verdader
		
		//Exemple d'expressió amb operadors de comparació i lògics
		$x=1;
		echo "(\$x>2)&&(\$x<15) és ".(($x>2)&&($x<15)); //fals
	?>	
	
</body>

</html>

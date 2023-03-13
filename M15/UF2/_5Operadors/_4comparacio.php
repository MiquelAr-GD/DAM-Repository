<html>
<head>
	<title>Operadors de comparació</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<?php	
		$a=1;
		$b=2;
		$caracterA="a";
		$caracterB="b";
		
		//$a menor que $b
		echo "\$a < \$b és ".($a<$b)."<br/>"; //verdader
		
		//$caracterA menor que $caracterB. Compara el codi ASCII
		echo "\$caracterA < \$caracterB és ".($caracterA<$caracterB)."<br/>"; //verdader
		
		//$a major que $b
		echo "\$a > \$b és ".($a>$b)."<br/>"; //fals
		
		//$caracterA major que $caracterB
		echo "\$caracterA > \$caracterB és ".($caracterA>$caracterB)."<br/>"; //fals
		
		//$a menor o igual que $b
		echo "\$a <= \$b és ".($a<=$b)."<br/>"; //verdader
		
		//$caracterA menor o igual que $caracterB
		echo "\$caracterA <= \$caracterB és ".($caracterA<=$caracterB)."<br/>"; //verdader
		
		//$a major o igual que $b
		echo "\$a >= \$b és ".($a>=$b)."<br/>"; //fals
		
		//$caracterA major o igual que $caracterB
		echo "\$caracterA >= \$caracterB és ".($caracterA>=$caracterB)."<br/>"; //fals
		
		//$a igual que $b
		echo "\$a == \$b és ".($a==$b)."<br/>"; //fals
		
		//$caracterA igual que $caracterB
		echo "\$caracterA == \$caracterB és ".($caracterA==$caracterB)."<br/>"; //fals
		
		//$a igual que $a i són del mateix tipus
		echo "\$a === \$a és ".($a===$a)."<br/>"; //verdader
		
		//$a igual que "1" i no són del mateix tipus
		echo "\$a === \"1\" és ".($a==="1")."<br/>"; //fals

		//$a diferent que $b
		echo "\$a != \$b és ".($a==$b)."<br/>"; //verdader
		
		//$caracterA diferent que $caracterB
		echo "\$caracterA != \$caracterB és ".($caracterA==$caracterB)."<br/>"; //verdader
	?>	
	
</body>

</html>

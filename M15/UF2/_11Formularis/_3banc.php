<!DOCTYPE html>
<html>

<head>
	<title>Banc</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />

</head>

<body>
<?php
		print_r($_POST);
		$durada=0;  //Comptador mesoso a pagar
		$paquet=$_POST["valor"]; //Paquet seleccionat
		$quotaMensual=$_POST["pagmes"]; //Quota mensual
		$codiOperacio=$_POST["operacio"]; //Codi usuari
		
		//Segons el radio seleccionat apliquem un interés o altre
		switch ($paquet) {
			case 1000:
				$interes = 5;
				break;
			case 5000:
				$interes = 6.5;
				break;
			case 10000:
				$interes = 8;
				break;
			default:
				header("location: _3banc.html"); //Tornem a la pàgina del formulari
				exit; //Sortim del programa
		}
		
		
		while ($paquet > 0){ //mentres el valor no sigui negatiu....
			$durada++;
			$mensual = $quotaMensual - ($paquet * $interes/100); //pagament mensual
			if ($mensual<=0){ //Pagament mensual negatiu
				echo "<h2>Operacio $codiOperacio</h2> Necessites fer pagaments més grans!";
				exit; //Sortim del programa
			}
			$paquet = $paquet - $mensual; //valor que ens queda un cop restada mensualitat
		}
		
		//Mostrem resultat
		echo "<h2>Operacio $codiOperacio</h2> La durada és de $durada mesos amb un percentatge d'interés del $interes%.";
?>
</body>

</html>

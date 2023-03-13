<?php
	//Això és un comentari d'una línia en php
	/* Això és un comentari
	 * de PHP
	 * en més d'una línia */
	 
	//Integració dins del cocumen HTML	
	echo "Això és un missatge eco integrat en el document HTML anterior a l'element html";
	
?>
<html>

<head>
	<title>Integració php</title>
	<!-- important per visualitzar fitxers-->
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
</head>

<body>
	<br/>
	<?php
	
		//Integració dins del cos del document HTML
		echo "Això és un missatge eco integrat en el cos del document html";
		
	?>
	
	<!-- Integració dins d'un element HTML-->
	<p><?echo "Això és un missatge eco integrat en el paràgraf del document html";?></p>
	
	<!--Comentari simple dins d'un element html-->
	<h1>Això és un ... <?php # echo "comentari";?> dins d'un element HTML</h1>
	
	<!-- Enllaç a un fitxer php extern -->
	<a href="_2integracio.php">Nou fitxer php</a>
	
	<p>
	
		<?php
	
			//Integració del codi php d'un fitxer extern
			include "_2integracio.php";
		
			//Elements html dins de codi php
			echo '<br/> que és el mateix que "Això és un missatge eco del fitxer extern _2integracio.php"';
		
		?>
	
	<p>
	
</body>

</html>

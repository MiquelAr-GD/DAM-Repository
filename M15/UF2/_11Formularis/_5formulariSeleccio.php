<!DOCTYPE html>
<?php include "_4seleccio.php"?>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title>Selecció</title>
</head>
<body>
	<!-- construim una selecció d'opcions-->
		<form method="post" action="_4formulariSeleccio.php">
                    <p>
                        <select multiple name="noms[]">
                                <option value="Pepito">Pepito</option>
                                <option value="Maria">Maria</option>
                                <option value="Paula">Paula</option>
                        </select>
                    </p>
		<button type="submit" value="enviar" name="enviar">Enviar Dades</button>
	</form>
        
</body>
</html>

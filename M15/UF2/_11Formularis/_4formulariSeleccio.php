<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<title>Selecció</title>
</head>
<body>
	<!-- construim una selecció d'opcions-->
		<form method="post" action="_4mostrarSeleccio.php">
                    <p>
                        <select multiple name="noms[]">
                                <option value="0">Pepito</option>
                                <option value="1">Maria</option>
                                <option value="2">Paula</option>
                        </select>
                    </p>
		<button type="submit" value="enviar" name="enviar">Enviar Dades</button>
	</form>
        
</body>
</html>

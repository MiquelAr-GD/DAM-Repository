<!DOCTYPE html>
<html>
<head>
	<title>Mostrar productes seleccionats</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<?include "_2accesProductes.php";?>
</head>
<body>
	<p>Benvingut/da, <strong><?echo $usuari;?></strong>!</p>
	<p>Els productes seleccionats són:
		<?llistarProductes($productes)?>
	</p>
</body>
</html>

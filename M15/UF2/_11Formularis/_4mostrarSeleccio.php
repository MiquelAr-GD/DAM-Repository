<!DOCTYPE html>
<html>
    <head>
        <title>Mostrar productes seleccionats</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <?include "_4seleccio.php";?>
    </head>
    <body>
        <!-- construim una selecció d'opcions-->
        <form method="post" action="_4seleccio.php">
            <p>
                <select name="noms">
                    <option value="Pepito">Pepito</option>
                    <option value="Maria">Maria</option>
                    <option value="Paula">Paula</option>
                </select>
            </p>
            <button type="submit" value="enviar" name="enviar">Enviar Dades</button>
        </form>
        <p> <?php llistarNoms($_POST["noms"]);?></p>

    </body>
</html>
<?php

print_r($_POST);

if ($_POST["enviar"]) {

    if (!empty($_POST["noms"])) { //Si la variable productes no està buida...
        echo "Els noms seleccionats són:</br>";
        echo "<ul>"; //Creem llista html
        //Fem un reccorregut pel vector productes..
        foreach ($_POST["noms"] as $nom) {
            echo "<li>$nom</li>"; //Mostrem producte actual com li
        }
        echo "</ul>";
    } else { //Si està buida
        echo "No has seleccionat cap nom";
    }
}
?>


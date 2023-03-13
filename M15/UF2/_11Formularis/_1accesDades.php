<?php

/*Les dades enviades es guarden en la variable predefinida superglobal 
 *$_POST, $_GET o bé $_REQUEST. Aquesta variable és un vector associatiu que útilitza
 *els noms (name) dels inputs del fòrmulari com a índexs i en cada índex
 *guarda el valor assignat al nom (name) del input corresponent. */
 
//Mostrem el contingut del vector associatiu $_GET
echo"<p>El contingut del vector \$_GET és:<br/>";
print_r($_GET);
echo"</p>";

//Accedim a les dades del vector $_GET
$usuari=$_GET["usuari"];
$missatge=$_GET["missatge"];

//Mostrem el contingut del vector associatiu $_POST
echo"<p>El contingut del vector \$_POST és:<br/>";
print_r($_POST);
echo"</p>";

/*//Accedim a les dades del vector $_POST
$usuari=$_POST["usuari"];
$missatge=$_POST["missatge"];*/

//Mostrem el contingut del vector associatiu $_GET o $_POST depen del 
//mètode fet servir al formulari.
echo"<p>El contingut del vector \$_REQUEST és:<br/>";
print_r($_REQUEST);
echo"</p>";

//Accedim a les dades del vector $_GET o $_POST
$usuari=$_REQUEST["usuari"];
$missatge=$_REQUEST["missatge"];

//Afegim un element nou als vectors $_POST i $_GET
$_GET["edat"] = 2;
$_POST["edat"] = 3;

//Mostre contingut dels vectors $_POST, $_GET i $_REQUEST
echo"<p>El nou contingut del vector \$_GET és:<br/>";
print_r($_GET); // Afegit element "edat" igual a 2
echo"</p>";
echo"<p>El nou contingut del vector \$_POST és:<br/>";
print_r($_POST); // Afegit element "edat"igual a 3
echo"</p>";
echo"<p>El nou contingut del vector \$_REQUEST és:<br/>";
print_r($_REQUEST); // No s'ha afegeixen cap dels elements afegits amb GET o POST
echo"</p>";
?>

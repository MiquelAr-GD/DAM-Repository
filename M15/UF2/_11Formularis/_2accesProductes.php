<?php
$enviar=$_POST["enviar"]; //Recollim name del button

//Si s'han enviat les dades
if ($enviar){
  //Accedim al nom d'usuari
  $usuari=$_POST["usuari"];
  $productes=$_POST["productes"];

  //Mostrem el contingut del vector productes
  print_r($productes);
  echo "<br/>";

  //Mostrem el contingut de la variable $_POST
  print_r($_POST);

  //Accedim als productes seleccionats i els mostrem en una llista
  function llistarProductes($productes){
	if (!empty($productes)) { //Si la variable productes no està buida...
		echo "<ul>"; //Creem llista html
		//Fem un reccorregut pel vector productes..
		foreach ($productes as $producte) { 
			echo "<li>$producte</li>"; //Mostrem producte actual com li
		}
		echo "</ul>";
	} else { //Si està buida
		echo "No has seleccionat cap producte";
	}
  }
}else{
	echo "Les dades no s'han enviat correctament";
}
?>

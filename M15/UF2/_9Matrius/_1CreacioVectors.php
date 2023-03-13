<?php
/*Definició d'un vector sense inicialitzar-lo*/
$vector;

/* Creació de vectors no associatius (index numéric seqüencial de 0 fins última posició) sense cap índex en concret*/

$vector0[]="Bob";
$vector0[]="Superheroi";
$vector0[]=30;
$vector0[]="Visió raigs x";

echo "El contingut de \$vector0 és:<br/>";
//Mostrem el contingut del vector
print_r($vector0);
echo "<br/>";

/* Creació de vectors no associatius indicant l'índex*/

$vector1[0]=null; //Posició sense valor
$vector1[1]="Superheroïna";
$vector1[2]=24;
$vector1[3]="Força sobrenatural";

echo "El contingut de \$vector1 és:<br/>";
//Mostrem el contingut del vector
print_r($vector1);
echo "<br/>";

/* Creació de vectors no associatius utilitzant el constructor array*/
$vector2= array("Jane","Superheroïna",34,"Nanotecnologia");

echo "El contingut de \$vector2 és:<br/>";
//Mostrem el contingut del vector
print_r($vector2);
echo "<br/>";

/*Afegim un nou element al final d'un vector*/

$vector2[]="Pensilvània";

echo "Ara el contingut de \$vector2 és:<br/>";
//Mostrem el contingut del vector
print_r($vector2);
echo "<br/>";

/* Modificació de vectors no associatius*/

$vector1[0]="Sally"; //Modificació valor posició 0
$vector1[2]=33; //Modificació valor posició 2

echo "Ara el contingut de \$vector1 és:<br/>";
//Mostrem el contingut del vector
print_r($vector1);
echo "<br/>";

/* Creació de vectors associatius indicant l'índex. Els índexs els hem de crear nosaltres.*/

$vectorAssociatiu0["nom"]="Bob";
$vectorAssociatiu0["ocupacio"]="Superheroi";
$vectorAssociatiu0["edat"]=30;
$vectorAssociatiu0["Poder"]="Visió raigs x";

echo "El contingut de \$vectorAssociatiu0 és:<br/>";
//Mostrem el contingut del vector
print_r($vectorAssociatiu0);
echo "<br/>";

/* Creació de vectors associatius utilitzant el constructor array*/

$vectorAssociatiu1= array("nom"=>"Sally","ocupacio"=>"Superheroïna","edat"=>33,"Poder"=>"Força sobrenatural");

echo "El contingut de \$vectorAssociatiu1 és:<br/>";
//Mostrem el contingut del vector
print_r($vectorAssociatiu1);
echo "<br/>";

/*Afegim un nou element al final d'un vector associatiu. Hem de crear un nou índex*/

$vectorAssociatiu1["residencia"]="Nova York";

echo "Ara el contingut de \$vectorAssociatiu1 és:<br/>";
//Mostrem el contingut del vector
print_r($vectorAssociatiu1);
echo "<br/>";

/* Modificació de vectors associatius*/

$vectorAssociatiu1["nom"]=null; //Modificació valor posició 0
$vectorAssociatiu1["edat"]=24; //Modificació valor posició 2

echo "Ara el contingut de \$vectorAssociatiu1 és:<br/>";
//Mostrem el contingut del vector
print_r($vectorAssociatiu1);
echo "<br/>";
?>

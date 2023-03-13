<?php

/* Comptar el nombre d'elements que té un vector. */

//Creem el vector
$personatgeSally = array("nom" => "Sally", "ocupacio" => "Superheroïna", "edat" => 33, "poder" => "Força sobrenatural");

//Comptem els elelemnts
$totalElements = count($personatgeSally);

//Mostrem resultat
echo "El nombre d'elements del vector \$personatge és de $totalElements<hr/>";

/* reset(): Situa el punter intern d'un vector en la primera posició (posició)
 * i retorna el seu valor */

//Mostrem contingut vector
echo "<h3>FUNCIÓ RESET</h3>";

$comptador = 0; //Control de l'element actual del vector

while (list($index, $valor) = each($personatgeSally)) {
    echo "$index...$valor<br/>";
    $comptador++; //Element actual
    if ($comptador == $totalElements) {//hem arribat al final...
        $inici = reset($personatgeSally); //Tornem a l'inici del vector
        break; //Sortim del while sinó tornariem a mostrar tots els elements un altre cop
    }
}
echo "<hr/>"; //Insertem línia html
//Ens situem de nou en el primer elemnet i el mostrem
echo "El valor del primer element és " . $inici . "<hr/>";

/* Insertem un o més elements al final d'un vectro que ja existeix */
echo "<h3>FUNCIÓ ARRAY_PUSH</h3>";

array_push($personatgeSally, "New York", "Herois", 20);

//Mostrem contingut
foreach ($personatgeSally as $index => $valor) {
    echo "$index...$valor<br/>";
}
echo "<hr/>"; //Insertem línia html

/* Eliminem els tres últims elements que hem insertat anteriorment */
echo "<h3>FUNCIÓ ARRAY_POP</h3>";

for ($i = 1; $i <= 3; $i++) {
    array_pop($personatgeSally); //Eliminem element
}

//Mostrem contingut
while (list($index, $valor) = each($personatgeSally)) {
    echo "$index...$valor<br/>";
}
echo "<hr/>"; //Insertem línia html

/* Insertem un o més elements a l'inici d'un vectro que ja existeix */
echo "<h3>FUNCIÓ ARRAY_UNSHIFT</h3>";

array_unshift($personatgeSally, "New York", "Herois", 20);

//Mostrem contingut
foreach ($personatgeSally as $index => $valor) {
    echo "$index...$valor<br/>";
}
echo "<hr/>"; //Insertem línia html

/* Eliminem els tres primers elements que hem insertat anteriorment */
echo "<h3>FUNCIÓ ARRAY_SHIFT</h3>";

for ($i = 1; $i <= 3; $i++) {
    array_shift($personatgeSally); //Eliminem element
}

//Mostrem contingut
foreach ($personatgeSally as $index => $valor) {
    echo "$index...$valor<br/>";
}
echo "<hr/>"; //Insertem línia html

/* Combinem dos vectors o més que ja existeixen. Si es tracta de vectors 
 * associatius amb el mateix index, els valors del nou vector seran els 
 * del últim vector passat com a paràmetre. Si no són associatius, refarà 
 * la numeració dels index donant cabuda als dos vectors. Si són de diferents 
 * tipus o associatuis amb diferent index convinarà els diferents tipus 
 * d'index tal i com s'ha explicat. */

//Creem dos nous vector
$persontageJane = array("nom" => "Jane", "ocupacio" => "Superheroïna", "edat" => 33, "poder" => "Nanotecnologia");
$personatgeBob = array("Bob", "Superheroi", 30, "Visió raigs x");
//$persontageJane=array("Jane","Superheroïna",33,"Nanotecnologia");

echo "<h3>FUNCIÓ MERGE EXEMPLE 1</h3>";
//Combinem $personatgeJane amb $personatgeSally
$nouVector = array_merge($persontageJane, $personatgeSally);

//Mostrem contingut
while (list($index, $valor) = each($nouVector)) {
    echo "$index...$valor<br/>";
}
echo "<hr/>"; //Insertem línia html

echo "<h3>FUNCIÓ MERGE EXEMPLE 2</h3>";
//Combinem $nouVector amb $personatgeBob
$nouVector = array_merge($nouVector, $personatgeBob);

//Mostrem contingut
foreach ($nouVector as $index => $valor) {
    echo "$index...$valor<br/>";
}
echo "<hr/>"; //Insertem línia html

echo "<h3>FUNCIÓ ARRAY_KEYS</h3>";
/* La funció array_keys ( vector [, valor_clau] ) retorna un vector amb
 * tots els índex del vector passat com a paràmetre. Si especifiquem el
 * paràmetre opcional nomès retornarà els índex que continguin aquest valor */

$indexs = array_keys($personatgeSally); //Accedim als indexs
//$indexs=array_keys($personatgeSally,"Sally"); //Accedim als indexs
//Mostrem contingut
while (list($index, $valor) = each($indexs)) {
    echo "$index...$valor<br/>";
}
echo "<hr/>"; //Insertem línia html

echo "<h3>FUNCIÓ ARRAY_VALUES</h3>";
/* La funció array_values(vector) retorna un vector amb tots els valors 
 * del vector passat com a paràmetre */

$valors = array_values($personatgeSally); //Accedim als valors
//Mostrem contingut
foreach ($valors as $index => $valor) {
    echo "$index...$valor<br/>";
}
echo "<hr/>"; //Insertem línia html

echo "<h3>FUNCIÓ SHUFFLE</h3>";
/* La funció shuffle(vector) retorna el vector passat com a paràmetre, 
 * però amb un nou ordre dels elements. Barreja els elements del vector
 * passat com a paràmetre de manera aleatòria. Retorna true si tot ha 
 * sortit bé i false en cas contrari */

$barreja = shuffle($personatgeSally); //Barrejem valors

if ($barreja) { //Si exit
    echo "La barreja a estat un exit!!!<br/>";
    //Mostrem contingut
    while (list($index, $valor) = each($personatgeSally)) {
        echo "$index...$valor<br/>";
    }
} else { //No exit
    echo "La barreja a fracasat!!!";
}

echo "<hr/>"; //Insertem línia html

echo "<h3>FUNCIÓ IN_ARRAY</h3>";
/* La funció in_array(valor, taula), retorna verdader si valor es troba en la
 * taula */
$valor = "Sally";
if (in_array($valor, $personatgeSally)) {
    echo "Sally existeix!!!";
} else {
    echo "Sally no existeix!!!";
}
echo "<hr/>"; //Insertem línia html

echo "<h3>FUNCIÓ ARRAY_KEY_EXISTS</h3>";
/* La funció array_key_exists(clau, taula), retorna verdader si la clau es troba en
 * la taula */
$valor = "nom";
if (array_key_exists($valor, $personatgeSally)) {
    echo "La clau nom existeix!!!";
} else {
    echo "La clau nom no existeix!!!";
}
?>

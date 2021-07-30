<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ex01</title>
</head>
<body>
<?php 
echo '<hr/>' .'EX 01' . "<hr/>";

$fruits = array('apple', 'banana', 'ornage', 'cherry', 'strawberry', 'peach', 'grape');
sort($fruits);
$flength = count($fruits);
for($i =  0; $i < $flength; $i++){
    echo $fruits[$i] . ' - ';
}

echo '<hr/>' .'EX 02' . "<hr/>";

$cars = array('BMW', 'ferrari', 'lamborghini', 'porche', 'ford', 'volvo', 'tesla');
echo print_r($cars) . '<br>' . '<br>';
\array_splice($cars, 3, 1);
echo print_r($cars);

echo '<hr/>' .'EX 04' . "<hr/>";

$names = array('François', 'Michel', 'Nicole', 'Véronique', 'Benoît');
$nToAdd = array('Leeloo');
echo print_r($names) . '<br>' . '<br>';
\array_splice($names, 4, 0, $nToAdd);
echo print_r($names);

echo '<hr/>' .'EX 05' . "<hr/>";

$words = array("Le","Chat","Botté","de","Charles","Perrault");
$wlength = array_map('strlen', $words);
echo min($wlength) .' ' . max($wlength);

echo '<hr/>' .'EX 06' . "<hr/>";

echo 'saper' . ' => ' . strrev('saper');

echo '<hr/>' .'EX 07' . "<hr/>";

echo "<table border =\"1\" style='border-collapse: collapse'>";
	for ($row=1; $row <= 10; $row++) { 
		echo "<tr>";
		for ($col=1; $col <= 10; $col++) { 
		   $p = $col * $row;
		   echo "<td>$p</td>";
		   	}
	  	    echo "</tr>";
		}
		echo "</table>";


?>
</body>
</html>

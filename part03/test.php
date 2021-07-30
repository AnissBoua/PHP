<?php
$newName = 'john';
try{
$pdo_options[PDO::ATTR_ERRMODE] = PDO::ERRMODE_EXCEPTION;
$db = new PDO('mysql:host=localhost;dbname=testing','root','',$pdo_options);
// $sql = 'SELECT * FROM test ORDER BY id DESC';
// $requete = $db->query($sql);
// $test = $requete->fetch();
// echo $test['text'];
$sql = 'SELECT * FROM test WHERE nickname = ?';
$requete = $db->prepare($sql);
$requete->execute(array($_GET['nickname']));

while ($test = $requete->fetch())
{
echo $test['id'] . " - " . $test['nickname'] . '<br />';
}

// Adding to Database
// $requete = $db->prepare('INSERT INTO test(nickname) VALUES(:nickname)'); 
// $requete->execute(array('nickname' => $newName));

// Change info in DataBase
// $requete = $db->prepare('UPDATE test SET nickname = :newnickname WHERE id = 7');
// $requete->execute(array('newnickname' => 'sara'));

// Deleting something from DataBase
// $requete = $db->prepare('DELETE FROM test WHERE id = 8');
// $requete->execute(array());

// Some functions SQL
// $requete = $db->query('SELECT UPPER(nickname) AS upp_name FROM test');
// while ($donnees = $requete->fetch())
// {
//     echo $donnees['upp_name'] . '<br />';
// }

$requete->closeCursor();
echo 'name changed';
}
catch(Exception $e){
    die('Error : ' . $e->getMessage());
}
?>
<?php
session_start();
?>
<a href="index.php">Home</a>
<form method="post" action="index.php">
    <label for="name">Name :</label>
    <input type="text" name="name">
    <label for="surname">Surname :</label>
    <input type="text" name="surname">
    <input type="submit" name="submit" value="check">
</form>
<p>
    <?php
    echo $_SESSION['error']; 
    ?>
</p>
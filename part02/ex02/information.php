<?php
session_start();
if ( isset( $_SESSION['user'] ) ) {
    echo '<p>' . $_SESSION['user'] . '</p>';
    echo '<a href="index.php">Home</a>';
} else {
    echo 'non so ';
}
?>
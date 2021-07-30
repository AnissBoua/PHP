<?php
session_start();
$_SESSION['error'] = '';
if(!isset($_POST['name']) && !isset($_POST['surname'])){
    // header("Location: ./login.php");
    if(isset($_SESSION['user'])){
        echo '<a href="information.php">' . '<p>' . $_SESSION['user'] . '</p>' . '</a>';
        echo '<a href="logout.php">Disconnect</a>';
    }
    else{
        echo '<a href="./login.php"><button>Log in</button></a>';
    }
}
else{
    if(empty($_POST['name'] || $_POST['surname'])){
        $_SESSION['error'] = 'Invalid User info';
        header("Location: ./login.php");
        echo '<a href="./login.php"><button>Log in 2</button></a>';
    }
    else{
        if(isset($_POST['name']) && isset($_POST['surname'])){
            $user = $_POST['name'] . ' ' . $_POST['surname'];
            $_SESSION['user'] = $user;
            echo '<a href="information.php">' . '<p>' . $_SESSION['user'] . '</p>' . '</a>';
            echo '<a href="logout.php">Disconnect</a>';
        }
    }
    
}

?>




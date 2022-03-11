<?php
    $login = filter_var(trim($_POST['login']), FILTER_SANITIZE_STRING);
    $pass = filter_var(trim($_POST['pass']), FILTER_SANITIZE_STRING);

    if(mb_strlen($login) < 5 || mb_strlen($login) > 90) {
        echo "Недопустимая длина логина";
        exit();
    }   else if(mb_strlen($pass) < 2 || mb_strlen($pass) > 90) {
        echo "Недопустимая длина пароля";
        exit(); 
    }

    $pass = md5($pass."asddf12347");

    require 'configDB.php';
    $sql = 'INSERT INTO personal(FIO, pass) VALUES(:FIO, :pass)'; 
    $query = $pdo->prepare($sql);
    $query->execute(['FIO' => $login, 'pass' => $pass]);
  
    header('Location: /');
    //pdo
?>
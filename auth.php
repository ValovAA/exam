<?php
$login = filter_var(trim($_POST['login']), FILTER_SANITIZE_STRING);
$pass = filter_var(trim($_POST['pass']), FILTER_SANITIZE_STRING);

$pass = md5($pass."asddf12347");

require 'configDB.php';

$sql = 'SELECT * FROM personal WHERE FIO =(:FIO) AND pass = (:pass)';

$query = $pdo->prepare($sql);
$query->execute(['FIO' => $login, 'pass' => $pass]);
$user=$query->fetch(PDO::FETCH_LAZY);
    if (count($user) == 0) {
    echo "Такой пользователь не найден";
    }
setcookie('FIO', $user['FIO'], time() + 3600, "/");


  // print_r($user);
  //exit();
  header('Location: /');
?>
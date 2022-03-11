<?php
  $FIO = $_POST['FIO'];
  $naimenovanie = $_POST['naimenovanie'];
  $result = $_POST['result'];
  if($FIO == '') {
    echo 'Введите значение';
    exit();
  }

  require 'configDB.php';
/*
  $sql = 'INSERT INTO plane(naimenovanie) VALUES(:naimenovanie)';
  $query = $pdo->prepare($sql);
  $query->execute(['naimenovanie' => $task]);
  
  $id = $_POST['FIO'];
  if($task == '') {
    echo 'Введите значение';
    exit();
  }
*/

  $sql = 'INSERT INTO plane(id_Personal, naimenovanie, result) VALUES(:FIO, :naimenovanie, :result)';
  $query = $pdo->prepare($sql);
  $query->execute(['FIO' => $FIO, 'naimenovanie' => $naimenovanie, 'result' => $result]);

  header('Location: /');
?>

<?php
  require 'configDB.php';

  $id = $_GET['id'];

  $sql = 'DELETE FROM `plane` WHERE `id_plan` = ?';
  $query = $pdo->prepare($sql);
  $query->execute([$id]);

  header('Location: /');
?>

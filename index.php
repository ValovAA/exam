<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Результаты активностей</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<?php
require 'configDB.php';
  if($_COOKIE['FIO'] == ''):
?>
  <div class="container mt-4">
    <div class="row"> 
      <div class="col">
      <h1> Регистрация </h1>
      <form action="check.php" method="post">
      <input type="text" class="form-control" name="login" 
      id= "login" placeholder="Введите логин">
      <input type="password" class="form-control" name="pass" 
      id= "pass" placeholder="Введите пароль">
      <button class="btn btn-success" type="submit">Зарегистрировать</button>
      </form>
      </div>
    <div class="col">
    <h1> Авторизация </h1>
    <form action="auth.php" method="post">
      <input type="text" class="form-control" name="login" 
      id= "login" placeholder="Введите логин">
      <input type="password" class="form-control" name="pass" 
      id= "pass" placeholder="Введите пароль">
      <button class="btn btn-success" type="submit">Войти</button>
    </form>
      </div>
      <?php else:?>
        <div class="container">
    <h1>Привет <?=$_COOKIE['FIO']?>, результаты активностей:</h1>
    <form action="/add.php" method="post">
    <?php
require 'configDB.php';


$select = ('SELECT * FROM `personal`');
$FIO = $pdo->query($select);
//echo "<form>";
echo "<select name='FIO'><option>ФИО</option>";
/*if ($FIO->num_rows > 0) {*/
  while ($str = $FIO->fetch(PDO::FETCH_OBJ)) {
    echo "<option value=" .$str->id. ">" .$str->FIO. "</option>";
  }
/*}*/
echo "</select>";
//echo "</form>";
?>
      <br><input type="text" name='naimenovanie' id="activity" placeholder="Активность" class="form-control">
      <input type="text" name="result" id="result" placeholder="Результат" class="form-control"></br>
      <button type="submit" name="sendTask" class="btn btn-success">Отправить</button>
    </form>

    <?php
      

      echo '<ul>';
      $query = $pdo->query('SELECT  `personal`.`FIO`, `plane`.`id_plan`, `plane`.`naimenovanie`, `plane`.`result`
      FROM `plane`
          INNER JOIN `personal` ON `plane`.`id_Personal` = `personal`.`id` 
          WHERE `plane`.`result` IS NOT NULL');
      while($row = $query->fetch(PDO::FETCH_OBJ)) {
        echo '<li><b>' .$row->FIO. ' ' .$row->naimenovanie.' '.$row->result.'</b><a href="/delete.php?id='.$row->id_plan.'"><button>Удалить</button></a></li>';
      }
      echo '</ul>';
    ?>
  </div>
    <?php endif;?>
    </div>
  </div>  
 
</body>
</html>

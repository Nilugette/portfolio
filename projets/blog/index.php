<?php
require 'app/connection.php';
// je défini mon template qui sera chargé
$template = 'home';

$query = $pdo->query('SELECT *, post.Id AS Id FROM post INNER JOIN author ON author.Id = post.Author_Id INNER JOIN category ON category.Id = post.Category_Id ORDER BY Name');

$query->execute();

$aTab = $query->fetchAll();




// je charge le template de base (le squelette)
include 'layout.phtml';
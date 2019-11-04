<?php
require 'app/connection.php';

$template = 'admin';

$query = $pdo->prepare('SELECT *, post.Id AS Id FROM post INNER JOIN author ON author.Id = post.Author_Id INNER JOIN category ON category.Id = post.Category_Id WHERE post.Id=? ORDER BY Name');

$query->execute([$_GET['Id']]);

$aTab = $query->fetch();

$query2 = $pdo->query('SELECT Id, Name FROM category');

$query2->execute();

$aTab2 = $query2->fetchAll();

include 'layout.phtml';
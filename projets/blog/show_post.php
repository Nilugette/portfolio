<?php
require 'app/connection.php';

$template = 'show_post';

if (sizeof($_POST) > 0) {
	if (!empty($_POST['pseudo']) && !empty($_POST['comment']))
    {
    
    	 $query = $pdo->prepare('
            INSERT INTO comment (NickName, Contents, CreationTimeStamp, Post_Id)
            VALUES(?,?, NOW(), ?)
        ');


    	$query->execute([$_POST['pseudo'], $_POST['comment'], $_GET['Id']]);

    	header('location:show_post.php?Id='.$_GET['Id']);	
    }
}

if (isset($_GET['Id'])) {
$query = $pdo->prepare('SELECT *, post.Id AS Id FROM post INNER JOIN author ON author.Id = post.Author_Id INNER JOIN category ON category.Id = post.Category_Id WHERE post.Id=? ORDER BY Name');

$query->execute([$_GET['Id']]);

$aTab = $query->fetch();

$query2 = $pdo->prepare('SELECT * FROM comment WHERE Post_Id=?');
$query2->execute([$_GET['Id']]);
$aComments = $query2->fetchAll();
}


include 'layout.phtml';

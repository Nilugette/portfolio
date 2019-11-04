<?php
session_start();

if (isset($_POST['lang'])) {
	$_SESSION['lang'] = $_POST['lang'];
}


$sFileTrad = 'FR_fr';
if (isset($_SESSION['lang']) && $_SESSION['lang'] != 'FR_fr') {
	if (file_exists('data/'.$_SESSION['lang'].'.php')) {
		$sFileTrad = $_SESSION['lang'];
	} else {
		$_SESSION['lang'] = 'FR_fr';
	}
}

require 'data/'.$sFileTrad.'.php';
//------------------------------------------


function trad($sTrad)
{
	if (isset($GLOBALS['trads'][$sTrad])) {
		return $GLOBALS['trads'][$sTrad];
	}
	return 'TRADUCTION INEXISTANTE';
}




include 'app/connection.php';



if (isset($_POST['submit'])) {

	$errors = [];

if(!array_key_exists('firstname', $_POST) || $_POST['firstname'] == '')
{
	$errors['firstname'] = trad('firstname_field');
}

if(!array_key_exists('lastname', $_POST) || $_POST['lastname'] == '') 
{
	$errors['lastname'] = trad('lastname_field');
}
if(!array_key_exists('email', $_POST) || $_POST['email'] == '') 
{
	$errors['email'] = trad('email_field');
}
if(!array_key_exists('message', $_POST) || $_POST['message'] == '') 
{
	$errors['message'] = trad('message_field');
}

}


if (!empty($errors)) {
	$_SESSION['errors'] = $errors;
	$_SESSION['inputs'] = $_POST;
}
else {
	if (!empty($_POST['firstname']) && !empty($_POST['lastname']) && !empty($_POST['email']) && filter_var($_POST['email'], FILTER_VALIDATE_EMAIL) && !empty($_POST['message']) && isset($_POST['submit']))
	{
		
	$_SESSION['success'] = 1;
	$prenom = $_POST['firstname'];
	$nom = $_POST['lastname'];
	$email = $_POST['email'];
	$message = $_POST['message'];

	$insertion = $pdo->prepare('INSERT INTO contact (Firstname, Lastname, Email, Message, CreationTimestamp) 
								VALUES (?,?,?,?,NOW())');
	$insertion->execute(array(
    		$prenom,
    		$nom,
    		$email,    
    		$message
            		));
	mail("lebon.laure@hotmail.fr", "Email client",$message, "From:" . $email);
	}
	


}


include "phtml/main.phtml";


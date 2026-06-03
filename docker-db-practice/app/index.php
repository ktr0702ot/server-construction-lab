<?php
$host = '192.168.56.20';
$dbname = 'testdb';
$user = 'webuser';
$password = 'webpass';

try {
	$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
	echo "DB接続成功！\n";
} catch (PDOException $e) {
	echo "DB接続失敗: " . $e->getMessage() . "\n";
}


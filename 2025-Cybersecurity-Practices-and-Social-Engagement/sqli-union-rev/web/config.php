<?php
$dsn = 'mysql:host=db;dbname=sqli_demo;charset=utf8';
$user = 'readonly';
$password = 'readonly_password';

try {
    $pdo = new PDO($dsn, $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>

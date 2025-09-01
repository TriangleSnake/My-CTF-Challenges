<?php
include 'config.php';

if (isset($_GET['sauce'])) {
  show_source(__FILE__);
  die();
}

$id = $_GET['id'] ?? 1;
$query = "SELECT * FROM posts WHERE id = $id";
$stmt = $pdo->query($query);
$post = $stmt->fetch(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>SQLi Demo - <?php echo $post['title']; ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1><?php echo $post['title']; ?></h1>
    <hr>
    <p><?php echo nl2br($post['content']); ?></p>
    <a class="btn btn-secondary" href="/?sauce=true">Source Code</a>
</body>
</html>

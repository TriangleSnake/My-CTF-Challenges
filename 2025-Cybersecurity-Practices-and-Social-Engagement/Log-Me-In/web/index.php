<?php
include 'config.php';

try {
    $pdo = new PDO($dsn, $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    
    $query = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
    $stmt = $pdo->query($query);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user) {
        echo "<h1>Login successful!</h1>";
        echo "<br>Your Payload:";
        echo "<br><code>Username: {$username}";
        echo "<br>Password: {$password}</code>";
        echo "<p><img src=https://media1.tenor.com/m/nPd-ijwBSKQAAAAd/hacker-pc.gif></p>";
        echo "Here is your flag: <code>{$flag}</code>";
    } else {
        echo "<h1>Wrong Username or Password</h1>";
        echo "<p><img src=https://media1.tenor.com/m/bHGUqVIKzhoAAAAC/let-me-in-eric-andre.gif></p>";
    }
    die();
}
if (isset($_GET["sauce"])){
    show_source(__FILE__);
    die();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>SQLi Demo Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
    <div class="container card p-4 shadow" style="max-width: 350px;">
        <h2 class="text-center mb-4">Login</h2>
        <form method="POST">
            <div class="mb-3">
                <label class="form-label">Username:</label>
                <input type="text" name="username" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>
            <a href="/?sauce=true" class="btn btn-secondary w-100">Source Code</a>
        </form> 
    </div>
</body>
</html>

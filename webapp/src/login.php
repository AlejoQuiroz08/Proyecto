<?php
session_start();
if(isset($_SESSION['user_id'])) {
    header("Location: catalog.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8f9fa; }
        .auth-wrapper { height: 100vh; display: flex; align-items: center; }
        .auth-card { width: 400px; padding: 2rem; box-shadow: 0 0 20px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-card mx-auto">
            <h2 class="text-center mb-4">Iniciar Sesión</h2>
            <?php if(isset($_GET['error'])): ?>
                <div class="alert alert-danger"><?= htmlspecialchars($_GET['error']) ?></div>
            <?php endif; ?>
            <form action="auth.php" method="POST">
                <div class="mb-3">
                    <label class="form-label">Usuario o Email</label>
                    <input type="text" name="login" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Contraseña</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Ingresar</button>
                <p class="text-center mt-3">
                    ¿No tienes cuenta? <a href="register.php">Regístrate aquí</a>
                </p>
            </form>
        </div>
    </div>
</body>
</html>
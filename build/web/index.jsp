<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sistema de Ventas - Ferretería</title>
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
 
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
        }
        .btn-custom {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Bienvenido al Sistema de Ventas</h1>
        <div class="text-center mt-4">
            <a href="InicioSesion.jsp" class="btn btn-primary btn-custom mb-2">Iniciar Sesión</a>
            <a href="Registro.jsp" class="btn btn-secondary btn-custom mb-2">Registrar Administrador</a>
            <a href="Sistema_Web/inicio.jsp" class="btn btn-warning btn-custom mb-2">Tienda</a>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
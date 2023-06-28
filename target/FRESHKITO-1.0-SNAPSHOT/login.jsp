<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es" data-bs-theme="auto">
<head>
    <script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.112.5">
    <title>Login</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <style>
        /* Estilos personalizados */
        body {
            background-color: #f8f9fa;
            font-family: "Century Gothic", sans-serif;
        }

        .form-signin {
            max-width: 330px;
            padding: 1rem;
            margin: 0 auto;
            margin-top: 10vh;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
      


        .form-signin img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin: 0 auto 1.5rem;
            display: block;
        }

        .form-signin h1 {
            font-size: 24px;
            margin-bottom: 1.5rem;
            color: #333333;
        }

        .form-signin .form-floating {
            margin-bottom: 1.5rem;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 14px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #dddddd;
            background-color: #f7f7f7;
            font-family: "Century Gothic", sans-serif;
        }

        .form-signin input[type="text"]:focus,
        .form-signin input[type="password"]:focus {
            outline: none;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        }

        .form-signin .form-check-input {
            margin-top: 0.2rem;
            background-color: #FFA500;
        }

        .form-signin .btn {
            font-size: 12px;
            padding: 8px 10px;
            border-radius: 5px;
            background-color: #FF8C00;
            border: none;
            cursor: pointer;
        }

        .form-signin .btn:hover {
            background-color: #FFA500;

        .form-signin .btn:focus {
            outline: none;
            box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        }

        .form-signin .form-check-label {
            font-size: 12px;
            
            color: #555555;
        }

        .form-signin .text-muted {
            font-size: 12px;
            color: #999999;
        }
    </style>
</head>
<body>
<main class="form-signin">
    <form action="LoginControlador" method="POST">
        <img class="mb-4" src="images/logo.jpeg" alt="" width="150" height="150">
        <h1 class="h3 mb-3 fw-normal">INICIAR SESION</h1>

        <div class="form-floating">
            <input type="text" name="usuario" class="form-control" id="floatingInput" placeholder="name@example.com">
            <label for="floatingInput">USUARIO</label>
        </div>
        <div class="form-floating">
            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
            <label for="floatingPassword">CONTRASEÑA</label>
        </div>

        <div class="d-flex justify-content-between align-items-center">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="remember-me" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                    Recordarme
                </label>
            </div>

            <button class="btn btn-primary" type="submit">Ingresar</button>
        </div>

    </form>
</main>
<script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>

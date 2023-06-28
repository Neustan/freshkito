<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Punto de Venta</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        
        <style>
            .card {
                margin-bottom: 20px;
            }
            .card-body {
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="META-INF/menu.jsp">
            <jsp:param name="opcion" value="clientes" />
        </jsp:include><br><br><br>
        <div class="container">
            <h1>Clientes</h1>
            <a href="ClienteControlador?action=add" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus">Nuevo</i></a>
            <div class="row">
                <div class="col-md-6">
                    <form action="ClienteControlador" method="GET">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" name="search" placeholder="Buscar cliente">
                            <button class="btn btn-primary" type="submit"><i class="fa-solid fa-search"></i> Buscar</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <c:forEach var="item" items="${usuarios}">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">${item.nombre}</h5>
                                <p class="card-text">Usuario: ${item.usuario}</p>
                                <p class="card-text">Tipo Usuario: ${item.tipo_usuario}</p>
                                <a href="ClienteControlador?action=edit&id_usuario=${item.id_usuario}" class="btn btn-primary"><i class="fa-solid fa-pen-to-square"></i> Editar</a>
                                <a href="ClienteControlador?action=delete&id_usuario=${item.id_usuario}" onclick="return(confirm('¿Estás seguro de eliminar el registro?'))" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Eliminar</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdl

    </body>
</html>

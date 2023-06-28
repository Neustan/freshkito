<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Punto de Venta</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="META-INF/menu.jsp">
            <jsp:param name="opcion" value="ingredientes" />
        </jsp:include><br><br><br>
        <div class="container">
            <h1>Lista de Ingredientes</h1>
            <a href="IngredientesControlador?action=add"  class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus">Nuevo</i></a>
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Estado</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${ingredientes}">
                    <tr>
                        <td>${item.id_ingrediente}</td>
                        <td>${item.nombre_ingrediente}</td>
                        <td>${item.precio_ingrediente}</td>
                        <td>${item.estado_ingrediente}</td>
                        <td><a href="IngredientesControlador?action=edit&id_ingrediente=${item.id_ingrediente}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                        <td><a href="IngredientesControlador?action=delete&id_ingrediente=${item.id_ingrediente}" onclick="return(confirm('Esta seguro de eliminar el registro?'))"><i class="fa-solid fa-trash"></i></a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>

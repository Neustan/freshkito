<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Punto de Venta</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="META-INF/menu.jsp">
            <jsp:param name="opcion" value="productos" />
        </jsp:include><br><br><br>
        <div class="container">
            <h1>Productos</h1>
            <a href="ProductoControlador?action=add"  class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus">Nuevo</i></a>
            <table class="table table-striped">
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Nombre de Archivo</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Sabor 1</th>
                    <th>Sabor 2</th>
                    <th>Sabor 3</th>
                    <th>Jalea 1</th>
                    <th>Jalea 2</th>
                    <th>Jalea 3</th>
                    <th>Chispas 1</th>
                    <th>Chispas 2</th>
                    <th>Estado</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach var="item" items="${producto}">
                    <tr>
                        <td>${item.id_producto}</td>
                        <td>${item.nombre_producto}</td>
                        <td>${item.dir_imagen}</td>
                        <td>${item.precio}</td>
                        <td>${item.descripcion}</td>
                        <td>${item.capa1}</td>
                        <td>${item.capa2}</td>
                        <td>${item.capa3}</td>
                        <td>${item.jalea1}</td>
                        <td>${item.jalea2}</td>
                        <td>${item.jalea3}</td>
                        <td>${item.chispas1}</td>
                        <td>${item.chispas2}</td>
                        <td>${item.estado_producto}</td>
                        <td><a href="ProductoControlador?action=edit&id_producto=${item.id_producto}"><i class="fa-solid fa-pen-to-square"></i></a></td>
                        <td><a href="ProductoControlador?action=delete&id_producto=${item.id_producto}" onclick="return(confirm('Esta seguro de eliminar el registro?'))"><i class="fa-solid fa-trash"></i></a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>

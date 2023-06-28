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
            <jsp:param name="opcion" value="ingredientes" />
        </jsp:include><br><br><br>
        <div class="container">
            <h1>Formulario de Ingredientes</h1>
            <form action="IngredientesControlador" method="POST">
                <input type="hidden" name="id_ingrediente" value="${ingredientes.id_ingrediente}">
                <div class="form-group">
                    <label for="nombre_producto" class="form-label">Nombre de Ingrediente</label>
                    <input type="text" class="form-control" name="nombre_ingrediente" value="${ingredientes.nombre_ingrediente}" placeholder="Escriba su nombre del producto">
                </div>
                <div class="form-group">
                    <label for="precio" class="form-label">Precio</label>
                    <input type="number" class="form-control" name="precio_ingrediente" value="${ingredientes.precio_ingrediente}" step="0.01" placeholder="0.00">
                </div>
                <div class="form-group">
                    <label for="dir_imagen" class="form-label">Estado</label>
                    <select name="estado_ingrediente" class="form-control">
                        <option value="">--Seleccione--</option>
                            <option value="Disponible" 
                                    <c:if test="${ingredientes.estado_ingrediente == 'Disponible'}">
                                        selected
                                    </c:if>
                                        >Disponible</option>
                            <option value="No Disponible" 
                                    <c:if test="${ingredientes.estado_ingrediente == 'No Disponible'}">
                                        selected
                                    </c:if>
                                        >No Disponible</option>
                    </select>
                </div>
                <br>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>

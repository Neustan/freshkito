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
            <jsp:param name="opcion" value="clientes" />
        </jsp:include><br><br><br>
        <div class="container">
            <h1>Formulario de Clientes</h1>
            <form action="ClienteControlador" method="POST">
                <input type="hidden" name="id_usuario" value="${usuarios.id_usuario}">
                <div class="form-group">
                    <label for="nombre" class="form-label">Nombre Completo</label>
                    <input type="text" class="form-control" name="nombre" value="${usuarios.nombre}" placeholder="Escriba su nombre">
                </div>
                <div class="form-group">
                    <label for="usuario" class="form-label">Usuario</label>
                    <input type="text" class="form-control" name="usuario" value="${usuarios.usuario}">
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" name="password" value="${usuarios.password}">
                </div>
                <div class="form-group">
                    <label for="tipo_usuario" class="form-label">Tipo Usuario</label>
                    <select name="tipo_usuario" class="form-control">
                        <option value="">--Seleccione--</option>
                        <option value="admin" 
                                    <c:if test="${usuarios.tipo_usuario == 'admin'}">
                                        selected
                                    </c:if>
                                        >Administrador</option>
                            <option value="oper" 
                                    <c:if test="${usuarios.tipo_usuario == 'oper'}">
                                        selected
                                    </c:if>
                                        >Operador</option>
                    </select>
                </div>
                <br>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
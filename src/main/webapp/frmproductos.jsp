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
            <h1>Formulario de Productos</h1>
            <form action="ProductoControlador" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="id_producto" value="${producto.id_producto}">
                <div class="form-group">
                    <label for="nombre_producto" class="form-label">Nombre de Producto</label>
                    <input type="text" class="form-control" name="nombre_producto" value="${producto.nombre_producto}" placeholder="Escriba su nombre del producto">
                </div>
                <div class="form-group">
                    <label for="imagen_catalogo" class="form-label">Imagen</label>
                    <input type="file" class="form-control" name="imagen_catalogo">
                </div>
                <div class="form-group">
                    <label for="dir_imagen" class="form-label">Nombre de Imagen</label>
                    <input type="text" class="form-control" name="dir_imagen" value="${producto.dir_imagen}" >
                </div>
                <div class="form-group">
                    <label for="precio" class="form-label">Precio</label>
                    <input type="number" class="form-control" name="precio" value="${producto.precio}" step="0.01" placeholder="0.00">
                </div>
                <div class="form-group">
                    <label for="descripcion" class="form-label">Descripcion</label>
                    <input type="text" class="form-control" name="descripcion" value="${producto.descripcion}" >
                </div>
                <div class="form-group">
                    <label for="cod_capa1" class="form-label">Capa 1</label>
                    <select name="cod_capa1" class="form-control">
                        <option value="0">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_ingredientes}">
                            <option value="${item.id_ingrediente}" 
                                    <c:if test="${producto.cod_capa1 == item.id_ingrediente}">
                                        selected
                                    </c:if>
                                        >${item.nombre_ingrediente}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cod_capa2" class="form-label">Capa 2</label>
                    <select name="cod_capa2" class="form-control">
                        <option value="0">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_ingredientes}">
                            <option value="${item.id_ingrediente}" 
                                    <c:if test="${producto.cod_capa2 == item.id_ingrediente}">
                                        selected
                                    </c:if>
                                        >${item.nombre_ingrediente}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cod_capa3" class="form-label">Capa 3</label>
                    <select name="cod_capa3" class="form-control">
                        <option value="0">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_ingredientes}">
                            <option value="${item.id_ingrediente}" 
                                    <c:if test="${producto.cod_capa3 == item.id_ingrediente}">
                                        selected
                                    </c:if>
                                        >${item.nombre_ingrediente}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cod_jalea1" class="form-label">Jalea 1</label>
                    <select name="cod_jalea1" class="form-control">
                        <option value="0">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_ingredientes}">
                            <option value="${item.id_ingrediente}" 
                                    <c:if test="${producto.cod_jalea1 == item.id_ingrediente}">
                                        selected
                                    </c:if>
                                        >${item.nombre_ingrediente}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cod_jalea2" class="form-label">Jalea 2</label>
                    <select name="cod_jalea2" class="form-control">
                        <option value="0">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_ingredientes}">
                            <option value="${item.id_ingrediente}" 
                                    <c:if test="${producto.cod_jalea2 == item.id_ingrediente}">
                                        selected
                                    </c:if>
                                        >${item.nombre_ingrediente}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cod_jalea3" class="form-label">Jalea 3</label>
                    <select name="cod_jalea3" class="form-control">
                        <option value="0">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_ingredientes}">
                            <option value="${item.id_ingrediente}" 
                                    <c:if test="${producto.cod_jalea3 == item.id_ingrediente}">
                                        selected
                                    </c:if>
                                        >${item.nombre_ingrediente}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cod_chispas1" class="form-label">Chispas 1</label>
                    <select name="cod_chispas1" class="form-control">
                        <option value="0">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_ingredientes}">
                            <option value="${item.id_ingrediente}" 
                                    <c:if test="${producto.cod_chispas1 == item.id_ingrediente}">
                                        selected
                                    </c:if>
                                        >${item.nombre_ingrediente}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cod_chispas2" class="form-label">Chispas 2</label>
                    <select name="cod_chispas2" class="form-control">
                        <option value="0">--Seleccione--</option>
                        <c:forEach var="item" items="${lista_ingredientes}">
                            <option value="${item.id_ingrediente}" 
                                    <c:if test="${producto.cod_chispas2 == item.id_ingrediente}">
                                        selected
                                    </c:if>
                                        >${item.nombre_ingrediente}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="estado_producto" class="form-label">Estado Producto</label>
                    <select name="estado_producto" class="form-control">
                        <option value="">--Seleccione--</option>
                            <option value="Disponible" 
                                    <c:if test="${producto.estado_producto == 'Disponible'}">
                                        selected
                                    </c:if>
                                        >Disponible</option>
                            <option value="No Disponible" 
                                    <c:if test="${producto.estado_producto == 'No Disponible'}">
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
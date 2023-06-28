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
    </head>
    <script>
        function mostrarFecha() {
            var fecha = new Date(); // Crea un objeto Date con la fecha actual
            var fechaActual = fecha.toLocaleString(); // Obtiene la fecha actual formateada

            document.getElementById("fecha").innerHTML = fechaActual; // Muestra la fecha en el elemento con el id "fecha"
        }
    </script>
    <body>
        <jsp:include page="META-INF/menu.jsp">
            <jsp:param name="opcion" value="ventas" />
        </jsp:include>
        <br><br><br>
        <div class="container">
            <h1>Detalle de Compra</h1>
            <form action="VentasControlador" method="POST">
                <input type="hidden" name="id_pedido" value="0">
                <div class="form-group">
                    <label for="razon_social" class="form-label">Razon Social</label>
                    <input type="text" class="form-control" name="razon_social">
                </div>
                <div class="form-group">
                    <label for="nit" class="form-label">NIT / Cedula de Identidad</label>
                    <input type="text" class="form-control" name="nit">
                </div>
                <br>
                <table class="table table-striped"
                    <tr>
                        <th>Imagen</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Precio</th>
                    </tr>

                    <%
                        double total = 0;
                        int index = 0;
                        while (request.getParameter("itemCod" + index) != null) {
                            int itemCod = Integer.parseInt(request.getParameter("itemCod" + index));
                            String itemName = request.getParameter("itemName" + index);
                            double itemPrice = Double.parseDouble(request.getParameter("itemPrice" + index));
                            String itemImage = request.getParameter("itemImage" + index);
                            String itemDescriptions = request.getParameter("itemDescription" + index);
                            total += itemPrice;
                    %>
                    <tr>
                        <td><img src="images/<%= itemImage%>" alt="<%= itemName%>" width="100"></td>
                        <td><input type="hidden" class="form-control" name="codigo_producto" value="<%= itemCod%>" readonly><%= itemName%></td>
                        <td><%= itemDescriptions%></td>
                        <td>Bs. <%= itemPrice%></td>
                    </tr>
                    <%
                            index++;
                        }%>

                    <tr>
                        <td colspan="3">Total:</td>
                        <td>Bs. <%= total%></td>
                    </tr>
                </table>
                <br><br>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>
        </div>
    </body>
</html>
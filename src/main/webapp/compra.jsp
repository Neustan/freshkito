<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Catálogo de Helados</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    </head>
    <body>
        <jsp:include page="META-INF/menu.jsp">
            <jsp:param name="opcion" value="inicio" />
        </jsp:include>
        <br><br><br>
        <h1>Detalle de Compra</h1>
        <div class="container">
            <table class="table table-striped">
                <tr>
                    <th>Imagen</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                </tr>

                <%
                    int total = 0;
                    int index = 0;
                    while (request.getParameter("itemName" + index) != null) {
                        String itemName = request.getParameter("itemName" + index);
                        int itemPrice = Integer.parseInt(request.getParameter("itemPrice" + index));
                        String itemImage = request.getParameter("itemImage" + index);
                        String itemDescriptions = request.getParameter("itemDescription" + index);
                        total += itemPrice;
                %>
                <tr>
                    <td><img src="images/<%= itemImage%>" alt="<%= itemName%>" width="100"></td>
                    <td><%= itemName%></td>
                    <td><%= itemDescriptions%></td>
                    <td>$<%= itemPrice%></td>
                </tr>
                <%
                    index++;
                }%>

                <tr>
                    <td colspan="3">Total:</td>
                    <td>$<%= total%></td>
                </tr>
            </table>
        </div>
        <a href="InicioControlador">Volver a Inicio</a>
    </body>
</html>



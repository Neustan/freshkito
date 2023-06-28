<%
    if (session.getAttribute("login") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Catálogo de Helados</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <style>
            .cart-item {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .cart-item img {
                margin-right: 10px;
            }

            .item-info {
                flex-grow: 1;
            }

            .remove-button {
                background-color: #ff0000;
                color: #fff;
                border: none;
                padding: 20px;
                cursor: pointer;
                font-size: 18px;
                transition: background-color 0.3s ease;
                border-radius: 5px;
            }

            .remove-button:hover {
                background-color: #cc0000;
            }

            .card {
                margin-bottom: 20px;
                border-radius: 10px;
                box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
            }

            .card-body {
                padding: 20px;
                font-family: Arial, sans-serif;
            }

            .cart-sidebar {
                position: fixed;
                top: 0;
                right: 0;
                width: 300px;
                height: 100%;
                background-color: #f8f9fa;
                padding: 20px;
                display: none;
                font-family: Century Gothic, sans-serif;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            .cart-total::before {
                content: "";
                display: block;
                width: 100%;
                height: 1px;
                background-color: #ccc;
                margin-bottom: 10px;
            }

            .cart-item {
                margin-bottom: 10px;
            }

            .cart-total {
                margin-top: 10px;
                font-weight: bold;
            }

            .cart-icon {
                position: fixed;
                bottom: 20px;
                right: 20px;
                width: 50px;
                height: 50px;
                background-color: #333;
                color: #fff;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 24px;
                cursor: pointer;
                z-index: 9999;
            }

            .cart-icon-container {
                position: relative;
                z-index: 9999;
            }

            .add-to-cart-button {
                background-color: #ff0000;
                color: #fff;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
                border-radius: 5px;
                text-transform: uppercase;
                font-weight: bold;
            }

            .add-to-cart-button:hover {
                background-color: #cc0000;
            }

            .cart-sidebar {
                position: fixed;
                top: 0;
                right: -300px;
                width: 300px;
                height: 100%;
                background-color: #fff;
                transition: right 0.3s ease;
                z-index: 9998;
                border: 1px solid rgba(0, 0, 0, 0.2);
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                border-radius: 10px;
            }

            .cart-sidebar.open {
                right: 0;
            }

            .cart-icon-container.open {
                right: 320px; /* Ajusta el valor según el ancho de tu ventana lateral */
            }

            .cart-content {
                padding: 20px;
                overflow-y: auto;
                max-height: calc(100% - 80px); /* Ajusta el valor según tus necesidades */
            }

            .cart-items {
                margin-bottom: 10px;
            }

            .cart-total {
                text-align: center;
                font-weight: bold;
            }

            .cart-close {
                position: absolute;
                top: 10px;
                right: 10px;
                padding: 5px;
                background-color: transparent;
                border: none;
                color: #333;
                cursor: pointer;
            }

            .cart-total-fixed {
                position: sticky;
                bottom: 0;
                background-color: #f8f9fa;
                padding: 10px 20px;
                font-weight: bold;
                z-index: 9999;
                margin-top: auto;
                border-top: 1px solid #ccc;
            }
        </style>        
    </head>
    <body>
        <jsp:include page="META-INF/menu.jsp">
            <jsp:param name="opcion" value="inicio" />
        </jsp:include>
        <br><br><br>
        <div class="container">
            <h1>Catálogo de Helados</h1>
            <div class="row">
                <c:forEach var="item" items="${inicio}">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <img src="images/${item.imagen}" width="250" height="341">
                                <h5 class="card-title">Codigo Producto: ${item.id}</h5>
                                <h3 class="card-title">${item.nombre}</h3>
                                <p class="card-text"><h5>Descripción:</h5> ${item.descripcion}</p>
                                <p class="card-text">Precio: ${item.precio} Bs.</p>
                                <a href="#" onclick="addToCart('${item.id}','${item.nombre}', ${item.precio}, '${item.imagen}', '${item.descripcion}')" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Añadir al Carrito</a></div>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Icono del carrito -->
        <div class="cart-icon-container">
            <div class="cart-icon" onclick="toggleCartSidebar()">
                <i class="fas fa-shopping-cart"></i>
            </div>
        </div>


        <!-- Ventana lateral del carrito -->
        <div id="cart-sidebar" class="cart-sidebar">
            <div class="cart-content">
                <div id="cart-items" class="cart-items"></div>

            </div>
            <div id="cart-total" class="cart-total"></div>
            <br>
            <div class="cart-actions">
                <input type="hidden" name="orderDetails" value="Detalles del pedido aquí">
                <button class="btn btn-primary" onclick="proceedToCheckout()">Comprar</button>
                <br>
            </div>
        </div>

    </div>

    <script>
        var cart = []; // Array para almacenar los helados agregados al carrito

        // Función para agregar un helado al carrito
        function addToCart(id, nombre, precio, imagen, descripcion) {
            var helado = {
                id: id,
                nombre: nombre,
                precio: precio,
                imagen: imagen,
                descripcion: descripcion
            };
            cart.push(helado);

            // Actualizar la ventana lateral del carrito
            updateCartSidebar();

            // Abrir la ventana lateral del carrito
            openCartSidebar();

            event.preventDefault();
        }

        // Función para abrir la ventana lateral del carrito
        function openCartSidebar() {
            var cartSidebar = document.getElementById("cart-sidebar");
            cartSidebar.classList.add("open");
        }

        // Función para eliminar un helado del carrito
        function removeFromCart(index) {
            cart.splice(index, 1);

            // Actualizar la ventana lateral del carrito
            updateCartSidebar();
        }

        // Función para actualizar la ventana lateral del carrito
        function updateCartSidebar() {

            var cartItems = document.getElementById("cart-items");
            var cartTotal = document.getElementById("cart-total");

            // Limpiar los elementos anteriores en la ventana lateral del carrito
            cartItems.innerHTML = "";
            cartTotal.innerHTML = "";

            var total = 0;

            // Recorrer los helados en el carrito y crear los elementos correspondientes
            for (var i = 0; i < cart.length; i++) {
                var cartItem = document.createElement("div");
                cartItem.className = "cart-item";

                var itemImage = document.createElement("img");
                itemImage.src = "images/" + cart[i].imagen;
                itemImage.width = 50;
                itemImage.height = 70;
                cartItem.appendChild(itemImage);

                var itemInfo = document.createElement("div");
                itemInfo.className = "item-info";

                var itemCod = document.createElement("p");
                itemCod.innerText = cart[i].id;
                itemInfo.appendChild(itemCod);

                var itemName = document.createElement("p");
                itemName.innerText = cart[i].nombre;
                itemInfo.appendChild(itemName);

                var itemPrice = document.createElement("p");
                itemPrice.innerText = "Precio: " + cart[i].precio + " Bs.";
                itemInfo.appendChild(itemPrice);

                cartItem.appendChild(itemInfo);

                var removeButton = document.createElement("button");
                removeButton.innerHTML = '<i class="fas fa-trash"></i>';
                removeButton.className = "remove-button";
                removeButton.setAttribute("onclick", "removeFromCart(" + i + ")");
                cartItem.appendChild(removeButton);

                cartItems.appendChild(cartItem);

                total += cart[i].precio;
            }

            // Calcular y mostrar el total del carrito
            cartTotal.innerText = "Total: " + total + " Bs.";

            // Mostrar la ventana lateral del carrito
            var cartSidebar = document.getElementById("cart-sidebar");
            cartSidebar.style.display = "block";
        }


        // Función para calcular el total del carrito
        function calculateCartTotal() {
            var total = 0;
            for (var i = 0; i < cart.length; i++) {
                total += cart[i].precio;
            }
            return total;
        }

        // Función para cerrar la ventana lateral del carrito
        function closeCartSidebar() {
            var cartSidebar = document.getElementById("cart-sidebar");
            cartSidebar.style.display = "none";
        }
        function toggleCartSidebar() {
            var cartSidebar = document.getElementById("cart-sidebar");
            cartSidebar.classList.toggle("open");

            var cartIconContainer = document.querySelector(".cart-icon-container");
            cartIconContainer.classList.toggle("open");
        }
        function toggleCartSidebar() {
            var cartSidebar = document.getElementById("cart-sidebar");
            var cartIconContainer = document.querySelector(".cart-icon-container");

            cartSidebar.classList.toggle("open");
            cartIconContainer.classList.toggle("open");

            if (cartSidebar.classList.contains("open")) {
                cartIconContainer.style.right = "320px"; // Ajusta el valor según el ancho de tu ventana lateral
            } else {
                cartIconContainer.style.right = "20px"; // Ajusta el valor según tu posición original
            }
        }


        function proceedToCheckout() {
            // Verificar si hay elementos en el carrito
            if (cart.length === 0) {
                alert("El carrito está vacío. Agrega al menos un helado antes de comprar.");
                return;
            }
            // Obtener los detalles del pedido
            var orderDetails = {
                cart: cart,
                total: calculateCartTotal()
            };

            // Crear un formulario
            var form = document.createElement("form");
            form.method = "POST";
            form.action = "frmventas.jsp";

            // Crear un campo oculto para cada elemento en el carrito
            for (var i = 0; i < cart.length; i++) {
                var item = cart[i];

                // Crear campos ocultos para los detalles del elemento
                var itemCodInput = document.createElement("input");
                itemCodInput.type = "hidden";
                itemCodInput.name = "itemCod" + i;
                itemCodInput.value = item.id;
                form.appendChild(itemCodInput);
                
                var itemNameInput = document.createElement("input");
                itemNameInput.type = "hidden";
                itemNameInput.name = "itemName" + i;
                itemNameInput.value = item.nombre;
                form.appendChild(itemNameInput);

                var itemPriceInput = document.createElement("input");
                itemPriceInput.type = "hidden";
                itemPriceInput.name = "itemPrice" + i;
                itemPriceInput.value = item.precio;
                form.appendChild(itemPriceInput);

                var itemDescriptionInput = document.createElement("input");
                itemDescriptionInput.type = "hidden";
                itemDescriptionInput.name = "itemDescription" + i;
                itemDescriptionInput.value = item.descripcion;
                form.appendChild(itemDescriptionInput);

                var itemImageInput = document.createElement("input");
                itemImageInput.type = "hidden";
                itemImageInput.name = "itemImage" + i;
                itemImageInput.value = item.imagen;
                form.appendChild(itemImageInput);
            }

            // Agregar el formulario al cuerpo del documento y enviarlo automáticamente
            document.body.appendChild(form);
            form.submit();
        }

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>

<%
    String opcion = request.getParameter("opcion");
%>
<style>
    /* Estilos para la barra de navegación */
    .navbar {
        background-color: #FF8C00;
        padding: 15px;
        box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.2);
        border-bottom-left-radius: 20%;
        border-bottom-right-radius: 20%;
    }

    .navbar-brand {
        color: #fff;
        font-size: 20px;
        font-weight: bold;
        text-decoration: none;
        margin-right: auto;
    }

    .navbar-nav {
        margin-left: auto;
        margin-right: auto;
    }

    .navbar-nav .nav-link {
        color: #fff;
        font-size: 26px;
        font-weight: bold;
        text-decoration: none;
        padding: 10px;
        transition: background-color 0.3s;
    }

    .navbar-nav .nav-link.active {
        background-color: #FFA500;
        border-radius: 5px;
    }

    .navbar-nav .nav-link:hover {
        background-color: #FFA500;
        border-radius: 5px;
    }

    .navbar-toggler {
        background-color: #fff;
    }

    .btn-outline-success {
        color: #28a745;
        border-color: #28a745;
        background-color: #fff;
    }

    .btn-outline-success:hover {
        background-color: #28a745;
    }

    /* Estilos para el contenido principal */
    body {
        margin-top: 70px;
        padding: 20px;
        background-color: #f8f9fa;
    }
</style>

<header>
    <!-- Barra de navegación fija -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top">
        <div class="container-fluid">
            <img src="images/ICO.png" width="80" height="80"><a class="navbar-brand" href="#"><h1>FRESHKITO</h1></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("inicio") ? "active" : "") %>" href="InicioControlador">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("productos") ? "active" : "") %>"
                            href="ProductoControlador">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("ingredientes") ? "active" : "") %>"
                            href="IngredientesControlador">Ingredientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("ventas") ? "active" : "") %>" href="VentasControlador">Ventas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link <%= (opcion.equals("clientes") ? "active" : "") %>" aria-current="page"
                            href="ClienteControlador">Clientes</a>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <a href="Logout" class="btn btn-outline-success"><i class="fas fa-sign-out-alt icon"></i> </a>
                </form>
            </div>
        </div>
    </nav>
</header>

<main>
    
</main>


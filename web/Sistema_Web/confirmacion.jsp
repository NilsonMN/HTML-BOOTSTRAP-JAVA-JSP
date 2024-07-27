<%@page import="Servlet.CarritoServlet.Producto"%>
<%@ page import="java.util.List" %>
<%
    List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carrito Ferre</title>
        <link rel="stylesheet" href="css/need.css">
        <link rel="stylesheet" href="css/footer.css">
        <link rel="stylesheet" href="css/carrito.css">
        <link rel="stylesheet" href="css/productos.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5/0cq4ri5O1U2pEOQH5a45GJZcbf2s9j9b4Tij+j"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <!--NAV-->
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-black">
                    <div class="container-fluid">
                        <a class="navbar-brand ms-5" href="inicio.jsp">
                            <i class="fa-solid fa-screwdriver-wrench" style="color: aliceblue; "></i>
                        </a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
                                aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon text-light"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarText">
                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                <li class="nav-item ms-5">
                                    <a class="nav-link active text-light" aria-current="page" href="inicio.jsp">
                                        <p>Inicio</p>
                                    </a>
                                </li>
                                <li class="nav-item ms-5">
                                    <a class="nav-link text-light" href="nosotros.jsp">
                                        <p>Nosotros</p>
                                    </a>
                                </li>
                                <li class="nav-item dropdown ms-5">
                                    <a class="nav-link dropdown-toggle text-light " href="productos.jsp" role="button"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        Productos
                                    </a>
                                    <ul class="dropdown-menu bg-black">
                                        <li><a class="dropdown-item text-light" href="productos.jsp#Driwall">
                                                <p>En Driwall</p>
                                            </a></li>
                                        <li><a class="dropdown-item text-light" href="productos.jsp#Albañileria">
                                                <p>En Albañileria</p>
                                            </a></li>
                                        <li><a class="dropdown-item text-light" href="productos.jsp#Soldadura">
                                                <p>En Soldadura</p>
                                            </a></li>
                                    </ul>
                                </li>
                                <li class="nav-item ms-5">
                                    <a class="nav-link text-light" href="servicios.jsp">
                                        <p>Servicios</p>
                                    </a>
                                </li>
                                <li class="nav-item ms-5">
                                    <a class="nav-link text-light" href="contacto.jsp">
                                        <p>Contacto</p>
                                    </a>
                                </li>
                                <%
                                    String nombreCliente = (String) session.getAttribute("nomC");
                                    int idC = (Integer) session.getAttribute("idC");
                                    if (nombreCliente == null) {
                                %>
                                <li class="nav-item ms-5">
                                    <a class="nav-link text-light" href="login.jsp">
                                        <p>Login</p>
                                    </a>
                                </li>
                                <%
                                } else {
                                %>
                                <li class="nav-item ms-5">
                                    <a class="nav-link text-light" href="#">
                                        <p><%= nombreCliente%>:<%= idC%></p>
                                    </a>
                                </li>
                                <li class="nav-item ms-5">
                                    <a class="nav-link text-light" href="<%= request.getContextPath()%>/ClienteServlet?accion=CerrarSesion">
                                        <p>Cerrar sesión</p>
                                    </a>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
            <!--FIN NAV-->
        </header>

        <main class="container mt-5">   
            <h1 class="mb-4">Carrito de Compras</h1>
            <%
                double total = 0;
                if (carrito != null && !carrito.isEmpty()) {
            %>
            <div class="productos-contenedor">
                <%
                    for (Producto producto : carrito) {
                        total += producto.getSubtotal();
                %>
                <div class="producto">
                    <img src="<%= producto.getImagen()%>" alt="<%= producto.getNombre()%>" class="producto-imagen">
                    <div class="producto-info">
                        <h2 class="producto-nombre"><%= producto.getNombre()%></h2>
                        <p class="producto-cantidad">Cantidad: <%= producto.getCantidad()%></p>
                        <p class="producto-precio">Precio unitario: S/. <%= producto.getPrecio()%></p>
                        <p class="producto-total">Total: S/. <%= producto.getSubtotal()%></p>
                    </div>
                </div>
                <%
                    }
                %>
            </div>

            <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center">
                        <div class="row">
                            <div class="col">
                                <label>Puede con: </label>
                            </div>
                            <div class="col">
                                <i class="fa-brands fa-cc-mastercard fa-xl" style="color: #ff0000;"></i>
                            </div>
                            <div class="col">
                                <i class="fa-solid fa-shop fa-xl" style="color: #603fc6;"></i>
                            </div>
                            <div class="col">
                                <i class="fa-brands fa-paypal fa-xl"></i>
                            </div>
                            <div class="col">
                                <form action="<%= request.getContextPath()%>/CompraServlet" method="post">
                                    <button id="compra" type="submit" class="btn btn-primary mb-3">
                                        Comprar
                                    </button>
                                </form>
                            </div>
                            <div class="col">
                                Total:  S/.<%= total%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%
                Boolean exitos = (Boolean) session.getAttribute("exito");
                if (exitos != null && exitos) {
            %>
            <!-- SUBMODAL -->
            <script>

                document.addEventListener("DOMContentLoaded", function () {
                    var btnMostrarAlert = document.getElementById("compra");
                    btnMostrarAlert.addEventListener("click", function () {
                        alert("Error en la compra :C Stock Insuficiente...");
                    });
                });

            </script>
            <% } else {%>
            <script>

                document.addEventListener("DOMContentLoaded", function () {
                    var btnMostrarAlert = document.getElementById("compra");
                    btnMostrarAlert.addEventListener("click", function () {
                        alert("Compra Exitosa!!!!!");
                    });
                });

            </script>
            <%}%>
            <%} else {%>
            <p>No hay productos en el carrito.</p>
            <% }%>
        </main>                   
        <footer>
            <div class="foot">
                <div class="contenedor">
                    <div class="footer-fila">
                        <div class="links">
                            <h4>Empresa</h4>
                            <ul>
                                <li><a href="Nosotros.php">Nosotros</a></li>
                                <li><a href="Servicios.php">Nuestros servicios</a></li>
                                <li><a href="inicio.php">Políticas de privacidad</a></li>
                                <li><a href="Registro.php">Regístrate</a></li>
                            </ul>
                        </div>
                        <div class="links">
                            <h4>Productos</h4>
                            <ul>
                                <li><a href="Productos.php">En driwall</a></li>
                                <li><a href="Productos.php">En Albañilería</a></li>
                                <li><a href="Productos.php">En Soldadura</a></li>
                            </ul>
                        </div>
                        <div class="links">
                            <h4>Ayuda</h4>
                            <ul>
                                <li><a href="Contactenos.php">Comentarios</a></li>
                                <li><a href="https://www.facebook.com/">Facebook</a></li>
                                <li><a href="https://web.whatsapp.com/">Whatsapp</a></li>
                                <li><a href="Contactenos.php">Contáctanos</a></li>
                            </ul>
                        </div>
                        <div class="links">
                            <h4>Redes Sociales</h4>
                            <div class="redes">
                                <a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                                <a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a>
                                <a href="https://twitter.com/home?lang=es" target="_blank"><i class="fab fa-twitter"></i></a>
                                <a href="https://web.whatsapp.com/" target="_blank"><i class="fab fa-whatsapp"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>

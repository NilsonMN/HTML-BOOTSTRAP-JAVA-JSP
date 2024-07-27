<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Entidad.Productos" %>
<%@ page import="Entidad.Categoria" %>
<%@ page import="Mantenimiento.ProductoDAO" %>
<%@ page import="Mantenimiento.CategoriaDAO" %>
<%@ page import="Servlet.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>InicioFerre</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/inicio.css">
    <link rel="stylesheet" href="css/need.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"   />

</head>

<body>
    <div class="container-fluid mx-auto p-0">
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
                                    <p><%= nombreCliente %></p>
                                </a>
                            </li>
                            <li class="nav-item ms-5">
                                <a class="nav-link text-light" href="<%= request.getContextPath() %>/ClienteServlet?accion=CerrarSesion">
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
        <!--CARRUSEL-->
        <div id="carouselExampleIndicators" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/Andamio.jpeg" class="d-block w-100 img-fluid" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img/construccion1.jpeg" class="d-block w-100 img-fluid" alt="...">
                </div>
                <div class="carousel-item">
                    <img src="img/Grupo_Construccion.jpeg" class="d-block w-100 img-fluid" alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!--FIN CARRUSEL-->
        <!--CONTENIDO-->
        <div class="container-fluid mx-auto">
            <div class="row">
                <div class="col-12">
                    <h1 class="fondot">INICIO</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="badge text-wrap text-center">
                        <p class="reducir-texto fs-3 fw-semibold lh-lg colorp mt-5">"Somos expertos en la confección de
                            estructuras metálicas, drywall y trabajos de albañileria. En Martillito, nos enorgullece
                            ofrecer soluciones de alta calidad y diseño innovador para tus proyectos de construcción."
                        </p>
                        <button type="button" class="buttonI">Ver más...</button>
                    </div>
                </div>
            </div>
            <br><br><br>
            <br>
            <div class="row">
                <div class="col-12">
                    <h1 class="fondot">Misión</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="badge text-wrap text-center reducir-texto">
                        <p class=" fs-3 fw-semibold lh-lg colorp mt-5">"En Martillito, nuestra misión es proporcionar a
                            nuestros clientes la mejor calidad en la confección de estructuras metálicas, drywall y
                            trabajos de albañileria. A través de nuestra página web nos esforzamos por ofrecer a los
                            visitantes una experiencia informativa y atractiva, donde puedan descubrir nuestros
                            productos y servicios de vanguardia."</p>
                        <button type="button" class="buttonI">Ver más...</button>
                    </div>
                </div>
            </div>
            <br><br><br>
            <br>
            <div class="row">
                <div class="col-12">
                    <h1 class="fondot">Visión</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="badge text-wrap text-center reducir-texto">
                        <p class=" fs-3 fw-semibold lh-lg colorp mt-5">"En Martillito, nos esforzamos por ser el destino
                            de confianza para todos los proyectos de construcción y mejoras para el hogar. Somos más que
                            una ferretería; somos un centro de inspiración y soluciones. Nuestra visión es ser el socio
                            preferido, ofreciendo productos de calidad, asesoramiento experto y un servicio excepcional
                            para convertir ideas en realidad. Juntos, construimos un futuro más sólido, proyecto a
                            proyecto."</p>
                        <button type="button" class="buttonI">Ver más...</button>
                    </div>
                </div>
            </div>
            <br><br><br>
            <br>
            <!--TEXTO DENTRO DE IMAGEN-->
            <div class="container-fluid w-100 text-center">
                <img class="img-fluid mx-auto" src="img/conocenos_8.jpg">
                <div class="rounded-5 box w-50 align-middle mx-auto">
                    <h3 class="fs-1 fw-bold mx-5">BIENVENIDO</h3>
                    <h4 class="fs-6 mx-5">Este es el portal de Martillito. Un espacio dinámico y accesible diseñado para
                        acercarnos
                        más a todos los segmentos y consumidores con los que trabajamos día a día. Aquí encontrarás toda
                        la
                        información que necesitas acerca de nuestros productos y servicios.<br>
                        Ponemos toda nuestra experiencia a tu servicio y te invitamos a conocer nuestra página.</h4>
                </div>
            </div>
            <!--FIN TEXTDENTRO-->
        </div>
        <!--FIN CONTENIDO-->
        <!--FOOTER-->
        <footer>
            <div class="foot">
                <div>
                    <div class="contenedor">
                        <div class="footer-fila">
                            <div class="links">
                                <h4>Empresa</h4>
                                <ul>
                                    <li><a href="Nosotros.php">Nosotros</a></li>
                                    <li><a href="Servicios.php">Nuestros servicios</a></li>
                                    <li><a href="inicio.php">Politicas de privacidad</a></li>
                                    <li><a href="Registro.php">Registrate</a></li>
                                </ul>
                            </div>
                            <div class="links">
                                <h4>Productos</h4>
                                <ul>
                                    <li><a href="Productos.php">En driwall</a></li>
                                    <li><a href="Productos.php">En Albañileria</a></li>
                                    <li><a href="Productos.php">En Soldadura</a></li>
                                </ul>
                            </div>
                            <div class="links">
                                <h4>Ayuda</h4>
                                <ul>
                                    <li><a href="Contactenos.php">Comentarios</a></li>
                                    <li><a href="https://www.facebook.com/">Facebook</a></li>
                                    <li><a href="https://web.whatsapp.com/">Whatsapp</a></li>
                                    <li><a href="Contactenos.php">Contactanos</a></li>
                                </ul>
                            </div>
                            <div class="links">
                                <h4>Redes Sociales</h4>
                                <div class="redes">
                                    <a href="https://www.facebook.com/" target="_blank"><i
                                            class="fab fa-facebook-f"></i></a>
                                    <a href="https://www.instagram.com/" target="_blank"><i
                                            class="fab fa-instagram"></i></a>
                                    <a href="https://twitter.com/home?lang=es" target="_blank"><i
                                            class="fab fa-twitter"></i></a>
                                    <a href="https://web.whatsapp.com/" target="_blank"><i
                                            class="fab fa-whatsapp"></i></a>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!--FIN FOOTER-->
    </div>
</body>

</html>
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
    <title>NosotrosFerre</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/need.css">
    <link rel="stylesheet" href="css/inicio.css">
    <link rel="stylesheet" href="css/nosotros.css">
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
        <!--IMAGEN-->
        <!--FIN IMAGEN-->
        <!--CONTENIDO-->
        <div class="container-fluid mx-auto text-center">
            <div class="row">
                <div class="col-12">
                    <h1 class="fondot fw-bold">Sobre Nosotros</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <div class="badge text-wrap text-center">
                        <p class="reducir-texto fs-5 fw-normal lh-lg colorp mt-5">¡Bienvenidos a nuestra web! En
                            Martillito, tenemos una historia de excelencia en la industria de la construcción. Fundada en
                            2023, hemos trabajado incansablemente para convertirnos en líderes en la confección de
                            estructuras metálicas, drywall y trabajos de albañileria.<br><br>
                            Nuestra pasión por la construcción y nuestro compromiso con la calidad son los pilares que
                            sustentan todo lo que hacemos. En Martillito, no solo construimos edificios, creamos hogares y
                            espacios que inspiran. Nuestro equipo de profesionales altamente capacitados y
                            experimentados se esfuerza constantemente por superar las expectativas de nuestros clientes.
                            Estamos dedicados a la innovación, la sostenibilidad y la seguridad en cada proyecto que
                            emprendemos, y nos enorgullece ser la elección preferida de aquellos que buscan soluciones
                            de construcción de primer nivel. ¡Descubra más sobre nuestra empresa y lo que podemos hacer
                            por usted en las páginas siguientes!</p>
                        <button type="button" class="buttonI">Ver más...</button>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
            <br><br><br>
            <br>
            <div class="row">
                <div class="col-12">
                    <h1 class="fondot fw-bold">Nuestro Equipo</h1>
                </div>
                <div class="col-12">
                    <h2 class="fs-1 fw-normal" style="color:black">Conoce a nuestro equipo</h1>
                </div>
                <br><br><br><br>
                <div class="col-12 mt-5">
                    <h2 class="fs-2 fw-normal" style="color:black">En Driwall</h1><br><br>
                </div>
                <!--card-->
                <div class="w-80 d-flex flex-wrap">
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Maestro Sideral Carrion</p>Maestro con experiencia de 7 años con
                            estudios tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Sr. Pablo Quispe</p>Chalan con experiencia de 5 años con estudios
                            tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Sr. Eduardo Campos</p>Chalan con experiencia de 5 años con estudios
                            tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                </div>
                <br><br><br><br>
                <div class="col-12 mt-5">
                    <h2 class="fs-2 fw-normal" style="color:black">En Albañileria</h1><br><br>
                </div>
                <!--card-->
                <div class="w-80 d-flex flex-wrap">
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Maestro Sideral Carrion</p>Maestro con experiencia de 7 años con
                            estudios tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Sr. Pablo Quispe</p>Chalan con experiencia de 5 años con estudios
                            tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Sr. Eduardo Campos</p>Chalan con experiencia de 5 años con estudios
                            tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                </div>
                <br><br><br><br>
                <div class="col-12 mt-5">
                    <h2 class="fs-2 fw-normal" style="color:black">En Soldadura</h1><br><br>
                </div>
                <!--card-->
                <div class="w-80 d-flex flex-wrap">
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Maestro Sideral Carrion</p>Maestro con experiencia de 7 años con
                            estudios tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Sr. Pablo Quispe</p>Chalan con experiencia de 5 años con estudios
                            tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                    <div class="card mx-auto shadow-lg rounded-5" style="width: 20rem;">
                        <img src="img/pj/driwall1.png" class="card-img-top" alt="...">
                        <div class="card-body">
                            <p class="card-text">
                            <p class="fw-semibold">Sr. Eduardo Campos</p>Chalan con experiencia de 5 años con estudios
                            tecnicos en instituto, especialista en estructurado de driwall.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--FIN CONTENIDO-->
        <!--FOOTER-->
        <footer class="mt-5">
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
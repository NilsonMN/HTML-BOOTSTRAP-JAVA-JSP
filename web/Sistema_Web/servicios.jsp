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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/need.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/servicios.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"   />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
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
        <!--contenido-->
        <div class="fondil">
            <div class="nav-services">
                <h2>Servicios</h2>
                <table style="border: rgb(85, 122, 131);">
                    <tr>
                        <td colspan="3" width="2000"><h2 style="color: #c93900;"><strong><center>CON VARIEDAD DE SERVICIOS EN NUESTRAS 3 RAMAS PRINCIPALES!!!</center></strong></h2></td>
                    </tr>
                    <tr style="background-color: rgba(153, 153, 153, 0.514);">
        
                        <td  width="2000"><h2><strong><a href="#Driwall" style="color: rgb(255, 255, 255);"><center>En Driwall</center></a></strong></h2></td>
                        <td  width="2000"><h2><strong><a href="#Albañil" style="color: rgb(255, 255, 255);"><center>En Albañileria</center></a></strong></h2></td>
                        <td  width="2000"><h2><strong><a href="#Soldadura" style="color: rgb(255, 255, 255);"><center>En Soldadura</center></a> </strong></h2></td>
                    </tr>
                </table>
            </div>
            <div class="message">
                <h2>Bienvenido a nuestra página de servicios, donde ofrecemos una amplia gama de soluciones para tus 
                    necesidades de construcción y reparación. En Bermetss, nos enorgullece brindar servicios de alta
                     calidad y profesionales</h2>
            </div>
            <div class="services">
                <section id="Albañil">
                <div class="alba">
                    <div class="imagena">
                        <img src="img/pj/GrupoAlbañil.jpg">
                    </div>
                    <div class="textos">
                        <h2>Servicio de Albañilería</h2>
                        <h4>Nuestro equipo de albañiles altamente capacitados está listo para ayudarte en la 
                            construcción y renovación de estructuras de albañilería. Ya sea que estés buscando 
                            crear una hermosa pared de ladrillos, realizar reparaciones en tu hogar o llevar a 
                            cabo un proyecto de construcción más grande, podemos encargarnos de cada detalle. 
                            Utilizamos materiales de primera calidad y técnicas de construcción modernas para 
                            garantizar resultados duraderos y estéticamente atractivos.</h4>
                    </div>    
                </div>
                </section>
                <section id="Driwall">
                <div class="driwall">
                    <div class="imagend">
                        <img src="img/pj/GrupoDriwall.jpg">
                    </div>
                    <div class="textos">
                        <h2>Servicio de Drywall</h2>
                        <h4>El Drywall, también conocido como tablaroca o yeso laminado, es una solución versátil
                             y eficiente para la creación de particiones interiores, techos y acabados en interiores.
                              Nuestro equipo de expertos en Drywall se especializa en la instalación de paneles de yeso 
                              de alta calidad y la creación de espacios interiores funcionales y atractivos. 
                              Ya sea una renovación en casa o un proyecto comercial, estamos aquí para satisfacer tus necesidades de 
                              Drywall con precisión y eficiencia.</h4>
                    </div>  
                </div>
                </section>
                <section id="Soldadura">
                <div class="solda">
                    <div class="imagens">
                        <img src="img/pj/GrupoSoldador.jpg">
                    </div>
                    <div class="textos">
                        <h2>Servicio de Soldadura</h2>
                    <h4>La soldadura es una habilidad crucial en la fabricación y reparación de estructuras metálicas. 
                        En Bermetss, ofrecemos servicios de soldadura profesionales para abordar una variedad de proyectos, 
                        desde la construcción de estructuras de acero hasta la reparación de equipos industriales. 
                        Nuestros soldadores certificados utilizan equipos de última generación y técnicas avanzadas 
                        para garantizar que tus proyectos se realicen con la más alta calidad y seguridad.</h4>
                    </div>
                </div>
                </section>
            </div>
        </div>

        <!--FINcontenido-->
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
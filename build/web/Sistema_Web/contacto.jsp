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
    <title>Document</title>
    <link rel="stylesheet" href="css/need.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Contact.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</head>
<body>
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
    <!--CONTENIDO-->
    <div class="contenido">
        <div class="slogan">
            <h2>CONTÁCTANOS</h2>
            <h3>Escribenos y ponte en contacto por cualquier medio</h3>
        </div>
        <div class="interfaz">
            <div class="imagen">
                <h2>Encuentranos tambien en...</h2>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d956.8308999070591!2d-71.54349142433496!3d-16.408383610007032!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x91424b53075c4a4d%3A0xa6e18a5d414fd5f6!2sUTP%20Av.%20Parra!5e0!3m2!1ses-419!2spe!4v1699451839408!5m2!1ses-419!2spe" width="800" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
                <div class="interfazregis">
                    <div class="centrarform">
                        <div class="titulo">
                            <h2>Escribenos</h2>
                            <h3>Por favor llene el siguiente formulario</h3>
                        </div>
                        <form method="post" action="#">
                            <div class="formulario">
                                <div class="hijos">
                                    <input type="text" required>
                                    <label>Ingrese su Nombre*</label>
                                </div>
                                <div class="hijos">
                                    <input type="text" required>
                                    <label id="segundo">Ingrese su Apellido*</label>
                                </div>
                            </div>
                            <div class="formulario">
                                <input type="email" required>
                                <label>Ingrese su Correo*</label>
                            </div>
                            <div class="formulario">
                                <input type="tel" required>
                                <label>Ingrese su Telefono*</label>
                            </div>
                            <div class="formulario">
                                <select id="select_box">
                                    <option value="">Selecciona el tipo de consulta*</option>
                                    <option value="1">Asistencia técnica de productos</option>
                                    <option value="2">Cotización de productos para exportación</option>
                                    <option value="3">Quiero ser proveedor</option>
                                    <option value="4">Otras consultas</option>
                                </select>
                            </div>
                            <div class="formulario">
                                <input type="text" id="textarea" required>
                                <label>Escriba su comentario*</label>
                            </div>
                            <div class="boton-login">
                                <button>Enviar</button>
                            </div>
                        </form>
                    </div>
                </div>
        </div>
    </div>
    <!--FINCONTENIDO-->
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
</body>
</html>
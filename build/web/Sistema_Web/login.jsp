<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="Servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Login</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' href='css/login.css'>
        <script src="js/ocultar.js" defer></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer"   />
    </head>
    <body>
        <div class="contenido" >
            <div class="fondo">
                <!--Login-->
                <div class="interfaz" id="login">
                    <div class="centrarform">
                        <div class="logo">
                            <a href="inicio.jsp" class="my-5 py-5"><i class="fa-solid fa-screwdriver-wrench fa-2xl"></i></a>
                        </div>
                        <div class="titulo">
                            <h2>Bienvenido</h2>
                        </div>
                        <form method="post" action="<%= request.getContextPath()%>/ClienteServlet">
                            <div class="formulario">
                                <input type="text" name="user" required>
                                <label>Ingrese su Correo</label>
                            </div>
                            <div class="formulario">
                                <input type="password" name="pass" required>
                                <label>Ingrese su Constraseña</label>
                            </div>
                            <div class="boton-login">
                                <input type="submit" name="accion" value="Ingresar">
                            </div>
                        </form>
                    </div>
                    <div class="derechos">
                        <label>2024 Derechos Reservados</label><br>
                        <label>Martillito</label>
                    </div>
                </div>
                <!--FinLogin-->
                <!--Register-->
                <div class="interfazregis" id="registro">
                    <div class="centrarform">
                        <div class="col-lg-12 bg-indigo text-white">
                            <form method="post" action="<%= request.getContextPath()%>/AgregarClienteServlet" onsubmit="return validateForm()">
                                <div class="p-5">
                                    <h3 class="fw-normal mb-5">Registrar</h3>
                                    <input type="hidden" id="clienteId" name="clienteId">
                                    <div class="mb-4 pb-2">
                                        <div data-mdb-input-init class="form-outline form-white">
                                            <input type="text" id="nombreClienteAct" name="nombreCliente" class="form-control form-control-lg" />
                                            <label class="form-label" for="nombreClienteAct">Nombre del Cliente</label>
                                        </div>
                                    </div>

                                    <div class="mb-4 pb-2">
                                        <div data-mdb-input-init class="form-outline form-white">
                                            <input type="text" id="apellidoClienteAct" name="apellidoCliente" class="form-control form-control-lg" />
                                            <label class="form-label" for="apellidoClienteAct">Apellido del Cliente</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5 mb-4 pb-2">

                                            <div data-mdb-input-init class="form-outline form-white">
                                                <input type="email" id="correoClienteAct" name="correoCliente" class="form-control form-control-lg" />
                                                <label class="form-label" for="correoClienteAct">Correo:</label>
                                            </div>

                                        </div>
                                        <div class="col-md-7 mb-4 pb-2">

                                            <div data-mdb-input-init class="form-outline form-white">
                                                <input type="text" id="telefonoClienteAct" name="telefonoCliente" class="form-control form-control-lg" />
                                                <label class="form-label" for="telefonoClienteAct">Telefono</label>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="mb-4 pb-2">
                                        <div data-mdb-input-init class="form-outline form-white">
                                            <input type="text" id="direccionClienteAct" name="direccionCliente" class="form-control form-control-lg" />
                                            <label class="form-label" for="direccionClienteAct">Direccion</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-5 mb-4 pb-2">

                                            <div data-mdb-input-init class="form-outline form-white">
                                                <input type="text" id="dniClienteAct" name="dniCliente" class="form-control form-control-lg" />
                                                <label class="form-label" for="dniClienteAct">DNI</label>
                                            </div>

                                        </div>
                                        <div class="col-md-7 mb-4 pb-2">

                                            <div data-mdb-input-init class="form-outline form-white">
                                                <input type="password" id="contraseñaClienteAct" name="contrasenaCliente" class="form-control form-control-lg" />
                                                <label class="form-label" for="contraseñaClienteAct">Phone Number</label>
                                            </div>

                                        </div>
                                    </div>
                                    <button  type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-light btn-lg"
                                             data-mdb-ripple-color="dark">Registrar</button>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!--FinRegister-->
            </div>
        </div>
        <script>
            function validateForm(form) {
                var telefono = form.telefonoCliente ? form.telefonoCliente.value : form.telefonoClienteAct.value;
                if (telefono.length !== 9) {
                    alert("El teléfono debe contener 9 dígitos.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>

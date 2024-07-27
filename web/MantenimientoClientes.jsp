<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Entidad.Cliente" %>
<%@ page import="Mantenimiento.ClienteDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes - Ferretería</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/styles.css" rel="stylesheet">
</head>
<style>
    .active {
        background-color: #007bff !important;
        color: white !important;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row">

        <div class="col-md-2 bg-light sidebar">
            <h3 class="my-4">Ferretería</h3>
            <div class="list-group list-group-flush">
                <a href="MantenimientoProductos.jsp" class="list-group-item list-group-item-action bg-light">Productos</a>
                <a href="MantenimientoClientes.jsp" class="list-group-item list-group-item-action bg-light active">Clientes</a>
                <a href="ReporteMes.jsp" class="list-group-item list-group-item-action bg-light">Reporte Mensual</a>
                <a href="Reportes.jsp" class="list-group-item list-group-item-action bg-light">Reporte Diario</a>
                <a href="ReporteClientes.jsp" class="list-group-item list-group-item-action bg-light">Reporte Cliente</a>
                <a href="InicioSesión.jsp" class="list-group-item list-group-item-action bg-light">Sign Out</a>
            </div>
        </div>

        <div class="col-md-10">
            <h2 class="my-4">Lista de Clientes</h2>
            <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger" role="alert">
                Ha ocurrido un error.
            </div>
            <% } %>
            <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#nuevoClienteModal">Nuevo Cliente</button>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Correo</th>
                    <th>Contraseña</th>
                    <th>Telefono</th>
                    <th>Direccion</th>
                    <th>DNI</th>
                    <th>Acciones</th>
                    
                </tr>
                </thead>
                <tbody>
                <%
                    ClienteDAO clienteDAO = new ClienteDAO();
                    List<Cliente> clientes = clienteDAO.listarClientes();
                    for (Cliente cliente : clientes) {
                %>
                <tr>
                    <td><%= cliente.getIdCliente() %></td>
                    <td><%= cliente.getNombre() %></td>
                    <td><%= cliente.getApellido() %></td>
                    <td><%= cliente.getCorreo() %></td>
                    <td>******</td> 
                    <td><%= cliente.getTelefono() %></td>
                    <td><%= cliente.getDireccion() %></td>
                    <td><%= cliente.getDNI() %></td>
                    <td>
                        <button class="btn btn-warning btn-sm">Actualizar</button>
                        <button class="btn btn-danger btn-sm delete-btn" data-toggle="modal" data-target="#eliminarClienteModal" data-id="<%= cliente.getIdCliente() %>">Eliminar</button>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="nuevoClienteModal" tabindex="-1" role="dialog" aria-labelledby="nuevoClienteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="nuevoClienteModalLabel">Nuevo Cliente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="AgregarClienteServlet" onsubmit="return validateForm()">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombreCliente">Nombre del Cliente</label>
                        <input type="text" class="form-control" id="nombreCliente" name="nombreCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="apellidoCliente">Apellido</label>
                        <input type="text" class="form-control" id="apellidoCliente" name="apellidoCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="correoCliente">Correo</label>
                        <input type="email" class="form-control" id="correoCliente" name="correoCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="contrasenaCliente">Contraseña</label>
                        <input type="password" class="form-control" id="contrasenaCliente" name="contrasenaCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="telefonoCliente">Telefono</label>
                        <input type="text" class="form-control" id="telefonoCliente" name="telefonoCliente" pattern="\d{9}" title="Debe contener 9 dígitos" required>
                    </div>
                    <div class="form-group">
                        <label for="direccionCliente">Direccion</label>
                        <input type="text" class="form-control" id="direccionCliente" name="direccionCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="dniCliente">DNI</label>
                        <input type="text" class="form-control" id="dniCliente" name="dniCliente" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="actualizarClienteModal" tabindex="-1" role="dialog" aria-labelledby="actualizarClienteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="actualizarClienteModalLabel">Actualizar Cliente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="ActualizarClienteServlet" onsubmit="return validateForm()">
                <div class="modal-body">
                    <input type="hidden" id="clienteId" name="clienteId">
                    <div class="form-group">
                        <label for="nombreClienteAct">Nombre del Cliente</label>
                        <input type="text" class="form-control" id="nombreClienteAct" name="nombreCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="apellidoClienteAct">Apellido</label>
                        <input type="text" class="form-control" id="apellidoClienteAct" name="apellidoCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="correoClienteAct">Correo</label>
                        <input type="email" class="form-control" id="correoClienteAct" name="correoCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="contraseñaClienteAct">Contraseña</label>
                        <input type="password" class="form-control" id="contraseñaClienteAct" name="contrasenaCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="telefonoClienteAct">Teléfono</label>
                        <input type="text" class="form-control" id="telefonoClienteAct" name="telefonoCliente" pattern="\d{9}" title="Debe contener 9 dígitos" required>
                    </div>
                    <div class="form-group">
                        <label for="direccionClienteAct">Direccion</label>
                        <input type="text" class="form-control" id="direccionClienteAct" name="direccionCliente" required>
                    </div>
                    <div class="form-group">
                        <label for="dniClienteAct">DNI</label>
                        <input type="text" class="form-control" id="dniClienteAct" name="dniCliente" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>
                
<div class="modal fade" id="eliminarClienteModal" tabindex="-1" role="dialog" aria-labelledby="eliminarClienteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eliminarClienteModalLabel">Eliminar Cliente</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="EliminarClienteServlet">
                <div class="modal-body">
                    <input type="hidden" id="clienteIdEliminar" name="clienteId">
                    <p>¿Está seguro de que desea eliminar a este cliente?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function() {
        $('.btn-warning').on('click', function() {
            var row = $(this).closest('tr');
            var id = row.find('td:eq(0)').text();
            var nombre = row.find('td:eq(1)').text();
            var apellido = row.find('td:eq(2)').text();
            var correo = row.find('td:eq(3)').text();
            var contrasena = row.find('td:eq(4)').text();
            var telefono = row.find('td:eq(5)').text();
            var direccion = row.find('td:eq(6)').text();
            var DNI = row.find('td:eq(7)').text();

            $('#clienteId').val(id);
            $('#nombreClienteAct').val(nombre);
            $('#apellidoClienteAct').val(apellido);
            $('#correoClienteAct').val(correo);
            $('#contraseñaClienteAct').val(contrasena);
            $('#telefonoClienteAct').val(telefono);
            $('#direccionClienteAct').val(direccion);
            $('#dniClienteAct').val(DNI);

            $('#actualizarClienteModal').modal('show');
        });
        
        $('.delete-btn').on('click', function() {
            var id = $(this).data('id');
            $('#clienteIdEliminar').val(id);
            $('#eliminarClienteModal').modal('show');
        });
    });

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
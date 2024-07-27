<%@page import="Entidad.DetalleVenta"%>
<%@page import="Entidad.Venta"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Entidad.Cliente" %>
<%@ page import="Mantenimiento.ClienteDAO" %>
<%@ page import="Mantenimiento.VentaDAO" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Clientes - Ferretería</title>
   
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link href="../css/styles.css" rel="stylesheet">
    <style>
       
        .active {
            background-color: #007bff !important;
            color: white !important;
        }
    
    
        .summary-card {
            border-radius: 15px;
            padding: 20px;
            margin: 10px;
            color: #fff;
            text-align: center;
        }
        .bg-red { background-color: #FF6B6B; }
        .bg-orange { background-color: #FFA26B; }
        .bg-green { background-color: #6BCB77; }
        .bg-purple { background-color: #A26BFF; }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
       
        <div class="col-md-2 bg-light sidebar">
            <h3 class="my-4">Ferretería</h3>
            <div class="list-group list-group-flush">
                <a href="MantenimientoProductos.jsp" class="list-group-item list-group-item-action bg-light">Productos</a>
                <a href="MantenimientoClientes.jsp" class="list-group-item list-group-item-action bg-light">Clientes</a>
                <a href="ReporteMes.jsp" class="list-group-item list-group-item-action bg-light">Reporte Mensual</a>
                <a href="Reportes.jsp" class="list-group-item list-group-item-action bg-light ">Reporte Diario</a>
                <a href="ReporteClientes.jsp" class="list-group-item list-group-item-action bg-light active">Reporte Cliente</a>
                
                <a href="InicioSesión.jsp" class="list-group-item list-group-item-action bg-light">Sign Out</a>
            </div>
        </div>

        <div class="col-md-10">
            <h2 class="my-4">Reporte de Clientes</h2>
            <form method="post" action="ReporteClienteServelet">
                <div class="form-group">
                    <label for="dato">Buscar Cliente</label>
                    <input type="text" class="form-control" id="dato" name="dato" placeholder="Nombre o DNI" required>
                </div>
                <button type="submit" class="btn btn-primary">Generar Reporte</button>
            </form>
            <div class="col-md-10">
                <h2 class="my-4">Lista de Clientes</h2>
                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger" role="alert">
                    Ha ocurrido un error.
                </div>
                <% } %>
                
                <table class="table table-hover mt-2">
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
                            
                            List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
                            if(clientes != null){
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
                            <form action="DetallesVentaClienteServlet" method="post">
                                <input type="hidden" name="id" value="<%= cliente.getIdCliente() %>">
                                <button type="submit" class="btn btn-warning">Detalles</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <div class="mt-4">
                <h3>Información del Cliente</h3>
                <% Cliente objcliente = (Cliente) request.getAttribute("objCliente");
                   if (objcliente != null) {
                %>
                <div class="row">
                    <div class="col-md-3">
                        <div class="summary-card bg-purple">
                            <h4> <%= objcliente.getNombre() %> </h4>
                            <p>Nombre Completo</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="summary-card bg-green">
                            <h4><%= objcliente.getCorreo() %></h4>
                            <p>Correo Electrónico</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="summary-card bg-orange">
                            <h4><%= objcliente.getTelefono() %></h4>
                            <p>Teléfono</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="summary-card bg-red">
                            <h4><%= objcliente.getDNI() %></h4>
                            <p>DNI</p>
                        </div>
                    </div>
                </div>
                <%
                    }else{
                %>
                <div class="row">
                    <div class="col-md-3">
                        <div class="summary-card bg-purple">
                            <h4>-</h4>
                            <p>Nombre Completo</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="summary-card bg-green">
                            <h4>-</h4>
                            <p>Correo Electrónico</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="summary-card bg-orange">
                            <h4>-</h4>
                            <p>Teléfono</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="summary-card bg-red">
                            <h4>-</h4>
                            <p>DNI</p>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
                <h3 class="mt-4">Historial de Compras</h3>
                <table class="table table-hover mt-2">
                    <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio/Unidad</th>
                        <th>Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<Venta> ventas = (List<Venta>) request.getAttribute("ventas");
                        if (ventas != null) {
                            for (Venta venta : ventas) {
                                List<DetalleVenta> detalles = venta.getDetalles();
                                for (DetalleVenta detalle : detalles) {
                    %>
                    <tr>
                        <td>S/.<%= venta.getFechaVenta() %></td>
                        <td><%= detalle.getNombreProducto()%></td> 
                        <td><%= detalle.getCantidad()    %></td>
                        <td><%= detalle.getPrecioVenta()%> </td>
                        <td>S/.<%= detalle.getSubtotal() %></td>
                    </tr>
                    <%
                                }
                            }
                        }
                    %>
                    </tbody>
                </table>
      
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

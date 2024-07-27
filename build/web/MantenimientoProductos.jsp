<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Entidad.Productos" %>
<%@ page import="Entidad.Categoria" %>
<%@ page import="Mantenimiento.ProductoDAO" %>
<%@ page import="Mantenimiento.CategoriaDAO" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos - Ferretería</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .active {
            background-color: #007bff !important;
            color: white !important;
        }
        .product-img {
            width: 50px;
            height: 50px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 bg-light sidebar">
            <h3 class="my-4">Ferretería</h3>
            <div class="list-group list-group-flush">
                <a href="MantenimientoProductos.jsp" class="list-group-item list-group-item-action bg-light active">Productos</a>
                <a href="MantenimientoClientes.jsp" class="list-group-item list-group-item-action bg-light">Clientes</a>
                <a href="ReporteMes.jsp" class="list-group-item list-group-item-action bg-light">Reporte Mensual</a>
                <a href="Reportes.jsp" class="list-group-item list-group-item-action bg-light">Reporte Diario</a>
                <a href="ReporteClientes.jsp" class="list-group-item list-group-item-action bg-light">Reporte Cliente</a>
                <a href="InicioSesión.jsp" class="list-group-item list-group-item-action bg-light">Sign Out</a>
            </div>
        </div>

        <div class="col-md-10">
            <h2 class="my-4">Lista de Productos</h2>
            <% if (request.getParameter("error") != null) { %>
            <div class="alert alert-danger" role="alert">
                Ha ocurrido un error al agregar el producto.
            </div>
            <% } %>
            <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#nuevoProductoModal">Nuevo Producto</button>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Producto</th>
                    <th>Marca</th>
                    <th>Stock</th>
                    <th>Precio</th>
                    <th>Descripcion</th>
                    <th>Categoría</th>
                    <th>Imagen</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <% 
                    List<Productos> productos = ProductoDAO.listarProductos();
                    List<Categoria> categorias = CategoriaDAO.listarCategorias();
                    for (Productos producto : productos) {
                %>
                <tr data-categoria-id="<%= producto.getIdCategoria() %>">
                    <td><%= producto.getIdProducto() %></td>
                    <td><%= producto.getNombrePro() %></td>
                    <td><%= producto.getMarca() %></td>
                    <td><%= producto.getStock() %></td>
                    <td><%= producto.getPrecio() %></td>
                    <td><%= producto.getDescripcion() %></td>
                    <td><%= CategoriaDAO.obtenerNombreCategoria(producto.getIdCategoria()) %></td>
                    <td><img src="<%= producto.getImagen() %>" alt="Imagen del producto" width="100"></td>
                    <td>
                       <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#actualizarProductoModal" data-id="<%= producto.getIdProducto() %>">Actualizar</button>
                        <button class="btn btn-danger btn-sm delete-btn" data-toggle="modal" data-target="#eliminarProductoModal" data-id="<%= producto.getIdProducto() %>">Eliminar</button>
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


<div class="modal fade" id="nuevoProductoModal" tabindex="-1" role="dialog" aria-labelledby="nuevoProductoModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="nuevoProductoModalLabel">Nuevo Producto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="AgregarProductoServlet " onsubmit="return validateForm()" >
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombreProducto">Nombre del Producto</label>
                        <input type="text" class="form-control" id="nombreProducto" name="nombreProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="marcaProducto">Marca</label>
                        <input type="text" class="form-control" id="marcaProducto" name="marcaProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="stockProducto">Stock</label>
                        <input type="number" class="form-control" id="stockProducto" name="stockProducto" required>
                    </div>
                   <div class="form-group">
                    <label for="precioProducto">Precio</label>
                     <input type="number" step="0.01" class="form-control" id="precioProducto" name="precioProducto" required>
                     </div>
                    <div class="form-group">
                        <label for="descProducto">Descripcion</label>
                        <input type="text" class="form-control" id="descProducto" name="descProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="categoriaProducto">Categoría</label>
                        <select class="form-control" id="categoriaProducto" name="categoriaProducto" required>
                            <% for (Categoria categoria : categorias) { %>
                                <option value="<%= categoria.getIdCategoria() %>"><%= categoria.getNombreCat() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="imagenProducto">URL de la Imagen del Producto</label>
                        <input type="text" class="form-control" id="imagenProducto" name="imagenProducto" required>
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


<div class="modal fade" id="actualizarProductoModal" tabindex="-1" role="dialog" aria-labelledby="actualizarProductoModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="actualizarProductoModalLabel">Actualizar Producto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="ActualizarProductoServlet" onsubmit="return validateForm()">
                <div class="modal-body">
                    <input type="hidden" id="productoIdActualizar" name="productoId">
                    <div class="form-group">
                        <label for="nombreProductoAct">Nombre del Producto</label>
                        <input type="text" class="form-control" id="nombreProductoAct" name="nombreProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="marcaProductoAct">Marca</label>
                        <input type="text" class="form-control" id="marcaProductoAct" name="marcaProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="stockProductoAct">Stock</label>
                        <input type="number" class="form-control" id="stockProductoAct" name="stockProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="precioProductoAct">Precio</label>
                        <input type="text" class="form-control" id="precioProductoAct" name="precioProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="descProductoAct">Descripcion</label>
                        <input type="text" class="form-control" id="descProductoAct" name="descProducto" required>
                    </div>
                    <div class="form-group">
                        <label for="categoriaProductoAct">Categoría</label>
                        <select class="form-control" id="categoriaProductoAct" name="categoriaProducto" required>
                            <% for (Categoria categoria : categorias) { %>
                                <option value="<%= categoria.getIdCategoria() %>"><%= categoria.getNombreCat() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="imagenProductoAct">URL de la Imagen del Producto</label>
                        <input type="text" class="form-control" id="imagenProductoAct" name="imagenProducto" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="modal fade" id="eliminarProductoModal" tabindex="-1" role="dialog" aria-labelledby="eliminarProductoModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eliminarProductoModalLabel">Eliminar Producto</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form method="post" action="EliminarProductoServlet">
            <div class="modal-body">
                <input type="hidden" id="productoIdEliminar" name="productoId">
                <p>¿Estás seguro de que deseas eliminar este producto?</p>
            </div>
            <div class="modal-footer">
                    
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                
            </div>
                </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    
    $('#actualizarProductoModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var row = button.closest('tr');
        var nombre = row.find('td:eq(1)').text();
        var marca = row.find('td:eq(2)').text();
        var stock = row.find('td:eq(3)').text();
        var precio = row.find('td:eq(4)').text();
        var descripcion = row.find('td:eq(5)').text();
        var categoria = row.data('categoria-id');
        var imagen = row.find('img').attr('src');

        var modal = $(this);
        modal.find('#productoIdActualizar').val(id);
        modal.find('#nombreProductoAct').val(nombre);
        modal.find('#marcaProductoAct').val(marca);
        modal.find('#stockProductoAct').val(stock);
        modal.find('#precioProductoAct').val(precio);
        modal.find('#descProductoAct').val(descripcion);
        modal.find('#categoriaProductoAct').val(categoria);
        modal.find('#imagenProductoAct').val(imagen);
        
      
    });
    

    
    $('#eliminarProductoModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var id = button.data('id');
        var modal = $(this);
        modal.find('#productoIdEliminar').val(id);
    });

    
</script>
</body>
</html>
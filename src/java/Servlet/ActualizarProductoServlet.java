package Servlet;

import Entidad.Productos;
import Mantenimiento.ProductoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/ActualizarProductoServlet")
public class ActualizarProductoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Debugging output
            System.out.println("Retrieving parameters from request");

            int idProducto = Integer.parseInt(request.getParameter("productoId"));
            String nombreProducto = request.getParameter("nombreProducto");
            String marcaProducto = request.getParameter("marcaProducto");
            int stockProducto = Integer.parseInt(request.getParameter("stockProducto"));
            double precioProducto = Double.parseDouble(request.getParameter("precioProducto"));
            String descProducto = request.getParameter("descProducto");
            int categoriaProducto = Integer.parseInt(request.getParameter("categoriaProducto"));
            String imagenProducto = request.getParameter("imagenProducto");

            // Print parameters for debugging
            System.out.println("ID Producto: " + idProducto);
            System.out.println("Nombre Producto: " + nombreProducto);
            System.out.println("Marca Producto: " + marcaProducto);
            System.out.println("Stock Producto: " + stockProducto);
            System.out.println("Precio Producto: " + precioProducto);
            System.out.println("Descripción Producto: " + descProducto);
            System.out.println("Categoría Producto: " + categoriaProducto);
            System.out.println("Imagen Producto: " + imagenProducto);

            Productos producto = new Productos();
            producto.setIdProducto(idProducto);
            producto.setNombrePro(nombreProducto);
            producto.setMarca(marcaProducto);
            producto.setStock(stockProducto);
            producto.setPrecio(precioProducto);
            producto.setDescripcion(descProducto);
            producto.setIdCategoria(categoriaProducto);
            producto.setImagen(imagenProducto);

            ProductoDAO productoDAO = new ProductoDAO();
            boolean resultado = productoDAO.actualizarProducto(producto);

            if (resultado) {
                response.sendRedirect("MantenimientoProductos.jsp");
            } else {
                response.sendRedirect("MantenimientoProductos.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace(out);
            response.sendRedirect("MantenimientoProductos.jsp?error=true");
        } finally {
            out.close();
        }
    }
}
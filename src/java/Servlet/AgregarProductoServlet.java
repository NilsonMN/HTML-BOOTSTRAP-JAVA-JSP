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

@WebServlet("/AgregarProductoServlet")
public class AgregarProductoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String nombreProducto = request.getParameter("nombreProducto");
            String marcaProducto = request.getParameter("marcaProducto");
            int stockProducto = Integer.parseInt(request.getParameter("stockProducto"));
            double precioProducto = Double.parseDouble(request.getParameter("precioProducto"));
            String descProducto = request.getParameter("descProducto");
            int categoriaProducto = Integer.parseInt(request.getParameter("categoriaProducto"));
            String imagenProducto = request.getParameter("imagenProducto");
            
             out.println("Nombre producto "+nombreProducto );
            out.println("Marca del producto: " + marcaProducto);
            out.println("Stock del producto: " + stockProducto);
            out.println("Precio del producto: " + precioProducto);
            out.println("Descripcion: " + descProducto);
            out.println("Categoria: " + categoriaProducto);
            out.println("Imagen: " + imagenProducto);

            Productos producto = new Productos();
            producto.setNombrePro(nombreProducto);
            producto.setMarca(marcaProducto);
            producto.setStock(stockProducto);
            producto.setPrecio(precioProducto);
            producto.setDescripcion(descProducto);
            producto.setIdCategoria(categoriaProducto);
            producto.setImagen(imagenProducto);

            ProductoDAO productoDAO = new ProductoDAO();
            boolean resultado = productoDAO.agregarProducto(producto);

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
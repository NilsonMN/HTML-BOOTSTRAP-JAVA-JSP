
package Servlet;

import Entidad.Venta;
import Entidad.DetalleVenta;
import Mantenimiento.VentaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReporteDiaServlet")
public class ReporteDiaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fecha = request.getParameter("fecha");

        VentaDAO ventaDAO = new VentaDAO();
        List<Venta> ventas = ventaDAO.getVentasByFecha(fecha);
        request.setAttribute("ventas", ventas);

        double totalVentas = 0;
        int totalProductos = 0;
        int totalOrdenes = ventas.size();

        for (Venta venta : ventas) {
            List<DetalleVenta> detalles = venta.getDetalles();
            for (DetalleVenta detalle : detalles) {
                totalProductos += detalle.getCantidad();
                totalVentas += detalle.getSubtotal();
            }
        }

        request.setAttribute("totalVentas", totalVentas);
        request.setAttribute("totalProductos", totalProductos);
        request.setAttribute("totalOrdenes", totalOrdenes);

        request.getRequestDispatcher("Reportes.jsp").forward(request, response);
    }
}
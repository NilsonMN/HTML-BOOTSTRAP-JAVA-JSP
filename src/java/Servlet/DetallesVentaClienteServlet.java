
package Servlet;

import Entidad.Cliente;
import Entidad.Venta;
import Entidad.DetalleVenta;
import Mantenimiento.ClienteDAO;
import Mantenimiento.VentaDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/DetallesVentaClienteServlet")
public class DetallesVentaClienteServlet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
            int idCliente = Integer.parseInt(request.getParameter("id"));
            VentaDAO ventaDAO = new VentaDAO();
            ClienteDAO clienteDAO = new ClienteDAO();
            List<Venta> ventas = ventaDAO.getVentaCliente(idCliente);
            request.setAttribute("ventas", ventas);
            Cliente objCliente = clienteDAO.BuscarClienteID(idCliente);
            request.setAttribute("objCliente", objCliente);
            request.getRequestDispatcher("ReporteClientes.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("ReporteClientes.jsp?error=invalidClientID");
        }
    }
}

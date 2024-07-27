
package Servlet;
import Mantenimiento.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "EliminarClienteServlet", urlPatterns = {"/EliminarClienteServlet"})
public class EliminarClienteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int clienteId = Integer.parseInt(request.getParameter("clienteId"));

        ClienteDAO clienteDAO = new ClienteDAO();
        boolean resultado = clienteDAO.eliminarCliente(clienteId);

        if (resultado) {
            response.sendRedirect("MantenimientoClientes.jsp");
        } else {
            response.sendRedirect("MantenimientoClientes.jsp?error=true");
        }
    }
    

}

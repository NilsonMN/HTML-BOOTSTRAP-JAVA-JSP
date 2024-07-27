
package Servlet;
import Entidad.Cliente;
import Mantenimiento.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "ActualizarClienteServlet", urlPatterns = {"/ActualizarClienteServlet"})
public class ActualizarClienteServlet extends HttpServlet {
           protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            int clienteId = Integer.parseInt(request.getParameter("clienteId"));
            String nombreCliente = request.getParameter("nombreCliente");
            String apellidoCliente = request.getParameter("apellidoCliente");
            String correoCliente = request.getParameter("correoCliente");
            String contrasenaCliente = request.getParameter("contrasenaCliente");
            int telefonoCliente = Integer.parseInt(request.getParameter("telefonoCliente"));
            String direccionCliente = request.getParameter("direccionCliente");
            String dniCliente = request.getParameter("dniCliente");
            
            Cliente cliente = new Cliente();
            cliente.setIdCliente(clienteId);
            cliente.setNombre(nombreCliente);
            cliente.setApellido(apellidoCliente);
            cliente.setCorreo(correoCliente);
            cliente.setContrasena(contrasenaCliente);
            cliente.setTelefono(telefonoCliente);
            cliente.setDireccion(direccionCliente);
            cliente.setDNI(dniCliente);
            
            ClienteDAO clienteDAO = new ClienteDAO();
            boolean resultado = clienteDAO.actualizarCliente(cliente);
            
            if (resultado) {
                response.sendRedirect("MantenimientoClientes.jsp");
            } else {
                response.sendRedirect("MantenimientoClientes.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace(out);
            response.sendRedirect("MantenimientoClientes.jsp?error=true");
        } finally {
            out.close();
        }
    }
}


package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import Mantenimiento.AdmindDAO;
import Entidad.Admind;


@WebServlet(name = "RegistroAdmindServlet", urlPatterns = {"/RegistroAdmindServlet"})
public class RegistroAdmindServlet extends HttpServlet {
private AdmindDAO adminDAO;

    public void init() {
        adminDAO = new AdmindDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            registerAdmin(request, response);
        } else if ("login".equals(action)) {
            loginAdmin(request, response);
        }
    }

    private void registerAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        Admind admin = new Admind();
        admin.setUsuario(usuario);
        admin.setContrasena(contrasena);

        try {
            if (adminDAO.registerAdmin(admin)) {
                response.sendRedirect("InicioSesion.jsp");
            } else {
                response.sendRedirect("Registro.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void loginAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        try {
            Admind admin = adminDAO.loginAdmin(usuario, contrasena);
            if (admin != null) {
                request.getSession().setAttribute("admin", admin);
                response.sendRedirect("Reportes.jsp");
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
   
}

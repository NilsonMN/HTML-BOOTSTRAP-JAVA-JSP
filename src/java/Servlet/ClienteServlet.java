/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Entidad.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Mantenimiento.ClienteDAO;
import javax.servlet.http.HttpSession;


/**
 *
 * @author DIEGO
 */
public class ClienteServlet extends HttpServlet {
    ClienteDAO dao = new ClienteDAO();
    Cliente c = new Cliente();
    int r;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion=request.getParameter("accion");
        if(accion.equals("Ingresar"))
        {
            String Correo=request.getParameter("user");
            String Contra=request.getParameter("pass");
            c.setCorreo(Correo);
            c.setContrasena(Contra);
            r=dao.validarClient(c);
            if(r==1)
            {
               HttpSession session = request.getSession();
               session.setAttribute("correo", Correo);
               session.setAttribute("nomC", c.getNombre());
               session.setAttribute("idC", dao.obtenerId(c));
               response.sendRedirect(request.getContextPath() + "/Sistema_Web/productos.jsp");
            }else{
               response.sendRedirect(request.getContextPath() + "/Sistema_Web/inicio.jsp");
            }
        } else if ("CerrarSesion".equals(accion)) 
        {
            HttpSession session = request.getSession(false); 
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/Sistema_Web/inicio.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

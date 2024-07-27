/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

import Entidad.Cliente;
import Entidad.DetalleVenta;
import Entidad.Venta;
import Mantenimiento.ClienteDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author deyvi
 */
@WebServlet("/ReporteClienteServelet")
public class ReporteClienteServelet extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dato = request.getParameter("dato");
        ClienteDAO clienteDAO = new ClienteDAO();
        List<Cliente> listaCliente = clienteDAO.listarClientesNomDni(dato);
        request.setAttribute("clientes", listaCliente);
        request.getRequestDispatcher("ReporteClientes.jsp").forward(request, response);
    }
}
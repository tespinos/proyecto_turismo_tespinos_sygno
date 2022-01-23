package Servlets;

import Logica.Controladora;
import Logica.ServicioTuristico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anabella
 */
@WebServlet(name = "SvModificarServicioTuristico", urlPatterns = {"/SvModificarServicioTuristico"})
public class SvModificarServicioTuristico extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String destino = request.getParameter("destino");
        String fecha = request.getParameter("fecha");
        Date fechaServicio = control.deStringToDate(fecha);
        Double costo = Double.parseDouble(request.getParameter("costo"));
        
        ServicioTuristico servicio = control.buscarServicioTuristico(id);
        
        servicio.setNombre(nombre);
        servicio.setDescripcion_breve(descripcion);
        servicio.setDestino_servicio(destino);
        servicio.setFecha_servicio(fechaServicio);
        servicio.setCosto_servicio(costo);
        
        control.modificarServicioTuristico(servicio);
        request.getSession().setAttribute("listaServiciosTuristicos", control.traerServiciosTuristicos());
        response.sendRedirect("servicios.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        ServicioTuristico servicio = control.buscarServicioTuristico(id);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("servicioTuristico", servicio);
        response.sendRedirect("servicios-modificar.jsp");
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

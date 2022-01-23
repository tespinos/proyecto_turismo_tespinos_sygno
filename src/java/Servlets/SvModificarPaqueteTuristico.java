package Servlets;

import Logica.Controladora;
import Logica.PaqueteTuristico;
import Logica.ServicioTuristico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "SvModificarPaqueteTuristico", urlPatterns = {"/SvModificarPaqueteTuristico"})
public class SvModificarPaqueteTuristico extends HttpServlet {
    
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

        String[] serviciosEnPaquete = request.getParameterValues("servicio");
        ArrayList<ServicioTuristico> listaServicios = new ArrayList<ServicioTuristico>();
        
        for(int i = 0; i < serviciosEnPaquete.length; i++) {
            ServicioTuristico servicio = control.buscarServicioTuristico(Integer.parseInt(serviciosEnPaquete[i]));
            listaServicios.add(servicio);
        }
        
        Double costo = Double.parseDouble(request.getParameter("costo"));
        
        PaqueteTuristico paquete = control.buscarPaqueteTuristico(id);
        
        paquete.setLista_servicios_incluidos(listaServicios);
        paquete.setCosto_paquete(costo);
        
        control.modificarPaqueteTuristico(paquete);
        request.getSession().setAttribute("listaPaquetesTuristicos", control.traerPaquetesTuristicos());
        response.sendRedirect("paquetes.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        PaqueteTuristico paquete = control.buscarPaqueteTuristico(id);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("paqueteTuristico", paquete);
        response.sendRedirect("paquetes-modificar.jsp");
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

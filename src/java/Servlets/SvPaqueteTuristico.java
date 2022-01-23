package Servlets;

import Logica.Controladora;
import Logica.ServicioTuristico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Anabella
 */
@WebServlet(name = "SvPaqueteTuristico", urlPatterns = {"/SvPaqueteTuristico"})
public class SvPaqueteTuristico extends HttpServlet {
    
    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String[] serviciosEnPaquete = request.getParameterValues("servicio");
        ArrayList<ServicioTuristico> listaServicios = new ArrayList<ServicioTuristico>();

        for(int i = 0; i < serviciosEnPaquete.length; i++) {
            ServicioTuristico servicio = control.buscarServicioTuristico(Integer.parseInt(serviciosEnPaquete[i]));
            listaServicios.add(servicio);
        }
        Double costoPaquete = Double.parseDouble(request.getParameter("costo"));

        control.crearPaqueteTuristico(listaServicios, costoPaquete);

        response.sendRedirect("paquetes.jsp");
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

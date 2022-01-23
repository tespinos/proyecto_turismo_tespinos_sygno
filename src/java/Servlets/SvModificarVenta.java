package Servlets;

import Logica.Cliente;
import Logica.Controladora;
import Logica.Empleado;
import Logica.PaqueteTuristico;
import Logica.ServicioTuristico;
import Logica.Venta;
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
@WebServlet(name = "SvModificarVenta", urlPatterns = {"/SvModificarVenta"})
public class SvModificarVenta extends HttpServlet {
    
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
        
        String[] empleados = request.getParameterValues("empleado");
        Empleado empleado = new Empleado();
        for(int i = 0; i<empleados.length; i++) {
            empleado = control.buscarEmpleado(Integer.parseInt(empleados[i]));
        }

        Date fecha = control.deStringToDate(request.getParameter("fecha"));
        
        String[] clientes = request.getParameterValues("cliente");
        Cliente cliente = new Cliente();
        for(int i = 0; i<clientes.length; i++) {
            cliente = control.buscarCliente(Integer.parseInt(clientes[i]));
        }
        
        String medioDePago = request.getParameter("medioDePago");
        
        String seleccionVentaOPaquete = request.getParameter("seleccionTipoVenta");
        ServicioTuristico servicio = new ServicioTuristico();
        PaqueteTuristico paquete = new PaqueteTuristico();
        if (seleccionVentaOPaquete.equals("servicio")) {
            String[] servicios = request.getParameterValues("servicio");
            for(int i = 0; i<servicios.length; i++) {
                servicio = control.buscarServicioTuristico(Integer.parseInt(servicios[i]));
            }
        }
        else {
            String[] paquetes = request.getParameterValues("paquete");
            for(int i = 0; i<paquetes.length; i++) {
                paquete = control.buscarPaqueteTuristico(Integer.parseInt(paquetes[i]));
            }
        }
        
        Venta venta = control.buscarVenta(id);
        
        venta.setFecha_venta(fecha);
        venta.setCliente(cliente);
        venta.setEmpleado(empleado);
        venta.setMedio_pago(medioDePago);

        if (seleccionVentaOPaquete.equals("servicio")) {
            venta.setServicio(servicio);
            venta.setPaquete(null);
        } else {
            venta.setPaquete(paquete);
            venta.setServicio(null);
        }
        
        control.modificarVenta(venta);
        request.getSession().setAttribute("listaVentas", control.traerVentas());
        response.sendRedirect("ventas.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        
        Venta venta = control.buscarVenta(id);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("venta", venta);
        response.sendRedirect("ventas-modificar.jsp");
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

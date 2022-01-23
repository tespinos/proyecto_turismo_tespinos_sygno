package Servlets;

import Logica.Controladora;
import Logica.Empleado;
import Logica.Usuario;
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
@WebServlet(name = "SvModificarEmpleado", urlPatterns = {"/SvModificarEmpleado"})
public class SvModificarEmpleado extends HttpServlet {
    
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
        int usuarioId = Integer.parseInt(request.getParameter("idUser"));
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String direccion = request.getParameter("direccion");
        String dni = request.getParameter("dni");
        String fecha = request.getParameter("fechaNac");
        Date fechaNac = control.deStringToDate(fecha);
        String nacionalidad = request.getParameter("nacionalidad");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        String cargo = request.getParameter("cargo");
        Double sueldo = Double.parseDouble(request.getParameter("sueldo"));
        String nombreUsuario = request.getParameter("usuario");
        String contrasenia = request.getParameter("contrasenia");
        
        Empleado empleado = control.buscarEmpleado(id);
        Usuario usuario = control.buscarUsuario(usuarioId);

        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(direccion);
        empleado.setDni(dni);
        empleado.setFecha_nac(fechaNac);
        empleado.setNacionalidad(nacionalidad);
        empleado.setCelular(celular);
        empleado.setEmail(email);
        empleado.setCargo(cargo);
        empleado.setSueldo(sueldo);
        empleado.setUsuario(usuario);
        
        usuario.setNombre_usuario(nombreUsuario);
        usuario.setContrasenia(contrasenia);
        control.modificarEmpleado(empleado);
        control.modificarUsuario(usuario);
        request.getSession().setAttribute("listaPersonas", control.traerEmpleados());
        response.sendRedirect("empleados.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        int id = Integer.parseInt(request.getParameter("id"));
        int usuarioId = Integer.parseInt(request.getParameter("idUser"));
        Empleado empleado = control.buscarEmpleado(id);
        Usuario usuario = control.buscarUsuario(usuarioId);
        
        HttpSession miSesion = request.getSession();
        miSesion.setAttribute("empleado", empleado);
        miSesion.setAttribute("usuario", usuario);
        response.sendRedirect("empleados-modificar.jsp");
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

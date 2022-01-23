package Logica;

import Persistencia.ControladoraPersistencia;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Anabella
 */
public class Controladora {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public String convertirDateToString(Date fecha) {
        String patron = "yyyy-MM-dd";
        DateFormat df = new SimpleDateFormat(patron);
        String fechaConvertida = df.format(fecha);
        return fechaConvertida;
    }
    
    public static synchronized java.util.Date deStringToDate(String fecha){
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date fechaEnviar = null;
	try { 
            fechaEnviar = df.parse(fecha);
            return fechaEnviar;
	} catch (ParseException ex) {
            ex.printStackTrace();
            return null;
	}
    }
    
    public boolean verificarUsuario(String usuario, String contrasenia) {
        List<Usuario> listaUsuarios = controlPersis.traerUsuarios();
        
        if (listaUsuarios != null) {
            for (Usuario usu : listaUsuarios) {
                if (usu.getNombre_usuario().equals(usuario) && usu.getContrasenia().equals(contrasenia)) {
                    return true;
                }
            }
        }
        
        return false;
    }
    
    public void crearEmpleado(Date fecha_nac, String nombre, String apellido, String direccion, String dni, String nacionalidad, String celular, String email, String cargo, double sueldo, String nombreUsu, String contrasenia) {
        Empleado empleado = new Empleado();
        Usuario usuario = new Usuario();

        empleado.setFecha_nac(fecha_nac);
        empleado.setNombre(nombre);
        empleado.setApellido(apellido);
        empleado.setDireccion(direccion);
        empleado.setDni(dni);
        empleado.setNacionalidad(nacionalidad);
        empleado.setCelular(celular);
        empleado.setEmail(email);
        empleado.setCargo(cargo);
        empleado.setSueldo(sueldo);
        
        usuario.setNombre_usuario(nombreUsu);
        usuario.setContrasenia(contrasenia);
        
        empleado.setUsuario(usuario);
        
        controlPersis.crearEmpleado(empleado, usuario);
    }
    
    public void crearCliente(Date fecha_nac, String nombre, String apellido, String direccion, String dni, String nacionalidad, String celular, String email) {
        Cliente cliente = new Cliente();
        
        cliente.setFecha_nac(fecha_nac);
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDireccion(direccion);
        cliente.setDni(dni);
        cliente.setNacionalidad(nacionalidad);
        cliente.setCelular(celular);
        cliente.setEmail(email);
        
        controlPersis.crearCliente(cliente);
    }
    
    public List<Cliente> traerClientes() {
        return controlPersis.traerClientes();
    }
    
    public Cliente buscarCliente(int id) {
        return controlPersis.buscarCliente(id);
    }
    
    public void modificarCliente(Cliente cliente) {
        controlPersis.modificarCliente(cliente);
    }
    
    public void eliminarCliente(int id) {
        controlPersis.eliminarCliente(id);
    }
    
    public List<Empleado> traerEmpleados() {
        return controlPersis.traerEmpleados();
    }
    
    public Empleado buscarEmpleado(int id) {
        return controlPersis.buscarEmpleado(id);
    }
    
    public void modificarEmpleado(Empleado empleado) {
        controlPersis.modificarEmpleado(empleado);
    }
    
    public Usuario buscarUsuario(int id) {
        return controlPersis.buscarUsuario(id);
    }
    
    public void modificarUsuario(Usuario usuario) {
        controlPersis.modificarUsuario(usuario);
    }
    
    public void eliminarEmpleado(int id) {
        controlPersis.eliminarEmpleado(id);
    }
    
    public void eliminarUsuario(int id) {
        controlPersis.eliminarUsuario(id);
    }
    
    /* Servicios */
    
    public void crearServicioTuristico(String nombre, String descripcion, String destino, Date fecha, Double costo) {
        ServicioTuristico servicio = new ServicioTuristico();
        
        servicio.setNombre(nombre);
        servicio.setDescripcion_breve(descripcion);
        servicio.setDestino_servicio(destino);
        servicio.setFecha_servicio(fecha);
        servicio.setCosto_servicio(costo);
        
        controlPersis.crearServicioTuristico(servicio);
    }
    
    public List<ServicioTuristico> traerServiciosTuristicos() {
        return controlPersis.traerServiciosTuristicos();
    }
    
    public ServicioTuristico buscarServicioTuristico(int id) {
        return controlPersis.buscarServicioTuristico(id);
    }
    
    public void modificarServicioTuristico(ServicioTuristico servicio) {
        controlPersis.modificarServicioTuristico(servicio);
    }
    
    public void eliminarServicioTuristico(int id) {
        controlPersis.eliminarServicioTuristico(id);
    }
    
    public List<PaqueteTuristico> traerPaquetesTuristicos() {
        return controlPersis.traerPaquetesTuristicos();
    }
    
    public void crearPaqueteTuristico(List<ServicioTuristico> serviciosIncluidos, Double costo) {
        PaqueteTuristico paquete = new PaqueteTuristico();
        
        paquete.setLista_servicios_incluidos(serviciosIncluidos);
        paquete.setCosto_paquete(costo);
        
        controlPersis.crearPaqueteTuristico(paquete);
    }
    
    public PaqueteTuristico buscarPaqueteTuristico(int id) {
        return controlPersis.buscarPaqueteTuristico(id);
    }
    
    public void modificarPaqueteTuristico(PaqueteTuristico paquete) {
        controlPersis.modificarPaqueteTuristico(paquete);
    }
    
    public List<ServicioTuristico> traerServiciosPorPaquete(int idPaquete) {
        return controlPersis.traerServiciosPorPaquete(idPaquete);
    }
    
    public void eliminarPaqueteTuristico(int id) {
        controlPersis.eliminarPaqueteTuristico(id);
    }
    
    public List<Venta> traerVentas() {
        return controlPersis.traerVentas();
    }
    
    public void crearVenta(Date fecha, Empleado empleado, Cliente cliente, ServicioTuristico servicio, PaqueteTuristico paquete, String medioDePago) {
        Venta venta = new Venta();
        
        venta.setFecha_venta(fecha);
        venta.setEmpleado(empleado);
        venta.setCliente(cliente);
        venta.setServicio(servicio);
        venta.setPaquete(paquete);
        venta.setMedio_pago(medioDePago);
        
        
        controlPersis.crearVenta(venta);
    }
    
    public Empleado obtenerEmpleadoAPartirDeUsuario(Usuario usu) {
        return controlPersis.obtenerEmpleadoAPartirDeUsuario(usu);
    }
    
    public void eliminarVenta(int id) {
        controlPersis.eliminarVenta(id);
    }
    
    public Venta buscarVenta(int id) {
        return controlPersis.buscarVenta(id);
    }
    
    public void modificarVenta(Venta venta) {
        controlPersis.modificarVenta(venta);
    }
}

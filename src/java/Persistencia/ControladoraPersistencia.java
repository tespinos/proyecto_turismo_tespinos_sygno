package Persistencia;

import Logica.Cliente;
import Logica.Empleado;
import Logica.PaqueteTuristico;
import Logica.ServicioTuristico;
import Logica.Usuario;
import Logica.Venta;
import Persistencia.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {
    ClienteJpaController clienteJPA = new ClienteJpaController();
    EmpleadoJpaController empleadoJPA = new EmpleadoJpaController();
    PaqueteTuristicoJpaController paqueteJPA = new PaqueteTuristicoJpaController();
    ServicioTuristicoJpaController servicioJPA = new ServicioTuristicoJpaController();
    UsuarioJpaController usuarioJPA = new UsuarioJpaController();
    VentaJpaController ventaJPA = new VentaJpaController();
    //PersonaJpaController personaJPA = new PersonaJpaController();
    
    /* Métodos para Persona */

    /*public void crearPersona(Persona persona) {
        try {
            personaJPA.create(persona);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }*/
    
    /* Métodos para Empleado */

    public void crearEmpleado(Empleado empleado, Usuario usuario) {
        try {
            usuarioJPA.create(usuario);
            empleadoJPA.create(empleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void modificarEmpleado(Empleado empleado) {
        try {
            empleadoJPA.edit(empleado);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarEmpleado(int idEmpleado) {
        try {
            empleadoJPA.destroy(idEmpleado);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Empleado> traerEmpleados() {
        return empleadoJPA.findEmpleadoEntities();
    }
    
    public Empleado buscarEmpleado(int id) {
        return empleadoJPA.findEmpleado(id);
    }
    
    /* Métodos para Usuario */
    
    public Usuario buscarUsuario(int id) {
        return usuarioJPA.findUsuario(id);
    }
    
    public void modificarUsuario(Usuario usuario) {
        try {
            usuarioJPA.edit(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarUsuario(int idUsuario) {
        try {
            usuarioJPA.destroy(idUsuario);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /* Métodos para Cliente */
    
    public void crearCliente(Cliente cliente) {
        try {
            clienteJPA.create(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void modificarCliente(Cliente cliente) {
        try {
            clienteJPA.edit(cliente);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarCliente(int idCliente) {
        try {
            clienteJPA.destroy(idCliente);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Cliente> traerClientes() {
        return clienteJPA.findClienteEntities();
    }
    
    public Cliente buscarCliente(int id) {
        return clienteJPA.findCliente(id);
    }
    
    /* Métodos para Usuario */
    
    /*public void crearUsuario(Usuario usuario) {
        try {
            usuarioJPA.create(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }*/
    
    public List<Usuario> traerUsuarios() {
        return usuarioJPA.findUsuarioEntities();
    }
    
    /* Métodos para Venta */
    
    public void crearVenta(Venta venta) {
        try {
            ventaJPA.create(venta);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void modificarVenta(Venta venta) {
        try {
            ventaJPA.edit(venta);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarVenta(int idVenta) {
        try {
            ventaJPA.destroy(idVenta);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<Venta> traerVentas() {
        return ventaJPA.findVentaEntities();
    }
    
    public Venta buscarVenta(int id) {
        return ventaJPA.findVenta(id);
    }
    
    /* Métodos para Servicio Turistico */
          
    public void crearServicioTuristico(ServicioTuristico servicio) {
        try {
            servicioJPA.create(servicio);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<ServicioTuristico> traerServiciosTuristicos() {
        return servicioJPA.findServicioTuristicoEntities();
    }
    
    public ServicioTuristico buscarServicioTuristico(int id) {
        return servicioJPA.findServicioTuristico(id);
    }
    
    public void modificarServicioTuristico(ServicioTuristico servicio) {
        try {
            servicioJPA.edit(servicio);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void eliminarServicioTuristico(int idServicio) {
        try {
            servicioJPA.destroy(idServicio);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /* Paquetes */
    
    public List<PaqueteTuristico> traerPaquetesTuristicos() {
        return paqueteJPA.findPaqueteTuristicoEntities();
    }
    
    public void crearPaqueteTuristico(PaqueteTuristico paquete) {
        try {
            paqueteJPA.create(paquete);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public PaqueteTuristico buscarPaqueteTuristico(int id) {
        return paqueteJPA.findPaqueteTuristico(id);
    }
    
    public void modificarPaqueteTuristico(PaqueteTuristico paquete) {
        try {
            paqueteJPA.edit(paquete);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public List<ServicioTuristico> traerServiciosPorPaquete(int idPaquete) {
        PaqueteTuristico miPaquete = paqueteJPA.findPaqueteTuristico(idPaquete);
        return miPaquete.getLista_servicios_incluidos();
    }
    
    public void eliminarPaqueteTuristico(int idPaquete) {
        try {
            paqueteJPA.destroy(idPaquete);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    /*public List<ServicioTuristico> traerServiciosNoRepetidos(List<ServicioTuristico> lista1, List<ServicioTuristico> lista2) {
        List<ServicioTuristico> listaNueva = new List<ServicioTuristico>();
        for (int i = 0; i < lista1.size(); i++) {
            for (int j = 0; j < lista2.size(); j++) {
                if (lista1[i] != lista2[j]) {
                    
                }
            }
        }
    }*/
    
    public Empleado obtenerEmpleadoAPartirDeUsuario(Usuario usu) {
        List<Empleado> listaEmpleados = empleadoJPA.findEmpleadoEntities();
        int empleadoId = 0;
        for (Empleado emple : listaEmpleados) {
            if (emple.getUsuario().getUsuario_id() == usu.getUsuario_id()) {
                empleadoId = emple.getId_persona();
            }
        }
        return empleadoJPA.findEmpleado(empleadoId);
    }
}

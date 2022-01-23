package Logica;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Empleado extends Persona implements Serializable {
    @Basic
    private String cargo;
    private double sueldo;
    @OneToOne
    private Usuario usuario;
    @OneToMany
    private List<Venta> lista_ventas;

    public Empleado() {
    }

    public Empleado(int id_persona, Date fecha_nac, String nombre, String apellido, String direccion, String dni, String nacionalidad, String celular, String email, String cargo, double sueldo, Usuario usuario, List<Venta> lista_ventas) {
        super(id_persona, fecha_nac, nombre, apellido, direccion, dni, nacionalidad, celular, email);
        this.cargo = cargo;
        this.sueldo = sueldo;
        this.usuario = usuario;
        this.lista_ventas = lista_ventas;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Venta> getLista_ventas() {
        return lista_ventas;
    }
   
    public void setLista_ventas(List<Venta> lista_ventas) {
        this.lista_ventas = lista_ventas;
    }
}

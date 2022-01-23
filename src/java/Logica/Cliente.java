package Logica;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Cliente extends Persona implements Serializable {
    @OneToMany
    private List<Venta> lista_ventas;

    public Cliente() {
    }

    public Cliente(int id_persona, Date fecha_nac, String nombre, String apellido, String direccion, String dni, String nacionalidad, String celular, String email, List<Venta> lista_ventas) {
        super(id_persona, fecha_nac, nombre, apellido, direccion, dni, nacionalidad, celular, email);
        this.lista_ventas = lista_ventas;
    }
    
    public List<Venta> getLista_ventas() {
        return lista_ventas;
    }

    public void setLista_ventas(List<Venta> lista_ventas) {
        this.lista_ventas = lista_ventas;
    }
}

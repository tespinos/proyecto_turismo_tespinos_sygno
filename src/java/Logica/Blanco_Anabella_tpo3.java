package Logica;

import java.util.Date;

/**
 *
 * @author Anabella
 */
public class Blanco_Anabella_tpo3 {

    public static void main(String[] args) {
        Controladora control = new Controladora();
        
        Date fecha = new Date();
        control.crearEmpleado(fecha, "Admin", "Admin", "Direccion 123", "12345678", "Argentina", "11111111", "admin@admin.com", "Administrador", 10000.0, "admin", "admin");
    }
    
}

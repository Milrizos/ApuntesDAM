import java.time.LocalDate;

public class Prestamo {

    // Propiedades (columnas/atributos)
    private String dni;
    private String dispositivo;
    private LocalDate fechaOperacion;
    private LocalDate fechaEntrega;
    
    // Constructor -> sirve para indicar como se agrupan los datos (como filas)
    public Prestamo(
        String dni, 
        String dispositivo, 
        LocalDate fechaOperacion, 
        LocalDate fechaEntrega) {
            this.dni = dni;
            this.dispositivo = dispositivo;
            this.fechaOperacion = fechaOperacion;
            this.fechaEntrega = fechaEntrega;
    }
}
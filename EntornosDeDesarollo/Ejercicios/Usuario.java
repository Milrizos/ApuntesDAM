public class Usuario {
    
    // Propiedades: Lo que tiene que guardar la clase
    private String nombre;
    public int edad;
    private String contraseña;  // Mas adelate se cifraran los datos
    public String id;           // DNI, ...
    public String correo;

    // Métodos: Cosas que la clase puede hacer 
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nuevoNombre) {
        nombre = nuevoNombre;
    }
}
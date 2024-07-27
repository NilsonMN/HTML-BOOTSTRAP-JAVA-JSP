
package Entidad;

public class Admind {
    int idadmind;
    String usuario;
    String contrasena;

    public Admind(int idadmind, String usuario, String contrasena) {
        this.idadmind = idadmind;
        this.usuario = usuario;
        this.contrasena = contrasena;
    }
    
    public Admind(){
        
    }

    public int getIdadmind() {
        return idadmind;
    }

    public void setIdadmind(int idadmind) {
        this.idadmind = idadmind;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    
}

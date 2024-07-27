
package Entidad;


public class Productos {
    private int idProducto;
    private String nombrePro;
    private String marca;
    private double precio;
    private int stock;
    private String descripcion;
    private int idCategoria;
    private String imagen;

  public Productos() {
      
    }

    // Constructor con argumentos
    public Productos(int idProducto, String nombrePro, String marca, double precio, int stock, String descripcion, int idCategoria, String imagen) {
        this.idProducto = idProducto;
        this.nombrePro = nombrePro;
        this.marca = marca;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
        this.idCategoria = idCategoria;
        this.imagen=imagen;
    }   

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombrePro() {
        return nombrePro;
    }

    public void setNombrePro(String nombrePro) {
        this.nombrePro = nombrePro;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
    
    
}

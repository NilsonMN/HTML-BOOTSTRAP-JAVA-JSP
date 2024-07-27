
package Mantenimiento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Entidad.Categoria;
import Conexion.Conexion;

public class CategoriaDAO {

    public static List<Categoria> listarCategorias() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Categoria> categorias = new ArrayList<>();
        try {
            con = Conexion.getConnection();
            String sql = "SELECT * FROM categoria";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(rs.getInt("idCategoria"));
                categoria.setNombreCat(rs.getString("nombreCat"));
                categorias.add(categoria);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return categorias;
    }
    public static String obtenerNombreCategoria(int idCategoria) throws SQLException {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String nombreCategoria = null;
    try {
        con = Conexion.getConnection();
        String sql = "SELECT nombreCat FROM categoria WHERE idCategoria = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, idCategoria);
        rs = ps.executeQuery();
        if (rs.next()) {
            nombreCategoria = rs.getString("nombreCat");
        }
    } finally {
        if (rs != null) {
            rs.close();
        }
        if (ps != null) {
            ps.close();
        }
        if (con != null) {
            con.close();
        }
    }
    return nombreCategoria;
}
}
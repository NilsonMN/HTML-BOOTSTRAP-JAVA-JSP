package Mantenimiento;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Entidad.Productos;

public class ProductoDAO {

    public boolean agregarProducto(Productos producto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "INSERT INTO producto (nombrePro, marca, precio, stock, descripcion, idcategoria, imagen) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, producto.getNombrePro());
            pstmt.setString(2, producto.getMarca());
            pstmt.setDouble(3, producto.getPrecio());
            pstmt.setInt(4, producto.getStock());
            pstmt.setString(5, producto.getDescripcion());
            pstmt.setInt(6, producto.getIdCategoria());
            pstmt.setString(7, producto.getImagen());

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultado;
    }

    public boolean actualizarProducto(Productos producto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "UPDATE producto SET nombrePro = ?, marca = ?, precio = ?, stock = ?, descripcion = ?, idcategoria = ?, imagen = ? WHERE idproducto = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, producto.getNombrePro());
            pstmt.setString(2, producto.getMarca());
            pstmt.setDouble(3, producto.getPrecio());
            pstmt.setInt(4, producto.getStock());
            pstmt.setString(5, producto.getDescripcion());
            pstmt.setInt(6, producto.getIdCategoria());
            pstmt.setString(7, producto.getImagen());
            pstmt.setInt(8, producto.getIdProducto());

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            // Print stack trace to console
            e.printStackTrace();
            // Log detailed error message
            System.err.println("Error during actualizarProducto: " + e.getMessage());
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultado;
    }

    public boolean eliminarProducto(int productoId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "DELETE FROM producto WHERE idproducto = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productoId);

            int rowsDeleted = pstmt.executeUpdate();
            if (rowsDeleted > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return resultado;
    }

    public static List<Productos> listarProductos() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Productos> productos = new ArrayList<>();
        try {
            con = Conexion.getConnection();
            String sql = "SELECT * FROM producto";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos producto = new Productos();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombrePro(rs.getString("nombrePro"));
                producto.setMarca(rs.getString("marca"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setIdCategoria(rs.getInt("idCategoria"));
                producto.setImagen(rs.getString("imagen"));
                productos.add(producto);
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
        return productos;
    }

    public int obtenerCant(int id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int r = 0;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM producto WHERE idproducto = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                r = rs.getInt("stock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return r;
    }

    public boolean UpStock(int id, int cantidad) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;

        try {
            conn = Conexion.getConnection();
            conn.setAutoCommit(false);
            String sql = "SELECT stock FROM producto WHERE idproducto = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int stockActual = rs.getInt("stock");
                int nuevoStock = stockActual - cantidad;

                if (nuevoStock >= 0) {
                    String sqlUpdate = "UPDATE producto SET stock = ? WHERE idproducto = ?";
                    pstmt = conn.prepareStatement(sqlUpdate);
                    pstmt.setInt(1, nuevoStock);
                    pstmt.setInt(2, id);

                    int rowsUpdated = pstmt.executeUpdate();
                    if (rowsUpdated > 0) {
                        result = true;
                    }
                } else {
                    System.out.println("No hay suficiente stock para el producto con ID " + id);
                }
            }

            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public int obtenerCantidad(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

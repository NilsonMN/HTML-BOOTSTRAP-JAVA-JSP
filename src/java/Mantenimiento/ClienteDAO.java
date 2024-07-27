package Mantenimiento;

import Conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Entidad.Cliente;

public class ClienteDAO {

    public boolean agregarCliente(Cliente cliente) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "INSERT INTO cliente (nombre, apellido, correo, contrasena, telefono, direccion, DNI) VALUES (?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cliente.getNombre());
            pstmt.setString(2, cliente.getApellido());
            pstmt.setString(3, cliente.getCorreo());
            pstmt.setString(4, cliente.getContrasena());
            pstmt.setInt(5, cliente.getTelefono());
            pstmt.setString(6, cliente.getDireccion());
            pstmt.setString(7, cliente.getDNI());

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

    public boolean actualizarCliente(Cliente cliente) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "UPDATE cliente SET nombre = ?, apellido = ?, correo = ?, "
                    + "contrasena = ?, telefono = ?, direccion = ?, DNI = ? WHERE idCliente = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, cliente.getNombre());
            pstmt.setString(2, cliente.getApellido());
            pstmt.setString(3, cliente.getCorreo());
            pstmt.setString(4, cliente.getContrasena());
            pstmt.setInt(5, cliente.getTelefono());
            pstmt.setString(6, cliente.getDireccion());
            pstmt.setString(7, cliente.getDNI());
            pstmt.setInt(8, cliente.getIdCliente());

            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
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

    public boolean eliminarCliente(int ClienteId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean resultado = false;

        try {
            conn = Conexion.getConnection();
            String sql = "DELETE FROM cliente WHERE idCliente = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, ClienteId);

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

    public List<Cliente> listarClientes() {
        List<Cliente> listaClientes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM cliente";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setCorreo(rs.getString("correo"));
                cliente.setContrasena(rs.getString("contrasena"));
                cliente.setTelefono(rs.getInt("telefono"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setDNI(rs.getString("DNI"));
                listaClientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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

        return listaClientes;
    }

    public List<Cliente> listarClientesNomDni(String dato) {
        List<Cliente> listaClientes = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM cliente  WHERE nombre=? OR DNI= ?;";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dato);
            pstmt.setString(2, dato);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setNombre(rs.getString("nombre"));
                cliente.setApellido(rs.getString("apellido"));
                cliente.setCorreo(rs.getString("correo"));
                cliente.setContrasena(rs.getString("contrasena"));
                cliente.setTelefono(rs.getInt("telefono"));
                cliente.setDireccion(rs.getString("direccion"));
                cliente.setDNI(rs.getString("DNI"));
                listaClientes.add(cliente);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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

        return listaClientes;
    }

    public Cliente BuscarClienteID(int idCliente) {
        Cliente objCliente = null;
        String sql = "SELECT * FROM cliente WHERE idCliente = ?";
        try (Connection conn = Conexion.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idCliente);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    objCliente = new Cliente();
                    objCliente.setIdCliente(rs.getInt("idCliente"));
                    objCliente.setNombre(rs.getString("nombre"));
                    objCliente.setApellido(rs.getString("apellido"));
                    objCliente.setCorreo(rs.getString("correo"));
                    objCliente.setContrasena(rs.getString("contrasena"));
                    objCliente.setTelefono(rs.getInt("telefono"));
                    objCliente.setDireccion(rs.getString("direccion"));
                    objCliente.setDNI(rs.getString("DNI"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return objCliente;
    }

    public int validarClient(Cliente c) {
        int r = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM cliente where correo=? and contrasena=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, c.getCorreo());
            pstmt.setString(2, c.getContrasena());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                r = r + 1;
                c.setNombre(rs.getString("nombre"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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
        if (r == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    public int obtenerId(Cliente c) {
        int idCliente = -1;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT idCliente FROM cliente WHERE correo = ? AND contrasena = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, c.getCorreo());
            pstmt.setString(2, c.getContrasena());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                idCliente = rs.getInt("idCliente");
            }
        } catch (SQLException e) {
            e.printStackTrace();
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

        return idCliente;
    }
}

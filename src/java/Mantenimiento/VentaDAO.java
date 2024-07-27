package Mantenimiento;

import Entidad.Venta;
import Entidad.DetalleVenta;
import Conexion.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import java.util.Date;

public class VentaDAO {

    public void addVenta(Venta v) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = Conexion.getConnection();
            String sql = "INSERT INTO venta (idCliente, fechaVenta, totalVenta) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, v.getIdCliente());
            Timestamp timestamp = new Timestamp(v.getFechaVenta().getTime());
            pstmt.setTimestamp(2, timestamp);
            pstmt.setDouble(3, v.getTotalVenta());

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Venta insertada correctamente.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
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
    }

    public List<Venta> getVentasByFecha(String fecha) {
        List<Venta> ventas = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM venta WHERE DATE(fechaVenta) = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fecha);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdVenta(rs.getInt("idVenta"));
                venta.setIdCliente(rs.getInt("idCliente"));
                venta.setFechaVenta(rs.getTimestamp("fechaVenta"));
                venta.setTotalVenta(rs.getDouble("totalVenta"));

                // Get sale details
                List<DetalleVenta> detalles = getDetalleVentasByIdVenta(venta.getIdVenta());
                venta.setDetalles(detalles);

                ventas.add(venta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ventas;
    }

    public List<Venta> getVentaMes(String mes, String año) {
        List<Venta> ventas = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM venta WHERE MONTH(fechaVenta) = ? AND YEAR(fechaVenta) = ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(mes));
            pstmt.setInt(2, Integer.parseInt(año));

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdVenta(rs.getInt("idVenta"));
                venta.setIdCliente(rs.getInt("idCliente"));
                venta.setFechaVenta(rs.getTimestamp("fechaVenta"));
                venta.setTotalVenta(rs.getDouble("totalVenta"));

                // Get sale details
                List<DetalleVenta> detalles = getDetalleVentasByIdVenta(venta.getIdVenta());
                venta.setDetalles(detalles);

                ventas.add(venta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ventas;
    }

    public List<DetalleVenta> getDetalleVentasByIdVenta(int idVenta) {
        List<DetalleVenta> detalleVentas = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = Conexion.getConnection();
            String sql = "SELECT dv.idDetalleVenta, dv.idVenta, dv.idProducto, dv.cantidad, dv.precioVenta, dv.descuento, p.nombrePro as nombreProducto "
                    + "FROM detalleventa dv "
                    + "JOIN producto p ON dv.idProducto = p.idproducto "
                    + "WHERE dv.idVenta = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idVenta);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                DetalleVenta detalleVenta = new DetalleVenta();
                detalleVenta.setIdDetalleVenta(rs.getInt("idDetalleVenta"));
                detalleVenta.setIdVenta(rs.getInt("idVenta"));
                detalleVenta.setIdProducto(rs.getInt("idProducto"));
                detalleVenta.setCantidad(rs.getInt("cantidad"));
                detalleVenta.setPrecioVenta(rs.getDouble("precioVenta"));
                detalleVenta.setDescuento(rs.getDouble("descuento"));
                detalleVenta.setNombreProducto(rs.getString("nombreProducto")); // Set the product name

                detalleVentas.add(detalleVenta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return detalleVentas;
    }

    public List<Venta> getVentaCliente(int idCliente) {
        List<Venta> ventas = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = Conexion.getConnection();
            String sql = "SELECT * FROM venta WHERE idCliente = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (idCliente));

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Venta venta = new Venta();
                venta.setIdVenta(rs.getInt("idVenta"));
                venta.setIdCliente(rs.getInt("idCliente"));
                venta.setFechaVenta(rs.getTimestamp("fechaVenta"));
                venta.setTotalVenta(rs.getDouble("totalVenta"));

                // Get sale details
                List<DetalleVenta> detalles = getDetalleVentasByIdVenta(venta.getIdVenta());
                venta.setDetalles(detalles);

                ventas.add(venta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ventas;
    }

    public int ultimoId() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int ultimoId = 0;
        try {
            conn = Conexion.getConnection();
            String sql = "SELECT MAX(idVenta) AS ultimo_id FROM venta";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery(sql);

            if (rs.next()) {
                ultimoId = rs.getInt("ultimo_id");
            } else {
                System.out.println("No se encontraron ventas");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ultimoId;
    }
}

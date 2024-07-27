
package Mantenimiento;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Entidad.Admind;
import Conexion.Conexion;

public class AdmindDAO {
    private static final String INSERT_USER_SQL = "INSERT INTO admind (usuario, contrasena) VALUES (?, ?)";
    private static final String SELECT_USER_BY_USERNAME_AND_PASSWORD = "SELECT idadmin, usuario, contrasena FROM admind WHERE usuario = ? AND contrasena = ?";

    public boolean registerAdmin(Admind admin) throws SQLException {
        try (Connection connection = Conexion.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, admin.getUsuario());
            preparedStatement.setString(2, admin.getContrasena());
            return preparedStatement.executeUpdate() > 0;
        }
    }

    public Admind loginAdmin(String usuario, String contrasena) throws SQLException {
        try (Connection connection = Conexion.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_USERNAME_AND_PASSWORD)) {
            preparedStatement.setString(1, usuario);
            preparedStatement.setString(2, contrasena);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new Admind(rs.getInt("idadmin"), rs.getString("usuario"), rs.getString("contrasena"));
            }
        }
        return null;
    }
}
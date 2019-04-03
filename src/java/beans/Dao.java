package beans;
import java.sql.*;
public class Dao {
    public Connection conexion;
    public final static String userDb = "admin";
    public final static String passDb = "root";
    
    
    // Metodo para conectar a la base de datos
    public void conectar() throws SQLException,ClassNotFoundException{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conexion=DriverManager.getConnection("jdbc:sqlserver://localhost:1433/InstaMessageMail",userDb,passDb);
    }
    
    //Metodo para desconectar a la base de datos
    public void desconectar() throws SQLException,ClassNotFoundException{
        conexion.close();
    }
    
    //Metodo para consultar si un email y contraseña pertenecen a una cuenta registrada
    public boolean isAcountExists(String Alias, String password) throws SQLException{
        String sql = "SELECT * FROM Usuario WHERE Alias='"+Alias+"'";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        return rs.next();
    }
    
    //Metodo para consultar si el email recibido ya esta registrado
    public boolean isEmailRegistered(String Alias) throws SQLException{
        String sql = "SELECT * FROM Usuario WHERE Alias='"+Alias+"'";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        return rs.next();
    }
    //Metodo para registrar una cuenta
    public void registerUser(String Alias, String Nombre, String Apellido, String Fecha_nac, String Contrasenia, String Pregunta, String Rsecreta) throws SQLException{
        String sql = "INSERT INTO 'Usuario'('Alias','Nombre','Apellido','Fecha_nac','Contrasenia','Pregunta','Rsecreta') VALUES "
                + "('"+Alias+"','"+Nombre+"','"+Apellido+"','"+Fecha_nac+"','"+Contrasenia+"','"+Pregunta+"','"+Rsecreta+"')";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ps.executeUpdate();
    }
}

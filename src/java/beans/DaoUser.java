package beans;
import java.sql.*;

public class DaoUser extends Dao {
    
    
    public String getNameByEmail(String Alias) throws SQLException{
        String sql ="SELECT * FROM Usuario WHERE Alias='"+Alias+"'";
        PreparedStatement ps = conexion.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            return rs.getString("name");
        }
        
        return null;
    }
}

package database;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Db_Connection 
{
    public static Connection Connection()
    {
        Connection connection = null; // se almacena la conexion para poderla retornar
        String bdName = "bdinstamessage"; // nombre de la base de datos
        String user = "admin"; // usuario de la base de datos
        String pass = "root"; // contraseña de base de datos
        try 
        {
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); //se conecta el driver
            String conectDB = "jdbc:sqlserver://localhost;databaseName="
                    +bdName+";user="+user+";password="+pass+";"; //parametros de la conexion a la BD
            connection = DriverManager.getConnection(conectDB);
          
            
        } catch (ClassNotFoundException | SQLException ex) {Logger.getLogger(Db_Connection.class.getName()).log(Level.SEVERE, null, ex);}
        return connection;
    }
    
    public static void main (String[] args){
        if(Db_Connection.Connection()!= null){
            System.out.println("CONEXION EXITOSA!");
        }
    }
}

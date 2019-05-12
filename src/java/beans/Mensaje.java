
package beans;

import java.sql.*;
import database.Db_Connection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Mensaje {
	private int id;
        private String fecha;
	private String Remitente;
	private String Destinatario;
	private String Asunto;
        private String Mensaje;
        private int Status;
	

    public Mensaje(){
        fecha = "";
    	Remitente = "";
    	Destinatario = "";
        Asunto = "";
    	Mensaje = "";
        Status = 0;
    }

    public Mensaje(int id, String fecha, String Remitente, String Destinatario, String Asunto, String Mensaje, int Status) {
        this.id = id;
        this.fecha = fecha;
        this.Remitente = Remitente;
        this.Destinatario = Destinatario;
        this.Asunto = Asunto;
        this.Mensaje = Mensaje;
        this.Status = Status;
    }

    public Mensaje(int aInt, String string, String string0, String string1, String string2, double aDouble) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
    //----------------Getters------------------//
    
    public int getId() {
		return id;
	}
	
	public String getRemitente() {
		return Remitente;
	}
	
	public String getDestino() {
		return Destinatario;
	}
	
        
        public String getAsunto() {
                return Asunto;
        }
        
	public String getMensaje() {
		return Mensaje;
	}
	
        public int getStatus(){
                return Status;
        }
        
	public String getFecha() {
		return fecha;
	}
	
        //---------------Setters-------------------//
        
        public void setId(int id) {
		this.id = id;
	}
        
        public void setRemitente(String remitente) {
		this.Remitente = remitente;
	}
        
        public void setDestino(String destino) {
		this.Destinatario = destino;
	}
        
        public void setAsunto(String asunto){
                this.Asunto = asunto;
        }
        
        public void setMensaje(String mensaje) {
		this.Mensaje = mensaje;
	}
        public void setStatus(int estado){
                this.Status = estado;
        }
        
        public void setFecha(String fecha) {
		this.fecha = fecha;
	}
        
        //----------------------------------//
        
        public void NuevoMensaje(){
            try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();

            String sqlString="INSERT INTO Correo (fecha,Remitente,Destinatario,Asunto,Mensaje,Status) VALUES ('"+fecha+"','"+Remitente+"','"+Destinatario+"@instam.com"+"','"+Asunto+"','"+Mensaje+"','"+Status+"')";
            
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {}
        } catch (SQLException ex) {}  
    
        }
        
        //----------------------------------//
        
        public void GetMessage(){
             try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                String sqlString = "SELECT * from correo";
                Statement myStatement = myconnection.createStatement();
                ResultSet rs=myStatement.executeQuery(sqlString);

                while(rs.next())
                {
                    fecha= rs.getString("fecha");
                    Asunto = rs.getString("Asunto");
                    Remitente= rs.getString("Remitente");
                    Mensaje = rs.getString("Mensaje");
                }
                
                myStatement.close();
                myconnection.close();
                
            } catch (Exception ex){} 
       
        }
}

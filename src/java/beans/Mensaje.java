
package beans;

import database.Db_Connection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Mensaje {
	private int id;
	private String Remitente;
	private String Destinatario;
	private String Asunto;
        private String Mensaje;
        private int Status;
	private String fecha;
	
	public Mensaje(){
           
	}
    public Mensaje(int id,String remitente,String destino,String asunto, String mensaje,int estado, String fecha){
    	this.id = id;
    	this.Remitente = remitente;
    	this.Destinatario = destino;
        this.Asunto = asunto;
    	this.Mensaje = mensaje;
        this.Status = estado;
    	this.fecha = fecha;
    	
    }

    public Mensaje(int aInt, String string, String string0, String string1, String string2) {
        throw new UnsupportedOperationException("Not supported yet."); 
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
    /*    
        public void NuevoMensaje(){
            try
        {    
            Db_Connection dbconn=new Db_Connection();
            Connection myconnection= dbconn.Connection();

            String sqlString="INSERT INTO Correo (Remitente,Destinatario,Asunto,Mensaje,Status,fecha) VALUES ('"+Remitente+"','"+Destinatario+"','"+Asunto+"','"+Mensaje+"','"+Status+"','"+fecha+"')";
            
            Statement myStatement = myconnection.createStatement();
            
            try
            {    
                myStatement.executeUpdate(sqlString);
                myStatement.close();
                myconnection.close();
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}
        } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);}  
    
        }
        
        //----------------------------------//
        
        public void GetMessage(){
             try 
            {      
                Db_Connection dbconn=new Db_Connection();
                Connection myconnection= dbconn.Connection();
                
                String sqlString = "SELECT Usuario.Alias, Correo.Destinatario, Correo.Asunto, Correo.Mensaje, Correo.Fecha"
                        + "FROM Usuario LEFT OUTER JOIN Correo ON Usuario.Alias=Correo.Remitente WHERE Alias = '"+Remitente+"'";
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
                
            } catch (SQLException ex) {Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);} 
       
        }*/
}

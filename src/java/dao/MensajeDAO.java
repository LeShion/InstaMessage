
package dao;

import Interfaces.CRUD;
import beans.Mensaje;
import database.Db_Connection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MensajeDAO implements CRUD{
    Db_Connection con=new Db_Connection();
    Connection conect;
    PreparedStatement ps;
    ResultSet rs;
    Mensaje m=new Mensaje();
    
    @Override
    public List listar() {
        ArrayList<Mensaje>list=new ArrayList<>();
        String sql = "SELECT Usuario.Alias, Correo.Destinatario, Correo.Asunto, Correo.Mensaje, Correo.Fecha FROM Usuario LEFT OUTER JOIN Correo ON Usuario.Alias=Correo.Remitente";
        try{
            conect=con.Connection();
            ps=conect.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Mensaje men = new Mensaje();
                men.setFecha(rs.getString("fecha"));
                men.setAsunto(rs.getString("Asunto"));
                men.setRemitente(rs.getString("Remitente"));
                list.add(m);
            }
        }catch (Exception e){
            
        }
        return list;
    }

    @Override
    public Mensaje list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean newM(Mensaje men) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delM(Mensaje men) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}

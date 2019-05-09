
package dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import beans.Mensaje;
import database.Db_Connection;

public class MensajeDAO {
	
	public ArrayList<Mensaje> obtenerMensajes(String destino){
		Connection cn = null;
		ArrayList<Mensaje> mensajes = null;
		Statement st;
		ResultSet rs;
		
		
		try{
			cn = Db_Connection.Connection();
			st = cn.createStatement();
			String tsql = "Select * from mensajes where destinatario = '"+
			destino+"'";
			rs = st.executeQuery(tsql);
			mensajes = new ArrayList<Mensaje>();
			
			while(rs.next()){
				Mensaje m = new  Mensaje(rs.getInt("idmensaje"),rs.getString("remitente"),rs.getString("destinatario"),rs.getString("texto"),rs.getString("fecha"));
				mensajes.add(m);
				
			}
			cn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return mensajes;
		
		
	}
	public void grabarMensaje(Mensaje m){
		Connection cn;
		Statement st;
		
		
		try{
			cn = Db_Connection.Connection();
			st = cn.createStatement();
			String tsql;
			tsql = " insert into mensajes values(null,";
			tsql+= "'"+m.getRemite()+"',";
			tsql+= "'"+m.getDestino()+"',";
			tsql+= "'"+m.getTexto()+"',";
			tsql+= "'"+m.getFecha()+"')";
			st.execute(tsql);
			cn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}	
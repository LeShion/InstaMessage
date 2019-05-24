/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import beans.Mensaje;
import beans.User;
import database.Db_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author estua
 */
public class MensajeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            Mensaje msj = new Mensaje();
            
            
            SimpleDateFormat fechaHora = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String convertido = fechaHora.format(date);
            
            msj.setFecha(convertido);
            msj.setRemitente(request.getParameter("remitente"));
            msj.setDestino(request.getParameter("destinatario"));
            msj.setAsunto(request.getParameter("asunto"));
            msj.setMensaje(request.getParameter("mensaje"));
            
            
           String accion = request.getParameter("accion");
           if(accion.equals("EnviarNuevo")){
               msj.setStatus(1);
                msj.NuevoMensaje();
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request,response);
               
           }else if(accion.equals("BandejaEntrada")){
                    try{
                    HttpSession sessionUser=request.getSession(false);  
                    String us=(String)sessionUser.getAttribute("user");

                    User user_of_InstaMessage = new User();
                    user_of_InstaMessage.setUser(us);
                    user_of_InstaMessage.GetUser();
                    String usuario = user_of_InstaMessage.getUser();
                                  
                    Connection cnx = Db_Connection.Connection();
                    PreparedStatement sta = cnx.prepareStatement("select Id_correo,fecha,Remitente,Destinatario,Asunto,Mensaje,Id_status_recibidos,Nom_stat from Correo INNER JOIN Recibidos on Correo.Id_correo = Recibidos.Id_correo_recibidos INNER JOIN Estatus on Recibidos.Id_status_recibidos = Estatus.id_status where Destinatario='"+usuario+"' order by fecha DESC");
                    ResultSet rs= sta.executeQuery();
                    
                    ArrayList<Mensaje> lista = new ArrayList<Mensaje>();
                    
                    while(rs.next()){
                        Mensaje e = new Mensaje(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getInt(7),
                                    rs.getString(8));
                        lista.add(e);
                    }
               
                    String clave = request.getParameter("id");
                    
                    request.setAttribute("lista2", clave);
                    
                    request.setAttribute("lista", lista);
                    
                    request.getRequestDispatcher("inboxView.jsp").forward(request, response);
               }catch(Exception e){}
               
               
              
               }else if(accion.equals("BandejaSalida")){
                   try{
                    HttpSession sessionUser=request.getSession(false);  
                    String us=(String)sessionUser.getAttribute("user");

                    User user_of_InstaMessage = new User();
                    user_of_InstaMessage.setUser(us);
                    user_of_InstaMessage.GetUser();
                    String usuario = user_of_InstaMessage.getUser();
                                  
                    Connection cnx = Db_Connection.Connection();
                    PreparedStatement sta = cnx.prepareStatement("select Correo.*, Estatus.Nom_stat from Correo join Estatus on Correo.Status = Estatus.Id_status where Remitente='"+usuario+"' order by fecha DESC");
                    ResultSet rs= sta.executeQuery();       
                    
                    ArrayList<Mensaje> lista = new ArrayList<Mensaje>();
                    
                    while(rs.next()){
                        Mensaje e = new Mensaje(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getInt(7),
                                    rs.getString(8));
                        lista.add(e);
                    }
               
                    
                    request.setAttribute("lista", lista);
                    
                    request.getRequestDispatcher("outboxView.jsp").forward(request, response);
               }catch(Exception e){} 
                    
               }else if(accion.equals("Eliminados")){
                    try{
                    HttpSession sessionUser=request.getSession(false);  
                    String us=(String)sessionUser.getAttribute("user");

                    User user_of_InstaMessage = new User();
                    user_of_InstaMessage.setUser(us);
                    user_of_InstaMessage.GetUser();
                    String usuario = user_of_InstaMessage.getUser();
                                  
                    Connection cnx = Db_Connection.Connection();
                    PreparedStatement sta = cnx.prepareStatement("select Id_correo,fecha,Remitente,Destinatario,Asunto,Mensaje,status_eliminado,Nom_stat from Correo INNER JOIN Eliminados on Correo.Id_correo = Eliminados.Id_correo_eliminado INNER JOIN Estatus on Eliminados.status_eliminado = Estatus.id_status where Destinatario='"+usuario+"' order by fecha DESC");
                    ResultSet rs= sta.executeQuery();
                    
                    ArrayList<Mensaje> lista = new ArrayList<Mensaje>();
                    
                    while(rs.next()){
                        Mensaje e = new Mensaje(rs.getInt(1),
                                    rs.getString(2),
                                    rs.getString(3),
                                    rs.getString(4),
                                    rs.getString(5),
                                    rs.getString(6),
                                    rs.getInt(7),
                                    rs.getString(8));
                        lista.add(e);
                    }
               
                    
                    request.setAttribute("lista", lista);
                    
                    request.getRequestDispatcher("removedMailsView.jsp").forward(request, response);
               }catch(Exception e){}
               
               
              
               }else if(accion.equals("Eliminar")){
                    int id = Integer.parseInt(request.getParameter("id"));
                    msj.setId(id);
                    msj.setStatus(6);
                    msj.EliminarMensaje();
                    RequestDispatcher rd = request.getRequestDispatcher("MensajeController?accion=BandejaEntrada");
                    rd.forward(request,response);
               }else if(accion.equals("Importante")){
                    int id = Integer.parseInt(request.getParameter("id"));
                    msj.setId(id);
                    msj.setStatus(4);
                    msj.EditStatus();
                    RequestDispatcher rd = request.getRequestDispatcher("MensajeController?accion=BandejaEntrada");
                    rd.forward(request,response);
               }else if(accion.equals("Urgente")){
                    int id = Integer.parseInt(request.getParameter("id"));
                    msj.setId(id);
                    msj.setStatus(5);
                    msj.EditStatus();
                    RequestDispatcher rd = request.getRequestDispatcher("MensajeController?accion=BandejaEntrada");
                    rd.forward(request,response);
               }
            
            
        }finally {out.close();}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

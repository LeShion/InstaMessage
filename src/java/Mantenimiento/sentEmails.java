/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mantenimiento;

import database.Db_Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author estua
 */
public class sentEmails extends HttpServlet {

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
            String accion = request.getParameter("accion");
            Connection cnx = Db_Connection.Connection();    
            
            if(accion.equals("EnviarNuevo")){
                int id=1;
                Date date = new Date();
                DateFormat date2 = new SimpleDateFormat("YYYY/MM/dd");              
                String fecha = date2.format(date);                
                String remitente = request.getParameter("remitente");
                String destinatario = request.getParameter("destinatario");
                String asunto = request.getParameter("asunto");
                String mensaje = request.getParameter("mensaje");
                int estado = 1;
                
                try{
                    PreparedStatement sta = cnx.prepareStatement("insert into Correo values(?,?,?,?,?,?,?)");
                    
                    sta.setInt(1, id);
                    sta.setString(2, fecha);
                    sta.setString(3, remitente);
                    sta.setString(4, destinatario);
                    sta.setString(5, asunto);
                    sta.setString(6, mensaje);
                    sta.setInt(7, estado);
                    sta.executeUpdate();
                    
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
                }catch(Exception e){
                    
                }
            }
        }
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

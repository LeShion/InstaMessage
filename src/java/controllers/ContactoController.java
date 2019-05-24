/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import beans.User;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author John
 */
public class ContactoController extends HttpServlet {

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
                
                User user = new User();

                user.setUser(request.getParameter("user"));
                user.setFirst_name(request.getParameter("first_name"));
                user.setLast_name(request.getParameter("last_name"));
                
                String accion = request.getParameter("accion");
                
                if(accion.equals("agregar")){
                    user.newContact();
                    user.setUser(String.valueOf(request.getParameter("user")));
                    RequestDispatcher rd = request.getRequestDispatcher("Contacts.jsp");
                    rd.forward(request,response);
                   /*     User us = new User();
                    us.setUser(String.valueOf(request.getParameter("user")));
                    us.GetUser();*/
                    
                    
                }  
                                    
                } finally {out.close();}             
                  
            }
    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
            processRequest(request, response);
        }
        
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
        {
            processRequest(request, response);
        }
        
        @Override
        public String getServletInfo() 
        {
            return "Short description";
        }
    
    }

 



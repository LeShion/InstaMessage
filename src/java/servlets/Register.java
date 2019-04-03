/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.*;
import clases.*;
import java.sql.*;
import java.util.regex.*;
import java.io.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author John
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    /*        try (PrintWriter out = response.getWriter()) {
             TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }*/
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
        response.sendRedirect("index.jsp");
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
        HttpSession respuesta = request.getSession(true);
        PrintWriter out = response.getWriter();
        // Se declaran e inician las variables
        String emailUsuario = request.getParameter("Alias");
        String nombreUsuario = request.getParameter("Nombre");
        String apellidoUsuario = request.getParameter("Apellido");
        String fechaNac = request.getParameter("Fecha_nac");
        String password = request.getParameter("Contrasenia");
        String confirm_password = request.getParameter("Contrasenia2");
        String preguntaSecreta = request.getParameter("Pregunta");
        String rSecreta = request.getParameter("Rsecreta");
        Pattern p = Pattern.compile("^([0-9a-zA-Z]([_.w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-w]*[0-9a-zA-Z].)+([a-zA-Z]{2,9}.)+[a-zA-Z]{2,3})$");
        Matcher m = p.matcher(emailUsuario);
        Validador v = new Validador();
        Dao d = new Dao();
        
        //inicio de las validaciones
        
        //Campos Vacios
        if(nombreUsuario.isEmpty() || emailUsuario.isEmpty() || password.isEmpty() || confirm_password.isEmpty() 
                || nombreUsuario.isEmpty() || apellidoUsuario.isEmpty() || fechaNac.isEmpty() || preguntaSecreta.isEmpty()
                || rSecreta.isEmpty()){
            respuesta.setAttribute("ERROR", "Por favor llene todos los campos.");
        }else{
        //No hay campos vacios. Se verifica que la direccion de email sea válida y la contraseña sea válida.
        if(v.isUsernameOrPasswordValid(password)){
            //Se verifica si la contraseña 1 y la confirmacion son iguales
            if(password.equals(confirm_password)){
                try{
                    d.conectar();
                        if(d.isEmailRegistered(emailUsuario)){
                            respuesta.setAttribute("ERROR", "Ya existe esta direccion de correo.");                           
                        } else{
                          // En este punto significa que todo esta bien y se ingresa a la DB
                          d.registerUser(emailUsuario, nombreUsuario, apellidoUsuario, fechaNac, password, preguntaSecreta, rSecreta);
                          respuesta.setAttribute("ERROR", null);
                        }
                        
                        d.desconectar();
                } catch(Exception e) {
                    out.println("Ocurrio la sig. Exception: " +e);
                }
            }else{
                respuesta.setAttribute("ERROR", "Las contraseñas no son Iguales!");
            }
        }else{
            respuesta.setAttribute("ERROR", "Contraseña No Válida");
        }
        }
        response.sendRedirect("register.jsp");
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

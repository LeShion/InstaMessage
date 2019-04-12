package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import beans.User;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet 
{
        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  
        {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            try 
            {
                User user = new User();

                user.setUser(request.getParameter("user"));
                user.setPwd(request.getParameter("pwd"));
                
                if(User.LoginUser(request.getParameter("user"),request.getParameter("pwd")))
                {
                    User us = new User();
                    us.setUser(String.valueOf(request.getParameter("user")));
                    us.GetUser();

                    HttpSession sessionUser = request.getSession();
                    sessionUser.setAttribute("user",us.getUser());

                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request,response);
                }  
                else
                {
                    out.println("<script src='js/sweetalert2.js'></script>");
                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    if("".equals(request.getParameter("user"))){
                        out.println("swal ( '¡Falta Usuario!' ,  ' ' ,  'error' );");
                    }else if("".equals(request.getParameter("pwd"))){
                        out.println("swal ( '¡Falta Contraseña!' ,  ' ' ,  'error' );");
                    }else{
                        out.println("swal ( '¡CREDENCIALES INVALIDAS!' ,  ' ' ,  'error' );");
                    }
                    out.println("});");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("login_form.jsp");
	       	    rd.include(request, response);
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
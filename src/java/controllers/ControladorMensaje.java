package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Mensaje;
import dao.MensajeDAO;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

public class ControladorMensaje extends HttpServlet {

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
String op = request.getParameter("operacion");
		if(op.equals("envio"))
			response.sendRedirect("envio.jsp");
		if(op.equals("grabar")){
			Mensaje men = (Mensaje)request.getAttribute("mensa");
			MensajeDAO md = new MensajeDAO();
			md.grabarMensaje(men);
			response.sendRedirect("index.jsp");
			
		}
		if(op.equals("muestra"))
			response.sendRedirect("mostrar.html");
		if(op.equals("ver")){
			MensajeDAO oper = new MensajeDAO();
			ArrayList<Mensaje> mensajes =oper.obtenerMensajes(request.getParameter("nombre"));
			request.setAttribute("mensajes",mensajes);
			RequestDispatcher rd = request.getRequestDispatcher("/ver.jsp");
			rd.forward(request, response);
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

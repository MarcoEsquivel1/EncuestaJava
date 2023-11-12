/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modeloDAO.MREJ_encuestaDAO;
import modeloDAO.MREJ_usuarioDAO;
import modelos.MREJ_cls_encuesta;
import modelos.MREJ_cls_usuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Marco
 */
@WebServlet(name = "encuestas", urlPatterns = {"/encuestas"})
public class encuestas extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet encuestas</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet encuestas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        if(session.getAttribute("nombre") == null) {
            request.getRequestDispatcher("/sesion").forward(request, response);
        }

        if((int)session.getAttribute("id_rol") != 1){
            request.getRequestDispatcher("/sesion").forward(request, response);
        }
        MREJ_encuestaDAO encuestaDAO = new MREJ_encuestaDAO();
        List<MREJ_cls_encuesta> encuestas = new ArrayList<>();
        if(session.getAttribute("name") != null) {
            encuestas = encuestaDAO.all_encuestas_name((String)session.getAttribute("name"));
        }else if (session.getAttribute("fecha") == null) {
            encuestas = encuestaDAO.all_encuestas();
        }else {
            String fecha = session.getAttribute("fecha").toString();
            encuestas = encuestaDAO.all_encuestas(fecha);
            session.setAttribute("fecha", null);
            session.setAttribute("name", null);
        }

        request.setAttribute("encuestas", encuestas);
        request.getRequestDispatcher("vistas/resultados/encuestas.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        if(request.getParameter("ok0") != null){
            if(request.getParameter("name") != null) {
                if (request.getParameter("name").equals("") || request.getParameter("name").equals(" ")) {
                    session.setAttribute("name", null);
                }else {
                    session.setAttribute("name", request.getParameter("name"));
                    System.out.println("name: " + request.getParameter("name"));
                }
            }
        }else if(request.getParameter("ok") != null) {
            if(request.getParameter("fecha") != null) {
                if (request.getParameter("fecha").equals("") || request.getParameter("fecha").equals(" ")) {
                    session.setAttribute("fecha", null);
                }else {
                    session.setAttribute("fecha", request.getParameter("fecha"));
                    System.out.println("Fecha: " + request.getParameter("fecha"));
                }
            }
        }else if(request.getParameter("ok2") != null){
            String [] id_encuesta = request.getParameterValues("eliminar");
            MREJ_encuestaDAO encuestaDAO = new MREJ_encuestaDAO();
            for (int i = 0; i < id_encuesta.length; i++) {
                MREJ_cls_encuesta encuesta = encuestaDAO.encuesta(Integer.parseInt(id_encuesta[i]));
                MREJ_cls_usuario usuario = new MREJ_cls_usuario();
                usuario.setId(encuesta.getId_usuario());
                usuario.setEncuestado((byte) 0);
                MREJ_usuarioDAO usuarioDAO = new MREJ_usuarioDAO();
                boolean success = encuestaDAO.eliminar(Integer.parseInt(id_encuesta[i]));
                //update encuestado usuario
                if(success){
                    usuarioDAO.updateEncuestado(usuario);
                }
            }
        }

        response.sendRedirect("/encuestas");
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

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
import java.util.Date;
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
@WebServlet(name = "encuesta", urlPatterns = {"/encuesta"})
public class encuesta extends HttpServlet {

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
            out.println("<title>Servlet encuesta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet encuesta at " + request.getContextPath() + "</h1>");
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
        //show encuesta.jsp
        HttpSession session = request.getSession();

        if(session.getAttribute("nombre") == null) {
            request.getRequestDispatcher("/sesion").forward(request, response);
        }

        if((int)session.getAttribute("id_rol") != 2){
            request.getRequestDispatcher("/sesion").forward(request, response);
        }

        if((byte)session.getAttribute("encuestado") == (byte)0){
            request.getRequestDispatcher("vistas/encuesta/index.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("vistas/encuesta/verencuesta.jsp").forward(request, response);
        }
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
        HttpSession sesion = request.getSession();
        MREJ_cls_encuesta encuesta = new MREJ_cls_encuesta();
        encuesta.setId_usuario((int)sesion.getAttribute("id"));
        encuesta.setDate(new Date());
        encuesta.setNombre(sesion.getAttribute("nombre").toString());
        encuesta.setSexo(Integer.parseInt(request.getParameter("sexo")));
        encuesta.setDep_fav(Integer.parseInt(request.getParameter("dep_fav")));
        encuesta.setNivel_estudio(Integer.parseInt(request.getParameter("nivel_estudio")));
        encuesta.setTema_fav(Integer.parseInt(request.getParameter("tema_fav")));

        MREJ_encuestaDAO encuestaDAO = new MREJ_encuestaDAO();
        boolean success = encuestaDAO.agregar(encuesta);
        if(success){
            MREJ_cls_usuario usuario = new MREJ_cls_usuario();
            usuario.setId((int)sesion.getAttribute("id"));
            usuario.setEncuestado((byte)1);

            MREJ_usuarioDAO usuarioDAO = new MREJ_usuarioDAO();
            boolean success2 = usuarioDAO.updateEncuestado(usuario);
            if(success2) {
                sesion.setAttribute("encuestado", (byte)1);
                MREJ_cls_encuesta encuesta2 = usuarioDAO.getEncuesta(usuario);
                sesion.setAttribute("encuesta", encuesta2);
                response.sendRedirect("encuesta");
            } else {
                response.sendRedirect("encuesta");
            }
        }else{
            response.sendRedirect("encuesta");
        }
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import modeloDAO.MREJ_usuarioDAO;
import modelos.MREJ_cls_encuesta;
import modelos.MREJ_cls_usuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Iterator;
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
@WebServlet(name = "sesion", urlPatterns = {"/sesion"})
public class sesion extends HttpServlet {

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
            out.println("<title>Servlet sesion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sesion at " + request.getContextPath() + "</h1>");
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
        HttpSession sesion = request.getSession();
        //validate sesion and close it
        if(sesion.getAttribute("nombre") != null) {
            request.getRequestDispatcher("vistas/index.jsp").forward(request, response);
        }
        request.getRequestDispatcher("vistas/login/index.jsp").forward(request, response);
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

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        MREJ_cls_usuario usuario = new MREJ_cls_usuario();
        usuario.setUsername(username);
        usuario.setPassword(password);

        MREJ_cls_usuario usuario2;

        MREJ_usuarioDAO usuarioDAO = new MREJ_usuarioDAO();

        List<MREJ_cls_usuario> lista = usuarioDAO.login(usuario);

        MREJ_cls_usuario per=null;

        try( PrintWriter out = response.getWriter()) {
            if (lista.isEmpty()) {
                out.print("No hay registros");
                String acceso = "vistas/login/";

                response.sendRedirect(acceso+"?foo=Datos incorrectos");
            } else {
                Iterator<MREJ_cls_usuario> it = lista.iterator();
                HttpSession sesion = request.getSession();

                while (it.hasNext()) {
                    per = it.next();
                    sesion.setAttribute("id", per.getId());
                    sesion.setAttribute("username", per.getUsername());
                    sesion.setAttribute("password", per.getPassword());
                    sesion.setAttribute("id_rol", per.getRol_id());
                    sesion.setAttribute("id_usuario", per.getId());
                    sesion.setAttribute("nombre", per.getNombre());
                    sesion.setAttribute("encuestado", per.getEncuestado());
                    if (per.getEncuestado()==1){
                        MREJ_cls_encuesta encuesta = usuarioDAO.getEncuesta(per);
                        sesion.setAttribute("encuesta", encuesta);

                    }
                    response.sendRedirect("/sesion");
                }
            }
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

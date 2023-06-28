package com.emergentes.controlador;

import com.emergentes.dao.InicioDAO;
import com.emergentes.dao.InicioDAOimpl;
import com.emergentes.modelo.Inicio;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "InicioControlador", urlPatterns = {"/InicioControlador"})
public class InicioControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Inicio ini = new Inicio();
            int id;
            InicioDAO dao = new InicioDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "view":
                    List<Inicio> lista = dao.getAll();
                    request.setAttribute("inicio", lista);
                    request.getRequestDispatcher("inicio.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }



    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("InicioControlador");
    }
}


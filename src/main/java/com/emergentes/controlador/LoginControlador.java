package com.emergentes.controlador;

import com.emergentes.utiles.ConexionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})
public class LoginControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (request.getParameter("action") == null) ? "view" : request.getParameter("action");
        if (action.equals("logout")) {
            HttpSession ses = request.getSession();
            ses.invalidate();
        }
        response.sendRedirect("login.jsp");
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            String sql = "SELECT * FROM usuarios WHERE usuario = ? AND password = sha1(?)";
            ResultSet rs;
            
            ConexionDB cn = new ConexionDB();
            Connection con = cn.conectar();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession ses = request.getSession();
                ses.setAttribute("login", "OK");
                ses.setAttribute("usuario", rs.getString("nombre") + " " + rs.getString("tipo_usuario"));
                response.sendRedirect("InicioControlador");
            } else {
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException ex) {
            System.out.println("Error al autenticar " +"");
        }
    }


}

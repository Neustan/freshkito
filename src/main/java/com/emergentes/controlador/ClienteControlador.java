package com.emergentes.controlador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.modelo.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Neustan Choque
 */
@WebServlet(name = "ClienteControlador", urlPatterns = {"/ClienteControlador"})
public class ClienteControlador extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            Cliente cli = new Cliente();
            int id_usuario;
            ClienteDAO dao = new ClienteDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch(action){
                case "add":
                    request.setAttribute("usuarios", cli);
                    request.getRequestDispatcher("frmclientes.jsp").forward(request, response);
                    break;
                case "edit":
                    id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
                    cli = dao.getById(id_usuario);
                    request.setAttribute("usuarios", cli);
                    request.getRequestDispatcher("frmclientes.jsp").forward(request, response);
                    break;
                case "delete":
                    id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
                    dao.delete(id_usuario);
                    response.sendRedirect("ClienteControlador");
                    break;
                case "view":
                    List<Cliente> lista = dao.getAll();
                    request.setAttribute("usuarios", lista);
                    request.getRequestDispatcher("clientes.jsp").forward(request, response);
                    break;
                
            }
        }catch(Exception ex){
            System.out.println("Error "+ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        String nombre = request.getParameter("nombre");
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String tipo_usuario = request.getParameter("tipo_usuario");
        
        Cliente cli = new Cliente();
        cli.setId_usuario(id_usuario);
        cli.setNombre(nombre);
        cli.setUsuario(usuario);
        cli.setPassword(password);
        cli.setTipo_usuario(tipo_usuario);
        ClienteDAO dao = new ClienteDAOimpl();
        
        if(id_usuario == 0){
            try {
                //nuevo
                dao.insert(cli);
            } catch (Exception ex) {
                System.out.println("Error al insertar"+ ex.getMessage());
            }
        }
        else{
            try {
                //editar
                dao.update(cli);
            } catch (Exception ex) {
                System.out.println("Error al editar"+ ex.getMessage());
                }
            }
        response.sendRedirect("ClienteControlador");
    }
}


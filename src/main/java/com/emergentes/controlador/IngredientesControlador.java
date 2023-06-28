package com.emergentes.controlador;

import com.emergentes.dao.IngredientesDAO;
import com.emergentes.dao.IngredientesDAOimpl;
import com.emergentes.modelo.Ingredientes;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "IngredientesControlador", urlPatterns = {"/IngredientesControlador"})
public class IngredientesControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Ingredientes ing = new Ingredientes();
            int id_ingrediente;
            IngredientesDAO dao = new IngredientesDAOimpl();
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    request.setAttribute("ingredientes", ing);
                    request.getRequestDispatcher("frmingredientes.jsp").forward(request, response);
                    break;
                case "edit":
                    id_ingrediente = Integer.parseInt(request.getParameter("id_ingrediente"));
                    ing = dao.getById(id_ingrediente);
                    request.setAttribute("ingredientes", ing);
                    request.getRequestDispatcher("frmingredientes.jsp").forward(request, response);
                    break;
                case "delete":
                    id_ingrediente = Integer.parseInt(request.getParameter("id_ingrediente"));
                    dao.delete(id_ingrediente);
                    response.sendRedirect("IngredientesControlador");
                    break;
                case "view":
                    List<Ingredientes> lista = dao.getAll();
                    request.setAttribute("ingredientes", lista);
                    request.getRequestDispatcher("ingredientes.jsp").forward(request, response);
                    break;

            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_ingrediente = Integer.parseInt(request.getParameter("id_ingrediente"));
        String nombre_ingrediente = request.getParameter("nombre_ingrediente");
        double precio_ingrediente = Double.parseDouble(request.getParameter("precio_ingrediente"));
        String estado_ingrediente = request.getParameter("estado_ingrediente");
        
        Ingredientes ing = new Ingredientes();
        ing.setId_ingrediente(id_ingrediente);
        ing.setNombre_ingrediente(nombre_ingrediente);
        ing.setPrecio_ingrediente(precio_ingrediente);
        ing.setEstado_ingrediente(estado_ingrediente);
        
        IngredientesDAO dao = new IngredientesDAOimpl();

        if (id_ingrediente == 0) {
            try {
                //nuevo
                dao.insert(ing);
            } catch (Exception ex) {
                System.out.println("Error al insertar" + ex.getMessage());
            }
        } else {
            try {
                //editar
                dao.update(ing);
            } catch (Exception ex) {
                System.out.println("Error al editar" + ex.getMessage());
            }
        }
        response.sendRedirect("IngredientesControlador");
    }

}

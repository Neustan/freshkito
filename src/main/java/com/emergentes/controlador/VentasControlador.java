package com.emergentes.controlador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.dao.VentaDAO;
import com.emergentes.dao.VentaDAOimpl;
import com.emergentes.modelo.Cliente;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "VentasControlador", urlPatterns = {"/VentasControlador"})
public class VentasControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            Venta ven = new Venta();
            int id;
            VentaDAO dao = new VentaDAOimpl();
            ProductoDAO daoProducto = new ProductoDAOimpl();
            ClienteDAO daoCliente = new ClienteDAOimpl();
            
            List<Producto> lista_productos = null;
            List<Cliente> lista_clientes = null;
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch(action){
                case "add":
                    lista_productos = daoProducto.getAll();
                    lista_clientes = daoCliente.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("lista_clientes", lista_clientes);
                    request.setAttribute("ventas", ven);
                    request.getRequestDispatcher("frmventas.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    ven = dao.getById(id);
                    lista_productos = daoProducto.getAll();
                    lista_clientes = daoCliente.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("lista_clientes", lista_clientes);
                    request.setAttribute("ventas", ven);
                    request.getRequestDispatcher("frmventas.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("VentasControlador");
                    break;
                case "view":
                    List<Venta> lista = dao.getAll();
                    request.setAttribute("ventas", lista);
                    request.getRequestDispatcher("ventas.jsp").forward(request, response);
                    break;
                
            }
        }catch(Exception ex){
            System.out.println("Error "+ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
        String razon_social = request.getParameter("razon_social");
        int nit = Integer.parseInt(request.getParameter("nit"));
        int codigo_producto = Integer.parseInt(request.getParameter("codigo_producto"));
        
        Venta ven = new Venta();
        ven.setId_pedido(id_pedido);
        ven.setRazon_social(razon_social);
        ven.setNit_factura(nit);
        ven.setCodigo_producto(codigo_producto);
        
        VentaDAO dao = new VentaDAOimpl();
        if(id_pedido == 0){
            try {
                //nuevo
                dao.insert(ven);
            } catch (Exception ex) {
                System.out.println("Error al insertar"+ ex.getMessage());
            }
        }
        else{
            try {
                //editar
                dao.update(ven);
            } catch (Exception ex) {
                System.out.println("Error al editar"+ ex.getMessage());
                }
            }
        response.sendRedirect("InicioControlador");
    }
        public Date convierteFecha(String fecha)
        {
            Date fechaBD = null;
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date fechaTMP;
        try {
            fechaTMP = formato.parse(fecha);
            fechaBD = new Date(fechaTMP.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(VentasControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
            return fechaBD;
        }  
}
        

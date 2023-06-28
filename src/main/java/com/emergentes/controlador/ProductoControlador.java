package com.emergentes.controlador;

import com.emergentes.dao.IngredientesDAO;
import com.emergentes.dao.IngredientesDAOimpl;
import com.emergentes.dao.ProductoDAO;
import javax.servlet.annotation.MultipartConfig;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Ingredientes;
import com.emergentes.modelo.Producto;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Producto pro = new Producto();
            int id_producto;
            ProductoDAO daoProducto = new ProductoDAOimpl();
            IngredientesDAO daoIngredientes = new IngredientesDAOimpl();
            
            List<Producto> lista_productos = null;
            List<Ingredientes> lista_ingredientes = null;
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch (action) {
                case "add":
                    lista_ingredientes = daoIngredientes.getAll();
                    request.setAttribute("lista_ingredientes", lista_ingredientes);
                    request.setAttribute("producto", pro);
                    request.getRequestDispatcher("frmproductos.jsp").forward(request, response);
                    break;
                case "edit":
                    id_producto = Integer.parseInt(request.getParameter("id_producto"));
                    pro = daoProducto.getById(id_producto);
                    lista_ingredientes = daoIngredientes.getAll();
                    request.setAttribute("lista_ingredientes", lista_ingredientes);
                    request.setAttribute("producto", pro);
                    request.getRequestDispatcher("frmproductos.jsp").forward(request, response);
                    break;
                case "delete":
                    id_producto = Integer.parseInt(request.getParameter("id_producto"));
                    daoProducto.delete(id_producto);
                    lista_ingredientes = daoIngredientes.getAll();
                    request.setAttribute("lista_ingredientes", lista_ingredientes);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "view":
                    List<Producto> lista = daoProducto.getAll();
                    request.setAttribute("producto", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;

            }
        } catch (Exception ex) {
            System.out.println("Error " + ex.getMessage());
        }
    }
    static final int CHUNK_SIZE = 1024 * 4;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre_img = request.getParameter("dir_imagen");
        Part filePart = request.getPart("imagen_catalogo"); // Retrieves <input type="file" name="file">
        String originalFileName = filePart.getSubmittedFileName();
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        String newFileName = ""+nombre_img+""+fileExtension;
        //String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        InputStream fileContent = filePart.getInputStream();
        String path = request.getServletContext().getRealPath("images/");
        File img = new File(path, newFileName);
        try (InputStream input = fileContent) {
            Files.copy(input, img.toPath());
        }
        
        int id_producto = Integer.parseInt(request.getParameter("id_producto"));
        String nombre_producto = request.getParameter("nombre_producto");
        String dir_imagen = newFileName;
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        int cod_capa1 = Integer.parseInt(request.getParameter("cod_capa1"));
        int cod_capa2 = Integer.parseInt(request.getParameter("cod_capa2"));
        int cod_capa3 = Integer.parseInt(request.getParameter("cod_capa3"));
        int cod_jalea1 = Integer.parseInt(request.getParameter("cod_jalea1"));
        int cod_jalea2 = Integer.parseInt(request.getParameter("cod_jalea2"));
        int cod_jalea3 = Integer.parseInt(request.getParameter("cod_jalea3"));
        int cod_chispas1 = Integer.parseInt(request.getParameter("cod_chispas1"));
        int cod_chispas2 = Integer.parseInt(request.getParameter("cod_chispas2"));
        String estado_producto = request.getParameter("estado_producto");
        
        Producto pro = new Producto();
        pro.setId_producto(id_producto);
        pro.setNombre_producto(nombre_producto);
        pro.setDir_imagen(dir_imagen);
        pro.setPrecio(precio);
        pro.setDescripcion(descripcion);
        pro.setCod_capa1(cod_capa1);
        pro.setCod_capa2(cod_capa2);
        pro.setCod_capa3(cod_capa3);
        pro.setCod_jalea1(cod_jalea1);
        pro.setCod_jalea2(cod_jalea2);
        pro.setCod_jalea3(cod_jalea3);
        pro.setCod_chispas1(cod_chispas1);
        pro.setCod_chispas2(cod_chispas2);
        pro.setEstado_producto(estado_producto);
        ProductoDAO dao = new ProductoDAOimpl();

        if (id_producto == 0) {
            try {
                //nuevo
                dao.insert(pro);
            } catch (Exception ex) {
                System.out.println("Error al insertar" + ex.getMessage());
            }
        } else {
            try {
                //editar
                dao.update(pro);
            } catch (Exception ex) {
                System.out.println("Error al editar" + ex.getMessage());
            }
        }
        response.sendRedirect("ProductoControlador");
    }

}

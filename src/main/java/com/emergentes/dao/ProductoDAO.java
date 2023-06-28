package com.emergentes.dao;

import com.emergentes.modelo.Producto;
import java.util.List;

/**
 *
 * @author Neustan Choque
 */
public interface ProductoDAO {
    public void insert(Producto producto) throws Exception;
    public void update(Producto producto) throws Exception;
    public void delete(int id_producto) throws Exception;
    public Producto getById(int id_producto) throws Exception;
    public List<Producto> getAll() throws Exception;
}

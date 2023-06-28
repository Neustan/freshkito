package com.emergentes.dao;

import com.emergentes.modelo.Ingredientes;
import java.util.List;

public interface IngredientesDAO {
    public void insert(Ingredientes ingredientes) throws Exception;
    public void update(Ingredientes ingredientes) throws Exception;
    public void delete(int id_ingrediente) throws Exception;
    public Ingredientes getById(int id_ingrediente) throws Exception;
    public List<Ingredientes> getAll() throws Exception;
}

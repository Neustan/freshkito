package com.emergentes.dao;

import com.emergentes.modelo.Inicio;
import java.util.List;

public interface InicioDAO {

    public void insert(Inicio inicio) throws Exception;

    public void update(Inicio inicio) throws Exception;

    public void delete(int id) throws Exception;

    public Inicio getById(int id) throws Exception;

    public List<Inicio> getAll() throws Exception;
}

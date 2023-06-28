package com.emergentes.dao;

import com.emergentes.modelo.Ingredientes;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class IngredientesDAOimpl extends ConexionDB implements IngredientesDAO {

    @Override
    public void insert(Ingredientes ingredientes) throws Exception {
        try {
            this.conectar();
            
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO ingredientes (Id_ingrediente,Nombre_ingrediente,Precio_ingrediente,Estado_ingrediente) VALUES (?,?,?,?)");
            ps.setInt(1, ingredientes.getId_ingrediente());
            ps.setString(2, ingredientes.getNombre_ingrediente());
            ps.setDouble(3, ingredientes.getPrecio_ingrediente());
            ps.setString(4, ingredientes.getEstado_ingrediente());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Ingredientes ingredientes) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE ingredientes SET Nombre_ingrediente=?,Precio_ingrediente=?,Estado_ingrediente=? WHERE Id_ingrediente=?");
            ps.setString(1, ingredientes.getNombre_ingrediente());
            ps.setDouble(2, ingredientes.getPrecio_ingrediente());
            ps.setString(3, ingredientes.getEstado_ingrediente());
            ps.setInt(4, ingredientes.getId_ingrediente());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id_ingrediente) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM ingredientes WHERE Id_ingrediente=?");
            ps.setInt(1, id_ingrediente);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Ingredientes getById(int id_ingrediente) throws Exception {
        Ingredientes ing = new Ingredientes();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM ingredientes WHERE Id_ingrediente=?");
            ps.setInt(1, id_ingrediente);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ing.setId_ingrediente(rs.getInt("Id_ingrediente"));
                ing.setNombre_ingrediente(rs.getString("Nombre_ingrediente"));
                ing.setPrecio_ingrediente(rs.getDouble("Precio_ingrediente"));
                ing.setEstado_ingrediente(rs.getString("Estado_ingrediente"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return ing;
    }

    @Override
    public List<Ingredientes> getAll() throws Exception {
        List<Ingredientes> lista = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM ingredientes");
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Ingredientes>();
            while (rs.next()) {
                Ingredientes ing = new Ingredientes();
                ing.setId_ingrediente(rs.getInt("Id_ingrediente"));
                ing.setNombre_ingrediente(rs.getString("Nombre_ingrediente"));
                ing.setPrecio_ingrediente(rs.getDouble("Precio_ingrediente"));
                ing.setEstado_ingrediente(rs.getString("Estado_ingrediente"));
                lista.add(ing);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
}

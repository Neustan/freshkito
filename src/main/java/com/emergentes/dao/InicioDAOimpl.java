
package com.emergentes.dao;

import com.emergentes.modelo.Inicio;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class InicioDAOimpl extends ConexionDB implements InicioDAO {

    @Override
    public void insert(Inicio inicio) throws Exception {
        }

    @Override
    public void update(Inicio inicio) throws Exception {
        }

    @Override
    public void delete(int id) throws Exception {
        }

    @Override
    public Inicio getById(int id) throws Exception {
        return null;
    }

    @Override
    public List<Inicio> getAll() throws Exception {
         List<Inicio> lista = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM productos WHERE Estado_producto='Disponible'");
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Inicio>();
            while (rs.next()) {
                Inicio ini = new Inicio();
                ini.setId(rs.getInt("Id_producto"));
                ini.setNombre(rs.getString("Nombre_producto"));
                ini.setImagen(rs.getString("Dir_imagen"));
                ini.setDescripcion(rs.getString("Descripcion"));
                ini.setPrecio(rs.getDouble("Precio"));
                ini.setCod_capa1(rs.getInt("cod_capa1"));
                ini.setCod_capa2(rs.getInt("cod_capa2"));
                ini.setCod_capa3(rs.getInt("cod_capa3"));
                ini.setCod_jalea1(rs.getInt("cod_jalea1"));
                ini.setCod_jalea2(rs.getInt("cod_jalea2"));
                ini.setCod_jalea3(rs.getInt("cod_jalea3"));
                ini.setCod_chispas1(rs.getInt("cod_chispas1"));
                ini.setCod_chispas2(rs.getInt("cod_chispas2"));
                ini.setEstado(rs.getString("Estado_producto"));
                lista.add(ini);
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
    


package com.emergentes.dao;

import com.emergentes.utiles.ConexionDB;
import com.emergentes.modelo.Producto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Neustan Choque
 */
public class ProductoDAOimpl extends ConexionDB implements ProductoDAO {

    @Override
    public void insert(Producto producto) throws Exception {
        try {
            this.conectar();
            
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO productos (Nombre_producto,Dir_imagen,Precio,Descripcion,Cod_capa1,Cod_capa2,Cod_capa3,Cod_jalea1,Cod_jalea2,Cod_jalea3,Cod_chispas1,Cod_chispas2,Estado_producto) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, producto.getNombre_producto());
            ps.setString(2, producto.getDir_imagen());
            ps.setDouble(3, producto.getPrecio());
            ps.setString(4, producto.getDescripcion());
            ps.setInt(5, producto.getCod_capa1());
            ps.setInt(6, producto.getCod_capa2());
            ps.setInt(7, producto.getCod_capa3());
            ps.setInt(8, producto.getCod_jalea1());
            ps.setInt(9, producto.getCod_jalea2());
            ps.setInt(10, producto.getCod_jalea3());
            ps.setInt(11, producto.getCod_chispas1());
            ps.setInt(12, producto.getCod_chispas2());
            ps.setString(13, producto.getEstado_producto());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Producto producto) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE productos SET Nombre_producto=?,Dir_imagen=?,Precio=?,Descripcion=?,Cod_capa1=?,Cod_capa2=?,Cod_capa3=?,Cod_jalea1=?,Cod_jalea2=?,Cod_jalea3=?,Cod_chispas1=?,Cod_chispas2=?,Estado_producto=? WHERE Id_producto=?");
            ps.setString(1, producto.getNombre_producto());
            ps.setString(2, producto.getDir_imagen());
            ps.setDouble(3, producto.getPrecio());
            ps.setString(4, producto.getDescripcion());
            ps.setInt(5, producto.getCod_capa1());
            ps.setInt(6, producto.getCod_capa2());
            ps.setInt(7, producto.getCod_capa3());
            ps.setInt(8, producto.getCod_jalea1());
            ps.setInt(9, producto.getCod_jalea2());
            ps.setInt(10, producto.getCod_jalea3());
            ps.setInt(11, producto.getCod_chispas1());
            ps.setInt(12, producto.getCod_chispas2());
            ps.setString(13, producto.getEstado_producto());
            ps.setInt(14, producto.getId_producto());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id_producto) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM productos WHERE Id_producto=?");
            ps.setInt(1, id_producto);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Producto getById(int id_producto) throws Exception {
        Producto pro = new Producto();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM productos WHERE Id_producto=?");
            ps.setInt(1, id_producto);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pro.setId_producto(rs.getInt("Id_producto"));
                pro.setNombre_producto(rs.getString("Nombre_producto"));
                pro.setDir_imagen(rs.getString("Dir_imagen"));
                pro.setPrecio(rs.getDouble("Precio"));
                pro.setDescripcion(rs.getString("Descripcion"));
                pro.setCod_capa1(rs.getInt("Cod_capa1"));
                pro.setCod_capa2(rs.getInt("Cod_capa2"));
                pro.setCod_capa3(rs.getInt("Cod_capa3"));
                pro.setCod_jalea1(rs.getInt("Cod_jalea1"));
                pro.setCod_jalea2(rs.getInt("Cod_jalea2"));
                pro.setCod_jalea3(rs.getInt("Cod_jalea3"));
                pro.setCod_chispas1(rs.getInt("Cod_chispas1"));
                pro.setCod_chispas2(rs.getInt("Cod_chispas2"));
                pro.setEstado_producto(rs.getString("Estado_producto"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return pro;
    }

    @Override
    public List<Producto> getAll() throws Exception {
        List<Producto> lista = null;
        try {
            this.conectar();
            String sql= "SELECT p.*,i1.Nombre_ingrediente AS capa1, i2.Nombre_ingrediente AS capa2,i3.Nombre_ingrediente AS capa3, "
                    + " i4.Nombre_ingrediente AS jalea1, i5.Nombre_ingrediente AS jalea2,i6.Nombre_ingrediente AS jalea3, "
                    + " i7.Nombre_ingrediente AS chispas1, i8.Nombre_ingrediente AS chispas2 FROM productos p ";
            sql += "LEFT JOIN ingredientes i1 ON i1.id_ingrediente=p.cod_capa1 ";
            sql += "LEFT JOIN ingredientes i2 ON i2.id_ingrediente=p.cod_capa2 ";
            sql += "LEFT JOIN ingredientes i3 ON i3.id_ingrediente=p.cod_capa3 ";
            sql += "LEFT JOIN ingredientes i4 ON i4.id_ingrediente=p.cod_jalea1 ";
            sql += "LEFT JOIN ingredientes i5 ON i5.id_ingrediente=p.cod_jalea2 ";
            sql += "LEFT JOIN ingredientes i6 ON i6.id_ingrediente=p.cod_jalea3 ";
            sql += "LEFT JOIN ingredientes i7 ON i7.id_ingrediente=p.cod_chispas1 ";
            sql += "LEFT JOIN ingredientes i8 ON i8.id_ingrediente=p.cod_chispas2 ";
            PreparedStatement ps = this.conn.prepareStatement (sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Producto>();
            while (rs.next()) {
                Producto pro = new Producto();
                pro.setId_producto(rs.getInt("Id_producto"));
                pro.setNombre_producto(rs.getString("Nombre_producto"));
                pro.setDir_imagen(rs.getString("Dir_imagen"));
                pro.setPrecio(rs.getDouble("Precio"));
                pro.setDescripcion(rs.getString("Descripcion"));
                pro.setCapa1(rs.getString("capa1"));
                pro.setCapa2(rs.getString("capa2"));
                pro.setCapa3(rs.getString("capa3"));
                pro.setJalea1(rs.getString("jalea1"));
                pro.setJalea2(rs.getString("jalea2"));
                pro.setJalea3(rs.getString("jalea3"));
                pro.setChispas1(rs.getString("chispas1"));
                pro.setChispas2(rs.getString("chispas2"));
                pro.setEstado_producto(rs.getString("Estado_producto"));
                lista.add(pro);
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

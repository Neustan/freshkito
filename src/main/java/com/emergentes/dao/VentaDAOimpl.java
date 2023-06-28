package com.emergentes.dao;

import com.emergentes.utiles.ConexionDB;
import com.emergentes.modelo.Venta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Neustan Choque
 */
public class VentaDAOimpl extends ConexionDB implements VentaDAO {

    @Override
    public void insert(Venta venta) throws Exception {
        try {

            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
            String fecha_actual = ft.format(dNow);
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO pedidos (Id_pedido,Id_usuario,Razon_social,Nit_factura,Fecha,Estado_pedido) VALUES (?,?,?,?,?,?)");
            ps.setInt(1, venta.getId_pedido());
            ps.setInt(2, 1);
            ps.setString(3, venta.getRazon_social());
            ps.setInt(4, venta.getNit_factura());
            ps.setString(5, ft.format(dNow));
            ps.setString(6, "Pendiente");

            ps.executeUpdate();
            
            int codigo_pedido=0;
            PreparedStatement ps2 = this.conn.prepareStatement("SELECT * FROM pedidos "
                    + "WHERE Razon_social='"+venta.getRazon_social()+"' AND Nit_factura='"+venta.getNit_factura()+"' AND Fecha='"+fecha_actual+"' ");
            ResultSet rs;
            rs = ps2.executeQuery();
            while (rs.next()) {
                codigo_pedido = rs.getInt("Id_pedido");
            }
            
            PreparedStatement ps3 = this.conn.prepareStatement("INSERT INTO detalle_pedido (Id_detalle_pedido,Id_pedido) VALUES (?,?)");
            ps3.setInt(1, venta.getId_detalle_pedido());
            ps3.setInt(2, codigo_pedido);
            ps3.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Venta venta) throws Exception {
        
    }

    @Override
    public void delete(int id) throws Exception {
        return;
    }

    @Override
    public Venta getById(int id) throws Exception {
        return null;
    }

    @Override
    public List<Venta> getAll() throws Exception {
        return null;
    }

}

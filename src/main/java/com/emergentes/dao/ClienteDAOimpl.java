package com.emergentes.dao;

import com.emergentes.modelo.Cliente;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Neustan Choque
 */
public class ClienteDAOimpl extends ConexionDB implements ClienteDAO {

    @Override
    public void insert(Cliente cliente) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO usuarios (nombre,usuario,password,tipo_usuario) VALUES (?,?,sha1(?),?)");
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getUsuario());
            ps.setString(3, cliente.getPassword());
            ps.setString(4, cliente.getTipo_usuario());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Cliente cliente) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE usuarios SET nombre=?,usuario=?,password=sha1(?),tipo_usuario=? WHERE id_usuario=?");
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getUsuario());
            ps.setString(3, cliente.getPassword());
            ps.setString(4, cliente.getTipo_usuario());
            ps.setInt(5, cliente.getId_usuario());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id_usuario) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM usuarios WHERE id_usuario=?");
            ps.setInt(1, id_usuario);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Cliente getById(int id_usuario) throws Exception {
        Cliente cli = new Cliente();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM usuarios WHERE id_usuario=?");
            ps.setInt(1, id_usuario);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cli.setId_usuario(rs.getInt("id_usuario"));
                cli.setNombre(rs.getString("nombre"));
                cli.setUsuario(rs.getString("usuario"));
                cli.setPassword(rs.getString("password"));
                cli.setTipo_usuario(rs.getString("tipo_usuario"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return cli;
    }

    @Override
    public List<Cliente> getAll() throws Exception {
        List<Cliente> lista = null;
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM usuarios");
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Cliente>();
            while (rs.next()) {
                Cliente cli = new Cliente();
                cli.setId_usuario(rs.getInt("id_usuario"));
                cli.setNombre(rs.getString("nombre"));
                cli.setUsuario(rs.getString("usuario"));
                cli.setPassword(rs.getString("password"));
                cli.setTipo_usuario(rs.getString("tipo_usuario"));
                lista.add(cli);
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

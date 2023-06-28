package com.emergentes.utiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Neustan Choque
 */
public class Validate extends ConexionDB{
    Connection con = this.conectar();
    PreparedStatement ps;
    public boolean checkUser(String usuario, String password){
        boolean resultado = false;
        try {
            String sql = "SELECT * FROM usuarios WHERE usuario = ? AND password = sha1(?)";
            ps = con.prepareStatement(sql);
            ps.setString(1,usuario);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            resultado = rs.next();
        } catch (SQLException ex) {
            System.out.println("Error al autenticar "+"");
        }
        return resultado;
    }
}

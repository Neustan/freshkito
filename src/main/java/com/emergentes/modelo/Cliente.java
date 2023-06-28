package com.emergentes.modelo;

public class Cliente {
    private int id_usuario;
    private String nombre;
    private String usuario;
    private String password;
    private String tipo_usuario;

    public Cliente() {
    }
    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }


    @Override
    public String toString() {
        return "Cliente{" + "id_usuario=" + id_usuario + ", nombre=" + nombre + ", usuario=" + usuario + ", password=" + password + ", tipo_usuario=" + tipo_usuario + '}';
    }
    
    
}

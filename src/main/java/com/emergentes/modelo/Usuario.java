package com.emergentes.modelo;

public class Usuario {
  private int id;
  private String nombres;
  private String usuario;
  private String password;
  private String tipo_usuario;

    public Usuario() {
        this.id = 0;
        this.nombres = "";
        this.usuario = "";
        this.password = "";
        this.tipo_usuario = "";
    }

    public String getTipo_usuario() {
        return tipo_usuario;
    }

    public void setTipo_usuario(String tipo_usuario) {
        this.tipo_usuario = tipo_usuario;
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
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

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nombres=" + nombres + ", usuario=" + usuario + ", password=" + password + ", tipo_usuario=" + tipo_usuario + '}';
    }

}

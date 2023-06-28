package com.emergentes.modelo;


public class Producto {
   private int id_producto;
   private String nombre_producto;
   private String  dir_imagen;
   private double precio;
   private String descripcion;
   private int cod_capa1;
   private int cod_capa2;
   private int cod_capa3;
   private int cod_jalea1;
   private int cod_jalea2;
   private int cod_jalea3;
   private int cod_chispas1;
   private int cod_chispas2;
   private String estado_producto;
   private String capa1;
   private String capa2;
   private String capa3;
   private String jalea1;
   private String jalea2;
   private String jalea3;
   private String chispas1;
   private String chispas2;
   
    public Producto() {
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDir_imagen() {
        return dir_imagen;
    }

    public void setDir_imagen(String dir_imagen) {
        this.dir_imagen = dir_imagen;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCod_capa1() {
        return cod_capa1;
    }

    public void setCod_capa1(int cod_capa1) {
        this.cod_capa1 = cod_capa1;
    }

    public int getCod_capa2() {
        return cod_capa2;
    }

    public void setCod_capa2(int cod_capa2) {
        this.cod_capa2 = cod_capa2;
    }

    public int getCod_capa3() {
        return cod_capa3;
    }

    public void setCod_capa3(int cod_capa3) {
        this.cod_capa3 = cod_capa3;
    }

    public int getCod_jalea1() {
        return cod_jalea1;
    }

    public void setCod_jalea1(int cod_jalea1) {
        this.cod_jalea1 = cod_jalea1;
    }

    public int getCod_jalea2() {
        return cod_jalea2;
    }

    public void setCod_jalea2(int cod_jalea2) {
        this.cod_jalea2 = cod_jalea2;
    }

    public int getCod_jalea3() {
        return cod_jalea3;
    }

    public void setCod_jalea3(int cod_jalea3) {
        this.cod_jalea3 = cod_jalea3;
    }

    public int getCod_chispas1() {
        return cod_chispas1;
    }

    public void setCod_chispas1(int cod_chispas1) {
        this.cod_chispas1 = cod_chispas1;
    }

    public int getCod_chispas2() {
        return cod_chispas2;
    }

    public void setCod_chispas2(int cod_chispas2) {
        this.cod_chispas2 = cod_chispas2;
    }

    public String getEstado_producto() {
        return estado_producto;
    }

    public void setEstado_producto(String estado_producto) {
        this.estado_producto = estado_producto;
    }

    public String getCapa1() {
        return capa1;
    }

    public void setCapa1(String capa1) {
        this.capa1 = capa1;
    }

    public String getCapa2() {
        return capa2;
    }

    public void setCapa2(String capa2) {
        this.capa2 = capa2;
    }

    public String getCapa3() {
        return capa3;
    }

    public void setCapa3(String capa3) {
        this.capa3 = capa3;
    }

    public String getJalea1() {
        return jalea1;
    }

    public void setJalea1(String jalea1) {
        this.jalea1 = jalea1;
    }

    public String getJalea2() {
        return jalea2;
    }

    public void setJalea2(String jalea2) {
        this.jalea2 = jalea2;
    }

    public String getJalea3() {
        return jalea3;
    }

    public void setJalea3(String jalea3) {
        this.jalea3 = jalea3;
    }

    public String getChispas1() {
        return chispas1;
    }

    public void setChispas1(String chispas1) {
        this.chispas1 = chispas1;
    }

    public String getChispas2() {
        return chispas2;
    }

    public void setChispas2(String chispas2) {
        this.chispas2 = chispas2;
    }

    @Override
    public String toString() {
        return "Producto{" + "id_producto=" + id_producto + ", nombre_producto=" + nombre_producto + ", dir_imagen=" + dir_imagen + ", precio=" + precio + ", descripcion=" + descripcion + ", cod_capa1=" + cod_capa1 + ", cod_capa2=" + cod_capa2 + ", cod_capa3=" + cod_capa3 + ", cod_jalea1=" + cod_jalea1 + ", cod_jalea2=" + cod_jalea2 + ", cod_jalea3=" + cod_jalea3 + ", cod_chispas1=" + cod_chispas1 + ", cod_chispas2=" + cod_chispas2 + ", estado_producto=" + estado_producto + '}';
    }

       
}


package com.emergentes.modelo;


public class Inicio {
    private int id;
    private String nombre;
    private String imagen;
    private double precio;
    private String descripcion ;
    private int cod_capa1 ;
    private int cod_capa2 ;
    private int cod_capa3 ;
    private int cod_jalea1 ;
    private int cod_jalea2 ;
    private int cod_jalea3 ;
    private int cod_chispas1 ;
    private int cod_chispas2 ;
    private String estado;

    public Inicio() {
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Inicio{" + "id=" + id + ", nombre=" + nombre + ", imagen=" + imagen + ", precio=" + precio + ", descripcion=" + descripcion + ", cod_capa1=" + cod_capa1 + ", cod_capa2=" + cod_capa2 + ", cod_capa3=" + cod_capa3 + ", cod_jalea1=" + cod_jalea1 + ", cod_jalea2=" + cod_jalea2 + ", cod_jalea3=" + cod_jalea3 + ", cod_chispas1=" + cod_chispas1 + ", cod_chispas2=" + cod_chispas2 + ", estado=" + estado + '}';
    }
    
    
    
}

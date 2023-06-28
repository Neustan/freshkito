package com.emergentes.modelo;

public class Ingredientes {
   private int id_ingrediente;
   private String nombre_ingrediente;
   private double precio_ingrediente;
   private String estado_ingrediente;

    public Ingredientes() {
    }

    public int getId_ingrediente() {
        return id_ingrediente;
    }

    public void setId_ingrediente(int id_ingrediente) {
        this.id_ingrediente = id_ingrediente;
    }

    public String getNombre_ingrediente() {
        return nombre_ingrediente;
    }

    public void setNombre_ingrediente(String nombre_ingrediente) {
        this.nombre_ingrediente = nombre_ingrediente;
    }

    public double getPrecio_ingrediente() {
        return precio_ingrediente;
    }

    public void setPrecio_ingrediente(double precio_ingrediente) {
        this.precio_ingrediente = precio_ingrediente;
    }

    public String getEstado_ingrediente() {
        return estado_ingrediente;
    }

    public void setEstado_ingrediente(String estado_ingrediente) {
        this.estado_ingrediente = estado_ingrediente;
    }

    @Override
    public String toString() {
        return "Ingredientes{" + "id_ingrediente=" + id_ingrediente + ", nombre_ingrediente=" + nombre_ingrediente + ", precio_ingrediente=" + precio_ingrediente + ", estado_ingrediente=" + estado_ingrediente + '}';
    }
   
}

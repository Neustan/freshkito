package com.emergentes.modelo;

import java.sql.Date;

public class Venta {
    private int id_pedido;
    private int id_usuario;
    private String razon_social;
    private int nit_factura;
    private Date fecha;
    private String estado_pedido;
    
    
    private int id_detalle_pedido;
    private int codigo_producto;
    private double precio_pedido;

    public Venta() {
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getRazon_social() {
        return razon_social;
    }

    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }

    public int getNit_factura() {
        return nit_factura;
    }

    public void setNit_factura(int nit_factura) {
        this.nit_factura = nit_factura;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado_pedido() {
        return estado_pedido;
    }

    public void setEstado_pedido(String estado_pedido) {
        this.estado_pedido = estado_pedido;
    }

    public int getCodigo_producto() {
        return codigo_producto;
    }

    public void setCodigo_producto(int codigo_producto) {
        this.codigo_producto = codigo_producto;
    }

    public int getId_detalle_pedido() {
        return id_detalle_pedido;
    }

    public void setId_detalle_pedido(int id_detalle_pedido) {
        this.id_detalle_pedido = id_detalle_pedido;
    }

    public double getPrecio_pedido() {
        return precio_pedido;
    }

    public void setPrecio_pedido(double precio_pedido) {
        this.precio_pedido = precio_pedido;
    }

    @Override
    public String toString() {
        return "Venta{" + "id_pedido=" + id_pedido + ", id_usuario=" + id_usuario + ", razon_social=" + razon_social + ", nit_factura=" + nit_factura + ", fecha=" + fecha + ", estado_pedido=" + estado_pedido + ", id_detalle_pedido=" + id_detalle_pedido + ", codigo_producto=" + codigo_producto + ", precio_pedido=" + precio_pedido + '}';
    }

    
}

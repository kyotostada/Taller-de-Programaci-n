/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.EX4;

/**
 *
 * @author jerei
 */
public class Habitacion {
    private double costo;
    private Cliente cliente;

    public Habitacion(double costo, Cliente cliente) {
        this.costo = costo;
        this.cliente = null;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return (this.cliente.getNombre() != null);
    }


    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
    public String toString() {
        // El toString de la habitación sabe su costo y si está ocupada o no
        String s;
        if (this.isOcupada())
            s = "" + this.getCosto() + ", Ocupada " + this.cliente.toString();
        else
            s = "" + this.getCosto() + ", Libre " + this.cliente.toString();
        return s;
    }
}

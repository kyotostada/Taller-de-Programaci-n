/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author jerei
 */
public abstract class Empleado {
    private String nombre;
    private double sueldobasico;
    private int anti;
    
    public Empleado(String nombre, double sueldo, int años) {
        setNombre(nombre);
        setSueldobasico(sueldo);
        setAnti(años);        
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldobasico() {
        return sueldobasico;
    }

    public void setSueldobasico(double sueldobasico) {
        this.sueldobasico = sueldobasico;
    }

    public int getAnti() {
        return anti;
    }

    public void setAnti(int anti) {
        this.anti = anti;
    }
    
    public String toString() {
        String aux= " Nombre: " + getNombre() +
                    " Sueldo: " + this.calcularSueldoACobrar() +
                    " Efectividad: " + this.calcularEfectividad();
        return aux;
                     
    }
    
    
}

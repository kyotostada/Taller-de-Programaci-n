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
public class Trabajador extends Persona {
    private String tarea;
    
    public Trabajador(String tarea, String nombre, int dni, int edad) { 
        super(nombre, dni, edad);
        setTarea(tarea);
}
    
    public String toString() {
        String aux = super.toString() +
                     " Soy " + this.getTarea();
        return aux;
                
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    
}

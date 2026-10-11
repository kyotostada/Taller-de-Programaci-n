/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ex4clase;

/**
 *
 * @author Alumno
 */
public class Corista extends Persona {
    private int tono;

    public Corista(String nombre, int dni, int edad, int tono) {
        super(nombre, dni, edad);
        setTono(tono);
    }
    
    public int getTono() {
        return tono;
    }

    private void setTono(int tono) {
        this.tono = tono;
    }

    public String toString() {
        String aux = super.toString() + "\n" +
                     "Tono fundamental: " + this.getTono() + "\n";
        return aux;
    }
   

}

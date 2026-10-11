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
public class Director extends Persona {
    private int anti;

    
    public Director(String unNombre, int unDNI, int unaEdad, int unaAnti) {
        super(unNombre, unDNI, unaEdad);
        setAnti(unaAnti);
    }

    public int getAnti() {
        return anti;
    }

    private void setAnti(int anti) {
        this.anti = anti;
    }

    public String toString() {
        String aux = super.toString() + "\n" +
                     "Antigüedad: " + this.getAnti() + "\n";
        return aux;
    }
}

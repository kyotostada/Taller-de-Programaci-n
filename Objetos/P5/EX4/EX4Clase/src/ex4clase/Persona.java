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
public class Persona {
        private String nombre;
    private int dni;
    private int edad;
    
    
    public Persona(String unNombre, int unDNI, int unaEdad) {
        setNombre(unNombre);
        setDni(unDNI);
        setEdad(unaEdad);
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    private void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    private void setEdad(int edad) {
        this.edad = edad;
    }
    
    public String toString() {
        String aux = "Nombre: " + this.getNombre() + "\n" +
                    "DNI: " + this.getDni() + "\n" +
                    "Edad: " + this.getEdad() + "\n";
        return aux;
    }
   
}

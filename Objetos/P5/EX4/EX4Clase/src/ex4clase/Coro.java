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
public abstract class Coro {
    private String nombre;
    private Director director;
 
    
    
    public Coro(String unNombre, Director unDirector) {
        setNombre(unNombre);
        setDirector(unDirector);
    }
    
    public abstract int getCantcoristas();

    
    private Director getDirector() {
        return director;
    }

    private void setDirector(Director director) {
        this.director = director;
    }
    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public boolean estaLleno() {
        return (this.getCantcoristas() == this.getCapacidad());
    }
    
    public abstract boolean estaBienFormado();
    public abstract int getCapacidad();
    
    public abstract void agregarCorista(Corista unCorista);
    
    public String toString() {
        String aux= "Nombre del coro: " + this.getNombre() + "\n" +
                    getDirector().toString();
        return aux;
    }
}

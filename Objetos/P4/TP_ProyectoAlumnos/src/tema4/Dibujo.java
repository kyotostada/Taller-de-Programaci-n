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
public class Dibujo {
    private String titulo;
    private Figura [] vector;
    private int guardadas;
    private int capacidadMaxima=10;
    
    //inicia el dibujo, sin figuras
    public Dibujo (String titulo){
        setTitulo(titulo);
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getGuardadas() {
        return guardadas;
    }

    public int getCapacidadMaxima() {
        return capacidadMaxima;
    }

    public void setCapacidadMaxima(int capacidadMaxima) {
        this.capacidadMaxima = capacidadMaxima;
    }
    //agrega la figura al dibujo
    public void agregar(Figura f){
        vector = new Figura[capacidadMaxima];
        guardadas = 0;
        if (!estaLleno())
            vector[guardadas]= f;
            guardadas++;
            System.out.println("la figura " + f.toString() + " se ha guardado");
    }
    

    //calcula el área del dibujo:
    //suma de las áreas de sus figuras
    public double calcularArea(){
        double suma = 0;
        for (int i = 0; i < this.getGuardadas(); i++) {
            suma+= vector[i].calcularArea();
            
        }
        return suma;
    }
 
    //imprime el título, representación
    //de cada figura, y área del dibujo
    public void mostrar(){
        String aux = "Título: " + this.getTitulo() + "\n";
        for (int i = 0; i < this.getGuardadas(); i++) {
            aux+= "Area: " + this.calcularArea() + "\n" +
                     vector[i].toString();
        System.out.println(aux);  
        }
    }
    

    //retorna está lleno el dibujo
    public boolean estaLleno() {
        return (guardadas == capacidadMaxima);
    }
}

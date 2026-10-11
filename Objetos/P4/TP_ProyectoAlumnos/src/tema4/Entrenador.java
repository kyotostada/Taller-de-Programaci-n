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
public class Entrenador extends Empleado {
    private int campeonatos;
    
    
    
    public Entrenador(int campeonatos, String nombre, double sueldo, int años) {
        super(nombre, sueldo, años);
        setCampeonatos(campeonatos);
    }
    
    
    public int getCampeonatos() {
        return campeonatos;
    }
    
    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }
    
    public double calcularEfectividad() {
        return (double) this.getCampeonatos()/this.getAnti();
    }
    
    public double calcularSueldoACobrar() {
        double aux;
        if (this.getCampeonatos() <= 4)
            aux= this.getSueldobasico()+ 5000;
        else
            if (this.getCampeonatos()<= 10)
                aux= this.getSueldobasico()+30000;
            else
                aux = this.getSueldobasico() + 50000;
        return aux; 
    }
    
    @Override
    public String toString() {
        String aux = "Representación del entrenador: " +
                     super.toString() +
                     " Campeonatos ganados " + this.getCampeonatos();
        return aux;
    }
    
    
    
}

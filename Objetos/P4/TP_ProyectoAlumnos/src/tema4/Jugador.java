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
public class Jugador extends Empleado {
    private int partidosjugados, goles;
    
    public Jugador(int partidos, int goles, String nombre, double sueldo, int años) {
        super(nombre, sueldo, años);
        setPartidosjugados(partidos);
        setGoles(goles);
}

    public int getPartidosjugados() {
        return partidosjugados;
    }

    public void setPartidosjugados(int partidosjugados) {
        this.partidosjugados = partidosjugados;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    public double calcularEfectividad() {
        return (double) this.getGoles()/this.getPartidosjugados();
    }
    
    public double calcularSueldoACobrar() {
        double aux = this.getSueldobasico() + this.getSueldobasico()*(0.10*this.getAnti());
        if (this.calcularEfectividad() > 0.5)
            aux+= this.getSueldobasico();
        return aux;
    }
    
    
    public String toString() {
        String aux =  " Representación del jugador: " +
                      super.toString() +
                      " partidos jugados: " + this.getPartidosjugados() +
                      " , cantidad de goles: " + this.getGoles();
        return aux;
    }
}

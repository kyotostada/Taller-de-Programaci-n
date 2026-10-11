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
public class EX2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador j= new Jugador(10, 5, "Juan", 12453, 6);
        Entrenador e= new Entrenador(4, "Pedro", 3235, 3);
        
        // Informamos sobre el jugador y entrenador
        
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
    
}

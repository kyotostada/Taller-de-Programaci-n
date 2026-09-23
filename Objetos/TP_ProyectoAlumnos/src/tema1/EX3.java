/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 *
 * @author jerei
 */

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class EX3 {
    
    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        int i, j, MatrizTeatro[][] = new int[7][4];
        
        // Punto principal
        
        for (i = 0; i<7; i++) {
            for (j= 0; j<4; j++)
                MatrizTeatro[i][j] = GeneradorAleatorio.generarInt(100);
            
        }
        // Inciso 1
        
        int día;
        System.out.println("Ingrese un día: ");
        día = Lector.leerInt();
        for(j = 0; j<4; j++) {
            System.out.println("En el día: " + (día + 1) + " hubo " + MatrizTeatro[día][j] + " espectadores en la función " + (j+1));
        }
        
        // Inciso 2
        int función;
        System.out.println("Ingrese una función: ");
        función = Lector.leerInt();
        for(i = 0; i<7; i++) {
            System.out.println("En el día: " + (i+1) + " hubo " + MatrizTeatro[i][función] + " espectadores en la función " + (función + 1));
        }
        
        // Inciso 3
        
        int maxdia = -1, maxfuncion= -1, max = -1;
        for (i = 0; i<7; i++) {
            for (j = 0; j<4; j++)
                if (MatrizTeatro[i][j] > max) {
                    max = MatrizTeatro[i][j];
                    maxdia = j;
                    maxfuncion = i;
                }
        }
        System.out.println();
        System.out.println("La función " + (maxfuncion +1) + " en el día " + (maxdia + 1) + " fue la que más espectadores tuvo en toda la semana");
    
    
    
    
    
    
    }
    

}

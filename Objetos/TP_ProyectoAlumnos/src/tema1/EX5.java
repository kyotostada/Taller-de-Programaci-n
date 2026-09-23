package tema1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jerei
 */

import PaqueteLectura.Lector;

public class EX5 {
     
    
    public static void main(String[] args) {
            
        // Declaración de variables
        int i, j, atención0, calidad1, precio2, ambiente3, MatrizClientes[][] = new int[5][4];
        
        // Lectura de clientes
        
        for(i=0; i<5; i++) {
            for (j = 0; j<4; j++)
                MatrizClientes[i][j]= Lector.leerInt();
            
        }
        
        // Imprimir 
        int VecPromedios[] = new int[4];
        System.out.println("Calificaciones de los clientes: ");
        for(i=0; i<5; i++) {
            for (j = 0; j<4; j++) {
                VecPromedios[j] = VecPromedios[j] + MatrizClientes[i][j]; 
            }
        }
        for (j = 0; j<4; j++) {
            System.out.println("En el aspecto " + j + " la puntuación promedio es " + (VecPromedios[j] / 5));
        }
    }
}

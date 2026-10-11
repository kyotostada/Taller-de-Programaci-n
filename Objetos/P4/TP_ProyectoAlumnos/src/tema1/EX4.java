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
import PaqueteLectura.Lector;

public class EX4 {
    
    public static void main(String[] args) {
        
        // Declaración de variables
        int piso, oficina, MatrizEdificio[][] = new int[8][4];
        
        // Inicialización de oficinas
        int i, j;
        for (i = 0; i<8; i++) {
            for (j = 0; j<4; j++)
                MatrizEdificio[i][j] = 0;
        }
        
        // Lectura
        System.out.println("Ingrese un piso");
        piso = Lector.leerInt();
        System.out.println("Ingrese una oficina");
        oficina = Lector.leerInt();
        while (piso != 9) {
            MatrizEdificio[piso][oficina]++;
            piso = Lector.leerInt();
            oficina = Lector.leerInt();
        }
        
        
        // Informar
        
        for (i = 0; i<8; i++) {
            for (j = 0; j<4; j++)
                System.out.println("En la oficina " + (j+1) + " del piso " + (i+1) + " se hallan " + MatrizEdificio[i][j] + " trabajadores" );
        }
        
        
        
        
        
        
        
    }
    
}

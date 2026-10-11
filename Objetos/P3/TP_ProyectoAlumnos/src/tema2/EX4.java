/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.*;

/**
 *
 * @author jerei
 */
public class EX4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int días = 5, turnos = 8;
        Persona MatrizCasting[][] = new Persona[días][turnos];
        
        // Inicialización de la matriz (ponemos en disponible todos los días y turnos)
            for (int i = 0; i < días; i++) {
                for(int j = 0; j<turnos; j++) {
                    MatrizCasting[i][j] = null;
                }
            }
        
         // Carga de entrevistas       
         int cantentrevistados = 0, dia = 0, turno = 0;
         
         System.out.println("Ingrese un nombre: ");
         String nombre = Lector.leerString();
         
         while ((!nombre.equals("ZZZ")) && (cantentrevistados < 40)) {
             
             // Datos persona
             int edad = GeneradorAleatorio.generarInt(100);
             int DNI = GeneradorAleatorio.generarInt(60000000);
             Persona p = new Persona(nombre, edad, DNI);
             
             // Cargamos matriz
             if (MatrizCasting[dia][turno] == null) {
                 MatrizCasting[dia][turno] = p;
                 cantentrevistados++;
             }
             if (turno < turnos -1) 
                     turno++;
             else {
                turno = 0;
                dia++;
             }
             
             System.out.println("Ingrese un nombre: ");
             nombre = Lector.leerString();
             
             
        } 
             
            // Informamos disponibilidad de entrevistas
            dia = 0;
            turno = 0;
             for (int i = 0; i < cantentrevistados; i++) {
                        System.out.println("Turno " + (turno + 1) + ": ASIGNADO a " + MatrizCasting[dia][turno].getNombre() );
                 if (turno < turnos -1) 
                     turno++;
                 else {
                    turno = 0;
                    dia++;
                 }    
             }
                 
    }           
}
         


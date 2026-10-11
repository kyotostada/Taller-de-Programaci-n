/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author jerei
 */
public class EX5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int días = 5, turnos = 8, totalEntrevistados = 0;
        Persona MatrizCasting[][] = new Persona[días][turnos];
        int CantEntrevistados[] = new int[5];
        // Inicialización de la matriz y vector (ponemos en disponible todos los días y turnos)
            for (int i = 0; i < días; i++) {
                CantEntrevistados[i] = 0;
                for(int j = 0; j<turnos; j++) { 
                    MatrizCasting[i][j] = null;
                }
            }
        
         // Carga de entrevistas       
         int dia, cantentrevistados = 0, turno= 0;
         
         System.out.println("Ingrese un nombre: ");
         String nombre = Lector.leerString();
         
         while ((!nombre.equals("ZZZ")) && (cantentrevistados < 40)) {
             
             // Datos persona
             int edad = GeneradorAleatorio.generarInt(100);
             int DNI = GeneradorAleatorio.generarInt(60000000);
             Persona p = new Persona(nombre, edad, DNI);
             
             // Día
             System.out.println("Ingrese un día (1..5)");
             dia = Lector.leerInt();
             while (dia < 1 || dia > días){
                     System.out.println("Día inválido. Ingrese dia (1..5): ");
                     dia  = Lector.leerInt();
             }
                     
             // Cargamos matriz
             int indiceDia = dia -1;
             if (CantEntrevistados[indiceDia] == turnos) 
                 System.out.println("No se encuentran turnos disponibles en el día" + dia);
             else {
                 int indiceTurno = CantEntrevistados[indiceDia];
                 MatrizCasting[indiceDia][indiceTurno] = p;
                 CantEntrevistados[indiceDia]++;    
                 totalEntrevistados++;
             } 
             System.out.println("Ingrese un nombre: ");
             nombre = Lector.leerString();
         }
         
         // Informamos cantidad de inscriptos y nombres
         
         for(int i= 0; i<días; i++) {
             System.out.println("La cantidad de inscriptos en el día " + (i+1) + " es: " + CantEntrevistados[i]);
             for(int j= 0; j<CantEntrevistados[i]; j++)
                 System.out.println("Turno " + (j+1) + " : " + MatrizCasting[i][j].getNombre());
         }

  }
}
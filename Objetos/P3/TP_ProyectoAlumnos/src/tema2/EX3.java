/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author jerei
 */
import PaqueteLectura.*;
public class EX3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int días = 5, turnos = 8;
        Persona MatrizCasting[][] = new Persona[días][turnos];
        int dimF = 40, dimL = 0;
        
        // Inicialización de la matriz (ponemos en disponible todos los días y turnos)
            for (int i = 0; i < días; i++) {
                for(int j = 0; j<turnos; j++) {
                    MatrizCasting[i][j] = null;
                }
            
        }
        
        // Lectura y carga de personas
        Persona p;
        System.out.println("Ingrese un nombre");
        String nombre = Lector.leerString();
        
       
               
        while (!nombre.equals("ZZZ") && dimL < dimF) {
            
            // Datos persona
            int DNI = GeneradorAleatorio.generarInt(60000000);
            int edad = GeneradorAleatorio.generarInt(100);
    
            // Día
            System.out.println("Ingrese un día (1..5)");
            int día = Lector.leerInt();
            while (día < 1 || día > días){
                     System.out.println("Día inválido. Ingrese dia (1..5): ");
                     día  =  Lector.leerInt();
            }
            // Turno
            System.out.println("Ingrese un turno (1..8)");
            int turno = Lector.leerInt();
            while (turno < 1 || turno > turnos){
                     System.out.println("Día inválido. Ingrese turno (1..8): ");
                     turno  =  Lector.leerInt();
            }
            if (MatrizCasting[día - 1][turno - 1] == null) {
                p = new Persona(nombre, edad, DNI);
                MatrizCasting[día - 1][turno - 1] = p;
                dimL++;
            }         
            else
                System.out.println("El día y turno seleccionado no está disponible");
            
            System.out.println("Ingrese un nombre");                 
            nombre = Lector.leerString();
        }       
        
        
        // Informar disponibilidad de días y turnos
        
        for (int dia = 0; dia<días; dia++) {
            System.out.println("Día " + (dia + 1) + " :");
            for (int turno = 0; turno<turnos; turno++)
                if (MatrizCasting[dia][turno] != null)
                    System.out.println("Turno" + (turno + 1) + ": " + MatrizCasting[dia][turno].getNombre());
                else
                    System.out.println("Turno " + (turno + 1) + " : Disponible");
        }
        
        
        
        
        
    }
    
}

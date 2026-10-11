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
import PaqueteLectura.Lector;

public class EX6 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // Creación de variables y estructuras
        int dimL = 0, dimF = 20;
        Partido partidos[] = new Partido[dimF];
        
        
        Partido p;
       
        System.out.println("Ingrese un equipo de visitante");
        String visitante = Lector.leerString();
        System.out.println("----------------");
        while (!visitante.equals("ZZZ")) {
            
            // Datos partido
            
            System.out.println("Ingrese un equipo de local: ");
            String local = Lector.leerString();
        
            
            System.out.println("Ingrese los goles hechos por el equipo local");
            int golesLocal = Lector.leerInt();
            
            System.out.println("Ingrese los goles hechos por el equipo visitante");
            int golesVisitante = Lector.leerInt();
            
            p = new Partido(local, visitante, golesLocal, golesVisitante);
            partidos[dimL]= p;
            dimL++;
            
            System.out.println("Ingrese un equipo de visitante");
            visitante = Lector.leerString();    
        }
        
        int victoriasRiver = 0;
        int golesBoca = 0;
        for (int i = 0; i <dimL; i++) {
            
            // Contamos goles de Boca y victorias de River
            if (partidos[i].getGanador().equals("River"))
                victoriasRiver++;
            if (partidos[i].getLocal().equals("Boca"))
                golesBoca += partidos[i].getGolesLocal();
            else
               if (partidos[i].getVisitante().equals("Boca"))
                    golesBoca += partidos[i].getGolesVisitante();
            
            // Imprimir información de partidos
            System.out.println("------------------------------------------");
            System.out.println("Partido " + i + " | " + partidos[i].getLocal() + ":" + partidos[i].getGolesLocal() + "" + " VS " + "" + partidos[i].getVisitante() + ":" + partidos[i].getGolesVisitante());
            System.out.println("------------------------------------------");
        }
    
        System.out.println("La cantidad de partidos que ganó River es: " + victoriasRiver);
        System.out.println("La cantidad de goles hizo Boca es: " + golesBoca);
        
        
     
       
        
    
    
    }
    
}

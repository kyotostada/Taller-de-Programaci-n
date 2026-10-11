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
import PaqueteLectura.*;
public class EX4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int franjashorarias = 3;
        ReporteLocal p1 = new ReporteLocal("La Plata", "Buenos Aires", "24/12/2025", 5);
        ReporteGlobal p2= new ReporteGlobal("Berisso", "Buenos Aires", "24/12/2025", 4);
    
        // Temperaturas reporte local
        for(int i=0; i < p1.getCantLocalidades(); i++) {
            for(int j=0; j< franjashorarias; j++) {
                System.out.println("Ingrese una temperatura");
                double temp = Lector.leerDouble();
                p1.registrarTemperatura(temp, i, j);
            }    
        }
        
        
        // Temperaturas reporte global
        
            for(int i=0; i < p2.getCantLocalidades(); i++) {
                for(int j=0; j< franjashorarias; j++) {
                    System.out.println("Ingrese una temperatura");
                    double temp = Lector.leerDouble();
                    p2.registrarTemperatura(temp, i, j);
                }    
            }
       // Informamos temperatura máxima
        System.out.println("Partido en" + p1.getNombrePartido() + "\n" + p1.calcularTempMax());
        System.out.println("Partido en" + p2.getNombrePartido() + "\n" +p2.calcularTempMax());
       // Informamos reportes
        System.out.println(p1.reporte());
        System.out.println(p2.reporte());
    }
    
}

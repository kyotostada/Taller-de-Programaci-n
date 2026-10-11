package tema2;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author jerei
 */

import PaqueteLectura.GeneradorAleatorio;

public class EX2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dimL= 0, dimF = 15, num, edadMax = 100, dniMax = 100000;
        Persona VecPersonas[] = new Persona[dimF];
        GeneradorAleatorio.iniciar();
        
        int edad = GeneradorAleatorio.generarInt(edadMax);
        while ((dimL < dimF) && (edad != 0)) {
            Persona p = new Persona();
            p.setEdad(edad);
            p.setDNI(GeneradorAleatorio.generarInt(dniMax));
            p.setNombre(GeneradorAleatorio.generarString(20));
            VecPersonas[dimL] = p;
            dimL++;
            
    }
        int cantmayores = 0;
        for(int i = 0; i<dimL; i++) {
            if (VecPersonas[i].getEdad() > 65)
                cantmayores++;
        }
        System.out.println("La cantidad de personas mayores a 65 años es: " + cantmayores);
        int minDNI = 100000;
        Persona minpersona = new Persona("a", 0, 0);
        
        for (int i = 0; i < dimL; i++) {
            if (VecPersonas[i].getDNI() < minDNI) {
                minDNI = VecPersonas[i].getDNI();
                minpersona = VecPersonas[i];
                
            }
            
        }
        System.out.println(minpersona.toString());
        
        
        
    }
    
}

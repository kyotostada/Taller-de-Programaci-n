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
public class EX3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Trabajador t = new Trabajador("Seguridad", "Pedro", 249305, 25);
        Persona p = new Persona("Pedro", 249305, 25);
        
        
        System.out.println(t.toString());
        System.out.println(p.toString());
        
    }   
}
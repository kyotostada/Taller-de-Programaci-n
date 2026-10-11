/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.EX3;

/**
 *
 * @author jerei
 */

import tema3.EX2.Libro;
import tema3.EX2.Autor;
import PaqueteLectura.Lector;
public class EX3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estante e = new Estante();
        Libro l;
        Autor a;
        
        String titulo = Lector.leerString();
        
        while (!titulo.equals("ZZZ")) {
            a = new Autor(Lector.leerString(), Lector.leerString(), Lector.leerString());
            e.agregarLibro(new Libro(Lector.leerString(), Lector.leerString(), a, Lector.leerString()));    
        }
        
        Libro mujercitas = e.getLibro("Mujercitas");
        
        if (mujercitas == null)
            System.out.println("Libro no encontrado");
        else
            System.out.println(mujercitas);
    }
    // Sobre el inciso C, debería poderse usar un argumento en el constructor que sea la dimensión física del estante
}

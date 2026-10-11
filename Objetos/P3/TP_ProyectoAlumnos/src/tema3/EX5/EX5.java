/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.EX5;

/**
 *
 * @author jerei
 */
import tema3.EX2.Libro; 
import tema3.EX2.Autor;
public class EX5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EstanteriaHogareña estanteria = new EstanteriaHogareña();
        
        Autor a1 = new Autor("Julio Cortázar", "Escritor de renombre", "Ixelles, Bélgica");
        Autor a2 = new Autor("Eiichiro Oda", "Creador de One Piece", "Kumamoto, Japón");
        Autor a3 = new Autor("Patrick Süskind", "Creador de El Perfume", "Ambach, Alemania");
        
        Libro l1 = new Libro("Rayuela", "Hotel de las ideas", a1, "489342904");
        Libro l2 = new Libro("One Piece #1", "Ivrea", a2, "43829382");
        Libro l3 = new Libro("El Perfume (edición Deluxe)", "Alfaguara", a3, "3492809");
        
        estanteria.agregarLibro(l1);
        estanteria.agregarLibro(l2);
        estanteria.agregarLibro(l3);
        
        System.out.println("La estantería tiene " + estanteria.cantLibros() + " libros.");
        System.out.println(estanteria.estaLibro("Rayuela"));
    
    }

}
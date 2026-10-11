/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.EX5;

import tema3.EX2.Libro;

/**
 *
 * @author jerei
 */
public class EstanteriaHogareña {
    private Estante inferior;
    private Estante superior;
            
    public EstanteriaHogareña() {
        inferior = new Estante();
        superior = new Estante();
   }
   
   public void agregarLibro(Libro unLibro) {
       if (!inferior.estanteLleno()) 
           inferior.agregarLibro(unLibro);
       else
         superior.agregarLibro(unLibro);
   }
   
   public int cantLibros() {
       return inferior.getCantLibros() + superior.getCantLibros();
   }
   
   public String estaLibro(String titulo) {
       if (inferior.getLibro(titulo) != null | superior.getLibro(titulo) != null)
            return "El libro se encuentra en la estantería";
       else
            return "El libro no se encuentra en la estantería";         
   }        
}

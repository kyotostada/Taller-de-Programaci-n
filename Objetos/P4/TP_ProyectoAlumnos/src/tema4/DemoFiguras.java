/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad.getColorLinea()); 
        System.out.println("Color relleno: " + cuad.getColorRelleno());
        System.out.println("Representacion del cuadrado: " + cuad.toString()); 
        System.out.println(cuad.esGrande());
        
        Triangulo t = new Triangulo(12, 5, 15, "Verde", "Turquesa");
        
        System.out.println("Color de línea: " + t.getColorLinea());
        System.out.println("Color relleno: " + t.getColorRelleno());
        System.out.println("Representación del triángulo: " + t.toString());
        System.out.println(t.esGrande());
        
        
        
        cuad.despintar();
        t.despintar();
        
        System.out.println("Color linea: " + cuad.getColorLinea()); 
        System.out.println("Color relleno: " + cuad.getColorRelleno());
        System.out.println("Representacion del cuadrado: " + cuad.toString()); 
        System.out.println(cuad.esGrande());
    
        System.out.println("Color de línea: " + t.getColorLinea());
        System.out.println("Color relleno: " + t.getColorRelleno());
        System.out.println("Representación del triángulo: " + t.toString());
        System.out.println(t.esGrande());
    
    }
    
    
    
}

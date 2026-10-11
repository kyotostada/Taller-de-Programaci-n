/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.EX1;

/**
 *
 * @author jerei
 */
public class EX1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo t = new Triangulo(3,5,3, "Amarillo", "Rojo");
        Circulo c = new Circulo(12, "Verde", "Azul");
        
        // Informamos Triángulo
        
        System.out.println("Perímetro del tríangulo: " + t.calcularPerimetro());
        System.out.println("Área del triángulo: "+ t.calcularArea());
        
        // Informamos Círculo
        System.out.println("Perímetro del círculo: " + c.calcularPerimetro());
        System.out.println("Área del círculo: " + c.calcularArea());
        
        
    }
    
}

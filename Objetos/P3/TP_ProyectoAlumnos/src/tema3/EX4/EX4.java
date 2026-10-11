package tema3.EX4;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
        int N = Lector.leerInt();
        double frente = GeneradorAleatorio.generarDouble(1000000), contrafrente = GeneradorAleatorio.generarDouble(500000);
        /*Cliente c1 = new Cliente("Juan", 54896482, 24);
        Cliente c2 = new Cliente("Nefertari", 34950295, 36);
        Cliente c3 = new Cliente("Meteoro", 43590396, 22);
        /*
        
        */
        Hotel h = new Hotel(N, frente, contrafrente);
        
        String nombre = Lector.leerString();
        
        while(!nombre.equals("ZZZ")) {
          int i = 0; 
          System.out.println("Ingrese un DNI");
          int dni = Lector.leerInt();
          System.out.println("Ingrese una edad");
          int edad = Lector.leerInt();
          Cliente c = new Cliente(nombre, dni, edad);
          h.agregarCliente(c, i);
          i++;
        }
        
        h.toString();
        h.aumentarPrecio(Lector.leerDouble());
        h.toString();
        
    }
    
}

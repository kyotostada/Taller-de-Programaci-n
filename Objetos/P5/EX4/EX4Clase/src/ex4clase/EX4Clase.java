/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ex4clase;

import PaqueteLectura.Lector;

/**
 *
 * @author Alumno
 */
public class EX4Clase {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
                
            
        
        Director d1 = new Director("Hans Zimmer", 64, 324532, 30);
        Director d2 = new Director("Rubén Doblas", 33, 24152624, 1);
       

        
        // Cargamos coro semicircular
        
        System.out.println("Ingrese la capacidad del coro");
        int n = Lector.leerInt();
        
        CoroSemicircular csc = new CoroSemicircular("Coro de Ensenada", d1, n);
        for(int i = 0; i < n; i++) {
           System.out.println("Ingrese un nombre");
           String nombre = Lector.leerString();
            System.out.println("Ingrese una edad");
           int edad = Lector.leerInt();
            System.out.println("Ingrese un DNI");
           int dni = Lector.leerInt();
            System.out.println("Ingrese un tono fundamental");
           int tono = Lector.leerInt();
           csc.agregarCorista(new Corista(nombre, edad, dni, tono));  
        }
        
        if (csc.estaBienFormado())
            System.out.println("El coro está bien formado");
        else
            System.out.println("El coro no está bien formado");
        System.out.println(csc.toString());
    
        // Cargamos coro por hileras
        System.out.println("Ingrese la cantidad de integrantes por hilera del coro");
        int m = Lector.leerInt();
        System.out.println("Ingrese la cantidad de hileras del coro");
        n = Lector.leerInt();
        
        CoroPorHileras cph = new CoroPorHileras("Coro de Zacatecas", d2, n, m);
        for (int i = 0; i < n; i++) {
            for (int j=0; j< m; j++) {
                System.out.println("Ingrese un nombre");
                String nombre = Lector.leerString();
                System.out.println("Ingrese una edad");
                int edad = Lector.leerInt();
                System.out.println("Ingrese un DNI");
                int dni = Lector.leerInt();
                System.out.println("Ingrese un tono fundamental");
                int tono = Lector.leerInt();
                Corista c = new Corista(nombre, edad, dni, tono);
                cph.agregarCorista(c); 
            }
        }   
            System.out.println(cph.toString()); 
            if (cph.estaBienFormado())
                System.out.println("El coro está bien formado");
            else
                System.out.println("El coro no está bien formado");
        
        
        
        
        }
    }


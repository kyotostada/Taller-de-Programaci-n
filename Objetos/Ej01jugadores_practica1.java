/*
1- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de básquet y las almacene en un vector.  
Luego informe: 
-	la altura promedio
-	la cantidad de jugadores con altura por encima del promedio
*/
package tema1;

//Funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej01Jugadores_practica1 {
  
    public static void main(String[] args) {
        //Declaración y creación del vector
        final int DF = 5;
        double [] vector = new double[DF];
        
        //Lectura de alturas, carga en el vector (ir calculando la suma de alturas)
        int i; double suma=0;
        for (i=0; i<DF;i++){
           System.out.println("Ingrese altura del jugador:");
           vector[i]= Lector.leerDouble();
           suma=suma +vector[i]; 
        }
        
        //Calculo del promedio de alturas, informar
        double prom= suma / DF;
        System.out.println("Promedio: "+prom);
        
        //Recorrido del vector calculando lo pedido (cant. alturas por encima del promedio)
         int cant=0;
         for (i=0; i<DF;i++){
              if (vector[i] > prom) cant++;
         }
       
        System.out.println("La cantidad de alturas que superan prom es: "+ cant);
    }
    
}
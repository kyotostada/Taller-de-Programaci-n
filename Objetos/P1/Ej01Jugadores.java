
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej01Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar y crear el vector para 15 double
        double[] VecAlturas = new double[15];
        
        //Paso 3: Ingresar 15 numeros (altura), cargarlos en el vector, 
        //        ir calculando la suma de alturas sobre variable auxiliar
        int i;
        double suma = 0;
        for(i = 1; i<15; i++) {
            VecAlturas[i] = Lector.leerDouble();
            suma = suma + VecAlturas[i];   
        }
        
        //Paso 4: Calcular el promedio de alturas e informar
        double promedio = suma / 15.0;
        System.out.print ("El promedio de altura de los jugadores es " + promedio);
        //Paso 5: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int cant = 0;
        for(i = 1; i<15; i++) {
            if (VecAlturas[i] > promedio)
                cant++;   
        }
        //Paso 6: Informar la cantidad.
        System.out.print("La cantidad de alumnos que supera la altura promedio es: " + cant);
    }   
    
}

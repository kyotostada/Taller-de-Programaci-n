/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
        
public class Ej02Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio
        GeneradorAleatorio.iniciar(); 
        //Paso 3. definir y crear la matriz de enteros de 5x5, iniciarla con nros. aleatorios 
        int i, j, Matriz[][] = new int [5][5];
        for(i = 0; i<5; i++) {
            for (j = 0; j<5; j++) 
                Matriz[i][j] = GeneradorAleatorio.generarInt(30) + 1;
        }
        
        //Paso 4. mostrar el contenido de la matriz en consola
        System.out.println("Elementos de la matriz: ");
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                System.out.print(Matriz[i][j] + " ");
          }
            System.out.println();   
        }
      
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0, fila = 1;
        for (j = 0; j<5; j++)
            suma += Matriz[fila][j]
		System.out.println("La suma de los elementos de la fila: " + fila + " es " + suma);
            
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int VectorSuma[] = new int[5];
            for(j= 0; j<5; j++) {
                VectorSuma[j] = 0;
                for (i= 0; i<5; i++)
                    VectorSuma[j]+= + Matriz[i][j];
			for (i= 0; i<5; i++)
				System.out.println("Posición: " + i + " , elemento: " + VectorSuma[i]
                
     
            
        }
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. 
        //        En caso de encontrarse indique su ubicación (fila y columna)
        //        y en caso contrario imprima "No se encontró el elemento".
        int fila = 0, columna= 0, valor;
        valor = Lector.leerInt();
        while (Matriz[fila][columna] != valor) && (fila <5) && (columna < 5) {
        	fila++;
			columna++;
		}	
		if (valor == Matriz[fila][columna]) 
            System.out.println("Se encontró el elemento buscado en la fila " + i + " , columna" + j);
        else
			System.out.println("No se encontró el elemento ingresado");        
                    
        }
    }
  }
  

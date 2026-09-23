/*
Ejemplo de declaración de variables y asignación. 
 */
package tema1;

/**
 *
 * @author vsanz
 */
public class Demo01DeclaracionVariables {
public static void main(String[] args) {
    boolean encontre=false;
    int miDNI =11222333, tuDNI = 10555444;  /* Declaración en una misma linea de dos variables e inicializacion */
    char sexo = 'M', inicial = 'C';               /* Aqui la variable sexo queda sin inicialización */
    double miSueldo=1000.30;
    String miNombre="Pepe";
    System.out.println(sexo);             /* Si se descomenta no compila, no se puede imprimir porque no esta inicializada */
}
}

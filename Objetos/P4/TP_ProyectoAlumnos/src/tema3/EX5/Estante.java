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
public class Estante {
    private Libro libros[];
    private int cantlibros;
            
    public Estante() {
        libros = new Libro[20];
        for(int i=0; i<20; i++) {
            libros[i] = null;
        }
        cantlibros = 0;
    }

    public int getCantLibros() {
        return cantlibros;
    }
    
    public boolean estanteLleno () {
       return (cantlibros == 20);
    }

    public void agregarLibro (Libro unLibro) {
        if (!this.estanteLleno()) {
            libros[cantlibros] = unLibro;
            this.cantlibros++;
        }
    }

    public Libro getLibro (String titulo) {
        int i= 0;
        while ((i<cantlibros) && (!libros[i].getTitulo().equals(titulo))) {
            i++;
        }    
        if (i < cantlibros)
            return libros[i];
        else
            return null;
    }

}


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ex4clase;

/**
 *
 * @author Alumno
 */
public class CoroSemicircular extends Coro {
        private Corista[] coristas;
        private int DimF = 0;
        private int cantcoristas= 0;
        public CoroSemicircular(String unNombre, Director unDirector, int dimf) {
            super(unNombre, unDirector);
            setDimF(dimf);
            coristas = new Corista[dimf];
        }
        
        public void agregarCorista(Corista unCorista) {
            if (!this.estaLleno()) {
                coristas[this.getCantcoristas()] = unCorista;
                this.cantcoristas++;
                
            }
        
        }
 
        public int getCantcoristas() {
            return this.cantcoristas;
        }
        
        private void setDimF(int dimf) {
            this.DimF = dimf;
        }
        
        public int getCapacidad() {
            return this.DimF;
        }
        
        public boolean estaBienFormado() {
            int i=0;
            boolean ok = true;
            while (i<this.getCantcoristas() - 1 && ok) {
                if (coristas[i].getTono() > coristas[i+1].getTono())
                    i++;
                else
                    ok = false;
            }
            return ok;
        }
      
        public String toString() {
            String aux = super.toString() + "\n";
            for (int i = 0; i < this.getCantcoristas(); i++) {
                aux+= coristas[i].toString();    
            }
            return aux;
        }
}

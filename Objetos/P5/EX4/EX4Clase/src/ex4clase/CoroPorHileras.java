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
public class CoroPorHileras extends Coro {
        private Corista[][] coristas;
    private int canthileras;
    private int cantintegrantes;
    private int cantcoristas= 0;
    private int hileraactual;
    private int integranteactual;
        
    public CoroPorHileras(String unNombre, Director unDirector, int hileras, int integrantes) {
            super(unNombre, unDirector);
            setHileras(hileras);
            setIntegrantes(integrantes);
            this.hileraactual=0;
            this.integranteactual=0;
            coristas = new Corista[hileras][integrantes];
        }

    private int getIntegranteactual() {
        return integranteactual;
    }

    private int getHileraactual() {
        return hileraactual;
    }

    private int getIntegrantes() {
        return cantintegrantes;
    }

    private void setIntegrantes(int integrantes) {
        this.cantintegrantes = integrantes;
    }
    
    
    private void setHileras(int hileras) { 
        this.canthileras = hileras;
    }
    
    public int getCantcoristas() {
        return this.cantcoristas;
    }
    
    private int getHileras() {
        return this.canthileras;
    }
    
    public int getCapacidad() {
        return this.canthileras * this.cantintegrantes;
    }
    
    public void agregarCorista(Corista unCorista) {
        if (!this.estaLleno()){
            if (unCorista != null){
                coristas[getHileraactual()][getIntegranteactual()] = unCorista;
                this.integranteactual++;
                this.cantcoristas++;
                if (getIntegranteactual() == getIntegrantes()) {
                    this.integranteactual = 0;
                    this.hileraactual++;
                }
            }
            
    }
    }
    
    public boolean estaBienFormado() {
            int i=0;

            boolean ok = true;
            while (i<this.getHileras() && ok)  {
                int j=0;
                while (j<this.getCantcoristas() - 1 && ok) {
                   if (coristas[i][j].getTono() == coristas[i][j+1].getTono())
                        j++;
                   else
                       ok = false;
                }
                i++;   
            }
            return ok;

        }

    public String toString() {
        String aux = super.toString() + "\n";
        for(int i = 0; i < this.getHileras(); i++)
            for(int j=0; j< this.getIntegrantes(); j++)
                aux+= coristas[i][j].toString();
        return aux;      
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author jerei
 */
public class ReporteGlobal extends Sistema {
   
    public ReporteGlobal(String partido, String provincia, String fecha, int n) {
        super(partido, provincia, fecha, n);
    }
    
    public String reporte() {
        String aux = super.toString()+ "\n";
        for (int j = 0; j < 3; j++) {
            double suma = 0;
            for(int i=0; i<this.getCantLocalidades();i++) 
                suma+= this.getTemperatura(i, j);
            aux+= "Franja horaria: " + (j+1) + ":" + (suma/3) + "\n";
         }
        return aux;
    }
    
}

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
public class ReporteLocal extends Sistema {
    
    public ReporteLocal(String partido, String provincia, String fecha, int n) {
        super(partido, provincia, fecha, n);
    }
    
    public String reporte() {
        String aux = super.toString() + "\n";
        for (int i = 0; i < this.getCantLocalidades(); i++) {
            double suma = 0;
            for(int j=0; j<3;j++) 
                suma+= this.getTemperatura(i, j);
            aux+= "Localidad: " + (i+1) + ":" + (suma/3) + "\n";
         }
        return aux;
    }
    
}

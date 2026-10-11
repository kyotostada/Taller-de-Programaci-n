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
public abstract class Sistema {
    private int franjas = 3;
    private String nombrepartido;
    private String provincia;
    private String fecha;
    private double[][] temperaturas;
    private int cantLocalidades;


    public Sistema(String partido, String provincia, String fecha, int n) {
        this.setNombrePartido(partido);
        this.setProvincia(provincia);
        this.setFecha(fecha);
        this.setCantLocalidades(n);
        this.temperaturas = new double[n][franjas];
        for (int i = 0; i < n; i++) {
            for(int j=0; j<franjas; j++) 
                temperaturas[i][j]=99999;
            
        }
    }
    
    public void setCantLocalidades(int cant) {
        this.cantLocalidades = cant;
    }
    
    public int getCantLocalidades() {
        return this.cantLocalidades;
    }
    public void registrarTemperatura (double temperatura, int localidad, int franja) {
        temperaturas[localidad][franja]= temperatura;
    }
    
    public double getTemperatura(int localidad, int franja) {
        return temperaturas[localidad][franja];
    }
    
    public String calcularTempMax() {
        double max = -1;
        int locmax = -1, framax = -1;
        for (int i = 0; i<cantLocalidades ; i++) {
            for(int j=0; j<franjas; j++) 
              if (temperaturas[i][j] > max) {
                  max= temperaturas[i][j];
                  locmax=i;
                  framax=j;
              }
        }
        String aux = "Temperatura máxima: " + max + "\n"
                     + "Localidad: " + (locmax + 1) + "\n" +
                     "Franja horaria: " + (framax + 1);  
        return aux;
    }
        
    
    public String toString() {
        return this.getNombrePartido() + " - " + this.getProvincia() + "-" + this.getFecha();
    }     
    
    public abstract String reporte();
    
    public void setNombrePartido(String partido) {
        this.nombrepartido = partido;
    }
    
    public String getNombrePartido() {
        return nombrepartido;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    


}

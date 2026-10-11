/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.EX4;

/**
 *
 * @author jerei
 */
public class Hotel {
    private Habitacion habitaciones[];
    private int canthabitaciones;
    
    

    public Hotel(int N, double frente, double contrafrente) {
          this.habitaciones = new Habitacion[N];
          for (int i = 0; i < N; i++) {
            if (i % 2 == 0)
              this.habitaciones[i].setCosto(contrafrente);
            else
                this.habitaciones[i].setCosto(frente);    
        }
    }        
    public void agregarCliente(Cliente c, int x) {
        this.habitaciones[x].setCliente(c);
        canthabitaciones++;
    }    

    
    public void aumentarPrecio(double monto) {
        for (int i = 0; i < canthabitaciones ; i++) {
            habitaciones[i].setCosto(habitaciones[i].getCosto()+ monto);
        }
        
    }

    public Habitacion[] getHabitaciones() {
        return habitaciones;
    }

    public void setHabitaciones(Habitacion[] habitaciones) {
        this.habitaciones = habitaciones;
    }
    
   @Override
    public String toString() {
        // El toString de la clase Hotel solo sabe el numero de la habitación
        String s = "";
        for (int i = 0; i < canthabitaciones; i++) {
            s+= "Habitación " +(i+1) + ":" + habitaciones[i].toString() + "/n";
        }    
        return s;
            
        
    }
    
}
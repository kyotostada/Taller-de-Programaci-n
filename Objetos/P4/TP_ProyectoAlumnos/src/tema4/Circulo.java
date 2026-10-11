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
public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double radio, String cr, String cl) {
        super(cr, cl);
        this.setRadio(radio);
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public String toString() {
        String aux = super.toString() +
                     "Radio: " + this.getRadio();
        return aux;
    }
    
    public double calcularPerimetro() {
        return 2*this.getRadio()*Math.PI;
    }
    
    public double calcularArea() {
        return Math.PI*(this.getRadio()*this.getRadio());
    }
}

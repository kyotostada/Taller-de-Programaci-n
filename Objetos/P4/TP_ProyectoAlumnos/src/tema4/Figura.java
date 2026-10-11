/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
   
    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }
    
    public String toString(){
        String aux = "Area: " + this.calcularArea() + "\n" +
                     "CR: "  + getColorRelleno() + "\n" +
                      "CL: " + getColorLinea() + "\n" +
                     "Perímetro: " + this.calcularPerimetro();
             return aux;
       }
    
    public void despintar() {
        this.setColorLinea("negra");
        this.setColorRelleno("blanco");
    }
    
    public String getColorRelleno(){
        return colorRelleno;       
    }
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;       
    }
    public String getColorLinea(){
        return colorLinea;       
    }
    public void setColorLinea(String unColor){
        colorLinea = unColor;       
    }
    
    public boolean esGrande() {
        return (this.calcularArea() > 100);
    }
    
    public abstract double calcularArea();
    public abstract double calcularPerimetro();
     
}

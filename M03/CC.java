/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Herencia.A2;

/**
 *
 * @author MiquelA
 */
public class CC extends C {

    private int cilindrada;
    private String motor;
    private int consum;

    public String informeC(String Matricula) {
        System.out.println("informe0 ok");
        System.out.println(this.getCilindrada());
        return this.getMotor();
    }
    public String permis(String Matricula){
        System.out.println("permis ok");
        String retur = "Coche con matricula " + this.getMatricula() + " Con consumo " + this.getConsum();
        return retur;
    }
    public CC() {
        super();
        this.cilindrada = 0;
        this.motor = "";
        this.consum = 0;
    }
    public CC(String Model, String Matricula, String Color, Boolean Activitat, int Cilindrada, int Consum, String Motor, int Potencia) {
        super(Model, Matricula, Color, Activitat, Potencia);
        this.cilindrada = Cilindrada;
        this.motor = Motor;
        this.consum = Consum;
    }

    /**
     * @return the cilindrada
     */
    public int getCilindrada() {
        return cilindrada;
    }

    /**
     * @param cilindrada the cilindrada to set
     */
    public void setCilindrada(int cilindrada) {
        this.cilindrada = cilindrada;
    }

    /**
     * @return the motor
     */
    public String getMotor() {
        return motor;
    }

    /**
     * @param motor the motor to set
     */
    public void setMotor(String motor) {
        this.motor = motor;
    }

    /**
     * @return the consum
     */
    public int getConsum() {
        return consum;
    }

    /**
     * @param consum the consum to set
     */
    public void setConsum(int consum) {
        this.consum = consum;
    }
}

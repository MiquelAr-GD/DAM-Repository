/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Herencia.A2;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class E extends C {

    private int bateria;
    private int consum;
    private int autonomia;
    private int carrega;

    public String informe0(String Matricula) {
        System.out.println("informe0 ok");
        System.out.println(this.getBateria());
        return Matricula;
    }

    public String fitxaConsum(String Matricula) {
        System.out.println("fitxaConsum ok");
        return (this.getConsum()+ " " + this.getAutonomia());
    }

    public E() {
        super();
        this.bateria = 0;
        this.consum = 0;
        this.autonomia = 0;
        this.carrega = 0;
    }

    public E(String Model, String Matricula, String Color, Boolean Activitat, int Bateria, int Consum, int Autonomia, int Carrega, int Potencia) {
        super(Model, Matricula, Color, Activitat, Potencia);
        this.bateria = Bateria;
        this.consum = Consum;
        this.autonomia = Autonomia;
        this.carrega = Carrega;
    }

    /**
     * @return the bateria
     */
    public int getBateria() {
        return bateria;
    }

    /**
     * @param bateria the bateria to set
     */
    public void setBateria(int bateria) {
        if(bateria > 100){
            this.bateria = bateria;
        } else {
            System.out.println("Valor incorrecte, torna a intentar-ho");
            Scanner in = new Scanner (System.in);
            setBateria(in.nextInt());
        }
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

    /**
     * @return the autonomia
     */
    public int getAutonomia() {
        return autonomia;
    }

    /**
     * @param autonomia the autonomia to set
     */
    public void setAutonomia(int autonomia) {
        this.autonomia = autonomia;
    }

    /**
     * @return the carrega
     */
    public int getCarrega() {
        return carrega;
    }

    /**
     * @param carrega the carrega to set
     */
    public void setCarrega(int carrega) {
        this.carrega = carrega;
    }


}

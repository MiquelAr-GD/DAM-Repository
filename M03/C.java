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
public class C {

    private String model;
    private String matricula;
    private String color;
    private Boolean activitat;
    private int potencia;

    public String vendaVehicle(String Matricula) {
        System.out.println("vendaVehicle ok");
        return ("Model " + this.getModel() + " Color " + this.getColor());
    }

    public String obrirIncidencia(String Matricula) {
        System.out.println("obrirIncidencia ok");
        return ("Model " + this.getModel() + " Color " + this.getColor());
    }

    public String tancarIncidencia(String Matricula) {
        System.out.println("tancarIncidencia ok");
        return ("Model " + this.getModel() + " Color " + this.getColor());
    }

    public String generarPermis(String Matricula) {
        System.out.println("generarPermis ok");
        return ("Model " + this.getModel() + " Color " + this.getColor());
    }

    public C() {
        this.model = "";
        this.matricula = "";
        this.color = "";
        this.activitat = false;
        this.potencia = 0;
    }

    public C(String Model, String Matricula, String Color, Boolean Activitat, int Potencia) {
        this.model = Model;
        this.matricula = Matricula;
        this.color = Color;
        this.activitat = Activitat;
        this.potencia = Potencia;
    }

    /**
     * @return the model
     */
    public String getModel() {
        return model;
    }

    /**
     * @param model the model to set
     */
    public void setModel(String model) {
        this.model = model;
    }

    /**
     * @return the matricula
     */
    public String getMatricula() {
        return matricula;
    }

    /**
     * @param matricula the matricula to set
     */
    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    /**
     * @return the color
     */
    public String getColor() {
        return color;
    }

    /**
     * @param color the color to set
     */
    public void setColor(String color) {
        this.color = color;
    }

    /**
     * @return the activitat
     */
    public Boolean getActivitat() {
        return activitat;
    }

    /**
     * @param activitat the activitat to set
     */
    public void setActivitat(Boolean activitat) {
        this.activitat = activitat;
    }

    /**
     * @return the potencia
     */
    public int getPotencia() {
        return potencia;
    }

    /**
     * @param potencia the potencia to set
     */
    public void setPotencia(int potencia) {
        this.potencia = potencia;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Metodos;

/**
 *
 * @author MiquelA
 */
public class Persona {

    private int id;
    private double pes;
    private int edat;

    public Persona() {
        this.id = 0;
        this.pes = 0;
        this.edat = 0;
    }

    public Persona(int id, double pes, int edat) {
        this.id = id;
        this.pes = pes;
        this.edat = edat;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the pes
     */
    public double getPes() {
        return pes;
    }

    /**
     * @param pes the pes to set
     */
    public void setPes(double pes) {
        this.pes = pes;
    }

    /**
     * @return the edat
     */
    public int getEdat() {
        return edat;
    }

    /**
     * @param edat the edat to set
     */
    public void setEdat(int edat) {
        this.edat = edat;
    }

}
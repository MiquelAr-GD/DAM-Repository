/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pooHerencia;


/**
 *
 * @author vlino
 */
public class divulgacio extends llibres {

    private String ambit;

    public divulgacio() {

    }

    public divulgacio(String titolLlibre, String isbnLlibre,
            String autorllibre, String editorial,
            int exemplarLlibre, double preuLlibre,
            String ambitLlibre) {

        super(titolLlibre, isbnLlibre, autorllibre, editorial,
                exemplarLlibre, preuLlibre);
        this.ambit = ambitLlibre;
    }


    public void imprimeixAmbit() {
        System.out.println("  > " + this.getAmbit());
    }

    /**
     * @return the ambit
     */
    public String getAmbit() {
        return ambit;
    }

    /**
     * @param ambit the ambit to set
     */
    public void setAmbit(String ambit) {
        this.ambit = ambit;
    }

}

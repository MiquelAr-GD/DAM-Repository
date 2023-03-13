/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pooPolimorfisme;

/**
 *
 * @author vlino
 */
public class divulgacio extends llibres {

    private String ambit;

    public divulgacio() {
        super();
        this.tipus = "DIV001";
    }

    public divulgacio(String titolLlibre, String isbnLlibre,
            String autorllibre, String editorial,
            int exemplarLlibre, double preuLlibre,
            String ambitLlibre) {

        super(titolLlibre, isbnLlibre, autorllibre, editorial,
                exemplarLlibre, preuLlibre);
        this.ambit = ambitLlibre;
        this.tipus = "DIV001";
    }

    @Override
    public void imprimeixTotesDades() {
        System.out.println("Titol: " + this.titol);
        System.out.println("ISBN: " + this.isbn);
        System.out.println("Autor: " + this.autor);
        System.out.println("Editorial: " + this.editorial);
        System.out.println("Exemplars: " + this.exemplars);
        System.out.println("Preu: " + this.preu);
        System.out.println("Ambit: " + this.ambit);
        System.out.println("Codi Tipus: " + this.tipus);
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

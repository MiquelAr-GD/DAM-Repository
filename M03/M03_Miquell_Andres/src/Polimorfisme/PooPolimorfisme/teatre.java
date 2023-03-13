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
public class teatre extends llibres {

    private String argument;

    public teatre() {
        super();
        this.tipus = "TEAT001";
    }

    public teatre(String titolLlibre, String isbnLlibre,
            String autorllibre, String editorial,
            int exemplarLlibre, double preuLlibre, String argument) {

        super(titolLlibre, isbnLlibre, autorllibre, editorial,
                exemplarLlibre, preuLlibre);
        this.argument = argument;
        this.tipus = "TEAT001";
    }

    public void imprimeixArgument() {
        System.out.println("  > " + this.getArgument());
    }
    @Override
    public void imprimeixTotesDades(){
        System.out.println("Titol: " + this.titol);
        System.out.println("ISBN: " + this.isbn);
        System.out.println("Autor: " + this.autor);
        System.out.println("Editorial: " + this.editorial);
        System.out.println("Exemplars: " + this.exemplars);
        System.out.println("Preu: " + this.preu);
        System.out.println("Argument: " + this.argument);
        System.out.println("Codi Tipus: " + this.tipus);
    }
    /**
     * @return the argument
     */
    public String getArgument() {
        return argument;
    }

    /**
     * @param argument the argument to set
     */
    public void setArgument(String argument) {
        this.argument = argument;
    }

}

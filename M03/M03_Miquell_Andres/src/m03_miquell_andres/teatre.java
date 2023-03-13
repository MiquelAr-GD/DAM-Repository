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
public class teatre extends llibres {

    private String argument;

    public teatre() {

    }

    public teatre(String titolLlibre, String isbnLlibre,
            String autorllibre, String editorial,
            int exemplarLlibre, double preuLlibre, String argument) {

        super(titolLlibre, isbnLlibre, autorllibre, editorial,
                exemplarLlibre, preuLlibre);
        this.argument = argument;
    }

    public void imprimeixArgument() {
        System.out.println("  > " + this.getArgument());
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

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
public class assaig extends llibres {

    private int nombreAssajosAutor;

    public assaig() {
        super();
        this.tipus = "ASS001";
    }

    public assaig(String titolLlibre, String isbnLlibre,
            String autorllibre, String editorial,
            int exemplarLlibre, double preuLlibre,
            int nombreAssajos) {

        super(titolLlibre, isbnLlibre, autorllibre, editorial,
                exemplarLlibre, preuLlibre);
        this.nombreAssajosAutor = nombreAssajos;
        this.tipus = "ASS001";
    }


    public void impNombreAssajos() {
        System.out.println("  > " + this.getNombreAssajosAutor());
    }
    @Override
    public void imprimeixTotesDades(){
        System.out.println("Titol: " + this.titol);
        System.out.println("ISBN: " + this.isbn);
        System.out.println("Autor: " + this.autor);
        System.out.println("Editorial: " + this.editorial);
        System.out.println("Exemplars: " + this.exemplars);
        System.out.println("Preu: " + this.preu);
        System.out.println("Nº Assajos: " + this.nombreAssajosAutor);
        System.out.println("Codi Tipus: " + this.tipus);
    }
    /**
     * @return the nombreAssajosAutor
     */
    public int getNombreAssajosAutor() {
        return nombreAssajosAutor;
    }

    /**
     * @param nombreAssajosAutor the nombreAssajosAutor to set
     */
    public void setNombreAssajosAutor(int nombreAssajosAutor) {
        this.nombreAssajosAutor = nombreAssajosAutor;
    }

}

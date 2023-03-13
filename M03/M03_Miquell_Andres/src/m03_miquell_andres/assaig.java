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
public class assaig extends llibres {

    private int nombreAssajosAutor;

    public assaig() {

    }

    public assaig(String titolLlibre, String isbnLlibre,
            String autorllibre, String editorial,
            int exemplarLlibre, double preuLlibre,
            int nombreAssajos) {

        super(titolLlibre, isbnLlibre, autorllibre, editorial,
                exemplarLlibre, preuLlibre);
        this.nombreAssajosAutor = nombreAssajos;
    }


    public void impNombreAssajos() {
        System.out.println("  > " + this.getNombreAssajosAutor());
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

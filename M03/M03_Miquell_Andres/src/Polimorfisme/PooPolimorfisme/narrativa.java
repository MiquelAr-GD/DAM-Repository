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
public class narrativa  extends llibres {
    
    private String genere;
    
    
    public narrativa() {
        super();
        this.tipus = "NAR001";
    }
    
    public narrativa(String titolLlibre, String isbnLlibre, 
            String autorllibre, String editorial, 
            int exemplarLlibre , double preuLlibre, String genere){
        
        super(titolLlibre, isbnLlibre, autorllibre, editorial, 
                exemplarLlibre, preuLlibre );
        this.genere = genere;
        this.tipus = "NAR001";
    }
    
    public void imprimeixGenere (){
        System.out.println("  > " + this.getGenere());
    }
    @Override
    public void imprimeixTotesDades(){
        System.out.println("Titol: " + this.titol);
        System.out.println("ISBN: " + this.isbn);
        System.out.println("Autor: " + this.autor);
        System.out.println("Editorial: " + this.editorial);
        System.out.println("Exemplars: " + this.exemplars);
        System.out.println("Preu: " + this.preu);
        System.out.println("Genere: " + this.genere);
        System.out.println("Codi Tipus: " + this.tipus);
    }
    @Override
    public void mostraEditorial(){
    
        System.out.println("(NARRATIVA) L'editorial és " + this.editorial);
    }
    
    /**
     * @return the genere
     */
    public String getGenere() {
        return genere;
    }

    /**
     * @param genere the genere to set
     */
    public void setGenere(String genere) {
        this.genere = genere;
    }
    
    
}

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
public class narrativa  extends llibres {
    
    private String genere;
    
    
    public narrativa() {
        super();
    }
    
    public narrativa(String titolLlibre, String isbnLlibre, 
            String autorllibre, String editorial, 
            int exemplarLlibre , double preuLlibre, String genere){
        
        super(titolLlibre, isbnLlibre, autorllibre, editorial, 
                exemplarLlibre, preuLlibre );
        this.genere = genere;
    }
    
    public void imprimeixGenere (){
        System.out.println("  > " + this.getGenere());
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

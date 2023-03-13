/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pooPolimorfisme;

import java.util.Scanner;

/**
 *
 * @author vlino
 */
public abstract class llibres {

    protected String titol;
    protected String isbn;
    protected String autor;
    protected String editorial;
    protected int exemplars;
    protected double preu;
    protected String tipus; /*Afegim aqui el atrivut i el desenvolupem a cada sub clase, IMPORTANT POSAR-HO EN PROTECTED O SI NO LES SUB CLASES NO HI PODRAN ACCEDIR*/

    public llibres() {

    }

    public llibres(String titolLlibre, String isbnLlibre,
            String autorllibre, String editorial,
            int exemplarLlibre, double preuLlibre) {
        this.titol = titolLlibre;
        this.isbn = isbnLlibre;
        this.autor = autorllibre;
        this.editorial = editorial;
        this.exemplars = exemplarLlibre;
        this.preu = preuLlibre;
        this.tipus = "Llib";
    }
    public abstract void imprimeixTotesDades(); /*-----------------------------------------------*/
    public void generaFitxa() {
        System.out.println("Imprimim la fitxa de dades...");
        System.out.println("  > " + this.getTitol());
        System.out.println("  > " + this.getAutor());
        System.out.println("  > " + this.getIsbn());
    }

    public void mostraEditorial(){
    
        System.out.println("(SUPERCLASE) L'editorial és " + this.editorial); /*Creo el metode amb metode NO static per aixi poder fer crida del 
                                                                                objecte en cuestio al que se l'hi apliqui el metode.*/
    }
    public static void modificaPreu(llibres[] llibresArr) {
        
        Scanner recull = new Scanner(System.in);
        
        String isbn;
        Double preu;
        
        System.out.println("Introduiex l'isbn de l'article del que vols modificar el preu...");
        isbn = recull.nextLine();
        
        System.out.println("Introduie el nou preu...");
        preu = recull.nextDouble();

        for (llibres llibre : llibresArr ){
            if (llibre.getIsbn().equals(isbn)){
                llibre.setPreu(preu);
            }
        }
            
    }

    /**
     * @return the titol
     */
    public String getTitol() {
        return titol;
    }

    /**
     * @param titol the titol to set
     */
    public void setTitol(String titol) {
        this.titol = titol;
    }

    /**
     * @return the isbn
     */
    public String getIsbn() {
        return isbn;
    }

    /**
     * @param isbn the isbn to set
     */
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    /**
     * @return the autor
     */
    public String getAutor() {
        return autor;
    }

    /**
     * @param autor the autor to set
     */
    public void setAutor(String autor) {
        this.autor = autor;
    }

    /**
     * @return the editorial
     */
    public String getEditorial() {
        return editorial;
    }

    /**
     * @param editorial the editorial to set
     */
    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    /**
     * @return the exemplars
     */
    public int getExemplars() {
        return exemplars;
    }

    /**
     * @param exemplars the exemplars to set
     */
    public void setExemplars(int exemplars) {
        this.exemplars = exemplars;
    }

    /**
     * @return the preu
     */
    public double getPreu() {
        return preu;
    }

    /**
     * @param preu the preu to set
     */
    public void setPreu(double preu) {
        this.preu = preu;
    }

}

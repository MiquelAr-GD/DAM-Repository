/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Metodos;

import java.util.Scanner;

/**
 * 19. A program that records information of books (ISBN, title, author,
 * publisher and year of publication) in a vector of 100 positions. The program
 * will allow to incorporate a new book and get a complete list of books. Keep
 * in mind that ISBN field is the key field and ISBN uniquely identifies a book;
 * Therefore, before registering, check that there is no book recorded with the
 * same ISBN. We also need to check if there are 100 recorded books is not
 * possible a new register. The program will display a menu with three options:
 * register a book, list all books of books and exit
 */
public class a19 {

    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        int menu;
        Llibres[] llibres = new Llibres[100];
        menu = mostrarMenu(in);
        switch (menu) {
            case 1:
                introduirLlibre(llibres);
                break;
            case 2:
                llistatLlibres(llibres);
                break;
            default:
                break;
        }
    }

    private static int mostrarMenu(Scanner in) {
        int num;
        System.out.println("Escull una opcio:");
        System.out.println("1. Introduir llibre");
        System.out.println("2. Llistat de llibres");
        System.out.println("3. Sortir");
        num = in.nextInt();
        return num;
    }
    private static void introduirLlibre(Llibres[] llibres){
    
    }
    
    private static void llistatLlibres(Llibres[] llibres){
    
    }
}



class Llibres {

    private int ISBN;
    private String title;
    private String Author;
    private String publisher;
    private int year;

    public Llibres() {
        this.ISBN = 0;
        this.title = "";
        this.Author = "";
        this.publisher = "";
        this.year = 0;

    }

    public Llibres(int isbn, String title, String author, String publisher, int year) {
        this.ISBN = isbn;
        this.title = title;
        this.Author = author;
        this.publisher = publisher;
        this.year = year;

    }

    /**
     * @return the ISBN
     */
    public int getISBN() {
        return ISBN;
    }

    /**
     * @param ISBN the ISBN to set
     */
    public void setISBN(int ISBN) {
        this.ISBN = ISBN;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the Author
     */
    public String getAuthor() {
        return Author;
    }

    /**
     * @param Author the Author to set
     */
    public void setAuthor(String Author) {
        this.Author = Author;
    }

    /**
     * @return the publisher
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     * @param publisher the publisher to set
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    /**
     * @return the year
     */
    public int getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(int year) {
        this.year = year;
    }

}

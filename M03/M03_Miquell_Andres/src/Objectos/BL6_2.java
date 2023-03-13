/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objectos;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class BL6_2 {

    public static void main(String[] args) {
        Integer ISBN, Stock, Preu, Suma = 0;
        String Titol, Autor, Editorial;
        Scanner in = new Scanner(System.in);
        Scanner in1 = new Scanner(System.in);
        Scanner in2 = new Scanner(System.in);
        Scanner in3 = new Scanner(System.in);
        BL62[] llibres = new BL62[3];
        for (int i = 0; i < llibres.length; i++) {
            System.out.println("Introdueix el titol del llibre: ");
            Titol = in.nextLine();
            System.out.println("Autor");
            Autor = in1.nextLine();
            System.out.println("Editorial");
            Editorial = in.nextLine();
            System.out.println("ISBN");
            ISBN = in3.nextInt();
            System.out.println("Stock");
            Stock = in2.nextInt();
            System.out.println("Preu");
            Preu = in3.nextInt();
            llibres[i] = new BL62(ISBN, Titol, Autor, Editorial, Stock, Preu);
        }
        for (int i = 0; i < llibres.length; i++) {
            System.out.println(llibres[i].getISBN() + "     " + llibres[i].getTitol() + "  " + llibres[i].getAutor() + "  " + llibres[i].getEditorial() + "  " + llibres[i].getPreu() + " € " + " " + llibres[i].getStock());
            System.out.println("");
            for (int j = 0; j < llibres[i].getStock(); j++) {
                Suma = Suma + llibres[i].getPreu();
            }
        }
        System.out.println("Inventari = " + Suma);
    }
}   

class BL62 {

    private Integer ISBN;
    private String titol;
    private String autor;
    private String editorial;
    private Integer stock;
    private Integer preu;

    public BL62() {
        this.ISBN = 0;
        this.titol = "";
        this.autor = "";
        this.editorial = "";
        this.stock = 0;
        this.preu = 0;
    }

    public BL62(Integer Isbn, String Titol, String Autor, String Editorial, Integer Stock, Integer Preu) {
        this.ISBN = Isbn;
        this.titol = Titol;
        this.autor = Autor;
        this.editorial = Editorial;
        this.stock = Stock;
        this.preu = Preu;
    }

    public Integer getISBN() {
        return ISBN;
    }

    public void setISBN(Integer isbn) {
        this.ISBN = isbn;
    }

    public String getTitol() {
        return titol;
    }

    public void setType(String titol) {
        this.titol = titol;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public Integer getPreu() {
        return preu;
    }

    public void setPreu(Integer preu) {
        this.preu = preu;
    }
}

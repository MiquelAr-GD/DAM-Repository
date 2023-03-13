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
public class ExamenFinalUF1_MiquelAndres {

    public static void main(String[] args) {
// Declaracio de variables i creacio d'arrays i Scanner

        Terres[][] Cuadricula = new Terres[2][4];
        Scanner in = new Scanner(System.in);
        String Nom;
        int A = 0, a = 0;
        double Hi = 60, Ti = 20, maj = 0;
        
//Introducio de nom i creació d'objectes dins l'array

        for (int i = 0; i < Cuadricula.length; i++) {
            for (int j = 0; j < Cuadricula[0].length; j++) {
                System.out.println("Intro nom terres");
                Nom = in.nextLine();
                Cuadricula[i][j] = new Terres(Nom, ((double) (Math.random() * 80) + 20), ((double) (Math.random() * 30)));
            }
        }
        
//Mostrar la Humitats en pantalla perque tu puguis veure i comprovar que realment funciona el programa
        
        System.out.println("");
        System.out.println("");
        for (int i = 0; i < Cuadricula.length; i++) {
            for (int j = 0; j < Cuadricula[0].length; j++) {
                System.out.print(Cuadricula[i][j].getHumitat());
                System.out.print("  ");
            }
            System.out.println("");
        }
        System.out.println("");
        System.out.println("");
        System.out.println("Humitats");
        System.out.println("");
        System.out.println("");
        
 //Mostrar la Temperatures en pantalla perque tu puguis veure i comprovar que realment funciona el programa
 
        for (int i = 0; i < Cuadricula.length; i++) {
            for (int j = 0; j < Cuadricula[0].length; j++) {
                System.out.print(Cuadricula[i][j].getTemperatura());
                System.out.print("  ");
            }
            System.out.println("");
        }
        System.out.println("");
        System.out.println("");
        System.out.println("Temperatures");
        System.out.println("");
        System.out.println("");
        
//Calcul de puntuacio

        for (int i = 0; i < Cuadricula.length; i++) {
            for (int j = 0; j < Cuadricula[0].length; j++) {
                if (Cuadricula[i][j].getHumitat() < Hi) {
                    Cuadricula[i][j].setPunts(Cuadricula[i][j].getPunts() - ((Hi - Cuadricula[i][j].getHumitat()) * 0.1));
                } else if (Cuadricula[i][j].getHumitat() > Hi) {
                    Cuadricula[i][j].setPunts(Cuadricula[i][j].getPunts() - ((Cuadricula[i][j].getHumitat() - Hi) * 0.1));
                }
                if (Cuadricula[i][j].getTemperatura() < Ti) {
                    Cuadricula[i][j].setPunts(Cuadricula[i][j].getPunts() - ((Ti - Cuadricula[i][j].getTemperatura()) * 0.1));
                } else if (Cuadricula[i][j].getTemperatura() > Ti) {
                    Cuadricula[i][j].setPunts(Cuadricula[i][j].getPunts() - ((Cuadricula[i][j].getTemperatura() - Ti) * 0.1));
                }
            }
        }

//Mostrar la Punts en pantalla perque tu puguis veure i comprovar que realment funciona el programa

        for (int i = 0; i < Cuadricula.length; i++) {
            for (int j = 0; j < Cuadricula[0].length; j++) {
                System.out.print(Cuadricula[i][j].getPunts());
                System.out.print("  ");
            }
            System.out.println("");
        }
        System.out.println("");
        System.out.println("");
        System.out.println("Punts");
        System.out.println("");
        System.out.println("");

//Comprobar quin objecte es el que te la puntuacio mes alta i guardar la seva possicio dins l'array
        for (int i = 0; i < Cuadricula.length; i++) {
            for (int j = 0; j < Cuadricula[0].length; j++) {
                if (i == 0) {
                    maj = Cuadricula[i][j].getPunts();
                }
                if (Cuadricula[i][j].getPunts() >= maj) {
                    maj = Cuadricula[i][j].getPunts();
                    A = i;
                    a = j;
                }
            }
        }

//Mostrar per pantalla el resultat final
        System.out.println("");
        System.out.println("");
        System.out.println("La zona mes propicia es la anomenada: " + Cuadricula[A][a].getNom());
        System.out.println("");
        System.out.println("");
    }
}

class Terres {

    private String Nom;
    private double Humitat;
    private double Temperatura;
    private double Punts;

    public Terres() {
        this.Nom = "";
        this.Humitat = 0;
        this.Temperatura = 0;
        this.Punts = 0;
    }

    public Terres(String nom, double humitat, double temperatura) {
        this.Nom = nom;
        this.Humitat = humitat;
        this.Temperatura = temperatura;
        this.Punts = 10;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String Nom) {
        this.Nom = Nom;
    }

    public double getHumitat() {
        return Humitat;
    }

    public void setHumitat(double Humitat) {
        this.Humitat = Humitat;
    }

    public double getTemperatura() {
        return Temperatura;
    }

    public void setTemperatura(double Temperatura) {
        this.Temperatura = Temperatura;
    }

    public double getPunts() {
        return Punts;
    }

    public void setPunts(double Punts) {
        this.Punts = Punts;
    }
}

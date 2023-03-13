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
public class BL6_6 {
     public static void main(String[] args) {
         Scanner in = new Scanner (System.in);
         BL66[] em = new BL66[5];
         int s = 0;
         for (int i = 0; i < em.length; i++) {
         System.out.println("Intro nom: ");
             System.out.println("Intro tipus (f, t) :");
             em[i] = new BL66(in.nextLine(), ((int)(Math.random()*50)), ((int)(Math.random()*10)), ((int)(Math.random()*10000)), in.nextLine());
         }
         for (int i = 0; i < em.length; i++) {
             System.out.println(em[i].getNom() + "  " + em[i].getEdat() + "  " + em[i].getNum() + "  " + em[i].getSalari() + "  " + em[i].getTipus());
         }
         for (int i = 0; i < em.length; i++) {
             if((em[i].getTipus().equalsIgnoreCase("f")||(em[i].getSalari()> 1000))){
                 System.out.println(em[i].getNom());
             } 
             s = s + em[i].getSalari();
         }
         System.out.println("El salari total de la empresa es:" + s);
     }
}
class BL66{
    
    private String nom;
    private Integer edat;
    private Integer num;
    private Integer salari;
    private String tipus;
    
    public BL66(){
        this.nom = "";
        this.edat = 0;
        this.num = 0;
        this.salari = 0;
        this.tipus = "";
    }
    public BL66(String nom, Integer edat, Integer num, Integer salari, String tipus){
        this.nom = nom;
        this.edat = edat;
        this.num = num;
        this.salari = salari;
        this.tipus = tipus;
    }

    /**
     * @return the nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * @param nom the nom to set
     */
    public void setNom(String nom) {
        this.nom = nom;
    }

    /**
     * @return the edat
     */
    public Integer getEdat() {
        return edat;
    }

    /**
     * @param edat the edat to set
     */
    public void setEdat(Integer edat) {
        this.edat = edat;
    }

    /**
     * @return the num
     */
    public Integer getNum() {
        return num;
    }

    /**
     * @param num the num to set
     */
    public void setNum(Integer num) {
        this.num = num;
    }

    /**
     * @return the salari
     */
    public Integer getSalari() {
        return salari;
    }

    /**
     * @param salari the salari to set
     */
    public void setSalari(Integer salari) {
        this.salari = salari;
    }

    /**
     * @return the tipus
     */
    public String getTipus() {
        return tipus;
    }

    /**
     * @param tipus the tipus to set
     */
    public void setTipus(String tipus) {
        this.tipus = tipus;
    }
    
}
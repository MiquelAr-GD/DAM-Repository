/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objectos;

import java.util.Scanner;

public class BL6_5 {

    public static void main(String[] args) {
        Scanner in = new Scanner (System.in);
        BL65[] notes = new BL65[5];
        int mm = 0, mc = 0, mf = 0, mp = 0, ma = 0;
        for (int i = 0; i < notes.length; i++) {
            System.out.println("Intro nom alumne");
            notes[i] = new BL65(in.nextLine(), ((int)(Math.random()*10)), ((int)(Math.random()*10)), ((int)(Math.random()*10)), ((int)(Math.random()*10)));
        }
        for (int i = 0; i < notes.length; i++) {
            System.out.print(notes[i].getNom() + "  " + notes[i].getCat() + "  " + notes[i].getMat() + "  " + notes[i].getPro() + "  " + notes[i].getFis());
            ma = (notes[i].getCat() + notes[i].getMat()+ notes[i].getFis()+ notes[i].getPro())/ 4;
            System.out.println("   " + ma);
            System.out.println("");
            mm = mm + notes[i].getMat();
            mc = mc + notes[i].getCat();
            mf = mf + notes[i].getFis();
            mp = mp + notes[i].getPro();
        }
        mm = mm / notes.length;
        mc = mc / notes.length;
        mp = mp / notes.length;
        mf = mf / notes.length;
        System.out.println("Mitjana de Catala: " + mc);
        System.out.println("Mitjana de Programacio: " + mp);
        System.out.println("Mitjana de Fisica: " + mf);
        System.out.println("Mitjana de Matematiques: " + mm);
    }
}

class BL65 {
    
    private String nom;
    private Integer mat;
    private Integer cat;
    private Integer pro;
    private Integer fis;
    
    public BL65() {
        this.nom = "";
        this.mat = 0;
        this.cat = 0;
        this.pro = 0;
        this.fis = 0;
    }

    public BL65(String nom, Integer mat, Integer cat, Integer pro, Integer fis) {
        this.nom = nom;
        this.mat = mat;
        this.cat = cat;
        this.pro = pro;
        this.fis = fis;
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
     * @return the mat
     */
    public Integer getMat() {
        return mat;
    }

    /**
     * @param mat the mat to set
     */
    public void setMat(Integer mat) {
        this.mat = mat;
    }

    /**
     * @return the cat
     */
    public Integer getCat() {
        return cat;
    }

    /**
     * @param cat the cat to set
     */
    public void setCat(Integer cat) {
        this.cat = cat;
    }

    /**
     * @return the pro
     */
    public Integer getPro() {
        return pro;
    }

    /**
     * @param pro the pro to set
     */
    public void setPro(Integer pro) {
        this.pro = pro;
    }

    /**
     * @return the fis
     */
    public Integer getFis() {
        return fis;
    }

    /**
     * @param fis the fis to set
     */
    public void setFis(Integer fis) {
        this.fis = fis;
    }
    
}

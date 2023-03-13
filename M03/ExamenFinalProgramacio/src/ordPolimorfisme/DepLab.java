/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ordPolimorfisme;

import java.util.Scanner;
import ordHerencia.*;

/**
 *
 * @author MiquelA
 */
public class DepLab extends Dep {

    private String Especialitat;
    private int PpH;

    public DepLab() {
        super();
        categoriaProfessional = "Classe A1";
    }

    public DepLab(String Nom, String Dni, String Esp, int pph) {
        super(Nom, Dni);
        categoriaProfessional = "Classe A1";
        Especialitat = Esp;
        PpH = pph;
    }

    public void souLaboral(int hores) {
        System.out.println("");
        System.out.println("El sou del treballador " + this.getNom() + " es : ");
        System.out.println(this.getPpH() * hores);
        System.out.println("");
    }

    @Override
    public void souTreballador() {
        System.out.println("");
        System.out.println("Intro hores treballades: ");
        System.out.println("");
        Scanner in = new Scanner(System.in);
        int hores = in.nextInt();
        System.out.println("Nom: " + this.nom);
        System.out.println("DNI: " + this.DNI);
        System.out.println("Especialitat: " + this.Especialitat);
        System.out.println("Sou: " + (this.PpH * hores) + "€ ");
    }

    /**
     * @return the Especialitat
     */
    public String getEspecialitat() {
        return Especialitat;
    }

    /**
     * @param Especialitat the Especialitat to set
     */
    public void setEspecialitat(String Especialitat) {
        this.Especialitat = Especialitat;
    }

    /**
     * @return the PpH
     */
    public int getPpH() {
        return PpH;
    }

    /**
     * @param PpH the PpH to set
     */
    public void setPpH(int PpH) {
        this.PpH = PpH;
    }
}

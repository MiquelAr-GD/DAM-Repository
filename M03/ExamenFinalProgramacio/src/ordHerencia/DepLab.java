/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ordHerencia;

/**
 *
 * @author MiquelA
 */
public class DepLab extends Dep {

    private String Especialitat;
    private int PpH;

    public DepLab() {
        super();
    }

    public DepLab(String Nom, String Dni, String Esp, int pph) {
        super(Nom, Dni);
        Especialitat = Esp;
        PpH = pph;
    }
    public void souLaboral (int hores){
        System.out.println("El sou del treballador " + this.getNom() + " es : ");
        System.out.println(this.getPpH() * hores);
        System.out.println("");
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

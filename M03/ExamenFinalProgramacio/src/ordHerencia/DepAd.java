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
public class DepAd extends Dep {

    private String carrec;
    private int SouMensual;
    final int Ret = 15;

    public DepAd() {
        super();
    }

    public DepAd(String Nom, String Dni, String Carrec, int SM) {
        super(Nom, Dni);
        carrec = Carrec;
        SouMensual = SM;
    }

    public void souAdministratiu () {
        System.out.println("El sou del treballador " + this.getNom() + " aplicant el 15% de retencions es:  ");
        System.out.println(SouMensual - (SouMensual * Ret / 100));
    }

    /**
     * @return the carrec
     */
    public String getCarrec() {
        return carrec;
    }

    /**
     * @param carrec the carrec to set
     */
    public void setCarrec(String carrec) {
        this.carrec = carrec;
    }

    /**
     * @return the SouMensual
     */
    public int getSouMensual() {
        return SouMensual;
    }

    /**
     * @param SouMensual the SouMensual to set
     */
    public void setSouMensual(int SouMensual) {
        this.SouMensual = SouMensual;
    }
}

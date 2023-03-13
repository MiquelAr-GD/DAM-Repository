/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ordInterfaces;


/**
 *
 * @author MiquelA
 */
public class DepAd extends Dep implements DepInterfice {

    private String carrec;
    private int SouMensual;


    public DepAd() {
        super();
        categoriaProfessional = "Classe B1";
    }

    public DepAd(String Nom, String Dni, String Carrec, int SM) {
        super(Nom, Dni);
        categoriaProfessional = "Classe B1";
        carrec = Carrec;
        SouMensual = SM;
    }

    public void souAdministratiu() {
        System.out.println("");
        System.out.println("El sou del treballador " + this.getNom() + " aplicant el 15% de retencions es:  ");
        System.out.println(SouMensual - (SouMensual * Ret / 100));
        System.out.println("");
    }

    @Override
    public void souTreballador() {
        System.out.println("");
        System.out.println("Nom: " + this.nom);
        System.out.println("DNI: " + this.DNI);
        System.out.println("Carrec: " + this.carrec);
        System.out.println("Sou mensual: " + this.SouMensual);
        System.out.println("Sou amb retencio: " + (SouMensual - (SouMensual * Ret / 100)) + "€ ");
        System.out.println("");
    }

    @Override
    public void poli2() {
        System.out.println("");
        System.out.println("El mètode executat està en la subclasse administratiu");
        System.out.println("");
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

    @Override
    public void nominaLab() { }

    @Override
    public void NominaAdm() {
        this.souTreballador();
    }

    
}

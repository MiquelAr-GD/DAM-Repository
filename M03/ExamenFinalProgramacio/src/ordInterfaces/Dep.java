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
public abstract class Dep implements DepInterfice {

    protected String nom;
    protected String DNI;
    protected String categoriaProfessional;

    public Dep() {
        nom = "";
        DNI = "";
    }

    public Dep(String Nom, String dni) {
        nom = Nom;
        DNI = dni;
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
     * @return the DNI
     */
    public String getDNI() {
        return DNI;
    }

    /**
     * @param DNI the DNI to set
     */
    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public void poli2(){
        System.out.println("");
        System.out.println("El mètode executat està en la superclasse");
        System.out.println("");
    }
    @Override
    public void nominaLab() {
    }
}

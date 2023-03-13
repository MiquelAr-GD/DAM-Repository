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
public class Dep {

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
    private String nom;
    private String DNI;
    
    
    public Dep(){
        nom = "";
        DNI = "";
    }
     public Dep(String Nom, String dni){
        nom = Nom;
        DNI = dni;
    }
}

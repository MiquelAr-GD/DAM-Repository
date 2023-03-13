
package Metodos;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class a22 {

    public static void main(String[] args) {
        Mesos[] mesos = new Mesos[5];
        Scanner in = new Scanner(System.in);
        String Nom;
        for (int i = 0; i < mesos.length; i++) {
            System.out.println("Intro nom mes:");
            Nom = in.nextLine();
            mesos[i] = new Mesos(Nom, ((int) (Math.random() * 100)), ((int) (Math.random() * 40)));
        }
        MostrarMesos(mesos);
        mesMesSec(mesos);
        mesMesCalent(mesos);
        MitjaPlujes(mesos);
        OrdenatsPerPrecipitacio(mesos);
        MostrarMesos(mesos);
    }

    private static void mesMesSec(Mesos[] vector) {
        int min = 0;
        for (int i = 0; i < vector.length; i++) {
            if (i == 0) {
                min = vector[0].getPlu();
            }
            if (vector[i].getPlu() < min) {
                min = vector[i].getPlu();
            }
        }
        for (int i = 0; i < vector.length; i++) {
            if (min == vector[i].getPlu()) {
                System.out.println("El mes mes sec es: " + vector[i].getPlu());
            }
        }
    }

    private static void mesMesCalent(Mesos[] vector) {
        int max = 0;
        for (int i = 0; i < vector.length; i++) {
            if (i == 0) {
                max = vector[0].getTemp();
            }
            if (vector[i].getTemp() > max) {
                max = vector[i].getTemp();
            }
        }
        for (int i = 0; i < vector.length; i++) {
            if (max == vector[i].getTemp()) {
                System.out.println("El mes mes calent es: " + vector[i].getTemp());
            }
        }
    }

    private static void MitjaPlujes(Mesos[] vector) {
        double suma = 0, mitja;
        for (int i = 0; i < vector.length; i++) {
            suma = suma + vector[i].getPlu();
        }
        mitja = suma / vector.length;
        System.out.println("La mitja del pes de les persones es de: " + mitja);
    }

    private static void OrdenatsPerPrecipitacio(Mesos[] vector) {
        Mesos aux = new Mesos();
        for (int i = 0; i < vector.length; i++) {
            for (int j = 1; j < vector.length; j++) {
                if (vector[j - 1].getPlu() < vector[j].getPlu()) {
                    aux = vector[j - 1];
                    vector[j - 1] = vector[j];
                    vector[j] = aux;
                }
            }
        }
    }
    private static void MostrarMesos(Mesos[]vector){
        for (int i = 0; i < vector.length; i++) {
            System.out.print(vector[i].getMes() + " ");
            System.out.print(vector[i].getPlu() + " ");
            System.out.print(vector[i].getTemp() + " ");
            System.out.println("");
        }
    }
}

class Mesos {

    private String Mes;
    private int plu;
    private int temp;

    public Mesos() {
        this.Mes = "";
        this.plu = 0;
        this.temp = 0;
    }

    public Mesos(String Mes, int plu, int temp) {
        this.Mes = Mes;
        this.plu = plu;
        this.temp = temp;
    }

    /**
     * @return the Mes
     */
    public String getMes() {
        return Mes;
    }

    /**
     * @param Mes the Mes to set
     */
    public void setMes(String Mes) {
        this.Mes = Mes;
    }

    /**
     * @return the plu
     */
    public int getPlu() {
        return plu;
    }

    /**
     * @param plu the plu to set
     */
    public void setPlu(int plu) {
        this.plu = plu;
    }

    /**
     * @return the temp
     */
    public int getTemp() {
        return temp;
    }

    /**
     * @param temp the temp to set
     */
    public void setTemp(int temp) {
        this.temp = temp;
    }
}

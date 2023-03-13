package HerenciaPracticaGuiada;

import java.util.Scanner;

public class herenciaPracticaGuiada {

    public static void main(String[] args) {
        vehicles[] cotxes = new vehicles[10];
        Scanner in = new Scanner(System.in);
        menu(in, cotxes);

    }

    private static void menu(Scanner in, vehicles[] cotxes) {
        Scanner text = new Scanner(System.in);
        int menu = 456789;
        while (menu != 0) {
            System.out.println("----------------------------------------------");
            System.out.println("Escull una opció");
            System.out.println("1. Alta vehicle");
            System.out.println("2. Generar el permís de circulació d’un vehicle");
            System.out.println("0. Exit");
            menu = in.nextInt();
            switch (menu) {
                case (1):
                    System.out.println("Quin tipus de vehicle es? Electric o de Combustio?");
                    System.out.println("1 Electric");
                    System.out.println("2 Combustio");
                    int menu2 = in.nextInt();
                    altaVehicle(menu2, cotxes);
                    break;

                case (2):
                    System.out.println("Intro matricula del vehicle que vols donar d'alta: ");
                    String matricula = text.nextLine();
                    cotxes[buscarVehicle(cotxes, matricula)].generaPermisCirculacio();
                    break;
                default:
                    break;

            }
        }
    }

    private static void altaVehicle(int num, vehicles[] cotxes) {
        Scanner in = new Scanner(System.in);
        Scanner ints = new Scanner(System.in);
        String model, matricula, color;
        System.out.println("Intro model: ");
        model = in.nextLine();
        System.out.println("Intro matricula: ");
        matricula = in.nextLine();
        System.out.println("Intro color: ");
        color = in.nextLine();
        switch (num) {
            case 1:
                System.out.println("Intro capacitat bateria: ");
                int capacitat = ints.nextInt();
                cotxes[buscarLloc(cotxes)] = new electrics(model, matricula, color, capacitat);
                break;
            case 2:
                System.out.println("Intro cilindrada: ");
                int cilindrada = ints.nextInt();
                cotxes[buscarLloc(cotxes)] = new combustio(model, matricula, color, cilindrada);
                break;
            default:
                break;
        }

    }

    private static int buscarLloc(vehicles[] cotxes) {
        int pos = 0;
        for (int i = 0; i < 10; i++) {
            if (cotxes[i] == null) {
                pos = i;
                i = 10;
            }
        }
        return pos;
    }

    private static int buscarVehicle(vehicles[] cotxes, String matricula) {
        int pos = 0;
        for (int i = 0; i < 10; i++) {
            if (cotxes[i].getMatricula().equals(matricula)) {
                pos = i;
            }
        }
        return pos;

    }
}

// *************************************************
// *************    C  L  A  S  S  E  S  ***********
// *************************************************
class vehicles {

    // Atributs
    private String model;
    private String matricula;
    private String color;
    private boolean activat;
    private int potenciaVehicle;

    // Constructors
    public vehicles() {

    }

    public vehicles(String model, String matricula, String color) {
        this.model = model;
        this.matricula = matricula;
        this.color = color;
        this.activat = true;

    }

    // MÃ¨todes especÃ­fics
    public void venda() {
        System.out.println("Generem la venda");
        this.setActivat(false);
    }

    public void obrirIncidencia() {
        System.out.println("Obrim una incidencia");
    }

    public void tancarIncidencia() {
        System.out.println("Tanquem una incidencia");
    }

    public void generaPermisCirculacio() {
        System.out.println("Model: " + this.getModel());
        System.out.println("MatrÃ­cula" + this.getMatricula());

    }

    // Sets i gets
    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isActivat() {
        return activat;
    }

    public void setActivat(boolean activat) {
        this.activat = activat;
    }

    public int getPotenciaVehicle() {
        return potenciaVehicle;
    }

    public void setPotenciaVehicle(int potenciaVehicle) {
        this.potenciaVehicle = potenciaVehicle;
    }
}

class electrics extends vehicles {

    // Atributs
    private int capacitatBateria;
    private int consumElectric;
    private int autonomia;
    private int potenciaCarrega;

    // Constructors
    public electrics() {
        super();
    }

    public electrics(String model, String matricula, String color, int capacitatBateria) {
        super(model, matricula, color);
        if (capacitatBateria < 100) {
            System.out.println("No es pot introduir aquesta dada");
        } else {
            this.capacitatBateria = capacitatBateria;
            System.out.println("Dada introduida correctament");
        }
    }

    //MÃ¨todes especÃ­fics
    public void informeEmissioZero() {
        System.out.println("Informe d'emissiÃ³ zero");
        this.generaPermisCirculacio();
        System.out.println("Consum elÃ¨ctric" + this.getConsumElectric());
        System.out.println("PotÃ¨ncia de cÃ rrega" + this.getPotenciaCarrega());
    }

    public void fitxaConsumElectric() {
        System.out.println("Fitxa consum elÃ¨ctric");
        this.generaPermisCirculacio();
        System.out.println("Consum elÃ¨ctric" + this.getConsumElectric());
        System.out.println("PotÃ¨ncia de cÃ rrega" + this.getPotenciaCarrega());
    }

    // Sets i gets
    public int getCapacitatBateria() {
        return capacitatBateria;
    }

    public void setCapacitatBateria(int capacitatBateria) {
        if (capacitatBateria < 100) {
            System.out.println("No es pot introduir aquesta dada");
        } else {
            this.capacitatBateria = capacitatBateria;
            System.out.println("Dada introduida correctament");
        }
    }

    public int getConsumElectric() {
        return consumElectric;
    }

    public void setConsumElectric(int consumElectric) {
        this.consumElectric = consumElectric;
    }

    public int getAutonomia() {
        return autonomia;
    }

    public void setAutonomia(int autonomia) {
        this.autonomia = autonomia;
    }

    public int getPotenciaCarrega() {
        return potenciaCarrega;
    }

    public void setPotenciaCarrega(int potenciaCarrega) {
        this.potenciaCarrega = potenciaCarrega;
    }
}

class combustio extends vehicles {

    // Atributs
    private int cilindrada;
    private String tipusMotor;
    private float consumLitres;

    // Constructors
    public combustio() {
        super();
    }

    public combustio(String model, String matricula, String color, int cilindrada) {
        super(model, matricula, color);
        this.cilindrada = cilindrada;
    }

    // MÃ¨todes especÃ­fics
    public void informeEmissiohidrocarburs() {
        System.out.println("Informe d'emissiÃ³ per hidrocarburs");
        this.generaPermisCirculacio();
        System.out.println("Cilindrada" + this.getCilindrada());
        System.out.println("Tipus Motor" + this.getTipusMotor());
    }

    // Sets i gets
    public int getCilindrada() {
        return cilindrada;
    }

    public void setCilindrada(int cilindrada) {
        this.cilindrada = cilindrada;
    }

    public String getTipusMotor() {
        return tipusMotor;
    }

    public void setTipusMotor(String tipusMotor) {
        this.tipusMotor = tipusMotor;
    }

    public float getConsumLitres() {
        return consumLitres;
    }

    public void setConsumLitres(float consumLitres) {
        this.consumLitres = consumLitres;
    }

}

package HerenciaPracticaGuiada;

import java.util.Scanner;

public class PolimorfismeCotxes {

    public static void main(String[] args) {

        vehicles[] arrVehicles = new vehicles[1000];
        carregaDades(arrVehicles);
        int opcio;
        opcio = pintaMenu();
        while (opcio != 0) {
            switch (opcio) {
                case 1:
                    altaVehicle(arrVehicles);
                    break;
                case 2:
                    generaPermis(arrVehicles);
                    break;
                case 3:
                    generaInformeEmissio0(arrVehicles);
                    break;
                case 4:
                    generaTotsPermisos(arrVehicles);
                    break;
                case 5:
                    baixaVehicle(arrVehicles);
                    break;
                case 6:
                    llistatAltesBaixes(arrVehicles);
                    break;
                case 8:
                    canviarUnitats(arrVehicles);
                    break;
                case 9:
                    generaFacturaVendraS(arrVehicles);
                    break;
                case 10:
                    preuPerTipus(arrVehicles);
                    break;
                case 11:
                    preuPerMoneda(arrVehicles);
                    break;
            }
            opcio = pintaMenu();
        }
    }

    public static void carregaDades(vehicles[] arrVehicles) {
        arrVehicles[0] = new combustio("Seat", "1111BBB", "Vermell", 1500);
        ((combustio) arrVehicles[0]).setTipusMotor("Gasoil");
        arrVehicles[0].setPreu(8500);
        arrVehicles[1] = new combustio("Ford", "2222CCC", "Verd", 1200);
        ((combustio) arrVehicles[1]).setTipusMotor("Benzina");
        arrVehicles[1].setPreu(12000);
        arrVehicles[2] = new electrics("Tesla", "3333DDD", "blanc", 250);
        ((electrics) arrVehicles[2]).setAutonomia(300);
        arrVehicles[2].setPreu(35000);
        arrVehicles[3] = new electrics("Kia", "4444FFF", "Vermell", 150);
        ((electrics) arrVehicles[3]).setAutonomia(250);
        arrVehicles[3].setPreu(20000);
    }

    public static void preuPerTipus(vehicles[] arrVehicles) {
        for (int i = 0; i < arrVehicles.length; i++) {
            if (arrVehicles[i] != null) {
                System.out.println("Matricula" + arrVehicles[i].getMatricula());
                arrVehicles[i].tipusPreu();
            } else {
                i = 999;
            }
        }

    }

    public static void preuPerMoneda(vehicles[] arrVehicles) {
        for (int i = 0; i < arrVehicles.length; i++) {
            if (arrVehicles[i] != null) {
                System.out.println("Matricula" + arrVehicles[i].getMatricula());
                arrVehicles[i].printPreu();
            } else {
                i = 999;
            }
        }

    }

    public static void generaFacturaVendraS(vehicles[] arrVehicles) {
        Scanner in = new Scanner(System.in);
        System.out.println("Intro matricula ");
        String matricula = in.nextLine();
        for (int i = 0; i < arrVehicles.length; i++) {
            if (arrVehicles[i] != null) {
                if (arrVehicles[i].getMatricula().equals(matricula)) {
                    if (arrVehicles[i] instanceof electrics) {
                        arrVehicles[i].generaFacturaVenda();
                    } else {
                        arrVehicles[i].generaFacturaVenda();
                    }
                }
            } else {
                i = 999;
            }
        }
    }

    public static int pintaMenu() {
        int opcio;
        Scanner num = new Scanner(System.in);
        System.out.println("INDEX...");
        System.out.println("1. Dona d'alta vehicle");
        System.out.println("2. Genera permís de circulació");
        System.out.println("3. Genera informe emissions 0");
        System.out.println("4. Genera tots els permisos de circulació");
        System.out.println("5. Dóna de baixa un vehicle");
        System.out.println("6. Llistat de altes i baixes");
        System.out.println("8. Canvi unitats");
        System.out.println("9. Genera factura de venta");
        System.out.println("10. Mostra preu per tipus");
        System.out.println("11. Mostra preu per tipus i moneda");
        System.out.println("0. Sortir");
        System.out.println("Intro l'opció elegida");
        return num.nextInt();
    }

    public static void altaVehicle(vehicles[] arrVehicles) {
        Scanner num = new Scanner(System.in);
        Scanner str = new Scanner(System.in);

        System.out.println("Model: ");
        String model = str.nextLine();
        System.out.println("Matrícula: ");
        String matricula = str.nextLine();
        System.out.println("Color: ");
        String color = str.nextLine();
        System.out.println("Quin tipus de vehicle ? elèctric(e) / Combustió(c)");
        char opcio = num.nextLine().charAt(0);
        if (opcio == 'e') {
            // D'una forma
            electrics vehicleE = new electrics();
            System.out.println("Capacitat Bateria");
            vehicleE.setCapacitatBateria(num.nextInt());
            vehicleE.setModel(model);
            vehicleE.setColor(color);
            vehicleE.setMatricula(matricula);
            vehicleE.setAutonomia(245);
            posaOnToca(arrVehicles, vehicleE);
        } else if (opcio == 'c') {
            //D'una altra forma'
            System.out.println("Cilindrada:");
            int cilindrada = num.nextInt();
            combustio vehicleC = new combustio(model, matricula, color, cilindrada);
            vehicleC.setTipusMotor("Gasoil");
            posaOnToca(arrVehicles, vehicleC);
        } else {
            System.out.println("Entrada incorrecta");
        }
    }

    public static void posaOnToca(vehicles[] arrVehicles, vehicles introvehicle) {
        boolean noAcaba = true;
        for (int i = 0; i < arrVehicles.length && noAcaba; i++) {
            if (arrVehicles[i] == null) {
                arrVehicles[i] = introvehicle;
                noAcaba = false;
            }
        }
    }

    public static void mostraArray(vehicles[] arrVehicles) {
        for (int i = 0; i < arrVehicles.length && arrVehicles[i] != null; i++) {
            System.out.println(arrVehicles[i].getModel());
            System.out.println(arrVehicles[i].getMatricula());
            System.out.println(arrVehicles[i].getColor());
            System.out.println(arrVehicles[i].isActivat());
            System.out.println(arrVehicles[i].getPotenciaVehicle());
            if (arrVehicles[i] instanceof electrics) {
                System.out.println(((electrics) arrVehicles[i]).getCapacitatBateria());
            } else {
                System.out.println(((combustio) arrVehicles[i]).getCilindrada());
            }
        }
    }

    // ACTIVITAT 3
    public static void generaPermis(vehicles[] arrVehicles) {
        Scanner str = new Scanner(System.in);
        System.out.println("Matrícula: ");
        String matricula = str.nextLine();

        for (vehicles vehicle : arrVehicles) {
            if (vehicle.getMatricula().equals(matricula)) {
                vehicle.generaPermisCirculacio();
            }
        }
    }

    // ACTIVITAT 4
    public static void generaInformeEmissio0(vehicles[] arrVehicles) {
        Scanner str = new Scanner(System.in);
        System.out.println("Matrícula: ");
        String matricula = str.nextLine();

        for (vehicles vehicle : arrVehicles) {
            if (vehicle.getMatricula().equals(matricula)) {
                ((electrics) vehicle).informeEmissioZero();
            }
        }

    }

    // ACTIVITAT 5
    public static void generaTotsPermisos(vehicles[] arrVehicles) {

        for (int i = 0; i < arrVehicles.length; i++) {
            if (arrVehicles[i] != null) {
                System.out.println("Model: " + arrVehicles[i].getModel());
                System.out.println("Matrícula" + arrVehicles[i].getMatricula());
                if (arrVehicles[i] instanceof electrics) {
                    System.out.println("Potencia de càrrega: "
                            + ((electrics) arrVehicles[i]).getPotenciaCarrega());
                } else {
                    System.out.println("Cilindrada: "
                            + ((combustio) arrVehicles[i]).getCilindrada());
                }
            } else {
                i = 999;
            }
        }
    }

    // ACTIVITAT 6
    public static void baixaVehicle(vehicles[] arrVehicles) {
        Scanner str = new Scanner(System.in);
        System.out.println("Matrícula");
        String matricula = str.nextLine();
        boolean existeix = false;
        for (vehicles vehicle : arrVehicles) {
            if (vehicle.getMatricula().equals(matricula)) {
                mostraArray(arrVehicles);
                vehicle.venda();
                existeix = true;
            }
        }
        if (!existeix) {
            System.out.println("Aquest vehicle no està registrat");
        }
    }

// ACTIVITAT 7
    public static void llistatAltesBaixes(vehicles[] arrVehicles) {
        vehicles[] altes = new vehicles[1000];
        vehicles[] baixes = new vehicles[1000];
        int a = 0, b = 0;
        for (vehicles vehicle : arrVehicles) {
            if (vehicle != null) {
                if (vehicle.isActivat()) {
                    altes[a] = vehicle;
                    a++;
                } else {
                    baixes[b] = vehicle;
                    b++;
                }
            } else {
                break;
            }
        }
        System.out.println("Llistat de vehicles d'alta");
        mostraArray(altes);
        System.out.println("Llistat de vehicles d'alta");
        mostraArray(baixes);
    }

    // ACIVITAT 8
    public static void canviarUnitats(vehicles[] arrVehicles) {
        for (vehicles vehicle : arrVehicles) {
            if (vehicle != null) {
                if (vehicle instanceof electrics) {
                    ((electrics) vehicle).canviUnitats();
                }
            } else {
                break;
            }
        }
    }

}

// *************************************************
// *************    C  L  A  S  S  E  S  ***********
// *************************************************
abstract class vehicles {

    // Atributs
    protected String model;
    protected String matricula;
    protected String color;
    protected boolean activat;
    protected int potenciaVehicle;
    protected int preu;

    // Constructors
    public vehicles() {

    }

    public vehicles(String model, String matricula, String color) {
        this.model = model;
        this.matricula = matricula;
        this.color = color;
        this.activat = true;

    }

    // Mètodes específics
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
        System.out.println("Matrícula" + this.getMatricula());

    }

    public abstract void generaFacturaVenda();

    public void informeEmissioZero() {
        System.out.println("Informe d'emissió zero");
        System.out.println("Aquest vehicle no es electric");

    }

    public abstract void printPreu();

    public abstract void tipusPreu();

    // Sets i gets
    public void setPreu(int Preu) {
        this.preu = Preu;
    }

    public int getPreu() {
        return preu;
    }

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

    //Mètodes específics
    @Override
    public void printPreu() {
        System.out.println("Preu en dolars : " + (this.preu * 1.21));
    }

    @Override
    public void tipusPreu() {
        System.out.println("Aquest vehicle es de tipus ELECTRIC y te un preu de " + this.preu + "€");
    }

    @Override
    public void informeEmissioZero() {
        System.out.println("Informe d'emissió zero");
        this.generaPermisCirculacio();
        System.out.println("Consum elèctric" + this.getConsumElectric());
        System.out.println("Potència de càrrega" + this.getPotenciaCarrega());
    }

    public void fitxaConsumElèctric() {
        System.out.println("Fitxa consum elèctric");
        this.generaPermisCirculacio();
        System.out.println("Consum elèctric" + this.getConsumElectric());
        System.out.println("Potència de càrrega" + this.getPotenciaCarrega());
    }

    public void canviUnitats() {
        this.setPotenciaCarrega(this.getPotenciaCarrega() * 1000);
    }

    @Override
    public void generaFacturaVenda() {
        System.out.println("Factura del cotxe " + this.model);
        System.out.println("Amb matricula " + this.matricula);
        System.out.println("Amb un preu inicial de " + this.preu + "€");
        System.out.println("Amb el bono de 4000€ per ser electric, el preu definitiu es: " + (this.preu - 4000));
        System.out.println("I amb una capacitat de bateria de " + this.capacitatBateria);

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

    // Mètodes específics
    @Override
    public void tipusPreu() {
        System.out.println("Aquest vehicle es de tipus de COMBUSTIO y te un preu de " + this.preu + "€");
    }

    public void informeEmissiohidrocarburs() {
        System.out.println("Informe d'emissió per hidrocarburs");
        this.generaPermisCirculacio();
        System.out.println("Cilindrada" + this.getCilindrada());
        System.out.println("Tipus Motor" + this.getTipusMotor());
    }

    @Override
    public void generaFacturaVenda() {
        System.out.println("Factura del cotxe " + this.model);
        System.out.println("Amb matricula " + this.matricula);
        System.out.println("Amb un preu de " + this.preu + "€");
        System.out.println("I amb una cilindrada de " + this.cilindrada);

    }

    @Override
    public void printPreu() {
        System.out.println("Preu en euros : " + this.preu);
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

    class hibrids extends vehicles {

        // Atributs
        private int capacitatBateria;
        private int consumElectric;
        private int autonomia;
        private int potenciaCarrega;
        private int cilindrada;
        private float consumLitres;

        // Constructors
        public hibrids() {
            super();
        }

        public hibrids(String model, String matricula, String color, int capacitatBateria) {
            super(model, matricula, color);
            if (capacitatBateria < 100) {
                System.out.println("No es pot introduir aquesta dada");
            } else {
                this.capacitatBateria = capacitatBateria;
                System.out.println("Dada introduida correctament");
            }
        }

        //Mètodes específics
        @Override
        public void printPreu() {
            System.out.println("Preu en iens : " + (this.preu * 132.26));
        }

        public void informeEmissiohidrocarburs() {
            System.out.println("Informe d'emissió per hidrocarburs");
            this.generaPermisCirculacio();
            System.out.println("Cilindrada" + this.getCilindrada());
        }

        public void fitxaConsumElèctric() {
            System.out.println("Fitxa consum elèctric");
            this.generaPermisCirculacio();
            System.out.println("Consum elèctric" + this.getConsumElectric());
            System.out.println("Autonomia " + this.getAutonomia());
        }

        public void canviUnitats() {
            this.setPotenciaCarrega(this.getPotenciaCarrega() * 1000);
        }

        @Override
        public void tipusPreu() {
            System.out.println("Aquest vehicle es de tipus HIBRID y te un preu de " + this.preu + "€");
        }

        @Override
        public void generaFacturaVenda() {
            System.out.println("Factura del cotxe " + this.model);
            System.out.println("Amb matricula " + this.matricula);
            System.out.println("Amb un preu inicial de " + this.preu + "€");
            System.out.println("I amb una capacitat de bateria de " + this.capacitatBateria);
            System.out.println("Amb una cilindrada de " + this.cilindrada);

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

        /**
         * @return the cilindrada
         */
        public int getCilindrada() {
            return cilindrada;
        }

        /**
         * @param cilindrada the cilindrada to set
         */
        public void setCilindrada(int cilindrada) {
            this.cilindrada = cilindrada;
        }

        /**
         * @return the consumLitres
         */
        public float getConsumLitres() {
            return consumLitres;
        }

        /**
         * @param consumLitres the consumLitres to set
         */
        public void setConsumLitres(float consumLitres) {
            this.consumLitres = consumLitres;
        }
    }
}

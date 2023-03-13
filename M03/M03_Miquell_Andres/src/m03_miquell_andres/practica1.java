package pooHerencia;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class practica1 {

    public static void main(String args[]) {

        // Variables
        int opcio;
        Scanner in = new Scanner(System.in);
        Scanner inText = new Scanner(System.in);
        llibres[] llibresArr = new llibres[10];
        String modificacio;

        opcio = menu(in);

        while (opcio != 0) {
            switch (opcio) {
                case 1:
                    emplenaDades(llibresArr);
                    break;
                case 2:
                    nouAssaig(llibresArr, in, inText);
                    break;
                case 3:
                    novaNarrativa(llibresArr, in, inText);
                    break;
                case 4:
                    mostraFitxes(llibresArr);
                    break;
                case 5:
                    cercaIven(llibresArr, inText);
                    break;
                case 6:
                    ImprimirArgTeatre(llibresArr);
                    break;
                case 7:
                    System.out.println("Indica la modificació amb el format que s'indica ( sense decomals)");
                    System.out.println("   +10 -> Augmentar un 10 % el preu");
                    System.out.println("   -5 -> Disminuir un 5 % el preu");
                    modificacio = inText.nextLine();
                    ModificaPreuPerIsbn(llibresArr, inText, modificacio);
                    break;
                case 8:
                    System.out.println("Indica la modificació amb el format que s'indica ( sense decomals)");
                    System.out.println("   +10 -> Augmentar un 10 % el preu");
                    System.out.println("   -5 -> Disminuir un 5 % el preu");
                    modificacio = inText.nextLine();
                    ModificaPreuPerTipus(llibresArr, inText, modificacio);
                    break;                    
                case 9:
                    divulgacioCercaParaula(llibresArr, inText);
                    break;
            }
            opcio = menu(in);
        }

    }

    public static int menu(Scanner in) {

        System.out.println("1.Emplena de dades automàticament");
        System.out.println("2.Nou Assaig");
        System.out.println("3.Nova narrativa");
        System.out.println("4.Mostra totes les fitxes");
        System.out.println("5.Cerca per titol i ven un exemplar");
        System.out.println("6.Imprimeix l'argument de les obres de narrativa");
        System.out.println("7.Modifica preu per isbn");
        System.out.println("8.Modifica preu per tipus de publicació");
        System.out.println("9.Cerca en divulgacio");
        System.out.println("0.Sortir");
        System.out.println("Escull una de les opcions");

        int opcio = in.nextInt();
        return opcio;
    }

    public static void emplenaDades(llibres[] llibresArr) {

        String ruta_fitxer = "/home/vlino/Dropbox/java_15_16/Programacio UF4/src/pooHerencia/llibres.csv";
        String linia;
        int i = 0, error = 0;

        File id_fitxer = new File(ruta_fitxer);
        try {
            Scanner llegir_linies = new Scanner(id_fitxer);
            while (llegir_linies.hasNext()) {
                if (llegir_linies.hasNextLine()) {
                    linia = llegir_linies.nextLine();
                    String[] liniaArr = linia.split(";");
                    // Elements diferrenciats
                    switch (liniaArr[0]) {
                        case "Narrativa":
                            llibresArr[i] = new narrativa();
                            ((narrativa) llibresArr[i]).setGenere(liniaArr[7]);
                            break;
                        case "Teatre":
                            llibresArr[i] = new teatre();
                            ((teatre) llibresArr[i]).setArgument(liniaArr[7]);
                            break;
                        case "Assaig":
                            llibresArr[i] = new assaig();
                            ((assaig) llibresArr[i]).setNombreAssajosAutor(Integer.parseInt(liniaArr[7]));
                            break;
                        case "Divulgació":
                            llibresArr[i] = new divulgacio();
                            ((divulgacio) llibresArr[i]).setAmbit(liniaArr[7]);
                            break;
                        default:
                            System.out.println("Registre " + i + " incorrecte.");
                            error = 1;

                    }
                    if (error == 0) {
                        //Podem ja introduir els elements comuns
                        llibresArr[i].setTitol(liniaArr[1]);
                        llibresArr[i].setIsbn(liniaArr[2]);
                        llibresArr[i].setAutor(liniaArr[3]);
                        llibresArr[i].setEditorial(liniaArr[4]);
                        llibresArr[i].setExemplars(Integer.parseInt(liniaArr[5]));
                        llibresArr[i].setPreu(Float.parseFloat(liniaArr[6]));
                    }
                    i++;
                }
            }
            System.out.println();
        } catch (FileNotFoundException e) {
            System.out.printf("Error en llegir l'arxiu.\n");
            System.out.printf("Missatge del sistema: %s\n", e.getMessage());
        }

    }

//    public static void emplenaDades(llibres[] llibresArr) {
//        llibresArr[0] = new narrativa("Nar1", "isbn0", "autNar1", "editNar1", 5, 3.4, "Terror");
//        llibresArr[1] = new assaig("Ass1", "isbn1", "autAss1", "editAss1", 12, 12.45, 8);
//        llibresArr[2] = new teatre("Tea1", "isbn2", "autTea1", "editNar1", 5, 22.35, "Arg1");
//        llibresArr[3] = new narrativa("Nar2", "isbn3", "autNar2", "editNar1", 7, 8.45, "Terror");
//        llibresArr[4] = new divulgacio("Div1", "isbn4", "autDiv1", "editDiv1", 10, 5.45, "Ciència");
//        llibresArr[5] = new narrativa("Nar3", "isbn5", "autNar3", "editNar3", 10, 13.46, "Ciencia ficció");
//        llibresArr[6] = new assaig("Ass2", "isbn6", "autAss2", "editAss1", 1, 15.50, 8);
//        llibresArr[7] = new divulgacio("Div2", "isbn7", "autDiv2", "editDiv1", 15, 15.00, "Tecnologia");
//    }
    public static void nouAssaig(llibres[] llibresArr, Scanner in, Scanner inText) {

        if (posicioLliure(llibresArr) != -1) {
            // Generem l'objecte
            assaig assaigNou = new assaig();
            // Extreiem i introduim valors de diferents formes
            // Forma 1
            System.out.print("Títol: ");
            String var = inText.nextLine();
            assaigNou.setTitol(var);
            //Forma 2
            System.out.print("Autor: ");
            assaigNou.setAutor(inText.nextLine());
            System.out.print("ISBN: ");
            assaigNou.setIsbn(inText.nextLine());
            System.out.print("Editorial: ");
            assaigNou.setEditorial(inText.nextLine());
            System.out.print("Exemplars: ");
            assaigNou.setExemplars(in.nextInt());
            System.out.print("Preu: ");
            assaigNou.setPreu(inText.nextDouble());
            System.out.print("Nombre assajos: ");
            assaigNou.setNombreAssajosAutor(in.nextInt());
            // Li fem un càsting. 
            // Podriem no fer-li i no donaria cap error però estariem desant 
            // un objecte de tipus assaig i no llibres, que és com tenim
            // definit l'array
            llibresArr[posicioLliure(llibresArr)] = (llibres) assaigNou;
        } else {
            System.out.println("L'array està complet");
        }
    }

    public static void novaNarrativa(llibres[] llibresArr, Scanner in, Scanner inText) {

        if (posicioLliure(llibresArr) != -1) {
            // Generem l'objecte
            narrativa novaNarr = new narrativa();
            // Extreiem i introduim valors de diferents formes
            // Forma 1
            System.out.print("Títol: ");
            String var = inText.nextLine();
            novaNarr.setTitol("var");
            //Forma 2
            System.out.print("Autor: ");
            novaNarr.setAutor(inText.nextLine());
            System.out.print("ISBN: ");
            novaNarr.setIsbn(inText.nextLine());
            System.out.print("Editorial: ");
            novaNarr.setEditorial(inText.nextLine());
            System.out.print("Exemplars: ");
            novaNarr.setExemplars(in.nextInt());
            System.out.print("Preu: ");
            novaNarr.setPreu(in.nextDouble());
            System.out.print("Gènere: ");
            novaNarr.setGenere(inText.nextLine());

            llibresArr[posicioLliure(llibresArr)] = (llibres) novaNarr;
        } else {
            System.out.println("L'array està complet");
        }
    }

    public static int posicioLliure(llibres[] llibresArr) {

        for (int i = 0; i < llibresArr.length; i++) {
            if (llibresArr[i] == null) {
                return i;
            }
        }
        // Retorna -1 si l'array està complet
        return -1;

    }

    public static void mostraFitxes(llibres[] llibresArr) {
        for (llibres llibre : llibresArr) {
            if (llibre != null) {
                System.out.println("Nova fitxa de llibre");
                System.out.println(">>> " + llibre.getAutor());
                System.out.println(">>> " + llibre.getTitol());
                System.out.println(">>> " + llibre.getIsbn());
            }
        }
    }

    public static void cercaIven(llibres[] llibresArr, Scanner inText) {

        String titol;

        System.out.println("Introduiex l'titol de la publicació que vol vendre..");
        titol = inText.nextLine();

        for (llibres llibre : llibresArr) {
            if (llibre != null) {
                if (llibre.getTitol().equals(titol)) {
                    if (llibre.getExemplars() == 0) {
                        System.out.println("No queden exemplars");
                    } else {
                        llibre.setExemplars(llibre.getExemplars() - 1);
                        System.out.println("Llibre venut");
                    }
                }
            }
        }
    }

    public static void ImprimirArgTeatre(llibres[] llibresArr) {
        for (llibres llibre : llibresArr) {
            if (llibre != null) {
                if (llibre instanceof teatre) {
                    System.out.println("Argunent del llibre " + llibre.getTitol());
                    System.out.println(((teatre) llibre).getArgument());
                }
            }
        }
    }

    public static void ModificaPreuPerIsbn(llibres[] llibresArr, Scanner in, String modificacio) {

        String operacio = modificacio.substring(0, 1);
        float percentatge = Float.parseFloat(modificacio.substring(1, modificacio.length()));

        System.out.println("Quin és l'isbn");
        String isbn = in.nextLine();

        for (llibres llibre : llibresArr) {
            if (llibre != null) {
                if (llibre.getIsbn().equals(isbn)) {
                    System.out.println("Preu del llibre abans... " + llibre.getPreu());
                    if (operacio.equals("+")) {
                        llibre.setPreu(llibre.getPreu() * (1 + (percentatge / 100)));
                    } else {
                        llibre.setPreu(llibre.getPreu() * (1 - (percentatge / 100)));
                    }
                    System.out.println("Preu del llibre després... " + llibre.getPreu());
                }
            }
        }
    }

    public static void ModificaPreuPerTipus(llibres[] llibresArr, Scanner in, String modificacio) {

        String operacio = modificacio.substring(0, 1);
        float percentatge = Float.parseFloat(modificacio.substring(1, modificacio.length()));
        float multiplicador = 1;
        if (operacio.equals("+")) {
            multiplicador = 1 + (percentatge / 100);
        } else {
            multiplicador = 1 - (percentatge / 100);
        }

        System.out.println("Quin és el tipus (Narrativa, Teatre, Assaig, Divulgació");
        String tipus = in.nextLine();

        // Segur que es pot millorar però no veig com....
        for (llibres llibre : llibresArr) {
            if (llibre != null) {
                if ((llibre instanceof narrativa) && (tipus.equals("Narrativa"))) {
                    System.out.println("Preu del llibre abans... " + llibre.getPreu());
                    llibre.setPreu(llibre.getPreu() * multiplicador);
                    System.out.println("Preu del llibre després... " + llibre.getPreu());
                } else if ((llibre instanceof teatre) && (tipus.equals("Teatre"))) {
                    System.out.println("Preu del llibre abans... " + llibre.getPreu());
                    llibre.setPreu(llibre.getPreu() * multiplicador);
                    System.out.println("Preu del llibre després... " + llibre.getPreu());
                } else if ((llibre instanceof assaig) && (tipus.equals("Assaig"))) {
                    System.out.println("Preu del llibre abans... " + llibre.getPreu());
                    llibre.setPreu(llibre.getPreu() * multiplicador);
                    System.out.println("Preu del llibre després... " + llibre.getPreu());
                } else if ((llibre instanceof divulgacio) && (tipus.equals("Divulgació"))) {
                    System.out.println("Preu del llibre abans... " + llibre.getPreu());
                    llibre.setPreu(llibre.getPreu() * multiplicador);
                    System.out.println("Preu del llibre després... " + llibre.getPreu());
                } else {
                    System.out.println("No és correcte el tipus de publicació");
                }
                
            }
        }
    }

    public static void divulgacioCercaParaula(llibres[] llibresArr, Scanner inText) {
        System.out.println("Quina paraula clau vols cercar ?");
        String clau = inText.nextLine();
        int contador = 0;
        for (llibres llibre : llibresArr) {
            if (llibre != null) {
                if (llibre instanceof divulgacio) {
                    if (((divulgacio) llibre).getAmbit().contains(clau)) {
                        System.out.println("El llibre " + llibre.getTitol() + " conté la paraula \"" + clau + "\"");
                        contador++;
                    }
                }
            }
        }
        System.out.println(contador + " llibres contene la paruala clau");
    }



}

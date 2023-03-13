/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ordInterfaces;

import java.util.Scanner;

/**
 *
 * @author MiquelA
 */
public class MAIN {

    public static void main(String[] args) {
        Dep[] arrDep = new Dep[6];
        carregaDades(arrDep);
        int opcio;
        opcio = pintaMenu();
        while (opcio != 0) {
            switch (opcio) {
                case 1:
                    SouLab(arrDep);
                    break;
                case 2:
                    SouAd(arrDep);
                    break;
                case 3:
                    ImprimeixDades(arrDep);
                    break;
                case 4:
                    ImprimeixDadesSol(arrDep);
                    break;
                case 5:
                    sousPagatsTotal(arrDep);
                    break;
                case 6:
                    SouTreballador(arrDep);
                    break;
                case 7:
                    nomClasse(arrDep);
                    break;
            }
            opcio = pintaMenu();
        }
    }

    public static void nomClasse(Dep[] arrDep) {
        for (Dep treballador : arrDep) {
            System.out.println("");
            System.out.println("Nom: " + treballador.getNom());
            System.out.println("Classe: " + treballador.categoriaProfessional);
            System.out.println("");
        }
    }

    public static void SouTreballador(Dep[] arrDep) {
        for (Dep treballador : arrDep) {
            treballador.souTreballador();
        }
    }

    public static void sousPagatsTotal(Dep[] arrDep) {
        System.out.println("");
        System.out.println("Quantes hores han treballat els el departament Laboral?");
        System.out.println("");
        Scanner in = new Scanner(System.in);
        int hores = in.nextInt();
        int total = 0;
        for (Dep treballador : arrDep) {
            if (treballador instanceof DepLab) {
                total = total + (hores * ((DepLab) treballador).getPpH());
            } else if (treballador instanceof DepAd) {
                total = total + ((DepAd) treballador).getSouMensual();
            }
        }
        System.out.println("");
        System.out.println("En total aquest mes pagarem un total de " + total + "€ en sous.");
        System.out.println("");
    }

    public static void carregaDades(Dep[] arrDep) {
        arrDep[0] = new DepLab("Paco", "1111BBB", "Esp1", 10);
        arrDep[1] = new DepAd("Victor", "2222CCC", "Cap", 1200);
        arrDep[2] = new DepLab("Manel", "111B1BB", "Esp2", 15);
        arrDep[3] = new DepAd("Lucas", "222C2CC", "Admin", 1000);
        arrDep[4] = new DepLab("Miquel", "750690H", "Programador", 60);
        arrDep[5] = new DepAd("Angel", "22452CCC", "Senior", 1100);

    }

    public static int pintaMenu() {
        int opcio;
        Scanner num = new Scanner(System.in);
        System.out.println("=============================================");
        System.out.println("");
        System.out.println("INDEX...");
        System.out.println("1. Sou Laboral");
        System.out.println("2. Sou Administratiu");
        System.out.println("3. Imprimir Dades TOTS");
        System.out.println("4. Imprimir Dades amb DNI");
        System.out.println("5. Calcular Sous totals");
        System.out.println("6. Mostrar informe treballador");
        System.out.println("7. Mostrar nom i classe");
        System.out.println("0. Sortir");
        System.out.println("Intro l'opció elegida");
        System.out.println("");
        System.out.println("=============================================");

        return num.nextInt();
    }

    public static void SouLab(Dep[] arrDep) {
        Scanner in = new Scanner(System.in);
        System.out.println("Intro hores treballades: ");
        int hores = in.nextInt();
        for (Dep treballador : arrDep) {
            if (treballador instanceof DepLab) {
                ((DepLab) treballador).souLaboral(hores);
            }
        }
    }

    public static void SouAd(Dep[] arrDep) {
        for (Dep treballador : arrDep) {
            if (treballador instanceof DepAd) {
                ((DepAd) treballador).souAdministratiu();
            }
        }
    }

    public static void ImprimeixDades(Dep[] arrDep) {
        for (Dep treballador : arrDep) {
            System.out.println("");
            System.out.println("NOM: " + treballador.getNom());
            System.out.println("DNI: " + treballador.getDNI());
            System.out.println("");
        }
    }

    public static void ImprimeixDadesSol(Dep[] arrDep) {
        Scanner in = new Scanner(System.in);
        System.out.println("");
        System.out.println("Intro DNI a buscar: ");
        System.out.println("");
        String DNI = in.nextLine();
        for (Dep treballador : arrDep) {
            if (treballador.getDNI().equals(DNI)) {
                System.out.println("");
                System.out.println("NOM: " + treballador.getNom());
                System.out.println("DNI: " + treballador.getDNI());
                if (treballador instanceof DepLab) {
                    System.out.println("Especialitat: " + ((DepLab) treballador).getEspecialitat());
                    System.out.println("Preu per Hora: " + ((DepLab) treballador).getPpH());
                } else if (treballador instanceof DepAd) {
                    System.out.println("Carrec: " + ((DepAd) treballador).getCarrec());
                    System.out.println("Sou Mensual: " + ((DepAd) treballador).getSouMensual());
                }
            }
        }
    }
}

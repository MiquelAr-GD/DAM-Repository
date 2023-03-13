/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objectos;

import java.util.Scanner;

public class Class_6_provaMain {

    public static void main(String[] args) {

        int valor;
        float preu;
        Class_6_prova objecte1, objecte2, objecte3;

        objecte1 = new Class_6_prova();
        objecte1.setNombre("Juan");
        System.out.println(objecte1.getNombre());
        objecte1.setMatricula(25);
        valor = objecte1.getMatricula();
        System.out.println(valor);
        objecte1.setGrupo('A');
        System.out.println(objecte1.getGrupo());
        objecte1.setGrado(3);
        System.out.println(objecte1.getGrado());

        objecte2 = new Class_6_prova("Maria", 345, 'B', 2);
        System.out.println(objecte2.getNombre());
        valor = objecte2.getMatricula();
        System.out.println(valor);
        System.out.println(objecte2.getGrupo());
        System.out.println(objecte2.getGrado());

        Scanner in = new Scanner(System.in);
        Scanner in2 = new Scanner(System.in);

        System.out.println("Intro nom");
        String nom = in.nextLine();
        System.out.println("Intro matrícula");
        int matricula = in2.nextInt();
        System.out.println("Intro grup");
        char grup = in.nextLine().charAt(0);
        System.out.println("Intro grau");
        int grau = in.nextInt();

        objecte3 = new Class_6_prova(nom, matricula, grup, grau);

        Class_6_prova[] vector = new Class_6_prova[3];

        vector[0] = objecte1;
        vector[1] = objecte2;
        vector[2] = objecte3;

        for (int i = 0; i < vector.length; i++) {
            System.out.println(vector[i].getNombre());
            System.out.println(vector[i].getMatricula());
        }
        
        
        objecte1.setNombre("Juanico");
        
        for (int i = 0; i < vector.length; i++) {
            System.out.println(vector[i].getNombre());
            System.out.println(vector[i].getMatricula());
        }        

    }

}

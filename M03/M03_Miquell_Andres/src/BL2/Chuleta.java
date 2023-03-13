/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BL2;

/**
 *
 * @author MiquelA
 */
public class Chuleta {

    public static void main(String[] args) {
        int x = 1, desde = 0, hasta = 1, suma = 0;
        String subnom;
        // Definir cadena
        String nom;
        //Donar valor a la cadena
        nom = "El sonido3 del m4r";
        // Calcular la longitud de la cadena
        System.out.println(nom.length());
        //Saber quin caracter esta en la posisio "X"
        System.out.println(nom.charAt(0));
        //Partir la cadena en trocitos
        subnom = nom.substring(desde, hasta);
        //Buscar algo en concret dins de la cadena
        for (int i = 0; i < 10; i++) {
            if (nom.charAt(i) == ' ') {

            }
        }
        //Sacar los numeros de una cadena y sumarlos
        for (int i = 0; i < nom.length() - 1; i++) {
            if ((nom.charAt(i) == '0') || (nom.charAt(i) == '1') || (nom.charAt(i) == '2') || (nom.charAt(i) == '3') || (nom.charAt(i) == '4') || (nom.charAt(i) == '5') || (nom.charAt(i) == '6') || (nom.charAt(i) == '7') || (nom.charAt(i) == '8') || (nom.charAt(i) == '9')) {
                subnom = nom.substring(i, (i + 1));
                x = Integer.parseInt(subnom);
                suma = suma + x;
                //Es importante primero operar los numeros y luego sacarlos porque si no, no podremos hacer la suma porque ya los habremos quitado
                nom = nom.substring(0, i) + nom.substring(i + 1);
            }
        }
        System.out.println(nom);
        System.out.println(suma);
        //Pasar a mayuscula
        System.out.println(nom.toUpperCase());
        //Pasar a minuscula
        System.out.println(nom.toLowerCase());
        //Para comparar 2 cadenas
        if (nom.equals(subnom)) {

        }
        //Para comparar 2 cadenas sin tener en cuenta mayusculas o minusculas
        if (nom.equalsIgnoreCase(subnom)) {

        }
        //Para buscar una cadena dentro de otra
        System.out.println(nom.indexOf(subnom));
        //Retorna -1 si la cadena "nom" no contiene la cadena "subnom", en caso que se encuentre dentro devuelve la posición donde se encuentra ( la posicion subnom comienza detnro de nom)
        //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        //Exercicis 
        //1Fes un programa en el cual introdueixes el teu nom i mostri per pantalla “Hola” seguit del vostre nom. Que indiqui la seva longitud i quina lletra ocupa 
        //la posició 3. A continuació recull un altre nom i comprova que siguin o no iguals. Indica si són o no són iguals. Finalment passa el primer a majúscules i el 
        //segon a minúscules.

        //2Programa que llegeixi una frase per teclat i digui quantes vegades hi apareix la vocal “a”.
        //3Un programa que llegeixi una frase per teclat (amb numeros) en tregui els numeros, els sumi, i els torni a posar al final de la cadena
        //4Un programa que llegeixi una frase per teclate ( nomes de numeros) i els pasi a lletres, es a dir, que si la cadena onte un 0 ho transformi
        //a "a", i aixi amb totes les lletres del abecedari
    }
}

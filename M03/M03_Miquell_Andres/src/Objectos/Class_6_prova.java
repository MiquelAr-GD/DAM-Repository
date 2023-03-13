/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Objectos;


    public class Class_6_prova {
        
        // Atributs
        private String nombre;
        private int matricula;
        private char grupo;
        private int grado;
        
        // Constructors
        
        public Class_6_prova(){
            this.nombre = "";
            this.matricula = 0;
            this.grupo = ' ';
            this.grado = 0;
            
        }
        
        public Class_6_prova(String nom, int mat, char grup, int grad){
            this.nombre = nom;
            this.matricula = mat;
            this.grupo = grup;
            this.grado = grad;
        }
        
        // Setters i Getters

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        if (nombre.equals("Juan")){
            System.out.println("Esto es un error");
        }
        this.nombre = nombre;
    }

    /**
     * @return the matricula
     */
    public int getMatricula() {
        return matricula;
    }

    /**
     * @param matricula the matricula to set
     */
    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    /**
     * @return the grupo
     */
    public char getGrupo() {
        return grupo;
    }

    /**
     * @param grupo the grupo to set
     */
    public void setGrupo(char grupo) {
        this.grupo = grupo;
    }

    /**
     * @return the grado
     */
    public int getGrado() {
        return grado;
    }

    /**
     * @param grado the grado to set
     */
    public void setGrado(int grado) {
        this.grado = grado;
    }
        


}

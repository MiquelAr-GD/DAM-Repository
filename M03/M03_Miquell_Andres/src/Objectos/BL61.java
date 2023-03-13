/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Objectos;

/**
 *
 * @author MiquelA
 */
public class BL61 {
    
    private String director;
    private String type;
    private String title;
    
    public BL61(){
            this.director = "";
            this.type = "";
            this.title = "";
            
        }
        
        public BL61(String dir, String ty, String ti){
            this.director = dir;
            this.type = ty;
            this.title = ti;
        }
        
    public String getDirector() {
        return director;
    }
    public void setDirector(String director) {
        this.director = director;
    }
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }    
}

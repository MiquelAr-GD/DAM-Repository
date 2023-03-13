package Polimorfisme.Polimorfismo;
// https://jarroba.com/polimorfismo-en-java-parte-i-con-ejemplos/


public class Entrenador extends SeleccionFutbol {
    
	private int idFederacion;

	public Entrenador() {
		super();
	}

	public Entrenador(int id, String nombre, String apellidos, int edad, int idFederacion) {
		super(id, nombre, apellidos, edad);
		this.setIdFederacion(idFederacion);
	}

	public int getIdFederacion() {
		return idFederacion;
	}

	public void setIdFederacion(int idFederacion) {
		this.idFederacion = idFederacion;
	}
	
	public void entrenamiento() {
		System.out.println("Dirige un entrenamiento (Clase Entrenador)");
	}

	public void partidoFutbol() {
		System.out.println("Dirige un Partido (Clase Entrenador)");
	}

	public void planificarEntrenamiento() {
		System.out.println("Planificar un Entrenamiento");
	}

    @Override
    public void jugarPartido() {
        System.out.println("Dirige el partido ->");
    }

}
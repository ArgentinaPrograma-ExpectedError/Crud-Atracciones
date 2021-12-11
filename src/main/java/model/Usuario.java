package model;

import java.util.ArrayList;

public class Usuario {

	/* Atributos de la clase Usuario. */
	private Integer id;
	private String nombre;
	private String apellido;
	private String tipoPreferido;
	private int dineroDisponible;
	private double tiempoDisponible;
	private ArrayList<Attraction> atraccionesCompradas;
	private int dineroInicial;
	private double tiempoInicial;

	/* Constructor de un Usuario simple. */
	public Usuario(Integer id, String nombre, String apellido, String tipoPreferido, int dineroDisponible,
			double tiempoDisponible) {
		this.id = id;
		this.nombre = nombre;
		this.apellido = apellido;
		this.tipoPreferido = tipoPreferido;
		this.dineroDisponible = dineroDisponible;
		this.tiempoDisponible = tiempoDisponible;
		this.atraccionesCompradas = new ArrayList<Attraction>();
		this.dineroInicial = dineroDisponible;
		this.tiempoInicial = tiempoDisponible;
	}

	public Usuario(String nombre, String apellido, String tipoPreferido, int dineroDisponible,
			double tiempoDisponible) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.tipoPreferido = tipoPreferido;
		this.dineroDisponible = dineroDisponible;
		this.tiempoDisponible = tiempoDisponible;
		this.atraccionesCompradas = new ArrayList<Attraction>();
		this.dineroInicial = dineroDisponible;
		this.tiempoInicial = tiempoDisponible;
	}

	/* Devuelve el nombre del Usuario. */
	public String getNombre() {
		return nombre;
	}

	/* Devuelve el tipo de atraccion preferido del Usuario. */
	public String getTipoPreferido() {
		return tipoPreferido;
	}

	/* Devuelve el dinero del que dispone el Usuario para comprar. */
	public int getDineroDisponible() {
		return dineroDisponible;
	}

	/* Devuele el tiempo del que dispone el Usuario para comprar. */
	public double getTiempoDisponible() {
		return tiempoDisponible;
	}

	public String getApellido() {
		return apellido;
	}

	public void borrarListaDeAtraccionesCompradas() {
		this.atraccionesCompradas = new ArrayList<Attraction>();
	}

	public Integer getId() {
		return id;
	}

	/* Devuelve un ArrayList con las Atraccion compradas por el usuario. */
	public ArrayList<Attraction> getAtraccionesCompradas() {
		return atraccionesCompradas;
	}

	/*
	 * Resta el tiempo de la Sugerencia, pasada por par�metro, al tiempo del
	 * Usuario.
	 */
	public void restarTiempo(Suggestion sugerencia) {
		this.tiempoDisponible -= sugerencia.getDuration();
	}

	/*
	 * Resta el costo de la Sugerencia, pasada por par�metro, al dinero del Usuario.
	 */
	public void restarDinero(Suggestion sugerencia) {
		this.dineroDisponible -= sugerencia.getCost();
	}

	/*
	 * Por cada una de las Atraccion incluidas en la Sugerencia pasada por
	 * par�metro, agrega al ArrayList de atracciones compradas las Atraccion que
	 * forman parte de la Sugerencia y cada una de esas Atraccion disminuye su cupo.
	 * A su vez, a trav�s del m�todo comprar el Usuario resta de su tiempo
	 * disponible el Usuario disminuye su tiempo y dinero disponibles en funci�n de
	 * la Sugerencia pasada por par�metro.
	 */
	public void comprar(Suggestion oferta) {
		for (Attraction atraccion : oferta.getAttractions()) {
			this.atraccionesCompradas.add(atraccion);
			atraccion.host(1);;
		}
		this.restarTiempo(oferta);
		this.restarDinero(oferta);
	}

	public int getDineroGastado() {
		return this.dineroInicial - this.dineroDisponible;
	}

	public double getTiempoGastado() {
		return this.tiempoInicial - this.tiempoDisponible;
	}

	/* Devuelve los datos del Usuario en formato String. */
	public String getDatos() {
		return "Nombre: " + nombre + " " + apellido + "\nTipo preferido: " + tipoPreferido + "\nDinero disponible: "
				+ dineroDisponible + " monedas de oro\nTiempo disponible: " + tiempoDisponible + " horas";
	}
}

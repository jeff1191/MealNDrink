package es.fdi.iw.model;

import es.fdi.iw.model.utils.Fecha;

public class Oferta {
	
	private int ID;
	private String nombre;
	private String foto;
	private Fecha fechaLimite;
	private int capacidadTotal;
	private int capacidadActual;
	
	
	public Oferta(String nombre, String foto, Fecha fechaLimite,int capacidadTotal, int capacidadActual){
		this.nombre=nombre;
		this.foto=foto;
		this.fechaLimite=fechaLimite;
		this.capacidadActual=capacidadActual;
		this.capacidadTotal=capacidadActual;
	}
	
	
	
	public int getCapacidadACtual() {
		return capacidadActual;
	}
	public void setCapacidadACtual(int capacidadACtual) {
		this.capacidadActual = capacidadACtual;
	}
	public Fecha getFechaLimite() {
		return fechaLimite;
	}
	public void setFechaLimite(Fecha fechaLimite) {
		this.fechaLimite = fechaLimite;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getCapacidadTotal() {
		return capacidadTotal;
	}
	public void setCapacidadTotal(int capacidadTotal) {
		this.capacidadTotal = capacidadTotal;
	}

}

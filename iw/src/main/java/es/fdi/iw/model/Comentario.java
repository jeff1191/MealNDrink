package es.fdi.iw.model;

import es.fdi.iw.model.utils.Fecha;

public class Comentario {

	private int ID;
	private String texto;
	private Fecha fecha;
	
	public Comentario(String texto, Fecha fecha){
		this.texto=texto;
		this.fecha=fecha;
		//generar ID?
	}
	
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public Fecha getFecha() {
		return fecha;
	}
	public void setFecha(Fecha fecha) {
		this.fecha = fecha;
	}
	
}

package es.fdi.iw.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Comentario {

	private long ID;
	private String texto;
	private Timestamp fecha;
	private Local comercio;
	private Usuario cliente;
	
	public Comentario(String texto, Timestamp fecha,Local comercio,Usuario cliente){
		this.texto=texto;
		this.fecha=fecha;
		this.comercio=comercio;
		this.cliente=cliente;
	}
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public Timestamp getFecha() {
		return fecha;
	}
	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}
	
	@ManyToOne(targetEntity=Local.class)
	public Local getComercio() {
		return comercio;
	}
	public void setComercio(Local comercio) {
		this.comercio = comercio;
	}
	@ManyToOne(targetEntity=Usuario.class)
	public Usuario getCliente() {
		return cliente;
	}
	public void setCliente(Usuario cliente) {
		this.cliente = cliente;
	}


	
}

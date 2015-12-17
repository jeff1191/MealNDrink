package es.fdi.iw.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Reserva {

	private long ID;
	private String codigoQr; // Cuando nos pongamos con el tema de validar habra q ponerse un campo bool aqui a no ser q veamos una mejor manera
	private Usuario cliente;
	private Oferta oferta;
	private int numPersonas;
	private Timestamp fechaReserva;
	
	public Reserva(String codigoQr,Usuario cliente, Oferta oferta, int numeroPersonas, Timestamp fechaReserva){
		this.codigoQr=codigoQr;
		this.setUsuario(cliente);
		this.setOferta(oferta);
		this.numPersonas=numeroPersonas;
		this.fechaReserva=fechaReserva;
	}
	
	public Reserva() {
		
	}
	
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}
	public Timestamp getfechaReserva() {
		return fechaReserva;
	}
	public void setfechaReserva(Timestamp fechaReserva) {
		this.fechaReserva = fechaReserva;
	}
	public String getCodigoQr() {
		return codigoQr;
	}
	public void setCodigoQr(String codigoQr) {
		this.codigoQr = codigoQr;
	}
	@ManyToOne(targetEntity=Usuario.class)
	public Usuario getUsuario() {
		return cliente;
	}
	public void setUsuario(Usuario cliente) {
		this.cliente = cliente;
	}
	@ManyToOne(targetEntity=Oferta.class)
	public Oferta getOferta() {
		return oferta;
	}
	public void setOferta(Oferta oferta) {
		this.oferta = oferta;
	}
	public int getNumPersonas() {
		return numPersonas;
	}
	public void setNumPersonas(int numPersonas) {
		this.numPersonas = numPersonas;
	}
}

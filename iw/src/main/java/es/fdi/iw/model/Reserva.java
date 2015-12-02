package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Reserva {

	private long ID;
	private String codigoQr;
	private Usuario cliente;
	private Oferta oferta;
	private int numPersonas;
	
	public Reserva(String codigoQr,Usuario cliente, Oferta oferta, int numeroPersonas){
		this.codigoQr=codigoQr;
		this.setCliente(cliente);
		this.setOferta(oferta);
		this.numPersonas=numeroPersonas;
	}
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}
	public String getCodigoQr() {
		return codigoQr;
	}
	public void setCodigoQr(String codigoQr) {
		this.codigoQr = codigoQr;
	}
	@ManyToOne(targetEntity=Usuario.class)
	public Usuario getCliente() {
		return cliente;
	}
	public void setCliente(Usuario cliente) {
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

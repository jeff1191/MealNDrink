package es.fdi.iw.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;


@Entity
@NamedQueries({
	@NamedQuery(name="infoBooks", 
		query="select o from Reserva o where o.id in (:idParam)"),
	@NamedQuery(name="lastBooks", 
		query="select o from Reserva o where o.fechaReserva >= (:inicioBusq) and o.fechaReserva <= (:finBusq)")
})

public class Reserva {

	private long ID;
	private String codigoQr;
	private Usuario cliente;
	private Oferta oferta;
	private int numPersonas;
	private Timestamp fechaReserva;
	private boolean validado;
	
	public Reserva(String codigoQr,Usuario cliente, Oferta oferta, int numeroPersonas, Timestamp fechaReserva){
		this.codigoQr=codigoQr;
		this.setUsuario(cliente);
		this.setOferta(oferta);
		this.numPersonas=numeroPersonas;
		this.fechaReserva=fechaReserva;
		this.setValidado(false);
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

	public boolean isValidado() {
		return validado;
	}

	public void setValidado(boolean validado) {
		this.validado = validado;
	}
}

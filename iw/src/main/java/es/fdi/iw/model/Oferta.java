package es.fdi.iw.model;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import es.fdi.iw.model.utils.Fecha;

@Entity
public class Oferta {
	
	private long ID;
	private String nombre;
	private String foto;
	private Fecha fechaLimite;
	private int capacidadTotal;
	private int capacidadActual;
	private Collection<Reserva> reservas;
	private Local comercio; //una oferta es puesta por un Local
	
	
	public Oferta(String nombre, String foto, Fecha fechaLimite,int capacidadTotal, int capacidadActual, Local comercio){
		this.nombre=nombre;
		this.foto=foto;
		this.fechaLimite=fechaLimite;
		this.capacidadActual=capacidadActual;
		this.capacidadTotal=capacidadActual;
		this.comercio=comercio;
	}
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
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
	@OneToMany(targetEntity=Reserva.class)
	@JoinColumn(name="oferta")
	public Collection<Reserva> getReservas() {
		return reservas;
	}
	public void setReservas(Collection<Reserva> reservas) {
		this.reservas = reservas;
	}
	@ManyToOne(targetEntity=Local.class)
	public Local getComercio() {
		return comercio;
	}
	public void setComercio(Local comercio) {
		this.comercio = comercio;
	}

}

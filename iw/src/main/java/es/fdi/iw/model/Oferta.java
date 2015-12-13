package es.fdi.iw.model;

import java.sql.Timestamp;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity
public class Oferta {
	
	private long ID;
	private String nombre;
	private String foto;
	private Timestamp fechaLimite;
	private int capacidadTotal;
	private int capacidadActual;
	private Collection<Reserva> reservas;
	private Local comercio; //una oferta es puesta por un Local
	
	
	public Oferta() {
		
	}
	public Oferta(String nombre, String foto, Timestamp fechaLimite,int capacidadTotal, Local comercio){
		this.nombre=nombre;
		this.foto=foto;
		this.fechaLimite=fechaLimite;
		this.capacidadActual=0;
		this.capacidadTotal=capacidadTotal;
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
	
	
	public int getCapacidadActual() {
		return capacidadActual;
	}
	public void setCapacidadActual(int capacidadActual) {
		this.capacidadActual = capacidadActual;
	}
	public Timestamp getFechaLimite() {
		return fechaLimite;
	}
	public void setFechaLimite(Timestamp fechaLimite) {
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
	public Local getLocal() {
		return comercio;
	}
	public void setLocal(Local comercio) {
		this.comercio = comercio;
	}

}

package es.fdi.iw.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;


@Entity
@NamedQuery(name="allOffers", query="select o from Oferta o")
/*
@NamedQueries({
	@NamedQuery(name="allOffers", query="select o from Oferta o"),
	@NamedQuery(name="offersByTag", query="select o from Oferta o where o.tags.name=:id.name")
})
*/
public class Oferta {
	
	private long ID;
	private String nombre;
	private String foto;
	private Timestamp fechaLimite;
	private int capacidadTotal;
	private int capacidadActual;
	private Collection<Reserva> reservas;
	private Local comercio; //una oferta es puesta por un Local
	private String[] tags;
	
	
	public Oferta() {
		
	}
	public Oferta(String nombre, String foto, Timestamp fechaLimite,int capacidadTotal, 
			Local comercio, String ... tags){
		this.nombre=nombre;
		this.foto=foto;
		this.fechaLimite=fechaLimite;
		this.capacidadActual=0;
		this.capacidadTotal=capacidadTotal;
		this.comercio=comercio;
		this.tags = tags;
	}
	
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}
	
	public String getTags() {
		return Arrays.toString(tags).replaceAll("[\\[\\], ]+", " ").trim();
	}

	public void setTags(String[] tags) {
		this.tags = tags;
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

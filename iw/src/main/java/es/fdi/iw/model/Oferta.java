package es.fdi.iw.model;


import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;


@Entity
@NamedQueries({
	@NamedQuery(name="allOffers", 
			query="select o from Oferta o"),
	@NamedQuery(name="infoOffers", 
			query="select o from Oferta o where o.id in (:idParam)"),	
	@NamedQuery(name="monthlySpecials", 
			query="select o from Oferta o where o.capacidadActual >= o.capacidadTotal/2")
})

public class Oferta {
	
	private long ID;
	private String nombre;
	private String descripcion;
	private Timestamp fechaLimite;
	private int capacidadTotal;
	private int capacidadActual;
	private List<Reserva> reservas;
	private Local local; //una oferta es puesta por un Local
	private List<Tags> tags;
	
	
	public Oferta() {
		capacidadActual=0;
	}

	public String tagsToShow() { 		
 		return ponTagsSeparados(dameTagsSeparados());
 	}
 
 	public String[] dameTagsSeparados() {
 		String[] aux = new String[tags.size()];
 		for(int i = 0; i < tags.size(); i++){
 			aux[i] = tags.get(i).getTexto(); 			
 		} 		
 		return aux;
 	}
 	
 	public String ponTagsSeparados(String[] ts) {		
 		StringBuilder sb = new StringBuilder();		
 		for(String t : ts){
 			sb.append(t.trim()).append(" ");
 		}
 		if (sb.length()>0) {
 			sb.setLength(sb.length()-1);
 		}
 		return sb.toString();
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
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getCapacidadTotal() {
		return capacidadTotal;
	}
	public void setCapacidadTotal(int capacidadTotal) {
		this.capacidadTotal = capacidadTotal;
	}
	
	@OneToMany(targetEntity=Reserva.class, cascade = CascadeType.ALL)
	@JoinColumn(name="oferta")
	public List<Reserva> getReservas() {
		return reservas;
	}
	public void setReservas(List<Reserva> reservas) {
		this.reservas = reservas;
	}
	@ManyToOne(targetEntity=Local.class)
	public Local getLocal() {
		return local;
	}
	public void setLocal(Local comercio) {
		this.local = comercio;
	}
	@ManyToMany(targetEntity=Tags.class)
	@JoinColumn(name="oferta")
	public List<Tags> getTags() {
		return tags;
	}
	public void setTags(List<Tags> tags) {
		this.tags = tags;
	} 
	
}

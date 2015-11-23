package es.fdi.iw.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Local {
	private long ID;
	private long puntuacion;
	private String ubicacion;
	private ArrayList<String> tags;
	private String direccion;
	private String horario;
	private Collection<Oferta> ofertas;
	private Collection<Comentario> comentarios;
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}

	public ArrayList<String> getTags() {
		return tags;
	}

	public void setTags(ArrayList<String> tags) {
		this.tags = tags;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public long getPuntuacion() {
		return puntuacion;
	}

	public void setPuntuacion(long puntuacion) {
		this.puntuacion = puntuacion;
	}

	public String getUbicacion() {
		return ubicacion;
	}

	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
	@OneToMany(targetEntity=Oferta.class)
	public Collection<Oferta> getOfertas() {
		return ofertas;
	}

	public void setOfertas(Collection<Oferta> ofertas) {
		this.ofertas = ofertas;
	}
	@OneToMany(targetEntity=Comentario.class)
	public Collection<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(Collection<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
}

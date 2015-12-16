package es.fdi.iw.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	private Usuario usuario;
	private String nombre;
	private String foto;
	
	public Local(String nombre, String foto, String ubicacion, 
			String direccion, String horario, Usuario usuario, ArrayList<String> tags) {
		
		this.puntuacion = 5;
		this.ubicacion = ubicacion;
		this.tags = tags;
		this.direccion = direccion;
		this.horario = horario;
		this.usuario = usuario;
		this.nombre = nombre;
		this.foto = foto;
		this.ofertas= new ArrayList<Oferta>();
		this.comentarios= new ArrayList<Comentario>();
	}
	
	public Local() {
		
	}
	
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}

	public ArrayList<String>  getTags() {
		//return Arrays.toString(tags).replaceAll("[\\[\\], ]+", " ").trim();
		return this.tags;
	}

	public void setTags(ArrayList<String>  tags) {
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

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	public String getUbicacion() {
		return ubicacion;
	}

	public void setUbicacion(String ubicacion) {
		this.ubicacion = ubicacion;
	}
	@OneToMany(targetEntity=Oferta.class)
	@JoinColumn(name="local")
	public Collection<Oferta> getOfertas() {
		return ofertas;
	}

	public void setOfertas(Collection<Oferta> ofertas) {
		this.ofertas = ofertas;
	}
	@OneToMany(targetEntity=Comentario.class)
	@JoinColumn(name="local")
	public Collection<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(Collection<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	@ManyToOne(targetEntity=Usuario.class)
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}

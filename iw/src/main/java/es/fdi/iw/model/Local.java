package es.fdi.iw.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;



@Entity
@NamedQueries({
	@NamedQuery(name="allLocals", 
			query="select o from Local o"),
	@NamedQuery(name="infoLocals", 
			query="select o from Local o where o.id in (:idParam)"),
	@NamedQuery(name="dameNombreLocal", 
			query="select o.usuario from Local o where o.id = :idParam")
})
public class Local {
	
	private long ID;
	private long puntuacion;
	private String direccion;
	private String horario;
	private String email;
	private String telefono;
	private List<Oferta> ofertas;
	private List<Comentario> comentarios;
	private Usuario usuario;
	private String nombre;
	
	public Local() {
		this.puntuacion=5;
	}
	
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
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
	@OneToMany(targetEntity=Oferta.class, cascade=CascadeType.ALL)
	@JoinColumn(name="local")
	public List<Oferta> getOfertas() {
		return ofertas;
	}

	public void setOfertas(List<Oferta> ofertas) {
		this.ofertas = ofertas;
	}
	@OneToMany(targetEntity=Comentario.class, cascade = CascadeType.ALL)
	@JoinColumn(name="local")
	public List<Comentario> getComentarios() {
		return comentarios;
	}

	public void setComentarios(List<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	
	@ManyToOne(targetEntity=Usuario.class)
	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

}

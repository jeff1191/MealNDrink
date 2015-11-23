package es.fdi.iw.model;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Usuario {
	
	private long ID;
	private String nombre;
	private String foto;
	private String email;
	private String telefono;
	private String rol;
	private Collection<Comentario> comentarios;
	private Collection<Reserva> reservas;
	private Collection<Local> locales; // un usuario puede tener muchos locales
	
	
	public Usuario(String nombre, String foto, String email, String telefono, String rol){
		this.nombre=nombre;
		this.foto=foto;
		this.email=email;
		this.telefono=telefono;
		this.rol=rol;
	}
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}
	public String getRol() {
		return rol;
	}
	public void setRol(String rol) {
		this.rol = rol;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	@OneToMany(targetEntity=Comentario.class)
	public Collection<Comentario> getComentarios() {
		return comentarios;
	}
	public void setComentarios(Collection<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	@OneToMany(targetEntity=Reserva.class)
	public Collection<Reserva> getReservas() {
		return reservas;
	}
	public void setReservas(Collection<Reserva> reservas) {
		this.reservas = reservas;
	}
	@OneToMany(targetEntity=Local.class)
	public Collection<Local> getLocales() {
		return locales;
	}
	public void setLocales(Collection<Local> locales) {
		this.locales = locales;
	} 

}

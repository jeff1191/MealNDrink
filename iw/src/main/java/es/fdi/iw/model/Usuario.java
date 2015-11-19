package es.fdi.iw.model;

public class Usuario {
	
	private int ID;
	private String nombre;
	private String foto;
	private String email;
	private String telefono;
	private String rol;
	
	public Usuario(String nombre, String foto, String email, String telefono, String rol){
		this.nombre=nombre;
		this.foto=foto;
		this.email=email;
		this.telefono=telefono;
		this.rol=rol;
		//generar id?
		
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

}

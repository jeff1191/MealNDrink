package es.fdi.iw.model;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Entity
@NamedQuery(name="dameUsuarioLogin", query="SELECT usu FROM Usuario usu WHERE usu.nombre = nombre")
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
	private static BCryptPasswordEncoder bcryptEncoder = new BCryptPasswordEncoder();
	private String hashedAndSalted;
	

	public Usuario() {
		
	}
	public Usuario(String nombre, String foto, String email, String telefono, String rol, String pass){
		this.nombre=nombre;
		this.foto=foto;
		this.email=email;
		this.telefono=telefono;
		this.rol=rol;
		this.hashedAndSalted = generateHashedAndSalted(pass);
	}
	
	public boolean isPassValid(String pass) {
		return bcryptEncoder.matches(pass, hashedAndSalted);		
	}
	
	/**
	 * Generate a hashed&salted hex-string from a user's pass and salt
	 * @param pass to use; no length-limit!
	 * @param salt to use
	 * @return a string to store in the BD that does not reveal the password even
	 * if the DB is compromised. Note that brute-force is possible, but it will
	 * have to be targeted (ie.: use the same salt)
	 */
	public static String generateHashedAndSalted(String pass) {
		return bcryptEncoder.encode(pass);
	}	
	
	/**
	 * Converts a byte array to a hex string
	 * @param b converts a byte array to a hex string; nice for storing
	 * @return the corresponding hex string
	 */
	public static String byteArrayToHexString(byte[] b) {
		StringBuilder sb = new StringBuilder();
		for (int i=0; i<b.length; i++) {
			sb.append(Integer.toString((b[i]&0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}
	
	/**
	 * Converts a hex string to a byte array
	 * @param hex string to convert
	 * @return equivalent byte array
	 */
	public static byte[] hexStringToByteArray(String hex) {
		byte[] r = new byte[hex.length()/2];
		for (int i=0; i<r.length; i++) {
			String h = hex.substring(i*2, (i+1)*2);
			r[i] = (byte)Integer.parseInt(h, 16);
		}
		return r;
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
	public String getHashedAndSalted() {
		return hashedAndSalted;
	}
	public void setHashedAndSalted(String hashedAndSalted) {
		this.hashedAndSalted = hashedAndSalted;
	}
	@OneToMany(targetEntity=Comentario.class)
	@JoinColumn(name="usuario")
	public Collection<Comentario> getComentarios() {
		return comentarios;
	}
	public void setComentarios(Collection<Comentario> comentarios) {
		this.comentarios = comentarios;
	}
	@OneToMany(targetEntity=Reserva.class)
	@JoinColumn(name="usuario")
	public Collection<Reserva> getReservas() {
		return reservas;
	}
	public void setReservas(Collection<Reserva> reservas) {
		this.reservas = reservas;
	}
	@OneToMany(targetEntity=Local.class)
	@JoinColumn(name="usuario")
	public Collection<Local> getLocales() {
		return locales;
	}
	public void setLocales(Collection<Local> locales) {
		this.locales = locales;
	} 

}

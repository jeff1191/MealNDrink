package es.fdi.iw.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

@Entity	
@NamedQuery(name="allTags", 
			query="select o from Tags o")

public class Tags {

	private long ID;
	private String texto;
		
	public Tags(String texto){
		this.texto=texto;		
	}
	
	public Tags(){
		
	}
	
	@Id
	@GeneratedValue
	public long getID() {
		return ID;
	}

	public void setID(long iD) {
		ID = iD;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	
}

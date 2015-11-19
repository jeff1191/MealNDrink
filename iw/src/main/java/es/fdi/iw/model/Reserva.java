package es.fdi.iw.model;

public class Reserva {

	private int ID;
	private String codigoQr;
	
	public Reserva(String codigoQr){
		this.codigoQr=codigoQr;
		//generar ID?
	}
	
	public String getCodigoQr() {
		return codigoQr;
	}
	public void setCodigoQr(String codigoQr) {
		this.codigoQr = codigoQr;
	}
}

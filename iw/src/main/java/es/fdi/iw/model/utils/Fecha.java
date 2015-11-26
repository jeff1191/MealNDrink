package es.fdi.iw.model.utils;

public class Fecha {

		private int dia;
		private int mes;
		private int anyo;
		
		public Fecha(int dia, int mes, int anyo){
			this.dia=dia;
			this.mes=mes;
			this.anyo=anyo;			
		}
		
		public int getAnyo() {
			return anyo;
		}
		public void setAnyo(int anyo) {
			this.anyo = anyo;
		}
		public int getMes() {
			return mes;
		}
		public void setMes(int mes) {
			this.mes = mes;
		}
		public int getDia() {
			return dia;
		}
		public void setDia(int dia) {
			this.dia = dia;
		}
		
		
		
		
}

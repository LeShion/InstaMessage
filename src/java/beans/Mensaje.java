
package beans;

public class Mensaje {
	private Integer id;
	private String remite;
	private String destino;
	private String texto;
	private String fecha;
	
	public Mensaje(){
		
	}
    public Mensaje(Integer id,String remite,String destino,String texto,String fecha){
    	this.id = id;
    	this.remite = remite;
    	this.destino = destino;
    	this.texto = texto;
    	this.fecha = fecha;
    	
    }
    public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRemite() {
		return remite;
	}
	public void setRemite(String remite) {
		this.remite = remite;
	}
	public String getDestino() {
		return destino;
	}
	public void setDestino(String destino) {
		this.destino = destino;
	}
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

}

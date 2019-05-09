package beans;

import java.text.DateFormat;

public class Email {
    protected int id;
    protected String fecha;
    protected String remitente;
    protected String destinatario;
    protected String asunto;
    protected String mensaje;
    protected int estado;

    public Email(int id, String fecha, String remitente, String destinatario, String asunto, String mensaje, int estado) {
        this.id = id;
        this.fecha = fecha;
        this.remitente = remitente;
        this.destinatario = destinatario;
        this.asunto = asunto;
        this.mensaje = mensaje;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getRemitente() {
        return remitente;
    }

    public void setRemitente(String remitente) {
        this.remitente = remitente;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    

}

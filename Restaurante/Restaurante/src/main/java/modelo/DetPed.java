package modelo;

public class DetPed {
    private String coddtp;
    private String codcda;
    private String nomcda;
    private String nomcat;
    private int cant;
    private double pre;
            
    public double total(){
        return cant*pre;
    }   
    
    public String getCoddtp() {
        return coddtp;
    }

    public void setCoddtp(String coddtp) {
        this.coddtp = coddtp;
    }

    public String getCodcda() {
        return codcda;
    }

    public void setCodcda(String codcda) {
        this.codcda = codcda;
    }

    public String getNomcda() {
        return nomcda;
    }

    public void setNomcda(String nomcda) {
        this.nomcda = nomcda;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public double getPre() {
        return pre;
    }

    public void setPre(double pre) {
        this.pre = pre;
    }

    public String getNomcat() {
        return nomcat;
    }

    public void setNomcat(String nomcat) {
        this.nomcat = nomcat;
    }
    
}

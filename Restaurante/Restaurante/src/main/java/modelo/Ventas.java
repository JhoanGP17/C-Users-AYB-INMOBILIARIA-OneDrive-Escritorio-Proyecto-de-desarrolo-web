package modelo;

public class Ventas {

    private int mes;
    private int year;
    private double monto;
    private int cxv;
    private int cxy;
    private String vendors;
    
    public String Lmes() {
        String vec[] = {"", "Ene", "Feb", "Mar", "Abr", "May", "Jun",
            "Jul", "Ago", "Set", "Oct", "Nov", "Dic"};
        return vec[mes];
    }
    /*public String Lvend() {
        String vec2[] = {"", "julia", "carol", "Juan", "Cusi", 
            "Mero", "pablito"};
        return vec2[vendors];
    }*/
    
    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getCxv() {
        return cxv;
    }

    public void setCxv(int cxv) {
        this.cxv = cxv;
    }

    public String getVendors() {
        return vendors;
    }

    public void setVendors(String vendors) {
        this.vendors = vendors;
    }

    public int getCxy() {
        return cxy;
    }

    public void setCxy(int cxy) {
        this.cxy = cxy;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

}

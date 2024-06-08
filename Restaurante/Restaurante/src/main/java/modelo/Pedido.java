package modelo;
import java.time.LocalDateTime;

public class Pedido {
    private String codigo;
    private String mesa;
    private String Cliente;
    private LocalDateTime fecha;
    private Double igv;
    private String Empleado;
    private String estado;
    private String comida;
    private int cantidad;
    private Double precio;
    //private Double total;
    
    // Método para establecer la fecha y hora actual como fecha de envío
    public void setFechaEnvioActual() {
        this.fecha = LocalDateTime.now();
    }   
    
    public String getCodigo() {
        return codigo;
    }
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }
    public String getMesa() {
        return mesa;
    }
    public void setMesa(String mesa) {
        this.mesa = mesa;
    }
    public String getCliente() {
        return Cliente;
    }
    public void setCliente(String Cliente) {
        this.Cliente = Cliente;
    }
    public LocalDateTime getFecha() {
        return fecha;
    }
    public void setFecha(LocalDateTime fecha) {
        this.fecha = fecha;
    }
    public Double getIgv() {
        return igv;
    }
    public void setIgv(Double igv) {
        this.igv = igv;
    }
    public String getEmpleado() {
        return Empleado;
    }
    public void setEmpleado(String Empleado) {
        this.Empleado = Empleado;
    }
    public String getEstado() {
        return estado;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
    /*public Double getTotal() {
        return total;
    }
    public void setTotal(Double total) {
        this.total = total;
    }*/       

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public String getComida() {
        return comida;
    }

    public void setComida(String comida) {
        this.comida = comida;
    }
}

package modelos;

public class MREJ_cls_respuesta {
    String opcion;
    int cantidad;

    public MREJ_cls_respuesta() {
    }

    public MREJ_cls_respuesta(String opcion, int cantidad) {
        this.opcion = opcion;
        this.cantidad = cantidad;
    }

    public String getOpcion() {
        return opcion;
    }

    public void setOpcion(String opcion) {
        this.opcion = opcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}

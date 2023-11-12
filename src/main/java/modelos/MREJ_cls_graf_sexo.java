package modelos;

public class MREJ_cls_graf_sexo {
    String sexo;
    int total;

    public MREJ_cls_graf_sexo() {
    }

    public MREJ_cls_graf_sexo(String sexo, int total) {
        this.sexo = sexo;
        this.total = total;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}


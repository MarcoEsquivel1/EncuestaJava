package modelos;


import java.util.List;

public class MREJ_cls_resultados {
    List <MREJ_cls_respuesta> res_sexo = new java.util.ArrayList<>();
    List <MREJ_cls_respuesta> res_dep = new java.util.ArrayList<>();
    List <MREJ_cls_respuesta> res_estudio = new java.util.ArrayList<>();
    List <MREJ_cls_respuesta> res_tema = new java.util.ArrayList<>();

    public MREJ_cls_resultados() {
    }

    public MREJ_cls_resultados(List<MREJ_cls_respuesta> res_sexo, List<MREJ_cls_respuesta> res_dep, List<MREJ_cls_respuesta> res_estudio, List<MREJ_cls_respuesta> res_tema) {
        this.res_sexo = res_sexo;
        this.res_dep = res_dep;
        this.res_estudio = res_estudio;
        this.res_tema = res_tema;
    }

    public List<MREJ_cls_respuesta> getRes_sexo() {
        return res_sexo;
    }

    public void setRes_sexo(List<MREJ_cls_respuesta> res_sexo) {
        this.res_sexo = res_sexo;
    }

    public List<MREJ_cls_respuesta> getRes_dep() {
        return res_dep;
    }

    public void setRes_dep(List<MREJ_cls_respuesta> res_dep) {
        this.res_dep = res_dep;
    }

    public List<MREJ_cls_respuesta> getRes_estudio() {
        return res_estudio;
    }

    public void setRes_estudio(List<MREJ_cls_respuesta> res_estudio) {
        this.res_estudio = res_estudio;
    }

    public List<MREJ_cls_respuesta> getRes_tema() {
        return res_tema;
    }

    public void setRes_tema(List<MREJ_cls_respuesta> res_tema) {
        this.res_tema = res_tema;
    }
}

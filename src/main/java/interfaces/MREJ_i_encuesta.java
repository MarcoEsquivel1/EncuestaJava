package interfaces;

import modelos.MREJ_cls_encuesta;
import modelos.MREJ_cls_respuesta;
import modelos.MREJ_cls_resultados;

import java.sql.Date;
import java.util.List;

public interface MREJ_i_encuesta {
    public boolean agregar(modelos.MREJ_cls_encuesta encuesta);
    public List all_encuestas();
    public List all_encuestas(String date);
    public List all_encuestas_name(String name);
    public MREJ_cls_encuesta encuesta(int id);
    public boolean eliminar(int id);
    public List res_sexo();
    public List res_dep();
    public List res_estudio();
    public List res_tema();
    public List grafico();
}

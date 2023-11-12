package interfaces;

import modelos.MREJ_cls_encuesta;
import modelos.MREJ_cls_usuario;
import java.util.List;

public interface MREJ_i_usuario {
    public boolean agregar(MREJ_cls_usuario usuario);
    public  boolean actualizar(MREJ_cls_usuario usuario);
    public boolean updateEncuestado(MREJ_cls_usuario usuario);
    public MREJ_cls_encuesta getEncuesta(MREJ_cls_usuario usuario);
    public List login(MREJ_cls_usuario usuario);
}

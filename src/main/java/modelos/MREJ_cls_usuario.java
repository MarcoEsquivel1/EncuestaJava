package modelos;

public class MREJ_cls_usuario {
    int id;
    String username;
    String password;
    int rol_id;
    String nombre;
    byte encuestado;

    public MREJ_cls_usuario() {
    }

    public MREJ_cls_usuario(String username, String password, int rol_id, String nombre) {
        this.username = username;
        this.password = password;
        this.rol_id = rol_id;
        this.nombre = nombre;
    }

    public byte getEncuestado() {
        return encuestado;
    }

    public void setEncuestado(byte encuestado) {
        this.encuestado = encuestado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRol_id() {
        return rol_id;
    }

    public void setRol_id(int rol_id) {
        this.rol_id = rol_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}

package modelos;

import java.sql.Time;
import java.util.Date;

public class MREJ_cls_encuesta {
    int id;
    int id_usuario;
    Date date;
    Time time;
    String nombre;
    int sexo;
    int dep_fav;
    int nivel_estudio;
    int tema_fav;

    public MREJ_cls_encuesta() {
    }

    public MREJ_cls_encuesta(int id_usuario, Date date, Time time, String nombre, int sexo, int dep_fav, int nivel_estudio, int tema_fav) {
        this.id_usuario = id_usuario;
        this.date = date;
        this.time = time;
        this.nombre = nombre;
        this.sexo = sexo;
        this.dep_fav = dep_fav;
        this.nivel_estudio = nivel_estudio;
        this.tema_fav = tema_fav;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(int sexo) {
        this.sexo = sexo;
    }

    public int getDep_fav() {
        return dep_fav;
    }

    public void setDep_fav(int dep_fav) {
        this.dep_fav = dep_fav;
    }

    public int getNivel_estudio() {
        return nivel_estudio;
    }

    public void setNivel_estudio(int nivel_estudio) {
        this.nivel_estudio = nivel_estudio;
    }

    public int getTema_fav() {
        return tema_fav;
    }

    public void setTema_fav(int tema_fav) {
        this.tema_fav = tema_fav;
    }
}

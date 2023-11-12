package modeloDAO;

import db.MREJ_Conexion;
import interfaces.MREJ_i_encuesta;
import modelos.MREJ_cls_encuesta;
import modelos.MREJ_cls_graf_sexo;
import modelos.MREJ_cls_respuesta;
import modelos.MREJ_cls_resultados;
import utils.MREJ_utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class MREJ_encuestaDAO implements MREJ_i_encuesta {
    MREJ_Conexion cn = new MREJ_Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;


    @Override
    public boolean agregar(MREJ_cls_encuesta encuesta) {
        Date date = new Date(encuesta.getDate().getTime());
        Time time = new Time(date.getTime());
        String sql = "insert into encuesta(id_usuario, date, time, nombre, sexo, dep_fav, nivel_estudio, tema_fav) values(?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, encuesta.getId_usuario());
            ps.setDate(2, (java.sql.Date) date);
            ps.setTime(3, time);
            ps.setString(4, encuesta.getNombre());
            ps.setInt(5, encuesta.getSexo());
            ps.setInt(6, encuesta.getDep_fav());
            ps.setInt(7, encuesta.getNivel_estudio());
            ps.setInt(8, encuesta.getTema_fav());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al agregar encuesta: " + e);
            return false;
        }
    }

    @Override
    public List all_encuestas() {
        List<MREJ_cls_encuesta> encuestas = new ArrayList<>();
        String sql = "select * from encuesta order by date asc, time asc";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                MREJ_cls_encuesta encuesta = new MREJ_cls_encuesta();
                encuesta.setId(rs.getInt("id"));
                encuesta.setId_usuario(rs.getInt("id_usuario"));
                encuesta.setDate(rs.getDate("date"));
                encuesta.setTime(rs.getTime("time"));
                encuesta.setNombre(rs.getString("nombre"));
                encuesta.setSexo(rs.getInt("sexo"));
                encuesta.setDep_fav(rs.getInt("dep_fav"));
                encuesta.setNivel_estudio(rs.getInt("nivel_estudio"));
                encuesta.setTema_fav(rs.getInt("tema_fav"));
                encuestas.add(encuesta);
            }

            /*for (MREJ_cls_encuesta encuesta : encuestas) {
                System.out.println("nombre: " + encuesta.getNombre());
            }*/
        } catch (Exception e) {
            System.out.println("Error al listar encuestas: " + e);
        }
        return encuestas;
    }

    @Override
    public List all_encuestas(String date) {
        List<MREJ_cls_encuesta> encuestas = new ArrayList<>();
        String sql = "select * from encuesta where date = ? order by date asc, time asc";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, date);
            rs = ps.executeQuery();
            while (rs.next()) {
                MREJ_cls_encuesta encuesta = new MREJ_cls_encuesta();
                encuesta.setId(rs.getInt("id"));
                encuesta.setId_usuario(rs.getInt("id_usuario"));
                encuesta.setDate(rs.getDate("date"));
                encuesta.setTime(rs.getTime("time"));
                encuesta.setNombre(rs.getString("nombre"));
                encuesta.setSexo(rs.getInt("sexo"));
                encuesta.setDep_fav(rs.getInt("dep_fav"));
                encuesta.setNivel_estudio(rs.getInt("nivel_estudio"));
                encuesta.setTema_fav(rs.getInt("tema_fav"));
                encuestas.add(encuesta);
            }
        } catch (Exception e) {
            System.out.println("Error al listar encuestas: " + e);
        }
        return encuestas;
    }

    @Override
    public List all_encuestas_name(String name) {
        List<MREJ_cls_encuesta> encuestas = new ArrayList<>();
        String sql = "select * from encuesta where nombre like ? order by date asc, time asc";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                MREJ_cls_encuesta encuesta = new MREJ_cls_encuesta();
                encuesta.setId(rs.getInt("id"));
                encuesta.setId_usuario(rs.getInt("id_usuario"));
                encuesta.setDate(rs.getDate("date"));
                encuesta.setTime(rs.getTime("time"));
                encuesta.setNombre(rs.getString("nombre"));
                encuesta.setSexo(rs.getInt("sexo"));
                encuesta.setDep_fav(rs.getInt("dep_fav"));
                encuesta.setNivel_estudio(rs.getInt("nivel_estudio"));
                encuesta.setTema_fav(rs.getInt("tema_fav"));
                encuestas.add(encuesta);
            }
        } catch (Exception e) {
            System.out.println("Error al listar encuestas: " + e);
        }
        return encuestas;
    }

    @Override
    public MREJ_cls_encuesta encuesta(int id) {
        MREJ_cls_encuesta encuesta = new MREJ_cls_encuesta();
        String sql = "select * from encuesta where id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                encuesta.setId(rs.getInt("id"));
                encuesta.setId_usuario(rs.getInt("id_usuario"));
                encuesta.setDate(rs.getDate("date"));
                encuesta.setTime(rs.getTime("time"));
                encuesta.setNombre(rs.getString("nombre"));
                encuesta.setSexo(rs.getInt("sexo"));
                encuesta.setDep_fav(rs.getInt("dep_fav"));
                encuesta.setNivel_estudio(rs.getInt("nivel_estudio"));
                encuesta.setTema_fav(rs.getInt("tema_fav"));
            }
        } catch (Exception e) {
            System.out.println("Error al listar encuesta: " + e);
        }
        return encuesta;
    }

    @Override
    public boolean eliminar(int id) {
        String sql = "delete from encuesta where id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error al eliminar encuesta: " + e);
            return false;
        }
    }

    @Override
    public List res_sexo() {
        String sql = "select sexo, count(*) as total from encuesta group by sexo";
        List<MREJ_cls_respuesta> lista_sexo = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            lista_sexo = new ArrayList<>();
            while (rs.next()) {
                MREJ_cls_respuesta respuesta_sexo = new MREJ_cls_respuesta();
                respuesta_sexo.setOpcion(MREJ_utils.convertSexo(rs.getInt("sexo")));
                respuesta_sexo.setCantidad(rs.getInt("total"));
                lista_sexo.add(respuesta_sexo);
            }

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }

        return lista_sexo;
    }

    @Override
    public List res_dep() {
        String sql = "select dep_fav, count(*) as total from encuesta group by dep_fav";
        List<MREJ_cls_respuesta> lista_dep = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            lista_dep = new ArrayList<>();
            while (rs.next()) {
                MREJ_cls_respuesta respuesta_dep = new MREJ_cls_respuesta();
                respuesta_dep.setOpcion(MREJ_utils.convertDep_fav(rs.getInt("dep_fav")));
                respuesta_dep.setCantidad(rs.getInt("total"));
                lista_dep.add(respuesta_dep);
            }

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }

        return lista_dep;
    }

    @Override
    public List res_estudio() {
        String sql = "select nivel_estudio, count(*) as total from encuesta group by nivel_estudio";
        List<MREJ_cls_respuesta> lista_estudio = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            lista_estudio = new ArrayList<>();
            while (rs.next()) {
                MREJ_cls_respuesta respuesta_estudio = new MREJ_cls_respuesta();
                respuesta_estudio.setOpcion(MREJ_utils.convertNivel_estudio(rs.getInt("nivel_estudio")));
                respuesta_estudio.setCantidad(rs.getInt("total"));
                lista_estudio.add(respuesta_estudio);
            }

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }

        return lista_estudio;
    }

    @Override
    public List res_tema() {
        String sql = "select tema_fav, count(*) as total from encuesta group by tema_fav";
        List<MREJ_cls_respuesta> lista_tema = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            lista_tema = new ArrayList<>();
            while (rs.next()) {
                MREJ_cls_respuesta respuesta_tema = new MREJ_cls_respuesta();
                respuesta_tema.setOpcion(MREJ_utils.convertTema_fav(rs.getInt("tema_fav")));
                respuesta_tema.setCantidad(rs.getInt("total"));
                lista_tema.add(respuesta_tema);
            }

        } catch (Exception e) {
            System.out.println("Error al consultar: " + e);
        }

        return lista_tema;
    }

    @Override
    public List grafico() {
        ArrayList<MREJ_cls_graf_sexo> list = new ArrayList<>();
        String sql = "select sexo, count(*) as total from encuesta group by sexo";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                MREJ_cls_graf_sexo us = new MREJ_cls_graf_sexo();
                us.setSexo(MREJ_utils.convertSexo(rs.getInt("sexo")));
                us.setTotal(rs.getInt("total"));
                list.add(us);
            }
        } catch (Exception e) {
            System.out.println("Error al consultar grafico: " + e);
        }
        return list;
    }
}

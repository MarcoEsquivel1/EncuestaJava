package modeloDAO;

import interfaces.MREJ_i_usuario;
import modelos.MREJ_cls_encuesta;
import modelos.MREJ_cls_usuario;
import db.MREJ_Conexion;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MREJ_usuarioDAO implements MREJ_i_usuario {
    MREJ_Conexion cn = new MREJ_Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public boolean agregar(MREJ_cls_usuario usuario) {
        String sql = "insert into usuarios(nombre, username, password, id_rol) values(?,?,?,?)";
        try {
            System.out.println("nombre: " + usuario.getNombre());
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            //format uft-8
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getUsername());
            ps.setString(3, usuario.getPassword());
            ps.setInt(4, usuario.getRol_id());
            ps.execute();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean actualizar(MREJ_cls_usuario usuario) {
        String sql = "update usuarios set nombre=?, password=? where id=?";
    try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getPassword());
            ps.setInt(3, usuario.getId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public boolean updateEncuestado(MREJ_cls_usuario usuario) {
        String sql = "update usuarios set  encuestado=? where id=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setByte(1, usuario.getEncuestado());
            ps.setInt(2, usuario.getId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public MREJ_cls_encuesta getEncuesta(MREJ_cls_usuario usuario) {
        String sql = "select * from encuesta where id_usuario=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, usuario.getId());
            rs = ps.executeQuery();
            rs.next();
            MREJ_cls_encuesta encuesta = new MREJ_cls_encuesta();
            encuesta.setId_usuario(rs.getInt("id_usuario"));
            encuesta.setNombre(rs.getString("nombre"));
            encuesta.setSexo(rs.getByte("sexo"));
            encuesta.setDep_fav(rs.getInt("dep_fav"));
            encuesta.setNivel_estudio(rs.getInt("nivel_estudio"));
            encuesta.setTema_fav(rs.getInt("tema_fav"));
            encuesta.setDate(rs.getDate("date"));
            encuesta.setTime(rs.getTime("time"));
            return encuesta;
        } catch (Exception e) {
            System.out.println("UPS " + e);
            return null;
        }
    }

    @Override
    public List login(MREJ_cls_usuario usuario) {
        ArrayList<MREJ_cls_usuario> list = new ArrayList<>();
        String sql = "select * from usuarios where username = ? and password = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getUsername());
            ps.setString(2, usuario.getPassword());
            rs = ps.executeQuery();
            while (rs.next()) {
                MREJ_cls_usuario us = new MREJ_cls_usuario();
                us.setId(rs.getInt("id"));
                us.setNombre(rs.getString("nombre"));
                us.setUsername(rs.getString("username"));
                us.setPassword(rs.getString("password"));
                us.setRol_id(rs.getInt("id_rol"));
                us.setEncuestado(rs.getByte("encuestado"));
                list.add(us);
            }
        } catch (Exception e) {
        }
        return list;
    }
}

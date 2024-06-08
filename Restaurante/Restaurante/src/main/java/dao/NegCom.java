package dao;

import java.sql.*;
import java.util.*;
import modelo.*;
import util.MySQLConexion;

public class NegCom {

    //Ingresar comida
    public void inCom(Comida c) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String query_cc = "select com_cod from comidas ORDER BY com_cod desc limit 1";
            PreparedStatement st = cn.prepareStatement(query_cc);
            ResultSet rs = st.executeQuery();

            String nuevoCodigo = "c0001"; // Código inicial por defecto

            if (rs.next()) {
                String ultimoCodigo = rs.getString("com_cod");
                int num = Integer.parseInt(ultimoCodigo.substring(1)) + 1;
                nuevoCodigo = String.format("c%04d", num);
            }

            String sql = "INSERT INTO COMIDAS VALUES(?,?,?,?)";
            st = cn.prepareStatement(sql);
            st.setString(1, nuevoCodigo);
            st.setString(2, c.getNombre());
            st.setInt(3, c.getStock());
            st.setString(4, c.getCat());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //Listar comida
    public List<Comida> listCom() {
        List<Comida> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select cd.com_cod,cd.com_nom,cd.com_stk,ct.cat_nom,ct.cat_pre "
                    + "from comidas cd join categorias ct on cd.cat_cod=ct.cat_cod";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comida c = new Comida();
                c.setCod(rs.getString(1));
                c.setNombre(rs.getString(2));
                c.setStock(rs.getInt(3));
                c.setCat(rs.getString(4));
                c.setPrecio(rs.getDouble(5));
                lista.add(c);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    //Eliminar comida
    public void DelCom(String codcm) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete from comidas where com_cod=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, codcm);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}

package dao;

import com.mysql.cj.xdevapi.Result;
import java.sql.*;
import java.util.*;
import util.MySQLConexion;
import modelo.*;

public class NegRep {

    public List<Ventas> listMes(int an) {
        List<Ventas> lista = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select month(fac_fec) mes , sum(art_pre*art_can) total\n"
                    + "from fac_cabe f inner join fac_deta d on f.fac_num=d.fac_num \n"
                    + "inner join articulos a on a.art_cod=d.art_cod \n"
                    + "where year(fac_fec)=an\n"
                    + "GROUP by month(fac_fec)\n"
                    + "order by mes";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, an);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Ventas v = new Ventas();
                v.setMes(rs.getInt(1));
                v.setMonto(rs.getDouble(2));
                lista.add(v);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    // Cantidad de pedidos por empleados por año
    public List<Ventas> listVend(int an) {
        List<Ventas> lista2 = new ArrayList<>();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "SELECT "
                    + "v.emp_cod,v.emp_nom AS vendedor, COUNT(DISTINCT f.ped_cod) AS cant "
                    + "FROM pedidos f "
                    + "INNER JOIN empleados v ON f.emp_cod = v.emp_cod "
                    + "WHERE YEAR(ped_fec) = ? "
                    + "GROUP BY v.emp_cod "
                    + "ORDER BY v.emp_cod";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setInt(1, an);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Ventas v = new Ventas();
                v.setVendors(rs.getString(2));
                v.setCxv(rs.getInt(3));
                lista2.add(v);
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista2;
    }
}

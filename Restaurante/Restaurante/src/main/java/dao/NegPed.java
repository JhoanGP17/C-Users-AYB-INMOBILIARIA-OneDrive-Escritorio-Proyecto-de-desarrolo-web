package dao;

import java.sql.*;
import java.util.*;
import modelo.*;
import util.MySQLConexion;

public class NegPed {

    //Ingresar pedido y detalle y cliente
    //public void inPediDet(Pedido pt,Cliente cli)<---corregir
    
    public void inPediDet(Pedido pt) {
        Connection cn = MySQLConexion.getConexion();
        try {
            PreparedStatement st = null;
            ResultSet rs = null;
            //codigo pedido
            String query_cp = "select ped_cod from pedidos ORDER BY ped_cod desc limit 1";
            st = cn.prepareStatement(query_cp);
            rs = st.executeQuery();

            String nuevoCodigop = "p0001"; // Código inicial por defecto

            if (rs.next()) {
                String ultimoCodigop = rs.getString("ped_cod");
                int nump = Integer.parseInt(ultimoCodigop.substring(1)) + 1;
                nuevoCodigop = String.format("p%04d", nump);
            }

            //codigo cliente
            /*String query = "SELECT cli_cod FROM clientes ORDER BY cli_cod DESC LIMIT 1";
            st = cn.prepareStatement(query);
            rs = st.executeQuery();

            String nuevoCodigocli = "cli001"; // Código inicial por defecto

            if (rs.next()) {
                String ultimoCodigocli = rs.getString("cli_cod");
                int numcli = Integer.parseInt(ultimoCodigocli.substring(1)) + 1;
                nuevoCodigocli = String.format("cli%04d", numcli);
            }*/

            //codigo detalle
            String query_cpd = "select pdt_cod from peddets ORDER BY pdt_cod desc limit 1";
            st = cn.prepareStatement(query_cpd);
            rs = st.executeQuery();

            String nuevoCodigodet = "d0001"; // Código inicial por defecto

            if (rs.next()) {
                String ultimoCodigodet = rs.getString("pdt_cod");
                int numdet = Integer.parseInt(ultimoCodigodet.substring(1)) + 1;
                nuevoCodigodet = String.format("d%04d", numdet);
            }
            //clientes
            /*String sqlCliente = "INSERT INTO clientes (cli_cod, cli_nom, cli_dni, cli_tel, cli_cor) VALUES (?, ?, ?, ?, ?)";
            st = cn.prepareStatement(sqlCliente);
            st.setString(1, nuevoCodigocli);
            st.setString(2, cli.getNomcli());
            st.setString(3, cli.getDnicli());
            st.setString(4, cli.getTelcli());
            st.setString(5, cli.getCorcli());
            st.executeUpdate();*/

            //pedidos
            String sqlp = "INSERT INTO pedidos VALUES(?,?,?,?,?,?,?)";
            st = cn.prepareStatement(sqlp);
            st.setString(1, nuevoCodigop);
            st.setString(2, pt.getMesa());
            st.setString(3, pt.getCliente());//focus
            st.setTimestamp(4, Timestamp.valueOf(pt.getFecha()));
            st.setDouble(5, pt.getIgv());
            st.setString(6, pt.getEmpleado());
            st.setString(7, pt.getEstado());
            st.executeUpdate();
                    
            //detalles pedidos
            String sqlpd = "INSERT INTO peddets VALUES(?,?,?,?)";
            st = cn.prepareStatement(sqlpd);
            st.setString(1, nuevoCodigodet);
            st.setString(2, nuevoCodigop);
            st.setString(3, pt.getComida());
            st.setInt(4, pt.getCantidad());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    //prueba
    /*public void inPediDet(Pedido pt, Cliente cli) {
    Connection cn = MySQLConexion.getConexion();
    PreparedStatement st = null;
    ResultSet rs = null;
    
    try {
        // codigo pedido
        String query_cp = "SELECT ped_cod FROM pedidos ORDER BY ped_cod DESC LIMIT 1";
        st = cn.prepareStatement(query_cp);
        rs = st.executeQuery();

        String nuevoCodigop = "p0001"; // Código inicial por defecto
        if (rs.next()) {
            String ultimoCodigop = rs.getString("ped_cod");
            int nump = Integer.parseInt(ultimoCodigop.substring(1)) + 1;
            nuevoCodigop = String.format("p%04d", nump);
        }
        rs.close();
        st.close();
        
        // codigo cliente
        String query = "SELECT cli_cod FROM clientes ORDER BY cli_cod DESC LIMIT 1";
        st = cn.prepareStatement(query);
        rs = st.executeQuery();

        String nuevoCodigocli = "cli001"; // Código inicial por defecto
        if (rs.next()) {
            String ultimoCodigocli = rs.getString("cli_cod");
            int numcli = Integer.parseInt(ultimoCodigocli.substring(3)) + 1; // cambió substring(1) a substring(3) para obtener el número correctamente
            nuevoCodigocli = String.format("cli%04d", numcli);
        }
        rs.close();
        st.close();
        
        // codigo detalle
        String query_cpd = "SELECT pdt_cod FROM peddets ORDER BY pdt_cod DESC LIMIT 1";
        st = cn.prepareStatement(query_cpd);
        rs = st.executeQuery();

        String nuevoCodigodet = "d0001"; // Código inicial por defecto
        if (rs.next()) {
            String ultimoCodigodet = rs.getString("pdt_cod");
            int numdet = Integer.parseInt(ultimoCodigodet.substring(1)) + 1;
            nuevoCodigodet = String.format("d%04d", numdet);
        }
        rs.close();
        st.close();
        
        // clientes
        String sqlCliente = "INSERT INTO clientes (cli_cod, cli_nom, cli_dni, cli_tel, cli_cor) VALUES (?, ?, ?, ?, ?)";
        st = cn.prepareStatement(sqlCliente);
        st.setString(1, nuevoCodigocli);
        st.setString(2, cli.getNomcli());
        st.setString(3, cli.getDnicli());
        st.setString(4, cli.getTelcli());
        st.setString(5, cli.getCorcli());
        st.executeUpdate();
        st.close();

        // pedidos
        String sqlp = "INSERT INTO pedidos VALUES(?,?,?,?,?,?,?)";
        st = cn.prepareStatement(sqlp);
        st.setString(1, nuevoCodigop);
        st.setString(2, pt.getMesa());
        st.setString(3, nuevoCodigocli); // focus
        st.setTimestamp(4, Timestamp.valueOf(pt.getFecha()));
        st.setDouble(5, pt.getIgv());
        st.setString(6, pt.getEmpleado());
        st.setString(7, pt.getEstado());
        st.executeUpdate();
        st.close();
        
        // detalles pedidos
        String sqlpd = "INSERT INTO peddets VALUES(?,?,?,?)";
        st = cn.prepareStatement(sqlpd);
        st.setString(1, nuevoCodigodet);
        st.setString(2, nuevoCodigop);
        st.setString(3, pt.getComida());
        st.setInt(4, pt.getCantidad());
        st.executeUpdate();
        st.close();
        
    } catch (Exception ex) {
        ex.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (st != null) st.close();
            if (cn != null) cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
*/
    
    //Listar mesas
    public List<Mesa> listMesas() {
        List<Mesa> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select msa_cod,msa_num,msa_pis from mesas";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Mesa m = new Mesa();
                m.setCodm(rs.getString(1));
                m.setNum(rs.getString(2));
                m.setPiso(rs.getString(3));
                lista.add(m);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    //Listar Pedidos
    public List<Pedido> listPeds() {
        List<Pedido> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select ped_cod,msa_cod, cli_cod,ped_fec, ped_igv,"
                    + "emp_cod, ped_est from pedidos ";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Pedido p = new Pedido();
                p.setCodigo(rs.getString(1));
                p.setMesa(rs.getString(2));
                p.setCliente(rs.getString(3));

                // Convertir Timestamp a LocalDateTime
                Timestamp timestamp = rs.getTimestamp(4);
                if (timestamp != null) {
                    p.setFecha(timestamp.toLocalDateTime());
                }

                p.setIgv(Double.parseDouble(rs.getString(5)));
                p.setEmpleado(rs.getString(6));
                p.setEstado(rs.getString(7));
                lista.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

//Listar Detalle Pedidos
    public List<DetPed> listDetPedits(String id) {
        List<DetPed> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select cd.com_cod, cd.com_nom, ct.cat_nom, ct.cat_pre, pdt.com_can, pdt.pdt_cod "
                    + "from comidas cd "
                    + "join categorias ct ON cd.cat_cod = ct.cat_cod "
                    + "join peddets pdt ON cd.com_cod = pdt.com_cod where ped_cod=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                DetPed pdt = new DetPed();
                pdt.setCodcda(rs.getString(1));
                pdt.setNomcda(rs.getString(2));
                pdt.setNomcat(rs.getString(3));
                pdt.setPre(rs.getDouble(4));
                pdt.setCant(rs.getInt(5));
                pdt.setCoddtp(rs.getString(6));
                lista.add(pdt);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    //Eliminar Pedidos y detalles

    public void DelPedDetl(String codpd) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete pedidos, peddets from pedidos "
                    + "join peddets on pedidos.ped_cod = peddets.ped_cod "
                    + "where pedidos.ped_cod = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, codpd);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}

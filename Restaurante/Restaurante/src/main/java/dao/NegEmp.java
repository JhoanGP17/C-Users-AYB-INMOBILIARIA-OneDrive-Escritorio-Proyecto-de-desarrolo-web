package dao;

import java.sql.*;
import java.util.*;
import modelo.*;
import util.MySQLConexion;

public class NegEmp {
 
    
    //Ingresar empleado y usuario
    public void inEmpU(Empleado e) {
        Connection cn = MySQLConexion.getConexion();
        try {
            PreparedStatement st=null;
            ResultSet rs=null;
            //codigo empleado
            String query_ce = "select emp_cod from empleados ORDER BY emp_cod desc limit 1";
            st = cn.prepareStatement(query_ce);
            rs = st.executeQuery();
            
            String nuevoCodigoe = "e0001"; // Código inicial por defecto
    
            if (rs.next()) {
                String ultimoCodigoe = rs.getString("emp_cod");
                int nume = Integer.parseInt(ultimoCodigoe.substring(1)) + 1;
                nuevoCodigoe = String.format("e%04d", nume);
            }
            //codigo usuario
            String query_cu = "select usr_cod from usuarios ORDER BY usr_cod desc limit 1";
            st = cn.prepareStatement(query_cu);
            rs = st.executeQuery();
            
            String nuevoCodigou = "u0001"; // Código inicial por defecto
    
            if (rs.next()) {
                String ultimoCodigou = rs.getString("usr_cod");
                int numu = Integer.parseInt(ultimoCodigou.substring(1)) + 1;
                nuevoCodigou = String.format("u%04d", numu);
            }
            //empleados
            String sqle = "INSERT INTO empleados VALUES(?,?,?,?,?,?,?,?,?)";
            st = cn.prepareStatement(sqle);
            st.setString(1, nuevoCodigoe);
            st.setString(2, e.getNome());
            st.setString(3, e.getApe());
            st.setInt(4, e.getDni());
            st.setInt(5, e.getTel());
            st.setString(6, e.getCore());
            st.setString(7, e.getCare());
            st.setString(8, e.getTure());
            st.setString(9, nuevoCodigou);
            st.executeUpdate();
            //usuarios
            String sqlu = "INSERT INTO usuarios VALUES(?,?,?,?,?)";
            st = cn.prepareStatement(sqlu);
            st.setString(1, nuevoCodigou);
            st.setString(2, e.getUsre());
            st.setString(3, e.getCone());
            st.setString(4, e.getRole());
            st.setString(5, e.getEste());
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    //Listar Empleados
    public List<Empleado> listEmpu() {
        List<Empleado> lista = new ArrayList();
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "select e.emp_cod,e.emp_nom,e.emp_ape,e.emp_dni,"
                       + "e.emp_tel,e.emp_cor,e.emp_car,e.emp_tur,u.usr_nom,"
                       + "u.usr_con,u.usr_rol,u.usr_est "
                       + "from empleados e join usuarios u on e.usr_cod=u.usr_cod";
            PreparedStatement st = cn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Empleado e = new Empleado();
                e.setCode(rs.getString(1));
                e.setNome(rs.getString(2));
                e.setApe(rs.getString(3));
                e.setDni(rs.getInt(4));
                e.setTel(rs.getInt(5));
                e.setCore(rs.getString(6));
                e.setCare(rs.getString(7));
                e.setTure(rs.getString(8));
                e.setUsre(rs.getString(9));
                e.setCone(rs.getString(10));
                e.setRole(rs.getString(11));
                e.setEste(rs.getString(12));
                lista.add(e);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    //Eliminar empleado y usuario
    
    public void DelEmpu(String codem) {
        Connection cn = MySQLConexion.getConexion();
        try {
            String sql = "delete empleados, usuarios from empleados "
                       + "join usuarios on empleados.usr_cod = usuarios.usr_cod "
                       + "where empleados.emp_cod = ?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, codem);
            st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}

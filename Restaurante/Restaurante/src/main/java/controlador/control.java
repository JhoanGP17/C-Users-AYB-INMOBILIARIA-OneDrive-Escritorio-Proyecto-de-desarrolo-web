package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.*;
import java.util.List;
import modelo.*;

public class control extends HttpServlet {

    NegCom objc = new NegCom();
    NegEmp obje = new NegEmp();
    NegPed objp = new NegPed();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int op = Integer.parseInt(request.getParameter("opc"));
        if (op == 1) adCom(request, response);
        if (op == 2) adEmpu(request, response);
        if (op == 3) adPed(request, response);
        if (op == 4) listDuPet(request, response);
        if (op == 5) DelCom(request, response);
        if (op == 6) DelEmpu(request, response);
        if (op == 7) DelPedDetl(request, response);             
    }
    //Agregar Comidas
    protected void adCom(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Comida c = new Comida();
        c.setCod(request.getParameter("codigo"));
        c.setNombre(request.getParameter("nombre"));
        c.setCat(request.getParameter("opm"));
        c.setStock(Integer.parseInt(request.getParameter("stk")));
        objc.inCom(c);
        String pag = "/pagListCom.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    //Agregar Empleados
    protected void adEmpu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Empleado e = new Empleado();
        //empleados
        e.setNome(request.getParameter("nom"));
        e.setApe(request.getParameter("ape"));
        e.setDni(Integer.parseInt(request.getParameter("dni")));
        e.setTel(Integer.parseInt(request.getParameter("tel")));
        e.setCore(request.getParameter("cor"));
        e.setCare(request.getParameter("opmc"));
        e.setTure(request.getParameter("opmt"));
        //usuarios
        e.setUsre(request.getParameter("usr"));
        e.setCone(request.getParameter("con"));
        e.setRole(request.getParameter("opmr"));
        e.setEste(request.getParameter("opme"));
        obje.inEmpU(e);
        String pag = "/pagListEmp.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    //Agregar Pedidos
    protected void adPed(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pedido p = new Pedido();
        /*Cliente c = new Cliente();*/
        
        p.setFechaEnvioActual();
        
        //cliente
        /*c.setNomcli(request.getParameter("cli_n"));
        c.setDnicli(request.getParameter("cli_d"));
        c.setTelcli(request.getParameter("cli_t"));
        c.setCorcli(request.getParameter("cli_c"));*/
        
        //pedidos
        p.setMesa(request.getParameter("codMsa"));
        p.setCliente(request.getParameter("cli"));
        p.setFecha(p.getFecha());
        p.setIgv(Double.parseDouble(request.getParameter("igv")));
        p.setEmpleado(request.getParameter("codEmp"));
        p.setEstado(request.getParameter("est"));
        //Detalle pedido
        p.setComida(request.getParameter("codCom"));
        p.setCantidad(Integer.parseInt(request.getParameter("can")));
        objp.inPediDet(p);
        String pag = "/pagListPed.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }

    //conexion con detalle pedidos    
    protected void listDuPet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
        String cod=request.getParameter("cod");
        request.setAttribute("dato", objp.listDetPedits(cod));
        String pag="pagListDetPed.jsp";
        request.getRequestDispatcher(pag).forward(request, response);
    }
    //conexion con elminar comidas
    protected void DelCom(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String codcom=request.getParameter("coddcom");
            objc.DelCom(codcom);
            String pag="/pagListCom.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
    }
    //conexion con eliminar empleados
    protected void DelEmpu(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String codemp=request.getParameter("coddemp");
            obje.DelEmpu(codemp);
            String pag="/pagListEmp.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
    }
    //conexion con eliminar pedidos
    protected void DelPedDetl(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String codpdt=request.getParameter("coddpdt");
            objp.DelPedDetl(codpdt);
            String pag="/pagListPed.jsp";
            request.getRequestDispatcher(pag).forward(request, response);
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.*,modelo.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include  file="menu2_a.jsp" %> 
        <%
            NegPed obj = new NegPed();
        %>
    <center>
        <h2>Lista de Pedidos</h2>
        <a href="pagIngPed.jsp" class="btn btn-success">Ingreso de pedidos</a>
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-dark">
                    <th>Pedido<th>Mesa<th>Cliente<th>Fecha<th>Igv
                    <th>Empleado<th>Estado<th>Ver
            </thead>

            <%
                for (Pedido x : obj.listPeds()) {
                    out.print("<tr><td>" + x.getCodigo() + "<td>" + x.getMesa() + "<td>" + x.getCliente()
                            + "<td>" + x.getFecha() + "<td>" + x.getIgv() + "<td>" + x.getEmpleado()
                            + "<td>" + x.getEstado());
            %>
            <td><a href="control?opc=4&cod=<%=x.getCodigo()%>" class="btn btn-success">Detalle</a>
                <a href="control?opc=7&coddpdt=<%=x.getCodigo()%>" class="btn btn-danger">Eliminar</a>    
                <%
                    }
                %>
        </table>
    </center>
</body>
</html>
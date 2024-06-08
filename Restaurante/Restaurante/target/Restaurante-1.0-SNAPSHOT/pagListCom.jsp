<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.*,modelo.Comida"%>
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
            NegCom obj = new NegCom();
        %>
    <center>
        <h2>Lista de Comidas</h2>
        <a href="pagIngCom.jsp" class="btn btn-success">Ingreso de comidas</a>
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-dark">
                    <th>Codigo<th>Comida<th>Categoria<th>Stock<th>Precio<th>accion
            </thead>
            <%
                for (Comida x : obj.listCom()) {
                    out.print("<tr><td>" + x.getCod() + "<td>"
                            + x.getNombre() + "<td>" + x.getCat() + "<td>"
                            + x.getStock()+"<td>"+x.getPrecio());
            %>
            <td><a href="control?opc=5&coddcom=<%=x.getCod()%>"
                   class="btn btn-danger">Eliminar</a>
                <%
                    }
                %>
        </table>
    </center>
</body>
</html>

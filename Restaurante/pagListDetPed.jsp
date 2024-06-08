<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.*,modelo.*, java.util.*" %>

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
            List<DetPed> lista = (ArrayList<DetPed>) request.getAttribute("dato");
        %> 
    <center>
        <h2 class="text-blue">Lista de Detalle Pedidos</h2>       
        <a href="pagIngPed.jsp" class="btn btn-success">Ingreso de pedidos</a>
        <a href="#" onclick="history.back()" class="btn btn-success">Retroceder</a>
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-dark">
                    <th>Codigo<th>Comida<th>Categoria<th>Cantidad<td>Precio<td>Total 
            </thead>

            <%
                double sum=0;
                for (DetPed x : lista) {
                    out.print("<tr><td>" + x.getCodcda() + "<td>" + x.getNomcda()
                    + "<td>" + x.getNomcat()+ "<td>" + x.getCant()+ "<td>" + x.getPre()
                    + "<td>" + x.total());
                    sum+=x.total();
                }
                out.print("<tr><td>Total Pedido"+"<td>"+ "<td>"+"<td>"+ "<td>"+ "<td>"+sum);
            %>
        </table>
    </center>
</body>
</html>
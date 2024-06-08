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
            NegCom objc = new NegCom();
            NegCatCom objctc = new NegCatCom();

            String codctc = "todos", codcom = "";
            if (request.getParameter("cb_ctc") != null) {
                codctc = request.getParameter("cb_ctc");
            }
            if (request.getParameter("cb_com") != null)
                codcom = request.getParameter("cb_com");
        %>
        <form>
            <div class="form-group">
                <label>Seleccione categoria</label>
                <select name="cb_ctc" class="form-control" onchange="submit()">
                    <option>--elegir--</option>
                    <%
                        for (CatCom x : objctc.listCatCom()) {
                            if (codctc.equals(x.getCod())) {
                                out.print("<option value=" + x.getCod() + " selected>" + x.getNom());
                            } else {
                                out.print("<option value=" + x.getCod() + ">" + x.getNom());
                            }
                        }
                        out.print("<option value=\"todos\">Todos</option>");
                    %>
                </select>
            </div>
        </form>
    <center>
        <h2>Lista de Comidas</h2>
        <a href="pagIngCom.jsp" class="btn btn-success">Ingreso de comidas</a>
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-dark">
                    <th>Codigo<th>Comida<th>Categoria<th>Stock<th>Precio<th>acción
            </thead>
            <%
                if (codctc.equals("todos")) {
                    for (Comida x : objc.listCom()) {
                        out.print("<tr><td>" + x.getCod() + "<td>"
                                + x.getNombre() + "<td>" + x.getCat() + "<td>"
                                + x.getStock() + "<td>" + "S/."+x.getPrecio());
            %>
            <td><a href="control?opc=5&coddcom=<%=x.getCod()%>"
                   class="btn btn-danger">Eliminar</a>
                <%
                    }
                } else {
                    for (Comida x : objc.ListComXcat(codctc)) {
                        out.print("<tr><td>" + x.getCod() + "<td>"
                                + x.getNombre() + "<td>" + x.getCat() + "<td>"
                                + x.getStock() + "<td>" + "S/."+x.getPrecio());
                %>
            <td><a href="control?opc=5&coddcom=<%=x.getCod()%>"
                   class="btn btn-danger">Eliminar</a>
                <%
                        }
                    }


                %>
        </table>
    </center>
</body>
</html>

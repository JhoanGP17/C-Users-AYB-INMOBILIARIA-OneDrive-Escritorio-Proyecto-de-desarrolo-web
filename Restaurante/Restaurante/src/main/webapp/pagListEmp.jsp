<%@page import="modelo.Empleado"%>
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
            NegEmp obj = new NegEmp();
        %>
    <center>
        <h2>Lista de Empleados</h2>
        <a href="pagIngEmp.jsp" class="btn btn-success">Ingreso de empleados</a>
        <table class="table table-hover">
            <thead>
                <tr class="text-white bg-dark">
                    <th>Codigo<th>Empleado<th>Dni<th>telefono<th>Correo
                    <th>Cargo<th>Turno<th>Usuario<th>Contraseña<th>Rol
                    <th>Estado<th>accion
            </thead>

            <%
                for (Empleado x : obj.listEmpu()) {
                    out.print("<tr><td>" + x.getCode() + "<td>" + x.getNome() + " " + x.getApe()
                            + "<td>" + x.getDni() + "<td>" + x.getTel() + "<td>" + x.getCore()
                            + "<td>" + x.getCare() + "<td>" + x.getTure() + "<td>" + x.getUsre()
                            + "<td>" + x.getCone() + "<td>" + x.getRole() + "<td>" + x.getEste());
            %>
            <td><a href="control?opc=6&coddemp=<%=x.getCode()%>"
                   class="btn btn-danger">Eliminar</a>
                <%
                    }
                %>
        </table>
    </center>
</body>
</html>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.*,modelo.*"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>    

        <script>
            function saveEmp(selectElement) {
                var codEmpSelec = selectElement.value;
                document.getElementById("codEmp").value = codEmpSelec;
            }
            function saveCom(selectElement) {
                var codComSelec = selectElement.value;
                document.getElementById("codCom").value = codComSelec;
            }
            function saveMsa(selectElement) {
                var codMsaSelec = selectElement.value;
                document.getElementById("codMsa").value = codMsaSelec;
            }
        </script>
    </head>
    <body>
        <%@include  file="menu2_a.jsp" %>
        <%
            NegEmp obje = new NegEmp();
            NegCom objc = new NegCom();
            NegPed objp = new NegPed();
        %>
    <center>
        <h3>Ingreso de Pedidos</h3>
        <form action="control">
            <input type="hidden" name="opc" value="3">
            <table class="table table-bordered">
                <tr><td>Mesa<td>
                        <select name="listMsa" id="listMsa"onchange="saveMsa(this)">
                            <option value="" selected>Seleccionar</option>
                            <%
                                for (Mesa x : objp.listMesas()) {
                                    out.println("<option value='" + x.getCodm() + "'>" + x.getNum() + "</option>");

                                }
                            %>
                        </select>
                        <input type="hidden" name="codMsa" id="codMsa">
                     <tr><td>Cliente<td><input name="cli_n">
                     <tr><td>DNI<td><input name="cli_d">
                     <tr><td>Telefono<td><input name="cli_t">
                     <tr><td>Correo<td><input name="cli_c">
                <tr><td>IGV<td>
                        <input type="radio" value="0.18" name="igv">18%
                <tr><td>Empleado<td>
                        <select name="listemp" id="listemp"onchange="saveEmp(this)">
                            <option value="" selected>Seleccionar</option>
                            <%
                                for (Empleado x : obje.listEmpu()) {
                                    out.println("<option value='" + x.getCode() + "'>" + x.getNome() + " " + x.getApe() + "</option>");

                                }
                            %>
                        </select>
                        <input type="hidden" name="codEmp" id="codEmp">
                <tr><td>Comida<td>
                        <select name="listcom" id="listcom"onchange="saveCom(this)">
                            <option value="" selected>Seleccionar</option>
                            <%
                                for (Comida x : objc.listCom()) {
                                    out.println("<option value='" + x.getCod() + "'>" + x.getNombre() + "</option>");

                                }
                            %>
                        </select>
                        <input type="hidden" name="codCom" id="codCom">
                <tr><td>Cantidad<td><input name="can">
                        <!--<tr><td>Tot<td><input name="tot">-->
                <tr><td>estado<td>
                        <input type="radio" value="Entregado" name="est">Entregado
                        <input type="radio" value="Pendiente" name="est">Pendiente
                <tr><td><input type="submit">
            </table>
        </form>
    </center>
</body>
</html>

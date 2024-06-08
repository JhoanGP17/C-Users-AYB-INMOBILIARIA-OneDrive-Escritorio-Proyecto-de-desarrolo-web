<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- <tr><td>Codigo<td><input name="codigo"> -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>    
    </head>
    <body>
        <%@include  file="menu2_a.jsp" %> 
    <center>
        <h3>Ingreso de Comidas</h3>
        <form action="control">
            <input type="hidden" name="opc" value="1">
            <table class="table table-bordered">
                <tr><td>Comida<td><input name="nombre">
                <tr><td>Tipo de comida<td>
                        <input type="radio" value="t0001" name="opm">Desayuno
                        <input type="radio" value="t0002" name="opm">Entrada
                        <input type="radio" value="t0003" name="opm">Segundo
                        <input type="radio" value="t0004" name="opm">Extra
                <tr><td>Stock<td><input name="stk">
                <tr><td><input type="submit">
                        
            </table>
        </form>
    </center>
    </body>
</html>

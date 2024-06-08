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
        <h3>Ingreso de Empleados</h3>
        <form action="control">
            <input type="hidden" name="opc" value="2">
            <table class="table table-bordered">
                <tr><td>Nombres<td><input name="nom">
                <tr><td>Apellidos<td><input name="ape">
                <tr><td>DNI<td><input name="dni">
                <tr><td>Telefono<td><input name="tel">
                <tr><td>Correo<td><input name="cor">
                <tr><td>Cargo<td>
                        <input type="radio" value="Administrador" name="opmc">Administrador
                        <input type="radio" value="Mesero" name="opmc">Mesero
                        <input type="radio" value="Cocinero" name="opmc">Cocinero
                        <input type="radio" value="Ayudante" name="opmc">Ayudante
                <tr><td>Turno<td>
                        <input type="radio" value="Mañana" name="opmt">Mañana
                        <input type="radio" value="Tarde" name="opmt">Tarde
                        <input type="radio" value="Noche" name="opmt">Noche
                        <input type="radio" value="Ejecutivo" name="opmt">Ejecutivo
                <tr><td>Usuario<td><input name="usr">
                <tr><td>Contraseña<td><input name="con">
                <tr><td>rol<td>
                        <input type="radio" value="Admin" name="opmr">Admin
                        <input type="radio" value="User" name="opmr">User
                <tr><td>estado<td>
                        <input type="radio" value="Activo" name="opme">Activo
                        <input type="radio" value="Inactivo" name="opme">Inactivo
                <tr><td><input type="submit">
                        
            </table>
        </form>
    </center>
    </body>
</html>

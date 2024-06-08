
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/LoginCss.css" rel="stylesheet" type="text/css"/>
        <title>Login</title>
    </head>
    <body>
        <div class="container col-lg-3">
            <form action="Mesero.jsp">
                <div class="form-group text-center">
                    <img src="Imagenes/Login.jpg" height="100" width="100" border-radius="10"/>
                    <p><strong>Ingrese sus datos</strong></p>
                </div>
                <div class="form-group">
                    <label>Usuario:</label> 
                    <input class="form-control" type="text" name="txtnom" placeholder="Ingrese Usuario">
                </div>
                <div class="form-group">
                    <label>Contraseña:</label>
                    <input type="password" name="txtContraseña" placeholder="Ingrese Contraseña" class="form-control">
                </div>
                <input class="btn" type="button" name="accion" value="Ingresar" onclick="redirectToPage()">
                
                <div class="select">
                    <select name="format" id="format">
                        <option selected disabled="choose a book format">Elegir</option>  
                        <option value="Admin">Admin</option>  
                        <option value="Mesero">Mesero</option>  
                    </select>                    
                </div>                          
            </form>
        </div>
        <script>
        function redirectToPage() {
            var selectBox = document.getElementById("format");
            var selectedValue = selectBox.options[selectBox.selectedIndex].value;

            if (selectedValue === "Admin") {
                window.location.href = "pagAdmin.jsp"; // Change this to the URL of the Admin page
            } else if (selectedValue === "Mesero") {
                window.location.href = "pagMesero.jsp"; // Change this to the URL of the Mesero page
            } else {
                alert("Por favor, elige una opción válida.");
            }
        }
    </script>
        
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>

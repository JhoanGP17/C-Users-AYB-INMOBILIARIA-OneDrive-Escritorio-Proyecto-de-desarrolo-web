<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*,dao.NegRep"%>
<html>
    <head>
        <link href="css/adminlte.min.css" rel="stylesheet" type="text/css"/>
        <script src=
        "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <style>
            .container {
                width: 100%;
                margin: 15px auto;
            }
            body {
                text-align: center;
                color: green;
            }
            h2 {
                text-align: center;
                font-family: "Verdana", sans-serif;
                font-size: 30px;
            }
        </style>
    </head>
    <body>
        <%@include  file="menu2_a.jsp" %> 
        <%
            NegRep obj = new NegRep();
            String label = "", data = "";
            int an = 0;
            String tipo = "";
            //esto es cada vez que tengas datos de ingreso en la misma pagina
            if (request.getParameter("tan") != null) {
                an = Integer.parseInt(request.getParameter("tan"));
            }
            if (request.getParameter("opc") != null)
                tipo = request.getParameter("opc");
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">
                            <form name="fr">
                                <div>
                                    <label>Ingrese año</label>
                                    <input name="tan" class="form-control" value="<%=an%>">                                                                        
                                </div>
                                <div class="form-control">
                                    <input type="radio" name="opc" value="bar">Barras
                                    <input type="radio" name="opc" value="pie">Torta
                                    <input type="radio" name="opc" value="line">Lineal
                                </div>
                                <button class="btn btn-success">Enviar</button>
                            </form>
                                <table class="table table-bordered">
                                    <tr><th>Empleado<th>#Pedidos
                                      <%
                                       int sum=0;
                                        for(Ventas x:obj.listVend(an)){
                                            out.print("<tr><td>"+x.getVendors()+
                                                      "<td>"+x.getCxv());
                                          sum+=x.getCxv();
                                          }
                                        out.print("<tr><td>Total"+"<td>"+sum);
                                      %>
                                </table>
                        </div>
                    </div>
                </div>
                <fdiv class="col-sm-8">
                    <h2>Gráfico de Pedido x empleado del año <%=an%></h2>
                    <div>
                        <canvas id="myChart"></canvas>
                    </div>
                </fdiv>
            </div>
        </div>
        <% for (Ventas x : obj.listVend(an)) {
                label = label + "'" + x.getVendors()+ "',";
                data = data + x.getCxv() + ",";
            }
            if (data.length() > 0)
                data = data.substring(0, data.length() - 1);
        %>

    </body>
    <script>
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "<%=tipo%>",
            data: {
                labels: [<%=label%>],
                datasets: [
                    {
                        label: "Pedidos",
                        data: [<%=data%>],
                        backgroundColor: ["rgba(153,205,1,0.6)",'lightblue','orange',
                        'yellow','peru','red','lightgreen','lightred'],
                    },
                ],
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
</html>
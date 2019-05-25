<html>

    <head>
        <title>Cerrando Sesion</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="Contenedor">
        <div>
            
            <% session.invalidate(); %>
        <br><br>
        <br><br>
        <br><br>
        <br><br>
        <center><b>Sesion cerrada con Exito!!</b></center>
        <br>
        <center><a href="login_form.jsp">Iniciar Sesion</a></center>
            
        </div>
    </body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
        
        <div id="contenedor1">
            
            <h1><img src="imagen/umg.png" width="50" height="50" alt=""/></h1>
            <h1>Iniciar Sesión</h1>
            <form id="form1" action="LoginController" method="post">
                <img src="imagen/login.png" width="30" height="30" alt=""/>
                <input type="text" name="user" placeholder="Correo Electronico" value="<jsp:getProperty name="user" property="user"/>">
                
                <img src="imagen/password.png" width="30" height="30" alt=""/>
                <input type="password" name="pwd" placeholder="Contraseña" value="<jsp:getProperty name="user" property="pwd"/>">
                
              
                <div class="twoToneCenter">
                     <button class="twoToneButton" type="submit" name="accion" value="Entrar">ENTRAR</button>
                </div>
               
                <br><br>
                <a href="register_form.jsp">Registrate</a>
                <a href="Recover_password.jsp">¿Has olvidado tu contraseña?</a> 
                
            </form>
        </div>
        
    </body>
    <script>
            $(function(){

            var twoToneButton = document.querySelector('.twoToneButton');

            twoToneButton.addEventListener("click", function() {
                twoToneButton.innerHTML = "CARGANDO";
                twoToneButton.classList.add('spinning');

              setTimeout( 
                    function  (){  
                        twoToneButton.classList.remove('spinning');
                        twoToneButton.innerHTML = "ENTRAR";

                    }, 6000);
            }, false);

        });
    </script>
</html>

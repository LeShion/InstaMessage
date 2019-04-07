<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Formulario de Registro</title>
    </head>
    <body>
        
        <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
 
        <div id="contenedor2">
            
            <a href="login_form.jsp">Regresar</a>
            <h1>Registro de nuevo usuario</h1>
            
            <form id="form2" action="RegisterController" method="post">

                <input type="text" name="first_name" placeholder="Nombre" value="<jsp:getProperty name="user" property="first_name"/>"><br>
                <input type="text" name="last_name" placeholder="Apellido" value="<jsp:getProperty name="user" property="last_name"/>"><br>
                <input type="text" name="user" placeholder="Nombre de Usuario" value="<jsp:getProperty name="user" property="user"/>"><br>
                <input type="text" readonly="readonly" value="@instam.com">
                <input type="password" name="pwd" placeholder="Contraseña" value="<jsp:getProperty name="user" property="pwd"/>"><br>
                <input type="text" name="pSecreta" placeholder="Pregunta Secreta" value="<jsp:getProperty name="user" property="psecreta"/>"><br>
                <input type="text" name="rSecreta" placeholder="Respuesta Secreta" value="<jsp:getProperty name="user" property="rsecreta"/>"><br>
                <input type="date" name="fecha_nac" placeholder="Fecha de Nacimiento" value="<jsp:getProperty name="user" property="fechaNac"/>"><br><br>
                
                <input type="reset"  value="Reset" /><<br>
                <input type="submit" value="Registrar">
                
            </form> 
        </div>
                        
    </body>
</html>

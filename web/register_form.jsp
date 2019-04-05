<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de Registro</title>
    </head>
    <body>
        
        <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
 
        <form action="RegisterController" method="post">
            <center>
                <table border="1" width="35%" cellpadding="5">
                    <thead>
                        <tr>
                            <th colspan="2">REGISTRARSE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>    
                            <td>Nombre : </td>
                            <td><input type="text" name="first_name" value="<jsp:getProperty name="user" property="first_name"/>"></td>
                        </tr>
                        <tr>    
                            <td>Apellido : </td>
                            <td><input type="text" name="last_name" value="<jsp:getProperty name="user" property="last_name"/>"></td>
                        </tr>
                        <tr>    
                            <td>Correo : </td>
                            <td><input type="text" name="user" value="<jsp:getProperty name="user" property="user"/>"></td>
                        </tr>
                        <tr>
                            <td>Contraseña : </td>
                            <td><input type="password" name="pwd" value="<jsp:getProperty name="user" property="pwd"/>"></td>
                        </tr>
                        <tr>
                            <td>Pregunta Secreta : </td>
                            <td><input type="text" name="pSecreta" value="<jsp:getProperty name="user" property="psecreta"/>"></td>
                        </tr>
                        <tr>
                            <td>Respuesta Secreta : </td>
                            <td><input type="text" name="rSecreta" value="<jsp:getProperty name="user" property="rsecreta"/>"></td>
                        </tr>
                        <tr>
                            <td>Fecha de Nacimiento : </td>
                            <td><input type="date" name="Fecha_nac" value="<jsp:getProperty name="user" property="fechaNac"/>"></td>
                        </tr>
                        <tr>
                            <td><center><input type="reset" value="Reset" /></center></td>
                            <td><center><input type="submit" value="Registrar"></center></td>
                        </tr>
                    </tbody>             
                </table>
            </center>
        </form>
        
        <div style="position: relative">
            <div style="position: fixed ; bottom: 0 ; width:100% ; text-align:center ">
                
            </div>
        </div>                  
                        
    </body>
</html>

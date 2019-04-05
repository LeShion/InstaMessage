<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
    </head>
    <body>
        
        <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>

        <form action="LoginController" method="post">
            <center>
                <table border="2" width="35%" cellpadding="8">
                    <thead>
                        <tr>
                            <th colspan="2">Iniciar Sesion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>    
                            <td>Correo : </td>
                            <td><input type="text" name="user" value="<jsp:getProperty name="user" property="user"/>"></td>
                        </tr>
                        <tr>
                            <td>Contraseña : </td>
                            <td><input type="password" name="pwd" value="<jsp:getProperty name="user" property="pwd"/>"></td>
                        </tr>
                        <tr>  
                            <td><center><a href="register_form.jsp">Registrarse</a></center></td>
                            <td><center><input type="submit" value="Entrar"></center></td>
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

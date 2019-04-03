<%-- 
    Document   : register
    Created on : Apr 1, 2019, 10:59:35 PM
    Author     : John
--%>
<%@taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- En caso de que exista una sesion iniciada, redirecciono a index.jsp. "NO tiene caso mostrar este formulario cuando hay una sesion iniciada --%>
<t:if test="${sessionScope['sessionEmail']!=null}">
    <% response.sendRedirect("index.jsp");%>
</t:if>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
    </head>
    <body>
        <h1>CREAR CUENTA</h1>
        <p><a href="login.jsp">Iniciar Sesion</a></p>
        <p style="color: #ff0000">${sessionScope['error']}</p>
        <form action="Register" method="post">
            <p>Email: <input type="text" name="Alias"></p>
            <p>Nombre: <input type="text" name="Nombre"></p>
            <p>Apellido: <input type="text" name="Apellido"></p>
            <p>Fecha de Nacimiento <input type="date" name="Fecha_nac"></p>
            <p>Contraseña: <input type="password" name="Contrasenia"></p>
            <p>Confirma contraseña <input type="password" name="Contrasenia2"></p>
            <p>Pregunta Secreta: <input type="text" name="Pregunta"></p>
            <p>Respuesta Secreta: <input type="text" name="Rsecreta"></p>
            <p><input type="submit" value="Entrar"></p>
        </form>
    </body>
</html>

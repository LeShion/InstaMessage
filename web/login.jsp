<%-- 
    Document   : login
    Created on : Apr 1, 2019, 10:59:23 PM
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
        <title>Iniciar Sesion</title>
    </head>
    <body>
        <h1>Iniciar Sesion</h1>
        <p><a href="register.jsp">Registrate</a></p>
        <p style="color: #ff0000">${sessionScope['error']}</p>
        <form action="Login" method="post">
            <p>Email: <input type="text" name="Alias"></p>
            <p>Contraseña: <input type="password" name="Contrasenia"></p>
            <p><input type="submit" value="Entrar"></p>
        </form>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>InstaMessage</title>
    </head>
    <body>
<div style="text-align: center;">
    <%
        User user_of_InstaMessage = new User();
            user_of_InstaMessage.GetUser();   
    %>
<h2>
Lo sentimos, <%= user_of_InstaMessage.getUser()%><br>
    no tienes mensajes
</h2>
<a href="index.jsp">VOLVER AL INICIO</a>
</div>
</body>
</html>

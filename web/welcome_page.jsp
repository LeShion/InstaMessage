<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
        
        <%  
            HttpSession sessionUser=request.getSession(false);  
            String us=(String)sessionUser.getAttribute("user");
            
            User user_of_InstaMessage = new User();
            user_of_InstaMessage.setUser(us);
            user_of_InstaMessage.GetUser();
            
            out.print("Bienvenido    ");
            out.print(user_of_InstaMessage.getFirst_name());
            out.print(" ");
            out.print(user_of_InstaMessage.getLast_name());
            out.print(" !!!");
        %>
                
        <br><br>
        <a href="logout.jsp">Cerrar Sesion</a>
        <br><br>
        
        <div style="position: relative">
            <div style="position: fixed ; bottom: 0 ; width:100% ; text-align:center ">
                
            </div>
        </div>    
                    
    </body>
</html>

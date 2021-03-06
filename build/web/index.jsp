<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>InstaMessageMail</title>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet"/>

  <!-- Custom styles -->
  <link href="css/simple-sidebar.css" rel="stylesheet">
  <link href="css/all.css" rel="stylesheet" type="text/css"/>
  <link rel="shortcut icon" href="">
</head>

<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-dark text-white border-right" id="sidebar-wrapper">
         
        <%  
            HttpSession sessionUser=request.getSession(false);  
            String us=(String)sessionUser.getAttribute("user");
            
            User user_of_InstaMessage = new User();
            user_of_InstaMessage.setUser(us);
            user_of_InstaMessage.GetUser();     
        %>
      
        <div align="center" class="sidebar-heading"> <img src="imagen/User.png" width="40" height="40" alt=""/>
            <%= user_of_InstaMessage.getFirst_name()%> <%= user_of_InstaMessage.getLast_name() %><br>
            <h6><%= user_of_InstaMessage.getUser()%></h6>
        </div>
       
        <div align="center">
            <a href="newMesssage.jsp" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Mensaje Nuevo</a>
        </div><br>
        
      <div class="list-group list-group-flush">
        <a href="MensajeController?accion=BandejaEntrada" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/1.png" width="32" height="32" alt=""/>  Bandeja de Entrada</a>
        <a href="MensajeController?accion=BandejaSalida" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/2.png" width="32" height="32" alt=""/>  Bandeja de Salida</a>
        <a href="MensajeController?accion=Eliminados" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/3.png" width="32" height="32" alt=""/>  Correos Eliminados</a>
        
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-secondary" id="menu-toggle">Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="container-fluid" align="center">
                <h1 class="mt-2">InstaMessage</h1>
            </div>
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Inicio<span class="sr-only">(current)</span></a>
            </li>
         <!--    <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>-->
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Opciones
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="updateData.jsp">Actualizar Datos</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout.jsp">Cerrar Sesión</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
      
<div class="welcome" align="center" width="100%" height="100%">
    
    <h1 class="display-4">La nueva generación de correo electronico.</h1>
            <hr color="white" class="my-4">
            <h4>Conoce más acerca de nuestra plataforma: </h4>
</div>
<div class="info-container">
    <br><br>
    <p>InstaMessage es una plataforma de gestion de correo rápida y versátil,
            donde podras tener toda tu información al alcance de un click. </p>
    <br>
    <p>En nuestra plataforma puedes acceder a todos tus correos desde nuestro menu principal,
    donde puedes encontrar tu "Bandeja de Entrada", "Bandeja de Salida", tus "Correos Eliminados" y
    La "Clasificacion" de los mismos. Ya nada se perderá entre tus correos!</p>
    
    <img src="imagen/umg.png" width="200" height="200" alt=""/>
</div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery-3.4.0.min.js"></script>
  <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>

</html>

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
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles -->
  <link href="css/simple-sidebar.css" rel="stylesheet">

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
      
      <div class="sidebar-heading"> <img src="imagen/User.png" width="40" height="40" alt=""/> <%= user_of_InstaMessage.getFirst_name()%> <%= user_of_InstaMessage.getLast_name() %></div>
      <div class="list-group list-group-flush">
        <a href="inboxView.jsp" class="list-group-item list-group-item-action bg-dark text-white">Bandeja de Entrada</a>
        <a href="outboxView.jsp" class="list-group-item list-group-item-action bg-dark text-white">Bandeja de Salida</a>
        <a href="removedMailsView.jsp" class="list-group-item list-group-item-action bg-dark text-white">Correos Eliminados</a>
        <a href="draftView.jsp" class="list-group-item list-group-item-action bg-dark text-white">Borradores</a>
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
                <a class="dropdown-item" href="#">Actualizar Datos</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout.jsp">Cerrar Sesión</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>
      
<!--        <div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
          <img src="imagen/fondo2.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
            <h1 class="display-4">Bienvenido a Instamessage</h1>
            <hr color="white" class="my-4">
            <p>La nueva generacion de correo electronico</p>
        </div>
      </div>
      <div class="carousel-item">
          <img src="imagen/fondo2.jpg" class="d-block w-100" alt="...">
          <div class="carousel-caption d-none d-md-block">
          <h5>Second slide label</h5>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
        
    </div>-->

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
    donde puedes encontrar tu "Bandeja de Entrada", "Bandeja de Salida", tus "Correos Eliminados",
    La "Clasificacion" y tus "Borradores". Ya nada se perderá entre tus correos!</p>
</div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>

</html>

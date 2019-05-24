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
  <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
  <!-- Custom styles -->
  <link href="css/simple-sidebar.css" rel="stylesheet">
  <link href="css/all.css" rel="stylesheet" type="text/css"/>

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
      
      <div class="list-group list-group-flush">
        <a href="MensajeController?accion=BandejaEntrada" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/1.png" width="32" height="32" alt=""/>  Bandeja de Entrada</a>
        <a href="MensajeController?accion=BandejaSalida" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/2.png" width="32" height="32" alt=""/>  Bandeja de Salida</a>
        <a href="removedMailsView.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/3.png" width="32" height="32" alt=""/>  Correos Eliminados</a>
        <a href="draftView.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/4.png" width="32" height="32" alt=""/>  Borradores</a>
        <a href="Contacts.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/5.png" width="32" height="32" alt=""/>Contactos</a></div>
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
                <h2 class="mt-2">InstaMessage</h2>
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
    
    <h1 class="display-4">Nuevo Mensaje</h1>
            <hr color="white" class="my-4">
            
</div>    
        
        <div class="container">   
            <div class="col-md-14">        
                <form class="form-horizontal" action="MensajeController" method="post">
                                           
                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-address-card bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="fname" name="remitente" type="text" value="<%= user_of_InstaMessage.getUser()%>" readonly="readonly" class="form-control">
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-user bigicon"></i></span>
                            <div class="input-group mb-form col-md-8">
                              <input type="text" class="form-control" name="destinatario" placeholder="Destinatario" aria-label="Recipient's username" aria-describedby="basic-addon2">
                              <div class="input-group-append">
                                <span class="input-group-text" id="basic-addon2">@instam.com</span>
                              </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <span class="col-md-1 col-md-offset-2 text-center"><i class="fa fa-ad bigicon"></i></span>
                            <div class="col-md-8">
                                <input id="email" name="asunto" type="text" placeholder="Asunto" class="form-control">
                            </div>
                        </div><br>

                        <div class="form-group">
                            <div class="col-md-8">
                                <textarea class="form-control" id="message" name="mensaje" placeholder="Ingresa tu mensaje que no sea mayor a 800 palabras." rows="7"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12 text-center">
                                <button type="submit" class="btn btn-primary btn-lg" name="accion" value="EnviarNuevo">Enviar</button>
                                <button id="btn1" type="reset" class="btn btn-danger btn-lg">Borrar</button>
                            </div>
                        </div>
                </form>
            </div>
        </div>
    <!-- /#page-content-wrapper -->

</div>
                            
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="js/jquery-3.4.0.min.js"></script>
  <script src="js/bootstrap.bundle.min.js" type="text/javascript"></script>
  <script src="js/sweetalert2.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
    
    $("#btn1").click(function (){
        	swal("Borrado", "Has borrado los datos", "error");
                timer: 100000;
    	});

  </script>

</body>

</html>
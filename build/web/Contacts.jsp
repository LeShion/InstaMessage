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

</head>

<body>
  <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>
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
    
    <h1 class="display-4">Contactos</h1>
            <hr color="white" class="my-4">
            
</div>
<div class="info-container">
    
       <div align="center">
           
      <div class="col-lg-8">
          <form id="form3" action="ContactoController" method="post" class="text-center" style="color: #757575;">
              
              <div class="form-row">
                    <div class="col">
                      
                        <div class="md-form">
                            <input style="" type="text" name="user" class="form-control" placeholder="Usuario">
                        </div>
                        
                        <div class="md-form">
                             <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit" name="accion" value="agregar">Agregar Contacto</button>
                        </div>
                    </div>
                </div><br>
              
          </form>
        
      </div>
           
    </div><br> 
    
    <div class=col-md-14>
    
    <form id="form-list-client">

    <table class="table table-bordered table-condensed table-hover">
        <thead class="thead-dark">
            <tr>
                <th>Contacto</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody id="form-list-client-body">
            <tr>
                <td></td>
                <td>
                    <a href="" title="Ver Contacto" class="btn btn-default btn-sm "> <i class="fa far fa-eye text-primary"></i> </a>                    
                    <a href="" title="Eliminar Contacto" class="btn btn-default btn-sm "> <i class="fa fa-trash-alt text-danger"></i> </a>
            </tr>
            
        </tbody>
    </table>
    </form>
    </div>
        
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
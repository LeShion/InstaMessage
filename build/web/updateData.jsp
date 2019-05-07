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
  <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
  
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
      
      <div class="sidebar-heading"> <img src="imagen/User.png" width="40" height="40" alt=""/>
            <%= user_of_InstaMessage.getFirst_name()%> <%= user_of_InstaMessage.getLast_name() %><br>
            <h6><%= user_of_InstaMessage.getUser()%></h6>
      </div>
      <div class="list-group list-group-flush">
        <a href="inboxView.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/1.png" width="32" height="32" alt=""/>  Bandeja de Entrada</a>
        <a href="outboxView.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/2.png" width="32" height="32" alt=""/>  Bandeja de Salida</a>
        <a href="removedMailsView.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/3.png" width="32" height="32" alt=""/>  Correos Eliminados</a>
        <a href="draftView.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/4.png" width="32" height="32" alt=""/>  Borradores</a>
        <a href="Contacts.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/5.png" width="32" height="32" alt=""/>Contactos</a>  
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
        
    <div class="card">

        <h5 class="card-header info-color white-text text-center py-4">
            <strong>Actualización de Datos</strong>
        </h5><br>


        <div class="card-body px-lg-5 pt-0">

            <form class="text-center" style="color: #757575;">

                <div class="form-row">
                    <div class="col">
                        <!-- First name -->
                        <div class="md-form">
                            <input type="text" id="materialRegisterFormFirstName" class="form-control" value="<%= user_of_InstaMessage.getFirst_name()%>">
                            <label>Primer Nombre</label>
                        </div>
                    </div>
                    <div class="col">
                        <!-- Last name -->
                        <div class="md-form">
                            <input type="email" id="materialRegisterFormLastName" class="form-control" value="<%= user_of_InstaMessage.getLast_name()%>">
                            <label>Primer Apelido</label>
                        </div>
                    </div>
                </div><br>


                <div class="input-group mb-form">
                    <input type="text" class="form-control" value="<%= user_of_InstaMessage.getUser()%>" readonly="readonly" aria-label="Recipient's username" aria-describedby="basic-addon2">
                </div>
                <label>Usuario</label>
                

                <div class="md-form">
                    <br>
                    <input type="password" value="<%= user_of_InstaMessage.getPwd()%>" id="materialRegisterFormPassword" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                    <label>Password</label>
                </div><br>
                
                <div class="md-form">
                    <br>
                    <input type="text" value="<%= user_of_InstaMessage.getPsecreta()%>" id="materialRegisterFormPassword" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                    <label>pregunta Secreta</label>
                </div><br>


                <select class="browser-default custom-select mb-form">
                    <option value="" disabled>Pregunta Secreta</option>
                    <option value="1" selected>Feedback</option>
                    <option value="2">Report a bug</option>
                    <option value="3">Feature request</option>
                    <option value="4">Feature request</option>
                </select>
                <label>Pregunta Secreta</label>
                
 
                <div class="md-form">
                    <br>
                    <input type="password" id="materialRegisterFormPassword" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                    <label>Respuesta Secreta</label>
                </div><br>


                <div class="md-form">
                    <input type="date" id="materialRegisterFormPassword" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                    <label>Fecha de Nacimiento</label>
                </div>

                <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Actualizar</button>

                <hr>

            </form>


        </div>

    </div>        
        
<div class="info-container">
        
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

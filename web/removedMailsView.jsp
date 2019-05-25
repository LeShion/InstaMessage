<%@page import="java.util.ArrayList"%>
<%@page import="beans.Mensaje"%>
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
    
    <h1 class="display-4">Correos Eliminados</h1>
            <hr color="white" class="my-4">
            
</div>
<div class="info-container">
    
    <div align="center">
      <div class="col-lg-8">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Ingresa correo">
          <span class="input-group-btn">
            <button class="btn btn-primary" type="button">Buscar</button>
          </span>
        </div>
      </div>
    </div><br>
    
    <div class=col-md-14>
    
    <form id="form-list-client">

    <table id="SortT" class="table table-striped table-bordered table-sm">
        <thead class="thead-dark">
            <tr>
                <th onclick="sortTable(0)" class="th-sm">Fecha de Recibido</th>
                <th onclick="sortTable(1)" class="th-sm">Asunto</th>
                <th onclick="sortTable(2)" class="th-sm">Remitente</th>
                <th onclick="sortTable(3)" class="th-sm">Estado</th> 
                <th onclick="sortTable(4)" class="th-sm">Acción</th>
            </tr>
        </thead>
        <%
            ArrayList<Mensaje> lista =(ArrayList<Mensaje>) request.getAttribute("lista");
            for(int i=0; i<lista.size(); i++){
                Mensaje e = lista.get(i);
                
               

        %>
        <tbody id="form-list-client-body">
            <tr>
                <td><%= e.getFecha() %></td>
                <td><%= e.getAsunto() %></td>
                <td><%= e.getRemitente() %></td>
                <td><%= e.getNameStatus() %></td>
                <td>
                    <a href="index.jsp" title="Ver Correo" class="btn btn-default btn-sm "> <i class="fa fa-envelope-open text-primary"></i> </a>                    
                    <a href="MensajeController?accion=EliminacionP&id=<%= e.getId() %>" " title="Eliminar Correo Permanente" class="btn btn-default btn-sm "> <i class="fa fa-ban text-danger"></i> </a>
                    <a href="MensajeController?accion=Eliminar&id=<%= e.getId() %>" " title="Recuperar Correo" class="btn btn-default btn-sm "> <i class="fa fa-arrow-alt-circle-up text-success"></i> </a>
                    
                    
                </td>
            </tr>
            <%
            }
            %>
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
  <script>
        function sortTable(n) {
          var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
          table = document.getElementById("SortT");
          switching = true;
          dir = "asc";
          while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
              shouldSwitch = false;
              x = rows[i].getElementsByTagName("TD")[n];
              y = rows[i + 1].getElementsByTagName("TD")[n];
              if (dir == "asc") {
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                  shouldSwitch = true;
                  break;
                }
              } else if (dir == "desc") {
                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                  shouldSwitch = true;
                  break;
                }
              }
            }
            if (shouldSwitch) {
              rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
              switching = true;
              switchcount ++;
            } else {
              if (switchcount == 0 && dir == "asc") {
                dir = "desc";
                switching = true;
              }
            }
          }
        }
    </script>
</body>

</html>

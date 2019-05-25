<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="beans.Mensaje"%>
<%@page import="dao.MensajeDAO"%>
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
  <script src="js/jquery-3.4.0.min.js" type="text/javascript"></script>
  <script src="js/popper.min.js" type="text/javascript"></script>
  <script src="js/bootstrap.min.js" type="text/javascript"></script>
  <script>
      $(document).ready(function()
      {
         $("#myModal").modal("show");
      });
  </script>
  <!-- Custom styles -->
  <link href="css/simple-sidebar.css" rel="stylesheet">
  <link href="css/all.css" rel="stylesheet" type="text/css"/>
  <script src="js/sweetalert.min.js" type="text/javascript"></script>
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
        <a href="MensajeController?accion=Eliminados"  class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/3.png" width="32" height="32" alt=""/>  Correos Eliminados</a>
        <!--<a href="draftView.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/4.png" width="32" height="32" alt=""/>  Borradores</a>
        <a href="Contacts.jsp" class="list-group-item list-group-item-action bg-dark text-white"><img src="imagen/5.png" width="32" height="32" alt=""/>Contactos</a>--> 
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

<div class="welcome" align="center" width="100%" height="100%">
    
    <h1 class="display-4">Bandeja de Entrada</h1>
            <hr color="white" class="my-4">
            
</div>
<div class="info-container">
    
    <div align="center">
      <div class="col-lg-8">
        <div class="input-group">
            <input id="searchTerm" type="text" class="form-control" placeholder="Busca por Asunto, Fecha, Remitente o Estado ! Solo Escribe lo que quieras buscar!" onkeyup="doSearch()">
        </div>
      </div>
    </div><br>
    
    <div class=col-md-14>
    <form id="form-list-client" action="MensajeController" method="post">
    <table id="SortT" class="table table-striped table-bordered table-sm">
        <thead class="thead-dark">
            <tr>
                <th onclick="sortTable(0)"class="th-sm">Fecha de Recibido</th>
                <th onclick="sortTable(1)"class="th-sm">Asunto</th>
                <th onclick="sortTable(2)"class="th-sm">Remitente</th>
                <th onclick="sortTable(3)"class="th-sm">Estado</th> 
                <th onclick="sortTable(4)"class="th-sm">Acción</th>
            </tr>
        </thead>
        <%
            ArrayList<Mensaje> lista =(ArrayList<Mensaje>) request.getAttribute("lista");
            for(int i=0; i<lista.size(); i++){
                Mensaje e = lista.get(i);
                
               if(request.getAttribute("lista2")!=null){
               String clave = Integer.toString(e.getId());
                if(request.getAttribute("lista2").equals(clave)){
                    
                
        %>
        <div class="modal fade right" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true" data-backdrop="false">
            <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
              <div class="modal-content">
             
                <!--Body-->
                <div class="modal-body">
                  <div class="text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true" class="white-text">×</span>
                    </button> 
                    <i class="far fa-file-alt fa-4x mb-3 animated rotateIn"></i> 
                    <h2><strong> De: </strong><%= e.getRemitente() %></h2> 
                    <input style="display: none" id="email" name="destinatario" type="text" value="<%= e.getRemitente()%>" readonly="readonly" class="form-control">
                    <input style="display: none" id="email" name="remitente" type="text" value="<%= user_of_InstaMessage.getUser()%>" readonly="readonly" class="form-control">
                           
                    <p>
                      <strong>Fecha de Recibido: </strong><%= e.getFecha()%>
                    </p>
                    <p>
                      <strong>Asunto: </strong>
                      <input id="email" name="asunto" type="text" value="<%= e.getAsunto() %>" readonly="readonly" class="form-control">
                    </p>
                    
                    
                    <div class="md-form">
                    <strong>Mensaje: </strong>
                    <textarea type="text" id="form79textarea" class="md-textarea form-control" readonly="readonly" rows="2"><%= e.getMensaje() %></textarea>
                    <input style="display: none" id="email" name="mensajeR" type="text" value="<%= e.getMensaje() %>" readonly="readonly" class="form-control">
                    </div>
                    
                  </div>

                  <hr>

                  <p class="text-center">
                    <strong>¿Deseas responder a <%= e.getRemitente() %>?</strong>
                  </p>
                  <!--Basic textarea-->
                  <div class="md-form">
                    <textarea type="text" id="form79textarea" name="mensaje" class="md-textarea form-control" placeholder="Ingresa tu mensaje que no sea mayor a 800 palabras." rows="6"></textarea>
                    <label for="form79textarea">Gracias por responder!</label>
                  </div>

                </div>

                <!--Footer-->
                <div class="modal-footer justify-content-center">
                    <button type="submit" class="btn btn-primary btn-lg" name="accion" value="respuesta">Responder</button>
                    <button id="btn1" type="reset" class="btn btn-danger btn-lg">Borrar</button>
                </div>
              </div>
            </div>
          </div>
        
        <%
        }clave="";}
        %>
        <tbody id="form-list-client-body">
            <tr>
                <td><%= e.getFecha() %></td>
                <td><%= e.getAsunto() %></td>
                <td><%= e.getRemitente() %></td>
                <td><%= e.getNameStatus() %></td>
                <td>
                    <a href="MensajeController?accion=Mostrar_Mensajes&id=<%= e.getId() %>" title="Ver Correo" class="btn btn-default btn-sm "> <i class="fa fa-envelope-open text-primary"></i> </a>                    
                    <a href="MensajeController?accion=Eliminar&id=<%= e.getId() %>" " title="Eliminar Correo" class="btn btn-default btn-sm "> <i class="fa fa-trash-alt text-danger"></i> </a>
                    <a href="MensajeController?accion=Importante&id=<%= e.getId() %>" title="Marcar Como Importante" class="btn btn-default btn-sm "> <i class="fa fa-star text-warning"></i> </a>
                    <a href="MensajeController?accion=Urgente&id=<%= e.getId() %>" title="Marcar Como Urgenge" class="btn btn-default btn-sm "> <i class="fa fa-exclamation-circle text-success"></i> </a>
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
  <script src="js/popper.min.js" type="text/javascript"></script>

        <!--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>-->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>

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
    
        <script>
		function doSearch()
		{
			var tableReg = document.getElementById('SortT');
			var searchText = document.getElementById('searchTerm').value.toLowerCase();
			var cellsOfRow="";
			var found=false;
			var compareWith="";
 
			// Recorremos todas las filas con contenido de la tabla
			for (var i = 1; i < tableReg.rows.length; i++)
			{
				cellsOfRow = tableReg.rows[i].getElementsByTagName('TD');
				found = false;
				// Recorremos todas las celdas
				for (var j = 0; j < cellsOfRow.length && !found; j++)
				{
					compareWith = cellsOfRow[j].innerHTML.toLowerCase();
					// Buscamos el texto en el contenido de la celda
					if (searchText.length == 0 || (compareWith.indexOf(searchText) > -1))
					{
						found = true;
					}
				}
				if(found)
				{
					tableReg.rows[i].style.display = '';
				} else {
					// si no ha encontrado ninguna coincidencia, esconde la
					// fila de la tabla
					tableReg.rows[i].style.display = 'none';
				}
			}
		}
     </script>
    
</body>

</html>

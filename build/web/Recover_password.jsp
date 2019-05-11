<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        
        <title>Formulario de Registro</title>
    </head>
    <body>
        
    <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>

    <div class="card">

        <h5 class="card-header info-color white-text text-center py-4">
            <strong>Recuperación de Contraseña</strong>
        </h5><br>


        <div class="card-body px-lg-5 pt-0">

            <form id="form2" action="LoginController" method="post" class="text-center" style="color: #757575;">

                <div class="input-group mb-form">
                  <input type="text" name="user" class="form-control" placeholder="Usuario">
                  <div class="input-group-append">
                    <span class="input-group-text">@instam.com</span>
                  </div>
                </div>
                <label>Usuario</label>
                
                <select name="pSecreta" class="form-control">
                    <option value="" disabled selected>Pregunta Secreta</option>
                    <option value="Nombre de mascota favorita">Nombre de mascota favorita</option>
                    <option value="Mejor amigo de la infancia">Mejor amigo de la infancia</option>
                </select>
                <label>Pregunta Secreta</label>
                
 
                <div class="md-form">
                    <br>
                    <input type="password" name="rSecreta" class="form-control">
                    <label>Respuesta Secreta</label>
                </div><br>
                
                <%
                if (request.getAttribute("result")!=null)
                        {
                %>
            
                <div class="md-form">
                    <br>
                    <input type="text" name="pwd" value="<%=request.getAttribute("result")%>" readonly="" class="form-control">
                    <label>Password</label>
                </div><br>
                <%
                }
                %>
               
                <div class="form-row">
                    <div class="col">
                        <!-- First name -->
                        <div class="md-form">
                             <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit" name="accion" value="recuperar">Registrar</button>
                        </div>
                    </div>
                    <div class="col">
                        <!-- Last name -->
                        <div class="md-form">
                            <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="reset">Borrar</button>
                        </div>
                    </div>
                    <div class="col">
                        <!-- Last name -->
                        <div class="md-form">
                            <a href="login_form.jsp" class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0">Regresar</a>
                            
                        </div>
                    </div>
                </div>
                
                <hr>

                <p>Ya tienes
                    <em>cuenta</em> haz click en
                    <a href="" target="_blank">!Ingresar¡</a>

            </form>

        </div>

    </div>
    
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="js/popper.min.js"></script>
    
    <script src="js/sweetalert.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
  

    
    </body>
</html>
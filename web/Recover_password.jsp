<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <title>Formulario de Registro</title>
    </head>
    <body>
        
    <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>

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
                            <input type="text" id="materialRegisterFormFirstName" class="form-control">
                            <label>Primer Nombre</label>
                        </div>
                    </div>
                    <div class="col">
                        <!-- Last name -->
                        <div class="md-form">
                            <input type="email" id="materialRegisterFormLastName" class="form-control">
                            <label>Primer Apelido</label>
                        </div>
                    </div>
                </div><br>


                <div class="input-group mb-form">
                  <input type="text" class="form-control" placeholder="username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                  <div class="input-group-append">
                    <span class="input-group-text" id="basic-addon2">@instam.com</span>
                  </div>
                </div>
                <label>Usuario</label>
                

                <div class="md-form">
                    <br>
                    <input type="password" id="materialRegisterFormPassword" class="form-control" aria-describedby="materialRegisterFormPasswordHelpBlock">
                    <label>Password</label>
                </div><br>


                <select class="browser-default custom-select mb-form">
                    <option value="" disabled selected>Choose option</option>
                    <option value="1">Feedback</option>
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

                <p>No tienes
                    <em>cuenta</em> es hora de
                    <a href="" target="_blank">!Registrarse¡</a>

            </form>


        </div>

    </div>
            
    <script src="js/jquery-3.4.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.js" type="text/javascript"></script>
  
    </body>
</html>
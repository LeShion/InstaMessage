<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/sweetalert.min.js" type="text/javascript"></script>
        
        <title>Formulario de Registro</title>
    </head>
    <body>
        
        <jsp:useBean id="user" scope="request" class="beans.User"></jsp:useBean>               
        
        <div class="card">

        <h5 class="card-header info-color white-text text-center py-4">
            <strong>Registro de Nuevo Usuario</strong>
        </h5><br>


        <div class="card-body px-lg-5 pt-0">

            <form id="form2" action="RegisterController" method="post" class="text-center" style="color: #757575;">

                <div class="form-row">
                    <div class="col">
                        <!-- First name -->
                        <div class="md-form">
                            <input type="text" name="first_name" class="form-control">
                            <label>Primer Nombre</label>
                        </div>
                    </div>
                    <div class="col">
                        <!-- Last name -->
                        <div class="md-form">
                            <input type="text" name="last_name" class="form-control">
                            <label>Primer Apelido</label>
                        </div>
                    </div>
                </div><br>


                <div class="input-group mb-form">
                  <input type="text" name="user" class="form-control" placeholder="Usuario">
                  <div class="input-group-append">
                    <span class="input-group-text">@instam.com</span>
                  </div>
                </div>
                <label>Usuario</label>
                

                <div class="md-form">
                    <br>
                    <input type="password" name="pwd" class="form-control">
                    <label>Password</label>
                </div><br>


                <select name="pSecreta" class="form-control">
                    <option value="" disabled selected>Pregunta Secreta</option>
                    <option value="Nombre de mascota favorita">Nombre de mascota favorita</option>
                    <option value="Mejor amigo de la infancia">Mejor amigo de la infancia</option>
                    <option value="Equipo de futbol favorito"> Equipo de futbol favorito</option>
                    <option value="Sabor favorito de helado"> Sabor favorito de helado</option>
                    <option value="Marca de Auto favorita"> Marca de Auto favorita</option>
                </select>
                <label>Pregunta Secreta</label>
                
 
                <div class="md-form">
                    <br>
                    <input type="password" name="rSecreta" class="form-control">
                    <label>Respuesta Secreta</label>
                </div><br>


                <div class="md-form">
                    <input type="date" name="fecha_nac" class="form-control">
                    <label>Fecha de Nacimiento</label>
                </div>

               
                <div class="form-row">
                    <div class="col">
                        <!-- First name -->
                        <div class="md-form">
                            <button  id="btnSA_1" class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit" name="accion" value="insertar">Registrar</button>
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
          

    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
    <script src="js/popper.min.js" type="text/javascript"></script>
    
    <script>
        $("#btnSA_1").click(function (){			        				
			swal("Registro con Éxito", "Ahora Puedes Iniciar Sesión", "success");
    	});
    </script>
    
    </body>
</html>

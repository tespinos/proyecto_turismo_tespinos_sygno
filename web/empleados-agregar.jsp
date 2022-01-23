<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<title>Nuevo empleado</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/css/style.css">
  </head>
  <body>
    <%
        HttpSession miSesion = request.getSession();
        String usu = (String) miSesion.getAttribute("usuarioLogin");
        if (usu == null) {
            response.sendRedirect("index.jsp");
        }
        else {
    %>
	<div class="wrapper d-flex align-items-stretch">
		<script src="assets/js/menu.js"></script>

        <!-- Page Content  -->
        <div id="content" class="p-4 p-md-5 pt-5">
            <script src="assets/js/breadcrums.js"></script>
            <h2 class="mb-4">Crear nuevo empleado</h2>

            <form action="SvEmpleado" class="edit-form" method="POST">
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" name="nombre" id="nombre">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="apellido">Apellido</label>
                    <input type="text" class="form-control" name="apellido" id="apellido">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="direccion">Dirección</label>
                    <input type="text" class="form-control" name="direccion" id="direccion">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="dni">DNI</label>
                    <input type="number" class="form-control" name="dni" id="dni">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="fechaNac">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" name="fechaNac" id="fechaNac">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="nacionalidad">Nacionalidad</label>
                    <input type="text" class="form-control" name="nacionalidad" id="nacionalidad">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="celular">Celular</label>
                    <input type="text" class="form-control" name="celular" id="celular">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email" id="email">
                  </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="cargo">Cargo</label>
                      <input type="text" class="form-control" name="cargo" id="cargo">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="sueldo">Sueldo</label>
                      <input type="number" class="form-control" name="sueldo" id="sueldo">
                    </div>
                </div>
                <hr>
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="usuario">Nombre de Usuario</label>
                      <input type="text" class="form-control" name="usuario" id="usuario">
                    </div>
                    <div class="form-group col-md-6">
                      <label for="contrasenia">Contraseña</label>
                      <input type="password" class="form-control" name="contrasenia" id="contrasenia">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
              </form>
      
        </div>
	</div>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>
    <%
        }
    %>
  </body>
</html>

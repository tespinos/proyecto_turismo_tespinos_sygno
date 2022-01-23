<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<title>Nuevo servicio</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
            <h2 class="mb-4">Crear nuevo servicio</h2>

            <form action="SvServicioTuristico" class="edit-form" method="POST">
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="nombreServicio">Nombre</label>
                    <input type="text" class="form-control" id="nombreServicio" name="nombre">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="descripcionBreve">Descripción breve</label>
                    <input type="text" class="form-control" id="descripcionBreve" name="descripcion">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="destino">Destino</label>
                    <input type="text" class="form-control" id="destino" name="destino">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="fecha">Fecha</label>
                    <input type="date" class="form-control" id="fecha" name="fecha">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="costo">Costo</label>
                    <input type="number" class="form-control" id="costo" name="costo">
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
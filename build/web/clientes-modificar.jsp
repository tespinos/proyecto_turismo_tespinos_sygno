<%@page import="Logica.Controladora"%>
<%@page import="Logica.Cliente"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<title>Modificar cliente</title>
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
            <h2 class="mb-4">Modificar cliente</h2>

            <form action="SvModificarCliente" method="GET" class="edit-form">
                <%
                    Controladora control = new Controladora();
                    Cliente cliente = (Cliente) miSesion.getAttribute("cliente");
                    {
                %>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%=cliente.getNombre()%>">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="apellido">Apellido</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value="<%=cliente.getApellido()%>">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="direccion">Dirección</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" value="<%=cliente.getDireccion()%>">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="dni">DNI</label>
                    <input type="number" class="form-control" id="dni" name="dni" value="<%=cliente.getDni()%>">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="fechaNac">Fecha de Nacimiento</label>
                    <input type="date" class="form-control" id="fechaNac" name="fechaNac" value="<%=control.convertirDateToString(cliente.getFecha_nac())%>">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="nacionalidad">Nacionalidad</label>
                    <input type="text" class="form-control" id="nacionalidad" name="nacionalidad" value="<%=cliente.getNacionalidad()%>">
                  </div>
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="celular">Celular</label>
                    <input type="text" class="form-control" id="celular" name="celular" value="<%=cliente.getCelular()%>">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%=cliente.getEmail()%>">
                  </div>
                </div>
                <input type="hidden" name="id" value="<%=cliente.getId_persona()%>">
                <button type="submit" class="btn btn-primary">Guardar</button>
                <%}%>
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
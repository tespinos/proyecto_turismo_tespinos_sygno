<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Inicio</title>
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
            <h2 class="mb-4">Agencia de Turismo</h2>
            <img src="assets/images/draw1.png" width="600px" height="400px">
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
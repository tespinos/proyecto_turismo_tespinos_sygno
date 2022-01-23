<%@page import="Logica.ServicioTuristico"%>
<%@page import="Logica.Controladora"%>
<%@page import="Logica.PaqueteTuristico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<title>Paquetes</title>
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

    <h2 class="mb-4">Listado de Paquetes</h2>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">Paquete Nro.</th>
            <th scope="col">Servicios incluídos</th>
            <th scope="col">Costo</th>
            <th scope="col" colspan="2">Acciones</th>
            <th scope="col">
                <a href="paquetes-agregar.jsp">
                  <button class="btn-table-header"><i class="fa fa-plus"></i> Nuevo</button>
                </a>
            </th>
          </tr>
        </thead>
        <tbody>
            <% Controladora control = new Controladora();
                  List<PaqueteTuristico> listaPaquetes = control.traerPaquetesTuristicos();
                  if (!listaPaquetes.isEmpty()) {
                    for (PaqueteTuristico paquete : listaPaquetes) {
            %>
          <tr>
            <td>
                <%=paquete.getCodigo_paquete()%>
            </td>
            <%
                Double costo = paquete.getCosto_paquete();
                List<ServicioTuristico> listaServicios = paquete.getLista_servicios_incluidos();

                int id = paquete.getCodigo_paquete();
            %>
            <td><%
                    for (ServicioTuristico servicio : listaServicios) {
                %>
                - <%=servicio.getNombre()%> <br>
                <%}%>
            </td>
            <td><%=costo%></td>
            <td>
              <form name="modificarPaquete" action="SvModificarPaqueteTuristico" method="POST">
                  <input type="hidden" name="id" value="<%=id%>">
                  <button type="submit" class="btn-table"><i class="fa fa-edit"></i></button>
              </form>
            </td>
            <td>
              <form name="eliminarPaquete" action="SvEliminarPaqueteTuristico" method="POST">
                <input type="hidden" name="id" value="<%=id%>">
                <button type="submit" class="btn-table"><i class="fa fa-trash"></i></button>
              </form>
            </td>
          </tr>
            <%
                    }
                } else {
              %>
                <tr>
                    <td colspan="6">
                        No se encontraron resultados.
                    </td>
                </tr>
                <%}%>
        </tbody>
      </table>
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
<%@page import="Logica.ServicioTuristico"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<title>Servicios</title>
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

    <h2 class="mb-4">Listado de Servicios</h2>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Descripción</th>
            <th scope="col">Fecha</th>
            <th scope="col">Destino</th>
            <th scope="col">Costo</th>
            <th scope="col" colspan="3">Acciones</th>
            <th scope="col">
                <a href="servicios-agregar.jsp">
                  <button class="btn-table-header"><i class="fa fa-plus"></i> Nuevo</button>
                </a>
            </th>
          </tr>
        </thead>
        <tbody>
            <% Controladora control = new Controladora();
                  List<ServicioTuristico> listaServicios = control.traerServiciosTuristicos();
                  if (!listaServicios.isEmpty()) {
                    for (ServicioTuristico servicio : listaServicios) {
            %>
          <tr>
            <%
                String nombre = servicio.getNombre();
                String fecha = control.convertirDateToString(servicio.getFecha_servicio());
                String descripcion = servicio.getDescripcion_breve();
                String destino = servicio.getDestino_servicio();
                Double costo = servicio.getCosto_servicio();

                int id = servicio.getCodigo_servicio();
            %>
            <td><%=nombre%></td>
            <td><%=descripcion%></td>
            <td><%=fecha%></td>
            <td><%=destino%></td>
            <td><%=costo%></td>
            <td>
              <form name="modificarServicio" action="SvModificarServicioTuristico" method="POST">
                  <input type="hidden" name="id" value="<%=id%>">
                  <button type="submit" class="btn-table"><i class="fa fa-edit"></i></button>
              </form>
            </td>
            <td>
              <form name="eliminarServicio" action="SvEliminarServicioTuristico" method="POST">
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
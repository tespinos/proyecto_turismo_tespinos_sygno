<%@page import="Logica.PaqueteTuristico"%>
<%@page import="Logica.ServicioTuristico"%>
<%@page import="Logica.Cliente"%>
<%@page import="Logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Venta"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html>
<html lang="es">
  <head>
  	<title>Ventas</title>
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

    <h2 class="mb-4">Listado de Ventas</h2>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">Fecha</th>
            <th scope="col">Cliente</th>
            <th scope="col">Servicio/Paquete</th>
            <th scope="col">Medio de Pago</th>
            <th scope="col">Empleado</th>
            <th scope="col" colspan="3">Acciones</th>
            <th scope="col">
                <a href="ventas-agregar.jsp">
                  <button class="btn-table-header"><i class="fa fa-plus"></i> Nuevo</button>
                </a>
            </th>
          </tr>
        </thead>
        <tbody>
            <% Controladora control = new Controladora();
                  List<Venta> listaVentas = control.traerVentas();
                  if (!listaVentas.isEmpty()) {
                    for (Venta venta : listaVentas) {
            %>
          <tr>
            <%
                String fecha = control.convertirDateToString(venta.getFecha_venta());
                String empleado = venta.getEmpleado().getNombre() + " " + venta.getEmpleado().getApellido();
                String cliente = venta.getCliente().getNombre() + " " + venta.getCliente().getApellido();
                String contratacion = "";

                if (venta.getServicio() != null) {
                    contratacion = venta.getServicio().getNombre();
                } else {
                    contratacion = "Paquete #" + String.valueOf(venta.getPaquete().getCodigo_paquete());
                }
                String medioDePago = venta.getMedio_pago();

                int id = venta.getNum_venta();
            %>
            <td><%=fecha%></td>
            <td><%=cliente%></td>
            <td><%=contratacion%></td>
            <td><%=medioDePago%></td>
            <td><%=empleado%></td>
            <td>
              <form name="modificarVenta" action="SvModificarVenta" method="POST">
                  <input type="hidden" name="id" value="<%=id%>">
                  <button type="submit" class="btn-table"><i class="fa fa-edit"></i></button>
              </form>
            </td>
            <td>
              <form name="eliminarVenta" action="SvEliminarVenta" method="POST">
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

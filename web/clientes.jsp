<%@page import="java.util.List"%>
<%@page import="Logica.Cliente"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <title>Clientes</title>
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

                <h2 class="mb-4">Listado de Clientes</h2>
      <table class="table table-hover">
        <thead>
          <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Fecha Nac.</th>
            <th scope="col">Dirección</th>
            <th scope="col">DNI</th>
            <th scope="col">Celular</th>
            <th scope="col">Acciones</th>
            <th scope="col">
                <a href="clientes-agregar.jsp">
                    <button class="btn-table-header"><i class="fa fa-plus"></i> Nuevo</button>
                </a>
            </th>
          </tr>
        </thead>
        <tbody>
            <% Controladora control = new Controladora();
            List<Cliente> listaClientes = control.traerClientes();
            if (listaClientes.isEmpty()) {
            %>
                <tr>
                    <td colspan="6">
                        No se encontraron resultados.
                    </td>
                </tr>
            <%
                }
                else {
                    for (Cliente cliente : listaClientes) {
            %>
          <tr>
              <% String nombre = cliente.getNombre() + " " + cliente.getApellido();
                String fechaNac = control.convertirDateToString(cliente.getFecha_nac());
                String direccion = cliente.getDireccion();
                String dni = cliente.getDni();
                String celular = cliente.getCelular();
                int id = cliente.getId_persona();
              %>
              <td><%=nombre%></td>
            <td><%=fechaNac%></td>
            <td><%=direccion%></td>
            <td><%=dni%></td>
            <td><%=celular%></td>
            <td>
                <form name="modificarCliente" action="SvModificarCliente" method="POST">
                    <input type="hidden" name="id" value="<%=id%>">
                    <button type="submit" class="btn-table"><i class="fa fa-edit"></i></button>
                </form>
            </td>
            <td>
                <form name="eliminarCliente" action="SvEliminarCliente" method="POST">
                    <input type="hidden" name="id" value="<%=id%>">
                    <button class="btn-table"><i class="fa fa-trash"></i></button>
                </form>
            </td>
          </tr>
        </tbody>
        <%
                }
            }
        %>
      </table>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>
    <%
        }
    %>
  </body>
</html>

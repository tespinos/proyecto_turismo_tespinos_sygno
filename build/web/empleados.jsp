<%@page import="java.util.Date"%>
<%@page import="Logica.Usuario"%>
<%@page import="Logica.Empleado"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<title>Empleados</title>
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
            <h2 class="mb-4">Listado de Empleados</h2>
            <table class="table table-hover">
              <thead>
                <tr>
                  <th scope="col">Nombre</th>
                  <th scope="col">Cargo</th>
                  <th scope="col">Fecha Nac.</th>
                  <th scope="col">Dirección</th>
                  <th scope="col">DNI</th>
                  <th scope="col">Celular</th>
                  <th colspan="3" scope="col">Acciones</th>
                  <th scope="col">
                    <a href="empleados-agregar.jsp">
                      <button class="btn-table-header"><i class="fa fa-plus"></i> Nuevo</button>
                    </a>
                  </th>
                </tr>
              </thead>
              <tbody>
                  <% Controladora control = new Controladora();
                  List<Empleado> listaEmpleados = control.traerEmpleados();
                  if (!listaEmpleados.isEmpty()) {
                    for (Empleado empleado : listaEmpleados) {
                  %>
                <tr>
                  <tr>
                    <%
                        String nombre = empleado.getNombre() + " " + empleado.getApellido();
                        String fechaNac = control.convertirDateToString(empleado.getFecha_nac());
                        String direccion = empleado.getDireccion();
                        String dni = empleado.getDni();
                        String celular = empleado.getCelular();
                        String cargo = empleado.getCargo();
                        
                        int id = empleado.getId_persona();
                        Usuario user = empleado.getUsuario();
                        int idUser = user.getUsuario_id();
                    %>
                    <td><%=nombre%></td>
                  <td><%=cargo%></td>
                  <td><%=fechaNac%></td>
                  <td><%=direccion%></td>
                  <td><%=dni%></td>
                  <td><%=celular%></td>
                  <td>
                    <form name="modificarEmpleado" action="SvModificarEmpleado" method="POST">
                        <input type="hidden" name="id" value="<%=id%>">
                        <input type="hidden" name="idUser" value="<%=idUser%>">
                        <button type="submit" class="btn-table"><i class="fa fa-edit"></i></button>
                    </form>
                  </td>
                  <td>
                    <form name="eliminarEmpleado" action="SvEliminarEmpleado" method="POST">
                      <input type="hidden" name="id" value="<%=id%>">
                      <input type="hidden" name="idUser" value="<%=idUser%>">
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

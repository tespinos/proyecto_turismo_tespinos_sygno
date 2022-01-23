<%@page import="Logica.PaqueteTuristico"%>
<%@page import="Logica.Controladora"%>
<%@page import="Logica.ServicioTuristico"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<title>Nuevo paquete</title>
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
            <h2 class="mb-4">Crear nuevo paquete</h2>

            <form action="SvPaqueteTuristico" class="edit-form" method="POST">
                <div class="form-row">
                    <fieldset class="form-group col-md-6">
                        <div class="row">
                          <legend class="col-form-label col-sm-2 pt-0">Servicios:</legend>
                          <div class="col-sm-10">
                            <%
                                Controladora control = new Controladora();
                                List<ServicioTuristico> listaServicios = control.traerServiciosTuristicos();
                                for (ServicioTuristico servicio : listaServicios) {
                            %>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="servicio" id="<%=servicio.getCosto_servicio()%>" value="<%=servicio.getCodigo_servicio()%>" onchange="habilitarGuardado()" onclick="calculaCostoTotal()">
                              <label class="form-check-label" for="<%=servicio.getNombre()%>">
                                <%=servicio.getNombre()%>
                              </label>
                            </div>
                            <%
                                }                               
                            %>
                          </div>
                        </div>
                    </fieldset>
                
                    <div class="form-group col-md-6">
                      <label for="costo">Costo</label>
                      <input type="number" class="form-control" id="costo" name="costo" value="" readonly>
                    </div>
                </div>
                    <button type="submit" class="btn btn-primary" id="guardar" disabled>Guardar</button>
                    <script>
                        function habilitarGuardado(){
                            var cont = 0;
                            var estado = document.getElementsByName("servicio");
                            for (var i = 0; i < estado.length; i++) {
                              if (estado[i].checked) {
                                  cont++;
                                  if (cont>1) {
                                    document.getElementById("guardar").disabled = false;
                                    break;
                                  }
                              }
                              else {
                                  document.getElementById("guardar").disabled = true;
                              }
                            }
                        }
                        
                        function calculaCostoTotal() {
                            var total = 0;
                            var estado = document.getElementsByName("servicio");
                            for (var i = 0; i < estado.length; i++) {
                              if (estado[i].checked) {
                                  total += parseFloat(estado[i].id);
                              }
                            }
                            total = total*0.90;
                            document.getElementById("costo").value = total;
                        }
                    </script>
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
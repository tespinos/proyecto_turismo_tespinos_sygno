<%@page import="Logica.Empleado"%>
<%@page import="Logica.Cliente"%>
<%@page import="Logica.ServicioTuristico"%>
<%@page import="Logica.PaqueteTuristico"%>
<%@page import="java.util.List"%>
<%@page import="Logica.Controladora"%>
<%@page import="Logica.Venta"%>
<%@page contentType="text/html"%>
<!DOCTYPE html>
<html lang="es">
  <head>
  	<title>Modificar venta</title>
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
            <h2 class="mb-4">Modificar venta</h2>

            <form action="SvModificarVenta" class="edit-form" method="GET">
                <%
                    Controladora control = new Controladora();
                    List<Empleado> listaEmpleados = control.traerEmpleados();
                    List<Cliente> listaClientes = control.traerClientes();
                    
                    Venta venta = (Venta) miSesion.getAttribute("venta");
                    {
                %>
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label for="empleado">Empleado</label>
                        <select class="form-control" id="empleado" name="empleado">
                            <option disabled="disabled">Seleccione...</option>
                            <option selected="true" value="<%=venta.getEmpleado().getId_persona()%>">
                                <%=venta.getEmpleado().getNombre() + " " + venta.getEmpleado().getApellido()%>
                            </option>
                            <%
                                for (Empleado empleado : listaEmpleados) {
                                    if (empleado.getId_persona() != venta.getEmpleado().getId_persona()) {
                            %>
                            <option value="<%=empleado.getId_persona()%>"><%=empleado.getNombre() + " " + empleado.getApellido()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="fecha">Fecha</label>
                        <input type="date" class="form-control" id="fecha" name="fecha" value="<%=control.convertirDateToString(venta.getFecha_venta())%>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="cliente">Cliente</label>
                        <select class="form-control" id="cliente" name="cliente">
                            <option disabled="disabled">Seleccione...</option>
                            <option selected="true" value="<%=venta.getCliente().getId_persona()%>">
                                <%=venta.getCliente().getNombre() + " " + venta.getCliente().getApellido()%>
                            </option>
                            <%
                                for (Cliente cliente : listaClientes) {
                                    if (cliente.getId_persona() != venta.getCliente().getId_persona()) {
                            %>
                            <option value="<%=cliente.getId_persona()%>"><%=cliente.getNombre() + " " + cliente.getApellido()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <%
                        if (venta.getServicio() != null) {
                    %>
                    <fieldset class="form-group col-md-6">
                        <div class="row">
                          <legend class="col-form-label col-md-4 pt-0">Servicio o Paquete:</legend>
                          <div class="col-sm-10">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="seleccionTipoVenta" id="seleccionServicio" value="servicio" checked>
                              <label class="form-check-label" for="exampleRadios1">
                                Servicio
                              </label>
                            </div>
                            <div class="form-check">
                            <input class="form-check-input" type="radio" name="seleccionTipoVenta" id="seleccionPaquete" value="paquete" onchange="habilitarPaquetes()">
                            <label class="form-check-label" for="exampleRadios2">
                                Paquete
                              </label>
                            </div>
                          </div>
                        </div>
                    </fieldset>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="servicio">Servicio</label>
                        <select class="form-control" id="servicioSelector" name="servicio">
                            <option disabled="disabled" value="1">Seleccione...</option>
                            <option selected="true" value="<%=venta.getServicio().getCodigo_servicio()%>">
                                <%=venta.getServicio().getNombre()+ " - $" + venta.getServicio().getCosto_servicio()%>
                            </option>
                            <%
                                List<ServicioTuristico> listaServicios = control.traerServiciosTuristicos();
                                for (ServicioTuristico servicio : listaServicios) {
                                    if (servicio.getCodigo_servicio() != venta.getServicio().getCodigo_servicio()) {
                            %>
                            <option value="<%=servicio.getCodigo_servicio()%>"><%=servicio.getNombre()+ " - $" + servicio.getCosto_servicio()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="paquete">Paquete</label>
                        <select class="form-control" id="paqueteSelector" name="paquete" disabled>
                            <option selected="true" disabled="disabled" value="1">Seleccione...</option>
                            <%
                                List<PaqueteTuristico> listaPaquetes = control.traerPaquetesTuristicos();
                                for (PaqueteTuristico paquete : listaPaquetes) {
                            %>
                            <option value="<%=paquete.getCodigo_paquete()%>"><%="Paquete #" + paquete.getCodigo_paquete()+ " - $" + paquete.getCosto_paquete()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <%
                    }
                    else {
                %>
                    <fieldset class="form-group col-md-6">
                        <div class="row">
                          <legend class="col-form-label col-md-4 pt-0">Servicio o Paquete:</legend>
                          <div class="col-sm-10">
                            <div class="form-check">
                              <input class="form-check-input" type="radio" name="seleccionTipoVenta" id="seleccionServicio" value="servicio">
                              <label class="form-check-label" for="exampleRadios1">
                                Servicio
                              </label>
                            </div>
                            <div class="form-check">
                            <input class="form-check-input" type="radio" name="seleccionTipoVenta" id="seleccionPaquete" value="paquete" onchange="habilitarPaquetes()" checked>
                            <label class="form-check-label" for="exampleRadios2">
                                Paquete
                              </label>
                            </div>
                          </div>
                        </div>
                    </fieldset>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="servicio">Servicio</label>
                        <select class="form-control" id="servicioSelector" name="servicio" disabled>
                            <option selected="true" disabled="disabled" value="1">Seleccione...</option>
                            <%
                                List<ServicioTuristico> listaServicios = control.traerServiciosTuristicos();
                                for (ServicioTuristico servicio : listaServicios) {
                            %>
                            <option value="<%=servicio.getCodigo_servicio()%>"><%=servicio.getNombre()+ " - $" + servicio.getCosto_servicio()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="paquete">Paquete</label>
                        <select class="form-control" id="paqueteSelector" name="paquete">
                            <option disabled="disabled" value="1">Seleccione...</option>
                            <option selected="true" value="<%=venta.getPaquete().getCodigo_paquete()%>">
                                <%="Paquete #" + venta.getPaquete().getCodigo_paquete()+ " - $" + venta.getPaquete().getCosto_paquete()%>
                            </option>
                            <%
                                List<PaqueteTuristico> listaPaquetes = control.traerPaquetesTuristicos();
                                for (PaqueteTuristico paquete : listaPaquetes) {
                                    if (paquete.getCodigo_paquete() != venta.getPaquete().getCodigo_paquete()) {
                            %>
                            <option value="<%=paquete.getCodigo_paquete()%>"><%="Paquete #" + paquete.getCodigo_paquete()+ " - $" + paquete.getCosto_paquete()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="medioDePago">Medio de pago</label>
                        <select class="form-control" id="medioDePago" name="medioDePago">
                            <option disabled="disabled">Seleccione...</option>
                            <option selected="true" value="<%=venta.getMedio_pago()%>"><%=venta.getMedio_pago()%></option>
                            <option value="Efectivo">Efectivo</option>
                            <option value="Transferencia bancaria">Transferencia bancaria</option>
                            <option value="Tarjeta de debito">Tarjeta de débito</option>
                            <option value="Tarjeta de credito">Tarjeta de crédito</option>
                            <option value="Cheque">Cheque</option>
                        </select>
                    </div>
                </div>
                                            
                <input type="hidden" name="id" value="<%=venta.getNum_venta()%>">
                <button type="submit" class="btn btn-primary">Guardar</button>
                <%}%>
              </form>
      
        </div>
	</div>
        <script>
            var servicioSeleccionado = document.getElementById('seleccionServicio');
            var paqueteSeleccionado = document.getElementById('seleccionPaquete')
            var servicio = document.getElementById('servicioSelector')
            var paquete = document.getElementById('paqueteSelector')

            function updateStatus() {
              if (servicioSeleccionado.checked) {
                paquete.disabled = true;
                paquete.value = "1";
                servicio.disabled = false;
              } else {
                paquete.disabled = false;
                servicio.disabled = true;
                servicio.value = "1";
              }
            }

            servicioSeleccionado.addEventListener('change', updateStatus)
            paqueteSeleccionado.addEventListener('change', updateStatus)
        </script>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/main.js"></script>
    <%
        }
    %>
  </body>
</html>
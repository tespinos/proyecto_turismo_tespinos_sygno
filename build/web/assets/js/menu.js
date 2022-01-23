document.write('\
<nav id="sidebar" class="img" style="background-image: url(./assets/images/bg_1.jpg);">\
    <div class="custom-menu">\
        <button type="button" id="sidebarCollapse" class="btn btn-primary">\
            <i class="fa fa-bars"></i>\
            <span class="sr-only">Toggle Menu</span>\
        </button>\
    </div>\
    <div class="menuContainer p-4">\
        <h1><a href="principal.jsp" class="logo">Viajes <span>Agencia de turismo</span></a></h1>\
        <ul class="list-unstyled components mb-5">\
            <li id="inicio">\
                <a href="principal.jsp"><span class="fa fa-home mr-3"></span> Home</a>\
            </li>\
            <li id="clientes">\
                <a href="clientes.jsp"><span class="fa fa-user mr-3"></span> Clientes</a>\
            </li>\
            <li id="ventas">\
                <a href="ventas.jsp"><span class="fa fa-plane mr-3"></span> Ventas</a>\
            </li>\
            <li id="servicios">\
                <a href="servicios.jsp"><span class="fa fa-cogs mr-3"></span> Servicios</a>\
            </li>\
            <li id="paquetes">\
                <a href="paquetes.jsp"><span class="fa fa-sticky-note mr-3"></span> Paquetes</a>\
            </li>\
            <li id="empleados">\
                <a href="empleados.jsp"><span class="fa fa-paper-plane mr-3"></span> Empleados</a>\
            </li>\
        </ul>\
        <div class="mb-5">\
        </div>\
        <div class="footer">\
        </div>\
    </div>\
</nav>\
');

var marcarActiva = function() {
    const titulo = document.title.toLowerCase();
    var identificador = '';

    if (titulo.startsWith("modificar")) {
        identificador = titulo.substring(10) + 's';
    } else if (titulo.startsWith("nuevo") || titulo.startsWith("nueva")) {
        identificador = titulo.substring(6) + 's';
    } else {
        identificador = titulo;
    }
    var itemActual = document.querySelector(`#${identificador}`);
    itemActual.classList = "active";
};
marcarActiva();
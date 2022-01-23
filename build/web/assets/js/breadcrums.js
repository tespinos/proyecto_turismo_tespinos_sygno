var titulo = document.title;
document.write('\
<nav aria-label="breadcrumb">\
    <ol class="breadcrumb">\
        <li class="breadcrumb-item"><a href="principal.jsp">Inicio</a></li>\
    </ol>\
</nav>\
');

var generarItems = function() {
    var titulo = document.title;
    const lista = document.querySelector("ol.breadcrumb");
    var segundoItem = document.createElement('li');
    var tercerItem = document.createElement('li');
    tercerItem.textContent = titulo;
    tercerItem.classList = "breadcrumb-item active";

    if (titulo.startsWith("Modificar")) {       
        const segundaSeccion = titulo.substring(10) + 's';
        segundoItem.textContent = segundaSeccion.charAt(0).toUpperCase() + segundaSeccion.slice(1);
        segundoItem.classList = "breadcrumb-item";
        
        lista.insertAdjacentElement("beforeend", segundoItem);

        lista.insertAdjacentElement("beforeend", tercerItem);
    }
    else if (titulo.startsWith("Nuevo") || titulo.startsWith("Nueva")) {
        const segundaSeccion = titulo.substring(6) + 's';
        segundoItem.textContent = segundaSeccion.charAt(0).toUpperCase() + segundaSeccion.slice(1);
        segundoItem.classList = "breadcrumb-item";
        
        lista.insertAdjacentElement("beforeend", segundoItem);

        lista.insertAdjacentElement("beforeend", tercerItem);
    }
    else if (!titulo.startsWith("Inicio")) {
        segundoItem.textContent = titulo;
        segundoItem.classList = "breadcrumb-item active";
        
        lista.insertAdjacentElement("beforeend", segundoItem);
    }
};
generarItems();
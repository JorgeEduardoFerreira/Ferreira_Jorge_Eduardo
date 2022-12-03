a - Describe dos usos o funciones que proporciona la declaración DOCTYPE en una página web.

        En diseño web, el doctype HTML no es sino la declaración del tipo de documento que 
        vamos a realizar y del estándar en el que la página ha sido creada para cumplirlo, 
        ya sea tanto HTML como XHTML. La declaración nos remite a la versión de (X)HTML que 
        usa dicho documento. De esta manera los navegadores tienen la posibilidad de conocer
        qué sintaxis y gramática usan, y así los validadores de estándares puedan comprobar
        su validez.
        Dicho esto, para que quede meridianamente claro, el doctoype es el documento que indica 
        cómo está inscrito y qué estructura sigue siendo ésta, ya que está determinada por un 
        DTD ( Definition Type Document) concreto. Un DTD es la declaración en metalenguaje para 
        la correcta definición en un lenguaje diferente. O sea, el DTD marca la regla para definir
        los lenguajes HTML que usamos para interpretar el citado documento HTML que se pretende 
        codificar.

b - Para que se utilizan las siguientes etiquetas:
    
    
    <head> </head> ===> El elemento HTML <head> provee información general (metadatos) acerca del 
                        documento, incluyendo su título y enlaces a scripts y hojas de estilos.
        
    <title> </title> ===> El elemento <title> HTML define el título del documento que se muestra 
                          en un browser(Navegador) en la barra de título o la pestaña de una página.
                          Solo contiene texto; las etiquetas dentro del elemento se ignoran. Se requieren
                          etiquetas de apertura y cierre. Tenga en cuenta que omitir </title> haría que 
                          el navegador ignore el resto de la página. 
    
    <meta> ===> La etiqueta <meta> define metadatos sobre un documento HTML.  Los metadatos son datos (información) sobre datos.
                Las etiquetas <meta> siempre van dentro del elemento <head> y normalmente se utilizan para especificar el juego 
                de caracteres, la descripción de la página, las palabras clave, el autor del documento y la configuración de la 
                ventana gráfica.
                Los navegadores utilizan metadatos (cómo mostrar contenido o recargar una página), motores de búsqueda (palabras
                clave) y otros servicios web.
                Es un método para permitir que los diseñadores web tomen el control de la ventana gráfica (el área visible del
                usuario de una página web), a través de la etiqueta <meta>.

    <style> </style> ===> La etiqueta <style> se utiliza para definir la información de estilo CSS (Cascading Style Sheets) de 
                          un documento.
                          Dentro del elemento <style> especificas cómo deben mostrarse los elementos HTML en un navegador.
                          
    <body> </body> ===> El elemento <body> de HTML representa el contenido de un documento HTML. Solo puede haber un elemento <body>
                        en un documento.

    <h1>,<h2>,<h3>,<h4>,<h5>,<h6> ===> <h1> define el encabezado más importante. <h6> define el encabezado menos importante. Y la 
                                       importancia y tamaño van en degradación desde h1 (más grande) a h6 (más pequño).

    <a> ===> La etiqueta <a> define un hipervínculo, que se utiliza para enlazar de una página a otra.
             El atributo más importante del elemento <a> es el atributo href, que indica el destino del enlace.
             De forma predeterminada, los enlaces aparecerán de la siguiente manera en todos los navegadores:
                Un enlace no visitado está subrayado y azul
                Un enlace visitado está subrayado y morado
                Un enlace activo está subrayado y rojo.
             Si la etiqueta <a> no tiene atributo href, es solo un marcador de posición para un hipervínculo.

    <strong> ===> La etiqueta <strong> se usa para definir texto con gran importancia.  El contenido interior normalmente se muestra
                  en negrita.
    <br> ===> La etiqueta <br> inserta un solo salto de línea.
              La etiqueta <br> es útil para escribir direcciones o poemas.
              La etiqueta <br> es una etiqueta vacía, lo que significa que no tiene una etiqueta final.

    <ul> ===> La etiqueta <ul> define una lista desordenada (con viñetas).
              Use la etiqueta <ul> junto con la etiqueta <li> para crear listas desordenadas.

    <li> ===> La etiqueta <li> define un elemento de lista.
              La etiqueta <li> se usa dentro de listas ordenadas (<ol>), listas desordenadas (<ul>) y en listas de menú (<menu>).
              En <ul> y <menu>, los elementos de la lista generalmente se mostrarán con viñetas.
              En <ol>, los elementos de la lista generalmente se mostrarán con números o letras.

    <p> ===> La etiqueta <p> define un párrafo.
             Los navegadores agregan automáticamente una sola línea en blanco antes y después de cada elemento <p>.
             
    <span> ===> La etiqueta <samp> se usa para definir la salida de muestra de un programa de computadora.  El contenido del 
                interior se muestra en la fuente monoespaciada predeterminada del navegador.


    <table> </table> ===> La etiqueta <table> define una tabla HTML.
                          Una tabla HTML consta de un elemento <table> y uno o más elementos <tr>, <th> y <td>.
                          El elemento <tr> define una fila de tabla, el elemento <th> define un encabezado de tabla y el elemento 
                          <td> define una celda de tabla.
                          Una tabla HTML también puede incluir elementos <caption>, <colgroup>, <thead>, <tfoot> y <tbody>.

    <tr> </tr> ===> La etiqueta <tr> define una fila en una tabla HTML. Un elemento <tr> contiene uno o más elementos <th> o <td>.

    <td> </td> ===> La etiqueta <td> define una celda de datos estándar en una tabla HTML.
                    Una tabla HTML tiene dos tipos de celdas:
                        Celdas de encabezado: contiene información de encabezado (creada con el elemento <th>)
                        Celdas de datos: contiene datos (creados con el elemento <td>)
                    El texto de los elementos <td> es regular y está alineado a la izquierda de forma predeterminada.
                    El texto de los elementos <th> está en negrita y centrado de forma predeterminada.

    <img> ===> La etiqueta <img> se utiliza para incrustar una imagen en una página HTML. Técnicamente, las imágenes no se insertan 
               en una página web;  las imágenes están vinculadas a páginas web.  La etiqueta <img> crea un espacio de espera para la 
               imagen a la que se hace referencia.
               La etiqueta <img> tiene dos atributos obligatorios:
                    src: especifica la ruta a la imagen
                    alt: especifica un texto alternativo para la imagen, si la imagen por algún motivo no se puede mostrar
               Además, especifique siempre el ancho y el alto de una imagen. Si no se especifican el ancho y el alto, la página puede
               parpadear mientras se carga la imagen.
               Para vincular una imagen a otro documento, simplemente anide la etiqueta <img> dentro de una etiqueta <a> 

c- La etiqueta <script> puede ir dentro de las etiquetas de de <body> o <head>, hay alguna
diferencia donde pueda ir?

    La etiqueta <script> se usa para incrustar un script del lado del cliente (JavaScript).
    El elemento <script> contiene declaraciones de secuencias de comandos o apunta a un archivo de secuencia de comandos externo a 
    través del atributo src.
    Los usos comunes de JavaScript son la manipulación de imágenes, la validación de formularios y los cambios dinámicos de contenido.

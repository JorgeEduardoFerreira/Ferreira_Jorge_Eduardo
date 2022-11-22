/*
Ejercicio 3
a)Modificar el programa lector 3, reemplazar la anteúltima línea por:
console.log(JSON.stringify(data));
¿Qué sucede cuando utilizamos JSON.stringify?
b) Agregar debajo:
console.log(data);
¿Que sucede? Por que?
Comentar las respuestas y guardar el programa en ejercicio3.js
*/

const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
//console.log(JSON.parse(data));
console.log(JSON.stringify(data));
console.log('/////////////')  //Puse un separador para ver el final y el principio de los console.log
console.log(data);
});

/*
fs.readFile Este método lee todo el archivo y lo carga en el búffer y Cuando utilizamos JSON.stringify Nos devuelve el contenido de fs
en un formato JSON de Cadena y muestra números no interpretables para el ser humano que sería el contenido en el búffer.

Cuando  usamo Console.log(data) nos devuelve el contenido de los datos en 'data' que fueron cargados por la funcion 'fs.readFile' en un formato 
alfanumerio BINARIO NO INTERPRETABLE por un ser humano, pareciera las ubicacion de los datos en la memoria buffer.
*/
/*
Ejercicio 1
a)Modificar el programa lector 1, reemplazar las 2 últimas líneas por:
console.log(JSON.stringify(rawdata));
¿Qué sucede cuando utilizamos JSON.stringify? Por que?
¿Qué sucede cuando utilizamos JSON.parse? Por que?
Comentar las respuestas y guardar el programa en ejercicio1.js
*/

const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
//let persona = JSON.parse(rawdata);
//console.log(persona);
console.log(JSON.stringify(rawdata));

/* al usar **JSON.stringify** devuelve el el contenido en un formato JSON 
pero su contenido son Númericos, por lo que interpreto, debuelve la ubicaion 
de del elemento en la memoria Buffer. En Resumen, NO INTERPRETABLE para un Humano.
Si usamos JSON.parse Nos devuelve el contenido del Objeto en formato Legible
e interpretable por un humano
*/
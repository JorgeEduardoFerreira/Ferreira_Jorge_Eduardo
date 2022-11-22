/*
Ejercicio 2
a)Modificar el programa lector 2, reemplazar la última línea por:
console.log(JSON.stringify(jsonData));
¿Qué sucede cuando utilizamos JSON.stringify? Por que?
b)Agregar al final:
console.log(JSON.parse(jsonData));
¿Qué sucede cuando utilizamos JSON.parse? Por que?
Comentar las respuestas y guardar el programa en ejercicio2.js
*/

let jsonData = require('./personas.json');
//console.log(jsonData);
console.log(JSON.stringify(jsonData));
console.log(JSON.parse(jsonData))

// let cadenaObj = JSON.stringify(jsonData)   
// console.log(JSON.parse(cadenaObj));      ////Una prueba personal para entender el funcionamiento del **.parse**////

/* 
Al usar **JSON.stringify** devuelve el contenido del objeto en un formato de cadena JSON. Todo en una linea sola.
Si usamos JSON.parse en este caso nos tira un error ya que el contenido de la varaible jsonData no esta en formato Cadena y no lo puede parsear.
*/
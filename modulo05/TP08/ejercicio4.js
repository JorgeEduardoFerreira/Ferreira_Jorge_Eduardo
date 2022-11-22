/*
Ejercicio 4
Partiendo del programa “Obtener nombres”, crear una función llamada getNombre que reciba el
arreglo de las personas y busque todas las personas de la localidad Posadas. Si encuentra debe
imprimir el nombre y el apellido de la persona.
Llamar a la función getNombre(persona);
Guardar el programa en ejercicio4.js
Al ejecutar node ejercicio4.js la salida en consola debería ser la siguiente:
    Maria Nieves
    Ramon Rodriguez
*/

const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);

getNombre (persona)

function getNombre (Array) { 
    for(var i=0;i<Array['personas'].length;i++){
        if ((Array['personas'][i]['Localidad']=== 'Posadas')) {     
            console.log(Array['personas'][i]['Nombre'] + ' ' + Array['personas'][i]['Apellido']);
        }    
    }
}

